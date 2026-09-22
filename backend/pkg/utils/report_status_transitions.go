package utils

import "pantau/internal/enums"

func IsReportStatusTransitionAllowed(from, to enums.ReportStatus) bool {
	switch from {
	case enums.ReportStatusReported:
		return to == enums.ReportStatusAcknowledged || to == enums.ReportStatusRejected
	case enums.ReportStatusAcknowledged:
		return to == enums.ReportStatusInProgress || to == enums.ReportStatusRejected
	case enums.ReportStatusInProgress:
		return to == enums.ReportStatusResolved || to == enums.ReportStatusRejected
	case enums.ReportStatusResolved:
		return to == enums.ReportStatusClosed
	default:
		return false
	}
}
