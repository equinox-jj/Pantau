package errors

import "fmt"

// Validation wraps ErrValidation with a descriptive message.
func Validation(message string) error {
	return fmt.Errorf("%w: %s", ErrValidation, message)
}
