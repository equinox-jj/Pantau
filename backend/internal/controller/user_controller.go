package controller

import (
	"pantau/internal/service"
	"pantau/pkg/errs"
	"pantau/pkg/response"
	"pantau/pkg/utils"

	"github.com/gofiber/fiber/v3"
)

type UserController interface {
	GetProfile(ctx fiber.Ctx) error
}

type userControllerImpl struct {
	userService service.UserService
}

func NewUserController(userService service.UserService) UserController {
	return &userControllerImpl{userService: userService}
}

func (controller *userControllerImpl) GetProfile(ctx fiber.Ctx) error {
	usr, ok := utils.CurrentUser(ctx)
	if !ok {
		return errs.ErrUnauthorized
	}

	result, err := controller.userService.GetProfile(ctx.Context(), usr)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(response.Success(result))
}
