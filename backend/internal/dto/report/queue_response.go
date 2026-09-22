package report

type QueueResponse struct {
	Items  []QueueReportResponse `json:"items"`
	Counts QueueCounts           `json:"counts"`
}
