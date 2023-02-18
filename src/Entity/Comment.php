<?php

namespace App\Entity;

use App\Repository\CommentRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use App\Entity\CommentLike;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Entity(repositoryClass=CommentRepository::class)
 */
class Comment
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private int $id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private ?int $parentId;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank
     */
    private string $content;

    /**
     * @ORM\Column(type="datetime")
     */
    private \DateTime $createdAt;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="comment")
     * @ORM\JoinColumn(nullable=false)
     */
    private User $user;

    private $children;// onetomany as well or delete if not needed

    /**
     * @ORM\OneToMany(targetEntity=CommentLike::class, mappedBy="comment")
     */
    private $commentLikes;

    /**
     * @ORM\Column(type="boolean", options={"default": 0})
     */
    private int $isDeleted;


    public function __construct()
    {
        $this->commentLikes = new ArrayCollection();
        $this->createdAt = new \DateTime();
        $this->isDeleted = 0;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getParentId():?int
    {
        return $this->parentId;
    }

    public function setParentId(?int $parentId): self
    {
        $this->parentId = $parentId;

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

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }

    public function setChildren(array $children): void
    {
        $this->children = $children;
    }

    public function getChildren(): ?array
    {
        return $this->children;
    }

    /**
     * @return Collection<int, CommentLike>
     */
    public function getCommentLikes(): Collection
    {
        return $this->commentLikes;
    }

    public function isDeleted(): ?bool
    {
        return $this->isDeleted;
    }

    public function setIsDeleted(bool $isDeleted): self
    {
        $this->isDeleted = $isDeleted;

        return $this;
    }


}
