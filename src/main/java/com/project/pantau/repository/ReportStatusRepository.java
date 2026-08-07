package com.project.pantau.repository;

import com.project.pantau.entity.ReportStatusHistory;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ReportStatusRepository extends JpaRepository<ReportStatusHistory, UUID> {
    @EntityGraph(attributePaths = "actor")
    List<ReportStatusHistory> findByReportIdOrderByCreatedAtAsc(UUID reportId);
}
