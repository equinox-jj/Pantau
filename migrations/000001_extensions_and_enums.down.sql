DROP FUNCTION IF EXISTS set_updated_at();
DROP TYPE IF EXISTS report_status;
DROP TYPE IF EXISTS user_role;
-- Extensions are deliberately NOT dropped here: other databases/objects on
-- the same cluster may depend on postgis/pgcrypto, and dropping an
-- extension is a cluster-wide, hard-to-reverse action. If you really need
-- to remove them, do it manually, outside the migration tool.
