# Description d’une situation de travail ayant nécessité une recherche

Dans la table des réservations, j'ai pensé à intégrer deux champs spéciaux :

- **number** pour le nombre de tables
- **total** pour la somme totale réglée

L'objectif est de simplifier la requête de la liste des réservations. 

## La solution de base

La première solution consiste à utiliser les fonctions d'agrégation :

- **COUNT()** comme équivalent du champ **number**
- **SUM()** comme équivalent du champ **total**

```sql
SELECT r.id, u.first_name, u.last_name, u.label, r.status, count(t.id) as number, sum(t.price) as total, m.label, r.paid_at, r.comments
FROM reservation r
INNER JOIN event e ON r.event_id = e.id
INNER JOIN user u ON r.user_id = u.id
INNER JOIN mode m ON r.mode_id = m.id
INNER JOIN `table` t on t.reservation_id = r.id
GROUP BY r.id;
```

## La nouvelle solution

La nouvelle solution dispense d'une jointure, de fonctions d'agrégation et de l'instruction **GROUP BY** :

```sql
SELECT r.id, u.first_name, u.last_name, u.label, r.status, number, total, m.label, r.paid_at, r.comments
FROM reservation r
INNER JOIN event e ON r.event_id = e.id
INNER JOIN user u ON r.user_id = u.id
INNER JOIN mode m ON r.mode_id = m.id;
```

Cependant, nos deux champs doivent être calculés automatiquement, lors de l'ajout et de la suppression d'une table d'une réservation.

## Les déclencheurs

Les **triggers** (ou déclencheurs) interviennent et permettent le calcul automatique d'un champ lors d'un événement (avant / après ajout, édition ou suppression).

**Nombre de tables (après ajout)**

```sql
DROP TRIGGER IF EXISTS after_insert_tables_number_on_reservation;

CREATE TRIGGER IF NOT EXISTS after_insert_tables_number_on_reservation
AFTER INSERT ON `table` 
FOR EACH ROW
    UPDATE reservation
    SET number = (
        SELECT COUNT(t.id)
        FROM `table` t
    )
    WHERE id = NEW.reservation_id;
```

**Nombre de tables (après suppression)**

```sql
DROP TRIGGER IF EXISTS after_delete_tables_number_on_reservation;

CREATE TRIGGER after_delete_tables_number_on_reservation
AFTER DELETE ON `table`
FOR EACH ROW
    UPDATE reservation
    SET number = (
        SELECT COUNT(t.id)
        FROM `table` t
    )
    WHERE id = OLD.reservation_id;
```

**Somme totale réglée (après insertion)**

```sql
DROP TRIGGER IF EXISTS after_insert_tables_total_on_reservation;

CREATE TRIGGER IF NOT EXISTS after_insert_tables_total_on_reservation
AFTER INSERT ON `table` 
FOR EACH ROW
    UPDATE reservation
    SET total = (
        SELECT SUM(t.price)
        FROM `table` t
    )
    WHERE id = NEW.reservation_id;
```

**Somme totale réglée (après suppression)**

```sql
DROP TRIGGER IF EXISTS after_delete_tables_total_on_reservation;

CREATE TRIGGER IF NOT EXISTS after_delete_tables_total_on_reservation
AFTER INSERT ON `table` 
FOR EACH ROW
    UPDATE reservation
    SET total = (
        SELECT SUM(t.price)
        FROM `table` t
    )
    WHERE id = NEW.reservation_id;
```

## La méthode de recherche

Je me suis surtout basé sur les mots-clés **déclencheurs MySQL** et **triggers MySQL** pour mes recherches.

Je me suis aussi basé sur les sources suivantes :

- la vidéo **Base de données : Triggers en MySQL** de la chaîne Algomius de Philippe SCHLEGEL
- la vidéo **Apprendre et maitriser SQL : Les triggers** de la chaîne de Grafikart
- le site de référence **sql.sh**

Je me suis ensuite posé la question de l'adaptation de ces triggers SQL dans Symfony avec l'ORM Doctrine.

Je me suis donc basé sur la documentation officielle de Symfony avec les mots-clés **doctrine triggers** et **sql triggers**. 

Les **événements Doctrine**, dont les **lifecycle events**, s'en rapprochent au mieux.

(https://symfony.com/doc/current/doctrine/events.html)
