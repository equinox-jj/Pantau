package controller

import (
	"pantau/internal/dto/auth"
	"pantau/internal/service"
	"pantau/pkg/response"

	"github.com/gofiber/fiber/v3"
)

type AuthController interface {
	Register(ctx fiber.Ctx) error
	Login(ctx fiber.Ctx) error
}

type authControllerImpl struct {
	authService service.AuthService
}

func NewAuthController(
	authService service.AuthService,
) AuthController {
	return &authControllerImpl{authService: authService}
}

func (controller *authControllerImpl) Login(ctx fiber.Ctx) error {
	var req auth.LoginRequest

	if err := ctx.Bind().Body(&req); err != nil {
		return err
	}

	result, err := controller.authService.Login(
		ctx.Context(),
		req,
	)
	if err != nil {
		return err
	}

	return ctx.
		Status(fiber.StatusOK).
		JSON(response.Success(result))
}

func (controller *authControllerImpl) Register(ctx fiber.Ctx) error {
	var req auth.RegisterRequest

	if err := ctx.Bind().Body(&req); err != nil {
		return err
	}

	result, err := controller.authService.Register(
		ctx.Context(),
		req,
	)
	if err != nil {
		return err
	}

	return ctx.
		Status(fiber.StatusCreated).
		JSON(response.Success(result))
}
