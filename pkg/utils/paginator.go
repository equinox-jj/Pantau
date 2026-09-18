package utils

import (
	"github.com/gofiber/fiber/v3"
	"gorm.io/gorm"
)

func Paginate(ctx fiber.Ctx) func(db *gorm.DB) *gorm.DB {
	return func(db *gorm.DB) *gorm.DB {
		page := fiber.Query(ctx, "page", 1)
		if page <= 0 {
			page = 1
		}

		pageSize := fiber.Query(ctx, "page_size", 10)

		switch {
		case pageSize > 100:
			pageSize = 100
		case pageSize <= 0:
			pageSize = 10
		}

		offset := (page - 1) * pageSize

		return db.Offset(offset).Limit(pageSize)
	}
}
