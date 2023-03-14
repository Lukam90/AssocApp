[Retour au sommaire](README.md)

***

# La gestion des newsletters

**Rôle** : Administrateur

## La liste des newsletters

**Page** : admin/newsletters.js

Les newsletters sont listées sous forme de tableau avec :

- l'**id**
- l'**objet**
- la **cible** ("Général" ou "Membres")
- le **statut d'envoi** (case cochée ou non)
- la **date d'envoi** (si envoyé)

```sql
SELECT * FROM newsletter
```

## La recherche d'une newsletter

On peut rechercher une newsletter avec :

- son **objet**
- sa **cible**
- son **statut d'envoi**
- sa **date d'envoi**

```sql
SELECT * FROM newsletter
WHERE object LIKE '%' . :object . '%'
AND   target = :target
AND   is_send = :is_send
AND   send_at >= :send_at
```

## La création d'une newsletter

**Page** : admin/newsletters-form.js

Une nouvelle newsletter comporte :

- son **objet**
- sa **cible**
- son **contenu textuel** (converti en HTML)
- son **statut d'envoi** (case à cocher)
- sa **date d'envoi** (actuelle ou différée)

L'envoi d'une newsletter est seulement possible avec au moins un utilisateur inscrit (optin).

```sql
INSERT INTO newsletter (object, target, content, is_send, send_at)
VALUES (:object, :target, :content, :is_send, :send_at)
```

## L'édition d'une newsletter

**Page** : admin/newsletters-form.js

On peut éditer une newsletter avec ses informations basées sur le formulaire de création.

```sql
UPDATE newsletter
SET object = :object, 
    target = :target, 
    content = :content, 
    is_send = :is_send, 
    send_at = :send_at
WHERE id = :id
```