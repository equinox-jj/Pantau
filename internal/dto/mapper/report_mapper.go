package mapper

import (
	"pantau/internal/dto/report"
	"pantau/internal/entity"
	"slices"
)

func ReportToResponse(rpt *entity.Report, photoURLs []string) *report.ReportResponse {
	if rpt == nil && photoURLs == nil {
		return nil
	}
	response := &report.ReportResponse{PhotoURLs: slices.Clone(photoURLs)}
	if rpt != nil {
		response.ID = rpt.ID
		response.Category = *CategoryToResponse(&rpt.Category)
		response.Description = rpt.Description
		response.Latitude = rpt.Latitude()
		response.Longitude = rpt.Longitude()
		response.Status = rpt.Status
		response.CreatedAt = rpt.CreatedAt
		response.UpdatedAt = rpt.UpdatedAt
	}
	return response
}

func ReportToNearbyResponse(rpt *entity.Report, photoURLs []string) *report.NearbyReportResponse {
	if rpt == nil && photoURLs == nil {
		return nil
	}
	response := &report.NearbyReportResponse{PhotoURLs: slices.Clone(photoURLs)}
	if rpt != nil {
		response.ID = rpt.ID
		response.Category = *CategoryToResponse(&rpt.Category)
		response.Description = rpt.Description
		response.Latitude = rpt.Latitude()
		response.Longitude = rpt.Longitude()
		response.Status = rpt.Status
		response.CreatedAt = rpt.CreatedAt
	}
	return response
}

// ReportToQueueResponse leaves DistanceMeter unset for the caller to calculate.
func ReportToQueueResponse(rpt *entity.Report, photoURL *string) *report.QueueReportResponse {
	if rpt == nil && photoURL == nil {
		return nil
	}
	response := &report.QueueReportResponse{PhotoURL: photoURL}
	if rpt != nil {
		latitude, longitude := rpt.Latitude(), rpt.Longitude()
		response.ID = rpt.ID
		response.Category = *CategoryToResponse(&rpt.Category)
		response.Description = rpt.Description
		response.Latitude = &latitude
		response.Longitude = &longitude
		response.Status = rpt.Status
		response.CreatedAt = rpt.CreatedAt
	}
	return response
}
