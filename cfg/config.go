package cfg

import (
	"fmt"

	"github.com/spf13/pflag"
	"github.com/spf13/viper"
)


var Menus = make([]MenuItem,0)
type AppConfig struct {
	Port string
	StaticPath string
	ViewPath   string
	ViewExtensions string
}

type MenuItem struct {
	Id int `json:"id"`
	Name string `json:"name"`
	Path string `json:"path"`
	Route string `json:"route"`
}



func DefaultAppConfig()AppConfig{
	return AppConfig{Port: "3001",
			StaticPath: "./public",
			ViewPath:   "./views",
			ViewExtensions: ".html",
	}
}
func LoadConfig() AppConfig{
	var (
		cfgFile = pflag.StringP("config", "c", "", "config file")
	)

	pflag.Parse()

	if *cfgFile != "" {
		viper.SetConfigFile(*cfgFile)
	} else {
		viper.AddConfigPath("config")
		viper.SetConfigName("go-menu")
	}
	viper.AutomaticEnv()

	if err := viper.ReadInConfig(); err != nil {
		panic(err)
	}

	fmt.Println("Using config file:", viper.ConfigFileUsed())

	configs := DefaultAppConfig()
	if err := viper.UnmarshalKey("app",&configs); err != nil {
		panic(err)
	}
	err := viper.UnmarshalKey("menu",&Menus)
	if err != nil{
		panic("got menu error "+err.Error())
	}
	return configs
}
