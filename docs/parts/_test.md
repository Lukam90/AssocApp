# un titre

**Une liste de tâches**

|||
|-|-|
|1|La page d'accueil|
|2|La gestion des utilisateurs|
|3|L'inscription et la connexion|
|4|La gestion des événements|
|5|La gestion des modes de paiement|
|6|La gestion des réservations|
|7|La gestion des tables|
|8|Le profil d'un utilisateur|
|9|La gestion des newsletters|

Un exemple de table

|||||
|-|-|-|-|
|nom|description|type|règle|
|id|l'identifiant de la table|entier|clé primaire|
|price|le prix individuel d'une table|décimal (5,2)|prix de base pour un événement par défaut|
|pos_x|la position en abscisses (X) de la table|entier (3)|0 par défaut|
|pos_y|la position en ordonnées (Y) de la table|entier (3)|0 par défaut|
|comments|les commentaires d'une table|texte|optionnel|

**Et un autre**

|||||
|-|-|-|-|
|nom|description|type|règle|
|id|l'identifiant de la newsletter|entier|clé primaire|
|object|le titre de la newsletter|chaîne (255)|requis|
|target|la cible de la newsletter ("Général" ou "Membres")|chaîne (10)|"Général" par défaut|
|content|le contenu de la newsletter|texte|requis|
|is_send|la newsletter est envoyée|booléen|0 par défaut|
|send_at|la date d'envoi de la newsletter|date|déterminé lors de l'envoi|

## un sous-titre

**un titre banal**

un paragraphe

un **mot** en **gras**

Une image

![](./docs/schemas/entities/MCD.png)
