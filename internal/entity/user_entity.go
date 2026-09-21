package entity

import (
	"pantau/internal/enums"
	"time"

	"github.com/google/uuid"
)

type User struct {
	ID          uuid.UUID      `gorm:"column:id;type:uuid;default:gen_random_uuid();primary_key"`
	Email       string         `gorm:"column:email;type:text;not null;unique"`
	Password    string         `gorm:"column:password;type:text;not null"`
	DisplayName string         `gorm:"column:display_name;type:text;not null"`
	Role        enums.UserRole `gorm:"column:role;type:user_role;not null;default:'citizen'"`
	CreatedAt   time.Time      `gorm:"column:created_at;type:timestamptz;not null;default:now()"`
	UpdatedAt   time.Time      `gorm:"column:updated_at;type:timestamptz;not null;default:now()"`
}

func (User) TableName() string {
	return "users"
}
