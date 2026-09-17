package app

import (
	"context"
	"fmt"
	"log"
	"pantau/internal/config"
	apperror "pantau/pkg/errors"
	"pantau/pkg/validator"

	"github.com/gofiber/fiber/v3"
	"go.uber.org/fx"
)

func NewFiber() *fiber.App {
	return fiber.New(fiber.Config{
		AppName:         "Pantau API",
		ErrorHandler:    apperror.ErrorHandler,
		StructValidator: validator.NewStructValidator(),
	})
}

func StartServer(
	lifecycle fx.Lifecycle,
	app *fiber.App,
	cfg *config.Config,
) {
	lifecycle.Append(fx.Hook{
		OnStart: func(ctx context.Context) error {
			addr := fmt.Sprintf(":%d", cfg.Server.Port)

			go func() {
				if err := app.Listen(addr); err != nil {
					log.Fatal("Failed to start server: ", err)
				}
			}()

			return nil
		},

		OnStop: func(ctx context.Context) error {
			return app.ShutdownWithContext(ctx)
		},
	})
}
