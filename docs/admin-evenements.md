[Retour au sommaire](README.md)

***

# La gestion des événements

**Rôle** : Administrateur

## La liste des événements

**Page** : admin/events.js

Les événements sont listés sous forme de tableau avec :

- leur **id**
- leur **titre**
- leur **nombre de réservations**
- leur **nombre de tables disponibles**

## La recherche d'un événement

**Page** : admin/events.js

On peut rechercher un événement avec :

- son **titre**
- son **année**

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

## L'édition d'un événement

**Page** : admin/form-events.js

On peut éditer les informations d'un événement dans la continuité du formulaire de création.