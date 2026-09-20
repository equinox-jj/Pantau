package config

import (
	"errors"
	"log/slog"
	"os"
	"strings"
	"time"

	"github.com/spf13/viper"
)

type Config struct {
	Server     serverConfig     `mapstructure:"server"`
	App        appConfig        `mapstructure:"app"`
	Database   databaseConfig   `mapstructure:"database"`
	Migration  migrationConfig  `mapstructure:"migration"`
	GORM       gormConfig       `mapstructure:"gorm"`
	Upload     uploadConfig     `mapstructure:"upload"`
	Logging    loggingConfig    `mapstructure:"logging"`
	JWT        jwtConfig        `mapstructure:"jwt"`
	Cloudinary cloudinaryConfig `mapstructure:"cloudinary"`
}

type serverConfig struct {
	Port int `mapstructure:"port"`
}

type appConfig struct {
	Name string `mapstructure:"name"`
	Env  string `mapstructure:"env"`
}

type databaseConfig struct {
	Host         string `mapstructure:"host"`
	Port         int    `mapstructure:"port"`
	Name         string `mapstructure:"name"`
	User         string `mapstructure:"user"`
	Password     string `mapstructure:"password"`
	MaxOpenConns int    `mapstructure:"max_open_conns"`
	MaxIdleConns int    `mapstructure:"max_idle_conns"`
}

type migrationConfig struct {
	Enabled bool `mapstructure:"enabled"`
}

type gormConfig struct {
	ShowSQL bool `mapstructure:"show_sql"`
}

type uploadConfig struct {
	Enabled        bool   `mapstructure:"enabled"`
	MaxFileSize    string `mapstructure:"max_file_size"`
	MaxRequestSize string `mapstructure:"max_request_size"`
}

type loggingConfig struct {
	Level string `mapstructure:"level"`
}

type jwtConfig struct {
	SecretKey  string        `mapstructure:"secret_key"`
	Expiration time.Duration `mapstructure:"expiration"`
}

type cloudinaryConfig struct {
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

		if _, ok := errors.AsType[viper.ConfigFileNotFoundError](err); !ok {
			slog.Error("[Config] Failed to read configuration", "error", err)
			return nil, err
		}
	}

	v.SetEnvKeyReplacer(
		strings.NewReplacer(".", "_"),
	)

	v.AutomaticEnv()

	if err := bindEnv(v); err != nil {
		slog.Error("[Config] Failed to bind environment variables", "error", err)
		return nil, err
	}

	if err := mergeDotenv(v); err != nil {
		slog.Error("[Config] Failed to merge dotenv configuration", "error", err)
		return nil, err
	}

	var cfg Config

	if err := v.Unmarshal(&cfg); err != nil {
		slog.Error("[Config] Failed to decode configuration", "error", err)
		return nil, err
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
			slog.Error("[Config] Failed to bind environment variable", "key", key, "env", env, "error", err)
			return err
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
		slog.Error("[Config] Failed to read dotenv file", "error", err)
		return err
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
		if value != "" {
			overrides.Set(key, value)
		}
	}
	if err := v.MergeConfigMap(overrides.AllSettings()); err != nil {
		slog.Error("[Config] Failed to merge configuration map", "error", err)
		return err
	}
	return nil
}
