package app

import (
	"time"

	"pantau/internal/config"
	"pantau/internal/controller"
	"pantau/internal/database"
	"pantau/internal/middleware"
	"pantau/internal/repository"
	"pantau/internal/routes"
	"pantau/internal/service"
	"pantau/pkg/security"

	"github.com/cloudinary/cloudinary-go/v2"
	"go.uber.org/fx"
	"golang.org/x/crypto/bcrypt"
)

func NewUberFX() *fx.App {
	return fx.New(
		provideUtilities(),
		provideConfiguration(),
		provideDatabase(),
		provideRepositories(),
		provideServices(),
		provideControllers(),
		registerRoutes(),
		provideMiddleware(),
		provideServer(),
		fx.Invoke(StartServer),
	)
}

func provideConfiguration() fx.Option {
	return fx.Provide(
		config.NewConfig,
	)
}

func provideDatabase() fx.Option {
	return fx.Provide(
		database.NewDatabase,
	)
}

func provideRepositories() fx.Option {
	return fx.Provide(
		repository.NewUserRepository,
		repository.NewReportRepository,
		repository.NewReportPhotoRepository,
		repository.NewReportStatusRepository,
		repository.NewCategoryRepository,
	)
}

func provideServices() fx.Option {
	return fx.Provide(
		service.NewAuthService,
		service.NewUserService,
		service.NewReportService,
		service.NewUploadService,
		service.NewCategoryService,
	)
}

func provideControllers() fx.Option {
	return fx.Provide(
		controller.NewAuthController,
		controller.NewUserController,
		controller.NewReportController,
		controller.NewCategoryController,
	)
}

func registerRoutes() fx.Option {
	return fx.Invoke(
		routes.RegisterRoutes,
	)
}

func provideMiddleware() fx.Option {
	return fx.Provide(
		middleware.NewGateawayAuth,
	)
}

func provideUtilities() fx.Option {
	return fx.Provide(
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
	)
}

func provideServer() fx.Option {
	return fx.Provide(NewFiber)
}

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
