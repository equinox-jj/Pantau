package com.project.pantau.dto.report;

import com.project.pantau.enums.ReportStatus;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record UpdateStatusRequest(
        @NotNull
        ReportStatus toStatus,

        @Size(max = 1000)
        String note
) {
}
