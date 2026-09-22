package service

import (
	"context"
	"fmt"
	"image"
	_ "image/jpeg"
	_ "image/png"
	"log/slog"
	"mime/multipart"
	"pantau/internal/config"
	"pantau/internal/dto/upload"

	_ "golang.org/x/image/webp"

	apperror "pantau/pkg/errors"

	"github.com/cloudinary/cloudinary-go/v2"
	"github.com/cloudinary/cloudinary-go/v2/api/uploader"
	"github.com/google/uuid"
)

type UploadService interface {
	Upload(ctx context.Context, file *multipart.FileHeader) (*upload.UploadResponse, error)
	Delete(ctx context.Context, id string) error
}

type uploadServiceImpl struct {
	cld          *cloudinary.Cloudinary
	maxFileBytes int64
}

func NewUploadService(cld *cloudinary.Cloudinary, cfg *config.Config) UploadService {
	return &uploadServiceImpl{
		cld:          cld,
		maxFileBytes: cfg.Upload.MaxFileBytes,
	}
}

func (sv *uploadServiceImpl) Upload(ctx context.Context, file *multipart.FileHeader) (*upload.UploadResponse, error) {
	if err := sv.validate(file); err != nil {
		slog.Error("[UploadService] Failed to validate image", "error", err)
		return nil, err
	}

	src, err := file.Open()
	if err != nil {
		slog.Error("[UploadService] Failed to open file for upload", "filename", file.Filename, "error", err)
		return nil, apperror.ErrUploadFailed
	}
	defer func() {
		if err := src.Close(); err != nil {
			slog.Error("[UploadService] Failed to close uploaded file", "filename", file.Filename, "error", err)
		}
	}()

	result, err := sv.cld.Upload.Upload(
		ctx,
		src,
		uploader.UploadParams{
			Folder:       "temp",
			PublicID:     uuid.NewString(),
			ResourceType: "image",
			Overwrite:    new(false),
		},
	)
	if err != nil {
		slog.Error("[UploadService] Failed to upload image", "filename", file.Filename, "error", err)
		return nil, fmt.Errorf("%w: %v", apperror.ErrUploadFailed, err)
	}

	return &upload.UploadResponse{
		ID:        result.PublicID,
		URL:       result.SecureURL,
		CreatedAt: result.CreatedAt,
	}, nil
}

func (sv *uploadServiceImpl) Delete(ctx context.Context, id string) error {
	if id == "" {
		slog.Error("[UploadService] Image ID is required", "error", apperror.ErrIDRequired)
		return apperror.ErrIDRequired
	}

	result, err := sv.cld.Upload.Destroy(
		ctx,
		uploader.DestroyParams{
			PublicID:     id,
			ResourceType: "image",
		},
	)
	if err != nil {
		slog.Error("[UploadService] Failed to delete image", "id", id, "error", err)
		return fmt.Errorf("%w: %v", apperror.ErrDeleteFailed, err)
	}

	if result.Result != "ok" &&
		result.Result != "not found" &&
		result.Result != "not_found" {

		slog.Error("[UploadService] Unexpected image deletion status", "id", id, "status", result.Result, "error", apperror.ErrDeleteFailed)
		return fmt.Errorf(
			"%w: cloudinary status: %s",
			apperror.ErrDeleteFailed,
			result.Result,
		)
	}

	return nil
}

func (sv *uploadServiceImpl) validate(file *multipart.FileHeader) error {
	var allowedContentTypes = map[string]bool{ // Define allowed content types for image uploads
		"image/jpeg": true,
		"image/jpg":  true,
		"image/png":  true,
		"image/webp": true,
	}

	if file == nil || file.Size == 0 {
		slog.Error("[UploadService] Image is required", "error", apperror.ErrImageRequired)
		return apperror.ErrImageRequired
	}
	if file.Size > sv.maxFileBytes {
		slog.Error("[UploadService] Image exceeds maximum file size", "filename", file.Filename, "size", file.Size, "error", apperror.ErrImageTooLarge)
		return apperror.ErrImageTooLarge
	}

	contentType := file.Header.Get("Content-Type")
	if _, ok := allowedContentTypes[contentType]; !ok {
		slog.Error("[UploadService] Invalid image content type", "filename", file.Filename, "content_type", contentType, "error", apperror.ErrInvalidType)
		return apperror.ErrInvalidType
	}
	if !sv.isDecodableImage(file) {
		slog.Error("[UploadService] Invalid image", "filename", file.Filename, "error", apperror.ErrInvalidImage)
		return apperror.ErrInvalidImage
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
