package service

import (
	"context"
	"pantau/internal/repository"
)

type UserService interface {
	GetProfile(ctx context.Context, userId int) error
}

type userServiceImpl struct {
	userRepo repository.UserRepository
}

func NewUserService(userRepo repository.UserRepository) UserService {
	return &userServiceImpl{userRepo: userRepo}
}

func (u *userServiceImpl) GetProfile(ctx context.Context, userId int) error {
	panic("unimplemented")
}
