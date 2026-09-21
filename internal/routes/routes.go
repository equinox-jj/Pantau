package routes

import (
	"pantau/internal/controller"
	"pantau/internal/enums"
	"pantau/internal/middleware"
	"pantau/pkg/response"
	"pantau/pkg/utils"

	"github.com/gofiber/fiber/v3"
)

func RegisterRoutes(
	app *fiber.App,
	security *middleware.GateawayAuth,
	auth controller.AuthController,
	reports controller.ReportController,
) {
	app.Use(security.Authenticate)

	api := app.Group("/api/v1")

	authGroup := api.Group("/auth")
	authGroup.Post("/register", auth.Register)
	authGroup.Post("/login", auth.Login)

	notImplemented := func(ctx fiber.Ctx) error {
		return ctx.Status(fiber.StatusNotImplemented).JSON(response.Error(fiber.StatusNotImplemented, "Not implemented"))
	}

	userGroup := api.Group("/users")
	userGroup.Get("/me", notImplemented)

	categoryGroup := api.Group("/categories")
	categoryGroup.Get("/", notImplemented)
	categoryGroup.Get("/slug/:slug", notImplemented)
	categoryGroup.Get("/:id", notImplemented)

	reportGroup := api.Group("/reports")
	reportGroup.Post("/", utils.RequireRoles(enums.RoleCitizen), reports.CreateReport)
	// Register literal paths before /:id so they cannot be interpreted as IDs.
	reportGroup.Get("/nearby", reports.GetNearbyReports)
	reportGroup.Get("/mine", utils.RequireRoles(enums.RoleCitizen), reports.GetMyReports)
	reportGroup.Get("/queue", utils.RequireRoles(enums.RoleResolver), reports.GetQueue)
	reportGroup.Get("/:id", reports.GetReportDetail)
	reportGroup.Patch("/:id", utils.RequireRoles(enums.RoleCitizen), reports.UpdateReport)
	reportGroup.Delete("/:id", utils.RequireRoles(enums.RoleCitizen), reports.DeleteReport)
	reportGroup.Get("/:id/history", reports.GetReportHistory)
	reportGroup.Patch("/:id/status", utils.RequireRoles(enums.RoleResolver), reports.UpdateReportStatus)
}
