<?php

namespace App\DataFixtures;

use App\Entity\User;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class UserFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // email, role, first_name, last_name, label
        $users = [
            new User("contact@admin.fr", "Administrateur", "Lucien", "HAMM", "AACCP"),
            new User("reservations@admin.fr", "Trésorier", "Jean", "DUPONT"),
            new User("l.roman@test.com", "Exposant", "Louis", "ROMAN", "Louis La Brocante"),
            new User("g.delajungle@test.com", "Exposant", "Georges", "DELAJUNGLE"),
            new User("b.duval@test.com", "Exposant", "Bernadette", "DUVAL", "Association Cartophile de Haguenau"),
            new User("f.molas@jdg.fr", "Exposant", "Frédéric", "MOLAS", "Joueur du Grenier"),
            new User("d.goodenough@jdg.fr", "Exposant", "David", "GOODENOUGH"),
            new User("p.richard@test.com", "Exposant", "Pierre", "RICHARD", "La Boutique de Pierrot"),
            new User("g.bonnet@test.com", "Exposant", "Gilbert", "BONNET", "Gilbert Philatélie"),
            new User("j.bond@test.com", "Exposant", "James", "BOND", "Tableaux 007"),
            new User("m.simon@test.com", "Exposant", "Marc", "SIMON", "Cartes Postales Magazine"),
        ];

        foreach ($users as $user)
        {
            $manager->persist($user);
            $manager->flush();
        }
    }
}
