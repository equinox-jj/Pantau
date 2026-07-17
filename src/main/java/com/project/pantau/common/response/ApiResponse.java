package com.project.pantau.common.response;

public record ApiResponse<T>(
        boolean status,
        String message,
        T data
) {
}
