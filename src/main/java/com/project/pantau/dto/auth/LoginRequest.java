package com.project.pantau.dto.auth;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public record LoginRequest(
        @NotBlank(message = "Email is mandatory")
        @Email
        String email,

        @NotBlank(message = "Password is mandatory")
        String password
) {
}
