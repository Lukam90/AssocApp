<?php

namespace App\DataFixtures;

use App\Entity\Table;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class TableFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // reservation_id, price, pos_x, pos_y, comment
        $tables = [
            new Table(1, 30, 0, 0),
            new Table(1, 30, 0, 1),
            new Table(1, 30, 1, 0),
            new Table(1, 30, 1, 1, "près de la buvette"),
            new Table(2, 30, 1, 2, "près de la portie de sortie"),
            new Table(2, 30, 2, 1),
            new Table(2, 0, 2, 2, "table offerte (membre)"),
        ];

        foreach ($tables as $table)
        {
            $manager->persist($table);
            $manager->flush();
        }
    }
}
