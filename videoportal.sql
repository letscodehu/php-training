-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Hoszt: 127.0.0.1:6603
-- Létrehozás ideje: 2017. Ápr 19. 05:12
-- Szerver verzió: 5.5.53
-- PHP verzió: 5.6.29-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Adatbázis: `videoportal`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`) VALUES
(1, 'Java', 'java', ''),
(2, 'C#', 'csharp', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories_series`
--

CREATE TABLE IF NOT EXISTS `categories_series` (
  `categoryId` int(10) unsigned NOT NULL,
  `seriesId` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 2),
(6, '2017_01_29_135214_create_transactions_table', 2),
(7, '2017_01_29_135228_create_subscriptions_table', 2),
(8, '2017_01_29_175316_create_videos_table', 2),
(9, '2017_01_29_175321_create_series_table', 2),
(10, '2017_01_29_175335_create_categories_table', 2),
(11, '2017_01_29_175342_create_categories_series_table', 2),
(12, '2017_01_29_175402_create_watched_table', 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ADMIN');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `series`
--

CREATE TABLE IF NOT EXISTS `series` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `difficulty` smallint(6) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `free` tinyint(1) NOT NULL,
  `finished` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `series`
--

INSERT INTO `series` (`id`, `title`, `created_at`, `updated_at`, `published`, `description`, `thumbnail`, `difficulty`, `slug`, `free`, `finished`) VALUES
(7, 'This site can''t be reached', NULL, NULL, 0, '<p>Ilyen st&ouml;pli fejjel lehet nem is kellene &ouml;sszebutoroznom.</p>', 'http://cdn.localhost.hu/series/twitter-fail.jpg', 0, 'this-site-can-t-be-reached', 1, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `subscriptions`
--

CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` int(11) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT NULL,
  `transaction_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `start_date`, `end_date`, `transaction_id`, `user_id`) VALUES
(1, '2017-03-01 21:00:53', '2017-03-06 23:00:00', 1, 2),
(3, '2017-03-04 00:12:49', '2017-04-03 23:12:49', NULL, 2),
(4, '2017-03-04 00:16:38', '2017-04-03 23:16:38', NULL, 2),
(5, '2017-03-04 00:35:43', '2017-04-03 23:35:43', NULL, 2),
(6, '2017-03-04 00:40:37', '2017-04-03 23:40:37', NULL, 2),
(18, '2017-03-04 00:44:05', '2017-04-03 23:44:05', NULL, 2),
(19, '2017-03-04 00:49:25', '2017-06-03 23:49:25', NULL, 2),
(20, '2017-03-04 00:52:33', '2018-03-04 00:52:33', 20, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `paypal_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint(20) unsigned NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `transactions`
--

INSERT INTO `transactions` (`paypal_id`, `id`, `status`, `item_name`, `currency_code`, `amount`, `user_id`, `created_at`, `updated_at`) VALUES
('43545535345', 1, 'COMPLETED', '1 hónapos előfizetés', 'HUF', '1500.0', 1, '2017-02-06 23:00:00', NULL),
('435455345345', 3, 'COMPLETED', '1 hónapos előfizetés', 'HUF', '1500.0', 1, '2017-02-06 23:00:00', NULL),
('435455353454', 4, 'COMPLETED', '1 hónapos előfizetés', 'HUF', '1500.0', 1, '2017-02-06 23:00:00', NULL),
('4354553453454', 5, 'COMPLETED', '1 hónapos előfizetés', 'HUF', '1500.0', 1, '2017-02-06 23:00:00', NULL),
('435452535345', 6, 'COMPLETED', '1 hónapos előfizetés', 'HUF', '1500.0', 1, '2017-02-06 23:00:00', NULL),
('4354255345345', 7, 'COMPLETED', '1 hónapos előfizetés', 'HUF', '1500.0', 1, '2017-02-06 23:00:00', NULL),
('4325455353454', 8, 'COMPLETED', '1 hónapos előfizetés', 'HUF', '1500.0', 1, '2017-02-06 23:00:00', NULL),
('43545523453454', 9, 'COMPLETED', '1 hónapos előfizetés', 'HUF', '1500.0', 1, '2017-02-06 23:00:00', NULL),
('0MC68456NM343031R', 10, 'COMPLETED', NULL, 'HUF', '4000', 2, NULL, NULL),
('9R358520VL472454V', 12, 'COMPLETED', NULL, 'HUF', '4000', 2, NULL, NULL),
('6G5084416D026911B', 14, 'COMPLETED', NULL, 'HUF', '4000', 2, NULL, NULL),
('61826681FS1424917', 16, 'COMPLETED', NULL, 'HUF', '4000', 2, NULL, NULL),
('8K238759UL8234203', 17, 'COMPLETED', NULL, 'HUF', '4000', 2, NULL, NULL),
('0NA87127P3571654S', 18, 'COMPLETED', NULL, 'HUF', '4000', 2, NULL, NULL),
('5DH53448T6020884G', 19, 'COMPLETED', NULL, 'HUF', '4000', 2, NULL, NULL),
('73S81219V4089600H', 20, 'COMPLETED', NULL, 'HUF', '4000', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Papp Krisztián', 'tacsiazuma@gmail.com', '$2a$04$Lgo7CF5jZJZPe5dJs33bwOdtbp86E73DuUXlPzfbquQSIz7w51OiS', NULL, NULL, NULL),
(2, 'taxiazuma', 'fejlesztes@letscode.hu', '$2a$10$FdokaBwCJJHeRuV0njdpt.Widzy.dLVdFqvIB0rTzQ1h.6.nmwLae', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(10) unsigned NOT NULL,
  `vimeo_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `length` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `series_id` int(11) NOT NULL,
  `free` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `videos`
--

INSERT INTO `videos` (`id`, `vimeo_id`, `slug`, `title`, `published`, `description`, `thumbnail`, `length`, `created_at`, `updated_at`, `series_id`, `free`, `ordering`) VALUES
(2, '202096541', 'sweet-jesus', 'Sweet Jesus', 1, '<p style="text-align: center;">Now that there is the Tec-9, a crappy spray gun from<strong> South Miami</strong>. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they''re actually proud of that shit. </p>', 'http://i.vimeocdn.com/video/616041096_640.jpg', 245, NULL, NULL, 7, 0, 2),
(3, '202096541', '42342342342', '42342342342', 1, 'Azt hittem, hogy bebaszok, de mégsem', 'http://i.vimeocdn.com/video/616041096_640.jpg', 245, NULL, NULL, 7, 1, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `watched`
--

CREATE TABLE IF NOT EXISTS `watched` (
  `user_id` int(10) unsigned NOT NULL,
  `video_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories_series`
--
ALTER TABLE `categories_series`
 ADD KEY `categories_series_categoryid_foreign` (`categoryId`), ADD KEY `categories_series_seriesid_foreign` (`seriesId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
 ADD KEY `password_resets_email_index` (`email`(191)), ADD KEY `password_resets_token_index` (`token`(191));

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
 ADD PRIMARY KEY (`id`), ADD KEY `subscriptions_transactionid_foreign` (`transaction_id`), ADD KEY `subscriptions_userid_foreign` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `transactions_paypalid_unique` (`paypal_id`), ADD KEY `transactions_userid_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
