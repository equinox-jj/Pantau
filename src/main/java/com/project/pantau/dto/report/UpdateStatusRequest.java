package com.project.pantau.dto.report;

import com.project.pantau.enums.ReportStatus;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record UpdateStatusRequest(
        @NotNull(message = "To status cannot be null")
        ReportStatus toStatus,

        @Size(max = 1000, message = "Maximum note is 1000 characters")
        String note
) {
}
