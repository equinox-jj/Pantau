package pkg

import (
	"pantau/internal/config"
	"pantau/pkg/security"
	"time"

	"github.com/cloudinary/cloudinary-go/v2"
	"go.uber.org/fx"
	"golang.org/x/crypto/bcrypt"
)

var Module = fx.Module(
	"pkg",
	fx.Provide(
		provideCloudinary,
		fx.Annotate(
			security.NewPasswordHasher,
			fx.ParamTags(
				`name:"bcryptCost"`,
			),
		),
		fx.Annotate(
			security.NewJwtService,
			fx.ParamTags(
				`name:"jwtSecret"`,
				`name:"jwtExpiration"`,
			),
		),
		fx.Annotate(
			provideBcryptCost,
			fx.ResultTags(
				`name:"bcryptCost"`,
			),
		),
		fx.Annotate(
			provideJwtSecret,
			fx.ResultTags(`name:"jwtSecret"`),
		),
		fx.Annotate(
			provideJwtExpiration,
			fx.ResultTags(`name:"jwtExpiration"`),
		),
	),
)

func provideCloudinary(cfg *config.Config) (*cloudinary.Cloudinary, error) {
	return cloudinary.NewFromParams(
		cfg.Cloudinary.CloudName,
		cfg.Cloudinary.APIKey,
		cfg.Cloudinary.APISecret,
	)
}

func provideJwtSecret(cfg *config.Config) string {
	return cfg.JWT.SecretKey
}

func provideJwtExpiration(cfg *config.Config) time.Duration {
	return cfg.JWT.Expiration
}

func provideBcryptCost() int {
	return bcrypt.DefaultCost
}
