package auth

type AuthResponse struct {
	Token        string       `json:"token"`
	ExpiresIn    int64        `json:"expires_in"`
	UserResponse UserResponse `json:"user_response"`
}
