package errors

import "errors"

var (
	ErrEmailNotFound           error = errors.New("email not found")
	ErrEmailAlreadyExists      error = errors.New("an account with the email address already exists")
	ErrInvalidEmailOrPassword  error = errors.New("invalid email or password")
	ErrInvalidToken            error = errors.New("invalid token")
	ErrUnexpectedSigningMethod error = errors.New("unexpected JWT signing method")
)
