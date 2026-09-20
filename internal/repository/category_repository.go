package repository

import (
	"context"
	"errors"
	"log/slog"
	"pantau/internal/entity"

	"gorm.io/gorm"

	apperror "pantau/pkg/errors"
)

type CategoryRepository interface {
	FindActive(ctx context.Context) ([]entity.Category, error)
	FindBySlug(ctx context.Context, slug string) (*entity.Category, error)
}

type categoryRepositoryImpl struct {
	db *gorm.DB
}

func NewCategoryRepository(db *gorm.DB) CategoryRepository {
	return &categoryRepositoryImpl{
		db: db,
	}
}

func (repo *categoryRepositoryImpl) FindActive(ctx context.Context) ([]entity.Category, error) {
	var categories []entity.Category

	if err := repo.db.WithContext(ctx).
		Where("is_active = ?", true).
		Order("id ASC").
		Find(&categories).
		Error; err != nil {
		slog.ErrorContext(ctx, "[CategoryRepository.FindActive] Failed to find active categories", "error", err)
		return nil, err
	}

	return categories, nil
}

func (repo *categoryRepositoryImpl) FindBySlug(ctx context.Context, slug string) (*entity.Category, error) {
	var category entity.Category

	if err := repo.db.WithContext(ctx).
		Where("slug = ?", slug).
		First(&category).
		Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			slog.ErrorContext(ctx, "[CategoryRepository.FindBySlug] Category not found by slug", "slug", slug, "error", err)
			return nil, apperror.ErrCategoryNotFound
		}
		slog.ErrorContext(ctx, "[CategoryRepository.FindBySlug] Failed to find category by slug", "slug", slug, "error", err)
		return nil, err
	}

	return &category, nil
}
