package validator

import (
	"log/slog"
	"reflect"
	"strings"

	playground "github.com/go-playground/validator/v10"
)

type StructValidator struct {
	validate *playground.Validate
}

func NewStructValidator() *StructValidator {
	v := playground.New()
	v.RegisterTagNameFunc(func(field reflect.StructField) string {
		name, _, _ := strings.Cut(
			field.Tag.Get("json"),
			",",
		)

		if name == "-" {
			return ""
		}

		return name
	})

	return &StructValidator{
		validate: v,
	}
}

func (v *StructValidator) Validate(out any) error {
	if err := v.validate.Struct(out); err != nil {
		slog.Error("[Validator] Failed to validate struct", "error", err)
		return err
	}
	return nil
}
