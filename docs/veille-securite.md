# Description de la veille effectuée sur la sécurité

## Les accès par rôles

Certaines pages ou actions sont réservés à des rôles précis.

Une fois les rôles définis, il est nécessaire de les assigner.

```php
#[ApiResource(security: "is_granted('Administrateur')")]
```

Le rôle "Exposant" correspond au rôle minimal d'un utilisateur connecté.

```php
#[Put(security: "is_granted('Exposant')")]
```

On peut aussi définir l'accès pour un même utilisateur, comme lors de l'édition du profil :

```php
#[Put(security: "is_granted('Exposant') and user.id == id")]
```

### La validation de données

Il est nécessaire de valider les données d'un formulaire côté client afin d'éviter certaines erreurs ou la possibilité d'insérer du code malveillant (failles XSS et CSRF.)

La faille XSS (Cross Site Scripting) permet d'insérer du code arbitraire dans le but de :

- rediriger vers un autre site (concurrent ou phishing)
- voler une session
- modifier une page visitée

On peut donc définir des règles de validation spécifiques à chaque champ côté client et échapper certains caractères spéciaux.

Cependant, la validation x.

La faille CSRF (Cross Site Request Forgery) consiste à 

























































































Description de la veille, effectuée par le candidat durant le projet, sur les vulnérabilités de sécurité


La description de la veille sur les vulnérabilités de sécurité est liée à l’une des compétences « Développer la partie front-end d’une interface utilisateur web », « Développer la partie back-end d’une interface utilisateur web », « Développer des composants d’accès aux données », « Développer des composants dans le langage d’une base de données », « Développer des composants métier » ou « Développer une application mobile ». Cette veille est effectuée dans le cadre du projet en entreprise 

Dans le cas de la veille sur les vulnérabilités, le candidat indique comment il a effectué la veille : les sites et les mots clés utilisés. Il indique les vulnérabilités trouvées et éventuellement les failles potentielles corrigées. 