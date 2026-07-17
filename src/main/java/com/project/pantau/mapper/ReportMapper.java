package com.project.pantau.mapper;

import com.project.pantau.dto.report.NearbyReportResponse;
import com.project.pantau.dto.report.ReportResponse;
import com.project.pantau.entity.Report;
import org.mapstruct.Mapper;
import org.mapstruct.MapperConfig;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(
        config = MapperConfig.class,
        uses = CategoryMapper.class
)
public interface ReportMapper {
    @Mapping(target = "photoUrl", source = "upload.url")
    @Mapping(target = "latitude", source = "latitude")
    @Mapping(target = "longitude", source = "longitude")
    ReportResponse toResponse(Report entity);

    @Mapping(target = "latitude", source = "latitude")
    @Mapping(target = "longitude", source = "longitude")
    NearbyReportResponse toNearbyResponse(Report entity);

    List<NearbyReportResponse> toNearbyResponse(List<Report> entities);

    List<ReportResponse> toResponse(List<Report> entities);
}
