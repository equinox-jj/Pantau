-- =============================================================================
-- V2__seed_default_categories.sql
-- Seed: default issue categories (final taxonomy = PRD Open Question #1)
--
-- ON CONFLICT DO NOTHING makes this safe against environments where
-- categories were inserted manually before Flyway was adopted.
-- If the taxonomy changes later, write a NEW migration (V5, V6, ...)
-- that updates/retires rows — never edit this file after it has run.
-- =============================================================================

INSERT INTO categories (name, slug)
VALUES ('Pothole / Damaged Road', 'pothole'),
       ('Broken Streetlight', 'streetlight'),
       ('Garbage / Illegal Dumping', 'garbage'),
       ('Clogged Drain / Flooding', 'drainage'),
       ('Damaged Signage', 'signage'),
       ('Damaged Sidewalk', 'sidewalk'),
       ('Other', 'other') ON CONFLICT (slug) DO NOTHING;
