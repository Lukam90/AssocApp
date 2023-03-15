DROP TABLE IF EXISTS `table`;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS mode;

DROP TABLE IF EXISTS `event`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS newsletter;

DROP TABLE IF EXISTS newsletter_user;
DROP TABLE IF EXISTS user_event;

-- Les modes de paiement (mode)

CREATE TABLE IF NOT EXISTS mode
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    label VARCHAR(50)
);

INSERT INTO mode (label) VALUES ('Espèces');
INSERT INTO mode (label) VALUES ('Chèque');
INSERT INTO mode (label) VALUES ('Carte Bancaire');

-- Les newsletters (newsletter)

CREATE TABLE IF NOT EXISTS newsletter
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    object VARCHAR(255),
    target VARCHAR(10) NOT NULL DEFAULT 'Général',
    content VARCHAR(255),
    is_send BOOLEAN NOT NULL DEFAULT 0,
    send_at DATE NOT NULL DEFAULT NOW()
);

INSERT INTO newsletter (object, target, content, is_send, send_at)
VALUES ('Annonce du prochain salon', 'Général', 'Lorem ipsum...', 1, '2023-03-15');
INSERT INTO newsletter (object, target, content, is_send, send_at)
VALUES ('Prochaine assemblée générale', 'Membres', 'Lorem ipsum...', 0, '2023-06-16');
INSERT INTO newsletter (object, target, content, is_send, send_at)
VALUES ('Repas de Noël du comité', 'Membres', 'Lorem ipsum...', 1, '2023-11-25');

-- Les utilisateurs (user)

CREATE TABLE IF NOT EXISTS `user`
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
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

--INSERT INTO user ()

-- Les événements (event)

CREATE TABLE IF NOT EXISTS `event`
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    planned_at DATE NOT NULL,
    title VARCHAR(255) NOT NULL,
    picture BLOB,
    content TEXT,
    min_price DECIMAL(3,2),
    num_available INT(3)
);

-- Les réservations (reservation)

CREATE TABLE IF NOT EXISTS reservation
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status VARCHAR(20) NOT NULL DEFAULT 'A Payer',
    paid_at DATE,
    comments TEXT,
    mode_id INT NOT NULL,
    event_id INT NOT NULL,
    FOREIGN KEY (mode_id) REFERENCES mode (id),
    FOREIGN KEY (event_id) REFERENCES event (id)
);

-- Les tables (table)

CREATE TABLE IF NOT EXISTS `table`
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    price DECIMAL(3,2) NOT NULL DEFAULT 0,
    pos_x INT(3) NOT NULL DEFAULT 0,
    pos_y INT(3) NOT NULL DEFAULT 0,
    comments TEXT,
    reservation_id INT NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES reservation (id)
);

-- La table intermédiaire newsletter_user

CREATE TABLE IF NOT EXISTS newsletter_user
(
    newsletter_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (newsletter_id) REFERENCES newsletter (id),
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- La table intermédiaire user_event

CREATE TABLE IF NOT EXISTS user_event
(
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (event_id) REFERENCES event (id)
);
























































