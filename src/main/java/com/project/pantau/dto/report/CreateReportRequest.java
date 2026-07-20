package com.project.pantau.dto.report;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.springframework.web.multipart.MultipartFile;

public record CreateReportRequest(
        @NotNull
        Long categoryId,

        @Size(max = 2000)
        String description,

        @NotNull
        MultipartFile photo,

        @NotNull
        Double latitude,

        @NotNull
        Double longitude
) {
}
