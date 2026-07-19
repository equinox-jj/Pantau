package com.project.pantau.dto.upload;

import lombok.Builder;

import java.time.LocalDateTime;

@Builder
public record UploadResponse(
        String id,
        String url,
        LocalDateTime createdAt
) {
}
