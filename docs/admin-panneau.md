[Retour au sommaire](README.md)

***

# Le panneau d'administration

**Rôles** : Administrateur, Trésorier

Le panneau d'administration affiche des statistiques sous forme de cartes en colonnes avec :

- le nombre d'utilisateurs
- le nombre de newsletters envoyées
- le nombre d'événements annoncés
- le nombre de réservations
- le nombre de modes de paiement
- le nombre de tables réservées

Chaque carte a un lien vers une page d'administration liée au type de donnée énoncé.

L'administrateur a accès à l'ensemble des pages.

Le trésorier a accès aux pages des réservations et des tables.

```sql
select count(id) from `user`;
select count(id) from `newsletter`;
select count(id) from `event`;
select count(id) from `reservation`;
select count(id) from `mode`;
select count(id) from `table`;
```