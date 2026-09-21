package report

import "pantau/internal/entity"

type UpdateStatusRequest struct {
	ToStatus *entity.ReportStatus `json:"to_status" validate:"required,oneof=reported acknowledged in_progress resolved closed rejected"`
	Note     *string              `json:"note" validate:"omitempty,max=1000"`
}
