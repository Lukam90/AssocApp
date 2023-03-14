[Retour au sommaire](README.md)

***

# La gestion des événements

**Rôle** : Administrateur

## La liste des événements

**Page** : admin/events.js

Les événements sont listés sous forme de tableau avec :

|||
|-|-|
leur **id**|e.id
leur **titre**|e.title
leur **nombre de réservations**|count(r.id)
leur **nombre de tables disponibles**|count(t.id)

```sql
SELECT e.id, e.title,
count(r.id) AS num_reservations,
count(t.id) AS num_tables,
FROM event e
INNER JOIN r
ON e.id = r.event_id
INNER JOIN t
ON t.reservation_id = r.id
WHERE t.reservation_id = :reservation_id
```

## La recherche d'un événement

**Page** : admin/events.js

On peut rechercher un événement avec :

|||
|-|-|
son **titre**|e.title
son **année**|year(e.planned_at)

```sql
SELECT e.title, year(e.planned_at) as event_year
FROM event e
WHERE e.title LIKE '%' . :title . '%'
OR    event_year = :year
```

## L'ajout d'un événement

**Page** : admin/form-events.js

On peut ajouter un événement avec :

- son **titre**
  - entre 2 et 255 caractères
  - requis
- sa **date prévue**
  - **ex:** 7 mai 2023
  - requis
- son **image d'illustration**
  - **ex:** affiche du salon annuel prévu
  - optionnel
- sa **description**
  - texte converti en HTML
  - requis
- son **nombre de tables disponibles**
  - entier, entre 0 et 999
  - 0 par défaut

```sql
INSERT INTO event (title, planned_at, picture, content, num_available)
VALUES (:title, :planned_at, :picture, :content, :num_available)
```

## L'édition d'un événement

**Page** : admin/form-events.js

On peut éditer les informations d'un événement dans la continuité du formulaire de création.

```sql
UPDATE event
SET title = :title, 
  	planned_at = :planned_at, 
	picture = :picture, 
	content = :content, 
	num_available = :num_available
```