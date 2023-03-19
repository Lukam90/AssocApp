[Retour au sommaire](README.md)

***

# La gestion des newsletters

**Rôle** : Administrateur

## La liste des newsletters

**Page** : admin/newsletters.js

Les newsletters sont listées sous forme de tableau avec :

|<br />||
|-|-|
l'**id**|n.id
l'**objet**|n.object
la **cible** ("Général" ou "Membres")|n.target
le **statut d'envoi** (case cochée ou non)|n.is_send
la **date d'envoi** (si envoyé)|n.send_at

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

## La suppression d'une newsletter

**Page** : admin/newsletters-delete.js

Une fenêtre modale s'affiche pour confirmer la suppression d'une newsletter.

```sql
DELETE FROM newsletter
WHERE id = :id
```