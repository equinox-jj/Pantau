package repository

import (
	"context"
	"errors"
	"fmt"
	"pantau/internal/entity"

	apperr "pantau/pkg/errors"

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
	return r.db.
		WithContext(ctx).
		Create(user).
		Error
}

func (r *userRepositoryImpl) FindByEmail(ctx context.Context, email string) (*entity.User, error) {
	var user entity.User

	if err := r.db.
		WithContext(ctx).
		Where("email = ?", email).
		First(&user).
		Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, apperr.ErrEmailNotFound
		}

		return nil, fmt.Errorf("error find user by email: %w", err)
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
		return false, fmt.Errorf("error exists by email: %w", err)
	}

	return count > 0, nil
}
