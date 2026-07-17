package com.project.pantau.dto.auth;

import lombok.Builder;

@Builder
public record AuthResponse(
        String token,
        Long expiresIn,
        UserResponse userResponse
) {
}
