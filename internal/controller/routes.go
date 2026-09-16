package controller

import "github.com/gofiber/fiber/v3"

func RegisterRoutes(
	app *fiber.App,
	auth AuthController,
) {
	api := app.Group("/api/v1")

	authGroup := api.Group("/auth")
	authGroup.Post("/register", auth.Register)
	authGroup.Post("/login", auth.Login)
}
