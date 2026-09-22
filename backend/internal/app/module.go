package app

import (
	"pantau/internal/config"
	"pantau/internal/controller"
	"pantau/internal/database"
	"pantau/internal/middleware"
	"pantau/internal/repository"
	"pantau/internal/routes"
	"pantau/internal/service"
	"pantau/pkg"

	"go.uber.org/fx"
)

var Module = fx.Module(
	"app",
	pkg.Module,
	config.Module,
	database.Module,
	repository.Module,
	service.Module,
	controller.Module,
	routes.Module,
	middleware.Module,
	fx.Provide(
		NewFiber,
	),
	fx.Invoke(
		StartServer,
	),
)
