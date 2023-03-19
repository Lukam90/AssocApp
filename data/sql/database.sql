DROP TABLE IF EXISTS `table`;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS mode;

DROP TABLE IF EXISTS newsletter_user;
DROP TABLE IF EXISTS user_event;

DROP TABLE IF EXISTS `event`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS newsletter;

-- Les modes de paiement (mode)

CREATE TABLE IF NOT EXISTS mode
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    label VARCHAR(50)
);

INSERT INTO mode (label) VALUES
('Espèces'), ('Chèque'), ('Carte Bancaire');

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

INSERT INTO newsletter (object, target, content, is_send, send_at) VALUES 
('Annonce du prochain salon', 'Général', 'Lorem ipsum...', 1, '2023-03-15'),
('Prochaine assemblée générale', 'Membres', 'Lorem ipsum...', 0, '2023-06-16'),
('Repas de Noël du comité', 'Membres', 'Lorem ipsum...', 1, '2023-11-25');

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

-- Les événements (event)

CREATE TABLE IF NOT EXISTS `event`
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    planned_at DATE NOT NULL,
    content TEXT NOT NULL,
    is_published BOOLEAN NOT NULL DEFAULT 0,
    picture BLOB,
    min_price DECIMAL(5,2),
    num_available INT(3)
);

INSERT INTO event (title, planned_at, content, min_price, num_available) VALUES 
('43ème Foire Alsacienne de la Carte Postale et du Vieux Papier de Collection et Salon des Collectionneurs', '2023-05-07', 'Lorem ipsum...', 30.00, 300);

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
    ON DELETE CASCADE
);

INSERT INTO reservation (status, paid_at, comments, event_id, mode_id) VALUES
('Payé', '2023-03-01', 'une table offerte (membre)', 1, 1),
('Payé', '2023-03-02', '', 1, 2),
('A Payer', '2023-03-10', '', 1, 3),
('Annulé', '2023-03-03', '', 1, 1),
('Payé', '2023-03-04', '', 1, 2),
('Payé', '2023-03-05', '', 1, 3);

-- Les tables (table)

CREATE TABLE IF NOT EXISTS `table`
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    price DECIMAL(5,2) NOT NULL DEFAULT 0,
    pos_x INT(3) NOT NULL DEFAULT 0,
    pos_y INT(3) NOT NULL DEFAULT 0,
    comments TEXT,
    reservation_id INT NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES reservation (id)
    ON DELETE CASCADE
);

INSERT INTO `table` (reservation_id, price, pos_x, pos_y, comments) VALUES
(1, 30, 0, 0, ''),
(1, 30, 0, 1, ''),
(1, 30, 1, 0, ''),
(1, 30, 1, 1, 'près de la buvette'),
(2, 30, 1, 2, 'près de la portie de sortie'),
(2, 30, 2, 1, ''),
(2, 0, 2, 2, 'table offerte (membre)');

-- La table intermédiaire newsletter_user

CREATE TABLE IF NOT EXISTS newsletter_user
(
    newsletter_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (newsletter_id) REFERENCES newsletter (id),
    FOREIGN KEY (user_id) REFERENCES user (id)
);

INSERT INTO newsletter_user (newsletter_id, user_id) VALUES
(1,1), (1,2), (1,4),
(1,5), (1,6), (1,7),
(1,9), (1,10), (1,11),
(2,1), (2,4),
(2,5), (2,6);

-- La table intermédiaire user_event

CREATE TABLE IF NOT EXISTS user_event
(
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (event_id) REFERENCES event (id)
);

INSERT INTO user_event (event_id, user_id) VALUES
(1,1), (1,2), (1,3), (1,4), 
(1,5), (1,6), (1,7), (1,8), 
(1,9), (1,10), (1,11);
