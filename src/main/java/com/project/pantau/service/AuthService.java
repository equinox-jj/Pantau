package com.project.pantau.service;

import com.project.pantau.dto.auth.AuthResponse;
import com.project.pantau.dto.auth.LoginRequest;
import com.project.pantau.dto.auth.RegisterRequest;

public interface AuthService {
    AuthResponse register(RegisterRequest request);

    AuthResponse login(LoginRequest request);
}
