-- Réservations d'un événement donné

SELECT r.id, r.status, r.paid_at, r.comments
FROM reservation r
INNER JOIN event e
ON r.event_id = e.id
WHERE e.id = 1;

-- Réservation d'un exposant

SELECT r.id, u.first_name, u.last_name, u.label, r.status, count(t.id) as num_tables, sum(t.price) as total, m.label, r.paid_at, r.comments
FROM reservation r
INNER JOIN event e ON r.event_id = e.id
INNER JOIN user u ON r.user_id = u.id
INNER JOIN mode m ON r.mode_id = m.id
INNER JOIN `table` t on t.reservation_id = r.id
WHERE e.id = 1 AND u.id = 1
GROUP BY r.id;

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