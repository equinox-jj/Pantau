package report

import (
	"github.com/google/uuid"
	"pantau/internal/dto/category"
	"pantau/internal/enums"
	"time"
)

type QueueReportResponse struct {
	ID            uuid.UUID                 `json:"id"`
	Category      category.CategoryResponse `json:"category"`
	Description   *string                   `json:"description"`
	PhotoURL      *string                   `json:"photo_url"`
	Latitude      *float64                  `json:"latitude"`
	Longitude     *float64                  `json:"longitude"`
	DistanceMeter *float64                  `json:"distance_meter"`
	Status        enums.ReportStatus        `json:"status"`
	CreatedAt     time.Time                 `json:"created_at"`
}
