package errors

import (
	"errors"

	"pantau/pkg/response"

	"github.com/go-playground/validator/v10"
	"github.com/gofiber/fiber/v3"
)

func ErrorHandler(
	ctx fiber.Ctx,
	err error,
) error {
	// -------------------------
	// Validation errors
	// -------------------------
	if validationErrors, ok := errors.AsType[validator.ValidationErrors](err); ok {
		// Create new slice of ErrorDetail Response
		errs := make(
			[]response.ErrorDetail,
			0,
			len(validationErrors),
		)

		for _, validationErr := range validationErrors {
			errs = append(
				errs,
				response.ErrorDetail{
					Code:    fiber.StatusBadRequest,
					Field:   validationErr.Field(),
					Message: validationMessage(validationErr),
				},
			)
		}

		return ctx.
			Status(fiber.StatusBadRequest).
			JSON(response.Errors(errs))
	}

	// -------------------------
	// Invalid/malformed request
	// -------------------------
	if _, ok := errors.AsType[*fiber.BindError](err); ok {
		return ctx.
			Status(fiber.StatusBadRequest).
			JSON(
				response.Error(
					fiber.StatusBadRequest,
					"Invalid request body",
				),
			)
	}

	// -------------------------
	// Application errors
	// -------------------------
	status := fiber.StatusInternalServerError
	message := "Internal server error"

	switch {
	case errors.Is(err, ErrUnauthorized):
		status = fiber.StatusUnauthorized
		message = "Error: Unauthorized"
		ctx.Set(fiber.HeaderWWWAuthenticate, "Bearer")
	case errors.Is(err, ErrForbidden):
		status = fiber.StatusForbidden
		message = "Forbidden"
	case errors.Is(err, ErrUserNotFound):
		status = fiber.StatusNotFound
		message = "User not found"
	case errors.Is(err, ErrEmailNotFound):
		status = fiber.StatusNotFound
		message = "Email not found"
	case errors.Is(err, ErrEmailAlreadyExists):
		status = fiber.StatusConflict
		message = "An account with the email address already exists"
	case errors.Is(err, ErrInvalidEmailOrPassword):
		status = fiber.StatusUnauthorized
		message = "Invalid email or password"
	case errors.Is(err, ErrInvalidToken):
		status = fiber.StatusUnauthorized
		message = "Invalid token"
	case errors.Is(err, ErrUnexpectedSigningMethod):
		status = fiber.StatusUnauthorized
		message = "Invalid token"
	}

	return ctx.
		Status(status).
		JSON(response.Error(
			status,
			message,
		))
}

func validationMessage(err validator.FieldError) string {
	switch err.Tag() {
	case "required":
		return err.Field() + " is required"
	case "email":
		return err.Field() + " must be a valid email address"
	case "min":
		return err.Field() +
			" must be at least " +
			err.Param() +
			" characters"
	case "max":
		return err.Field() +
			" must be at most " +
			err.Param() +
			" characters"
	default:
		return err.Field() + " is invalid"
	}
}
