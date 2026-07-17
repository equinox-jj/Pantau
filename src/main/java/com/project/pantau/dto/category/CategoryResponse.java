package com.project.pantau.dto.category;

import lombok.Builder;

@Builder
public record CategoryResponse(
        Long id,
        String name,
        String slug,
        boolean isActive
) {
}
