package com.project.pantau.dto.report;

import com.project.pantau.dto.category.CategoryResponse;
import com.project.pantau.enums.ReportStatus;
import lombok.Builder;

import java.time.LocalDateTime;
import java.util.UUID;

@Builder
public record ReportResponse(
        UUID id,
        CategoryResponse category,
        String description,
        String photoUrl,
        Double latitude,
        Double longitude,
        ReportStatus status,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
) {
}
