package report

import (
	"github.com/google/uuid"
	"pantau/internal/dto/category"
	"pantau/internal/entity"
	"time"
)

type NearbyReportResponse struct {
	ID          uuid.UUID                 `json:"id"`
	Category    category.CategoryResponse `json:"category"`
	Description *string                   `json:"description"`
	PhotoURLs   []string                  `json:"photo_urls"`
	Latitude    float64                   `json:"latitude"`
	Longitude   float64                   `json:"longitude"`
	Status      entity.ReportStatus       `json:"status"`
	CreatedAt   time.Time                 `json:"created_at"`
}
