## La gestion des utilisateurs

**La liste des utilisateurs**

Les utilisateurs sont listés sous forme de tableau avec :

- leur id (ex: #5)
- leur prénom et nom (ex: Jean-Michel DUPONT)
- leur libellé (ex: Jean-Michel Philatélie)
- leur adresse e-mail (ex: jean-michel.dupont@testmail.com)
- leur numéro de téléphone
- leur rôle ("Exposant" en noir, "Trésorier" en vert, "Administrateur" en rouge)
- leur statut d'activation (case cochée ou non)
- leur statut de membre de l'association (case cochée ou non)
- leur statut d'inscription à la newsletter (case cochée ou non)
- un bouton d'édition (crayon en vert, visible par l'administrateur)
- un bouton de suppression (croix en rouge, visible par l'administrateur)

**Le tri des utilisateurs**

Les utilisateurs sont listés par leur ID dans l'ordre croissant par défaut.

L'administrateur et le trésorier peuvent trier les utilisateurs par ordre alphabétique (croissant ou décroissant) selon le prénom, le nom ou le libellé.

**Le filtre des utilisateurs**

L'administrateur et le trésorier peuvent filtrer les utilisateurs selon le statut d'activation, d'appartenance à l'association en tant que membre et d'inscription à la newsletter.

**La pagination des utilisateurs**

La liste affiche 20 utilisateurs par page.

L'administrateur et le trésorier peuvent choisir une limite d'affichage de 5, 10, 20, 50 ou 100.

**La recherche d'un utilisateur**

L'administrateur et le trésorier peuvent rechercher un utilisateur avec son prénom, son nom et son libellé.

**L'inscription manuelle d'un utilisateur**

Tous les exposants n'ont pas un accès à Internet ou une maîtrise de l'outil informatique.

Certains refusent d'inscrire des informations personnelles sensibles (adresse e-mail, téléphone) sur Internet.

L'administrateur peut donc enregistrer un exposant manuellement.

Si nécessaire, une adresse en **xxx@aacccp.fr** est assignée par convention avec un mot de passe généré aléatoirement.

**La définition d'un mot de passe aléatoire**

L'administrateur peut envoyer un nouveau mot de passe aléatoire à un utilisateur si son compte est activé.

**L'édition manuelle d'un utilisateur**

L'administrateur peut éditer les informations d'un utilisateur sur la base du formulaire d'ajout.

**La suppression d'un utilisateur**

L'administrateur peut supprimer un utilisateur si différent de lui-même.

Une fenêtre modale s'affiche pour confirmer la suppression.

La suppression d'un utilisateur entraîne la suppression de toutes ses réservations et des tables liées.