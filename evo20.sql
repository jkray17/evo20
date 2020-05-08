-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 09 2020 г., 00:31
-- Версия сервера: 5.6.43
-- Версия PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `evo20`
--

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_active_users`
--

CREATE TABLE `g6vz_active_users` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `action` varchar(10) NOT NULL DEFAULT '',
  `id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data about last user action.';

--
-- Дамп данных таблицы `g6vz_active_users`
--

INSERT INTO `g6vz_active_users` (`sid`, `internalKey`, `username`, `lasthit`, `action`, `id`) VALUES
('2jspmbkclvrpiqgldkav6hajjhfkckub', 1, 'admin_slava', 1588939125, '2', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_active_user_locks`
--

CREATE TABLE `g6vz_active_user_locks` (
  `id` int(10) NOT NULL,
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `elementType` int(1) NOT NULL DEFAULT '0',
  `elementId` int(10) NOT NULL DEFAULT '0',
  `lasthit` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data about locked elements.';

--
-- Дамп данных таблицы `g6vz_active_user_locks`
--

INSERT INTO `g6vz_active_user_locks` (`id`, `sid`, `internalKey`, `elementType`, `elementId`, `lasthit`) VALUES
(193, '2jspmbkclvrpiqgldkav6hajjhfkckub', 1, 7, 51, 1587369703),
(182, '2jspmbkclvrpiqgldkav6hajjhfkckub', 1, 7, 52, 1586787096),
(235, '2jspmbkclvrpiqgldkav6hajjhfkckub', 1, 7, 54, 1588701851),
(210, '2jspmbkclvrpiqgldkav6hajjhfkckub', 1, 7, 53, 1587897525);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_active_user_sessions`
--

CREATE TABLE `g6vz_active_user_sessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data about valid user sessions.';

--
-- Дамп данных таблицы `g6vz_active_user_sessions`
--

INSERT INTO `g6vz_active_user_sessions` (`sid`, `internalKey`, `lasthit`, `ip`) VALUES
('2jspmbkclvrpiqgldkav6hajjhfkckub', 1, 1588973437, '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_categories`
--

CREATE TABLE `g6vz_categories` (
  `id` int(11) NOT NULL,
  `category` varchar(45) NOT NULL DEFAULT '',
  `rank` int(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Categories to be used snippets,tv,chunks, etc';

--
-- Дамп данных таблицы `g6vz_categories`
--

INSERT INTO `g6vz_categories` (`id`, `category`, `rank`) VALUES
(1, 'SEO', 0),
(2, 'Templates', 0),
(3, 'Manager and Admin', 0),
(4, 'Navigation', 0),
(5, 'Content', 0),
(6, 'Commerce', 0),
(7, 'Sushi', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_comments`
--

CREATE TABLE `g6vz_comments` (
  `id` int(11) NOT NULL,
  `thread` int(11) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'site_content',
  `createdby` int(11) NOT NULL DEFAULT '0',
  `updatedby` int(11) NOT NULL DEFAULT '0',
  `deletedby` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `rawcontent` text NOT NULL,
  `content` text NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedon` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deletedon` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(16) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_comments_extended_fields`
--

CREATE TABLE `g6vz_comments_extended_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_comments_guests`
--

CREATE TABLE `g6vz_comments_guests` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_comments_lastview`
--

CREATE TABLE `g6vz_comments_lastview` (
  `context` varchar(255) NOT NULL,
  `thread` int(11) NOT NULL,
  `last_comment` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_comments_rating`
--

CREATE TABLE `g6vz_comments_rating` (
  `comment` int(11) NOT NULL,
  `like` int(11) NOT NULL,
  `dislike` int(11) NOT NULL,
  `rating` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_comments_rating_log`
--

CREATE TABLE `g6vz_comments_rating_log` (
  `comment` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `vote` varchar(7) NOT NULL,
  `ip` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `createdon` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_comments_stat`
--

CREATE TABLE `g6vz_comments_stat` (
  `context` varchar(255) NOT NULL,
  `thread` int(11) NOT NULL,
  `last_comment` int(11) NOT NULL,
  `comments_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_comments_subscriptions`
--

CREATE TABLE `g6vz_comments_subscriptions` (
  `context` varchar(255) NOT NULL,
  `thread` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_comments_tree`
--

CREATE TABLE `g6vz_comments_tree` (
  `idAncestor` int(11) NOT NULL,
  `idDescendant` int(11) NOT NULL,
  `idNearestAncestor` int(11) NOT NULL,
  `level` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_commerce_currency`
--

CREATE TABLE `g6vz_commerce_currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(8) NOT NULL,
  `value` float NOT NULL DEFAULT '1',
  `left` varchar(8) NOT NULL,
  `right` varchar(8) NOT NULL,
  `decimals` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `decsep` varchar(8) NOT NULL,
  `thsep` varchar(8) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `default` tinyint(1) UNSIGNED NOT NULL,
  `lang` varchar(8) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `g6vz_commerce_currency`
--

INSERT INTO `g6vz_commerce_currency` (`id`, `title`, `code`, `value`, `left`, `right`, `decimals`, `decsep`, `thsep`, `active`, `default`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Рубль', 'RUB', 1, '', ' руб.', 2, ',', ' ', 1, 1, '', NULL, NULL),
(2, 'Доллар', 'USD', 1, '$', '', 2, '.', '', 1, 0, '', '2020-04-13 11:55:57', '2020-04-13 14:56:51');

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_commerce_orders`
--

CREATE TABLE `g6vz_commerce_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `lang` varchar(32) NOT NULL,
  `fields` text,
  `status_id` tinyint(3) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_commerce_order_history`
--

CREATE TABLE `g6vz_commerce_order_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `notify` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_commerce_order_payments`
--

CREATE TABLE `g6vz_commerce_order_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `paid` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `hash` varchar(128) NOT NULL,
  `payment_method` varchar(255) NOT NULL DEFAULT '',
  `original_order_id` varchar(255) NOT NULL DEFAULT '',
  `meta` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_commerce_order_products`
--

CREATE TABLE `g6vz_commerce_order_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `count` float UNSIGNED NOT NULL DEFAULT '1',
  `options` text,
  `meta` text,
  `position` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_commerce_order_statuses`
--

CREATE TABLE `g6vz_commerce_order_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `notify` tinyint(1) UNSIGNED NOT NULL,
  `default` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `g6vz_commerce_order_statuses`
--

INSERT INTO `g6vz_commerce_order_statuses` (`id`, `title`, `alias`, `notify`, `default`) VALUES
(1, 'Принят', 'priniat', 0, 1),
(2, 'В обработке', 'vobrabotke', 0, 0),
(3, 'К оплате', 'koplate', 0, 0),
(4, 'Оплачен', 'oplachen', 0, 0),
(5, 'Доставлен', 'dostavlen', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_documentgroup_names`
--

CREATE TABLE `g6vz_documentgroup_names` (
  `id` int(10) NOT NULL,
  `name` varchar(245) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for access permissions.';

--
-- Дамп данных таблицы `g6vz_documentgroup_names`
--

INSERT INTO `g6vz_documentgroup_names` (`id`, `name`, `private_memgroup`, `private_webgroup`) VALUES
(1, 'Site Admin Pages', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_document_groups`
--

CREATE TABLE `g6vz_document_groups` (
  `id` int(10) NOT NULL,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for access permissions.';

--
-- Дамп данных таблицы `g6vz_document_groups`
--

INSERT INTO `g6vz_document_groups` (`id`, `document_group`, `document`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_event_log`
--

CREATE TABLE `g6vz_event_log` (
  `id` int(11) NOT NULL,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Stores event and error logs';

--
-- Дамп данных таблицы `g6vz_event_log`
--

INSERT INTO `g6vz_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(1, 0, 1584439757, 3, 1, 0, 'Не удалена папка с файлами, использовавшимися в пр', 'Папка /install содержит инсталляционные файлы Evolution CMS. Злоумышленники могут воспользоваться этими файлами для взлома/повреждения сайта, так что лучше удалить папку с сервера.'),
(2, 0, 1584439968, 3, 1, 0, 'Не удалена папка с файлами, использовавшимися в пр', 'Папка /install содержит инсталляционные файлы Evolution CMS. Злоумышленники могут воспользоваться этими файлами для взлома/повреждения сайта, так что лучше удалить папку с сервера.'),
(3, 0, 1584440365, 3, 1, 0, 'Не удалена папка с файлами, использовавшимися в пр', 'Папка /install содержит инсталляционные файлы Evolution CMS. Злоумышленники могут воспользоваться этими файлами для взлома/повреждения сайта, так что лучше удалить папку с сервера.'),
(4, 0, 1584442682, 3, 1, 0, 'Не удалена папка с файлами, использовавшимися в пр', 'Папка /install содержит инсталляционные файлы Evolution CMS. Злоумышленники могут воспользоваться этими файлами для взлома/повреждения сайта, так что лучше удалить папку с сервера.'),
(5, 0, 1584454702, 3, 0, 1, 'Parser / syntax error, unexpected \'*\', expecting \'', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'*\', expecting \']\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>4</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:18:22</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.5398 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.5398 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(6, 0, 1584455235, 3, 0, 1, 'Parser / syntax error, unexpected \'!\', expecting \'', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'!\', expecting \']\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:27:15</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3638 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3638 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(7, 0, 1584455247, 3, 0, 1, 'Parser / syntax error, unexpected \'<\' (View: E:\\OS', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'<\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:27:27</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.2938 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.2938 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(8, 0, 1584455277, 3, 0, 1, 'Parser / syntax error, unexpected \'<\' (View: E:\\OS', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'<\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:27:57</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.2888 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.2888 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(9, 0, 1584455294, 3, 0, 1, 'Parser / syntax error, unexpected \'<\' (View: E:\\OS', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'<\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:28:14</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.4438 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.4438 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(10, 0, 1584455334, 3, 0, 1, 'Parser / syntax error, unexpected \'<\' (View: E:\\OS', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'<\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:28:54</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.2708 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.2708 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(11, 0, 1584455375, 3, 0, 1, 'Parser / syntax error, unexpected \'<\' (View: E:\\OS', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'<\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:29:35</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.4958 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.4958 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(12, 0, 1584455380, 3, 0, 1, 'Parser / syntax error, unexpected \'<\' (View: E:\\OS', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'<\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:29:40</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.2618 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.2618 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(13, 0, 1584455455, 3, 0, 1, 'Parser / syntax error, unexpected \'!\', expecting \'', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'!\', expecting \']\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:30:55</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3818 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3818 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(14, 0, 1584455480, 3, 0, 1, 'Parser / syntax error, unexpected \'!\', expecting \'', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'!\', expecting \']\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:31:20</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3198 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3198 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(15, 0, 1584455571, 3, 0, 1, 'Parser / syntax error, unexpected \'!\', expecting \'', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'!\', expecting \']\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:32:51</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3738 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3738 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(16, 0, 1584455631, 3, 0, 1, 'Parser - &lt;p&gt;&lt;?php echo evo_parser($docume', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><pre style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Use of undefined constant DocInfo - assumed \'DocInfo\' (this will throw an Error in a future version of PHP)</pre>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>&lt;p&gt;&lt;?php echo evo_parser($documentObject[\'content\'] [[DocInfo]]);?&gt;&lt;/p&gt;&lt;?php /**PATH E:\\OSPanel\\domains\\evo20\\views/test.blade.php ENDPATH**/ ?&gt;</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:33:51</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.2878 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.2878 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include</strong>(string $var1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 43</td>\n	</tr>\n</table>\n'),
(17, 0, 1584455683, 3, 0, 1, 'Parser / syntax error, unexpected \'$documentObject', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'$documentObject\' (T_VARIABLE), expecting \',\' or \')\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:34:43</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3288 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3288 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n');
INSERT INTO `g6vz_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(18, 0, 1584455760, 3, 0, 1, 'Parser / syntax error, unexpected \'$documentObject', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'$documentObject\' (T_VARIABLE), expecting \',\' or \')\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:36:00</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3368 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3368 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(19, 0, 1584455788, 3, 0, 1, 'Parser / syntax error, unexpected \'content\' (T_STR', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">syntax error, unexpected \'content\' (T_STRING), expecting \',\' or \')\' (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 14:36:28</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3168 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3168 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(20, 0, 1584458019, 3, 0, 1, 'Parser / Argument 1 passed to EvolutionCMS\\UrlProc', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">Argument 1 passed to EvolutionCMS\\UrlProcessor::makeUrl() must be of the type integer, string given, called in E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php on line 8 (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\src\\UrlProcessor.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>514</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 15:13:39</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.4488 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.4488 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>3.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(21, 0, 1584458041, 3, 0, 1, 'Parser / Argument 1 passed to EvolutionCMS\\UrlProc', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">Argument 1 passed to EvolutionCMS\\UrlProcessor::makeUrl() must be of the type integer, array given, called in E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php on line 8 (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\src\\UrlProcessor.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>514</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 15:14:01</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3748 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3748 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>3.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(22, 0, 1584458069, 3, 0, 1, 'Parser / Argument 1 passed to EvolutionCMS\\UrlProc', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">Argument 1 passed to EvolutionCMS\\UrlProcessor::makeUrl() must be of the type integer, string given, called in E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php on line 8 (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\src\\UrlProcessor.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>514</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 15:14:29</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3368 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3368 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>3.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(23, 0, 1584458080, 3, 0, 1, 'Parser / Argument 1 passed to EvolutionCMS\\UrlProc', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">Argument 1 passed to EvolutionCMS\\UrlProcessor::makeUrl() must be of the type integer, string given, called in E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\36a4f35e8963985a48f1ba4acfaa49b9a3b9e8d0.php on line 8 (View: E:\\OSPanel\\domains\\evo20\\views\\test.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\src\\UrlProcessor.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>514</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/testovaya-stranica-na-blejde.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[50] <a href=\"http://evo20/testovaya-stranica-na-blejde.html\" target=\"_blank\">Тестовая страница на блейде</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/blog/article-1126081344.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-03-17 15:14:40</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3308 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3308 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6244735717773 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->handleViewException</strong>(Symfony\\Component\\Debug\\Exception\\FatalThrowableError $var1, 1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 47</td>\n	</tr>\n</table>\n'),
(24, 0, 1586003633, 3, 0, 1, 'Parser -     &lt;?php $__currentLoopData = $crumbs', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><pre style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Invalid argument supplied for foreach()</pre>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\640732e4638a787acbc5a322a75be9a988a88113.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>    &lt;?php $__currentLoopData = $crumbs; $__env-&gt;addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env-&gt;incrementLoopIndices(); $loop = $__env-&gt;getLastLoop(); ?&gt;\r\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/sushi-ryazan/zakaz.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[52] <a href=\"http://evo20/sushi-ryazan/zakaz.html\" target=\"_blank\">Заказ</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evo20/manager/?a=27&amp;amp;r=1&amp;amp;id=52</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-04-04 12:33:53</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>64.6680 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>64.6680 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>5.6242980957031 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include</strong>(string $var1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 43</td>\n	</tr>\n</table>\n'),
(25, 0, 1586004626, 3, 0, 1, 'Parser -     &lt;?php $__currentLoopData = $crumbs', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><pre style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Invalid argument supplied for foreach()</pre>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\640732e4638a787acbc5a322a75be9a988a88113.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>    &lt;?php $__currentLoopData = $crumbs; $__env-&gt;addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env-&gt;incrementLoopIndices(); $loop = $__env-&gt;getLastLoop(); ?&gt;\r\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/sushi-ryazan/zakaz.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[52] <a href=\"http://evo20/sushi-ryazan/zakaz.html\" target=\"_blank\">Заказ</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-04-04 12:50:26</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>1.1480 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>1.1480 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>3.6244659423828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include</strong>(string $var1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 43</td>\n	</tr>\n</table>\n'),
(26, 0, 1586004689, 3, 0, 1, 'Parser -     &lt;?php $__currentLoopData = $crumbs', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><pre style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Invalid argument supplied for foreach()</pre>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\640732e4638a787acbc5a322a75be9a988a88113.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>    &lt;?php $__currentLoopData = $crumbs; $__env-&gt;addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env-&gt;incrementLoopIndices(); $loop = $__env-&gt;getLastLoop(); ?&gt;\r\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/sushi-ryazan/zakaz.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[52] <a href=\"http://evo20/sushi-ryazan/zakaz.html\" target=\"_blank\">Заказ</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-04-04 12:51:29</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3760 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3760 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>3.6243286132812 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include</strong>(string $var1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 43</td>\n	</tr>\n</table>\n'),
(27, 0, 1586004703, 3, 0, 1, 'Parser -     &lt;?php $__currentLoopData = $crumbs', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><pre style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Invalid argument supplied for foreach()</pre>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>E:\\OSPanel\\domains\\evo20\\core\\storage\\blade\\640732e4638a787acbc5a322a75be9a988a88113.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>6</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>    &lt;?php $__currentLoopData = $crumbs; $__env-&gt;addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env-&gt;incrementLoopIndices(); $loop = $__env-&gt;getLastLoop(); ?&gt;\r\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evo20/sushi-ryazan/zakaz.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[52] <a href=\"http://evo20/sushi-ryazan/zakaz.html\" target=\"_blank\">Заказ</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2020-04-04 12:51:43</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3470 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3470 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>3.6243286132812 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />index.php on line 130</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2784</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2904</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 143</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 59</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include</strong>(string $var1)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 43</td>\n	</tr>\n</table>\n');

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_jot_content`
--

CREATE TABLE `g6vz_jot_content` (
  `id` int(10) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tagid` varchar(50) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `uparent` int(10) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `flags` varchar(25) DEFAULT NULL,
  `secip` varchar(32) DEFAULT NULL,
  `sechash` varchar(32) DEFAULT NULL,
  `content` mediumtext,
  `customfields` mediumtext,
  `mode` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0',
  `publishedby` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `g6vz_jot_content`
--

INSERT INTO `g6vz_jot_content` (`id`, `title`, `tagid`, `published`, `uparent`, `parent`, `flags`, `secip`, `sechash`, `content`, `customfields`, `mode`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`) VALUES
(9, 'The first comment', '', 1, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'This is the first comment.', '<custom><name></name><email></email></custom>', 0, 0, 1160420310, 0, 0, 0, 0, 0, 0, 0),
(10, 'Second comment', '', 1, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'This is the second comment and uses an alternate row color. I also supplied a name, but i\'m not logged in.', '<custom><name>Armand</name><email></email></custom>', 0, 0, 1160420453, 0, 0, 0, 0, 0, 0, 0),
(11, 'No abuse', '', 1, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'Notice that I can\'t abuse <b>html</b>, ,  or [+placeholder+] tags.\r\n\r\nA new line also doesn\'t come unnoticed.', '<custom><name>Armand</name><email></email></custom>', 0, 0, 1160420681, 0, 0, 0, 0, 0, 0, 0),
(12, 'Posting when logged in', '', 1, 9, 0, '', '87.211.130.14', '58fade927c1df50ba6131f2b0e53c120', 'When you are logged in your own posts have a special color so you can easily spot them from the comment view. \r\n\r\nThe form also does not display any guest fields when logged in.', '<custom></custom>', 0, -1, 1160421310, 0, 0, 0, 0, 0, 0, 0),
(13, 'Managers', '', 1, 9, 0, '', '87.211.130.14', '91e230cf219e3ade10f32d6a41d0bd4d', 'Comments posted when only logged in as a manager user will use your manager name.\r\n\r\nModerators options are always shown when you are logged in as manager user.', '<custom></custom>', 0, 1, 1160421487, 0, 0, 0, 0, 0, 0, 0),
(14, 'Moderation', '', 1, 9, 0, '', '87.211.130.14', '58fade927c1df50ba6131f2b0e53c120', 'In this setup the Site Admins group is defined as being the moderator for this particular comment view. These users will have extra moderation options \r\n\r\nManager users, Moderators or Trusted users can post bad words like: dotNet.', '<custom></custom>', 0, -1, 1160422081, 0, 0, 0, 0, 0, 0, 0),
(15, 'I\'m untrusted', '', 0, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'Untrusted users however can NOT post bad words like: dotNet. When they do the posts will be unpublished.', '<custom><name></name><email></email></custom>', 0, 0, 1160422167, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_jot_subscriptions`
--

CREATE TABLE `g6vz_jot_subscriptions` (
  `id` mediumint(10) NOT NULL,
  `uparent` mediumint(10) NOT NULL DEFAULT '0',
  `tagid` varchar(50) NOT NULL DEFAULT '',
  `userid` mediumint(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_manager_log`
--

CREATE TABLE `g6vz_manager_log` (
  `id` int(10) NOT NULL,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(46) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains a record of user interaction.';

--
-- Дамп данных таблицы `g6vz_manager_log`
--

INSERT INTO `g6vz_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1, 1581677719, 1, 'admin_slava', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(2, 1581677724, 1, 'admin_slava', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(3, 1581677770, 1, 'admin_slava', 30, '-', '-', 'Saving settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(4, 1581677790, 1, 'admin_slava', 27, '4', 'Profile', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(5, 1581677895, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(6, 1581677966, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(7, 1581679917, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(8, 1581688019, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(9, 1581689683, 1, 'admin_slava', 78, '13', 'Comments', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(10, 1581689712, 1, 'admin_slava', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(11, 1581689730, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(12, 1581689769, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(13, 1581689775, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(14, 1581689791, 1, 'admin_slava', 78, '13', 'Comments', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(15, 1581689864, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(16, 1581689868, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(17, 1581689987, 1, 'admin_slava', 78, '14', 'ContactForm', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(18, 1581690046, 1, 'admin_slava', 27, '6', 'Contact Us', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(19, 1581724427, 1, 'admin_slava', 27, '6', 'Contact Us', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0'),
(20, 1584436702, 1, 'admin_slava', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(21, 1584436786, 1, 'admin_slava', 112, '2', 'Extras', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(22, 1584436975, 1, 'admin_slava', 76, '-', 'Extras', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(23, 1584436984, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(24, 1584437021, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(25, 1584437353, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(26, 1584437358, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(27, 1584437372, 1, 'admin_slava', 106, '-', '-', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(28, 1584437432, 1, 'admin_slava', 112, '3', 'Composer', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(29, 1584437500, 1, 'admin_slava', 112, '3', 'Composer', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(30, 1584437523, 1, 'admin_slava', 106, '-', '-', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(31, 1584439741, 1, 'admin_slava', 8, '-', 'Extras', 'Logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(32, 1584439753, 1, 'admin_slava', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(33, 1584439776, 1, 'admin_slava', 106, '-', '-', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(34, 1584439799, 1, 'admin_slava', 107, '-', 'Новый модуль', 'Create new module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(35, 1584439948, 1, 'admin_slava', 8, '-', '-', 'Logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(36, 1584439967, 1, 'admin_slava', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(37, 1584439985, 1, 'admin_slava', 106, '-', '-', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(38, 1584439989, 1, 'admin_slava', 107, '-', 'Новый модуль', 'Create new module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(39, 1584440103, 1, 'admin_slava', 8, '-', '-', 'Logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(40, 1584440364, 1, 'admin_slava', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(41, 1584440387, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(42, 1584440420, 1, 'admin_slava', 106, '-', '-', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(43, 1584440429, 1, 'admin_slava', 112, '2', 'Extras', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(44, 1584440559, 1, 'admin_slava', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(45, 1584442654, 1, 'admin_slava', 8, '-', '-', 'Logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(46, 1584442680, 1, 'admin_slava', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(47, 1584442804, 1, 'admin_slava', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(48, 1584442812, 1, 'admin_slava', 30, '-', '-', 'Saving settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(49, 1584442831, 1, 'admin_slava', 112, '2', 'Extras', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(50, 1584443034, 1, 'admin_slava', 8, '-', 'Extras', 'Logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(51, 1584443042, 1, 'admin_slava', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(52, 1584443064, 1, 'admin_slava', 112, '4', 'Comments', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(53, 1584443226, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(54, 1584443232, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(55, 1584443239, 1, 'admin_slava', 27, '9', 'Mini-Blog HOWTO', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(56, 1584443287, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(57, 1584443307, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(58, 1584443431, 1, 'admin_slava', 20, '4', 'Evolution CMS startup - Bootstrap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(59, 1584443432, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(60, 1584443775, 1, 'admin_slava', 20, '4', 'Evolution CMS startup - Bootstrap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(61, 1584443776, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(62, 1584443815, 1, 'admin_slava', 106, '-', '-', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(63, 1584443839, 1, 'admin_slava', 112, '4', 'Comments', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(64, 1584443851, 1, 'admin_slava', 106, '-', '-', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(65, 1584444309, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(66, 1584444395, 1, 'admin_slava', 53, '-', '-', 'Viewing system info', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(67, 1584444620, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(68, 1584444629, 1, 'admin_slava', 22, '27', 'Comments', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(69, 1584445484, 1, 'admin_slava', 20, '4', 'Evolution CMS startup - Bootstrap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(70, 1584445485, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(71, 1584445574, 1, 'admin_slava', 20, '4', 'Evolution CMS startup - Bootstrap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(72, 1584445575, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(73, 1584445584, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(74, 1584445627, 1, 'admin_slava', 20, '4', 'Evolution CMS startup - Bootstrap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(75, 1584445628, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(76, 1584445637, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(77, 1584445804, 1, 'admin_slava', 20, '4', 'Evolution CMS startup - Bootstrap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(78, 1584445804, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(79, 1584445935, 1, 'admin_slava', 22, '26', 'CommentsForm', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(80, 1584446727, 1, 'admin_slava', 5, '9', 'Mini-Blog HOWTO', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(81, 1584446728, 1, 'admin_slava', 27, '9', 'Mini-Blog HOWTO', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(82, 1584446886, 1, 'admin_slava', 108, '4', 'Comments', 'Edit module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(83, 1584446984, 1, 'admin_slava', 112, '4', 'Comments', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(84, 1584447308, 1, 'admin_slava', 20, '4', 'Evolution CMS startup - Bootstrap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(85, 1584447309, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(86, 1584447702, 1, 'admin_slava', 53, '-', '-', 'Viewing system info', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(87, 1584447766, 1, 'admin_slava', 8, '-', '-', 'Logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(88, 1584448048, 1, 'admin_slava', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(89, 1584448069, 1, 'admin_slava', 53, '-', '-', 'Viewing system info', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(90, 1584448221, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(91, 1584448353, 1, 'admin_slava', 22, '27', 'Comments', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(92, 1584448365, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(93, 1584448404, 1, 'admin_slava', 22, '29', 'RecentComments', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(94, 1584448451, 1, 'admin_slava', 20, '4', 'Evolution CMS startup - Bootstrap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(95, 1584448453, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(96, 1584448493, 1, 'admin_slava', 20, '4', 'Evolution CMS startup - Bootstrap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(97, 1584448493, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(98, 1584448836, 1, 'admin_slava', 112, '3', 'Composer', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(99, 1584448842, 1, 'admin_slava', 112, '4', 'Comments', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(100, 1584449539, 1, 'admin_slava', 20, '4', 'Evolution CMS startup - Bootstrap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(101, 1584449541, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(102, 1584453381, 1, 'admin_slava', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(103, 1584453548, 1, 'admin_slava', 5, '-', 'Тестовая страница на блейде', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(104, 1584453578, 1, 'admin_slava', 27, '50', 'Тестовая страница на блейде', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(105, 1584453643, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(106, 1584453651, 1, 'admin_slava', 16, '3', 'Minimal Template', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(107, 1584453685, 1, 'admin_slava', 20, '3', 'Minimal Template', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(108, 1584453686, 1, 'admin_slava', 16, '3', 'Minimal Template', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(109, 1584454856, 1, 'admin_slava', 5, '50', 'Тестовая страница на блейде', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(110, 1584454857, 1, 'admin_slava', 27, '50', 'Тестовая страница на блейде', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(111, 1584530396, 1, 'admin_slava', 27, '50', 'Тестовая страница на блейде', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(112, 1584530853, 1, 'admin_slava', 22, '27', 'Comments', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(113, 1584702587, 1, 'admin_slava', 22, '27', 'Comments', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(114, 1584702600, 1, 'admin_slava', 112, '2', 'Extras', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(115, 1584865244, 1, 'admin_slava', 112, '2', 'Extras', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(116, 1584865778, 1, 'admin_slava', 106, '-', 'Extras', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(117, 1584865797, 1, 'admin_slava', 108, '5', 'Commerce', 'Edit module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(118, 1584865820, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(119, 1584952519, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(120, 1584952521, 1, 'admin_slava', 8, '-', '-', 'Logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(121, 1585490982, 1, 'admin_slava', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(122, 1585493206, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(123, 1585493217, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(124, 1585493228, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(125, 1585493329, 1, 'admin_slava', 27, '50', 'Тестовая страница на блейде', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(126, 1585493360, 1, 'admin_slava', 27, '50', 'Тестовая страница на блейде', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(127, 1585493381, 1, 'admin_slava', 16, '3', 'Minimal Template', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(128, 1585493665, 1, 'admin_slava', 20, '3', 'Minimal Template', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(129, 1585493667, 1, 'admin_slava', 16, '3', 'Minimal Template', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(130, 1585493709, 1, 'admin_slava', 20, '3', 'Minimal Template', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(131, 1585493710, 1, 'admin_slava', 16, '3', 'Minimal Template', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(132, 1585494071, 1, 'admin_slava', 19, '-', 'Новый шаблон', 'Creating a new template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(133, 1585494283, 1, 'admin_slava', 20, '-', 'sushi', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(134, 1585494284, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(135, 1585494334, 1, 'admin_slava', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(136, 1585494382, 1, 'admin_slava', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(137, 1585494384, 1, 'admin_slava', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(138, 1585494425, 1, 'admin_slava', 5, '-', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(139, 1585494426, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(140, 1585494445, 1, 'admin_slava', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(141, 1585494510, 1, 'admin_slava', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(142, 1585494511, 1, 'admin_slava', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(143, 1585494519, 1, 'admin_slava', 5, '-', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(144, 1585494519, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(145, 1585494532, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(146, 1585548128, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(147, 1585548463, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(148, 1585548469, 1, 'admin_slava', 27, '50', 'Тестовая страница на блейде', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(149, 1585548565, 1, 'admin_slava', 20, '5', 'sushi', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(150, 1585548567, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(151, 1585567211, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(152, 1585575086, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(153, 1585575103, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(154, 1585575305, 1, 'admin_slava', 19, '-', 'Новый шаблон', 'Creating a new template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(155, 1585575344, 1, 'admin_slava', 20, '-', 'sushi_cart', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(156, 1585575345, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(157, 1585575359, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(158, 1585575367, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(159, 1585575381, 1, 'admin_slava', 5, '52', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(160, 1585575382, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(161, 1585576059, 1, 'admin_slava', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(162, 1585666233, 1, 'admin_slava', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(163, 1585666282, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(164, 1585666330, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(165, 1585666388, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(166, 1585666496, 1, 'admin_slava', 20, '5', 'sushi', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(167, 1585666497, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(168, 1585666522, 1, 'admin_slava', 20, '5', 'sushi', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(169, 1585666523, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(170, 1585666569, 1, 'admin_slava', 20, '5', 'sushi', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(171, 1585666570, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(172, 1585666597, 1, 'admin_slava', 20, '5', 'sushi', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(173, 1585666598, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(174, 1585676135, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(175, 1585678548, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(176, 1585681197, 1, 'admin_slava', 106, '-', 'Comments', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(177, 1585681215, 1, 'admin_slava', 108, '4', 'Comments', 'Edit module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(178, 1585681232, 1, 'admin_slava', 109, '4', 'Comments', 'Saving module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(179, 1585681233, 1, 'admin_slava', 108, '4', 'Comments', 'Edit module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(180, 1585682018, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(181, 1585913635, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(182, 1585914219, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(183, 1585914245, 1, 'admin_slava', 112, '-', 'module from file', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(184, 1585914918, 1, 'admin_slava', 112, '-', 'module from file', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(185, 1585915253, 1, 'admin_slava', 112, '-', 'module from file', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(186, 1585915557, 1, 'admin_slava', 112, '-', 'module from file', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(187, 1585915586, 1, 'admin_slava', 112, '-', 'module from file', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(188, 1585916559, 1, 'admin_slava', 112, '-', 'module from file', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(189, 1585916972, 1, 'admin_slava', 27, '50', 'Тестовая страница на блейде', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(190, 1585921479, 1, 'admin_slava', 27, '50', 'Тестовая страница на блейде', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(191, 1585928277, 1, 'admin_slava', 16, '3', 'Minimal Template', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(192, 1585928307, 1, 'admin_slava', 20, '3', 'Minimal Template', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(193, 1585928311, 1, 'admin_slava', 16, '3', 'Minimal Template', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(194, 1585928865, 1, 'admin_slava', 5, '50', 'Тестовая страница на блейде', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(195, 1585928866, 1, 'admin_slava', 27, '50', 'Тестовая страница на блейде', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(196, 1585944331, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(197, 1585944399, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(198, 1585948229, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(199, 1585948354, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(200, 1585951288, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(201, 1585951427, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(202, 1585951461, 1, 'admin_slava', 27, '50', 'Тестовая страница на блейде', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(203, 1585951635, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(204, 1585951828, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(205, 1585952437, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(206, 1585952463, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(207, 1585952514, 1, 'admin_slava', 301, '1', 'Meta description', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(208, 1585952533, 1, 'admin_slava', 302, '1', 'Meta description', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(209, 1585952534, 1, 'admin_slava', 301, '1', 'Meta description', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(210, 1585952555, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(211, 1585952566, 1, 'admin_slava', 20, '5', 'sushi', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(212, 1585952567, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(213, 1585952582, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(214, 1585952590, 1, 'admin_slava', 20, '6', 'sushi_cart', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(215, 1585952591, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(216, 1585952607, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(217, 1585952665, 1, 'admin_slava', 27, '50', 'Тестовая страница на блейде', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(218, 1585952710, 1, 'admin_slava', 8, '-', '-', 'Logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(219, 1586004744, 1, 'admin_slava', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(220, 1586004787, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(221, 1586033853, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(222, 1586033900, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(223, 1586033980, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(224, 1586034005, 1, 'admin_slava', 19, '-', 'Новый шаблон', 'Creating a new template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(225, 1586034055, 1, 'admin_slava', 20, '-', 'blog', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(226, 1586034056, 1, 'admin_slava', 16, '7', 'blog', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(227, 1586034155, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(228, 1586034157, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(229, 1586034189, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(230, 1586034230, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(231, 1586034402, 1, 'admin_slava', 20, '7', 'blog', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(232, 1586034407, 1, 'admin_slava', 16, '7', 'blog', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(233, 1586034484, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(234, 1586034487, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(235, 1586034666, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(236, 1586034896, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(237, 1586034902, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(238, 1586035095, 1, 'admin_slava', 20, '4', 'Evolution CMS startup - Bootstrap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(239, 1586035096, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(240, 1586035635, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(241, 1586035665, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(242, 1586035672, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(243, 1586035674, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(244, 1586035774, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(245, 1586035787, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(246, 1586035817, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(247, 1586035896, 1, 'admin_slava', 16, '3', 'Minimal Template', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(248, 1586035964, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(249, 1586035974, 1, 'admin_slava', 27, '50', 'Тестовая страница на блейде', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(250, 1586036043, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(251, 1586036575, 1, 'admin_slava', 20, '4', 'Evolution CMS startup - Bootstrap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(252, 1586036576, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(253, 1586036652, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(254, 1586036811, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(255, 1586037521, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(256, 1586037561, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(257, 1586037561, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(258, 1586072851, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(259, 1586072930, 1, 'admin_slava', 16, '7', 'blog', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(260, 1586072942, 1, 'admin_slava', 20, '7', 'blog', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(261, 1586072943, 1, 'admin_slava', 16, '7', 'blog', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(262, 1586072975, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(263, 1586072981, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(264, 1586072982, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(265, 1586073808, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(266, 1586076220, 1, 'admin_slava', 20, '7', 'blog', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(267, 1586076223, 1, 'admin_slava', 16, '7', 'blog', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(268, 1586076241, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(269, 1586076250, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(270, 1586076251, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(271, 1586077034, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(272, 1586077098, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(273, 1586077165, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(274, 1586077172, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(275, 1586077173, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(276, 1586077195, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(277, 1586077204, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(278, 1586077205, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(279, 1586077322, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(280, 1586077323, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(281, 1586077416, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(282, 1586077417, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(283, 1586078750, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(284, 1586078757, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(285, 1586078943, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(286, 1586078961, 1, 'admin_slava', 27, '15', 'Evolution CMS Features', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(287, 1586078976, 1, 'admin_slava', 27, '15', 'Evolution CMS Features', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(288, 1586078983, 1, 'admin_slava', 5, '15', 'Evolution CMS Features', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(289, 1586078984, 1, 'admin_slava', 27, '15', 'Evolution CMS Features', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(290, 1586079020, 1, 'admin_slava', 27, '15', 'Evolution CMS Features', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(291, 1586079025, 1, 'admin_slava', 5, '15', 'Evolution CMS Features', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(292, 1586079026, 1, 'admin_slava', 27, '15', 'Evolution CMS Features', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(293, 1586079467, 1, 'admin_slava', 19, '-', 'Новый шаблон', 'Creating a new template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(294, 1586079492, 1, 'admin_slava', 20, '-', 'Home', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(295, 1586079493, 1, 'admin_slava', 16, '8', 'Home', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(296, 1586079525, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(297, 1586079535, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(298, 1586079543, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(299, 1586079548, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(300, 1586079550, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(301, 1586079599, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(302, 1586079950, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(303, 1586079951, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(304, 1586080582, 1, 'admin_slava', 8, '-', '-', 'Logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(305, 1586080612, 1, 'admin_slava', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(306, 1586080620, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(307, 1586080642, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(308, 1586080648, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(309, 1586080649, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(310, 1586080673, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(311, 1586080679, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(312, 1586080680, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0');
INSERT INTO `g6vz_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(313, 1586084381, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(314, 1586084382, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(315, 1586084390, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(316, 1586084396, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(317, 1586084397, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(318, 1586084628, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(319, 1586084636, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(320, 1586084637, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(321, 1586084690, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(322, 1586084691, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(323, 1586084821, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(324, 1586084822, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(325, 1586084835, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(326, 1586084836, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(327, 1586096048, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(328, 1586096049, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(329, 1586096957, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(330, 1586096958, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(331, 1586097006, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(332, 1586097007, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(333, 1586097068, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(334, 1586097069, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(335, 1586097370, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(336, 1586097371, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(337, 1586097558, 1, 'admin_slava', 5, '1', 'Home', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(338, 1586097559, 1, 'admin_slava', 27, '1', 'Home', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(339, 1586099856, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(340, 1586099934, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(341, 1586099935, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(342, 1586100054, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(343, 1586100054, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(344, 1586100295, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(345, 1586100295, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(346, 1586101187, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(347, 1586101189, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(348, 1586101679, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(349, 1586101680, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(350, 1586101707, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(351, 1586101708, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(352, 1586101900, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(353, 1586101901, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(354, 1586101989, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(355, 1586101990, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(356, 1586104489, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(357, 1586104493, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(358, 1586104908, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(359, 1586104909, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(360, 1586104976, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(361, 1586104978, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(362, 1586105057, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(363, 1586105057, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(364, 1586105229, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(365, 1586105230, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(366, 1586105295, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(367, 1586105296, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(368, 1586110671, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(369, 1586110854, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(370, 1586110866, 1, 'admin_slava', 16, '3', 'Minimal Template', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(371, 1586110876, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(372, 1586110882, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(373, 1586121974, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(374, 1586123239, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(375, 1586123240, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(376, 1586123346, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(377, 1586123347, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(378, 1586123365, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(379, 1586123366, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(380, 1586123416, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(381, 1586123417, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(382, 1586123736, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(383, 1586123737, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(384, 1586124059, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(385, 1586124060, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(386, 1586124126, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(387, 1586124127, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(388, 1586124252, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(389, 1586124253, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(390, 1586124283, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(391, 1586124284, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(392, 1586124352, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(393, 1586124353, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(394, 1586124434, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(395, 1586124435, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(396, 1586124464, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(397, 1586124465, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(398, 1586154681, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(399, 1586158730, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(400, 1586158799, 1, 'admin_slava', 5, '2', 'Blog', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(401, 1586158802, 1, 'admin_slava', 27, '2', 'Blog', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(402, 1586158835, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(403, 1586158906, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(404, 1586160335, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(405, 1586160338, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(406, 1586160384, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(407, 1586160386, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(408, 1586163986, 1, 'admin_slava', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(409, 1586164088, 1, 'admin_slava', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(410, 1586164090, 1, 'admin_slava', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(411, 1586164128, 1, 'admin_slava', 5, '-', 'Каталог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(412, 1586164129, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(413, 1586164173, 1, 'admin_slava', 5, '53', 'Каталог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(414, 1586164174, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(415, 1586164571, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(416, 1586164572, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(417, 1586164839, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(418, 1586164840, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(419, 1586165403, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(420, 1586176474, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(421, 1586176480, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(422, 1586180891, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(423, 1586180901, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(424, 1586183270, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(425, 1586183511, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(426, 1586183512, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(427, 1586184534, 1, 'admin_slava', 102, '16', 'Commerce', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(428, 1586184591, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(429, 1586184702, 1, 'admin_slava', 5, '52', 'Корзина Заказа', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(430, 1586184723, 1, 'admin_slava', 27, '52', 'Корзина Заказа', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(431, 1586184821, 1, 'admin_slava', 5, '52', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(432, 1586184822, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(433, 1586184842, 1, 'admin_slava', 5, '52', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(434, 1586184843, 1, 'admin_slava', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(435, 1586184901, 1, 'admin_slava', 5, '-', 'Корзина', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(436, 1586184903, 1, 'admin_slava', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(437, 1586184904, 1, 'admin_slava', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(438, 1586184924, 1, 'admin_slava', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(439, 1586185118, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(440, 1586185223, 1, 'admin_slava', 19, '-', 'Новый шаблон', 'Creating a new template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(441, 1586185313, 1, 'admin_slava', 20, '-', 'sushi_item', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(442, 1586185314, 1, 'admin_slava', 16, '9', 'sushi_item', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(443, 1586185802, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(444, 1586185806, 1, 'admin_slava', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(445, 1586185863, 1, 'admin_slava', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(446, 1586185864, 1, 'admin_slava', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(447, 1586185878, 1, 'admin_slava', 5, '-', 'Калифорния с угрём', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(448, 1586185878, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(449, 1586186011, 1, 'admin_slava', 5, '55', 'Калифорния с угрём', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(450, 1586186012, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(451, 1586186151, 1, 'admin_slava', 20, '9', 'sushi_item', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(452, 1586186152, 1, 'admin_slava', 16, '9', 'sushi_item', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(453, 1586186186, 1, 'admin_slava', 20, '9', 'sushi_item', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(454, 1586186187, 1, 'admin_slava', 16, '9', 'sushi_item', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(455, 1586186210, 1, 'admin_slava', 20, '9', 'sushi_item', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(456, 1586186211, 1, 'admin_slava', 16, '9', 'sushi_item', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(457, 1586189267, 1, 'admin_slava', 103, '16', 'Commerce', 'Saving plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(458, 1586189270, 1, 'admin_slava', 102, '16', 'Commerce', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0'),
(459, 1586338881, 1, 'admin_slava', 102, '16', 'Commerce', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(460, 1586339101, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(461, 1586339113, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(462, 1586339114, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(463, 1586339769, 1, 'admin_slava', 301, '4', 'Meta title', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(464, 1586339821, 1, 'admin_slava', 302, '4', 'Meta title', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(465, 1586339822, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(466, 1586339836, 1, 'admin_slava', 301, '4', 'Meta title', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(467, 1586340043, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(468, 1586340045, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(469, 1586340154, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(470, 1586340179, 1, 'admin_slava', 301, '4', 'Meta title', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(471, 1586340335, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(472, 1586340336, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(473, 1586340762, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(474, 1586340792, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(475, 1586341253, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(476, 1586341674, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(477, 1586341826, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(478, 1586342774, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(479, 1586342878, 1, 'admin_slava', 301, '4', 'Meta title', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(480, 1586342924, 1, 'admin_slava', 302, '4', 'Meta title', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(481, 1586342926, 1, 'admin_slava', 301, '4', 'Meta title', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(482, 1586343155, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(483, 1586343156, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(484, 1586343210, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(485, 1586344368, 1, 'admin_slava', 302, '4', 'Meta title', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(486, 1586344369, 1, 'admin_slava', 301, '4', 'Meta title', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(487, 1586344381, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(488, 1586344391, 1, 'admin_slava', 301, '4', 'Meta title', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(489, 1586344756, 1, 'admin_slava', 301, '4', 'Meta title', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(490, 1586344781, 1, 'admin_slava', 302, '4', 'Meta title', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(491, 1586344782, 1, 'admin_slava', 301, '4', 'Meta title', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(492, 1586344880, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(493, 1586344881, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(494, 1586344902, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(495, 1586345333, 1, 'admin_slava', 302, '4', 'Meta title', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(496, 1586345335, 1, 'admin_slava', 301, '4', 'Meta title', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(497, 1586345353, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(498, 1586345550, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(499, 1586345552, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(500, 1586345566, 1, 'admin_slava', 302, '4', 'Meta title', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(501, 1586345569, 1, 'admin_slava', 301, '4', 'Meta title', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(502, 1586345728, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(503, 1586345730, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(504, 1586345763, 1, 'admin_slava', 5, '51', 'Суши Рязань', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(505, 1586345764, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(506, 1586349703, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(507, 1586417732, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(508, 1586501431, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(509, 1586503449, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(510, 1586515055, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(511, 1586590062, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(512, 1586606154, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(513, 1586630869, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(514, 1586638026, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(515, 1586680201, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(516, 1586689282, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(517, 1586766818, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(518, 1586767909, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(519, 1586767918, 1, 'admin_slava', 5, '52', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(520, 1586767920, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(521, 1586778628, 1, 'admin_slava', 22, '1', 'DLCrumbs', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(522, 1586778995, 1, 'admin_slava', 5, '52', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(523, 1586778997, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(524, 1586779065, 1, 'admin_slava', 5, '52', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(525, 1586779066, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(526, 1586779214, 1, 'admin_slava', 5, '52', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(527, 1586779215, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(528, 1586779332, 1, 'admin_slava', 5, '52', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(529, 1586779333, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(530, 1586779426, 1, 'admin_slava', 5, '52', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(531, 1586779427, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(532, 1586779502, 1, 'admin_slava', 5, '52', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(533, 1586779503, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(534, 1586786733, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(535, 1586786785, 1, 'admin_slava', 5, '52', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(536, 1586786786, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(537, 1586787096, 1, 'admin_slava', 5, '52', 'Заказ', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(538, 1586787097, 1, 'admin_slava', 27, '52', 'Заказ', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(539, 1586789278, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(540, 1586789324, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(541, 1586789343, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(542, 1586789479, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(543, 1586789508, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(544, 1586789518, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(545, 1586789552, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(546, 1586789556, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(547, 1586789572, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(548, 1586789587, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(549, 1586789602, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(550, 1586789620, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(551, 1586789635, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(552, 1586789639, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(553, 1586789657, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(554, 1586789661, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(555, 1586789673, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(556, 1586789735, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(557, 1586789758, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(558, 1586789765, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(559, 1586789784, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(560, 1586789789, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(561, 1586789812, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(562, 1586789855, 1, 'admin_slava', 102, '16', 'Commerce', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(563, 1586791707, 1, 'admin_slava', 22, '30', 'Cart', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(564, 1586819248, 1, 'admin_slava', 22, '30', 'Cart', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(565, 1586873209, 1, 'admin_slava', 22, '30', 'Cart', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(566, 1586938900, 1, 'admin_slava', 301, '3', 'No index page', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(567, 1586939065, 1, 'admin_slava', 302, '3', 'No index page', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(568, 1586939067, 1, 'admin_slava', 301, '3', 'No index page', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(569, 1586939106, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(570, 1586954175, 1, 'admin_slava', 16, '9', 'sushi_item', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(571, 1586954411, 1, 'admin_slava', 300, '-', 'Новый шаблон', 'Create Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(572, 1586954584, 1, 'admin_slava', 302, '-', 'Фото суши', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(573, 1586954586, 1, 'admin_slava', 300, '-', 'Новый шаблон', 'Create Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(574, 1586954646, 1, 'admin_slava', 302, '-', 'Описание товара', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(575, 1586954647, 1, 'admin_slava', 300, '-', 'Новый шаблон', 'Create Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(576, 1586954745, 1, 'admin_slava', 302, '-', 'Цена', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(577, 1586954746, 1, 'admin_slava', 300, '-', 'Новый шаблон', 'Create Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(578, 1586954925, 1, 'admin_slava', 302, '-', 'Вес/количество', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(579, 1586954931, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(580, 1586954979, 1, 'admin_slava', 112, '1', 'Doc Manager', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(581, 1586955120, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(582, 1586955176, 1, 'admin_slava', 301, '5', 'Фото суши', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(583, 1586955208, 1, 'admin_slava', 302, '5', 'Фото суши', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(584, 1586955209, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(585, 1586955266, 1, 'admin_slava', 16, '9', 'sushi_item', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(586, 1586955319, 1, 'admin_slava', 20, '9', 'sushi_item', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(587, 1586955321, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(588, 1586955461, 1, 'admin_slava', 16, '9', 'sushi_item', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(589, 1586955574, 1, 'admin_slava', 102, '16', 'Commerce', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(590, 1586955742, 1, 'admin_slava', 103, '16', 'Commerce', 'Saving plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(591, 1586955744, 1, 'admin_slava', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(592, 1586955771, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(593, 1586956867, 1, 'admin_slava', 5, '55', 'Калифорния с угрём', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(594, 1586956868, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(595, 1586957698, 1, 'admin_slava', 16, '4', 'Evolution CMS startup - Bootstrap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(596, 1586958762, 1, 'admin_slava', 5, '55', 'Калифорния с угрём', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(597, 1586958763, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(598, 1587018018, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(599, 1587026920, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(600, 1587291982, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(601, 1587360313, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(602, 1587364594, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(603, 1587369641, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(604, 1587369658, 1, 'admin_slava', 20, '6', 'sushi_cart', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(605, 1587369661, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(606, 1587369681, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(607, 1587369704, 1, 'admin_slava', 27, '51', 'Суши Рязань', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(608, 1587369723, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(609, 1587369733, 1, 'admin_slava', 20, '5', 'sushi', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(610, 1587369734, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(611, 1587369835, 1, 'admin_slava', 20, '5', 'sushi', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(612, 1587369836, 1, 'admin_slava', 16, '5', 'sushi', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(613, 1587374246, 1, 'admin_slava', 94, '55', 'Копия Калифорния с угрём', 'Duplicate resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(614, 1587374247, 1, 'admin_slava', 3, '56', 'Копия Калифорния с угрём', 'Viewing data for resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(615, 1587374298, 1, 'admin_slava', 27, '56', 'Копия Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(616, 1587374520, 1, 'admin_slava', 5, '56', 'Ясай (веган-ролл)', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(617, 1587374520, 1, 'admin_slava', 27, '56', 'Ясай (веган-ролл)', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(618, 1587380516, 1, 'admin_slava', 301, '7', 'Цена', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(619, 1587380578, 1, 'admin_slava', 20, '6', 'sushi_cart', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(620, 1587380580, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(621, 1587380657, 1, 'admin_slava', 5, '53', 'Каталог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(622, 1587380659, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(623, 1587406483, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(624, 1587412090, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(625, 1587452520, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(626, 1587463255, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0');
INSERT INTO `g6vz_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(627, 1587591689, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(628, 1587621546, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(629, 1587623268, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(630, 1587623297, 1, 'admin_slava', 27, '56', 'Ясай (веган-ролл)', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(631, 1587623366, 1, 'admin_slava', 5, '56', 'Ясай (веган-ролл)', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(632, 1587623368, 1, 'admin_slava', 27, '56', 'Ясай (веган-ролл)', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(633, 1587647947, 1, 'admin_slava', 27, '56', 'Ясай (веган-ролл)', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(634, 1587799588, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(635, 1587830766, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(636, 1587897139, 1, 'admin_slava', 5, '53', 'Каталог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(637, 1587897143, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(638, 1587897393, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(639, 1587897525, 1, 'admin_slava', 5, '53', 'Каталог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(640, 1587897526, 1, 'admin_slava', 27, '53', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(641, 1587901316, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(642, 1587901636, 1, 'admin_slava', 5, '55', 'Калифорния с угрём', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(643, 1587901637, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(644, 1587928024, 1, 'admin_slava', 88, '1', 'siteadmin', 'Editing web user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(645, 1587928089, 1, 'admin_slava', 99, '-', '-', 'Manage Web Users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(646, 1587928122, 1, 'admin_slava', 86, '-', '-', 'Role management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(647, 1587928371, 1, 'admin_slava', 35, '3', 'Publisher', 'Editing role', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(648, 1587970058, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(649, 1588018266, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(650, 1588069555, 1, 'admin_slava', 5, '55', 'Калифорния с угрём', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(651, 1588069561, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(652, 1588149372, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(653, 1588150530, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(654, 1588150570, 1, 'admin_slava', 112, '5', 'Commerce', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(655, 1588150600, 1, 'admin_slava', 102, '16', 'Commerce', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(656, 1588153342, 1, 'admin_slava', 5, '54', 'Корзина', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(657, 1588153343, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(658, 1588153439, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(659, 1588153469, 1, 'admin_slava', 20, '6', 'sushi_cart', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(660, 1588153470, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(661, 1588171016, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(662, 1588238537, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(663, 1588315727, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(664, 1588318178, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(665, 1588329600, 1, 'admin_slava', 20, '6', 'sushi_cart', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(666, 1588329606, 1, 'admin_slava', 16, '6', 'sushi_cart', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(667, 1588331969, 1, 'admin_slava', 5, '54', 'Корзина', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(668, 1588331970, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(669, 1588332762, 1, 'admin_slava', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(670, 1588332769, 1, 'admin_slava', 5, '54', 'Корзина', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(671, 1588332769, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(672, 1588332850, 1, 'admin_slava', 5, '54', 'Корзина', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(673, 1588332851, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(674, 1588353250, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(675, 1588372438, 1, 'admin_slava', 112, '2', 'Extras', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(676, 1588405914, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(677, 1588419241, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(678, 1588490088, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(679, 1588490221, 1, 'admin_slava', 27, '55', 'Калифорния с угрём', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(680, 1588519179, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(681, 1588524940, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(682, 1588612304, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(683, 1588623680, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(684, 1588666553, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0'),
(685, 1588701870, 1, 'admin_slava', 27, '54', 'Корзина', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0');

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_manager_users`
--

CREATE TABLE `g6vz_manager_users` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains login information for backend users.';

--
-- Дамп данных таблицы `g6vz_manager_users`
--

INSERT INTO `g6vz_manager_users` (`id`, `username`, `password`) VALUES
(1, 'admin_slava', '$P$BcMjj3ho0JTpphdOkkdOOA6eS22i5N/');

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_membergroup_access`
--

CREATE TABLE `g6vz_membergroup_access` (
  `id` int(10) NOT NULL,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_membergroup_names`
--

CREATE TABLE `g6vz_membergroup_names` (
  `id` int(10) NOT NULL,
  `name` varchar(245) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_member_groups`
--

CREATE TABLE `g6vz_member_groups` (
  `id` int(10) NOT NULL,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_rtss`
--

CREATE TABLE `g6vz_rtss` (
  `element` varchar(255) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'site_content',
  `settings` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `g6vz_rtss`
--

INSERT INTO `g6vz_rtss` (`element`, `context`, `settings`) VALUES
('CommentsForm', 'site_content', '{\"templatePath\":\"assets\\/snippets\\/Comments\\/tpl\\/\",\"templateExtension\":\"php\",\"formTpl\":\"@B_FILE:Forms\\/form\",\"disableSubmit\":1,\"disableGuests\":0,\"useCaptchaForGuestsOnly\":1,\"skipPrerender\":1,\"prerenderErrors\":1,\"rules\":{\"comment\":{\"required\":\"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442 \\u043a\\u043e\\u043c\\u043c\\u0435\\u043d\\u0442\\u0430\\u0440\\u0438\\u044f\"}},\"guestRules\":{\"name\":{\"required\":\"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u0432\\u0430\\u0448\\u0435 \\u0438\\u043c\\u044f\"},\"email\":{\"required\":\"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 e-mail\",\"email\":\"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 e-mail \\u043f\\u0440\\u0430\\u0432\\u0438\\u043b\\u044c\\u043d\\u043e\"},\"comment\":{\"required\":\"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442 \\u043a\\u043e\\u043c\\u043c\\u0435\\u043d\\u0442\\u0430\\u0440\\u0438\\u044f\"}},\"errorClass\":\" is-invalid\",\"requiredClass\":\" is-invalid\",\"errorTpl\":\"@CODE:<div class=\\\"invalid-feedback\\\">[+message+]<\\/div>\",\"filters\":{\"name\":[\"trim\",\"ucfirst\",\"removeExtraSpaces\",\"stripTags\"],\"email\":[\"trim\",\"email\"],\"comment\":[\"trim\",\"compressText\"]},\"rtssElement\":\"CommentsForm\",\"rtssIgnore\":\"api,disableSubmit\",\"context\":\"site_content\",\"moderation\":{\"formid\":\"moderation-form\",\"config\":\"moderation:assets\\/snippets\\/Comments\\/config\\/\"},\"config\":\"form:assets\\/snippets\\/Comments\\/config\\/\",\"dir\":\"assets\\/snippets\\/Comments\\/FormLister\\/\",\"controller\":\"Comments\",\"formid\":\"comments-form\",\"thread\":7}'),
('TreeViewComments', 'site_content', '{\"config\":\"comments:assets\\/snippets\\/Comments\\/config\\/\",\"dir\":\"assets\\/snippets\\/Comments\\/DocLister\\/\",\"controller\":\"TreeView\",\"thread\":1,\"templatePath\":\"assets\\/snippets\\/Comments\\/tpl\\/\",\"templateExtension\":\"php\",\"wrapTpl\":\"@B_FILE:TreeView\\/wrap\",\"tpl\":\"@B_FILE:TreeView\\/comment\",\"rtssElement\":\"TreeViewComments\",\"userType\":\"user\",\"userFields\":\"createdby,updatedby,deletedby\",\"disableGuests\":1,\"disableModeration\":0,\"moderatedByThreadCreator\":1,\"contextModel\":\"\\\\modResource\",\"threadCreatorField\":\"aid\",\"cacheKey\":\"site_content_1\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_content`
--

CREATE TABLE `g6vz_site_content` (
  `id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(245) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains the site document tree.';

--
-- Дамп данных таблицы `g6vz_site_content`
--

INSERT INTO `g6vz_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'Home', 'Welcome to Evolution CMS', 'Introduction to Evolution CMS', 'index', '', 1, 0, 0, 0, 0, 'Create and do amazing things with Evolution CMS', '<h3>Install successful!</h3>\r\n<p>You have successfully installed and configured Evolution CMS. We hope you find this site an adequate starting configuration for many small business, organization or personal websites; just change the template and content, and you\'ll be good to go! This site is preconfigured with a variety of options we hope are helpful, relevant and just plain cool for many marketing or personal sites:</p>\r\n<ul>\r\n<li><strong>Simple Blog.</strong> When logged into your site, you\'ll be able to create new entries from the front end. This can also be turned into a News publishing or PR publishing system. <a href=\"blog\">View example blog</a></li>\r\n<li><strong>Easy Comments.</strong> When logged into your site, your registered site users can comment on your posts. <a href=\"blog/article-1126081344\">View example</a></li>\r\n<li><strong>RSS Feeds.</strong> Your site visitors can stay up to date using your site feeds. <a href=\"feed.rss\">View RSS feed</a></li>\r\n<li><strong>Automatic User Registration.</strong> Those that wish to comment on blogs must first create an account. This comes pre-configured with a \"Captcha\" anti-robot registration feature. <a href=\"request-an-account\">View registration form</a></li>\r\n<li><strong>QuickEdit.</strong> When you\'re logged into the manager, you can edit a page directly from the front end! <a href=\"features/cms\">More about CMS features</a></li>\r\n<li><strong>Integrated Site Search.</strong> Allows visitors to search only the pages you wish them to search. Uses Ajax to display results without loading a new page.</li>\r\n<li><strong>Powerful Navigation Builder.</strong> Duplicate or build virtually any navigation system with our dynamic menu builder code. The menu above, for example. <a href=\"features/menus\">More about menu features</a></li>\r\n<li><strong>Ajax ready.</strong> You\'re on your way to Web 2.0 and AJAX goodness. <a href=\"features/ajax\">More about Ajax features</a></li>\r\n<li><strong>Custom \"page not found (404)\" page.</strong> Help visitors who go astray to find what they\'re looking for. <a href=\"doc-not-found\">View 404 page</a></li>\r\n<li><strong>Contact Us form.</strong> A highly configurable contact form you <em>should</em> customize to point to the right email address. Comes pre-configured to prevent mail-form-injection so your site does <em>not</em> become a source for spam. <a href=\"contact-us\">View form</a></li>\r\n<li><strong>Newest documents list.</strong> Shows your visitor the most recently added pages (configurable).</li>\r\n<li><strong>Customizable Content Manager.</strong> Preview uploaded images, hide or rename fields and lots more. See <a href=\"http://code.divandesign.biz/modx/managermanager\">ManagerManager\'s documentation</a> for details and instructions. <em>Quick start:</em> ManagerManager by default will look for \"rules\" in a Chunk named \"mm_rules\". Simply copy or rename the Chunk named \"mm_demo_rules\" to \"mm_rules\" and try it out!</li>\r\n<li><strong>phpThumb.</strong> Examples to use <a href=\"http://i--gu.ru/phpthumb\">phpThumb</a> to crop images.</li>\r\n</ul>\r\n<p>Full documentation can be found on the official <a href=\"http://www.evolution-docs.com/extras/\" target=\"_blank\" rel=\"noopener\">documentation site</a>.</p>\r\n<p><strong>To log into the Evolution CMS Control Panel and start customizing this site, point your browser to <a href=\"manager\">/manager/</a>.</strong></p>', 1, 8, 0, 1, 1, 1, 1144904400, 1, 1586097557, 0, 0, 0, 0, 0, 'Home', 0, 0, 0, 0, 0, 1),
(2, 'document', 'text/html', 'Blog', 'My Blog', '', 'my-blog', '', 1, 0, 0, 0, 1, '', '[[DocLister? \r\n	&jotcount=`1`\r\n	&parents=`2` \r\n	&display=`2`\r\n	&tvPrefix=``\r\n	&tvList=`image`\r\n	&prepare=`prepareBlog`\r\n	&summary=`notags,len:350` \r\n	&tpl=`@CODE:\r\n		<div class=\"dl_summaryPost\">\r\n			[+blog-image+]	\r\n			<h3><a href=\"[~[+id+]~]\" title=\"[+e.title+]\">[+e.title+]</a></h3>\r\n			<div class=\"dl_info\">\r\n				By <strong>[+author+]</strong> on [+date+].\r\n				<a href=\"[+url+]#commentsAnchor\">Comments <span class=\"badge\">[+jotcount+]</span></a>\r\n			</div>\r\n			[+summary+]\r\n			<p class=\"dl_link\">[+link+]</p>\r\n		</div>` \r\n	&paginate=`1` \r\n]]\r\n\r\n<p>Showing <strong>[+current+]</strong> of <strong>[+totalPages+]</strong> Pages</p>\r\n<div id=\"dl_pages\">[+pages+]</div>\r\n<p>&nbsp;</p>', 0, 4, 1, 0, 1, 1, 1144904400, 1, 1586158796, 0, 0, 0, 0, 0, 'Blog', 0, 0, 0, 0, 0, 1),
(4, 'document', 'text/html', 'Profile', 'User profile', '', 'profile', '', 1, 0, 0, 0, 1, '', '[!FormLister?\n&formid=`login`\n&controller=`Login`\n&loginField=`email`\n&redirectTo=`49`\n&defaults=`{\"rememberme\":1}`\n&formControls=`rememberme`\n&rules=`{\n	\"email\":{\n		\"required\":\"Enter your Email\",\n                \"email\":\"You should enter correct Email\"\n	},\n	\"password\":{\n		\"required\":\"Enter your password\"\n	}\n}`\n&formTpl=`@CODE:\n\n<p>In order to comment on blog entries, you must be a registered user of [(site_name)]. If you haven\'t already registered, you can <a href=\"[~5~]\">request an account</a>.</p>\n\n<form class=\"form-horizontal\" method=\"post\" action=\"[(site_url)][~[*id*]~]\">\n	[+form.messages+]\n	<input type=\"hidden\" name=\"formid\" value=\"login\">\n	<div class=\"form-group [+email.classname+] row\">\n		<div class=\"col-sm-12\">\n			<label for=\"email\">Email:</label>\n			<input class=\"form-control\" name=\"email\" value=\"[+email.value+]\" id=\"email\" placeholder=\"Email\">\n		</div>\n	</div>\n	<div class=\"form-group [+password.classname+]\">\n		<div class=\"col-sm-12\">\n			<label for=\"password\">Password:</label>\n			<input type=\"password\" class=\"form-control\" name=\"password\" id=\"password\" placeholder=\"Password\" value=\"[+password.value+]\">\n		</div>\n	</div>\n	<div class=\"form-group\">\n		<div class=\"col-sm-12\">\n			<div class=\"checkbox\">\n				<label>\n					<input type=\"checkbox\" name=\"rememberme\" value=\"1\" [+c.rememberme.1+]> Remember me\n				</label>\n			</div>\n		</div>\n	</div>\n	<div class=\"form-group\">\n		<div class=\"col-sm-8 col-xs-8 sign-in-block\">\n			<a href=\"[~37~]\">Forgot Password</a>\n		</div>\n		<div class=\"col-sm-4 col-xs-4 login-button\">\n			<button type=\"submit\" class=\"btn btn-primary pull-right\"><i class=\"glyphicon glyphicon-log-in\"></i> Login</button>\n		</div>\n	</div>\n	\n</form>\n`\n&skipTpl=`@CODE:\n	<div class=\"text-center\">Hello!</div>\n	<div class=\"text-center\">\n		<a class=\"btn btn-primary\" href=\"[~49~]\"> Edit profile</a> \n		<a class=\"btn btn-primary\" href=\"?logout\"> Logout</a>\n	</div>`\n&errorTpl=`@CODE:<p>[+message+]</p>`\n&messagesOuterTpl=`@CODE:\n	<div class=\"text-danger\">[+messages+]</div>`\n&errorClass=` has-error` \n&requiredClass=` has-warning`\n!]', 0, 4, 6, 0, 1, 1, 1144904400, 1, 1533412259, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0),
(5, 'document', 'text/html', 'Request an Account', 'Sign Up for Full Site Privileges', '', 'request-an-account', '', 1, 0, 0, 4, 0, '', '  [!FormLister?\n	&formid=`registerForm`\n	&controller=`Register`\n	&requiredClass=`has-warning`\n	&errorClass=`has-error`\n	&errorTpl=`@CODE:<small class=\"help-block\">[+message+]</small>`\n	&allowedFields=`email,username,fullname,country`\n	&rules=`{\n		\"username\":{\n			\"required\":\"Enter your username\",\n			\"alphaNumeric\":\"Only letters and numbers\",\n			\"custom\":{\n				\"function\":\"\\\\FormLister\\\\Register::uniqueUsername\",\n				\"message\":\"Name already taken\"\n			}\n		},\n		\"email\":{\n			\"required\":\"Enter email\",\n			\"email\":\"Incorrect email\",\n			\"custom\":{\n				\"function\":\"\\\\FormLister\\\\Register::uniqueEmail\",\n				\"message\":\"This email is already in use by another user\"\n			}\n		},\n		\"password\":{\n			\"required\":\"Enter password\"\n		},\n		\"repeatPassword\":{\n			\"required\":\"Retype password\",\n			\"equals\":{\n				\"message\":\"Passwords do not match\"\n			}\n		}\n	}`\n	&captcha=`modxCaptcha`\n	&formTpl=`@CODE: \n\n<form role=\"form\" id=\"websignupfrm\" method=\"post\" name=\"websignupfrm\" action=\"[+action+]\">\n	<input type=\"hidden\" name=\"formid\" value=\"registerForm\"/>\n    <h3>User Details</h3>\n	<div class=\"alert alert-warning\">\n		<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n		Items marked by * are required\n	</div>\n	\n	<div class=\"form-group [+username.classname+]\">\n		<label class=\"control-label\" for=\"su_username\">User name:*</label> \n		<input type=\"text\" name=\"username\" id=\"su_username\" class=\"form-control\" maxlength=\"30\" value=\"[+username.value+]\" placeholder=\"Enter Username\"/>\n		[+username.error+]\n	</div>\n	\n	<div class=\"form-group [+fullname.classname+]\">\n        <label class=\"control-label\" for=\"fullname\">Full name:</label> \n		<input type=\"text\" name=\"fullname\" id=\"fullname\" class=\"form-control\" maxlength=\"100\" value=\"[+fullname.value+]\" placeholder=\"Enter fullname\"/>\n		[+fullname.error+]\n	</div>\n	\n	<div class=\"form-group  [+email.classname+]\">\n		<label class=\"control-label\" for=\"email\">Email address:*</label> \n		<input type=\"text\" name=\"email\" id=\"email\" class=\"form-control\" value=\"[+email.value+]\" placeholder=\"Enter email\"/>\n		[+email.error+]\n	</div>\n\n	<div class=\"form-group [+password.classname+]\">\n	    <h3>Password</h3>\n	    <label class=\"control-label\" for=\"su_password\">Password:*</label> \n		<input type=\"password\" name=\"password\" id=\"su_password\" class=\"form-control\" placeholder=\"Enter password\"/>\n		[+password.error+]\n	</div>\n	<div class=\"form-group [+repeatPassword.classname+]\">\n	    <label class=\"control-label\" for=\"confirmpassword\">Confirm password:*</label> \n		<input type=\"password\" name=\"repeatPassword\" id=\"confirmpassword\" class=\"form-control\" placeholder=\"Confirm password\"/>\n		[+repeatPassword.error+]\n	</div>\n	\n	<div class=\"form-group [+country.classname+]\">\n		<h3>Optional Account Profile Info</h3>\n		<label class=\"control-label\" for=\"country\">Country:</label>\n		<select size=\"1\" name=\"country\" id=\"country\" class=\"form-control\" >\n			<option value=\"\" selected=\"selected\">&nbsp;</option>\n			<option value=\"1\">Afghanistan</option>\n			<option value=\"2\">Albania</option>\n			<option value=\"3\">Algeria</option>\n			<option value=\"4\">American Samoa</option>\n			<option value=\"5\">Andorra</option>\n			<option value=\"6\">Angola</option>\n			<option value=\"7\">Anguilla</option>\n			<option value=\"8\">Antarctica</option>\n			<option value=\"9\">Antigua and Barbuda</option>\n			<option value=\"10\">Argentina</option>\n			<option value=\"11\">Armenia</option>\n			<option value=\"12\">Aruba</option>\n			<option value=\"13\">Australia</option>\n			<option value=\"14\">Austria</option>\n			<option value=\"15\">Azerbaijan</option>\n			<option value=\"16\">Bahamas</option>\n			<option value=\"17\">Bahrain</option>\n			<option value=\"18\">Bangladesh</option>\n			<option value=\"19\">Barbados</option>\n			<option value=\"20\">Belarus</option>\n			<option value=\"21\">Belgium</option>\n			<option value=\"22\">Belize</option>\n			<option value=\"23\">Benin</option>\n			<option value=\"24\">Bermuda</option>\n			<option value=\"25\">Bhutan</option>\n			<option value=\"26\">Bolivia</option>\n			<option value=\"27\">Bosnia and Herzegowina</option>\n			<option value=\"28\">Botswana</option>\n			<option value=\"29\">Bouvet Island</option>\n			<option value=\"30\">Brazil</option>\n			<option value=\"31\">British Indian Ocean Territory</option>\n			<option value=\"32\">Brunei Darussalam</option>\n			<option value=\"33\">Bulgaria</option>\n			<option value=\"34\">Burkina Faso</option>\n			<option value=\"35\">Burundi</option>\n			<option value=\"36\">Cambodia</option>\n			<option value=\"37\">Cameroon</option>\n			<option value=\"38\">Canada</option>\n			<option value=\"39\">Cape Verde</option>\n			<option value=\"40\">Cayman Islands</option>\n			<option value=\"41\">Central African Republic</option>\n			<option value=\"42\">Chad</option>\n			<option value=\"43\">Chile</option>\n			<option value=\"44\">China</option>\n			<option value=\"45\">Christmas Island</option>\n			<option value=\"46\">Cocos (Keeling) Islands</option>\n			<option value=\"47\">Colombia</option>\n			<option value=\"48\">Comoros</option>\n			<option value=\"49\">Congo</option>\n			<option value=\"50\">Cook Islands</option>\n			<option value=\"51\">Costa Rica</option>\n			<option value=\"52\">Cote D&#39;Ivoire</option>\n			<option value=\"53\">Croatia</option>\n			<option value=\"54\">Cuba</option>\n			<option value=\"55\">Cyprus</option>\n			<option value=\"56\">Czech Republic</option>\n			<option value=\"57\">Denmark</option>\n			<option value=\"58\">Djibouti</option>\n			<option value=\"59\">Dominica</option>\n			<option value=\"60\">Dominican Republic</option>\n			<option value=\"61\">East Timor</option>\n			<option value=\"62\">Ecuador</option>\n			<option value=\"63\">Egypt</option>\n			<option value=\"64\">El Salvador</option>\n			<option value=\"65\">Equatorial Guinea</option>\n			<option value=\"66\">Eritrea</option>\n			<option value=\"67\">Estonia</option>\n			<option value=\"68\">Ethiopia</option>\n			<option value=\"69\">Falkland Islands (Malvinas)</option>\n			<option value=\"70\">Faroe Islands</option>\n			<option value=\"71\">Fiji</option>\n			<option value=\"72\">Finland</option>\n			<option value=\"73\">France</option>\n			<option value=\"74\">France, Metropolitan</option>\n			<option value=\"75\">French Guiana</option>\n			<option value=\"76\">French Polynesia</option>\n			<option value=\"77\">French Southern Territories</option>\n			<option value=\"78\">Gabon</option>\n			<option value=\"79\">Gambia</option>\n			<option value=\"80\">Georgia</option>\n			<option value=\"81\">Germany</option>\n			<option value=\"82\">Ghana</option>\n			<option value=\"83\">Gibraltar</option>\n			<option value=\"84\">Greece</option>\n			<option value=\"85\">Greenland</option>\n			<option value=\"86\">Grenada</option>\n			<option value=\"87\">Guadeloupe</option>\n			<option value=\"88\">Guam</option>\n			<option value=\"89\">Guatemala</option>\n			<option value=\"90\">Guinea</option>\n			<option value=\"91\">Guinea-bissau</option>\n			<option value=\"92\">Guyana</option>\n			<option value=\"93\">Haiti</option>\n			<option value=\"94\">Heard and Mc Donald Islands</option>\n			<option value=\"95\">Honduras</option>\n			<option value=\"96\">Hong Kong</option>\n			<option value=\"97\">Hungary</option>\n			<option value=\"98\">Iceland</option>\n			<option value=\"99\">India</option>\n			<option value=\"100\">Indonesia</option>\n			<option value=\"101\">Iran (Islamic Republic of)</option>\n			<option value=\"102\">Iraq</option>\n			<option value=\"103\">Ireland</option>\n			<option value=\"104\">Israel</option>\n			<option value=\"105\">Italy</option>\n			<option value=\"106\">Jamaica</option>\n			<option value=\"107\">Japan</option>\n			<option value=\"108\">Jordan</option>\n			<option value=\"109\">Kazakhstan</option>\n			<option value=\"110\">Kenya</option>\n			<option value=\"111\">Kiribati</option>\n			<option value=\"112\">Korea, Democratic People&#39;s Republic of</option>\n			<option value=\"113\">Korea, Republic of</option>\n			<option value=\"114\">Kuwait</option>\n			<option value=\"115\">Kyrgyzstan</option>\n			<option value=\"116\">Lao People&#39;s Democratic Republic</option>\n			<option value=\"117\">Latvia</option>\n			<option value=\"118\">Lebanon</option>\n			<option value=\"119\">Lesotho</option>\n			<option value=\"120\">Liberia</option>\n			<option value=\"121\">Libyan Arab Jamahiriya</option>\n			<option value=\"122\">Liechtenstein</option>\n			<option value=\"123\">Lithuania</option>\n			<option value=\"124\">Luxembourg</option>\n			<option value=\"125\">Macau</option>\n			<option value=\"126\">Macedonia, The Former Yugoslav Republic of</option>\n			<option value=\"127\">Madagascar</option>\n			<option value=\"128\">Malawi</option>\n			<option value=\"129\">Malaysia</option>\n			<option value=\"130\">Maldives</option>\n			<option value=\"131\">Mali</option>\n			<option value=\"132\">Malta</option>\n			<option value=\"133\">Marshall Islands</option>\n			<option value=\"134\">Martinique</option>\n			<option value=\"135\">Mauritania</option>\n			<option value=\"136\">Mauritius</option>\n			<option value=\"137\">Mayotte</option>\n			<option value=\"138\">Mexico</option>\n			<option value=\"139\">Micronesia, Federated States of</option>\n			<option value=\"140\">Moldova, Republic of</option>\n			<option value=\"141\">Monaco</option>\n			<option value=\"142\">Mongolia</option>\n			<option value=\"143\">Montserrat</option>\n			<option value=\"144\">Morocco</option>\n			<option value=\"145\">Mozambique</option>\n			<option value=\"146\">Myanmar</option>\n			<option value=\"147\">Namibia</option>\n			<option value=\"148\">Nauru</option>\n			<option value=\"149\">Nepal</option>\n			<option value=\"150\">Netherlands</option>\n			<option value=\"151\">Netherlands Antilles</option>\n			<option value=\"152\">New Caledonia</option>\n			<option value=\"153\">New Zealand</option>\n			<option value=\"154\">Nicaragua</option>\n			<option value=\"155\">Niger</option>\n			<option value=\"156\">Nigeria</option>\n			<option value=\"157\">Niue</option>\n			<option value=\"158\">Norfolk Island</option>\n			<option value=\"159\">Northern Mariana Islands</option>\n			<option value=\"160\">Norway</option>\n			<option value=\"161\">Oman</option>\n			<option value=\"162\">Pakistan</option>\n			<option value=\"163\">Palau</option>\n			<option value=\"164\">Panama</option>\n			<option value=\"165\">Papua New Guinea</option>\n			<option value=\"166\">Paraguay</option>\n			<option value=\"167\">Peru</option>\n			<option value=\"168\">Philippines</option>\n			<option value=\"169\">Pitcairn</option>\n			<option value=\"170\">Poland</option>\n			<option value=\"171\">Portugal</option>\n			<option value=\"172\">Puerto Rico</option>\n			<option value=\"173\">Qatar</option>\n			<option value=\"174\">Reunion</option>\n			<option value=\"175\">Romania</option>\n			<option value=\"176\">Russian Federation</option>\n			<option value=\"177\">Rwanda</option>\n			<option value=\"178\">Saint Kitts and Nevis</option>\n			<option value=\"179\">Saint Lucia</option>\n			<option value=\"180\">Saint Vincent and the Grenadines</option>\n			<option value=\"181\">Samoa</option>\n			<option value=\"182\">San Marino</option>\n			<option value=\"183\">Sao Tome and Principe</option>\n			<option value=\"184\">Saudi Arabia</option>\n			<option value=\"185\">Senegal</option>\n			<option value=\"186\">Seychelles</option>\n			<option value=\"187\">Sierra Leone</option>\n			<option value=\"188\">Singapore</option>\n			<option value=\"189\">Slovakia (Slovak Republic)</option>\n			<option value=\"190\">Slovenia</option>\n			<option value=\"191\">Solomon Islands</option>\n			<option value=\"192\">Somalia</option>\n			<option value=\"193\">South Africa</option>\n			<option value=\"194\">South Georgia and the South Sandwich Islands</option>\n			<option value=\"195\">Spain</option>\n			<option value=\"196\">Sri Lanka</option>\n			<option value=\"197\">St. Helena</option>\n			<option value=\"198\">St. Pierre and Miquelon</option>\n			<option value=\"199\">Sudan</option>\n			<option value=\"200\">Suriname</option>\n			<option value=\"201\">Svalbard and Jan Mayen Islands</option>\n			<option value=\"202\">Swaziland</option>\n			<option value=\"203\">Sweden</option>\n			<option value=\"204\">Switzerland</option>\n			<option value=\"205\">Syrian Arab Republic</option>\n			<option value=\"206\">Taiwan</option>\n			<option value=\"207\">Tajikistan</option>\n			<option value=\"208\">Tanzania, United Republic of</option>\n			<option value=\"209\">Thailand</option>\n			<option value=\"210\">Togo</option>\n			<option value=\"211\">Tokelau</option>\n			<option value=\"212\">Tonga</option>\n			<option value=\"213\">Trinidad and Tobago</option>\n			<option value=\"214\">Tunisia</option>\n			<option value=\"215\">Turkey</option>\n			<option value=\"216\">Turkmenistan</option>\n			<option value=\"217\">Turks and Caicos Islands</option>\n			<option value=\"218\">Tuvalu</option>\n			<option value=\"219\">Uganda</option>\n			<option value=\"220\">Ukraine</option>\n			<option value=\"221\">United Arab Emirates</option>\n			<option value=\"222\">United Kingdom</option>\n			<option value=\"223\">United States</option>\n			<option value=\"224\">United States Minor Outlying Islands</option>\n			<option value=\"225\">Uruguay</option>\n			<option value=\"226\">Uzbekistan</option>\n			<option value=\"227\">Vanuatu</option>\n			<option value=\"228\">Vatican City State (Holy See)</option>\n			<option value=\"229\">Venezuela</option>\n			<option value=\"230\">Viet Nam</option>\n			<option value=\"231\">Virgin Islands (British)</option>\n			<option value=\"232\">Virgin Islands (U.S.)</option>\n			<option value=\"233\">Wallis and Futuna Islands</option>\n			<option value=\"234\">Western Sahara</option>\n			<option value=\"235\">Yemen</option>\n			<option value=\"236\">Yugoslavia</option>\n			<option value=\"237\">Zaire</option>\n			<option value=\"238\">Zambia</option>\n			<option value=\"239\">Zimbabwe</option>\n			</select>\n			[+country.error+]\n     </div>\n        \n     <div class=\"form-group [+vericode.classname+]\">\n            <h3>Bot-Patrol</h3>\n            <p>Enter the word/number combination shown in the image below.</p>\n		 	\n            <p><a href=\"[+action+]\"><img align=\"top\" src=\"[+captcha+]\" width=\"148\" height=\"60\" alt=\"If you have trouble reading the code, click on the code itself to generate a new random code.\" style=\"border: 1px solid #039\" /></a></p>\n        <label class=\"control-label\">Form code:* \n        <input type=\"text\" name=\"vericode\" class=\"form-control\" size=\"20\" /></label>\n		 [+vericode.error+]\n     </div>\n        \n     <div class=\"form-group\">\n         <input type=\"submit\" class=\"btn btn-success btn-lg\" value=\"Submit\" name=\"cmdwebsignup\" />\n	 </div>\n\n</form>\n\n<script language=\"javascript\" type=\"text/javascript\"> \n	var id = \"[+country.value+]\";\n	var f = document.websignupfrm;\n	var i = parseInt(id);	\n	if (!isNaN(i)) f.country.options[i].selected = true;\n</script>\n\n	`\n	&successTpl=`@CODE:\n		<p class=\"message\">Signup completed successfully!<br />\n		Your account was created. A copy of your signup information was sent to your email address.</p>\n	`\n	&subject=`New registration, [(site_name)]`\n	&ccSender=`1`\n	&ccSenderTpl=`@CODE:\n		<h3>[+fullname.value+], signup completed successfully!</h3>\n		Login: [+email.value+]<br>\n		Password: [+user.password+]<br>\n	`\n	!]', 0, 4, 1, 0, 1, 1, 1144904400, 1, 1515584252, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(6, 'document', 'text/html', 'Contact Us', 'Contact [(site_name)]', '', 'contact-us', '', 1, 0, 0, 0, 0, '', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m16!1m10!1m3!1d3352.3801198226956!2d-96.80891138449205!3d32.8355068809543!2m1!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x864e9eee5c9601d9%3A0x5b1cf098be385cee!2s25+Highland+Park+Village+%23100%2C+Dallas%2C+TX+75205%2C+USA!5e0!3m2!1sde!2sde!4v1457530640363\" width=\"100%\" height=\"240\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>\n\n\n<div id=\"ajaxForm\">\n	{{ContactForm}}\n</div>\n<script type=\"text/javascript\">\n	//see plugin evoAjax\n	 $(document).on(\'submit\',\'#ajaxForm form\',function(ev){\n        var frm = $(\'#ajaxForm form\');\n        $(\'#submit\').prop( \"disabled\", true );\n        $.ajax({\n            type: \'post\',\n            url: \'[(site_url)]feedbackajaxform\', \n            data: frm.serialize(),\n            success: function (data) {\n   				$(\'#ajaxForm\').empty();\n                $(\'#ajaxForm\').html( data ); \n            }\n        });\n        ev.preventDefault();\n    });\n</script>', 0, 4, 5, 1, 1, 1, 1144904400, 1, 1507815490, 0, 0, 0, 0, 0, 'Contact us', 0, 0, 0, 0, 0, 1),
(7, 'document', 'text/html', '404 - Document Not Found', 'Uh oh ... it\'s a 404! (Page Not Found)', '', 'doc-not-found', '', 1, 0, 0, 0, 0, '', '<p>Looks like you tried to go somewhere that does not exist... perhaps you <a>need to login</a> or you\'d like one of the following pages instead:</p>\n<p>[[DLMenu? &amp;parents=`0`]]</p>\n<h3>Want to find it the old fashioned way? Use the site search at the top of this site to find what you seek.</h3>', 1, 4, 10, 0, 1, 1, 1144904400, 1, 1507728168, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(8, 'document', 'text/html', 'Search Results', 'Your Search Results', '', 'search-results', '', 1, 0, 0, 0, 0, '', '[!AjaxSearch? &showInputForm=`0` &ajaxSearch=`0`!]', 0, 4, 8, 0, 1, 1, 1144904400, 1, 1507728119, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 1, 1),
(9, 'document', 'text/html', 'Mini-Blog HOWTO', 'How to Start Posting with Evolution CMS Mini-Blogs', '', 'article-1126081344', '', 1, 0, 0, 2, 0, '', '<p>Setting up a mini-blog is relatively simple. Here\'s what you need to do to get started with making new posts:</p>\r\n<ol>\r\n<li>Login to the <a href=\"[(site_manager_url)]\">Evolution CMS Control Panel</a>.</li>\r\n<li>Press the plus-sign next to the Blog(2) container resource to see the blog entries posted there.</li>\r\n<li>To make a new Blog entry, simply right-click the Blog container document and choose the \"Create Resource here\" menu option. To edit an existing blog article, right click the entry and choose the \"Edit Resource\" menu option.</li>\r\n<!-- splitter -->\r\n<li>Write or edit the content and press save, making sure the document is published.</li>\r\n<li>Everything else is automatic; you\'re done!</li>\r\n<li>[!Comments!]<br /> &lt;div class=\"comments-form-wrap\"&gt;[!CommentsForm!]&lt;/div&gt;<br /> &lt;/div&gt;</li>\r\n</ol>', 1, 4, 0, 1, 1, -1, 1144904400, 1, 1584446724, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(11, 'document', 'application/rss+xml', 'RSS Feed', '[(site_name)] RSS Feed', '', 'feed.rss', '', 1, 0, 0, 0, 0, '', '<!--<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<rss version=\"2.0\">-->\n\n<channel>\n  <title>[(site_name)]</title>\n  <link>[(site_url)]</link>\n  <description>Evolution CMS demo site Feed</description>\n  [[DocLister? \n	&parents=`2`  \n	&display=`20`\n	&summary=`notags,len:350` \n	&tpl=`@CODE:<item>\n			<title>[+e.title+]</title>\n			<link>[(site_url)][~[+id+]~]</link>\n			<description><! [CDATA[ [+summary+] ] ]></description>\n			<pubDate>[+date+]</pubDate>\n			<guid isPermaLink=\"false\">[(site_url)][~[+id+]~]</guid>\n			<dc:creator>[+author+]</dc:creator>\n		</item>`\n	]]\n</channel>\n</rss>', 0, 0, 9, 0, 1, 1, 1144904400, 1, 1507728107, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(14, 'document', 'text/html', 'Content Management', 'Ways to manage content', '', 'cms', '', 1, 0, 0, 15, 0, '', '<h2>Manage your content in the backend</h2>\n<p>The Manager is a skinnable feature-packed tool for admin users. You can add extra users and limit what functions they can access. Evolution CMS\'s Manager makes creating content and managing templates and reusable elements easy. Modules can be added to work with other datasets or make management tasks easier.</p>\n<h2>Manage your content in the frontend</h2>\n<p>The QuickEdit bar lets manager users edit content whilst browsing the site. Most content fields and template variables can be edited quickly and easily.</p>\n<h2>Enable web users to add content</h2>\n<p>Custom data entry is easy to code using the Evolution CMS API - so you can design forms and collect whatever information you need.</p>', 1, 4, 3, 1, 1, 1, 1144904400, 1, 1378086298, 0, 0, 0, 1378086298, 1, 'Manage Content', 0, 0, 0, 0, 0, 1),
(15, 'document', 'text/html', 'Evolution CMS Features', 'Evolution CMS Features', '', 'features', '', 1, 0, 0, 0, 1, '', '<p>[[Wayfinder?startId=`[*id*]` &amp;outerClass=`topnav`]]</p>', 1, 4, 2, 1, 1, 1, 1144904400, 1, 1586079023, 0, 0, 0, 1144777367, 1, 'Features', 0, 0, 0, 0, 0, 1),
(16, 'document', 'text/html', 'Ajax', 'Ajax and Web 2.0 ready', '', 'ajax', '', 1, 1159264800, 0, 15, 0, '', '<p><b>Ajax ready out-of-the-box</b></p>\n<p>Evolution CMS empowers users to build engaging sites today, with its pre-integrated <a href=\"http://jquery.com/\" target=\"_blank\" rel=\"noopener\">jQuery</a> javascript library.</p>\n<p>Check out the Ajax-powered search in this example site. The libraries are also used with QuickEdit, our front-end editing tool.</p>\n<p>Smart integration means the scripts are only included in the document head when needed - no unnecessary bloat on simple pages!</p>\n<p><b>Web 2.0 today</b></p>\n<p>Evolution CMS makes child\'s play of building content managed sites with validating, accessible CSS layouts - so web standards compliance is easy. (You can create a site with excessively nested tables too, if you really want to).</p>', 1, 4, 1, 1, 1, 1, 1144904400, 1, 1507726420, 0, 0, 0, 1159264800, 1, 'Ajax', 0, 0, 0, 0, 0, 1),
(18, 'document', 'text/html', 'Just a pretend, older post', 'This post should in fact be archived', '', 'article-1128398162', '', 1, 0, 0, 2, 0, '', '<p>Not so exciting, after all, eh?</p>', 1, 4, 2, 1, 1, -1, 1144904400, 1, 1509818884, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(22, 'document', 'text/html', 'Menus and Lists', 'Flexible Menus and Lists', '', 'menus', '', 1, 1159178400, 0, 15, 0, '', '<h2>Your documents - listed how you want them</h2>\n<p>Evolution CMS\'s document data structure has been designed to allow many different routines to redisplay the information in ways that suit your needs, such as a dynamic menu in your template.</p>\n<p>Since the last release of Evolution CMS, the community has produced many great snippets - reusable functions that you can call in your content or template. Two of the most widely useful are Ditto and Wayfinder.</p>\n<h2>Wayfinder - the menu builder</h2>\n<p>Allows you to template every part of the menu. On this site, Wayfinder is being used to generate the drop-down menus, but many types of menus and sitemaps are possible.</p>\n<h2>Ditto - the document lister</h2>\n<p>Uses include listing the most recent blog posts, producing a site map, listing related documents (using a TV filter) and generating an RSS feed. You could even write a menu with it. On this site, Ditto is being used for the blog posts list on the Blog page, and the list on the right of some templates.</p>\n<h2>Unlimited Customization</h2>\n<p>If you can\'t quite get your desired effect using templating and the many options of Ditto and Wayfinder, you can write your own routine, or look for other snippets in <a href=\"htts://extras.evo.im/\">the Evolution CMS repository</a>. Evolution CMS\'s fields for Menu Title, summaries, menu position etc can be used via the API to produce anything you can imagine.</p>', 1, 4, 2, 1, 1, 1, 1144904400, 1, 1160148522, 0, 0, 0, 0, 0, 'Menus and Lists', 0, 0, 0, 0, 0, 1),
(24, 'document', 'text/html', 'Extendable by design', 'Extendable by design', '', 'extendable', '', 1, 1159092732, 0, 15, 0, '', '<p>The Evolution CMS community has created many add-ons which can be found in the <a href=\"htts://extras.evo.im/\">Repository</a>, from image galleries and e-commerce to smaller utilities.</p>\n<h2>Template Variables with Bindings</h2>\n<p>TVs - Template Variables - are powerful extra fields that you can use with your documents. As an example of an advanced template element that returns a different thing dependent on code or data, we created an @BINDING for the name of the Login menu item. This changes the menu name from Login to Logout based on your logged in state. The @BINDING as follows was placed in the default value as: <code>@EVAL if ($modx-&gt;getLoginUserID()) return \'Logout\'; else return \'Login\';</code></p>\n<h2>Using jQuery-effects</h2>\n<p>We used some simple effects to highlight various things on the front/home page to demonstrate how easy it is to create a useful way to draw attention to things. To see them in action on the home page, click the Integrated Site Search, Related Links or Newest Documents headers.</p>\n<h2>Custom Forms</h2>\n<p>To demonstrate how to link to custom forms, we customized the calls to the Webuser Registration system and the Login system.</p>\n<h2>And more</h2>\n<p><strong>Rich Text Editor for blog entries.</strong> To make it easier to format blog posts with simple text formatting, we modified the blog to use a custom RTE-enabled Template Variable (TV).</p>\n<p><strong>Smart-Summary logic.</strong> When splitting the full blog/news posts you simply insert a \"&lt;!-- splitter --&gt;\" where you want the break to occur. In addition, if that leaves any important tags open, it will try to match them and close them so it doesn\'t mess up your site layout with unclosed OL, UL or DIV tags.</p>', 1, 4, 4, 1, 1, 2, 1144904400, 1, 1159309971, 0, 0, 0, 0, 0, 'Extendability', 0, 0, 0, 0, 0, 1),
(32, 'document', 'text/html', 'Design', 'Site Design', '', 'design', '', 1, 0, 0, 0, 0, '', '<h3>Credits</h3>\n<p>The Evolution CMS Starter-theme is&nbsp;based on Bootstrap 3.3.6 and made by graffx.nl and fuseit.de.</p>', 1, 4, 4, 1, 1, 2, 1144904400, 1, 1160112322, 0, 0, 0, 1144912754, 1, 'Design', 0, 0, 0, 0, 0, 1),
(33, 'document', 'text/html', 'Getting Help', 'Getting Help with Evolution CMS', '', 'getting-help', '', 1, 0, 0, 0, 0, '', '<p>The <a href=\"https://github.com/orgs/evolution-cms/teams/\" target=\"_blank\" rel=\"noopener\">team behind Evolution CMS</a> strives to constantly add to and refine the documentation to help you get up to speed with Evolution CMS:</p>\n<ul>\n<li>For basic instructions on integrating custom templates into Evolution CMS, please see the <a href=\"http://www.evolution-docs.com/documentation/designing/\" target=\"_blank\" rel=\"noopener\">Designer\'s Guide</a>.</li>\n<li>For an introduction to working in Evolution CMS from the content editors perspectve, see the <a href=\"http://www.evolution-docs.com/documentation/content-editing/\" target=\"_blank\" rel=\"noopener\">Content Editor\'s Guide</a>.</li>\n<li>For a detailed overview of the backend \"manager\" and setting up Users and Groups, please peruse the <a href=\"http://www.evolution-docs.com/documentation/administration/\" target=\"_blank\" rel=\"noopener\">Administration Guide</a>.</li>\n<li>For developers, architecture and API documentation can be found in the <a href=\"http://www.evolution-docs.com/documentation/developers-guide/\" target=\"_blank\" rel=\"noopener\">Developer\'s Guide</a>.</li>\n<li>And if someone has installed this site for you, but you\'re curious as to the steps they went through, please see the <a href=\"http://www.evolution-docs.com/documentation/getting-started/\" target=\"_blank\" rel=\"noopener\">Getting Started Guide</a>.</li>\n</ul>\n<p>And don\'t forget, you can always learn and ask questions at the <a href=\"http://forum.evolution-cms.com/\" target=\"_blank\" rel=\"noopener\">Evolution CMS forums</a>.</p>', 1, 4, 3, 1, 1, 2, 1144904400, 1, 1507728208, 0, 0, 0, 0, 0, 'Getting Help', 0, 0, 0, 0, 0, 1),
(37, 'document', 'text/html', 'Forgot Password', '', '', 'forgot-password', '', 1, 0, 0, 4, 0, '', '[!FormLister?\n&controller=`Reminder`\n&formid=`remind`\n&rules=`{\n	\"email\":{\n		\"required\":\"Be sure to enter email\",\n		\"email\":\"Enter email correctly\"\n	}\n}`\n&resetRules=`{\n	\"password\":{\n		\"required\":\"Be sure to enter the password\",\n		\"minLength\":{\n			\"params\":6,\n			\"message\":\"Password must be longer than 6 characters\"\n		}\n	},\n	\"repeatPassword\":{\n		\"required\":\"Repeat password\",\n		\"equals\":{\n			\"message\":\"Passwords do not match\"\n		}\n	}\n}`\n&formTpl=`@CODE:\n\n<div class=\"form-remind\">\n	[+form.messages+]\n	<h2 class=\"form-signin-heading\">[*pagetitle*]</h2>\n	<form method=\"post\">\n		<input type=\"hidden\" name=\"formid\" value=\"remind\">\n		<div class=\"form-group\">\n			<input type=\"text\" class=\"form-control\" id=\"email\" placeholder=\"Email\" name=\"email\" value=\"[+email.value+]\">\n			[+email.error+]\n		</div>\n\n		<div class=\"form-group\">\n			<button type=\"submit\" class=\"btn btn-primary\"><i class=\"glyphicon glyphicon-ok-sign\"></i> Submit</button>\n		</div>\n	</form>\n</div>`\n\n&resetTpl=`@CODE:\n<div class=\"form-remind\">\n	[+form.messages+]\n	<h2 class=\"form-signin-heading\">[*pagetitle*]</h2>\n	<form method=\"post\" class=\"\">\n		<input type=\"hidden\" name=\"formid\" value=\"remind\">\n		<div class=\"form-group\">\n			<input type=\"password\" class=\"form-control\" id=\"password1\" placeholder=\"New password\" name=\"password\" value=\"\">\n			[+password.error+]\n			<input type=\"password\" class=\"form-control\" id=\"password2\" placeholder=\"Repeat Password\" name=\"repeatPassword\" value=\"\">\n			[+repeatPassword.error+]\n		</div>\n		<div class=\"form-group\">\n			<button type=\"submit\" class=\"btn btn-primary\"><i class=\"glyphicon glyphicon-floppy-disk\"></i> Save</button>\n		</div>\n	</form>\n</div>\n`\n&messagesOuterTpl=`@CODE:<div class=\"alert alert-danger\" role=\"alert\">[+messages+]</div>`\n&successTpl=`@CODE:\n<div class=\"form-reg\">\n	<div class=\"text-center\">An email with the instructions has been sent to the email you specified when registering!</div>\n</div>`\n\n&subject=`Password recovery, [(site_name)]`\n&reportTpl=`@CODE:<p>To recover your password, click on the link <a href=\"[+reset.url+]\">[+reset.url+]</a></p>`\n&resetReportTpl=`@CODE:<p>Hello, [+fullname.value+]!</p><p>Your new password: [+newpassword+]</p>`\n&resetTo=`37`\n&redirectTo=`4`\n&errorTpl=`@CODE:<span class=\"help-block\">[+message+]</span>`\n!]', 0, 4, 2, 0, 1, 1, 1144904400, 1, 1509806093, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1),
(47, 'document', 'text/html', 'New documentation site: docs.evo.im', 'Multilingual documentation for Evolution CMS ', '', 'new-documentation-site-docs.evo.im', '', 1, 0, 0, 2, 0, 'You can get documentation here: http://docs.evo.im', '<p>You can get documentation here: <a href=\"http://docs.evo.im\">http://docs.evo.im</a></p>\n<h2>Evolution CMS Docs</h2>\n<p><em>Evolution CMS is a professional website development tool that allows you to manage content (and the site itself) absolutely 100%! This system is open source, and therefore free. Unlike most free CMS (English Content Management System) - on Evolution CMS you can build a site of any complexity, with almost any set of functions, and the system will not in any way influence your html code.</em></p>\n<h2>How to contribute</h2>\n<ol>\n<li>First of all, you must have an account on GitHub, if not - <a href=\"https://github.com/join\">then it\'s very simple</a>.</li>\n<li>Make a fork <a href=\"https://github.com/evolution-cms/docs/\">https://github.com/evolution-cms/docs/</a> to yourself by clicking the \"Fork\" button on the top right.</li>\n<li>Clone the repository to your disk and work with it locally, like everyone else (if you are a developer)</li>\n<li>If you are not a developer, you can simply edit the * .md files directly on GitHub.</li>\n<li>When you have done everything, you should <a href=\"https://help.github.com/articles/creating-a-pull-request\">make a \"Pull Request\"</a> and send it by sending changes to this repository.</li>\n</ol>', 1, 4, 2, 1, 1, 1, 1507724288, 1, 1509818879, 0, 0, 0, 1507724288, 1, '', 0, 0, 0, 0, 1, 1),
(48, 'document', 'text/xml', 'sitemap.xml', '', '', 'sitemap.xml', '', 1, 0, 0, 0, 0, '', '[[DLSitemap]]', 0, 0, 11, 1, 1, 1, 1507726985, 1, 1507727020, 0, 0, 0, 1507726985, 1, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `g6vz_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(49, 'document', 'text/html', 'Edit profile', 'User profile', '', 'editprofile', '', 1, 0, 0, 4, 0, '', '<a class=\"btn btn-primary\" href=\"?logout\"> Logout</a>\n  [!FormLister?\n	&formid=`registerForm`\n	&controller=`Profile`\n	&requiredClass=`has-warning`\n	&errorClass=`has-error`\n	&errorTpl=`@CODE:<small class=\"help-block\">[+message+]</small>`\n	&allowedFields=`email,username,fullname,country`\n	&rules=`{\n		\"username\":{\n			\"required\":\"Enter your username\",\n			\"alphaNumeric\":\"Only letters and numbers\",\n			\"custom\":{\n				\"function\":\"\\\\FormLister\\\\Register::uniqueUsername\",\n				\"message\":\"Name already taken\"\n			}\n		},\n		\"email\":{\n			\"required\":\"Enter email\",\n			\"email\":\"Incorrect email\",\n			\"custom\":{\n				\"function\":\"\\\\FormLister\\\\Register::uniqueEmail\",\n				\"message\":\"This email is already in use by another user\"\n			}\n		},\n		\"password\":{\n			\"required\":\"Enter password\"\n		},\n		\"repeatPassword\":{\n			\"required\":\"Retype password\",\n			\"equals\":{\n				\"message\":\"Passwords do not match\"\n			}\n		}\n	}`\n	&formTpl=`@CODE: \n\n<form role=\"form\" id=\"websignupfrm\" method=\"post\" name=\"websignupfrm\" action=\"[+action+]\">\n	<input type=\"hidden\" name=\"formid\" value=\"registerForm\"/>\n    <h3>User Details</h3>\n	\n	<div class=\"form-group [+username.classname+]\">\n		<label class=\"control-label\" for=\"su_username\">User name:</label> \n		<input type=\"text\" name=\"username\" id=\"su_username\" class=\"form-control\" maxlength=\"30\" value=\"[+username.value+]\" placeholder=\"Enter Username\"/>\n		[+username.error+]\n	</div>\n	\n	<div class=\"form-group [+fullname.classname+]\">\n        <label class=\"control-label\" for=\"fullname\">Full name:</label> \n		<input type=\"text\" name=\"fullname\" id=\"fullname\" class=\"form-control\" maxlength=\"100\" value=\"[+fullname.value+]\" placeholder=\"Enter fullname\"/>\n		[+fullname.error+]\n	</div>\n	\n	<div class=\"form-group  [+email.classname+]\">\n		<label class=\"control-label\" for=\"email\">Email address:</label> \n		<input type=\"text\" name=\"email\" id=\"email\" class=\"form-control\" value=\"[+email.value+]\" placeholder=\"Enter email\"/>\n		[+email.error+]\n	</div>\n\n	<div class=\"form-group [+password.classname+]\">\n	    <h3>Password</h3>\n	    <label class=\"control-label\" for=\"su_password\">Password:</label> \n		<input type=\"password\" name=\"password\" id=\"su_password\" class=\"form-control\" placeholder=\"Enter password\"/>\n		[+password.error+]\n	</div>\n	<div class=\"form-group [+repeatPassword.classname+]\">\n	    <label class=\"control-label\" for=\"confirmpassword\">Confirm password:</label> \n		<input type=\"password\" name=\"repeatPassword\" id=\"confirmpassword\" class=\"form-control\" placeholder=\"Confirm password\"/>\n		[+repeatPassword.error+]\n	</div>\n	\n	<div class=\"form-group [+country.classname+]\">\n		<h3>Optional Account Profile Info</h3>\n		<label class=\"control-label\" for=\"country\">Country:</label>\n		<select size=\"1\" name=\"country\" id=\"country\" class=\"form-control\" >\n			<option value=\"\" selected=\"selected\">&nbsp;</option>\n			<option value=\"1\">Afghanistan</option>\n			<option value=\"2\">Albania</option>\n			<option value=\"3\">Algeria</option>\n			<option value=\"4\">American Samoa</option>\n			<option value=\"5\">Andorra</option>\n			<option value=\"6\">Angola</option>\n			<option value=\"7\">Anguilla</option>\n			<option value=\"8\">Antarctica</option>\n			<option value=\"9\">Antigua and Barbuda</option>\n			<option value=\"10\">Argentina</option>\n			<option value=\"11\">Armenia</option>\n			<option value=\"12\">Aruba</option>\n			<option value=\"13\">Australia</option>\n			<option value=\"14\">Austria</option>\n			<option value=\"15\">Azerbaijan</option>\n			<option value=\"16\">Bahamas</option>\n			<option value=\"17\">Bahrain</option>\n			<option value=\"18\">Bangladesh</option>\n			<option value=\"19\">Barbados</option>\n			<option value=\"20\">Belarus</option>\n			<option value=\"21\">Belgium</option>\n			<option value=\"22\">Belize</option>\n			<option value=\"23\">Benin</option>\n			<option value=\"24\">Bermuda</option>\n			<option value=\"25\">Bhutan</option>\n			<option value=\"26\">Bolivia</option>\n			<option value=\"27\">Bosnia and Herzegowina</option>\n			<option value=\"28\">Botswana</option>\n			<option value=\"29\">Bouvet Island</option>\n			<option value=\"30\">Brazil</option>\n			<option value=\"31\">British Indian Ocean Territory</option>\n			<option value=\"32\">Brunei Darussalam</option>\n			<option value=\"33\">Bulgaria</option>\n			<option value=\"34\">Burkina Faso</option>\n			<option value=\"35\">Burundi</option>\n			<option value=\"36\">Cambodia</option>\n			<option value=\"37\">Cameroon</option>\n			<option value=\"38\">Canada</option>\n			<option value=\"39\">Cape Verde</option>\n			<option value=\"40\">Cayman Islands</option>\n			<option value=\"41\">Central African Republic</option>\n			<option value=\"42\">Chad</option>\n			<option value=\"43\">Chile</option>\n			<option value=\"44\">China</option>\n			<option value=\"45\">Christmas Island</option>\n			<option value=\"46\">Cocos (Keeling) Islands</option>\n			<option value=\"47\">Colombia</option>\n			<option value=\"48\">Comoros</option>\n			<option value=\"49\">Congo</option>\n			<option value=\"50\">Cook Islands</option>\n			<option value=\"51\">Costa Rica</option>\n			<option value=\"52\">Cote D&#39;Ivoire</option>\n			<option value=\"53\">Croatia</option>\n			<option value=\"54\">Cuba</option>\n			<option value=\"55\">Cyprus</option>\n			<option value=\"56\">Czech Republic</option>\n			<option value=\"57\">Denmark</option>\n			<option value=\"58\">Djibouti</option>\n			<option value=\"59\">Dominica</option>\n			<option value=\"60\">Dominican Republic</option>\n			<option value=\"61\">East Timor</option>\n			<option value=\"62\">Ecuador</option>\n			<option value=\"63\">Egypt</option>\n			<option value=\"64\">El Salvador</option>\n			<option value=\"65\">Equatorial Guinea</option>\n			<option value=\"66\">Eritrea</option>\n			<option value=\"67\">Estonia</option>\n			<option value=\"68\">Ethiopia</option>\n			<option value=\"69\">Falkland Islands (Malvinas)</option>\n			<option value=\"70\">Faroe Islands</option>\n			<option value=\"71\">Fiji</option>\n			<option value=\"72\">Finland</option>\n			<option value=\"73\">France</option>\n			<option value=\"74\">France, Metropolitan</option>\n			<option value=\"75\">French Guiana</option>\n			<option value=\"76\">French Polynesia</option>\n			<option value=\"77\">French Southern Territories</option>\n			<option value=\"78\">Gabon</option>\n			<option value=\"79\">Gambia</option>\n			<option value=\"80\">Georgia</option>\n			<option value=\"81\">Germany</option>\n			<option value=\"82\">Ghana</option>\n			<option value=\"83\">Gibraltar</option>\n			<option value=\"84\">Greece</option>\n			<option value=\"85\">Greenland</option>\n			<option value=\"86\">Grenada</option>\n			<option value=\"87\">Guadeloupe</option>\n			<option value=\"88\">Guam</option>\n			<option value=\"89\">Guatemala</option>\n			<option value=\"90\">Guinea</option>\n			<option value=\"91\">Guinea-bissau</option>\n			<option value=\"92\">Guyana</option>\n			<option value=\"93\">Haiti</option>\n			<option value=\"94\">Heard and Mc Donald Islands</option>\n			<option value=\"95\">Honduras</option>\n			<option value=\"96\">Hong Kong</option>\n			<option value=\"97\">Hungary</option>\n			<option value=\"98\">Iceland</option>\n			<option value=\"99\">India</option>\n			<option value=\"100\">Indonesia</option>\n			<option value=\"101\">Iran (Islamic Republic of)</option>\n			<option value=\"102\">Iraq</option>\n			<option value=\"103\">Ireland</option>\n			<option value=\"104\">Israel</option>\n			<option value=\"105\">Italy</option>\n			<option value=\"106\">Jamaica</option>\n			<option value=\"107\">Japan</option>\n			<option value=\"108\">Jordan</option>\n			<option value=\"109\">Kazakhstan</option>\n			<option value=\"110\">Kenya</option>\n			<option value=\"111\">Kiribati</option>\n			<option value=\"112\">Korea, Democratic People&#39;s Republic of</option>\n			<option value=\"113\">Korea, Republic of</option>\n			<option value=\"114\">Kuwait</option>\n			<option value=\"115\">Kyrgyzstan</option>\n			<option value=\"116\">Lao People&#39;s Democratic Republic</option>\n			<option value=\"117\">Latvia</option>\n			<option value=\"118\">Lebanon</option>\n			<option value=\"119\">Lesotho</option>\n			<option value=\"120\">Liberia</option>\n			<option value=\"121\">Libyan Arab Jamahiriya</option>\n			<option value=\"122\">Liechtenstein</option>\n			<option value=\"123\">Lithuania</option>\n			<option value=\"124\">Luxembourg</option>\n			<option value=\"125\">Macau</option>\n			<option value=\"126\">Macedonia, The Former Yugoslav Republic of</option>\n			<option value=\"127\">Madagascar</option>\n			<option value=\"128\">Malawi</option>\n			<option value=\"129\">Malaysia</option>\n			<option value=\"130\">Maldives</option>\n			<option value=\"131\">Mali</option>\n			<option value=\"132\">Malta</option>\n			<option value=\"133\">Marshall Islands</option>\n			<option value=\"134\">Martinique</option>\n			<option value=\"135\">Mauritania</option>\n			<option value=\"136\">Mauritius</option>\n			<option value=\"137\">Mayotte</option>\n			<option value=\"138\">Mexico</option>\n			<option value=\"139\">Micronesia, Federated States of</option>\n			<option value=\"140\">Moldova, Republic of</option>\n			<option value=\"141\">Monaco</option>\n			<option value=\"142\">Mongolia</option>\n			<option value=\"143\">Montserrat</option>\n			<option value=\"144\">Morocco</option>\n			<option value=\"145\">Mozambique</option>\n			<option value=\"146\">Myanmar</option>\n			<option value=\"147\">Namibia</option>\n			<option value=\"148\">Nauru</option>\n			<option value=\"149\">Nepal</option>\n			<option value=\"150\">Netherlands</option>\n			<option value=\"151\">Netherlands Antilles</option>\n			<option value=\"152\">New Caledonia</option>\n			<option value=\"153\">New Zealand</option>\n			<option value=\"154\">Nicaragua</option>\n			<option value=\"155\">Niger</option>\n			<option value=\"156\">Nigeria</option>\n			<option value=\"157\">Niue</option>\n			<option value=\"158\">Norfolk Island</option>\n			<option value=\"159\">Northern Mariana Islands</option>\n			<option value=\"160\">Norway</option>\n			<option value=\"161\">Oman</option>\n			<option value=\"162\">Pakistan</option>\n			<option value=\"163\">Palau</option>\n			<option value=\"164\">Panama</option>\n			<option value=\"165\">Papua New Guinea</option>\n			<option value=\"166\">Paraguay</option>\n			<option value=\"167\">Peru</option>\n			<option value=\"168\">Philippines</option>\n			<option value=\"169\">Pitcairn</option>\n			<option value=\"170\">Poland</option>\n			<option value=\"171\">Portugal</option>\n			<option value=\"172\">Puerto Rico</option>\n			<option value=\"173\">Qatar</option>\n			<option value=\"174\">Reunion</option>\n			<option value=\"175\">Romania</option>\n			<option value=\"176\">Russian Federation</option>\n			<option value=\"177\">Rwanda</option>\n			<option value=\"178\">Saint Kitts and Nevis</option>\n			<option value=\"179\">Saint Lucia</option>\n			<option value=\"180\">Saint Vincent and the Grenadines</option>\n			<option value=\"181\">Samoa</option>\n			<option value=\"182\">San Marino</option>\n			<option value=\"183\">Sao Tome and Principe</option>\n			<option value=\"184\">Saudi Arabia</option>\n			<option value=\"185\">Senegal</option>\n			<option value=\"186\">Seychelles</option>\n			<option value=\"187\">Sierra Leone</option>\n			<option value=\"188\">Singapore</option>\n			<option value=\"189\">Slovakia (Slovak Republic)</option>\n			<option value=\"190\">Slovenia</option>\n			<option value=\"191\">Solomon Islands</option>\n			<option value=\"192\">Somalia</option>\n			<option value=\"193\">South Africa</option>\n			<option value=\"194\">South Georgia and the South Sandwich Islands</option>\n			<option value=\"195\">Spain</option>\n			<option value=\"196\">Sri Lanka</option>\n			<option value=\"197\">St. Helena</option>\n			<option value=\"198\">St. Pierre and Miquelon</option>\n			<option value=\"199\">Sudan</option>\n			<option value=\"200\">Suriname</option>\n			<option value=\"201\">Svalbard and Jan Mayen Islands</option>\n			<option value=\"202\">Swaziland</option>\n			<option value=\"203\">Sweden</option>\n			<option value=\"204\">Switzerland</option>\n			<option value=\"205\">Syrian Arab Republic</option>\n			<option value=\"206\">Taiwan</option>\n			<option value=\"207\">Tajikistan</option>\n			<option value=\"208\">Tanzania, United Republic of</option>\n			<option value=\"209\">Thailand</option>\n			<option value=\"210\">Togo</option>\n			<option value=\"211\">Tokelau</option>\n			<option value=\"212\">Tonga</option>\n			<option value=\"213\">Trinidad and Tobago</option>\n			<option value=\"214\">Tunisia</option>\n			<option value=\"215\">Turkey</option>\n			<option value=\"216\">Turkmenistan</option>\n			<option value=\"217\">Turks and Caicos Islands</option>\n			<option value=\"218\">Tuvalu</option>\n			<option value=\"219\">Uganda</option>\n			<option value=\"220\">Ukraine</option>\n			<option value=\"221\">United Arab Emirates</option>\n			<option value=\"222\">United Kingdom</option>\n			<option value=\"223\">United States</option>\n			<option value=\"224\">United States Minor Outlying Islands</option>\n			<option value=\"225\">Uruguay</option>\n			<option value=\"226\">Uzbekistan</option>\n			<option value=\"227\">Vanuatu</option>\n			<option value=\"228\">Vatican City State (Holy See)</option>\n			<option value=\"229\">Venezuela</option>\n			<option value=\"230\">Viet Nam</option>\n			<option value=\"231\">Virgin Islands (British)</option>\n			<option value=\"232\">Virgin Islands (U.S.)</option>\n			<option value=\"233\">Wallis and Futuna Islands</option>\n			<option value=\"234\">Western Sahara</option>\n			<option value=\"235\">Yemen</option>\n			<option value=\"236\">Yugoslavia</option>\n			<option value=\"237\">Zaire</option>\n			<option value=\"238\">Zambia</option>\n			<option value=\"239\">Zimbabwe</option>\n			</select>\n			[+country.error+]\n     </div>\n      \n     <div class=\"form-group\">\n         <input type=\"submit\" class=\"btn btn-success btn-lg\" value=\"Submit\" name=\"cmdwebsignup\" />\n	 </div>\n\n</form>\n\n<script language=\"javascript\" type=\"text/javascript\"> \n	var id = \"[+country.value+]\";\n	var f = document.websignupfrm;\n	var i = parseInt(id);	\n	if (!isNaN(i)) f.country.options[i].selected = true;\n</script>\n\n	`!]\n', 0, 4, 0, 1, 1, 1, 1509808504, 1, 1509817993, 0, 0, 0, 1509808504, 1, '', 0, 0, 0, 0, 1, 1),
(50, 'document', 'text/html', 'Тестовая страница на блейде', 'Тест блед', 'Это оисание тестовой страницы', 'testovaya-stranica-na-blejde', '', 1, 0, 0, 0, 0, 'Аннотация к странице', '<h2>Ну здрасте....</h2>\r\n<p>Это тело статьи</p>', 1, 3, 11, 1, 1, 1, 1584453513, 1, 1585928863, 0, 0, 0, 1584453513, 1, 'Тетсовая меню', 0, 0, 0, 0, 0, 1),
(51, 'document', 'text/html', 'Суши Рязань', 'Бесплатная доставка роллов от портала «Еда в Рязани»', 'Просто описание ', 'sushi-ryazan', '', 1, 0, 0, 0, 1, 'Интротектс и всякое описание страницы', '<p>Контент главной</p>', 1, 5, 12, 1, 1, 1, 1585494423, 1, 1586345763, 0, 0, 0, 1585494423, 1, '', 0, 0, 0, 0, 0, 1),
(52, 'document', 'text/html', 'Заказ', 'Заказ суши', '', 'zakaz', '', 1, 0, 0, 51, 0, '', '<p>Заказ сиши</p>', 1, 6, 0, 1, 1, 1, 1585494518, 1, 1586787095, 0, 0, 0, 1585494518, 1, '', 0, 0, 0, 0, 0, 1),
(53, 'document', 'text/html', 'Каталог', '', '', 'catalogue', '', 1, 0, 0, 51, 1, '', '<p>КАталог контент!!!</p>\r\n<p>Cart</p>', 1, 5, 1, 1, 1, 1, 1586164123, 1, 1587897523, 0, 0, 0, 1586164123, 1, '', 0, 0, 0, 0, 0, 1),
(54, 'document', 'text/html', 'Корзина', ' Корзина заказа', '', 'cart', '', 1, 0, 0, 51, 0, '', '', 1, 6, 2, 1, 1, 1, 1586184900, 1, 1588332849, 0, 0, 0, 1586184900, 1, '', 0, 0, 0, 0, 0, 1),
(55, 'document', 'text/html', 'Калифорния с угрём', 'Калифорния с угрём', '', 'kaliforniya-s-ugryom', '', 1, 0, 0, 53, 0, '', '', 1, 9, 0, 1, 1, 1, 1586185876, 1, 1588069548, 0, 0, 0, 1586185876, 1, '', 0, 0, 0, 0, 0, 1),
(56, 'document', 'text/html', 'Ясай (веган-ролл)', 'Ясай (веган-ролл)', '', 'yasaj-vegan-roll', '', 1, 0, 0, 53, 0, '', '<p>Контент Ясай (веган-ролл)</p>', 1, 9, 0, 1, 1, 1, 1587374246, 1, 1587623363, 0, 0, 0, 1587623363, 1, '', 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_htmlsnippets`
--

CREATE TABLE `g6vz_site_htmlsnippets` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains the site chunks.';

--
-- Дамп данных таблицы `g6vz_site_htmlsnippets`
--

INSERT INTO `g6vz_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `editor_name`, `category`, `cache_type`, `snippet`, `locked`, `createdon`, `editedon`, `disabled`) VALUES
(1, 'header', 'sample header scripts', 0, 'none', 2, 0, '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=[(modx_charset)]\" /> \r\n<title>[*titl*]</title>\r\n[*noIndex*]\r\n<meta name=\"keywords\" content=\"[*keyw*]\" />\r\n<meta name=\"description\" content=\"[*desc*]\" />\r\n<base href=\"[(site_url)]\"/>\r\n', 0, 0, 0, 0),
(3, 'AjaxSearch_tplInput', 'Input-Form for AjaxSearch', 0, 'none', 1, 0, '[+as.showInputForm:is=`1`:then=`\n<form id=\"[+as.formId+]\" action=\"[+as.formAction+]\" method=\"post\">\n    [+as.showAsId:is=`1`:then=`<input type=\"hidden\" name=\"[+as.asName+]\" value=\"[+as.asId+]\" />`+]\n    <input type=\"hidden\" name=\"advsearch\" value=\"[+as.advSearch+]\" />\n	<div class=\"input-group\">\n		<input id=\"[+as.inputId+]\" class=\"form-control cleardefault\" type=\"text\" name=\"search\" value=\"[+as.inputValue+]\"[+as.inputOptions+] />\n		[+as.liveSearch:is=`0`:then=`\n		<span class=\"input-group-btn\">\n			<button class=\"btn btn-primary\" type=\"submit\"><i class=\"fa fa-search\"></i></button>	\n		</span>\n		`:else=`\n		<div class=\"input-group-addon\"><i class=\"fa fa-search\"></i></div>\n		`+]		\n	</div>\n</form>\n`+]\n[+as.showIntro:is=`1`:then=`\n<p class=\"ajaxSearch_intro\" id=\"ajaxSearch_intro\">[+as.introMessage+]</p>\n`+]', 0, 0, 0, 0),
(4, 'AjaxSearch_tplAjaxResult', 'Result Tpl for AjaxSearch', 0, 'none', 1, 0, '<div class=\"[+as.resultClass+]\">\n  <strong><a class=\"[+as.resultLinkClass+]\" href=\"[+as.resultLink+]\" title=\"[+as.longtitle+]\">[+as.pagetitle+]</a></strong>\n[+as.descriptionShow:is=`1`:then=`\n  <small><span class=\"[+as.descriptionClass+]\">[+as.description+]</span></small>\n`+]\n[+as.extractShow:is=`1`:then=`\n  <div class=\"[+as.extractClass+]\"><p>[+as.extract+]</p></div>\n`+]\n[+as.breadcrumbsShow:is=`1`:then=`\n  <span class=\"[+as.breadcrumbsClass+]\">[+as.breadcrumbs+]</span>\n`+]\n</div>', 0, 0, 0, 0),
(6, 'AjaxSearch_tplAjaxGrpResult', 'Grp Result Tpl for AjaxSearch', 0, 'none', 1, 0, '[+as.grpResultsDef:is=`1`:then=`\n<div id=\"[+as.grpResultId+]\" class=\"AS_ajax_grpResult\">\n[+as.headerGrpResult+]\n[+as.listResults+]\n[+as.footerGrpResult+]\n</div>\n`:else=`\n<div class=\"AS_ajax_grpResultName\">[+as.grpResultNameShow:is=`1`:then=`[+as.grpResultName+]`+]\n<span class=\"ajaxSearch_grpResultsDisplayed\">[+as.grpResultsDisplayedText+]</span></div>\n`+]', 0, 0, 0, 0),
(8, 'AjaxSearch_tplAjaxResults', 'Results Tpl for AjaxSearch', 0, 'none', 1, 0, '<div id=\"search_results\" class=\"modal fade\" tabindex=\"-1\" role=\"dialog\">\n  <div class=\"modal-dialog\">\n    <div class=\"modal-content\">\n      <div class=\"modal-header\">\n        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n        <h3 class=\"modal-title\">Search Results</h3>\n      </div>\n      <div class=\"modal-body\">\n        [+as.noResults:is=`1`:then=`\n		  <div class=\"[+as.noResultClass+]\">\n			[+as.noResultText+]\n		  </div>\n		`:else=`\n		<p class=\"AS_ajax_resultsInfos\">[+as.resultsFoundText+]<span class=\"AS_ajax_resultsDisplayed\">[+as.resultsDisplayedText+]</span></p>\n		[+as.listGrpResults+]\n		`+]\n		[+as.moreResults:is=`1`:then=`\n		  <div class=\"[+as.moreClass+]\">\n			<a href=\"[+as.moreLink+]\" title=\"[+as.moreTitle+]\">[+as.moreText+]</a>\n		  </div>\n		`+]\n		[+as.showCmt:is=`1`:then=`\n		[+as.comment+]\n		`+]\n      </div>\n      <div class=\"modal-footer\">\n        <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\">Close</button>\n      </div>\n    </div><!-- /.modal-content -->\n  </div><!-- /.modal-dialog -->\n</div><!-- /.modal -->\n<script>$(\'#search_results\').modal(\'show\')</script>', 0, 0, 0, 0),
(9, 'Comments_tplForm', 'Comments (Jot) Form-Template', 0, 'none', 1, 0, '<a name=\"jf[+jot.link.id+]\"></a>\n<h2>[+form.edit:is=`1`:then=`Edit comment`:else=`Write a comment`+]</h2>\n<div class=\"jot-list\">\n<ul>\n	<li>Required fields are marked with <b>*</b>.</li>\n</ul>\n</div>\n[+form.error:isnt=`0`:then=`\n<div class=\"jot-err\">\n[+form.error:select=`\n&-3=You are trying to re-submit the same post. You have probably clicked the submit button more than once.\n&-2=Your comment has been rejected.\n&-1=Your comment has been saved, it will first be reviewed before it is published.\n&1=You are trying to re-submit the same post. You have probably clicked the submit button more than once.\n&2=The security code you entered was incorrect.\n&3=You can only post once each [+jot.postdelay+] seconds.\n&4=Your comment has been rejected.\n&5=[+form.errormsg:ifempty=`You didn\'t enter all the required fields`+]\n`+]\n</div>\n`:strip+]\n[+form.confirm:isnt=`0`:then=`\n<div class=\"jot-cfm\">\n[+form.confirm:select=`\n&1=Your comment has been published.\n&2=Your comment has been saved, it will first be reviewed before it is published.\n&3=Comment saved.\n`+]\n</div>\n`:strip+]\n<form method=\"post\" action=\"[+form.action:esc+]#jf[+jot.link.id+]\" class=\"jot-form\">\n	<fieldset>\n	<input name=\"JotForm\" type=\"hidden\" value=\"[+jot.id+]\" />\n	<input name=\"JotNow\" type=\"hidden\" value=\"[+jot.seed+]\" />\n	<input name=\"parent\" type=\"hidden\" value=\"[+form.field.parent+]\" />\n	\n	[+form.moderation:is=`1`:then=`\n		<div class=\"jot-row\">\n			<b>Created on:</b> [+form.field.createdon:date=`%a %B %d, %Y at %H:%M`+]<br />\n			<b>Created by:</b> [+form.field.createdby:userinfo=`username`:ifempty=`[+jot.guestname+]`+]<br />\n			<b>IP address:</b> [+form.field.secip+]<br />\n			<b>Published:</b> [+form.field.published:select=`0=No&1=Yes`+]<br />\n			[+form.field.publishedon:gt=`0`:then=`\n				<b>Published on:</b> [+form.field.publishedon:date=`%a %B %d, %Y at %H:%M`+]<br />\n				<b>Published by:</b> [+form.field.publishedby:userinfo=`username`:ifempty=` - `+]<br />\n			`+]\n			[+form.field.editedon:gt=`0`:then=`\n				<b>Edited on:</b> [+form.field.editedon:date=`%a %B %d, %Y at %H:%M`+]<br />\n				<b>Edited by:</b> [+form.field.editedby:userinfo=`username`:ifempty=` -`+]<br />\n			`+]\n		</div>\n	`:strip+]\n	\n	[+form.guest:is=`1`:then=`\n		<div class=\"form-group\">\n			<label for=\"name[+jot.id+]\">Name:</label>\n			<input tabindex=\"[+jot.seed:math=`?+1`+]\" name=\"name\" class=\"form-control\" type=\"text\" size=\"40\" value=\"[+form.field.custom.name:esc+]\" id=\"name[+jot.id+]\" />\n		</div>\n		<div class=\"form-group\">\n			<label for=\"email[+jot.id+]\">Email:</label>\n			<input tabindex=\"[+jot.seed:math=`?+2`+]\" name=\"email\" class=\"form-control\" type=\"text\" size=\"40\" value=\"[+form.field.custom.email:esc+]\" id=\"email[+jot.id+]\"/>\n		</div>\n	`:strip+]\n	<div class=\"form-group\">\n		<label for=\"title[+jot.id+]\">Subject:</label>\n		<input tabindex=\"[+jot.seed:math=`?+3`+]\" name=\"title\" class=\"form-control\" type=\"text\" size=\"40\" value=\"[+form.field.title:esc+]\" id=\"title[+jot.id+]\"/>\n	</div>\n	<div class=\"form-group\">\n		<label for=\"content[+jot.id+]\">Comment: *</label>\n		<textarea tabindex=\"[+jot.seed:math=`?+4`+]\" name=\"content\" class=\"form-control\" rows=\"8\" id=\"content[+jot.id+]\">[+form.field.content:esc+]</textarea>\n	</div>\n	\n[+jot.captcha:is=`1`:then=`\n	<div style=\"width:150px;margin-top: 5px;margin-bottom: 5px;\">\n		<a href=\"[+jot.link.current:esc+]\">\n			<img src=\"[(modx_manager_url)]includes/veriword.php?rand=[+jot.seed+]\" width=\"148\" height=\"60\" alt=\"If you have trouble reading the code, click on the code itself to generate a new random code.\" style=\"border: 1px solid #003399\" />\n		</a>\n	</div>\n	<div class=\"form-group\">\n		<label for=\"vericode[+jot.id+]\">Help prevent spam - enter security code above:</label>\n		<input type=\"text\" name=\"vericode\" style=\"width:150px;\" size=\"20\" id=\"vericode[+jot.id+]\" />\n	</div>\n`:strip+]\n\n	<input tabindex=\"[+jot.seed:math=`?+5`+]\" name=\"submit\" class=\"btn btn-primary\" type=\"submit\" value=\"[+form.edit:is=`1`:then=`Save Comment`:else=`Post Comment`+]\" />\n	[+form.edit:is=`1`:then=`\n		<input tabindex=\"[+jot.seed:math=`?+5`+]\" name=\"submit\" class=\"btn btn-default\" type=\"submit\" value=\"Cancel\" onclick=\"history.go(-1);return false;\" />\n	`+] \n	</fieldset>\n</form>', 0, 0, 0, 0),
(13, 'Comments', 'Comments (JotX) showing beneath a blog entry.', 2, 'none', 1, 0, '<div id=\"commentsAnchor\">\n[[ifsnippet? &name=`JotX`]]	\n[!JotX? &customfields=`name,email` &subscribe=`1` &pagination=`4` &badwords=`dotNet` &canmoderate=`Site Admins` &tplForm=`Comments_tplForm` &tplComments=`Comments_tplComments`!]\n</div>', 0, 1507723259, 1509825745, 0),
(14, 'ContactForm', 'eForm-template for showing contact-form', 2, 'none', 1, 0, '<form id=\"EmailForm\">\n	<input type=\"hidden\" name=\"formid\" value=\"ContactForm\">\n	<p>[+form.messages+]</p>\n	<div class=\"form-group [+name.classname+]\">\n		<label for=\"cfName\">Your name:</label>\n		<input type=\"text\" class=\"form-control\" name=\"name\" id=\"cfName\" value=\"[+name.value+]\" placeholder=\"Your Name\"/>\n		<div class=\"invalid-feedback\">[+name.error+]</div>\n	</div>\n	<div class=\"form-group [+email.classname+]\">\n		<label for=\"cfEmail\">Your Email Address:</label>\n		<input type=\"text\" class=\"form-control\" name=\"email\" id=\"cfEmail\" value=\"[+email.value+]\" placeholder=\"Email Address\"/>\n		<div class=\"invalid-feedback\">[+email.error+]</div>\n	</div>\n	\n	<div class=\"form-group [+subject.classname+]\">\n		<label for=\"cfRegarding\">Regarding:</label>\n		<select class=\"form-control\" name=\"subject\" id=\"cfRegarding\">\n			<option value=\"General Inquiries\" [+s.subject.General Inquiries+] >General Inquiries</option>\n			<option value=\"Press\" [+s.subject.Press+] >Press or Interview Request</option>\n			<option value=\"Partnering\" [+s.subject.Partnering+] >Partnering Opportunities</option>\n		</select>\n		<div class=\"invalid-feedback\">[+subject.error+]</div>\n	</div>\n	\n	<div class=\"form-group [+message.classname+]\">\n		<label for=\"cfMessage\">Message:</label>\n		<textarea name=\"message\" id=\"cfMessage\" class=\"form-control\">[+message.value+]</textarea>\n		<div class=\"invalid-feedback\">[+message.error+]</div>\n	</div>\n	\n	<div class=\"form-group\">\n		<input type=\"submit\" name=\"contact\" id=\"submit\" class=\"btn btn-primary\" value=\"Send This Message\" />\n	</div>\n\n</form>', 0, 1507723259, 1507816800, 0),
(15, 'ContactFormReport', 'eForm-template for sending form-data by mail', 0, 'none', 1, 0, '<p>This is a response sent by <b>[+name+]</b> using the feedback form on the website. The details of the message follow below:</p>\n\n\n<p>Name: [+name+]</p>\n<p>Email: [+email+]</p>\n<p>Regarding: [+subject+]</p>\n<p>comments:<br />[+message+]</p>\n\n<p>You can use this link to reply: <a href=\"mailto:[+email+]?subject=RE: [+subject+]\">[+email+]</a></p>\n', 0, 1507723259, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_modules`
--

CREATE TABLE `g6vz_site_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Site Modules';

--
-- Дамп данных таблицы `g6vz_site_modules`
--

INSERT INTO `g6vz_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1, 'Doc Manager', '<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 3, 0, 0, '', 0, '', 0, 0, 'docman435243542tf542t5t', 1, '', ' \n/**\n * Doc Manager\n * \n * Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions\n * \n * @category	module\n * @version 	1.1\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal	@properties\n * @internal	@guid docman435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/docmanager/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  09/04/2016\n */\n\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/docmanager.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_frontend.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_backend.class.php\');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[\'theme\'] = $dm->getTheme();\n$dm->ph[\'ajax.endpoint\'] = MODX_SITE_URL.\'assets/modules/docmanager/tv.ajax.php\';\n$dm->ph[\'datepicker.offset\'] = $modx->config[\'datepicker_offset\'];\n$dm->ph[\'datetime.format\'] = $modx->config[\'datetime_format\'];\n\nif (isset($_POST[\'tabAction\'])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(\'main.tpl\', $dm->ph);\n}'),
(2, 'Extras', '<strong>0.1.3</strong> first repository for Evolution CMS', 0, 0, 3, 0, 0, '', 0, '', 0, 0, 'store435243542tf542t5t', 1, '', ' \r\n/**\r\n * Extras\r\n * \r\n * first repository for Evolution CMS\r\n * \r\n * @category	module\r\n * @version 	0.1.3\r\n * @internal	@properties\r\n * @internal	@guid store435243542tf542t5t	\r\n * @internal	@shareparams 1\r\n * @internal	@dependencies requires files located at /assets/modules/store/\r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @installset base, sample\r\n * @lastupdate  25/11/2016\r\n */\r\n\r\n//AUTHORS: Bumkaka & Dmi3yy \r\ninclude_once(\'../assets/modules/store/core.php\');'),
(3, 'Composer', '<strong>1</strong> Composer for Evolution CMS', 0, 0, 3, 0, 0, '', 0, '', 0, 0, 'com56po67ser435243542tf542t5t', 1, '', '//AUTHORS: Bumkaka & Dmi3yy \ninclude_once(\'../assets/modules/composer/init.php\');'),
(4, 'Comments', '<strong>1.3.0</strong> Comments management', 0, 1, 3, 0, 0, '', 0, '', 0, 1585681231, '', 0, '{}', 'include_once(MODX_BASE_PATH.\'assets/modules/Comments/index.php\');'),
(5, 'Commerce', '<strong>0.2.0</strong> Commerce solution', 0, 0, 6, 0, 0, '', 0, '', 0, 0, '', 0, '', 'if (!$modx->hasPermission(\'exec_module\')) {\n    $modx->sendRedirect(\'index.php?a=106\');\n}\n\nif (!is_array($modx->event->params)) {\n    $modx->event->params = [];\n}\n\nif (isset($_REQUEST[\'stay\'])) {\n    $_SESSION[\'stay\'] = $_REQUEST[\'stay\'];\n} else if (isset($_SESSION[\'stay\'])) {\n    $_REQUEST[\'stay\'] = $_SESSION[\'stay\'];\n}\n\n$stay = isset($_REQUEST[\'stay\']) ? $_REQUEST[\'stay\'] : \'\';\n\nglobal $content, $_style, $lastInstallTime;\n\nif (!isset($_COOKIE[\'MODX_themeMode\'])) {\n    $_COOKIE[\'MODX_themeMode\'] = \'\';\n}\n\n$language = $modx->getConfig(\'manager_language\');\n$_lang    = [];\n\ninclude MODX_MANAGER_PATH . \'includes/lang/\' . $language . \'.inc.php\';\n\n$manager = new Commerce\\Module\\Manager($modx, array_merge($modx->event->params, [\n    \'module_url\' => \'index.php?a=112&id=\' . $_GET[\'id\'],\n    \'stay\' => $stay,\n]));\n\n$route = filter_input(INPUT_GET, \'type\', FILTER_VALIDATE_REGEXP, [\'options\' => [\n    \'regexp\'  => \'/^[a-z]+(:?\\/[a-z-]+)*$/\',\n    \'default\' => \'\',\n]]);\n\nreturn $manager->processRoute($route);\n');

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_module_access`
--

CREATE TABLE `g6vz_site_module_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Module users group access permission';

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_module_depobj`
--

CREATE TABLE `g6vz_site_module_depobj` (
  `id` int(11) NOT NULL,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Module Dependencies';

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_plugins`
--

CREATE TABLE `g6vz_site_plugins` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains the site plugins.';

--
-- Дамп данных таблицы `g6vz_site_plugins`
--

INSERT INTO `g6vz_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`, `createdon`, `editedon`) VALUES
(1, 'CodeMirror', '<strong>1.5</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)', 0, 3, 0, '\r\n/**\r\n * CodeMirror\r\n *\r\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)\r\n *\r\n * @category    plugin\r\n * @version     1.5\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &darktheme=Dark Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;one-dark &fontSize=Font-size;list;10,11,12,13,14,15,16,17,18;14 &lineHeight=Line-height;list;1,1.1,1.2,1.3,1.4,1.5;1.3 &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\r\n * @internal    @installset base\r\n * @reportissues https://github.com/evolution-cms/evolution/issues/\r\n * @documentation Official docs https://codemirror.net/doc/manual.html\r\n * @author      hansek from http://www.modxcms.cz\r\n * @author      update Mihanik71\r\n * @author      update Deesen\r\n * @author      update 64j\r\n * @lastupdate  08-01-2018\r\n */\r\n\r\n$_CM_BASE = \'assets/plugins/codemirror/\';\r\n\r\n$_CM_URL = MODX_SITE_URL . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');\r\n', 0, '{\"theme\":[{\"label\":\"Theme\",\"type\":\"list\",\"value\":\"default\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"default\",\"desc\":\"\"}],\"darktheme\":[{\"label\":\"Dark Theme\",\"type\":\"list\",\"value\":\"one-dark\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"one-dark\",\"desc\":\"\"}],\"fontSize\":[{\"label\":\"Font-size\",\"type\":\"list\",\"value\":\"14\",\"options\":\"10,11,12,13,14,15,16,17,18\",\"default\":\"14\",\"desc\":\"\"}],\"lineHeight\":[{\"label\":\"Line-height\",\"type\":\"list\",\"value\":\"1.3\",\"options\":\"1,1.1,1.2,1.3,1.4,1.5\",\"default\":\"1.3\",\"desc\":\"\"}],\"indentUnit\":[{\"label\":\"Indent unit\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"tabSize\":[{\"label\":\"The width of a tab character\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"lineWrapping\":[{\"label\":\"lineWrapping\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"matchBrackets\":[{\"label\":\"matchBrackets\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"activeLine\":[{\"label\":\"activeLine\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"emmet\":[{\"label\":\"emmet\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"search\":[{\"label\":\"search\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"indentWithTabs\":[{\"label\":\"indentWithTabs\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"undoDepth\":[{\"label\":\"undoDepth\",\"type\":\"int\",\"value\":\"200\",\"default\":\"200\",\"desc\":\"\"}],\"historyEventDelay\":[{\"label\":\"historyEventDelay\",\"type\":\"int\",\"value\":\"1250\",\"default\":\"1250\",\"desc\":\"\"}]}', 0, '', 0, 0),
(2, 'ElementsInTree', '<strong>1.5.10</strong> Get access to all Elements and Modules inside Manager sidebar', 0, 3, 0, 'require MODX_BASE_PATH.\'assets/plugins/elementsintree/plugin.elementsintree.php\';\n', 0, '{\"adminRoleOnly\":[{\"label\":\"Administrators only\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}],\"treeButtonsInTab\":[{\"label\":\"Tree buttons in tab\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}]}', 1, '', 0, 0),
(3, 'Forgot Manager Login', '<strong>1.1.7</strong> Resets your manager login when you forget your password via email confirmation', 0, 3, 0, 'require MODX_BASE_PATH.\'assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php\';', 0, '', 0, '', 0, 0),
(4, 'OutdatedExtrasCheck', '<strong>1.4.6</strong> Check for Outdated critical extras not compatible with EVO 1.4.6', 0, 3, 0, '/**\r\n * OutdatedExtrasCheck\r\n *\r\n * Check for Outdated critical extras not compatible with EVO 1.4.6\r\n *\r\n * @category	plugin\r\n * @version     1.4.6\r\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @author      Author: Nicola Lambathakis\r\n * @internal    @events OnManagerWelcomeHome\r\n * @internal    @properties &wdgVisibility=Show widget for:;menu;All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly;AdminOnly &ThisRole=Run only for this role:;string;;;(role id) &ThisUser=Run only for this user:;string;;;(username)\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @installset base\r\n * @internal    @disabled 0\r\n */\r\n\r\nrequire MODX_BASE_PATH . \'assets/plugins/extrascheck/OutdatedExtrasCheck.plugin.php\';\r\n', 0, '{\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Run only for this role:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Run only for this user:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}', 0, '', 0, 0),
(5, 'Quick Manager+', '<strong>1.5.10</strong> Enables QuickManager+ front end content editing support', 0, 3, 0, '\r\n/**\r\n * Quick Manager+\r\n *\r\n * Enables QuickManager+ front end content editing support\r\n *\r\n * @category 	plugin\r\n * @version 	1.5.10\r\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL v3)\r\n * @internal    @properties &jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;false &noconflictjq=jQuery noConflict mode in front-end;list;true,false;false &loadfa=Load Font Awesome css in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &position= Toolbar position;list;top,right,bottom,left,before;top &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv &removeBg=Remove toolbar background;list;yes,no;no &buttonStyle=QuickManager buttons CSS stylesheet;list;actionButtons,navButtons;navButtons\r\n * @internal	@events OnParseDocument,OnWebPagePrerender,OnDocFormPrerender,OnDocFormSave,OnManagerLogout\r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @legacy_names QM+,QuickEdit\r\n * @internal    @installset base, sample\r\n * @internal    @disabled 1\r\n * @reportissues https://github.com/modxcms/evolution\r\n * @documentation Official docs [+site_url+]assets/plugins/qm/readme.html\r\n * @link        http://www.maagit.fi/modx/quickmanager-plus\r\n * @author      Mikko Lammi\r\n * @author      Since 2011: yama, dmi3yy, segr, Nicola1971.\r\n * @lastupdate  02/02/2018\r\n */\r\n\r\n// In manager\r\nif (!$modx->checkSession()) return;\r\n\r\n$show = TRUE;\r\n\r\nif ($disabled  != \'\') {\r\n    $arr = array_filter(array_map(\'intval\', explode(\',\', $disabled)));\r\n    if (in_array($modx->documentIdentifier, $arr)) {\r\n        $show = FALSE;\r\n    }\r\n}\r\n\r\nif ($show) {\r\n    // Replace [*#tv*] with QM+ edit TV button placeholders\r\n    if ($tvbuttons == \'true\') {\r\n        if ($modx->event->name == \'OnParseDocument\') {\r\n             $output = &$modx->documentOutput;\r\n             $output = preg_replace(\'~\\[\\*#(.*?)\\*\\]~\', \'<!-- \'.$tvbclass.\' $1 -->[*$1*]\', $output);\r\n             $modx->documentOutput = $output;\r\n         }\r\n     }\r\n    include_once MODX_BASE_PATH . \'assets/plugins/qm/qm.inc.php\';\r\n    $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadfa, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $position, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass, $buttonStyle, $removeBg);\r\n}\r\n', 0, '{\"jqpath\":[{\"label\":\"Path to jQuery\",\"type\":\"text\",\"value\":\"assets\\/js\\/jquery.min.js\",\"default\":\"assets\\/js\\/jquery.min.js\",\"desc\":\"\"}],\"loadmanagerjq\":[{\"label\":\"Load jQuery in manager\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfrontendjq\":[{\"label\":\"Load jQuery in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"noconflictjq\":[{\"label\":\"jQuery noConflict mode in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfa\":[{\"label\":\"Load Font Awesome css in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"loadtb\":[{\"label\":\"Load modal box in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tbwidth\":[{\"label\":\"Modal box window width\",\"type\":\"text\",\"value\":\"80%\",\"default\":\"80%\",\"desc\":\"\"}],\"tbheight\":[{\"label\":\"Modal box window height\",\"type\":\"text\",\"value\":\"90%\",\"default\":\"90%\",\"desc\":\"\"}],\"hidefields\":[{\"label\":\"Hide document fields from front-end editors\",\"type\":\"text\",\"value\":\"parent\",\"default\":\"parent\",\"desc\":\"\"}],\"hidetabs\":[{\"label\":\"Hide document tabs from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"hidesections\":[{\"label\":\"Hide document sections from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"addbutton\":[{\"label\":\"Show add document here button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tpltype\":[{\"label\":\"New document template type\",\"type\":\"list\",\"value\":\"parent\",\"options\":\"parent,id,selected\",\"default\":\"parent\",\"desc\":\"\"}],\"tplid\":[{\"label\":\"New document template id\",\"type\":\"int\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"custombutton\":[{\"label\":\"Custom buttons\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"managerbutton\":[{\"label\":\"Show go to manager button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"logout\":[{\"label\":\"Logout to\",\"type\":\"list\",\"value\":\"manager\",\"options\":\"manager,front-end\",\"default\":\"manager\",\"desc\":\"\"}],\"disabled\":[{\"label\":\"Plugin disabled on documents\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"autohide\":[{\"label\":\"Autohide toolbar\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"position\":[{\"label\":\"Toolbar position\",\"type\":\"list\",\"value\":\"top\",\"options\":\"top,right,bottom,left,before\",\"default\":\"top\",\"desc\":\"\"}],\"editbuttons\":[{\"label\":\"Inline edit buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"editbclass\":[{\"label\":\"Edit button CSS class\",\"type\":\"text\",\"value\":\"qm-edit\",\"default\":\"qm-edit\",\"desc\":\"\"}],\"newbuttons\":[{\"label\":\"Inline new resource buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"newbclass\":[{\"label\":\"New resource button CSS class\",\"type\":\"text\",\"value\":\"qm-new\",\"default\":\"qm-new\",\"desc\":\"\"}],\"tvbuttons\":[{\"label\":\"Inline template variable buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"tvbclass\":[{\"label\":\"Template variable button CSS class\",\"type\":\"text\",\"value\":\"qm-tv\",\"default\":\"qm-tv\",\"desc\":\"\"}],\"removeBg\":[{\"label\":\"Remove toolbar background\",\"type\":\"list\",\"value\":\"no\",\"options\":\"yes,no\",\"default\":\"no\",\"desc\":\"\"}],\"buttonStyle\":[{\"label\":\"QuickManager buttons CSS stylesheet\",\"type\":\"list\",\"value\":\"navButtons\",\"options\":\"actionButtons,navButtons\",\"default\":\"navButtons\",\"desc\":\"\"}]}', 1, '', 0, 0),
(6, 'TinyMCE4', '<strong>4.7.4</strong> Javascript rich text editor', 0, 3, 0, '\n/**\n * TinyMCE4\n *\n * Javascript rich text editor\n *\n * @category    plugin\n * @version     4.7.4\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal    @properties &styleFormats=Custom Style Formats <b>RAW</b><br/><br/><ul><li>leave empty to use below block/inline formats</li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2</i></li><li>Also accepts full JSON-config as per TinyMCE4 docs / configure / content-formating / style_formats</li></ul>;textarea; &styleFormats_inline=Custom Style Formats <b>INLINE</b><br/><br/><ul><li>will wrap selected text with span-tag + css-class</li><li>simple-format only</li></ul>;textarea;InlineTitle,cssClass1|InlineTitle2,cssClass2 &styleFormats_block=Custom Style Formats <b>BLOCK</b><br/><br/><ul><li>will add css-class to selected block-element</li><li>simple-format only</li></ul>;textarea;BlockTitle,cssClass3|BlockTitle2,cssClass4 &customParams=Custom Parameters<br/><b>(Be careful or leave empty!)</b>;textarea; &entityEncoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &pathOptions=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &resizing=Advanced Resizing;list;true,false;false &disabledButtons=Disabled Buttons;text; &webTheme=Web Theme;test;webuser &webPlugins=Web Plugins;text; &webButtons1=Web Buttons 1;text;bold italic underline strikethrough removeformat alignleft aligncenter alignright &webButtons2=Web Buttons 2;text;link unlink image undo redo &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;400px &introtextRte=<b>Introtext RTE</b><br/>add richtext-features to \"introtext\";list;enabled,disabled;disabled &inlineMode=<b>Inline-Mode</b>;list;enabled,disabled;disabled &inlineTheme=<b>Inline-Mode</b><br/>Theme;text;inline &browser_spellcheck=<b>Browser Spellcheck</b><br/>At least one dictionary must be installed inside your browser;list;enabled,disabled;disabled &paste_as_text=<b>Force Paste as Text</b>;list;enabled,disabled;disabled\n * @internal    @events OnLoadWebDocument,OnParseDocument,OnWebPagePrerender,OnLoadWebPageCache,OnRichTextEditorRegister,OnRichTextEditorInit,OnInterfaceSettingsRender\n * @internal    @modx_category Manager and Admin\n * @internal    @legacy_names TinyMCE Rich Text Editor\n * @internal    @installset base\n * @logo        /assets/plugins/tinymce4/tinymce/logo.png\n * @reportissues https://github.com/extras-evolution/tinymce4-for-modx-evo\n * @documentation Plugin docs https://github.com/extras-evolution/tinymce4-for-modx-evo\n * @documentation Official TinyMCE4-docs https://www.tinymce.com/docs/\n * @author      Deesen\n * @lastupdate  2018-01-17\n */\nif (!defined(\'MODX_BASE_PATH\')) { die(\'What are you doing? Get out of here!\'); }\n\nrequire(MODX_BASE_PATH.\"assets/plugins/tinymce4/plugin.tinymce.inc.php\");', 0, '{\"styleFormats\":[{\"label\":\"Custom Style Formats <b>RAW<\\/b><br\\/><br\\/><ul><li>leave empty to use below block\\/inline formats<\\/li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2<\\/i><\\/li><li>Also accepts full JSON-config as per TinyMCE4 docs \\/ configure \\/ content-formating \\/ style_formats<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"styleFormats_inline\":[{\"label\":\"Custom Style Formats <b>INLINE<\\/b><br\\/><br\\/><ul><li>will wrap selected text with span-tag + css-class<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"default\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"desc\":\"\"}],\"styleFormats_block\":[{\"label\":\"Custom Style Formats <b>BLOCK<\\/b><br\\/><br\\/><ul><li>will add css-class to selected block-element<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"default\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"desc\":\"\"}],\"customParams\":[{\"label\":\"Custom Parameters<br\\/><b>(Be careful or leave empty!)<\\/b>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"entityEncoding\":[{\"label\":\"Entity Encoding\",\"type\":\"list\",\"value\":\"named\",\"options\":\"named,numeric,raw\",\"default\":\"named\",\"desc\":\"\"}],\"entities\":[{\"label\":\"Entities\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"pathOptions\":[{\"label\":\"Path Options\",\"type\":\"list\",\"value\":\"Site config\",\"options\":\"Site config,Absolute path,Root relative,URL,No convert\",\"default\":\"Site config\",\"desc\":\"\"}],\"resizing\":[{\"label\":\"Advanced Resizing\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"disabledButtons\":[{\"label\":\"Disabled Buttons\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webTheme\":[{\"label\":\"Web Theme\",\"type\":\"test\",\"value\":\"webuser\",\"default\":\"webuser\",\"desc\":\"\"}],\"webPlugins\":[{\"label\":\"Web Plugins\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons1\":[{\"label\":\"Web Buttons 1\",\"type\":\"text\",\"value\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"default\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"desc\":\"\"}],\"webButtons2\":[{\"label\":\"Web Buttons 2\",\"type\":\"text\",\"value\":\"link unlink image undo redo\",\"default\":\"link unlink image undo redo\",\"desc\":\"\"}],\"webButtons3\":[{\"label\":\"Web Buttons 3\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons4\":[{\"label\":\"Web Buttons 4\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webAlign\":[{\"label\":\"Web Toolbar Alignment\",\"type\":\"list\",\"value\":\"ltr\",\"options\":\"ltr,rtl\",\"default\":\"ltr\",\"desc\":\"\"}],\"width\":[{\"label\":\"Width\",\"type\":\"text\",\"value\":\"100%\",\"default\":\"100%\",\"desc\":\"\"}],\"height\":[{\"label\":\"Height\",\"type\":\"text\",\"value\":\"400px\",\"default\":\"400px\",\"desc\":\"\"}],\"introtextRte\":[{\"label\":\"<b>Introtext RTE<\\/b><br\\/>add richtext-features to \\\"introtext\\\"\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineMode\":[{\"label\":\"<b>Inline-Mode<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineTheme\":[{\"label\":\"<b>Inline-Mode<\\/b><br\\/>Theme\",\"type\":\"text\",\"value\":\"inline\",\"default\":\"inline\",\"desc\":\"\"}],\"browser_spellcheck\":[{\"label\":\"<b>Browser Spellcheck<\\/b><br\\/>At least one dictionary must be installed inside your browser\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"paste_as_text\":[{\"label\":\"<b>Force Paste as Text<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}]}', 0, '', 0, 0),
(7, 'TransAlias', '<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides', 0, 3, 0, 'require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';', 0, '{\"table_name\":[{\"label\":\"Trans table\",\"type\":\"list\",\"value\":\"russian\",\"options\":\"common,russian,dutch,german,czech,utf8,utf8lowercase\",\"default\":\"russian\",\"desc\":\"\"}],\"char_restrict\":[{\"label\":\"Restrict alias to\",\"type\":\"list\",\"value\":\"lowercase alphanumeric\",\"options\":\"lowercase alphanumeric,alphanumeric,legal characters\",\"default\":\"lowercase alphanumeric\",\"desc\":\"\"}],\"remove_periods\":[{\"label\":\"Remove Periods\",\"type\":\"list\",\"value\":\"No\",\"options\":\"Yes,No\",\"default\":\"No\",\"desc\":\"\"}],\"word_separator\":[{\"label\":\"Word Separator\",\"type\":\"list\",\"value\":\"dash\",\"options\":\"dash,underscore,none\",\"default\":\"dash\",\"desc\":\"\"}],\"override_tv\":[{\"label\":\"Override TV name\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}', 0, '', 0, 0),
(8, 'Updater', '<strong>0.8.5</strong> show message about outdated CMS version', 0, 3, 0, 'require MODX_BASE_PATH.\'assets/plugins/updater/plugin.updater.php\';', 0, '{\"version\":[{\"label\":\"Version:\",\"type\":\"text\",\"value\":\"evolution-cms\\/evolution\",\"default\":\"evolution-cms\\/evolution\",\"desc\":\"\"}],\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Show only to this role id:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Show only to this username:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"showButton\":[{\"label\":\"Show Update Button:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"show,hide,AdminOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"type\":[{\"label\":\"Type:\",\"type\":\"menu\",\"value\":\"tags\",\"options\":\"tags,releases,commits\",\"default\":\"tags\",\"desc\":\"\"}],\"branch\":[{\"label\":\"Commit branch:\",\"type\":\"text\",\"value\":\"develop\",\"default\":\"develop\",\"desc\":\"\"}],\"stableOnly\":[{\"label\":\"Offer upgrade to stable version only:\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}]}', 0, '', 0, 0),
(12, 'evoAjax', '', 0, 1, 0, 'switch($_GET[\'q\']){     \n	case \'feedbackajaxform\':\n		echo $modx->runSnippet(\'FormLister\', array(\n			\'formid\' => \'ContactForm\',\n			\'to\' => $modx->config[\'emailsender\'],\n			\'parseMailerParams\'=> \'1\',\n			\'replyTo\'=> \'@CODE:[+user.email.value+]\',\n			\'subjectTpl\' => \'@CODE:[+subject.value+], from: \' . $modx->config[\'site_name\'] ,\n			\'ccSender\'=>\'1\',\n			\'errorClass\'=> \' has-error\',\n			\'requiredClass\'=> \' has-warning\',\n			\'rules\'=> \'{\n               	\"name\":{\n               		\"required\":\"Enter your Name\"\n               	},\n               	\"email\":{\n               		\"required\":\"Enter email\",\n               		\"email\":\"Incorrect email\"\n               	},\n               	\"message\":{\n                	\"required\":\"Enter message\"\n                }\n            }\',\n			\'formControls\'=>\'subject\',\n			\'messagesTpl\' => \'@CODE:<div class=\"form-messages alert alert-danger\">[+required+]<br>[+errors+]</div>\',\n            \'errorTpl\'=>\'@CODE: [+message+]\',\n            \'successTpl\'=> \'@CODE: \n             	<div class=\"alert alert-success mt-3\">\n                 	<h3>Thanks!</h3>\n                 	<p>your message has been sent.</p>\n             	</div>\',\n            \'formTpl\' => \'ContactForm\', \n			\'reportTpl\'=>\'ContactFormReport\',\n            \'ccSenderTpl\'=>\'ContactFormReport\',	\n			));\n			die();\n        break;\n}\n', 0, '{}', 0, ' ', 1507815395, 1507816656),
(13, 'documentObjectCacher', '<strong>1.5.0</strong> Plugin to cache $modx->documentObject', 0, 0, 0, 'require MODX_BASE_PATH.\'assets/plugins/twig/documentObjectCache.php\';', 0, '', 1, '', 0, 0),
(14, 'replaceTemplateTwig', '<strong>1.6.0</strong> Twig template engine', 0, 0, 0, 'require MODX_BASE_PATH.\'assets/plugins/twig/replaceTemplateTwig.php\';', 0, '{\"debug\":[{\"label\":\"Debug\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"modxcache\":[{\"label\":\"MODX cache\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"disableTwig\":[{\"label\":\"Disable Twig for templates\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"conditional\":[{\"label\":\"Conditional\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"tplFolder\":[{\"label\":\"Templates Folder\",\"type\":\"text\",\"value\":\"assets\\/templates\\/tpl\\/\",\"default\":\"assets\\/templates\\/tpl\\/\",\"desc\":\"\"}],\"tplDevFolder\":[{\"label\":\"Templates Folder for Developers\",\"type\":\"text\",\"value\":\"assets\\/templates\\/tpl\\/\",\"default\":\"assets\\/templates\\/tpl\\/\",\"desc\":\"\"}],\"tplExt\":[{\"label\":\"Template extension\",\"type\":\"text\",\"value\":\"tpl\",\"default\":\"tpl\",\"desc\":\"\"}],\"cacher\":[{\"label\":\"Cacher\",\"type\":\"list\",\"value\":\"Files\",\"options\":\"APC,APCu,Memcache,Memcached,SQLite3,Files,Redis,Predis\",\"default\":\"Files\",\"desc\":\"\"}],\"allowedFunctions\":[{\"label\":\"Allowed functions\",\"type\":\"textarea\",\"value\":\"count,filesize,get_key,intval\",\"default\":\"count,filesize,get_key,intval\",\"desc\":\"\"}]}', 1, '', 0, 0),
(15, 'CommentsHelper', '<strong>1.3.0</strong> addition to Comments', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/Comments/plugin.CommentsHelper.php\';\n', 0, '', 0, '', 0, 0),
(16, 'Commerce', '<strong>0.6.1</strong> Commerce solution', 0, 6, 0, 'if (!class_exists(\'Commerce\\\\Commerce\')) {\r\n    require_once MODX_BASE_PATH . \'assets/plugins/commerce/autoload.php\';\r\n\r\n    $ci = ci();\r\n\r\n    $ci->set(\'modx\', function($ci) use ($modx) {\r\n        return $modx;\r\n    });\r\n\r\n    $ci->set(\'commerce\', function($ci) use ($modx, $params) {\r\n        return new Commerce\\Commerce($modx, $params);\r\n    });\r\n\r\n    $ci->set(\'currency\', function($ci) {\r\n        return $ci->commerce->currency;\r\n    });\r\n\r\n    $ci->set(\'cache\', function($ci) use ($modx) {\r\n        return Commerce\\Cache::getInstance();\r\n    });\r\n\r\n    $ci->set(\'carts\', function($ci) use ($modx) {\r\n        return Commerce\\CartsManager::getManager($modx);\r\n    });\r\n\r\n    $ci->set(\'db\', function($ci) {\r\n        return $ci->modx->db;\r\n    });\r\n\r\n    $ci->set(\'tpl\', function($ci) use ($modx) {\r\n        require_once MODX_BASE_PATH . \'assets/snippets/DocLister/lib/DLTemplate.class.php\';\r\n        return DLTemplate::getInstance($modx);\r\n    });\r\n\r\n    $ci->set(\'flash\', function($ci) {\r\n        return new Commerce\\Module\\FlashMessages;\r\n    });\r\n}\r\n\r\nif ($modx instanceof \\Illuminate\\Container\\Container) {\r\n    if (!$modx->offsetExists(\'commerce\')) {\r\n        $modx->instance(\'commerce\', ci()->commerce);\r\n        $modx->commerce->initializeCommerce();\r\n    }\r\n} else if (!isset($modx->commerce) || isset($modx->commerce) && !($modx->commerce instanceof \\Commerce\\Commerce)) {\r\n    $modx->commerce = ci()->commerce;\r\n    $modx->commerce->initializeCommerce();\r\n}\r\n\r\nswitch ($modx->event->name) {\r\n    case \'OnWebPageInit\': {\r\n        $order_id = ci()->flash->get(\'last_order_id\');\r\n\r\n        if (!empty($order_id) && is_numeric($order_id)) {\r\n            $modx->commerce->loadProcessor()->populateOrderPlaceholders($order_id);\r\n        }\r\n\r\n        $payment_id = ci()->flash->get(\'last_payment_id\');\r\n\r\n        if (!empty($payment_id) && is_numeric($payment_id)) {\r\n            $modx->commerce->loadProcessor()->populatePaymentPlaceholders($payment_id);\r\n        }\r\n\r\n        break;\r\n    }\r\n\r\n    case \'OnLoadWebDocument\': {\r\n        if (!empty($params[\'product_templates\'])) {\r\n            $templates = array_map(\'trim\', explode(\',\', $params[\'product_templates\']));\r\n\r\n            if (in_array($modx->documentObject[\'template\'], $templates)) {\r\n                $modx->commerce->populateProductPagePlaceholders();\r\n            }\r\n        }\r\n\r\n        break;\r\n    }\r\n\r\n    case \'OnWebPagePrerender\': {\r\n        $modx->documentOutput = str_replace(\'</body>\', $modx->commerce->populateClientScripts() . \'</body>\', $modx->documentOutput);\r\n        return;\r\n    }\r\n\r\n    case \'OnManagerMenuPrerender\': {\r\n        $moduleid = $modx->db->getValue($modx->db->select(\'id\', $modx->getFullTablename(\'site_modules\'), \"name = \'Commerce\'\"));\r\n        $url = \'index.php?a=112&id=\' . $moduleid;\r\n        $lang = $modx->commerce->getUserLanguage(\'menu\');\r\n\r\n        $params[\'menu\'] = array_merge($params[\'menu\'], [\r\n            \'commerce\' => [\'commerce\', \'main\', \'<i class=\"fa fa-shopping-cart\"></i>\' . $lang[\'menu.commerce\'], \'javascript:;\', $lang[\'menu.commerce\'], \'return false;\', \'exec_module\', \'main\', 0, 90, \'\'],\r\n            \'orders\'   => [\'orders\', \'commerce\', \'<i class=\"fa fa-list\"></i>\' . $lang[\'menu.orders\'], $url . \'&type=orders\', $lang[\'menu.orders\'], \'\', \'exec_module\', \'main\', 0, 10, \'\'],\r\n            \'statuses\' => [\'statuses\', \'commerce\', \'<i class=\"fa fa-play-circle\"></i>\' . $lang[\'menu.statuses\'], $url . \'&type=statuses\', $lang[\'menu.statuses\'], \'\', \'exec_module\', \'main\', 0, 20, \'\'],\r\n            \'currency\' => [\'currency\', \'commerce\', \'<i class=\"fa fa-usd\"></i>\' . $lang[\'menu.currency\'], $url . \'&type=currency\', $lang[\'menu.currency\'], \'\', \'exec_module\', \'main\', 0, 30, \'\'],\r\n        ]);\r\n\r\n        $modx->event->output(serialize($params[\'menu\']));\r\n        break;\r\n    }\r\n\r\n    case \'OnPageNotFound\': {\r\n        $url = trim(parse_url($_SERVER[\'REQUEST_URI\'], PHP_URL_PATH), \'/\');\r\n\r\n        if (strpos($url, \'commerce\') === 0) {\r\n            $modx->commerce->processRoute($url);\r\n        }\r\n        break;\r\n    }\r\n\r\n    case \'OnCacheUpdate\': {\r\n        ci()->cache->clean();\r\n        break;\r\n    }\r\n}\r\n', 0, '{\r\n  \"payment_success_page_id\": [\r\n    {\r\n      \"label\": \"Page ID for redirect after successfull payment\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"payment_failed_page_id\": [\r\n    {\r\n      \"label\": \"Page ID for redirect after payment error\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"cart_page_id\": [\r\n    {\r\n      \"label\": \"Cart page ID\",\r\n      \"type\": \"text\",\r\n      \"value\": \"54\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"order_page_id\": [\r\n    {\r\n      \"label\": \"Order page ID\",\r\n      \"type\": \"text\",\r\n      \"value\": \"52\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"status_id_after_payment\": [\r\n    {\r\n      \"label\": \"Status ID after payment\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"product_templates\": [\r\n    {\r\n      \"label\": \"Product templates IDs\",\r\n      \"type\": \"text\",\r\n      \"value\": \"9\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"title_field\": [\r\n    {\r\n      \"label\": \"Product title field name\",\r\n      \"type\": \"text\",\r\n      \"value\": \"pagetitle\",\r\n      \"default\": \"pagetitle\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"price_field\": [\r\n    {\r\n      \"label\": \"Product price field name\",\r\n      \"type\": \"text\",\r\n      \"value\": \"sushi_price\",\r\n      \"default\": \"price\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"status_notification\": [\r\n    {\r\n      \"label\": \"Chunk name for status change notification\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"order_paid\": [\r\n    {\r\n      \"label\": \"Chunk name for order paid notification\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"order_changed\": [\r\n    {\r\n      \"label\": \"Chunk name for order changed notification\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"email\": [\r\n    {\r\n      \"label\": \"Email notifications recipient\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"default_payment\": [\r\n    {\r\n      \"label\": \"Default payment code\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"default_delivery\": [\r\n    {\r\n      \"label\": \"Default delivery code\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"instant_redirect_to_payment\": [\r\n    {\r\n      \"label\": \"Redirect to payment after order process\",\r\n      \"type\": \"list\",\r\n      \"value\": \"1\",\r\n      \"options\": \"Instant==1||Show prepare text==0\",\r\n      \"default\": \"1\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"redirect_to_payment_tpl\": [\r\n    {\r\n      \"label\": \"Chunk name for redirect prepare text\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"payment_wait_time\": [\r\n    {\r\n      \"label\": \"Waiting time for order payment, days\",\r\n      \"type\": \"text\",\r\n      \"value\": \"3\",\r\n      \"default\": \"3\",\r\n      \"desc\": \"\"\r\n    }\r\n  ]\r\n}', 0, '', 0, 1586955742);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_plugin_events`
--

CREATE TABLE `g6vz_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Links to system events';

--
-- Дамп данных таблицы `g6vz_site_plugin_events`
--

INSERT INTO `g6vz_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1, 24, 0),
(1, 30, 0),
(1, 39, 0),
(1, 45, 0),
(1, 51, 0),
(1, 77, 0),
(1, 94, 0),
(2, 26, 0),
(2, 28, 0),
(2, 41, 0),
(2, 43, 0),
(2, 47, 0),
(2, 49, 0),
(2, 53, 0),
(2, 55, 0),
(2, 59, 0),
(2, 61, 0),
(2, 79, 0),
(2, 81, 0),
(2, 120, 0),
(2, 124, 0),
(2, 125, 0),
(3, 84, 0),
(3, 85, 0),
(3, 104, 0),
(4, 116, 0),
(5, 3, 0),
(5, 13, 0),
(5, 29, 0),
(5, 32, 0),
(5, 101, 0),
(6, 3, 1),
(6, 21, 0),
(6, 89, 0),
(6, 93, 0),
(6, 94, 1),
(6, 100, 0),
(6, 101, 1),
(7, 111, 0),
(8, 74, 0),
(8, 116, 1),
(8, 133, 0),
(12, 1000, 1),
(13, 98, 0),
(14, 3, 2),
(14, 19, 0),
(14, 74, 1),
(14, 95, 0),
(14, 96, 0),
(14, 100, 1),
(14, 133, 1),
(15, 8, 0),
(15, 109, 0),
(16, 3, 3),
(16, 19, 1),
(16, 95, 1),
(16, 96, 1),
(16, 100, 2),
(16, 128, 0),
(16, 133, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_snippets`
--

CREATE TABLE `g6vz_site_snippets` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains the site snippets.';

--
-- Дамп данных таблицы `g6vz_site_snippets`
--

INSERT INTO `g6vz_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `createdon`, `editedon`, `disabled`) VALUES
(1, 'DLCrumbs', '<strong>1.2</strong> DLCrumbs', 0, 4, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLCrumbs.php\';\n', 0, '', '', 0, 0, 0),
(2, 'DLMenu', '<strong>1.4.0</strong> Snippet to build menu with DocLister', 0, 4, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLMenu.php\';\n', 0, '', '', 0, 0, 0),
(3, 'DLSitemap', '<strong>1.0.1</strong> Snippet to build XML sitemap', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLSitemap.php\';\n', 0, '', '', 0, 0, 0),
(4, 'DocInfo', '<strong>0.4.1</strong> Take any field from any document (fewer requests than GetField)', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/docinfo/snippet.docinfo.php\';\r\n', 0, '', '', 0, 0, 0),
(5, 'DocLister', '<strong>2.5.0</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DocLister.php\';\n', 0, '', '', 0, 0, 0),
(6, 'FormLister', '<strong>1.9.2</strong> Form processor', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/FormLister/snippet.FormLister.php\';\n', 0, '', '', 0, 0, 0),
(7, 'if', '<strong>1.3</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 4, 0, 'return require MODX_BASE_PATH.\'assets/snippets/if/snippet.if.php\';', 0, '', '', 0, 0, 0),
(8, 'phpthumb', '<strong>1.3.3</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/phpthumb/snippet.phpthumb.php\';\r\n', 0, '', '', 0, 0, 0),
(9, 'summary', '<strong>2.0.2</strong> Truncates the string to the specified length', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/summary/snippet.summary.php\';', 0, '', '', 0, 0, 0),
(24, 'ifsnippet', '', 0, 1, 0, '\nif (!isset($modx->snippetCache[$name])) {\n	return \'<p class=\"bg-danger\">For work \'.$name.\' in demo site you need install <b>\'.$name.\'</b> from <a href=\"\'.MODX_MANAGER_URL.\'#?a=112&id=2\">Extras</a> module</p>\';\n}', 0, '{}', ' ', 1509819147, 1509826185, 0),
(23, 'prepareBlog', '', 0, 1, 0, '\nif ($data[\'image\'] != \'\'){\n	$data[\'blog-image\'] = \'<img src=\"\'.$modx->runSnippet(\'phpthumb\', array(\'input\'=>$data[\'image\'], \'options\'=>\'w=600,h=280,zc=1\')).\'\" alt=\"\'.$data[\'pagetitle\'].\'\">\';\n}else{\n	$data[\'blog-image\'] = \'\';\n}\nreturn $data;', 0, '{}', ' ', 1507723822, 1509819933, 0),
(25, 'getCache', '<strong>1.4.0</strong> Snippet to cache other snippet calls', 0, 0, 0, 'return require MODX_BASE_PATH.\'assets/snippets/getcache/snippet.getCache.php\';', 0, '', '', 0, 0, 0),
(26, 'CommentsForm', '<strong>1.3.0</strong> snippet to create comments', 0, 5, 0, 'return require MODX_BASE_PATH . \'assets/snippets/Comments/snippet.CommentsForm.php\';\n', 0, '', '', 0, 0, 0),
(27, 'Comments', '<strong>1.3.0</strong> snippet to list comments', 0, 5, 0, 'return require MODX_BASE_PATH . \'assets/snippets/Comments/snippet.Comments.php\';\n', 0, '', '', 0, 0, 0),
(28, 'CommentsSubscription', '<strong>1.3.0</strong> snippet to get status of the new comments subscription', 0, 5, 0, 'return require MODX_BASE_PATH . \'assets/snippets/Comments/snippet.CommentsSubscription.php\';\n', 0, '', '', 0, 0, 0),
(29, 'RecentComments', '<strong>1.3.0</strong> snippet to list recent commented resources', 0, 5, 0, 'return require MODX_BASE_PATH . \'assets/snippets/Comments/snippet.RecentComments.php\';\n', 0, '', '', 0, 0, 0),
(30, 'Cart', '<strong>0.4.0</strong> Cart contents, DocLister based', 0, 6, 0, 'if (defined(\'COMMERCE_INITIALIZED\')) {\n    $instance = isset($instance) ? $instance : \'products\';\n    $theme    = !empty($theme) ? $theme : \'\';\n    $cart     = ci()->carts->getCart($instance);\n\n    if (!is_null($cart)) {\n        return $modx->runSnippet(\'DocLister\', array_merge([\n            \'controller\'        => \'Cart\',\n            \'dir\'               => \'assets/plugins/commerce/src/Controllers/\',\n            \'templatePath\'      => \'assets/plugins/commerce/templates/front/\',\n            \'templateExtension\' => \'tpl\',\n            \'tpl\'               => \'@FILE:\' . $theme . \'cart_row\',\n            \'optionsTpl\'        => \'@FILE:\' . $theme . \'cart_row_options_row\',\n            \'ownerTPL\'          => \'@FILE:\' . $theme . \'cart_wrap\',\n            \'subtotalsRowTpl\'   => \'@FILE:\' . $theme . \'cart_subtotals_row\',\n            \'subtotalsTpl\'      => \'@FILE:\' . $theme . \'cart_subtotals\',\n            \'noneTPL\'           => \'@FILE:\' . $theme . \'cart_empty\',\n            \'customLang\'        => \'cart\',\n            \'noneWrapOuter\'     => 0,\n        ], $params, [\n            \'idType\'     => \'documents\',\n            \'documents\'  => array_column($cart->getItems(), \'id\'),\n            \'instance\'   => $instance,\n            \'hash\'       => ci()->commerce->storeParams($params),\n            \'cart\'       => $cart,\n            \'tree\'       => 0,\n        ]));\n    }\n}\n', 0, '', '', 0, 0, 0),
(31, 'Comparison', '<strong>0.4.0</strong> Comparison snippet, DocLister based', 0, 6, 0, '/**\n * [!Comparison\n *      &showCategories=`1`\n *      &tvCategory=`10`\n *      &excludeTV=`category`\n *      &includeTV=`best`\n *      &checkBoundingList=`0`\n *      &categoryItemClass=`btn-secondary`\n *      &categoryActiveClass=`btn-primary`\n * !]\n */\n\nif (!defined(\'COMMERCE_INITIALIZED\')) {\n    return;\n}\n\n$items = array_map(function($item) {\n    return $item[\'id\'];\n}, ci()->carts->getCart(\'comparison\')->getItems());\n\nif (empty($items)) {\n    return;\n}\n\n$showCategories = isset($params[\'showCategories\']) ? $params[\'showCategories\'] : 1;\n\nif ($showCategories) {\n    $table   = $modx->getFullTablename(\'site_content\');\n    $parents = $modx->db->getColumn(\'parent\', $modx->db->select(\'parent\', $table, \"`id` IN (\" . implode(\',\', $items) . \")\"));\n    $parents = array_unique($parents);\n\n    $categoryParams = [];\n\n    foreach ($params as $key => $value) {\n        if (strpos($key, \'category\') === 0) {\n            unset($params[$key]);\n            $key = preg_replace(\'/^category/\', \'\', $key);\n            $key = lcfirst($key);\n            $categoryParams[$key] = $value;\n        }\n    }\n\n    if (isset($_GET[\'category\']) && is_scalar($_GET[\'category\']) && in_array($_GET[\'category\'], $parents)) {\n        $currentCategory = $_GET[\'category\'];\n    }\n\n    if (empty($currentCategory)) {\n        $currentCategory = reset($parents);\n    }\n\n    $categories = \'\';\n\n    if (count($parents) > 1) {\n        $categoryParams = array_merge([\n            \'templatePath\'      => \'assets/plugins/commerce/templates/front/\',\n            \'templateExtension\' => \'tpl\',\n            \'tpl\'               => \'@FILE:comparison_category\',\n            \'ownerTPL\'          => \'@FILE:comparison_categories\',\n            \'itemClass\'         => \'btn-secondary\',\n            \'activeClass\'       => \'btn-primary\',\n            \'prepare\'           => function($data, $modx, $DL, $eDL) {\n                $data[\'class\'] = $DL->getCFGDef(\'currentId\') == $data[\'id\'] ? $DL->getCFGDef(\'activeClass\') : $DL->getCFGDef(\'itemClass\');\n                return $data;\n            },\n        ], $categoryParams, [\n            \'currentId\' => $currentCategory,\n            \'idType\'    => \'documents\',\n            \'documents\' => $parents,\n            \'sortType\'  => \'doclist\',\n        ]);\n\n        $categories = $modx->runSnippet(\'DocLister\', $categoryParams);\n    }\n\n    $ids = $modx->db->getColumn(\'id\', $modx->db->select(\'id\', $table, \"`parent` = \'$currentCategory\' AND `id` IN (\'\" . implode(\"\',\'\", array_unique($items)) . \"\')\"));\n} else {\n    $ids = array_values(array_unique($items));\n    $currentCategory = 0;\n}\n\n$params = array_merge([\n    \'templatePath\'      => \'assets/plugins/commerce/templates/front/\',\n    \'templateExtension\' => \'tpl\',\n    \'ownerTPL\'          => \'@FILE:comparison_table\',\n    \'headerTpl\'         => \'@FILE:comparison_table_header_cell\',\n    \'footerTpl\'         => \'@FILE:comparison_table_footer_cell\',\n    \'keyTpl\'            => \'@FILE:comparison_table_key_cell\',\n    \'valueTpl\'          => \'@FILE:comparison_table_value_cell\',\n    \'rowTpl\'            => \'@FILE:comparison_table_row\',\n    \'customLang\'        => \'common,cart\',\n], $params, [\n    \'controller\' => \'Comparison\',\n    \'dir\'        => \'assets/plugins/commerce/src/Controllers/\',\n    \'idType\'     => \'documents\',\n    \'sortType\'   => \'doclist\',\n    \'documents\'  => $ids,\n    \'category\'   => $currentCategory,\n    \'rows\'       => array_flip($items),\n]);\n\n$priceField = $modx->commerce->getSetting(\'price_field\', \'price\');\n$params[\'tvList\'] = (isset($params[\'tvList\']) ? $params[\'tvList\'] . \',\' : \'\') . $priceField;\n\nif (isset($params[\'prepare\'])) {\n    if (!is_array($params[\'prepare\'])) {\n        $params[\'prepare\'] = explode(\',\', $params[\'prepare\']);\n    } else if (is_callable($params[\'prepare\'])) {\n        $params[\'prepare\'] = [$params[\'prepare\']];\n    }\n} else {\n    $params[\'prepare\'] = [];\n}\n\n$tvPrefix = isset($params[\'tvPrefix\']) ? $params[\'tvPrefix\'] : \'tv.\';\n$priceField = $tvPrefix . $priceField;\n\n$params[\'prepare\'][] = function($data, $modx, $DL, $eDL) use ($priceField) {\n    if (isset($data[$priceField])) {\n        $data[$priceField] = $modx->runSnippet(\'PriceFormat\', [\'price\' => $data[$priceField]]);\n    }\n\n    return $data;\n};\n\n\n$docs = $modx->runSnippet(\'DocLister\', $params);\nreturn $categories . $docs;\n', 0, '', '', 0, 0, 0),
(32, 'CurrencySelect', '<strong>0.4.0</strong> Shows currency select', 0, 6, 0, 'if (defined(\'COMMERCE_INITIALIZED\')) {\n    $tpl = ci()->tpl;\n\n    $params = array_merge([\n        \'templatePath\'      => \'assets/plugins/commerce/templates/front/\',\n        \'templateExtension\' => \'tpl\',\n        \'tpl\'               => \'@FILE:currency_select_row\',\n        \'activeTpl\'         => \'@FILE:currency_select_active_row\',\n        \'outerTpl\'          => \'@FILE:currency_select_wrap\',\n    ], $params);\n\n    $currency = ci()->currency;\n    $rows     = $currency->getCurrencies();\n    $active   = $currency->getCurrencyCode();\n\n    $out = \'\';\n\n    $tpl->setTemplatePath($params[\'templatePath\']);\n    $tpl->setTemplateExtension($params[\'templateExtension\']);\n\n    foreach ($rows as $row) {\n        $chunk = $row[\'code\'] == $active ? $params[\'activeTpl\'] : $params[\'tpl\'];\n        $out  .= $tpl->parseChunk($chunk, $row);\n    }\n\n    return $tpl->parseChunk($params[\'outerTpl\'], [\'wrap\' => $out]);\n}\n', 0, '', '', 0, 0, 0),
(33, 'Order', '<strong>0.6.0</strong> Order form, FormLister based', 0, 6, 0, 'if (defined(\'COMMERCE_INITIALIZED\')) {\n    $commerce  = ci()->commerce;\n    $userLang  = $commerce->getUserLanguage(\'order\');\n    $adminLang = $commerce->getUserLanguage(\'order\', true);\n    $theme     = !empty($theme) ? $theme : \'\';\n\n    $params = array_merge([\n        \'controller\'            => \'Order\',\n        \'dir\'                   => \'assets/plugins/commerce/src/Controllers/\',\n        \'formid\'                => \'order\',\n        \'parseDocumentSource\'   => 1,\n        \'langDir\'               => \'assets/plugins/commerce/lang/\',\n        \'lexicon\'               => \'common,delivery,payments,order\',\n        \'templatePath\'          => \'assets/plugins/commerce/templates/front/\',\n        \'templateExtension\'     => \'tpl\',\n        \'formTpl\'               => \'@FILE:\' . $theme . \'order_form\',\n        \'deliveryTpl\'           => \'@FILE:\' . $theme . \'order_form_delivery\',\n        \'deliveryRowTpl\'        => \'@FILE:\' . $theme . \'order_form_delivery_row\',\n        \'paymentsTpl\'           => \'@FILE:\' . $theme . \'order_form_payments\',\n        \'paymentsRowTpl\'        => \'@FILE:\' . $theme . \'order_form_payments_row\',\n        \'reportTpl\'             => $commerce->getUserLanguageTemplate(\'order_report\', true),\n        \'to\'                    => $commerce->getSetting(\'email\', $modx->getConfig(\'emailsender\')),\n        \'ccSender\'              => \'1\',\n        \'ccSenderField\'         => \'email\',\n        \'ccSenderTpl\'           => $commerce->getUserLanguageTemplate(\'order_reportback\'),\n        \'subjectTpl\'            => $adminLang[\'order.subject\'],\n        \'successTpl\'            => $userLang[\'order.success\'],\n        \'rules\'                 => [\n            \'name\' => [\n                \'required\' => $userLang[\'order.error.name_required\'],\n            ],\n            \'email\' => [\n                \'required\' => $userLang[\'order.error.email_required\'],\n                \'email\'    => $userLang[\'order.error.email_incorrect\'],\n            ],\n            \'phone\' => [\n                \'required\' => $userLang[\'order.error.phone_required\'],\n            ],\n        ],\n    ], $params);\n\n    $params[\'form_hash\'] = $commerce->storeParams($params);\n\n    return $modx->runSnippet(\'FormLister\', $params);\n}\n', 0, '', '', 0, 0, 0),
(34, 'PriceConvert', '<strong>0.4.0</strong> Convert price using predefined settings', 0, 6, 0, 'if (empty($modx->commerce) && !defined(\'COMMERCE_INITIALIZED\')) {\n    return $params[\'price\'];\n}\n\n$currency = ci()->currency;\nreturn $currency->convertFromDefault($params[\'price\'], !empty($params[\'currency\']) ? $params[\'currency\'] : null);\n', 0, '', '', 0, 0, 0),
(35, 'PriceFormat', '<strong>0.6.1</strong> Format price using predefined settings', 0, 6, 0, 'if (defined(\'COMMERCE_INITIALIZED\')) {\n    $currency = ci()->currency;\n\n    $params = array_merge([\n        \'price\'   => 0,\n        \'convert\' => 1,\n    ], $params);\n\n    if ($params[\'convert\']) {\n        $params[\'price\'] = $currency->convertToActive($params[\'price\']);\n    }\n\n    return $currency->format($params[\'price\']);\n}\n\nreturn array_shift($params);\n', 0, '', '', 0, 0, 0),
(36, 'Wishlist', '<strong>0.4.0</strong> Wishlist contents, DocLister based', 0, 6, 0, 'if (defined(\'COMMERCE_INITIALIZED\')) {\n    return $modx->runSnippet(\'Cart\', array_merge([\n        \'controller\'        => \'Wishlist\',\n        \'instance\'          => \'wishlist\',\n        \'templatePath\'      => \'assets/plugins/commerce/templates/front/\',\n        \'templateExtension\' => \'tpl\',\n        \'tpl\'               => \'@FILE:wishlist_row\',\n        \'ownerTPL\'          => \'@FILE:wishlist_wrap\',\n        \'customLang\'        => \'common,cart\',\n    ], $params));\n}\n', 0, '', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_templates`
--

CREATE TABLE `g6vz_site_templates` (
  `id` int(10) NOT NULL,
  `templatename` varchar(100) NOT NULL DEFAULT '',
  `templatealias` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `selectable` tinyint(4) NOT NULL DEFAULT '1',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains the site templates.';

--
-- Дамп данных таблицы `g6vz_site_templates`
--

INSERT INTO `g6vz_site_templates` (`id`, `templatename`, `templatealias`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `selectable`, `createdon`, `editedon`) VALUES
(3, 'Minimal Template', 'test', 'Default minimal empty template (content returned only)', 0, 0, '', 0, '[*content*]', 0, 1, 0, 1585928305),
(4, 'Evolution CMS startup - Bootstrap', 'evolution-cms-startup-bootstrap', '<strong>1.0</strong> Sample template in Bootstrap', 0, 1, '', 0, '<!DOCTYPE html>\r\n<html lang=\"[(lang_code)]\">\r\n	<head>\r\n		<meta http-equiv=\"Content-Type\" content=\"text/html; charset=[(modx_charset)]\" /> \r\n		<title>[*titl*]</title>\r\n		[*noIndex*]\r\n		<meta name=\"keywords\" content=\"[*keyw*]\" />\r\n		<meta name=\"description\" content=\"[*desc*]\" />\r\n		<base href=\"[(site_url)]\"/>\r\n\r\n		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n		<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n\r\n		<link href=\"[(site_url)][[if? &is=[(site_start)]:!=:[*id*] &then=`[~[*id*]~]`]]\" rel=\"canonical\">\r\n		<link href=\"https://fonts.googleapis.com/css?family=Open+Sans:400,700\" rel=\"stylesheet\" type=\"text/css\">	\r\n		<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\">\r\n		<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css\">\r\n		\r\n\r\n		<style> \r\n			html, body{background:#eee; font-family:\'Open Sans\',sans-serif; line-height:1.8; font-size:14px;}\r\n			a:focus{outline:none; outline-offset:0;}\r\n			h1{margin-top:15px;}\r\n\r\n			.logo{float:left;}\r\n			.logo img{ margin-top:10px; display:block; max-width:256px;}\r\n			\r\n			.dropdown-menu{border-radius:0; border:0;}\r\n			.dropdown-menu > li > a{padding-top:5px; padding-bottom:5px;}\r\n\r\n			.navbar-collapse.collapse.in{border-bottom:10px solid #eee;}\r\n			.navbar{min-height:0; background:#fff; margin-bottom:0;}\r\n			.navbar.nav{margin-left:0;}\r\n			.navbar.nav ul{padding-left:0;}\r\n			.navbar-nav{margin:0;}\r\n			.navbar-toggle{background:#fff; border:2px solid #eee; border-radius:0; position:fixed; z-index:99; right:0; top:7px; padding:12px 10px; margin-right:10px;}\r\n			.navbar .navbar-toggle .icon-bar{background-color:#333;}\r\n\r\n			.nav li a{text-transform:uppercase; color:#333; font-weight:500; font-size:110%;}\r\n			.nav li li a{text-transform:none; font-weight:normal; font-size:100%;}\r\n\r\n			.navbar{border:none; border-radius:0;}\r\n			#navbar{padding:0;}\r\n			ul.nav > li > a:hover{background-color:#f5f5f5;}\r\n\r\n			.affix{top:0px; width:100%; z-index:1000; background-color:#eee;}\r\n			.affix + .affspacer{display:block; height:50px;}\r\n\r\n			.box-shadow{-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175); box-shadow:0 6px 12px rgba(0,0,0,.175);}\r\n\r\n			.container {max-width:970px; margin:0 12px;}\r\n			.top .col-sm-12{padding-left:0; padding-right:0;}\r\n\r\n			#ajaxSearch_input,\r\n			#username,\r\n			#password{width:100%!important;}\r\n			#forgotpsswd{clear:both;}\r\n			input.button[type=\"submit\"]{display:block;}\r\n			label.checkbox{display:inline-block; margin-left:10px;}\r\n			label, legend{font-weight:400;}\r\n			#ajaxSearch_form { position:relative; }\r\n			#searchClose { display:none !important; }\r\n			#indicator { position:absolute; top:9px; right:12px; z-index:10; opacity:.75; }\r\n\r\n			h2{font-size:22px;}\r\n			.bread{padding:1em 0 0 0;}\r\n			.mem{color:#aaa; text-align:center; padding:1em 0 2em;}\r\n\r\n			section.main .container{background-color:#fff; padding-bottom:20px;}\r\n			footer.footer .container{background-color:#000; color:#fff; line-height:40px;}\r\n\r\n			section.main .content ul{list-style:none; margin:0 0 1em 0; padding:0;}\r\n			section.main .content ul li{padding-left:1em;}\r\n			section.main .content ul li:before{content:\'\\2022\'; position:absolute; line-height:1.85em; margin-left:-1em;}\r\n\r\n			.breadcrumb {padding: 0px 0px;margin-bottom: 0px;list-style: none;background-color:#fff;border-radius: 0px;}	\r\n\r\n			.footer{text-align:center;}\r\n			.footer .text-right{text-align:center;}\r\n\r\n			/* JOT */\r\n			.jot-comment{padding:5px 10px;}\r\n			.jot-row-author{background-color:#dddddd;}\r\n			.jot-row-alt{background-color:#f9f9f9;}\r\n			.jot-row{background-color:#eeeeee;}\r\n			.jot-row-up{border:1px solid #333!important;}\r\n			.jot-row-up.panel-primary > .panel-heading{background-color:#333!important; border-color:#333!important;}\r\n			.jot-extra{font-size:75%;}\r\n			.jot-poster{font-size:inherit!important;}\r\n\r\n			.dl_summaryPost img{max-width:100%; height:auto; margin:10px 0 5px; display:block;}\r\n			.dl_summaryPost{padding-top:10px; padding-bottom:15px; border-bottom:1px solid #eee;}\r\n\r\n			.pagination b, .pagination a {padding: 5px;}	\r\n\r\n			div.errors{ color:#F00; }\r\n			#EmailForm .invalidValue{ background: #FFDFDF; border:1px solid #F00; }\r\n			#EmailForm .requiredValue{ background: #FFFFDF; border:1px solid #F00; }	\r\n\r\n			/* Larger than mobile */\r\n			@media (min-width:320px) {\r\n\r\n			}\r\n\r\n			/* Larger than phablet */\r\n			@media (min-width:480px) {\r\n\r\n			}\r\n\r\n			/* Larger than tablet */\r\n			@media (min-width:768px) {\r\n\r\n				.container{margin:0 auto;}\r\n				.logo{padding-left:15px;}\r\n				.logo img{ margin-top:10px; display:block; max-width:256px;}\r\n\r\n				.navbar{background:transparent;}\r\n				.navbar.affix{background:#eee;}\r\n				.navbar-collapse.collapse.in{border-bottom:0;}\r\n\r\n				.footer{text-align:left;}\r\n				.footer .text-right{text-align:right;}\r\n\r\n				.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {padding-left:35px; padding-right:35px;}\r\n\r\n			}\r\n		</style>\r\n\r\n		<script src=\"https://code.jquery.com/jquery-2.2.3.min.js\"></script>\r\n		\r\n				\r\n	</head>\r\n	<body>\r\n		<section class=\"top\">\r\n			<div class=\"container\">\r\n				<div class=\"row\">\r\n					<div class=\"col-sm-12\" itemscope itemtype=\"http://schema.org/Organization\">\r\n\r\n						<a class=\"logo\" href=\"[~[(site_start)]~]\" title=\"[(site_name)]\" itemprop=\"url\">\r\n							<img src=\"[(site_url)]manager/media/style/default/images/misc/login-logo.png\" itemprop=\"logo\" alt=\"[(site_name)]\" />\r\n						</a>\r\n\r\n						<div class=\"clearfix\"></div>\r\n\r\n						<nav class=\"navbar\" role=\"navigation\" data-spy=\"affix\" data-offset-top=\"100\">\r\n\r\n							<div class=\"navbar-header\">\r\n								<button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar\" aria-expanded=\"false\" aria-controls=\"navbar\">\r\n									<span class=\"sr-only\">Toggle navigation</span>\r\n									<span class=\"icon-bar\"></span>\r\n									<span class=\"icon-bar\"></span>\r\n									<span class=\"icon-bar\"></span>\r\n								</button>\r\n							</div>\r\n							<div id=\"navbar\" class=\"navbar-collapse collapse\">\r\n\r\n								[[DLMenu? \r\n								&parents=`0` \r\n								&maxDepth=`2` \r\n								&outerClass=`nav navbar-nav`\r\n								&hereClass=`active`\r\n								&innerTpl=`@CODE:<ul class=\"dropdown-menu\">[+wrap+]</ul>`\r\n								&parentRowTpl=`@CODE:<li class=\"dropdown\"><a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" title=\"[+title+]\">[+title+] <b class=\"caret\"></b></a>[+wrap+]</li>`\r\n								]]\r\n\r\n							</div>\r\n						</nav>\r\n						<div class=\"affspacer\"></div>\r\n\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</section>\r\n\r\n		<section class=\"main\">\r\n			<div class=\"container\">\r\n\r\n				<div class=\"row\">\r\n					<div class=\"col-sm-12\">\r\n						<div class=\"bread\">\r\n							[[if? &is=`[*id*]:!=:[(site_start)]` &then=`\r\n								[[DLCrumbs? &showCurrent=`1`]]\r\n							`]]\r\n						</div>\r\n					</div>\r\n				</div>\r\n\r\n				<div class=\"row content\">\r\n\r\n					<div class=\"col-sm-8\">\r\n						<h1>[*#longtitle*]</h1>\r\n						[*#content*]\r\n						\r\n					</div>\r\n\r\n					<aside class=\"col-sm-4\">\r\n						<div class=\"search\">\r\n							<h2>Search</h2>\r\n							[[ifsnippet? &name=`AjaxSearch`]]\r\n							[!AjaxSearch? \r\n							&ajaxSearch=`1` \r\n							&addJscript=`0` \r\n							&showIntro=`0` \r\n							&ajaxMax=`5` \r\n							&extract=`1`\r\n							&jscript=`jquery`\r\n							&tplInput=`AjaxSearch_tplInput`\r\n							&tplAjaxGrpResult=`AjaxSearch_tplAjaxGrpResult`\r\n							&tplAjaxResults=`AjaxSearch_tplAjaxResults`\r\n							&tplAjaxResult=`AjaxSearch_tplAjaxResult`\r\n							&showResults=`1`\r\n							&liveSearch=`0`\r\n							!]\r\n						</div>\r\n\r\n						<h2>News:</h2>\r\n						[[DocLister? \r\n						&parents=`2` \r\n						&display=`2`\r\n						&total=`20` \r\n						&tpl=`@CODE:<strong><a href=\"[+url+]\" title=\"[+e.title+]\">[+e.title+]</a></strong><br />\r\n						[+longtitle+]<br /><br />`\r\n						]]\r\n\r\n						<div>\r\n							<h2>Most Recent:</h2>\r\n\r\n							<ul>\r\n								[[DocLister? \r\n								&showInMenuOnly=`1` \r\n								&parents=`0`\r\n								&display=`5`\r\n								&tpl=`@CODE:<li><a href=\"[+url+]\" title=\"[+pagetitle+]\">[+pagetitle+]</a> <span class=\"date\">[+date+]</span></li>`\r\n								]]\r\n							</ul>\r\n\r\n						</div>\r\n						\r\n					</aside>\r\n				</div>\r\n			</div>\r\n			\r\n\r\n		</section>\r\n\r\n		<footer class=\"footer\">\r\n			<div class=\"container\">\r\n				<div class=\"row\">\r\n					<div class=\"col-sm-6\">\r\n						<a href=\"https://evo.im\" title=\"Learn more about Evolution CMS\">Evolution CMS</a> Starter-Template &copy;2006-[[$_SERVER[\'REQUEST_TIME\']:dateFormat=`Y` ]]\r\n					</div>\r\n					<div class=\"col-sm-6 text-right\">\r\n						Built with <a href=\"http://www.getbootstrap.com\" target=\"_blank\">Bootstrap</a> framework.\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</footer>\r\n\r\n		<div class=\"container mem\">\r\n			<small>Memory: [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document retrieved from [^s^]. </small>\r\n		</div>\r\n\r\n		<!-- Scripts\r\n–––––––––––––––––––––––––––––––––––––––––––––––––– -->	\r\n\r\n		<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js\"></script>\r\n		<!--[if lt IE 9]>\r\n<script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\r\n<script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\r\n<![endif]-->\r\n\r\n	</body>\r\n</html>', 0, 1, 0, 1586036574),
(9, 'sushi_item', 'sushi_item', 'Шаблон карточки товара', 0, 7, '', 0, '<h1>Калифорния угорь из базы шаблон</h1>', 0, 1, 1586185313, 1586955318),
(5, 'sushi', 'sushi', 'Общий шаблон', 0, 0, '', 0, '<h1>ЛЛЬО! Меня видно!</h1>\r\n	[*content*] ', 0, 1, 1585494283, 1587369834),
(6, 'sushi_cart', 'sushicart', '', 0, 0, '', 0, '', 0, 1, 1585575344, 1588329596),
(7, 'blog', 'blog', '', 0, 0, '', 0, '', 0, 1, 1586034052, 1586076218),
(8, 'Home', 'home', '', 0, 0, '', 0, '', 0, 1, 1586079492, 1586079492);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_tmplvars`
--

CREATE TABLE `g6vz_site_tmplvars` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Site Template Variables';

--
-- Дамп данных таблицы `g6vz_site_tmplvars`
--

INSERT INTO `g6vz_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`, `createdon`, `editedon`) VALUES
(1, 'textarea', 'desc', 'Meta description', 'Meta description', 0, 1, 0, '', 0, '', '', '[*introtext*]', 0, 0),
(2, 'text', 'keyw', 'Meta keywords', 'Meta keywords', 0, 1, 0, '', 0, '', '', '[*pagetitle*]', 0, 0),
(3, 'checkbox', 'noIndex', 'No index page', 'Meta robots', 0, 1, 0, 'Нет==<meta name=\"robots\" content=\"noindex, nofollow\">', 0, '', '', '', 0, 0),
(4, 'text', 'titl', 'Meta title', 'Meta title', 0, 1, 0, '', 0, '', '', '[*pagetitle*] - [(site_name)]', 0, 1586345566),
(5, 'image', 'sushi_img', 'Фото суши', '', 0, 7, 0, '', 0, 'image', '&align=none', '', 1586954583, 1586954583),
(6, 'text', 'sushi_desc', 'Описание товара', '', 0, 7, 0, '', 0, '', '', '', 1586954646, 1586954646),
(7, 'number', 'sushi_price', 'Цена', '', 0, 7, 0, '', 0, '', '', '1', 1586954745, 1586954745),
(8, 'text', 'sushi_amount', 'Вес/количество', 'Вес или количество товара (из описания tv)', 0, 7, 0, '', 0, '', '', '', 1586954923, 1586954923);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_tmplvar_access`
--

CREATE TABLE `g6vz_site_tmplvar_access` (
  `id` int(10) NOT NULL,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for template variable access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_tmplvar_contentvalues`
--

CREATE TABLE `g6vz_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Site Template Variables Content Values Link Table';

--
-- Дамп данных таблицы `g6vz_site_tmplvar_contentvalues`
--

INSERT INTO `g6vz_site_tmplvar_contentvalues` (`id`, `tmplvarid`, `contentid`, `value`) VALUES
(1, 3, 9, 'demo miniblog howto tutorial posting'),
(2, 3, 18, 'demo older posting'),
(3, 8, 9, 'assets/images/evo-logo.png'),
(5, 4, 51, '[*pagetitle*]'),
(6, 5, 55, 'assets/images/sushi/0015.jpg'),
(7, 8, 55, '320 грамм'),
(8, 6, 55, 'Рис, нори, лист салата, болгарский перец, огурец, помидор, кунжут, соус «Терияки»'),
(9, 5, 56, 'assets/images/sushi/0033.jpg'),
(10, 8, 56, '227 грамм'),
(11, 6, 56, 'Икра  «Тобико», рис, нори, креветка тигровая, лосось, сливочный сыр'),
(12, 7, 56, '17'),
(13, 7, 55, '263');

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_site_tmplvar_templates`
--

CREATE TABLE `g6vz_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Site Template Variables Templates Link Table';

--
-- Дамп данных таблицы `g6vz_site_tmplvar_templates`
--

INSERT INTO `g6vz_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(2, 0, 0),
(5, 9, 0),
(4, 3, 4),
(1, 3, 1),
(2, 3, 2),
(4, 6, 3),
(4, 7, 4),
(3, 6, 2),
(5, 5, 4),
(2, 6, 1),
(3, 3, 3),
(1, 6, 0),
(1, 7, 1),
(2, 7, 2),
(3, 8, 3),
(4, 9, 0),
(1, 8, 1),
(2, 8, 2),
(3, 7, 3),
(4, 8, 4),
(6, 9, 1),
(7, 9, 2),
(8, 9, 3),
(5, 6, 4),
(6, 6, 5),
(7, 6, 6),
(8, 6, 7),
(4, 5, 3),
(3, 5, 2),
(2, 5, 1),
(1, 5, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_system_eventnames`
--

CREATE TABLE `g6vz_system_eventnames` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='System Event Names.';

--
-- Дамп данных таблицы `g6vz_system_eventnames`
--

INSERT INTO `g6vz_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1, 'OnDocPublished', 5, ''),
(2, 'OnDocUnPublished', 5, ''),
(3, 'OnWebPagePrerender', 5, ''),
(4, 'OnWebLogin', 3, ''),
(5, 'OnBeforeWebLogout', 3, ''),
(6, 'OnWebLogout', 3, ''),
(7, 'OnWebSaveUser', 3, ''),
(8, 'OnWebDeleteUser', 3, ''),
(9, 'OnWebChangePassword', 3, ''),
(10, 'OnWebCreateGroup', 3, ''),
(11, 'OnManagerLogin', 2, ''),
(12, 'OnBeforeManagerLogout', 2, ''),
(13, 'OnManagerLogout', 2, ''),
(14, 'OnManagerSaveUser', 2, ''),
(15, 'OnManagerDeleteUser', 2, ''),
(16, 'OnManagerChangePassword', 2, ''),
(17, 'OnManagerCreateGroup', 2, ''),
(18, 'OnBeforeCacheUpdate', 4, ''),
(19, 'OnCacheUpdate', 4, ''),
(20, 'OnMakePageCacheKey', 4, ''),
(21, 'OnLoadWebPageCache', 4, ''),
(22, 'OnBeforeSaveWebPageCache', 4, ''),
(23, 'OnChunkFormPrerender', 1, 'Chunks'),
(24, 'OnChunkFormRender', 1, 'Chunks'),
(25, 'OnBeforeChunkFormSave', 1, 'Chunks'),
(26, 'OnChunkFormSave', 1, 'Chunks'),
(27, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
(28, 'OnChunkFormDelete', 1, 'Chunks'),
(29, 'OnDocFormPrerender', 1, 'Documents'),
(30, 'OnDocFormRender', 1, 'Documents'),
(31, 'OnBeforeDocFormSave', 1, 'Documents'),
(32, 'OnDocFormSave', 1, 'Documents'),
(33, 'OnBeforeDocFormDelete', 1, 'Documents'),
(34, 'OnDocFormDelete', 1, 'Documents'),
(35, 'OnDocFormUnDelete', 1, 'Documents'),
(36, 'onBeforeMoveDocument', 1, 'Documents'),
(37, 'onAfterMoveDocument', 1, 'Documents'),
(38, 'OnPluginFormPrerender', 1, 'Plugins'),
(39, 'OnPluginFormRender', 1, 'Plugins'),
(40, 'OnBeforePluginFormSave', 1, 'Plugins'),
(41, 'OnPluginFormSave', 1, 'Plugins'),
(42, 'OnBeforePluginFormDelete', 1, 'Plugins'),
(43, 'OnPluginFormDelete', 1, 'Plugins'),
(44, 'OnSnipFormPrerender', 1, 'Snippets'),
(45, 'OnSnipFormRender', 1, 'Snippets'),
(46, 'OnBeforeSnipFormSave', 1, 'Snippets'),
(47, 'OnSnipFormSave', 1, 'Snippets'),
(48, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
(49, 'OnSnipFormDelete', 1, 'Snippets'),
(50, 'OnTempFormPrerender', 1, 'Templates'),
(51, 'OnTempFormRender', 1, 'Templates'),
(52, 'OnBeforeTempFormSave', 1, 'Templates'),
(53, 'OnTempFormSave', 1, 'Templates'),
(54, 'OnBeforeTempFormDelete', 1, 'Templates'),
(55, 'OnTempFormDelete', 1, 'Templates'),
(56, 'OnTVFormPrerender', 1, 'Template Variables'),
(57, 'OnTVFormRender', 1, 'Template Variables'),
(58, 'OnBeforeTVFormSave', 1, 'Template Variables'),
(59, 'OnTVFormSave', 1, 'Template Variables'),
(60, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
(61, 'OnTVFormDelete', 1, 'Template Variables'),
(62, 'OnUserFormPrerender', 1, 'Users'),
(63, 'OnUserFormRender', 1, 'Users'),
(64, 'OnBeforeUserFormSave', 1, 'Users'),
(65, 'OnUserFormSave', 1, 'Users'),
(66, 'OnBeforeUserFormDelete', 1, 'Users'),
(67, 'OnUserFormDelete', 1, 'Users'),
(68, 'OnWUsrFormPrerender', 1, 'Web Users'),
(69, 'OnWUsrFormRender', 1, 'Web Users'),
(70, 'OnBeforeWUsrFormSave', 1, 'Web Users'),
(71, 'OnWUsrFormSave', 1, 'Web Users'),
(72, 'OnBeforeWUsrFormDelete', 1, 'Web Users'),
(73, 'OnWUsrFormDelete', 1, 'Web Users'),
(74, 'OnSiteRefresh', 1, ''),
(75, 'OnFileManagerUpload', 1, ''),
(76, 'OnModFormPrerender', 1, 'Modules'),
(77, 'OnModFormRender', 1, 'Modules'),
(78, 'OnBeforeModFormDelete', 1, 'Modules'),
(79, 'OnModFormDelete', 1, 'Modules'),
(80, 'OnBeforeModFormSave', 1, 'Modules'),
(81, 'OnModFormSave', 1, 'Modules'),
(82, 'OnBeforeWebLogin', 3, ''),
(83, 'OnWebAuthentication', 3, ''),
(84, 'OnBeforeManagerLogin', 2, ''),
(85, 'OnManagerAuthentication', 2, ''),
(86, 'OnSiteSettingsRender', 1, 'System Settings'),
(87, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
(88, 'OnUserSettingsRender', 1, 'System Settings'),
(89, 'OnInterfaceSettingsRender', 1, 'System Settings'),
(90, 'OnSecuritySettingsRender', 1, 'System Settings'),
(91, 'OnFileManagerSettingsRender', 1, 'System Settings'),
(92, 'OnMiscSettingsRender', 1, 'System Settings'),
(93, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
(94, 'OnRichTextEditorInit', 1, 'RichText Editor'),
(95, 'OnManagerPageInit', 2, ''),
(96, 'OnWebPageInit', 5, ''),
(97, 'OnLoadDocumentObject', 5, ''),
(98, 'OnBeforeLoadDocumentObject', 5, ''),
(99, 'OnAfterLoadDocumentObject', 5, ''),
(100, 'OnLoadWebDocument', 5, ''),
(101, 'OnParseDocument', 5, ''),
(102, 'OnParseProperties', 5, ''),
(103, 'OnBeforeParseParams', 5, ''),
(104, 'OnManagerLoginFormRender', 2, ''),
(105, 'OnWebPageComplete', 5, ''),
(106, 'OnLogPageHit', 5, ''),
(107, 'OnBeforeManagerPageInit', 2, ''),
(108, 'OnBeforeEmptyTrash', 1, 'Documents'),
(109, 'OnEmptyTrash', 1, 'Documents'),
(110, 'OnManagerLoginFormPrerender', 2, ''),
(111, 'OnStripAlias', 1, 'Documents'),
(112, 'OnMakeDocUrl', 5, ''),
(113, 'OnBeforeLoadExtension', 5, ''),
(114, 'OnCreateDocGroup', 1, 'Documents'),
(115, 'OnManagerWelcomePrerender', 2, ''),
(116, 'OnManagerWelcomeHome', 2, ''),
(117, 'OnManagerWelcomeRender', 2, ''),
(118, 'OnBeforeDocDuplicate', 1, 'Documents'),
(119, 'OnDocDuplicate', 1, 'Documents'),
(120, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
(121, 'OnManagerPreFrameLoader', 2, ''),
(122, 'OnManagerFrameLoader', 2, ''),
(123, 'OnManagerTreeInit', 2, ''),
(124, 'OnManagerTreePrerender', 2, ''),
(125, 'OnManagerTreeRender', 2, ''),
(126, 'OnManagerNodePrerender', 2, ''),
(127, 'OnManagerNodeRender', 2, ''),
(128, 'OnManagerMenuPrerender', 2, ''),
(129, 'OnManagerTopPrerender', 2, ''),
(130, 'OnDocFormTemplateRender', 1, 'Documents'),
(131, 'OnBeforeMinifyCss', 1, ''),
(132, 'OnPageUnauthorized', 1, ''),
(133, 'OnPageNotFound', 1, ''),
(134, 'OnFileBrowserUpload', 1, 'File Browser Events'),
(135, 'OnBeforeFileBrowserUpload', 1, 'File Browser Events'),
(136, 'OnFileBrowserDelete', 1, 'File Browser Events'),
(137, 'OnBeforeFileBrowserDelete', 1, 'File Browser Events'),
(138, 'OnFileBrowserInit', 1, 'File Browser Events'),
(139, 'OnFileBrowserMove', 1, 'File Browser Events'),
(140, 'OnBeforeFileBrowserMove', 1, 'File Browser Events'),
(141, 'OnFileBrowserCopy', 1, 'File Browser Events'),
(142, 'OnBeforeFileBrowserCopy', 1, 'File Browser Events'),
(143, 'OnBeforeFileBrowserRename', 1, 'File Browser Events'),
(144, 'OnFileBrowserRename', 1, 'File Browser Events'),
(145, 'OnBeforeCommentSave', 0, 'Comments Events'),
(146, 'OnCommentSave', 0, 'Comments Events'),
(147, 'OnBeforeCommentsDelete', 0, 'Comments Events'),
(148, 'OnCommentsDelete', 0, 'Comments Events'),
(149, 'OnBeforeCommentsPublish', 0, 'Comments Events'),
(150, 'OnCommentsPublish', 0, 'Comments Events'),
(151, 'OnBeforeCommentsUnpublish', 0, 'Comments Events'),
(152, 'OnCommentsUnpublish', 0, 'Comments Events'),
(153, 'OnBeforeCommentsRemove', 0, 'Comments Events'),
(154, 'OnCommentsRemove', 0, 'Comments Events'),
(155, 'OnBeforeCommentVote', 0, 'Comments Events'),
(156, 'OnCommentVote', 0, 'Comments Events'),
(157, 'OnInitializeCommerce', 6, 'Commerce'),
(158, 'OnInitializeOrderProcessor', 6, 'Commerce'),
(159, 'OnCollectSubtotals', 6, 'Commerce'),
(160, 'OnRegisterDelivery', 6, 'Commerce'),
(161, 'OnRegisterPayments', 6, 'Commerce'),
(162, 'OnBeforeOrderAddonsRender', 6, 'Commerce'),
(163, 'OnBeforeCartItemAdding', 6, 'Commerce'),
(164, 'OnBeforeCartItemUpdating', 6, 'Commerce'),
(165, 'OnCartChanged', 6, 'Commerce'),
(166, 'OnOrderRawDataChanged', 6, 'Commerce'),
(167, 'OnBeforeOrderProcessing', 6, 'Commerce'),
(168, 'OnBeforePaymentProcess', 6, 'Commerce'),
(169, 'OnBeforePaymentCreate', 6, 'Commerce'),
(170, 'OnBeforeOrderSaving', 6, 'Commerce'),
(171, 'OnBeforeOrderDeleting', 6, 'Commerce'),
(172, 'OnBeforeOrderSending', 6, 'Commerce'),
(173, 'OnOrderSaved', 6, 'Commerce'),
(174, 'OnOrderDeleted', 6, 'Commerce'),
(175, 'OnOrderProcessed', 6, 'Commerce'),
(176, 'OnBeforeOrderHistoryUpdate', 6, 'Commerce'),
(177, 'OnBeforeCustomerNotifySending', 6, 'Commerce'),
(178, 'OnManagerBeforeOrdersListRender', 6, 'Commerce'),
(179, 'OnManagerOrdersListRender', 6, 'Commerce'),
(180, 'OnManagerBeforeOrderRender', 6, 'Commerce'),
(181, 'OnManagerOrderRender', 6, 'Commerce'),
(182, 'OnManagerBeforeOrderEditRender', 6, 'Commerce'),
(183, 'OnManagerOrderEditRender', 6, 'Commerce'),
(184, 'OnManagerBeforeOrderValidating', 6, 'Commerce'),
(185, 'OnManagerOrderValidated', 6, 'Commerce'),
(186, 'OnManagerStatusesListRender', 6, 'Commerce'),
(187, 'OnManagerStatusRender', 6, 'Commerce'),
(188, 'OnManagerCurrencyListRender', 6, 'Commerce'),
(189, 'OnManagerCurrencyRender', 6, 'Commerce'),
(190, 'OnManagerBeforeDefaultCurrencyChange', 6, 'Commerce'),
(191, 'OnManagerRegisterCommerceController', 6, 'Commerce'),
(192, 'OnBeforeCurrencyChange', 6, 'Commerce'),
(193, 'OnCommerceAjaxResponse', 6, 'Commerce'),
(194, 'OnOrderPlaceholdersPopulated', 6, 'Commerce');

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_system_settings`
--

CREATE TABLE `g6vz_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains Content Manager settings.';

--
-- Дамп данных таблицы `g6vz_system_settings`
--

INSERT INTO `g6vz_system_settings` (`setting_name`, `setting_value`) VALUES
('settings_version', '2.0.2'),
('manager_theme', 'default'),
('server_offset_time', '0'),
('manager_language', 'russian-UTF8'),
('modx_charset', 'UTF-8'),
('site_name', 'HiLo Poker'),
('site_start', '1'),
('error_page', '7'),
('unauthorized_page', '4'),
('site_status', '1'),
('auto_template_logic', 'sibling'),
('default_template', '3'),
('old_template', '3'),
('publish_default', '1'),
('friendly_urls', '1'),
('friendly_alias_urls', '1'),
('use_alias_path', '1'),
('cache_type', '2'),
('failed_login_attempts', '3'),
('blocked_minutes', '60'),
('use_captcha', '0'),
('emailsender', 'jkray17@gmail.com'),
('use_editor', '1'),
('use_browser', '1'),
('fe_editor_lang', 'russian-UTF8'),
('fck_editor_toolbar', 'standard'),
('fck_editor_autolang', '0'),
('editor_css_path', ''),
('editor_css_selectors', ''),
('upload_maxsize', '10485760'),
('manager_layout', '4'),
('auto_menuindex', '1'),
('session.cookie.lifetime', '604800'),
('mail_check_timeperiod', '600'),
('manager_direction', 'ltr'),
('xhtml_urls', '0'),
('automatic_alias', '1'),
('datetime_format', 'dd-mm-YYYY'),
('warning_visibility', '0'),
('remember_last_tab', '1'),
('enable_bindings', '1'),
('seostrict', '1'),
('number_of_results', '30'),
('theme_refresher', ''),
('show_picker', '0'),
('show_newresource_btn', '0'),
('show_fullscreen_btn', '0'),
('email_sender_method', '1'),
('site_id', '5e467b6434e7c'),
('a', '30'),
('site_unavailable_page', ''),
('reload_site_unavailable', ''),
('siteunavailable_message_default', 'В настоящее время сайт недоступен.'),
('site_unavailable_message', 'В настоящее время сайт недоступен.'),
('chunk_processor', 'DLTemplate'),
('cache_default', '1'),
('search_default', '1'),
('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('docid_incrmnt_method', '0'),
('enable_cache', '1'),
('minifyphp_incache', '0'),
('server_protocol', 'http'),
('rss_url_news', 'http://feeds.feedburner.com/evocms-release-news'),
('track_visitors', '0'),
('friendly_url_prefix', ''),
('friendly_url_suffix', '.html'),
('make_folders', '0'),
('aliaslistingfolder', '0'),
('allow_duplicate_alias', '0'),
('manager_theme_mode', '3'),
('login_logo', ''),
('login_bg', ''),
('login_form_position', 'left'),
('login_form_style', 'dark'),
('manager_menu_position', 'top'),
('tree_page_click', '27'),
('use_breadcrumbs', '0'),
('global_tabs', '1'),
('group_tvs', '0'),
('resource_tree_node_name', 'pagetitle'),
('session_timeout', '15'),
('tree_show_protected', '0'),
('datepicker_offset', '-10'),
('number_of_logs', '100'),
('number_of_messages', '40'),
('which_editor', 'TinyMCE4'),
('tinymce4_theme', 'custom'),
('tinymce4_skin', 'lightgray'),
('tinymce4_skintheme', 'inlite'),
('tinymce4_template_docs', ''),
('tinymce4_template_chunks', ''),
('tinymce4_entermode', 'p'),
('tinymce4_element_format', 'xhtml'),
('tinymce4_schema', 'html5'),
('tinymce4_custom_plugins', 'advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
('tinymce4_custom_buttons1', 'undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
('tinymce4_custom_buttons2', 'link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code formatselect'),
('tinymce4_custom_buttons3', ''),
('tinymce4_custom_buttons4', ''),
('tinymce4_blockFormats', 'Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3'),
('use_udperms', '1'),
('udperms_allowroot', '0'),
('allow_eval', 'with_scan'),
('safe_functions_at_eval', 'time,date,strtotime,strftime'),
('check_files_onlogin', 'index.php\r\n.htaccess\r\nmanager/index.php\r\n/core/config/database/connections/default.php'),
('validate_referer', '1'),
('rss_url_security', 'http://feeds.feedburner.com/evocms-security-news'),
('error_reporting', '1'),
('send_errormail', '0'),
('pwd_hash_algo', 'UNCRYPT'),
('reload_captcha_words', ''),
('captcha_words', 'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('captcha_words_default', 'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('filemanager_path', 'E:/OSPanel/domains/evo20/'),
('upload_files', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg,tpl'),
('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg'),
('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('upload_flash', 'fla,flv,swf'),
('new_file_permissions', '0644'),
('new_folder_permissions', '0755'),
('which_browser', 'mcpuk'),
('rb_webuser', '0'),
('rb_base_dir', 'E:/OSPanel/domains/evo20/assets/'),
('rb_base_url', 'assets/'),
('clean_uploaded_filename', '1'),
('strip_image_paths', '1'),
('maxImageWidth', '2600'),
('maxImageHeight', '2200'),
('clientResize', '0'),
('noThumbnailsRecreation', '0'),
('thumbWidth', '150'),
('thumbHeight', '150'),
('thumbsDir', '.thumbs'),
('jpegQuality', '90'),
('denyZipDownload', '0'),
('denyExtensionRename', '0'),
('showHiddenFiles', '0'),
('email_method', 'mail'),
('smtp_auth', '0'),
('smtp_secure', 'none'),
('smtp_host', 'smtp.example.com'),
('smtp_port', '25'),
('smtp_username', 'emailsender'),
('reload_emailsubject', ''),
('emailsubject_default', 'Данные для авторизации'),
('emailsubject', 'Данные для авторизации'),
('reload_websignupemail_message', ''),
('system_email_websignup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('websignupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_system_email_webreminder_message', ''),
('system_email_webreminder_default', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('webpwdreminder_message', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('allow_multiple_emails', '0'),
('lang_code', 'en'),
('sys_files_checksum', 'a:4:{s:34:\"E:/OSPanel/domains/evo20/index.php\";s:32:\"6daef9ac899a7a01447baa236cf48eda\";s:34:\"E:/OSPanel/domains/evo20/.htaccess\";s:32:\"fcbb0bbd142d5e130f21c3c95ff43342\";s:42:\"E:/OSPanel/domains/evo20/manager/index.php\";s:32:\"a03fa8d6548de0562fdebcb67ba0e736\";s:70:\"E:/OSPanel/domains/evo20//core/config/database/connections/default.php\";s:32:\"b1be543a703c85acec2b52bc9b1472de\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_user_attributes`
--

CREATE TABLE `g6vz_user_attributes` (
  `id` int(10) NOT NULL,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `verified` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains information about the backend users.';

--
-- Дамп данных таблицы `g6vz_user_attributes`
--

INSERT INTO `g6vz_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `createdon`, `editedon`, `verified`) VALUES
(1, 1, 'Admin', 1, 'jkray17@gmail.com', '', '', 0, 0, 0, 11, 1586004743, 1586080612, 0, '1', 0, 0, '', '', '', '', '', '', '', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_user_messages`
--

CREATE TABLE `g6vz_user_messages` (
  `id` int(10) NOT NULL,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains messages for the Content Manager messaging system.';

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_user_roles`
--

CREATE TABLE `g6vz_user_roles` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `category_manager` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `assets_files` int(1) NOT NULL DEFAULT '0',
  `assets_images` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  `display_locks` int(1) NOT NULL DEFAULT '0',
  `change_resourcetype` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains information describing the user roles.';

--
-- Дамп данных таблицы `g6vz_user_roles`
--

INSERT INTO `g6vz_user_roles` (`id`, `name`, `description`, `frames`, `home`, `view_document`, `new_document`, `save_document`, `publish_document`, `delete_document`, `empty_trash`, `action_ok`, `logout`, `help`, `messages`, `new_user`, `edit_user`, `logs`, `edit_parser`, `save_parser`, `edit_template`, `settings`, `credits`, `new_template`, `save_template`, `delete_template`, `edit_snippet`, `new_snippet`, `save_snippet`, `delete_snippet`, `edit_chunk`, `new_chunk`, `save_chunk`, `delete_chunk`, `empty_cache`, `edit_document`, `change_password`, `error_dialog`, `about`, `category_manager`, `file_manager`, `assets_files`, `assets_images`, `save_user`, `delete_user`, `save_password`, `edit_role`, `save_role`, `delete_role`, `new_role`, `access_permissions`, `bk_manager`, `new_plugin`, `edit_plugin`, `save_plugin`, `delete_plugin`, `new_module`, `edit_module`, `save_module`, `delete_module`, `exec_module`, `view_eventlog`, `delete_eventlog`, `new_web_user`, `edit_web_user`, `save_web_user`, `delete_web_user`, `web_access_permissions`, `view_unpublished`, `import_static`, `export_static`, `remove_locks`, `display_locks`, `change_resourcetype`) VALUES
(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1),
(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_user_settings`
--

CREATE TABLE `g6vz_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains backend user settings.';

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_webgroup_access`
--

CREATE TABLE `g6vz_webgroup_access` (
  `id` int(10) NOT NULL,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for web access permissions.';

--
-- Дамп данных таблицы `g6vz_webgroup_access`
--

INSERT INTO `g6vz_webgroup_access` (`id`, `webgroup`, `documentgroup`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_webgroup_names`
--

CREATE TABLE `g6vz_webgroup_names` (
  `id` int(10) NOT NULL,
  `name` varchar(245) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for web access permissions.';

--
-- Дамп данных таблицы `g6vz_webgroup_names`
--

INSERT INTO `g6vz_webgroup_names` (`id`, `name`) VALUES
(1, 'Site Admins'),
(2, 'Registered Users');

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_web_groups`
--

CREATE TABLE `g6vz_web_groups` (
  `id` int(10) NOT NULL,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains data used for web access permissions.';

--
-- Дамп данных таблицы `g6vz_web_groups`
--

INSERT INTO `g6vz_web_groups` (`id`, `webgroup`, `webuser`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_web_users`
--

CREATE TABLE `g6vz_web_users` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `g6vz_web_users`
--

INSERT INTO `g6vz_web_users` (`id`, `username`, `password`, `cachepwd`) VALUES
(1, 'siteadmin', '5f4dcc3b5aa765d61d8327deb882cf99', ''),
(2, 'jkray17', '9adf8b9c95313c7b9901b0b61e041ab9', '');

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_web_user_attributes`
--

CREATE TABLE `g6vz_web_user_attributes` (
  `id` int(10) NOT NULL,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `verified` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains information for web users.';

--
-- Дамп данных таблицы `g6vz_web_user_attributes`
--

INSERT INTO `g6vz_web_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `createdon`, `editedon`, `verified`) VALUES
(1, 1, 'Site Admin', 0, 'you@example.com', '', '', 0, 0, 0, 25, 1129049624, 1129063123, 0, 'f426f3209310abfddf2ee00e929774b4', 0, 0, '', '', '', '', '', '', '', '', 1581677412, 0, 1),
(2, 2, 'Тестер Тестирович', 0, 'jkray17@gmail.com', '', '', 0, 0, 0, 0, 0, 0, 0, 'a93qqtog6ns5kp84relov8f6r06d0rm9', 0, 0, '220', '', '', '', '', '', '', '', 1581680258, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `g6vz_web_user_settings`
--

CREATE TABLE `g6vz_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Contains web user settings.';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `g6vz_active_users`
--
ALTER TABLE `g6vz_active_users`
  ADD PRIMARY KEY (`sid`,`username`);

--
-- Индексы таблицы `g6vz_active_user_locks`
--
ALTER TABLE `g6vz_active_user_locks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_element_id` (`elementType`,`elementId`,`sid`);

--
-- Индексы таблицы `g6vz_active_user_sessions`
--
ALTER TABLE `g6vz_active_user_sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Индексы таблицы `g6vz_categories`
--
ALTER TABLE `g6vz_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_comments`
--
ALTER TABLE `g6vz_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_idx` (`id`,`createdby`),
  ADD KEY `thread` (`thread`,`context`);

--
-- Индексы таблицы `g6vz_comments_extended_fields`
--
ALTER TABLE `g6vz_comments_extended_fields`
  ADD PRIMARY KEY (`id`,`name`);

--
-- Индексы таблицы `g6vz_comments_guests`
--
ALTER TABLE `g6vz_comments_guests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Индексы таблицы `g6vz_comments_lastview`
--
ALTER TABLE `g6vz_comments_lastview`
  ADD UNIQUE KEY `thread_uid` (`thread`,`context`,`uid`);

--
-- Индексы таблицы `g6vz_comments_rating`
--
ALTER TABLE `g6vz_comments_rating`
  ADD PRIMARY KEY (`comment`);

--
-- Индексы таблицы `g6vz_comments_rating_log`
--
ALTER TABLE `g6vz_comments_rating_log`
  ADD UNIQUE KEY `vote` (`comment`,`uid`);

--
-- Индексы таблицы `g6vz_comments_stat`
--
ALTER TABLE `g6vz_comments_stat`
  ADD UNIQUE KEY `thread` (`thread`,`context`);

--
-- Индексы таблицы `g6vz_comments_subscriptions`
--
ALTER TABLE `g6vz_comments_subscriptions`
  ADD UNIQUE KEY `subscription` (`context`,`thread`,`uid`);

--
-- Индексы таблицы `g6vz_comments_tree`
--
ALTER TABLE `g6vz_comments_tree`
  ADD PRIMARY KEY (`idAncestor`,`idDescendant`),
  ADD KEY `idDescendant` (`idDescendant`),
  ADD KEY `main` (`idAncestor`,`idDescendant`,`idNearestAncestor`,`level`),
  ADD KEY `idNearestAncestor` (`idNearestAncestor`);

--
-- Индексы таблицы `g6vz_commerce_currency`
--
ALTER TABLE `g6vz_commerce_currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `g6vz_commerce_orders`
--
ALTER TABLE `g6vz_commerce_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `g6vz_commerce_order_history`
--
ALTER TABLE `g6vz_commerce_order_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`,`status_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `g6vz_commerce_order_payments`
--
ALTER TABLE `g6vz_commerce_order_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `hash` (`hash`),
  ADD KEY `original_order_id` (`original_order_id`),
  ADD KEY `original_order_id_2` (`original_order_id`);

--
-- Индексы таблицы `g6vz_commerce_order_products`
--
ALTER TABLE `g6vz_commerce_order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`,`product_id`);

--
-- Индексы таблицы `g6vz_commerce_order_statuses`
--
ALTER TABLE `g6vz_commerce_order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_documentgroup_names`
--
ALTER TABLE `g6vz_documentgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `g6vz_document_groups`
--
ALTER TABLE `g6vz_document_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_dg_id` (`document_group`,`document`),
  ADD KEY `document` (`document`),
  ADD KEY `document_group` (`document_group`);

--
-- Индексы таблицы `g6vz_event_log`
--
ALTER TABLE `g6vz_event_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `g6vz_jot_content`
--
ALTER TABLE `g6vz_jot_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `secip` (`secip`),
  ADD KEY `tagidx` (`tagid`),
  ADD KEY `uparent` (`uparent`);

--
-- Индексы таблицы `g6vz_jot_subscriptions`
--
ALTER TABLE `g6vz_jot_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uparent` (`uparent`),
  ADD KEY `tagid` (`tagid`),
  ADD KEY `userid` (`userid`);

--
-- Индексы таблицы `g6vz_manager_log`
--
ALTER TABLE `g6vz_manager_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_manager_users`
--
ALTER TABLE `g6vz_manager_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `g6vz_membergroup_access`
--
ALTER TABLE `g6vz_membergroup_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_membergroup_names`
--
ALTER TABLE `g6vz_membergroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `g6vz_member_groups`
--
ALTER TABLE `g6vz_member_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_group_member` (`user_group`,`member`);

--
-- Индексы таблицы `g6vz_rtss`
--
ALTER TABLE `g6vz_rtss`
  ADD UNIQUE KEY `ecid` (`element`,`context`);

--
-- Индексы таблицы `g6vz_site_content`
--
ALTER TABLE `g6vz_site_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `aliasidx` (`alias`),
  ADD KEY `typeidx` (`type`);
ALTER TABLE `g6vz_site_content` ADD FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`);

--
-- Индексы таблицы `g6vz_site_htmlsnippets`
--
ALTER TABLE `g6vz_site_htmlsnippets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_site_modules`
--
ALTER TABLE `g6vz_site_modules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_site_module_access`
--
ALTER TABLE `g6vz_site_module_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_site_module_depobj`
--
ALTER TABLE `g6vz_site_module_depobj`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_site_plugins`
--
ALTER TABLE `g6vz_site_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_site_plugin_events`
--
ALTER TABLE `g6vz_site_plugin_events`
  ADD PRIMARY KEY (`pluginid`,`evtid`);

--
-- Индексы таблицы `g6vz_site_snippets`
--
ALTER TABLE `g6vz_site_snippets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_site_templates`
--
ALTER TABLE `g6vz_site_templates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_site_tmplvars`
--
ALTER TABLE `g6vz_site_tmplvars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indx_rank` (`rank`);

--
-- Индексы таблицы `g6vz_site_tmplvar_access`
--
ALTER TABLE `g6vz_site_tmplvar_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_site_tmplvar_contentvalues`
--
ALTER TABLE `g6vz_site_tmplvar_contentvalues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_tvid_contentid` (`tmplvarid`,`contentid`),
  ADD KEY `idx_tmplvarid` (`tmplvarid`),
  ADD KEY `idx_id` (`contentid`);
ALTER TABLE `g6vz_site_tmplvar_contentvalues` ADD FULLTEXT KEY `value_ft_idx` (`value`);

--
-- Индексы таблицы `g6vz_site_tmplvar_templates`
--
ALTER TABLE `g6vz_site_tmplvar_templates`
  ADD PRIMARY KEY (`tmplvarid`,`templateid`);

--
-- Индексы таблицы `g6vz_system_eventnames`
--
ALTER TABLE `g6vz_system_eventnames`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `g6vz_system_settings`
--
ALTER TABLE `g6vz_system_settings`
  ADD PRIMARY KEY (`setting_name`);

--
-- Индексы таблицы `g6vz_user_attributes`
--
ALTER TABLE `g6vz_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`internalKey`);

--
-- Индексы таблицы `g6vz_user_messages`
--
ALTER TABLE `g6vz_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_user_roles`
--
ALTER TABLE `g6vz_user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_user_settings`
--
ALTER TABLE `g6vz_user_settings`
  ADD PRIMARY KEY (`user`,`setting_name`),
  ADD KEY `setting_name` (`setting_name`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `g6vz_webgroup_access`
--
ALTER TABLE `g6vz_webgroup_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `g6vz_webgroup_names`
--
ALTER TABLE `g6vz_webgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `g6vz_web_groups`
--
ALTER TABLE `g6vz_web_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`);

--
-- Индексы таблицы `g6vz_web_users`
--
ALTER TABLE `g6vz_web_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `g6vz_web_user_attributes`
--
ALTER TABLE `g6vz_web_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`internalKey`);

--
-- Индексы таблицы `g6vz_web_user_settings`
--
ALTER TABLE `g6vz_web_user_settings`
  ADD PRIMARY KEY (`webuser`,`setting_name`),
  ADD KEY `setting_name` (`setting_name`),
  ADD KEY `webuserid` (`webuser`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `g6vz_active_user_locks`
--
ALTER TABLE `g6vz_active_user_locks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT для таблицы `g6vz_categories`
--
ALTER TABLE `g6vz_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `g6vz_comments`
--
ALTER TABLE `g6vz_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_commerce_currency`
--
ALTER TABLE `g6vz_commerce_currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `g6vz_commerce_orders`
--
ALTER TABLE `g6vz_commerce_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_commerce_order_history`
--
ALTER TABLE `g6vz_commerce_order_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_commerce_order_payments`
--
ALTER TABLE `g6vz_commerce_order_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_commerce_order_products`
--
ALTER TABLE `g6vz_commerce_order_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_commerce_order_statuses`
--
ALTER TABLE `g6vz_commerce_order_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `g6vz_documentgroup_names`
--
ALTER TABLE `g6vz_documentgroup_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `g6vz_document_groups`
--
ALTER TABLE `g6vz_document_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `g6vz_event_log`
--
ALTER TABLE `g6vz_event_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `g6vz_jot_content`
--
ALTER TABLE `g6vz_jot_content`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `g6vz_jot_subscriptions`
--
ALTER TABLE `g6vz_jot_subscriptions`
  MODIFY `id` mediumint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_manager_log`
--
ALTER TABLE `g6vz_manager_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=686;

--
-- AUTO_INCREMENT для таблицы `g6vz_manager_users`
--
ALTER TABLE `g6vz_manager_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `g6vz_membergroup_access`
--
ALTER TABLE `g6vz_membergroup_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_membergroup_names`
--
ALTER TABLE `g6vz_membergroup_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_member_groups`
--
ALTER TABLE `g6vz_member_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_site_content`
--
ALTER TABLE `g6vz_site_content`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `g6vz_site_htmlsnippets`
--
ALTER TABLE `g6vz_site_htmlsnippets`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `g6vz_site_modules`
--
ALTER TABLE `g6vz_site_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `g6vz_site_module_access`
--
ALTER TABLE `g6vz_site_module_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_site_module_depobj`
--
ALTER TABLE `g6vz_site_module_depobj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_site_plugins`
--
ALTER TABLE `g6vz_site_plugins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `g6vz_site_snippets`
--
ALTER TABLE `g6vz_site_snippets`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `g6vz_site_templates`
--
ALTER TABLE `g6vz_site_templates`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `g6vz_site_tmplvars`
--
ALTER TABLE `g6vz_site_tmplvars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `g6vz_site_tmplvar_access`
--
ALTER TABLE `g6vz_site_tmplvar_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_site_tmplvar_contentvalues`
--
ALTER TABLE `g6vz_site_tmplvar_contentvalues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `g6vz_system_eventnames`
--
ALTER TABLE `g6vz_system_eventnames`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT для таблицы `g6vz_user_attributes`
--
ALTER TABLE `g6vz_user_attributes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `g6vz_user_messages`
--
ALTER TABLE `g6vz_user_messages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `g6vz_user_roles`
--
ALTER TABLE `g6vz_user_roles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `g6vz_webgroup_access`
--
ALTER TABLE `g6vz_webgroup_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `g6vz_webgroup_names`
--
ALTER TABLE `g6vz_webgroup_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `g6vz_web_groups`
--
ALTER TABLE `g6vz_web_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `g6vz_web_users`
--
ALTER TABLE `g6vz_web_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `g6vz_web_user_attributes`
--
ALTER TABLE `g6vz_web_user_attributes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `g6vz_comments_extended_fields`
--
ALTER TABLE `g6vz_comments_extended_fields`
  ADD CONSTRAINT `comments_extended_fields_ibfk_1` FOREIGN KEY (`id`) REFERENCES `g6vz_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `g6vz_comments_guests`
--
ALTER TABLE `g6vz_comments_guests`
  ADD CONSTRAINT `comments_guests_ibfk_1` FOREIGN KEY (`id`) REFERENCES `g6vz_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `g6vz_comments_rating`
--
ALTER TABLE `g6vz_comments_rating`
  ADD CONSTRAINT `comments_rating_ibfk_1` FOREIGN KEY (`comment`) REFERENCES `g6vz_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `g6vz_comments_rating_log`
--
ALTER TABLE `g6vz_comments_rating_log`
  ADD CONSTRAINT `comments_rating_log_ibfk_1` FOREIGN KEY (`comment`) REFERENCES `g6vz_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `g6vz_comments_tree`
--
ALTER TABLE `g6vz_comments_tree`
  ADD CONSTRAINT `commentsTree_ibfk_1` FOREIGN KEY (`idAncestor`) REFERENCES `g6vz_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commentsTree_ibfk_2` FOREIGN KEY (`idDescendant`) REFERENCES `g6vz_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `g6vz_commerce_order_history`
--
ALTER TABLE `g6vz_commerce_order_history`
  ADD CONSTRAINT `commerce_order_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `g6vz_commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `g6vz_commerce_order_payments`
--
ALTER TABLE `g6vz_commerce_order_payments`
  ADD CONSTRAINT `commerce_order_payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `g6vz_commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `g6vz_commerce_order_products`
--
ALTER TABLE `g6vz_commerce_order_products`
  ADD CONSTRAINT `commerce_order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `g6vz_commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
