-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 25, 2018 at 07:48 PM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trumpeter`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `services_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `booking_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amt` double(8,2) NOT NULL DEFAULT '0.00',
  `admin_commission` double(8,2) NOT NULL DEFAULT '0.00',
  `payment_mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_completed` int(11) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `token`, `stripe_token`, `services_id`, `booking_date`, `booking_time`, `booking_address`, `booking_city`, `booking_pincode`, `booking_note`, `total_amt`, `admin_commission`, `payment_mode`, `status`, `is_completed`, `company_id`, `currency`, `created_at`, `updated_at`) VALUES
(1, 60, 'KY2eXJWQn5M1fRDM1Ys6LCY8HHoGGGq2iCVYUjCN', NULL, '22', '2000-02-02', '00:00:03', 'Plot No. F7,  2nd floor,  Phase 8, mohali', 'mohali', '1233', 'tets', 0.00, 0.00, 'stripe', 'pending', NULL, 1, NULL, '2018-09-25 01:05:13', '2018-09-25 01:05:13'),
(2, 60, 'KY2eXJWQn5M1fRDM1Ys6LCY8HHoGGGq2iCVYUjCN', NULL, '22', '2000-02-02', '00:00:03', 'Plot No. F7,  2nd floor,  Phase 8, mohali', 'mohali', '1233', 'tets', 0.00, 0.00, 'stripe', 'pending', NULL, 2, NULL, '2018-09-25 01:05:30', '2018-09-25 01:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `compnay_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_days` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `company_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `official_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `admin_email_status` int(11) NOT NULL DEFAULT '0',
  `booking_opening_days` int(11) NOT NULL,
  `booking_per_hour` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `user_id`, `compnay_name`, `address`, `city`, `pin_code`, `country`, `state`, `company_number`, `description`, `working_days`, `start_time`, `end_time`, `company_logo`, `official_email`, `status`, `admin_email_status`, `booking_opening_days`, `booking_per_hour`, `created_at`, `updated_at`) VALUES
(1, 60, 'webGarhd', 'Plot no F7, mohali', 'mohali', '160055', 'india', 'punjab', '9988145213', 'Teste', '12', '00:00:12', '00:01:25', NULL, 'ashok@cwebconsultants.com', 'approved', 0, 12, 25, '2018-09-24 02:41:37', '2018-09-24 02:42:59'),
(2, 60, 'cWebco', 'Plot no F7, mohali', 'mohali', '160055', 'india', 'punjab', '9988145213', 'Teste', '12', '00:00:12', '00:01:25', NULL, 'ashok@1cwebconsultants.com', 'approved', 0, 12, 25, '2018-09-24 08:08:56', '2018-09-24 08:08:56');

-- --------------------------------------------------------

--
-- Table structure for table `company_services`
--

CREATE TABLE `company_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `service_type` int(11) NOT NULL,
  `conditions` int(11) DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_services`
--

INSERT INTO `company_services` (`id`, `company_id`, `cat_id`, `service_id`, `user_id`, `service_type`, `conditions`, `price`, `time`, `created_at`, `updated_at`) VALUES
(1, 1, 15, 22, 60, 3, NULL, 22.00, '00:00:02', '2018-09-24 03:40:45', '2018-09-24 03:47:25'),
(2, 1, 15, 208, 60, 4, NULL, 22.00, '00:00:02', '2018-09-24 03:52:26', '2018-09-24 03:52:26'),
(3, 1, 15, 209, 60, 4, NULL, 22.00, '00:00:02', '2018-09-24 03:54:20', '2018-09-24 03:54:20'),
(4, 1, 15, 211, 60, 4, NULL, 22.00, '00:00:02', '2018-09-24 03:54:27', '2018-09-24 03:54:27'),
(5, 2, 15, 102, 1, 1, NULL, 22.00, '00:00:02', '2018-09-24 08:10:25', '2018-09-24 08:10:25'),
(6, 2, 15, 101, 1, 1, NULL, 22.00, '00:00:02', '2018-09-24 08:10:33', '2018-09-24 08:10:33'),
(7, 2, 15, 22, 1, 1, NULL, 22.00, '00:00:02', '2018-09-24 08:10:48', '2018-09-24 08:10:48'),
(8, 2, 15, 208, 1, 1, NULL, 22.00, '00:00:02', '2018-09-24 08:10:54', '2018-09-24 08:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `trade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proofInsurance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `user_id`, `trade`, `proofInsurance`, `status`, `created_at`, `updated_at`) VALUES
(4, 60, 'image_1537529698.png', 'image_1537529698.png', 0, '2018-09-21 06:04:58', '2018-09-21 06:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `receiver_id` int(10) UNSIGNED NOT NULL,
  `proposal_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_09_14_062638_create_users_table', 2),
(8, '2018_09_14_094235_create_booking_table', 3),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 4),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 4),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 4),
(12, '2016_06_01_000004_create_oauth_clients_table', 4),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 4),
(14, '2018_09_21_100804_create_documents_table', 5),
(15, '2018_09_21_122853_create_services_table', 6),
(16, '2018_09_21_123556_create_catagories_table', 6),
(18, '2018_09_24_055241_create_service_profiles_table', 7),
(20, '2018_09_24_080053_create_companies_table', 8),
(21, '2018_09_24_100053_create_ratings_table', 9),
(24, '2018_09_24_123900_create_proposals_table', 10),
(25, '2018_09_24_120951_create_invitations_table', 11),
(26, '2018_09_24_132617_create_withdraws_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('09d5e4c6c7b72c0ec218fe437d80a16e1048b610acb7188b6e5f32d0b805dc41af92834ab2ba3425', 60, 7, 'MyApp', '[]', 0, '2018-09-24 01:26:50', '2018-09-24 01:26:50', '2019-09-24 06:56:50'),
('130036ec6324b9866f698d36fd3a42ebe58b2680f20e777f281dbdb79d3e6e9dd48c4bfd1b286040', 47, 7, 'MyApp', '[]', 0, '2018-09-20 08:45:10', '2018-09-20 08:45:10', '2019-09-20 14:15:10'),
('20e305374fea3e16513220d00c4830bc7b778b031acf54e8156d912f89acbc1ff94780f81bb60c93', 47, 7, 'MyApp', '[]', 0, '2018-09-20 08:38:51', '2018-09-20 08:38:51', '2019-09-20 14:08:51'),
('21b4ead5ef031f2e8fc91aa749b8303c6f630f8072eec64eb446376f9480a37392fd547caadbad40', 47, 7, 'MyApp', '[]', 0, '2018-09-20 08:14:32', '2018-09-20 08:14:32', '2019-09-20 13:44:32'),
('27827493b8ebb145d3cb3c2e7ab3f93024b4546cd8ca02f4932fdc938324154be12b1385be702a4f', 60, 7, 'MyApp', '[]', 0, '2018-09-25 04:37:39', '2018-09-25 04:37:39', '2019-09-25 10:07:39'),
('298906b043efa2ece268f24e645428bc60a99c5998dbf4fc0f83a73ddb6d9b6a30f3ba391c5814eb', 47, 7, 'MyApp', '[]', 0, '2018-09-20 08:45:03', '2018-09-20 08:45:03', '2019-09-20 14:15:03'),
('2bce024f09c87efdbccf4576ae8714bd872bd78998e197f20ffd0de546e13284b7077b5e4d5300d6', 60, 7, 'MyApp', '[]', 0, '2018-09-25 02:36:14', '2018-09-25 02:36:14', '2019-09-25 08:06:14'),
('2c366a01167542fc0aabeffb2298124c6258e75dc3ca044ba969afb76986c040bf053a8d3c937584', 47, 7, 'MyApp', '[]', 0, '2018-09-20 07:24:30', '2018-09-20 07:24:30', '2019-09-20 12:54:30'),
('33a2016ec5c38ebcdce7192f8f70bc96c7a353960a77abde8041764bdcf683d4671242cf2cceccb7', 47, 7, 'MyApp', '[]', 0, '2018-09-20 04:55:49', '2018-09-20 04:55:49', '2019-09-20 10:25:49'),
('4035b99710b1174c6a434c787c735fd7d700dac41313a40e6ecee745176da642b43b3a213e4bc87e', 47, 7, 'MyApp', '[]', 0, '2018-09-19 05:24:21', '2018-09-19 05:24:21', '2019-09-19 10:54:21'),
('4658073e61c16085edfd688dcfff5a50c0cb7c31cfb156cbc9294811585633258ec44f36c0f39527', 47, 7, 'MyApp', '[]', 0, '2018-09-20 08:10:19', '2018-09-20 08:10:19', '2019-09-20 13:40:19'),
('4a445a1d732ae0496d22dbe77126e88b59761bbf38666efcfd8aaf11a12fbc502d2b511fe90eeec0', 54, 7, 'MyApp', '[]', 0, '2018-09-21 00:27:41', '2018-09-21 00:27:41', '2019-09-21 05:57:41'),
('53e1860051e1d8ffed60e3c61994633139be5184ad314211418127604a204b5b4a0dcb51741e3829', 51, 7, 'MyApp', '[]', 0, '2018-09-21 00:24:04', '2018-09-21 00:24:04', '2019-09-21 05:54:04'),
('545408342442688783359eae60c29f8435f9a136c1f3f1e0bf634d8cf3f9ff55ae17514e6d9f8334', 47, 7, 'MyApp', '[]', 0, '2018-09-19 05:14:46', '2018-09-19 05:14:46', '2019-09-19 10:44:46'),
('55cf31ade7178ea589cc33516cd6f0ff86d965166d5e5494b90063b52e2f534e28206f75bbe0553a', 60, 7, 'MyApp', '[]', 0, '2018-09-25 06:16:43', '2018-09-25 06:16:43', '2019-09-25 11:46:43'),
('5697df52cc0b33bf3fcb202e7e3c405f105db564dd60217ecdd73e402c95b41fa5359f486131bb39', 47, 7, 'MyApp', '[]', 0, '2018-09-20 05:11:09', '2018-09-20 05:11:09', '2019-09-20 10:41:09'),
('58b6b88ee3e46ddb1b6e93c84d923806617988c1552b32a13465aa525e112b49b2b0f0f026d08096', 53, 7, 'MyApp', '[]', 0, '2018-09-21 00:26:11', '2018-09-21 00:26:11', '2019-09-21 05:56:11'),
('5ae2dfc2157ba3a6809e5baa00e59c09ff8a4078965c428b7486b609f297d08346143635fa480540', 56, 7, 'MyApp', '[]', 0, '2018-09-21 00:39:32', '2018-09-21 00:39:32', '2019-09-21 06:09:32'),
('677c5b422aa213f0791ff144806baaa32127f15e4078ff94042f7336c8548b05554ac92a2ea68ed8', 47, 7, 'MyApp', '[]', 0, '2018-09-20 08:43:50', '2018-09-20 08:43:50', '2019-09-20 14:13:50'),
('733b40ed164c2aa2558d3f509ed637c52767c5bb65304b1143993721335dc70409503e91fad47540', 60, 7, 'MyApp', '[]', 0, '2018-09-25 02:25:50', '2018-09-25 02:25:50', '2019-09-25 07:55:50'),
('782c18bef73e43c2c9fb02c7c37bb8518f819c7ca775f31e348a75046554a4bbb3e8b0c387a3ab83', 60, 7, 'MyApp', '[]', 0, '2018-09-25 05:35:44', '2018-09-25 05:35:44', '2019-09-25 11:05:44'),
('785ae7aa69c813263a07112d56cb6c943c3200f090fbb45f9ab4f854700ae28620db3c4380251f5e', 58, 7, 'MyApp', '[]', 0, '2018-09-21 00:43:07', '2018-09-21 00:43:07', '2019-09-21 06:13:07'),
('7fe7c2f6a928e570bafe9f89d795b9d8b2b19d6d15e18ff548e794d1766c80d3ae2a48e752cf7b7b', 57, 7, 'MyApp', '[]', 0, '2018-09-21 00:40:13', '2018-09-21 00:40:13', '2019-09-21 06:10:13'),
('84c9865372169da829026bde919fe10d3dfca485f6d56ffe2dfcfaa9f8d8f9a26b2d07f03fe8565a', 60, 7, 'MyApp', '[]', 0, '2018-09-24 05:25:22', '2018-09-24 05:25:22', '2019-09-24 10:55:22'),
('8f9c3a78a0da523add268a18d3a6e4b841472a8993433ba82feb424e8d57961735e7a959806ee7ab', 47, 7, 'MyApp', '[]', 0, '2018-09-20 07:00:40', '2018-09-20 07:00:40', '2019-09-20 12:30:40'),
('99e340aaeb3dc7ae6ab6376d6911ef14929589ec84d96c38d93843f023417f5f4d45496446d1a10a', 60, 7, 'MyApp', '[]', 0, '2018-09-21 08:17:21', '2018-09-21 08:17:21', '2019-09-21 13:47:21'),
('9b3a2ca679452c48e724a06f873365a440d346814fc9f7c08024bf942a42060a205ecaa7dcf4003f', 59, 7, 'MyApp', '[]', 0, '2018-09-21 00:47:27', '2018-09-21 00:47:27', '2019-09-21 06:17:27'),
('a2235034c2f5abb2e6a3a8d69ccaf37ebcf702d58ce94559f5388940687822b007d211515fbe6710', 60, 7, 'MyApp', '[]', 0, '2018-09-21 01:30:50', '2018-09-21 01:30:50', '2019-09-21 07:00:50'),
('a4ef1f123fb0cad2c2a5b2158792fb86e5c3f3a5a36334b5c874ead12cc10865d879be4f57a37f3a', 60, 7, 'MyApp', '[]', 0, '2018-09-25 01:38:29', '2018-09-25 01:38:29', '2019-09-25 07:08:29'),
('a68bdf8ea5c160d425542b9b960282c16a8dc2a4cf7f15420a06b1533bad71c84a3e9db13d8fb882', 55, 7, 'MyApp', '[]', 0, '2018-09-21 00:39:23', '2018-09-21 00:39:23', '2019-09-21 06:09:23'),
('ae48e459cc8d7c7d763cb4e41f0bfc717cf568c83b5b6298017f5c19536ff18db703f0ed99e60323', 47, 7, 'MyApp', '[]', 0, '2018-09-20 07:33:13', '2018-09-20 07:33:13', '2019-09-20 13:03:13'),
('b225009dab4aa98fbaea71b7638e9d0d725f2e9315c17b1a7d2b08ce2cafe0d9d3a3dc7f35fa5311', 47, 7, 'MyApp', '[]', 0, '2018-09-20 08:43:55', '2018-09-20 08:43:55', '2019-09-20 14:13:55'),
('bf24f95bd6eeb59ca1f6277db283f7a89fae1d8c6053334ca94b7c1598f9cb16c32ef6d7ec0161ec', 47, 7, 'MyApp', '[]', 0, '2018-09-20 08:40:26', '2018-09-20 08:40:26', '2019-09-20 14:10:26'),
('d1296cb9cca7e2c7b9e28ca309201a64949200c37c018521180b4ab22367d2319a1d6bdf3cc7c5fd', 60, 7, 'MyApp', '[]', 0, '2018-09-25 06:43:23', '2018-09-25 06:43:23', '2019-09-25 12:13:23'),
('d5760b640ab0330a5cb73af329b24db8a2ad05f4e3e993bc81d7c0669ffa26397f54f9e466d842a7', 47, 7, 'MyApp', '[]', 0, '2018-09-20 08:45:20', '2018-09-20 08:45:20', '2019-09-20 14:15:20'),
('de727ec63ddf609f34b2d0348ebfa5881c4dfea813ff26fcb2b802df3e8ff0a1b29b807b0ee02d7a', 60, 7, 'MyApp', '[]', 0, '2018-09-25 01:38:36', '2018-09-25 01:38:36', '2019-09-25 07:08:36'),
('df497b2929d827c77a7f42fe290899f51f4b46e0e0c65fceea15d6d1b0768c6454d22ff76911213c', 47, 7, 'MyApp', '[]', 0, '2018-09-20 07:28:55', '2018-09-20 07:28:55', '2019-09-20 12:58:55'),
('e66977026d93f99681970d3fce482413d2adbab11299889142dbd572b075a41d7b1ee84e294a6ecc', 60, 7, 'MyApp', '[]', 0, '2018-09-25 02:07:17', '2018-09-25 02:07:17', '2019-09-25 07:37:17'),
('e87e8eac7b709ffb253ea8333d5f24b4d637beb51852ee1778a9f4cb5a69f424cc0e50b79eed43f9', 47, 7, 'MyApp', '[]', 0, '2018-09-20 07:21:39', '2018-09-20 07:21:39', '2019-09-20 12:51:39'),
('f33f01f843802433ff77b4d68185fb1020720196990f615f83afafa7f727d6b5f7be13ddd0f82195', 52, 7, 'MyApp', '[]', 0, '2018-09-21 00:24:37', '2018-09-21 00:24:37', '2019-09-21 05:54:37'),
('fd897ea30c652f19a29560efb3bc077ab28506b3b7bd953eee3072f4925417d54ebc701307be13b6', 47, 7, 'MyApp', '[]', 0, '2018-09-20 09:11:21', '2018-09-20 09:11:21', '2019-09-20 14:41:21'),
('ff4154f9c9cc2ab383a7b2d5fc9321a80a606b4fd12a369a9ac84317c411d26ef7188893819c2aec', 47, 7, 'MyApp', '[]', 0, '2018-09-20 08:39:15', '2018-09-20 08:39:15', '2019-09-20 14:09:15');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(7, NULL, 'Laravel Personal Access Client', 'UEvIjxOWkXzYYr36ovI1BjLbU4BUgSevns5RTmqC', 'http://localhost', 1, 0, 0, '2018-09-19 05:13:43', '2018-09-19 05:13:43'),
(8, NULL, 'Laravel Password Grant Client', 'UOXWFMLFHBLBkrpJh5WBGsPikBaIMk57S9da64Wt', 'http://localhost', 0, 1, 0, '2018-09-19 05:13:43', '2018-09-19 05:13:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(3, 7, '2018-09-19 05:13:43', '2018-09-19 05:13:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

CREATE TABLE `proposals` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `services` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `proposals`
--

INSERT INTO `proposals` (`id`, `user_id`, `job_title`, `services`, `location`, `description`, `status`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 60, 'testset', '208,22', 'mohali', 'te test tes ttststet', NULL, '2018-02-02 00:00:00', '2018-02-06 00:00:00', '2018-09-24 07:15:01', '2018-09-24 07:15:01');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `booking_id`, `user_id`, `rating`, `company_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 60, 2, 1, 'test', '2018-09-24 18:30:00', '2018-09-24 18:30:00'),
(2, 2, 60, 4, 1, '4543535', '2018-09-24 18:30:00', '2018-09-24 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `cat_id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(22, 15, 'Air system balancing and testing/Repairs', '', NULL, NULL),
(23, 15, 'Air-conditioning, with or without sheet metal work/Repairs', '', NULL, NULL),
(24, 15, 'Boiler erection and Installation/Repairs', '', NULL, NULL),
(25, 15, 'Drainage system Installation, cesspool and septic tank/Repairs', '', NULL, NULL),
(26, 15, 'Dry well construction, cesspool/Repairs', '', NULL, NULL),
(27, 15, 'Fuel oil burner Installation and servicing/Repairs', '', NULL, NULL),
(28, 15, 'Furnace Installation/Repairs', '', NULL, NULL),
(29, 15, 'Gas line hookup/Repairs', '', NULL, NULL),
(30, 15, 'Heating equipment Installation/Repairs', '', NULL, NULL),
(31, 15, 'Heating, with or without sheet metal work/Repairs', '', NULL, NULL),
(32, 15, 'Lawn sprinkler system Installation/Repairs', '', NULL, NULL),
(33, 15, 'Mechanical contractors', '', NULL, NULL),
(34, 15, 'Piping, plumbing/Repairs', '', NULL, NULL),
(35, 15, 'Plumbing and heating/Repairs', '', NULL, NULL),
(36, 15, 'Plumbing repair/Repairs', '', NULL, NULL),
(37, 15, 'Plumbing, with or without sheet metal work/Repairs', '', NULL, NULL),
(38, 15, 'Refrigeration and freezer work/Repairs', '', NULL, NULL),
(39, 15, 'Sewer hookups and connections for buildings/Repairs', '', NULL, NULL),
(40, 15, 'Sheet metal work combined with heating or Solar heating apparatus/Repairs', '', NULL, NULL),
(41, 15, 'Sprinkler system Installation/Repairs', '', NULL, NULL),
(42, 15, 'Steam fitting/Repairs', '', NULL, NULL),
(43, 15, 'Sump pump Installation and servicing/Repairs', '', NULL, NULL),
(44, 15, 'Ventilating work, with or without sheet metal work/Repairs', '', NULL, NULL),
(45, 15, 'Water pump Installation and servicing/Repairs', '', NULL, NULL),
(46, 15, 'Water system balancing and testing/Repairs', '', NULL, NULL),
(47, 16, 'Bridge painting/Repairs', '', NULL, NULL),
(48, 16, 'Electrostatic painting on site (including of lockers and fixtures)-', '', NULL, NULL),
(49, 16, 'House painting/Repairs', '', NULL, NULL),
(50, 16, 'Painting of buildings and other structures, except roofs/Repairs', '', NULL, NULL),
(51, 16, 'Paper hanging/Repairs', '', NULL, NULL),
(52, 16, 'Ship painting/Repairs', '', NULL, NULL),
(53, 16, 'Traffic lane painting/Repairs', '', NULL, NULL),
(54, 16, 'Whitewashing/Repairs', '', NULL, NULL),
(55, 17, 'Burglar alarm Installation/Repairs', '', NULL, NULL),
(56, 17, 'Cable splicing, electrical/Repairs', '', NULL, NULL),
(57, 17, 'Cable television hookup/Repairs', '', NULL, NULL),
(58, 17, 'Communications equipment Installation/Repairs', '', NULL, NULL),
(59, 17, 'Electrical repair at site of construction/Repairs', '', NULL, NULL),
(60, 17, 'Electrical work/Repairs', '', NULL, NULL),
(61, 17, 'Electronic control system Installation/Repairs', '', NULL, NULL),
(62, 17, 'Fire alarm Installation/Repairs', '', NULL, NULL),
(63, 17, 'Highway lighting and electrical signal construction/Repairs', '', NULL, NULL),
(64, 17, 'Intercommunications equipment Installation/Repairs', '', NULL, NULL),
(65, 17, 'Sound equipment Installation/Repairs', '', NULL, NULL),
(66, 17, 'Telecommunications equipment Installation/Repairs', '', NULL, NULL),
(67, 17, 'Telephone and telephone equipment Installation/Repairs', '', NULL, NULL),
(68, 18, 'Bricklaying/Repairs', '', NULL, NULL),
(69, 18, 'Chimney construction and maintenance/Repairs', '', NULL, NULL),
(70, 18, 'Concrete block laying/Repairs', '', NULL, NULL),
(71, 18, 'Foundations, building of: block, stone, or brick/Repairs', '', NULL, NULL),
(72, 18, 'Marble work, exterior construction/Repairs', '', NULL, NULL),
(73, 18, 'Masonry/Repairs', '', NULL, NULL),
(74, 18, 'Refactory brick construction/Repairs', '', NULL, NULL),
(75, 18, 'Retaining wall construction: block, stone, or brick/Repairs', '', NULL, NULL),
(76, 18, 'Stone setting/Repairs', '', NULL, NULL),
(77, 18, 'Stonework erection/Repairs', '', NULL, NULL),
(78, 18, 'Tuck pointing/Repairs', '', NULL, NULL),
(79, 19, 'Acoustical work/Repairs', '', NULL, NULL),
(80, 19, 'Ceilings, acoustical Installation/Repairs', '', NULL, NULL),
(81, 19, 'Drywall construction/Repairs', '', NULL, NULL),
(82, 19, 'Insulation Installation, buildings/Repairs', '', NULL, NULL),
(83, 19, 'Lathing/Repairs', '', NULL, NULL),
(84, 19, 'Plastering, plain or ornamental/Repairs', '', NULL, NULL),
(85, 19, 'Solar reflecting insulation film/Repairs', '', NULL, NULL),
(86, 19, 'Taping and finishing drywall/Repairs', '', NULL, NULL),
(87, 20, 'Fresco work/Repairs', '', NULL, NULL),
(88, 20, 'Mantel work/Repairs', '', NULL, NULL),
(89, 20, 'Marble Installation, interior: including finishing/Repairs', '', NULL, NULL),
(90, 20, 'Mosaic work/Repairs', '', NULL, NULL),
(91, 20, 'Terrazzo work/Repairs', '', NULL, NULL),
(92, 20, 'Tile Installation, ceramic/Repairs', '', NULL, NULL),
(93, 20, 'Tile setting, ceramic/Repairs', '', NULL, NULL),
(94, 21, 'Cabinet work performed at the construction site', '', NULL, NULL),
(95, 21, 'Carpentry work/Repairs', '', NULL, NULL),
(96, 21, 'Folding door Installation/Repairs', '', NULL, NULL),
(97, 21, 'Framing/Repairs', '', NULL, NULL),
(98, 21, 'Garage door Installation/Repairs', '', NULL, NULL),
(99, 21, 'Joinery, ship/Repairs', '', NULL, NULL),
(100, 21, 'Ship joinery/Repairs', '', NULL, NULL),
(101, 21, 'Store fixture Installation/Repairs', '', NULL, NULL),
(102, 21, 'Trim and finish/Repairs', '', NULL, NULL),
(103, 21, 'Window and door (prefabricated) Installation/Repairs', '', NULL, NULL),
(104, 22, 'Asphalt tile Installation/Repairs', '', NULL, NULL),
(105, 22, 'Carpet laying or removal service/Repairs', '', NULL, NULL),
(106, 22, 'Fireproof flooring construction/Repairs', '', NULL, NULL),
(107, 22, 'Floor laying, scraping, finishing, and refinishing/Repairs', '', NULL, NULL),
(108, 22, 'Flooring, wood/Repairs', '', NULL, NULL),
(109, 22, 'Hardwood flooring/Repairs', '', NULL, NULL),
(110, 22, 'Linoleum Installation/Repairs', '', NULL, NULL),
(111, 22, 'Parquet flooring/Repairs', '', NULL, NULL),
(112, 22, 'Resilient floor laying/Repairs', '', NULL, NULL),
(113, 22, 'Vinyl floor tile and sheet Installation/Repairs', '', NULL, NULL),
(114, 23, 'Architectural sheet metal work/Repairs', '', NULL, NULL),
(115, 23, 'Ceilings, metal: erection and repair/Repairs', '', NULL, NULL),
(116, 23, 'Coppersmithing, in connection with construction work/Repairs', '', NULL, NULL),
(117, 23, 'Downspout Installation, metal/Repairs', '', NULL, NULL),
(118, 23, 'Duct work, sheet metal/Repairs', '', NULL, NULL),
(119, 23, 'Gutter Installation, metal/Repairs', '', NULL, NULL),
(120, 23, 'Roof spraying, painting, or coating/Repairs', '', NULL, NULL),
(121, 23, 'Roofing work, including repairing/Repairs', '', NULL, NULL),
(122, 23, 'Sheet metal work: except plumbing, heating, or Siding/Repairs', '', NULL, NULL),
(123, 23, '`Skylight Installation/Repairs', '', NULL, NULL),
(124, 23, 'Tinsmithing, in connection with construction work/Repairs', '', NULL, NULL),
(125, 24, 'Asphalting of private driveways and private parking areas/Repairs', '', NULL, NULL),
(126, 24, 'Blacktop work: private driveways and private parking', '', NULL, NULL),
(127, 24, 'Concrete finishers/Repairs', '', NULL, NULL),
(128, 24, 'Concrete work: private driveways, sidewalks, and parking areas/Repairs', '', NULL, NULL),
(129, 24, 'Culvert construction/Repairs', '', NULL, NULL),
(130, 24, 'Curb construction/Repairs', '', NULL, NULL),
(131, 24, 'Foundations, building of: poured concrete/Repairs', '', NULL, NULL),
(132, 24, 'Grouting work/Repairs', '', NULL, NULL),
(133, 24, 'Gunite work/Repairs', '', NULL, NULL),
(134, 24, 'Parking lot construction/Repairs', '', NULL, NULL),
(135, 24, 'Patio construction, concrete/Repairs', '', NULL, NULL),
(136, 24, 'Sidewalk construction, except public/Repairs', '', NULL, NULL),
(137, 24, 'Stucco construction/Repairs', '', NULL, NULL),
(138, 25, 'Drilling water wells/Repairs', '', NULL, NULL),
(139, 25, 'Geothermal drilling/Repairs', '', NULL, NULL),
(140, 25, 'Servicing water wells/Repairs', '', NULL, NULL),
(141, 25, 'Well drilling, water/Repairs', '', NULL, NULL),
(142, 26, 'Building front Installation, metal/Repairs', '', NULL, NULL),
(143, 26, 'Concrete products, structural precast or prestressed/Repairs', '', NULL, NULL),
(144, 26, 'Concrete reinforcement, placing of/Repairs', '', NULL, NULL),
(145, 26, 'Curtain wall Installation/Repairs', '', NULL, NULL),
(146, 26, 'Elevator front Installation, metal/Repairs', '', NULL, NULL),
(147, 26, 'Iron work, structural/Repairs', '', NULL, NULL),
(148, 26, 'Metal furring/Repairs', '', NULL, NULL),
(149, 26, 'Steel work, structural/Repairs', '', NULL, NULL),
(150, 26, 'Storage tanks, metal: erection/Repairs', '', NULL, NULL),
(151, 26, 'Store front Installation, metal/Repairs', '', NULL, NULL),
(152, 27, 'Glass Installation, except automotive/Repairs', '', NULL, NULL),
(153, 27, 'Glass work, except automotive/Repairs', '', NULL, NULL),
(154, 27, 'Glazing work/Repairs', '', NULL, NULL),
(155, 28, 'Excavation work/Repairs', '', NULL, NULL),
(156, 28, 'Grave excavation/Repairs', '', NULL, NULL),
(157, 28, 'Foundation digging (excavation)/Repairs', '', NULL, NULL),
(158, 28, 'Grading: except for highways, streets, and airport runways/Repairs', '', NULL, NULL),
(159, 29, 'Concrete breaking for streets and highways/Repairs', '', NULL, NULL),
(160, 29, 'Demolition of buildings or other structures, except marine/Repairs', '', NULL, NULL),
(161, 29, 'Dismantling steel oil tanks, except oil field work/Repairs', '', NULL, NULL),
(162, 29, 'Wrecking of buildings or other structures, except marine/Repairs', '', NULL, NULL),
(163, 29, 'Tree Cutting Services', '', NULL, NULL),
(164, 30, 'Conveyor system Installation/Repairs', '', NULL, NULL),
(165, 30, 'Dismantling of machinery and other industrial equipment/Repairs', '', NULL, NULL),
(166, 30, 'Dumbwaiter Installation/Repairs', '', NULL, NULL),
(167, 30, 'Dust collecting equipment Installation/Repairs', '', NULL, NULL),
(168, 30, 'Elevator Installation, conversions and repair/Repairs', '', NULL, NULL),
(169, 30, 'Incinerator Installation, small/Repairs', '', NULL, NULL),
(170, 30, 'Installation of machinery and other industrial equipment/Repairs', '', NULL, NULL),
(171, 30, 'Machine rigging/Repairs', '', NULL, NULL),
(172, 30, 'Millwrights', '', NULL, NULL),
(173, 30, 'Pneumatic tube system Installation/Repairs', '', NULL, NULL),
(174, 30, 'Power generating equipment Installation/Repairs', '', NULL, NULL),
(175, 30, 'Revolving door Installation/Repairs', '', NULL, NULL),
(176, 30, 'Vacuum cleaning systems, built-in/Repairs', '', NULL, NULL),
(177, 31, 'Antenna Installation, except household type/Repairs', '', NULL, NULL),
(178, 31, 'Artificial turf Installation/Repairs', '', NULL, NULL),
(179, 31, 'Awning Installation/Repairs', '', NULL, NULL),
(180, 31, 'Bath tub refinishing/Repairs', '', NULL, NULL),
(181, 31, 'Boring for building construction/Repairs', '', NULL, NULL),
(182, 31, 'Bowling alley Installation and service/Repairs', '', NULL, NULL),
(183, 31, 'Cable splicing service, nonelectrical/Repairs', '', NULL, NULL),
(184, 31, 'Caulking (construction)/Repairs', '', NULL, NULL),
(185, 31, 'Cleaning building exteriors/Repairs', '', NULL, NULL),
(186, 31, 'Cleaning new buildings after construction/Repairs', '', NULL, NULL),
(187, 31, 'Coating of concrete structures with plastics/Repairs', '', NULL, NULL),
(188, 31, 'Core drilling for building construction/Repairs', '', NULL, NULL),
(189, 31, 'Counter top Installation/Repairs', '', NULL, NULL),
(190, 31, 'Dampproofing buildings/Repairs', '', NULL, NULL),
(191, 31, 'Dewatering/Repairs', '', NULL, NULL),
(192, 31, 'Diamond drilling for building construction/Repairs', '', NULL, NULL),
(193, 31, 'Epoxy application/Repairs', '', NULL, NULL),
(194, 31, 'Erection and dismantling of forms for poured concrete/Repairs', '', NULL, NULL),
(195, 31, 'Fence construction/Repairs', '', NULL, NULL),
(196, 31, 'Fire escape Installation/Repairs', '', NULL, NULL),
(197, 31, 'Fireproofing buildings/Repairs', '', NULL, NULL),
(198, 31, 'Gas leakage detection/Repairs', '', NULL, NULL),
(199, 31, 'Gasoline pump Installation/Repairs', '', NULL, NULL),
(200, 31, 'Glazing of concrete surfaces/Repairs', '', NULL, NULL),
(201, 31, 'House moving/Repairs', '', NULL, NULL),
(202, 31, 'Insulation of pipes and boilers/Repairs', '', NULL, NULL),
(203, 31, 'Lead burning/Repairs', '', NULL, NULL),
(204, 31, 'Lightning conductor erection/Repairs', '', NULL, NULL),
(205, 31, 'Mobile home site setup and tie down/Repairs', '', NULL, NULL),
(206, 31, 'Ornamental metalwork/Repairs', '', NULL, NULL),
(207, 32, 'Armature rewinding/Repairs', '', NULL, NULL),
(208, 32, 'Coil winding service/Repairs', '', NULL, NULL),
(209, 32, 'Electric motor repair/Repairs', '', NULL, NULL),
(210, 32, 'Hermetics repair/Repairs', '', NULL, NULL),
(211, 32, 'Rebuilding motors, other than automotive/Repairs', '', NULL, NULL),
(212, 32, 'Rewinding stators/Repairs', '', NULL, NULL),
(213, 33, 'Motion Picture and Video Tape Production', '', NULL, NULL),
(214, 33, 'Services Allied to Motion Picture Production', '', NULL, NULL),
(215, 33, 'Event Chef/Cook/Food Preparation', '', NULL, NULL),
(216, 33, 'Decorations', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_type` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `fname`, `lname`, `service_type`, `email`, `password`, `gender`, `phone`, `photo`, `user_type`, `status`, `verification_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(60, 'ashok kumar', 'ashok', 'kumar', 1, 'ashok@cwebconsultants.com', '$2y$10$66QSoU0cUSV94UdQXW2Eeu0TGzBFOPjk7.YfwglVmDak0HtM7ag6C', 'male', '9988145213', NULL, 2, 1, NULL, NULL, '2018-09-21 01:30:50', '2018-09-21 01:30:50');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_balance` double(8,2) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_user_id_foreign` (`user_id`);

--
-- Indexes for table `company_services`
--
ALTER TABLE `company_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_services_company_id_foreign` (`company_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_user_id_foreign` (`user_id`);

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invitations_sender_id_foreign` (`sender_id`),
  ADD KEY `invitations_receiver_id_foreign` (`receiver_id`),
  ADD KEY `invitations_proposal_id_foreign` (`proposal_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `proposals`
--
ALTER TABLE `proposals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposals_user_id_foreign` (`user_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_booking_id_foreign` (`booking_id`),
  ADD KEY `ratings_user_id_foreign` (`user_id`),
  ADD KEY `ratings_company_id_foreign` (`company_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraws_company_id_foreign` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `company_services`
--
ALTER TABLE `company_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `proposals`
--
ALTER TABLE `proposals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `company_services`
--
ALTER TABLE `company_services`
  ADD CONSTRAINT `company_services_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invitations`
--
ALTER TABLE `invitations`
  ADD CONSTRAINT `invitations_proposal_id_foreign` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invitations_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invitations_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proposals`
--
ALTER TABLE `proposals`
  ADD CONSTRAINT `proposals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD CONSTRAINT `withdraws_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
