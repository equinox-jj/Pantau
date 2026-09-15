package app

import (
	"pantau/internal/config"
	"pantau/internal/repository"

	"go.uber.org/fx"
)

var Module = fx.Module(
	"app",
	config.Module,
	repository.Module,
)
