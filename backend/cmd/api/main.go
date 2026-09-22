package main

import (
	"pantau/internal/app"

	"go.uber.org/fx"
)

func main() {
	fx.New(
		app.Module,
	).Run()
}
