<?php

namespace App\Entity;

use App\Repository\TableRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TableRepository::class)]
#[ORM\Table(name: '`table`')]
class Table
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 5, scale: 2)]
    private ?string $price = null;

    #[ORM\Column]
    private ?int $pos_x = null;

    #[ORM\Column]
    private ?int $pos_y = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $comments = null;

    public $reservation_id; // ?

    // reservation_id, price, pos_x, pos_y, comments
    public function __construct($reservation_id, $price, $pos_x, $pos_y, $comments = "")
    {
        $this->reservation_id = $reservation_id;
        $this->price = $price;
        $this->pos_x = $pos_x;
        $this->pos_y = $pos_y;
        $this->comments = $comments;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPrice(): ?string
    {
        return $this->price;
    }

    public function setPrice(string $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getPosX(): ?int
    {
        return $this->pos_x;
    }

    public function setPosX(int $pos_x): self
    {
        $this->pos_x = $pos_x;

        return $this;
    }

    public function getPosY(): ?int
    {
        return $this->pos_y;
    }

    public function setPosY(int $pos_y): self
    {
        $this->pos_y = $pos_y;

        return $this;
    }

    public function getComments(): ?string
    {
        return $this->comments;
    }

    public function setComments(?string $comments): self
    {
        $this->comments = $comments;

        return $this;
    }
}
