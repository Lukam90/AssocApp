[Retour au sommaire](README.md)

***

# La gestion des réservations

**Rôles** : Trésorier, Administrateur

## La liste des réservations

**Page** : admin/reservations.js

Les réservations liées à un événement sont listées sous forme de tableau avec :

|<br />||
|-|-|
l'**id**|r.id
le **prénom** de l'exposant|u.first_name
le **nom** de l'exposant|u.last_name
le **libellé** de l'exposant|u.label
le **statut** ("A Payer", "Payé", "Annulé")|r.status
le **nombre de tables** réservées (si payé)|COUNT(t.id)
la **somme totale** réglée (si payé)|SUM(t.price)
le **mode de paiement**|m.label
la **date de paiement** (si payé ou annulé)|r.paid_at
les **commentaires** (icône "bulle" et texte au survol)|r.comments

## La recherche d'une réservation

On peut rechercher une réservation avec :

- le **prénom**, le **nom** et le **libellé** de l'exposant
- la **date** de l'événement

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

## L'édition d'une réservation

**Page** : admin/reservations-form.js

On peut éditer une réservation avec les informations basées sur le formulaire d'ajout.

L'exposant et l'événement concernés restent inchangés.

## La suppression d'une réservation

**Page** : admin/reservations-delete.js

Une fenêtre modale s'affiche pour confirmer la suppression d'une réservation.

La suppression d'une réservation entraîne la suppression de toutes ses tables.

```sql
DELETE FROM réservation
WHERE id = :id
```