package pkg

import (
	"pantau/pkg/security"

	"go.uber.org/fx"
)

var Module = fx.Module(
	"pkg",
	fx.Provide(
		security.NewPasswordHasher,
		security.NewJwtService,
	),
)
