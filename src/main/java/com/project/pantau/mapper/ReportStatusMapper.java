package com.project.pantau.mapper;

import com.project.pantau.dto.report_status.ReportStatusResponse;
import com.project.pantau.entity.ReportStatusHistory;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(config = MapStructConfig.class)
public interface ReportStatusMapper {
    @Mapping(target = "actorRole", source = "actor.role")
    ReportStatusResponse toResponse(ReportStatusHistory entity);

    List<ReportStatusResponse> toResponse(List<ReportStatusHistory> entities);
}
