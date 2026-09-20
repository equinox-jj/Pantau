package service

import "pantau/internal/repository"

type ReportService interface {
}

type reportServiceImpl struct {
	reportRepo repository.ReportRepository
}

func NewReportService(reportRepo repository.ReportRepository) ReportService {
	return &reportServiceImpl{
		reportRepo: reportRepo,
	}
}
