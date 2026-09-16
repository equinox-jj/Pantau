DELETE FROM categories WHERE slug IN (
    'pothole', 'streetlight', 'garbage', 'drainage', 'signage', 'sidewalk', 'other'
);
