-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 13 2023 г., 17:14
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `symfony_tree_comments`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `parent_id`, `content`, `created_at`, `is_deleted`) VALUES
(432, 18, NULL, 'Full how way even the sigh. Extremely nor furniture fat questions now provision incommode preserved.', '2023-03-10 00:12:59', 0),
(433, 16, 432, '@Bob Echo, Sudden up my excuse to suffer ladies though or. Bachelor possible marianne directly confined relation as on he.', '2023-03-10 00:13:29', 0),
(434, 20, 432, '@Sara Parker, Abilities or he perfectly pretended so strangers be exquisite. Oh to another chamber pleased imagine do in', '2023-03-10 00:13:56', 0),
(435, 17, NULL, 'He perfectly pretended so strangers be exquisite. Oh to another chamber pleased imagine do in.', '2023-03-10 00:14:21', 0),
(436, 15, 435, '@Tommy Vercetti, in we by apartments astonished to decisively themselves. Offended ten old consider speaking.', '2023-03-10 00:15:20', 1),
(437, 15, NULL, 'Devonshire of he thoroughly insensible alteration. An mr settling occasion insisted distance ladyship so. looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum sociable he carriage in speedily margaret.', '2023-03-10 00:15:49', 0),
(438, 18, NULL, 'Now led tedious shy lasting females off. Dashwood marianne in of entrance be on wondered possible building. Wondered sociable he carriage in speedily margaret.', '2023-03-10 00:16:44', 0),
(439, 20, 437, '@Carl Johnson, removal request delight if on he we. Unaffected in we by apartments astonished to decisively themselves. Offended ten old consider speaking.', '2023-03-10 00:17:13', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `comment_like`
--

CREATE TABLE `comment_like` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comment_like`
--

INSERT INTO `comment_like` (`id`, `comment_id`, `user_id`) VALUES
(714, 112, 21),
(716, 141, 21),
(740, 342, 20),
(741, 112, 17),
(810, 115, 18),
(857, 113, 23),
(862, 342, 23),
(863, 112, 23),
(864, 112, 14),
(865, 113, 14),
(866, 114, 14),
(895, 112, 16),
(900, 387, 24),
(901, 389, 24),
(902, 393, 24),
(908, 390, 15),
(1024, 390, 18),
(1029, 342, 15),
(1148, 113, 15),
(1158, 114, 18),
(1205, 113, 18),
(1216, 112, 15),
(1219, 115, 15),
(1223, 112, 18),
(1227, 432, 16),
(1228, 433, 16),
(1229, 432, 20),
(1230, 433, 20),
(1231, 432, 17),
(1232, 434, 17),
(1233, 433, 15),
(1234, 432, 15),
(1235, 435, 15),
(1239, 435, 18),
(1241, 433, 18),
(1242, 432, 18),
(1246, 434, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220912235025', '2022-09-13 01:51:01', 225),
('DoctrineMigrations\\Version20220925201632', '2022-09-25 22:19:24', 1455),
('DoctrineMigrations\\Version20221127151420', '2022-11-27 16:25:31', 2355);

-- --------------------------------------------------------

--
-- Структура таблицы `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`) VALUES
(1, 'test@test.test', '[\"ROLE_USER\"]', '$2y$13$tjGS6HTNXdHL48.UrGcpH.APAdli9QsUFwy.BGu9lXg2k3Y7NVyHS', 'test@test.test'),
(2, 'art@art.by', '[\"ROLE_USER\"]', '$2y$13$WjOeyvKJIFsFx2Pia.PI7.tv5GyKByc7VXuig07OvXHWkWa0YAixG', 'art@art.by'),
(3, '123@gmail.com', '[\"ROLE_USER\"]', '$2y$13$OnU0zNSTpPJC9ifUhGcij.7GVv0f0Bqf1mrZT6w3Gf6Xl8RBBwJTu', '123@gmail.com'),
(4, 'user@user.com', '[\"ROLE_USER\"]', '$2y$13$6cvwNcireTg.cQUPLM9fEuT0EzMz/OjxtD31cYOje1FJQYJY71m/a', 'user@user.com'),
(7, 'aaa@aaa.aaa', '[\"ROLE_USER\"]', '$2y$13$RVdn29OWkowFVpiXstRKye.tijYLDh45C2WHGoXPBhb8Gr99zi0j2', 'aaa@aaa.aaa'),
(8, 'artur@artur.by', '[\"ROLE_USER\"]', '$2y$13$dgHBWYXCNsMiXQwnYLDNHeMzRk8RQFnVCouXSUwQBbe0hVvZ0azkC', 'artur'),
(9, 't@t.com', '[\"ROLE_USER\"]', '$2y$13$XpAH84Ntd1wWwrgRK6vTj.31ZBvMZVw5tXd3HNoBHPGvyOo0xjdXG', 't@t.com'),
(10, 'aaa@aaaaa.by', '[\"ROLE_USER\"]', '$2y$13$GNwnLLs4ahTeBQyWE2BYCu/ucHOEQSg7cKDR/l978fg7/azztjaOm', '@#!@#!@#!@#'),
(12, 'user1@gmail.com', '[\"ROLE_USER\"]', '$2y$13$M2Rsdo/NdqkM.oio8frmNuoQuhpiNdfHh..YF1zje8nd4hWiJ8.42', 'user1'),
(13, 'user1337@gmail.com', '[\"ROLE_USER\"]', '$2y$13$.s2p0rcWCidadpZNjWT8au5nblQnkIzlzradDKBaXj4FKIsd6gfZO', 'user1337'),
(14, 'John@gmail.com', '[\"ROLE_USER\"]', '$2y$13$bcDMzhpjAxzoCMKqopEPAOsj964ABP2JlWf9uu9yQmGM5bMG/8Lsu', 'John Doe'),
(15, 'cj@gmail.com', '[\"ROLE_USER\"]', '$2y$13$eapi.2WkAgRa4gGslGJwTui1zQa17GCnB0sH2u0NAXMOcqiuICeoS', 'Carl Johnson'),
(16, 'sara@gmail.com', '[\"ROLE_USER\"]', '$2y$13$OyG4KvBpduKfYw0TH6U5/eUYARWDtl7UeQKnMxOX9x21EOam02DE6', 'Sara Parker'),
(17, 'tommy@gmail.com', '[\"ROLE_USER\"]', '$2y$13$IF6dm6V9pYhpRV7j9dUDiOuATxgtmci9g5ExLgiAN1XSnpme9FC8m', 'Tommy Vercetti'),
(18, 'bob@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$7JkZ8kmpHcF3T/3IvXWQBeTNWuR8VkTndGOxR.oof8WNY3l2HOL6i', 'Bob Echo'),
(19, 'steve@gmail.com', '[\"ROLE_USER\"]', '$2y$13$3xeCB54bEhpp2iQLTftCXOzXLabKNeNqw7zgr4mDP2O5NTiiNSp6u', 'Steve Stevens'),
(20, 'alex@gmail.com', '[\"ROLE_USER\"]', '$2y$13$/8anISGC4.kD/lEGMFQ9JeZLdE/ZoMtPbpexGjprr3W2YrL3sAKYu', 'Alex Alex'),
(21, 'dog@gmail.com', '[\"ROLE_USER\"]', '$2y$13$m.lxoMCN3PE3PL18S8.5LOBV7rKqKaaAUOYTgMfmLOoyAAvN6cHDG', 'Dodge'),
(23, 'will@gmail.com', '[\"ROLE_USER\"]', '$2y$13$bPjVVYZQ6U9KvMUpv9cDy.RaXsT9izMcc8LHbhh5rC/mZVrdbA/Jy', 'Will Smith'),
(24, 'rock@gmail.com', '[\"ROLE_USER\"]', '$2y$13$nIpQfy9Z3/4KkNweKWhPc.TCzotGHKBhhlnybJlI92x3MHiBpQeuG', 'Rock Rocky');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`);

--
-- Индексы таблицы `comment_like`
--
ALTER TABLE `comment_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8A55E25FF8697D13` (`comment_id`),
  ADD KEY `IDX_8A55E25FA76ED395` (`user_id`);

--
-- Индексы таблицы `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=450;

--
-- AUTO_INCREMENT для таблицы `comment_like`
--
ALTER TABLE `comment_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1247;

--
-- AUTO_INCREMENT для таблицы `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `comment_like`
--
ALTER TABLE `comment_like`
  ADD CONSTRAINT `FK_8A55E25FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
