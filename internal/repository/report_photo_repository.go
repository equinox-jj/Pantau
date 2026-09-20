package repository

import (
	"context"
	"log/slog"
	"pantau/internal/entity"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type ReportPhotoRepository interface {
	FindByReportID(ctx context.Context, reportId uuid.UUID) ([]entity.ReportPhoto, error)
	FindByReportIDs(ctx context.Context, reportIds []uuid.UUID) ([]entity.ReportPhoto, error)
}

type reportPhotoRepositoryImpl struct {
	db *gorm.DB
}

func NewReportPhotoRepository(db *gorm.DB) ReportPhotoRepository {
	return &reportPhotoRepositoryImpl{db: db}
}

func (repo *reportPhotoRepositoryImpl) FindByReportID(ctx context.Context, reportId uuid.UUID) ([]entity.ReportPhoto, error) {
	var photos []entity.ReportPhoto

	if err := repo.db.WithContext(ctx).
		Where("report_id = ?", reportId).
		Order("position ASC").
		Find(&photos).
		Error; err != nil {
		slog.Error("[ReportPhotoRepository.FindByReportID] Failed to find report photos by report ID", "reportId", reportId, "error", err)
		return nil, err
	}

	return photos, nil
}

func (repo *reportPhotoRepositoryImpl) FindByReportIDs(ctx context.Context, reportIds []uuid.UUID) ([]entity.ReportPhoto, error) {
	var photos []entity.ReportPhoto

	if err := repo.db.WithContext(ctx).
		Where("report_id IN ?", reportIds).
		Order("report_id ASC").
		Order("position ASC").
		Find(&photos).
		Error; err != nil {
		slog.Error("[ReportPhotoRepository.FindByReportIDs] Failed to find report photos by report IDs", "reportIds", reportIds, "error", err)
		return nil, err
	}

	return photos, nil
}
