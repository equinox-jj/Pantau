package com.project.pantau.dto.report;

import com.project.pantau.common.response.PageMeta;
import lombok.Builder;

import java.util.List;

@Builder
public record QueueResponse(
        List<QueueReportResponse> items,
        PageMeta meta,
        QueueCounts counts
) {
}
