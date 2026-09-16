-- Append-only audit trail. Never UPDATEd in application code — only ever
-- INSERTed, one row per status transition (including the initial
-- "reported" entry, where from_status is NULL).
CREATE TABLE report_status_history (
    id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    report_id   uuid          NOT NULL,
    actor_id    uuid          NOT NULL,
    from_status report_status,                 -- NULL for the initial 'reported' entry
    to_status   report_status NOT NULL,
    note        text,
    created_at  timestamptz   NOT NULL DEFAULT now(),
    CONSTRAINT rsh_report_fk FOREIGN KEY (report_id)
        REFERENCES reports (id) ON DELETE CASCADE,
    CONSTRAINT rsh_actor_fk  FOREIGN KEY (actor_id)
        REFERENCES users (id)   ON DELETE RESTRICT,
    -- A rejection must always carry an explanation.
    CONSTRAINT rsh_rejected_requires_note_chk
        CHECK (to_status <> 'rejected' OR note IS NOT NULL)
);

CREATE INDEX idx_rsh_report     ON report_status_history (report_id);
CREATE INDEX idx_rsh_created_at ON report_status_history (created_at);
