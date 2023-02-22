# Application AACCP - Conception

## Le contexte du projet

Chaque année, l'AACCP (Association Alsacienne de Collectionneurs de Cartes Postales) organise un salon multicollections chaque premier dimanche de mai à Huttendorf.

Le projet se résume en un système de réservations de tables d'un exposant à l'occasion d'un salon annuel, tout en étant rattaché au nouveau site dédié à l'association.

A l'origine, les réservations et la trésorerie étaient gérés manuellement.

Il en était de même pour l'envoi de courriers, l'annonce d'un prochain salon et des nouvelles de l'association.

Un exposant peut s'inscrire avec son adresse e-mail et un mot de passe s'il le souhaite.

Il peut ensuite faire une demande de réservation.

Le cas échéant, le trésorier ou l'administrateur inscrit l'exposant manuellement avec les informations essentielles (nom, prénom et libellé).

En effet, tous les exposants n'ont pas l'accès à Internet, la maîtrise de l'outil informatique ou le souhait de fournir des informations personnelles sensibles (adresse e-mail, numéro de téléphone).

La réservation est ensuite validée selon le statut de paiement et le nombre de tables disponibles.

## L'environnement technique

**Next**

Il s'agit d'un framework back-end basé sur React et la JAMStack, une bibliothèque de composants logiques en JavaScript.

Il est aussi possible d'avoir un rendu côté serveur.

**Vercel**

Il s'agit de l'hébergeur choisi et à l'origine du framework Next.

**GitHub**

Il s'agit d'un gestionnaire de versions classique parmi les outils DevOPS.

**NPM**

Il s'agit d'un gestionnaire de dépendances (ou packages) propre à NodeJS et à l'environnement de JavaScript.

**Laravel**

Il s'agit d'un framework back-end basé sur le langage PHP.

**MySQL**

Il s'agit d'un SGBD (système de gestion de bases de données) permettant de stocker, de manipuler et de gérer des informations dans une base de données relationnelle.

**Jest**

Il s'agit du framework de référence pour les tests automatisés en JavaScript.

**Maildev**

Cet outil permet de tester l'envoi et la réception d'e-mails en local.

## Les spécifications fonctionnelles

Les priorités sont définies comme suit :

|||
|-|-|
|**B**|Basse|
|**M**|Moyenne|
|**H**|Haute|

Les états d'avancement sont définis comme suit :

|||
|-|-|
|**!**|en cours|
|**T**|à tester|
|**x**|finalisé|

***

|||
|-|-|
|**L'inscription et la connexion**||
|||
|L'inscription d'un utilisateur||
|La connexion d'un utilisateur||
|La déconnexion d'un utilisateur||
|L'inscription manuelle d'un utilisateur||
|La réinitialisation du mot de passe||
|La page de réinitialisation du mot de passe||
|||
|**Le profil d'un utilisateur**||
|||
|Profil > Onglet "Informations Personnelles"||
|Profil > Onglet "Connexion"||
|Profil > Onglet "Réservation"||
|||
|**La gestion des utilisateurs**||
|||
|La liste des utilisateurs||
|La recherche d'un utilisateur||
|L'inscription manuelle d'un utilisateur||
|L'édition manuelle d'un utilisateur||
|||
|**La gestion des événements**||
|||
|La liste des événements||
|La recherche d'un événement||
|L'ajout d'un événement||
|L'édition d'un événement||
|||
|**La gestion des modes de paiement**||
|||
|La liste des modes de paiement||
|L'ajout d'un mode de paiement||
|L'édition d'un mode de paiement||
|||
|**La gestion des réservations**||
|||
|La liste des réservations||
|La recherche d'une réservation||
|L'ajout d'une réservation||
|L'édition d'une réservation||
|||
|**La gestion des documents**||
|||
|La liste des documents||
|La recherche d'un document||
|L'ajout d'un document||
|L'édition d'un document||

## Le traîtement des données

Le traîtement des données doit respecter la norme RGPD (Réglement Général de la Protection des Données).

Cette norme a pour but de responsabiliser les organismes traitant des données personnelles.

C'est à l'origine une directive européenne, transposée en 2018 en droit français.

Elle permet d’encadrer le traitement et la circulation des données à caractère personnel sur le territoire européen.

Ce règlement est obligatoire, et indique que les données personnelles doivent être :
- traitées de manière licite, loyale et transparente
- collectées à des fins déterminées, explicites et légitimes
- adéquates, pertinentes et limitées
- exactes et tenues à jour
- conservées pendant une durée raisonnable
- traitées de façon à garantir leur protection

Il est donc nécessaire de :

- définir une personne chargée de la protection des données (l'administrateur)
- lister les données et leur utilité
- repérer les données à risques et les protéger
- respecter le droit des membres concernant la collecte de leurs données, leur modification, leur suppression et leur oubli
- s’assurer que les sous-traitants respectent la norme RGPD

La gestion des données se déroule en 4 actions selon le modèle CRUD :
- **Create** (créer)
- **Read** (lire)
- **Update** (éditer)
- **Delete** (supprimer)

## Les rôles

Les utilisateurs sont définis en 3 rôles : exposant (par défaut), trésorier et administrateur (unique).

L'administrateur détient l'ensemble des droits pour la gestion des données (utilisateurs, messages, modes de paiement, documents, événements, tables, réservations).

Le trésorerier peut gérer l'ensemble des réservations et des tables.

Chaque utilisateur inscrit et connecté peut :
- consulter l'état de sa dernière réservation et ses messages
- modifier ses informations générales et ses identifiants

Un utilisateur non connecté est un invité.

## L'inscription et la connexion



### L'inscription d'un utilisateur

**Rôle** : Invité<br>
**Page** : register.js

Un exposant peut s'inscrire avec :

|||
|-|-|-|
|son **adresse e-mail**|format e-mail|requis|
|son **mot de passe**|valide|requis|
|son **prénom**|de 2 à 50 caractères alphabétiques, - inclus|requis|
|son **nom de famille**|de 2 à 50 caractères alphabétiques, - inclus|requis|
|son **numéro de téléphone**|de 10 à 20 caractères numériques, + inclus|optionnel|
|son **libellé de stand**|de 2 à 255 caractères|optionnel|
|son **inscription à la newsletter**|case à cocher (optin)||

Le mot de passe doit comporter :
- entre 8 et 32 caractères
- au moins une minuscule (a-z)
- au moins une majuscule (A-Z)
- au moins un chiffre (0-9)
- au moins un caractère spécial

### La connexion d'un utilisateur

**Rôle** : Invité

**Page** : login.js

Un utilisateur inscrit est invité à se connecter avec :
- son adresse e-mail
- son mot de passe

Un message d'erreur s'affiche si :
- l'adresse e-mail ou le mot de passe n'est pas renseigné
- l'adresse e-mail est introuvable
- le mot de passe est incorrect

Un message confirme la connexion d'un utilisateur.

### La déconnexion d'un utilisateur

**Rôles** : Exposant, Trésorier, Administrateur

Un utilisateur déconnecté est redirigé vers la page d'accueil.

Un message confirme sa déconnexion.



### La réinitialisation du mot de passe

**Rôle** : Invité

**Page** : login.js

Un utilisateur peut demander la réinitialisation du mot de passe pour se connecter.

Un clic sur le lien affiche une fenêtre modale avec une adresse e-mail à renseigner.

Si l'adresse e-mail existe, l'utilisateur reçoit un e-mail de réinitialisation du mot de passe.

Sinon, un message d'erreur indique l'inexistence de l'adresse e-mail.

### La page de réinitialisation du mot de passe

**Rôle** : Invité

**Page** : reset.js

Un lien du mail de réinitialisation du mot de passe redirige l'utilisateur vers une page dédiée.

L'utilisateur doit renseigner son nouveau mot de passe et le confirmer.

Le mot de passe doit comporter :
- entre 8 et 32 caractères
- au moins une minuscule (a-z)
- au moins une majuscule (A-Z)
- au moins un chiffre (0-9)
- au moins un caractère spécial

Un message confirme la réinitialisation du mot de passe et redirige l'utilisateur sur la page de connexion.

Un message d'erreur s'affiche si le mot de passe n'est pas valide ou confirmé.

## Le profil d'un utilisateur

**Rôles** : Administrateur, Trésorier, Exposant

**Page** : profile.js

Un utilisateur peut consulter son profil selon les onglets suivants :

### Profil > Onglet "Informations Personnelles"

L'utilisateur peut changer ses informations personnelles de base :

|||
|-|-|-|
|son **prénom**|de 2 et 50 caractères alphabétiques, accents et - inclus|requis|
|son **nom de famille**|de 2 et 50 caractères alphabétiques, accents et - inclus|requis|
|son **numéro de téléphone**|de 10 à 20 caractères numériques, + inclus|optionnel|
|son **libellé de stand**|de 2 à 255 caractères|optionnel|
|son **inscription à la newsletter**|case à cocher (optin)||

### Profil > Onglet "Connexion"

L'utilisateur peut changer son adresse e-mail au besoin.

Il peut aussi changer son mot de passe en indiquant :
- son ancien mot de passe
- son nouveau mot de passe
- la confirmation du nouveau mot de passe

### Profil > Onglet "Réservation"

Un utilisateur peut consulter l'état de sa réservation pour le dernier événement.

Il y retrouve :
- l'année du dernier événement
- l'intitulé du dernier événement
- le statut de paiement
- la date de paiement

## La gestion des utilisateurs

### La liste des utilisateurs

**Rôle** : Administrateur, Trésorier

**Page** : admin/users.js

?

### La recherche d'un utilisateur

**Rôle** : Administrateur, Trésorier

**Page** : admin/users.js

?

### L'inscription manuelle d'un utilisateur

**Rôle** : Administrateur

**Page** : admin/users-form.js

Tous les exposants n'ont pas un accès à Internet ou une maîtrise de l'outil informatique.

Certains refusent d'inscrire des informations personnelles sensibles (adresse e-mail, téléphone) sur Internet.

L'administrateur peut donc enregistrer un exposant manuellement avec :

|||
|-|-|-|
|son **prénom**|de 2 et 50 caractères alphabétiques, accents et - inclus|requis|
|son **nom de famille**|de 2 et 50 caractères alphabétiques, accents et - inclus|requis|
|son **numéro de téléphone**|de 10 à 20 caractères numériques, + inclus|optionnel|
|son **libellé de stand**|de 2 à 255 caractères|optionnel|

### L'édition manuelle d'un utilisateur

**Rôle** : Administrateur

**Page** : admin/users-form.js

?


**Administrateur**

- ajout d'un utilisateur
- édition des informations d'un utilisateur
- suppression d'un utilisateur

## La gestion des événements

**Rôle** : Administrateur

### La liste des événements

**Page** : admin/events.js

?

### La recherche d'un événement

**Page** : admin/events.js

?

### L'ajout d'un événement

**Page** : admin/events.js

?

### L'édition d'un événement

**Page** : admin/events.js

?

## La gestion des modes de paiement

**Rôle** : Administrateur

### La liste des modes de paiement

**Page** : admin/modes.js

?

### L'ajout des modes de paiement

**Page** : admin/modes-form.js

?

### L'édition des modes de paiement

**Page** : admin/modes-form.js

?

## La gestion des réservations

**Rôle** : Administrateur, Trésorier

### La liste des réservations

**Page** : admin/reservations.js

?

### La recherche d'une réservation

**Page** : admin/reservations.js

?

### L'ajout d'une réservation

**Page** : admin/reservations-form.js

?

### L'édition d'une réservation

**Page** : admin/reservations-form.js

?

## La gestion des documents

**Rôle** : Administrateur

### La liste des documents

**Page** : admin/documents.js

?

### La recherche d'un document

**Page** : admin/documents.js

?

### L'ajout d'un document

**Page** : admin/documents-form.js

?

### L'édition d'un document

**Page** : admin/documents-form.js

?