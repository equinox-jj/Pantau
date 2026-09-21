package enums

type QueueTab string

const (
	QueueTabOpen       QueueTab = "open"
	QueueTabInProgress QueueTab = "in_progress"
	QueueTabResolved   QueueTab = "resolved"
)

func (tab QueueTab) Statuses() []string {
	switch tab {
	case QueueTabOpen:
		return []string{string(ReportStatusReported), string(ReportStatusAcknowledged)}
	case QueueTabInProgress:
		return []string{string(ReportStatusInProgress)}
	case QueueTabResolved:
		return []string{string(ReportStatusResolved)}
	default:
		return nil
	}
}
