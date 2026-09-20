package repository

import (
	"context"
	"log/slog"
	"pantau/internal/entity"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type ReportStatusRepository interface {
	FindByReportID(ctx context.Context, reportID uuid.UUID) ([]entity.ReportStatusHistory, error)
}

type reportStatusRepositoryImpl struct {
	db *gorm.DB
}

func NewReportStatusRepository(db *gorm.DB) ReportStatusRepository {
	return &reportStatusRepositoryImpl{
		db: db,
	}
}

func (repo *reportStatusRepositoryImpl) FindByReportID(ctx context.Context, reportID uuid.UUID) ([]entity.ReportStatusHistory, error) {
	var history []entity.ReportStatusHistory

	if err := repo.db.WithContext(ctx).
		Preload("Actor").
		Where("report_id = ?", reportID).
		Order("created_at ASC").
		Find(&history).
		Error; err != nil {
		slog.ErrorContext(ctx, "[ReportStatusRepository.FindByReportID] Failed to find report status history by report ID", "report_id", reportID, "error", err)
		return nil, err
	}

	return history, nil
}
