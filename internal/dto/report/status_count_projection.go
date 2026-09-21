package report

// StatusCountProjection holds a grouped status count returned by a database query.
type StatusCountProjection struct {
	Status string `json:"status" gorm:"column:status"`
	Count  int64  `json:"count" gorm:"column:count"`
}
