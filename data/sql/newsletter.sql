-- Liste des newsletters

SELECT * FROM newsletter

-- Recherche d'une newsletter

SELECT * FROM newsletter
WHERE object LIKE '%' . :object . '%'
AND   target = :target
AND   is_send = :is_send
AND   send_at >= :send_at

-- Création d'une newsletter

INSERT INTO newsletter (object, target, content, is_send, send_at)
VALUES (:object, :target, :content, :is_send, :send_at)

-- Edition d'une newsletter

UPDATE newsletter
SET object = :object, 
    target = :target, 
    content = :content, 
    is_send = :is_send, 
    send_at = :send_at
WHERE id = :id

-- Suppression d'une newsletter

DELETE FROM newsletter
WHERE id = :id