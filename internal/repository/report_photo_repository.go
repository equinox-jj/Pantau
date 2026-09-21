package repository

import (
	"context"
	"log/slog"
	"pantau/internal/entity"

	"github.com/google/uuid"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

type ReportPhotoRepository interface {
	SaveAll(ctx context.Context, photos []entity.ReportPhoto) error
	DeleteByReportID(ctx context.Context, reportID uuid.UUID) error
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

func (repo *reportPhotoRepositoryImpl) SaveAll(ctx context.Context, photos []entity.ReportPhoto) error {
	if len(photos) == 0 {
		return nil
	}
	if err := repo.db.WithContext(ctx).Omit(clause.Associations).Create(&photos).Error; err != nil {
		slog.Error("[ReportPhotoRepository.SaveAll] Failed to save report photos", "report_id", photos[0].ReportID, "photo_count", len(photos), "error", err)
		return err
	}
	return nil
}

func (repo *reportPhotoRepositoryImpl) DeleteByReportID(ctx context.Context, reportID uuid.UUID) error {
	if err := repo.db.WithContext(ctx).Where("report_id = ?", reportID).Delete(&entity.ReportPhoto{}).Error; err != nil {
		slog.Error("[ReportPhotoRepository.DeleteByReportID] Failed to delete report photos", "report_id", reportID, "error", err)
		return err
	}
	return nil
}
