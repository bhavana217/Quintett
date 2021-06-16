-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2021 at 10:54 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quintet1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add trainers', 7, 'add_trainers'),
(26, 'Can change trainers', 7, 'change_trainers'),
(27, 'Can delete trainers', 7, 'delete_trainers'),
(28, 'Can view trainers', 7, 'view_trainers'),
(29, 'Can add users', 8, 'add_users'),
(30, 'Can change users', 8, 'change_users'),
(31, 'Can delete users', 8, 'delete_users'),
(32, 'Can view users', 8, 'view_users'),
(33, 'Can add admin', 9, 'add_admin'),
(34, 'Can change admin', 9, 'change_admin'),
(35, 'Can delete admin', 9, 'delete_admin'),
(36, 'Can view admin', 9, 'view_admin'),
(37, 'Can add users1', 10, 'add_users1'),
(38, 'Can change users1', 10, 'change_users1'),
(39, 'Can delete users1', 10, 'delete_users1'),
(40, 'Can view users1', 10, 'view_users1'),
(41, 'Can add college', 11, 'add_college'),
(42, 'Can change college', 11, 'change_college'),
(43, 'Can delete college', 11, 'delete_college'),
(44, 'Can view college', 11, 'view_college');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `id` int(11) NOT NULL,
  `collegename` varchar(200) NOT NULL,
  `collegeid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`id`, `collegename`, `collegeid`) VALUES
(6, 'SJB Institute of Technology', 'SJBIT'),
(7, 'BNM Institute of Technology', 'BNMIT'),
(8, 'RV College of Engineering', 'RVCE'),
(9, 'BMS College of Engineering', 'BMSCE'),
(10, 'Bangalore Institute of Technology', 'BIT'),
(11, 'ACS College of Engineering', 'ACSCE');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'quintet', 'admin'),
(11, 'quintet', 'college'),
(7, 'quintet', 'trainers'),
(8, 'quintet', 'users'),
(10, 'quintet', 'users1'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-04-05 08:13:03.334747'),
(2, 'auth', '0001_initial', '2021-04-05 08:13:05.277528'),
(3, 'admin', '0001_initial', '2021-04-05 08:13:17.428756'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-04-05 08:13:19.986989'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-04-05 08:13:20.096831'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-04-05 08:13:21.504438'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-04-05 08:13:21.736522'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-04-05 08:13:21.994639'),
(9, 'auth', '0004_alter_user_username_opts', '2021-04-05 08:13:22.065810'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-04-05 08:13:23.090139'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-04-05 08:13:23.152259'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-04-05 08:13:23.246331'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-04-05 08:13:23.435591'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-04-05 08:13:23.743699'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-04-05 08:13:24.080051'),
(16, 'auth', '0011_update_proxy_permissions', '2021-04-05 08:13:24.154571'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-04-05 08:13:24.367333'),
(18, 'quintet', '0001_initial', '2021-04-05 08:13:25.635235'),
(19, 'sessions', '0001_initial', '2021-04-05 08:13:26.217077'),
(20, 'quintet', '0002_auto_20210405_1348', '2021-04-05 08:18:17.074986'),
(21, 'quintet', '0003_auto_20210405_1625', '2021-04-05 10:55:41.419358'),
(22, 'quintet', '0004_auto_20210406_2039', '2021-04-06 15:09:37.004595'),
(23, 'quintet', '0005_admin', '2021-04-06 15:20:26.029549'),
(24, 'quintet', '0006_auto_20210407_1543', '2021-04-07 10:13:33.245585'),
(25, 'quintet', '0007_auto_20210407_1550', '2021-04-07 10:20:57.959764'),
(26, 'quintet', '0008_remove_users_collegeid', '2021-04-13 09:57:38.588760'),
(27, 'quintet', '0009_users1', '2021-04-14 06:49:52.863883'),
(28, 'quintet', '0010_trainers_fees', '2021-04-16 08:43:31.492567'),
(29, 'quintet', '0011_auto_20210416_1548', '2021-04-16 10:18:30.816354'),
(30, 'quintet', '0012_users1_travel', '2021-04-16 14:00:06.022217'),
(31, 'quintet', '0013_college_collegeid', '2021-04-16 14:25:59.968896');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7m1jwrfhaih4vqlxkcpdewjlurqsk2ue', 'e30:1leem9:3XbaeJpXHh4EBCAZJLQxf30_hGTCGHuyBAS550YklmE', '2021-05-20 14:14:49.923114');

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `emailid` varchar(254) NOT NULL,
  `domain` varchar(200) NOT NULL,
  `bank_acc_number` bigint(20) NOT NULL,
  `IFSC` varchar(11) NOT NULL,
  `Pan` varchar(10) NOT NULL,
  `Bank_name` varchar(200) NOT NULL,
  `Location` varchar(200) NOT NULL,
  `fees` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trainers`
--

INSERT INTO `trainers` (`id`, `name`, `emailid`, `domain`, `bank_acc_number`, `IFSC`, `Pan`, `Bank_name`, `Location`, `fees`) VALUES
(7, 'Rhea', 'rhea.gopal3@gmail.com', 'IOT', 48756, 'SBIN', 'GJHGJ', 'SBI', 'Bangalore', 500),
(10, 'Sonika', 'sonikaprathiraj06@gmail.com', 'Web', 48746489, 'SBIN6556', 'CGHS5466', 'SBI', 'Belgaum', 500),
(14, 'Purva', 'purvarathod9@gmail.com', 'Python', 567890, 'sbn7890', 'cbc56789', 'sbi', 'bangalore', 500),
(16, 'Bhavana', 'vcbha721@gmail.com', 'Machine Learning', 748521485214, 'CNRB0002890', 'EPPBQ9415K', 'Canara', 'Bangalore', 500);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `collegename` varchar(200) NOT NULL,
  `emailid` varchar(254) NOT NULL,
  `domain` varchar(20) NOT NULL,
  `duration` int(11) NOT NULL,
  `datestart` date NOT NULL,
  `dateend` date NOT NULL,
  `food` varchar(10) NOT NULL,
  `training` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `collegename`, `emailid`, `domain`, `duration`, `datestart`, `dateend`, `food`, `training`) VALUES
(32, 'Sneha', 'RV', 'sneha@gmail.com', 'Machine Learning', 5, '2021-04-21', '2021-05-06', 'No', 'Offline'),
(42, 'Bhavana', 'SJBIT', 'vcbha721@gmail.com', 'IOT', 4, '2021-04-21', '2021-05-06', 'No', 'Offline'),
(54, 'Rhea', 'BIT', 'rhea@gmail.com', 'ML', 4, '2021-04-24', '2021-05-06', 'No', 'Offline'),
(55, 'Purva', 'sjb', 'purvarathod9@gmail.com', 'Python', 3, '2021-04-08', '2021-04-21', 'no', 'offline');

-- --------------------------------------------------------

--
-- Table structure for table `users1`
--

CREATE TABLE `users1` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `emailid` varchar(254) NOT NULL,
  `collegename` varchar(200) NOT NULL,
  `datestart` date NOT NULL,
  `dateend` date NOT NULL,
  `duration` int(11) NOT NULL,
  `training` varchar(20) NOT NULL,
  `domain` varchar(20) NOT NULL,
  `food` varchar(10) NOT NULL,
  `travel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users1`
--

INSERT INTO `users1` (`id`, `name`, `emailid`, `collegename`, `datestart`, `dateend`, `duration`, `training`, `domain`, `food`, `travel`) VALUES
(34, 'Bhavana', 'vcbha721@gmail.com', 'SJBIT', '2021-05-18', '2021-05-21', 6, 'Online', 'Machine Learning', 'No', 600),
(36, 'Bhavana', 'vcbha721@gmail.com', 'SJBIT', '2021-05-21', '2021-05-25', 6, 'Offline', 'Machine Learning', 'Yes', 500),
(40, 'Chandra', 'rchandrakala190@gmail.com', 'RVCE', '2021-05-21', '2021-05-25', 6, 'Online', 'Machine Learning', 'Yes', 600);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users1`
--
ALTER TABLE `users1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `college`
--
ALTER TABLE `college`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `users1`
--
ALTER TABLE `users1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
