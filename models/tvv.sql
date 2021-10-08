-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 08 2021 г., 17:47
-- Версия сервера: 5.7.29
-- Версия PHP: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tvv`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ctor`
--

CREATE TABLE `ctor` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `author_id` int(11) NOT NULL,
  `thumb_id` int(11) DEFAULT NULL,
  `tag` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `costs` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `ctor_item`
--

CREATE TABLE `ctor_item` (
  `id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id`, `name`, `project_id`) VALUES
(11, '5nSPH2ovl1NoD93l7kmN.jpg', 0),
(12, 'KE083MHihwe_pARg9oN4.jpg', 0),
(13, 'JDsL3QV_TKRQCXmOZqGa.jpg', 0),
(14, '1mrYNaRu4Z57vUeTfmTU.jpg', 0),
(15, 'XEzB9GHLnpKiAWXOBcHr.jpg', 0),
(16, 'rYZYXUKpfAUgD9OdNKnm.jpg', 0),
(17, 'tie9n-BYcIEZMc_FPpiy.jpg', 0),
(18, 'lhjhjPtujoSEhMR5a65C.jpg', 0),
(19, 'h1Wp_yIZcMScT1M1jv0l.jpg', 0),
(20, 'eIe-McxHMb9PJGEt6H_3.jpg', 0),
(21, '9Vq-OYZIdTnNsA0d-5-B.jpg', 0),
(22, 'FIrrdD87W1yjsn2WSVmg.jpg', 0),
(23, '0dQKgC0EJiSEpdg_uO-b.jpg', 0),
(24, '5HuyC1Mobx5KF-slW9g5.jpg', 0),
(25, 'Ooq_KMHA7Lw6Q_RA384p.jpg', 0),
(26, 'mIR2Z8S-VfbbTIG6aWFl.jpg', 0),
(27, 'nvdPFVvuSmcQv9L_eKBX.jpg', 0),
(28, 'FjVVEyvv6YO2a2RzQyFK.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `place`
--

CREATE TABLE `place` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `region` enum('Псковская область','Орловская область','Калужская область','Тульская область','Москва и Московская область','Рязанская область','Ярославская область','Владимирская область','Ивановская область','Нижегородская область','Республика Чувашия','Республика Марий Эл','Кировская область') COLLATE utf8mb4_unicode_ci NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `place`
--

INSERT INTO `place` (`id`, `name`, `thumb_id`, `is_active`, `region`, `x`, `y`) VALUES
(1, 'Балахониха', NULL, 1, 'Нижегородская область', 0, 0),
(2, 'Кстово', NULL, 1, 'Нижегородская область', NULL, NULL),
(3, 'Тумботино', NULL, 1, 'Нижегородская область', NULL, NULL),
(4, 'Валки', NULL, 1, 'Нижегородская область', NULL, NULL),
(5, 'Воротынец', NULL, 1, 'Нижегородская область', NULL, NULL),
(6, 'Ермишь', NULL, 1, 'Рязанская область', NULL, NULL),
(7, 'Мосолово', NULL, 1, 'Рязанская область', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costs` int(11) NOT NULL DEFAULT '0',
  `people` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Школа','Дом культуры','Детский сад','Больница','Коммуникации') COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_id` int(11) DEFAULT NULL,
  `place_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `project`
--

INSERT INTO `project` (`id`, `name`, `period`, `costs`, `people`, `type`, `thumb_id`, `place_id`, `is_active`) VALUES
(1000001, 'Реконструкция МБОУ основная общеобразовательная школа п. Балахониха ', 'Март - Август 2014 года', 30, '42 учащихся', 'Школа', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `birth` date NOT NULL,
  `password_hash` text COLLATE utf8mb4_unicode_ci,
  `auth_token` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `login`, `role`, `birth`, `password_hash`, `auth_token`, `activated`) VALUES
(22, 'admin', 'adm', 'admin', 'admin', '1968-10-21', '$2y$13$Ed66Z3OmuiZUcPq6P5qhW.FRuHeVbXhORcGXP1u9uC/eh2z30I9Fy', '6OOL5Mo8pBFt8FESdc-T85bkNs8vgylfRFwtqfpu6jBgbYc526z6W8UXwKf9eIHuXBvGg8KbZZfV8u1EBmA4D7YPHZLKMshB38qd8P6IKtofpGAqiU-cYfZCeVPbTGqQ', 1),
(23, 'qwe', 'qwe', 'qwe', 'user', '2020-12-01', '$2y$13$AiSKqqZeO47XZAaKXQw3P.E60.zndwohEqKow.RNSHa8xunB6YIza', NULL, 1),
(24, 'qwe', 'qwe', 'qwe1', 'user', '2020-12-01', '$2y$13$UbJ.4pi.M.Pm5iRSZtcM1uPWm3wM3NqLpwzd/tPGRB58c7ByMtEpW', NULL, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ctor`
--
ALTER TABLE `ctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `thumb` (`thumb_id`);

--
-- Индексы таблицы `ctor_item`
--
ALTER TABLE `ctor_item`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `place_id` (`place_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_login_unique` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ctor`
--
ALTER TABLE `ctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ctor_item`
--
ALTER TABLE `ctor_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `place`
--
ALTER TABLE `place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000002;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ctor`
--
ALTER TABLE `ctor`
  ADD CONSTRAINT `ctor_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
