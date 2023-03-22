[Retour au sommaire](README.md)

***

# L'inscription et la connexion

## L'inscription d'un utilisateur

**Rôle** : Invité<br />
**Page** : register.js

Un exposant peut s'inscrire avec :

- son **adresse e-mail** (requis et unique)
- son **mot de passe** (requis)
- son **prénom** (requis, de 2 à 50 caractères alphabétiques, - et accents inclus)
- son **nom de famille** (requis, de 2 à 50 caractères alphabétiques, - et accents inclus)
- son **numéro de téléphone** (optionnel, de 10 à 20 caractères numériques, + inclus)
- son **libellé de stand** (optionnel, de 2 à 255 caractères)
- son **inscription à la newsletter** (case à cocher (optin))

Un mot de passe valide comporte :

- entre **8 et 32 caractères**
- au moins **une minuscule** (a-z)
- au moins **une majuscule** (A-Z)
- au moins **un chiffre** (0-9)
- au moins **un caractère spécial** (@, $, #, !)

Un message confirme l'inscription du nouvel utilisateur.

Le nouvel utilisateur est redirigé vers la page de connexion.

Sinon, un message d'erreur s'affiche.

## La connexion d'un utilisateur

**Rôle** : Invité<br />
**Page** : login.js

Un utilisateur inscrit est invité à se connecter avec :

- son **adresse e-mail**
- son **mot de passe**

Un message confirme la connexion d'un utilisateur.

Un message d'erreur s'affiche si :

- l'adresse e-mail ou le mot de passe n'est pas renseigné
- l'adresse e-mail est introuvable
- l'adresse e-mail existe déjà
- le mot de passe est incorrect

## La déconnexion d'un utilisateur

**Rôles** : Tous (Connecté)<br />
**Redirection** : index.js

Un utilisateur déconnecté est redirigé vers la page d'accueil.

Un message confirme sa déconnexion.

## L'oubli de mot de passe

**Rôle** : Invité<br />
**Page** : login.js

Un utilisateur peut demander la réinitialisation du mot de passe pour se connecter.

Lorsque l'utilisateur clique sur le lien de réinitialisation du mot de passe, une fenêtre modale s'affiche avec une adresse e-mail à renseigner.

Si l'adresse e-mail existe, un message confirme la demande de nouveau mot de passe.

Sinon, un message d'erreur s'affiche.

## La réinitialisation du mot de passe

**Rôle** : Invité<br />
**Page** : reset.js

L'utilisateur reçoit un e-mail avec un lien vers une page de réinitialisation du mot de passe.

L'utilisateur doit renseigner son nouveau mot de passe et le confirmer.

L'utilisateur est ensuite redirigé vers la page de connexion.

Un message confirme la réinitialisation du mot de passe.

Un message d'erreur s'affiche si le mot de passe n'est pas valide ou confirmé.