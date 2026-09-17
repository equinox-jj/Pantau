package database

import (
	"context"
	"fmt"
	"log/slog"

	"pantau/internal/config"

	"go.uber.org/fx"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func NewDatabase(
	lc fx.Lifecycle,
	cfg *config.Config,
) (*gorm.DB, error) {
	dsn := fmt.Sprintf(
		"host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		cfg.Database.Host,
		cfg.Database.Port,
		cfg.Database.User,
		cfg.Database.Password,
		cfg.Database.Name,
	)

	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		slog.Error("[GormDB] Failed to open database", "host", cfg.Database.Host, "database", cfg.Database.Name, "error", err)
		return nil, err
	}

	sqlDB, err := db.DB()
	if err != nil {
		slog.Error("[GormDB] Failed to get database connection", "error", err)
		return nil, err
	}

	if err := sqlDB.Ping(); err != nil {
		slog.Error("[GormDB] Failed to ping database", "error", err)
		return nil, err
	}

	lc.Append(fx.Hook{
		OnStop: func(ctx context.Context) error {
			if err := sqlDB.Close(); err != nil {
				slog.Error("[GormDB] Failed to close database", "error", err)
				return err
			}
			return nil
		},
	})

	return db, nil
}
