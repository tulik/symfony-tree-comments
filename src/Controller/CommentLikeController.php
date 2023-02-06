<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\CommentLike;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CommentLikeController extends AbstractController
{
    /**
     * @Route("/comments/like-unlike", name="app_comment_like_unlike")
     */
    public function like(Request $request, EntityManagerInterface $entityManager): Response
    {

        if ($request->getMethod() === 'POST'){

            //retrieve commentId from AJAX request
            $commentId = $request->request->get('entityId');

            //check if comment exists
            $comment = $entityManager->getRepository(Comment::class)->findOneBy(['id'=> $commentId]);

            // return void if not
            if (!$comment){
                return new JsonResponse();
            }

            // retrieve csrf Token from AJAX request
            $submittedToken = $request->request->get('csrfToken');

            // check if it's valid
            if ($this->isCsrfTokenValid('comment' . $comment->getId(), $submittedToken)){

                $user = $this->getUser();

                $commentAlreadyLiked = $entityManager->getRepository(CommentLike::class)
                    ->findOneBy(['user' => $user, 'comment' => $comment]);

                // if user unlikes the comment, remove it from DB
                if($commentAlreadyLiked){
                    $entityManager->remove($commentAlreadyLiked);
                    $entityManager->flush();
                    return $this->json(['countLikes' => $comment->getCommentLikes()->count()]);
                    // if user likes the comment, add record to DB
                } else{
                    $like = new CommentLike();
                    $like->setUser($user);
                    $like->setComment($comment);
                    $entityManager->persist($like);
                    $entityManager->flush();
                }

            }

        }
        return $this->json(['countLikes' => $like->getComment()->getCommentLikes()->count()]);
    }
}
