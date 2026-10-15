# Pantau

Pantau is a Go API for reporting local issues. Citizens can submit reports with a location and photos, browse nearby reports, and follow status history. Resolvers can review a report queue and update report statuses.

## Requirements

- Go 1.27.1 (as specified in `go.mod`)
- PostgreSQL with the PostGIS and `pgcrypto` extensions available
- MinIO (or another S3-compatible store) for photo uploads
- Docker with Compose v2 (optional, to run everything in containers)

## Run locally

1. Create a PostgreSQL database named `pantau` (or set `DB_NAME` to another database). The database user must be able to create extensions, types, and tables when applying migrations.
2. Copy `.env.example` to `.env` in the backend directory and replace the database, JWT, and MinIO placeholders with your own values. You can also set these variables in your shell; shell values override `.env`. Keep `.env` out of version control. The JWT secret must be at least 32 bytes long and contain no whitespace.

3. Apply the SQL migrations in numeric order. For a new database, one way to do this with `psql` is:

   ```sh
   for migration in migrations/*.up.sql; do
     psql -X -v ON_ERROR_STOP=1 -h localhost -U postgres -d pantau -f "$migration" || break
   done
   ```

   Adjust the connection options to match your database. This command is intended for a fresh database; the project does not currently include a migration runner or record which migrations have been applied. `go run ./cmd/migrate` is currently a placeholder.

4. Start the API from the project root:

   ```sh
   go run ./cmd/api
   ```

   The sample `.env` listens on port `8080`. Set `APP_PORT` to change the port.

   The API needs a running MinIO at `MINIO_ENDPOINT`. On startup it creates `MINIO_BUCKET` if missing and makes its objects publicly readable. The quickest way to get one is `docker compose -f docker-compose.dev.yml up -d minio`.

### Image URLs (`MINIO_PUBLIC_URL`)

Stored photo URLs are `MINIO_PUBLIC_URL/<bucket>/<key>`, so this must be an address the app can reach:

- iOS simulator / desktop: `http://localhost:9000`
- Android emulator: `http://10.0.2.2:9000`
- Physical device: your machine's LAN IP, e.g. `http://192.168.1.20:9000`
- Production: the public host that serves MinIO port 9000

URLs are stored when a photo is uploaded, so changing this value does not rewrite existing photos.

## Run with Docker

Both compose files read variables from `backend/.env`. Inside the API container, `DB_HOST`, `MINIO_ENDPOINT` and `MINIO_USE_SSL=false` are overridden to point at the compose services; serve HTTPS through `MINIO_PUBLIC_URL` (e.g. a reverse proxy), not through `MINIO_USE_SSL`.

Development (Postgres on host port `5433`, MinIO on `9000`, MinIO console on `9001`, API on `APP_PORT`):

```sh
docker compose -f docker-compose.dev.yml up -d --build
docker compose -f docker-compose.dev.yml restart api   # pick up code changes
```

Production (only the API and MinIO port `9000` are published):

```sh
docker compose -f docker-compose.prod.yml up -d --build
```

The `migrate` service applies `migrations/*.up.sql` with [golang-migrate](https://github.com/golang-migrate/migrate) before the API starts. If you point it at a database that was already migrated by hand with `psql`, mark the existing version once so it is not re-applied (replace the version with the last migration you applied):

```sh
docker compose -f docker-compose.dev.yml run --rm migrate \
  -path=/migrations -database "postgres://$DB_USER:$DB_PASSWORD@postgres:5432/$DB_NAME?sslmode=disable" force 9
```

The upstream `minio/minio` image is no longer published on Docker Hub, so both compose files use `pgsty/minio`, a community-maintained build of the same MinIO server (pinned to `RELEASE.2026-08-04T00-00-00Z`). Any S3-compatible MinIO image with the same `server` command works as a replacement.

## API

All routes use the `/api/v1` prefix. Register and login are public. Other routes require `Authorization: Bearer <token>`.

| Method | Path | Purpose |
| --- | --- | --- |
| POST | `/auth/register` | Register a citizen |
| POST | `/auth/login` | Sign in |
| GET | `/users/me` | Get the current user's profile |
| PATCH | `/users/me/password` | Change your password (`current_password`, `new_password`); 204 on success, 400 if the current password is wrong |
| PUT | `/users/me/avatar` | Add or replace your profile picture (multipart field `avatar`, JPEG/PNG/WebP, max 5 MB by default) |
| DELETE | `/users/me/avatar` | Remove your profile picture |
| GET | `/categories/` | List active categories |
| GET | `/categories/:id` | Get a category by ID |
| GET | `/categories/slug/:slug` | Get a category by slug |
| POST | `/reports/` | Create a report (citizen) |
| GET | `/reports/nearby` | Find nearby reports |
| GET | `/reports/mine` | List your reports (citizen) |
| GET | `/reports/queue` | View the resolver queue (resolver) |
| GET | `/reports/:id` | Get report details |
| PATCH | `/reports/:id` | Update your report (citizen) |
| DELETE | `/reports/:id` | Delete your report (citizen) |
| GET | `/reports/:id/history` | Get status history |
| PATCH | `/reports/:id/status` | Change report status (resolver) |

For example, register a citizen:

```sh
curl -X POST http://localhost:8080/api/v1/auth/register \
  -H 'Content-Type: application/json' \
  -d '{"email":"person@example.com","password":"example-password","display_name":"Example Person"}'
```

Creating a report requires `multipart/form-data` with `category_id`, `latitude`, `longitude`, and one to four `photos` files. `description` is optional. Each image can be at most 5 MB by default; JPEG, PNG, and WebP are accepted.

## Development

Run the Go test suite with:

```sh
go test ./...
```
