package mapper

import (
	"pantau/internal/dto/user"
	"pantau/internal/entity"
)

func UserToResponse(
	usr *entity.User,
	reportsCount int64,
	resolvedCount int64,
) *user.UserResponse {
	if usr == nil {
		return nil
	}

	return &user.UserResponse{
		ID:            usr.ID,
		DisplayName:   usr.DisplayName,
		JoinedAt:      usr.CreatedAt,
		ReportsCount:  reportsCount,
		ResolvedCount: resolvedCount,
	}
}
