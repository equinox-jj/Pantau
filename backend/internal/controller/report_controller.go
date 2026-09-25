package controller

import (
	"mime"
	"pantau/internal/dto/report"
	"pantau/internal/enums"
	"pantau/internal/service"
	"pantau/pkg/errs"
	"pantau/pkg/response"
	"pantau/pkg/utils"

	"github.com/gofiber/fiber/v3"
	"github.com/google/uuid"
)

type ReportController interface {
	CreateReport(fiber.Ctx) error
	GetReportDetail(fiber.Ctx) error
	GetReportHistory(fiber.Ctx) error
	GetNearbyReports(fiber.Ctx) error
	GetMyReports(fiber.Ctx) error
	UpdateReport(fiber.Ctx) error
	DeleteReport(fiber.Ctx) error
	GetQueue(fiber.Ctx) error
	UpdateReportStatus(fiber.Ctx) error
}

type reportControllerImpl struct {
	reportService service.ReportService
}

func NewReportController(reportService service.ReportService) ReportController {
	return &reportControllerImpl{reportService: reportService}
}

func (controller *reportControllerImpl) CreateReport(ctx fiber.Ctx) error {
	user, ok := utils.CurrentUser(ctx)
	if !ok {
		return errs.ErrUnauthorized
	}
	if !reportContentType(ctx, "multipart/form-data") {
		return ctx.Status(fiber.StatusUnsupportedMediaType).JSON(response.Error(fiber.StatusUnsupportedMediaType, "Expected multipart/form-data"))
	}
	var req report.CreateReportRequest
	if err := ctx.Bind().Form(&req); err != nil {
		return err
	}
	result, err := controller.reportService.CreateReport(ctx.Context(), user, &req)
	if err != nil {
		return err
	}
	return ctx.Status(fiber.StatusCreated).JSON(response.Success(result))
}

func (controller *reportControllerImpl) GetReportDetail(ctx fiber.Ctx) error {
	id, err := reportID(ctx)
	if err != nil {
		return err
	}
	result, err := controller.reportService.GetReportDetail(ctx.Context(), id)
	if err != nil {
		return err
	}
	return ctx.JSON(response.Success(result))
}

func (controller *reportControllerImpl) GetReportHistory(ctx fiber.Ctx) error {
	id, err := reportID(ctx)
	if err != nil {
		return err
	}
	result, err := controller.reportService.GetReportHistory(ctx.Context(), id)
	if err != nil {
		return err
	}
	return ctx.JSON(response.Success(result))
}

func (controller *reportControllerImpl) GetNearbyReports(ctx fiber.Ctx) error {
	query := struct {
		Latitude    *float64 `query:"latitude" validate:"required"`
		Longitude   *float64 `query:"longitude" validate:"required"`
		RadiusMeter int      `query:"radius_meter"`
		Limit       int      `query:"limit"`
	}{RadiusMeter: 1000, Limit: 20}
	if err := ctx.Bind().Query(&query); err != nil {
		return err
	}
	if query.Latitude == nil || query.Longitude == nil {
		return errs.Validation("Latitude and longitude are required")
	}
	result, err := controller.reportService.GetNearbyReports(ctx.Context(), *query.Latitude, *query.Longitude, query.RadiusMeter, query.Limit)
	if err != nil {
		return err
	}
	return ctx.JSON(response.Success(result))
}

func (controller *reportControllerImpl) GetMyReports(ctx fiber.Ctx) error {
	user, ok := utils.CurrentUser(ctx)
	if !ok {
		return errs.ErrUnauthorized
	}
	query := struct {
		Limit  int `query:"limit"`
		Offset int `query:"offset"`
	}{Limit: 20}
	if err := ctx.Bind().Query(&query); err != nil {
		return err
	}
	result, err := controller.reportService.GetMyReports(ctx.Context(), user, query.Limit, query.Offset)
	if err != nil {
		return err
	}
	return ctx.JSON(response.ApiResponse[[]report.ReportResponse]{Success: true, Response: *result})
}

func (controller *reportControllerImpl) UpdateReport(ctx fiber.Ctx) error {
	user, ok := utils.CurrentUser(ctx)
	if !ok {
		return errs.ErrUnauthorized
	}
	id, err := reportID(ctx)
	if err != nil {
		return err
	}
	if !reportContentType(ctx, "multipart/form-data") {
		return ctx.Status(fiber.StatusUnsupportedMediaType).JSON(response.Error(fiber.StatusUnsupportedMediaType, "Expected multipart/form-data"))
	}
	var req report.UpdateReportRequest
	if err := ctx.Bind().Form(&req); err != nil {
		return err
	}
	result, err := controller.reportService.UpdateReport(ctx.Context(), id, user, &req)
	if err != nil {
		return err
	}
	return ctx.JSON(response.Success(result))
}

func (controller *reportControllerImpl) DeleteReport(ctx fiber.Ctx) error {
	user, ok := utils.CurrentUser(ctx)
	if !ok {
		return errs.ErrUnauthorized
	}
	id, err := reportID(ctx)
	if err != nil {
		return err
	}
	if err := controller.reportService.DeleteReport(ctx.Context(), id, user); err != nil {
		return err
	}
	return ctx.JSON(response.Success[any](nil))
}

func (controller *reportControllerImpl) GetQueue(ctx fiber.Ctx) error {
	query := struct {
		Tab         enums.QueueTab `query:"tab" validate:"required,oneof=open in_progress resolved"`
		Latitude    *float64       `query:"latitude" validate:"required"`
		Longitude   *float64       `query:"longitude" validate:"required"`
		RadiusMeter int            `query:"radius_meter"`
		Limit       int            `query:"limit"`
		Offset      int            `query:"offset"`
	}{RadiusMeter: 5000, Limit: 20}
	if err := ctx.Bind().Query(&query); err != nil {
		return err
	}
	if query.Latitude == nil || query.Longitude == nil {
		return errs.Validation("Latitude and longitude are required")
	}
	result, err := controller.reportService.GetQueue(ctx.Context(), query.Tab, *query.Latitude, *query.Longitude, query.RadiusMeter, query.Limit, query.Offset)
	if err != nil {
		return err
	}
	return ctx.JSON(response.ApiResponse[report.QueueResponse]{Success: true, Response: *result})
}

func (controller *reportControllerImpl) UpdateReportStatus(ctx fiber.Ctx) error {
	user, ok := utils.CurrentUser(ctx)
	if !ok {
		return errs.ErrUnauthorized
	}
	id, err := reportID(ctx)
	if err != nil {
		return err
	}
	if !reportContentType(ctx, "application/json") {
		return ctx.Status(fiber.StatusUnsupportedMediaType).JSON(response.Error(fiber.StatusUnsupportedMediaType, "Expected application/json"))
	}
	var req report.UpdateStatusRequest
	if err := ctx.Bind().JSON(&req); err != nil {
		return err
	}
	result, err := controller.reportService.UpdateReportStatus(ctx.Context(), id, user, &req)
	if err != nil {
		return err
	}
	return ctx.JSON(response.Success(result))
}

func reportID(ctx fiber.Ctx) (uuid.UUID, error) {
	id, err := uuid.Parse(ctx.Params("id"))
	if err != nil {
		return uuid.Nil, errs.Validation("Invalid report ID")
	}
	return id, nil
}

func reportContentType(ctx fiber.Ctx, expected string) bool {
	contentType, _, err := mime.ParseMediaType(ctx.Get(fiber.HeaderContentType))
	return err == nil && contentType == expected
}
