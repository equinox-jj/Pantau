package security

import (
	"log/slog"
	"pantau/internal/entity"
	"pantau/internal/enums"
	"pantau/pkg/errs"
	"time"

	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
)

type claims struct {
	UserID uuid.UUID      `json:"uid"`
	Email  string         `json:"email"`
	Role   enums.UserRole `json:"role"`
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

	signedToken, err := token.SignedString(j.secret)
	if err != nil {
		slog.Error("[JWT] Failed to sign token", "email", user.Email, "error", err)
		return "", err
	}

	return signedToken, nil
}

func (j *jwtServiceImpl) ParseToken(tokenString string) (*claims, error) {
	token, err := jwt.ParseWithClaims(
		tokenString,
		&claims{},
		func(token *jwt.Token) (any, error) {
			if token.Method != jwt.SigningMethodHS256 {
				slog.Error("[JWT] Unexpected token signing method")
				return nil, errs.ErrUnexpectedSigningMethod
			}

			return j.secret, nil
		},
		jwt.WithValidMethods([]string{jwt.SigningMethodHS256.Alg()}),
		jwt.WithExpirationRequired(),
	)
	if err != nil {
		slog.Error("[JWT] Failed to parse token", "error", err)
		return nil, err
	}

	claims, ok := token.Claims.(*claims)
	if !ok || !token.Valid || claims.UserID == uuid.Nil || claims.Subject != claims.UserID.String() {
		slog.Error("[JWT] Invalid token")
		return nil, errs.ErrInvalidToken
	}

	return claims, nil
}

func (j *jwtServiceImpl) ExpirationSeconds() int64 {
	return int64(j.expiration.Seconds())
}
