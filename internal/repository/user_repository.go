package repository

import (
	"context"
	"errors"
	"log/slog"
	"pantau/internal/entity"

	apperror "pantau/pkg/errors"

	"gorm.io/gorm"
)

type UserRepository interface {
	Create(ctx context.Context, user *entity.User) error
	FindByEmail(ctx context.Context, email string) (*entity.User, error)
	ExistsByEmail(ctx context.Context, email string) (bool, error)
}

type userRepositoryImpl struct {
	db *gorm.DB
}

func NewUserRepository(db *gorm.DB) UserRepository {
	return &userRepositoryImpl{db: db}
}

func (r *userRepositoryImpl) Create(
	ctx context.Context,
	user *entity.User,
) error {
	if err := r.db.
		WithContext(ctx).
		Create(user).
		Error; err != nil {
		slog.Error("[UserRepository] Failed to create user", "email", user.Email, "error", err)
		return err
	}
	return nil
}

func (r *userRepositoryImpl) FindByEmail(ctx context.Context, email string) (*entity.User, error) {
	var user entity.User

	if err := r.db.
		WithContext(ctx).
		Where("email = ?", email).
		First(&user).
		Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			slog.Error("[UserRepository] User not found by email", "email", email, "error", err)
			return nil, apperror.ErrEmailNotFound
		}

		slog.Error("[UserRepository] Failed to find user by email", "email", email, "error", err)
		return nil, err
	}

	return &user, nil
}

func (r *userRepositoryImpl) ExistsByEmail(ctx context.Context, email string) (bool, error) {
	var count int64

	if err := r.db.
		WithContext(ctx).
		Model(&entity.User{}).
		Where("email = ?", email).
		Count(&count).
		Error; err != nil {
		slog.Error("[UserRepository] Failed to check if user exists by email", "email", email, "error", err)
		return false, err
	}

	return count > 0, nil
}
