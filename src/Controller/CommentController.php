<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\CommentLike;
use App\Form\ChildCommentType;
use App\Form\CommentType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class CommentController extends AbstractController
{

    /**
     * @Route("/comments", name="app_comments")
     */
    public function indexAction(Request $request, EntityManagerInterface $entityManager): Response
    {

        $allComments = $this->getComments($entityManager);

        $sortedComments = $this->sortComments($allComments);

        $user = $this->getUser();

        $comment = new Comment();

        $commentForm = $this->commentForm($request, $comment);

        $this->addComment($commentForm, $comment, $user, $entityManager, $_POST['parent_id'] ?? null);

        $isCommentAlreadyLiked =
            $entityManager->getRepository(CommentLike::class)->countByCommentAndUser($comment, $user);

        return $this->renderForm('comments/index.html.twig', [
            'form' => $commentForm,
            'sortedComments' => $sortedComments,
            'isCommentAlreadyLiked' => $isCommentAlreadyLiked
        ]);

    }

    private function getComments(EntityManagerInterface $entityManager): array
    {
        return $allComments = $entityManager->getRepository(Comment::class)->findAll();
    }

    public function addComment($form, $comment, $user, EntityManagerInterface $entityManager, ?int $parentId = null)
    {

        if ($form->isSubmitted() && $form->isValid()) {

            $comment->setUser($user);
            $comment->setCreatedAt(new \DateTime());
            $comment->setParentId($_POST['parent_id'] ?? null);
            $comment = $form->getData();

            $entityManager->persist($comment);
            $entityManager->flush();

            return $this->redirectToRoute('app_comments');

        }

        return null;

    }

    public function commentForm(Request $request, $comment): FormInterface
    {

        $form = $this->createForm(CommentType::class, $comment);

        if ($request->isMethod(Request::METHOD_POST)) {
            $form->handleRequest($request);
        }

        return $form;

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

//    public function addCommentArchived(Request $request, EntityManagerInterface $entityManager, array $sortedComments, ?int $parentId = null): Response
//    {
//
//        $comment = new Comment();
//
//        $form = $this->createForm(CommentType::class, $comment);
//        $form->handleRequest($request);
//
//        $user = $this->getUser();
//
//        if ($form->isSubmitted() && $form->isValid() || $request->getMethod() === 'POST') {
//
//            $comment->setUser($user);
//            $comment->setCreatedAt(new \DateTime());
//            $comment->setParentId($_POST['parent_id'] ?? null);
//            $comment = $form->getData();
//
//            $entityManager->persist($comment);
//            $entityManager->flush();
//
//            return $this->redirectToRoute('app_comments');
//        }
//
//        $isCommentAlreadyLiked =
//            $entityManager->getRepository(CommentLike::class)->countByCommentAndUser($comment, $user);
//
//        return $this->renderForm('comments/index.html.twig', [
//            'form' => $form,
//            'sortedComments' => $sortedComments,
//            'isCommentAlreadyLiked' => $isCommentAlreadyLiked,
//        ]);
//
//    }
//
//    /**
//     * @Route("/comments/{id}/like/{direction<up>}", methods="POST")
//     */
//    public function commentLikeArchived($id, $direction): Response
//    {
//        if ($direction === 'up') {
//            $currentLikesCount = rand(5, 10);
//        }
//
//        return $this->json(['likes' => $currentLikesCount]);
//
//    }
//
//
//    public function indexActionArchived(Request $request, EntityManagerInterface $entityManager): Response
//    {
//
//        $allComments = $this->getComments($entityManager);
//
//        $sortedComments = $this->sortComments($allComments);
//
//        return $this->addComment($request, $entityManager, $sortedComments, $_POST['parent_id'] ?? null);
//
//    }

}

