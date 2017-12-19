-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2017 at 08:05 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toolsforever`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `Productcode` varchar(5) NOT NULL,
  `Product` varchar(255) NOT NULL,
  `Type` varchar(25) NOT NULL,
  `Fabriekscode` varchar(5) NOT NULL,
  `Inkoopprijs` decimal(10,2) NOT NULL,
  `Verkoopprijs` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id`, `Productcode`, `Product`, `Type`, `Fabriekscode`, `Inkoopprijs`, `Verkoopprijs`) VALUES
(1, 'WX382', 'Accuboorhamer', 'WX 382', 'worx', '69.00', '111.00'),
(2, 'KA280', '4-in- 1 schuurmachine', 'KA 280 K', 'bed', '55.00', '67.00'),
(3, 'BTMS2', 'Verstekzaag', 'BT-MS 2112', 'einh', '49.00', '67.00');

-- --------------------------------------------------------

--
-- Table structure for table `fabriek`
--

CREATE TABLE `fabriek` (
  `Fabriekscode` varchar(5) NOT NULL,
  `Fabrieksnaam` varchar(20) NOT NULL,
  `Telefoon` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fabriek`
--

INSERT INTO `fabriek` (`Fabriekscode`, `Fabrieksnaam`, `Telefoon`) VALUES
('bed', 'Black &amp; Dekker', '(010) 986 53 21'),
('bosch', 'Bosch', '(010) 674 51 25'),
('einh', 'Einhell', '(036) 548 73 29'),
('karch', 'Kärchen', '(0320) 55 66 44'),
('sency', 'Sencys', '(036) 443 32 26'),
('worx', 'Worx', '(020) 123 45 67');

-- --------------------------------------------------------

--
-- Table structure for table `locatie`
--

CREATE TABLE `locatie` (
  `id` int(11) NOT NULL,
  `Locatiecode` varchar(5) NOT NULL,
  `Locatie` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locatie`
--

INSERT INTO `locatie` (`id`, `Locatiecode`, `Locatie`) VALUES
(1, 'Rtd', 'Rotterdam'),
(2, 'Alm', 'Almere'),
(3, 'Ein', 'Eindhoven'),
(4, 'Dhg', 'Den Haag'),
(5, 'Ams', 'Amsterdam'),
(6, 'NWL', 'nieuw lekkerland'),
(9, 'Alex', 'Alexander');

-- --------------------------------------------------------

--
-- Table structure for table `medewerker`
--

CREATE TABLE `medewerker` (
  `Medewerkersid` int(11) NOT NULL,
  `Medewerkerscode` varchar(20) NOT NULL,
  `Voorletters` varchar(15) NOT NULL,
  `Voorvoegsel` varchar(25) NOT NULL,
  `Achternaam` varchar(25) NOT NULL,
  `Gebruikersnaam` varchar(25) NOT NULL,
  `Wachtwoord` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medewerker`
--

INSERT INTO `medewerker` (`Medewerkersid`, `Medewerkerscode`, `Voorletters`, `Voorvoegsel`, `Achternaam`, `Gebruikersnaam`, `Wachtwoord`) VALUES
(0, 'halvt', 'T.', '', 'Halvers', 'Halverst', '@ewq%6');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `medewerkercode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `voorletters` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `voorvoegel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `achternaam` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gebruikersnaam` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `medewerkercode`, `voorletters`, `voorvoegel`, `achternaam`, `gebruikersnaam`, `email`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rodien', 'rodi15', 'R.E', '', 'Blinde', 'Rodien', 'rodien@rodien.nl', 'admin', '$2y$10$NHNeX.CRB05EG8d8kVZKfOB4pbkDc9G7.QFmyA8FX/O9QetE7XXju', 'TsMeAoafoCErNmcnCblmn1dhaSZx01w2DrfMHW4AIMrHQWhBwuf2czBL58JP', '2017-11-23 00:14:17', '2017-12-18 11:50:50'),
(2, 'Lapsen', 'Lapsen10', 'L.A', '', 'Appaiya', 'Lapsen', 'lapsen@lapsen.nl', 'medewerker', '$2y$10$Qt24URchxCn7qzt5Te.IHOYM3FTex5rIcTzNPosP9RIfAU7MTQuum', 'zkKaL1QDx8uUhTwKo4fX2EF65MWqjRbF529i0CPdw2ap9jDw4lNT6gYvucqT', '2017-11-23 02:25:12', '2017-12-03 00:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `voorraad`
--

CREATE TABLE `voorraad` (
  `id` int(11) NOT NULL,
  `Locatiecode` varchar(5) NOT NULL,
  `Productcode` varchar(5) NOT NULL,
  `Aantal` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voorraad`
--

INSERT INTO `voorraad` (`id`, `Locatiecode`, `Productcode`, `Aantal`) VALUES
(1, 'Rtd', 'KA280', 26),
(2, 'Rtd', 'BTMS2', 3),
(3, 'Ein', 'PCL20', 11),
(4, 'Ein', 'PSR14', 12),
(5, 'Alm', 'WX382', 11),
(6, 'Alm', 'PSR14', 10),
(7, 'Dhg', 'BTMS2', 12),
(9, 'Dhg', 'KA280', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fabriek`
--
ALTER TABLE `fabriek`
  ADD PRIMARY KEY (`Fabriekscode`);

--
-- Indexes for table `locatie`
--
ALTER TABLE `locatie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medewerker`
--
ALTER TABLE `medewerker`
  ADD PRIMARY KEY (`Medewerkersid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `voorraad`
--
ALTER TABLE `voorraad`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `locatie`
--
ALTER TABLE `locatie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `voorraad`
--
ALTER TABLE `voorraad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
