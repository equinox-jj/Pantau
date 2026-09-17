package config

import (
	"errors"
	"fmt"
	"os"
	"strings"
	"time"

	"github.com/spf13/viper"
)

type Config struct {
	Server     ServerConfig     `mapstructure:"server"`
	App        AppConfig        `mapstructure:"app"`
	Database   DatabaseConfig   `mapstructure:"database"`
	Migration  MigrationConfig  `mapstructure:"migration"`
	GORM       GORMConfig       `mapstructure:"gorm"`
	Upload     UploadConfig     `mapstructure:"upload"`
	Logging    LoggingConfig    `mapstructure:"logging"`
	JWT        JWTConfig        `mapstructure:"jwt"`
	Cloudinary CloudinaryConfig `mapstructure:"cloudinary"`
}

type ServerConfig struct {
	Port int `mapstructure:"port"`
}

type AppConfig struct {
	Name string `mapstructure:"name"`
	Env  string `mapstructure:"env"`
}

type DatabaseConfig struct {
	Host         string `mapstructure:"host"`
	Port         int    `mapstructure:"port"`
	Name         string `mapstructure:"name"`
	User         string `mapstructure:"user"`
	Password     string `mapstructure:"password"`
	MaxOpenConns int    `mapstructure:"max_open_conns"`
	MaxIdleConns int    `mapstructure:"max_idle_conns"`
}

type MigrationConfig struct {
	Enabled bool `mapstructure:"enabled"`
}

type GORMConfig struct {
	ShowSQL bool `mapstructure:"show_sql"`
}

type UploadConfig struct {
	Enabled        bool   `mapstructure:"enabled"`
	MaxFileSize    string `mapstructure:"max_file_size"`
	MaxRequestSize string `mapstructure:"max_request_size"`
}

type LoggingConfig struct {
	Level string `mapstructure:"level"`
}

type JWTConfig struct {
	SecretKey  string        `mapstructure:"secret_key"`
	Expiration time.Duration `mapstructure:"expiration"`
}

type CloudinaryConfig struct {
	CloudName string `mapstructure:"cloud_name"`
	APIKey    string `mapstructure:"api_key"`
	APISecret string `mapstructure:"api_secret"`
}

func NewConfig(v *viper.Viper) (*Config, error) {
	setDefaults(v)

	v.SetConfigName("config")
	v.SetConfigType("yaml")
	v.AddConfigPath(".")
	v.AddConfigPath("./config")

	if err := v.ReadInConfig(); err != nil {
		var notFound viper.ConfigFileNotFoundError

		if !errors.As(err, &notFound) {
			return nil, fmt.Errorf("read config: %w", err)
		}
	}

	v.SetEnvKeyReplacer(
		strings.NewReplacer(".", "_"),
	)

	v.AutomaticEnv()

	if err := bindEnv(v); err != nil {
		return nil, err
	}

	if err := mergeDotenv(v); err != nil {
		return nil, err
	}

	var cfg Config

	if err := v.Unmarshal(&cfg); err != nil {
		return nil, fmt.Errorf("unmarshal config: %w", err)
	}

	return &cfg, nil
}

func setDefaults(v *viper.Viper) {
	v.SetDefault("server.port", 8080)

	v.SetDefault("app.name", "pantau")
	v.SetDefault("app.env", "production")

	v.SetDefault("database.host", "localhost")
	v.SetDefault("database.port", 5432)
	v.SetDefault("database.name", "pantau")
	v.SetDefault("database.user", "postgres")
	v.SetDefault("database.password", "")
	v.SetDefault("database.max_open_conns", 25)
	v.SetDefault("database.max_idle_conns", 10)

	v.SetDefault("migration.enabled", true)

	v.SetDefault("gorm.show_sql", false)

	v.SetDefault("upload.enabled", true)
	v.SetDefault("upload.max_file_size", "5MB")
	v.SetDefault("upload.max_request_size", "20MB")

	v.SetDefault("logging.level", "INFO")

	v.SetDefault("jwt.expiration", "15m")
}

var envBindings = map[string]string{
	"server.port": "APP_PORT",
	"app.env":     "APP_ENV",

	"database.host":           "DB_HOST",
	"database.port":           "DB_PORT",
	"database.name":           "DB_NAME",
	"database.user":           "DB_USER",
	"database.password":       "DB_PASSWORD",
	"database.max_open_conns": "DB_MAX_OPEN_CONNS",
	"database.max_idle_conns": "DB_MAX_IDLE_CONNS",

	"logging.level": "LOG_LEVEL",

	"jwt.secret_key": "JWT_SECRET_KEY",
	"jwt.expiration": "JWT_EXPIRATION",

	"cloudinary.cloud_name": "CLOUDINARY_NAME",
	"cloudinary.api_key":    "CLOUDINARY_KEY",
	"cloudinary.api_secret": "CLOUDINARY_SECRET",
}

func bindEnv(v *viper.Viper) error {
	for key, env := range envBindings {
		if err := v.BindEnv(key, env); err != nil {
			return fmt.Errorf(
				"bind %s to %s: %w",
				env,
				key,
				err,
			)
		}
	}

	return nil
}

// mergeDotenv maps flat .env names to nested config keys. Merging at the
// config-file layer keeps real environment variables above .env values.
func mergeDotenv(v *viper.Viper) error {
	dotenv := viper.New()
	dotenv.SetConfigFile(".env")
	dotenv.SetConfigType("env")
	if err := dotenv.ReadInConfig(); err != nil {
		if errors.Is(err, os.ErrNotExist) {
			return nil
		}
		return fmt.Errorf("read .env: %w", err)
	}

	overrides := viper.New()
	for _, key := range v.AllKeys() {
		name := strings.ToUpper(strings.ReplaceAll(key, ".", "_"))
		value := dotenv.GetString(name)
		if value == "" {
			if alias, ok := envBindings[key]; ok {
				value = dotenv.GetString(alias)
			}
		}
		// Match Viper's default treatment of empty environment values as unset.
		if value != "" {
			overrides.Set(key, value)
		}
	}
	if err := v.MergeConfigMap(overrides.AllSettings()); err != nil {
		return fmt.Errorf("merge .env: %w", err)
	}
	return nil
}
