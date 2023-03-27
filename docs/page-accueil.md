[Retour au sommaire](README.md)

***

# La page d'accueil

**Page** : home.js

## L'annonce du prochain événement

Le prochain événement (si publié) est annoncé avec :

- son **titre**
- sa **date prévue**
- son **image d'illustration**
- son **contenu**
- son **prix de base** par table
- son **nombre de tables** restantes
- un **formulaire de réservation**

Sinon, un message indique l'absence d'événement publié.

## La réservation de tables

**Rôle** : Tous (Connecté)

Le formulaire de réservation comporte :

- le **nombre de tables**, de 1 à 12 (ou selon le nombre restant si N < 12)
- le **mode de paiement** (requis, liste de choix)
- les **commentaires** (optionnel, texte)

Le formulaire est visible si :

- il reste au moins une table disponible
- l'utilisateur est connecté
- l'utilisateur n'a pas encore fait de demande de réservation

Une nouvelle réservation est enregistrée avec le statut "A Payer" et ses tables.

Chaque table est enregistrée avec le prix de base défini pour l'événement.

Le trésorier est notifié par e-mail avec :

- l'**intitulé de l'événement**
- la **date de l'événement**
- le **prix** de base de l'événement
- le **prénom**, **nom** et **libellé** de l'exposant
- le **mode de paiement**
- le **nombre de tables** réservées
- la **somme totale** calculée par défaut (**prix de base** x **nombre de tables**)

Un message confirme l'enregistrement de la nouvelle réservation.

Sinon, un message d'erreur s'affiche.