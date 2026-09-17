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

func (service *authServiceImpl) Login(ctx context.Context, req auth.LoginRequest) (*auth.AuthResponse, error) {
	user, err := service.userRepo.FindByEmail(ctx, req.Email)
	if err != nil {
		slog.Error("[AuthService] Failed to find user by email", "email", req.Email, "error", err)
		return nil, err
	}
	if user == nil {
		slog.Error("[AuthService] User not found by email", "email", req.Email, "error", err)
		return nil, apperror.ErrEmailNotFound
	}

	if err := service.passHasher.Compare(
		user.Password,
		req.Password,
	); err != nil {
		slog.Error("[AuthService] Failed to compare password", "email", req.Email, "error", err)
		return nil, apperror.ErrInvalidEmailOrPassword
	}

	return service.buildAuthResponse(user)
}

func (service *authServiceImpl) Register(ctx context.Context, req auth.RegisterRequest) (*auth.AuthResponse, error) {
	exists, err := service.userRepo.ExistsByEmail(ctx, req.Email)
	if err != nil {
		slog.Error("[AuthService] Failed to check if user exists by email", "email", req.Email, "error", err)
		return nil, err
	}
	if exists {
		slog.Error("[AuthService] User already exists", "email", req.Email, "error", err)
		return nil, apperror.ErrEmailAlreadyExists
	}

	hashedPassword, err := service.passHasher.Hash(req.Password)
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
	if err := service.userRepo.Create(ctx, user); err != nil {
		slog.Error("[AuthService] Failed to create user", "email", req.Email, "error", err)
		return nil, err
	}

	return service.buildAuthResponse(user)
}

func (service *authServiceImpl) buildAuthResponse(user *entity.User) (*auth.AuthResponse, error) {
	token, err := service.jwtService.GenerateToken(user)
	if err != nil {
		slog.Error("[AuthService] Failed to generate token", "email", user.Email, "error", err)
		return nil, err
	}

	return &auth.AuthResponse{
		AccessToken: token,
		ExpiresIn:   service.jwtService.ExpirationSeconds(),
		User: auth.AuthUserInfo{
			ID:          user.ID,
			Email:       user.Email,
			DisplayName: user.DisplayName,
			Role:        string(user.Role),
		},
	}, nil
}
