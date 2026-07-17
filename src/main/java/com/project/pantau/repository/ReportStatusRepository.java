package com.project.pantau.repository;

import com.project.pantau.entity.ReportStatusHistory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface ReportStatusRepository extends JpaRepository<ReportStatusHistory, UUID> {
}
