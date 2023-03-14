[Retour au sommaire](README.md)

***

# La gestion des modes de paiement

**Rôle** : Administrateur

## La liste des modes de paiement

Les modes de paiement sont listés sous forme de tableau avec :

- l'**id**
- le **libellé**

```sql
SELECT * FROM mode
```

## L'ajout des modes de paiement

**Page** : admin/modes-form.js

On peut ajouter un mode de paiement défini par un libellé.

```sql
INSERT INTO mode VALUES(:label)
```

## L'édition des modes de paiement

**Page** : admin/modes-form.js

On peut éditer un mode de paiement avec son libellé.

```sql
UPDATE mode
SET label = :label
WHERE mode_id = :id
```