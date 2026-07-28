package com.project.pantau.repository;

import com.project.pantau.entity.ReportStatusHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ReportStatusRepository extends JpaRepository<ReportStatusHistory, UUID> {
}
