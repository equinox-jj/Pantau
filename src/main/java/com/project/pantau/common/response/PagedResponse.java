package com.project.pantau.common.response;

import java.util.List;

public record PagedResponse<T>(
        List<T> items,
        PageMeta meta
) {
}
