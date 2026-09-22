package mapper

import (
	reportstatus "pantau/internal/dto/report_status"
	"pantau/internal/entity"
)

func ReportStatusToResponse(history *entity.ReportStatusHistory) *reportstatus.ReportStatusResponse {
	if history == nil {
		return nil
	}
	return &reportstatus.ReportStatusResponse{
		ID:         history.ID,
		FromStatus: history.FromStatus,
		ToStatus:   history.ToStatus,
		Note:       history.Note,
		ActorRole:  history.Actor.Role,
		CreatedAt:  history.CreatedAt,
	}
}

func ReportStatusesToResponse(histories []entity.ReportStatusHistory) []reportstatus.ReportStatusResponse {
	if histories == nil {
		return nil
	}
	responses := make([]reportstatus.ReportStatusResponse, len(histories))
	for i := range histories {
		responses[i] = *ReportStatusToResponse(&histories[i])
	}
	return responses
}
