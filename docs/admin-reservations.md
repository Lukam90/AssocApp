[Retour au sommaire](README.md)

***

# La gestion des réservations

**Rôles** : Trésorier, Administrateur

## La liste des réservations

**Page** : admin/reservations.js

Les réservations sont listées sous forme de tableau avec :

;;;

- l'**id**;r.id
- le **prénom** de l'exposant;u.first_name
- le **nom** de l'exposant;u.last_name
- le **libellé** de l'exposant;u.label
- le **statut** ("A Payer", "Payé", "Annulé");r.status
- le **nombre de tables** réservées;**count**(t.id)
- la **somme totale** réglée;**sum**(t.price)
- le **mode de paiement**;m.label
- la **date de paiement**;r.paid_at
- les **commentaires**;r.comments

```sql
SELECT r.id, 
u.first_name, u.last_name, u.label, 
r.status,
count (t.id) as num_tables,
sum(t.price) as total,
m.label,
r.paid_at
r.comment
FROM reservation r
INNER JOIN table t
ON t.reservation_id = r.id
INNER JOIN mode m
ON r.mode_id = m.id
INNER JOIN event e
ON r.event_id = e.id
INNER JOIN user_event ue
ON e.id = ue.event_id
INNER JOIN user u
ON ue.user_id = u.id
```

## La recherche d'une réservation

On peut rechercher une réservation avec :

- le **prénom**, le **nom** et le **libellé** de l'exposant
- la **date** de l'événement

```sql

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

On peut éditer une réservation avec les informations basées sur le formulaire d'ajout, avec l'exposant indiqué et inchangeable.

```sql

```