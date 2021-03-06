#!/bin/bash
ENV=$1

if [ $ENV = "DEV" ];then
cat << EOF > ./go-menu.yaml
app:
  port: 3000
  staticPath: ./public
  viewPath: ./views
  viewExtensions: .html

menu:
  - id: 1
    name: 业务拓扑
    path: http://devops-web.dev.ops.sumscope.com:7004
    route: /biz/index
  - id: 2
    name: 运维工具箱
    path: http://devops-toolbox.dev.ops.sumscope.com:7003
    route: /toolbox/home
  - id: 3
    name: CICD
    path: http://cicd-web.dev.ops.sumscope.com:7007
    route: /cicd/biz
  - id: 4
    name: 发布系统
    path: http://deployer-web.dev.ops.sumscope.com:7006
    route: /cd/biz
  - id: 5
    name: 监控中心
    path: http://menu.dev.ops.sumscope.com:3000/monitor
    route: /monitor
  - id: 6
    name: 日志中心
    path: http://menu.dev.ops.sumscope.com:3000/log
    route: /log
  - id: 7
    name: 登录中心
    path: http://sso-admin.dev.ops.sumscope.com:7005
    route: /client
EOF
fi

if [ $ENV = "PROD" ];then
cat << EOF > ./go-menu.yaml
app:
  port: 3000
  staticPath: ./public
  viewPath: ./views
  viewExtensions: .html

menu:
  - id: 1
    name: 业务拓扑
    path: http://devops-web.ops.sumscope.com
    route: /biz/index
  - id: 2
    name: 运维工具箱
    path: http://devops-toolbox.ops.sumscope.com
    route: /toolbox/home
  - id: 3
    name: CICD
    path: http://cicd-web.ops.sumscope.com:7007
    route: /cicd/biz
  - id: 4
    name: 发布系统
    path: http://deployer-web.ops.sumscope.com
    route: /cd/biz
  - id: 5
    name: 监控中心
    path: http://menu.ops.sumscope.com/monitor
    route: /monitor
  - id: 6
    name: 日志中心
    path: http://menu.ops.sumscope.com/log
    route: /log
  - id: 7
    name: 登录中心
    path: http://sso-admin.ops.sumscope.com:7005
    route: /client
EOF
fi