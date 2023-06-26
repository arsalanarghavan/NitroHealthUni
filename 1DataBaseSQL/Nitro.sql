-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 26, 2023 at 04:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dish`
--

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `room_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Привет', '2021-11-26 01:47:55', '2021-11-26 01:47:55'),
(2, 1, 1, 'ододлодллдодо', '2021-11-28 19:07:23', '2021-11-28 19:07:23'),
(3, 1, 1, 'fghf', '2022-03-09 01:47:48', '2022-03-09 01:47:48');

-- --------------------------------------------------------

--
-- Table structure for table `culinary_processings`
--

CREATE TABLE `culinary_processings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `culinary_processings`
--

INSERT INTO `culinary_processings` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'پختنی', NULL, NULL),
(3, 'سرخ کردنی', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'شنبه', NULL, NULL),
(2, 'یک‌شنبه', NULL, NULL),
(3, 'دوشنبه', NULL, NULL),
(4, 'سه‌شنبه', NULL, NULL),
(5, 'چهارشنبه', NULL, NULL),
(6, 'پنج‌شنبه', NULL, NULL),
(7, 'جمعه', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `dishes_categories_id` bigint(20) UNSIGNED NOT NULL,
  `recipes_collections_id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `culinary_processings_id` bigint(20) UNSIGNED NOT NULL,
  `yield` double NOT NULL,
  `dishes_characters` text NOT NULL,
  `techmap_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `name`, `dishes_categories_id`, `recipes_collections_id`, `description`, `culinary_processings_id`, `yield`, `dishes_characters`, `techmap_number`, `created_at`, `updated_at`) VALUES
(30, 'صبحانه', 4, 1, 'چای ساز', 2, 15, 'مقوی', 15, '2023-06-26 05:51:06', '2023-06-26 05:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `dishes_categories`
--

CREATE TABLE `dishes_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dishes_categories`
--

INSERT INTO `dishes_categories` (`id`, `name`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'غذاهای گوشتی', 50, NULL, NULL),
(2, 'غذاهای دریایی', 50, NULL, NULL),
(3, 'غلات', 10, NULL, NULL),
(4, 'صبحانه', 10, NULL, NULL),
(5, 'نوشیدنی‌های خنک', 90, NULL, NULL),
(6, 'نوشیدنی‌های گر‌م', 80, NULL, NULL),
(7, 'مخلفات', 40, NULL, NULL),
(8, 'محصولات آرد', 120, NULL, NULL),
(9, 'سس‌ها', 60, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dishes_products`
--

CREATE TABLE `dishes_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dishes_id` bigint(20) UNSIGNED NOT NULL,
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `net_weight` double NOT NULL,
  `gross_weight` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dishes_products`
--

INSERT INTO `dishes_products` (`id`, `dishes_id`, `products_id`, `net_weight`, `gross_weight`, `created_at`, `updated_at`) VALUES
(37, 30, 26, 50, 25, '2023-06-26 05:53:47', '2023-06-26 05:53:47'),
(38, 30, 26, 50, 25, '2023-06-26 05:53:49', '2023-06-26 05:53:49'),
(39, 30, 26, 50, 25, '2023-06-26 05:54:55', '2023-06-26 05:54:55'),
(40, 30, 26, 25, 50, '2023-06-26 05:55:00', '2023-06-26 05:55:00'),
(41, 30, 26, 25, 50, '2023-06-26 05:55:02', '2023-06-26 05:55:02'),
(42, 30, 26, 25, 50, '2023-06-26 05:55:03', '2023-06-26 05:55:03');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `name`, `created_at`, `updated_at`) VALUES
(13, 0, 'صبحانه', '2023-06-26 05:55:36', '2023-06-26 05:55:36');

-- --------------------------------------------------------

--
-- Table structure for table `menu_days`
--

CREATE TABLE `menu_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `days_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_days`
--

INSERT INTO `menu_days` (`id`, `menu_id`, `days_id`, `created_at`, `updated_at`) VALUES
(32, 13, 1, NULL, NULL),
(33, 13, 3, NULL, NULL),
(34, 13, 5, NULL, NULL),
(35, 13, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_dishes`
--

CREATE TABLE `menu_dishes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `cycle` int(11) NOT NULL,
  `days_id` int(11) NOT NULL,
  `nutrition_id` int(11) NOT NULL,
  `dishes_id` bigint(20) UNSIGNED NOT NULL,
  `yield` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_nutrition`
--

CREATE TABLE `menu_nutrition` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `nutrition_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nutrition`
--

INSERT INTO `menu_nutrition` (`id`, `menu_id`, `nutrition_id`, `created_at`, `updated_at`) VALUES
(22, 13, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_10_23_143449_create_items_table', 1),
(7, '2021_11_01_133532_create_chats_table', 2),
(8, '2021_11_26_071856_create_dishes_categories_table', 2),
(9, '2021_11_26_072958_create_recipes_collections_table', 3),
(10, '2021_11_26_073239_create_culinary_processings_table', 4),
(11, '2021_11_26_073356_create_dishes_table', 5),
(12, '2021_12_17_050731_create_products_categories_table', 6),
(13, '2021_12_17_051024_create_products_subcategories_table', 6),
(14, '2021_12_17_051238_create_products_table', 6),
(16, '2022_01_07_082116_create_permission_tables', 8),
(19, '2022_03_15_101238_create_menus_table', 9),
(24, '2021_12_17_051601_create_dishes_products_table', 11),
(27, '2022_03_16_100609_create_menu_dishes_table', 11),
(29, '2022_03_27_181157_create_days_table', 13),
(30, '2022_03_28_100546_create_menu_days_table', 13),
(32, '2022_03_19_085623_create_nutrition_table', 14),
(33, '2022_03_29_100336_create_menu_nutrition_table', 14),
(34, '2022_05_08_134830_add_columns_to_products', 15);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `nutritions`
--

CREATE TABLE `nutritions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nutritions`
--

INSERT INTO `nutritions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'صبحانه', NULL, NULL),
(2, 'میان وعده صبحانه', NULL, NULL),
(3, 'ناهار', NULL, NULL),
(4, 'میان وعده ناهار', NULL, NULL),
(5, 'شام', NULL, NULL),
(6, 'میان وعده شام', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'write', 'web', '2022-01-07 08:14:30', '2022-01-07 08:14:30');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 5, 'admin@mail.ru', '1aadafc7d2a2151efb87f9df264f000f3aaa83589346b5a966b13155a56cf8e8', '[\"*\"]', NULL, '2022-03-20 09:04:59', '2022-03-20 09:04:59'),
(2, 'App\\Models\\User', 5, 'admin@mail.ru', 'c899f035e07e4ffb93cd6ab17d75f4e13f1126d5374041a0a1b5a1b3ab5ec89a', '[\"*\"]', '2022-03-20 09:15:06', '2022-03-20 09:12:19', '2022-03-20 09:15:06'),
(3, 'App\\Models\\User', 5, 'admin@mail.ru', '26f17a1eb8fc8cd4a91e56bbf745ef210e2b519886b043c590fd5980be78cd6c', '[\"*\"]', '2022-03-20 09:21:20', '2022-03-20 09:21:20', '2022-03-20 09:21:20'),
(4, 'App\\Models\\User', 5, 'admin@mail.ru', 'f47784df4787d4546ce23599a244a0043fdd95adba6369f891b942f21d2d0727', '[\"*\"]', '2022-03-20 09:23:48', '2022-03-20 09:23:23', '2022-03-20 09:23:48'),
(5, 'App\\Models\\User', 5, 'admin@mail.ru', '5c1788cbf2178a64e70be90c51b253b55fca751836fc077eaece9bd6a03d1c5a', '[\"*\"]', '2022-03-21 09:49:48', '2022-03-20 09:28:35', '2022-03-21 09:49:48'),
(6, 'App\\Models\\User', 5, 'admin@mail.ru', 'ca859cee3fff5a685bb96553e28a0d14ca6aec2851b038e2586db8cf39966120', '[\"*\"]', '2022-03-21 09:50:27', '2022-03-21 09:50:27', '2022-03-21 09:50:27'),
(7, 'App\\Models\\User', 5, 'admin@mail.ru', '2f0afa4aaf144840849bcc074b429dd025fa6828d187597cf544989247a32f02', '[\"*\"]', NULL, '2022-03-21 10:18:06', '2022-03-21 10:18:06'),
(8, 'App\\Models\\User', 5, 'admin@mail.ru', 'b5a38a86e8a6eea597fa51c89697ce8e62e2734841cc55617e9e3f6ef0bd36ff', '[\"*\"]', NULL, '2022-03-21 10:26:43', '2022-03-21 10:26:43'),
(9, 'App\\Models\\User', 5, 'admin@mail.ru', 'd3ed42fe997a567c9c469af1a9f73acf98b5432ddfebf2d720a2b8dfe9d1c980', '[\"*\"]', NULL, '2022-03-21 10:44:39', '2022-03-21 10:44:39');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `products_categories_id` bigint(20) UNSIGNED NOT NULL,
  `products_subcategories_id` bigint(20) UNSIGNED NOT NULL,
  `sort` double NOT NULL,
  `water` double NOT NULL,
  `protein` double NOT NULL,
  `fat` double NOT NULL,
  `carbohydrates_total` double(8,2) DEFAULT NULL,
  `na` double(8,2) DEFAULT NULL,
  `k` double(8,2) DEFAULT NULL,
  `ca` double(8,2) DEFAULT NULL,
  `mg` double(8,2) DEFAULT NULL,
  `p` double(8,2) DEFAULT NULL,
  `fe` double(8,2) DEFAULT NULL,
  `i` double(8,2) DEFAULT NULL,
  `se` double(8,2) DEFAULT NULL,
  `vitamin_a` double(8,2) DEFAULT NULL,
  `vitamin_b1` double(8,2) DEFAULT NULL,
  `vitamin_b2` double(8,2) DEFAULT NULL,
  `vitamin_c` double(8,2) DEFAULT NULL,
  `vitamin_d` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `products_categories_id`, `products_subcategories_id`, `sort`, `water`, `protein`, `fat`, `carbohydrates_total`, `na`, `k`, `ca`, `mg`, `p`, `fe`, `i`, `se`, `vitamin_a`, `vitamin_b1`, `vitamin_b2`, `vitamin_c`, `vitamin_d`, `created_at`, `updated_at`) VALUES
(26, 'مربا هویج مجید', 7, 1, 0, 45, 50, 60, 20.00, 25.00, 10.00, 18.00, 15.00, 46.00, 74.00, 45.00, 75.00, 20.00, 15.00, 18.00, 85.00, 90.00, '2023-06-26 05:34:00', '2023-06-26 05:34:00'),
(27, 'سویا', 5, 1, 0, 20, 10, 65, 80.00, 10.00, 58.00, 65.00, 44.00, 25.00, 64.00, 52.00, 15.00, 55.00, 45.00, 4.00, NULL, 46.00, '2023-06-26 05:40:59', '2023-06-26 05:40:59'),
(31, 'لوبیا فرنگی', 9, 1, 0, 56, 85, 65, 18.00, 65.00, 82.00, 15.00, 68.00, 15.00, 35.00, 657.00, 45.00, 55.00, 44.00, 45.00, 38.00, 85.00, '2023-06-26 05:45:17', '2023-06-26 05:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `products_categories`
--

CREATE TABLE `products_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_categories`
--

INSERT INTO `products_categories` (`id`, `name`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'فرآورده‌های گوشتی', 330, NULL, NULL),
(2, 'سبزیجات', 90, NULL, NULL),
(3, 'غلات', 310, NULL, NULL),
(4, 'قنادی', 180, NULL, NULL),
(5, 'حبوبات', 290, NULL, NULL),
(6, 'قندها', 60, NULL, NULL),
(7, 'شیرینیجات', 70, NULL, NULL),
(8, 'میوه‌ها', 250, NULL, NULL),
(9, 'صیفی‌جات', 270, NULL, NULL),
(10, 'برنج‌ها', 170, NULL, NULL),
(11, 'لبنیات', 230, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_subcategories`
--

CREATE TABLE `products_subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `products_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_subcategories`
--

INSERT INTO `products_subcategories` (`id`, `products_categories_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'محصولات بدون گلوتن', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recipes_collections`
--

CREATE TABLE `recipes_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `short_title` varchar(191) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes_collections`
--

INSERT INTO `recipes_collections` (`id`, `name`, `short_title`, `organization_id`, `year`, `created_at`, `updated_at`) VALUES
(1, 'مجموعه من', 'مجموعه من', 1, 2020, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2022-01-07 01:44:17', '2022-01-07 01:44:17'),
(2, 'writer', 'web', '2022-01-07 08:14:30', '2022-01-07 08:14:30');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'Arsalan', 'info@arsalanarghavan.ir', NULL, '$2y$10$OG2lGoTBdRwGdHVh52klx..TDEAzvw5hYomfRohK68MJqhVfvv5He', NULL, '2022-03-21 11:06:56', '2022-03-21 11:06:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `culinary_processings`
--
ALTER TABLE `culinary_processings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dishes_dishes_categories_id_index` (`dishes_categories_id`),
  ADD KEY `dishes_recipes_collections_id_index` (`recipes_collections_id`),
  ADD KEY `dishes_culinary_processings_id_index` (`culinary_processings_id`);

--
-- Indexes for table `dishes_categories`
--
ALTER TABLE `dishes_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes_products`
--
ALTER TABLE `dishes_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dishes_products_dishes_id_index` (`dishes_id`),
  ADD KEY `dishes_products_products_id_index` (`products_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_days`
--
ALTER TABLE `menu_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_days_menu_id_index` (`menu_id`),
  ADD KEY `menu_days_days_id_index` (`days_id`);

--
-- Indexes for table `menu_dishes`
--
ALTER TABLE `menu_dishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_dishes_menu_id_index` (`menu_id`),
  ADD KEY `menu_dishes_dishes_id_index` (`dishes_id`);

--
-- Indexes for table `menu_nutrition`
--
ALTER TABLE `menu_nutrition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nutrition_menu_id_index` (`menu_id`),
  ADD KEY `menu_nutrition_nutrition_id_index` (`nutrition_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `nutritions`
--
ALTER TABLE `nutritions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_products_categories_id_index` (`products_categories_id`),
  ADD KEY `products_products_subcategories_id_index` (`products_subcategories_id`);

--
-- Indexes for table `products_categories`
--
ALTER TABLE `products_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_subcategories`
--
ALTER TABLE `products_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_subcategories_products_categories_id_index` (`products_categories_id`);

--
-- Indexes for table `recipes_collections`
--
ALTER TABLE `recipes_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `culinary_processings`
--
ALTER TABLE `culinary_processings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `dishes_categories`
--
ALTER TABLE `dishes_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dishes_products`
--
ALTER TABLE `dishes_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `menu_days`
--
ALTER TABLE `menu_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `menu_dishes`
--
ALTER TABLE `menu_dishes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `menu_nutrition`
--
ALTER TABLE `menu_nutrition`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `nutritions`
--
ALTER TABLE `nutritions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `products_categories`
--
ALTER TABLE `products_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `products_subcategories`
--
ALTER TABLE `products_subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recipes_collections`
--
ALTER TABLE `recipes_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `dishes_culinary_processings_id_foreign` FOREIGN KEY (`culinary_processings_id`) REFERENCES `culinary_processings` (`id`),
  ADD CONSTRAINT `dishes_dishes_categories_id_foreign` FOREIGN KEY (`dishes_categories_id`) REFERENCES `dishes_categories` (`id`),
  ADD CONSTRAINT `dishes_recipes_collections_id_foreign` FOREIGN KEY (`recipes_collections_id`) REFERENCES `recipes_collections` (`id`);

--
-- Constraints for table `dishes_products`
--
ALTER TABLE `dishes_products`
  ADD CONSTRAINT `dishes_products_dishes_id_foreign` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dishes_products_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_days`
--
ALTER TABLE `menu_days`
  ADD CONSTRAINT `menu_days_days_id_foreign` FOREIGN KEY (`days_id`) REFERENCES `days` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_days_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_dishes`
--
ALTER TABLE `menu_dishes`
  ADD CONSTRAINT `menu_dishes_dishes_id_foreign` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`),
  ADD CONSTRAINT `menu_dishes_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_nutrition`
--
ALTER TABLE `menu_nutrition`
  ADD CONSTRAINT `menu_nutrition_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_nutrition_nutrition_id_foreign` FOREIGN KEY (`nutrition_id`) REFERENCES `nutritions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_products_categories_id_foreign` FOREIGN KEY (`products_categories_id`) REFERENCES `products_categories` (`id`),
  ADD CONSTRAINT `products_products_subcategories_id_foreign` FOREIGN KEY (`products_subcategories_id`) REFERENCES `products_subcategories` (`id`);

--
-- Constraints for table `products_subcategories`
--
ALTER TABLE `products_subcategories`
  ADD CONSTRAINT `products_subcategories_products_categories_id_foreign` FOREIGN KEY (`products_categories_id`) REFERENCES `products_categories` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
