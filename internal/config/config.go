package config

import "github.com/spf13/viper"

type Config struct {
	Port int      `yaml:"port"`
	DB   DBConfig `yaml:"db"`
}

type DBConfig struct {
	Host     string `yaml:"host"`
	Port     int    `yaml:"port"`
	User     string `yaml:"user"`
	Password string `yaml:"password"`
	DBName   string `yaml:"db_name"`
}

func NewConfig(v *viper.Viper) (*Config, error) {
	return &Config{
		Port: 8080,
		DB: DBConfig{
			Host:     "localhost",
			Port:     5432,
			User:     "postgres",
			Password: "password",
			DBName:   "pantau",
		},
	}, nil
}
