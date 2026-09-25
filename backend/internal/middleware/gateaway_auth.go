// Package middleware provides request authentication and role-based access control.
package middleware

import (
	"log/slog"
	"pantau/internal/repository"
	"pantau/pkg/errs"
	"pantau/pkg/security"
	"pantau/pkg/utils"
	"strings"

	"github.com/gofiber/fiber/v3"
)

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
		return errs.ErrUnauthorized
	}

	claims, err := s.jwtService.ParseToken(header[1])
	if err != nil {
		slog.Error("[GAT] Invalid token", "error", err)
		return errs.ErrUnauthorized
	}
	// Use the stored user record so identity and role reflect current values.
	user, err := s.users.FindByID(ctx.Context(), claims.UserID)
	if err != nil {
		slog.Error("[GAT] Failed to get user", "error", err)
		return err
	}
	if user == nil {
		slog.Error("[GAT] User not found", "user", user)
		return errs.ErrUnauthorized
	}

	utils.SetCurrentUser(ctx, user)
	return ctx.Next()
}
