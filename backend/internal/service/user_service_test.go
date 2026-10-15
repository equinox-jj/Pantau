package service

import (
	"context"
	"errors"
	"strings"
	"testing"

	"pantau/internal/dto/user"
	"pantau/internal/entity"
	"pantau/internal/enums"
	"pantau/internal/repository"
	"pantau/pkg/errs"

	"github.com/google/uuid"
)

type passwordUpdate struct {
	id   uuid.UUID
	hash string
}

type fakeUserRepo struct {
	repository.UserRepository
	users           map[uuid.UUID]*entity.User
	passwordUpdates []passwordUpdate
	avatarUpdates   []avatarUpdate
	updateAvatarErr error
}

type avatarUpdate struct {
	id       uuid.UUID
	url, key *string
}

func (f *fakeUserRepo) UpdateAvatar(_ context.Context, id uuid.UUID, url, key *string) error {
	if f.updateAvatarErr != nil {
		return f.updateAvatarErr
	}
	f.avatarUpdates = append(f.avatarUpdates, avatarUpdate{id, url, key})
	f.users[id].AvatarURL, f.users[id].AvatarObjectKey = url, key
	return nil
}

func (f *fakeUserRepo) FindByID(_ context.Context, id uuid.UUID) (*entity.User, error) {
	u, ok := f.users[id]
	if !ok {
		return nil, errs.ErrUserNotFound
	}
	copied := *u
	return &copied, nil
}

func (f *fakeUserRepo) UpdatePassword(_ context.Context, id uuid.UUID, hash string) error {
	f.passwordUpdates = append(f.passwordUpdates, passwordUpdate{id, hash})
	return nil
}

type fakeHasher struct{}

func (fakeHasher) Hash(p string) (string, error) { return "hash:" + p, nil }

func (fakeHasher) Compare(h, p string) error {
	if h != "hash:"+p {
		return errors.New("mismatch")
	}
	return nil
}

type fakeReportRepo struct {
	repository.ReportRepository
}

func (fakeReportRepo) CountByReporterID(context.Context, uuid.UUID) (int64, error) { return 0, nil }

func (fakeReportRepo) CountByReporterIDAndStatus(context.Context, uuid.UUID, enums.ReportStatus) (int64, error) {
	return 0, nil
}

func newUserFixture(t *testing.T) (*fakeUserRepo, *fakeStorage, UserService, *entity.User) {
	t.Helper()
	u := &entity.User{ID: uuid.New(), Email: "a@b.com", Password: "hash:oldpass12", DisplayName: "Jane"}
	repo := &fakeUserRepo{users: map[uuid.UUID]*entity.User{u.ID: u}}
	store := &fakeStorage{}
	sv := NewUserService(repo, fakeReportRepo{}, fakeHasher{}, newTestUploadService(store))
	// The principal from the auth middleware never carries the password hash.
	principal := &entity.User{ID: u.ID, Email: u.Email, DisplayName: u.DisplayName}
	return repo, store, sv, principal
}

func TestChangePassword_Success(t *testing.T) {
	repo, _, sv, principal := newUserFixture(t)
	err := sv.ChangePassword(context.Background(), principal, user.ChangePasswordRequest{CurrentPassword: "oldpass12", NewPassword: "newpass34"})
	if err != nil {
		t.Fatalf("ChangePassword() error = %v", err)
	}
	if len(repo.passwordUpdates) != 1 || repo.passwordUpdates[0] != (passwordUpdate{principal.ID, "hash:newpass34"}) {
		t.Errorf("password updates = %v", repo.passwordUpdates)
	}
}

func TestChangePassword_WrongCurrent(t *testing.T) {
	repo, _, sv, principal := newUserFixture(t)
	err := sv.ChangePassword(context.Background(), principal, user.ChangePasswordRequest{CurrentPassword: "wrongpass", NewPassword: "newpass34"})
	if !errors.Is(err, errs.ErrInvalidCurrentPassword) {
		t.Fatalf("err = %v, want ErrInvalidCurrentPassword", err)
	}
	if len(repo.passwordUpdates) != 0 {
		t.Errorf("want no password update, got %v", repo.passwordUpdates)
	}
}

func TestChangePassword_NilUser(t *testing.T) {
	_, _, sv, _ := newUserFixture(t)
	err := sv.ChangePassword(context.Background(), nil, user.ChangePasswordRequest{CurrentPassword: "oldpass12", NewPassword: "newpass34"})
	if !errors.Is(err, errs.ErrUnauthorized) {
		t.Fatalf("err = %v, want ErrUnauthorized", err)
	}
}

func withAvatar(repo *fakeUserRepo, id uuid.UUID) string {
	key := "avatars/" + id.String() + "/old.png"
	url := "http://minio/pantau/" + key
	repo.users[id].AvatarObjectKey, repo.users[id].AvatarURL = &key, &url
	return key
}

func TestUpdateAvatar_FirstUpload(t *testing.T) {
	repo, store, sv, principal := newUserFixture(t)
	resp, err := sv.UpdateAvatar(context.Background(), principal, pngFileHeader(t, "avatar"))
	if err != nil {
		t.Fatalf("UpdateAvatar() error = %v", err)
	}
	if len(store.puts) != 1 || !strings.HasPrefix(store.puts[0], "avatars/"+principal.ID.String()+"/") {
		t.Fatalf("puts = %v", store.puts)
	}
	key := store.puts[0]
	if len(repo.avatarUpdates) != 1 || *repo.avatarUpdates[0].key != key || *repo.avatarUpdates[0].url != "http://minio/pantau/"+key {
		t.Errorf("avatar updates = %+v", repo.avatarUpdates)
	}
	if resp.AvatarURL == nil || *resp.AvatarURL != "http://minio/pantau/"+key {
		t.Errorf("AvatarURL = %v", resp.AvatarURL)
	}
	if len(store.removed) != 0 {
		t.Errorf("removed = %v, want none", store.removed)
	}
}

func TestUpdateAvatar_ReplacesAndDeletesOld(t *testing.T) {
	repo, store, sv, principal := newUserFixture(t)
	oldKey := withAvatar(repo, principal.ID)
	if _, err := sv.UpdateAvatar(context.Background(), principal, pngFileHeader(t, "avatar")); err != nil {
		t.Fatalf("UpdateAvatar() error = %v", err)
	}
	if len(store.puts) != 1 || *repo.users[principal.ID].AvatarObjectKey != store.puts[0] {
		t.Errorf("stored key not updated: puts=%v", store.puts)
	}
	if len(store.removed) != 1 || store.removed[0] != oldKey {
		t.Errorf("removed = %v, want [%s]", store.removed, oldKey)
	}
}

func TestUpdateAvatar_DBFailure_DeletesNewObjectKeepsOld(t *testing.T) {
	repo, store, sv, principal := newUserFixture(t)
	oldKey := withAvatar(repo, principal.ID)
	repo.updateAvatarErr = errors.New("db down")
	if _, err := sv.UpdateAvatar(context.Background(), principal, pngFileHeader(t, "avatar")); err == nil {
		t.Fatal("want error")
	}
	if len(store.removed) != 1 || store.removed[0] != store.puts[0] {
		t.Errorf("removed = %v, want only the new key %v", store.removed, store.puts)
	}
	if *repo.users[principal.ID].AvatarObjectKey != oldKey {
		t.Errorf("old avatar key changed")
	}
}

func TestUpdateAvatar_InvalidImage(t *testing.T) {
	repo, _, sv, principal := newUserFixture(t)
	_, err := sv.UpdateAvatar(context.Background(), principal, fileHeader(t, "avatar", "text/plain", []byte("x")))
	if !errors.Is(err, errs.ErrInvalidType) {
		t.Fatalf("err = %v, want ErrInvalidType", err)
	}
	if len(repo.avatarUpdates) != 0 {
		t.Errorf("want no repo write")
	}
}

func TestRemoveAvatar_DeletesObjectAndClears(t *testing.T) {
	repo, store, sv, principal := newUserFixture(t)
	key := withAvatar(repo, principal.ID)
	resp, err := sv.RemoveAvatar(context.Background(), principal)
	if err != nil {
		t.Fatalf("RemoveAvatar() error = %v", err)
	}
	if len(repo.avatarUpdates) != 1 || repo.avatarUpdates[0].url != nil || repo.avatarUpdates[0].key != nil {
		t.Errorf("avatar updates = %+v, want one clearing update", repo.avatarUpdates)
	}
	if len(store.removed) != 1 || store.removed[0] != key {
		t.Errorf("removed = %v", store.removed)
	}
	if resp.AvatarURL != nil {
		t.Errorf("AvatarURL = %v, want nil", *resp.AvatarURL)
	}
}

func TestRemoveAvatar_NoAvatar_NoStorageCall(t *testing.T) {
	repo, store, sv, principal := newUserFixture(t)
	if _, err := sv.RemoveAvatar(context.Background(), principal); err != nil {
		t.Fatalf("RemoveAvatar() error = %v", err)
	}
	if len(repo.avatarUpdates) != 0 || len(store.removed) != 0 {
		t.Errorf("want no writes, got updates=%v removed=%v", repo.avatarUpdates, store.removed)
	}
}

func TestRemoveAvatar_StorageDeleteFails_StillSucceeds(t *testing.T) {
	repo, store, sv, principal := newUserFixture(t)
	withAvatar(repo, principal.ID)
	store.removeErr = errors.New("minio down")
	if _, err := sv.RemoveAvatar(context.Background(), principal); err != nil {
		t.Fatalf("RemoveAvatar() error = %v, want nil", err)
	}
	if repo.users[principal.ID].AvatarObjectKey != nil {
		t.Errorf("avatar key not cleared")
	}
}
