package route

import (
	"go-menu/cfg"

	"github.com/gofiber/fiber/v2"
)

func NotFoundCiHandler(ctx *fiber.Ctx) error {

	return ctx.Render("index", fiber.Map{
		"routePath": "/ci",
		"menus": cfg.Menus,
	})
}
func NotFoundMonitorHandler(ctx *fiber.Ctx) error {

	return ctx.Render("index", fiber.Map{
		"routePath": "/monitor",
		"menus": cfg.Menus,
	})
}

func NotFoundLogHandler(ctx *fiber.Ctx) error {

	return ctx.Render("index", fiber.Map{
		"routePath": "/log",
		"menus": cfg.Menus,
	})
}