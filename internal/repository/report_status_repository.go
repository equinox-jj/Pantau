package repository

import (
	"context"
	"log/slog"
	"pantau/internal/entity"

	"github.com/google/uuid"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

type ReportStatusRepository interface {
	Save(ctx context.Context, history *entity.ReportStatusHistory) error
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

func (repo *reportStatusRepositoryImpl) Save(ctx context.Context, history *entity.ReportStatusHistory) error {
	if err := repo.db.WithContext(ctx).Omit(clause.Associations).Create(history).Error; err != nil {
		slog.Error("[ReportStatusRepository.Save] Failed to save report status history", "report_id", history.ReportID, "to_status", history.ToStatus, "error", err)
		return err
	}
	return nil
}
