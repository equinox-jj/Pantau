package repository

import (
	"context"
	"errors"
	"pantau/internal/entity"
	apperror "pantau/pkg/errors"
	"pantau/pkg/utils"

	"github.com/gofiber/fiber/v3"
	"github.com/google/uuid"
	"gorm.io/gorm"
)

type StatusCountProjection struct {
	Status entity.ReportStatus `gorm:"column:status" json:"status"`
	Count  int64               `gorm:"column:count" json:"count"`
}

type ReportRepository interface {
	FindNearbyReport(ctx context.Context, latitude, longitude float64, radiusMeters, limit int) ([]entity.Report, error)
	FindByReporterID(ctx fiber.Ctx, reporterID uuid.UUID) ([]entity.Report, int64, error)
	CountByReporterID(ctx context.Context, reporterID uuid.UUID) (int64, error)
	CountByReporterIDAndStatus(ctx context.Context, reporterID uuid.UUID, status entity.ReportStatus) (int64, error)
	FindQueueReports(ctx fiber.Ctx, statuses []string, latitude, longitude float64, radiusMeters int) ([]entity.Report, int64, error)
	CountQueueReportsByStatus(ctx context.Context, latitude, longitude float64, radiusMeters int) ([]StatusCountProjection, error)
}

type reportRepositoryImpl struct {
	db *gorm.DB
}

func NewReportRepository(db *gorm.DB) ReportRepository {
	return &reportRepositoryImpl{db: db}
}

func (r *reportRepositoryImpl) FindNearbyReport(
	ctx context.Context,
	latitude, longitude float64,
	radiusMeters, limit int,
) ([]entity.Report, error) {
	if limit < 0 {
		return nil, apperror.ErrInvalidLimit
	}

	reports := make([]entity.Report, 0)
	if err := r.db.WithContext(ctx).
		Raw(`
		SELECT * FROM reports r
		WHERE ST_DWithin(r.location, ST_MakePoint(?, ?)::geography, ?)
		ORDER BY r.location <-> ST_MakePoint(?, ?)::geography
		LIMIT ?`, longitude, latitude, radiusMeters, longitude, latitude, limit).
		Scan(&reports).
		Error; err != nil {
		return nil, reportRepositoryError(err)
	}

	return reports, nil
}

func (r *reportRepositoryImpl) FindByReporterID(
	ctx fiber.Ctx,
	reporterID uuid.UUID,
) ([]entity.Report, int64, error) {
	query := r.db.WithContext(ctx.Context()).
		Model(&entity.Report{}).
		Where("reporter_id = ?", reporterID)

	var total int64
	if err := query.Count(&total).Error; err != nil {
		return nil, 0, reportRepositoryError(err)
	}

	reports := make([]entity.Report, 0)
	err := query.
		Preload("Category").
		Order("created_at DESC").
		Order("id ASC").
		Scopes(utils.Paginate(ctx)).
		Find(&reports).
		Error

	return reports, total, reportRepositoryError(err)
}

func (r *reportRepositoryImpl) CountByReporterID(ctx context.Context, reporterID uuid.UUID) (int64, error) {
	var count int64
	err := r.db.WithContext(ctx).
		Model(&entity.Report{}).
		Where("reporter_id = ?", reporterID).
		Count(&count).
		Error

	return count, reportRepositoryError(err)
}

func (r *reportRepositoryImpl) CountByReporterIDAndStatus(
	ctx context.Context,
	reporterID uuid.UUID,
	status entity.ReportStatus,
) (int64, error) {
	var count int64
	err := r.db.WithContext(ctx).
		Model(&entity.Report{}).
		Where("reporter_id = ? AND status = ?", reporterID, status).
		Count(&count).
		Error

	return count, reportRepositoryError(err)
}

func (r *reportRepositoryImpl) FindQueueReports(
	ctx fiber.Ctx,
	statuses []string,
	latitude, longitude float64,
	radiusMeters int,
) ([]entity.Report, int64, error) {
	reports := make([]entity.Report, 0)
	if len(statuses) == 0 {
		return reports, 0, nil
	}

	query := r.db.WithContext(ctx.Context()).
		Model(&entity.Report{}).
		Where("status::text IN ?", statuses).
		Where("ST_DWithin(location, ST_MakePoint(?, ?)::geography, ?)", longitude, latitude, radiusMeters)

	var total int64
	if err := query.Count(&total).Error; err != nil {
		return nil, 0, reportRepositoryError(err)
	}

	err := query.
		Order("created_at ASC").
		Order("id ASC").
		Scopes(utils.Paginate(ctx)).
		Find(&reports).
		Error

	return reports, total, reportRepositoryError(err)
}

func (r *reportRepositoryImpl) CountQueueReportsByStatus(
	ctx context.Context,
	latitude, longitude float64,
	radiusMeters int,
) ([]StatusCountProjection, error) {
	statuses := []entity.ReportStatus{
		entity.ReportStatusReported,
		entity.ReportStatusAcknowledged,
		entity.ReportStatusInProgress,
		entity.ReportStatusResolved,
	}
	counts := make([]StatusCountProjection, 0)
	err := r.db.WithContext(ctx).
		Model(&entity.Report{}).
		Select("status::text AS status, count(*) AS count").
		Where("status::text IN ?", statuses).
		Where("ST_DWithin(location, ST_MakePoint(?, ?)::geography, ?)", longitude, latitude, radiusMeters).
		Group("status").
		Scan(&counts).
		Error

	return counts, reportRepositoryError(err)
}

func reportRepositoryError(err error) error {
	if errors.Is(err, gorm.ErrRecordNotFound) {
		return apperror.ErrReportNotFound
	}
	return err
}
