[Retour au sommaire](README.md)

***

# La gestion des réservations

**Rôles** : Trésorier, Administrateur

## La liste des réservations

**Page** : admin/reservations.js

Les réservations liées à un événement sont listées sous forme de tableau avec :

- l'**id**
- le **prénom** de l'exposant
- le **nom** de l'exposant
- le **libellé** de l'exposant
- le **statut** ("A Payer", "Payé", "Annulé")
- le **nombre de tables** réservées
- la **somme totale** réglée
- le **mode de paiement**
- la **date de paiement** (si payé ou annulé)
- les **commentaires** (icône "bulle" et texte au survol)

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