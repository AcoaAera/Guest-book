-- --------------------------------------------------------
-- Хост:                         localhost
-- Версия сервера:               8.0.37 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных test_db
CREATE DATABASE IF NOT EXISTS `test_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `test_db`;

-- Дамп структуры для таблица test_db.feedback
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `email` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'E-mail',
  `comment` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Комментарий',
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'IP адрес',
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Браузер',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_email_index` (`email`),
  KEY `feedback_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы test_db.feedback: ~16 rows (приблизительно)
INSERT INTO `feedback` (`id`, `user_name`, `email`, `comment`, `ip`, `browser`, `created_at`) VALUES
	(1, 'Олег', 'oleg1997@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tempus purus tortor, in fermentum orci.', '127.0.0.1', 'Chrome 125', '2024-06-08 17:18:57'),
	(2, 'Игорь', 'igor@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce massa massa, lacinia bibendum iaculis eget.', '127.0.0.1', 'Chrome 125', '2024-06-08 17:21:51'),
	(3, 'Ольга', 'olga@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In in ipsum eu magna aliquet fringilla.', '127.0.0.1', 'Chrome 125', '2024-06-08 17:21:52'),
	(4, 'Святослав', 'svjatoslav@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum arcu arcu, pulvinar vel maximus et.', '127.0.0.1', 'Chrome 125', '2024-06-08 17:21:52'),
	(5, 'Ярополк', 'jaropolk@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper lacinia bibendum. Nam tempus magna.', '127.0.0.1', 'Chrome 125', '2024-06-08 17:21:52'),
	(6, 'Святополк', 'svjatopolk@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquet enim id purus convallis, aliquet.', '127.0.0.1', 'Chrome 125', '2024-06-08 17:21:54'),
	(7, 'Ярослав', 'jaroslav@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris suscipit lectus odio, in vestibulum nisl.', '127.0.0.1', 'Chrome 125', '2024-06-08 17:21:54'),
	(8, 'Святополк', 'svjatopolk@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras interdum sit amet quam et fringilla.', '127.0.0.1', 'Chrome 125', '2024-06-08 17:21:55'),
	(9, 'Изяслав', 'izjaslav@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in mauris ut sem rutrum dapibus.', '127.0.0.1', 'Chrome 125', '2024-06-09 08:48:19'),
	(10, 'Всеслав', 'vseslav@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed condimentum risus eget sem iaculis mollis.', '127.0.0.1', 'Chrome 125', '2024-06-09 08:48:21'),
	(11, 'Всеволод', 'vsevolod@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elit metus, consequat id interdum eu.', '127.0.0.1', 'Chrome 125', '2024-06-09 08:48:35'),
	(12, 'Мстислав', 'mstislav@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis id odio tortor. Suspendisse sodales tellus.', '127.0.0.1', 'Chrome 125', '2024-06-09 08:48:38'),
	(13, 'Вячеслав', 'vjatcheslav@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate tincidunt libero vestibulum iaculis. Vivamus.', '127.0.0.1', 'Chrome 125', '2024-06-09 08:57:39'),
	(14, 'Изяслав', 'izjaslav@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel rhoncus quam. Pellentesque habitant morbi.', '127.0.0.1', 'Chrome 125', '2024-06-09 08:58:06'),
	(15, 'Юрий', 'jurii@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum faucibus aliquet velit. Phasellus vitae fringilla.', '127.0.0.1', 'Chrome 125', '2024-06-09 09:41:43'),
	(16, 'Глеб', 'gleb@kievskaja.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce feugiat non nunc ut mattis. Etiam.', '127.0.0.1', 'Chrome 125', '2024-06-09 11:50:30');

-- Дамп структуры для таблица test_db.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы test_db.migrations: ~2 rows (приблизительно)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2024_06_08_174614_create_feedback_table', 1);

-- Дамп структуры для таблица test_db.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы test_db.personal_access_tokens: ~0 rows (приблизительно)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
