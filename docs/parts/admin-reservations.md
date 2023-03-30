## La gestion des réservations

**La liste des réservations**

Les réservations sont listées sous forme de tableau avec :

- l'id
- la date prévue de l'événement concerné
- le prénom de l'exposant
- le nom de l'exposant
- le libellé de l'exposant
- le statut ("A Payer", "Payé", "Annulé")
- le nombre de tables réservées
- la somme totale réglée
- le mode de paiement
- la date de paiement (si payé ou annulé)
- les commentaires (icône "bulle" et texte au survol)

Sinon, un message indique l'absence de réservation.

**Les statistiques des réservations**

Les statistiques des réservations d'un événement annuel sont affichées au-dessus de la liste avec :

- le nombre de tables réservées / le nombre de tables disponibles
- la somme totale des réservations payées
- la somme totale des réservations à payer

**Le tri des réservations**

Les réservations sont listées par leur ID dans l'ordre croissant par défaut.

L'administrateur et le trésorier peuvent trier les réservations par ordre alphabétique (croissant ou décroissant) selon :

- le prénom d'un exposant
- le nom d'un exposant
- le libellé d'un exposant

**Le filtre des réservations**

L'administrateur et le trésorier peuvent filtrer les réservations selon :

- l'année de l'événement prévu
- le statut de paiement
- le mode de paiement

**La pagination des réservations**

La liste affiche 20 réservations par page.

L'administrateur et le trésorier peuvent choisir une limite d'affichage de 5, 10, 20, 50 ou 100.

**La recherche d'une réservation**

L'administrateur et le trésorier peuvent rechercher une réservation avec :

- le prénom, le nom et le libellé de l'exposant
- la date de l'événement

**L'ajout d'une réservation**

L'administrateur et le trésorier peuvent ajouter une nouvelle réservation avec :

- son événement
- son exposant (prénom, nom et libellé)
- son mode de paiement
- son statut ("A Payer", "Payé", "Annulé")
- sa liste de tables (de 1 à 12, sur une page dédiée)
- sa somme totale réglée (calculé automatiquement)
- sa date de paiement (requis si le statut est "Payé" ou "Annulé")
- ses commentaires (optionnel)

L'ajout d'une nouvelle réservation est seulement possible à partir d'une table définie.

Un message confirme l'ajout d'une nouvelle réservation.

Sinon, un message d'erreur s'affiche.

Si la réservation est en statut "Payé", l'exposant est notifié par e-mail.

**L'édition d'une réservation**

L'administrateur et le trésorier peuvent éditer une réservation avec les informations basées sur le formulaire d'ajout.

L'exposant et l'événement sont fixes et indiqués.

Un message confirme l'édition de la réservation.

Sinon, un message d'erreur s'affiche.

Si la réservation change de statut, l'exposant est notifié par e-mail.

**La suppression d'une réservation**

L'administrateur et le trésorier peuvent supprimer une réservation.

Une fenêtre modale s'affiche pour confirmer la suppression.

Un message confirme la suppression de la réservation.

Sinon, un message d'erreur s'affiche.

La suppression d'une réservation entraîne la suppression de toutes ses tables.