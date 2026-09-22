package mapper

import (
	"pantau/internal/dto/auth"
	"pantau/internal/entity"
)

// AuthToResponse retains a zero-value user DTO when usr is nil because
// AuthResponse.UserResponse is a value, not a pointer.
func AuthToResponse(token string, expiresIn int64, usr *entity.User) *auth.AuthResponse {
	response := &auth.AuthResponse{Token: token, ExpiresIn: expiresIn}
	if userResponse := UserToAuthResponse(usr); userResponse != nil {
		response.UserResponse = *userResponse
	}
	return response
}
