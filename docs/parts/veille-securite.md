# Description de la veille effectuée sur la sécurité

## Les accès par rôles

- **Mots-clés** : express user roles
- **Lien** : https://www.youtube.com/watch?v=jI4K7L-LI58

Certaines pages ou actions sont réservées à des rôles précis.

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

- **Mots-clés** : express validate data
- **Lien** : https://stackabuse.com/form-data-validation-in-nodejs-with-express-validator/

Il est nécessaire de valider les données d'un formulaire afin d'éviter certaines erreurs ou la possibilité d'insérer du code malveillant (failles XSS, injection SQL).

On peut donc définir des règles de validation spécifiques à chaque champ grâce à des utilitaires comme **express-validator**.

## Les jetons CSRF

- **Mots-clés** : express csrf
- **Lien** : https://blog.rahulbhutani.com/how-to-implement-csrf-tokens-in-express-node-js/

La faille CSRF (Cross Site Request Forgery) permet de voler une session à partir d'un formulaire ou de cookies, comme lors de la connexion d'un utilisateur.

On peut ainsi définir un jeton CSRF automatiquement généré dans un formulaire avec des utilitaires comme **csurf**.

## Le hachage des mots de passe

- **Mots-clés** : express password user
- **Lien** : https://www.youtube.com/watch?v=Ud5xKCYQTjM

Dans le cas d'un système d'authentification classique, un nouvel utilisateur s'enregistre avec une adresse e-mail et un mot de passe.

Le mot de passe en clair doit être haché avant d'être stocké en base de données.

Un même mot de passe peut être réutilisé par un même utilisateur sur d'autres sites ou dans son entreprise.

Des utilitaires comme **bcrypt** permettent de hacher un mot de passe nouveau ou redéfini :

```js
const hashedPassword = await bcrypt.hash(req.body.password, 10)

const user = { email: req.body.email, password: hashedPassword }
```
