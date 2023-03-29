SELECT r.id, u.first_name, u.last_name, u.label, r.status, number, total, m.label, r.paid_at, r.comments
FROM reservation r
INNER JOIN event e ON r.event_id = e.id
INNER JOIN user u ON r.user_id = u.id
INNER JOIN mode m ON r.mode_id = m.id;