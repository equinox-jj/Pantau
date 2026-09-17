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

type principalKey struct{}

type principal struct {
	ID    uuid.UUID
	Email string
	Role  entity.UserRole
}

type GateawayAuth struct {
	jwtService security.JwtService
	users      repository.UserRepository
}

func NewGateawayAuth(
	jwtService security.JwtService,
	users repository.UserRepository,
) *GateawayAuth {
	return &GateawayAuth{
		jwtService: jwtService,
		users:      users,
	}
}

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

func RequireRoles(roles ...entity.UserRole) fiber.Handler {
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

func CurrentUser(ctx fiber.Ctx) (principal, bool) {
	user, ok := ctx.Locals(principalKey{}).(principal)
	return user, ok
}
