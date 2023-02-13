# Réalisation

## La base de données

(schéma)

## Les entités

### User - Les utilisateurs

|||||
|-|-|-|-|
|**id**|l'identifiant de l'utilisateur|entier|clé primaire|
|**email**|l'adresse e-mail de l'exposant / utilisateur|chaîne (255)|optionnel pour un exposant|
|**password**|le mot de passe de l'exposant / utilisateur|chaîne (255)|optionnel pour un exposant|
|**role**|le rôle de l'utilisateur ("Exposant", "Trésorier", "Administrateur")|chaîne (20)|"Exposant" par défaut|
|**first_name**|le prénom de l'exposant / utilisateur|chaîne (32)|requis|
|**last_name**|le nom de famille de l'exposant / utilisateur|chaîne (50)|requis|
|**label**|le libellé de l'exposant|chaîne (255)|optionnel|

### Reservation - Les réservations

|||||
|-|-|-|-|
|**id**|l'identifiant de la réservation|entier|clé primaire|
|**number**|le nombre de table réservées|entier (1)|0 par défaut|
|**paid**|le statut de paiement ("oui" / "non")|booléen|"non" par défaut|
|**paid_at**|la date de paiement (JJ/MM/AAAA)|date courante par défaut|
|**sum**|la somme réglée (en €)|décimal (3,2)|0 par défaut|
|**mode**|le mode de paiement ("Chèque", "Espèces")|chaîne (10)|"Espèces" par défaut|
|**user_id**|l'identifiant de l'exposant concerné|entier|clé étrangère|
|**event_id**|l'identifiant de l'événement concerné|entier|clé étrangère|

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





















































































