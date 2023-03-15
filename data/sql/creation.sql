-- Les modes de paiement (mode)

DROP TABLE IF EXISTS mode;

CREATE TABLE IF NOT EXISTS mode
(
    id INT PRIMARY KEY NOT NULL,
    label VARCHAR(50)
);

-- Les newsletters (newsletter)

DROP TABLE IF EXISTS newsletter;

CREATE TABLE IF NOT EXISTS newsletter
(
    id INT PRIMARY KEY NOT NULL,
    target VARCHAR(10) NOT NULL DEFAULT 'Général',
    content VARCHAR(255),
    is_send BOOLEAN NOT NULL DEFAULT 0,
    send_at DATE NOT NULL DEFAULT NOW()
);

-- Les utilisateurs (user)

DROP TABLE IF EXISTS `user`;

CREATE TABLE IF NOT EXISTS `user`
(
    id INT PRIMARY KEY NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    label VARCHAR(255),
    phone VARCHAR(20),
    is_active BOOLEAN NOT NULL DEFAULT 0,
    is_member BOOLEAN NOT NULL DEFAULT 0,
    is_optin BOOLEAN NOT NULL DEFAULT 0,
    role VARCHAR(20) NOT NULL DEFAULT 'Exposant'
);

-- Les événements (event)

DROP TABLE IF EXISTS `event`;

CREATE TABLE IF NOT EXISTS `event`
(
    id INT PRIMARY KEY NOT NULL,
    planned_at DATE NOT NULL,
    title VARCHAR(255) NOT NULL,
    picture BLOB,
    content TEXT,
    min_price DECIMAL(3,2),
    num_available INT(3)
);

-- Les réservations (reservation)

DROP TABLE IF EXISTS reservation;

CREATE TABLE IF NOT EXISTS reservation
(
    id INT PRIMARY KEY NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'A Payer',
    paid_at DATE,
    comments TEXT,
    mode_id INT,
    event_id INT,
    FOREIGN KEY (mode_id) REFERENCES mode (id),
    FOREIGN KEY (event_id) REFERENCES event (id)
);

-- Les tables (table)

DROP TABLE IF EXISTS `table`;

CREATE TABLE IF NOT EXISTS `table`
(
    id INT PRIMARY KEY NOT NULL,
    price DECIMAL(3,2) NOT NULL DEFAULT 0,
    pos_x INT(3) NOT NULL DEFAULT 0,
    pos_y INT(3) NOT NULL DEFAULT 0,
    comments TEXT,
    reservation_id INT,
    FOREIGN KEY (reservation_id) REFERENCES reservation (id)
);






































































