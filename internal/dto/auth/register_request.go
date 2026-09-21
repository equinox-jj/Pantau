package auth

type RegisterRequest struct {
	Email       string `json:"email" validate:"required,email"`
	Password    string `json:"password" validate:"required,notblank,min=8,max=50"`
	DisplayName string `json:"display_name" validate:"required,notblank,max=50"`
}
