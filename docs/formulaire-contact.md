[Retour au sommaire](README.md)

***

# Le formulaire de contact

**Rôles** : Invité, Exposant, Trésorier<br>
**Page** : contact.js

Un utilisateur peut contacter l'administrateur pour une question générale ou une suggestion.

Le formulaire est défini avec :

- l'**objet** de la demande (requis, de 2 à 255 caractères)
- le **prénom** de l'utilisateur (requis, de 2 à 50 caractères alphabétiques, accents et - inclus)
- le **nom** de l'utilisateur (requis, de 2 à 50 caractères alphabétiques, accents et - inclus)
- le **libellé** de l'utilisateur (optionnel, de 2 à 255 caractères)
- l'**adresse e-mail** de l'utilisateur (requis, format e-mail, de 2 à 255 caractères)
- le **numéro de téléphone** (optionnel, de 10 à 20 caractères numériques, + inclus)
- le **message** (requis, texte)

Les informations personnelles sont renseignées si l'utilisateur est déjà connecté.

Un message confirme l'envoi de la demande.

Sinon, un message d'erreur s'affiche.