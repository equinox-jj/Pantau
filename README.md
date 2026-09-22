# Pantau

Pantau is a Go API for reporting local issues. Citizens can submit reports with a location and photos, browse nearby reports, and follow status history. Resolvers can review a report queue and update report statuses.

## Requirements

- Go 1.27.1 (as specified in `go.mod`)
- PostgreSQL with the PostGIS and `pgcrypto` extensions available
- A Cloudinary account for photo uploads

## Run locally

1. Create a PostgreSQL database named `pantau` (or set `DB_NAME` to another database). The database user must be able to create extensions, types, and tables when applying migrations.
2. Set the required configuration in your shell or in a local `.env` file in the project root:

   ```dotenv
   DB_HOST=localhost
   DB_PORT=5432
   DB_NAME=pantau
   DB_USER=postgres
   DB_PASSWORD=your_database_password
   JWT_SECRET_KEY=replace_with_a_random_secret_of_at_least_32_bytes
   CLOUDINARY_NAME=your_cloud_name
   CLOUDINARY_KEY=your_api_key
   CLOUDINARY_SECRET=your_api_secret
   ```

   Keep `.env` out of version control. `config.yaml` supplies development defaults; environment variables override it. The JWT secret must be at least 32 bytes long and contain no whitespace.

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

   It listens on port `8080` by default. Set `APP_PORT` to change the port.

## API

All routes use the `/api/v1` prefix. Register and login are public. Other routes require `Authorization: Bearer <token>`.

| Method | Path | Purpose |
| --- | --- | --- |
| POST | `/auth/register` | Register a citizen |
| POST | `/auth/login` | Sign in |
| GET | `/users/me` | Get the current user's profile |
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
