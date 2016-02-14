EXECUTABLE ?= server
IMAGE ?= glowd/frontend

go-clean:
	go clean -i

go-deps:
	go get -d -v

go-test:
	go test

docker: go-build elm-build
	docker build --no-cache --rm -t $(IMAGE) .

$(EXECUTABLE): $(wildcard *.go)
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o $@

go-build: $(EXECUTABLE)


elm-deps:
	elm-package install -y

elm-build:
	elm-make elm/Main.elm --output ./assets/main.js
