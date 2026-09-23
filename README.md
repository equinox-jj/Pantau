# Pantau

Pantau is a civic issue reporting project. Residents can submit reports with a location and photos, see nearby reports, and follow their status. Resolvers can review a queue and update report statuses.

This repository contains two applications:

| Directory | Application | Stack |
| --- | --- | --- |
| [`frontend/`](frontend/README.md) | Mobile app | Flutter and Dart |
| [`backend/`](backend/README.md) | REST API | Go, PostgreSQL, and PostGIS |

The applications keep their own dependencies, tests, and setup instructions. There is no root-level build command.

## Run locally

1. Set up PostgreSQL with PostGIS and `pgcrypto`, create a database, and configure the API's database, JWT, and Cloudinary settings. See the [backend setup guide](backend/README.md#run-locally) for the required environment variables and migration steps.
2. From `backend/`, apply the SQL migrations to a fresh database in numeric order, then start the API:

   ```sh
   cd backend
   for migration in migrations/*.up.sql; do
     psql -X -v ON_ERROR_STOP=1 -h localhost -U postgres -d pantau -f "$migration" || break
   done
   go run ./cmd/api
   ```

   Adjust the database connection options if needed. The API listens on port `8080` by default and serves routes under `/api/v1`.

3. In another terminal, start the mobile app:

   ```sh
   cd frontend
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   flutter run
   ```

The app connects to the local API on port `8080`. It uses `10.0.2.2` on an Android emulator and `127.0.0.1` on other targets. For a physical device, change the address in [`api_endpoints.dart`](frontend/lib/core/network/api_endpoints.dart) to one it can reach. See the [frontend guide](frontend/README.md) for the app's architecture and tooling.

## Tests

Run each suite from its application directory:

```sh
(cd backend && go test ./...)
(cd frontend && flutter test)
```

## Repository history

The Flutter and Go projects were developed separately and imported into this repository under `frontend/` and `backend/` using Git subtree. Their Git history is preserved in the monorepo.
