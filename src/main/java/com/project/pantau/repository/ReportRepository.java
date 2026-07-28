package com.project.pantau.repository;

import com.project.pantau.entity.Report;
import org.springframework.data.domain.Pageable;
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

    List<Report> findByReporterId(UUID reporterId, Pageable pageable);
}
