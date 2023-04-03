<?php

namespace App\DataFixtures;

use App\Entity\Mode;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class ModeFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // label
        $modes = [
            new Mode("Espèces"), 
            new Mode("Chèque"), 
            new Mode("Carte Bancaire")
        ];

        foreach ($modes as $mode)
        {
            $manager->persist($mode);
            $manager->flush();
        }
    }
}
