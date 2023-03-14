[Retour au sommaire](README.md)

***

# La gestion des tables d'une réservation

**Rôles** : Trésorier, Administrateur<br>
**Page** : admin/reservations-form.js

## La liste des tables

Les tables d'une réservation sont listées sous forme de tableau avec :

- leur **position X** (abscisses)
- leur **position Y** (ordonnées)
- leurs **commentaires**

```sql
SELECT * FROM table
WHERE reservation_id = :reservation_id
```

## L'ajout d'une table

On peut ajouter une à douze tables à une réservation.

Chaque table est définie avec :

- sa **position X** (0 par défaut)
- sa **position Y** (0 par défaut)
- ses **commentaires** (optionnel)

L'ajout d'une table est possible selon le nombre de tables disponibles.

```sql
INSERT INTO table (pos_x, pos_y, comment, reservation_id)
VALUES (:pos_x, :pos_y, :comment, :reservation_id)
```

## L'édition d'une table

On peut changer les informations d'une table sur le modèle du formulaire d'ajout.

```sql
UPDATE table
SET pos_x = :pos_x,
    pos_y = :pos_y,
    comment = :comment
WHERE id = :id
AND reservation_id = :reservation_id
```

## La suppression d'une table

On peut supprimer une table liée à une réservation.

Une réservation doit comporter au moins une table.

```sql
DELETE FROM table
WHERE id = :id
AND reservation_id = :reservation_id
```