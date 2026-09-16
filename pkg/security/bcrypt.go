package security

import "golang.org/x/crypto/bcrypt"

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
	return bcrypt.CompareHashAndPassword(
		[]byte(hash),
		[]byte(password),
	)
}

func (ph *passwordHasherImpl) Hash(password string) (string, error) {
	hashedPassword, err := bcrypt.GenerateFromPassword(
		[]byte(password),
		ph.cost,
	)
	if err != nil {
		return "", err
	}

	return string(hashedPassword), nil
}
