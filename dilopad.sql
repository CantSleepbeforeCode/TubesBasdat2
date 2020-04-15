-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2020 at 10:30 PM
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
-- Database: `dilopad`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id_absensi` varchar(5) NOT NULL,
  `id_tim` varchar(5) DEFAULT NULL,
  `id_peserta_I` varchar(5) DEFAULT NULL,
  `id_peserta_II` varchar(5) DEFAULT NULL,
  `id_peserta_III` varchar(5) DEFAULT NULL,
  `id_td` varchar(5) DEFAULT NULL,
  `id_mentoring` varchar(5) DEFAULT NULL,
  `tempat_pelaksanaan` text DEFAULT NULL,
  `waktu_pelaksanaan` date DEFAULT NULL,
  `isVerified` enum('verified','non-verified') NOT NULL DEFAULT 'non-verified'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id_absensi`, `id_tim`, `id_peserta_I`, `id_peserta_II`, `id_peserta_III`, `id_td`, `id_mentoring`, `tempat_pelaksanaan`, `waktu_pelaksanaan`, `isVerified`) VALUES
('A0001', 'T0001', 'P0001', 'P0002', 'P0003', 'TD001', 'TM001', 'Ruang 1A DiloBPP', '2019-12-17', 'verified'),
('A0002', 'T0002', 'P0004', 'P0019', 'P0012', 'TD002', 'TM002', 'Ruang 2A DiloBPP', '2019-12-03', 'verified'),
('A0003', 'T0003', 'P0006', 'P0010', 'P0008', 'TD003', 'TM003', 'Ruang 3A DiloBPP', '2019-12-02', 'verified'),
('A0004', 'T0004', 'P0009', 'P0014', 'P0013', 'TD004', 'TM004', 'Ruang 1A DiloBPP', '2019-12-04', 'verified'),
('A0005', 'T0005', 'P0011', 'P0016', 'P0005', 'TD005', 'TM005', 'Ruang 2A DiloBPP', '2019-12-06', 'verified'),
('A0006', 'T0006', 'P0015', 'P0018', 'P0020', 'TD006', 'TM006', 'Ruang 3A DiloBPP', '2019-12-05', 'verified'),
('A0007', 'T0007', 'P0017', 'P0007', 'P0021', 'TD007', 'TM007', 'Ruang 1A DiloBPP', '2019-12-01', 'verified'),
('A0008', 'T0001', 'P0001', 'P0002', NULL, NULL, 'TM003', 'Dilo', '2020-04-28', 'non-verified');

-- --------------------------------------------------------

--
-- Table structure for table `mentor`
--

CREATE TABLE `mentor` (
  `id_mentor` varchar(5) NOT NULL,
  `nama_mentor` varchar(70) DEFAULT NULL,
  `jk_mentor` enum('L','P') DEFAULT NULL,
  `umur_mentor` int(2) DEFAULT NULL,
  `alamat_mentor` text DEFAULT NULL,
  `no_hp_mentor` varchar(13) DEFAULT NULL,
  `email_mentor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mentor`
--

INSERT INTO `mentor` (`id_mentor`, `nama_mentor`, `jk_mentor`, `umur_mentor`, `alamat_mentor`, `no_hp_mentor`, `email_mentor`) VALUES
('M0001', 'Mujahidin', 'L', 28, 'Jalan Keberanian Rt.51 No.15', '085287909012', 'Mujahidin@gmail.com'),
('M0002', 'Abdul Salam', 'L', 27, 'Jalan Promosi Rt.55 No.10', '085223321121', 'Salam@gmail.com'),
('M0003', 'Agustin Rahayu', 'P', 27, 'Jalan Lambung Rt.52 No.11', '085287909012', 'Mujahidin@gmail.com'),
('M0004', 'Ahmad', 'L', 29, 'Jalan Provinsi Rt.51 No.14', '081278691299', 'Ahmad@gmail.com'),
('M0005', 'Aishiela', 'P', 27, 'Jalan Pendidikan Rt.01 No.11', '085295021212', 'Shiela@gmail.com'),
('M0006', 'Amalia', 'P', 28, 'Jalan Kalimantan Rt.02 No.13', '085209012879', 'Lia@gmail.com'),
('M0007', 'Andre', 'L', 28, 'Jalan Kehutanan Rt.21 No.01', '085287123212', 'Ndre@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `mentoring`
--

CREATE TABLE `mentoring` (
  `id_mentoring` varchar(5) NOT NULL,
  `materi_mentoring` text DEFAULT NULL,
  `id_mentor` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mentoring`
--

INSERT INTO `mentoring` (`id_mentoring`, `materi_mentoring`, `id_mentor`) VALUES
('TM001', 'Strategi Aplikasi, Bisnis, dan Desain', 'M0001'),
('TM002', 'Strategi Aplikasi, Bisnis, dan Desain', 'M0002'),
('TM003', 'Strategi Aplikasi, Bisnis, dan Desain', 'M0003'),
('TM004', 'Strategi Aplikasi, Bisnis, dan Desain', 'M0004'),
('TM005', 'Strategi Aplikasi, Bisnis, dan Desain', 'M0005'),
('TM006', 'Strategi Aplikasi, Bisnis, dan Desain', 'M0006'),
('TM007', 'Strategi Aplikasi, Bisnis, dan Desain', 'M0007');

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` varchar(5) NOT NULL,
  `nama_peserta` varchar(70) DEFAULT NULL,
  `skill_peserta` text DEFAULT NULL,
  `posisi_peserta` enum('Hacker','Hipster','Hustler') DEFAULT NULL,
  `ide_peserta` text DEFAULT NULL,
  `no_hp_peserta` varchar(13) DEFAULT NULL,
  `email_peserta` varchar(50) DEFAULT NULL,
  `jk_peserta` enum('L','P') DEFAULT NULL,
  `umur_peserta` int(2) DEFAULT NULL,
  `alamat_peserta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id_peserta`, `nama_peserta`, `skill_peserta`, `posisi_peserta`, `ide_peserta`, `no_hp_peserta`, `email_peserta`, `jk_peserta`, `umur_peserta`, `alamat_peserta`) VALUES
('P0001', 'Dobleh', 'Java', 'Hacker', 'Pembentukan aplikasi web yang berguna sebagai pemesanan buku dalam jangkauan kota.', '081223769743', 'dobleh@gmail.com', 'L', 21, 'Jalan Pembangunan Rt.12 No.55'),
('P0002', 'Destia', 'Python', 'Hustler', 'Menciptakan aplikasi android/IOS yang memberikan informasi mengenai lowongan pekerjaan yang ada pada sekitar pengguna, beserta informasi penting lainnya seperti jam kerja, penghasilan, skill yang dibutuhkan kepada pengguna.', '081276328712', 'destia@gmail.com', 'P', 20, 'Jalan Perjuangan Rt.15 No.45'),
('P0003', 'Daniel', 'C++', 'Hipster', 'Membuat aplikasi yang dapat bekerja pada semua device dan berfungsi untuk mengifokan user pada jadwal kegiatan yang akan dijalani dalam kegiatan sehari-hari atau kegiatan besar lainnya.', '081298674534', 'daniel@gmail.com', 'L', 23, 'Jalan Proklamasi Rt.09 No.12'),
('P0004', 'Lucina', 'HTML', 'Hacker', 'Membuat website dimana kumpulan perhitungan, rumus, konfigurasi ilmiah, dan perhitungan sciencetific lainnya dapat dilakukan dalam satu website.', '081234827722', 'lucina@gmail.com', 'P', 21, 'Jalan Kemerdekaan Rt.04 No.21'),
('P0005', 'Marth', 'Java', 'Hipster', 'Membuat aplikasi pembayaran parkir menggunakan scan pada device yang digunakan oleh pengguna tanpa khawatir dengan parkir liar dan pembayaran yang tidak masuk akal.', '085778231923', 'marth@gmail.com', 'L', 21, 'Jalan Kebangsaan Rt.34 No.54'),
('P0006', 'Terry', 'C++', 'Hacker', 'Menciptakan aplikasi yang berfugsi untuk melacak device yang kita miliki dengan gps yang ada pada device lain, dan akan tertampil pada device utama dan dapat menemukannya apabila hilang.', '081238463809', 'terry@gmail.com', 'L', 24, 'Jalan Gembira Rt.23 No.65'),
('P0007', 'Kiara', 'HTML', 'Hustler', 'Menciptakan aplikasi yang berguna untuk mendengarkan audio book secara luas dengan ijin yang sah dan terbukti, dapat juga didownload dan didengarkan secara offline tanpa perlu internet.', '085792739800', 'kiara@gmail.com', 'P', 21, 'Jalan Sedih Rt.43 No.93'),
('P0008', 'Yuna', 'Python', 'Hipster', 'Menciptakan website yang berguna untuk memberi informasi yang akurat mengenai kejadian kriminal yang ada disekitar pengguna, sehingga dapat mewaspadai lingkungan sekitar.', '081222233749', 'yuna@gmail.com', 'P', 19, 'Jalan Dewi Rt.01 No.01'),
('P0009', 'Momo', 'HTML', 'Hacker', 'Menciptakan aplikasi android/IOs yang berguna untuk menunjukkan letak pariwisata yang ada pada suatu kota tergantung oleh letak pengguna, serta dapat juga melihat lokasi lain yang mungkin direncanakan untuk liburan atau hal lainnya.', '081212122332', 'momo@gmail.com', 'P', 20, 'Jalan Kesehatan Rt.02 No.03'),
('P0010', 'Rhennova', 'Java', 'Hustler', 'Menciptakan aplikasi kumpulan hobi yang ada, dan memberikan informasi perkumpulan yang terdaftar untuk hobi tersebut.', '081256998845', 'rhennova@gmail.com', 'P', 20, 'Jalan Kenangan Rt.02 No.15'),
('P0011', 'Aditya', 'Java', 'Hacker', 'Membuat aplikasi yang berbasis untuk android/IOs dengan fungsi melakukan scan untuk code apapun dari bar code, QR code, special code, dll yang berada dalam satu aplikasi.', '081200649343', 'aditya@gmail.com', 'L', 21, 'Jalan Kesehatan Rt.29 No.73'),
('P0012', 'Wisnu', 'C++', 'Hipster', 'Membuat website yang menyediakan pertanyaan yang dapat digunakan untuk konteks apapun, mulai dari kuliah, pekerjaan, kesehatan,dl.', '085378649084', 'wisnu@gmail.com', 'L', 19, 'Jalan Perdamaian Rt.24 No.09'),
('P0013', 'Dane', 'HTML', 'Hipster', 'Menciptakan aplikasi yang dapat menghitung menjaga kesehatan sang pengguna dengan menghitung beberapa variasi kesehatan yang ada, seperti pola makan, apa yang dimakan, olahraga, senam, dan lain lain.', '081290988776', 'dane@gmail.com', 'L', 20, 'Jalan Lambung Rt.03 No.55'),
('P0014', 'Tucker', 'Python', 'Hustler', 'Menciptakan aplikasi yang dapat memantau nilai putra & putri yang langsung diberikan oleh instansi pendidikan yang bersangkutan secara bertahap hingga akhir pendidikannya, sehingga dapat melihat perkembangannya.', '081297890678', 'tucker@gmail.com', 'L', 23, 'Jalan Promosi Rt.04 No.23'),
('P0015', 'Luna', 'Java', 'Hacker', 'Menciptakan website yang dapat digunakan untuk menemukan lokasi tempat tinggal yang berada di sekitar pengguna , tempat tinggal ini dapat berupa tempat tinggal sementara maupun membeli secara permanen.', '081225623453', 'luna@gmail.com', 'P', 20, 'Jalan Keberanian Rt.51 No.12'),
('P0016', 'Kusuma', 'C++', 'Hustler', 'Membuat aplikasi yang dapat mengecek apakah pengguna memiliki penyakit ringan menggunakan pertanyaan pertanyaan tanpa perlu mengecek ke rumah sakit', '081256425345', 'kusuma@gmail.com', 'P', 23, 'Jalan Kesehatan Rt.72 No.01'),
('P0017', 'Lilith', 'Java', 'Hacker', 'Menciptakan aplikasi yang dapat menampung buku buku yang memiliki referensi penting bagi pekerjaan atau kegiatan yang diikuti pengguna.', '081253473245', 'lilith@gmail.com', 'P', 20, 'Jalan Pengetahuan Rt.52 No.35'),
('P0018', 'Sierra', 'HTML', 'Hustler', 'Membuat website dimana pengguna bisa merencanakan masa depan dengan tahapan tahapan yang detail sehingga dapat membuat rencana atau planning.', '081246928845', 'siera@gmail.com', 'P', 23, 'Jalan Kerinduan Rt.02 No.15'),
('P0019', 'Cliff', 'Python', 'Hustler', 'Membuat website yang dapat menyesuaikan kegiatan fitness dengan segala user sehinggan menghasilkan perencanaan olahraga yang sesuai dengan kebiasaan hidup tiap user.', '081274498645', 'cliff@gmail.com', 'L', 20, 'Jalan Kebugaran Rt.05 No.45'),
('P0020', 'Moris', 'C++', 'Hipster', 'Menciptakan aplikasi yang dapat memungkinkan user untuk menciptakan checklist demi kegiatan yang diperlukan dengan mudah sehingga dapat mempersiapkan beberapa hal.', '081252903845', 'moris@gmail.com', 'L', 20, 'Jalan Sukses Rt.42 No.25'),
('P0021', 'Diene', 'HTML', 'Hipster', 'Menciptakan aplikasi yang berguna untuk menghitung pengeluaran yang telah dilakukan dengan user, lebih tepatnya menghitung perekonomian sang user sehingga dapat memperkirakan apakah perlu menabung untuk kepentingan kedepan maupun tidak.', '081235443398', 'diene@gmail.com', 'P', 19, 'Jalan Kesetiaan Rt.02 No.15');

-- --------------------------------------------------------

--
-- Table structure for table `talent_development`
--

CREATE TABLE `talent_development` (
  `id_td` varchar(5) NOT NULL,
  `materi_td` varchar(100) DEFAULT NULL,
  `id_mentor` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `talent_development`
--

INSERT INTO `talent_development` (`id_td`, `materi_td`, `id_mentor`) VALUES
('TD001', 'Pengetahuan dan keterampilan dari segi bisnis, teknis, dan desain yang diperlukan di industri digita', 'M0001'),
('TD002', 'Pengetahuan dan keterampilan dari segi bisnis, teknis, dan desain yang diperlukan di industri digita', 'M0002'),
('TD003', 'Pengetahuan dan keterampilan dari segi bisnis, teknis, dan desain yang diperlukan di industri digita', 'M0003'),
('TD004', 'Pengetahuan dan keterampilan dari segi bisnis, teknis, dan desain yang diperlukan di industri digita', 'M0004'),
('TD005', 'Pengetahuan dan keterampilan dari segi bisnis, teknis, dan desain yang diperlukan di industri digita', 'M0005'),
('TD006', 'Pengetahuan dan keterampilan dari segi bisnis, teknis, dan desain yang diperlukan di industri digita', 'M0006'),
('TD007', 'Pengetahuan dan keterampilan dari segi bisnis, teknis, dan desain yang diperlukan di industri digita', 'M0007');

-- --------------------------------------------------------

--
-- Table structure for table `tim`
--

CREATE TABLE `tim` (
  `id_tim` varchar(5) NOT NULL,
  `nama_tim` varchar(70) DEFAULT NULL,
  `pic_name` varchar(70) DEFAULT NULL,
  `desc_tim` text DEFAULT NULL,
  `ide_tim` text DEFAULT NULL,
  `lokasi_tim` text DEFAULT NULL,
  `id_peserta_I` varchar(5) DEFAULT NULL,
  `id_peserta_II` varchar(5) DEFAULT NULL,
  `id_peserta_III` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tim`
--

INSERT INTO `tim` (`id_tim`, `nama_tim`, `pic_name`, `desc_tim`, `ide_tim`, `lokasi_tim`, `id_peserta_I`, `id_peserta_II`, `id_peserta_III`) VALUES
('T0001', 'Keluarga', 'Nanda', 'Masa depan keluarga bersama', 'Menciptakan aplikasi yang dapat digunakan oleh para putra dan putri bangsa yang mendorong langkah berpikir mereka menuju masa depan yang lebih baik.', 'Taman Bekapai', 'P0001', 'P0002', 'P0003'),
('T0002', 'Teknologi', 'Rifki', 'Menjunjung tinggi teknologi', 'Membuat website dimana kumpulan perhitungan, rumus, konfigurasi ilmiah, dan perhitungan sciencetific lainnya dapat dilakukan dalam satu website.', 'Taman Tiga Generasi', 'P0004', 'P0019', 'P0012'),
('T0003', 'Keamanan', 'Anton', 'Menjaga lingkungan pengguna', 'Menciptakan website yang berguna untuk memberi informasi yang akurat mengenai kejadian kriminal yang ada disekitar pengguna, sehingga dapat mewaspadai lingkungan sekitar.', 'Bumi Hijau', 'P0006', 'P0010', 'P0008'),
('T0004', 'Kesehatan', 'Ayu', 'Menjaga kesehatan bersama', 'Menciptakan aplikasi yang dapat menghitung menjaga kesehatan sang pengguna dengan menghitung beberapa variasi kesehatan yang ada, seperti pola makan, apa yang dimakan, olahraga, senam, dan lain lain.', 'Hotel Aston', 'P0009', 'P0014', 'P0013'),
('T0005', 'Park', 'Agus', 'Menciptakan dunia teknologi', 'Membuat aplikasi pembayaran parkir menggunakan scan pada device yang digunakan oleh pengguna tanpa khawatir dengan parkir liar dan pembayaran yang tidak masuk akal.', 'Hotel Platinum', 'P0011', 'P0016', 'P0005'),
('T0006', 'Economical', 'Renaldy', 'Menabung demi kebaikan masa mendatang', 'Menciptakan website yang dapat digunakan untuk menemukan lokasi tempat tinggal yang berada di sekitar pengguna , tempat tinggal ini dapat berupa tempat tinggal sementara maupun membeli secara permanen.', 'Taman Adipura', 'P0015', 'P0018', 'P0020'),
('T0007', 'Perpustaka', 'Indah', 'Jendela dunia', 'Menciptakan aplikasi yang berguna untuk mendengarkan audio book secara luas dengan ijin yang sah dan terbukti, dapat juga didownload dan didengarkan secara offline tanpa perlu internet.', 'Taman Merdeka', 'P0017', 'P0007', 'P0021');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `id` varchar(5) NOT NULL,
  `pass` varchar(300) NOT NULL,
  `hak_akses` enum('peserta','mentor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id`, `pass`, `hak_akses`) VALUES
(2, 'M0001', '700e2bd1bc97c91ea2ff704d43a056dc', 'mentor'),
(3, 'P0001', '700e2bd1bc97c91ea2ff704d43a056dc', 'peserta');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_absen_mentoring`
-- (See below for the actual view)
--
CREATE TABLE `view_absen_mentoring` (
`id_absensi` varchar(5)
,`nama_tim` varchar(70)
,`nama_1` varchar(70)
,`nama_2` varchar(70)
,`nama_3` varchar(70)
,`materi_mentoring` text
,`id_mentorr` varchar(5)
,`nama_mentor` varchar(70)
,`tempat_pelaksanaan` text
,`waktu_pelaksanaan` date
,`isVerified` enum('verified','non-verified')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_absen_td`
-- (See below for the actual view)
--
CREATE TABLE `view_absen_td` (
`id_absensi` varchar(5)
,`nama_peserta` varchar(70)
,`materi_td` varchar(100)
,`id_mentorr` varchar(5)
,`Name_exp_5` varchar(70)
,`tempat_pelaksanaan` text
,`waktu_pelaksanaan` date
,`isVerified` enum('verified','non-verified')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_detail_mentoring`
-- (See below for the actual view)
--
CREATE TABLE `view_detail_mentoring` (
`id_mentor` varchar(5)
,`id_mentoring` varchar(5)
,`nama_mentor` varchar(70)
,`materi_mentoring` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_detail_td`
-- (See below for the actual view)
--
CREATE TABLE `view_detail_td` (
`id_mentor` varchar(5)
,`id_td` varchar(5)
,`nama_mentor` varchar(70)
,`materi_td` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_team`
-- (See below for the actual view)
--
CREATE TABLE `view_team` (
`id_tim` varchar(5)
,`nama_tim` varchar(70)
,`pic_name` varchar(70)
,`desc_tim` text
,`ide_tim` text
,`lokasi_tim` text
,`nama_1` varchar(70)
,`nama_2` varchar(70)
,`nama_3` varchar(70)
,`id_peserta_I` varchar(5)
,`id_peserta_II` varchar(5)
,`id_peserta_III` varchar(5)
);

-- --------------------------------------------------------

--
-- Structure for view `view_absen_mentoring`
--
DROP TABLE IF EXISTS `view_absen_mentoring`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_absen_mentoring`  AS  select `absensi`.`id_absensi` AS `id_absensi`,`tim`.`nama_tim` AS `nama_tim`,(select `peserta`.`nama_peserta` from `peserta` where `peserta`.`id_peserta` = `absensi`.`id_peserta_I`) AS `nama_1`,(select `peserta`.`nama_peserta` from `peserta` where `peserta`.`id_peserta` = `absensi`.`id_peserta_II`) AS `nama_2`,(select `peserta`.`nama_peserta` from `peserta` where `peserta`.`id_peserta` = `absensi`.`id_peserta_III`) AS `nama_3`,`mentoring`.`materi_mentoring` AS `materi_mentoring`,`mentoring`.`id_mentor` AS `id_mentorr`,(select `mentor`.`nama_mentor` from `mentor` where `mentor`.`id_mentor` = `id_mentorr`) AS `nama_mentor`,`absensi`.`tempat_pelaksanaan` AS `tempat_pelaksanaan`,`absensi`.`waktu_pelaksanaan` AS `waktu_pelaksanaan`,`absensi`.`isVerified` AS `isVerified` from ((`absensi` join `tim`) join `mentoring`) where `tim`.`id_tim` = `absensi`.`id_tim` and `mentoring`.`id_mentoring` = `absensi`.`id_mentoring` ;

-- --------------------------------------------------------

--
-- Structure for view `view_absen_td`
--
DROP TABLE IF EXISTS `view_absen_td`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_absen_td`  AS  select `absensi`.`id_absensi` AS `id_absensi`,(select `peserta`.`nama_peserta` from `peserta` where `absensi`.`id_peserta_I` = `peserta`.`id_peserta`) AS `nama_peserta`,`talent_development`.`materi_td` AS `materi_td`,`talent_development`.`id_mentor` AS `id_mentorr`,(select `mentor`.`nama_mentor` from `mentor` where `id_mentorr` = `mentor`.`id_mentor`) AS `Name_exp_5`,`absensi`.`tempat_pelaksanaan` AS `tempat_pelaksanaan`,`absensi`.`waktu_pelaksanaan` AS `waktu_pelaksanaan`,`absensi`.`isVerified` AS `isVerified` from (`absensi` join `talent_development`) where `absensi`.`id_td` = `talent_development`.`id_td` ;

-- --------------------------------------------------------

--
-- Structure for view `view_detail_mentoring`
--
DROP TABLE IF EXISTS `view_detail_mentoring`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_detail_mentoring`  AS  select `mentor`.`id_mentor` AS `id_mentor`,`mentoring`.`id_mentoring` AS `id_mentoring`,`mentor`.`nama_mentor` AS `nama_mentor`,`mentoring`.`materi_mentoring` AS `materi_mentoring` from (`mentor` join `mentoring`) where `mentor`.`id_mentor` = `mentoring`.`id_mentor` ;

-- --------------------------------------------------------

--
-- Structure for view `view_detail_td`
--
DROP TABLE IF EXISTS `view_detail_td`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_detail_td`  AS  select `mentor`.`id_mentor` AS `id_mentor`,`talent_development`.`id_td` AS `id_td`,`mentor`.`nama_mentor` AS `nama_mentor`,`talent_development`.`materi_td` AS `materi_td` from (`mentor` join `talent_development`) where `mentor`.`id_mentor` = `talent_development`.`id_mentor` ;

-- --------------------------------------------------------

--
-- Structure for view `view_team`
--
DROP TABLE IF EXISTS `view_team`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_team`  AS  select `tim`.`id_tim` AS `id_tim`,`tim`.`nama_tim` AS `nama_tim`,`tim`.`pic_name` AS `pic_name`,`tim`.`desc_tim` AS `desc_tim`,`tim`.`ide_tim` AS `ide_tim`,`tim`.`lokasi_tim` AS `lokasi_tim`,(select `peserta`.`nama_peserta` from `peserta` where `peserta`.`id_peserta` = `tim`.`id_peserta_I`) AS `nama_1`,(select `peserta`.`nama_peserta` from `peserta` where `peserta`.`id_peserta` = `tim`.`id_peserta_II`) AS `nama_2`,(select `peserta`.`nama_peserta` from `peserta` where `peserta`.`id_peserta` = `tim`.`id_peserta_III`) AS `nama_3`,`tim`.`id_peserta_I` AS `id_peserta_I`,`tim`.`id_peserta_II` AS `id_peserta_II`,`tim`.`id_peserta_III` AS `id_peserta_III` from `tim` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absensi`),
  ADD KEY `id_tim` (`id_tim`),
  ADD KEY `id_peserta_I` (`id_peserta_I`),
  ADD KEY `id_peserta_II` (`id_peserta_II`),
  ADD KEY `id_peserta_III` (`id_peserta_III`),
  ADD KEY `id_td` (`id_td`),
  ADD KEY `id_mentoring` (`id_mentoring`);

--
-- Indexes for table `mentor`
--
ALTER TABLE `mentor`
  ADD PRIMARY KEY (`id_mentor`);

--
-- Indexes for table `mentoring`
--
ALTER TABLE `mentoring`
  ADD PRIMARY KEY (`id_mentoring`),
  ADD KEY `id_mentor` (`id_mentor`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`);

--
-- Indexes for table `talent_development`
--
ALTER TABLE `talent_development`
  ADD PRIMARY KEY (`id_td`),
  ADD KEY `id_mentor` (`id_mentor`);

--
-- Indexes for table `tim`
--
ALTER TABLE `tim`
  ADD PRIMARY KEY (`id_tim`),
  ADD KEY `id_peserta_I` (`id_peserta_I`),
  ADD KEY `id_peserta_II` (`id_peserta_II`),
  ADD KEY `id_peserta_III` (`id_peserta_III`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`id_tim`) REFERENCES `tim` (`id_tim`),
  ADD CONSTRAINT `absensi_ibfk_2` FOREIGN KEY (`id_peserta_I`) REFERENCES `peserta` (`id_peserta`),
  ADD CONSTRAINT `absensi_ibfk_3` FOREIGN KEY (`id_peserta_II`) REFERENCES `peserta` (`id_peserta`),
  ADD CONSTRAINT `absensi_ibfk_4` FOREIGN KEY (`id_peserta_III`) REFERENCES `peserta` (`id_peserta`),
  ADD CONSTRAINT `absensi_ibfk_5` FOREIGN KEY (`id_td`) REFERENCES `talent_development` (`id_td`),
  ADD CONSTRAINT `absensi_ibfk_6` FOREIGN KEY (`id_mentoring`) REFERENCES `mentoring` (`id_mentoring`);

--
-- Constraints for table `mentoring`
--
ALTER TABLE `mentoring`
  ADD CONSTRAINT `mentoring_ibfk_1` FOREIGN KEY (`id_mentor`) REFERENCES `mentor` (`id_mentor`);

--
-- Constraints for table `talent_development`
--
ALTER TABLE `talent_development`
  ADD CONSTRAINT `talent_development_ibfk_1` FOREIGN KEY (`id_mentor`) REFERENCES `mentor` (`id_mentor`);

--
-- Constraints for table `tim`
--
ALTER TABLE `tim`
  ADD CONSTRAINT `tim_ibfk_1` FOREIGN KEY (`id_peserta_I`) REFERENCES `peserta` (`id_peserta`),
  ADD CONSTRAINT `tim_ibfk_2` FOREIGN KEY (`id_peserta_II`) REFERENCES `peserta` (`id_peserta`),
  ADD CONSTRAINT `tim_ibfk_3` FOREIGN KEY (`id_peserta_III`) REFERENCES `peserta` (`id_peserta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
