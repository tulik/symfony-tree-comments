<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Form\ChildCommentType;
use App\Form\CommentType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class CommentController extends AbstractController
{
    /**
     * @Route("/comments", name="app_comments")
     */
    public function indexAction(Request $request, ManagerRegistry $doctrine): Response
    {

        $allComments = $this->getComments($doctrine);

        $sortedComments = $this->sortComments($allComments);

        return $this->addComment($request, $doctrine, $sortedComments);

    }

    public function getComments(ManagerRegistry $doctrine): array
    {
        return $allComments = $doctrine->getRepository(\App\Entity\Comment::class)->findAll();
    }

    public function addComment(Request $request, ManagerRegistry $doctrine, array $sortedComments): Response
    {

        $comment = new Comment();

        $form = $this->createForm(CommentType::class, $comment);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid() || $_SERVER['REQUEST_METHOD'] == 'POST') {

            $user = $this->getUser();
            $comment->setUser($user);
            $comment->setCreatedAt(new \DateTime());
            $comment->setParentId($_POST['parent_id'] ?? null);
            $comment = $form->getData();

            $entityManager = $doctrine->getManager();
            $entityManager->persist($comment);
            $entityManager->flush();

            return $this->redirectToRoute('app_comments');
        }

        return $this->renderForm('comments/index.html.twig', [
            'form' => $form,
            'sortedComments' => $sortedComments
        ]);

    }

    public function sortComments(array $commentaries, ?int $parentId = null): array
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