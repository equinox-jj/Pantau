package report

import "mime/multipart"

type UpdateReportRequest struct {
	CategoryID  *int64                  `json:"category_id" form:"category_id" validate:"required"`
	Description *string                 `json:"description" form:"description" validate:"omitempty,max=2000"`
	Photos      []*multipart.FileHeader `json:"photos" form:"photos" validate:"omitempty,max=4"`
	Latitude    *float64                `json:"latitude" form:"latitude" validate:"required"`
	Longitude   *float64                `json:"longitude" form:"longitude" validate:"required"`
}
