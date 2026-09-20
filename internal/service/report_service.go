package service

import (
	"context"
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
) ([]*upload.UploadResponse, error) {
	panic("unimplemented")
}
