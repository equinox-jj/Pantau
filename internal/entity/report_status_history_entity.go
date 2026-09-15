package entity

import (
	"time"

	"github.com/google/uuid"
)

type ReportStatus string

const (
	ReportStatusReported     ReportStatus = "reported"
	ReportStatusAcknowledged ReportStatus = "acknowledged"
	ReportStatusInProgress   ReportStatus = "in_progress"
	ReportStatusResolved     ReportStatus = "resolved"
	ReportStatusClosed       ReportStatus = "closed"
	ReportStatusRejected     ReportStatus = "rejected"
)

type ReportStatusHistory struct {
	ID         uuid.UUID     `gorm:"column:id;type:uuid;default:gen_random_uuid();primary_key"`
	ReportID   uuid.UUID     `gorm:"column:report_id;type:uuid;not null"`
	Report     Report        `gorm:"foreignKey:ReportID;references:id"`
	ActorID    uuid.UUID     `gorm:"column:actor_id;type:uuid;not null"`
	Actor      User          `gorm:"foreignKey:ActorID;references:id"`
	FromStatus *ReportStatus `gorm:"column:from_status;type:report_status"`
	ToStatus   ReportStatus  `gorm:"column:to_status;type:report_status;not null"`
	Note       *string       `gorm:"column:note;type:text"`
	CreatedAt  time.Time     `gorm:"column:created_at;type:timestamptz;not null;default:now()"`
}

func (ReportStatusHistory) TableName() string {
	return "report_status_history"
}
