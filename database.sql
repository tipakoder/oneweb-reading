-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 03 2021 г., 23:42
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `docs`
--

-- --------------------------------------------------------

--
-- Структура таблицы `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `typeAccount` enum('admin','user') NOT NULL DEFAULT 'user',
  `verify` enum('Y','N') NOT NULL DEFAULT 'N',
  `email` varchar(120) NOT NULL,
  `firstname` varchar(120) NOT NULL,
  `lastname` varchar(120) NOT NULL,
  `middlename` varchar(120) NOT NULL,
  `date` int(11) NOT NULL,
  `position` varchar(120) NOT NULL,
  `departament` varchar(120) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `account`
--

INSERT INTO `account` (`id`, `typeAccount`, `verify`, `email`, `firstname`, `lastname`, `middlename`, `date`, `position`, `departament`, `login`, `password`) VALUES
(1, 'admin', 'N', 'dima.donskov02@gmail.com', 'Донсков', 'Дмитрий', 'Владимирович', 0, 'Администратор', 'Администрирование', 'user', '$2y$10$Dq5LK0DmUuMDZIcGVLX86O/CZP7vtcYDjhAgIbenjOhpA.JDUNKMK');

-- --------------------------------------------------------

--
-- Структура таблицы `account_confirmation_code`
--

CREATE TABLE `account_confirmation_code` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `account_session`
--

CREATE TABLE `account_session` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `session_key` varchar(255) NOT NULL,
  `session_time` int(11) NOT NULL,
  `ip` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `account_session`
--

INSERT INTO `account_session` (`id`, `account_id`, `session_key`, `session_time`, `ip`) VALUES
(1, 1, 'a8b948a4b6ac4e52cd36c5f69e8fc1843e8358dc9136a8db9d42cacab885988a', 1625239162, '192.168.142.'),
(2, 1, '692409170315ab0c839d7b3e555bba1026d19906b23a695279da3d49aa4e6a4e', 1625240229, '192.168.142.'),
(3, 1, 'b72016abe2d6032278c314eef0a859fef49e8d89d076ac2c6496e42208dcd568', 1625240287, '192.168.142.'),
(4, 1, '240108858632cbd1ff69e8c4a7d692d46ab612c46dfaa143e6816830a154a5a9', 1625240387, '192.168.142.'),
(5, 1, '1af0d73139b75a39d101ca1f2e4432a8e26301119607a0472d34d4ea75c18dd7', 1625241044, '192.168.142.'),
(6, 1, '3c8fb55ff18939219234f47cebde58b6e8a16b960dee4450bef7af3e3ba40346', 1625241045, '192.168.142.'),
(7, 1, '3c8fb55ff18939219234f47cebde58b6e8a16b960dee4450bef7af3e3ba40346', 1625241045, '192.168.142.'),
(8, 1, '9c07aec1ebec6f6cb34795b5833564ac9ea0c6c0a9dd2e72873f84d6d21aded1', 1625241046, '192.168.142.'),
(9, 1, '9c07aec1ebec6f6cb34795b5833564ac9ea0c6c0a9dd2e72873f84d6d21aded1', 1625241046, '192.168.142.'),
(10, 1, '9c07aec1ebec6f6cb34795b5833564ac9ea0c6c0a9dd2e72873f84d6d21aded1', 1625241046, '192.168.142.'),
(11, 1, '9c07aec1ebec6f6cb34795b5833564ac9ea0c6c0a9dd2e72873f84d6d21aded1', 1625241046, '192.168.142.'),
(12, 1, '5180d28f69045446e0ea7cd5d4ed9e76c974e013581d800a592bdf5b4de32860', 1625241047, '192.168.142.'),
(13, 1, '5180d28f69045446e0ea7cd5d4ed9e76c974e013581d800a592bdf5b4de32860', 1625241047, '192.168.142.'),
(14, 1, '5180d28f69045446e0ea7cd5d4ed9e76c974e013581d800a592bdf5b4de32860', 1625241047, '192.168.142.'),
(15, 1, '5180d28f69045446e0ea7cd5d4ed9e76c974e013581d800a592bdf5b4de32860', 1625241047, '192.168.142.'),
(16, 1, '5180d28f69045446e0ea7cd5d4ed9e76c974e013581d800a592bdf5b4de32860', 1625241047, '192.168.142.'),
(17, 1, '5180d28f69045446e0ea7cd5d4ed9e76c974e013581d800a592bdf5b4de32860', 1625241047, '192.168.142.'),
(18, 1, 'ebb06eb9f4a355495994c71502e6a9d6d6643305b4a8ac38a38c030671c98749', 1625241048, '192.168.142.'),
(19, 1, 'ebb06eb9f4a355495994c71502e6a9d6d6643305b4a8ac38a38c030671c98749', 1625241048, '192.168.142.'),
(20, 1, 'ebb06eb9f4a355495994c71502e6a9d6d6643305b4a8ac38a38c030671c98749', 1625241048, '192.168.142.'),
(21, 1, 'ebb06eb9f4a355495994c71502e6a9d6d6643305b4a8ac38a38c030671c98749', 1625241048, '192.168.142.'),
(22, 1, 'ebb06eb9f4a355495994c71502e6a9d6d6643305b4a8ac38a38c030671c98749', 1625241048, '192.168.142.'),
(23, 1, 'e133062c261fe8f2b6bdc94e2814f57f558e0b1e3dce0cfd15915980adcd5fd0', 1625248969, '192.168.142.'),
(24, 1, '06b069b601ae71ceafe6f876dec901831860417cc28702f70eceff43ffdf1afb', 1625300005, '10.43.54.183'),
(25, 1, '3d6fa6769fca6748d03514f2119e15f92daacbf10e9029066c4162b7c288e624', 1625304339, '10.43.54.183'),
(26, 1, '523bfa2c44a6fb0fd495e2d2c9566892f4a530ecef8c4416d759c775d48b2ac8', 1625304631, '10.43.54.183'),
(27, 1, '6e57ce58bf1a06e4346481ca3e4256025c3a2721cdfefed1ab05aaae847b219b', 1625307597, '192.168.142.'),
(28, 1, 'b5a1f1f4e35cf1f0033ad29489470c09d35b754f0d0f76751991721ceb69d053', 1625307829, '192.168.142.'),
(29, 1, '4c42c079acdbe1c17a59ef6c69250f3d1c93f218727ab64548453681eb626fa9', 1625307833, '10.43.54.183'),
(30, 1, 'b4cbf403db773a60dd6424d3ae69210f69ef793ee66490afea29bb9eb784a528', 1625308034, '192.168.101.'),
(31, 1, '8fe3779be250c091411b64fab49acde7240a6f2146905c1149376b6b92079754', 1625311229, '192.168.142.'),
(32, 1, '60808b5f90ed4a0ea5acf2188e6a1627f8dbb727428f1d2d88134d2b0eee7c0d', 1625325971, '10.43.54.183'),
(33, 1, 'cc230be7665436674afc9ee6c87a67f75d44ef39b52b6ca5143c030b05edd1e9', 1625326089, '192.168.142.'),
(34, 1, 'd7c2186c88b21e759c92b2522e2e846ed44a0cf07deb3b93aa2a2bb03e8634e0', 1625332725, '192.168.142.'),
(35, 1, '5da110a9f247d2ae0697d17d7daf36ad1a0a73c875b829ab4d2e97eb93fba91c', 1625333219, '192.168.142.'),
(36, 1, '888c36da1a88fdfef6818cf870ecdb47288ec52903b7e805c4afa11687635c19', 1625335288, '10.43.54.183');

-- --------------------------------------------------------

--
-- Структура таблицы `appeal`
--

CREATE TABLE `appeal` (
  `id` int(11) NOT NULL,
  `waiting` enum('Y','N') NOT NULL DEFAULT 'Y',
  `account_id` int(11) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `text` text NOT NULL,
  `answer` text NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `deal`
--

CREATE TABLE `deal` (
  `id` int(11) NOT NULL,
  `fund_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `number` varchar(12) NOT NULL,
  `path` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `deal`
--

INSERT INTO `deal` (`id`, `fund_id`, `inventory_id`, `number`, `path`) VALUES
(1, 1, 1, '1', ''),
(2, 2, 2, '2', ''),
(3, 1, 1, '1', '2'),
(4, 1, 1, '1', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `deal_favorite`
--

CREATE TABLE `deal_favorite` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fund`
--

CREATE TABLE `fund` (
  `id` int(11) NOT NULL,
  `number` varchar(12) NOT NULL,
  `shorttext` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `fund`
--

INSERT INTO `fund` (`id`, `number`, `shorttext`) VALUES
(1, '1', 'Фонд образования'),
(2, '2', 'Фонд кино'),
(3, '3', 'test'),
(4, '1', 'dasda'),
(5, '12', 'да');

-- --------------------------------------------------------

--
-- Структура таблицы `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `fund_id` int(11) NOT NULL,
  `number` varchar(12) NOT NULL,
  `path` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `inventory`
--

INSERT INTO `inventory` (`id`, `fund_id`, `number`, `path`, `date`) VALUES
(1, 1, '1', 0, 0),
(2, 1, '2', 0, 0),
(3, 1, '1', 0, 0),
(4, 1, '1', 0, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `account_confirmation_code`
--
ALTER TABLE `account_confirmation_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Индексы таблицы `account_session`
--
ALTER TABLE `account_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Индексы таблицы `appeal`
--
ALTER TABLE `appeal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Индексы таблицы `deal`
--
ALTER TABLE `deal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fund_id` (`fund_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Индексы таблицы `deal_favorite`
--
ALTER TABLE `deal_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `deal_id` (`deal_id`);

--
-- Индексы таблицы `fund`
--
ALTER TABLE `fund`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fund_id` (`fund_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `account_confirmation_code`
--
ALTER TABLE `account_confirmation_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `account_session`
--
ALTER TABLE `account_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `appeal`
--
ALTER TABLE `appeal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `deal`
--
ALTER TABLE `deal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `deal_favorite`
--
ALTER TABLE `deal_favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fund`
--
ALTER TABLE `fund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `account_confirmation_code`
--
ALTER TABLE `account_confirmation_code`
  ADD CONSTRAINT `account_confirmation_code_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `account_session`
--
ALTER TABLE `account_session`
  ADD CONSTRAINT `account_session_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Ограничения внешнего ключа таблицы `appeal`
--
ALTER TABLE `appeal`
  ADD CONSTRAINT `appeal_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `deal`
--
ALTER TABLE `deal`
  ADD CONSTRAINT `deal_ibfk_1` FOREIGN KEY (`fund_id`) REFERENCES `fund` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deal_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `deal_favorite`
--
ALTER TABLE `deal_favorite`
  ADD CONSTRAINT `deal_favorite_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deal_favorite_ibfk_2` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`fund_id`) REFERENCES `fund` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
