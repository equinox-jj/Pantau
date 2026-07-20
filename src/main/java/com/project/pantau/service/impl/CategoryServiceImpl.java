package com.project.pantau.service.impl;

import com.project.pantau.common.exception.ResourceNotFoundException;
import com.project.pantau.dto.category.CategoryResponse;
import com.project.pantau.mapper.CategoryMapper;
import com.project.pantau.repository.CategoryRepository;
import com.project.pantau.service.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepository categoryRepository;
    private final CategoryMapper categoryMapper;

    @Override
    @Transactional(readOnly = true)
    public List<CategoryResponse> getActiveCategories() {
        return categoryRepository.findByIsActiveTrueOrderByIdAsc()
                .stream()
                .map(categoryMapper::toResponse)
                .toList();
    }

    @Override
    @Transactional(readOnly = true)
    public CategoryResponse getCategoryById(Long id) {
        var category = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Cannot find category with id: " + id));

        return categoryMapper.toResponse(category);
    }

    @Override
    @Transactional(readOnly = true)
    public CategoryResponse getCategoryBySlug(String slug) {
        var category = categoryRepository.findBySlug(slug)
                .orElseThrow(() -> new ResourceNotFoundException("Cannot find category with slug: " + slug));

        return categoryMapper.toResponse(category);
    }
}
