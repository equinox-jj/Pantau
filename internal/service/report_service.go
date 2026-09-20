package service

import (
	"context"
	"errors"
	"fmt"
	"mime/multipart"
	"pantau/internal/dto/upload"
	"pantau/internal/repository"
)

type ReportService interface {
}

type reportServiceImpl struct {
	reportRepo    repository.ReportRepository
	UploadService UploadService
}

func NewReportService(reportRepo repository.ReportRepository) ReportService {
	return &reportServiceImpl{
		reportRepo: reportRepo,
	}
}

func (sv *reportServiceImpl) uploadAll(
	ctx context.Context,
	files []*multipart.FileHeader,
) ([]upload.UploadResponse, error) {
	uploads := make([]upload.UploadResponse, 0, len(files))

	for _, file := range files {
		upload, err := sv.UploadService.Upload(ctx, file)
		if err != nil {
			rollbackErr := sv.deleteUploads(ctx, uploads)

			if rollbackErr != nil {
				return nil, fmt.Errorf("upload failed: %w; rollback failed: %v", err, rollbackErr)
			}

			return nil, err
		}

		uploads = append(uploads, *upload)
	}

	return uploads, nil
}

func (sv *reportServiceImpl) deleteUploads(ctx context.Context, uploads []upload.UploadResponse) error {
	var rollbackErr error

	for _, upload := range uploads {
		if err := sv.UploadService.Delete(ctx, upload.ID); err != nil {
			rollbackErr = errors.Join(rollbackErr, err)
		}
	}

	return rollbackErr
}
