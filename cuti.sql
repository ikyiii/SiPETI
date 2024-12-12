-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2024 at 03:16 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cuti`
--

-- --------------------------------------------------------

--
-- Table structure for table `cuti`
--

CREATE TABLE `cuti` (
  `id` int(11) NOT NULL,
  `id_nip` varchar(30) NOT NULL,
  `id_jenis_cuti` int(11) NOT NULL,
  `tgl_pengajuan` timestamp NOT NULL DEFAULT current_timestamp(),
  `keterangan` varchar(64) NOT NULL,
  `tgl_awal` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `edited_by` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuti`
--

INSERT INTO `cuti` (`id`, `id_nip`, `id_jenis_cuti`, `tgl_pengajuan`, `keterangan`, `tgl_awal`, `tgl_akhir`, `status`, `edited_by`) VALUES
(52, '12314134817', 1, '2024-12-12 03:00:13', '', '2024-12-12', '2024-12-12', 'Approved', 'ade');

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `id` int(11) NOT NULL,
  `divisi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id`, `divisi`) VALUES
(1, 'Dosen'),
(2, 'Mahasiswa'),
(3, 'Services');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_divisi` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `jabatan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_divisi`, `id`, `jabatan`) VALUES
(1, 1, 'Dekan'),
(1, 2, 'Kepala Jurusan'),
(2, 3, 'Teknik Informatika'),
(3, 4, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_cuti`
--

CREATE TABLE `jenis_cuti` (
  `id` int(11) NOT NULL,
  `jenis_cuti` varchar(64) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_cuti`
--

INSERT INTO `jenis_cuti` (`id`, `jenis_cuti`, `value`) VALUES
(1, 'CUTI SEMESTER GANJIL AKADEMIK', 1),
(2, 'CUTI SEMESTER GENAP AKADEMIK', 2);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `level`) VALUES
(1, 'Administrator'),
(2, 'Dosen'),
(3, 'Mahasiswa');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(64) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1),
(26, 'aziz', '55ab6267a0fd9427486bcc5c01ef13b538a3612a', 2),
(27, 'Renaldi', 'ab56c3afe88618044ce647d19836c27195f9ed4c', 3),
(28, 'ade', 'd7f2e6a4093ffde1b599c934f8ec963badb6be32', 2),
(30, 'obi', '0515c97eeb973b1af69d8639d53f1e21d99c0734', 3),
(31, 'halta', 'e0dac6a8a522392f460438f8a3101fe825cb3f90', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `kelamin` varchar(16) NOT NULL,
  `divisi` int(11) NOT NULL,
  `jabatan` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telp` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `nip`, `nama`, `kelamin`, `divisi`, `jabatan`, `email`, `telp`) VALUES
(30, '12314134817', 'Obi Luter Sihombing', 'Laki-laki', 2, 3, '2201020066@student.umrah.ac.id', '7890987654345'),
(1, '2201020065', 'Haikal Purnama Aji', 'Laki-laki', 3, 4, 'aderizky27@outlook.com', '081364365032'),
(27, '2201020067', 'Renaldi Anicetus Simbolon', 'Laki-laki', 2, 3, 'aderizky27@outlook.com', '081364365032'),
(31, '2201020092', 'halta p.a', 'Laki-laki', 2, 3, 'asjndgjsj@gmail.com', '09876543345'),
(28, '2201020093', 'Muhammad Ade Rizky', 'Laki-laki', 1, 2, 'aderisky056@gmail.com', '081364365033'),
(26, '2201020095', 'Faalih Aziz T', 'Laki-laki', 1, 1, 'aderizky27@outlook.com', '081364365032');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cuti`
--
ALTER TABLE `cuti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cuti_jenis_cuti_1` (`id_jenis_cuti`),
  ADD KEY `fk_cuti_user_profile_1` (`id_nip`);

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jabatan_divisi_1` (`id_divisi`);

--
-- Indexes for table `jenis_cuti`
--
ALTER TABLE `jenis_cuti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_level_1` (`level`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `fk_user_profile_user_1` (`id`),
  ADD KEY `fk_user_profile_jabatan_1` (`jabatan`),
  ADD KEY `fk_user_profile_divisi_1` (`divisi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cuti`
--
ALTER TABLE `cuti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jenis_cuti`
--
ALTER TABLE `jenis_cuti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cuti`
--
ALTER TABLE `cuti`
  ADD CONSTRAINT `fk_cuti_jenis_cuti_1` FOREIGN KEY (`id_jenis_cuti`) REFERENCES `jenis_cuti` (`id`),
  ADD CONSTRAINT `fk_cuti_user_profile_1` FOREIGN KEY (`id_nip`) REFERENCES `user_profile` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD CONSTRAINT `fk_jabatan_divisi_1` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_level_1` FOREIGN KEY (`level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `fk_user_profile_divisi_1` FOREIGN KEY (`divisi`) REFERENCES `divisi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_profile_jabatan_1` FOREIGN KEY (`jabatan`) REFERENCES `jabatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_profile_user_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
