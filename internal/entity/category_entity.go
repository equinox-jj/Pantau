package entity

import (
	"time"
)

type Category struct {
	ID        int64     `gorm:"column:id;type:bigserial;primary_key"`
	Name      string    `gorm:"column:name;type:text;not null"`
	Slug      string    `gorm:"column:slug;type:text;not null;unique"`
	IsActive  bool      `gorm:"column:is_active;type:boolean;not null;default:true"`
	CreatedAt time.Time `gorm:"column:created_at;type:timestamptz;not null;default:now()"`
}

func (Category) TableName() string {
	return "categories"
}
