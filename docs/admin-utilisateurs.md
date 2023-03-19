[Retour au sommaire](README.md)

***

# La gestion des utilisateurs

## La liste des utilisateurs

**Rôles** : Administrateur, Trésorier<br />
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

## La recherche d'un utilisateur

**Rôles** : Administrateur, Trésorier<br />
**Page** : admin/users.js

On peut rechercher un utilisateur avec son prénom, son nom et son libellé.

## L'inscription manuelle d'un utilisateur

**Rôle** : Administrateur<br />
**Page** : admin/users-form.js

Tous les exposants n'ont pas un accès à Internet ou une maîtrise de l'outil informatique.

Certains refusent d'inscrire des informations personnelles sensibles (adresse e-mail, téléphone) sur Internet.

L'administrateur peut donc enregistrer un exposant manuellement avec :

- son **prénom** (requis, de 2 et 50 caractères alphabétiques, accents et - inclus)
- son **nom de famille** (requis, de 2 et 50 caractères alphabétiques, accents et - inclus)
- son **libellé de stand** (optionnel, de 2 à 255 caractères)
- son **adresse e-mail** (requis, format e-mail et nom en **xxx@aaccp.fr** par convention)
- son **numéro de téléphone** (optionnel, de 10 à 20 caractères numériques, + inclus)
- son **rôle** ("Exposant" ou "Trésorier")
- son **statut d'activation** (case à cocher)
- son **statut de membre** (case à cocher)

Un bouton "Ajouter un utilisateur" est visible au dessus de la liste des utilisateurs.

## L'édition manuelle d'un utilisateur

**Rôle** : Administrateur<br />
**Page** : admin/users-form.js

On peut éditer les informations d'un utilisateur sur la base du formulaire d'ajout.

```sql
UPDATE user (first_name, last_name, label, email, phone, role, is_active, is_member)
SET first_name = :first_name, 
    last_name = :last_name,
    label = :label,
    email = :email,
    phone = :phone,
    role = :role,
    is_active = :is_active,
    is_member = :is_member
WHERE id = :id
```

## La suppression d'un utilisateur

**Rôle** : Administrateur<br />
**Page** : admin/users-delete.js

Une fenêtre modale s'affiche pour confirmer la suppression d'un utilisateur.

```sql
DELETE FROM user
WHERE id = :id
```