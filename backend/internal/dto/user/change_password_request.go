package user

type ChangePasswordRequest struct {
	CurrentPassword string `json:"current_password" validate:"required,notblank,min=8,max=50"`
	NewPassword     string `json:"new_password" validate:"required,notblank,min=8,max=50,nefield=CurrentPassword"`
}
