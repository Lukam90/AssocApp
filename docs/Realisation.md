## La base de données

![](docs/diagrams/entities.png)

### Les entités

**User - Les utilisateurs**

|||||
|-|-|-|-|
|**id**|l'identifiant de l'utilisateur|entier|clé primaire|
|**email**|l'adresse e-mail de l'exposant / utilisateur|chaîne (255)|optionnel pour un exposant|
|**password**|le mot de passe de l'exposant / utilisateur|chaîne (255)|optionnel pour un exposant|
|**first_name**|le prénom de l'exposant / utilisateur|chaîne (50)|requis|
|**last_name**|le nom de famille de l'exposant / utilisateur|chaîne (50)|requis|
|**phone**|le numéro de téléphone de l'exposant|chaîne (20)|optionnel|
|**label**|le libellé de l'exposant|chaîne (255)|optionnel|
|**is_member**|l'exposant est un membre de l'association|booléen|"non" par défaut|
|**is_optin**|l'exposant est inscrit à la newsletter de l'association|booléen|"non" par défaut|
|**role**|le rôle de l'utilisateur ("Exposant", "Trésorier", "Administrateur")|chaîne (20)|"Exposant" par défaut|

**Newsletter - Les newsletters**

|||||
|-|-|-|-|
|**id**|l'identifiant de la newsletter|entier|clé primaire|
|**object**|le titre de la newsletter|chaîne (255)|requis|
|**content**|le contenu de la newsletter|texte|requis|
|**status**|le statut de publication de la newsletter ("Brouillon", "Envoyé")|chaîne (15)|"Brouillon" par défaut|
|**send_at**|la date d'envoi de la newsletter|date|déterminé lors de l'envoi|

**Ticket - Les tickets**

|||||
|-|-|-|-|
|**id**|l'identifiant du ticket|entier|clé primaire|
|full_name|le nom complet (prénom et nom de famille) de l'auteur du ticket|chaîne (100)|requis, indiqué si l'utilisateur est connecté|
|label|le libellé de l'auteur du ticket|chaîne (255)|optionnel, indiqué si l'utilisateur est connecté|
|email|l'adresse e-mail de l'auteur du ticket|chaîne (100)|optionnel, indiqué si l'utilisateur est connecté|
|phone|le numéro de téléphone de l'auteur du ticket|chaîne (20)|optionnel, indiqué si l'utilisateur est connecté|
|type|le type de ticket ("Question", "Suggestion")|chaîne (15)|"Question" par défaut|
|object|le titre du ticket|chaîne (255)|requis|
|content|le contenu textuel du ticket|texte|requis|
|created_at|la date de création du ticket|date|déterminé lors de la création|
|status|le status du ticket ("Demande", "Résolu")|chaîne (10)|"Demande" par défaut|

**Mode - Les modes de paiement**

|||||
|-|-|-|-|
|**id**|l'identifiant du mode de paiement|entier|clé primaire|
|**label**|libellé du mode de paiement|chaîne (50)|requis|

**Document - Les documents**

|||||
|-|-|-|-|
|**id**|l'identifiant du document|entier|clé primaire|
|**title**|l'intitulé du document|chaîne (255)|requis|
|**file**|le fichier source (document texte, image)|blob|requis|

**Event - Les événements**

|||||
|-|-|-|-|
|**id**|l'identifiant de l'événement|entier|clé primaire|
|**planned_at**|la date prévue de l'événement (JJ/MM/AAAA)|date|requis|
|**title**|l'intitulé de l'événement|chaîne (255)|requis|
|**num_available**|le nombre de tables disponibles|entier (3)|requis|
|**fixed_price**|le prix de base pour une table|décimal (2,2)|requis|

**Reservation - Les réservations**

|||||
|-|-|-|-|
|**id**|l'identifiant de la réservation|entier|clé primaire|
|**number**|le nombre de table réservées|entier (2)|1 par défaut|
|**status**|le statut de paiement ("A Payer", "Payé", "Annulé")|chaîne (20)|"A Payer" par défaut|
|**paid_at**|la date de paiement (JJ/MM/AAAA)|date|requis si statut "Payé"|
|**total**|la somme totale réglée pour les tables (en €)|décimal (3,2)|0 par défaut|
|**comment**|les commentaires de la réservation|texte|optionnel|
|**mode_id**|l'identifiant du mode de paiement|entier|clé étrangère|
|**event_id**|l'identifiant de l'événement|entier|clé étrangère|

### Les cardinalités

**User (0,n) - Newsletter (1,n)**

Un utilisateur peut envoyer plusieurs newsletters. (0,n)

Une newsletter est envoyée à au moins un utilisateur. (1,n)

**User (0,n) - Ticket (0,1)**

Un utilisateur peut créer plusieurs tickets. (0,n)

Un ticket peut être lié à un utilisateur inscrit. (0,1)

**User (1,1) - Mode (0,n)**

Un utilisateur utilise un seul mode de paiement. (1,1)

Un mode de paiement peut être adopté par plusieurs utilisateurs. (0,n)

**User (0,n) - Event (0,n)**

Un utilisateur peut s'inscrire à plusieurs événements. (0,n)

Un événement peut accueillir plusieurs exposants. (0,n)

**Mode (0,n) - (1,1) Reservation**

Un mode de paiement peut concerner plusieurs réservations. (0,n)

Une réservation est réglée avec un seul mode de paiement. (1,1)

**Event (0,n) - (1,1) Reservation**

Un événement peut regrouper plusieurs réservations. (0,n)

Une réservation concerne un seul événement. (1,1)

**Document (0,1) - (0,n) Event**

Un document peut concerner un événement. (0,1)

Un événement peut regrouper plusieurs documents. (0,n)

## La modélisation

### Les cas d'utilisation

?

### Diagrammes de classe

?

### MCD (Modèle Conceptuel de Données)

?

### MLD (Modèle Logique de Données)

?

### Schéma relationnel

?
