package repository

import (
	"context"
	"errors"
	"log/slog"
	"pantau/internal/entity"
	"pantau/pkg/errs"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type UserRepository interface {
	FindByID(ctx context.Context, id uuid.UUID) (*entity.User, error)
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

func (repo *userRepositoryImpl) FindByID(ctx context.Context, id uuid.UUID) (*entity.User, error) {
	var user entity.User
	if err := repo.db.WithContext(ctx).
		Where("id = ?", id).
		First(&user).
		Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			slog.Error("[UserRepository] User not found by id", "id", id, "error", err)
			return nil, errs.ErrUserNotFound
		}
		return nil, err
	}
	return &user, nil
}

func (repo *userRepositoryImpl) Create(
	ctx context.Context,
	user *entity.User,
) error {
	if err := repo.db.WithContext(ctx).
		Create(user).
		Error; err != nil {
		slog.Error("[UserRepository] Failed to create user", "email", user.Email, "error", err)
		return err
	}
	return nil
}

func (repo *userRepositoryImpl) FindByEmail(ctx context.Context, email string) (*entity.User, error) {
	var user entity.User

	if err := repo.db.WithContext(ctx).
		Where("email = ?", email).
		First(&user).
		Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			slog.Error("[UserRepository] User not found by email", "email", email, "error", err)
			return nil, errs.ErrEmailNotFound
		}

		slog.Error("[UserRepository] Failed to find user by email", "email", email, "error", err)
		return nil, err
	}

	return &user, nil
}

func (repo *userRepositoryImpl) ExistsByEmail(ctx context.Context, email string) (bool, error) {
	var count int64

	if err := repo.db.WithContext(ctx).
		Model(&entity.User{}).
		Where("email = ?", email).
		Count(&count).
		Error; err != nil {
		slog.Error("[UserRepository] Failed to check if user exists by email", "email", email, "error", err)
		return false, err
	}

	return count > 0, nil
}
