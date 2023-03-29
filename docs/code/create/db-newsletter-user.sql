CREATE TABLE IF NOT EXISTS newsletter_user
(
    newsletter_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (newsletter_id) REFERENCES newsletter (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE,
    PRIMARY KEY (newsletter_id, user_id)
);