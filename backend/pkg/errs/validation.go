package errs

// ValidationError carries a user-facing message and matches ErrValidation via
// errors.Is, so callers can still check the category.
type ValidationError struct {
	Message string
}

func (e *ValidationError) Error() string { return e.Message }

func (e *ValidationError) Unwrap() error { return ErrValidation }

// Validation returns a validation error whose message is shown to the user as-is.
func Validation(message string) error {
	return &ValidationError{Message: message}
}
