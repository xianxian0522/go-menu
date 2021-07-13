package route

import (
	"go-menu/cfg"

	"github.com/gofiber/fiber/v2"
)



func MenuHandler(ctx *fiber.Ctx) error {
	return ctx.JSON(cfg.Menus)
}