-- Exposants d'un événement donné (ex : 1)

SELECT e.id, u.first_name, u.last_name, u.label
FROM user u
INNER JOIN user_event ue
ON ue.user_id = u.id
INNER JOIN event e
ON ue.event_id = e.id
WHERE e.id = 1

-- Réservations d'un événement donné (ex : 1)

SELECT r.id, r.status, r.paid_at, r.comments
FROM reservation r
INNER JOIN event e
ON r.event_id = e.id
WHERE e.id = 1

-- Réservations d'un événement donné (ex : 1) + mode de paiement

SELECT r.id, r.status, m.label, r.paid_at, r.comments
FROM reservation r
INNER JOIN event e
ON r.event_id = e.id
INNER JOIN mode m
ON r.mode_id = m.id
WHERE e.id = 1

-- Réservation payée (ex : 1) + stats tables

SELECT r.id, r.status, count(t.id) as num_tables, sum(t.price) as total, m.label, r.paid_at, r.comments
FROM reservation r
INNER JOIN event e
ON r.event_id = e.id
INNER JOIN mode m
ON r.mode_id = m.id
INNER JOIN `table` t
ON t.reservation_id = r.id
WHERE e.id = 1
AND r.id = 1
AND r.status = 'Payé'
GROUP BY r.id

-- Réservation d'un exposant (!)

SELECT e.title, e.planned_at, r.status, r.paid_at
FROM reservation r
INNER JOIN event e
ON r.event_id = e.id
INNER JOIN user_event ue
ON ue.event_id = e.id
INNER JOIN user u
ON ue.user_id = u.id
WHERE u.id = 1
AND e.id = 1
AND r.status = 'Payé'

-- Ajout d'une réservation

INSERT INTO reservation (status, paid_at, comment, user_id, event_id, mode_id)
VALUES (:status, :paid_at, :comment, :user_id, :event_id, :mode_id)

-- Edition d'une réservation

UPDATE reservation 
SET status = :status,
    paid_at = :paid_at, 
    comment = :comment, 
    user_id = :user_id, 
    event_id = :event_id, 
    mode_id = :mode_id
WHERE id = :id

-- Suppression d'une réservation

DELETE FROM réservation
WHERE id = :id