package com.project.pantau.dto.report;

import lombok.Builder;

@Builder
public record QueueCounts(
        long open,
        long inProgress,
        long resolved
) {
}
