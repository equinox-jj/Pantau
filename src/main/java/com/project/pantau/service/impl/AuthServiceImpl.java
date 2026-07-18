package com.project.pantau.service.impl;

import com.project.pantau.common.config.JwtProperties;
import com.project.pantau.common.exception.EmailAlreadyExistsException;
import com.project.pantau.common.exception.ResourceNotFoundException;
import com.project.pantau.common.security.CustomUserDetails;
import com.project.pantau.common.security.JwtService;
import com.project.pantau.dto.auth.AuthResponse;
import com.project.pantau.dto.auth.LoginRequest;
import com.project.pantau.dto.auth.RegisterRequest;
import com.project.pantau.entity.User;
import com.project.pantau.enums.UserRole;
import com.project.pantau.mapper.AuthMapper;
import com.project.pantau.repository.UserRepository;
import com.project.pantau.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {
    private final UserRepository userRepository;

    private final JwtService jwtService;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;
    private final AuthMapper authMapper;
    private final JwtProperties jwtProperties;

    @Override
    @Transactional
    public AuthResponse register(RegisterRequest request) {
        if (userRepository.existsByEmail(request.email())) {
            throw new EmailAlreadyExistsException("An account with the email address already exists.");
        }

        User user = User.builder()
                .email(request.email())
                .password(passwordEncoder.encode(request.password()))
                .displayName(request.displayName())
                .role(UserRole.CITIZEN)
                .build();
        User savedUser = userRepository.saveAndFlush(user);

        return buildAuthResponse(savedUser);
    }

    @Override
    @Transactional(readOnly = true)
    public AuthResponse login(LoginRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.email(),
                        request.password()
                )
        );
        User user = userRepository.findByEmail(request.email())
                .orElseThrow(() -> new ResourceNotFoundException("Cannot find user with email: " + request.email()));

        return buildAuthResponse(user);
    }

    private AuthResponse buildAuthResponse(User user) {
        CustomUserDetails userDetails = new CustomUserDetails(user);
        List<String> roles = userDetails.getAuthorities()
                .stream()
                .map(GrantedAuthority::getAuthority)
                .toList();
        Map<String, Object> claims = Map.of(
                "uid", user.getId(),
                "email", user.getEmail(),
                "role", roles
        );
        String token = jwtService.generateToken(claims, userDetails);

        return authMapper.toResponse(
                token,
                jwtProperties.expiration(),
                user
        );
    }
}
