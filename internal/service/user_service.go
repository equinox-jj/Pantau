package service

import (
	"context"
	"log/slog"
	"pantau/internal/dto/user"
	"pantau/internal/entity"
	"pantau/internal/enums"
	"pantau/internal/repository"
	apperror "pantau/pkg/errors"
)

type UserService interface {
	GetProfile(ctx context.Context, usr *entity.User) (*user.ProfileResponse, error)
}

type userServiceImpl struct {
	reportRepo repository.ReportRepository
}

func NewUserService(reportRepo repository.ReportRepository) UserService {
	return &userServiceImpl{reportRepo: reportRepo}
}

func (sv *userServiceImpl) GetProfile(ctx context.Context, usr *entity.User) (*user.ProfileResponse, error) {
	if usr == nil {
		slog.Error("[UserService.GetProfile] Failed to get profile", "error", apperror.ErrUnauthorized)
		return nil, apperror.ErrUnauthorized
	}

	reportsCount, err := sv.reportRepo.CountByReporterID(ctx, usr.ID)
	if err != nil {
		slog.Error("[UserService.GetProfile] Failed to count reports", "user_id", usr.ID, "error", err)
		return nil, err
	}

	resolvedCount, err := sv.reportRepo.CountByReporterIDAndStatus(ctx, usr.ID, enums.ReportStatusResolved)
	if err != nil {
		slog.Error("[UserService.GetProfile] Failed to count resolved reports", "user_id", usr.ID, "error", err)
		return nil, err
	}

	return &user.ProfileResponse{
		ID:            usr.ID,
		DisplayName:   usr.DisplayName,
		JoinedAt:      usr.CreatedAt,
		ReportsCount:  reportsCount,
		ResolvedCount: resolvedCount,
	}, nil
}
