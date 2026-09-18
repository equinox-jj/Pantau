package errors

import "errors"

var (
	ErrUnauthorized            error = errors.New("unauthorized")
	ErrForbidden               error = errors.New("forbidden")
	ErrUserNotFound            error = errors.New("user not found")
	ErrReportNotFound          error = errors.New("report not found")
	ErrInvalidLimit            error = errors.New("limit must be non-negative")
	ErrInvalidPagination       error = errors.New("limit must be positive and offset must be non-negative")
	ErrEmailNotFound           error = errors.New("email not found")
	ErrEmailAlreadyExists      error = errors.New("an account with the email address already exists")
	ErrInvalidEmailOrPassword  error = errors.New("invalid email or password")
	ErrInvalidToken            error = errors.New("invalid token")
	ErrUnexpectedSigningMethod error = errors.New("unexpected JWT signing method")
)
