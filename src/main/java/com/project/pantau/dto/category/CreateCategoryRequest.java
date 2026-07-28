package com.project.pantau.dto.category;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public record CreateCategoryRequest(
        @NotBlank
        @Size(max = 50, message = "Maximum category name is 50 character")
        String name,

        @NotBlank
        @Pattern(
                regexp = "^[a-z0-9]+(-[a-z0-9]+)*$",
                message = "Slug must be lowercase kebab-case"
        )
        String slug
) {
}
