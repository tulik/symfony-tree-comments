<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Form\CommentType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class CommentController extends AbstractController
{
    /**
     * @Route("/comments", name="app_comments")
     */
    public function index(Request $request)
    {

        $comment = new Comment();

        $comment->setParentId(1);
        $comment->setContent('My Comment');

        $form = $this->createForm(CommentType::class, $comment);

        return $this->renderForm('comments/index.html.twig', [
            'form' => $form,
        ]);

//        return $this->render('comments/index.html.twig');
    }



}