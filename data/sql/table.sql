-- Liste des tables

SELECT * FROM table
WHERE reservation_id = :reservation_id

-- Ajout d'une table

INSERT INTO table (pos_x, pos_y, price, comment, reservation_id)
VALUES (:pos_x, :pos_y, :price, :comment, :reservation_id)

-- Edition d'une table

UPDATE table
SET pos_x = :pos_x,
    pos_y = :pos_y,
    price = :price,
    comment = :comment
WHERE id = :id
AND reservation_id = :reservation_id

-- Suppression d'une table

DELETE FROM table
WHERE id = :id
AND reservation_id = :reservation_id

-- Exemple d'affichage

SELECT reservation_id, id as table_id, price, pos_x, pos_y, comments
FROM `table`
ORDER BY id;