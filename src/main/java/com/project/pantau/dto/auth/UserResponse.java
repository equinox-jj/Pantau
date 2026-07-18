package com.project.pantau.dto.auth;

import com.project.pantau.enums.UserRole;
import lombok.Builder;

import java.time.LocalDateTime;
import java.util.UUID;

@Builder
public record UserResponse(
        UUID uuid,
        String email,
        String displayName,
        UserRole role,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
) {
}
