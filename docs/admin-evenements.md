[Retour au sommaire](README.md)

***

# La gestion des événements

**Rôle** : Administrateur

## La liste des événements

**Page** : admin/events.js

Les événements sont listés sous forme de tableau avec :

- leur **id**
- leur **titre**
- leur **prix de base** par table
- leur **statut de publication** (casé cochée ou non)
- leur **nombre de réservations**
- leur **nombre de tables disponibles**
- un **bouton d'édition** (crayon en vert)
- un **bouton de suppression** (croix en rouge)

## La recherche d'un événement

**Page** : admin/events.js

On peut rechercher un événement avec :

- son **titre**
- son **année**

## L'ajout d'un événement

**Page** : admin/form-events.js

On peut ajouter un événement avec :

- son **titre** (requis, entre 2 et 255 caractères)
- sa **date prévue** (requis, **ex:** 7 mai 2023)
- son **image d'illustration** (optionnel, **ex:** affiche du salon annuel prévu)
- sa **description** (requis, texte converti en HTML)
- son **nombre de tables disponibles** (entier, entre 0 et 999)

## L'édition d'un événement

**Page** : admin/form-events.js

On peut éditer les informations d'un événement sur la base du formulaire de création.

## La suppression d'un événement

**Page** : admin/form-events.js

Une fenêtre modale s'affiche pour confirmer la suppression d'un événement.

La suppression d'un événement entraîne la suppression de toutes ses réservations.