package com.project.pantau.controller;

import com.project.pantau.common.response.ApiResponse;
import com.project.pantau.common.security.CustomUserDetails;
import com.project.pantau.dto.user.ProfileResponse;
import com.project.pantau.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/users")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/me")
    public ResponseEntity<ApiResponse<ProfileResponse>> getProfile(
            @AuthenticationPrincipal CustomUserDetails userDetails
    ) {
        var response = userService.getProfile(userDetails.user());
        return ResponseEntity.ok(new ApiResponse<>(
                true,
                "Successfully retrieved profile",
                response
        ));
    }
}
