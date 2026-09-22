package mapper

import (
	"pantau/internal/dto/category"
	"pantau/internal/entity"
)

func CategoryToResponse(cat *entity.Category) *category.CategoryResponse {
	if cat == nil {
		return nil
	}
	return &category.CategoryResponse{
		ID:       cat.ID,
		Name:     cat.Name,
		Slug:     cat.Slug,
		IsActive: cat.IsActive,
	}
}

func CategoriesToResponse(categories []entity.Category) []category.CategoryResponse {
	if categories == nil {
		return nil
	}
	responses := make([]category.CategoryResponse, len(categories))
	for i := range categories {
		responses[i] = *CategoryToResponse(&categories[i])
	}
	return responses
}
