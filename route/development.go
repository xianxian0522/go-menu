package route

import "github.com/gofiber/fiber/v2"

func NotFoundCiHandler(ctx *fiber.Ctx) error {

	return ctx.Render("index", fiber.Map{
		"routePath": "/ci",
		"menus": data,
	})
}
func NotFoundMonitorHandler(ctx *fiber.Ctx) error {

	return ctx.Render("index", fiber.Map{
		"routePath": "/monitor",
		"menus": data,
	})
}

func NotFoundLogHandler(ctx *fiber.Ctx) error {

	return ctx.Render("index", fiber.Map{
		"routePath": "/log",
		"menus": data,
	})
}