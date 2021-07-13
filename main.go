package main

import (
	"log"

	"go-menu/cfg"
	"go-menu/route"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"github.com/gofiber/template/html"
)

func main()  {
	appSettings:= cfg.LoadConfig()
	engine := html.New(appSettings.ViewPath, appSettings.ViewExtensions)
	app := fiber.New(fiber.Config{ Views: engine})
	app.Use(cors.New())
	app.Static("/", appSettings.StaticPath)
	app.Get("/api/my/bar", route.MenuHandler)
	app.Get("/ci", route.NotFoundCiHandler)
	app.Get("/monitor", route.NotFoundMonitorHandler)
	app.Get("/log", route.NotFoundLogHandler)
	app.Get("/", func(ctx *fiber.Ctx) error {
		return fiber.NewError(404, "error message")
	})

	log.Fatal(app.Listen(":"+appSettings.Port))
}