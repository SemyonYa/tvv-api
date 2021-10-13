-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 13 2021 г., 21:12
-- Версия сервера: 8.0.24
-- Версия PHP: 7.4.21

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
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `author_id` int NOT NULL,
  `thumb_id` int DEFAULT NULL,
  `tag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `costs` int NOT NULL DEFAULT '0',
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `ctor_item`
--

CREATE TABLE `ctor_item` (
  `id` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int NOT NULL,
  `ordering` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ctor_item`
--

INSERT INTO `ctor_item` (`id`, `type`, `value`, `parent_id`, `ordering`) VALUES
(8, 'Text', 'Балахониха — посёлок в Арзамасском районе Нижегородской области. Располагается в 35 км к северу от Арзамаса.', 1, 0),
(9, 'Text', 'Основан в 1909 году при строительстве железнодорожной ветки Муром-Арзамас.', 1, 1),
(10, 'Text', 'В конце 1950-х – начале 1960-х гг. в 2 км от поселка построена нефтеперекачивающая станция нефтепровода Альметьевск – Котово – Рязань с рабочей силой в 120 человек.  Поселок при нефтеперекачивающей станции вошел в состав поселка Балахониха. ', 1, 2),
(11, 'Text', 'В настоящее время в поселке Балахониха проживают 820 человек. Из них около 180 человек детей и молодежи.', 1, 3),
(12, 'H2', 'Основные рабочие места: ', 1, 4),
(13, 'List', 'ж/д (50 чел.), \nстанция Арзамас-2 (30 чел.), \nНПС «Балахониха» (79 чел.), \nсоциальная сфера.', 1, 5),
(16, 'Text', 'посёлок городского типа Павловского муниципального района Нижегородской области, имеющего статус городского поселения.  ', 3, 0),
(17, 'Text', 'Численность населения — 6 855 чел.', 3, 1),
(18, 'Text', 'Одно из градообразующих предприятий района — нефтеперекачивающая станция (НПС) «Степаньково» Горьковского районного нефтепроводного управления АО «Транснефть-Верхняя Волга».', 3, 2),
(19, 'Text', 'административный центр Кстовского муниципального района Нижегородской области. Численность населения — 67 723 чел. ', 2, 0),
(20, 'Text', 'Численность населения — 67 723 чел. ', 2, 1),
(21, 'Text', 'Одно из градообразующих предприятий района — Горьковское районное нефтепроводное управление АО «Транснефть-Верхняя Волга».', 2, 2),
(22, 'Text', 'село в Лысковском районе Нижегородской области, административный центр Валковского сельсовета. Численность населения — 722 человека. Одно из градообразующих предприятий района — нефтеперекачивающая станция (НПС)  «Макарьево» Марийского районного нефтепроводного управления АО «Транснефть — Верхняя Волга».', 4, 0),
(24, 'Text', 'Село Редькино Нижегородской области находится в 52 км. от г. Нижнего Новгорода.', 8, 0),
(25, 'Text', 'Село входит в состав городского округа город Бор.', 8, 1),
(26, 'Text', 'Численность населения 1 423 человека.', 8, 2),
(27, 'Text', 'посёлок городского типа в Нижегородской области, административный центр Воротынского муниципального района. Образует городское поселение рабочий посёлок Воротынец. ', 5, 0),
(28, 'Text', 'Численность населения - 7177 чел.', 5, 1),
(29, 'Text', 'Одно из градообразующих предприятий поселка — линейно-производственно-диспетчерская станция (ЛПДС) \"Воротынец\" Марийского районного нефтепроводного управления АО «Транснефть-Верхняя Волга».', 5, 2),
(30, 'Text', 'Здание школы построено в 1980г.', 1000001, 0),
(31, 'Text', 'В настоящее время в учреждении обучается 42 чел., в том числе 30 детей работников НПС «Балахониха» Горьковского РНУ.', 1000001, 1),
(32, 'Text', 'Школа является базовой для удаленных сельских поселений, в том числе поселка Балахониха.', 1000001, 2),
(33, 'Text', 'Из 85 работников НПС «Балахониха» 70 человек обучались в данной школе.', 1000001, 3),
(34, 'Text', 'Здание дома культуры построено 1967 году. Учреждение обслуживает удаленные сельские поселения, всего около 2 200 чел.', 1000003, 0),
(35, 'Text', 'В доме культуры созданы театральные, вокальные, танцевальные, декоративно-прикладного творчества коллективы. Ежегодно проводится более 200 мероприятий различной направленности, большая часть для детей и молодежи. ', 1000003, 1),
(36, 'Text', 'В здании расположена сельская библиотека. Книжный фонд насчитывает 7700 экз.', 1000003, 2),
(37, 'Text', 'Здание детского сада построено в 1977 году.', 1000004, 0),
(38, 'Text', 'В настоящее время учреждение посещает 35 детей, в том числе 15 детей работников НПС «Балахониха» Горьковского РНУ.', 1000004, 1),
(39, 'H2', 'В детском саду 2 группы: ', 1000004, 2),
(40, 'List', 'младшая — 14 воспитанников (возраст 1,5 – 4 года),\nстаршая — 21 воспитанник (возраст 4-7 лет).', 1000004, 3),
(41, 'Text', 'Здание амбулатории построено в 1978 году. Закреплен участок из 6 населенных пунктов с населением более 950 человек, из них 517 человек трудоспособного возраста. ', 1000005, 0),
(42, 'Text', 'В амбулатории осуществляется прием взрослого и детского населения, оказываются стоматологические, гинекологические услуги. Дополнительно установлены электрокардиограф и стоматологическая установка.', 1000005, 1),
(43, 'Text', 'Здание построено в 1973 году.', 1000006, 0),
(44, 'H2', 'Осуществлено материально-технического оснащение кабинетов ', 1000006, 1),
(45, 'List', 'физики, \nматематики, \nхимии лабораторным и демонстрационным оборудованием.', 1000006, 2),
(46, 'H2', 'Проведен ремонт кабинетов ', 1000006, 3),
(47, 'List', 'физики, \nхимии, \nматематики.', 1000006, 4),
(48, 'Text', 'Здание построено в 1992 году.', 1000007, 0),
(49, 'H2', 'Осуществлено материально-технического оснащение  кабинетов ', 1000007, 1),
(50, 'List', 'физики, \nматематики, \nхимии лабораторным и демонстрационным оборудованием.', 1000007, 2),
(51, 'H2', 'Проведен ремонт кабинетов ', 1000007, 3),
(52, 'List', 'физики, \nхимии,\nматематики.', 1000007, 4),
(53, 'Text', 'Образовательный процесс организован в двух зданиях: ', 1000008, 0),
(54, 'List', 'основное здание  (год постройки - 1957г.); \n2 здание (мастерские) (год постройки – 1962г.).', 1000008, 1),
(55, 'Text', 'Оснащение учебных классов физики, математики, химии лабораторным и демонстрационным оборудованием МБОУ Гимназии №4 Кстовского муниципального района Нижегородской области.', 1000009, 0),
(56, 'Text', 'Здание школы построено 1977 году.', 1000010, 0),
(57, 'Text', 'В 2013 г. в школе был проведен капитальный ремонт, в результате которого школы приобрела современный вид, новое оборудование и оснащение - беговую дорожку, хоккейную, волейбольную площадку, спортивный городок. В школе имеются кабинет психолога, стоматологический кабинет, медицинский и процедурный кабинеты, столярная и слесарная мастерские, спортивный и актовый зал.', 1000010, 1),
(58, 'Text', 'Здание школы построено 1977 году.', 1000011, 0),
(59, 'Text', 'Осуществлено материально-технического оснащение кабинетов физики, математики, химии лабораторным и демонстрационным оборудованием. Проведен ремонт кабинетов физики, химии и математики.', 1000011, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int DEFAULT NULL,
  `period` enum('after','before') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id`, `name`, `project_id`, `period`) VALUES
(1, 'zTtRYgyo9O1sIg3VLdTZ.jpg', 1000003, 'before'),
(2, '9Kd7R05-K5gZAJJCz7fl.jpg', 1000003, 'before'),
(3, 'fxEALxcHHdoXdeZMaNg8.jpg', 1000003, 'before'),
(4, 'GR6gguEFgEOjQ3Ckwf62.jpg', 1000003, 'before'),
(5, 'ojeZA3CKjcQedMOHq1oF.jpg', 1000003, 'before'),
(6, '5a9um7e7dT_aFKbZTmSq.jpg', 1000003, 'before'),
(7, 'HV1nirDUeZGaQiGW6G9m.jpg', 1000003, 'before'),
(8, '-3FSrL5WUHN7D8zfsSBM.jpg', 1000003, 'before'),
(9, 'CArjcx8UfgyEBNN-RyAZ.jpg', 1000003, 'before'),
(10, 'vrmBUV6TcYHQqRqfOP42.jpg', 1000003, 'before'),
(11, 'kTKShP2VsLI5V29ax-LI.jpg', 1000003, 'before'),
(12, 'PgjdQV13xjbOc8IOKWC6.jpg', 1000003, 'before'),
(13, 'lWAV5Ru8EHv45xB3wfeV.jpg', 1000003, 'before'),
(14, '0Oyx_tnf8STXIIQALDyS.jpg', 1000003, 'before'),
(15, 'SyIOyJqgS_a3sLHU_X4B.jpg', 1000003, 'before'),
(16, 'MGWYH4S0GPkEacgj0qnU.jpg', 1000003, 'before'),
(17, '9YRP__ijXKYsCmDvQIcS.jpg', 1000003, 'before'),
(18, '6dSg2sNZNzSMYRs94eeM.jpg', 1000003, 'before'),
(19, 'JarhdEfPQ_SGblJbPIhG.jpg', 1000003, 'before'),
(20, 'IJ6Z9IEIsoZkm1Mu8_aH.jpg', 1000003, 'before'),
(21, 'eNiEAjpS5aeqLuZ55XoH.jpg', 1000003, 'after'),
(22, 'EgYoQQpeypm7ZPtxkVz0.jpg', 1000003, 'after'),
(23, '4rApQAbnES59u7RzTn93.jpg', 1000003, 'after'),
(24, 'ibHIVKulwhiJwAUxIC1d.jpg', 1000003, 'after'),
(25, 'VjNj5wXMF1Rxa6wx5o4G.jpg', 1000003, 'after'),
(26, 'Kp0urcLV3_mSzqVRFgSY.jpg', 1000003, 'after'),
(27, 'dIYMsvahSpGNkWvl72Uw.jpg', 1000003, 'after'),
(28, 'eDTJ5BsZAZJSpjm-hiEm.jpg', 1000003, 'after'),
(29, '6hIfvHyu0qgguzSizmE3.jpg', 1000003, 'after'),
(30, 'bzg6PkqV57wN1FoA7H5C.jpg', 1000003, 'after'),
(31, 'OViwXjSW4J0yfxhVkpHO.jpg', 1000003, 'after'),
(32, 'eZ4lq5El3np1CBqqRc7n.jpg', 1000003, 'after'),
(33, '50QYxpoGkNUztNKgJrKS.jpg', 1000003, 'after'),
(34, 'BLliRYv0gF_66ofRoKDJ.jpg', 1000001, 'before'),
(35, '9gT-aY7TYrbLikZGTQ0_.jpg', 1000001, 'before'),
(36, 'cNIrez67f3h4ch4i4MaP.jpg', 1000001, 'before'),
(37, '_kNa69rY_Zl0jEVQQ4VS.jpg', 1000001, 'before'),
(38, '3IucbtrF8Y53mUCYF_ij.jpg', 1000001, 'before'),
(39, 'tdVvPI2V_8uSPoU0pEn4.jpg', 1000001, 'before'),
(40, '63HglboujRBIo8iYSyAr.jpg', 1000001, 'before'),
(41, 'DrNZrhgpDbMG2BW3nh8v.jpg', 1000001, 'after'),
(42, 'OL57x8qiJQBEvcw3MvKC.jpg', 1000001, 'after'),
(43, 'm9lcs2V-TE62BZcuZCAg.jpg', 1000001, 'after'),
(44, 'CuWzs38fhDYgM_S2oUVc.jpg', 1000001, 'after'),
(45, 'sZ_iBRLTyKCnD7k4wqdQ.jpg', 1000001, 'after'),
(46, 'NKksf5Srm7f51BWGtPTs.jpg', 1000001, 'after'),
(47, 'WCBALQjqqLM4Ffb9ioJ-.jpg', 1000001, 'after'),
(48, 'ihg6veCVP6DPiAlvH5wM.jpg', 1000001, 'after'),
(49, 'Uxv3bY4jLSOn8AuKPFCV.jpg', 1000001, 'after'),
(50, 'fzWXNi0aFSp1LjEivxEl.jpg', 1000001, 'after'),
(51, 'YBZy6WxMV-IHX7E5qIFM.jpg', 1000001, 'after'),
(52, 'eSzOIB9tBWTeBQ4he4bX.jpg', 1000001, 'after'),
(53, '4IbhLklAkzZ-26wZXcTb.jpg', 1000001, 'after'),
(54, '0Cyt8PiktGNlmSB4Ps4I.jpg', 1000004, 'before'),
(55, 'zfLNmUprPWAUBWEUvxyK.jpg', 1000004, 'before'),
(56, 'vIWyHk9Nh4eS-PSekXqw.jpg', 1000004, 'before'),
(57, 'aoqT3AcAPUizmNmZG7Vf.jpg', 1000004, 'before'),
(58, 'yLDaczQ6XOBSbCYfp_Sd.jpg', 1000004, 'before'),
(59, 'YcrA8xO_L60K1Tp7hT60.jpg', 1000004, 'before'),
(60, 'z_zoIKL-USlS4hRZyDlU.jpg', 1000004, 'before'),
(61, 'Y5_y3Z5vKLiRbDCEv-Ad.jpg', 1000004, 'before'),
(62, 'uKEpFwlQB0zwt2ljeE3y.jpg', 1000004, 'after'),
(63, 'Hepl7MVqnPV_VeF96DVW.jpg', 1000004, 'after'),
(64, 'AeutIOtac-eYP-X8EFi3.jpg', 1000004, 'after'),
(65, '2ov4zXPMfBG6YNjRLXEA.jpg', 1000004, 'after'),
(66, 'JEZwp87NJtjauEl6t0j4.jpg', 1000004, 'after'),
(67, 'N8MJLem4Swi0mec80Y58.jpg', 1000004, 'after'),
(68, 'DunLjWOrjKxofTTl2r-u.jpg', 1000004, 'after'),
(69, 'LmoB3yg66zHwrMfG8SFq.jpg', 1000004, 'after'),
(70, 'CmgJcbxBBzCIOMmEtA1s.jpg', 1000004, 'after'),
(71, 'C25QzRkFuqsNaI_c18c3.jpg', 1000004, 'after'),
(72, 'MnfvqpZe_lYyMosONrfM.jpg', 1000004, 'after'),
(73, 'YWixO4xzvjoUBp9AFjfj.jpg', 1000005, 'after'),
(74, 'FqFoDI9CN6NlHVCWl_UU.jpg', 1000005, 'after'),
(75, 'igNI7GHEzb8y61KSPC0o.jpg', 1000005, 'after'),
(76, '_7LsFfFkCTdYmlH6JfPR.jpg', 1000005, 'after'),
(77, '88KdEaaU1LgW62yYKSzy.jpg', 1000005, 'after'),
(78, 'wJp1uiTWD_bggZM-memp.jpg', 1000005, 'after'),
(79, 'Q2EXoBWhJBtr7ctwQAMm.jpg', 1000005, 'after'),
(80, 'lsMxV7L_amhQdRjvB26m.jpg', 1000005, 'after'),
(81, '-M8_6zaBYSwzlPXlwP9Q.jpg', 1000005, 'after'),
(82, 'Fc6F1ZK0k4Z70RPYxeZy.jpg', 1000005, 'after'),
(83, 'JmLDP94hmG8sbxJdpKlZ.jpg', 1000005, 'after'),
(84, '5xWGxisHeUd_8uKP4QoK.jpg', 1000005, 'after'),
(85, 'tbhIeom2ZxBR9gURbjqw.jpg', 1000005, 'after'),
(86, 'WtzYFpCu-DszmS0Kalzk.jpg', 1000006, 'after'),
(87, 'h528htxPh80QNfcMjJ5H.jpg', 1000006, 'after'),
(88, 'JcDpvJ4_QrBwRAMrvNJ2.jpg', 1000006, 'after'),
(89, 'u97JgX1Fkq5D7KgpEmth.jpg', 1000006, 'after'),
(90, '1HcA9Wl7ux7ZWvdjI4Yu.jpg', 1000006, 'after'),
(91, 'fX5RGf4tMvtDPM11uuoc.jpg', 1000006, 'after'),
(92, '4HB3fstrkbH6lex1jOb_.jpg', 1000006, 'after'),
(93, 'TVMhgQrD-hedzGrmsN0-.jpg', 1000006, 'after'),
(94, 'ufCML06fXpqhX5Fytod5.jpg', 1000006, 'after'),
(95, '-9F-yhMxSyM2K6eF7EEI.jpg', 1000006, 'after'),
(96, 'm1Y_9jeHAO1EVvEVsJNd.jpg', 1000006, 'after'),
(97, 'a6CQCd5J2I2nyZMrJhLj.jpg', 1000006, 'after'),
(98, '3pxP8pZcQAK3sFLFPeFu.jpg', 1000006, 'after'),
(99, 'DC40gP1W61bzXO9xrHad.jpg', 1000006, 'after'),
(100, 'Q5p1ivefwHkuhiLY_hv2.jpg', 1000006, 'after'),
(101, 'w0RxUUtCCqeXS1gfYplA.jpg', 1000006, 'after'),
(102, 'EQYBGUXO6FexupQYj8Ke.jpg', 1000006, 'after'),
(103, '_mhC0kUKg4kvHhHGwd_s.jpg', 1000006, 'after'),
(104, 'HqOlrxRSHh9wmeLRHN0v.jpg', 1000006, 'after'),
(105, 'QvDQW8PDR1HOYxgP01Cj.jpg', 1000006, 'after'),
(106, '2KM7W95s3YT0mQYfZ6XE.jpg', 1000007, 'after'),
(107, 'qpB_deTGd_56ZR-pKsLf.jpg', 1000007, 'after'),
(108, 'ImFGbHOSopbER3rZpCY8.jpg', 1000007, 'after'),
(109, 'Qci9oZL34ZS4cmcKa05o.jpg', 1000007, 'after'),
(110, 'PA9BRWZ932gihFa1kb6s.jpg', 1000007, 'after'),
(111, 'AJXksfICTTUn8CMKTyu3.jpg', 1000007, 'after'),
(112, '76HpEtnry3ZTdgdOtv4N.jpg', 1000007, 'after'),
(113, 'T2-int0l40sq88YkzSs3.jpg', 1000007, 'after'),
(114, 'JjtJdLoH2PDMJq4vzSfN.jpg', 1000007, 'after'),
(115, 'OOQZGP35bc9YNZU7Or8F.jpg', 1000007, 'after'),
(116, 'knc2LIvqpf4_ArwZWi3x.jpg', 1000007, 'after'),
(117, 'g9HOd0HXoZk6ThIX4MxJ.jpg', 1000007, 'after'),
(118, 'FotrdXa3WVzdG0KWLLPy.jpg', 1000007, 'after'),
(119, 'xzaM5NTiBQ-1A2gsUKD0.jpg', 1000007, 'after'),
(120, 'sAJWfb8G0h9bFeWF5t6J.jpg', 1000007, 'after'),
(121, 'v-2E7UCmTUmDwcWXar7c.jpg', 1000007, 'after'),
(122, 'lKaDko8U3ZNs-0ct7kBV.jpg', 1000007, 'after'),
(123, 'HwUsfQO9oB5F5fCwlJTp.jpg', 1000007, 'after'),
(124, 'ZGaalOu-Dt2bJLslKXi7.jpg', 1000008, 'before'),
(125, 'Y96_mOlHvBNRygUJs1f0.jpg', 1000008, 'before'),
(126, 'trmaIPn5Tel-06FM_z0k.jpg', 1000008, 'before'),
(127, 'yybqP00aeOY0cdNaXp61.jpg', 1000008, 'before'),
(128, 'bMQLHc1146ycUNV-Nf4Z.jpg', 1000008, 'before'),
(129, 'o-I4hmqmZ-3rsnZXLzca.jpg', 1000008, 'before'),
(130, '4LZn_fBQfL5wtLNYgOWR.jpg', 1000008, 'before'),
(131, 'czo6GNN04r8fR6nesTwq.jpg', 1000008, 'before'),
(132, 'yHRnkieAB89vcMYBErzw.jpg', 1000008, 'before'),
(133, 'mKnxPqvCK6G2VA2Rxmzj.jpg', 1000008, 'before'),
(134, '5UsDWVsoshO_rgcVu2GU.jpg', 1000008, 'before'),
(135, 'sqkzc25CnSKp06AQYaDA.jpg', 1000008, 'before'),
(136, 'iuQqERqdfaZBjd1tWKpf.jpg', 1000008, 'before'),
(137, 'ZGTc117lmyr2RU6Uy3Pd.jpg', 1000008, 'before'),
(138, 'zuWQUjSHvvveIzzfG0UO.jpg', 1000008, 'before'),
(139, 'CdDODL-QQT-Mn40DslEb.jpg', 1000008, 'before'),
(140, 'pKna_2oOqfJV_jiOK31Q.jpg', 1000008, 'before'),
(141, '5YvEn4WLeBXwOzYB6DL_.jpg', 1000008, 'before'),
(142, 'oYQYzGjIUTPcENrhw9lF.jpg', 1000008, 'before'),
(143, 'ttAbzR5l3dM6qpDxQyaV.jpg', 1000008, 'before'),
(144, 'Af_pgLjWEi7Vdn5YlowZ.jpg', 1000008, 'after'),
(145, '6XvdM_wXgXBGsm9DKTXI.jpg', 1000008, 'after'),
(146, '-hHxzhc5c7NY3CDDs0fF.jpg', 1000008, 'after'),
(147, '93l1ANh_X2ygiOF8-mlM.jpg', 1000008, 'after'),
(148, 'rW55yEt3h5ixqWvfxhes.jpg', 1000008, 'after'),
(149, '2dTTMCSbUSjnpBIY8DUE.jpg', 1000008, 'after'),
(150, 'inuG7gHyxbFGlHK4R-Xr.jpg', 1000008, 'after'),
(151, 'yiK30oDxdOAqEU18ufdb.jpg', 1000008, 'after'),
(152, 'pHCXFj0IOBtRiYEXKuqE.jpg', 1000008, 'after'),
(153, 'NBJOHaY8RRMMeYmGjZCx.jpg', 1000008, 'after'),
(154, 'ZUJHbZX2WECuAk9Gs3Lo.jpg', 1000008, 'after'),
(155, '3bxx9HCuAOdgp9jwV7br.jpg', 1000008, 'after'),
(156, 'UjnuAeWUCmWIt13n4nDj.jpg', 1000008, 'after'),
(157, 'uiFU6c01166Fy1pt6nd_.jpg', 1000008, 'after'),
(158, 'W2E3Jm3gP8nmCkDXOh9T.jpg', 1000008, 'after'),
(159, 'gdMVJ7wrlrpIEJxSZyA6.jpg', 1000008, 'after'),
(160, 'wZ4u7bTq8WmFANWL7WDU.jpg', 1000008, 'after'),
(161, 'TChkWk0cT4yr2FlZySOe.jpg', 1000008, 'after'),
(162, 'CZC_epDkgsUphIf3z4Po.jpg', 1000008, 'after'),
(163, 'OgW9TPO20j-HUFHsPVwr.jpg', 1000008, 'after'),
(164, 'DdGpoXT0OWpWl9x5pnD6.jpg', 1000009, 'after'),
(165, 'rq-xSG8WJSehvj1eHDfv.jpg', 1000009, 'after'),
(166, 'R7ABcHZKF2-sMjF1yiAy.jpg', 1000009, 'after'),
(167, 'PBoX42ipbgm7Q6Ms59fK.jpg', 1000009, 'after'),
(168, 'yOQ2Yqa7-rqxC3SRuwl_.jpg', 1000009, 'after'),
(169, '62AKDF31lyoiw5jwMxQH.jpg', 1000010, 'before'),
(170, 'CcVk_Zv-gNwXF46SNqCD.jpg', 1000010, 'before'),
(171, 'FnXyBvPgXmevUAtCalCf.jpg', 1000010, 'before'),
(172, 'Keb04gj3CjLTyh9XAO8o.jpg', 1000010, 'before'),
(173, 'xpiyb56CeuGDTMtBuTMf.jpg', 1000010, 'before'),
(174, '1Gl9iT7PElFsD4DNkkza.jpg', 1000010, 'before'),
(175, 'ydxGa0fx0Jk1Db1Y-iuQ.jpg', 1000010, 'before'),
(176, 'NtbHG-bHHMgYhFWqxT2W.jpg', 1000010, 'before'),
(177, 'b-RxrytR5xTz-Kf3sVbA.jpg', 1000010, 'before'),
(178, '4w76Wftl2-GRFHWH_osS.jpg', 1000010, 'before'),
(179, 'Tsw1mALMDcxJvGRmVDDt.jpg', 1000010, 'before'),
(180, '0ntpVIcaD5HtKfIfjUsm.jpg', 1000010, 'before'),
(181, 'Prw2SAntLZ5SWCgFRxId.jpg', 1000010, 'before'),
(182, 'BzTllQz1Yj7O9ouioZtg.jpg', 1000010, 'before'),
(183, 'AG2uXMJ5MVQCBlNXB7nz.jpg', 1000010, 'before'),
(184, 'Z9rrAbNNVZLf1fWlDsIb.jpg', 1000010, 'after'),
(185, '1GYHRqKu3b0QC1Aum_3u.jpg', 1000010, 'after'),
(186, 'BrcHz-TznQn-lMg1dgFl.jpg', 1000010, 'after'),
(187, 'ATM5dX1BKnOrnXBwIfQ7.jpg', 1000010, 'after'),
(188, 'qRtMfxuIxV_gL2mOSG_6.jpg', 1000010, 'after'),
(189, '0SbADtAi_2zBzkP5R5zY.jpg', 1000010, 'after'),
(190, '8oC9GHld9VNMVO3Onhb0.jpg', 1000010, 'after'),
(191, 'RcyEOxPUeqx9hDPGfZ4w.jpg', 1000010, 'after'),
(192, 'rlg-xx-1cKCmpfPiBP3u.jpg', 1000010, 'after'),
(193, 'M-LZHu75KkcEfIKwNYTu.jpg', 1000010, 'after'),
(194, 'm8kvLPWPssIrZdJdtggp.jpg', 1000011, 'after'),
(195, '9yYXlb6ZubR2qg2zUwqD.jpg', 1000011, 'after'),
(196, 'PLX8nKFWIW8aG1LJ-VHy.jpg', 1000011, 'after'),
(197, 'JGkfHQMJMRFIOxg-GJu5.jpg', 1000011, 'after'),
(198, 'O2mljj-w32cy7SbwxQEN.jpg', 1000011, 'after'),
(199, 'VPwT5U94xzyJIxdOSWZu.jpg', 1000011, 'after'),
(200, 'QGEQwqBN9NRNHc8i0Khu.jpg', 1000011, 'after');

-- --------------------------------------------------------

--
-- Структура таблицы `place`
--

CREATE TABLE `place` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_id` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `region` enum('Псковская область','Орловская область','Калужская область','Тульская область','Москва и Московская область','Рязанская область','Ярославская область','Владимирская область','Ивановская область','Нижегородская область','Республика Чувашия','Республика Марий Эл','Кировская область') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `place`
--

INSERT INTO `place` (`id`, `name`, `thumb_id`, `is_active`, `region`, `x`, `y`) VALUES
(1, 'Балахониха', NULL, 1, 'Нижегородская область', 94.186778593914, 50.641940085592),
(2, 'Кстово', NULL, 1, 'Нижегородская область', 347.36666666667, 401.36054421769),
(3, 'Тумботино', NULL, 1, 'Нижегородская область', NULL, NULL),
(4, 'Валки', NULL, 1, 'Нижегородская область', NULL, NULL),
(5, 'Воротынец', NULL, 1, 'Нижегородская область', NULL, NULL),
(6, 'Ермишь', NULL, 1, 'Рязанская область', NULL, NULL),
(7, 'Мосолово', NULL, 1, 'Рязанская область', NULL, NULL),
(8, 'Редькино', NULL, 1, 'Нижегородская область', 350.76666666667, 406.46258503401),
(10, 'Шилово', NULL, 1, 'Рязанская область', 196.06666666667, 381.51927437642),
(11, 'Константиново', NULL, 1, 'Москва и Московская область', 192.1, 319.16099773243),
(12, 'Килемары', NULL, 1, 'Республика Марий Эл', 451.63333333333, 428.57142857143),
(13, 'Юрино', NULL, 1, 'Республика Марий Эл', 418.2, 412.13151927438),
(14, 'Сернур', NULL, 1, 'Республика Марий Эл', 440.86666666667, 416.66666666667),
(15, 'Достижение', NULL, 1, 'Владимирская область', 270.3, 357.70975056689),
(16, 'Филино', NULL, 1, 'Владимирская область', 255.56666666667, 334.46712018141),
(17, 'Камешково', NULL, 1, 'Владимирская область', 235.73333333333, 300.45351473923),
(18, 'Залесье', NULL, 1, 'Ивановская область', 321.3, 343.53741496599),
(19, 'Киреевск', NULL, 1, 'Тульская область', 131.46666666667, 403.0612244898),
(20, 'Великие Луки', NULL, 1, 'Псковская область', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `project`
--

CREATE TABLE `project` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costs` int NOT NULL DEFAULT '0',
  `people` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Школа','Дом культуры','Детский сад','Больница','Коммуникации') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_id` int DEFAULT NULL,
  `place_id` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `project`
--

INSERT INTO `project` (`id`, `name`, `period`, `costs`, `people`, `type`, `thumb_id`, `place_id`, `is_active`) VALUES
(1000001, 'Реконструкция МБОУ основная общеобразовательная школа п. Балахониха ', 'Март - Август 2014 года', 30, '42 учащихся', 'Школа', NULL, 1, 1),
(1000003, 'Капитальный ремонт МКУ «Центр комплексного обслуживания «Культура»', 'Май 2017 - Июнь 2018', 14, '2200 человек', 'Дом культуры', NULL, 1, 1),
(1000004, 'Реконструкция МБДОУ Балахонихинский детский сад ', 'Март - Август 2014 года', 20, '35 детей', 'Детский сад', NULL, 1, 1),
(1000005, 'Ремонт и оснащение Балахонинской врачебной амбулатории ', 'Июнь - сентябрь 2015 года', 1, '950 человек', 'Больница', NULL, 1, 1),
(1000006, 'Ремонт и оснащение МБОУ СРЕДНЯЯ ШКОЛА № 3 Кстовского муниципального района', '2017 - 2018 гг.', 4, '1294 обучающихся', 'Школа', NULL, 2, 1),
(1000007, 'Ремонт и оснащение МБОУ СРЕДНЯЯ ШКОЛА № 8 Кстовского муниципального района', '2017 - 2018 гг.', 5, '1101 учащийся', 'Школа', NULL, 2, 1),
(1000008, 'Капитальные ремонт и оснащение МБОУ Гимназия №4 Кстовского муниципального района', 'Июнь - Август 2016 г.', 74, '711 учащихся', 'Школа', NULL, 2, 1),
(1000009, 'Ремонт и оснащение МБОУ Гимназии №4  Кстовского Муниципального района', 'Июнь-август 2016 г.', 2, '711 учащихся', 'Школа', NULL, 2, 1),
(1000010, 'Капитальный ремонт МБОУ средняя школа №2 р.п. Тумботино', 'Июнь - Август 2013 года', 60, '552  учащихся', 'Школа', NULL, 3, 1),
(1000011, 'Оснащение учебных классов МБОУ средней школы №2 р.п. Тумботино', 'Июнь-август 2016 года', 3, '552 учащихся', 'Школа', NULL, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `birth` date NOT NULL,
  `password_hash` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `auth_token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ctor_item`
--
ALTER TABLE `ctor_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT для таблицы `place`
--
ALTER TABLE `place`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `project`
--
ALTER TABLE `project`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000012;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
