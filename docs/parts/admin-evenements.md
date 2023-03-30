## La gestion des événements

**La liste des événements**

Les événements sont listés sous forme de tableau avec :

- leur id
- leur titre
- leur date prévue
- leur statut de publication (casé cochée ou non)
- leur prix de base par table
- leur nombre de réservations
- leur nombre de tables disponibles
- un bouton d'édition (crayon en vert)
- un bouton de suppression (croix en rouge)

Sinon, un message indique l'absence d'événement.

**Le tri des événements**

Les événements sont listés par leur ID dans l'ordre croissant par défaut.

L'administrateur peut trier les événements par ordre (dé)croissant selon :

- leur titre
- leur date prévue

**La pagination des événements**

La liste affiche 20 événements par page.

L'administrateur peut choisir une limite d'affichage de 5, 10, 20, 50 ou 100.

**La recherche d'un événement**

L'administrateur peut rechercher un événement avec :

- son titre
- son année

**L'ajout d'un événement**

L'administrateur peut ajouter un événement avec :

- son titre (requis, de 2 à 255 caractères)
- sa date prévue (requis, ex: 7 mai 2023)
- son image d'illustration (optionnel, ex: affiche du salon annuel prévu)
- sa description (requis, texte converti en HTML)
- son prix de base pour chaque table (en €, entre 0 et 999)
- son nombre de tables disponibles (entier, entre 0 et 999)
- son statut de publication (case à cocher)

Un message confirme l'ajout du nouvel événement.

Sinon, un message d'erreur s'affiche.

**L'édition d'un événement**

L'administrateur peut éditer les informations d'un événement sur la base du formulaire de création.

Un message confirme l'édition de l'événement.

Sinon, un message d'erreur s'affiche.

**La suppression d'un événement**

L'administrateur peut supprimer un événement.

Une fenêtre modale s'affiche pour confirmer la suppression.

La suppression d'un événement entraîne la suppression de toutes ses réservations et des tables liées.

Un message confirme la suppression de l'événement.

Sinon, un message d'erreur s'affiche.