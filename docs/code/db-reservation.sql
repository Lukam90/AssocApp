
CREATE TABLE IF NOT EXISTS reservation
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status VARCHAR(20) NOT NULL DEFAULT 'A Payer'
    CHECK (status IN ('A Payer', 'Payé', 'Annulé')),
    paid_at DATE,
    comments TEXT,
    number INTEGER DEFAULT 1
    CHECK (number >= 1 AND number <= 12),
    total DECIMAL(6,2) DEFAULT 0
    CHECK (total >= 0 AND total <= 9999),
    mode_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (mode_id) REFERENCES mode (id),
    FOREIGN KEY (event_id) REFERENCES event (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
);