[Retour au sommaire](README.md)

***

# L'inscription et la connexion

## L'inscription d'un utilisateur

**Rôle** : Invité<br />
**Page** : register.js

Un exposant peut s'inscrire avec :

- son **adresse e-mail**
  - e-mail
  - requis
- son **mot de passe**
  - entre 8 et 32 caractères
  - au moins une minuscule (a-z, ç)
  - au moins une majuscule (A-Z)
  - au moins un chiffre (0-9)
  - au moins un caractère spécial (@, $)
  - requis
- son **prénom**
  - de 2 à 50 caractères alphabétiques, - inclus
  - requis
- son **nom de famille**
  - de 2 à 50 caractères alphabétiques, - inclus
  - requis
- son **numéro de téléphone**
  - de 10 à 20 caractères numériques, + inclus
  - optionnel
- son **libellé de stand**
  - de 2 à 255 caractères
  - optionnel
- son **inscription à la newsletter**
  - case à cocher (optin)
  - décoché par défaut

## La connexion d'un utilisateur

**Rôle** : Invité<br />
**Page** : login.js

Un utilisateur inscrit est invité à se connecter avec :

- son adresse e-mail
- son mot de passe

Un message d'erreur s'affiche si :

- l'adresse e-mail ou le mot de passe n'est pas renseigné
- l'adresse e-mail est introuvable
- le mot de passe est incorrect

Un message confirme la connexion d'un utilisateur.

## La déconnexion d'un utilisateur

**Rôles** : Tous (Connecté)<br />
**Redirection** : index.js

Un utilisateur déconnecté est redirigé vers la page d'accueil.

Un message confirme sa déconnexion.

## L'oubli de mot de passe

**Rôle** : Invité<br />
**Page** : login.js

Un utilisateur peut demander la réinitialisation du mot de passe pour se connecter.

Un clic sur le lien affiche une fenêtre modale avec une adresse e-mail à renseigner.

Si l'adresse e-mail existe, l'utilisateur reçoit un e-mail de réinitialisation du mot de passe.

Sinon, un message d'erreur indique l'inexistence de l'adresse e-mail.

## La réinitialisation du mot de passe

**Rôle** : Invité<br />
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