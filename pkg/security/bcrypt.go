package security

import (
	"log/slog"

	"golang.org/x/crypto/bcrypt"
)

type PasswordHasher interface {
	Hash(password string) (string, error)
	Compare(hash, password string) error
}

type passwordHasherImpl struct {
	cost int
}

func NewPasswordHasher(cost int) PasswordHasher {
	return &passwordHasherImpl{cost: cost}
}

func (ph *passwordHasherImpl) Compare(hash string, password string) error {
	if err := bcrypt.CompareHashAndPassword(
		[]byte(hash),
		[]byte(password),
	); err != nil {
		slog.Error("[Bcrypt] Failed to compare password", "error", err)
		return err
	}
	return nil
}

func (ph *passwordHasherImpl) Hash(password string) (string, error) {
	hashedPassword, err := bcrypt.GenerateFromPassword(
		[]byte(password),
		ph.cost,
	)
	if err != nil {
		slog.Error("[Bcrypt] Failed to hash password", "error", err)
		return "", err
	}

	return string(hashedPassword), nil
}
