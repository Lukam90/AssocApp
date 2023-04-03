<?php

namespace App\Entity;

use App\Repository\EventRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: EventRepository::class)]
class Event
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $planned_at = null;

    #[ORM\Column(length: 255)]
    private ?string $title = null;

    #[ORM\Column(type: Types::BLOB, nullable: true)]
    private $picture = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $content = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 6, scale: 2)]
    private ?string $min_price = null;

    #[ORM\Column]
    private ?int $num_available = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPlannedAt(): ?\DateTimeInterface
    {
        return $this->planned_at;
    }

    public function setPlannedAt(\DateTimeInterface $planned_at): self
    {
        $this->planned_at = $planned_at;

        return $this;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getPicture()
    {
        return $this->picture;
    }

    public function setPicture($picture): self
    {
        $this->picture = $picture;

        return $this;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(string $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getMinPrice(): ?string
    {
        return $this->min_price;
    }

    public function setMinPrice(string $min_price): self
    {
        $this->min_price = $min_price;

        return $this;
    }

    public function getNumAvailable(): ?int
    {
        return $this->num_available;
    }

    public function setNumAvailable(int $num_available): self
    {
        $this->num_available = $num_available;

        return $this;
    }
}
