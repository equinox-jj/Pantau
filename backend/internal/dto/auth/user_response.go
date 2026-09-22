package auth

import (
	"github.com/google/uuid"
	"pantau/internal/enums"
	"time"
)

type UserResponse struct {
	ID          uuid.UUID      `json:"id"`
	Email       string         `json:"email"`
	DisplayName string         `json:"display_name"`
	Role        enums.UserRole `json:"role"`
	CreatedAt   time.Time      `json:"created_at"`
	UpdatedAt   time.Time      `json:"updated_at"`
}
