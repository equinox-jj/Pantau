package service

import (
	"context"
	"log/slog"
	"mime/multipart"
	"pantau/internal/dto/mapper"
	"pantau/internal/dto/user"
	"pantau/internal/entity"
	"pantau/internal/enums"
	"pantau/internal/repository"
	"pantau/pkg/errs"
	"pantau/pkg/security"
	"time"
)

type UserService interface {
	GetProfile(ctx context.Context, usr *entity.User) (*user.ProfileResponse, error)
	ChangePassword(ctx context.Context, usr *entity.User, req user.ChangePasswordRequest) error
	// UpdateAvatar uploads a new profile picture, replacing any existing one.
	UpdateAvatar(ctx context.Context, usr *entity.User, file *multipart.FileHeader) (*user.ProfileResponse, error)
	// RemoveAvatar clears the profile picture. It succeeds when none is set.
	RemoveAvatar(ctx context.Context, usr *entity.User) (*user.ProfileResponse, error)
}

type userServiceImpl struct {
	userRepo      repository.UserRepository
	reportRepo    repository.ReportRepository
	passHasher    security.PasswordHasher
	uploadService UploadService
}

func NewUserService(
	userRepo repository.UserRepository,
	reportRepo repository.ReportRepository,
	passHasher security.PasswordHasher,
	uploadService UploadService,
) UserService {
	return &userServiceImpl{
		userRepo:      userRepo,
		reportRepo:    reportRepo,
		passHasher:    passHasher,
		uploadService: uploadService,
	}
}

func (sv *userServiceImpl) GetProfile(ctx context.Context, usr *entity.User) (*user.ProfileResponse, error) {
	if usr == nil {
		slog.Error("[UserService.GetProfile] Failed to get profile", "error", errs.ErrUnauthorized)
		return nil, errs.ErrUnauthorized
	}

	return sv.buildProfile(ctx, usr)
}

func (sv *userServiceImpl) buildProfile(ctx context.Context, usr *entity.User) (*user.ProfileResponse, error) {
	reportsCount, err := sv.reportRepo.CountByReporterID(ctx, usr.ID)
	if err != nil {
		slog.Error("[UserService.buildProfile] Failed to count reports", "user_id", usr.ID, "error", err)
		return nil, err
	}

	resolvedCount, err := sv.reportRepo.CountByReporterIDAndStatus(ctx, usr.ID, enums.ReportStatusResolved)
	if err != nil {
		slog.Error("[UserService.buildProfile] Failed to count resolved reports", "user_id", usr.ID, "error", err)
		return nil, err
	}

	return mapper.UserToResponse(usr, reportsCount, resolvedCount), nil
}

func (sv *userServiceImpl) ChangePassword(ctx context.Context, usr *entity.User, req user.ChangePasswordRequest) error {
	if usr == nil {
		slog.Error("[UserService.ChangePassword] Failed to change password", "error", errs.ErrUnauthorized)
		return errs.ErrUnauthorized
	}

	// The request principal carries no password hash, so load the stored user.
	stored, err := sv.userRepo.FindByID(ctx, usr.ID)
	if err != nil {
		slog.Error("[UserService.ChangePassword] Failed to find user", "user_id", usr.ID, "error", err)
		return err
	}

	if err := sv.passHasher.Compare(stored.Password, req.CurrentPassword); err != nil {
		slog.Error("[UserService.ChangePassword] Current password does not match", "user_id", usr.ID, "error", errs.ErrInvalidCurrentPassword)
		return errs.ErrInvalidCurrentPassword
	}

	hash, err := sv.passHasher.Hash(req.NewPassword)
	if err != nil {
		slog.Error("[UserService.ChangePassword] Failed to hash password", "user_id", usr.ID, "error", err)
		return err
	}

	if err := sv.userRepo.UpdatePassword(ctx, usr.ID, hash); err != nil {
		slog.Error("[UserService.ChangePassword] Failed to update password", "user_id", usr.ID, "error", err)
		return err
	}

	return nil
}

func (sv *userServiceImpl) UpdateAvatar(ctx context.Context, usr *entity.User, file *multipart.FileHeader) (*user.ProfileResponse, error) {
	if usr == nil {
		slog.Error("[UserService.UpdateAvatar] Failed to update avatar", "error", errs.ErrUnauthorized)
		return nil, errs.ErrUnauthorized
	}

	// The request principal carries no object key, so load the stored user.
	stored, err := sv.userRepo.FindByID(ctx, usr.ID)
	if err != nil {
		slog.Error("[UserService.UpdateAvatar] Failed to find user", "user_id", usr.ID, "error", err)
		return nil, err
	}

	uploaded, err := sv.uploadService.Upload(ctx, file, "avatars/"+usr.ID.String())
	if err != nil {
		slog.Error("[UserService.UpdateAvatar] Failed to upload avatar", "user_id", usr.ID, "error", err)
		return nil, err
	}

	if err := sv.userRepo.UpdateAvatar(ctx, usr.ID, &uploaded.URL, &uploaded.ID); err != nil {
		slog.Error("[UserService.UpdateAvatar] Failed to save avatar", "user_id", usr.ID, "error", err)
		sv.deleteObject(ctx, uploaded.ID, usr)
		return nil, err
	}

	if stored.AvatarObjectKey != nil {
		sv.deleteObject(ctx, *stored.AvatarObjectKey, usr)
	}

	stored.AvatarURL, stored.AvatarObjectKey = &uploaded.URL, &uploaded.ID
	return sv.buildProfile(ctx, stored)
}

func (sv *userServiceImpl) RemoveAvatar(ctx context.Context, usr *entity.User) (*user.ProfileResponse, error) {
	if usr == nil {
		slog.Error("[UserService.RemoveAvatar] Failed to remove avatar", "error", errs.ErrUnauthorized)
		return nil, errs.ErrUnauthorized
	}

	stored, err := sv.userRepo.FindByID(ctx, usr.ID)
	if err != nil {
		slog.Error("[UserService.RemoveAvatar] Failed to find user", "user_id", usr.ID, "error", err)
		return nil, err
	}
	if stored.AvatarObjectKey == nil {
		return sv.buildProfile(ctx, stored)
	}

	// Clear the database first: an orphaned object is harmless, a dangling URL is not.
	if err := sv.userRepo.UpdateAvatar(ctx, usr.ID, nil, nil); err != nil {
		slog.Error("[UserService.RemoveAvatar] Failed to clear avatar", "user_id", usr.ID, "error", err)
		return nil, err
	}
	sv.deleteObject(ctx, *stored.AvatarObjectKey, usr)

	stored.AvatarURL, stored.AvatarObjectKey = nil, nil
	return sv.buildProfile(ctx, stored)
}

// deleteObject removes an avatar object on a best-effort basis; failures are logged.
func (sv *userServiceImpl) deleteObject(ctx context.Context, key string, usr *entity.User) {
	// Cleanup must still run if the original request was canceled.
	cleanupCtx, cancel := context.WithTimeout(context.WithoutCancel(ctx), 30*time.Second)
	defer cancel()
	if err := sv.uploadService.Delete(cleanupCtx, key); err != nil {
		slog.Error("[UserService.deleteObject] Failed to delete avatar object", "user_id", usr.ID, "key", key, "error", err)
	}
}
