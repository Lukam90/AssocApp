-- Réservations d'un événement donné

SELECT r.id, r.status, r.paid_at, r.comments
FROM reservation r
INNER JOIN event e
ON r.event_id = e.id
WHERE e.id = 1;

-- Réservation d'un exposant

SELECT r.id, u.first_name, u.last_name, u.label, r.status, count(t.table_id) as num_tables, sum(t.price) as total, m.label, r.paid_at, r.comments
FROM reservation r
INNER JOIN event e ON r.event_id = e.id
INNER JOIN user u ON r.user_id = u.id
INNER JOIN mode m ON r.mode_id = m.id
INNER JOIN `table` t on t.reservation_id = r.id
WHERE e.id = 1 AND u.id = 1
GROUP BY r.id;

SELECT r.id, u.first_name, u.last_name, u.label, r.status, number, total, m.label, r.paid_at, r.comments
FROM reservation r
INNER JOIN event e ON r.event_id = e.id
INNER JOIN user u ON r.user_id = u.id
INNER JOIN mode m ON r.mode_id = m.id
WHERE e.id = 1 AND r.id <= 4;

-- Ajout d'une réservation

INSERT INTO reservation (status, paid_at, comment, user_id, event_id, mode_id)
VALUES (:status, :paid_at, :comment, :user_id, :event_id, :mode_id);

-- Edition d'une réservation

UPDATE reservation 
SET status = :status,
    paid_at = :paid_at, 
    comment = :comment, 
    user_id = :user_id, 
    event_id = :event_id, 
    mode_id = :mode_id
WHERE id = :id;

-- Suppression d'une réservation

DELETE FROM réservation
WHERE id = :id;

-- Ajout de réservations avec tables 

DELETE FROM `réservation`;
DELETE FROM `table`;

-- 1

INSERT INTO reservation (status, paid_at, event_id, user_id, mode_id) 
VALUES ('Payé', '2023-03-01', 1, 1, 1);

INSERT INTO `table` (reservation_id, price, pos_x, pos_y) VALUES
(1, 30, 0, 0),
(1, 30, 0, 1),
(1, 30, 1, 0);

-- 2

INSERT INTO reservation (status, paid_at, event_id, user_id, mode_id) 
VALUES ('Payé', '2023-03-02', 1, 2, 2);

INSERT INTO `table` (reservation_id, price, pos_x, pos_y, comments) VALUES
(2, 30, 1, 2, 'près de la portie de sortie'),
(2, 30, 2, 1, ''),
(2, 0, 2, 2, 'table offerte (membre)');

-- 3

INSERT INTO reservation (status, paid_at, event_id, user_id, mode_id) 
VALUES ('A Payer', '2023-03-10', 1, 3, 3);

INSERT INTO `table` (reservation_id, price, pos_x, pos_y, comments) VALUES
(3, 30, 3, 1, ''),
(3, 15, 3, 1, '50 % de réduction');

-- 4

INSERT INTO reservation (status, paid_at, event_id, user_id, mode_id) 
VALUES ('Annulé', '2023-03-03', 1, 4, 1);

INSERT INTO `table` (reservation_id, price, pos_x, pos_y) VALUES
(4, 30, 4, 1),
(4, 30, 4, 2),
(4, 30, 4, 3);