package validator

import (
	"log/slog"
	"reflect"
	"strings"

	playground "github.com/go-playground/validator/v10"
	"github.com/go-playground/validator/v10/non-standard/validators"
)

type structValidator struct {
	validate *playground.Validate
}

func NewStructValidator() *structValidator {
	v := playground.New()
	if err := v.RegisterValidation("notblank", validators.NotBlank); err != nil {
		panic(err)
	}

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

	return &structValidator{
		validate: v,
	}
}

func (v *structValidator) Validate(out any) error {
	if err := v.validate.Struct(out); err != nil {
		slog.Error("[Validator] Failed to validate struct", "error", err)
		return err
	}
	return nil
}
