package com.project.pantau.common.response;

public record PageMeta(
        int limit,
        long offset,
        long total,
        boolean hasNext
) {
}
