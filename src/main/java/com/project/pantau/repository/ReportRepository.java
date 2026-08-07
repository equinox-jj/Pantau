package com.project.pantau.repository;

import com.project.pantau.entity.Report;
import com.project.pantau.enums.ReportStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ReportRepository extends JpaRepository<Report, UUID> {
    @Query(
            value = """
                    SELECT * FROM reports r
                    WHERE ST_DWithin(
                        r.location,
                        ST_MakePoint(:lng, :lat)::geography,
                        :radiusMeters
                    )
                    ORDER BY r.location <-> ST_MakePoint(:lng, :lat)::geography
                    LIMIT :limit
                    """,
            nativeQuery = true
    )
    List<Report> findNearbyReport(
            @Param("lat") double latitude,
            @Param("lng") double longitude,
            @Param("radiusMeters") int radiusMeters,
            @Param("limit") int limit
    );

    @EntityGraph(attributePaths = "category")
    Page<Report> findByReporterId(UUID reporterId, Pageable pageable);

    long countByReporterId(UUID reporterId);

    long countByReporterIdAndStatus(UUID reporterId, ReportStatus status);

    @Query(
            value = """
                    SELECT * FROM reports r
                    WHERE r.status::text IN (:statuses)
                    AND ST_DWithin(
                        r.location,
                        ST_MakePoint(:lng, :lat)::geography,
                        :radiusMeters
                    )
                    ORDER BY r.created_at ASC
                    """,
            countQuery = """
                    SELECT count(*) FROM reports r
                    WHERE r.status::text IN (:statuses)
                    AND ST_DWithin(
                        r.location,
                        ST_MakePoint(:lng, :lat)::geography,
                        :radiusMeters
                    )
                    """,
            nativeQuery = true
    )
    Page<Report> findQueueReports(
            @Param("statuses") List<String> statuses,
            @Param("lat") double latitude,
            @Param("lng") double longitude,
            @Param("radiusMeters") int radiusMeters,
            Pageable pageable
    );

    @Query(
            value = """
                    SELECT r.status::text AS status, count(*) AS count
                    FROM reports r
                    WHERE r.status::text IN ('REPORTED', 'ACKNOWLEDGED', 'IN_PROGRESS', 'RESOLVED')
                    AND ST_DWithin(
                        r.location,
                        ST_MakePoint(:lng, :lat)::geography,
                        :radiusMeters
                    )
                    GROUP BY r.status
                    """,
            nativeQuery = true
    )
    List<StatusCountProjection> countQueueReportsByStatus(
            @Param("lat") double latitude,
            @Param("lng") double longitude,
            @Param("radiusMeters") int radiusMeters
    );

    interface StatusCountProjection {
        String getStatus();

        long getCount();
    }
}
