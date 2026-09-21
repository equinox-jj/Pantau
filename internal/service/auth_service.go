package service

import (
	"context"
	"log/slog"
	"pantau/internal/dto/auth"
	"pantau/internal/entity"
	"pantau/internal/repository"
	apperror "pantau/pkg/errors"
	"pantau/pkg/security"

	"github.com/google/uuid"
)

type AuthService interface {
	Register(ctx context.Context, req auth.RegisterRequest) (*auth.AuthResponse, error)
	Login(ctx context.Context, req auth.LoginRequest) (*auth.AuthResponse, error)
}

type authServiceImpl struct {
	userRepo   repository.UserRepository
	jwtService security.JwtService
	passHasher security.PasswordHasher
}

func NewAuthService(
	userRepo repository.UserRepository,
	jwtService security.JwtService,
	passHasher security.PasswordHasher,
) AuthService {
	return &authServiceImpl{
		userRepo:   userRepo,
		jwtService: jwtService,
		passHasher: passHasher,
	}
}

func (sv *authServiceImpl) Login(ctx context.Context, req auth.LoginRequest) (*auth.AuthResponse, error) {
	user, err := sv.userRepo.FindByEmail(ctx, req.Email)
	if err != nil {
		slog.Error("[AuthService] Failed to find user by email", "email", req.Email, "error", err)
		return nil, err
	}
	if user == nil {
		slog.Error("[AuthService] User not found by email", "email", req.Email, "error", err)
		return nil, apperror.ErrEmailNotFound
	}

	if err := sv.passHasher.Compare(
		user.Password,
		req.Password,
	); err != nil {
		slog.Error("[AuthService] Failed to compare password", "email", req.Email, "error", err)
		return nil, apperror.ErrInvalidEmailOrPassword
	}

	return sv.buildAuthResponse(user)
}

func (sv *authServiceImpl) Register(ctx context.Context, req auth.RegisterRequest) (*auth.AuthResponse, error) {
	exists, err := sv.userRepo.ExistsByEmail(ctx, req.Email)
	if err != nil {
		slog.Error("[AuthService] Failed to check if user exists by email", "email", req.Email, "error", err)
		return nil, err
	}
	if exists {
		slog.Error("[AuthService] User already exists", "email", req.Email, "error", err)
		return nil, apperror.ErrEmailAlreadyExists
	}

	hashedPassword, err := sv.passHasher.Hash(req.Password)
	if err != nil {
		slog.Error("[AuthService] Failed to hash password", "email", req.Email, "error", err)
		return nil, err
	}

	user := &entity.User{
		ID:          uuid.New(),
		Email:       req.Email,
		Password:    hashedPassword,
		DisplayName: req.DisplayName,
		Role:        entity.RoleCitizen,
	}
	if err := sv.userRepo.Create(ctx, user); err != nil {
		slog.Error("[AuthService] Failed to create user", "email", req.Email, "error", err)
		return nil, err
	}

	return sv.buildAuthResponse(user)
}

func (sv *authServiceImpl) buildAuthResponse(user *entity.User) (*auth.AuthResponse, error) {
	token, err := sv.jwtService.GenerateToken(user)
	if err != nil {
		slog.Error("[AuthService] Failed to generate token", "email", user.Email, "error", err)
		return nil, err
	}

	return &auth.AuthResponse{
		Token:     token,
		ExpiresIn: sv.jwtService.ExpirationSeconds(),
		UserResponse: auth.UserResponse{
			ID:          user.ID,
			Email:       user.Email,
			DisplayName: user.DisplayName,
			Role:        user.Role,
			CreatedAt:   user.CreatedAt,
			UpdatedAt:   user.UpdatedAt,
		},
	}, nil
}
