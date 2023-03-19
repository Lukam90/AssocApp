[Retour au sommaire](README.md)

***

# La gestion des newsletters

**Rôle** : Administrateur

## La liste des newsletters

**Page** : admin/newsletters.js

Les newsletters sont listées sous forme de tableau avec :

- l'**id**
- l'**objet**
- la **cible** ("Général" ou "Membres")
- le **statut d'envoi** (case cochée ou non)
- la **date d'envoi** (si envoyé)

## La recherche d'une newsletter

On peut rechercher une newsletter avec :

- son **objet**
- sa **cible**
- son **statut d'envoi**
- sa **date d'envoi**

## La création d'une newsletter

**Page** : admin/newsletters-form.js

Une nouvelle newsletter comporte :

- son **objet**
- sa **cible**
- son **contenu textuel** (converti en HTML)
- son **statut d'envoi** (case à cocher)
- sa **date d'envoi** (actuelle ou différée)

## L'envoi d'une newsletter

L'envoi d'une newsletter est seulement possible avec au moins un utilisateur inscrit (optin).

## L'édition d'une newsletter

**Page** : admin/newsletters-form.js

On peut éditer une newsletter avec ses informations basées sur le formulaire de création.

## La suppression d'une newsletter

**Page** : admin/newsletters-delete.js

Une fenêtre modale s'affiche pour confirmer la suppression d'une newsletter.