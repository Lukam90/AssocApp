## La gestion des utilisateurs

### La liste des utilisateurs

- **Rôles** : Administrateur, Trésorier
- **Page** : admin/users.js

Les utilisateurs sont listées sous forme de tableau avec :

- leur **id** (#)
- leur **prénom et nom** (**ex** : Jean DUPONT)
- leur **libellé** (**ex** : Jean Philatélie) (optionnel)
- leur **adresse e-mail** (**ex** : jean.dupont@testmail.com)
- leur **numéro de téléphone** (optionnel)
- leur **rôle** ("Exposant" en noir, "Trésorier" en vert, "Administrateur" en rouge)
- leur **statut d'activation** (case cochée ou non)
- leur **statut de membre de l'association** (case cochée ou non)
- leur **statut d'inscription à la newsletter** (case cochée ou non)
- le **bouton d'édition** des informations de l'utilisateur (crayon en vert)

L'ordre est croissant et basé sur l'ID par défaut.

### La recherche d'un utilisateur

- **Rôles** : Administrateur, Trésorier
- **Page** : admin/users.js

?

### L'inscription manuelle d'un utilisateur

- **Rôle** : Administrateur
- **Page** : admin/users-form.js

Tous les exposants n'ont pas un accès à Internet ou une maîtrise de l'outil informatique.

Certains refusent d'inscrire des informations personnelles sensibles (adresse e-mail, téléphone) sur Internet.

L'administrateur peut donc enregistrer un exposant manuellement avec :

||||
|-|-|-|
|son **prénom**|de 2 et 50 caractères alphabétiques, accents et - inclus|requis|
|son **nom de famille**|de 2 et 50 caractères alphabétiques, accents et - inclus|requis|
|son **libellé de stand**|de 2 à 255 caractères|optionnel|
|son **adresse e-mail**|format e-mail|requis ou généré aléatoirement en **@aaccp.fr**|
|son **numéro de téléphone**|de 10 à 20 caractères numériques, + inclus|optionnel|

Un bouton "Ajouter un utilisateur" (bleu avec icône "+") est visible au dessus de la liste des utilisateurs.

### L'édition manuelle d'un utilisateur

- **Rôle** : Administrateur
- **Page** : admin/users-form.js

?
