package com.project.pantau.dto.auth;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record RegisterRequest(
        @NotBlank(message = "Email is mandatory")
        @Email(message = "Please enter a valid email address")
        String email,

        @NotBlank(message = "Display name is mandatory")
        @Size(max = 50, message = "Maximum display name is 50 characters")
        String displayName,

        @NotBlank(message = "Password is mandatory")
        @Size(min = 8, max = 50, message = "Password must be between 8 and 50 characters")
        String password
) {
}
