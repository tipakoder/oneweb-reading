-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 04 2021 г., 17:04
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
(1, 'admin', 'N', 'dima.donskov02@gmail.com', 'Донсков', 'Дмитрий', 'Владимирович', 0, 'Администратор', 'Администрирование', 'admin', '$2y$10$Dq5LK0DmUuMDZIcGVLX86O/CZP7vtcYDjhAgIbenjOhpA.JDUNKMK'),
(2, 'user', 'N', 'staryliss.nikita.2004@gmail.com', 'Никита', 'Сарычев', 'Андреевич', 0, 'Пользователь', 'Архивный пользователей ', 'user', '$2y$10$Dq5LK0DmUuMDZIcGVLX86O/CZP7vtcYDjhAgIbenjOhpA.JDUNKMK');

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
  `ip` varchar(12) NOT NULL,
  `active` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `account_session`
--

INSERT INTO `account_session` (`id`, `account_id`, `session_key`, `session_time`, `ip`, `active`) VALUES
(1, 1, 'a8b948a4b6ac4e52cd36c5f69e8fc1843e8358dc9136a8db9d42cacab885988a', 1625239162, '192.168.142.', 'N'),
(2, 1, '692409170315ab0c839d7b3e555bba1026d19906b23a695279da3d49aa4e6a4e', 1625240229, '192.168.142.', 'N'),
(3, 1, 'b72016abe2d6032278c314eef0a859fef49e8d89d076ac2c6496e42208dcd568', 1625240287, '192.168.142.', 'N'),
(4, 1, '240108858632cbd1ff69e8c4a7d692d46ab612c46dfaa143e6816830a154a5a9', 1625240387, '192.168.142.', 'N'),
(5, 1, '1af0d73139b75a39d101ca1f2e4432a8e26301119607a0472d34d4ea75c18dd7', 1625241044, '192.168.142.', 'N'),
(6, 1, '3c8fb55ff18939219234f47cebde58b6e8a16b960dee4450bef7af3e3ba40346', 1625241045, '192.168.142.', 'N'),
(7, 1, '3c8fb55ff18939219234f47cebde58b6e8a16b960dee4450bef7af3e3ba40346', 1625241045, '192.168.142.', 'N'),
(8, 1, '9c07aec1ebec6f6cb34795b5833564ac9ea0c6c0a9dd2e72873f84d6d21aded1', 1625241046, '192.168.142.', 'N'),
(9, 1, '9c07aec1ebec6f6cb34795b5833564ac9ea0c6c0a9dd2e72873f84d6d21aded1', 1625241046, '192.168.142.', 'N'),
(10, 1, '9c07aec1ebec6f6cb34795b5833564ac9ea0c6c0a9dd2e72873f84d6d21aded1', 1625241046, '192.168.142.', 'N'),
(11, 1, '9c07aec1ebec6f6cb34795b5833564ac9ea0c6c0a9dd2e72873f84d6d21aded1', 1625241046, '192.168.142.', 'N'),
(12, 1, '5180d28f69045446e0ea7cd5d4ed9e76c974e013581d800a592bdf5b4de32860', 1625241047, '192.168.142.', 'N'),
(13, 1, '5180d28f69045446e0ea7cd5d4ed9e76c974e013581d800a592bdf5b4de32860', 1625241047, '192.168.142.', 'N'),
(14, 1, '5180d28f69045446e0ea7cd5d4ed9e76c974e013581d800a592bdf5b4de32860', 1625241047, '192.168.142.', 'N'),
(15, 1, '5180d28f69045446e0ea7cd5d4ed9e76c974e013581d800a592bdf5b4de32860', 1625241047, '192.168.142.', 'N'),
(16, 1, '5180d28f69045446e0ea7cd5d4ed9e76c974e013581d800a592bdf5b4de32860', 1625241047, '192.168.142.', 'N'),
(17, 1, '5180d28f69045446e0ea7cd5d4ed9e76c974e013581d800a592bdf5b4de32860', 1625241047, '192.168.142.', 'N'),
(18, 1, 'ebb06eb9f4a355495994c71502e6a9d6d6643305b4a8ac38a38c030671c98749', 1625241048, '192.168.142.', 'N'),
(19, 1, 'ebb06eb9f4a355495994c71502e6a9d6d6643305b4a8ac38a38c030671c98749', 1625241048, '192.168.142.', 'N'),
(20, 1, 'ebb06eb9f4a355495994c71502e6a9d6d6643305b4a8ac38a38c030671c98749', 1625241048, '192.168.142.', 'N'),
(21, 1, 'ebb06eb9f4a355495994c71502e6a9d6d6643305b4a8ac38a38c030671c98749', 1625241048, '192.168.142.', 'N'),
(22, 1, 'ebb06eb9f4a355495994c71502e6a9d6d6643305b4a8ac38a38c030671c98749', 1625241048, '192.168.142.', 'N'),
(23, 1, 'e133062c261fe8f2b6bdc94e2814f57f558e0b1e3dce0cfd15915980adcd5fd0', 1625248969, '192.168.142.', 'N'),
(24, 1, '06b069b601ae71ceafe6f876dec901831860417cc28702f70eceff43ffdf1afb', 1625300005, '10.43.54.183', 'N'),
(25, 1, '3d6fa6769fca6748d03514f2119e15f92daacbf10e9029066c4162b7c288e624', 1625304339, '10.43.54.183', 'N'),
(26, 1, '523bfa2c44a6fb0fd495e2d2c9566892f4a530ecef8c4416d759c775d48b2ac8', 1625304631, '10.43.54.183', 'N'),
(27, 1, '6e57ce58bf1a06e4346481ca3e4256025c3a2721cdfefed1ab05aaae847b219b', 1625307597, '192.168.142.', 'N'),
(28, 1, 'b5a1f1f4e35cf1f0033ad29489470c09d35b754f0d0f76751991721ceb69d053', 1625307829, '192.168.142.', 'N'),
(29, 1, '4c42c079acdbe1c17a59ef6c69250f3d1c93f218727ab64548453681eb626fa9', 1625307833, '10.43.54.183', 'N'),
(30, 1, 'b4cbf403db773a60dd6424d3ae69210f69ef793ee66490afea29bb9eb784a528', 1625308034, '192.168.101.', 'N'),
(31, 1, '8fe3779be250c091411b64fab49acde7240a6f2146905c1149376b6b92079754', 1625311229, '192.168.142.', 'N'),
(32, 1, '60808b5f90ed4a0ea5acf2188e6a1627f8dbb727428f1d2d88134d2b0eee7c0d', 1625325971, '10.43.54.183', 'N'),
(33, 1, 'cc230be7665436674afc9ee6c87a67f75d44ef39b52b6ca5143c030b05edd1e9', 1625326089, '192.168.142.', 'N'),
(34, 1, 'd7c2186c88b21e759c92b2522e2e846ed44a0cf07deb3b93aa2a2bb03e8634e0', 1625332725, '192.168.142.', 'N'),
(35, 1, '5da110a9f247d2ae0697d17d7daf36ad1a0a73c875b829ab4d2e97eb93fba91c', 1625333219, '192.168.142.', 'N'),
(36, 1, '888c36da1a88fdfef6818cf870ecdb47288ec52903b7e805c4afa11687635c19', 1625335288, '10.43.54.183', 'N'),
(37, 1, '71c929a8c4524ca8ef4b70dcaa77d81a2888073cd1013bda50bd1f0b11a5f466', 1625367619, '192.168.142.', 'N'),
(38, 1, '95bd25828944e9adaa6fb89489f3ce628be360b8d3d8a25b191ae1a242044fe7', 1625373876, '10.43.54.183', 'N'),
(39, 2, 'a96ae6dbb18bc900913315289743f815a2173530b980d2cd06b8de47d02ed551', 1625374941, '10.43.54.183', 'N'),
(40, 1, '536eae8fdd3cc83fd0aabcafe03cd055e9ad145e36d3866b6329d7da4925d849', 1625375191, '10.43.54.183', 'N'),
(41, 2, '560e8a41e5d4d8a23ec3c8a509fdde2623e597bd3431eaf97c31cc454d7fede1', 1625378561, '192.168.142.', 'N'),
(42, 2, '88804f9ba16474ce47e6a809e7aae90163e93912b4d912cee28f68a2a0e8cb79', 1625378893, '192.168.142.', 'N'),
(43, 1, 'b47c4532b3d57192e113b946cbfbf1ce9914a8c54e6c5a06c5d19e0201ef7321', 1625379788, '192.168.142.', 'N'),
(44, 2, '5c74429a49f483cc8ce2e2212d35ff4d48b6a3f3c09592fa1613dbf6b878f129', 1625380460, '192.168.142.', 'N'),
(45, 1, '7905292cb29a5e8f74ea4bf002ea74c499d4376d59deaba791379d2a0791e9bc', 1625383178, '192.168.142.', 'N'),
(46, 1, '6f2e9160d39044cb1736bbac4938f469621630c8f5c7b474cba63fe1436f653a', 1625383783, '192.168.142.', 'N'),
(47, 1, 'd5047248b4fde1e435c41e8d3db1a1fc0ed5da6fc345bdfb5c2c9611eddc06f2', 1625384559, '10.43.54.183', 'N'),
(48, 2, '98889d13210614733f9bf9d491a579b1d06f5629efd6362a38614427057397ee', 1625389429, '10.43.54.183', 'N'),
(49, 1, '1262f9060bfe9c8a262e4ec1667efa535988a1613f2576a3da4590cd1d21a9be', 1625389455, '10.43.54.183', 'N'),
(50, 2, '494cea3d8f3bb457183cd30746a32f0f35f119c405ebbec688db2ba881418455', 1625389955, '10.43.54.183', 'N'),
(51, 1, '72e34576b1b9698be17aa95d2ccaedf5831385502d84b8fa256f2482b6cf44ef', 1625390179, '192.168.142.', 'Y'),
(52, 1, '85e9af00672b7538cbb0247848a62e666295578e900433cccf43ba7ee962c6b4', 1625390241, '10.43.54.183', 'Y'),
(53, 2, '310535d78637d8cfaa8968b98ad91918153e38120e12febc3d8aa73480e14dbb', 1625390510, '192.168.142.', 'N'),
(54, 2, '4547524a046c81a54df4e46d7a042f8f1491fbdacbae6f594b6f229fbc81898b', 1625390627, '192.168.142.', 'N'),
(55, 1, '828fd07e1bb8da12a8a7bf2e3cf8dfd023bd71efd5a66c87b4262488546dbdcb', 1625390752, '192.168.142.', 'Y'),
(56, 1, '7794504862e54a6c0d7ba71961b098231dda6bb771dd75d259b9f9cbcdaaf2c3', 1625393900, '10.43.54.183', 'Y'),
(57, 1, 'a4b2e766d38688436911359bff432480a84745684d94fb0ffee92cf4ac316f1c', 1625395673, '10.43.54.183', 'Y'),
(58, 2, '111d9f81da98d73ca73af8de5c3febac37a23ba5b3e706a2923364e6f3932a9f', 1625398954, '10.43.54.183', 'Y'),
(59, 1, 'b8974f3b9cebf3c95ed64a98634514654e4869398da31b70252bb78d756773e2', 1625401138, '192.168.142.', 'Y'),
(60, 1, '83febc2f8e00f45efd7002bc41ca51d5329f549bd5a1c660c11d00f0ff61facc', 1625401547, '192.168.142.', 'Y'),
(61, 1, '7a13ef1d8026fad77599ccc2397282ee9eaf357b1d44fcbf1899224fac4258db', 1625403714, '192.168.142.', 'Y'),
(62, 2, 'c0becca3fae195a962b1aea8fa06b8b38dd4b0d0c6d14791ba111ae31c0f395f', 1625403750, '192.168.142.', 'Y'),
(63, 1, '932d8cbff105fc4caf22dba2404d400c1066967560b48370bb12594eeb42a984', 1625406144, '10.43.54.183', 'Y'),
(64, 2, '9fa27c710d5b542c3af25c15ca949976555324d4254b9d70f5c2180c54c909f5', 1625406905, '192.168.142.', 'Y'),
(65, 2, '9d3f7a4c4ab44997c3b6f5f6bc4b4cb0ffac73bd2917f10f9940621bfe85b30d', 1625406935, '192.168.142.', 'Y'),
(66, 2, '9dd353256600e67e8e8cc60c4646095d09769f689f8df75e7548e59fa30b7610', 1625407557, '192.168.142.', 'Y'),
(67, 1, 'f8e784059dc20a473447dd01a0c8a6c0f66700119af22f59b2415cbb6e556e64', 1625407899, '192.168.142.', 'Y'),
(68, 1, 'c0836fa188f13acd3867c69e2b95464b6b59ececb9732956c1fb7212c645da9b', 1625408984, '10.43.54.183', 'Y'),
(69, 2, 'd87e3792ff81da95d6e8b941a7becb4b6d8f0a751c18d1cae930c26c86d1fc55', 1625409432, '192.168.142.', 'Y'),
(70, 1, 'b2a1b2250bf240788a2cdb826cd4b39154afcc4305b20b658101817a7d180688', 1625410028, '192.168.142.', 'Y'),
(71, 1, '347382bab8303b3c9fbb14d5eae38ced2ccde785fec438837f9ca86f011127b9', 1625410244, '192.168.142.', 'Y'),
(72, 2, 'e003c13bbde04c8af97fbdf65c0e02cfe2a90510efe1472197eb249df8776471', 1625410576, '192.168.142.', 'Y'),
(73, 2, 'dbe5a629fe0a87cabc9d66a45861de10b83fe965b2e451f530c08a86047f3211', 1625410623, '192.168.142.', 'Y'),
(74, 1, '7a04f5b8b282d3051930dce0c1760e7e419c4adaf5eacb8cddbbb9130d756edf', 1625410653, '192.168.142.', 'Y');

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
  `answer` text DEFAULT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `appeal`
--

INSERT INTO `appeal` (`id`, `waiting`, `account_id`, `subject`, `text`, `answer`, `date`) VALUES
(1, 'Y', 1, 'test1', 'test', NULL, 1625381266),
(2, 'N', 1, 'test2', 'test2', 'asd', 1625384958);

-- --------------------------------------------------------

--
-- Структура таблицы `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(120) NOT NULL,
  `text` text NOT NULL,
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
(4, 1, 1, '1', '1'),
(5, 1, 4, '1a', '/fund/Фонд 1/Опись 4/');

-- --------------------------------------------------------

--
-- Структура таблицы `deal_favorite`
--

CREATE TABLE `deal_favorite` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `deal_favorite`
--

INSERT INTO `deal_favorite` (`id`, `account_id`, `deal_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1);

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
(4, 1, '1', 0, 0),
(5, 1, '2', 0, 1625397284),
(6, 1, '2', 0, 1625397569),
(7, 1, '1', 0, 1625397639);

-- --------------------------------------------------------

--
-- Структура таблицы `log_deal`
--

CREATE TABLE `log_deal` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `timeview` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `log_deal`
--

INSERT INTO `log_deal` (`id`, `account_id`, `deal_id`, `timeview`) VALUES
(1, 2, 1, 1625403795),
(2, 2, 4, 1625403844),
(3, 1, 1, 1625403880),
(4, 1, 1, 1625403929),
(5, 2, 5, 1625403944),
(6, 1, 1, 1625404045),
(7, 1, 4, 1625409915),
(8, 1, 3, 1625409916),
(9, 1, 1, 1625409916),
(10, 1, 5, 1625409918),
(11, 1, 1, 1625410468),
(12, 1, 3, 1625410469),
(13, 1, 4, 1625410469),
(14, 2, 4, 1625410637),
(15, 2, 3, 1625410637),
(16, 2, 1, 1625410638),
(17, 2, 1, 1625410638);

-- --------------------------------------------------------

--
-- Структура таблицы `log_fund`
--

CREATE TABLE `log_fund` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `fund_id` int(11) NOT NULL,
  `timeview` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `log_fund`
--

INSERT INTO `log_fund` (`id`, `account_id`, `fund_id`, `timeview`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 1625400834),
(3, 1, 1, 1625400834),
(4, 1, 1, 1625400834),
(5, 1, 1, 1625400834),
(6, 1, 1, 1625401184),
(7, 1, 1, 1625401191),
(8, 1, 1, 1625402735),
(9, 1, 1, 1625402764),
(10, 1, 1, 1625402854),
(11, 1, 1, 1625402873),
(12, 1, 1, 1625402963),
(13, 1, 1, 1625402970),
(14, 1, 1, 1625403063),
(15, 1, 1, 1625403089),
(16, 1, 1, 1625403135),
(17, 1, 1, 1625403167),
(18, 2, 1, 1625403788),
(19, 2, 1, 1625403792),
(20, 1, 1, 1625403797),
(21, 1, 1, 1625403798),
(22, 2, 1, 1625403841),
(23, 2, 1, 1625403856),
(24, 1, 1, 1625403878),
(25, 1, 1, 1625403926),
(26, 1, 1, 1625403928),
(27, 2, 1, 1625403942),
(28, 2, 1, 1625403943),
(29, 2, 1, 1625404024),
(30, 1, 1, 1625404037),
(31, 1, 1, 1625404043),
(32, 2, 1, 1625407733),
(33, 2, 1, 1625407739),
(34, 1, 1, 1625409912),
(35, 1, 1, 1625409913),
(36, 1, 1, 1625409917),
(37, 1, 1, 1625410362),
(38, 1, 1, 1625410452),
(39, 1, 1, 1625410457),
(40, 1, 1, 1625410465),
(41, 1, 1, 1625410471),
(42, 1, 1, 1625410473),
(43, 1, 1, 1625410475),
(44, 2, 1, 1625410606),
(45, 2, 1, 1625410607),
(46, 2, 1, 1625410608),
(47, 2, 1, 1625410634),
(48, 2, 1, 1625410635),
(49, 1, 1, 1625410663);

-- --------------------------------------------------------

--
-- Структура таблицы `log_inventory`
--

CREATE TABLE `log_inventory` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `timeview` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `log_inventory`
--

INSERT INTO `log_inventory` (`id`, `account_id`, `inventory_id`, `timeview`) VALUES
(1, 1, 7, 1625401191),
(2, 2, 1, 1625403792),
(3, 1, 1, 1625403798),
(4, 2, 1, 1625403841),
(5, 2, 1, 1625403856),
(6, 1, 1, 1625403878),
(7, 1, 1, 1625403928),
(8, 2, 4, 1625403943),
(9, 2, 7, 1625404024),
(10, 1, 1, 1625404043),
(11, 2, 1, 1625407739),
(12, 1, 1, 1625409913),
(13, 1, 4, 1625409917),
(14, 1, 1, 1625410457),
(15, 1, 1, 1625410465),
(16, 1, 5, 1625410471),
(17, 1, 7, 1625410473),
(18, 1, 7, 1625410475),
(19, 2, 1, 1625410607),
(20, 2, 7, 1625410608),
(21, 2, 1, 1625410635);

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
-- Индексы таблицы `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

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
-- Индексы таблицы `log_deal`
--
ALTER TABLE `log_deal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `deal_id` (`deal_id`);

--
-- Индексы таблицы `log_fund`
--
ALTER TABLE `log_fund`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `fund_id` (`fund_id`);

--
-- Индексы таблицы `log_inventory`
--
ALTER TABLE `log_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `account_confirmation_code`
--
ALTER TABLE `account_confirmation_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `account_session`
--
ALTER TABLE `account_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT для таблицы `appeal`
--
ALTER TABLE `appeal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `deal`
--
ALTER TABLE `deal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `deal_favorite`
--
ALTER TABLE `deal_favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `fund`
--
ALTER TABLE `fund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `log_deal`
--
ALTER TABLE `log_deal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `log_fund`
--
ALTER TABLE `log_fund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `log_inventory`
--
ALTER TABLE `log_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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

--
-- Ограничения внешнего ключа таблицы `log_deal`
--
ALTER TABLE `log_deal`
  ADD CONSTRAINT `log_deal_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `log_deal_ibfk_2` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `log_fund`
--
ALTER TABLE `log_fund`
  ADD CONSTRAINT `log_fund_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `log_fund_ibfk_2` FOREIGN KEY (`fund_id`) REFERENCES `fund` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `log_inventory`
--
ALTER TABLE `log_inventory`
  ADD CONSTRAINT `log_inventory_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `log_inventory_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
