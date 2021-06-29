package route

import (
	"github.com/gofiber/fiber/v2"
)

type MenuItem struct {
	Id int `json:"id"`
	Name string `json:"name"`
	Path string `json:"path"`
	Route string `json:"route"`
}
var data = [6]MenuItem{
{Id: 1, Name: "业务拓扑",Path: "http://devops-web.dev.ops.sumscope.com:7004",Route: "/biz/index"},
{Id: 2, Name: "运维工具箱", Path: "http://devops-toolbox.dev.ops.sumscope.com:7003", Route: "/toolbox/home"},
{Id: 3, Name: "CI", Path: "http://menu.dev.ops.sumscope.com:3000/ci", Route: "/ci"},
{Id: 4, Name: "CD", Path: "http://deployer-web.dev.ops.sumscope.com:7006", Route: "/cd/biz"},
{Id: 5, Name: "监控中心", Path: "http://menu.dev.ops.sumscope.com:3000/monitor", Route: "/monitor"},
{Id: 6, Name: "日志中心", Path: "http://menu.dev.ops.sumscope.com:3000/log", Route: "/log"},
}

func MenuHandler(ctx *fiber.Ctx) error {

	return ctx.JSON(data)
}