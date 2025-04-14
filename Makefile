start:
	go run ./cmd/.

build:
	go build ./cmd/main.go

docker:
	docker build -t ecs .

dockerrun:
	docker run --name ecs_container -p 8080:8080 ecs

.PHONY: start build