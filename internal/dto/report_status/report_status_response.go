package reportstatus

import (
	"github.com/google/uuid"
	"pantau/internal/enums"
	"time"
)

type ReportStatusResponse struct {
	ID         uuid.UUID           `json:"id"`
	FromStatus *enums.ReportStatus `json:"from_status"`
	ToStatus   enums.ReportStatus  `json:"to_status"`
	Note       *string             `json:"note"`
	ActorRole  enums.UserRole      `json:"actor_role"`
	CreatedAt  time.Time           `json:"created_at"`
}
