-- Les modes de paiement (mode)

DROP TABLE IF EXISTS mode;

CREATE TABLE IF NOT EXISTS mode
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    label VARCHAR(50),
    UNIQUE(label)
);

INSERT INTO mode (label) VALUES
('Espèces'), ('Chèque'), ('Carte Bancaire');

-- Les newsletters (newsletter)

DROP TABLE IF EXISTS newsletter;

CREATE TABLE IF NOT EXISTS newsletter
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    object VARCHAR(255),
    target VARCHAR(10) NOT NULL DEFAULT 'Général',
    content VARCHAR(255),
    is_send BOOLEAN NOT NULL DEFAULT 0,
    send_at DATE NOT NULL DEFAULT NOW()
);

INSERT INTO newsletter (object, target, content, is_send, send_at) VALUES 
('Annonce du prochain salon', 'Général', 'Lorem ipsum...', 1, '2023-03-15'),
('Prochaine assemblée générale', 'Membres', 'Lorem ipsum...', 0, '2023-06-16'),
('Repas de Noël du comité', 'Membres', 'Lorem ipsum...', 1, '2023-11-25');

-- Les utilisateurs (user)

DROP TABLE IF EXISTS `user`;

CREATE TABLE IF NOT EXISTS `user`
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    label VARCHAR(255),
    phone VARCHAR(20),
    is_active BOOLEAN NOT NULL DEFAULT 0,
    is_member BOOLEAN NOT NULL DEFAULT 0,
    is_optin BOOLEAN NOT NULL DEFAULT 0,
    role VARCHAR(20) NOT NULL DEFAULT 'Exposant',
    UNIQUE(email)
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

-- La table intermédiaire newsletter_user

DROP TABLE IF EXISTS newsletter_user;

CREATE TABLE IF NOT EXISTS newsletter_user
(
    newsletter_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (newsletter_id) REFERENCES newsletter (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE,
    PRIMARY KEY (newsletter_id, user_id)
);

INSERT INTO newsletter_user (newsletter_id, user_id) VALUES
(1,1), (1,2), (1,4),
(1,5), (1,6), (1,7),
(1,9), (1,10), (1,11),
(2,1), (2,4),
(2,5), (2,6);

-- Les événements (event)

DROP TABLE IF EXISTS `event`;

CREATE TABLE IF NOT EXISTS `event`
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    planned_at DATE NOT NULL,
    content TEXT NOT NULL,
    is_published BOOLEAN NOT NULL DEFAULT 0,
    picture BLOB,
    min_price DECIMAL(5,2),
    num_available INTEGER(3)
);

INSERT INTO event (title, planned_at, content, min_price, num_available) VALUES 
('43ème Foire Alsacienne de la Carte Postale et du Vieux Papier de Collection et Salon des Collectionneurs', '2023-05-07', 'Lorem ipsum...', 30.00, 300);

-- Les réservations (reservation)

DROP TABLE IF EXISTS reservation;

CREATE TABLE IF NOT EXISTS reservation
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status VARCHAR(20) NOT NULL DEFAULT 'A Payer',
    paid_at DATE,
    comments TEXT,
    number INTEGER,
    total DECIMAL(5,2),
    mode_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (mode_id) REFERENCES mode (id),
    FOREIGN KEY (event_id) REFERENCES event (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
);

INSERT INTO reservation (status, paid_at, comments, event_id, user_id, mode_id) VALUES
('Payé', '2023-03-01', 'une table offerte (membre)', 1, 1, 1),
('Payé', '2023-03-02', '', 1, 2, 2),
('A Payer', '2023-03-10', '', 1, 3, 3),
('Annulé', '2023-03-03', '', 1, 4, 1),
('Payé', '2023-03-04', '', 1, 5, 2),
('Payé', '2023-03-05', '', 1, 6, 3);

-- Les tables (table)

DROP TABLE IF EXISTS `table`;

CREATE TABLE IF NOT EXISTS `table`
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    price DECIMAL(5,2) NOT NULL DEFAULT 0,
    pos_x INTEGER(3) NOT NULL DEFAULT 0,
    pos_y INTEGER(3) NOT NULL DEFAULT 0,
    comments TEXT,
    reservation_id INTEGER NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES reservation (id) ON DELETE CASCADE
);

-- MAJ automatique du prix d'une table d'une réservation

DROP TRIGGER IF EXISTS before_insert_table_price_on_reservation;

CREATE TRIGGER IF NOT EXISTS before_insert_table_price_on_reservation
BEFORE INSERT ON `table` 
FOR EACH ROW
    UPDATE `table` 
    SET price = (
        SELECT e.min_price
        FROM `table` t
        INNER JOIN reservation r ON t.reservation_id = r.id
        INNER JOIN event e ON r.event_id = e.id
        WHERE e.id = r.event_id
    )
    WHERE id = NEW.reservation_id;

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

-- Ajout de tables

INSERT INTO `table` (reservation_id, price, pos_x, pos_y, comments) VALUES
(1, 30, 0, 0, ''),
(1, 30, 0, 1, ''),
(1, 30, 1, 0, ''),
(1, 30, 1, 1, 'près de la buvette'),
(2, 30, 1, 2, 'près de la portie de sortie'),
(2, 30, 2, 1, ''),
(2, 0, 2, 2, 'table offerte (membre)');