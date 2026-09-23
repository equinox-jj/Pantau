package service

import (
	"context"
	"errors"
	"fmt"
	"log/slog"
	"mime/multipart"
	"pantau/internal/enums"
	"strings"
	"time"

	"pantau/internal/dto/mapper"
	"pantau/internal/dto/report"
	reportstatus "pantau/internal/dto/report_status"
	"pantau/internal/dto/upload"
	"pantau/internal/entity"
	"pantau/internal/repository"
	"pantau/pkg/database"
	apperror "pantau/pkg/errors"
	"pantau/pkg/pagination"
	"pantau/pkg/response"
	"pantau/pkg/utils"
	"pantau/pkg/utils/geo"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

const (
	maxRadiusMeters = 50_000
	maxNearbyLimit  = 100
	maxPageSize     = 100
)

type ReportService interface {
	CreateReport(context.Context, *entity.User, *report.CreateReportRequest) (*report.ReportResponse, error)
	GetNearbyReports(context.Context, float64, float64, int, int) ([]report.NearbyReportResponse, error)
	GetReportDetail(context.Context, uuid.UUID) (*report.ReportResponse, error)
	GetReportHistory(context.Context, uuid.UUID) ([]reportstatus.ReportStatusResponse, error)
	GetMyReports(context.Context, *entity.User, int, int) (*response.ResponseData[[]report.ReportResponse], error)
	UpdateReportStatus(context.Context, uuid.UUID, *entity.User, *report.UpdateStatusRequest) (*report.ReportResponse, error)
	UpdateReport(context.Context, uuid.UUID, *entity.User, *report.UpdateReportRequest) (*report.ReportResponse, error)
	DeleteReport(context.Context, uuid.UUID, *entity.User) error
	GetQueue(context.Context, enums.QueueTab, float64, float64, int, int, int) (*response.ResponseData[report.QueueResponse], error)
}

type reportServiceImpl struct {
	db               *gorm.DB
	reportRepo       repository.ReportRepository
	reportStatusRepo repository.ReportStatusRepository
	reportPhotoRepo  repository.ReportPhotoRepository
	categoryRepo     repository.CategoryRepository
	uploadService    UploadService
}

func NewReportService(
	db *gorm.DB,
	reportRepo repository.ReportRepository,
	reportStatusRepo repository.ReportStatusRepository,
	reportPhotoRepo repository.ReportPhotoRepository,
	categoryRepo repository.CategoryRepository,
	uploadService UploadService,
) ReportService {
	return &reportServiceImpl{
		db:               db,
		reportRepo:       reportRepo,
		reportStatusRepo: reportStatusRepo,
		reportPhotoRepo:  reportPhotoRepo,
		categoryRepo:     categoryRepo,
		uploadService:    uploadService,
	}
}

func (sv *reportServiceImpl) CreateReport(
	ctx context.Context,
	reporter *entity.User,
	request *report.CreateReportRequest,
) (*report.ReportResponse, error) {
	if reporter == nil {
		err := apperror.ErrUnauthorized
		slog.Error("[ReportService.CreateReport] Failed to create report", "error", err)
		return nil, err
	}
	if request == nil {
		err := apperror.Validation("Request is required")
		slog.Error("[ReportService.CreateReport] Failed to create report", "error", err)
		return nil, err
	}
	if err := sv.validateReportFields(request.CategoryID, request.Latitude, request.Longitude); err != nil {
		slog.Error("[ReportService.CreateReport] Failed to create report", "error", err)
		return nil, err
	}

	category, err := sv.categoryRepo.FindByID(ctx, *request.CategoryID)
	if err != nil {
		slog.Error("[ReportService.CreateReport] Failed to create report", "error", err)
		return nil, err
	}

	uploads, err := sv.uploadAll(ctx, request.Photos)
	if err != nil {
		slog.Error("[ReportService.CreateReport] Failed to create report", "error", err)
		return nil, err
	}

	rpt := &entity.Report{
		ReporterID:  reporter.ID,
		CategoryID:  category.ID,
		Category:    *category,
		Description: request.Description,
		Location:    geo.GeoPoint{Lat: *request.Latitude, Lng: *request.Longitude},
		Status:      enums.ReportStatusReported,
	}

	var photos []entity.ReportPhoto

	if err = database.WithTransaction(ctx, sv.db, func(tx *gorm.DB) error {
		reports := repository.NewReportRepository(tx)
		photoRepo := repository.NewReportPhotoRepository(tx)
		statuses := repository.NewReportStatusRepository(tx)
		if err := reports.Create(ctx, rpt); err != nil {
			return err
		}

		photos, err = sv.savePhotos(ctx, photoRepo, rpt.ID, uploads)
		if err != nil {
			return err
		}

		return statuses.Save(ctx, &entity.ReportStatusHistory{
			ReportID: rpt.ID,
			ActorID:  reporter.ID,
			ToStatus: enums.ReportStatusReported,
		})
	}); err != nil {
		err := sv.rollbackUploads(ctx, uploads, err)
		slog.Error("[ReportService.CreateReport] Failed to create report", "error", err)
		return nil, err
	}

	return mapper.ReportToResponse(rpt, sv.photoURLs(photos)), nil
}

func (sv *reportServiceImpl) GetNearbyReports(ctx context.Context, latitude, longitude float64, radiusMeter, limit int) ([]report.NearbyReportResponse, error) {
	if err := geo.ValidateCoordinates(latitude, longitude); err != nil {
		slog.Error("[ReportService.GetNearbyReports] Failed to get nearby reports", "limit", limit, "error", err)
		return nil, err
	}
	if err := sv.validateRadius(radiusMeter); err != nil {
		slog.Error("[ReportService.GetNearbyReports] Failed to get nearby reports", "limit", limit, "error", err)
		return nil, err
	}
	if err := pagination.ValidateLimit(limit, maxNearbyLimit); err != nil {
		slog.Error("[ReportService.GetNearbyReports] Failed to get nearby reports", "limit", limit, "error", err)
		return nil, err
	}
	reports, err := sv.reportRepo.FindNearbyReport(ctx, latitude, longitude, radiusMeter, limit)
	if err != nil {
		slog.Error("[ReportService.GetNearbyReports] Failed to get nearby reports", "limit", limit, "error", err)
		return nil, err
	}
	photos, err := sv.loadPhotoURLsByReport(ctx, reports)
	if err != nil {
		slog.Error("[ReportService.GetNearbyReports] Failed to get nearby reports", "limit", limit, "error", err)
		return nil, err
	}
	items := make([]report.NearbyReportResponse, 0, len(reports))
	for i := range reports {
		items = append(items, *mapper.ReportToNearbyResponse(&reports[i], photos[reports[i].ID]))
	}
	return items, nil
}

func (sv *reportServiceImpl) GetReportDetail(ctx context.Context, id uuid.UUID) (*report.ReportResponse, error) {
	rpt, err := sv.reportRepo.FindByID(ctx, id)
	if err != nil {
		slog.Error("[ReportService.GetReportDetail] Failed to get report detail", "report_id", id, "error", err)
		return nil, err
	}
	photos, err := sv.reportPhotoRepo.FindByReportID(ctx, id)
	if err != nil {
		slog.Error("[ReportService.GetReportDetail] Failed to get report detail", "report_id", id, "error", err)
		return nil, err
	}
	return mapper.ReportToResponse(rpt, sv.photoURLs(photos)), nil
}

func (sv *reportServiceImpl) GetReportHistory(ctx context.Context, id uuid.UUID) ([]reportstatus.ReportStatusResponse, error) {
	if _, err := sv.reportRepo.FindByID(ctx, id); err != nil {
		slog.Error("[ReportService.GetReportHistory] Failed to get report history", "report_id", id, "error", err)
		return nil, err
	}
	history, err := sv.reportStatusRepo.FindByReportID(ctx, id)
	if err != nil {
		slog.Error("[ReportService.GetReportHistory] Failed to get report history", "report_id", id, "error", err)
		return nil, err
	}
	if history == nil {
		history = []entity.ReportStatusHistory{}
	}
	return mapper.ReportStatusesToResponse(history), nil
}

func (sv *reportServiceImpl) GetMyReports(ctx context.Context, reporter *entity.User, limit, offset int) (*response.ResponseData[[]report.ReportResponse], error) {
	if reporter == nil {
		err := apperror.ErrUnauthorized
		slog.Error("[ReportService.GetMyReports] Failed to get reporter reports", "limit", limit, "offset", offset, "error", err)
		return nil, err
	}
	if err := pagination.Validate(limit, offset, maxPageSize); err != nil {
		slog.Error("[ReportService.GetMyReports] Failed to get reporter reports", "limit", limit, "offset", offset, "error", err)
		return nil, err
	}
	reports, total, err := sv.reportRepo.FindByReporterID(ctx, reporter.ID, limit, offset)
	if err != nil {
		slog.Error("[ReportService.GetMyReports] Failed to get reporter reports", "limit", limit, "offset", offset, "error", err)
		return nil, err
	}
	photos, err := sv.loadPhotoURLsByReport(ctx, reports)
	if err != nil {
		slog.Error("[ReportService.GetMyReports] Failed to get reporter reports", "limit", limit, "offset", offset, "error", err)
		return nil, err
	}
	items := make([]report.ReportResponse, 0, len(reports))
	for i := range reports {
		items = append(items, *mapper.ReportToResponse(&reports[i], photos[reports[i].ID]))
	}
	return &response.ResponseData[[]report.ReportResponse]{Data: items, Pagination: response.NewPagination(limit, offset, total)}, nil
}

func (sv *reportServiceImpl) UpdateReportStatus(ctx context.Context, id uuid.UUID, resolver *entity.User, request *report.UpdateStatusRequest) (*report.ReportResponse, error) {
	if resolver == nil {
		err := apperror.ErrUnauthorized
		slog.Error("[ReportService.UpdateReportStatus] Failed to update report status", "report_id", id, "error", err)
		return nil, err
	}
	if request == nil || request.ToStatus == nil {
		err := apperror.Validation("Target status is required")
		slog.Error("[ReportService.UpdateReportStatus] Failed to update report status", "report_id", id, "error", err)
		return nil, err
	}
	var result *report.ReportResponse
	err := database.WithTransaction(ctx, sv.db, func(tx *gorm.DB) error {
		reports := repository.NewReportRepository(tx)
		photos := repository.NewReportPhotoRepository(tx)
		statuses := repository.NewReportStatusRepository(tx)
		rpt, err := reports.FindByIDForUpdate(ctx, id)
		if err != nil {
			return err
		}
		from, to := rpt.Status, *request.ToStatus
		if !utils.IsReportStatusTransitionAllowed(from, to) {
			return apperror.ErrIllegalTransition
		}
		if to == enums.ReportStatusRejected && (request.Note == nil || strings.TrimSpace(*request.Note) == "") {
			return apperror.Validation("A note is required when rejecting a report")
		}
		rpt.Status = to
		if err := reports.Save(ctx, rpt); err != nil {
			return err
		}
		if err := statuses.Save(ctx, &entity.ReportStatusHistory{ReportID: id, ActorID: resolver.ID, FromStatus: &from, ToStatus: to, Note: request.Note}); err != nil {
			return err
		}
		photoRows, err := photos.FindByReportID(ctx, id)
		if err != nil {
			return err
		}
		result = mapper.ReportToResponse(rpt, sv.photoURLs(photoRows))
		return nil
	})
	if err != nil {
		slog.Error("[ReportService.UpdateReportStatus] Failed to update report status", "report_id", id, "error", err)
		return nil, err
	}
	return result, nil
}

func (sv *reportServiceImpl) UpdateReport(ctx context.Context, id uuid.UUID, requester *entity.User, request *report.UpdateReportRequest) (*report.ReportResponse, error) {
	rpt, err := sv.reportRepo.FindByID(ctx, id)
	if err != nil {
		slog.Error("[ReportService.UpdateReport] Failed to update report", "report_id", id, "error", err)
		return nil, err
	}
	if err := sv.assertEditableBy(rpt, requester); err != nil {
		slog.Error("[ReportService.UpdateReport] Failed to update report", "report_id", id, "error", err)
		return nil, err
	}
	if request == nil {
		err := apperror.Validation("Request is required")
		slog.Error("[ReportService.UpdateReport] Failed to update report", "report_id", id, "error", err)
		return nil, err
	}
	if err := sv.validateReportFields(request.CategoryID, request.Latitude, request.Longitude); err != nil {
		slog.Error("[ReportService.UpdateReport] Failed to update report", "report_id", id, "error", err)
		return nil, err
	}
	category, err := sv.categoryRepo.FindByID(ctx, *request.CategoryID)
	if err != nil {
		slog.Error("[ReportService.UpdateReport] Failed to update report", "report_id", id, "error", err)
		return nil, err
	}
	uploads, err := sv.uploadAll(ctx, request.Photos)
	if err != nil {
		slog.Error("[ReportService.UpdateReport] Failed to update report", "report_id", id, "error", err)
		return nil, err
	}
	var result *report.ReportResponse
	var oldPhotos []entity.ReportPhoto
	err = database.WithTransaction(ctx, sv.db, func(tx *gorm.DB) error {
		reports := repository.NewReportRepository(tx)
		photos := repository.NewReportPhotoRepository(tx)
		// Recheck under a row lock in case a resolver acted during upload.
		rpt, err := reports.FindByIDForUpdate(ctx, id)
		if err != nil {
			return err
		}
		if err := sv.assertEditableBy(rpt, requester); err != nil {
			return err
		}
		rpt.CategoryID, rpt.Category = category.ID, *category
		rpt.Description = request.Description
		rpt.Location = geo.GeoPoint{Lat: *request.Latitude, Lng: *request.Longitude}
		if err := reports.Save(ctx, rpt); err != nil {
			return err
		}
		currentPhotos, err := photos.FindByReportID(ctx, id)
		if err != nil {
			return err
		}
		if len(request.Photos) > 0 {
			oldPhotos = currentPhotos
			if err := photos.DeleteByReportID(ctx, id); err != nil {
				return err
			}
			currentPhotos, err = sv.savePhotos(ctx, photos, id, uploads)
			if err != nil {
				return err
			}
		}
		result = mapper.ReportToResponse(rpt, sv.photoURLs(currentPhotos))
		return nil
	})
	if err != nil {
		err := sv.rollbackUploads(ctx, uploads, err)
		slog.Error("[ReportService.UpdateReport] Failed to update report", "report_id", id, "error", err)
		return nil, err
	}
	sv.deletePhotoAssets(ctx, oldPhotos, id)
	return result, nil
}

func (sv *reportServiceImpl) DeleteReport(ctx context.Context, id uuid.UUID, requester *entity.User) error {
	var oldPhotos []entity.ReportPhoto
	err := database.WithTransaction(ctx, sv.db, func(tx *gorm.DB) error {
		reports := repository.NewReportRepository(tx)
		photos := repository.NewReportPhotoRepository(tx)
		rpt, err := reports.FindByIDForUpdate(ctx, id)
		if err != nil {
			return err
		}
		if err := sv.assertEditableBy(rpt, requester); err != nil {
			return err
		}
		oldPhotos, err = photos.FindByReportID(ctx, id)
		if err != nil {
			return err
		}
		if err := photos.DeleteByReportID(ctx, id); err != nil {
			return err
		}
		return reports.Delete(ctx, id)
	})
	if err != nil {
		slog.Error("[ReportService.DeleteReport] Failed to delete report", "report_id", id, "error", err)
		return err
	}
	sv.deletePhotoAssets(ctx, oldPhotos, id)
	return nil
}

func (sv *reportServiceImpl) GetQueue(ctx context.Context, tab enums.QueueTab, latitude, longitude float64, radiusMeter, limit, offset int) (*response.ResponseData[report.QueueResponse], error) {
	if err := geo.ValidateCoordinates(latitude, longitude); err != nil {
		slog.Error("[ReportService.GetQueue] Failed to get report queue", "limit", limit, "offset", offset, "tab", tab, "error", err)
		return nil, err
	}
	if err := sv.validateRadius(radiusMeter); err != nil {
		slog.Error("[ReportService.GetQueue] Failed to get report queue", "limit", limit, "offset", offset, "tab", tab, "error", err)
		return nil, err
	}
	if err := pagination.Validate(limit, offset, maxPageSize); err != nil {
		slog.Error("[ReportService.GetQueue] Failed to get report queue", "limit", limit, "offset", offset, "tab", tab, "error", err)
		return nil, err
	}
	statuses := tab.Statuses()
	if len(statuses) == 0 {
		err := apperror.Validation("Invalid queue tab")
		slog.Error("[ReportService.GetQueue] Failed to get report queue", "limit", limit, "offset", offset, "tab", tab, "error", err)
		return nil, err
	}
	reports, total, err := sv.reportRepo.FindQueueReports(ctx, statuses, latitude, longitude, radiusMeter, limit, offset)
	if err != nil {
		slog.Error("[ReportService.GetQueue] Failed to get report queue", "limit", limit, "offset", offset, "tab", tab, "error", err)
		return nil, err
	}
	photos, err := sv.loadPhotoURLsByReport(ctx, reports)
	if err != nil {
		slog.Error("[ReportService.GetQueue] Failed to get report queue", "limit", limit, "offset", offset, "tab", tab, "error", err)
		return nil, err
	}
	items := make([]report.QueueReportResponse, 0, len(reports))
	for i := range reports {
		rpt := &reports[i]
		var thumbnail *string
		if urls := photos[rpt.ID]; len(urls) > 0 {
			thumbnail = &urls[0]
		}
		item := mapper.ReportToQueueResponse(rpt, thumbnail)
		distance := geo.HaversineMeters(geo.GeoPoint{Lat: latitude, Lng: longitude}, rpt.Location)
		item.DistanceMeter = &distance
		items = append(items, *item)
	}
	rows, err := sv.reportRepo.CountQueueReportsByStatus(ctx, latitude, longitude, radiusMeter)
	if err != nil {
		slog.Error("[ReportService.GetQueue] Failed to get report queue", "limit", limit, "offset", offset, "tab", tab, "error", err)
		return nil, err
	}
	counts := report.QueueCounts{}
	for _, row := range rows {
		switch row.Status {
		case enums.ReportStatusReported, enums.ReportStatusAcknowledged:
			counts.Open += row.Count
		case enums.ReportStatusInProgress:
			counts.InProgress += row.Count
		case enums.ReportStatusResolved:
			counts.Resolved += row.Count
		}
	}
	return &response.ResponseData[report.QueueResponse]{
		Data:       report.QueueResponse{Items: items, Counts: counts},
		Pagination: response.NewPagination(limit, offset, total),
	}, nil
}

func (sv *reportServiceImpl) uploadAll(ctx context.Context, files []*multipart.FileHeader) ([]upload.UploadResponse, error) {
	uploads := make([]upload.UploadResponse, 0, len(files))
	for _, file := range files {
		uploaded, err := sv.uploadService.Upload(ctx, file)
		if err != nil {
			return nil, sv.rollbackUploads(ctx, uploads, err)
		}
		if uploaded == nil {
			return nil, sv.rollbackUploads(ctx, uploads, apperror.ErrUploadFailed)
		}
		uploads = append(uploads, *uploaded)
	}
	return uploads, nil
}

func (sv *reportServiceImpl) deleteUploads(ctx context.Context, uploads []upload.UploadResponse) error {
	// Cleanup must still run if the original request was canceled.
	cleanupCtx, cancel := context.WithTimeout(context.WithoutCancel(ctx), 30*time.Second)
	defer cancel()
	var cleanupErr error
	for _, uploaded := range uploads {
		if err := sv.uploadService.Delete(cleanupCtx, uploaded.ID); err != nil {
			slog.Error("[ReportService.deleteUploads] Failed to delete uploaded asset during cleanup", "public_id", uploaded.ID, "error", err)
			cleanupErr = errors.Join(cleanupErr, err)
		}
	}
	return cleanupErr
}

func (sv *reportServiceImpl) rollbackUploads(ctx context.Context, uploads []upload.UploadResponse, cause error) error {
	if err := sv.deleteUploads(ctx, uploads); err != nil {
		return err
	}
	return cause
}

func (sv *reportServiceImpl) deletePhotoAssets(ctx context.Context, photos []entity.ReportPhoto, reportID uuid.UUID) {
	cleanupCtx, cancel := context.WithTimeout(context.WithoutCancel(ctx), 30*time.Second)
	defer cancel()
	for _, photo := range photos {
		if photo.PhotoPublicID == nil {
			continue
		}
		if err := sv.uploadService.Delete(cleanupCtx, *photo.PhotoPublicID); err != nil {
			slog.Error("[ReportService.deletePhotoAssets] Failed to delete Cloudinary asset for report", "public_id", *photo.PhotoPublicID, "report_id", reportID, "error", err)
		}
	}
}

func (sv *reportServiceImpl) savePhotos(ctx context.Context, repo repository.ReportPhotoRepository, reportID uuid.UUID, uploads []upload.UploadResponse) ([]entity.ReportPhoto, error) {
	photos := make([]entity.ReportPhoto, 0, len(uploads))
	for i, uploaded := range uploads {
		photos = append(photos, entity.ReportPhoto{ID: uuid.New(), ReportID: reportID, PhotoURL: uploaded.URL, PhotoPublicID: &uploaded.ID, Position: i})
	}
	if err := repo.SaveAll(ctx, photos); err != nil {
		return nil, err
	}
	return photos, nil
}

func (sv *reportServiceImpl) photoURLs(photos []entity.ReportPhoto) []string {
	urls := make([]string, 0, len(photos))
	for _, photo := range photos {
		urls = append(urls, photo.PhotoURL)
	}
	return urls
}

func (sv *reportServiceImpl) loadPhotoURLsByReport(ctx context.Context, reports []entity.Report) (map[uuid.UUID][]string, error) {
	result := make(map[uuid.UUID][]string, len(reports))
	if len(reports) == 0 {
		return result, nil
	}
	ids := make([]uuid.UUID, 0, len(reports))
	for _, rpt := range reports {
		ids = append(ids, rpt.ID)
		result[rpt.ID] = []string{}
	}
	photos, err := sv.reportPhotoRepo.FindByReportIDs(ctx, ids)
	if err != nil {
		return nil, err
	}
	for _, photo := range photos {
		result[photo.ReportID] = append(result[photo.ReportID], photo.PhotoURL)
	}
	return result, nil
}

func (sv *reportServiceImpl) assertEditableBy(rpt *entity.Report, requester *entity.User) error {
	if requester == nil {
		return apperror.ErrUnauthorized
	}
	if rpt.ReporterID != requester.ID {
		return apperror.ErrForbidden
	}
	if rpt.Status != enums.ReportStatusReported {
		return apperror.ErrIllegalTransition
	}
	return nil
}

func (sv *reportServiceImpl) validateReportFields(categoryID *int64, latitude, longitude *float64) error {
	if categoryID == nil {
		return apperror.Validation("Category ID is required")
	}
	if latitude == nil || longitude == nil {
		return apperror.Validation("Latitude and longitude are required")
	}
	return geo.ValidateCoordinates(*latitude, *longitude)
}

func (sv *reportServiceImpl) validateRadius(radius int) error {
	if radius <= 0 {
		return apperror.Validation("Radius must be greater than 0")
	}
	if radius > maxRadiusMeters {
		return apperror.Validation(fmt.Sprintf("Radius must not exceed %d meters", maxRadiusMeters))
	}
	return nil
}
