package repository

import (
	"context"
	"errors"
	"log/slog"
	"pantau/internal/entity"
	"pantau/internal/enums"
	apperror "pantau/pkg/errors"

	"github.com/google/uuid"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

type statusCountProjection struct {
	Status enums.ReportStatus `gorm:"column:status" json:"status"`
	Count  int64              `gorm:"column:count" json:"count"`
}

type ReportRepository interface {
	FindByID(ctx context.Context, id uuid.UUID) (*entity.Report, error)
	FindByIDForUpdate(ctx context.Context, id uuid.UUID) (*entity.Report, error)
	Create(ctx context.Context, report *entity.Report) error
	Save(ctx context.Context, report *entity.Report) error
	Delete(ctx context.Context, id uuid.UUID) error
	FindNearbyReport(ctx context.Context, latitude, longitude float64, radiusMeters, limit int) ([]entity.Report, error)
	FindByReporterID(ctx context.Context, reporterID uuid.UUID, limit, offset int) ([]entity.Report, int64, error)
	CountByReporterID(ctx context.Context, reporterID uuid.UUID) (int64, error)
	CountByReporterIDAndStatus(ctx context.Context, reporterID uuid.UUID, status enums.ReportStatus) (int64, error)
	FindQueueReports(ctx context.Context, statuses []string, latitude, longitude float64, radiusMeters, limit, offset int) ([]entity.Report, int64, error)
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
		Preload("Category").Raw(`
		SELECT * FROM reports r
		WHERE ST_DWithin(r.location, ST_MakePoint(?, ?)::geography, ?)
		ORDER BY r.location <-> ST_MakePoint(?, ?)::geography
		LIMIT ?`, longitude, latitude, radiusMeters, longitude, latitude, limit).
		Find(&reports).
		Error; err != nil {
		slog.Error("[ReportRepository] Failed to find nearby reports", "latitude", latitude, "longitude", longitude, "radius_meters", radiusMeters, "limit", limit, "error", err)
		return nil, repo.reportRepositoryError(err)
	}

	return reports, nil
}

func (repo *reportRepositoryImpl) FindByReporterID(
	ctx context.Context,
	reporterID uuid.UUID,
	limit, offset int,
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
		Limit(limit).Offset(offset).
		Find(&reports).
		Error; err != nil {
		slog.Error("[ReportRepository] Failed to find reports by reporter id", "reporter_id", reporterID, "limit", limit, "offset", offset, "error", err)
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
	status enums.ReportStatus,
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
	radiusMeters, limit, offset int,
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
		Preload("Category").
		Order("created_at ASC").
		Order("id ASC").
		Limit(limit).Offset(offset).
		Find(&reports).
		Error; err != nil {
		slog.Error("[ReportRepository] Failed to find queue reports", "statuses", statuses, "latitude", latitude, "longitude", longitude, "radius_meters", radiusMeters, "limit", limit, "offset", offset, "error", err)
		return nil, 0, repo.reportRepositoryError(err)
	}

	return reports, total, nil
}

func (repo *reportRepositoryImpl) CountQueueReportsByStatus(
	ctx context.Context,
	latitude, longitude float64,
	radiusMeters int,
) ([]statusCountProjection, error) {
	statuses := []enums.ReportStatus{
		enums.ReportStatusReported,
		enums.ReportStatusAcknowledged,
		enums.ReportStatusInProgress,
		enums.ReportStatusResolved,
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

func (repo *reportRepositoryImpl) FindByID(ctx context.Context, id uuid.UUID) (*entity.Report, error) {
	var report entity.Report
	if err := repo.db.WithContext(ctx).Preload("Category").First(&report, "id = ?", id).Error; err != nil {
		slog.Error("[ReportRepository.FindByID] Failed to find report", "report_id", id, "error", err)
		return nil, repo.reportRepositoryError(err)
	}
	return &report, nil
}

func (repo *reportRepositoryImpl) FindByIDForUpdate(ctx context.Context, id uuid.UUID) (*entity.Report, error) {
	var report entity.Report
	if err := repo.db.WithContext(ctx).Clauses(clause.Locking{Strength: "UPDATE"}).Preload("Category").First(&report, "id = ?", id).Error; err != nil {
		slog.Error("[ReportRepository.FindByIDForUpdate] Failed to lock report", "report_id", id, "error", err)
		return nil, repo.reportRepositoryError(err)
	}
	return &report, nil
}

func (repo *reportRepositoryImpl) Create(ctx context.Context, report *entity.Report) error {
	if err := repo.db.WithContext(ctx).Omit(clause.Associations).Create(report).Error; err != nil {
		slog.Error("[ReportRepository.Create] Failed to create report", "report_id", report.ID, "error", err)
		return err
	}
	return nil
}

func (repo *reportRepositoryImpl) Save(ctx context.Context, report *entity.Report) error {
	if err := repo.db.WithContext(ctx).Model(report).Select("CategoryID", "Description", "Location", "Status", "UpdatedAt").Updates(report).Error; err != nil {
		slog.Error("[ReportRepository.Save] Failed to save report", "report_id", report.ID, "error", err)
		return err
	}
	return nil
}

func (repo *reportRepositoryImpl) Delete(ctx context.Context, id uuid.UUID) error {
	if err := repo.db.WithContext(ctx).Delete(&entity.Report{}, "id = ?", id).Error; err != nil {
		slog.Error("[ReportRepository.Delete] Failed to delete report", "report_id", id, "error", err)
		return err
	}
	return nil
}
