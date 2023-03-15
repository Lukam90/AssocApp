<?php

namespace App\DataFixtures;

use App\Entity\Event;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class EventFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // ?
        $events = [
            new Event("Espèces"), 
            new Event("Chèque"), 
            new Event("Carte Bancaire")
        ];

        foreach ($events as $event)
        {
            $manager->persist($event);
            $manager->flush();
        }
    }
}
