-- --------------------------------------------------------
-- Máy chủ:                      127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Phiên bản:           12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_tkglobal
CREATE DATABASE IF NOT EXISTS `db_tkglobal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_tkglobal`;

-- Dumping structure for table db_tkglobal.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.cache: ~0 rows (approximately)

-- Dumping structure for table db_tkglobal.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.cache_locks: ~0 rows (approximately)

-- Dumping structure for table db_tkglobal.campaigns
CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission` double NOT NULL,
  `commission_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1 - active | 0 - deactive',
  `url` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_url` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link_generate_type` tinyint NOT NULL DEFAULT '1' COMMENT '1 - auto | 0 - manual',
  `deactived_at` datetime DEFAULT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaigns_category_id_foreign` (`category_id`),
  CONSTRAINT `campaigns_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.campaigns: ~2 rows (approximately)
INSERT INTO `campaigns` (`id`, `code`, `name`, `image`, `cp_type`, `commission`, `commission_type`, `commission_text`, `detail`, `description`, `status`, `url`, `tracking_url`, `link_generate_type`, `deactived_at`, `category_id`, `created_at`, `updated_at`) VALUES
	(1, '16a84604b44724087655c6cffa7a312b109e31d6', 'Klook - CPS', 'https://cloud.shopback.com/c_fit,h_750,w_750/store-service-vn/assets/9942/228041f0-9935-11ec-805b-19006b996ca9.png', 'CPS', 0.05, 'percent', 'Lên đến 5%', '<h1 style="color: #233477;">Familiar. Fully-featured. Mobile optimized.</h1>\r\n<p style="color: #233477;">With an open source Core, uncomplicated low-code plug-in structure and additional Premium add-ons, TinyMCE scales with your app as you grow. That&rsquo;s why it&rsquo;s the WYSIWYG editor-of-choice for 1.5M+ developers when they need to build and ship products faster.</p>\r\n<p style="color: #233477;"><img style="float: right;" role="presentation" src="https://www.tiny.cloud/images/illustrations/spot/tiny/illustration-spot-tiny-images.svg" alt="TinyMCE demo image" width="316">Use TinyMCE as:</p>\r\n<ul style="color: #233477;">\r\n  <li>A <strong>basic</strong> editor</li>\r\n  <li>An advanced 📝 editor</li>\r\n  <li>An AI-powered 🪄✨ editor</li>\r\n  <li>A {{template-based}} editor</li>\r\n  <li>A totally <span class="highlight"><code>&lt;customized&gt;</code></span> editor</li>\r\n  <li>An equation ➕ formula editor</li>\r\n</ul>\r\n<h2 style="color: #233477;">Play with this demo to see how it works</h2>', 'Alice more boldly: \'you know you\'re growing too.\' \'Yes, but I THINK I can remember feeling a little irritated at the cook, to see the earth takes twenty-four hours to turn round on its axis--\'.', 1, 'http://ankunding.net/inventore-dolor-tempore-pariatur-enim', 'https://www.trip.com/', 1, NULL, 1, '2025-01-14 03:07:03', '2025-01-14 03:07:03'),
	(2, 'b0d252949e6eb6887b96d2edf3c1c245bb7a8f66', 'Trip.com - CPS', 'https://i0.wp.com/eye-of-the-beholder.org/wp-content/uploads/2022/02/trip-intl.png', 'CPS', 0.07, 'percent', 'Lên đến 7%', '<h1 style="color: #233477;">Familiar. Fully-featured. Mobile optimized.</h1>\n<p style="color: #233477;">With an open source Core, uncomplicated low-code plug-in structure and additional Premium add-ons, TinyMCE scales with your app as you grow. That&rsquo;s why it&rsquo;s the WYSIWYG editor-of-choice for 1.5M+ developers when they need to build and ship products faster.</p>\n<p style="color: #233477;"><img style="float: right;" role="presentation" src="https://www.tiny.cloud/images/illustrations/spot/tiny/illustration-spot-tiny-images.svg" alt="TinyMCE demo image" width="316">Use TinyMCE as:</p>\n<ul style="color: #233477;">\n  <li>A <strong>basic</strong> editor</li>\n  <li>An advanced 📝 editor</li>\n  <li>An AI-powered 🪄✨ editor</li>\n  <li>A {{template-based}} editor</li>\n  <li>A totally <span class="highlight"><code>&lt;customized&gt;</code></span> editor</li>\n  <li>An equation ➕ formula editor</li>\n</ul>\n<h2 style="color: #233477;">Play with this demo to see how it works</h2>', 'No, I\'ve made up my mind about it; if I\'m Mabel, I\'ll stay down here till I\'m somebody else"--but, oh dear!\' cried Alice (she was obliged to write out a box of comfits, (luckily the salt water had.', 1, 'https://lind.biz/et-ut-quaerat-nostrum-earum-deleniti-sapiente-corrupti.html', NULL, 0, NULL, 1, '2025-01-14 19:46:47', '2025-01-14 19:46:47');

-- Dumping structure for table db_tkglobal.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.categories: ~1 rows (approximately)
INSERT INTO `categories` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(1, '4ef39afa319e01bb1268fde30e1876ee6e8eef13', 'Du lịch/Đặt phòng', 1, '2025-01-14 02:36:33', '2025-01-14 02:36:33');

-- Dumping structure for table db_tkglobal.clicks
CREATE TABLE IF NOT EXISTS `clicks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_history_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clicks_link_history_id_foreign` (`link_history_id`),
  CONSTRAINT `clicks_link_history_id_foreign` FOREIGN KEY (`link_history_id`) REFERENCES `link_histories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.clicks: ~98 rows (approximately)
INSERT INTO `clicks` (`id`, `code`, `agent`, `ip`, `link_history_id`, `created_at`, `updated_at`) VALUES
	(1, '6b1556fb7947b6c344343916bd08a04e3e43b3ab', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '127.0.0.1', 3, '2025-01-19 17:00:00', '2025-01-22 08:33:21'),
	(2, '3496832309d378839cee3c625afa4e8818934a0d', 'Symfony', '127.0.0.1', 2, '2025-01-19 17:00:00', '2025-01-23 06:43:30'),
	(3, '7b0e8da6965dbc156c04471f1fbd9b9af354ed82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '127.0.0.1', 3, '2025-01-19 17:00:00', '2025-01-23 02:52:33'),
	(4, '55510b93eb30c741028f91467f3c5f18c3fcca6b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '127.0.0.1', 3, '2025-01-19 17:00:00', '2025-01-23 02:53:31'),
	(5, '98b41c5a3b9606d420ca5684137214f36fa48eb5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '127.0.0.1', 3, '2025-01-19 17:00:00', '2025-01-23 02:53:44'),
	(6, '33c2d5c8653859ba253e67f7fa4cfe4f4dcbfffc', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '127.0.0.1', 2, '2025-01-19 17:00:00', '2025-01-23 02:54:15'),
	(7, '552cf86538a95f3798181247b8bcfc877f32a946', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '127.0.0.1', 3, '2025-01-19 17:00:00', '2025-01-23 03:22:53'),
	(8, '7e3da1ccd7745dd77e2a2d563bcb2f5363eb00ea', NULL, NULL, 5, '2025-01-19 17:00:00', '2025-02-03 08:41:20'),
	(9, '4ed38a11d70032882bed666fddb61967a46b8d44', NULL, NULL, 5, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(10, 'cf60a435b3537e1829bad44def5cf106f08f36cd', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(11, 'fee7db5ea2c6dc9d146008c6930faea9d036b475', NULL, NULL, 7, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(12, 'f26be7693487bf68cefadb304aba339ffecfc72b', NULL, NULL, 8, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(13, '510cd47ec25a98ed23b350216a1bcfe3257db273', NULL, NULL, 8, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(14, 'b137992b87d7e1dbb601a234b1f547c13902d2a2', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(15, '4066f9d1abf9773011a412307bd572211c0769dd', NULL, NULL, 8, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(16, 'aa4ebc76274ff77f1abd585a40198acb135d3e1b', NULL, NULL, 10, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(17, 'dc52d7a8008a0f22725ee71f628c0182ff41412d', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(18, '85801ae4391074f2903d7d1f900205d1d71723eb', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(19, 'd84abbfeea305c10c4e7fa4e82e18161bbd1e9cc', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(20, '78356d18e901c218da96468d5814fd1ec9142ec0', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(21, 'f15b3914b024789268bcc519b1e8d3575f5e06d6', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(22, 'a07f8e6d1be6d935868d03f1ee67ded909a7fc6f', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(23, '599e4c21fca9a997342179057df0dc005267b057', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(24, '752cf7fd6dd8fa26f3e0a981b4bc1038d5e46c9b', NULL, NULL, 11, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(25, 'eea8998d3608384ca00cc5471de1da159a52f04c', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(26, '8f7c2bbc87ea6aeb4f06e8a2540d8fe723ac297b', NULL, NULL, 5, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(27, '77bf1e3c5439159e7d95eeb943ef98ce17055a59', NULL, NULL, 12, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(28, 'ce202be519206dde73726e476a4bcbfa91461a8b', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:41:59'),
	(29, '42d5b1b2c2c6117fd9f9c124b7af3f0f11272a51', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(30, '737f4c022c9e52b05b04cb1200cdb5e5efc9000a', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(31, 'd82d82e370ab442ce24a4d68c8a0f8247e8ecd0f', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(32, 'e8918d0cf70bae218fc9e743115b897c96177623', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(33, 'f8a310457afa0a5229051b5d4ce364c5436489d9', NULL, NULL, 10, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(34, '4c85d59d845eda973b5f2c5195edcacc69270a04', NULL, NULL, 10, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(35, '965be7da2a3e1a87e557c893ea144f96e358dd70', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(36, 'c961fd3ba60eeb0330786fe9eccd54976658d935', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(37, '67508e3c3cf4d458347e76d0e4bd61dfad8b7b15', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(38, '40abdb8ce69d8036a46846092e9b2b9823cfbccc', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(39, '10d5378036e3b76af110dbfa6f865c6ce2b55eb4', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(40, '6f55c5ab15360f56eb42e54326b33f4dd195e7a6', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(41, 'd755455e9dad7edc7ba19e6164468ebdc3fb303e', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(42, '2a328c319e0dd90791207f47a48499cc3269d073', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(43, '0650f078f0c4510758f00b2b94c98d45a113feaa', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(44, 'd1461a178cb7a73703d6d3960535a2f6b2307e96', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(45, 'a66609a137c0a5a0785ef6ad3127fc8931aac999', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(46, '018e6dc033e6cf274d9cab341d59771008407a8a', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(47, 'd477267a034374d48036324484e483f96d724233', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(48, 'e0cc138f5ac16ea7a87fb358b7529bc1762f7198', NULL, NULL, 13, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(49, '613f0aaefba2401cc17c8560b0f079016a4bce69', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(50, '1f154b549408f766889746aadb453cd56181113a', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(51, 'cfab1358f8875835b61e57390c528ae744217705', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(52, '9e05e2b5d121f8b2c15c855dc4e51fc311ea2a77', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(53, 'eff3110cc7c2724d115e69c4e66dcd95c22cf5a5', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(54, '7763194c0076783dd0b3a08474461fc5c44aec02', NULL, NULL, 7, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(55, 'b29da610e74a9da03661c72d6afce707ed9ab4f1', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(56, '4e727befa47ad12e6655d74fa00d56d4c161456a', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(57, '8d558e3e6ffc81da9c1040c92083d37f94565727', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(58, '796e61fdf131452b967736c8eaa3ca74a45dc2d3', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(59, '990013c33335bc8a30802b3d553e85c67021fb90', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(60, '7cfe520ea6341249075240133850fca05345c9a0', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(61, 'dfe82d846b7af00749ee9a770739482b30e1f968', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(62, '1b824776394569ac3efaba6a223881f644763eac', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:00'),
	(63, '795d6bc0730ccf6b7f499fa39dc38bee75238b33', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(64, '37506310305fbcc207f7ddd27f4a949b6131a553', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(65, 'b9787811fc18abce3d74a6b26f1aeecad99ef4e9', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(66, '7b8f3edff5f48a96ca4faac2d9206b6b33792ddf', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(67, '4e1cc8f8f96d8ef679cfbb4df4704694a95fefb8', NULL, NULL, 11, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(68, '96caa7362a471af7ad779f8b8a5858f7b3b20772', NULL, NULL, 14, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(69, 'edc4f4c86738319335bb72b41976db65144fd925', NULL, NULL, 5, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(70, '2cb2ef526190ae2f0dc2f0bc11eb84f4776b00c1', NULL, NULL, 14, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(71, '542850e962228d10439cf8316dc4c6c34ccb3bb7', NULL, NULL, 15, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(72, '36ad1a88c65b6472330706c234061c7611ad9ea8', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(73, '5bbd7fbaa6eb994bc794f9f9a47109cc6021241b', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(74, 'd5796412a77baafdf22af39b3ec3d75a9018a5ad', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(75, '3a405cb134e152ef140a4dafe19b30dc9464ab9c', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(76, 'c034c420377213ad736b908bd040f02dcaf3f6d4', NULL, NULL, 14, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(77, 'cd9253adf60347e9e12edf18b5476bfd3410659b', NULL, NULL, 14, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(78, 'b395f99127882a381b754c10129a751e40e9f476', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(79, '26185a05dc5ecbb36c7e49c367c429abce9de569', NULL, NULL, 11, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(80, 'a4a75f4cf49393112d219a71d48d4d71bde6e2b5', NULL, NULL, 11, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(81, '1d5e571b5b9ad9b587f5f9c19cf920d29732fa09', NULL, NULL, 14, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(82, '2b9f71a6d0665e9ebda058fc3298f8241516675f', NULL, NULL, 14, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(83, '0ea13299f7171f5af070dbd85594fc2730a7a1c3', NULL, NULL, 14, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(84, '56e22e2ffa3e02c8f967f515c31c062eb787cb54', NULL, NULL, 16, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(85, 'bf92c68b62000df05c62325f0f79b7939cfbd882', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(86, '36a39b693560558b006f540c5f50fe76b828efaf', NULL, NULL, 17, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(87, '0857ca29d24e2b5b2fcbcc679c279683065463a4', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(88, '82a35bdcdfefab9e7eb2c5c4feead9445eb9262f', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(89, '2d845051cca159a0b52228e73880b89d7beb4ec5', NULL, NULL, 14, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(90, 'c52dc2058d14b34d32806798af33c59d15ada1a3', NULL, NULL, 14, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(91, 'd7ee0aded23877c029d0a267a625e5cab3e60448', NULL, NULL, 14, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(92, 'eb145e9d35a9651ee73a7d3398bdc7133215e1dc', NULL, NULL, 18, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(93, '6db3a91bab95488dc18e18ddcb83be5fcf367144', NULL, NULL, 18, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(94, 'f7289133d46842c45b85c6dcb6389ec38ff4dd4c', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(95, '87a9122348186ed34cafc64d15f3bf08c0b1d7f1', NULL, NULL, 11, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(96, '741cb46f47da6dbafca98f2ea4ee5ea6fdfd152a', NULL, NULL, 9, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(97, '629ed8fe85e14b44229dae6a443e10616b93d630', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:01'),
	(98, 'd8b951f44dd98065ecc9dc03812a51be1fde96c0', NULL, NULL, 6, '2025-01-19 17:00:00', '2025-02-03 08:42:01');

-- Dumping structure for table db_tkglobal.configs
CREATE TABLE IF NOT EXISTS `configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.configs: ~1 rows (approximately)
INSERT INTO `configs` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'klook_ads', '{"969508":{"sub1":"A100134389","sub2":"tw.jp_24\\/12","sub3":"208-805-7591"},"969507":{"sub1":"A100134389","sub2":"tw.hk_24\\/12","sub3":"208-805-7591"},"969505":{"sub1":"A100134389","sub2":"tw.hk_hd","sub3":"208-805-7591"},"969504":{"sub1":"A100134389","sub2":"tw-hk.all","sub3":"208-805-7591"},"969503":{"sub1":"A100134389","sub2":"jp.t","sub3":"208-805-7591"},"969502":{"sub1":"A100134389","sub2":"tw.t","sub3":"208-805-7591"},"967257":{"sub1":"A100140851","sub2":"bus","sub3":null},"965507":{"sub1":"A100134389","sub2":"ths","sub3":"208-805-7591"},"965505":{"sub1":"A100134389","sub2":"tws","sub3":"208-805-7591"},"965503":{"sub1":"A100134389","sub2":"hks","sub3":"208-805-7591"},"965502":{"sub1":"A100134389","sub2":"ct","sub3":"208-805-7591"},"964436":{"sub1":"A100141423","sub2":"adp_241213_attmcth","sub3":null},"964434":{"sub1":"A100141423","sub2":"adp_241213_atthkth","sub3":null},"964433":{"sub1":"A100141423","sub2":"adp_241213_trakrth","sub3":null},"964432":{"sub1":"A100141423","sub2":"adp_241213_attkrth","sub3":null},"964430":{"sub1":"A100141423","sub2":"adp_241213_kimojpth","sub3":null},"964429":{"sub1":"A100141423","sub2":"adp_241213_trajpth","sub3":null},"962922":{"sub1":"A100134862","sub2":null,"sub3":"579-051-7621"},"962149":{"sub1":"A100141423","sub2":"adp_241209_trath","sub3":null},"962148":{"sub1":"A100141423","sub2":"adp_241209_attthtw","sub3":null},"962147":{"sub1":"A100141423","sub2":"adp_241209_trathtw","sub3":null},"962146":{"sub1":"A100141423","sub2":"adp_241209_trathtw","sub3":null},"962145":{"sub1":"A100141423","sub2":"adp_241209_ttnthtw","sub3":null},"962144":{"sub1":"A100141423","sub2":"adp_241209_htthtw","sub3":null},"962142":{"sub1":"A100141570","sub2":"adp_241206_DuyTXTL","sub3":null},"962141":{"sub1":"A100141570","sub2":"adp_241206_DuyDC","sub3":null},"962140":{"sub1":"A100141570","sub2":"adp_241206_DuyKS","sub3":null},"962139":{"sub1":"A100141570","sub2":"adp_241206_DuyVTQ","sub3":null},"962138":{"sub1":"A100141570","sub2":"adp_241206_DuyTTN","sub3":null},"962135":{"sub1":"A100141570","sub2":"adp_241206_DuyTT","sub3":null},"961042":{"sub1":"A100141423","sub2":"adp_241206_ttnth","sub3":null},"961040":{"sub1":"A100141423","sub2":"adp_241206_ifth","sub3":null},"961039":{"sub1":"A100141423","sub2":"adp_241206_htth","sub3":null},"959986":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"TW_UC_5.12"},"959985":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"TW_UK_5.12"},"959984":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"TW_VN_5.12"},"959983":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"TW_ZH_HK_5.12"},"959982":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"TW_JP_5.12"},"953864":{"sub1":"A100134389","sub2":"JP_22\\/11","sub3":"208-805-7591"},"953863":{"sub1":"A100134389","sub2":"TW_22\\/11","sub3":"208-805-7591"},"953862":{"sub1":"A100134389","sub2":"TW-TH_22\\/11","sub3":"208-805-7591"},"953860":{"sub1":"A100134389","sub2":"TW-JP_22\\/11","sub3":"208-805-7591"},"953858":{"sub1":"A100134389","sub2":"TW-HK_22\\/11","sub3":"208-805-7591"},"953856":{"sub1":"A100134389","sub2":"TH-HK_22\\/11","sub3":"208-805-7591"},"953854":{"sub1":"A100134389","sub2":"TH-TW_22\\/11","sub3":"208-805-7591"},"953853":{"sub1":"A100134389","sub2":"TH-JP_22\\/11","sub3":"208-805-7591"},"953852":{"sub1":"A100134389","sub2":"TH_22\\/11","sub3":"208-805-7591"},"953851":{"sub1":"A100134389","sub2":"HK-JP_22\\/11","sub3":"208-805-7591"},"953848":{"sub1":"A100134389","sub2":"HK-TH_22\\/11","sub3":"208-805-7591"},"953846":{"sub1":"A100134389","sub2":"HK-TW_22\\/11","sub3":"208-805-7591"},"953841":{"sub1":"A100134389","sub2":"HK_22\\/11","sub3":"208-805-7591"},"953837":{"sub1":"A100134389","sub2":"HK_22\\/11","sub3":"208-805-7591"},"953825":{"sub1":"A100133418","sub2":"331-182-5245","sub3":"QT"},"953824":{"sub1":"A100133418","sub2":"331-182-5245","sub3":"KRAL"},"953823":{"sub1":"A100133418","sub2":"331-182-5245","sub3":"KR"},"953822":{"sub1":"A100133418","sub2":"331-182-5245","sub3":"JP"},"953820":{"sub1":"A100133418","sub2":"331-182-5245","sub3":"\\u0110LAL"},"953819":{"sub1":"A100133418","sub2":"331-182-5245","sub3":"\\u0110L"},"952599":{"sub1":"A100134389","sub2":"TBN","sub3":"208-805-7591"},"952598":{"sub1":"A100134389","sub2":"VN","sub3":"208-805-7591"},"952597":{"sub1":"A100134389","sub2":"TW","sub3":"208-805-7591"},"952596":{"sub1":"A100134389","sub2":"TH","sub3":"208-805-7591"},"952594":{"sub1":"A100134389","sub2":"JP","sub3":"208-805-7591"},"952593":{"sub1":"A100134389","sub2":"Han","sub3":"208-805-7591"},"952590":{"sub1":"A100134389","sub2":"Malay","sub3":"208-805-7591"},"952581":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"All_20.11"},"952580":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"Kr_Kr_19.11"},"952579":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"Kr_Kr_14.11"},"952578":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"HK_HK_19.11"},"952577":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"HK_HK_12.11"},"952576":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"TW_TW_19.11"},"952575":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"TW_TW_12.11"},"952573":{"sub1":"A100138811","sub2":"976-015-3174","sub3":"TW_TW_18.11"},"950097":{"sub1":"A100140379","sub2":"klook.ph","sub3":null},"950095":{"sub1":"A100140379","sub2":"klook.tw","sub3":null},"949513":{"sub1":"A100139934","sub2":"gsm_dy_klook_indi","sub3":null},"949512":{"sub1":"A100139934","sub2":"gsm_dy_klook_id","sub3":null},"949511":{"sub1":"A100139934","sub2":"gsm_dy_klook_th","sub3":null},"949510":{"sub1":"A100139934","sub2":"gsm_dy_klook_ma","sub3":null},"949509":{"sub1":"A100139934","sub2":"gsm_dy_klook_ph","sub3":null},"948943":{"sub1":"A100139150","sub2":"klook.focus_in","sub3":null},"948942":{"sub1":"A100139150","sub2":"klook.focus_au","sub3":null},"948941":{"sub1":"A100139150","sub2":"klook.focus_all","sub3":null},"948940":{"sub1":"A100139150","sub2":"klook.mass_sg","sub3":null},"948938":{"sub1":"A100139150","sub2":"klook.mass_tw","sub3":null},"948937":{"sub1":"A100139150","sub2":"klook.mass_kor","sub3":null},"948936":{"sub1":"A100139150","sub2":"klook.mass_jp","sub3":null},"948935":{"sub1":"A100139150","sub2":"klook.mass_hk","sub3":null},"948472":{"sub1":"A100138811","sub2":null,"sub3":"976-015-3174"},"948470":{"sub1":"A100138811","sub2":null,"sub3":"976-015-3174"},"948469":{"sub1":"A100138811","sub2":null,"sub3":"976-015-3174"},"948450":{"sub1":"A100139934","sub2":"ads2","sub3":null},"948446":{"sub1":"A100139934","sub2":null,"sub3":null},"948444":{"sub1":"A100139934","sub2":null,"sub3":null},"948429":{"sub1":"A100134389","sub2":"TBN","sub3":"208-805-7591"},"948428":{"sub1":"A100134389","sub2":"VNHN","sub3":"208-805-7591"},"948427":{"sub1":"A100134389","sub2":"VNPQ","sub3":"208-805-7591"},"948426":{"sub1":"A100134389","sub2":"VNHL","sub3":"208-805-7591"},"948425":{"sub1":"A100134389","sub2":"VNHC","sub3":"208-805-7591"},"948424":{"sub1":"A100134389","sub2":"VN","sub3":"208-805-7591"},"948423":{"sub1":"A100134389","sub2":"TWKM","sub3":"208-805-7591"},"948421":{"sub1":"A100134389","sub2":"TWCH","sub3":"208-805-7591"},"948420":{"sub1":"A100134389","sub2":"TW","sub3":"208-805-7591"},"948419":{"sub1":"A100134389","sub2":"THHH","sub3":"208-805-7591"},"948417":{"sub1":"A100134389","sub2":"THCM","sub3":"208-805-7591"},"948416":{"sub1":"A100134389","sub2":"JPCA","sub3":"208-805-7591"},"948413":{"sub1":"A100134389","sub2":"JPNG","sub3":"208-805-7591"},"948412":{"sub1":"A100134389","sub2":"JPKT","sub3":"208-805-7591"},"948411":{"sub1":"A100134389","sub2":"JPSP","sub3":"208-805-7591"},"948408":{"sub1":"A100134389","sub2":"JPHK","sub3":"208-805-7591"},"948407":{"sub1":"A100134389","sub2":"Han","sub3":"208-805-7591"},"948406":{"sub1":"A100134389","sub2":"Malay","sub3":"208-805-7591"},"948404":{"sub1":"A100138811","sub2":null,"sub3":null},"948399":{"sub1":"A100138811","sub2":"KJ","sub3":"976-015-3174"},"948397":{"sub1":"A100138811","sub2":"TJ","sub3":"976-015-3174"},"948395":{"sub1":"A100138811","sub2":"HKJ","sub3":"976-015-3174"},"948393":{"sub1":"A100138811","sub2":"JK","sub3":"976-015-3174"},"948391":{"sub1":"A100138811","sub2":"TK","sub3":"976-015-3174"},"948390":{"sub1":"A100138811","sub2":"HKK","sub3":"976-015-3174"},"948389":{"sub1":"A100138811","sub2":"MTH","sub3":"976-015-3174"},"948388":{"sub1":"A100138811","sub2":"JC","sub3":"976-015-3174"},"948359":{"sub1":"A100138811","sub2":"JJ","sub3":"976-015-3174"},"947941":{"sub1":"A100134389","sub2":"TH","sub3":"208-805-7591"},"947933":{"sub1":"A100134389","sub2":"JP","sub3":"208-805-7591"},"947931":{"sub1":"A100134389","sub2":"TH","sub3":null},"947924":{"sub1":"A100134862","sub2":null,"sub3":"579-051-7621"},"947827":{"sub1":"A100134389","sub2":"xxxx","sub3":null},"947824":{"sub1":"A100139150","sub2":"cccc","sub3":null},"947823":{"sub1":"A100134389","sub2":"aaaa","sub3":null},"947822":{"sub1":"A100134862","sub2":"579-051-7621","sub3":null},"947411":{"sub1":"A100139376","sub2":null,"sub3":null},"947410":{"sub1":"A100139376","sub2":null,"sub3":null},"947408":{"sub1":"A100139376","sub2":null,"sub3":null},"947406":{"sub1":"A100139376","sub2":null,"sub3":null},"947405":{"sub1":"A100139376","sub2":null,"sub3":null},"945733":{"sub1":"A100135707","sub2":"adpisgosg","sub3":null},"945731":{"sub1":"A100135706","sub2":"adpiaob2","sub3":null},"945730":{"sub1":"A100135705","sub2":"adpisgovi","sub3":null},"945729":{"sub1":"A100135704","sub2":"adpia1ob1","sub3":null},"945728":{"sub1":"A100135703","sub2":"adpitwovi","sub3":null},"945726":{"sub1":"A100135703","sub2":"adpihkovi","sub3":null},"945724":{"sub1":"A100135703","sub2":"adpisgokor","sub3":null},"945723":{"sub1":"adpihkotw","sub2":"A100135703","sub3":null},"945721":{"sub1":"A100135703","sub2":"adpihkotw","sub3":null},"945720":{"sub1":"A100135703","sub2":"adpiaob3","sub3":null},"945719":{"sub1":"A100135703","sub2":"adpitwokor","sub3":null},"945717":{"sub1":"A100135703","sub2":"adpihkohk","sub3":null},"945715":{"sub1":"A100135703","sub2":"adpia1ob3","sub3":null},"945714":{"sub1":"A100135703","sub2":"adpia1ob3","sub3":null},"945713":{"sub1":"A100135703","sub2":"adpia1ob2","sub3":null},"945712":{"sub1":"A100135703","sub2":"adpisgothai","sub3":null},"945711":{"sub1":"adpihkokor","sub2":"A100135703","sub3":null},"945709":{"sub1":"A100135703","sub2":"adpiaob1","sub3":null},"945707":{"sub1":"A100135703","sub2":"adpisgohk","sub3":null},"945706":{"sub1":"A100135703","sub2":"adpisgojp","sub3":null},"945704":{"sub1":"A100135703","sub2":"adpitwohk","sub3":null},"945666":{"sub1":"A100135703","sub2":"adpihkojp","sub3":null},"945665":{"sub1":"A100135703","sub2":"adpisgotw","sub3":null},"945661":{"sub1":"A100135703","sub2":"adpihkosg","sub3":null},"945660":{"sub1":"A100135703","sub2":"adpihkothai","sub3":null},"945644":{"sub1":"adpitwothai","sub2":null,"sub3":null},"945643":{"sub1":"A100135703","sub2":"adpitwojp","sub3":null},"945640":{"sub1":"A100135703","sub2":"adpitwojp","sub3":null},"945638":{"sub1":"A100135703","sub2":"adpitwotw","sub3":null},"944546":{"sub1":"A100138811","sub2":"KC","sub3":"976-015-3174"},"944544":{"sub1":"A100138811","sub2":"KJ","sub3":"976-015-3174"},"944372":{"sub1":"A100139150","sub2":"klook.mass_all","sub3":null},"944371":{"sub1":"A100138811","sub2":null,"sub3":null},"930577":{"sub1":"A100137791","sub2":"TW2","sub3":null},"930576":{"sub1":"JPall","sub2":null,"sub3":null},"930574":{"sub1":"A100137791","sub2":"TW1","sub3":null},"930573":{"sub1":"A100137791","sub2":null,"sub3":"TWall"},"930428":{"sub1":"A100019116","sub2":null,"sub3":null},"925808":{"sub1":null,"sub2":null,"sub3":null},"925366":{"sub1":"A100134862","sub2":"jaaus","sub3":21769819633},"925365":{"sub1":"A100134862","sub2":"gtaiwan","sub3":21769806142},"925361":{"sub1":"A100134862","sub2":"th-ta","sub3":21759566133},"922673":{"sub1":"A100134862","sub2":21745932665,"sub3":"taiwan-loc-taiwan"},"922672":{"sub1":"A100134862","sub2":21739557510,"sub3":"korea-loc-taiwan"},"922671":{"sub1":"A100134862","sub2":21745831598,"sub3":"japan-loc-global"},"922668":{"sub1":"A100134862","sub2":21749652892,"sub3":"japan-loc-taiwan"},"917083":{"sub1":"A100133488","sub2":"Korea-1","sub3":null},"917082":{"sub1":"A100133488","sub2":"Japan-2","sub3":null},"917081":{"sub1":"A100133488","sub2":"Japan-1","sub3":null},"917080":{"sub1":"A100133488","sub2":"Taiwan-2","sub3":null},"917079":{"sub1":"A100133488","sub2":"Taiwan-1","sub3":null},"917078":{"sub1":"A100133488","sub2":"TA","sub3":null},"917076":{"sub1":"A100133488","sub2":"JA","sub3":null},"913203":{"sub1":"A100133488","sub2":"KA","sub3":null},"908442":{"sub1":"A100133418","sub2":"klook","sub3":"CanadaTQ"},"908439":{"sub1":"A100133418","sub2":"klook","sub3":"Fr"},"908437":{"sub1":"A100133418","sub2":"klook","sub3":"TG2"},"908433":{"sub1":"A100133418","sub2":"klook","sub3":"TG1"},"907440":{"sub1":"A100133640","sub2":"Klook","sub3":"Thai"},"907438":{"sub1":"A100133640","sub2":"Klook","sub3":"Korea"},"907435":{"sub1":"A100133640","sub2":"Klook","sub3":"Japan"},"907434":{"sub1":"A100133640","sub2":"Klook","sub3":"Sing"},"907429":{"sub1":"A100133640","sub2":"Klook","sub3":"TWALENGURL"},"907427":{"sub1":"A100133640","sub2":"Klook","sub3":"TWALENG"},"907426":{"sub1":"A100133640","sub2":"Klook","sub3":"TWALURL"},"907394":{"sub1":"A100133640","sub2":"Klook","sub3":"TWAL"},"907390":{"sub1":"A100133640","sub2":"Klook","sub3":"TW"},"907381":{"sub1":"A100133640","sub2":"Klook","sub3":"TWAL"},"907376":{"sub1":"Cpc","sub2":"Klook","sub3":"TW"},"907355":{"sub1":"A100133640","sub2":null,"sub3":null},"852663":{"sub1":22,"sub2":3123123,"sub3":12321321},"852654":{"sub1":"adpa","sub2":"A100014896","sub3":null},"844345":{"sub1":"adpia","sub2":"adpia","sub3":"adpia"}}', '2025-02-03 04:02:55', '2025-02-03 04:02:55');

-- Dumping structure for table db_tkglobal.conversions
CREATE TABLE IF NOT EXISTS `conversions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_time` datetime DEFAULT NULL,
  `unit_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `quantity` int NOT NULL DEFAULT '1',
  `commission_pub` decimal(12,2) NOT NULL DEFAULT '0.00',
  `commission_sys` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_id` bigint unsigned NOT NULL,
  `click_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversions_campaign_id_foreign` (`campaign_id`),
  KEY `conversions_click_id_foreign` (`click_id`),
  KEY `conversions_user_id_foreign` (`user_id`),
  CONSTRAINT `conversions_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conversions_click_id_foreign` FOREIGN KEY (`click_id`) REFERENCES `clicks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conversions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.conversions: ~124 rows (approximately)
INSERT INTO `conversions` (`id`, `code`, `order_code`, `order_time`, `unit_price`, `quantity`, `commission_pub`, `commission_sys`, `status`, `product_code`, `product_name`, `campaign_id`, `click_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, '8fd5accb8942fe421372a678b31703416c2243d0', '1360133424012396', '2025-01-23 08:50:43', 4890000.00, 1, 342300.00, 146700.00, 'Pending', 'SP145888', 'Đầm Midi Dáng Xoè Cotton Lạnh Xếp Ly Vai, Váy Dáng Dài Thời Trang Nữ Thanh Lịch Maybi', 2, 1, 8, '2025-01-22 09:00:22', '2025-01-22 09:00:22'),
	(2, 'b470d86f47b661ece492ce3551498504ba849e53', '1360133424012397', '2025-01-23 08:50:44', 4890000.00, 1, 342300.00, 146700.00, 'Approved', 'SP145888', 'Đầm Midi Dáng Xoè Cotton Lạnh Xếp Ly Vai, Váy Dáng Dài Thời Trang Nữ Thanh Lịch Maybi', 2, 1, 8, '2025-01-22 10:00:57', '2025-01-22 10:00:57'),
	(3, '28e7fa4d3527b843cd31912399c3bb7944a4c2f5', '1360133424012398', '2025-01-23 08:50:45', 4890000.00, 1, 342300.00, 146700.00, 'Cancelled', 'SP145888', 'Đầm Midi Dáng Xoè Cotton Lạnh Xếp Ly Vai, Váy Dáng Dài Thời Trang Nữ Thanh Lịch Maybi', 1, 2, 8, '2025-01-22 10:01:17', '2025-01-22 10:01:17'),
	(312, '2fe8d9ce861abe4d15fe1400bd197db4af2a4c83', '1359034073899364', '2025-01-22 23:01:00', 5863725.00, 1, 234549.00, 58637.25, 'Pending', '129282959', 'Hotel in Seoul, South Korea', 2, 7, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(313, 'a451eaf91871917c5953dd299d688912c41c117f', '1360133749345646', '2025-01-23 02:23:00', 3613950.00, 1, 10800.00, 2700.00, 'Approved', '129282959', 'Flight from Hong Kong, China to Taipei, China', 2, 7, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(314, 'c3ced31ca6526b4211e2f67b8086d6e17ef4d94d', '1359034238649264', '2025-01-23 03:56:00', 1318050.00, 1, 10800.00, 2700.00, 'Approved', '129282959', 'Flight from Taichung, China to Hong Kong, China', 2, 7, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(315, '9a19985151814f25b2c0254f6e2b8b5b13eb7061', '1658101246049211', '2025-01-23 07:34:00', 3755025.00, 1, 150201.00, 37550.25, 'Pending', '129282959', 'Hotel in Zhuhai, China', 2, 7, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(316, 'a0ddc40d0d174c9ff4df240b706258d40b197741', '1616319960905433', '2025-01-23 08:51:00', 3249225.00, 1, 12996.90, 3249.23, 'Approved', '129282959', 'Flight from Manila, Philippines to Davao, Philippines', 2, 7, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(317, '0a9beb289303672bea604552382a8011f932895b', '1616319960781209', '2025-01-23 08:51:00', 8282475.00, 1, 33129.90, 8282.48, 'Approved', '129282959', 'Flight from Davao, Philippines to Manila, Philippines', 2, 7, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(318, 'ac016447f0f3937444c49d792d54660d226cff13', '1359034083512784', '2025-01-23 09:55:00', 8422425.00, 1, 336897.00, 84224.25, 'Pending', '129282959', 'Hotel in Shanghai, China', 2, 7, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(319, '5c93237faa7ded33755cc7565881083ee8c6a24a', '1359034083529275', '2025-01-23 10:05:00', 9391050.00, 1, 375642.00, 93910.50, 'Pending', '129282959', 'Hotel in Shanghai, China', 2, 6, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(320, '2d20cd75b9c38bb6603700e73cbab1db2068adaa', '1616319804439518', '2025-01-23 10:16:00', 12261375.00, 1, 490455.00, 122613.75, 'Pending', '129282959', 'Hotel in Xiamen, China', 2, 6, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(321, '286ff2c0aac209673b1898ab111542fc6a3e3170', '1658101246349104', '2025-01-23 10:43:00', 1593900.00, 1, 63756.00, 15939.00, 'Pending', '129282959', 'Hotel in Zhuhai, China', 2, 6, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(322, '1ea711f240bea167301cf5a366bcee818da108bb', '1688887730490242', '2025-01-23 10:49:00', 11439675.00, 1, 10800.00, 2700.00, 'Approved', '129282959', 'Flight from Hong Kong, China to Haikou, China', 2, 6, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(323, '3ad683c0b533913b42a7e9823836c124013b6371', '1658096776041728', '2025-01-23 10:51:00', 14025600.00, 1, 561024.00, 140256.00, 'Pending', '129282959', 'Car Rentals in Fukuoka, Japan', 2, 6, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(324, 'b8bfd624dacdb8240b3299272d0035df94fa877d', '1616319963552842', '2025-01-23 13:51:00', 10918575.00, 1, 10800.00, 2700.00, 'Pending', '129282959', 'Flight from Taipei, China to Chongqing, China', 2, 6, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(325, '80bcff24dbec48c98249a1dd0b7b99fb47474eb4', '1616319804834717', '2025-01-23 14:20:00', 1189350.00, 1, 47574.00, 11893.50, 'Pending', '129282959', 'Hotel in Chongqing, China', 2, 6, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(326, 'bc5225a8094f739f385c39a1934a198d3f41e0e5', '1658101042869388', '2025-01-23 14:31:00', 3133575.00, 1, 100274.40, 25068.60, 'Approved', '129282959', 'Tours & Tickets in Macau, China', 2, 6, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(327, '3178479bc2077f53c37a177e388c0af4c461a1b8', '1616319804876439', '2025-01-23 14:48:00', 2415375.00, 1, 96615.00, 24153.75, 'Pending', '129282959', 'Hotel in Chongqing, China', 2, 6, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(328, '001516862f690c99bb7c275a50b58dc4736a3ed5', '1359033880124136', '2025-01-23 15:08:00', 855450.00, 1, 27374.40, 6843.60, 'Approved', '129282959', 'Tours & Tickets in Osaka, Japan', 2, 6, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(329, 'e47cb73e638de7f7a0cca79631c706e9adb3a3a5', '1360133391752996', '2025-01-23 15:12:00', 3450375.00, 1, 110412.00, 27603.00, 'Approved', '129282959', 'Tours & Tickets in Osaka, Japan', 2, 6, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(330, '279a4dc2d71904b32dfc9afddc3b27f7c1920b88', '1688887086165104', '2025-01-23 15:30:00', 2941200.00, 1, 47059.20, 11764.80, 'Approved', '129282959', 'Train from Hong Kong, China to Zhanjiang, China', 2, 6, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(331, '9d03000d76db669fbfa2bb439678d08ee3848314', '1616319804952171', '2025-01-23 15:43:00', 1303650.00, 1, 52146.00, 13036.50, 'Pending', '129282959', 'Hotel in Kaohsiung, China', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(332, '74ff8c452617544c8281d47456a02b170396edaa', '1658097833037946', '2025-01-23 16:00:00', 397350.00, 1, 15894.00, 3973.50, 'Pending', '129282959', 'Airport Transfer in Guangzhou, China', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(333, '546048528fea16c31f58732c7acab3a9e58b792d', '1359033880138086', '2025-01-23 16:02:00', 641700.00, 1, 20534.40, 5133.60, 'Approved', '129282959', 'Tours & Tickets in Osaka, Japan', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(334, '27e9dd682fe804e7c4f7e40ab33a99ab2340def5', '1616319964498701', '2025-01-23 16:33:00', 23302575.00, 1, 372841.20, 93210.30, 'Pending', '129282959', 'Flight & Hotel from Taipei, China to Busan, South Korea', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(335, 'bae3fc2f04253128684dac92873469cf36f5f7e8', '1617419316692466', '2025-01-23 17:11:00', 2243475.00, 1, 89739.00, 22434.75, 'Pending', '129282959', 'Hotel in Taichung, China', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(336, '0a66f9352b17bbaf1cf703bc780ec491f695c674', '1616316391195546', '2025-01-23 17:41:00', 3086100.00, 1, 123444.00, 30861.00, 'Pending', '129282959', 'Airport Transfer in Tokyo, Japan', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(337, 'e73b234b0c1216404fadc115f0a2da8bdf7e6894', '1359033597866176', '2025-01-23 17:42:00', 1462275.00, 1, 23396.40, 5849.10, 'Approved', '129282959', 'Train from Guangzhou, China to Shenzhen, China', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(338, '3de3b5cfc44ae0cbfdd5f143ca00b2f58efa53a2', '1616319964870173', '2025-01-23 18:00:00', 12699675.00, 1, 50798.70, 12699.68, 'Approved', '129282959', 'Flight from Sapporo, Japan to Taipei, China', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(339, '3e5e15eecbf5663cbd52d3580d3bbc3abc35ac92', '1616319964319069', '2025-01-23 18:00:00', 19808100.00, 1, 79232.40, 19808.10, 'Pending', '129282959', 'Flight from Taipei, China to Sapporo, Japan', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(340, 'fd9315f5affb14b3b4233e2c07320f19fd2dfc00', '1359034243139924', '2025-01-23 18:02:00', 3669300.00, 1, 14677.20, 3669.30, 'Approved', '129282959', 'Flight from Seoul, South Korea to Hong Kong, China', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(341, 'a771d09266318d17dc845ee79359402deba3988e', '1616319805133263', '2025-01-23 18:07:00', 14229450.00, 1, 569178.00, 142294.50, 'Pending', '129282959', 'Hotel in Sapporo, Japan', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(342, '1a23daa768d360b714d93c0a2323a94bbee625d7', '1688887731616729', '2025-01-23 18:37:00', 27443925.00, 1, 109775.70, 27443.93, 'Approved', '129282959', 'Flight from New York, United States to Taipei, China', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(343, '22a4233b1683751a8b56f6d40c94878e005d3f4c', '1658101247069988', '2025-01-23 19:12:00', 5252625.00, 1, 210105.00, 52526.25, 'Pending', '129282959', 'Hotel in Shanghai, China', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(344, 'cf5bb1ebf38a59aeb8cfa3e527a72339683a15b6', '1359034243774138', '2025-01-23 19:23:00', 35956125.00, 1, 143824.50, 35956.13, 'Approved', '129282959', 'Flight from Hong Kong, China to Tokyo, Japan', 2, 5, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(345, '103e6db9288eda0ca38a5abc90d468eb1b19ed00', '1359034084424155', '2025-01-23 20:24:00', 1477575.00, 1, 59103.00, 14775.75, 'Pending', '129282959', 'Hotel in Shenzhen, China', 2, 4, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(346, 'bc261e4bbb153955b6f550bc92333c583083d54f', '1658101247263382', '2025-01-23 21:19:00', 990000.00, 1, 39600.00, 9900.00, 'Pending', '129282959', 'Hotel in Shenzhen, China', 2, 4, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(347, 'f2e9c18532d30f528b178fe3931b1a7c6785e32c', '1359034084518894', '2025-01-23 21:21:00', 3017475.00, 1, 120699.00, 30174.75, 'Pending', '129282959', 'Hotel in Macau, China', 2, 4, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(348, '9650d673bffcc0f38bb9764f36abda1fc16d9bbb', '1359033880237723', '2025-01-23 21:33:00', 9970875.00, 1, 319068.00, 79767.00, 'Pending', '129282959', 'Tours & Tickets in Macau, China', 2, 4, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(349, '6a5c2d139933838c3cae78ec94cef9f8475709aa', '1616319972989939', '2025-01-23 21:37:00', 3957300.00, 1, 15829.20, 3957.30, 'Approved', '129282959', 'Flight from Bangkok, Thailand to Taipei, China', 2, 4, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(350, '1ce337ed72ad753846a236ed9d8602f212ca1322', '1616319970121075', '2025-01-23 21:37:00', 2881350.00, 1, 11525.40, 2881.35, 'Pending', '129282959', 'Flight from Taipei, China to Bangkok, Thailand', 2, 4, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(351, '87122c0490a52106538305bf7163e3829b43a84d', '1359034084578969', '2025-01-23 21:56:00', 1131075.00, 1, 45243.00, 11310.75, 'Pending', '129282959', 'Hotel in Shenzhen, China', 2, 4, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(352, '69ded15baf0f8819c13344c5e5e94dbaa3d81607', '1617419317159426', '2025-01-23 22:28:00', 965475.00, 1, 38619.00, 9654.75, 'Pending', '129282959', 'Hotel in Taichung, China', 2, 4, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(353, '67efc0e47c07a3da33032943171ebd89cf3dbdc6', '1616319805556299', '2025-01-23 22:44:00', 1633050.00, 1, 65322.00, 16330.50, 'Pending', '129282959', 'Hotel in Pingtung, China', 2, 4, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(354, '7f67b4b50ddab642200cea4784778bc0d9118c50', '1688887573000237', '2025-01-23 22:51:00', 751050.00, 1, 30042.00, 7510.50, 'Pending', '129282959', 'Hotel in Shenzhen, China', 2, 4, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(355, 'ef0a8bbaea646fc248166aafb83051fa6b276a98', '1616319805569132', '2025-01-23 22:53:00', 1343700.00, 1, 53748.00, 13437.00, 'Pending', '129282959', 'Hotel in Nantou, China', 2, 4, 8, '2025-01-24 07:13:01', '2025-01-24 07:13:01'),
	(356, '4ed38a11d70032882bed666fddb61967a46b8d44', '2665939795', '2025-01-24 08:28:43', 119250.00, 1, 3780.00, 1620.00, 'Pending', '1278418916_JMK319707', '東南亞｜高速 eSIM 新加坡/泰國/越南（即買即取QR Code）', 1, 9, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(357, 'cf60a435b3537e1829bad44def5cf106f08f36cd', '2665713609', '2025-01-24 08:08:20', 149250.00, 1, 4725.00, 2025.00, 'Pending', '1278314040_KZG164814', '中港澳 | 高速eSIM 免翻牆（即買即取QR Code）', 1, 10, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(358, 'fee7db5ea2c6dc9d146008c6930faea9d036b475', '2665023458', '2025-01-24 07:39:55', 1018125.00, 1, 35595.00, 15255.00, 'Pending', '1278307958_CUR433588', 'Mt. Fuji, Oshino Hakkai & Gotemba Outlets/Hot Springs Day Tour (Depart from Tokyo)', 1, 11, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(359, 'f26be7693487bf68cefadb304aba339ffecfc72b', '2665115734', '2025-01-24 07:38:24', 211500.00, 1, 6772.50, 2902.50, 'Pending', '1278307653_KZZ730542', 'eSIM 日本 | DOCOMO', 1, 12, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(360, '510cd47ec25a98ed23b350216a1bcfe3257db273', '2665722535', '2025-01-24 07:35:40', 211500.00, 1, 6772.50, 2902.50, 'Pending', '1278476793_ABU070429', 'eSIM 日本 | DOCOMO', 1, 13, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(361, 'b137992b87d7e1dbb601a234b1f547c13902d2a2', '2665633437', '2025-01-24 07:13:30', 680250.00, 1, 21735.00, 9315.00, 'Pending', '1278402383_FXY515049', '東京地鐵三日券／二日券／一日券', 1, 14, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(362, '4066f9d1abf9773011a412307bd572211c0769dd', '2665781109', '2025-01-24 07:05:55', 1095000.00, 1, 0.00, 0.00, 'Pending', '1278401149_VSW332328', '東京teamLab Borderless數位藝術美術館門票', 1, 15, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(363, 'aa4ebc76274ff77f1abd585a40198acb135d3e1b', '2665748026', '2025-01-24 04:57:38', 304200.00, 1, 9292.50, 3982.50, 'Pending', '1278287304_UPC740936', '일본 eSIM', 1, 16, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(364, 'dc52d7a8008a0f22725ee71f628c0182ff41412d', '2665815764', '2025-01-24 01:54:01', 211500.00, 1, 6772.50, 2902.50, 'Pending', '1278068577_HRN939319', 'eSIM 日本 | DOCOMO', 1, 17, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(365, '85801ae4391074f2903d7d1f900205d1d71723eb', '2665746987', '2025-01-24 01:41:03', 783000.00, 1, 25042.50, 10732.50, 'Pending', '1278266412_FZU963447', '東京飯店至機場／其他飯店行李運送服務', 1, 18, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(366, 'd84abbfeea305c10c4e7fa4e82e18161bbd1e9cc', '2665452037', '2025-01-24 01:29:31', 693000.00, 1, 8820.00, 3780.00, 'Pending', '1278164240_XMS708847', 'JR關西機場特快 HARUKA 車票', 1, 19, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(367, '78356d18e901c218da96468d5814fd1ec9142ec0', '2665672813', '2025-01-23 23:38:02', 645000.00, 1, 20632.50, 8842.50, 'Pending', '1278130774_PYK026035', '木育森林自然素材DIY課程體驗', 1, 20, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(368, 'f15b3914b024789268bcc519b1e8d3575f5e06d6', '2665959552', '2025-01-23 23:34:21', 8361000.00, 1, 267277.50, 114547.50, 'Pending', '1278029313_TSV751236', '新加坡環球影城門票 Universal Studios Singapore', 1, 21, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(369, 'a07f8e6d1be6d935868d03f1ee67ded909a7fc6f', '2665039539', '2025-01-23 23:33:41', 637500.00, 1, 20317.50, 8707.50, 'Pending', '1278228806_ABV827781', '北投: 水都溫泉會館 - 雙人客房泡湯・露天大眾池泡湯・溫泉煮蛋體驗', 1, 22, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(370, '599e4c21fca9a997342179057df0dc005267b057', '2665248447', '2025-01-23 23:32:06', 967500.00, 1, 30870.00, 13230.00, 'Pending', '1278128016_APT607473', '木育森林自然素材DIY課程體驗', 1, 23, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(371, '752cf7fd6dd8fa26f3e0a981b4bc1038d5e46c9b', '2665498276', '2025-01-23 22:47:58', 742500.00, 1, 23782.50, 10192.50, 'Pending', '1278106319_YBV345608', '遠雄海洋公園門票', 1, 24, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(372, 'eea8998d3608384ca00cc5471de1da159a52f04c', '2665205050', '2025-01-23 22:27:10', 84750.00, 1, 2677.50, 1147.50, 'Pending', '1277995800_YTH940956', 'Klook eSIM 香港 高速上網吃到飽 | 香港電訊', 1, 25, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(373, '8f7c2bbc87ea6aeb4f06e8a2540d8fe723ac297b', '2665800406', '2025-01-23 21:54:03', 121500.00, 1, 3937.50, 1687.50, 'Pending', '1277779629_GGC390894', '泰國 eSIM 網卡｜期間限定超值無限流量｜電子郵件寄送', 1, 26, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(374, '77bf1e3c5439159e7d95eeb943ef98ce17055a59', '2665493408', '2025-01-23 21:38:37', 372750.00, 1, 11970.00, 5130.00, 'Pending', '1277772363_UAF690835', 'eSIM 日本 | DOCOMO', 1, 27, 8, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(375, 'f024fef8dfd74aaba97863bce4edc5354251cdd3', '2665083613', '2025-01-23 21:15:49', 305250.00, 1, 9765.00, 4185.00, 'Pending', '1277961602_JBT024885', '香港八達通卡', 1, 28, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(376, '42d5b1b2c2c6117fd9f9c124b7af3f0f11272a51', '2665275715', '2025-01-23 21:13:17', 3192000.00, 1, 102060.00, 43740.00, 'Pending', '1277760731_MBN335960', '太平山頂纜車及凌霄閣摩天台428門票', 1, 29, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(377, '737f4c022c9e52b05b04cb1200cdb5e5efc9000a', '2665119941', '2025-01-23 20:39:21', 1005000.00, 1, 32130.00, 13770.00, 'Pending', '1277844932_BUA772086', '國立海洋生物博物館門票', 1, 30, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(378, 'd82d82e370ab442ce24a4d68c8a0f8247e8ecd0f', '2665948734', '2025-01-23 20:34:04', 1635000.00, 1, 52290.00, 22410.00, 'Pending', '1277743175_KTY193472', '澀谷Shibuya Sky展望台門票', 1, 31, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(379, 'e8918d0cf70bae218fc9e743115b897c96177623', '2665948734', '2025-01-23 20:34:04', 81750.00, 1, 1102.50, 472.50, 'Pending', '1277843027_AUJ823007', 'No-show Refund', 1, 32, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(380, 'f8a310457afa0a5229051b5d4ce364c5436489d9', '2665076441', '2025-01-23 20:18:27', 0.00, 1, 0.00, 0.00, 'Pending', '1277736815_MQQ375081', '무료 일본 eSIM - 총 1매 제공', 1, 33, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(381, '4c85d59d845eda973b5f2c5195edcacc69270a04', '2665076441', '2025-01-23 20:18:27', 428400.00, 1, 13072.50, 5602.50, 'Pending', '1277936560_XJP862082', '오사카 - 간사이 공항 리무진 버스', 1, 34, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(382, '965be7da2a3e1a87e557c893ea144f96e358dd70', '2665545908', '2025-01-23 19:52:55', 714750.00, 1, 22837.50, 9787.50, 'Pending', '1277827181_HKQ308627', '樹屋旅店', 1, 35, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(383, 'c961fd3ba60eeb0330786fe9eccd54976658d935', '2665704677', '2025-01-23 19:42:21', 0.00, 1, 0.00, 0.00, 'Pending', '1277723598_WYZ733928', '免費eSIM卡 - 每個訂單僅限一張eSIM', 1, 36, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(384, '67508e3c3cf4d458347e76d0e4bd61dfad8b7b15', '2665704677', '2025-01-23 19:42:21', 693000.00, 1, 8820.00, 3780.00, 'Pending', '1277823448_JWG260274', 'JR關西機場特快 HARUKA 車票', 1, 37, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(385, '40abdb8ce69d8036a46846092e9b2b9823cfbccc', '2665263927', '2025-01-23 19:34:12', 381000.00, 1, 12127.50, 5197.50, 'Pending', '1277820374_BRV967440', '大阪城門票 Osaka Castle', 1, 38, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(386, '10d5378036e3b76af110dbfa6f865c6ce2b55eb4', '2665999390', '2025-01-23 19:28:14', 299250.00, 1, 9607.50, 4117.50, 'Pending', '1277818357_FTV600429', 'Klook eSIM 韓國 高速上網吃到飽 | SKT', 1, 39, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(387, '6f55c5ab15360f56eb42e54326b33f4dd195e7a6', '2665929887', '2025-01-23 19:23:01', 171000.00, 1, 5512.50, 2362.50, 'Pending', '1277716783_FGS798884', '韓國WOWPASS消費卡/交通卡', 1, 40, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(388, 'd755455e9dad7edc7ba19e6164468ebdc3fb303e', '2665120036', '2025-01-23 19:18:31', 1806000.00, 1, 57802.50, 24772.50, 'Pending', '1277815003_JZF769821', '新加坡環球影城門票 Universal Studios Singapore', 1, 41, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(389, '2a328c319e0dd90791207f47a48499cc3269d073', '2665029072', '2025-01-23 19:15:19', 1700250.00, 1, 54337.50, 23287.50, 'Pending', '1277714000_SHQ648355', '機場接送 - 仁川國際機場 (送機服務)', 1, 42, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(390, '0650f078f0c4510758f00b2b94c98d45a113feaa', '2665920508', '2025-01-23 18:27:46', 225000.00, 1, 0.00, 0.00, 'Pending', '1277696283_SVQ559756', '全家便利超商 - 禮物卡', 1, 43, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(391, 'd1461a178cb7a73703d6d3960535a2f6b2307e96', '2665567042', '2025-01-23 17:40:25', 287250.00, 1, 9135.00, 3915.00, 'Pending', '1277581215_JXC579295', '城市交通 會安至順化 / 巴拿山 / 峴港  / 美山聖地私人接送', 1, 44, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(392, 'a66609a137c0a5a0785ef6ad3127fc8931aac999', '2665473866', '2025-01-23 17:10:05', 341250.00, 1, 10867.50, 4657.50, 'Pending', '1277471216_JNP999699', '桃園站 - 台中站', 1, 45, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(393, '018e6dc033e6cf274d9cab341d59771008407a8a', '2665473866', '2025-01-23 17:10:05', 90000.00, 1, 2835.00, 1215.00, 'Pending', '1277571070_EHX554909', '米其林必比登推薦：台客燒肉粥 - 五權店 - 台中捷運南屯站', 1, 46, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(394, 'd477267a034374d48036324484e483f96d724233', '2665473866', '2025-01-23 17:10:05', 0.00, 1, 0.00, 0.00, 'Pending', '1277670961_CJQ146765', '【贈品】台灣 星巴克 飲品優惠券（請詳閱憑證兌換方式，勿直接到門市核銷', 1, 47, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(395, 'e0cc138f5ac16ea7a87fb358b7529bc1762f7198', '2665391979', '2025-01-23 16:57:23', 255150.00, 1, 8977.50, 3847.50, 'Pending', '1277466947_FAF885947', 'Tokyo Subway Ticket', 1, 48, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(396, '613f0aaefba2401cc17c8560b0f079016a4bce69', '2665762126', '2025-01-23 15:04:06', 255000.00, 1, 8190.00, 3510.00, 'Pending', '1277625778_MUB707727', '國立海洋科技博物館主題館(海科館)門票', 1, 49, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(397, '1f154b549408f766889746aadb453cd56181113a', '2665116100', '2025-01-23 14:13:45', 735000.00, 1, 23467.50, 10057.50, 'Pending', '1277406924_QHN310527', 'Animage雜誌和吉卜力展', 1, 50, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(398, 'cfab1358f8875835b61e57390c528ae744217705', '2665572947', '2025-01-23 14:10:21', 637500.00, 1, 20317.50, 8707.50, 'Pending', '1277405509_YFJ829070', '台灣 - 金門 - 廈門小三通船票', 1, 51, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(399, '9e05e2b5d121f8b2c15c855dc4e51fc311ea2a77', '2665352361', '2025-01-23 14:05:06', 562500.00, 1, 17955.00, 7695.00, 'Pending', '1277503325_YTR484496', '台灣 - 金門 - 廈門小三通船票', 1, 52, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(400, 'eff3110cc7c2724d115e69c4e66dcd95c22cf5a5', '2665967413', '2025-01-23 12:55:00', 579000.00, 1, 18585.00, 7965.00, 'Pending', '1277176601_EUT426947', '[仁川機場]機場大巴票（單程/往返）', 1, 53, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(401, '7763194c0076783dd0b3a08474461fc5c44aec02', '2665992691', '2025-01-23 12:47:30', 540000.00, 1, 18900.00, 8100.00, 'Pending', '1277173472_NPJ302817', 'Tokyo Subway Ticket', 1, 54, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(402, 'b29da610e74a9da03661c72d6afce707ed9ab4f1', '2665705647', '2025-01-23 12:46:50', 2055000.00, 1, 65677.50, 28147.50, 'Pending', '1277372916_XWY912942', 'Eobi冰谷 & 南怡島 & 晨靜樹木園 & 鐵路自行車 & 小法國一日遊', 1, 55, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(403, '4e727befa47ad12e6655d74fa00d56d4c161456a', '2665153476', '2025-01-23 12:29:53', 1158000.00, 1, 37012.50, 15862.50, 'Pending', '1277166145_KKH238044', '富國島野生動物園門票', 1, 56, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(404, '8d558e3e6ffc81da9c1040c92083d37f94565727', '2665979776', '2025-01-23 12:15:32', 786000.00, 1, 25200.00, 10800.00, 'Pending', '1277259767_WFB376660', '關西機場 - 南海電鐵特急Rapi:t 車票', 1, 57, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(405, '796e61fdf131452b967736c8eaa3ca74a45dc2d3', '2665325132', '2025-01-23 12:04:48', 238500.00, 1, 7560.00, 3240.00, 'Pending', '1277154822_PTE956417', 'Art Aquarium(金魚藝術展) in Taipei', 1, 58, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(406, '990013c33335bc8a30802b3d553e85c67021fb90', '2665583568', '2025-01-23 11:31:15', 283500.00, 1, 3622.50, 1552.50, 'Pending', '1277239894_UWC965721', 'JR關西機場特快 HARUKA 車票', 1, 59, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(407, '7cfe520ea6341249075240133850fca05345c9a0', '2665017561', '2025-01-23 11:22:06', 0.00, 1, 0.00, 0.00, 'Pending', '1277236128_XRY894500', '六福村主題遊樂園門票', 1, 60, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(408, 'dfe82d846b7af00749ee9a770739482b30e1f968', '2665017561', '2025-01-23 11:22:06', 0.00, 1, 0.00, 0.00, 'Pending', '1277336019_XTM442170', '六福村主題遊樂園門票', 1, 61, 8, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(409, 'f17962fa3babeedfec30058440375df643075166', '2665017561', '2025-01-23 11:22:06', 2398500.00, 1, 76702.50, 32872.50, 'Pending', '1277136277_SCN214104', '六福村主題遊樂園門票', 1, 62, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(410, '795d6bc0730ccf6b7f499fa39dc38bee75238b33', '2665336011', '2025-01-23 11:20:58', 0.00, 1, 0.00, 0.00, 'Pending', '1277135740_TYG104772', '釜山通行證 VISIT BUSAN PASS', 1, 63, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(411, '37506310305fbcc207f7ddd27f4a949b6131a553', '2665336011', '2025-01-23 11:20:58', 0.00, 1, 0.00, 0.00, 'Pending', '1277235592_JJN101688', '釜山通行證 VISIT BUSAN PASS', 1, 64, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(412, 'b9787811fc18abce3d74a6b26f1aeecad99ef4e9', '2665336011', '2025-01-23 11:20:58', 3063000.00, 1, 97965.00, 41985.00, 'Pending', '1277335487_XSX459132', '釜山通行證 VISIT BUSAN PASS', 1, 65, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(413, '7b8f3edff5f48a96ca4faac2d9206b6b33792ddf', '2665008057', '2025-01-23 10:53:43', 1017000.00, 1, 32445.00, 13905.00, 'Pending', '1277224591_WMK864868', '沖繩樂享周遊券 1 Week Free Pass', 1, 66, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(414, '4e1cc8f8f96d8ef679cfbb4df4704694a95fefb8', '2665309082', '2025-01-23 10:52:21', 169500.00, 1, 5355.00, 2295.00, 'Pending', '1277224060_EMZ215135', '【限時促銷】泰國eSIM卡（含無限流量 & 通話）', 1, 67, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(415, '96caa7362a471af7ad779f8b8a5858f7b3b20772', '2665047467', '2025-01-23 10:22:13', 285000.00, 1, 9135.00, 3915.00, 'Pending', '1277112187_EXJ678281', '美洲瘋馬大馬戲團＆后里馬場門票', 1, 68, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(416, 'edc4f4c86738319335bb72b41976db65144fd925', '2665660173', '2025-01-23 10:10:39', 518400.00, 1, 17482.50, 7492.50, 'Pending', '1277107558_VAQ603966', 'N首尔塔（南山塔）门票', 1, 69, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(417, '2cb2ef526190ae2f0dc2f0bc11eb84f4776b00c1', '2665288881', '2025-01-23 09:42:06', 285000.00, 1, 9135.00, 3915.00, 'Pending', '1276897388_WXQ108211', '美洲瘋馬大馬戲團＆后里馬場門票', 1, 70, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(418, '542850e962228d10439cf8316dc4c6c34ccb3bb7', '2665374472', '2025-01-23 09:30:32', 126850.00, 1, 3937.50, 1687.50, 'Pending', '1277093077_YZF523706', 'eSIM Hong Kong with high-speed and stable Internet connection', 1, 71, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(419, '36ad1a88c65b6472330706c234061c7611ad9ea8', '2665553938', '2025-01-23 09:02:48', 5066250.00, 1, 64732.50, 27742.50, 'Pending', '1276883768_MCR404155', '上野 - 輕井澤', 1, 72, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(420, '5bbd7fbaa6eb994bc794f9f9a47109cc6021241b', '2665762364', '2025-01-23 07:46:26', 470250.00, 1, 14962.50, 6412.50, 'Pending', '1277064477_EHX111185', '日本 4G eSIM card 高速上網（即買即取QR code）', 1, 73, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(421, 'd5796412a77baafdf22af39b3ec3d75a9018a5ad', '2665199573', '2025-01-23 07:16:18', 720000.00, 1, 22995.00, 9855.00, 'Pending', '1277059069_HQN866428', 'Skyliner 京成電鐵車票', 1, 74, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(422, '3a405cb134e152ef140a4dafe19b30dc9464ab9c', '2665936141', '2025-01-23 07:10:40', 1927500.00, 1, 61582.50, 26392.50, 'Pending', '1277058101_JEP603141', '韓國 AQUAFIELD 門票（河南／高陽／安城分店）', 1, 75, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(423, 'c034c420377213ad736b908bd040f02dcaf3f6d4', '2665174810', '2025-01-23 06:16:42', 0.00, 1, 0.00, 0.00, 'Pending', '1276951160_PNG675508', '免費eSIM卡 - 每個訂單僅限一張eSIM', 1, 76, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(424, 'cd9253adf60347e9e12edf18b5476bfd3410659b', '2665174810', '2025-01-23 06:16:42', 693000.00, 1, 8820.00, 3780.00, 'Pending', '1277051053_KTU980146', 'JR關西機場特快 HARUKA 車票', 1, 77, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(425, 'b395f99127882a381b754c10129a751e40e9f476', '2665339406', '2025-01-23 03:14:28', 1303500.00, 1, 41737.50, 17887.50, 'Pending', '1276935338_RVW493817', '機場接送 - 那霸機場 (接機服務)', 1, 78, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(426, '26185a05dc5ecbb36c7e49c367c429abce9de569', '2665347216', '2025-01-23 03:10:35', 222000.00, 1, 7087.50, 3037.50, 'Pending', '1277034853_XPZ261712', 'Klook eSIM 韓國 高速上網吃到飽 | SKT', 1, 79, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(427, 'a4a75f4cf49393112d219a71d48d4d71bde6e2b5', '2665951324', '2025-01-23 03:01:39', 222000.00, 1, 7087.50, 3037.50, 'Pending', '1276834305_SQC674375', 'Klook eSIM 韓國 高速上網吃到飽 | SKT', 1, 80, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(428, '1d5e571b5b9ad9b587f5f9c19cf920d29732fa09', '2665093858', '2025-01-23 02:10:07', 1260000.00, 1, 40320.00, 17280.00, 'Pending', '1276828310_MVS911352', '大阪卡丁車體驗（JAPANKART）', 1, 81, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(429, '2b9f71a6d0665e9ebda058fc3298f8241516675f', '2665093858', '2025-01-23 02:10:07', 945000.00, 1, 30240.00, 12960.00, 'Pending', '1276928162_AMU370594', '京都｜亀岡 保津川遊船體驗', 1, 82, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(430, '0ea13299f7171f5af070dbd85594fc2730a7a1c3', '2665093858', '2025-01-23 02:10:07', 1416750.00, 1, 45360.00, 19440.00, 'Pending', '1277028056_JZU385758', '京都: 伊根舟屋 & 天橋立 & 美山町合掌村一日遊 (京都出發)', 1, 83, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(431, '56e22e2ffa3e02c8f967f515c31c062eb787cb54', '2665138484', '2025-01-23 00:45:13', 1464000.00, 1, 46777.50, 20047.50, 'Pending', '1276911650_BPH897893', '台南十鼓文創園區門票', 1, 84, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(432, 'bf92c68b62000df05c62325f0f79b7939cfbd882', '2665229381', '2025-01-23 00:10:45', 570000.00, 1, 18270.00, 7830.00, 'Pending', '1277000500_WXU540452', '名偵探柯南 連載30週年紀念展-高雄場', 1, 85, 8, '2025-02-03 08:42:01', '2025-02-03 08:42:01');

-- Dumping structure for table db_tkglobal.failed_jobs
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

-- Dumping data for table db_tkglobal.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table db_tkglobal.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.jobs: ~0 rows (approximately)

-- Dumping structure for table db_tkglobal.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.job_batches: ~0 rows (approximately)

-- Dumping structure for table db_tkglobal.link_histories
CREATE TABLE IF NOT EXISTS `link_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `campaign_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `link_histories_user_id_foreign` (`user_id`),
  KEY `link_histories_campaign_id_foreign` (`campaign_id`),
  CONSTRAINT `link_histories_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `link_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.link_histories: ~17 rows (approximately)
INSERT INTO `link_histories` (`id`, `code`, `original_url`, `domain`, `short_url`, `sub1`, `sub2`, `sub3`, `sub4`, `user_id`, `campaign_id`, `created_at`, `updated_at`) VALUES
	(1, '551732a30a92e339dfdb524bdfceceedb02e6154', 'https://lind.biz/et-ut-quaerat-nostrum-earum-deleniti-sapiente-corrupti.html', 'click.tkglobal.com', NULL, NULL, NULL, NULL, NULL, 8, 2, '2025-01-22 08:09:47', '2025-01-22 08:09:47'),
	(2, 'dc510d63b02605844bbad4176cb9b5c93f6dfe0c', 'https://lind.biz/et-ut-quaerat-nostrum-earum-deleniti-sapiente-corrupti.html', 'click.tkglobal.com', NULL, NULL, NULL, NULL, NULL, 8, 2, '2025-01-22 08:15:30', '2025-01-22 08:15:30'),
	(3, '3fc8bce508cc8383c44a2c5d769a032e7fd0c2e4', 'https://www.trip.com/hotels/shanghai-hotel-detail-16197084?showtotalamt=0&curr=USD&checkIn=2025-01-23&checkOut=2025-01-24&adult=1&children=0&crn=1&locale=en-XX', 'click.tkglobal.com', NULL, 'facebook', 'ads', 'giam-gia-soc-thang-1', 'the-tin-dung', 8, 2, '2025-01-22 08:19:56', '2025-01-22 08:19:56'),
	(5, 'fb627b1ba56b78107799608f397b3257431a67bf', NULL, NULL, NULL, 'TW-HK_22/11', '208-805-7591', NULL, NULL, 8, 1, '2025-02-03 08:28:04', '2025-02-03 08:28:04'),
	(6, 'cf60a435b3537e1829bad44def5cf106f08f36cd', NULL, NULL, NULL, 'Klook', 'TWAL', NULL, NULL, 8, 1, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(7, 'fee7db5ea2c6dc9d146008c6930faea9d036b475', NULL, NULL, NULL, 'Klook', 'Japan', NULL, NULL, 8, 1, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(8, 'f26be7693487bf68cefadb304aba339ffecfc72b', NULL, NULL, NULL, '331-182-5245', 'ĐLAL', NULL, NULL, 8, 1, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(9, 'b137992b87d7e1dbb601a234b1f547c13902d2a2', NULL, NULL, NULL, 'Klook', 'TWALURL', NULL, NULL, 8, 1, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(10, 'aa4ebc76274ff77f1abd585a40198acb135d3e1b', NULL, NULL, NULL, 'Klook', 'Korea', NULL, NULL, 8, 1, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(11, '752cf7fd6dd8fa26f3e0a981b4bc1038d5e46c9b', NULL, NULL, NULL, 'klook', 'CanadaTQ', NULL, NULL, 8, 1, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(12, '77bf1e3c5439159e7d95eeb943ef98ce17055a59', NULL, NULL, NULL, '331-182-5245', 'ĐL', NULL, NULL, 8, 1, '2025-02-03 08:41:59', '2025-02-03 08:41:59'),
	(13, 'e0cc138f5ac16ea7a87fb358b7529bc1762f7198', NULL, NULL, NULL, '331-182-5245', 'JP', NULL, NULL, 8, 1, '2025-02-03 08:42:00', '2025-02-03 08:42:00'),
	(14, '96caa7362a471af7ad779f8b8a5858f7b3b20772', NULL, NULL, NULL, NULL, '579-051-7621', NULL, NULL, 8, 1, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(15, '542850e962228d10439cf8316dc4c6c34ccb3bb7', NULL, NULL, NULL, 'Klook', 'Thai', NULL, NULL, 8, 1, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(16, '56e22e2ffa3e02c8f967f515c31c062eb787cb54', NULL, NULL, NULL, '976-015-3174', 'TW_JP_5.12', NULL, NULL, 8, 1, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(17, '36a39b693560558b006f540c5f50fe76b828efaf', NULL, NULL, NULL, '976-015-3174', 'TW_VN_5.12', NULL, NULL, 8, 1, '2025-02-03 08:42:01', '2025-02-03 08:42:01'),
	(18, 'eb145e9d35a9651ee73a7d3398bdc7133215e1dc', NULL, NULL, NULL, '976-015-3174', 'HK_HK_12.11', NULL, NULL, 8, 1, '2025-02-03 08:42:01', '2025-02-03 08:42:01');

-- Dumping structure for table db_tkglobal.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.migrations: ~11 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_01_14_090016_create_categories_table', 2),
	(6, '2025_01_14_094045_create_campaigns_table', 3),
	(8, '2025_01_15_071358_create_profiles_table', 4),
	(9, '2025_01_16_080338_create_link_histories_table', 5),
	(10, '2025_01_20_113955_create_clicks_table', 6),
	(11, '2025_01_20_114055_create_conversions_table', 7),
	(12, '2025_01_24_105413_create_personal_access_tokens_table', 8),
	(13, '2025_02_03_102139_create_configs_table', 9);

-- Dumping structure for table db_tkglobal.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table db_tkglobal.personal_access_tokens
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

-- Dumping data for table db_tkglobal.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table db_tkglobal.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_code` tinyint DEFAULT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Individual',
  `bank_owner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `citizen_id_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `citizen_id_date` datetime DEFAULT NULL,
  `citizen_id_place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` tinytext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.profiles: ~1 rows (approximately)
INSERT INTO `profiles` (`id`, `phone`, `address`, `city_code`, `city_name`, `account_type`, `bank_owner`, `bank_number`, `bank_code`, `bank_name`, `bank_branch`, `citizen_id_no`, `citizen_id_date`, `citizen_id_place`, `tax`, `avatar`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, '0326018395', 'Mễ Trì, Nam Từ Liêm', 1, 'Thành phố Hà Nội', 'Individual', 'LE MINH QUANG', '123456789', 'BVB', 'Ngân hàng TMCP Bảo Việt', 'Cầu Giấy', '022096000803', '2025-01-03 00:00:00', 'Cục Cảnh sát quản lý hành chính về trật tự xã hội', '987654321', '1737013026.png', 8, NULL, '2025-01-23 01:28:12');

-- Dumping structure for table db_tkglobal.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.sessions: ~1 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('pT6cDYcRzslxSKtE1I7AqQVTYC4fu8HvkdBaoHZM', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMmFQNmlxa1RKeUtzOE1PdVI2c1NaTmpIRGk0WnpuUmtrdjV5VWlXbiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM2OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvY2FtcGFpZ25zL2xpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo4O30=', 1738738372);

-- Dumping structure for table db_tkglobal.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tkglobal.users: ~8 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Lê Minh Quang', 'lmquangwebsite@gmail.com', NULL, '$2y$12$ykOSGulbfmVA1f3JsuAVkuKBGnQdNrEgXQUJnoIT.bNd.Uh1Ym6/.', '4AbEulNVCg7OMBeFVriIRaln3iTlVk6k6iv1s0fmNR6WJix8iSKGKPTvZ4c6', '2025-01-13 01:43:36', '2025-01-13 01:43:36'),
	(2, 'Lê Văn Luyện', 'lmquangit2@gmail.com', NULL, '$2y$12$EXR6scgFonq0xn79vB61A.Gd6YFAO/mleRB4FH0Q0jc2PM2HXutw6', 'sekINBRCjh2gND8EOrAUFHd6AHjKJmVsdZSt17Ff0ik3mkHL2CVfPWCkhC4H', '2025-01-13 03:14:57', '2025-01-13 03:14:57'),
	(3, 'Lê Minh Quang', 'lmquang96@gmail.com', NULL, '$2y$12$mn1m2kHepYHsLSv5dsjbeOL4nAYiUbhCDNTe/gLJEqMJfQAm7nx.q', NULL, '2025-01-13 20:46:55', '2025-01-13 20:46:55'),
	(4, 'Lê Minh Quang', 'lmquangit3@gmail.com', '2025-01-13 21:22:07', '$2y$12$lOWcKFnLizCewL3RqQMIvuDVEENZZBtL5Jz8oAw7rfEAm/14U5gLe', NULL, '2025-01-13 21:07:22', '2025-01-13 21:22:07'),
	(5, 'Lê Minh Quang', 'lmquangit4@gmail.com', NULL, '$2y$12$x2eGL9cUONuA8WNBsk5LyeS.3ahxU/gCK2HdteQcJgZuJqWytCPH2', 'uHx17o5t6d7PRxeSFLQQxd4LDfqg2fiA08TxmhsMJYJ1UKpTdsSQuBPQWIQc', '2025-01-13 21:36:01', '2025-01-13 21:36:01'),
	(6, 'Lê Minh Quang', 'lmquangit5@gmail.com', '2025-01-14 00:11:32', '$2y$12$ZS.HBNaxN8a5XyU2kqZrlOXUn7o0Z4oDVNftqMoheE.ZmFV/pnsXG', '8Zln5Rjjkd4eRfiBeOSk1x3gpJ0PreG1rJ8fBMLKod7RDHrRgY5Lwr9GuUvI', '2025-01-14 00:00:18', '2025-01-14 00:11:32'),
	(7, 'Lê Minh Quang', 'lmquangit6@gmail.com', NULL, '$2y$12$UqnsCn1zDA696X6LKt18sukibpbi12VEQYXrmnuVxACBKTxnvbHkm', NULL, '2025-01-14 00:14:23', '2025-01-14 00:14:23'),
	(8, 'Lê Cát Trọng Lý', 'lmquangit@gmail.com', '2025-01-14 00:16:28', '$2y$12$MvskeZHBrlW4rsr5Ir1cXODafSTXf4QVh21kpoYeIV78rK0aMMmhK', NULL, '2025-01-14 00:15:57', '2025-01-15 19:34:12');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
