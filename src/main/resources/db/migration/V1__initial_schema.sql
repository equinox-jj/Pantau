-- =============================================================================
-- V1__initial_schema.sql
-- Pantau — initial schema (extensions, enums, tables, indexes, triggers)
--
-- Adapted from the hand-written DDL. Two deliberate changes:
--   1. No BEGIN/COMMIT — Flyway wraps every migration in its own
--      transaction; nesting our own would be redundant (and errors out
--      on some statements).
--   2. Seed data moved to V2 — schema and data changes are easier to
--      reason about (and roll forward) when separated.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Extensions
-- NOTE: CREATE EXTENSION needs elevated privileges. See FLYWAY_SETUP.md
-- if your app's DB user is not allowed to run these.
-- -----------------------------------------------------------------------------
CREATE
EXTENSION IF NOT EXISTS postgis;
CREATE
EXTENSION IF NOT EXISTS pgcrypto;

-- -----------------------------------------------------------------------------
-- Enums
-- -----------------------------------------------------------------------------
CREATE TYPE user_role AS ENUM ('CITIZEN', 'RESOLVER');

CREATE TYPE report_status AS ENUM (
    'REPORTED',
    'ACKNOWLEDGED',
    'IN_PROGRESS',
    'RESOLVED',
    'CLOSED',
    'REJECTED'
);

-- -----------------------------------------------------------------------------
-- Trigger function: keep updated_at fresh on UPDATE
-- -----------------------------------------------------------------------------
CREATE
OR REPLACE FUNCTION set_updated_at()
RETURNS trigger AS $$
BEGIN
    NEW.updated_at
= now();
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- -----------------------------------------------------------------------------
-- users
-- -----------------------------------------------------------------------------
CREATE TABLE users
(
    id           uuid PRIMARY KEY     DEFAULT gen_random_uuid(),
    email        text        NOT NULL,
    password     text        NOT NULL,
    display_name text        NOT NULL,
    role         user_role   NOT NULL DEFAULT 'CITIZEN',
    created_at   timestamptz NOT NULL DEFAULT now(),
    updated_at   timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT users_email_key UNIQUE (email),
    CONSTRAINT users_email_format_chk CHECK (position('@' in email) > 1)
);

CREATE TRIGGER trg_users_updated_at
    BEFORE UPDATE
    ON users
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- -----------------------------------------------------------------------------
-- categories
-- -----------------------------------------------------------------------------
CREATE TABLE categories
(
    id         bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name       text        NOT NULL,
    slug       text        NOT NULL,
    is_active  boolean     NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT categories_slug_key UNIQUE (slug)
);

-- -----------------------------------------------------------------------------
-- reports
-- -----------------------------------------------------------------------------
CREATE TABLE reports
(
    id          uuid PRIMARY KEY       DEFAULT gen_random_uuid(),
    reporter_id uuid          NOT NULL,
    category_id bigint        NOT NULL,
    photo_url   text          NOT NULL,
    description text,
    location    geography(Point, 4326) NOT NULL,
    status      report_status NOT NULL DEFAULT 'REPORTED',
    created_at  timestamptz   NOT NULL DEFAULT now(),
    updated_at  timestamptz   NOT NULL DEFAULT now(),
    CONSTRAINT reports_reporter_fk FOREIGN KEY (reporter_id)
        REFERENCES users (id) ON DELETE RESTRICT,
    CONSTRAINT reports_category_fk FOREIGN KEY (category_id)
        REFERENCES categories (id) ON DELETE RESTRICT
);

CREATE TRIGGER trg_reports_updated_at
    BEFORE UPDATE
    ON reports
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- Spatial index powering the "nearby reports" query (ST_DWithin + KNN <->).
CREATE INDEX idx_reports_location ON reports USING GIST (location);

-- Supporting indexes for common filters / sorts.
CREATE INDEX idx_reports_status ON reports (status);
CREATE INDEX idx_reports_category ON reports (category_id);
CREATE INDEX idx_reports_reporter ON reports (reporter_id);
CREATE INDEX idx_reports_created_at ON reports (created_at DESC);

-- -----------------------------------------------------------------------------
-- report_status_history  (append-only audit trail)
-- -----------------------------------------------------------------------------
CREATE TABLE report_status_history
(
    id          uuid PRIMARY KEY       DEFAULT gen_random_uuid(),
    report_id   uuid          NOT NULL,
    actor_id    uuid          NOT NULL,
    from_status report_status,
    to_status   report_status NOT NULL,
    note        text,
    created_at  timestamptz   NOT NULL DEFAULT now(),
    CONSTRAINT rsh_report_fk FOREIGN KEY (report_id)
        REFERENCES reports (id) ON DELETE CASCADE,
    CONSTRAINT rsh_actor_fk FOREIGN KEY (actor_id)
        REFERENCES users (id) ON DELETE RESTRICT,
    CONSTRAINT rsh_rejected_requires_note_chk
        CHECK (to_status <> 'REJECTED' OR note IS NOT NULL)
);

CREATE INDEX idx_rsh_report ON report_status_history (report_id);
CREATE INDEX idx_rsh_created_at ON report_status_history (created_at);
