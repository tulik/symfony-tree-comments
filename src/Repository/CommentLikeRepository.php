<?php

namespace App\Repository;

use App\Entity\CommentLike;
use App\Entity\Comment;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<CommentLike>
 *
 * @method CommentLike|null find($id, $lockMode = null, $lockVersion = null)
 * @method CommentLike|null findOneBy(array $criteria, array $orderBy = null)
 * @method CommentLike[]    findAll()
 * @method CommentLike[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CommentLikeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, CommentLike::class);
    }

    public function add(CommentLike $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(CommentLike $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function countByCommentAndUser($comment, $user)
    {

        $qb = $this->createQueryBuilder('c')
            ->select('COUNT(c)')
            ->where('c.comment = :comment')
            ->andWhere('c.user = :user')
            ->setParameter('comment', $comment)
            ->setParameter('user', $user)
        ;

//        return $qb->getQuery()->getSingleScalarResult();

        return $qb->getQuery();
    }

//    public function getLikesCount($comment)
//    {
//        $qb = $this->createQueryBuilder('c')
//            ->select('COUNT(c.id)')
//            ->where('c.comment = :comment')
//            ->setParameter('comment', $comment)
//        ;
//
//        'SELECT COUNT(comment_id) FROM comment_like WHERE comment_id = 112'
//
//        return $qb->getQuery()->getResult();
//    }

//    public function likesCounter($comment)
//    {
//
//        $qb = $this->createQueryBuilder('cm')
//            ->select('COUNT(cm)')
//            ->andWhere('cm.comment = :comment')
//            ->setParameter('comment', $comment)
//        ;
//
//        return dd($qb->getQuery()->getResult());
//    }

//    /**
//     * @return CommentLike[] Returns an array of CommentLike objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('c.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?CommentLike
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
