-- Move report photos from a single column on `reports` into a child table
-- so a report can have up to 4 ordered photos.
-- Mirrors V4__add_report_photos.sql from the Spring Boot/Flyway repo.
CREATE TABLE report_photos (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    report_id       uuid    NOT NULL,
    photo_url       text    NOT NULL,
    photo_public_id text,
    position        integer NOT NULL,
    created_at      timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT report_photos_report_fk FOREIGN KEY (report_id)
        REFERENCES reports (id) ON DELETE CASCADE,
    CONSTRAINT report_photos_position_chk
        CHECK (position >= 0 AND position <= 3),
    CONSTRAINT report_photos_report_position_key
        UNIQUE (report_id, position)
);

CREATE INDEX idx_report_photos_report ON report_photos (report_id);

-- Migrate each report's existing single photo into the new table as position 0.
INSERT INTO report_photos (report_id, photo_url, photo_public_id, position)
SELECT id, photo_url, photo_public_id, 0
FROM reports;

ALTER TABLE reports
    DROP COLUMN photo_url,
    DROP COLUMN photo_public_id;
