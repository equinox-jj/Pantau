package report

import (
	"github.com/google/uuid"
	"pantau/internal/dto/category"
	"pantau/internal/enums"
	"time"
)

type ReportResponse struct {
	ID          uuid.UUID                 `json:"id"`
	Category    category.CategoryResponse `json:"category"`
	Description *string                   `json:"description"`
	PhotoURLs   []string                  `json:"photo_urls"`
	Latitude    float64                   `json:"latitude"`
	Longitude   float64                   `json:"longitude"`
	Status      enums.ReportStatus        `json:"status"`
	CreatedAt   time.Time                 `json:"created_at"`
	UpdatedAt   time.Time                 `json:"updated_at"`
}
