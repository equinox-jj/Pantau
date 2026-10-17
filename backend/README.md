# Pantau API

Pantau's backend is a Go REST API for reporting local issues. Citizens submit reports with a location and photos, browse nearby reports, and follow status history. Resolvers work through a queue of nearby reports and move each one through the status workflow.

Built with [Fiber v3](https://gofiber.io), [Uber Fx](https://uber-go.github.io/fx/) for dependency injection, GORM on PostgreSQL + PostGIS, and MinIO for photo and avatar storage.

## Requirements

- Go 1.27.1 (as specified in `go.mod`)
- PostgreSQL with the PostGIS and `pgcrypto` extensions available
- MinIO (or another S3-compatible store) for photo uploads
- Docker with Compose v2 (optional, to run the database and MinIO, or the whole stack, in containers)

## Project layout

```
cmd/api/            entry point (starts the Fx app)
internal/
  app/              Fx wiring and the Fiber server
  config/           .env / environment loading and validation
  controller/       HTTP handlers
  database/         GORM connection
  dto/              request and response types, plus entity mappers
  entity/           GORM models
  enums/            report status, user role, queue tab
  middleware/       JWT authentication
  repository/       database access
  routes/           route table and rate limits
  service/          business logic, uploads
  storage/          MinIO client
pkg/                errors, response envelope, JWT/bcrypt, validation, geo and pagination helpers
migrations/         numbered SQL migrations (golang-migrate format)
```

## Run locally

The quickest setup runs PostgreSQL and MinIO in Docker and the API on your machine with `go run`.

1. Copy `.env.example` to `.env` in the backend directory and replace the placeholders. The JWT secret must be at least 32 bytes and contain no whitespace (`openssl rand -hex 32`). You can also set any variable in your shell; shell values override `.env`. Keep `.env` out of version control.
2. Start the database, apply the migrations, and prepare MinIO:

   ```sh
   docker compose -f docker-compose.dev.yml up -d migrate minio-init
   ```

   This starts PostGIS on `127.0.0.1:5433` and MinIO on `127.0.0.1:9000`, applies `migrations/*.up.sql`, creates `MINIO_BUCKET` with a public-read (not listable) policy, and creates the API's own MinIO user (`MINIO_ACCESS_KEY`/`MINIO_SECRET_KEY`). The sample `.env` already points `DB_HOST`/`DB_PORT` at this database.

3. Start the API:

   ```sh
   go run ./cmd/api
   ```

   It listens on `APP_PORT` (`8080` in the sample `.env`) and serves every route under `/api/v1`. When run this way, the API connects as the database owner (`DB_USER`).

### Using your own PostgreSQL and MinIO

1. Create a PostgreSQL database named `pantau` (or set `DB_NAME`). The database user must be able to create extensions, types, and tables. Set `DB_HOST` and `DB_PORT` (usually `5432`) in `.env`.
2. Apply the SQL migrations in numeric order. For a new database, one way to do this with `psql` is:

   ```sh
   for migration in migrations/*.up.sql; do
     psql -X -v ON_ERROR_STOP=1 -h localhost -U postgres -d pantau -f "$migration" || break
   done
   ```

   Adjust the connection options to match your database. This loop is intended for a fresh database; it does not record which migrations have been applied. The `migrate` compose service (golang-migrate) does.

3. Point `MINIO_ENDPOINT` at a running MinIO with `MINIO_BUCKET` already created. On startup the API only checks that the bucket exists; it does not create it or set its policy. Outside production, the API falls back to `MINIO_ROOT_USER`/`MINIO_ROOT_PASSWORD` when `MINIO_ACCESS_KEY`/`MINIO_SECRET_KEY` are unset.
4. Run `go run ./cmd/api`.

### Image URLs (`MINIO_PUBLIC_URL`)

Stored photo URLs are `MINIO_PUBLIC_URL/<bucket>/<key>`, so this must be an address the app can reach:

- iOS simulator / desktop: `http://localhost:9000`
- Android emulator: `http://10.0.2.2:9000`
- Physical device: the dev compose binds its ports to `127.0.0.1`, so your LAN IP does not reach them. On Android, run `adb reverse tcp:9000 tcp:9000` (and `tcp:8080 tcp:8080` for the API) and use `http://localhost:9000`; otherwise put a tunnel or reverse proxy in front.
- Production: the public files domain that routes to MinIO port 9000

URLs are stored when a photo is uploaded, so changing this value does not rewrite existing photos.

### Resolver accounts

`POST /auth/register` always creates a citizen. To make a resolver, register the account and then change its role in the database:

```sql
UPDATE users SET role = 'resolver' WHERE email = 'resolver@example.com';
```

## Configuration

The API reads `.env` from the working directory, then the process environment. `.env.example` documents every variable; the ones the API validates on startup are:

| Variable | Notes |
| --- | --- |
| `APP_ENV` | `production` requires `MINIO_ACCESS_KEY`/`MINIO_SECRET_KEY` (no fallback to the MinIO root user). |
| `APP_PORT` | Required, `1`–`65535`. |
| `TRUSTED_PROXIES` | Comma-separated proxy IPs/CIDRs whose `X-Forwarded-For` is trusted for the client IP. Leave empty when clients connect directly. |
| `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD` | Database connection. |
| `DB_MAX_OPEN_CONNS`, `DB_MAX_IDLE_CONNS` | Open must be positive; idle must not exceed open. |
| `UPLOAD_MAX_FILE_SIZE`, `UPLOAD_MAX_REQUEST_SIZE` | Sizes such as `5MB` (`B`, `KB`, `MB`, `GB`, powers of 1024). The request size is Fiber's body limit and must be larger than the file size. |
| `JWT_SECRET_KEY`, `JWT_EXPIRATION` | Secret of at least 32 bytes with no whitespace; a positive Go duration such as `168h`. |
| `MINIO_ENDPOINT`, `MINIO_ACCESS_KEY`, `MINIO_SECRET_KEY`, `MINIO_USE_SSL`, `MINIO_BUCKET`, `MINIO_PUBLIC_URL` | Object storage; endpoint, credentials, bucket, and public URL are required. |

`POSTGRES_PORT`, `DB_APP_USER`, `DB_APP_PASSWORD`, `MINIO_API_PORT`, `MINIO_CONSOLE_PORT`, and `MINIO_ROOT_*` are used by the compose files. `LOG_LEVEL`, `MIGRATION_ENABLED`, `GORM_SHOW_SQL`, and `UPLOAD_ENABLED` are loaded but do not change the API's behavior yet.

## Run with Docker

Both compose files read variables from `backend/.env`; required ones (passwords, MinIO keys) stop compose with a message when unset. Before the API starts, three one-shot jobs run, each safe to rerun:

- `migrate` applies `migrations/*.up.sql` with [golang-migrate](https://github.com/golang-migrate/migrate), as the database owner (`DB_USER`).
- `pantau-db-init` creates the API's own role (`DB_APP_USER`/`DB_APP_PASSWORD`), which can read and write rows but not change the schema; default privileges cover tables later migrations add.
- `minio-init` creates `MINIO_BUCKET` with an anonymous read-only policy (objects, not listing), and the API's own MinIO user, limited to that bucket.

The API container connects as `DB_APP_USER` and `MINIO_ACCESS_KEY`, never as the database owner or the MinIO root user. It talks to `pantau-db` and `minio` inside the compose network with `MINIO_USE_SSL=false`; serve HTTPS through `MINIO_PUBLIC_URL` (e.g. a reverse proxy), not through `MINIO_USE_SSL`.

Development binds every port to `127.0.0.1`: Postgres on `POSTGRES_PORT` (`5433`), MinIO on `MINIO_API_PORT` (`9000`), MinIO console on `MINIO_CONSOLE_PORT` (`9001`), API on `APP_PORT`.

```sh
docker compose -f docker-compose.dev.yml up -d --build
docker compose -f docker-compose.dev.yml up -d --build api   # pick up code changes
```

Production (`docker-compose.prod.yml`) is the Dokploy stack (Compose Path `./backend/docker-compose.prod.yml`). It publishes no host ports: Traefik routes the API (`8080`) and MinIO (`9000`) domains, and Dokploy writes the Environment tab to `.env` next to the file. It defaults `APP_ENV=production`, and requires `TRUSTED_PROXIES` (Traefik's network CIDR, so the per-IP rate limits see real client IPs), `MINIO_PUBLIC_URL` (the public files domain), `MINIO_ACCESS_KEY`/`MINIO_SECRET_KEY` and `DB_APP_PASSWORD`. The API gets its settings from the explicit `environment` list in that file, not `env_file`, so `MINIO_ROOT_*` and the owner password never reach it; add any new config variable there.

The image is distroless (no shell) and ships only `/api`. Run migrations through the `migrate` service, not inside the api container.

If you point `migrate` at a database that was already migrated by hand with `psql`, mark the existing version once so it is not re-applied (replace the version with the last migration you applied):

```sh
docker compose -f docker-compose.dev.yml run --rm migrate \
  -path=/migrations -database "postgres://$DB_USER:$DB_PASSWORD@pantau-db:5432/$DB_NAME?sslmode=disable" force 10
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
| PUT | `/users/me/avatar` | Add or replace your profile picture (multipart field `avatar`) |
| DELETE | `/users/me/avatar` | Remove your profile picture |
| GET | `/categories/` | List active categories |
| GET | `/categories/:id` | Get a category by ID |
| GET | `/categories/slug/:slug` | Get a category by slug |
| POST | `/reports/` | Create a report (citizen) |
| GET | `/reports/nearby` | Find nearby reports |
| GET | `/reports/mine` | List your reports, newest first (citizen) |
| GET | `/reports/queue` | View the resolver queue (resolver) |
| GET | `/reports/:id` | Get report details |
| PATCH | `/reports/:id` | Update your report (citizen) |
| DELETE | `/reports/:id` | Delete your report (citizen) |
| GET | `/reports/:id/history` | Get status history |
| PATCH | `/reports/:id/status` | Change report status (resolver) |

Register, login, and change password are rate limited per client IP: 5, 10, and 5 requests per minute. Behind a reverse proxy, set `TRUSTED_PROXIES` so each client gets its own limit.

For example, register a citizen:

```sh
curl -X POST http://localhost:8080/api/v1/auth/register \
  -H 'Content-Type: application/json' \
  -d '{"email":"person@example.com","password":"example-password","display_name":"Example Person"}'
```

### Responses

Successful responses wrap the payload; list endpoints with paging add `pagination`:

```json
{
  "success": true,
  "response": {
    "data": [],
    "pagination": { "page": 1, "limit": 20, "offset": 0, "total": 42, "total_pages": 3, "has_next": true }
  }
}
```

Errors set `success` to `false` and list `errors`, each with `code`, `message`, and, for validation errors, `field`.

### Reports

Creating a report requires `multipart/form-data` with `category_id`, `latitude`, `longitude`, and one to four `photos` files. `description` is optional (up to 2,000 characters). `PATCH /reports/:id` takes the same fields; `photos` is optional there, and sending any replaces all existing photos. Images, including avatars, can be at most `UPLOAD_MAX_FILE_SIZE` (5 MB by default); JPEG, PNG, and WebP are accepted.

| Endpoint | Query parameters |
| --- | --- |
| `GET /reports/nearby` | `latitude`, `longitude` (required); `radius_meter` (default 1000, max 50000); `limit` (default 20, max 100) |
| `GET /reports/mine` | `limit` (default 20, max 100); `offset` (default 0) |
| `GET /reports/queue` | `tab` (`open`, `in_progress`, or `resolved`), `latitude`, `longitude` (required); `radius_meter` (default 5000, max 50000); `limit` (default 20, max 100); `offset` (default 0) |

The queue's `open` tab holds `reported` and `acknowledged` reports.

### Status workflow

`PATCH /reports/:id/status` takes JSON `{"to_status": "...", "note": "..."}` and accepts only these transitions:

```
reported ──► acknowledged ──► in_progress ──► resolved ──► closed
    │              │               │
    └──────────────┴───────────────┴──► rejected
```

Rejecting requires a `note` (up to 1,000 characters). Every change is recorded in `/reports/:id/history`. Citizens can edit or delete a report only while it is still `reported`.

## Development

Run the Go test suite with:

```sh
go test ./...
```

Tests live next to the code they cover (`internal/service`, `pkg/errs`).
