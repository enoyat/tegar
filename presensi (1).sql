-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2024 at 04:40 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

DROP TABLE IF EXISTS `lokasi`;
CREATE TABLE IF NOT EXISTS `lokasi` (
  `idlokasi` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `lat1` double DEFAULT NULL,
  `lat2` double DEFAULT NULL,
  `long1` double DEFAULT NULL,
  `long2` double NOT NULL,
  PRIMARY KEY (`idlokasi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`idlokasi`, `latitude`, `longitude`, `radius`, `lat1`, `lat2`, `long1`, `long2`) VALUES
(1, -7.816658980166, 110.38177950962, 1000, -7.8166679633188, -7.8166499970132, 110.38177044222, 110.38178857702);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE IF NOT EXISTS `pegawai` (
  `idpegawai` int(11) NOT NULL AUTO_INCREMENT,
  `namapegawai` varchar(200) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `email` text NOT NULL,
  `pwd` text DEFAULT NULL,
  `alamat` text NOT NULL,
  `nohp` varchar(100) DEFAULT NULL,
  `idlokasi` int(11) DEFAULT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`idpegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`idpegawai`, `namapegawai`, `nik`, `email`, `pwd`, `alamat`, `nohp`, `idlokasi`, `iduser`) VALUES
(1, 'MIKO ARDANA', 'nik00121x', 'miko@gmail.com', 'ok', 'alamat', '08989', NULL, 458),
(2, 'xx', 'nik00121x', '12345@gmail.com', 'ok', 'ok', 'ok', NULL, 459);

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

DROP TABLE IF EXISTS `presensi`;
CREATE TABLE IF NOT EXISTS `presensi` (
  `idpresensi` int(11) NOT NULL AUTO_INCREMENT,
  `idpegawai` int(11) NOT NULL,
  `statuspresensi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `jamdatang` varchar(5) DEFAULT NULL,
  `jampulang` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idpresensi`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`idpresensi`, `idpegawai`, `statuspresensi`, `tanggal`, `jamdatang`, `jampulang`) VALUES
(1, 1, 'Hadir', '2024-03-18', '11:37', '11:55'),
(2, 2, 'Hadir', '2024-03-18', '12:03', '-'),
(7, 1, 'Hadir', '2024-03-31', '07:23', '-');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', '2020-12-22 02:12:09', '2020-12-22 02:12:09'),
(2, 'pegawai', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `roles_id` int(2) NOT NULL,
  `access_token` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `email_verified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `profile`, `roles_id`, `access_token`, `created_at`, `updated_at`, `email_verified_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$ocRCWT1BBpSh5Kb0VG3/Du5Ipcrcy1icZx6bqv5ZO6nzW8kq7roYq', '', 1, NULL, '2023-04-18 05:42:36', '2023-04-18 05:42:36', NULL),
(458, 'MIKO ARDANA', 'miko@gmail.com', '$2y$10$Q4a78AGC1V7vNlKuYWxVDOL8QXe/GuoHCRVkrBjCIGX9ddOym575K', NULL, 2, NULL, '2024-02-18 11:37:24', '2024-02-18 11:37:24', NULL),
(459, 'xx', '12345@gmail.com', '$2y$10$f6ksFAtCsmgIESBgY8.PeOa8ldktLFKxBGbgHk8KWN3mucP6kcSOi', NULL, 2, NULL, '2024-02-18 12:03:31', '2024-02-18 12:03:31', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
