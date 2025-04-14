FROM golang:latest as builder

WORKDIR /app

COPY go.mod go.sum .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main ./cmd/main.go

FROM scratch

COPY --from=builder /app/main /main

EXPOSE 8080

ENTRYPOINT ["/main"]
