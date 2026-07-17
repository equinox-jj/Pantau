package com.project.pantau.dto.auth;

import com.project.pantau.enums.UserRole;
import lombok.Builder;

import java.time.OffsetDateTime;
import java.util.UUID;

@Builder
public record UserResponse(
        UUID uuid,
        String email,
        String username,
        UserRole role,
        OffsetDateTime createdAt,
        OffsetDateTime updatedAt
) {
}
