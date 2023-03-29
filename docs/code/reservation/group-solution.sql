SELECT r.id, u.first_name, u.last_name, u.label, r.status, count(t.id) as num_tables, sum(t.price) as total, m.label, r.paid_at, r.comments
FROM reservation r
INNER JOIN event e ON r.event_id = e.id
INNER JOIN user u ON r.user_id = u.id
INNER JOIN mode m ON r.mode_id = m.id
INNER JOIN `table` t on t.reservation_id = r.id
WHERE e.id = 1 AND u.id = 1
GROUP BY r.id;