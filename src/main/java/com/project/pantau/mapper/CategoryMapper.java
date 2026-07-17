package com.project.pantau.mapper;

import com.project.pantau.dto.category.CategoryResponse;
import com.project.pantau.entity.Category;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(config = MapStructConfig.class)
public interface CategoryMapper {
    CategoryResponse toResponse(Category category);

    List<CategoryResponse> toResponse(List<Category> categories);
}
