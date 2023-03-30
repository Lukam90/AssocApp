# un titre

## Une image

![](/docs/schemas/entities/MCD.png)

## Des portions de code

**La table des newsletters**

```sql
CREATE TABLE IF NOT EXISTS newsletter
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    object VARCHAR(255),
    target VARCHAR(10) NOT NULL DEFAULT 'Général',
    content VARCHAR(255),
    is_send BOOLEAN NOT NULL DEFAULT 0,
    send_at DATE NOT NULL DEFAULT NOW(),
    INDEX (object)
);
```

**La table pivot des newsletters et des utilisateurs**

```sql
CREATE TABLE IF NOT EXISTS newsletter_user (
    newsletter_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (newsletter_id) REFERENCES newsletter (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE,
    PRIMARY KEY (newsletter_id, user_id)
);
```

## Des tableaux

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
