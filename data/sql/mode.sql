-- Liste des modes de paiement

SELECT * FROM mode

-- Aajout d'un mode de paiement

INSERT INTO mode VALUES(:label)

-- Edition d'un mode de paiement

UPDATE mode
SET label = :label
WHERE id = :id

-- Suppression d'un mode de paiement

DELETE FROM mode
WHERE id = :id