# Description de la veille effectuée sur la sécurité

## Les accès par rôles

- Mots-clés : **express user roles**
- Lien : https://www.youtube.com/watch?v=jI4K7L-LI58

Certaines pages ou actions sont réservés à des rôles précis.

Une fois les rôles définis, il est nécessaire de les assigner.

```js
function canEditUser(role) {
    return (role === "Administrateur");
}
```

On peut aussi définir l'accès pour un même utilisateur connecté, comme lors de l'édition du profil :

```js
function canEditUser(user, id) {
    return (user && user.id === id);
}
```

## La validation de données

- Mots-clés : **express validate data**
- Lien : https://stackabuse.com/form-data-validation-in-nodejs-with-express-validator/

Il est nécessaire de valider les données d'un formulaire afin d'éviter certaines erreurs ou la possibilité d'insérer du code malveillant (failles XSS, injection SQL)

On peut donc définir des règles de validation spécifiques à chaque champ grâce à des utilitaires comme **express-validator**.

## Les jetons CSRF

- Mots-clés : **express csrf**
- Lien : https://blog.rahulbhutani.com/how-to-implement-csrf-tokens-in-express-node-js/

La faille CSRF (Cross Site Request Forgery) permet de voler une session à partir d'un formulaire ou de cookies, comme lors de la connexion d'un utilisateur.

On peut ainsi définir un jeton CSRF automatiquement généré dans un formulaire avec des utilitaires comme **csurf**.

## Le hachage des mots de passe

- Mots-clés : **express password user**
- Lien : https://www.youtube.com/watch?v=Ud5xKCYQTjM

Dans le cas d'un système d'authentification classique, un nouvel utilisateur s'enregistre avec une adresse e-mail et un mot de passe.

















































































Description de la veille, effectuée par le candidat durant le projet, sur les vulnérabilités de sécurité


La description de la veille sur les vulnérabilités de sécurité est liée à l’une des compétences « Développer la partie front-end d’une interface utilisateur web », « Développer la partie back-end d’une interface utilisateur web », « Développer des composants d’accès aux données », « Développer des composants dans le langage d’une base de données », « Développer des composants métier » ou « Développer une application mobile ». Cette veille est effectuée dans le cadre du projet en entreprise 

Dans le cas de la veille sur les vulnérabilités, le candidat indique comment il a effectué la veille : les sites et les mots clés utilisés. Il indique les vulnérabilités trouvées et éventuellement les failles potentielles corrigées. 