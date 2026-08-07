package com.project.pantau.dto.report;

import com.project.pantau.dto.category.CategoryResponse;
import com.project.pantau.enums.ReportStatus;
import lombok.Builder;

import java.time.LocalDateTime;
import java.util.UUID;

@Builder
public record QueueReportResponse(
        UUID id,
        CategoryResponse category,
        String description,
        String photoUrl,
        ReportStatus status,
        Double latitude,
        Double longitude,
        Double distanceMeter,
        LocalDateTime createdAt
) {
}
