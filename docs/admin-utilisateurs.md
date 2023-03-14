[Retour au sommaire](README.md)

***

# La gestion des utilisateurs

## La liste des utilisateurs

**Rôles** : Administrateur, Trésorier<br />
**Page** : admin/users.js

Les utilisateurs sont listés sous forme de tableau avec :

- leur **id** (**ex:** #5)
- leur **prénom et nom** (**ex:** Jean DUPONT)
- leur **libellé** (optionnel, **ex:** Jean Philatélie)
- leur **adresse e-mail** (**ex:** jean.dupont@testmail.com)
- leur **numéro de téléphone** (optionnel)
- leur **rôle** ("Exposant" en noir, "Trésorier" en vert, "Administrateur" en rouge)
- leur **statut d'activation** (case cochée ou non)
- leur **statut de membre de l'association** (case cochée ou non)
- leur **statut d'inscription à la newsletter** (case cochée ou non)
- le **bouton d'édition** des informations de l'utilisateur (crayon en vert)

L'ordre est croissant et basé sur l'ID par défaut.

```sql
SELECT u.id, u.first_name, u.last_name, u.label, u.email, u.phone, u.role, u.is_active, u.is_member, u.is_optin
FROM user u
```

## La recherche d'un utilisateur

**Rôles** : Administrateur, Trésorier<br />
**Page** : admin/users.js

On peut rechercher un utilisateur avec son prénom, son nom et son libellé.

```sql
SELECT u.id, u.first_name, u.last_name, u.label, u.email, u.phone, u.role, u.is_active, u.is_member, u.is_optin
FROM user u
WHERE u.first_name LIKE '%' . :first_name . '%'
OR    u.last_name LIKE '%' . :last_name . '%'
OR    u.label LIKE '%' . :label . '%'
```

## L'inscription manuelle d'un utilisateur

**Rôle** : Administrateur<br />
**Page** : admin/users-form.js

Tous les exposants n'ont pas un accès à Internet ou une maîtrise de l'outil informatique.

Certains refusent d'inscrire des informations personnelles sensibles (adresse e-mail, téléphone) sur Internet.

L'administrateur peut donc enregistrer un exposant manuellement avec :

- son **prénom**
  - de 2 et 50 caractères alphabétiques, accents et - inclus
  - requis
- son **nom de famille**
  - de 2 et 50 caractères alphabétiques, accents et - inclus
  - requis
- son **libellé de stand**
  - de 2 à 255 caractères
  - optionnel
- son **adresse e-mail**
  - format e-mail (ou généré aléatoirement en **@aaccp.fr**)
  - requis
- son **numéro de téléphone**
  - de 10 à 20 caractères numériques, + inclus
  - optionnel
- son **rôle**
  - "Exposant" ou "Trésorier"
- son **statut d'activation**
  - case à cocher (oui / non)
- son **statut de membre**
  - case à cocher (oui / non)

Un bouton "Ajouter un utilisateur" (bleu avec icône "+") est visible au dessus de la liste des utilisateurs.

```sql
INSERT INTO user (first_name, last_name, label, email, phone, role, is_active, is_member)
VALUES (:first_name, :last_name, :label, :email, :phone, :role, :is_active, :is_member)
```

## L'édition manuelle d'un utilisateur

**Rôle** : Administrateur<br />
**Page** : admin/users-form.js

On peut éditer les informations d'un utilisateur suivant le modèle du formulaire d'ajout.

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