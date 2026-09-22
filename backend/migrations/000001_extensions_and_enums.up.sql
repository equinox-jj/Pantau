-- Extensions
CREATE EXTENSION IF NOT EXISTS postgis;    -- geospatial types & functions
CREATE EXTENSION IF NOT EXISTS pgcrypto;   -- gen_random_uuid()

-- Enums
CREATE TYPE user_role AS ENUM ('citizen', 'resolver');

CREATE TYPE report_status AS ENUM (
    'reported',
    'acknowledged',
    'in_progress',
    'resolved',
    'closed',
    'rejected'
);

-- Trigger function: keep updated_at fresh on UPDATE. Shared by every table
-- that has an updated_at column (users, reports).
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS trigger AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
