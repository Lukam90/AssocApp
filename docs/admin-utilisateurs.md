[Retour au sommaire](README.md)

***

# La gestion des utilisateurs

**Rôles** : Administrateur, Trésorier

## La liste des utilisateurs

**Page** : admin/users.js

Les utilisateurs sont listés sous forme de tableau avec :

- leur **id** (**ex:** #5)
- leur **prénom et nom** (**ex:** Jean DUPONT)
- leur **libellé** (**ex:** Jean Philatélie)
- leur **adresse e-mail** (**ex:** jean.dupont@testmail.com)
- leur **numéro de téléphone**
- leur **rôle** ("Exposant" en noir, "Trésorier" en vert, "Administrateur" en rouge)
- leur **statut d'activation** (case cochée ou non)
- leur **statut de membre de l'association** (case cochée ou non)
- leur **statut d'inscription à la newsletter** (case cochée ou non)
- un **bouton d'édition** (crayon en vert, visible par l'administrateur)
- un **bouton de suppression** (croix en rouge, visible par l'administrateur)

## Le tri des utilisateurs

**Page** : admin/users.js

Les utilisateurs sont listés par leur ID dans l'ordre croissant par défaut.

L'administrateur et le trésorier peuvent trier les utilisateurs par ordre alphabétique (croissant ou décroissant) selon :

- leur **prénom**
- leur **nom**
- leur **libellé**

## Le filtre des utilisateurs

**Page** : admin/users.js

L'administrateur et le trésorier peuvent filtrer les utilisateurs selon :

- le **statut d'activation**
- le **statut de membre de l'association**
- le **statut d'inscription à la newsletter** (optin)

## La pagination des utilisateurs

**Page** : admin/users.js

La liste affiche 20 utilisateurs par page.

L'administrateur et le trésorier peuvent choisir une limite d'affichage à 5, 10, 20, 50 ou 100.

## La recherche d'un utilisateur

**Page** : admin/users.js

L'administrateur et le trésorier peuvent rechercher un utilisateur avec son prénom, son nom et son libellé.

## L'inscription manuelle d'un utilisateur

**Page** : admin/users-form.js

Tous les exposants n'ont pas un accès à Internet ou une maîtrise de l'outil informatique.

Certains refusent d'inscrire des informations personnelles sensibles (adresse e-mail, téléphone) sur Internet.

L'administrateur peut donc enregistrer un exposant manuellement avec :

- son **prénom** (requis, de 2 et 50 caractères alphabétiques, accents et - inclus)
- son **nom de famille** (requis, de 2 et 50 caractères alphabétiques, accents et - inclus)
- son **libellé de stand** (optionnel, de 2 à 255 caractères)
- son **adresse e-mail** (requis, unique, format e-mail et en **xxx@aaccp.fr** par convention)
- son **numéro de téléphone** (optionnel, de 10 à 20 caractères numériques, + inclus)
- son **rôle** ("Exposant" ou "Trésorier")
- son **statut d'activation** (case à cocher)
- son **statut de membre** (case à cocher)

Un bouton d'ajout (+ en bleu) se trouve au-dessus de la liste.

## L'édition manuelle d'un utilisateur

**Page** : admin/users-form.js

L'administrateur peut éditer les informations d'un utilisateur sur la base du formulaire d'ajout.

## La suppression d'un utilisateur

**Page** : admin/users-delete.js

L'administrateur peut supprimer un utilisateur.

Une fenêtre modale s'affiche pour confirmer la suppression.
