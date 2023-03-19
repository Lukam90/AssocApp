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
WHERE e.title LIKE '%foire%'
OR    year(e.planned_at) = 2023