-- Default issue categories (final taxonomy = PRD Open Question #1 — edit
-- this list before your first production deploy if the taxonomy changes).
INSERT INTO categories (name, slug) VALUES
    ('Pothole / Damaged Road',    'pothole'),
    ('Broken Streetlight',        'streetlight'),
    ('Garbage / Illegal Dumping', 'garbage'),
    ('Clogged Drain / Flooding',  'drainage'),
    ('Damaged Signage',           'signage'),
    ('Damaged Sidewalk',          'sidewalk'),
    ('Other',                     'other');
