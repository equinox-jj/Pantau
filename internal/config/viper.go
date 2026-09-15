package config

import "github.com/spf13/viper"

func NewViper() *viper.Viper {
	v := viper.New()
	return v
}
