package errors

import (
	"errors"
	"log"

	apperr "pantau/pkg/errors"
	"pantau/pkg/response"

	"github.com/gofiber/fiber/v3"
)

func ErrorHandler(
	ctx fiber.Ctx,
	err error,
) error {
	status := fiber.StatusInternalServerError
	message := "Internal server error"

	switch {
	case errors.Is(err, apperr.ErrEmailNotFound):
		status = fiber.StatusNotFound
		message = "Email not found"

	case errors.Is(err, apperr.ErrEmailAlreadyExists):
		status = fiber.StatusConflict
		message = "An account with the email address already exists"

	case errors.Is(err, apperr.ErrInvalidEmailOrPassword):
		status = fiber.StatusUnauthorized
		message = "Invalid email or password"

	case errors.Is(err, apperr.ErrInvalidToken):
		status = fiber.StatusUnauthorized
		message = "Invalid token"

	case errors.Is(err, apperr.ErrUnexpectedSigningMethod):
		status = fiber.StatusUnauthorized
		message = "Invalid token"

	default:
		log.Printf("unexpected error: %v", err)
	}

	return ctx.
		Status(status).
		JSON(response.Error(
			status,
			message,
		))
}
