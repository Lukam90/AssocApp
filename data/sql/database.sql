-- Script BDD

DROP TABLE IF EXISTS `newsletter`;
DROP TABLE IF EXISTS `table`;
DROP TABLE IF EXISTS `reservation`;
DROP TABLE IF EXISTS `mode`;
DROP TABLE IF EXISTS `event`;
DROP TABLE IF EXISTS `user`;

-- Les modes de paiement (mode)

CREATE TABLE IF NOT EXISTS mode
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    label VARCHAR(50) UNIQUE NOT NULL,
    INDEX (label)
);

INSERT INTO mode (label) VALUES
('Espèces'), ('Chèque'), ('Carte Bancaire');

-- Les utilisateurs (user)

CREATE TABLE IF NOT EXISTS `user`
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    label VARCHAR(255),
    phone VARCHAR(20),
    picture BLOB,
    is_active BOOLEAN NOT NULL DEFAULT 0,
    is_member BOOLEAN NOT NULL DEFAULT 0,
    is_optin BOOLEAN NOT NULL DEFAULT 0,
    role VARCHAR(20) NOT NULL DEFAULT 'Exposant'
    CHECK (role in ('Exposant', 'Trésorier', 'Administrateur')),
    INDEX(first_name),
    INDEX(last_name),
    INDEX(label)
);

INSERT INTO user (email, password, role, first_name, last_name, label) VALUES
('contact@admin.fr', sha('Admin$007'), 'Administrateur', 'Lucien', 'HAMM', 'AACCP'),
('reservations@admin.fr', sha('Secret@123'), 'Trésorier', 'Jean', 'DUPONT', ''),
('l.roman@test.com', sha('broc@Secret123'), 'Exposant', 'Louis', 'ROMAN', 'Louis La Brocante'),
('g.delajungle@test.com', sha('t@rzanJ456'), 'Exposant', 'Georges', 'DELAJUNGLE', ''),
('b.duval@test.com', sha('bernA544$'), 'Exposant', 'Bernadette', 'DUVAL', 'Association Cartophile de Haguenau'),
('f.molas@jdg.fr', sha('Ref$9876'), 'Exposant', 'Frédéric', 'MOLAS', 'Joueur du Grenier'),
('d.goodenough@jdg.fr', sha('c@Pasimal123'), 'Exposant', 'David', 'GOODENOUGH', ''),
('p.richard@test.com', sha('Oh1gag$123'), 'Exposant', 'Pierre', 'RICHARD', 'La Boutique de Pierrot'),
('g.bonnet@test.com', sha('Gil$Pass042'), 'Exposant', 'Gilbert', 'BONNET', 'Gilbert Philatélie'),
('j.bond@test.com', sha('jPass$007'), 'Exposant', 'James', 'BOND', 'Tableaux 007'),
('m.simon@test.com', sha('Sim$ity754'), 'Exposant', 'Marc', 'SIMON', 'Cartes Postales Magazine');

-- Les newsletters (newsletter)

CREATE TABLE IF NOT EXISTS newsletter
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    object VARCHAR(255),
    target VARCHAR(10) NOT NULL DEFAULT 'Général',
    content VARCHAR(255),
    is_send BOOLEAN NOT NULL DEFAULT 0,
    send_at DATE NOT NULL DEFAULT NOW(),
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (id),
    INDEX (object)
);

INSERT INTO newsletter (user_id, object, target, content, is_send, send_at) VALUES 
(1, 'Annonce du prochain salon', 'Général', 'Lorem ipsum...', 1, '2023-03-15'),
(1, 'Prochaine assemblée générale', 'Membres', 'Lorem ipsum...', 0, '2023-06-16'),
(1, 'Repas de Noël du comité', 'Membres', 'Lorem ipsum...', 1, '2023-11-25');

-- Les événements (event)

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

INSERT INTO event (title, planned_at, content, min_price, num_available) VALUES 
('43ème Foire Alsacienne de la Carte Postale et du Vieux Papier de Collection et Salon des Collectionneurs', '2023-05-07', 'Lorem ipsum...', 30.00, 300);

-- Les réservations (reservation)

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

-- Les tables (table)

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

-- MAJs automatiques du nombre de tables d'une réservation

-- Après insertion d'une table

DROP TRIGGER IF EXISTS after_insert_tables_number_on_reservation;

CREATE TRIGGER IF NOT EXISTS after_insert_tables_number_on_reservation
AFTER INSERT ON `table` 
FOR EACH ROW
    UPDATE reservation
    SET number = (
        SELECT COUNT(t.id)
        FROM `table` t
    )
    WHERE id = NEW.reservation_id;

-- Après suppression d'une table

DROP TRIGGER IF EXISTS after_delete_tables_number_on_reservation;

CREATE TRIGGER after_delete_tables_number_on_reservation
AFTER DELETE ON `table`
FOR EACH ROW
    UPDATE reservation
    SET number = (
        SELECT COUNT(t.id)
        FROM `table` t
    )
    WHERE id = OLD.reservation_id;

-- MAJs automatiques du prix total d'une réservation

-- Après insertion d'une table

DROP TRIGGER IF EXISTS after_insert_tables_total_on_reservation;

CREATE TRIGGER IF NOT EXISTS after_insert_tables_total_on_reservation
AFTER INSERT ON `table` 
FOR EACH ROW
    UPDATE reservation
    SET total = (
        SELECT SUM(t.price)
        FROM `table` t
    )
    WHERE id = NEW.reservation_id;

-- Après suppression d'une table

DROP TRIGGER IF EXISTS after_delete_tables_total_on_reservation;

CREATE TRIGGER IF NOT EXISTS after_delete_tables_total_on_reservation
AFTER INSERT ON `table` 
FOR EACH ROW
    UPDATE reservation
    SET total = (
        SELECT SUM(t.price)
        FROM `table` t
    )
    WHERE id = NEW.reservation_id;
