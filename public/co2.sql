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


-- Exportiere Datenbank Struktur für okl
DROP DATABASE IF EXISTS `okl`;
CREATE DATABASE IF NOT EXISTS `okl` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `okl`;

-- Exportiere Struktur von Tabelle okl.balance
DROP TABLE IF EXISTS `balance`;
CREATE TABLE IF NOT EXISTS `balance` (
  `sector1` decimal(20,6) NOT NULL DEFAULT 2.835000,
  `sector2` decimal(20,6) NOT NULL DEFAULT 2.160000,
  `sector3` decimal(20,6) NOT NULL DEFAULT 1.690000,
  `sector4` decimal(20,6) NOT NULL DEFAULT 3.450000,
  `sector5` decimal(20,6) NOT NULL DEFAULT 0.840000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle okl.balance: ~0 rows (ungefähr)
DELETE FROM `balance`;
/*!40000 ALTER TABLE `balance` DISABLE KEYS */;
INSERT INTO `balance` (`sector1`, `sector2`, `sector3`, `sector4`, `sector5`) VALUES
	(2.831813, 2.159722, 1.692275, 3.450955, 0.847224);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle okl.districts: ~27 rows (ungefähr)
DELETE FROM `districts`;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` (`name`, `size`, `users`, `mults`, `co2total`, `savingTotal`) VALUES
	('Innenstadt-Ost', 6450, 15, 5, 10.980000, -0.012465),
	('Innenstadt-West', 9884, 62, 434, 10.980000, -0.201732),
	('Südstadt', 20040, 0, 0, 10.980000, 0.000000),
	('Südweststadt', 20840, 0, 0, 10.980000, 0.000000),
	('Weststadt', 19966, 0, 0, 10.980000, 0.000000),
	('Nordweststadt', 11601, 0, 0, 10.980000, 0.000000),
	('Oststadt', 19536, 0, 0, 10.980000, 0.000000),
	('Mühlburg', 16499, 0, 0, 10.980000, 0.000000),
	('Daxlanden', 11356, 2, 0, 10.980000, 0.000001),
	('Knielingen', 11310, 0, 0, 10.980000, 0.000000),
	('Grünwinkel', 10945, 0, 0, 10.980000, 0.000000),
	('Oberreut', 9865, 0, 0, 10.980000, 0.000000),
	('Beiertheim-Bulach', 6987, 2, 0, 10.980000, 0.000001),
	('Weiherfeld-Dammerstock', 5923, 0, 0, 10.980000, 0.000000),
	('Rüppurr', 10945, 0, 0, 10.980000, 0.000000),
	('Waldstadt', 12249, 0, 0, 10.980000, 0.000000),
	('Rintheim', 6285, 0, 0, 10.980000, 0.000000),
	('Hagsfeld', 7146, 0, 0, 10.980000, 0.000000),
	('Durlach', 30959, 1, 0, 10.980000, 0.000000),
	('Grötzingen', 9233, 1, 0, 10.980000, 0.000001),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='savings,sector1-5 : computed values for (1 + mult)';

-- Exportiere Daten aus Tabelle okl.submissions: ~0 rows (ungefähr)
DELETE FROM `submissions`;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle okl.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `hash` tinytext NOT NULL,
  UNIQUE KEY `hash` (`hash`(150)) USING BTREE,
  KEY `Schlüssel 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle okl.users: ~0 rows (ungefähr)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `date`, `hash`) VALUES
	(1, '2022-06-27 15:50:01', '123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
