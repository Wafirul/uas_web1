-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jan 2023 pada 15.25
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `kd_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(20) DEFAULT NULL,
  `jumlah_barang` int(11) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`kd_barang`, `nama_barang`, `jumlah_barang`, `harga_beli`, `harga_satuan`, `tanggal_masuk`) VALUES
('1234', 'keyboard', 2, 200000, 400000, '2022-06-29'),
('KD001', 'meja belajar', 20, 130000, 150000, '2022-06-12'),
('KD002', 'kursi goyang', 30, 180000, 200000, '2022-06-12'),
('KD003', 'lemari', 25, 230000, 250000, '2022-06-12'),
('KD004', 'kulkas', 20, 1350000, 1500000, '2022-06-12'),
('KD005', 'kipas angin', 30, 280000, 300000, '2022-06-12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_hitung_jual`
--

CREATE TABLE `tbl_hitung_jual` (
  `id_hitung` int(11) NOT NULL,
  `kd_barang` varchar(11) DEFAULT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `hsatuan` int(11) DEFAULT NULL,
  `jumlah_jual` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_hitung_jual`
--

INSERT INTO `tbl_hitung_jual` (`id_hitung`, `kd_barang`, `nama_barang`, `hsatuan`, `jumlah_jual`, `harga`) VALUES
(325, 'KD001', 'meja belajar', 150000, 5, 750000),
(326, 'KD002', 'kursi goyang', 200000, 3, 600000),
(327, 'KD003', 'lemari', 250000, 7, 17500000),
(328, 'KD004', 'kulkas', 1500000, 2, 3000000),
(329, 'KD005', 'kipas angin', 300000, 10, 3000000);

--
-- Trigger `tbl_hitung_jual`
--
DELIMITER $$
CREATE TRIGGER `tr_batal` AFTER DELETE ON `tbl_hitung_jual` FOR EACH ROW BEGIN
    update tbl_barang set jumlah_barang = jumlah_barang+OLD.jumlah_jual
    where kd_barang = OLD.kd_barang;

    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_jual` AFTER INSERT ON `tbl_hitung_jual` FOR EACH ROW BEGIN
    UPDATE tbl_barang SET jumlah_barang = jumlah_barang - new.jumlah_jual
    WHERE kd_barang = new.`kd_barang`;

    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_login`
--

CREATE TABLE `tbl_login` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_login`
--

INSERT INTO `tbl_login` (`Username`, `Password`) VALUES
('wafirul', '12345');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_penjualan`
--

CREATE TABLE `tbl_penjualan` (
  `nofaktur` varchar(11) NOT NULL,
  `kd_barang` varchar(11) DEFAULT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `hsatuan` int(11) DEFAULT NULL,
  `jumlah_jual` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `bayar` int(11) DEFAULT NULL,
  `kembalian` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_penjualan`
--

INSERT INTO `tbl_penjualan` (`nofaktur`, `kd_barang`, `nama_barang`, `hsatuan`, `jumlah_jual`, `harga`, `bayar`, `kembalian`, `tanggal`) VALUES
('A4560', 'KD001', 'meja belajar', 150000, 3, 450000, 500000, 50000, '2022-06-12'),
('A4570', 'KD002', 'kursi goyang', 200000, 4, 800000, 800000, 0, '2022-06-12'),
('A4580', 'KD003', 'lemari', 250000, 3, 750000, 800000, 50000, '2022-06-12'),
('A4590', 'KD004', 'kulkas', 1500000, 1, 1500000, 1500000, 0, '2022-06-12'),
('A4600', 'KD005', 'kipas angin', 300000, 7, 2100000, 2100000, 0, '2022-06-12');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indeks untuk tabel `tbl_hitung_jual`
--
ALTER TABLE `tbl_hitung_jual`
  ADD PRIMARY KEY (`id_hitung`);

--
-- Indeks untuk tabel `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`Username`);

--
-- Indeks untuk tabel `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD PRIMARY KEY (`nofaktur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
