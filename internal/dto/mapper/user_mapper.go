package mapper

import (
	"pantau/internal/dto/auth"
	"pantau/internal/dto/user"
	"pantau/internal/entity"
)

func UserToAuthResponse(usr *entity.User) *auth.UserResponse {
	if usr == nil {
		return nil
	}

	return &auth.UserResponse{
		ID:          usr.ID,
		Email:       usr.Email,
		DisplayName: usr.DisplayName,
		Role:        usr.Role,
		CreatedAt:   usr.CreatedAt,
		UpdatedAt:   usr.UpdatedAt,
	}
}

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
