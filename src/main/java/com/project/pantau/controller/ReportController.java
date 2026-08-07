package com.project.pantau.controller;

import com.project.pantau.common.response.ApiResponse;
import com.project.pantau.common.response.PagedResponse;
import com.project.pantau.common.security.CustomUserDetails;
import com.project.pantau.dto.report.*;
import com.project.pantau.dto.report_status.ReportStatusResponse;
import com.project.pantau.service.ReportService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("api/v1/reports")
@RequiredArgsConstructor
public class ReportController {
    private final ReportService reportService;

    @PreAuthorize("hasRole('CITIZEN')")
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<ApiResponse<ReportResponse>> createReport(
            @AuthenticationPrincipal CustomUserDetails userDetails,
            @Valid @ModelAttribute CreateReportRequest request
    ) {
        var response = reportService.createReport(userDetails.user(), request);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ApiResponse<>(
                        true,
                        "Successfully created report",
                        response
                ));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<ReportResponse>> getReportDetail(@PathVariable UUID id) {
        var response = reportService.getReportDetail(id);
        return ResponseEntity.ok(new ApiResponse<>(
                true,
                "Successfully retrieved report",
                response
        ));
    }

    @GetMapping("/{id}/history")
    public ResponseEntity<ApiResponse<List<ReportStatusResponse>>> getReportHistory(@PathVariable UUID id) {
        var response = reportService.getReportHistory(id);
        return ResponseEntity.ok(new ApiResponse<>(
                true,
                "Successfully retrieved report history",
                response
        ));
    }

    @GetMapping("/nearby")
    public ResponseEntity<ApiResponse<List<NearbyReportResponse>>> getNearbyReports(
            @RequestParam(name = "lat") double latitude,
            @RequestParam(name = "lng") double longitude,
            @RequestParam(name = "radius_meter", defaultValue = "1000") int radiusMeter,
            @RequestParam(name = "limit", defaultValue = "20") int limit
    ) {
        var response = reportService.getNearbyReports(
                latitude,
                longitude,
                radiusMeter,
                limit
        );
        return ResponseEntity.ok(new ApiResponse<>(
                true,
                "Successfully retrieved nearby reports",
                response
        ));
    }

    @PreAuthorize("hasRole('CITIZEN')")
    @GetMapping("/mine")
    public ResponseEntity<ApiResponse<PagedResponse<ReportResponse>>> getMyReports(
            @AuthenticationPrincipal CustomUserDetails userDetails,
            @RequestParam(defaultValue = "20") int limit,
            @RequestParam(defaultValue = "0") int offset
    ) {
        var response = reportService.getMyReports(
                userDetails.user(),
                limit,
                offset
        );
        return ResponseEntity.ok(new ApiResponse<>(
                true,
                "Successfully retrieved my reports",
                response
        ));
    }

    @PreAuthorize("hasRole('CITIZEN')")
    @PatchMapping(value = "/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<ApiResponse<ReportResponse>> updateReport(
            @AuthenticationPrincipal CustomUserDetails userDetails,
            @PathVariable UUID id,
            @Valid @ModelAttribute UpdateReportRequest request
    ) {
        var response = reportService.updateReport(id, userDetails.user(), request);
        return ResponseEntity.ok(new ApiResponse<>(
                true,
                "Successfully updated report",
                response
        ));
    }

    @PreAuthorize("hasRole('CITIZEN')")
    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse<Void>> deleteReport(
            @AuthenticationPrincipal CustomUserDetails userDetails,
            @PathVariable UUID id
    ) {
        reportService.deleteReport(id, userDetails.user());
        return ResponseEntity.ok(new ApiResponse<>(
                true,
                "Successfully deleted report",
                null
        ));
    }

    @PreAuthorize("hasRole('RESOLVER')")
    @PatchMapping("/{id}/status")
    public ResponseEntity<ApiResponse<ReportResponse>> updateReportStatus(
            @AuthenticationPrincipal CustomUserDetails userDetails,
            @PathVariable UUID id,
            @Valid @RequestBody UpdateStatusRequest request
    ) {
        var response = reportService.updateReportStatus(
                id,
                userDetails.user(),
                request
        );
        return ResponseEntity.ok(new ApiResponse<>(
                true,
                "Successfully updated report status",
                response
        ));
    }
}
