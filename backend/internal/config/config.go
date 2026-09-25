package config

import (
	"errors"
	"fmt"
	"os"
	"strconv"
	"strings"
	"time"
	"unicode"

	"github.com/spf13/viper"
)

type Config struct {
	Server     serverConfig
	App        appConfig
	Database   databaseConfig
	Migration  migrationConfig
	GORM       gormConfig
	Upload     uploadConfig
	Logging    loggingConfig
	JWT        jwtConfig
	Cloudinary cloudinaryConfig
}

type serverConfig struct {
	Port int
}

type appConfig struct {
	Name string
	Env  string
}

type databaseConfig struct {
	Host         string
	Port         int
	Name         string
	User         string
	Password     string
	MaxOpenConns int
	MaxIdleConns int
}

type migrationConfig struct {
	Enabled bool
}

type gormConfig struct {
	ShowSQL bool
}

type uploadConfig struct {
	Enabled         bool
	MaxFileSize     string
	MaxRequestSize  string
	MaxFileBytes    int64
	MaxRequestBytes int
}

type loggingConfig struct {
	Level string
}

type jwtConfig struct {
	SecretKey  string
	Expiration time.Duration
}

type cloudinaryConfig struct {
	CloudName string
	APIKey    string
	APISecret string
}

func NewConfig() (*Config, error) {
	v := viper.New()
	v.SetConfigFile(".env")
	v.SetConfigType("env")
	if err := v.ReadInConfig(); err != nil && !errors.Is(err, os.ErrNotExist) {
		return nil, fmt.Errorf("read .env: %w", err)
	}
	v.AutomaticEnv()

	cfg := &Config{
		Server: serverConfig{Port: v.GetInt("APP_PORT")},
		App: appConfig{
			Name: v.GetString("APP_NAME"),
			Env:  v.GetString("APP_ENV"),
		},
		Database: databaseConfig{
			Host:         v.GetString("DB_HOST"),
			Port:         v.GetInt("DB_PORT"),
			Name:         v.GetString("DB_NAME"),
			User:         v.GetString("DB_USER"),
			Password:     v.GetString("DB_PASSWORD"),
			MaxOpenConns: v.GetInt("DB_MAX_OPEN_CONNS"),
			MaxIdleConns: v.GetInt("DB_MAX_IDLE_CONNS"),
		},
		Migration: migrationConfig{Enabled: v.GetBool("MIGRATION_ENABLED")},
		GORM:      gormConfig{ShowSQL: v.GetBool("GORM_SHOW_SQL")},
		Upload: uploadConfig{
			Enabled:        v.GetBool("UPLOAD_ENABLED"),
			MaxFileSize:    v.GetString("UPLOAD_MAX_FILE_SIZE"),
			MaxRequestSize: v.GetString("UPLOAD_MAX_REQUEST_SIZE"),
		},
		Logging: loggingConfig{Level: v.GetString("LOG_LEVEL")},
		JWT: jwtConfig{
			SecretKey:  v.GetString("JWT_SECRET_KEY"),
			Expiration: v.GetDuration("JWT_EXPIRATION"),
		},
		Cloudinary: cloudinaryConfig{
			CloudName: v.GetString("CLOUDINARY_NAME"),
			APIKey:    v.GetString("CLOUDINARY_KEY"),
			APISecret: v.GetString("CLOUDINARY_SECRET"),
		},
	}
	if cfg.Server.Port <= 0 || cfg.Server.Port > 65535 {
		return nil, errors.New("app_port must be between 1 and 65535")
	}
	if len(cfg.JWT.SecretKey) < 32 || strings.IndexFunc(cfg.JWT.SecretKey, unicode.IsSpace) >= 0 {
		return nil, errors.New("jwt.secret_key must contain at least 32 bytes and no whitespace")
	}
	if cfg.JWT.Expiration <= 0 {
		return nil, errors.New("jwt.expiration must be positive")
	}
	if cfg.Database.MaxOpenConns <= 0 || cfg.Database.MaxIdleConns < 0 || cfg.Database.MaxIdleConns > cfg.Database.MaxOpenConns {
		return nil, errors.New("database connection limits must be positive and max_idle_conns must not exceed max_open_conns")
	}
	maxFileBytes, err := parseByteSize(cfg.Upload.MaxFileSize)
	if err != nil {
		return nil, err
	}
	maxRequestBytes, err := parseByteSize(cfg.Upload.MaxRequestSize)
	if err != nil {
		return nil, err
	}
	if maxRequestBytes <= maxFileBytes || maxRequestBytes > int64(^uint(0)>>1) {
		return nil, errors.New("upload.max_request_size must exceed max_file_size and fit in an int")
	}
	cfg.Upload.MaxFileBytes = maxFileBytes
	cfg.Upload.MaxRequestBytes = int(maxRequestBytes)

	return cfg, nil
}

func parseByteSize(value string) (int64, error) {
	value = strings.ToUpper(strings.TrimSpace(value))
	for _, unit := range []struct {
		suffix string
		factor int64
	}{
		{"GB", 1 << 30}, {"MB", 1 << 20}, {"KB", 1 << 10}, {"B", 1},
	} {
		if number, ok := strings.CutSuffix(value, unit.suffix); ok {
			n, err := strconv.ParseInt(strings.TrimSpace(number), 10, 64)
			if err != nil || n <= 0 || n > int64(^uint(0)>>1)/unit.factor {
				return 0, errors.New("must be a positive byte size such as 5MB")
			}
			return n * unit.factor, nil
		}
	}
	return 0, errors.New("must use B, KB, MB, or GB units")
}
