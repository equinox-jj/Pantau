package controller

import (
	"log/slog"
	"pantau/internal/dto/user"
	"pantau/internal/service"
	"pantau/pkg/errs"
	"pantau/pkg/response"
	"pantau/pkg/utils"

	"github.com/gofiber/fiber/v3"
)

type UserController interface {
	GetProfile(ctx fiber.Ctx) error
	ChangePassword(ctx fiber.Ctx) error
	UpdateAvatar(ctx fiber.Ctx) error
	RemoveAvatar(ctx fiber.Ctx) error
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

func (controller *userControllerImpl) ChangePassword(ctx fiber.Ctx) error {
	usr, ok := utils.CurrentUser(ctx)
	if !ok {
		return errs.ErrUnauthorized
	}

	var req user.ChangePasswordRequest
	if err := ctx.Bind().Body(&req); err != nil {
		slog.Error("[UserController] Failed to bind change password request", "user_id", usr.ID, "error", err)
		return err
	}

	if err := controller.userService.ChangePassword(ctx.Context(), usr, req); err != nil {
		return err
	}

	return ctx.SendStatus(fiber.StatusNoContent)
}

func (controller *userControllerImpl) UpdateAvatar(ctx fiber.Ctx) error {
	usr, ok := utils.CurrentUser(ctx)
	if !ok {
		return errs.ErrUnauthorized
	}

	file, err := ctx.FormFile("avatar")
	if err != nil {
		slog.Error("[UserController] Missing avatar file", "user_id", usr.ID, "error", err)
		return errs.ErrImageRequired
	}

	result, err := controller.userService.UpdateAvatar(ctx.Context(), usr, file)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(response.Success(result))
}

func (controller *userControllerImpl) RemoveAvatar(ctx fiber.Ctx) error {
	usr, ok := utils.CurrentUser(ctx)
	if !ok {
		return errs.ErrUnauthorized
	}

	result, err := controller.userService.RemoveAvatar(ctx.Context(), usr)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(response.Success(result))
}
