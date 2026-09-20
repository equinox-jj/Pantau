package service

import (
	"context"
	"fmt"
	"image"
	"mime/multipart"
	"pantau/internal/dto/upload"

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
	cld *cloudinary.Cloudinary
}

func NewUploadService(cld *cloudinary.Cloudinary) UploadService {
	return &uploadServiceImpl{
		cld: cld,
	}
}

func (service *uploadServiceImpl) Upload(ctx context.Context, file *multipart.FileHeader) (*upload.UploadResponse, error) {
	if err := validate(file); err != nil {
		return nil, err
	}

	src, err := file.Open()
	if err != nil {
		return nil, apperror.ErrUploadFailed
	}
	defer src.Close()

	result, err := service.cld.Upload.Upload(
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
		return nil, fmt.Errorf("%w: %v", apperror.ErrUploadFailed, err)
	}

	return &upload.UploadResponse{
		ID:        result.PublicID,
		URL:       result.SecureURL,
		CreatedAt: result.CreatedAt,
	}, nil
}

func (service *uploadServiceImpl) Delete(ctx context.Context, id string) error {
	if id == "" {
		return apperror.ErrIDRequired
	}

	result, err := service.cld.Upload.Destroy(
		ctx,
		uploader.DestroyParams{
			PublicID:     id,
			ResourceType: "image",
		},
	)
	if err != nil {
		return fmt.Errorf("%w: %v", apperror.ErrDeleteFailed, err)
	}

	if result.Result != "ok" &&
		result.Result != "not found" &&
		result.Result != "not_found" {

		return fmt.Errorf(
			"%w: cloudinary status: %s",
			apperror.ErrDeleteFailed,
			result.Result,
		)
	}

	return nil
}

func validate(file *multipart.FileHeader) error {
	var allowedContentTypes = map[string]bool{ // Define allowed content types for image uploads
		"image/jpeg": true,
		"image/jpg":  true,
		"image/png":  true,
		"image/webp": true,
	}
	const maxFileSize = 5 * 1024 * 1024 // Set max image to 5MB

	if file == nil || file.Size == 0 {
		return apperror.ErrImageRequired
	}
	if file.Size > maxFileSize {
		return apperror.ErrImageTooLarge
	}

	contentType := file.Header.Get("Content-Type")
	if _, ok := allowedContentTypes[contentType]; !ok {
		return apperror.ErrInvalidType
	}
	if !isDecodableImage(file) {
		return apperror.ErrInvalidImage
	}

	return nil
}

func isDecodableImage(file *multipart.FileHeader) bool {
	src, err := file.Open()
	if err != nil {
		return false
	}
	defer src.Close()

	_, _, err = image.Decode(src)

	return err == nil
}
