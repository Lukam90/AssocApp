[Retour au sommaire](README.md)

***

# La gestion des modes de paiement

**Rôle** : Administrateur

## La liste des modes de paiement

Les modes de paiement sont listés sous forme de tableau avec :

- l'**id**
- le **libellé**
- un **bouton d'édition** (crayon en vert)
- un **bouton de suppression** (croix en rouge)

Sinon, un message indique l'absence de modes de paiement.

## L'ajout d'un mode de paiement

**Page** : admin/modes-form.js

On peut ajouter un mode de paiement défini par un libellé.

Un bouton d'ajout (+ en bleu) se trouve au-dessus de la liste.

Un message confirme l'ajout du nouveau mode de paiement.

Sinon, un message d'erreur s'affiche.

## L'édition d'un mode de paiement

**Page** : admin/modes-form.js

On peut éditer un mode de paiement avec son libellé.

Un message confirme l'édition du mode de paiement.

Sinon, un message d'erreur s'affiche.

## La suppression d'un mode de paiement

**Page** : admin/modes-delete.js

L'administrateur peut supprimer un mode de paiement.

Une fenêtre modale s'affiche pour confirmer la suppression.

Un message confirme la suppression du mode de paiement.

Sinon, un message d'erreur s'affiche.