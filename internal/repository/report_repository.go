package repository

import (
	"context"
	"errors"
	"log/slog"
	"pantau/internal/entity"
	apperror "pantau/pkg/errors"
	"pantau/pkg/utils"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type statusCountProjection struct {
	Status entity.ReportStatus `gorm:"column:status" json:"status"`
	Count  int64               `gorm:"column:count" json:"count"`
}

type ReportRepository interface {
	FindNearbyReport(ctx context.Context, latitude, longitude float64, radiusMeters, limit int) ([]entity.Report, error)
	FindByReporterID(ctx context.Context, reporterID uuid.UUID, page, pageSize int) ([]entity.Report, int64, error)
	CountByReporterID(ctx context.Context, reporterID uuid.UUID) (int64, error)
	CountByReporterIDAndStatus(ctx context.Context, reporterID uuid.UUID, status entity.ReportStatus) (int64, error)
	FindQueueReports(ctx context.Context, statuses []string, latitude, longitude float64, radiusMeters, page, pageSize int) ([]entity.Report, int64, error)
	CountQueueReportsByStatus(ctx context.Context, latitude, longitude float64, radiusMeters int) ([]statusCountProjection, error)
}

type reportRepositoryImpl struct {
	db *gorm.DB
}

func NewReportRepository(db *gorm.DB) ReportRepository {
	return &reportRepositoryImpl{db: db}
}

func (repo *reportRepositoryImpl) FindNearbyReport(
	ctx context.Context,
	latitude, longitude float64,
	radiusMeters, limit int,
) ([]entity.Report, error) {
	if limit < 0 {
		return nil, apperror.ErrInvalidLimit
	}

	reports := make([]entity.Report, 0)
	if err := repo.db.WithContext(ctx).
		Raw(`
		SELECT * FROM reports r
		WHERE ST_DWithin(r.location, ST_MakePoint(?, ?)::geography, ?)
		ORDER BY r.location <-> ST_MakePoint(?, ?)::geography
		LIMIT ?`, longitude, latitude, radiusMeters, longitude, latitude, limit).
		Scan(&reports).
		Error; err != nil {
		slog.Error("[ReportRepository] Failed to find nearby reports", "latitude", latitude, "longitude", longitude, "radius_meters", radiusMeters, "limit", limit, "error", err)
		return nil, repo.reportRepositoryError(err)
	}

	return reports, nil
}

func (repo *reportRepositoryImpl) FindByReporterID(
	ctx context.Context,
	reporterID uuid.UUID,
	page, pageSize int,
) ([]entity.Report, int64, error) {
	query := repo.db.WithContext(ctx).
		Model(&entity.Report{}).
		Where("reporter_id = ?", reporterID)

	var total int64
	if err := query.Count(&total).Error; err != nil {
		slog.Error("[ReportRepository] Failed to count reports by reporter id", "reporter_id", reporterID, "error", err)
		return nil, 0, repo.reportRepositoryError(err)
	}

	reports := make([]entity.Report, 0)
	if err := query.
		Preload("Category").
		Order("created_at DESC").
		Order("id ASC").
		Scopes(utils.Paginate(page, pageSize)).
		Find(&reports).
		Error; err != nil {
		slog.Error("[ReportRepository] Failed to find reports by reporter id", "reporter_id", reporterID, "page", page, "page_size", pageSize, "error", err)
		return nil, 0, repo.reportRepositoryError(err)
	}

	return reports, total, nil
}

func (repo *reportRepositoryImpl) CountByReporterID(ctx context.Context, reporterID uuid.UUID) (int64, error) {
	var count int64
	if err := repo.db.WithContext(ctx).
		Model(&entity.Report{}).
		Where("reporter_id = ?", reporterID).
		Count(&count).
		Error; err != nil {
		slog.Error("[ReportRepository] Failed to count reports by reporter id", "reporter_id", reporterID, "error", err)
		return 0, repo.reportRepositoryError(err)
	}

	return count, nil
}

func (repo *reportRepositoryImpl) CountByReporterIDAndStatus(
	ctx context.Context,
	reporterID uuid.UUID,
	status entity.ReportStatus,
) (int64, error) {
	var count int64
	if err := repo.db.WithContext(ctx).
		Model(&entity.Report{}).
		Where("reporter_id = ? AND status = ?", reporterID, status).
		Count(&count).
		Error; err != nil {
		slog.Error("[ReportRepository] Failed to count reports by reporter id and status", "reporter_id", reporterID, "status", status, "error", err)
		return 0, repo.reportRepositoryError(err)
	}

	return count, nil
}

func (repo *reportRepositoryImpl) FindQueueReports(
	ctx context.Context,
	statuses []string,
	latitude, longitude float64,
	radiusMeters, page, pageSize int,
) ([]entity.Report, int64, error) {
	reports := make([]entity.Report, 0)
	if len(statuses) == 0 {
		return reports, 0, nil
	}

	query := repo.db.WithContext(ctx).
		Model(&entity.Report{}).
		Where("status::text IN ?", statuses).
		Where("ST_DWithin(location, ST_MakePoint(?, ?)::geography, ?)", longitude, latitude, radiusMeters)

	var total int64
	if err := query.Count(&total).Error; err != nil {
		slog.Error("[ReportRepository] Failed to count queue reports", "statuses", statuses, "latitude", latitude, "longitude", longitude, "radius_meters", radiusMeters, "error", err)
		return nil, 0, repo.reportRepositoryError(err)
	}

	if err := query.
		Order("created_at ASC").
		Order("id ASC").
		Scopes(utils.Paginate(page, pageSize)).
		Find(&reports).
		Error; err != nil {
		slog.Error("[ReportRepository] Failed to find queue reports", "statuses", statuses, "latitude", latitude, "longitude", longitude, "radius_meters", radiusMeters, "page", page, "page_size", pageSize, "error", err)
		return nil, 0, repo.reportRepositoryError(err)
	}

	return reports, total, nil
}

func (repo *reportRepositoryImpl) CountQueueReportsByStatus(
	ctx context.Context,
	latitude, longitude float64,
	radiusMeters int,
) ([]statusCountProjection, error) {
	statuses := []entity.ReportStatus{
		entity.ReportStatusReported,
		entity.ReportStatusAcknowledged,
		entity.ReportStatusInProgress,
		entity.ReportStatusResolved,
	}
	counts := make([]statusCountProjection, 0)
	if err := repo.db.WithContext(ctx).
		Model(&entity.Report{}).
		Select("status::text AS status, count(*) AS count").
		Where("status::text IN ?", statuses).
		Where("ST_DWithin(location, ST_MakePoint(?, ?)::geography, ?)", longitude, latitude, radiusMeters).
		Group("status").
		Scan(&counts).
		Error; err != nil {
		slog.Error("[ReportRepository] Failed to count queue reports by status", "latitude", latitude, "longitude", longitude, "radius_meters", radiusMeters, "error", err)
		return nil, repo.reportRepositoryError(err)
	}

	return counts, nil
}

func (reportRepositoryImpl) reportRepositoryError(err error) error {
	if errors.Is(err, gorm.ErrRecordNotFound) {
		return apperror.ErrReportNotFound
	}
	return err
}
