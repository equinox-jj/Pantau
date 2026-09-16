CREATE TABLE reports (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    reporter_id     uuid                   NOT NULL,
    category_id     uuid                   NOT NULL,
    description     text,                                        -- optional free text
    photo_url       text                   NOT NULL,             -- URL from POST /uploads
    -- photo_public_id: inferred from V4__add_report_photos.sql in the real
    -- repo, which selects this column off `reports` before it's dropped —
    -- so it must exist by this point. Not verified against your actual V2/V3;
    -- if those migrations added it with different nullability/defaults,
    -- tell me and I'll correct this. Likely a Cloudinary-style asset id
    -- (paired with the URL) rather than something MinIO/S3 needs.
    photo_public_id text,
    location        geography(Point, 4326) NOT NULL,              -- WGS84 lon/lat point
    status          report_status          NOT NULL DEFAULT 'reported',
    created_at      timestamptz            NOT NULL DEFAULT now(),
    updated_at      timestamptz            NOT NULL DEFAULT now(),
    CONSTRAINT reports_reporter_fk FOREIGN KEY (reporter_id)
        REFERENCES users (id)      ON DELETE RESTRICT,
    CONSTRAINT reports_category_fk FOREIGN KEY (category_id)
        REFERENCES categories (id) ON DELETE RESTRICT
);

CREATE TRIGGER trg_reports_updated_at
    BEFORE UPDATE ON reports
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- Spatial index powering the "nearby reports" query (ST_DWithin + KNN <->).
CREATE INDEX idx_reports_location ON reports USING GIST (location);

-- Supporting indexes for common filters / sorts.
CREATE INDEX idx_reports_status     ON reports (status);
CREATE INDEX idx_reports_category   ON reports (category_id);
CREATE INDEX idx_reports_reporter   ON reports (reporter_id);
CREATE INDEX idx_reports_created_at ON reports (created_at DESC);
