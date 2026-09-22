package enums

type ReportStatus string

const (
	ReportStatusReported     ReportStatus = "reported"
	ReportStatusAcknowledged ReportStatus = "acknowledged"
	ReportStatusInProgress   ReportStatus = "in_progress"
	ReportStatusResolved     ReportStatus = "resolved"
	ReportStatusClosed       ReportStatus = "closed"
	ReportStatusRejected     ReportStatus = "rejected"
)
