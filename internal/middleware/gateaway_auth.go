// Package middleware provides request authentication and role-based access control.
package middleware

import (
	"log/slog"
	"pantau/internal/entity"
	"pantau/internal/repository"
	apperror "pantau/pkg/errors"
	"pantau/pkg/security"
	"slices"
	"strings"

	"github.com/gofiber/fiber/v3"
	"github.com/google/uuid"
)

// principalKey is a private context key that avoids collisions with other local keys.
type principalKey struct{}

// principal holds the authenticated user's current identity and role from the repository.
type principal struct {
	ID    uuid.UUID
	Email string
	Role  entity.UserRole
}

// GateawayAuth authenticates requests using a JWT and the corresponding user record.
type GateawayAuth struct {
	jwtService security.JwtService
	users      repository.UserRepository
}

// NewGateawayAuth creates authentication middleware using the given services.
func NewGateawayAuth(
	jwtService security.JwtService,
	users repository.UserRepository,
) *GateawayAuth {
	return &GateawayAuth{
		jwtService: jwtService,
		users:      users,
	}
}

// Authenticate skips /api/v1/auth and its subpaths. For all other paths, it
// validates the Authorization bearer token, loads the user, and stores a
// principal in request locals before calling the next handler.
// It returns ErrUnauthorized for missing or invalid credentials or a missing
// user, and propagates repository errors to the application's error handler.
func (s *GateawayAuth) Authenticate(ctx fiber.Ctx) error {
	path := ctx.Path()
	if path == "/api/v1/auth" || strings.HasPrefix(path, "/api/v1/auth/") {
		return ctx.Next()
	}

	header := strings.Fields(ctx.Get(fiber.HeaderAuthorization))
	if len(header) != 2 || !strings.EqualFold(header[0], "Bearer") {
		slog.Error("[GAT] Invalid authorization header", slog.Any("header", header))
		return apperror.ErrUnauthorized
	}

	claims, err := s.jwtService.ParseToken(header[1])
	if err != nil {
		slog.Error("[GAT] Invalid token", "error", err)
		return apperror.ErrUnauthorized
	}
	// Use the stored user record so identity and role reflect current values.
	user, err := s.users.FindByID(ctx.Context(), claims.UserID)
	if err != nil {
		slog.Error("[GAT] Failed to get user", "error", err)
		return err
	}
	if user == nil {
		slog.Error("[GAT] User not found", "user", user)
		return apperror.ErrUnauthorized
	}

	ctx.Locals(
		principalKey{},
		principal{
			ID:    user.ID,
			Email: user.Email,
			Role:  user.Role,
		},
	)
	return ctx.Next()
}

// RequireRoles allows an authenticated user with any of the supplied roles to
// continue. Register it after Authenticate so a principal is available.
// It returns ErrUnauthorized when no principal is present and ErrForbidden
// when the user's role is not allowed. An empty role list allows no users.
func (s *GateawayAuth) RequireRoles(roles ...entity.UserRole) fiber.Handler {
	return func(ctx fiber.Ctx) error {
		user, ok := s.currentUser(ctx)
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

// CurrentUser retrieves the principal stored by Authenticate for this request.
// It returns a zero-value principal and false if the local value is absent or
// has an unexpected type.
func (GateawayAuth) currentUser(ctx fiber.Ctx) (principal, bool) {
	user, ok := ctx.Locals(principalKey{}).(principal)
	return user, ok
}
