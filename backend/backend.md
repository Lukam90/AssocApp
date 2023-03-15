# backend

## Creation

symfony new backend

## Packages

composer require api<br>
composer require orm

composer require symfony/maker-bundle --dev<br>
composer require orm-fixtures --dev<br>
composer require fakerphp/faker --dev<br>
composer require zenstruck/foundry --dev

## Serve

symfony serve

## DB Creation & Schema

symfony console doctrine:database:create

symfony console doctrine:schema:create

## Migrations

symfony console make:migration

symfony console doctrine:migrations:migrate

## Entity

symfony console make:user

symfony console make:entity User<br>
symfony console make:entity Newsletter<br>
symfony console make:entity Mode<br>
symfony console make:entity Event<br>
symfony console make:entity Reservation<br>
symfony console make:entity Table

## Factories

symfony console make:factory

## Fixtures

symfony console doctrine:fixtures:load