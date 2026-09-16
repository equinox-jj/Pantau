package security

import (
	"pantau/internal/entity"
	"time"

	apperr "pantau/pkg/errors"

	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
)

type claims struct {
	UserID uuid.UUID       `json:"uid"`
	Email  string          `json:"email"`
	Role   entity.UserRole `json:"role"`
	jwt.RegisteredClaims
}

type JwtService interface {
	GenerateToken(user *entity.User) (string, error)
	ParseToken(token string) (*claims, error)
	ExpirationSeconds() int64
}

type jwtServiceImpl struct {
	secret     []byte
	expiration time.Duration
}

func NewJwtService(secret string, expiration time.Duration) JwtService {
	return &jwtServiceImpl{
		secret:     []byte(secret),
		expiration: expiration,
	}
}

func (j *jwtServiceImpl) GenerateToken(user *entity.User) (string, error) {
	now := time.Now()
	claims := claims{
		UserID:   user.ID,
		Email:    user.Email,
		Role:     user.Role,
		Subject:  user.ID.String(),
		IssuedAt: jwt.NewNumericDate(now),
		ExpiresAt: jwt.NewNumericDate(
			now.Add(j.expiration),
		),
	}
	token := jwt.NewWithClaims(
		jwt.SigningMethodHS256,
		claims,
	)

	return token.SignedString(j.secret)
}

func (j *jwtServiceImpl) ParseToken(tokenString string) (*claims, error) {
	token, err := jwt.ParseWithClaims(
		tokenString,
		&claims{},
		func(token *jwt.Token) (any, error) {
			if token.Method != jwt.SigningMethodHS256 {
				return nil, apperr.ErrUnexpectedSigningMethod
			}

			return j.secret, nil
		},
	)
	if err != nil {
		return nil, err
	}

	claims, ok := token.Claims.(*claims)
	if !ok || !token.Valid {
		return nil, apperr.ErrInvalidToken
	}

	return claims, nil
}

func (j *jwtServiceImpl) ExpirationSeconds() int64 {
	return int64(j.expiration.Seconds())
}