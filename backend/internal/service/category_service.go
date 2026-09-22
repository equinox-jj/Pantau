package service

import (
	"context"
	"pantau/internal/dto/category"
	"pantau/internal/dto/mapper"
	"pantau/internal/repository"
)

type CategoryService interface {
	GetActiveCategories(ctx context.Context) ([]category.CategoryResponse, error)
	GetCategoryByID(ctx context.Context, id int64) (*category.CategoryResponse, error)
	GetCategoryBySlug(ctx context.Context, slug string) (*category.CategoryResponse, error)
}

type categoryServiceImpl struct {
	categoryRepo repository.CategoryRepository
}

func NewCategoryService(categoryRepo repository.CategoryRepository) CategoryService {
	return &categoryServiceImpl{categoryRepo: categoryRepo}
}

func (sv *categoryServiceImpl) GetActiveCategories(ctx context.Context) ([]category.CategoryResponse, error) {
	categories, err := sv.categoryRepo.FindActive(ctx)
	if err != nil {
		return nil, err
	}

	return mapper.CategoriesToResponse(categories), nil
}

func (sv *categoryServiceImpl) GetCategoryByID(ctx context.Context, id int64) (*category.CategoryResponse, error) {
	cat, err := sv.categoryRepo.FindByID(ctx, id)
	if err != nil {
		return nil, err
	}

	return mapper.CategoryToResponse(cat), nil
}

func (sv *categoryServiceImpl) GetCategoryBySlug(ctx context.Context, slug string) (*category.CategoryResponse, error) {
	cat, err := sv.categoryRepo.FindBySlug(ctx, slug)
	if err != nil {
		return nil, err
	}

	return mapper.CategoryToResponse(cat), nil
}
