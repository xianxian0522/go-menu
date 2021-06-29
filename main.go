package main

import (
	"fmt"
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"github.com/gofiber/template/html"
	"go-menu/route"
)

func main()  {
	fmt.Println("menu")
	engine := html.New("./views", ".html")
	app := fiber.New(fiber.Config{ Views: engine})
	app.Use(cors.New())
	app.Static("/", "./public")
	app.Get("/api/my/bar", route.MenuHandler)
	app.Get("/ci", route.NotFoundCiHandler)
	app.Get("/monitor", route.NotFoundMonitorHandler)
	app.Get("/log", route.NotFoundLogHandler)
	app.Get("/", func(ctx *fiber.Ctx) error {
		return fiber.NewError(404, "error message")
	})

	app.Listen(":3001")
}