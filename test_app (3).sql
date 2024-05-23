-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2024 at 10:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `province_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number_of_clients` int(11) DEFAULT NULL,
  `number_of_districts` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `province_id`, `number_of_clients`, `number_of_districts`, `created_at`, `updated_at`) VALUES
(1, 'Harare', 1, 1000, 500, '2024-04-25 10:43:37', '2024-05-20 18:25:15'),
(2, 'Gweru', 5, 150000, 0, '2024-05-20 18:25:37', '2024-05-20 18:25:37'),
(3, 'Mutare', 4, 100000, 0, '2024-05-20 18:25:54', '2024-05-20 18:25:54'),
(4, 'Mutoko', 2, 120000, 0, '2024-05-20 18:26:17', '2024-05-20 18:26:17'),
(5, 'Marondera', NULL, 0, 0, '2024-05-22 15:06:41', '2024-05-22 15:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `number_of_appliances` int(11) NOT NULL,
  `number_of_residents` int(11) NOT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `town_id` bigint(20) UNSIGNED DEFAULT NULL,
  `province_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `monthly_consumption` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `full_name`, `email`, `phone`, `address`, `number_of_appliances`, `number_of_residents`, `district_id`, `city_id`, `town_id`, `province_id`, `created_at`, `updated_at`, `monthly_consumption`) VALUES
(1, 'Mount Plesant', 'blessingmwalein@gmail.com', '772440088', 'Mt Pleasant Harare', 10, 2, NULL, 1, NULL, NULL, '2024-04-25 11:53:55', '2024-05-22 14:55:30', 50.00),
(3, 'Borowdale', 'borowdale@outlook.com', '772440088', 'Borowdale, Harare', 0, 0, NULL, 1, NULL, NULL, '2024-05-22 14:58:15', '2024-05-22 14:58:15', 100.00),
(5, 'Chisumbanje', 'chisu@gmail.com', '772440088', 'Matebeleland', 0, 0, NULL, 2, NULL, NULL, '2024-05-22 14:59:33', '2024-05-22 14:59:33', 120.00);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `number_of_clients` int(11) NOT NULL,
  `number_of_provinces` int(11) NOT NULL,
  `number_of_cities` int(11) NOT NULL,
  `number_of_districts` int(11) NOT NULL,
  `number_of_towns` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distributions`
--

CREATE TABLE `distributions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `month` varchar(255) NOT NULL,
  `target_city` varchar(255) NOT NULL,
  `distribution_schedule` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`distribution_schedule`)),
  `capacity` double(8,2) NOT NULL,
  `distribution_status` varchar(255) NOT NULL,
  `shortfall` varchar(255) DEFAULT NULL,
  `mae` varchar(255) DEFAULT NULL,
  `rmse` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `distributions`
--

INSERT INTO `distributions` (`id`, `month`, `target_city`, `distribution_schedule`, `capacity`, `distribution_status`, `shortfall`, `mae`, `rmse`, `created_at`, `updated_at`) VALUES
(5, 'January', 'Harare', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":80,\"Munyati\":0}', 80.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-21 09:23:00', '2024-05-21 09:23:00'),
(6, 'January', 'Gweru', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":60,\"Munyati\":0}', 60.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-21 09:23:00', '2024-05-21 09:23:00'),
(7, 'January', 'Mutare', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":55,\"Munyati\":0}', 55.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-21 09:23:00', '2024-05-21 09:23:00'),
(8, 'January', 'Mutoko', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":66,\"Munyati\":0}', 66.25, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-21 09:23:00', '2024-05-21 09:23:00'),
(9, 'February', 'Harare', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":85,\"Munyati\":0}', 85.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-21 09:47:22', '2024-05-21 09:47:22'),
(10, 'February', 'Gweru', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":65,\"Munyati\":0}', 65.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-21 09:47:22', '2024-05-21 09:47:22'),
(11, 'February', 'Mutare', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":60,\"Munyati\":0}', 60.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-21 09:47:22', '2024-05-21 09:47:22'),
(12, 'February', 'Mutoko', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":71,\"Munyati\":0}', 71.25, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-21 09:47:22', '2024-05-21 09:47:22'),
(13, 'June', 'Harare', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":105,\"Munyati\":0}', 105.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-21 10:44:52', '2024-05-21 10:44:52'),
(14, 'June', 'Gweru', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":85,\"Munyati\":0}', 85.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-21 10:44:52', '2024-05-21 10:44:52'),
(15, 'June', 'Mutare', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":80,\"Munyati\":0}', 80.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-21 10:44:52', '2024-05-21 10:44:52'),
(16, 'June', 'Mutoko', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":91,\"Munyati\":0}', 91.25, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-21 10:44:52', '2024-05-21 10:44:52'),
(17, 'May', 'Harare', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":100,\"Munyati\":0}', 100.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:39:51', '2024-05-22 15:39:51'),
(18, 'May', 'Gweru', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":80,\"Munyati\":0}', 80.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:39:51', '2024-05-22 15:39:51'),
(19, 'May', 'Mutare', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":75,\"Munyati\":0}', 75.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:39:52', '2024-05-22 15:39:52'),
(20, 'May', 'Mutoko', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":86,\"Munyati\":0}', 86.25, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:39:52', '2024-05-22 15:39:52'),
(21, 'May', 'Marondera', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":86,\"Munyati\":0}', 86.25, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:39:52', '2024-05-22 15:39:52'),
(22, 'June', 'Harare', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":105,\"Munyati\":0}', 105.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:41:14', '2024-05-22 15:41:14'),
(23, 'June', 'Gweru', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":85,\"Munyati\":0}', 85.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:41:14', '2024-05-22 15:41:14'),
(24, 'June', 'Mutare', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":80,\"Munyati\":0}', 80.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:41:14', '2024-05-22 15:41:14'),
(25, 'June', 'Mutoko', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":91,\"Munyati\":0}', 91.25, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:41:14', '2024-05-22 15:41:14'),
(26, 'June', 'Marondera', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":91,\"Munyati\":0}', 91.25, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:41:14', '2024-05-22 15:41:14'),
(27, 'July', 'Harare', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":110,\"Munyati\":0}', 110.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:42:20', '2024-05-22 15:42:20'),
(28, 'July', 'Gweru', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":89,\"Munyati\":0}', 90.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:42:20', '2024-05-22 15:42:20'),
(29, 'July', 'Mutare', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":85,\"Munyati\":0}', 85.00, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:42:20', '2024-05-22 15:42:20'),
(30, 'July', 'Mutoko', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":96,\"Munyati\":0}', 96.25, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:42:20', '2024-05-22 15:42:20'),
(31, 'July', 'Marondera', '{\"Bulawayo\":0,\"Harare\":0,\"Hwange\":0,\"Kariba\":96,\"Munyati\":0}', 96.25, 'Insufficient energy, load shedding required', '0', '0', '0', '2024-05-22 15:42:20', '2024-05-22 15:42:20');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `province_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number_of_clients` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `town_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `city_id`, `province_id`, `number_of_clients`, `created_at`, `updated_at`, `town_id`) VALUES
(1, 'Pendenis', NULL, NULL, 12000, '2024-04-25 11:37:49', '2024-04-25 11:37:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `electricity_generations`
--

CREATE TABLE `electricity_generations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `electricity_plant_id` bigint(20) UNSIGNED NOT NULL,
  `generation` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `electricity_plants`
--

CREATE TABLE `electricity_plants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `capacity` double(8,2) NOT NULL,
  `generation` double(8,2) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `electricity_plants`
--

INSERT INTO `electricity_plants` (`id`, `name`, `type`, `capacity`, `generation`, `location`, `created_at`, `updated_at`, `city_id`) VALUES
(1, 'Kariba Plant', 'Hydrogen', 10000.00, 150000.00, 'Kariba Zimbabwe', '2024-04-25 12:15:33', '2024-05-22 15:15:41', 1),
(2, 'Stations  Hwange Power Station', 'Coal', 1000.00, 989.00, 'Situated in the North Western part of Zimbabwe, Hwange Power Station is the largest coal-fired .', '2024-05-20 18:30:32', '2024-05-20 18:30:32', 2),
(3, 'Harare Power Station', 'Hydrogen', 500.00, 0.00, 'This Power station is located in the Workington area of the capital city along Coventry ...', '2024-05-20 18:32:07', '2024-05-20 18:32:07', 1),
(4, 'Bulawayo Power Station', 'Hydrogen', 11000.00, 0.00, 'Bulawayo Power Station\nLocated in the second-largest city of Zimbabwe, Bulawayo Power Station is connected to the national grid through 11kV and 33kV systems.', '2024-05-20 18:32:57', '2024-05-20 18:32:57', 2);

-- --------------------------------------------------------

--
-- Table structure for table `electric_consumptions`
--

CREATE TABLE `electric_consumptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `consumption` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2024_03_19_201531_create_provinces_table', 1),
(5, '2024_03_19_201532_create_cities_table', 1),
(6, '2024_03_19_201543_create_districts_table', 1),
(7, '2024_03_19_201606_create_towns_table', 1),
(8, '2024_03_19_201707_create_countries_table', 1),
(9, '2024_03_19_202631_create_electricy_plants_table', 1),
(10, '2024_03_19_202632_create_electric_generations_table', 1),
(11, '2024_03_19_202707_create_clients_table', 1),
(12, '2024_03_19_202708_create_electric_consumptions_table', 1),
(14, '2024_04_23_075645_create_sessions_table', 1),
(15, '2024_04_25_132825_add_town_id_to_districts_table', 2),
(16, '2024_04_25_140356_add_town_city_id_to_electricity_plants_table', 3),
(17, '2024_03_19_203216_create_distributions_table', 4),
(18, '2024_05_21_073044_add_monthly_consumption_on_clients_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `number_of_clients` int(11) NOT NULL,
  `number_of_cities` int(11) NOT NULL,
  `number_of_districts` int(11) NOT NULL,
  `number_of_towns` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`, `number_of_clients`, `number_of_cities`, `number_of_districts`, `number_of_towns`, `created_at`, `updated_at`) VALUES
(1, 'Harare', 215000, 100, 1000, 15000, '2024-04-25 10:21:55', '2024-04-25 10:34:40'),
(2, 'Mashonaland East', 3000000, 3, 5, 10, '2024-04-25 10:30:16', '2024-04-25 10:30:16'),
(4, 'Mash Cetral', 1000, 50, 0, 0, '2024-05-20 18:24:54', '2024-05-20 18:24:54'),
(5, 'Matebeland', 0, 0, 0, 0, '2024-05-20 18:25:04', '2024-05-20 18:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('lOCFXwJTDI7KVLqeeazkwbPxqebhB9lMjgFIpe7A', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYWt6dXpTRlMyaWRFN1pKT2Z1aExQcTE4M1Z5dnBLMDk3Z2VHZVphUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJDN3Q1FEVjdPbGN2RndTeVFtSWR5OGVtM3ZhT0ljNHNGb0VJTjVHTGhNLktzanU2Y2VDRFpPIjt9', 1716402995);

-- --------------------------------------------------------

--
-- Table structure for table `towns`
--

CREATE TABLE `towns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `province_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number_of_clients` int(11) NOT NULL,
  `number_of_districts` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `towns`
--

INSERT INTO `towns` (`id`, `name`, `city_id`, `province_id`, `number_of_clients`, `number_of_districts`, `created_at`, `updated_at`) VALUES
(1, 'Mt Pleasant', 1, NULL, 500, 100, '2024-04-25 11:03:50', '2024-04-25 11:03:50'),
(3, 'Hatclief', 1, NULL, 200, 50, '2024-04-25 11:04:50', '2024-04-25 11:04:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Blessing Mwale', 'blessingmwalein@gmail.com', NULL, '$2y$12$JODKWg.xAZtjEHLP.1MMTu8IBscmTTj564yO3RBH2tdIByk.dg0Wi', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 08:46:00', '2024-04-23 08:46:00'),
(2, 'Admin', 'admin@admin.com', NULL, '$2y$12$3wCQDV7OlcvFwSyQmIdy8em3vaOIc4sFoEIN5GLhM.Ksju6ceCDZO', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 15:03:45', '2024-05-20 15:03:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_province_id_foreign` (`province_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_address_unique` (`address`) USING HASH,
  ADD KEY `clients_district_id_foreign` (`district_id`),
  ADD KEY `clients_city_id_foreign` (`city_id`),
  ADD KEY `clients_town_id_foreign` (`town_id`),
  ADD KEY `clients_province_id_foreign` (`province_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `distributions`
--
ALTER TABLE `distributions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `districts_city_id_foreign` (`city_id`),
  ADD KEY `districts_province_id_foreign` (`province_id`),
  ADD KEY `districts_town_id_foreign` (`town_id`);

--
-- Indexes for table `electricity_generations`
--
ALTER TABLE `electricity_generations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `electricity_generations_electricity_plant_id_foreign` (`electricity_plant_id`);

--
-- Indexes for table `electricity_plants`
--
ALTER TABLE `electricity_plants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `electricity_plants_city_id_foreign` (`city_id`);

--
-- Indexes for table `electric_consumptions`
--
ALTER TABLE `electric_consumptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `electric_consumptions_client_id_foreign` (`client_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `towns_city_id_foreign` (`city_id`),
  ADD KEY `towns_province_id_foreign` (`province_id`);

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
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distributions`
--
ALTER TABLE `distributions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `electricity_generations`
--
ALTER TABLE `electricity_generations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `electricity_plants`
--
ALTER TABLE `electricity_plants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `electric_consumptions`
--
ALTER TABLE `electric_consumptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `towns`
--
ALTER TABLE `towns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `clients_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `clients_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`),
  ADD CONSTRAINT `clients_town_id_foreign` FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`);

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `districts_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`),
  ADD CONSTRAINT `districts_town_id_foreign` FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`);

--
-- Constraints for table `electricity_generations`
--
ALTER TABLE `electricity_generations`
  ADD CONSTRAINT `electricity_generations_electricity_plant_id_foreign` FOREIGN KEY (`electricity_plant_id`) REFERENCES `electricity_plants` (`id`);

--
-- Constraints for table `electricity_plants`
--
ALTER TABLE `electricity_plants`
  ADD CONSTRAINT `electricity_plants_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `electric_consumptions`
--
ALTER TABLE `electric_consumptions`
  ADD CONSTRAINT `electric_consumptions_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `towns`
--
ALTER TABLE `towns`
  ADD CONSTRAINT `towns_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `towns_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
