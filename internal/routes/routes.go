package routes

import (
	"pantau/internal/controller"
	"pantau/internal/enums"
	"pantau/internal/middleware"
	"pantau/pkg/response"
	"pantau/pkg/utils"
	"time"

	"github.com/gofiber/fiber/v3"
	"github.com/gofiber/fiber/v3/middleware/limiter"
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
	authGroup.Post("/register", newAuthLimiter(5), auth.Register)
	authGroup.Post("/login", newAuthLimiter(10), auth.Login)

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

func newAuthLimiter(max int) fiber.Handler {
	return limiter.New(limiter.Config{
		Max:        max,
		Expiration: time.Minute,
		LimitReached: func(ctx fiber.Ctx) error {
			return ctx.Status(fiber.StatusTooManyRequests).JSON(response.Error(fiber.StatusTooManyRequests, "Too many requests"))
		},
	})
}
