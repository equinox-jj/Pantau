package errs

import (
	"errors"
	"reflect"
	"strings"

	"pantau/pkg/response"

	"github.com/go-playground/validator/v10"
	"github.com/gofiber/fiber/v3"
)

// Messages shared with handlers that respond without going through ErrorHandler.
const (
	MsgInternal         = "Something went wrong on our end. Please try again in a moment."
	MsgInvalidBody      = "We couldn't read your request. Please check the details and try again."
	MsgTooManyRequests  = "Too many attempts. Please wait a minute and try again."
	MsgExpectedFormData = "Please send this request as a form upload (multipart/form-data)."
	MsgExpectedJSON     = "Please send this request as JSON (application/json)."
)

type appError struct {
	err     error
	status  int
	message string
}

// appErrors maps each sentinel to its HTTP status and user-facing message.
// The first match wins.
var appErrors = []appError{
	{ErrIllegalTransition, fiber.StatusConflict, "This report can't be moved to that status from its current one."},
	{ErrUnauthorized, fiber.StatusUnauthorized, "Please sign in to continue."},
	{ErrForbidden, fiber.StatusForbidden, "You don't have permission to do that."},
	{ErrUserNotFound, fiber.StatusNotFound, "We couldn't find that user."},
	{ErrCategoryNotFound, fiber.StatusNotFound, "We couldn't find that category."},
	{ErrReportNotFound, fiber.StatusNotFound, "We couldn't find that report. It may have been deleted."},
	{ErrInvalidLimit, fiber.StatusBadRequest, "The number of items requested can't be negative."},
	{ErrInvalidPagination, fiber.StatusBadRequest, "The page size must be greater than 0 and the offset can't be negative."},
	{ErrEmailNotFound, fiber.StatusNotFound, "We couldn't find an account with that email."},
	{ErrEmailAlreadyExists, fiber.StatusConflict, "An account with this email already exists. Try signing in instead."},
	{ErrInvalidEmailOrPassword, fiber.StatusUnauthorized, "The email or password you entered is incorrect."},
	{ErrInvalidToken, fiber.StatusUnauthorized, "Your session has expired. Please sign in again."},
	{ErrUnexpectedSigningMethod, fiber.StatusUnauthorized, "Your session has expired. Please sign in again."},
	{ErrImageRequired, fiber.StatusBadRequest, "Please choose an image to upload."},
	{ErrImageTooLarge, fiber.StatusRequestEntityTooLarge, "This image is too large. Please choose one under 5 MB."},
	{ErrInvalidType, fiber.StatusUnsupportedMediaType, "This file type isn't supported. Please use a JPEG, PNG, WEBP, or GIF image."},
	{ErrInvalidImage, fiber.StatusBadRequest, "This file doesn't look like a valid image. Please choose another one."},
	{ErrUploadFailed, fiber.StatusInternalServerError, "We couldn't upload your image. Please try again."},
	{ErrIDRequired, fiber.StatusBadRequest, "Please specify which image to delete."},
	{ErrDeleteFailed, fiber.StatusInternalServerError, "We couldn't delete the image. Please try again."},
	// 400, not 401: clients treat 401 as an expired session.
	{ErrInvalidCurrentPassword, fiber.StatusBadRequest, "Your current password is incorrect."},
}

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
					MsgInvalidBody,
				),
			)
	}

	// -------------------------
	// Application errors
	// -------------------------
	status := fiber.StatusInternalServerError
	message := MsgInternal

	if validationErr, ok := errors.AsType[*ValidationError](err); ok {
		status = fiber.StatusBadRequest
		message = validationErr.Message
	} else {
		for _, appErr := range appErrors {
			if errors.Is(err, appErr.err) {
				status = appErr.status
				message = appErr.message
				break
			}
		}
	}

	if status == fiber.StatusUnauthorized {
		ctx.Set(fiber.HeaderWWWAuthenticate, "Bearer")
	}

	return ctx.
		Status(status).
		JSON(response.Error(
			status,
			message,
		))
}

// fieldLabels overrides the label derived from a field's JSON name.
var fieldLabels = map[string]string{
	"category_id": "Category",
	"to_status":   "Status",
}

// fieldLabel turns a JSON field name such as "display_name" into "Display name".
func fieldLabel(field string) string {
	if label, ok := fieldLabels[field]; ok {
		return label
	}
	label := strings.ReplaceAll(field, "_", " ")
	if label == "" {
		return "This field"
	}
	return strings.ToUpper(label[:1]) + label[1:]
}

func validationMessage(err validator.FieldError) string {
	label := fieldLabel(err.Field())
	isList := err.Kind() == reflect.Slice || err.Kind() == reflect.Array

	switch err.Tag() {
	case "required":
		if isList {
			return "Please add at least one item to " + strings.ToLower(label) + "."
		}
		return label + " is required."
	case "notblank":
		return label + " can't be blank."
	case "email":
		return "Please enter a valid email address."
	case "min":
		if isList {
			return "Please add at least " + err.Param() + " " + strings.ToLower(label) + "."
		}
		return label + " must be at least " + err.Param() + " characters long."
	case "max":
		if isList {
			return "You can add up to " + err.Param() + " " + strings.ToLower(label) + "."
		}
		return label + " can't be longer than " + err.Param() + " characters."
	case "oneof":
		return label + " must be one of: " + strings.ReplaceAll(err.Param(), " ", ", ") + "."
	case "nefield":
		return label + " must be different from your current password."
	default:
		return label + " isn't valid."
	}
}
