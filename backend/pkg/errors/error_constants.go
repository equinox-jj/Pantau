package errors

import "errors"

var (
	ErrValidation                    = errors.New("validation failed")
	ErrIllegalTransition             = errors.New("illegal report status transition")
	ErrUnauthorized            error = errors.New("unauthorized")
	ErrForbidden               error = errors.New("forbidden")
	ErrUserNotFound            error = errors.New("user not found")
	ErrCategoryNotFound        error = errors.New("category not found")
	ErrReportNotFound          error = errors.New("report not found")
	ErrInvalidLimit            error = errors.New("limit must be non-negative")
	ErrInvalidPagination       error = errors.New("limit must be positive and offset must be non-negative")
	ErrEmailNotFound           error = errors.New("email not found")
	ErrEmailAlreadyExists      error = errors.New("an account with the email address already exists")
	ErrInvalidEmailOrPassword  error = errors.New("invalid email or password")
	ErrInvalidToken            error = errors.New("invalid token")
	ErrUnexpectedSigningMethod error = errors.New("unexpected JWT signing method")
	ErrImageRequired           error = errors.New("image is required")
	ErrImageTooLarge           error = errors.New("maximum image size is 5MB")
	ErrInvalidType             error = errors.New("only JPEG, PNG, WEBP, or GIF images are allowed")
	ErrInvalidImage            error = errors.New("the uploaded file is not a valid image")
	ErrUploadFailed            error = errors.New("failed to upload image")
	ErrIDRequired              error = errors.New("ID cannot be empty")
	ErrDeleteFailed            error = errors.New("failed to delete image")
)
