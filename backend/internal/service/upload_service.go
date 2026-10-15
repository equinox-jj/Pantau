package service

import (
	"context"
	"image"
	_ "image/jpeg"
	_ "image/png"
	"log/slog"
	"mime/multipart"
	"pantau/internal/config"
	"pantau/internal/dto/upload"
	"pantau/internal/storage"
	"pantau/pkg/errs"
	"time"

	_ "golang.org/x/image/webp"

	"github.com/google/uuid"
)

// imageExtensions maps each accepted image content type to its object key extension.
var imageExtensions = map[string]string{
	"image/jpeg": ".jpg",
	"image/jpg":  ".jpg",
	"image/png":  ".png",
	"image/webp": ".webp",
}

type UploadService interface {
	// Upload validates the image and stores it under prefix. The response ID is the object key.
	Upload(ctx context.Context, file *multipart.FileHeader, prefix string) (*upload.UploadResponse, error)
	Delete(ctx context.Context, key string) error
}

type uploadServiceImpl struct {
	store        storage.ObjectStorage
	maxFileBytes int64
}

func NewUploadService(store storage.ObjectStorage, cfg *config.Config) UploadService {
	return &uploadServiceImpl{
		store:        store,
		maxFileBytes: cfg.Upload.MaxFileBytes,
	}
}

func (sv *uploadServiceImpl) Upload(ctx context.Context, file *multipart.FileHeader, prefix string) (*upload.UploadResponse, error) {
	if err := sv.validate(file); err != nil {
		slog.Error("[UploadService] Failed to validate image", "error", err)
		return nil, err
	}

	src, err := file.Open()
	if err != nil {
		slog.Error("[UploadService] Failed to open file for upload", "filename", file.Filename, "error", err)
		return nil, errs.ErrUploadFailed
	}
	defer func() {
		if err := src.Close(); err != nil {
			slog.Error("[UploadService] Failed to close uploaded file", "filename", file.Filename, "error", err)
		}
	}()

	contentType := file.Header.Get("Content-Type")
	key := prefix + "/" + uuid.NewString() + imageExtensions[contentType]
	if err := sv.store.Put(ctx, key, src, file.Size, contentType); err != nil {
		slog.Error("[UploadService] Failed to upload image", "filename", file.Filename, "key", key, "error", err)
		return nil, errs.ErrUploadFailed
	}

	return &upload.UploadResponse{
		ID:        key,
		URL:       sv.store.PublicURL(key),
		CreatedAt: time.Now().UTC(),
	}, nil
}

func (sv *uploadServiceImpl) Delete(ctx context.Context, key string) error {
	if key == "" {
		slog.Error("[UploadService] Image key is required", "error", errs.ErrIDRequired)
		return errs.ErrIDRequired
	}

	if err := sv.store.Remove(ctx, key); err != nil {
		slog.Error("[UploadService] Failed to delete image", "key", key, "error", err)
		return errs.ErrDeleteFailed
	}

	return nil
}

func (sv *uploadServiceImpl) validate(file *multipart.FileHeader) error {
	if file == nil || file.Size == 0 {
		slog.Error("[UploadService] Image is required", "error", errs.ErrImageRequired)
		return errs.ErrImageRequired
	}
	if file.Size > sv.maxFileBytes {
		slog.Error("[UploadService] Image exceeds maximum file size", "filename", file.Filename, "size", file.Size, "error", errs.ErrImageTooLarge)
		return errs.ErrImageTooLarge
	}

	contentType := file.Header.Get("Content-Type")
	if _, ok := imageExtensions[contentType]; !ok {
		slog.Error("[UploadService] Invalid image content type", "filename", file.Filename, "content_type", contentType, "error", errs.ErrInvalidType)
		return errs.ErrInvalidType
	}
	if !sv.isDecodableImage(file) {
		slog.Error("[UploadService] Invalid image", "filename", file.Filename, "error", errs.ErrInvalidImage)
		return errs.ErrInvalidImage
	}

	return nil
}

func (uploadServiceImpl) isDecodableImage(file *multipart.FileHeader) bool {
	src, err := file.Open()
	if err != nil {
		slog.Error("[UploadService] Failed to open image for decoding", "filename", file.Filename, "error", err)
		return false
	}
	defer func() {
		if err := src.Close(); err != nil {
			slog.Error("[UploadService] Failed to close decoded image", "filename", file.Filename, "error", err)
		}
	}()

	imageConfig, _, err := image.DecodeConfig(src)
	if err != nil || imageConfig.Width <= 0 || imageConfig.Height <= 0 || int64(imageConfig.Width)*int64(imageConfig.Height) > 20_000_000 {
		return false
	}
	if _, err := src.Seek(0, 0); err != nil {
		return false
	}
	_, _, err = image.Decode(src)
	if err != nil {
		slog.Error("[UploadService] Failed to decode image", "filename", file.Filename, "error", err)
		return false
	}

	return true
}
