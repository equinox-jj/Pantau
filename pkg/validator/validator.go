package validator

import (
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
		name := strings.SplitN(
			field.Tag.Get("json"),
			",",
			2,
		)[0]

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
	return v.validate.Struct(out)
}
