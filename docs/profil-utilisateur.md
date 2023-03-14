[Retour au sommaire](README.md)

***

# Le profil d'un utilisateur

**Rôles** : Tous (Connecté)<br />
**Page** : profile.js

## Onglet "Informations Personnelles"

L'utilisateur peut changer ses informations personnelles de base :

- son **prénom**
  - de 2 et 50 caractères alphabétiques, accents et - inclus
  - requis
- son **nom de famille**
  - de 2 et 50 caractères alphabétiques, accents et - inclus
  - requis
- son **numéro de téléphone**
  - de 10 à 20 caractères numériques, + inclus
  - optionnel
- son **libellé de stand**
  - de 2 à 255 caractères
  - optionnel
- son **inscription à la newsletter**
  - case à cocher (optin)
  - décoché par défaut

```sql
UPDATE user
SET first_name = :first_name,
	last_name = :last_name,
	phone = :phone,
	label = :label,
	optin = :optin
WHERE id = :id
```

## Onglet "Identifiants de Connexion"

L'utilisateur peut changer son adresse e-mail au besoin.

Il peut aussi changer son mot de passe en indiquant :

- son **ancien mot de passe**
- son **nouveau mot de passe**
- la **confirmation du nouveau mot de passe**

```sql
UPDATE user
SET password = :password
```

## Onglet "Réservation"

Un utilisateur peut consulter l'état de sa réservation pour le dernier événement.

Il y retrouve :

|||
|-|-|
la **date du dernier événement**;e.planned_at
l'**intitulé du dernier événement**;e.title
le **statut de paiement**;r.status
la **date de paiement**;r.paid_at

```sql
SELECT e.planned_at, e.title,
	   r.status, r.paid_at
FROM event e
INNER JOIN reservation r
ON e.id = r.event_id
INNER JOIN user_event inter
ON e.id = inter.event_id
INNER JOIN user
ON inter.user_id = u.id
```