package service

import (
	"bytes"
	"context"
	"errors"
	"image"
	"image/png"
	"io"
	"mime/multipart"
	"net/http"
	"net/textproto"
	"regexp"
	"testing"

	"pantau/internal/config"
	"pantau/pkg/errs"
)

type fakeStorage struct {
	puts      []string
	removed   []string
	putErr    error
	removeErr error
}

func (f *fakeStorage) Put(_ context.Context, key string, r io.Reader, _ int64, _ string) error {
	if f.putErr != nil {
		return f.putErr
	}
	if _, err := io.Copy(io.Discard, r); err != nil {
		return err
	}
	f.puts = append(f.puts, key)
	return nil
}

func (f *fakeStorage) Remove(_ context.Context, key string) error {
	if f.removeErr != nil {
		return f.removeErr
	}
	f.removed = append(f.removed, key)
	return nil
}

func (f *fakeStorage) PublicURL(key string) string {
	return "http://minio/pantau/" + key
}

// fileHeader builds a multipart file header the way Fiber receives one.
func fileHeader(t *testing.T, field, contentType string, data []byte) *multipart.FileHeader {
	t.Helper()
	var body bytes.Buffer
	w := multipart.NewWriter(&body)
	h := make(textproto.MIMEHeader)
	h.Set("Content-Disposition", `form-data; name="`+field+`"; filename="upload"`)
	h.Set("Content-Type", contentType)
	part, err := w.CreatePart(h)
	if err != nil {
		t.Fatal(err)
	}
	if _, err := part.Write(data); err != nil {
		t.Fatal(err)
	}
	if err := w.Close(); err != nil {
		t.Fatal(err)
	}

	req, err := http.NewRequest(http.MethodPost, "/", &body)
	if err != nil {
		t.Fatal(err)
	}
	req.Header.Set("Content-Type", w.FormDataContentType())
	if err := req.ParseMultipartForm(1 << 20); err != nil {
		t.Fatal(err)
	}
	return req.MultipartForm.File[field][0]
}

func pngFileHeader(t *testing.T, field string) *multipart.FileHeader {
	t.Helper()
	var buf bytes.Buffer
	if err := png.Encode(&buf, image.NewRGBA(image.Rect(0, 0, 2, 2))); err != nil {
		t.Fatal(err)
	}
	return fileHeader(t, field, "image/png", buf.Bytes())
}

func newTestUploadService(store *fakeStorage) UploadService {
	cfg := &config.Config{}
	cfg.Upload.MaxFileBytes = 5 << 20
	return NewUploadService(store, cfg)
}

func TestUploadService_Upload_StoresUnderPrefix(t *testing.T) {
	store := &fakeStorage{}
	resp, err := newTestUploadService(store).Upload(context.Background(), pngFileHeader(t, "photos"), "reports")
	if err != nil {
		t.Fatalf("Upload() error = %v", err)
	}
	if len(store.puts) != 1 {
		t.Fatalf("want 1 put, got %d", len(store.puts))
	}
	key := store.puts[0]
	if !regexp.MustCompile(`^reports/[0-9a-f-]{36}\.png$`).MatchString(key) {
		t.Errorf("key = %q, want reports/<uuid>.png", key)
	}
	if resp.ID != key {
		t.Errorf("ID = %q, want %q", resp.ID, key)
	}
	if resp.URL != "http://minio/pantau/"+key {
		t.Errorf("URL = %q", resp.URL)
	}
	if resp.CreatedAt.IsZero() {
		t.Error("CreatedAt is zero")
	}
}

func TestUploadService_Upload_RejectsInvalidType(t *testing.T) {
	store := &fakeStorage{}
	_, err := newTestUploadService(store).Upload(context.Background(), fileHeader(t, "photos", "text/plain", []byte("hello")), "reports")
	if !errors.Is(err, errs.ErrInvalidType) {
		t.Fatalf("err = %v, want ErrInvalidType", err)
	}
	if len(store.puts) != 0 {
		t.Errorf("want 0 puts, got %d", len(store.puts))
	}
}

func TestUploadService_Upload_StorageError(t *testing.T) {
	store := &fakeStorage{putErr: errors.New("minio down")}
	_, err := newTestUploadService(store).Upload(context.Background(), pngFileHeader(t, "photos"), "reports")
	if !errors.Is(err, errs.ErrUploadFailed) {
		t.Fatalf("err = %v, want ErrUploadFailed", err)
	}
}

func TestUploadService_Delete_EmptyKey(t *testing.T) {
	err := newTestUploadService(&fakeStorage{}).Delete(context.Background(), "")
	if !errors.Is(err, errs.ErrIDRequired) {
		t.Fatalf("err = %v, want ErrIDRequired", err)
	}
}

func TestUploadService_Delete_MissingKeyIsNotAnError(t *testing.T) {
	// Legacy Cloudinary public IDs do not exist in MinIO; RemoveObject returns nil.
	store := &fakeStorage{}
	if err := newTestUploadService(store).Delete(context.Background(), "temp/legacy-cloudinary-id"); err != nil {
		t.Fatalf("Delete() error = %v, want nil", err)
	}
	if len(store.removed) != 1 || store.removed[0] != "temp/legacy-cloudinary-id" {
		t.Errorf("removed = %v", store.removed)
	}
}

func TestUploadService_Delete_StorageError(t *testing.T) {
	err := newTestUploadService(&fakeStorage{removeErr: errors.New("minio down")}).Delete(context.Background(), "reports/a.png")
	if !errors.Is(err, errs.ErrDeleteFailed) {
		t.Fatalf("err = %v, want ErrDeleteFailed", err)
	}
}
