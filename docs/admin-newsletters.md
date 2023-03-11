[Retour au sommaire](README.md)

***

# La gestion des newsletters

**Rôle** : Administrateur

## La liste des newsletters

**Page** : admin/newsletters.js

Les newsletters sont listées sous forme de tableau avec :

- l'**id**
- l'**objet**
- le **statut d'envoi** (case cochée ou non)
- la **date d'envoi** (si envoyé)

## La recherche d'une newsletter

On peut rechercher une newsletter avec :

- son **objet**
- son **statut d'envoi**
- sa **date d'envoi**

## La création d'une newsletter

**Page** : admin/newsletters-form.js

Une nouvelle newsletter comporte :

- son **objet**
- son **contenu textuel** (converti en HTML)
- son **statut d'envoi** (case à cocher)
- sa **date d'envoi** (actuelle ou différée)

La création d'une newsletter est seulement possible avec au moins un utilisateur inscrit (optin).

## L'édition d'une newsletter

**Page** : admin/newsletters-form.js

On peut éditer une newsletter avec ses informations basées sur le formulaire de création.