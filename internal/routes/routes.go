package routes

import (
	"pantau/internal/controller"
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
}
