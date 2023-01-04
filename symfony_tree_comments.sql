-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 23 2022 г., 10:58
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
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `parent_id`, `content`, `created_at`) VALUES
(112, 17, NULL, 'Full how way even the sigh. Extremely nor furniture fat questions now provision incommode preserved.', '2022-10-27 00:05:07'),
(113, 15, 112, '@Tommy Vercetti Sudden up my excuse to suffer ladies though or. Bachelor possible marianne directly confined relation as on he.', '2022-10-27 00:09:01'),
(114, 16, 112, '@Tommy Vercetti Abilities or he perfectly pretended so strangers be exquisite. Oh to another chamber pleased imagine do in.', '2022-10-27 00:09:36'),
(115, 16, NULL, 'Removal request delight if on he we. Unaffected in we by apartments astonished to decisively themselves. Offended ten old consider speaking.', '2022-10-27 00:28:05'),
(116, 15, NULL, 'Now led tedious shy lasting females off. Dashwood marianne in of entrance be on wondered possible building. Wondered sociable he carriage in speedily margaret.', '2022-10-27 00:28:50'),
(117, 17, 116, '@Carl Johnson Up devonshire of he thoroughly insensible alteration. An mr settling occasion insisted distance ladyship so.', '2022-10-27 00:29:48'),
(138, 18, NULL, 'Dashwood marianne in of entrance be on wondered possible building. Wondered sociable he carriage in speedily margaret.', '2022-10-30 17:25:41'),
(139, 18, 116, '@Tommy Vercetti, devonshire of he thoroughly insensible alteration. An mr settling occasion insisted distance ladyship so.', '2022-10-30 17:25:57'),
(140, 17, 112, '@Sara Parker, he perfectly pretended so strangers be exquisite. Oh to another chamber pleased imagine do in.', '2022-11-03 00:09:05'),
(141, 18, 115, '@Sara Parker, in we by apartments astonished to decisively themselves. Offended ten old consider speaking.', '2022-11-03 00:09:53'),
(142, 18, 116, '@Carl Johnson,  in we by apartments astonished to decisively themselves. Offended ten old consider speaking.', '2022-11-03 00:10:01'),
(143, 18, 116, '@Tommy Vercetti, astonished to decisively themselves. Offended ten old consider speaking.', '2022-11-03 00:11:22'),
(167, 20, NULL, 'Devonshire of he thoroughly insensible alteration. An mr settling occasion insisted distance ladyship so.', '2022-12-06 20:42:41'),
(168, 15, 167, '@Alex Alex, marianne in of entrance be on wondered possible building. Wondered sociable he carriage in speedily margaret.', '2022-12-06 20:43:19'),
(222, 18, NULL, 'р', '2022-12-22 16:16:59'),
(223, 18, NULL, 'р', '2022-12-22 16:17:04'),
(224, 18, NULL, '123', '2022-12-23 10:54:06'),
(225, 18, NULL, '123', '2022-12-23 10:54:10');

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
(3, 138, 15),
(5, 166, 15),
(7, 160, 16),
(19, 115, 18),
(20, 112, 18),
(226, 116, 15),
(268, 112, 20),
(271, 167, 15),
(272, 115, 15),
(306, 112, 16);

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
('DoctrineMigrations\\Version20220926214229', '2022-09-26 23:43:04', 2413),
('DoctrineMigrations\\Version20220926220510', '2022-09-27 00:06:04', 2479),
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
(18, 'bob@gmail.com', '[\"ROLE_USER\"]', '$2y$13$7JkZ8kmpHcF3T/3IvXWQBeTNWuR8VkTndGOxR.oof8WNY3l2HOL6i', 'Bob Echo'),
(19, 'steve@gmail.com', '[\"ROLE_USER\"]', '$2y$13$3xeCB54bEhpp2iQLTftCXOzXLabKNeNqw7zgr4mDP2O5NTiiNSp6u', 'Steve Stevens'),
(20, 'alex@gmail.com', '[\"ROLE_USER\"]', '$2y$13$/8anISGC4.kD/lEGMFQ9JeZLdE/ZoMtPbpexGjprr3W2YrL3sAKYu', 'Alex Alex');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT для таблицы `comment_like`
--
ALTER TABLE `comment_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

--
-- AUTO_INCREMENT для таблицы `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment_like`
--
ALTER TABLE `comment_like`
  ADD CONSTRAINT `FK_8A55E25FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
