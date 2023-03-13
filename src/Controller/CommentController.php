<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Form\ChildCommentType;
use App\Form\CommentType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\User\UserInterface;


class CommentController extends AbstractController
{

    private EntityManagerInterface $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;

    }

    /**
     * @Route("/comments", name="app_comments")
     */
    public function indexAction(Request $request): Response
    {

        $user = $this->getUser();

        $comment = new Comment();

        $commentForm = $this->createForm(CommentType::class, $comment);

        $commentForm->handleRequest($request);

        $childForm = $this->createForm(ChildCommentType::class, $comment);

        $childForm->handleRequest($request);

        if ($commentForm->isSubmitted() && $commentForm->isValid() || $childForm->isSubmitted() && $childForm->isValid()) {

            $this->addComment($comment, $user, $request->request->get('parent_id') ?? null);

            $this->addFlash('success', 'Commentary added');

            return $this->redirectToRoute('app_comments');
        }

        $allComments = $this->entityManager->getRepository(Comment::class)->findAll();

        $sortedComments = $this->sortComments($allComments);

        return $this->renderForm('comments/index.html.twig', [
            'form' => $commentForm,
            'childForm' => $childForm,
            'sortedComments' => $sortedComments,
        ]);

    }

    public function addComment(Comment $comment, ?UserInterface $user, ?int $parentId = null): void
    {

        $comment->setUser($user);
        $comment->setParentId($parentId);

        $this->entityManager->persist($comment);
        $this->entityManager->flush();

    }

    /**
     * @Route("/admin/comments/delete/{id}", name="delete_comment")
     */
    public function deleteComment(int $id): Response
    {

        $comment = $this->entityManager->getRepository(Comment::class)->find($id);

        $comment->setIsDeleted(1);

       $this->entityManager->flush();

        $this->addFlash('success', 'Deleted successfully');

        return $this->redirectToRoute('app_comments');

    }

    private function sortComments(array $commentaries, ?int $parentId = null): array
    {

        $arr = [];

        foreach ($commentaries as $commentary) {
            if ($commentary->getParentId() == $parentId) {
                $children = $this->sortComments($commentaries, $commentary->getId());
                if ($children) {
                    $commentary->setChildren($children);
                }
                $arr[] = $commentary;
            }
        }

        return $arr;

    }

}

