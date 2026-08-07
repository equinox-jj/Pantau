package com.project.pantau.enums;

import java.util.List;

public enum QueueTab {
    OPEN(List.of(ReportStatus.REPORTED, ReportStatus.ACKNOWLEDGED)),
    IN_PROGRESS(List.of(ReportStatus.IN_PROGRESS)),
    RESOLVED(List.of(ReportStatus.RESOLVED));

    private final List<ReportStatus> statuses;

    QueueTab(List<ReportStatus> statuses) {
        this.statuses = statuses;
    }

    public List<ReportStatus> statuses() {
        return statuses;
    }
}
