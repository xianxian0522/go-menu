NOW=$(shell date -u '+%Y-%m-%dT%H:%M:%SZ')

#GIT_REV=$(shell git rev-parse HEAD)

#GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

GO_OPTS=GOOS="${GOOS}" GOARCH="${GOARCH}"

.DEFAULT_GOAL := build

build: deps build-menu

deps:
	@mkdir -p bin

build-menu: deps
	@echo "打包menu"
	${GO_OPTS} go build -o bin/go-menu ./main.go