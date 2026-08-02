# Pantau

Pantau is a Spring Boot backend for citizen incident reporting. Citizens submit reports (with photo evidence and
geolocation) about issues in their area, and resolvers track and update the status of those reports through their
lifecycle.

## Tech Stack

- **Java 21** / **Spring Boot 4.1**
- **Spring Data JPA** + **PostgreSQL** (with **PostGIS** via `hibernate-spatial` for geospatial queries)
- **Flyway** for database migrations
- **Spring Security** with **JWT** authentication (`jjwt`)
- **MapStruct** + **Lombok**
- **Cloudinary** for image/file storage
- **Maven** build

## Project Structure

```
src/main/java/com/project/pantau/
├── common/
│   ├── config/       # Security, JWT, and Cloudinary configuration
│   ├── exception/     # Custom exceptions + global exception handler
│   ├── response/      # Shared API response wrapper
│   ├── security/      # JWT filter, user details, auth entry points
│   └── utils/          # Geo utilities, report status transition rules
├── controller/         # REST controllers (Auth, Category, Report)
├── dto/                # Request/response DTOs
├── entity/             # JPA entities (User, Report, Category, ReportStatusHistory)
├── enums/              # UserRole, ReportStatus
├── mapper/             # MapStruct mappers
├── repository/         # Spring Data repositories
└── service/            # Business logic + implementations
```

Database migrations live in `src/main/resources/db/migration`.

## Getting Started

### Prerequisites

- Java 21
- PostgreSQL with the PostGIS extension enabled
- A Cloudinary account (for photo uploads)

### Configuration

Copy `.env` and fill in the required values:

```
# Application
APP_ENV=
APP_PORT=

# Database
DB_HOST=
DB_PORT=
DB_NAME=
DB_USER=
DB_PASSWORD=
DB_MAX_OPEN_CONNS=
DB_MAX_IDLE_CONNS=

# Logging
LOG_LEVEL=

# JWT
JWT_SECRET_KEY=       # e.g. openssl rand -base64 64
JWT_EXPIRATION=       # milliseconds

# Cloudinary
CLOUDINARY_NAME=
CLOUDINARY_KEY=
CLOUDINARY_SECRET=
```

Flyway runs automatically on startup and applies migrations against `DB_NAME`.

### Run

```bash
./mvnw spring-boot:run
```

### Test

```bash
./mvnw test
```

## API Overview

All responses are wrapped in a common `ApiResponse<T>` envelope (`success`, `message`, `data`) and JSON fields use
snake_case.

### Auth — `/api/v1/auth`

| Method | Endpoint    | Description               |
|--------|-------------|---------------------------|
| POST   | `/register` | Register a new user       |
| POST   | `/login`    | Authenticate, returns JWT |

### Reports — `/api/v1/reports`

| Method | Endpoint       | Access     | Description                                 |
|--------|----------------|------------|---------------------------------------------|
| POST   | `/`            | `CITIZEN`  | Create a report (multipart, with photo)     |
| GET    | `/{id}`        | Public     | Get report detail                           |
| GET    | `/nearby`      | Public     | List reports near a lat/lng within a radius |
| GET    | `/mine`        | `CITIZEN`  | List the authenticated user's reports       |
| PATCH  | `/{id}/status` | `RESOLVER` | Update a report's status                    |

Report status follows: `REPORTED → ACKNOWLEDGED → IN_PROGRESS → RESOLVED → CLOSED`, with `REJECTED` as a terminal
alternate state. Allowed transitions are enforced in `ReportStatusTransitions`.

### Categories — `/api/v1/categories`

| Method | Endpoint       | Description          |
|--------|----------------|----------------------|
| GET    | `/`            | List all categories  |
| GET    | `/{id}`        | Get category by ID   |
| GET    | `/slug/{slug}` | Get category by slug |

## Roles

- **CITIZEN** — creates reports, views own reports
- **RESOLVER** — updates report status
