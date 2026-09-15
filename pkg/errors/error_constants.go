package errors

import "errors"

var (
	ErrEmailNotFound error = errors.New("email not found")
)
