package com.project.pantau.dto.category;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public record CreateCategoryRequest(
        @NotBlank
        @Size(max = 100)
        String name,

        @NotBlank
        @Pattern(
                regexp = "^[a-z0-9]+(-[a-z0-9]+)*$",
                message = "slug must be lowercase kebab-case"
        )
        String slug
) {
}
