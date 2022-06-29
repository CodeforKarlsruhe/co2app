-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.3.34-MariaDB-0ubuntu0.20.04.1 - Ubuntu 20.04
-- Server Betriebssystem:        debian-linux-gnu
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Exportiere Struktur von Tabelle okl.balance
DROP TABLE IF EXISTS `balance`;
CREATE TABLE IF NOT EXISTS `balance` (
  `sector1` decimal(20,6) NOT NULL DEFAULT 2.835000,
  `sector2` decimal(20,6) NOT NULL DEFAULT 2.160000,
  `sector3` decimal(20,6) NOT NULL DEFAULT 1.690000,
  `sector4` decimal(20,6) NOT NULL DEFAULT 3.450000,
  `sector5` decimal(20,6) NOT NULL DEFAULT 0.840000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle okl.balance: ~1 rows (ungefähr)
DELETE FROM `balance`;
/*!40000 ALTER TABLE `balance` DISABLE KEYS */;
INSERT INTO `balance` (`sector1`, `sector2`, `sector3`, `sector4`, `sector5`) VALUES
	(2.835000, 2.160000, 1.690000, 3.450000, 0.840000);
/*!40000 ALTER TABLE `balance` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle okl.defaults
DROP TABLE IF EXISTS `defaults`;
CREATE TABLE IF NOT EXISTS `defaults` (
  `size` int(11) NOT NULL,
  `co2total` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `sector1` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `sector2` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `sector3` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `sector4` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `sector5` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `code1` tinytext NOT NULL,
  `code2` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle okl.defaults: ~0 rows (ungefähr)
DELETE FROM `defaults`;
/*!40000 ALTER TABLE `defaults` DISABLE KEYS */;
INSERT INTO `defaults` (`size`, `co2total`, `sector1`, `sector2`, `sector3`, `sector4`, `sector5`, `code1`, `code2`) VALUES
	(301749, 10.980000, 2.835000, 2.160000, 1.690000, 3.450000, 0.840000, 'oklbn2262bb1fbb69363', 'oklbn2262bb1ee1e0657');
/*!40000 ALTER TABLE `defaults` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle okl.districts
DROP TABLE IF EXISTS `districts`;
CREATE TABLE IF NOT EXISTS `districts` (
  `name` tinytext NOT NULL,
  `size` int(11) NOT NULL DEFAULT 0,
  `users` int(11) NOT NULL DEFAULT 0,
  `mults` int(11) NOT NULL DEFAULT 0,
  `co2total` decimal(20,6) NOT NULL DEFAULT 10.980000,
  `savingTotal` decimal(20,6) NOT NULL DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle okl.districts: ~27 rows (ungefähr)
DELETE FROM `districts`;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` (`name`, `size`, `users`, `mults`, `co2total`, `savingTotal`) VALUES
	('Innenstadt-Ost', 6450, 0, 0, 10.980000, 0.000000),
	('Innenstadt-West', 9884, 0, 0, 10.980000, 0.000000),
	('Südstadt', 20040, 0, 0, 10.980000, 0.000000),
	('Südweststadt', 20840, 0, 0, 10.980000, 0.000000),
	('Weststadt', 19966, 0, 0, 10.980000, 0.000000),
	('Nordweststadt', 11601, 0, 0, 10.980000, 0.000000),
	('Oststadt', 19536, 0, 0, 10.980000, 0.000000),
	('Mühlburg', 16499, 0, 0, 10.980000, 0.000000),
	('Daxlanden', 11356, 0, 0, 10.980000, 0.000000),
	('Knielingen', 11310, 0, 0, 10.980000, 0.000000),
	('Grünwinkel', 10945, 0, 0, 10.980000, 0.000000),
	('Oberreut', 9865, 0, 0, 10.980000, 0.000000),
	('Beiertheim-Bulach', 6987, 0, 0, 10.980000, 0.000000),
	('Weiherfeld-Dammerstock', 5923, 0, 0, 10.980000, 0.000000),
	('Rüppurr', 10945, 0, 0, 10.980000, 0.000000),
	('Waldstadt', 12249, 0, 0, 10.980000, 0.000000),
	('Rintheim', 6285, 0, 0, 10.980000, 0.000000),
	('Hagsfeld', 7146, 0, 0, 10.980000, 0.000000),
	('Durlach', 30959, 0, 0, 10.980000, 0.000000),
	('Grötzingen', 9233, 0, 0, 10.980000, 0.000000),
	('Stupferich', 2959, 0, 0, 10.980000, 0.000000),
	('Hohenwettersbach', 3042, 0, 0, 10.980000, 0.000000),
	('Wolfartsweier', 3145, 0, 0, 10.980000, 0.000000),
	('Grünwettersbach', 4117, 0, 0, 10.980000, 0.000000),
	('Palmbach', 1997, 0, 0, 10.980000, 0.000000),
	('Neureut', 19105, 0, 0, 10.980000, 0.000000),
	('Nordstadt', 9365, 0, 0, 10.980000, 0.000000);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle okl.submissions
DROP TABLE IF EXISTS `submissions`;
CREATE TABLE IF NOT EXISTS `submissions` (
  `user` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `co2total` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `savingsTotal` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `sector1` decimal(20,6) NOT NULL,
  `sector2` decimal(20,6) NOT NULL,
  `sector3` decimal(20,6) NOT NULL,
  `sector4` decimal(20,6) NOT NULL,
  `sector5` decimal(20,6) NOT NULL,
  `location` tinytext NOT NULL,
  `mult` tinyint(4) NOT NULL DEFAULT 0,
  `json` text DEFAULT NULL,
  `code` tinytext DEFAULT NULL,
  `remote` text DEFAULT NULL,
  KEY `FK__users` (`user`),
  CONSTRAINT `FK__users` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='savings,sector1-5 : computed values for (1 + mult)';

-- Exportiere Daten aus Tabelle okl.submissions: ~43 rows (ungefähr)
DELETE FROM `submissions`;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` (`user`, `timestamp`, `co2total`, `savingsTotal`, `sector1`, `sector2`, `sector3`, `sector4`, `sector5`, `location`, `mult`, `json`, `code`, `remote`) VALUES
	(14, '2022-06-29 00:16:41', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, 'parmsString', '', NULL),
	(15, '2022-06-29 00:16:46', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, 'parmsString', '', NULL),
	(16, '2022-06-29 00:17:04', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, 'parmsString', '', NULL),
	(17, '2022-06-29 00:21:22', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, 'parmsString', '', NULL),
	(18, '2022-06-29 00:21:26', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, 'parmsString', '', NULL),
	(19, '2022-06-29 00:21:40', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, 'parmsString', '', NULL),
	(20, '2022-06-29 00:21:45', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, 'parmsString', '', NULL),
	(21, '2022-06-29 00:22:54', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', NULL),
	(22, '2022-06-29 00:31:39', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(23, '2022-06-29 00:31:43', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(24, '2022-06-29 09:38:16', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(25, '2022-06-29 09:38:18', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(26, '2022-06-29 09:38:20', 15.000000, -4.020000, 1.835000, 0.160000, -1.310000, -0.550000, -4.160000, 'Innenstadt-Ost', 0, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(27, '2022-06-29 09:39:54', 60.000000, -16.080000, 7.340000, 0.640000, -5.240000, -2.200000, -16.640000, 'Innenstadt-Ost', 3, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(28, '2022-06-29 09:40:02', 45.000000, -12.060000, 5.505000, 0.480000, -3.930000, -1.650000, -12.480000, 'Innenstadt-Ost', 2, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(29, '2022-06-29 09:44:06', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(30, '2022-06-29 12:09:34', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(31, '2022-06-29 12:10:03', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(32, '2022-06-29 12:10:15', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(33, '2022-06-29 12:11:12', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-Westi', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(34, '2022-06-29 12:13:22', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(35, '2022-06-29 12:23:02', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(37, '2022-06-29 12:27:57', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(38, '2022-06-29 12:28:01', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(39, '2022-06-29 12:30:16', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(40, '2022-06-29 12:30:18', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(41, '2022-06-29 12:33:26', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(42, '2022-06-29 12:33:42', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(43, '2022-06-29 12:33:45', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(44, '2022-06-29 12:36:44', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(45, '2022-06-29 12:36:53', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(46, '2022-06-29 12:36:55', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(50, '2022-06-29 12:44:18', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(51, '2022-06-29 12:44:20', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(52, '2022-06-29 12:44:22', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(36, '2022-06-29 13:53:24', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(53, '2022-06-29 13:53:36', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(54, '2022-06-29 13:53:44', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(56, '2022-06-29 13:54:21', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(1, '2022-06-29 13:54:52', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(55, '2022-06-29 13:58:05', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(58, '2022-06-29 14:15:05', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1'),
	(57, '2022-06-29 16:50:50', 120.000000, -32.160000, 14.680000, 1.280000, -10.480000, -4.400000, -33.280000, 'Innenstadt-West', 7, '{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}', '', '127.0.0.1');
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle okl.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `hash` tinytext NOT NULL,
  UNIQUE KEY `hash` (`hash`(250)) USING BTREE,
  KEY `Schlüssel 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle okl.users: ~53 rows (ungefähr)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `date`, `hash`) VALUES
	(1, '2022-06-27 15:50:01', '123'),
	(2, '2022-06-28 23:28:26', '62bb727ae342c'),
	(3, '2022-06-28 23:28:45', '62bb728d7f426'),
	(4, '2022-06-28 23:28:54', '62bb7296537bf'),
	(5, '2022-06-28 23:28:57', '62bb7299f2d71'),
	(6, '2022-06-28 23:29:26', '62bb72b63524b'),
	(7, '2022-06-28 23:44:02', '62bb76222b449'),
	(8, '2022-06-28 23:54:38', '62bb789e06932'),
	(9, '2022-06-28 23:55:06', '62bb78ba11f1c'),
	(10, '2022-06-29 00:00:10', '62bb79ea2364e'),
	(11, '2022-06-29 00:01:33', '62bb7a3d0d2eb'),
	(14, '2022-06-29 00:16:41', '62bb7dc9de5bc'),
	(15, '2022-06-29 00:16:46', '62bb7dce5f421'),
	(16, '2022-06-29 00:17:04', '62bb7de06dfc4'),
	(17, '2022-06-29 00:21:22', '62bb7ee20eb88'),
	(18, '2022-06-29 00:21:26', '62bb7ee65ca4a'),
	(19, '2022-06-29 00:21:40', '62bb7ef4b56de'),
	(20, '2022-06-29 00:21:45', '62bb7ef99b33c'),
	(21, '2022-06-29 00:22:54', '62bb7f3e374f1'),
	(22, '2022-06-29 00:31:39', '62bb814bdc3f6'),
	(23, '2022-06-29 00:31:43', '62bb814f6b276'),
	(24, '2022-06-29 09:38:16', '62bc016834117'),
	(25, '2022-06-29 09:38:18', '62bc016adb62b'),
	(26, '2022-06-29 09:38:20', '62bc016c7d152'),
	(27, '2022-06-29 09:39:54', '62bc01ca78ac9'),
	(28, '2022-06-29 09:40:02', '62bc01d29350f'),
	(29, '2022-06-29 09:44:06', '62bc02c690010'),
	(30, '2022-06-29 12:09:34', '62bc24de385c3'),
	(31, '2022-06-29 12:10:03', '62bc24fb9de8c'),
	(32, '2022-06-29 12:10:15', '62bc250720e4b'),
	(33, '2022-06-29 12:11:12', '62bc2540d0793'),
	(34, '2022-06-29 12:13:22', '62bc25c2ce2b3'),
	(35, '2022-06-29 12:23:02', '62bc28063e2c1'),
	(36, '2022-06-29 12:23:05', '62bc280964b46'),
	(37, '2022-06-29 12:27:57', '62bc292d6a478'),
	(38, '2022-06-29 12:28:01', '62bc2931f37b6'),
	(39, '2022-06-29 12:30:16', '62bc29b85215f'),
	(40, '2022-06-29 12:30:18', '62bc29baeb04c'),
	(41, '2022-06-29 12:33:26', '62bc2a76d178f'),
	(42, '2022-06-29 12:33:42', '62bc2a86840b0'),
	(43, '2022-06-29 12:33:45', '62bc2a89ec874'),
	(44, '2022-06-29 12:36:44', '3bd7!62bc2b3c1a8a8'),
	(45, '2022-06-29 12:36:53', '3bd7!62bc2b457be09'),
	(46, '2022-06-29 12:36:55', '3bd7!62bc2b47c63d1'),
	(50, '2022-06-29 12:44:18', '3bd7!62bc2d0290b98'),
	(51, '2022-06-29 12:44:20', '3bd7!62bc2d04b684a'),
	(52, '2022-06-29 12:44:22', '3bd7!62bc2d065b954'),
	(53, '2022-06-29 13:53:36', '3bd7!62bc3d40150f1'),
	(54, '2022-06-29 13:53:44', '3bd7!62bc3d4896d97'),
	(55, '2022-06-29 13:53:49', '3bd7!62bc3d4d1b1d8'),
	(56, '2022-06-29 13:54:21', '3bd7!62bc3d6dd2ebb'),
	(57, '2022-06-29 14:14:55', '3bd7!62bc423f66b54'),
	(58, '2022-06-29 14:15:05', '3bd7!62bc424968942');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
