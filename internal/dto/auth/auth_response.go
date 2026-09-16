package auth

import "github.com/google/uuid"

type AuthResponse struct {
	AccessToken string       `json:"accessToken"`
	ExpiresIn   int64        `json:"expiresIn"`
	User        AuthUserInfo `json:"user"`
}

type AuthUserInfo struct {
	ID          uuid.UUID `json:"id"`
	Email       string    `json:"email"`
	DisplayName string    `json:"displayName"`
	Role        string    `json:"role"`
}
