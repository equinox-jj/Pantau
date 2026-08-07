package com.project.pantau.dto.report;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.springframework.web.multipart.MultipartFile;

public record UpdateReportRequest(
        @NotNull(message = "Category id cannot be null")
        Long categoryId,

        @Size(max = 2000, message = "Maximum report description is 2000 characters")
        String description,

        MultipartFile photo,

        @NotNull(message = "Latitude cannot be null")
        Double latitude,

        @NotNull(message = "Longitude cannot be null")
        Double longitude
) {
}
