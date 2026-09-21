package reportstatus

import (
	"github.com/google/uuid"
	"pantau/internal/entity"
	"time"
)

type ReportStatusResponse struct {
	ID         uuid.UUID            `json:"id"`
	FromStatus *entity.ReportStatus `json:"from_status"`
	ToStatus   entity.ReportStatus  `json:"to_status"`
	Note       *string              `json:"note"`
	ActorRole  entity.UserRole      `json:"actor_role"`
	CreatedAt  time.Time            `json:"created_at"`
}
