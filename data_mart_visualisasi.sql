-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jun 2021 pada 14.36
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data mart visualisasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dim_mahasiswa`
--

CREATE TABLE `dim_mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `NIM` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `angkatan_masuk_mahasiswa` int(11) NOT NULL,
  `prodi_mahasiswa` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fakultas_mahasiswa` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nama_mahasiswa` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender_mahasiswa` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `kota_SMA_asal_mahasiswa` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dim_matakuliah`
--

CREATE TABLE `dim_matakuliah` (
  `id_matakuliah` int(11) NOT NULL,
  `kode_matakuliah` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `nama_matakuliah` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `bobot_sks_matakuliah` int(11) NOT NULL,
  `id_kategori_matakuliah` int(11) NOT NULL,
  `kode_kategori_matakuliah` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `nama_kategori_matakuliah` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dim_pengajar`
--

CREATE TABLE `dim_pengajar` (
  `id_pengajar` int(11) NOT NULL,
  `nomor_induk_pengajar` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `nama_pengajar` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender_pengajar` varchar(9) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dim_waktu`
--

CREATE TABLE `dim_waktu` (
  `id_waktu` int(11) NOT NULL,
  `kode_semester` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `tahun` int(11) NOT NULL,
  `jenis_semester` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `kode_hari` int(11) NOT NULL,
  `nama_hari` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `kode_jam` int(11) NOT NULL,
  `jam_mulai` char(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fakta_beban_belajar_mahasiswa`
--

CREATE TABLE `fakta_beban_belajar_mahasiswa` (
  `id_pengajar` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `id_waktu` int(11) NOT NULL,
  `id_matakuliah` int(11) NOT NULL,
  `beban_sks_mahasiswa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fakta_nilai_mahasiswa`
--

CREATE TABLE `fakta_nilai_mahasiswa` (
  `id_pengajar` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `id_waktu` int(11) NOT NULL,
  `id_matakuliah` int(11) NOT NULL,
  `nilai_angka` float NOT NULL,
  `nilai_huruf` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `bobot_nilai_huruf` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dim_mahasiswa`
--
ALTER TABLE `dim_mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`);

--
-- Indeks untuk tabel `dim_matakuliah`
--
ALTER TABLE `dim_matakuliah`
  ADD PRIMARY KEY (`id_matakuliah`);

--
-- Indeks untuk tabel `dim_pengajar`
--
ALTER TABLE `dim_pengajar`
  ADD PRIMARY KEY (`id_pengajar`);

--
-- Indeks untuk tabel `dim_waktu`
--
ALTER TABLE `dim_waktu`
  ADD PRIMARY KEY (`id_waktu`);

--
-- Indeks untuk tabel `fakta_beban_belajar_mahasiswa`
--
ALTER TABLE `fakta_beban_belajar_mahasiswa`
  ADD KEY `id_pengajar` (`id_pengajar`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_waktu` (`id_waktu`),
  ADD KEY `id_matakuliah` (`id_matakuliah`),
  ADD KEY `id_matakuliah_2` (`id_matakuliah`);

--
-- Indeks untuk tabel `fakta_nilai_mahasiswa`
--
ALTER TABLE `fakta_nilai_mahasiswa`
  ADD KEY `id_pengajar` (`id_pengajar`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_waktu` (`id_waktu`),
  ADD KEY `id_matakuliah` (`id_matakuliah`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `fakta_beban_belajar_mahasiswa`
--
ALTER TABLE `fakta_beban_belajar_mahasiswa`
  ADD CONSTRAINT `fakta_beban_belajar_mahasiswa_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `dim_mahasiswa` (`id_mahasiswa`) ON DELETE CASCADE,
  ADD CONSTRAINT `fakta_beban_belajar_mahasiswa_ibfk_2` FOREIGN KEY (`id_matakuliah`) REFERENCES `dim_matakuliah` (`id_matakuliah`) ON DELETE CASCADE,
  ADD CONSTRAINT `fakta_beban_belajar_mahasiswa_ibfk_3` FOREIGN KEY (`id_pengajar`) REFERENCES `dim_pengajar` (`id_pengajar`) ON DELETE CASCADE,
  ADD CONSTRAINT `fakta_beban_belajar_mahasiswa_ibfk_4` FOREIGN KEY (`id_waktu`) REFERENCES `dim_waktu` (`id_waktu`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `fakta_nilai_mahasiswa`
--
ALTER TABLE `fakta_nilai_mahasiswa`
  ADD CONSTRAINT `fakta_nilai_mahasiswa_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `dim_mahasiswa` (`id_mahasiswa`) ON DELETE CASCADE,
  ADD CONSTRAINT `fakta_nilai_mahasiswa_ibfk_2` FOREIGN KEY (`id_matakuliah`) REFERENCES `dim_matakuliah` (`id_matakuliah`) ON DELETE CASCADE,
  ADD CONSTRAINT `fakta_nilai_mahasiswa_ibfk_3` FOREIGN KEY (`id_pengajar`) REFERENCES `dim_pengajar` (`id_pengajar`) ON DELETE CASCADE,
  ADD CONSTRAINT `fakta_nilai_mahasiswa_ibfk_4` FOREIGN KEY (`id_waktu`) REFERENCES `dim_waktu` (`id_waktu`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
