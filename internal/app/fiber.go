package app

import (
	"context"
	"fmt"
	"log/slog"
	"os"
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
					slog.Error("[FIBER] Failed to start server", "address", addr, "error", err)
					os.Exit(1)
				}
			}()

			return nil
		},

		OnStop: func(ctx context.Context) error {
			if err := app.ShutdownWithContext(ctx); err != nil {
				slog.Error("[FIBER] Failed to shut down server", "error", err)
				return err
			}
			return nil
		},
	})
}
