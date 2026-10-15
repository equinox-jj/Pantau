# syntax=docker/dockerfile:1

FROM golang:1.27.1-alpine AS base
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

# Development: source is bind-mounted by docker-compose.dev.yml.
FROM base AS dev
COPY . .
CMD ["go", "run", "./cmd/api"]

FROM base AS build
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -trimpath -ldflags="-s -w" -o /out/api ./cmd/api

FROM gcr.io/distroless/static-debian12:nonroot AS prod
COPY --from=build /out/api /api
EXPOSE 8080
USER nonroot:nonroot
ENTRYPOINT ["/api"]
