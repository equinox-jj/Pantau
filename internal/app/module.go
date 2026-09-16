package app

import (
	"pantau/internal/config"
	"pantau/internal/controller"
	"pantau/internal/repository"
	"pantau/internal/service"
	"pantau/pkg"

	"go.uber.org/fx"
)

var Module = fx.Module(
	"app",
	pkg.Module,
	config.Module,
	repository.Module,
	service.Module,
	fx.Provide(
		NewFiber,
	),
	controller.Module,
	fx.Invoke(
		StartServer,
	),
)
