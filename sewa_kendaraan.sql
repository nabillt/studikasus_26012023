-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2023 at 03:25 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sewa_kendaraan`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_admin`
--

CREATE TABLE `data_admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `status_admin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_admin`
--

INSERT INTO `data_admin` (`id_admin`, `nama_admin`, `status_admin`) VALUES
(1, 'janes', 'hidup'),
(2, 'el', 'libur');

-- --------------------------------------------------------

--
-- Table structure for table `data_kendaraan`
--

CREATE TABLE `data_kendaraan` (
  `id_kendaraan` int(11) NOT NULL,
  `nopol` varchar(100) NOT NULL,
  `warna` varchar(100) NOT NULL,
  `kondisi_kendaraan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_penyewa`
--

CREATE TABLE `data_penyewa` (
  `id_penyewa` int(11) NOT NULL,
  `nama_penyewa` varchar(100) NOT NULL,
  `alamat_penyewa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_penyewaan_motor`
--

CREATE TABLE `detail_penyewaan_motor` (
  `id_penyewaan` int(11) NOT NULL,
  `id_kendaraan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `penyewaan_motor`
--

CREATE TABLE `penyewaan_motor` (
  `id_penyewaan` int(11) NOT NULL,
  `waktu` datetime NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_penyewa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_admin`
--
ALTER TABLE `data_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `data_kendaraan`
--
ALTER TABLE `data_kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`);

--
-- Indexes for table `data_penyewa`
--
ALTER TABLE `data_penyewa`
  ADD PRIMARY KEY (`id_penyewa`),
  ADD KEY `nama_penyewa` (`nama_penyewa`),
  ADD KEY `alamat_penyewa` (`alamat_penyewa`);

--
-- Indexes for table `detail_penyewaan_motor`
--
ALTER TABLE `detail_penyewaan_motor`
  ADD KEY `id_admin` (`id_penyewaan`),
  ADD KEY `id_penyewa` (`id_kendaraan`),
  ADD KEY `id_kendaraan` (`id_kendaraan`);

--
-- Indexes for table `penyewaan_motor`
--
ALTER TABLE `penyewaan_motor`
  ADD PRIMARY KEY (`id_penyewaan`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_penyewa` (`id_penyewa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_admin`
--
ALTER TABLE `data_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_kendaraan`
--
ALTER TABLE `data_kendaraan`
  MODIFY `id_kendaraan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_penyewa`
--
ALTER TABLE `data_penyewa`
  MODIFY `id_penyewa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penyewaan_motor`
--
ALTER TABLE `penyewaan_motor`
  MODIFY `id_penyewaan` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penyewaan_motor`
--
ALTER TABLE `detail_penyewaan_motor`
  ADD CONSTRAINT `detail_penyewaan_motor_ibfk_1` FOREIGN KEY (`id_kendaraan`) REFERENCES `data_kendaraan` (`id_kendaraan`);

--
-- Constraints for table `penyewaan_motor`
--
ALTER TABLE `penyewaan_motor`
  ADD CONSTRAINT `penyewaan_motor_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `data_admin` (`id_admin`),
  ADD CONSTRAINT `penyewaan_motor_ibfk_2` FOREIGN KEY (`id_penyewa`) REFERENCES `data_penyewa` (`id_penyewa`),
  ADD CONSTRAINT `penyewaan_motor_ibfk_3` FOREIGN KEY (`id_penyewaan`) REFERENCES `detail_penyewaan_motor` (`id_penyewaan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
