BEGIN;

LOCK TABLE categories, reports IN ACCESS EXCLUSIVE MODE;

-- UUIDs cannot be cast to bigint. Assign numeric IDs and remap each report
-- through its existing category before replacing the old columns.
ALTER TABLE categories ADD COLUMN bigint_id bigserial;
ALTER TABLE reports ADD COLUMN bigint_category_id bigint;

ALTER TABLE reports DISABLE TRIGGER trg_reports_updated_at;
UPDATE reports AS r
SET bigint_category_id = c.bigint_id
FROM categories AS c
WHERE r.category_id = c.id;
ALTER TABLE reports ENABLE TRIGGER trg_reports_updated_at;

ALTER TABLE reports ALTER COLUMN bigint_category_id SET NOT NULL;
ALTER TABLE reports DROP CONSTRAINT reports_category_fk;
ALTER TABLE reports DROP COLUMN category_id;
ALTER TABLE categories DROP CONSTRAINT categories_pkey;
ALTER TABLE categories DROP COLUMN id;

ALTER TABLE categories RENAME COLUMN bigint_id TO id;
ALTER SEQUENCE categories_bigint_id_seq RENAME TO categories_id_seq;
ALTER TABLE reports RENAME COLUMN bigint_category_id TO category_id;

ALTER TABLE categories ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
ALTER TABLE reports ADD CONSTRAINT reports_category_fk
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE RESTRICT;
CREATE INDEX idx_reports_category ON reports (category_id);

COMMIT;
