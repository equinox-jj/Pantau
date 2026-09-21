package user

import (
	"time"

	"github.com/google/uuid"
)

type ProfileResponse struct {
	ID            uuid.UUID `json:"id"`
	DisplayName   string    `json:"display_name"`
	JoinedAt      time.Time `json:"joined_at"`
	ReportsCount  int64     `json:"reports_count"`
	ResolvedCount int64     `json:"resolved_count"`
}
