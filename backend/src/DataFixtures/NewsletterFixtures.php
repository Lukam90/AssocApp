<?php

namespace App\DataFixtures;

use App\Entity\Newsletter;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class NewsletterFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // object, target, content, is_send, send_at
        $newsletters = [
            new Newsletter("Annonce du prochain salon", "Général", "Lorem ipsum...", 1, "15/03/2023"),
            new Newsletter("Prochaine assemblée générale", "Membres", "Lorem ipsum...", 0, "16/06/2023"),
            new Newsletter("Repas de Noël du comité", "Membres", "Lorem ipsum...", 1, "25/11/2023"),
        ];

        foreach ($newsletters as $newsletter)
        {
            $manager->persist($newsletter);
            $manager->flush();
        }
    }
}
