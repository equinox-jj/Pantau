// Package pagination validates limit/offset pagination without normalizing input.
package pagination

import (
	"fmt"
	"pantau/pkg/errs"
)

// ValidateLimit requires a positive limit no greater than the supplied maximum.
func ValidateLimit(limit, maximum int) error {
	if limit <= 0 {
		return errs.Validation("Limit must be greater than 0")
	}
	if limit > maximum {
		return errs.Validation(fmt.Sprintf("Limit must not exceed %d", maximum))
	}
	return nil
}

// Validate checks the limit first, then requires a nonnegative offset.
func Validate(limit, offset, maximum int) error {
	if err := ValidateLimit(limit, maximum); err != nil {
		return err
	}
	if offset < 0 {
		return errs.Validation("Offset must not be negative")
	}
	return nil
}
