-- Reverses 000007: restores photo_url/photo_public_id on reports from each
-- report's position-0 photo, then drops the child table.
--
-- LOSSY: any report with more than one photo (positions 1-3) loses those
-- extra photos on rollback — there's no column to put them back into on a
-- single-photo `reports` row. That data loss is inherent to collapsing a
-- one-to-many relationship back into a single column, not a mistake in
-- this script. If you need a reversible path once multi-photo data exists
-- in production, don't roll this migration back — write a forward migration
-- instead.
ALTER TABLE reports
    ADD COLUMN photo_url text,
    ADD COLUMN photo_public_id text;

UPDATE reports r
SET photo_url       = p.photo_url,
    photo_public_id = p.photo_public_id
FROM report_photos p
WHERE p.report_id = r.id
  AND p.position = 0;

ALTER TABLE reports
    ALTER COLUMN photo_url SET NOT NULL;

DROP TABLE IF EXISTS report_photos;
