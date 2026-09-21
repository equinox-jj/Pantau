BEGIN;

LOCK TABLE categories, reports IN ACCESS EXCLUSIVE MODE;

-- Rollback restores UUID types and report relationships, but generates new
-- category UUIDs: the original UUID values cannot be recovered.
ALTER TABLE categories ADD COLUMN uuid_id uuid NOT NULL DEFAULT gen_random_uuid();
ALTER TABLE reports ADD COLUMN uuid_category_id uuid;

ALTER TABLE reports DISABLE TRIGGER trg_reports_updated_at;
UPDATE reports AS r
SET uuid_category_id = c.uuid_id
FROM categories AS c
WHERE r.category_id = c.id;
ALTER TABLE reports ENABLE TRIGGER trg_reports_updated_at;

ALTER TABLE reports ALTER COLUMN uuid_category_id SET NOT NULL;
ALTER TABLE reports DROP CONSTRAINT reports_category_fk;
ALTER TABLE reports DROP COLUMN category_id;
ALTER TABLE categories DROP CONSTRAINT categories_pkey;
-- Dropping the serial column also drops its owned sequence.
ALTER TABLE categories DROP COLUMN id;

ALTER TABLE categories RENAME COLUMN uuid_id TO id;
ALTER TABLE reports RENAME COLUMN uuid_category_id TO category_id;

ALTER TABLE categories ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
ALTER TABLE reports ADD CONSTRAINT reports_category_fk
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE RESTRICT;
CREATE INDEX idx_reports_category ON reports (category_id);

COMMIT;
