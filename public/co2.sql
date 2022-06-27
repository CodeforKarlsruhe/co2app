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

-- Exportiere Struktur von Tabelle okl.defaults
CREATE TABLE IF NOT EXISTS `defaults` (
  `size` int(11) NOT NULL,
  `co2total` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `sector1` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `sector2` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `sector3` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `sector4` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `sector5` decimal(20,6) NOT NULL DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle okl.defaults: ~0 rows (ungefähr)
DELETE FROM `defaults`;
/*!40000 ALTER TABLE `defaults` DISABLE KEYS */;
INSERT INTO `defaults` (`size`, `co2total`, `sector1`, `sector2`, `sector3`, `sector4`, `sector5`) VALUES
	(301749, 11.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000);
/*!40000 ALTER TABLE `defaults` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle okl.districts
CREATE TABLE IF NOT EXISTS `districts` (
  `name` tinytext NOT NULL,
  `size` int(11) NOT NULL DEFAULT 0,
  `users` int(11) NOT NULL DEFAULT 0,
  `mults` int(11) NOT NULL DEFAULT 0,
  `co2total` decimal(20,6) NOT NULL DEFAULT 11.000000,
  `savingTotal` decimal(20,6) NOT NULL DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle okl.districts: ~27 rows (ungefähr)
DELETE FROM `districts`;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` (`name`, `size`, `users`, `mults`, `co2total`, `savingTotal`) VALUES
	('Innenstadt-Ost', 6450, 0, 0, 11.000000, 0.000000),
	('Innenstadt-West', 9884, 0, 0, 11.000000, 0.000000),
	('Südstadt', 20040, 0, 0, 11.000000, 0.000000),
	('Südweststadt', 20840, 0, 0, 11.000000, 0.000000),
	('Weststadt', 19966, 0, 0, 11.000000, 0.000000),
	('Nordweststadt', 11601, 0, 0, 11.000000, 0.000000),
	('Oststadt', 19536, 0, 0, 11.000000, 0.000000),
	('Mühlburg', 16499, 0, 0, 11.000000, 0.000000),
	('Daxlanden', 11356, 0, 0, 11.000000, 0.000000),
	('Knielingen', 11310, 0, 0, 11.000000, 0.000000),
	('Grünwinkel', 10945, 0, 0, 11.000000, 0.000000),
	('Oberreut', 9865, 0, 0, 11.000000, 0.000000),
	('Beiertheim-Bulach', 6987, 0, 0, 11.000000, 0.000000),
	('Weiherfeld-Dammerstock', 5923, 0, 0, 11.000000, 0.000000),
	('Rüppurr', 10945, 0, 0, 11.000000, 0.000000),
	('Waldstadt', 12249, 0, 0, 11.000000, 0.000000),
	('Rintheim', 6285, 0, 0, 11.000000, 0.000000),
	('Hagsfeld', 7146, 0, 0, 11.000000, 0.000000),
	('Durlach', 30959, 0, 0, 11.000000, 0.000000),
	('Grötzingen', 9233, 0, 0, 11.000000, 0.000000),
	('Stupferich', 2959, 0, 0, 11.000000, 0.000000),
	('Hohenwettersbach', 3042, 0, 0, 11.000000, 0.000000),
	('Wolfartsweier', 3145, 0, 0, 11.000000, 0.000000),
	('Grünwettersbach', 4117, 0, 0, 11.000000, 0.000000),
	('Palmbach', 1997, 0, 0, 11.000000, 0.000000),
	('Neureut', 19105, 0, 0, 11.000000, 0.000000),
	('Nordstadt', 9365, 0, 0, 11.000000, 0.000000);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle okl.submissions
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
  KEY `FK__users` (`user`),
  CONSTRAINT `FK__users` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle okl.submissions: ~1 rows (ungefähr)
DELETE FROM `submissions`;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` (`user`, `timestamp`, `co2total`, `savingsTotal`, `sector1`, `sector2`, `sector3`, `sector4`, `sector5`, `location`, `mult`, `json`, `code`) VALUES
	(1, '2022-06-27 15:51:36', 0.000000, 0.000000, 1.000000, 2.000000, 3.000000, 4.000000, 5.000000, 'a', 0, NULL, NULL);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle okl.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `hash` tinytext NOT NULL,
  KEY `Schlüssel 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle okl.users: ~1 rows (ungefähr)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `date`, `hash`) VALUES
	(1, '2022-06-27 15:50:01', '123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
