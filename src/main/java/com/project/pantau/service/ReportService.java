package com.project.pantau.service;

import com.project.pantau.common.response.PagedResponse;
import com.project.pantau.dto.report.CreateReportRequest;
import com.project.pantau.dto.report.NearbyReportResponse;
import com.project.pantau.dto.report.ReportResponse;
import com.project.pantau.dto.report.UpdateStatusRequest;
import com.project.pantau.dto.report_status.ReportStatusResponse;
import com.project.pantau.entity.User;

import java.util.List;
import java.util.UUID;

public interface ReportService {
    ReportResponse createReport(
            User reporter,
            CreateReportRequest request
    );

    List<NearbyReportResponse> getNearbyReports(
            double latitude,
            double longitude,
            int radiusMeter,
            int limit
    );

    ReportResponse getReportDetail(UUID id);

    List<ReportStatusResponse> getReportHistory(UUID id);

    PagedResponse<ReportResponse> getMyReports(
            User reporter,
            int limit,
            int offset
    );

    ReportResponse updateReportStatus(
            UUID id,
            User resolver,
            UpdateStatusRequest request
    );
}
