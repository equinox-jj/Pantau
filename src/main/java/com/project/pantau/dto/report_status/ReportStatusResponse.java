package com.project.pantau.dto.report_status;

import com.project.pantau.enums.ReportStatus;
import com.project.pantau.enums.UserRole;
import lombok.Builder;

import java.time.OffsetDateTime;
import java.util.UUID;

@Builder
public record ReportStatusResponse(
        UUID id,
        ReportStatus fromStatus,
        ReportStatus toStatus,
        String note,
        UserRole actorRole,
        OffsetDateTime createdAt
) {
}
