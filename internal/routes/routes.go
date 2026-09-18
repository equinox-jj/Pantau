package routes

import (
	"pantau/internal/controller"
	"pantau/internal/entity"
	"pantau/internal/middleware"

	"github.com/gofiber/fiber/v3"
)

func RegisterRoutes(
	app *fiber.App,
	auth controller.AuthController,
	security *middleware.GateawayAuth,
) {
	app.Use(security.Authenticate)

	api := app.Group("/api/v1")

	authGroup := api.Group("/auth")
	authGroup.Post("/register", auth.Register)
	authGroup.Post("/login", auth.Login)

	userGroup := api.Group("/users")
	userGroup.Get("/me", nil)

	categoryGroup := api.Group("/categories")
	categoryGroup.Get("/", nil)
	categoryGroup.Get("/slug/:slug", nil)
	categoryGroup.Get("/:id", nil)

	reportGroup := api.Group("/reports")
	reportGroup.Post("/", middleware.RequireRoles(entity.RoleCitizen), nil)
	reportGroup.Get("/:id", nil)
	reportGroup.Patch("/:id", middleware.RequireRoles(entity.RoleCitizen), nil)
	reportGroup.Delete("/:id", middleware.RequireRoles(entity.RoleCitizen), nil)
	reportGroup.Get("/:id/history", nil)
	reportGroup.Patch("/:id/status", middleware.RequireRoles(entity.RoleResolver), nil)
	reportGroup.Get("/nearby", nil)
	reportGroup.Get("/mine", middleware.RequireRoles(entity.RoleCitizen), nil)
	reportGroup.Get("/queue", middleware.RequireRoles(entity.RoleResolver), nil)
}
