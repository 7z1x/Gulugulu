-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: Jun 14, 2024 at 08:48 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_stki_knn`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-10 16:13:44.149309'),
(2, 'auth', '0001_initial', '2024-06-10 16:13:44.774791'),
(3, 'admin', '0001_initial', '2024-06-10 16:13:44.922839'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-06-10 16:13:44.930421'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-10 16:13:44.937588'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-06-10 16:13:45.032911'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-06-10 16:13:45.102444'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-06-10 16:13:45.138146'),
(9, 'auth', '0004_alter_user_username_opts', '2024-06-10 16:13:45.150602'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-06-10 16:13:45.233465'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-06-10 16:13:45.237592'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-06-10 16:13:45.245019'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-06-10 16:13:45.323039'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-06-10 16:13:45.400163'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-06-10 16:13:45.430139'),
(16, 'auth', '0011_update_proxy_permissions', '2024-06-10 16:13:45.444823'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-06-10 16:13:45.523618'),
(18, 'sessions', '0001_initial', '2024-06-10 16:13:45.559562');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `makanan`
--

CREATE TABLE `makanan` (
  `id` int NOT NULL,
  `nama` varchar(30) NOT NULL,
  `bahan` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `deskripsi` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `makanan`
--

INSERT INTO `makanan` (`id`, `nama`, `bahan`, `deskripsi`) VALUES
(1, 'Arsik', 'Ikan Mas, Andaliman, Asam Gelugur', 'Masakan ikan khas Batak dengan bumbu khas seperti andaliman dan asam gelugur.'),
(2, 'Ayam Betutu', 'Ayam, Bumbu Bali', 'Ayam yang dimasak dengan bumbu khas Bali dan dipanggang dalam bungkusan daun pisang.'),
(3, 'Ayam Taliwang', 'Ayam Kampung, Cabai, Terasi', 'Ayam kampung yang dibakar dengan bumbu khas Lombok yang pedas dan gurih.'),
(4, 'Bakpia', 'Tepung Terigu, Gula, Kacang Hijau', 'Kue kering berisi kacang hijau manis yang berasal dari Yogyakarta.'),
(5, 'Bakso', 'Daging Sapi, Tepung Tapioka, Bawang Putih', 'Bola daging sapi yang disajikan dengan kuah kaldu yang gurih.'),
(6, 'Babi Guling', 'Babi, Bumbu Bali, Daun Singkong', 'Babi panggang dengan bumbu khas Bali yang disajikan dengan sayuran dan sambal.'),
(7, 'Bandeng Presto', 'Ikan Bandeng, Bumbu Kuning, Presto', 'Ikan bandeng yang dimasak dengan bumbu kuning menggunakan teknik presto sehingga durinya lunak.'),
(8, 'Batagor', 'Tahu, Ikan Tenggiri, Tepung Tapioka', 'Tahu dan ikan tenggiri yang digoreng dan disajikan dengan saus kacang.'),
(9, 'Bika Ambon', 'Tepung Sagu, Telur, Santan', 'Kue khas Medan yang memiliki tekstur kenyal dan rasa manis.'),
(10, 'Botok', 'Tahu, Tempe, Kelapa Parut', 'Hidangan kukus yang dibungkus daun pisang, berisi tahu, tempe, dan kelapa parut.'),
(11, 'Bubur Ayam', 'Beras, Ayam, Kaldu Ayam', 'Bubur nasi dengan ayam suwir, kacang, dan kerupuk yang disajikan dengan kuah kaldu.'),
(12, 'Bubur Manado', 'Beras, Sayuran, Ikan Asap', 'Bubur nasi yang dicampur dengan berbagai sayuran dan ikan asap, khas Manado.'),
(13, 'Bubur Tinotuan', 'Beras, Sayuran, Ikan Asap', 'Bubur nasi yang dicampur dengan berbagai sayuran dan ikan asap, khas Manado (nama lain dari Bubur Manado).'),
(14, 'Cincang Batokok', 'Daging Sapi, Cabai, Bawang Putih', 'Masakan daging sapi khas Minangkabau yang dipukul-pukul dan dimasak dengan bumbu pedas.'),
(15, 'Cilok', 'Tepung Tapioka, Daging Sapi, Saus Kacang', 'Bola-bola tepung tapioka yang disajikan dengan saus kacang pedas.'),
(16, 'Combro', 'Singkong, Oncom', 'Kue goreng berbahan singkong parut berisi oncom pedas.'),
(17, 'Dendeng Balado', 'Daging Sapi, Cabai Merah', 'Daging sapi yang diiris tipis, digoreng kering, dan disajikan dengan sambal balado pedas.'),
(18, 'Dodol', 'Tepung Ketan, Gula Kelapa, Santan', 'Kue tradisional kenyal dan manis yang terbuat dari tepung ketan dan gula kelapa.'),
(19, 'Es Cendol', 'Tepung Beras, Santan, Gula Merah', 'Minuman manis yang terbuat dari tepung beras, santan, dan gula merah dengan es serut.'),
(20, 'Es Pisang Ijo', 'Pisang, Tepung Beras, Santan', 'Pisang yang dibalut dengan adonan tepung beras berwarna hijau, disajikan dengan kuah santan.'),
(21, 'Gado-Gado', 'Sayuran, Tahu, Tempe, Bumbu Kacang', 'Salad khas Indonesia dengan sayuran, tahu, tempe, dan saus kacang.'),
(22, 'Gethuk', 'Singkong, Gula Kelapa', 'Makanan ringan dari singkong yang dihaluskan dan dicampur dengan gula kelapa.'),
(23, 'Gudeg', 'Nangka Muda, Santan, Telur, Ayam', 'Masakan dari nangka muda yang dimasak dengan santan dan rempah khas Yogyakarta.'),
(24, 'Ikan Bakar', 'Ikan, Bumbu Rempah', 'Ikan yang dibakar dengan bumbu rempah dan disajikan dengan sambal.'),
(25, 'Jengkol Balado', 'Jengkol, Cabai Merah, Bawang Merah', 'Jengkol yang dimasak dengan bumbu balado pedas.'),
(26, 'Karedok', 'Sayuran Mentah, Bumbu Kacang', 'Salad khas Sunda dengan sayuran mentah dan saus kacang.'),
(27, 'Kerak Telor', 'Telur Bebek, Beras Ketan, Serundeng', 'Makanan khas Betawi yang terbuat dari telur bebek dan beras ketan, dimasak dengan serundeng.'),
(28, 'Keripik Sanjai', 'Singkong, Cabai, Gula', 'Keripik singkong pedas manis khas Bukittinggi.'),
(29, 'Keripik Tempe', 'Tempe, Tepung Beras, Bumbu Rempah', 'Keripik yang terbuat dari tempe yang diiris tipis dan digoreng dengan tepung beras berbumbu.'),
(30, 'Ketoprak', 'Bihun, Tahu, Lontong, Bumbu Kacang', 'Hidangan dengan bihun, tahu, dan lontong yang disajikan dengan saus kacang.'),
(31, 'Kimchi', 'Sawi Putih, Cabai, Bawang Putih', 'Makanan fermentasi khas Korea yang terbuat dari sawi putih dan bumbu pedas.'),
(32, 'Klepon', 'Tepung Ketan, Gula Merah, Kelapa Parut', 'Kue bola-bola ketan berisi gula merah dan dilapisi kelapa parut.'),
(33, 'Kuluban', 'Sayuran, Kelapa Parut, Bumbu Pecel', 'Salad sayuran yang dicampur dengan kelapa parut dan bumbu pecel.'),
(34, 'Kue Cubit', 'Tepung Terigu, Telur, Gula', 'Kue kecil yang dimasak dalam cetakan khusus, memiliki tekstur lembut dan rasa manis.'),
(35, 'Kue Lumpur', 'Tepung Terigu, Kentang, Santan', 'Kue yang terbuat dari tepung, kentang, dan santan dengan tekstur lembut.'),
(36, 'Kue Lumpur Surga', 'Tepung Beras, Santan, Gula Merah', 'Kue basah dengan tekstur lembut dan rasa manis yang khas dari gula merah dan santan.'),
(37, 'Kue Nastar', 'Tepung Terigu, Selai Nanas', 'Kue kering berisi selai nanas yang biasanya disajikan saat hari raya.'),
(38, 'Laksa Betawi', 'Mie, Santan, Ayam, Rempah-rempah', 'Sup mie khas Betawi dengan kuah santan dan bumbu rempah yang kaya.'),
(39, 'Lawar', 'Daging Ayam, Kacang Panjang, Kelapa Parut', 'Hidangan khas Bali yang terbuat dari campuran daging ayam, sayuran, dan kelapa parut berbumbu.'),
(40, 'Lemang', 'Beras Ketan, Santan, Daun Pisang', 'Beras ketan yang dimasak dalam bambu dengan santan dan daun pisang.'),
(41, 'Lemper', 'Beras Ketan, Ayam, Daun Pisang', 'Beras ketan yang berisi daging ayam suwir, dibungkus daun pisang.'),
(42, 'Lontong Balap', 'Lontong, Tauge, Lento, Kuah Bumbu', 'Hidangan khas Surabaya dengan lontong, tauge, lento, dan kuah bumbu kacang.'),
(43, 'Lontong Sayur', 'Lontong, Sayuran, Santan', 'Lontong yang disajikan dengan sayuran dan kuah santan berempah.'),
(44, 'Lotek', 'Sayuran, Bumbu Kacang', 'Salad sayuran yang disajikan dengan bumbu kacang.'),
(45, 'Lumpia', 'Kulit Lumpia, Rebung, Ayam, Udang', 'Gorengan yang berisi rebung, ayam, dan udang, dibungkus kulit lumpia.'),
(46, 'Mangut Lele', 'Lele, Santan, Bumbu Kuning', 'Ikan lele yang dimasak dengan kuah santan bumbu kuning khas Jawa Tengah.'),
(47, 'Martabak Manis', 'Tepung Terigu, Gula, Selai', 'Martabak tebal dengan berbagai isian manis seperti coklat, keju, atau selai.'),
(48, 'Martabak Telur', 'Telur, Daging Sapi, Kulit Lumpia', 'Martabak yang berisi telur dan daging sapi cincang, dibungkus kulit lumpia.'),
(49, 'Mendoan', 'Tempe, Tepung Terigu, Bumbu Rempah', 'Tempe yang digoreng dengan tepung terigu dan bumbu rempah, disajikan setengah matang.'),
(50, 'Nasi Bebek', 'Bebek, Nasi, Bumbu Bali', 'Nasi yang disajikan dengan bebek goreng atau panggang dan bumbu khas Bali.'),
(51, 'Nasi Campur', 'Nasi, Lauk Pauk Beragam', 'Nasi yang disajikan dengan berbagai lauk pauk seperti ayam, telur, dan sambal.'),
(52, 'Nasi Goreng', 'Nasi, Telur, Kecap, Bumbu Rempah', 'Nasi yang digoreng dengan bumbu rempah, kecap, dan tambahan telur atau daging.'),
(53, 'Nasi Jenggo', 'Nasi, Ayam, Sambal', 'Hidangan khas Bali berupa nasi yang disajikan dengan ayam suwir dan sambal.'),
(54, 'Nasi Kuning', 'Beras, Kunyit, Santan', 'Nasi yang dimasak dengan kunyit dan santan sehingga berwarna kuning dan harum.'),
(55, 'Nasi Lemak', 'Beras, Santan, Daun Pandan', 'Nasi gurih khas Malaysia yang dimasak dengan santan dan daun pandan, disajikan dengan lauk.'),
(56, 'Nasi Liwet', 'Beras, Santan, Ikan Asin', 'Nasi gurih khas Solo yang dimasak dengan santan dan ikan asin.'),
(57, 'Nasi Padang', 'Nasi, Lauk Pauk Padang', 'Nasi yang disajikan dengan berbagai lauk khas Padang seperti rendang, gulai, dan sambal.'),
(58, 'Nasi Tumpeng', 'Beras, Kunyit, Santan', 'Nasi kuning yang dibentuk kerucut dan disajikan dengan berbagai lauk pauk.'),
(59, 'Nasi Tutug Oncom', 'Nasi, Oncom, Bumbu Rempah', 'Nasi yang dicampur dengan oncom yang telah dibumbui dan dibakar.'),
(60, 'Nasi Uduk', 'Beras, Santan, Daun Salam', 'Nasi yang dimasak dengan santan dan daun salam sehingga gurih dan wangi.'),
(61, 'Otak-Otak', 'Ikan Tenggiri, Tepung Sagu, Daun Pisang', 'Olahan ikan tenggiri yang dibungkus daun pisang dan dibakar atau dikukus.'),
(62, 'Papeda', 'Sagu, Ikan Kuah Kuning', 'Bubur sagu khas Papua yang disajikan dengan ikan kuah kuning.'),
(63, 'Pempek', 'Ikan Tenggiri, Tepung Sagu, Kuah Cuko', 'Olahan ikan tenggiri yang dicampur tepung sagu dan disajikan dengan kuah cuko asam pedas.'),
(64, 'Pempek Palembang', 'Ikan Tenggiri, Tepung Sagu, Kuah Cuko', 'Pempek khas Palembang dengan ikan tenggiri dan kuah cuko yang khas.'),
(65, 'Pepes Ikan', 'Ikan, Bumbu Rempah, Daun Pisang', 'Ikan yang dibumbui rempah dan dibungkus daun pisang, kemudian dikukus atau dibakar.'),
(66, 'Pepes Tahu', 'Tahu, Bumbu Rempah, Daun Pisang', 'Tahu yang dibumbui rempah dan dibungkus daun pisang, kemudian dikukus atau dibakar.'),
(67, 'Perkedel', 'Kentang, Daging Cincang, Bumbu Rempah', 'Kentang yang dihaluskan dan dicampur daging cincang serta bumbu, lalu digoreng.'),
(68, 'Pizza', 'Tepung Terigu, Saus Tomat, Keju', 'Hidangan roti yang diberi saus tomat, keju, dan berbagai topping, dipanggang.'),
(69, 'Pisang Goreng', 'Pisang, Tepung Terigu, Gula', 'Pisang yang dibalut adonan tepung dan digoreng hingga kecoklatan.'),
(70, 'Ratatouille', 'Sayuran, Saus Tomat', 'Hidangan khas Perancis berupa sayuran yang dimasak dengan saus tomat.'),
(71, 'Rawon', 'Daging Sapi, Kluwek, Bumbu Rempah', 'Sup daging sapi dengan kuah hitam yang berasal dari kluwek dan bumbu rempah.'),
(72, 'Rendang', 'Daging Sapi, Santan, Bumbu Rempah', 'Masakan daging sapi yang dimasak dengan santan dan bumbu rempah hingga kering.'),
(73, 'Roti Unyil', 'Tepung Terigu, Gula, Selai', 'Roti kecil dengan berbagai isian manis atau gurih, khas Bogor.'),
(74, 'Rujak Cingur', 'Cingur Sapi, Sayuran, Bumbu Petis', 'Hidangan khas Surabaya berupa irisan cingur sapi dan sayuran dengan bumbu petis.'),
(75, 'Rujak Soto', 'Daging Sapi, Sayuran, Bumbu Soto', 'Perpaduan rujak dan soto dengan kuah soto yang gurih dan segar.'),
(76, 'Sambal Goreng Ati', 'Ati Sapi, Kentang, Cabai', 'Ati sapi yang dimasak dengan bumbu sambal goreng dan kentang.'),
(77, 'Sayur Asem', 'Sayuran, Asam Jawa, Bumbu Rempah', 'Sayur berkuah bening dengan rasa asam segar dari asam jawa.'),
(78, 'Sayur Lodeh', 'Sayuran, Santan, Bumbu Rempah', 'Sayur berkuah santan dengan berbagai jenis sayuran.'),
(79, 'Sate Ayam', 'Ayam, Kecap, Bumbu Kacang', 'Potongan daging ayam yang ditusuk dan dibakar, disajikan dengan saus kacang atau kecap.'),
(80, 'Sate Kambing', 'Kambing, Kecap, Bumbu Kacang', 'Potongan daging kambing yang ditusuk dan dibakar, disajikan dengan saus kacang atau kecap.'),
(81, 'Sate Lilit', 'Ikan, Kelapa Parut, Bumbu Rempah', 'Sate khas Bali yang terbuat dari ikan dan kelapa parut yang dibumbui, dibakar dengan tusukan.'),
(82, 'Serabi', 'Tepung Beras, Santan, Gula', 'Kue tradisional yang terbuat dari tepung beras dan santan, disajikan dengan gula cair.'),
(83, 'Soto', 'Daging Sapi/Ayam, Bumbu Rempah, Kuah', 'Sup berisi daging sapi atau ayam dengan kuah berempah yang gurih.'),
(84, 'Soto Ayam', 'Ayam, Bumbu Rempah, Kuah', 'Soto dengan daging ayam dan kuah berempah.'),
(85, 'Soto Betawi', 'Daging Sapi, Santan, Bumbu Rempah', 'Soto khas Betawi dengan daging sapi dan kuah santan yang gurih.'),
(86, 'Soto Mie', 'Mie, Daging Sapi, Bumbu Rempah', 'Soto yang berisi mie dan daging sapi dengan kuah berempah.'),
(87, 'Sop Buntut', 'Buntut Sapi, Bumbu Rempah, Sayuran', 'Sup yang menggunakan buntut sapi sebagai bahan utama, dimasak dengan bumbu rempah.'),
(88, 'Sop Konro', 'Iga Sapi, Bumbu Rempah', 'Sup iga sapi khas Makassar dengan kuah berempah yang kental.'),
(89, 'Sup Ikan Batam', 'Ikan, Bumbu Rempah, Sayuran', 'Sup ikan dengan bumbu rempah khas dan sayuran, khas Batam.'),
(90, 'Sushi', 'Nasi, Ikan Mentah, Rumput Laut', 'Makanan Jepang berupa nasi yang dibentuk dengan isian ikan mentah dan dibungkus rumput laut.'),
(91, 'Tacos', 'Tortilla, Daging, Sayuran, Saus', 'Hidangan Meksiko berupa tortilla yang diisi dengan daging, sayuran, dan saus.'),
(92, 'Tahu Gejrot', 'Tahu, Bumbu Kecap, Cabai', 'Tahu goreng yang disajikan dengan saus kecap pedas.'),
(93, 'Tahu Isi', 'Tahu, Sayuran, Daging Ayam', 'Tahu yang diisi dengan campuran sayuran dan daging ayam, kemudian digoreng.'),
(94, 'Tahu Kupat', 'Tahu, Kupat, Sayuran, Bumbu Kacang', 'Hidangan tahu dan kupat yang disajikan dengan sayuran dan saus kacang.'),
(95, 'Tahu Sumedang', 'Tahu, Bumbu Rempah', 'Tahu goreng khas Sumedang yang renyah di luar dan lembut di dalam.'),
(96, 'Tempe Mendoan', 'Tempe, Tepung Terigu, Bumbu Rempah', 'Tempe yang digoreng setengah matang dengan adonan tepung berbumbu.'),
(97, 'Tempoyak', 'Durian Fermentasi, Cabai, Bumbu', 'Hidangan dari durian yang difermentasi, disajikan dengan bumbu pedas.'),
(98, 'Tinutuan', 'Beras, Sayuran, Ikan Asap', 'Bubur Manado yang kaya sayuran dan disajikan dengan ikan asap.'),
(99, 'Tongseng', 'Daging Kambing, Bumbu Rempah, Kol', 'Masakan daging kambing berkuah dengan bumbu rempah dan kol.'),
(100, 'Tum Ayam', 'Ayam, Bumbu Rempah, Daun Pisang', 'Ayam berbumbu yang dibungkus daun pisang dan dikukus atau dibakar.'),
(101, 'Wedang Jahe', 'Jahe, Gula Merah, Air', 'Minuman hangat dari jahe dan gula merah, disajikan panas.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama` (`nama`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `makanan`
--
ALTER TABLE `makanan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
