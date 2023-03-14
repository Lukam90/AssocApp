[Retour au sommaire](README.md)

***

# La gestion des réservations

**Rôles** : Trésorier, Administrateur

## La liste des réservations

**Page** : admin/reservations.js

Les réservations sont listées sous forme de tableau avec :

|<br />||
|-|-|
l'**id**|r.id
le **prénom** de l'exposant|u.first_name
le **nom** de l'exposant|u.last_name
le **libellé** de l'exposant|u.label
le **statut** ("A Payer", "Payé", "Annulé")|r.status
le **nombre de tables** réservées|COUNT(t.id)
la **somme totale** réglée|SUM(t.price)
le **mode de paiement**|m.label
la **date de paiement**|r.paid_at
les **commentaires**|r.comments

```sql
SELECT reservation.id, 
user.first_name, user.last_name, user.label, 
reservation.status,
count (table.id) as num_tables,
sum(table.price) as total,
mode.label,
reservation.paid_at
reservation.comment
FROM reservation
INNER JOIN table
ON table.reservation_id = reservation.id
INNER JOIN mode
ON reservation.mode_id = mode.id
INNER JOIN event
ON reservation.event_id = event.id
INNER JOIN user_event
ON event.id = user_event.event_id
INNER JOIN user
ON user_event.user_id = user.id
```

## La recherche d'une réservation

On peut rechercher une réservation avec :

- le **prénom**, le **nom** et le **libellé** de l'exposant
- la **date** de l'événement

```sql
SELECT r.id, 
u.first_name, u.last_name, u.label, 
r.status,
count (t.id) as num_tables,
sum(t.price) as total,
m.label,
r.paid_at
r.comment
INNER JOIN table
ON table.reservation_id = reservation.id
INNER JOIN mode
ON reservation.mode_id = mode.id
INNER JOIN event
ON reservation.event_id = event.id
INNER JOIN user_event
ON event.id = user_event.event_id
INNER JOIN user
ON user_event.user_id = user.id
WHERE u.first_name LIKE '%' . :first_name . '%'
OR    u.last_name LIKE '%' . :last_name . '%'
OR    u.label LIKE '%' . :label . '%'
OR    r.paid_at >= :paid_at
```

## L'ajout d'une réservation

**Page** : admin/reservations-form.js

Une nouvelle réservation est définie par :

- son **exposant** (prénom, nom et libellé)
- son **événement**
- son **statut** ("A Payer", "Payé", "Annulé")
- sa **liste de tables** (de 1 à 12)
- sa **somme totale** réglée
- son **mode de paiement**
- sa **date de paiement** (si le statut est "Payé")
- ses **commentaires** (optionnel)

```sql
INSERT INTO reservation (status, paid_at, comment, user_id, event_id, mode_id)
VALUES (:status, :paid_at, :comment, :user_id, :event_id, :mode_id)
```

## L'édition d'une réservation

**Page** : admin/reservations-form.js

On peut éditer une réservation avec les informations basées sur le formulaire d'ajout.

L'exposant et l'événement concernés restent inchangés.

```sql
UPDATE reservation 
SET status = :status,
    paid_at = :paid_at, 
    comment = :comment, 
    user_id = :user_id, 
    event_id = :event_id, 
    mode_id = :mode_id
WHERE id = :id
```