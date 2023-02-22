## La base de données

![](docs/entities/entities.png)

## Les entités

### User - Les utilisateurs

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

### Message - Les messages

|||||
|-|-|-|-|
|**id**|l'identifiant du message|entier|clé primaire|
|**object**|objet du message|chaîne (255)|requis|
|**content**|contenu textuel du message|texte|requis|
|**is_newsletter**|envoi groupé ou newsletter|booléen|"non" par défaut|

### Mode - Les modes de paiement

|||||
|-|-|-|-|
|**id**|l'identifiant du mode de paiement|entier|clé primaire|
|**label**|libellé du mode de paiement|chaîne (50)|requis|

### Document - Les documents

|||||
|-|-|-|-|
|**id**|l'identifiant du document|entier|clé primaire|
|**title**|l'intitulé du document|chaîne (255)|requis|
|**file**|le fichier source (document texte, image)|blob|requis|

### Event - Les événements

|||||
|-|-|-|-|
|**id**|l'identifiant de l'événement|entier|clé primaire|
|**planned_at**|la date prévue de l'événement (JJ/MM/AAAA)|date|requis|
|**title**|l'intitulé de l'événement|chaîne (255)|requis|
|**num_available**|le nombre de tables disponibles|entier (3)|requis|
|**fixed_price**|le prix de base pour une table|décimal (2,2)|requis|

### Reservation - Les réservations

|||||
|-|-|-|-|
|**id**|l'identifiant de la réservation|entier|clé primaire|
|**number**|le nombre de table réservées|entier (2)|1 par défaut|
|**status**|le statut de paiement ("A Payer", "Payé", "Annulé")|chaîne (20)|"A Payer" par défaut|
|**paid_at**|la date de paiement (JJ/MM/AAAA)|requis si statut "Payé"|
|**total**|la somme totale réglée pour les tables (en €)|décimal (3,2)|0 par défaut|
|**comment**|les commentaires de la réservation|texte|optionnel|
|**mode_id**|l'identifiant du mode de paiement|entier|clé étrangère|
|**event_id**|l'identifiant de l'événement|entier|clé étrangère|

## Les cardinalités

### User (0,n) - Message (1,n)

Un utilisateur peut envoyer plusieurs messages à un autre utilisateur. (0,n)

(réflexion, en même temps)

### User (1,1) - Mode (0,n)

Un utilisateur utilise un seul mode de paiement. (1,1)

Un mode de paiement peut être adopté par plusieurs utilisateurs. (0,n)

### User (0,n) - Event (0,n)

Un utilisateur peut s'inscrire à plusieurs événements. (0,n)

Un événement peut accueillir plusieurs exposants. (0,n)

### Mode (0,n) - (1,1) Reservation

Un mode de paiement peut concerner plusieurs réservations. (0,n)

Une réservation est réglée avec un seul mode de paiement. (1,1)

### Event (0,n) - (1,1) Reservation

Un événement peut regrouper plusieurs réservations. (0,n)

Une réservation concerne un seul événement. (1,1)

### Document (0,1) - (0,n) Event

Un document peut concerner un événement. (0,1)

Un événement peut regrouper plusieurs documents. (0,n)

## La modélisation (UML)

### Les cas d'utilisation

![](usecases/ucase-reservations.png)

![](images/Usecases.png)

### Diagrammes de classe

![](images/classes.png)

### MCD (Modèle Conceptuel de Données)

![](images/MCD.png)

### MLD (Modèle Logique de Données)

![](images/MLD.png)

### Schéma relationnel

![](images/Relationnel.png)





















































































