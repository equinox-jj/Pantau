package controller

import (
	"pantau/internal/service"
	apperror "pantau/pkg/errors"
	"pantau/pkg/response"
	"strconv"

	"github.com/gofiber/fiber/v3"
)

type CategoryController interface {
	GetActiveCategories(ctx fiber.Ctx) error
	GetCategoryByID(ctx fiber.Ctx) error
	GetCategoryBySlug(ctx fiber.Ctx) error
}

type categoryControllerImpl struct {
	categoryService service.CategoryService
}

func NewCategoryController(categoryService service.CategoryService) CategoryController {
	return &categoryControllerImpl{categoryService: categoryService}
}

func (controller *categoryControllerImpl) GetActiveCategories(ctx fiber.Ctx) error {
	result, err := controller.categoryService.GetActiveCategories(ctx.Context())
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(response.Success(result))
}

func (controller *categoryControllerImpl) GetCategoryByID(ctx fiber.Ctx) error {
	id, err := strconv.ParseInt(ctx.Params("id"), 10, 64)
	if err != nil {
		return apperror.Validation("Invalid category ID")
	}

	result, err := controller.categoryService.GetCategoryByID(ctx.Context(), id)
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(response.Success(result))
}

func (controller *categoryControllerImpl) GetCategoryBySlug(ctx fiber.Ctx) error {
	result, err := controller.categoryService.GetCategoryBySlug(ctx.Context(), ctx.Params("slug"))
	if err != nil {
		return err
	}

	return ctx.Status(fiber.StatusOK).JSON(response.Success(result))
}
