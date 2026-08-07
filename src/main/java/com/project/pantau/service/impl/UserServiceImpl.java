package com.project.pantau.service.impl;

import com.project.pantau.dto.user.ProfileResponse;
import com.project.pantau.entity.User;
import com.project.pantau.enums.ReportStatus;
import com.project.pantau.repository.ReportRepository;
import com.project.pantau.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {
    private final ReportRepository reportRepository;

    @Override
    public ProfileResponse getProfile(User user) {
        var reportsCount = reportRepository.countByReporterId(user.getId());
        var resolvedCount = reportRepository.countByReporterIdAndStatus(user.getId(), ReportStatus.RESOLVED);

        return ProfileResponse.builder()
                .id(user.getId())
                .displayName(user.getDisplayName())
                .joinedAt(user.getCreatedAt())
                .reportsCount(reportsCount)
                .resolvedCount(resolvedCount)
                .build();
    }
}
