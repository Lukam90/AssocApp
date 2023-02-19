# Besoins

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

### Next

Il s'agit d'un framework back-end basé sur React et la JAMStack, une bibliothèque de composants logiques en JavaScript.

Il est aussi possible d'avoir un rendu côté serveur.

### Vercel

Il s'agit de l'hébergeur choisi et à l'origine du framework Next.

### GitHub

Il s'agit d'un gestionnaire de versions classique parmi les outils DevOPS.

### NPM

Il s'agit d'un gestionnaire de dépendances (ou packages) propre à NodeJS et à l'environnement de JavaScript.

### Laravel

Il s'agit d'un framework back-end basé sur le langage PHP.

### MySQL

Il s'agit d'un SGBD (système de gestion de bases de données) permettant de stocker, de manipuler et de gérer des informations dans une base de données relationnelle.

### Jest

Il s'agit du framework de référence pour les tests automatisés en JavaScript.

### Maildev

Cet outil permet de tester l'envoi et la réception d'e-mails en local.

## Les spécifications fonctionnelles

### Le traîtement des données

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
- Create (créer)
- Read (lire)
- Update (éditer)
- Delete (supprimer)

### Les utilisateurs

Les utilisateurs sont définis en 3 rôles : exposant (par défaut), trésorier et administrateur (unique).

L'administrateur peut gérer l'ensemble des utilisateurs et des réservations.

Le trésorerier peut gérer l'ensemble des réservations.

Un exposant peut consulter l'état de sa dernière réservation.

Un utilisateur peut modifier ses informations générales et ses identifiants.

**Exposant**

- inscription manuelle d'un utilisateur
- réinitialisation du mot de passe
- envoi d'un nouveau mot de passe
- consultation d'une réservation
- édition du profil

**Trésorier**

- liste des utilisateurs
- recherche d'un utilisateur

**Administrateur**

- ajout d'un utilisateur
- édition des informations d'un utilisateur
- suppression d'un utilisateur

### Les événements

**Rôle** : Administrateur

- liste des événements
- recherche d'un événement
- ajout d'un événement
- édition d'un événement
- suppression d'un événement

### Les réservations

**Rôles** : Administrateur, Trésorier

- liste des réservations
- recherche d'une réservation
- ajout d'une réservation
- édition d'une réservation
- suppression d'une réservation























































































