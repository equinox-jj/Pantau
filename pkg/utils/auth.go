package utils

import (
	"log/slog"
	"pantau/internal/entity"
	"pantau/internal/enums"
	apperror "pantau/pkg/errors"
	"slices"

	"github.com/gofiber/fiber/v3"
	"github.com/google/uuid"
)

// principalKey is a private context key that avoids collisions with other local keys.
type principalKey struct{}

// principal holds the authenticated user's current identity and role from the repository.
type principal struct {
	ID    uuid.UUID
	Email string
	Role  enums.UserRole
}

// SetCurrentUser stores the authenticated identity without credentials.
func SetCurrentUser(ctx fiber.Ctx, id uuid.UUID, email string, role enums.UserRole) {
	ctx.Locals(principalKey{}, principal{ID: id, Email: email, Role: role})
}

// RequireRoles allows an authenticated user with any of the supplied roles to
// continue. Register it after Authenticate so a principal is available.
// It returns ErrUnauthorized when no principal is present and ErrForbidden
// when the user's role is not allowed. An empty role list allows no users.
func RequireRoles(roles ...enums.UserRole) fiber.Handler {
	return func(ctx fiber.Ctx) error {
		user, ok := CurrentUser(ctx)
		if !ok {
			slog.Error("[GAT] User not found", "user", user)
			return apperror.ErrUnauthorized
		}
		if slices.Contains(roles, user.Role) {
			return ctx.Next()
		}
		slog.Error("[GAT] User does not have access", "user", user)
		return apperror.ErrForbidden
	}
}

// CurrentUser returns the authenticated identity needed by application services.
// It exposes a copy without leaking the private principal key or credentials.
// It returns nil and false if the local value is absent or has an unexpected type.
func CurrentUser(ctx fiber.Ctx) (*entity.User, bool) {
	user, ok := ctx.Locals(principalKey{}).(principal)
	if !ok {
		return nil, false
	}
	return &entity.User{ID: user.ID, Email: user.Email, Role: user.Role}, true
}
