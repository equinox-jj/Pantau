-- Profile picture stored in object storage; the key is kept so it can be deleted.
ALTER TABLE users
    ADD COLUMN avatar_url        text,
    ADD COLUMN avatar_object_key text;
