-- Liste

SELECT e.id, e.title,
count(r.id) AS num_reservations,
count(t.id) AS num_tables
FROM event e
INNER JOIN reservation r
ON e.id = r.event_id
INNER JOIN `table` t
ON t.reservation_id = r.id
WHERE t.reservation_id = 1

-- Recherche

SELECT e.title, year(e.planned_at) as event_year
FROM event e
WHERE e.title LIKE '%' . :title . '%'
OR    year(e.planned_at) = :year

-- Ajout d'un événement

INSERT INTO event (title, planned_at, picture, content, num_available)
VALUES (:title, :planned_at, :picture, :content, :num_available)

-- Edition d'un événement

UPDATE event
SET title = :title, 
  	planned_at = :planned_at, 
	picture = :picture, 
	content = :content, 
	num_available = :num_available

-- Suppression d'un événement

DELETE FROM event
WHERE id = :id