package entity

import (
	"pantau/pkg/utils"
	"time"

	"github.com/google/uuid"
)

type Report struct {
	ID          uuid.UUID      `gorm:"column:id;type:uuid;primary_key;default:gen_random_uuid()"`
	ReporterID  uuid.UUID      `gorm:"column:reporter_id;type:uuid;not null"`
	Reporter    User           `gorm:"foreignKey:ReporterID"`
	CategoryID  int64          `gorm:"column:category_id;not null"`
	Category    Category       `gorm:"foreignKey:CategoryID"`
	Description *string        `gorm:"column:description"`
	Location    utils.GeoPoint `gorm:"column:location;type:geography(Point,4326);not null"`
	Status      ReportStatus   `gorm:"type:report_status;not null"`
	CreatedAt   time.Time      `gorm:"column:created_at;not null"`
	UpdatedAt   time.Time      `gorm:"column:updated_at;not null"`
}

func (Report) TableName() string {
	return "reports"
}

func (r Report) Latitude() float64 {
	return r.Location.Lat
}

func (r Report) Longitude() float64 {
	return r.Location.Lng
}
