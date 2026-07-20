package com.project.pantau.service.impl;

import com.project.pantau.common.exception.IllegalTransitionException;
import com.project.pantau.common.exception.ResourceNotFoundException;
import com.project.pantau.common.exception.ValidationException;
import com.project.pantau.common.utils.GeoUtils;
import com.project.pantau.common.utils.ReportStatusTransitions;
import com.project.pantau.dto.report.CreateReportRequest;
import com.project.pantau.dto.report.NearbyReportResponse;
import com.project.pantau.dto.report.ReportResponse;
import com.project.pantau.dto.report.UpdateStatusRequest;
import com.project.pantau.entity.Category;
import com.project.pantau.entity.Report;
import com.project.pantau.entity.ReportStatusHistory;
import com.project.pantau.entity.User;
import com.project.pantau.enums.ReportStatus;
import com.project.pantau.mapper.ReportMapper;
import com.project.pantau.repository.CategoryRepository;
import com.project.pantau.repository.ReportRepository;
import com.project.pantau.repository.ReportStatusRepository;
import com.project.pantau.service.ReportService;
import com.project.pantau.service.UploadService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ReportServiceImpl implements ReportService {
    private final ReportRepository reportRepository;
    private final ReportStatusRepository reportStatusRepository;
    private final CategoryRepository categoryRepository;
    private final UploadService uploadService;
    private final ReportMapper reportMapper;

    @Override
    public ReportResponse createReport(
            User reporter,
            CreateReportRequest request
    ) {
        validateCoordinates(request.latitude(), request.longitude());

        var category = categoryRepository.findById(request.categoryId())
                .orElseThrow(() -> new ResourceNotFoundException("Category not found with id: " + request.categoryId()));
        var upload = uploadService.upload(request.photo());

        try {
            return saveReportAndHistory(
                    reporter,
                    request,
                    category,
                    upload.url()
            );
        } catch (RuntimeException e) {
            uploadService.delete(upload.id());
            throw e;
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<NearbyReportResponse> getNearbyReports(
            double latitude,
            double longitude,
            int radiusMeter,
            int limit
    ) {
        validateCoordinates(latitude, longitude);

        if (radiusMeter <= 0) {
            throw new ValidationException("Radius must be greater than 0");
        }

        return reportRepository.findNearbyReport(latitude, longitude, radiusMeter, limit)
                .stream()
                .map(reportMapper::toNearbyResponse)
                .toList();
    }

    @Override
    @Transactional(readOnly = true)
    public ReportResponse getReportDetail(UUID id) {
        return reportMapper.toResponse(findReportById(id));
    }

    @Override
    public List<ReportResponse> getMyReports(
            User reporter,
            int limit,
            int offset
    ) {
        var page = PageRequest.of(
                offset / Math.max(limit, 1),
                limit,
                Sort.by(Sort.Direction.DESC, "createdAt")
        );

        return reportRepository.findByReporterId(reporter.getId(), page)
                .stream()
                .map(reportMapper::toResponse)
                .toList();
    }

    @Override
    public ReportResponse updateReportStatus(
            UUID id,
            User resolver,
            UpdateStatusRequest request
    ) {
        var report = findReportById(id);
        var fromStatus = report.getStatus();
        var toStatus = request.toStatus();

        if (!ReportStatusTransitions.isAllowed(fromStatus, toStatus)) {
            throw new IllegalTransitionException("Cannot move a report from " + fromStatus + " to" + toStatus);
        }
        if (ReportStatusTransitions.requiresNote(toStatus) && (request.note() == null || request.note().isBlank())) {
            throw new ValidationException("A note is required when rejecting a report");
        }

        report.setStatus(toStatus);
        var savedReport = reportRepository.save(report);
        var reportStatusHistory = ReportStatusHistory.builder()
                .report(savedReport)
                .actor(resolver)
                .fromStatus(fromStatus)
                .toStatus(toStatus)
                .note(request.note())
                .build();

        reportStatusRepository.save(reportStatusHistory);

        return reportMapper.toResponse(savedReport);
    }

    @Transactional
    private ReportResponse saveReportAndHistory(
            User reporter,
            CreateReportRequest request,
            Category category,
            String photoUrl
    ) {
        Report report = Report.builder()
                .reporter(reporter)
                .category(category)
                .description(request.description())
                .photoUrl(photoUrl)
                .location(GeoUtils.point(request.latitude(), request.longitude()))
                .status(ReportStatus.REPORTED)
                .build();
        Report savedReport = reportRepository.save(report);
        ReportStatusHistory reportStatusHistory = ReportStatusHistory.builder()
                .report(savedReport)
                .actor(reporter)
                .toStatus(ReportStatus.REPORTED)
                .build();

        reportStatusRepository.save(reportStatusHistory);

        return reportMapper.toResponse(savedReport);
    }

    private Report findReportById(UUID id) {
        return reportRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Report not found with id: " + id));
    }

    private void validateCoordinates(double latitude, double longitude) {
        if (latitude < -90 || latitude > 90) {
            throw new ValidationException("Latitude must be between -90 and 90");
        }
        if (longitude < -180 || longitude > 180) {
            throw new ValidationException("Longitude must be between -180 and 180");
        }
    }
}
