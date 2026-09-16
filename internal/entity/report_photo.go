package entity

import (
	"time"

	"github.com/google/uuid"
)

type ReportPhoto struct {
	ID            uuid.UUID `gorm:"type:uuid;primaryKey"`
	ReportID      uuid.UUID `gorm:"column:report_id;type:uuid;not null"`
	Report        Report    `gorm:"foreignKey:ReportID"`
	PhotoURL      string    `gorm:"column:photo_url;not null"`
	PhotoPublicID *string   `gorm:"column:photo_public_id"`
	Position      int       `gorm:"column:position;not null"`
	CreatedAt     time.Time `gorm:"column:created_at;not null"`
}

func (ReportPhoto) TableName() string {
	return "report_photos"
}
