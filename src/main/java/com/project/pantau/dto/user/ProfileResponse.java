package com.project.pantau.dto.user;

import lombok.Builder;

import java.time.LocalDateTime;
import java.util.UUID;

@Builder
public record ProfileResponse(
        UUID id,
        String displayName,
        LocalDateTime joinedAt,
        long reportsCount,
        long resolvedCount
) {
}
