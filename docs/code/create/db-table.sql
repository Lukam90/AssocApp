CREATE TABLE IF NOT EXISTS `table`
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    price DECIMAL(5,2) NOT NULL DEFAULT 0
    CHECK (price >= 0 AND price <= 999),
    pos_x INTEGER(3) NOT NULL DEFAULT 0,
    pos_y INTEGER(3) NOT NULL DEFAULT 0,
    comments TEXT,
    reservation_id INTEGER NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES reservation (id) ON DELETE CASCADE
);