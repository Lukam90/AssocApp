[Retour au sommaire](README.md)

***

# La gestion des tables d'une réservation

**Rôles** : Trésorier, Administrateur

## La liste des tables

**Page** : admin/tables.js

Les tables d'une réservation sont listées sous forme de tableau avec :

- leur **position X** (abscisses)
- leur **position Y** (ordonnées)
- leur **prix**
- leurs **commentaires**

Sinon, un message indique l'absence de tables.

## L'ajout d'une table

**Page** : admin/tables-form.js

L'administrateur et le trésorier peuvent ajouter de 1 à 12 tables à une réservation.

Chaque table est définie avec :

- sa **position X** (0 par défaut)
- sa **position Y** (0 par défaut)
- son **prix** (prix de base pour un événement par défaut)
- ses **commentaires** (optionnel)

L'ajout d'une table est possible selon le nombre de tables disponibles.

Un message confirme l'ajout d'une nouvelle table.

Sinon, un message d'erreur s'affiche.

## L'édition d'une table

**Page** : admin/tables-form.js

L'administrateur et le trésorier peuvent changer les informations d'une table sur le modèle du formulaire d'ajout.

Un message confirme l'édition d'une table.

Sinon, un message d'erreur s'affiche.

## La suppression d'une table

**Page** : admin/tables-delete.js

Si la réservation comporte au moins 2 tables, l'administrateur et le trésorier peuvent supprimer une des tables.

Une fenêtre modale s'affiche pour confirmer la suppression.

Un message confirme la suppression d'une table.

Sinon, un message d'erreur s'affiche.
