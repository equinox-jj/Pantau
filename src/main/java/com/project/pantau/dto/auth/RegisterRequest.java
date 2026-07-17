package com.project.pantau.dto.auth;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record RegisterRequest(
        @NotBlank(message = "Email is mandatory")
        @Email
        String email,

        @NotBlank(message = "Display name is mandatory")
        @Size(max = 100)
        String displayName,

        @NotBlank(message = "Password is mandatory")
        @Size(min = 8, max = 72)
        String password
) {
}
