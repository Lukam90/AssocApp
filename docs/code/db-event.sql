CREATE TABLE IF NOT EXISTS `event`
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) UNIQUE NOT NULL,
    planned_at DATE NOT NULL,
    content TEXT NOT NULL,
    is_published BOOLEAN NOT NULL DEFAULT 0,
    picture BLOB,
    min_price DECIMAL(5,2) NOT NULL
    CHECK (min_price >= 0 AND min_price <= 999),
    num_available INTEGER(3) NOT NULL
    CHECK (min_price >= 0 AND min_price <= 999),
    INDEX(title)
);