package routes

import (
	"pantau/internal/controller"
	"pantau/internal/enums"
	"pantau/internal/middleware"
	"pantau/pkg/utils"

	"github.com/gofiber/fiber/v3"
)

func RegisterRoutes(
	app *fiber.App,
	security *middleware.GateawayAuth,
	auth controller.AuthController,
	reports controller.ReportController,
	users controller.UserController,
	categories controller.CategoryController,
) {
	app.Use(security.Authenticate)

	api := app.Group("/api/v1")

	authGroup := api.Group("/auth")
	authGroup.Post("/register", auth.Register)
	authGroup.Post("/login", auth.Login)

	userGroup := api.Group("/users")
	userGroup.Get("/me", users.GetProfile)

	categoryGroup := api.Group("/categories")
	categoryGroup.Get("/", categories.GetActiveCategories)
	categoryGroup.Get("/slug/:slug", categories.GetCategoryBySlug)
	categoryGroup.Get("/:id", categories.GetCategoryByID)

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
