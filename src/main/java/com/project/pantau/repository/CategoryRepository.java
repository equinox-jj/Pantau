package com.project.pantau.repository;

import com.project.pantau.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    List<Category> findByIsActiveTrueOrderByIdAsc();

    Optional<Category> findBySlug(String slug);
}
