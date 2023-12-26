-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for laravel_passport
CREATE DATABASE IF NOT EXISTS `laravel_passport` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laravel_passport`;

-- Dumping structure for table laravel_passport.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint unsigned NOT NULL,
  `state_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_country_id_foreign` (`country_id`),
  KEY `cities_state_id_foreign` (`state_id`),
  CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.cities: ~9 rows (approximately)
INSERT INTO `cities` (`id`, `name`, `country_id`, `state_id`) VALUES
	(1, 'Mumbai', 3, 3),
	(2, 'Pune', 3, 3),
	(3, 'Jalgaon', 3, 3),
	(4, 'Goa', 3, 4),
	(5, 'Patna', 3, 5),
	(6, 'Gaya', 3, 5),
	(7, 'Amritsar', 3, 6),
	(8, 'Firozpur', 3, 6),
	(9, 'Bathinda', 3, 6);

-- Dumping structure for table laravel_passport.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.countries: ~6 rows (approximately)
INSERT INTO `countries` (`id`, `name`) VALUES
	(1, 'Australia'),
	(2, 'Germany'),
	(3, 'India'),
	(4, 'Laos'),
	(5, 'United States'),
	(6, 'Zimbabwe');

-- Dumping structure for table laravel_passport.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table laravel_passport.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_user_id_foreign` (`user_id`),
  CONSTRAINT `images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.images: ~1 rows (approximately)
INSERT INTO `images` (`id`, `title`, `image_path`, `user_id`, `created_at`, `updated_at`) VALUES
	(2, 'First image', 'images/OSjCkeyDKEpPtbOBNskEEEb5eARjseN1AdwX2Y7s.jpg', 11, '2023-12-25 02:27:00', '2023-12-25 02:27:00'),
	(3, 'First image', 'images/ByW2bp0Nej8NtTlgKDTzeqVwyXR1U9hccPwcy1jN.jpg', 10, '2023-12-25 02:29:22', '2023-12-25 02:29:22');

-- Dumping structure for table laravel_passport.image_tag
CREATE TABLE IF NOT EXISTS `image_tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `image_tag_image_id_foreign` (`image_id`),
  KEY `image_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `image_tag_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE,
  CONSTRAINT `image_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.image_tag: ~0 rows (approximately)

-- Dumping structure for table laravel_passport.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.migrations: ~14 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2019_08_19_000000_create_failed_jobs_table', 1),
	(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(10, '2023_12_24_084503_create_countries_table', 2),
	(11, '2023_12_24_111847_create_states_table', 3),
	(12, '2023_12_24_112944_create_cities_table', 4),
	(13, '2023_12_24_132624_create_images_table', 5),
	(14, '2023_12_24_132640_create_tags_table', 5),
	(15, '2023_12_25_071638_add_foreign_key_to_images_table', 6);

-- Dumping structure for table laravel_passport.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.oauth_access_tokens: ~6 rows (approximately)
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('2695a163a7f89a30d30624c3c4af4aa40872259131ef0c8a4e7877ba8787fa97e40c0d1c282621a3', 1, 1, 'myToken', '[]', 0, '2023-12-23 13:13:15', '2023-12-23 13:13:15', '2024-12-23 18:43:15'),
	('4b03d4ab8665877d59e7ee82cf61cff5a73dc0814a70e7c8478693008d491e9d01c59ce527e96d81', 1, 1, 'myToken', '[]', 0, '2023-12-25 01:07:20', '2023-12-25 01:07:20', '2024-12-25 06:37:20'),
	('82017f37d996d22f8e4d46b20e652bda87b78447e77fc86a855f29c96de0b6c3360be4500eefc9d5', 1, 1, 'myToken', '[]', 0, '2023-12-23 13:20:59', '2023-12-23 13:20:59', '2024-12-23 18:50:59'),
	('8391d6616888e6d128675da4c8c75898eb0c37e081998bf61bbc827780eddc273a58a3ac8af7fa7d', 10, 1, 'myToken', '[]', 0, '2023-12-26 08:39:37', '2023-12-26 08:39:38', '2024-12-26 14:09:37'),
	('84b0336c8981fc626c31c0b1024bfb8e66de5f39f2d493c97a5b4ec9550fd4e9925652ec724c4ca9', 10, 1, 'myToken', '[]', 0, '2023-12-25 02:28:52', '2023-12-25 02:28:52', '2024-12-25 07:58:52'),
	('8f9ae35901173c20d9fe344eac1e16deb40848157fa031ab51ac9bcca093a5c166f5cbe024d61c16', 1, 1, 'myToken', '[]', 0, '2023-12-25 00:20:07', '2023-12-25 00:20:07', '2024-12-25 05:50:07'),
	('cc8a4843e77d79524a0b67ed58a00451a73c95b6f193f2d5207701de8b9931df848e35047686ae61', 11, 1, 'myToken', '[]', 0, '2023-12-25 02:19:33', '2023-12-25 02:19:33', '2024-12-25 07:49:33'),
	('e097c8277e98a0b34b0d6715e995d0d7383030c6cb3df73a2ce449189c45b51556d9c907cc98579b', 10, 1, 'myToken', '[]', 0, '2023-12-25 01:15:33', '2023-12-25 01:15:33', '2024-12-25 06:45:33');

-- Dumping structure for table laravel_passport.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.oauth_auth_codes: ~0 rows (approximately)

-- Dumping structure for table laravel_passport.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.oauth_clients: ~0 rows (approximately)
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'SSu4HCdo6YjcQmlZmyEhbRbXcySTkWPsHMD0zqde', NULL, 'http://localhost', 1, 0, 0, '2023-12-23 12:20:16', '2023-12-23 12:20:16'),
	(2, NULL, 'Laravel Password Grant Client', 'Thq7a3rhr7x3BERKqdd7R6t0EiQHSyQz9c9uZym4', 'users', 'http://localhost', 0, 1, 0, '2023-12-23 12:20:16', '2023-12-23 12:20:16');

-- Dumping structure for table laravel_passport.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.oauth_personal_access_clients: ~0 rows (approximately)
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2023-12-23 12:20:16', '2023-12-23 12:20:16');

-- Dumping structure for table laravel_passport.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.oauth_refresh_tokens: ~0 rows (approximately)

-- Dumping structure for table laravel_passport.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table laravel_passport.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table laravel_passport.states
CREATE TABLE IF NOT EXISTS `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `states_country_id_foreign` (`country_id`),
  CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.states: ~6 rows (approximately)
INSERT INTO `states` (`id`, `name`, `country_id`) VALUES
	(1, 'Queensland', 1),
	(2, 'South Australia', 1),
	(3, 'Maharashtra', 3),
	(4, 'Goa', 3),
	(5, 'Bihar', 3),
	(6, 'Panjab', 3);

-- Dumping structure for table laravel_passport.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.tags: ~2 rows (approximately)
INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'abcd', NULL, NULL),
	(2, 'pqrs', NULL, NULL);

-- Dumping structure for table laravel_passport.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` int unsigned DEFAULT NULL,
  `state` int unsigned DEFAULT NULL,
  `city` int unsigned DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_passport.users: ~12 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `country`, `state`, `city`, `password`, `role`, `isActive`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Nisha', 'pass@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$SbDb9gFMhQAoN1c97.Dge.hjI1fdWhv7z4WJ1L4nNsuZ2q3z4r8XG', 'admin', NULL, NULL, NULL, '2023-12-23 12:53:19', '2023-12-23 12:53:19'),
	(2, 'Test', 'test@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$D7t25iekwR8Wcoy91W23L.DGKdT8J/267MVo8rm6xVQMZhesDly8W', NULL, 'Y', NULL, NULL, '2023-12-23 14:36:54', '2023-12-23 14:36:54'),
	(3, 'Test1', 'test1@gmail.com', '9876544444', 1, 1, 1, '$2y$12$yKK1AakrPuxqBlG/HHX1X.0vUHXeasJA7gTqAJDeAHRxRNsi2Bbrm', NULL, NULL, NULL, NULL, '2023-12-23 14:45:41', '2023-12-23 14:45:41'),
	(4, 'avas', 'ugug@gmail.com', '8766654567', 1, 1, 1, '$2y$12$fkSoE0ZddFksN97r8BVOa.izgqtyNTMjcRIFnoPCRQ6q2MDHWoKP6', NULL, NULL, NULL, NULL, '2023-12-24 02:27:53', '2023-12-24 02:27:53'),
	(5, 'sdvd', 'snc@gmail.com', '9877654345', 1, 1, 1, '$2y$12$yN0KZoPJ5HyNMdKCPEP1GOFXH48W/EoKuTb3Dv5Y0NFvTvZI7b.GS', NULL, NULL, NULL, NULL, '2023-12-24 02:30:01', '2023-12-24 02:30:01'),
	(6, 'scsac', 'avcd@gmail.com', '9877654345', 1, 1, 1, '$2y$12$1vrW4lnmi7rbrFRVFjNpUeXm6wfRSAFBzGEsLfbZVRAx54DY5H.H2', NULL, NULL, NULL, NULL, '2023-12-24 02:30:32', '2023-12-24 02:30:32'),
	(7, 'abcd', 'testing@gmail.com', '8765456789', 3, 4, 4, '$2y$12$UJ4r9cZJqs0kuNMncvp.Ju0t7DI/HKHcU9wcRT96mu5z2qBICuBDG', NULL, NULL, NULL, NULL, '2023-12-24 14:45:31', '2023-12-24 14:45:31'),
	(8, 'Test1', 'testreg@gmail.com', '9876577777', 1, 2, 3, '$2y$12$jw6nhK199lN25C1ULqvlN.cX.m7ijhnrtPU72oN3eliS9njFa6.lm', NULL, NULL, NULL, NULL, '2023-12-25 00:30:01', '2023-12-25 00:30:01'),
	(9, 'Test1', 'testreg1@gmail.com', '9876577777', 1, 2, 3, '$2y$12$6WoTtl9BcP2YENej8EcU9OF.JC8OvSwnUc.5lXnUvhXDa40ZY39aa', NULL, NULL, NULL, NULL, '2023-12-25 00:32:17', '2023-12-25 00:32:17'),
	(10, 'Test1', 'testapi@gmail.com', '9876577777', 1, 2, 3, '$2y$12$cx8QWO86Du4Ob7Q0lQSpBO0m1olN9JQygtG1/9MrIRwtB.Po.hyCy', NULL, 'Y', NULL, NULL, '2023-12-25 00:34:50', '2023-12-25 00:34:50'),
	(11, 'Test1', 'testapi1@gmail.com', '9876577777', 1, 2, 3, '$2y$12$P9rW/mxL4lv4ptS6Z7y2IexW6Xe6Gq.xgK2tpqCPuyXm5PEfeTvDW', NULL, NULL, NULL, NULL, '2023-12-25 00:37:40', '2023-12-25 00:37:40'),
	(12, 'Test1', 'testapi2@gmail.com', '9876577777', 1, 2, 3, '$2y$12$FqtVBvNMd1nmQ9SvCKY6p.ie9i4YbgJTRbJd9ZkwoncCxJSWBcyom', NULL, NULL, NULL, NULL, '2023-12-25 00:40:06', '2023-12-25 00:40:06'),
	(13, 'Test1', 'testapi3@gmail.com', '9876577777', 1, 2, 3, '$2y$12$rqs5ltpNslS3BpEu5ASXyeXfeaS3XE6vPo23xYSWnxkShMgK5hN2q', NULL, NULL, NULL, NULL, '2023-12-25 00:43:04', '2023-12-25 00:43:04');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
