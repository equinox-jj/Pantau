package app

import (
	"context"
	"fmt"
	"log/slog"
	"os"
	"pantau/internal/config"
	"pantau/pkg/errs"
	"pantau/pkg/validator"

	"github.com/gofiber/fiber/v3"
	"go.uber.org/fx"
)

func NewFiber(cfg *config.Config) *fiber.App {
	fc := fiber.Config{
		AppName:         "Pantau API",
		ErrorHandler:    errs.ErrorHandler,
		StructValidator: validator.NewStructValidator(),
		BodyLimit:       cfg.Upload.MaxRequestBytes,
	}
	// c.IP() (and so the auth rate limits) reads X-Forwarded-For only from
	// trusted proxies; otherwise any client could pick its own rate-limit key.
	if len(cfg.Server.TrustedProxies) > 0 {
		fc.TrustProxy = true
		fc.TrustProxyConfig = fiber.TrustProxyConfig{Proxies: cfg.Server.TrustedProxies}
		fc.ProxyHeader = fiber.HeaderXForwardedFor
		fc.EnableIPValidation = true
	}

	return fiber.New(fc)
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
