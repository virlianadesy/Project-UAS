-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2022 at 03:38 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_anggota`
--

CREATE TABLE `tb_anggota` (
  `nim` int(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` enum('l','p') NOT NULL,
  `prodi` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_anggota`
--

INSERT INTO `tb_anggota` (`nim`, `nama`, `alamat`, `tgl_lahir`, `jk`, `prodi`) VALUES
(1901010001, 'Keisha Valerie', 'Mataram', '2000-02-09', 'p', 'Ilmu Komputer'),
(1901010002, 'Rizka ', 'Tanjung', '2001-02-15', 'p', 'Ilmu Komputer'),
(1901010003, 'Ega Chantika', 'Mataram', '2000-08-09', 'p', 'DKV'),
(1901010004, 'Trisonia', 'Lombok Timur', '2002-11-11', 'p', 'Ilmu Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id` int(9) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(150) NOT NULL,
  `tahun_terbit` varchar(4) NOT NULL,
  `isbn` varchar(25) NOT NULL,
  `jumlah_buku` int(3) NOT NULL,
  `lokasi` enum('rak1','rak2','rak3') NOT NULL,
  `tgl_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_buku`
--

INSERT INTO `tb_buku` (`id`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `isbn`, `jumlah_buku`, `lokasi`, `tgl_input`) VALUES
(3, 'Design', 'Felix', 'Media', '2009', '2764538', 6, 'rak3', '2020-07-10'),
(4, 'BTS', 'Kim-Hana', 'Haru Book', '2017', '3458364', 6, 'rak1', '2020-07-17'),
(5, 'EXO', 'Lee Soo ha', 'Galaxy Book', '2015', '847639', 6, 'rak2', '2020-07-06'),
(6, 'Seri 3 Kota Suci', 'Vadila Hanum ', 'Gema Insani', '2016', '978-602-250-310-1', 5, 'rak2', '2020-07-20'),
(10, 'Windows 8', 'Wahana Komputer', 'Andi offsed', '2013', '978-979-293-499-1', 2, 'rak2', '2020-07-05'),
(13, 'Islam Pesisir', 'Dr.Nursyam', 'LKIS', '2011', '978-979-845-114-0', 2, 'rak2', '2020-07-02'),
(14, 'Ilmu Daqwah', 'Dr.moh Ali Aziz,M.Ag', 'Kencana', '2016', '978-979-346-559-X', 2, 'rak3', '2020-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` int(9) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `nim` varchar(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `tgl_pinjam` varchar(30) NOT NULL,
  `tgl_kembali` varchar(30) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id`, `judul`, `nim`, `nama`, `tgl_pinjam`, `tgl_kembali`, `status`) VALUES
(35, 'Design', '1901010001', 'Keisha Valerie', '20-07-2020', '27-07-2020', 'kembali'),
(36, 'EXO', '1901010002', 'Rizka ', '30-07-2020', '13-08-20', 'kembali'),
(37, 'Design', '1901010002', 'Rizka ', '30-07-2020', '06-08-2020', 'kembali'),
(38, 'BTS', '1901010005', 'Rival', '30-07-2020', '06-08-2020', 'kembali'),
(39, 'Design', '1901010001', 'Keisha Valerie', '27-01-2022', '03-02-2022', 'pinjam');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `level` varchar(30) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`, `nama`, `level`, `foto`) VALUES
(3, 'v', 'tata123', 'Virliana Desi', 'admin', 'tata1.jpg'),
(4, 'lina', 'koya123', 'Lina Sriwanti Apriliana', 'admin', 'koya1.jpg'),
(5, 'intan', 'cooky123', 'Lale Maisya Intan Murni', 'admin', 'cooky1.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_anggota`
--
ALTER TABLE `tb_anggota`
  MODIFY `nim` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1901010005;

--
-- AUTO_INCREMENT for table `tb_buku`
--
ALTER TABLE `tb_buku`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
