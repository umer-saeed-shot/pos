-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2022 at 09:19 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_no`, `name`, `initial_balance`, `total_balance`, `note`, `is_default`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '11111', 'Sales Account', 1000, 1000, 'this is first account', 0, 1, '2018-12-18 02:58:02', '2021-12-02 17:26:41'),
(3, '21211', 'Sa', NULL, 0, NULL, 1, 1, '2018-12-18 02:58:56', '2021-12-02 17:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

CREATE TABLE `billers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billers`
--

INSERT INTO `billers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(11, '911 Gadgets', NULL, NULL, NULL, NULL, '9513997911', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-20 18:57:34', '2021-12-20 18:57:34'),
(12, '911 Gadgets Murrieta', NULL, '911 Gadgets Murrieta', NULL, NULL, '9514503451', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-20 19:37:23', '2021-12-20 19:37:23'),
(13, '911 Gadgets El Paso', NULL, 'El Paso', NULL, NULL, '9514225182', NULL, NULL, NULL, NULL, NULL, 1, '2022-01-03 12:22:39', '2022-01-03 12:22:39');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 'HP', 'HP.jpg', 0, '2018-05-12 09:06:14', '2022-01-20 05:03:25'),
(4, 'samsung', 'samsung.jpg', 0, '2018-05-12 09:08:41', '2022-01-20 05:03:25'),
(5, 'Apple', 'Apple.jpg', 0, '2018-08-31 23:34:49', '2022-01-20 05:03:25'),
(6, 'Lotto', NULL, 0, '2021-12-17 23:47:07', '2022-01-20 05:02:26'),
(7, 'None', NULL, 0, '2021-12-23 18:30:11', '2022-01-20 05:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'electronics', NULL, NULL, 1, '2018-05-12 03:35:57', '2019-03-01 15:07:21'),
(4, 'toy', NULL, NULL, 1, '2018-05-23 22:57:48', '2019-03-01 15:09:27'),
(22, 'accessories', NULL, NULL, 1, '2021-12-17 17:24:05', '2021-12-17 17:24:05'),
(23, 'food', NULL, NULL, 1, '2021-12-17 17:24:05', '2021-12-17 17:24:05'),
(24, 'Service', NULL, NULL, 1, '2021-12-20 15:58:24', '2021-12-20 15:58:24'),
(26, 'Group', NULL, NULL, 1, '2021-12-20 17:03:04', '2021-12-20 17:03:04'),
(27, 'Inventory', NULL, NULL, 1, '2021-12-20 17:03:04', '2021-12-20 17:03:04'),
(28, 'Non-Inventory', NULL, NULL, 1, '2021-12-20 17:03:06', '2021-12-20 17:03:06'),
(29, 'Special Order', NULL, NULL, 1, '2021-12-20 17:03:07', '2021-12-20 17:03:07'),
(30, '', NULL, NULL, 1, '2021-12-21 09:13:21', '2021-12-21 09:13:21'),
(31, 'elwctronics', NULL, NULL, 1, '2021-12-23 18:16:33', '2021-12-23 18:16:33');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `amount`, `minimum_amount`, `quantity`, `used`, `expired_date`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Black Friday', 'percentage', 20, 0, 100, 2, '2020-11-19', 1, 1, '2018-10-25 22:38:50', '2021-07-27 17:33:47'),
(2, 'i love Iphone', 'fixed', 200, 1000, 50, 1, '2018-12-31', 1, 1, '2018-10-27 02:59:26', '2019-03-02 05:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', 1, '2020-11-01 00:22:58', '2020-11-01 00:34:55'),
(2, 'Euro', 'Euro', 0.85, '2020-11-01 01:29:12', '2020-11-10 23:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `user_id`, `name`, `company_name`, `email`, `phone_number`, `tax_no`, `address`, `city`, `state`, `postal_code`, `country`, `deposit`, `expense`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 22, 'dhiman', 'lioncoders', 'dhiman@gmail.com', '+8801111111101', NULL, 'kajir deuri', 'chittagong', NULL, NULL, 'bd', 190, 0, 0, '2018-05-12 10:00:48', '2021-12-04 09:28:35'),
(2, 2, NULL, 'moinul', 'lioncoders', NULL, '+8801200000001', NULL, 'jamalkhan', 'chittagong', NULL, NULL, 'bd', 100, 0, 0, '2018-05-12 10:04:51', '2021-12-04 09:28:35'),
(11, 1, NULL, 'walk-in-customer', NULL, 'ashfaqdev.php@gmail.com', '01923000001', '11111', 'mohammadpur', 'dhaka', NULL, NULL, NULL, NULL, 0, 0, '2018-09-02 01:30:54', '2021-12-04 09:35:14'),
(26, 6, NULL, 'walkin', '911 Gadget', 'walkin@demo.com', '03439446591', NULL, 'xyz wales', 'Islamabad', 'wales', '44000', 'USA', NULL, NULL, 0, '2021-12-06 15:04:12', '2021-12-06 18:04:29'),
(27, 6, NULL, 'Test', '911Gadget', 'Test@gmail.com', '03333333333', NULL, 'Test', 'Test', 'Test', '44000', 'USA', NULL, NULL, 0, '2021-12-06 18:23:46', '2021-12-07 21:56:11'),
(28, 6, NULL, 'Test2', '911Gadget', 'Test2@gmail.com', '03333123456', NULL, 'Test2', 'Test2', 'Test2', 'Test2', 'Test2', NULL, NULL, 0, '2021-12-06 18:26:10', '2021-12-07 21:57:27'),
(29, 6, NULL, 'kkkk', NULL, NULL, '4444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-07 16:58:52', '2021-12-20 17:24:20'),
(30, 6, NULL, 'jjjj', NULL, NULL, '+100000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-07 17:00:01', '2021-12-20 17:24:20'),
(31, 6, NULL, 'dadf', NULL, NULL, '3237169175', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-07 21:22:04', '2021-12-20 17:24:20'),
(32, 6, NULL, 'Adrian Amrel', NULL, NULL, '9513997911', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24.99, 1, '2021-12-08 09:45:01', '2021-12-22 19:27:24'),
(33, 6, NULL, '5 Star', NULL, 'adrianlermaa@yahoo.com', '3234741986', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-20 17:45:09', '2021-12-28 19:06:09'),
(34, 6, NULL, 'Rger p', NULL, NULL, '3234545454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-20 18:06:24', '2021-12-20 18:06:24'),
(35, 6, NULL, 'Jayden', NULL, 'adrianlermaa@yahoo.com', '3236521254', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-20 18:59:42', '2021-12-20 18:59:42'),
(36, 6, NULL, 'Jayden', NULL, 'adrianlermaa@yahoo.com', '3236521254', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-20 18:59:43', '2021-12-20 18:59:43'),
(37, 6, NULL, 'Juanito', NULL, NULL, '3234545878', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-20 19:18:29', '2021-12-20 19:18:29'),
(38, 6, NULL, 'Spencer', NULL, NULL, '9514503451', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-21 14:21:11', '2021-12-21 14:21:11'),
(39, 6, NULL, 'Adrian  Gonzales', NULL, NULL, '4744545121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-22 19:28:58', '2021-12-22 19:28:58'),
(40, 6, NULL, 'Test customer', NULL, NULL, '3232145454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-22 19:29:34', '2021-12-22 19:29:34'),
(41, 6, NULL, 'mama', 'ttt', 'mama@pharma.com', '223355', NULL, 'fdsfdsf dsfsda asdfds fdsaf', 'newyork', 'Alaska', '44003', 'USA', NULL, NULL, 1, '2021-12-23 14:58:53', '2021-12-25 00:34:26'),
(42, 6, NULL, 'kaka', 'chacha', 'kaka@gmail.com', '35698745', NULL, 'xyz chachi korany', 'bundale', 'ahawadehwa', '3000', 'usa', NULL, NULL, 1, '2021-12-23 16:24:03', '2021-12-23 16:24:03'),
(43, 6, NULL, 'Rajeev Mehra', NULL, NULL, '3234741984', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-23 18:34:13', '2021-12-23 18:34:13'),
(44, 6, NULL, 'Me Test', NULL, NULL, '4548457845', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-24 14:50:43', '2021-12-24 14:50:43'),
(45, 6, NULL, 'Adrian Amrellll', NULL, NULL, '3236585458', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-24 18:41:21', '2021-12-24 18:41:21'),
(46, 6, NULL, 'Email Test customer', NULL, 'adrianlermaa@yahoo.com', '4152125214', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-24 18:44:15', '2021-12-24 18:44:15'),
(47, 6, NULL, 'Spencer', NULL, NULL, '9518169446', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-25 06:18:18', '2021-12-25 06:18:18'),
(48, 6, NULL, 'test test test', NULL, NULL, '3236565847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-26 15:28:41', '2021-12-26 15:28:41'),
(49, 6, NULL, 'Leo', NULL, NULL, '9512909952', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-27 08:11:05', '2021-12-27 08:11:05'),
(50, 6, NULL, 'javid', 'softageage', 'javidiqbals@gmail.com', '03346974159', NULL, '2nd flate meezan bank ghouri town islamabd', 'islamabad', NULL, '44000', 'Pakistan', 1500, NULL, 1, '2021-12-27 23:56:25', '2021-12-31 21:15:12'),
(51, 6, NULL, 'Adrian test NEW', '911 Gadgets', 'contact@911gadgets.com', '3235421542', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-29 03:09:03', '2021-12-29 03:09:03'),
(52, 6, NULL, 'Last Test', NULL, 'notfortheflesh@gmail.com', '3239585454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-30 16:37:02', '2021-12-30 16:37:02'),
(53, 6, NULL, 'FINAL TEST', NULL, 'notfortheflesh@gmail.com', '3234548754', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-30 16:38:05', '2021-12-30 16:38:05'),
(54, 6, NULL, 'FINAL', NULL, 'Notfortheflesh@gmail.com', '3235454545', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-30 16:38:42', '2021-12-30 16:38:42'),
(55, 6, NULL, 'Prueba', NULL, 'adrianlermaa@yahoo.com', '3235689568', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-30 16:56:00', '2021-12-30 16:56:00'),
(56, 6, NULL, 'javid iqbal', 'softagesolution', 'javidiqbals@gmail.com', '22222', NULL, 'xyz yzb islamabad pakistan', 'Islamabad', NULL, '44000', 'Pakistan', NULL, NULL, 0, '2021-12-31 17:35:22', '2021-12-31 21:14:37'),
(57, 6, NULL, 'Ali Khan', 'TSC', 'javidiqbals@gmail.com', '55555', NULL, 'xyz yzb islamabad pakistan', 'Islamabad', NULL, '44000', 'Pakistan', NULL, NULL, 0, '2021-12-31 17:45:17', '2021-12-31 21:14:04'),
(58, 6, NULL, 'New Testing', NULL, 'notfortheflesh@gmail.com', '3234444444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-01 03:53:22', '2022-01-01 03:53:22'),
(59, 6, NULL, 'Adrian', NULL, 'adrianlermaa@yahoo.com', '3232222222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-02 14:35:34', '2022-01-02 14:35:34'),
(60, 6, NULL, 'LAST TEST', NULL, 'adrianlermaa@yahoo.com', '4747454545', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-02 17:25:13', '2022-01-02 17:25:13'),
(61, 6, NULL, 'Mat', NULL, 'flkaj', '4843267438', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-07 09:41:21', '2022-01-07 09:41:21'),
(62, 6, NULL, 'Claudia', NULL, NULL, '5624758281', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-14 04:36:09', '2022-01-14 04:36:09'),
(63, 6, NULL, 'Wendy Franco', NULL, 'wfranco209@gmail.com', '3237169174', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-01-17 07:58:23', '2022-01-17 07:58:23'),
(64, 6, NULL, 'Adrian Amrel', NULL, 'cu018246@gmail.com', '3237169175', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1300, 1, '2022-01-18 08:21:15', '2022-02-03 10:39:00'),
(65, 6, NULL, 'Gregg', NULL, 'Adrianlermaa@yahoo.com', '3234987654', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, 1, '2022-01-24 19:21:37', '2022-01-25 00:15:15'),
(66, 6, NULL, 'Kenny', NULL, NULL, '3234548547', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 1, '2022-01-30 13:41:48', '2022-02-03 22:44:46'),
(67, 6, NULL, 'Steve', NULL, 'sclariv4@gmail.com', '2077190564', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-02-03 09:32:58', '2022-02-03 09:32:58'),
(68, 6, NULL, 'Donny', NULL, 'nightmaredevices@gmail.com', '2762434654', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-02-04 02:51:46', '2022-02-04 02:51:46'),
(69, 6, NULL, 'Adrian Amrelll', NULL, 'adrianlermaa@yahoo.com', '9513997912', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 350, 1, '2022-02-04 02:52:53', '2022-02-04 02:59:14'),
(70, 6, NULL, 'Arjit', NULL, 'Suru4k@gmail.com', '6143788428', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-02-11 01:16:46', '2022-02-11 01:16:46');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `percentage`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'general', '0', 0, '2018-05-12 08:09:36', '2021-12-04 12:43:21'),
(2, 'distributor', '-10', 0, '2018-05-12 08:12:14', '2021-12-04 12:43:21'),
(3, 'reseller', '5', 0, '2018-05-12 08:12:26', '2021-12-04 12:43:21'),
(6, 'General', '0', 1, '2021-12-04 12:43:39', '2021-12-04 12:43:39'),
(7, 'Business', '5', 1, '2021-12-04 12:43:52', '2021-12-04 12:43:52');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivered_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recieved_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Sale', 1, '2018-12-27 05:16:47', '2018-12-27 10:40:23'),
(3, 'Repair', 1, '2021-12-02 17:27:27', '2021-12-02 17:27:27');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone_number`, `department_id`, `user_id`, `image`, `address`, `city`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(4, 'Adrian Amrel', 'adrianamrel@yahoo.com', '3237169174', 3, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-20 17:33:43', '2021-12-20 17:33:43');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `code`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '16718342', 'washing', 1, '2018-08-16 00:32:48', '2019-03-02 07:02:07'),
(2, '60128975', 'electric bill', 1, '2018-08-16 00:39:18', '2018-08-16 00:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_access` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `developed_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_logo`, `currency`, `staff_access`, `date_format`, `developed_by`, `invoice_format`, `state`, `theme`, `created_at`, `updated_at`, `currency_position`) VALUES
(1, 'My track', 'open.png', '1', 'own', 'm-d-Y', '911 Gadgets, LLC', 'standard', 1, 'default.css', '2020-12-01 07:13:11', '2021-12-20 17:53:31', 'prefix');

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `card_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_recharges`
--

CREATE TABLE `gift_card_recharges` (
  `id` int(10) UNSIGNED NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrm_settings`
--

CREATE TABLE `hrm_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `checkin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, 'en', '2018-07-07 22:59:17', '2019-12-24 17:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_17_060412_create_categories_table', 1),
(4, '2018_02_20_035727_create_brands_table', 1),
(5, '2018_02_25_100635_create_suppliers_table', 1),
(6, '2018_02_27_101619_create_warehouse_table', 1),
(7, '2018_03_03_040448_create_units_table', 1),
(8, '2018_03_04_041317_create_taxes_table', 1),
(9, '2018_03_10_061915_create_customer_groups_table', 1),
(10, '2018_03_10_090534_create_customers_table', 1),
(11, '2018_03_11_095547_create_billers_table', 1),
(12, '2018_04_05_054401_create_products_table', 1),
(13, '2018_04_06_133606_create_purchases_table', 1),
(14, '2018_04_06_154600_create_product_purchases_table', 1),
(15, '2018_04_06_154915_create_product_warhouse_table', 1),
(16, '2018_04_10_085927_create_sales_table', 1),
(17, '2018_04_10_090133_create_product_sales_table', 1),
(18, '2018_04_10_090254_create_payments_table', 1),
(19, '2018_04_10_090341_create_payment_with_cheque_table', 1),
(20, '2018_04_10_090509_create_payment_with_credit_card_table', 1),
(21, '2018_04_13_121436_create_quotation_table', 1),
(22, '2018_04_13_122324_create_product_quotation_table', 1),
(23, '2018_04_14_121802_create_transfers_table', 1),
(24, '2018_04_14_121913_create_product_transfer_table', 1),
(25, '2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table', 2),
(26, '2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table', 3),
(27, '2018_05_20_054532_create_adjustments_table', 4),
(28, '2018_05_20_054859_create_product_adjustments_table', 4),
(29, '2018_05_21_163419_create_returns_table', 5),
(30, '2018_05_21_163443_create_product_returns_table', 5),
(31, '2018_06_02_050905_create_roles_table', 6),
(32, '2018_06_02_073430_add_columns_to_users_table', 7),
(33, '2018_06_03_053738_create_permission_tables', 8),
(36, '2018_06_21_063736_create_pos_setting_table', 9),
(37, '2018_06_21_094155_add_user_id_to_sales_table', 10),
(38, '2018_06_21_101529_add_user_id_to_purchases_table', 11),
(39, '2018_06_21_103512_add_user_id_to_transfers_table', 12),
(40, '2018_06_23_061058_add_user_id_to_quotations_table', 13),
(41, '2018_06_23_082427_add_is_deleted_to_users_table', 14),
(42, '2018_06_25_043308_change_email_to_users_table', 15),
(43, '2018_07_06_115449_create_general_settings_table', 16),
(44, '2018_07_08_043944_create_languages_table', 17),
(45, '2018_07_11_102144_add_user_id_to_returns_table', 18),
(46, '2018_07_11_102334_add_user_id_to_payments_table', 18),
(47, '2018_07_22_130541_add_digital_to_products_table', 19),
(49, '2018_07_24_154250_create_deliveries_table', 20),
(50, '2018_08_16_053336_create_expense_categories_table', 21),
(51, '2018_08_17_115415_create_expenses_table', 22),
(55, '2018_08_18_050418_create_gift_cards_table', 23),
(56, '2018_08_19_063119_create_payment_with_gift_card_table', 24),
(57, '2018_08_25_042333_create_gift_card_recharges_table', 25),
(58, '2018_08_25_101354_add_deposit_expense_to_customers_table', 26),
(59, '2018_08_26_043801_create_deposits_table', 27),
(60, '2018_09_02_044042_add_keybord_active_to_pos_setting_table', 28),
(61, '2018_09_09_092713_create_payment_with_paypal_table', 29),
(62, '2018_09_10_051254_add_currency_to_general_settings_table', 30),
(63, '2018_10_22_084118_add_biller_and_store_id_to_users_table', 31),
(65, '2018_10_26_034927_create_coupons_table', 32),
(66, '2018_10_27_090857_add_coupon_to_sales_table', 33),
(67, '2018_11_07_070155_add_currency_position_to_general_settings_table', 34),
(68, '2018_11_19_094650_add_combo_to_products_table', 35),
(69, '2018_12_09_043712_create_accounts_table', 36),
(70, '2018_12_17_112253_add_is_default_to_accounts_table', 37),
(71, '2018_12_19_103941_add_account_id_to_payments_table', 38),
(72, '2018_12_20_065900_add_account_id_to_expenses_table', 39),
(73, '2018_12_20_082753_add_account_id_to_returns_table', 40),
(74, '2018_12_26_064330_create_return_purchases_table', 41),
(75, '2018_12_26_144210_create_purchase_product_return_table', 42),
(76, '2018_12_26_144708_create_purchase_product_return_table', 43),
(77, '2018_12_27_110018_create_departments_table', 44),
(78, '2018_12_30_054844_create_employees_table', 45),
(79, '2018_12_31_125210_create_payrolls_table', 46),
(80, '2018_12_31_150446_add_department_id_to_employees_table', 47),
(81, '2019_01_01_062708_add_user_id_to_expenses_table', 48),
(82, '2019_01_02_075644_create_hrm_settings_table', 49),
(83, '2019_01_02_090334_create_attendances_table', 50),
(84, '2019_01_27_160956_add_three_columns_to_general_settings_table', 51),
(85, '2019_02_15_183303_create_stock_counts_table', 52),
(86, '2019_02_17_101604_add_is_adjusted_to_stock_counts_table', 53),
(87, '2019_04_13_101707_add_tax_no_to_customers_table', 54),
(89, '2019_10_14_111455_create_holidays_table', 55),
(90, '2019_11_13_145619_add_is_variant_to_products_table', 56),
(91, '2019_11_13_150206_create_product_variants_table', 57),
(92, '2019_11_13_153828_create_variants_table', 57),
(93, '2019_11_25_134041_add_qty_to_product_variants_table', 58),
(94, '2019_11_25_134922_add_variant_id_to_product_purchases_table', 58),
(95, '2019_11_25_145341_add_variant_id_to_product_warehouse_table', 58),
(96, '2019_11_29_182201_add_variant_id_to_product_sales_table', 59),
(97, '2019_12_04_121311_add_variant_id_to_product_quotation_table', 60),
(98, '2019_12_05_123802_add_variant_id_to_product_transfer_table', 61),
(100, '2019_12_08_114954_add_variant_id_to_product_returns_table', 62),
(101, '2019_12_08_203146_add_variant_id_to_purchase_product_return_table', 63),
(102, '2020_02_28_103340_create_money_transfers_table', 64),
(103, '2020_07_01_193151_add_image_to_categories_table', 65),
(105, '2020_09_26_130426_add_user_id_to_deliveries_table', 66),
(107, '2020_10_11_125457_create_cash_registers_table', 67),
(108, '2020_10_13_155019_add_cash_register_id_to_sales_table', 68),
(109, '2020_10_13_172624_add_cash_register_id_to_returns_table', 69),
(110, '2020_10_17_212338_add_cash_register_id_to_payments_table', 70),
(111, '2020_10_18_124200_add_cash_register_id_to_expenses_table', 71),
(112, '2020_10_21_121632_add_developed_by_to_general_settings_table', 72),
(113, '2019_08_19_000000_create_failed_jobs_table', 73),
(114, '2020_10_30_135557_create_notifications_table', 73),
(115, '2020_11_01_044954_create_currencies_table', 74),
(116, '2020_11_01_140736_add_price_to_product_warehouse_table', 75),
(117, '2020_11_02_050633_add_is_diff_price_to_products_table', 76),
(118, '2020_11_09_055222_add_user_id_to_customers_table', 77),
(119, '2020_11_17_054806_add_invoice_format_to_general_settings_table', 78);

-- --------------------------------------------------------

--
-- Table structure for table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('249beded-5431-40a3-ba1e-d255ffb047a3', 'App\\Notifications\\SendNotification', 'App\\User', 9, '{\"message\":\"Please delete all pending purchase.\"}', '2020-11-01 01:33:32', '2020-11-01 01:33:07', '2020-11-01 01:33:32'),
('5870cb87-9ff6-4364-833c-8d5911ee2001', 'App\\Notifications\\SendNotification', 'App\\User', 38, '{\"message\":\"Hey bro\"}', NULL, '2021-12-24 19:18:33', '2021-12-24 19:18:33'),
('60df3140-0014-496c-867c-de5cb216a54f', 'App\\Notifications\\SendNotification', 'App\\User', 37, '{\"message\":\"Hey bro\"}', NULL, '2021-12-24 19:17:44', '2021-12-24 19:17:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `change` double NOT NULL,
  `paying_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_reference`, `user_id`, `purchase_id`, `sale_id`, `cash_register_id`, `account_id`, `amount`, `change`, `paying_method`, `payment_note`, `created_at`, `updated_at`) VALUES
(1, 'spr-20220118-114744', 46, NULL, 2, NULL, 3, 350, -250, 'Cash', NULL, '2022-01-19 06:47:44', '2022-01-19 06:47:44'),
(2, 'spr-20220119-121151', 46, NULL, 3, NULL, 3, 350, -250, 'Cash', NULL, '2022-01-19 07:11:51', '2022-01-19 07:11:51'),
(3, 'spr-20220119-121425', 46, NULL, 4, NULL, 3, 350, -250, 'Deposit', NULL, '2022-01-19 07:14:25', '2022-01-19 07:14:25'),
(6, 'spr-20220119-121809', 46, NULL, 7, NULL, 3, 350, -250, 'Cash', NULL, '2022-01-19 07:18:09', '2022-01-19 07:18:09'),
(7, 'spr-20220119-122234', 46, NULL, 8, NULL, 3, 350, -150, 'Cash', NULL, '2022-01-19 07:22:34', '2022-01-19 07:22:34'),
(10, 'spr-20220119-123336', 46, NULL, 11, NULL, 3, 350, 0, 'Cash', NULL, '2022-01-19 07:33:36', '2022-01-19 07:33:36'),
(11, 'spr-20220119-123336', 46, NULL, 12, NULL, 3, 350, 0, 'Cash', NULL, '2022-01-19 07:33:36', '2022-01-19 07:33:36'),
(12, 'spr-20220119-123846', 46, NULL, 13, NULL, 3, 350, -150, 'Cash', NULL, '2022-01-19 07:38:46', '2022-01-19 07:38:46'),
(13, 'ppr-20220120-102900', 44, 3, NULL, NULL, 3, 0, 0, 'Cash', NULL, '2022-01-20 17:29:00', '2022-01-20 17:29:00'),
(15, 'ppr-20220120-060106', 1, 3, NULL, NULL, 3, 1500, 0, 'Cash', NULL, '2022-01-21 01:01:06', '2022-01-21 01:01:06'),
(16, 'ppr-20220120-060123', 1, 2, NULL, NULL, 3, 600, 0, 'Cash', NULL, '2022-01-21 01:01:23', '2022-01-21 01:01:23'),
(17, 'ppr-20220120-060632', 1, 6, NULL, NULL, 3, 1500, 0, 'Cash', NULL, '2022-01-21 01:06:32', '2022-01-21 01:06:32'),
(18, 'ppr-20220120-060654', 1, 5, NULL, NULL, 3, 750, 0, 'Cash', NULL, '2022-01-21 01:06:54', '2022-01-21 01:06:54'),
(19, 'ppr-20220120-061641', 1, 8, NULL, NULL, 3, 240, 0, 'Cash', NULL, '2022-01-21 01:16:41', '2022-01-21 01:16:41'),
(20, 'ppr-20220120-061704', 1, 7, NULL, NULL, 3, 216, 0, 'Cash', NULL, '2022-01-21 01:17:04', '2022-01-21 01:17:04'),
(21, 'spr-20220121-055325', 44, NULL, 14, NULL, 3, 350, 0, 'Cash', NULL, '2022-01-22 00:53:25', '2022-01-22 00:53:25'),
(22, 'spr-20220121-061232', 44, NULL, 16, NULL, 3, 350, -314, 'Cash', NULL, '2022-01-22 01:12:32', '2022-01-22 01:12:32'),
(23, 'spr-20220121-063204', 44, NULL, 17, NULL, 3, 350, -150, 'Credit Card', NULL, '2022-01-22 01:32:04', '2022-01-22 01:32:04'),
(24, 'spr-20220124-120245', 44, NULL, 20, NULL, 3, 350, -250, 'Cash', NULL, '2022-01-24 19:02:45', '2022-01-24 19:02:45'),
(25, 'spr-20220124-120400', 44, NULL, 21, NULL, 3, 350, 0, 'Cash', NULL, '2022-01-24 19:04:00', '2022-01-24 19:04:00'),
(26, 'spr-20220124-120657', 44, NULL, 22, NULL, 3, 350, -250, 'Cash', NULL, '2022-01-24 19:06:57', '2022-01-24 19:06:57'),
(27, 'spr-20220124-120742', 44, NULL, 23, NULL, 3, 350, 0, 'Cash', NULL, '2022-01-24 19:07:42', '2022-01-24 19:07:42'),
(28, 'spr-20220124-121047', 44, NULL, 25, NULL, 3, 350, 0, 'Cash', NULL, '2022-01-24 19:10:47', '2022-01-24 19:10:47'),
(29, 'spr-20220124-121119', 44, NULL, 26, NULL, 3, 350, -250, 'Cash', NULL, '2022-01-24 19:11:19', '2022-01-24 19:11:19'),
(30, 'spr-20220124-125026', 44, NULL, 27, NULL, 3, 18, 0, 'Cash', NULL, '2022-01-24 19:50:26', '2022-01-24 19:50:26'),
(31, 'spr-20220124-040325', 44, NULL, 28, NULL, 3, 350, 0, 'Credit Card', NULL, '2022-01-24 23:03:25', '2022-01-24 23:03:25'),
(32, 'spr-20220124-044645', 44, NULL, 29, NULL, 3, 18, 0, 'Deposit', NULL, '2022-01-24 23:46:45', '2022-01-24 23:46:45'),
(33, 'spr-20220124-050436', 44, NULL, 30, NULL, 3, 18, 0, 'Deposit', NULL, '2022-01-25 00:04:36', '2022-01-25 00:04:36'),
(34, 'spr-20220124-051515', 44, NULL, 31, NULL, 3, 18, 0, 'Deposit', NULL, '2022-01-25 00:15:15', '2022-01-25 00:15:15'),
(35, 'spr-20220124-073349', 44, NULL, 32, NULL, 3, 350, -250, 'Credit Card', NULL, '2022-01-25 02:33:49', '2022-01-25 02:33:49'),
(36, 'spr-20220124-073805', 44, NULL, 33, NULL, 3, 350, -250, 'Deposit', NULL, '2022-01-25 02:38:05', '2022-01-25 02:38:05'),
(37, 'spr-20220125-121636', 44, NULL, 34, NULL, 3, 350, -150, 'Deposit', NULL, '2022-01-25 07:16:36', '2022-01-25 07:16:36'),
(38, 'spr-20220126-083634', 44, NULL, 35, NULL, 3, 350, -150, 'Card', NULL, '2022-01-27 03:36:34', '2022-01-27 03:36:34'),
(39, 'spr-20220127-072617', 44, NULL, 36, NULL, 3, 350, -250, 'Cash', NULL, '2022-01-27 14:26:17', '2022-01-27 14:26:17'),
(40, 'spr-20220128-095014', 44, NULL, 37, NULL, 3, 350, -250, 'Card', NULL, '2022-01-29 04:50:14', '2022-01-29 04:50:14'),
(41, 'spr-20220130-113353', 44, NULL, 39, NULL, 3, 350, -250, 'Card', NULL, '2022-01-30 18:33:53', '2022-01-30 18:33:53'),
(42, 'spr-20220130-113434', 44, NULL, 40, NULL, 3, 350, -250, 'Card', NULL, '2022-01-30 18:34:34', '2022-01-30 18:34:34'),
(43, 'spr-20220130-110542', 44, NULL, 41, NULL, 3, 350, -250, 'Card', NULL, '2022-01-31 06:05:42', '2022-01-31 06:05:42'),
(46, 'spr-20220201-112957', 44, NULL, 43, NULL, 3, 350, -250, 'Card', NULL, '2022-02-02 06:29:57', '2022-02-02 06:29:57'),
(47, 'spr-20220202-091504', 44, NULL, 45, NULL, 3, 10, 8, 'Cash', NULL, '2022-02-02 16:15:04', '2022-02-02 16:15:04'),
(48, 'spr-20220202-100202', 44, NULL, 46, NULL, 3, 50, 300, 'Cash', NULL, '2022-02-02 17:02:02', '2022-02-02 17:02:02'),
(49, 'spr-20220202-082909', 44, NULL, 47, NULL, 3, 350, -150, 'Card', NULL, '2022-02-03 03:29:09', '2022-02-03 03:29:09'),
(50, 'spr-20220203-023517', 44, NULL, 48, NULL, 3, 350, -250, 'Card', NULL, '2022-02-03 09:35:17', '2022-02-03 09:35:17'),
(51, 'spr-20220203-032956', 44, NULL, 49, NULL, 3, 100, 250, 'Card', NULL, '2022-02-03 10:29:56', '2022-02-03 10:29:56'),
(52, 'spr-20220203-033900', 44, NULL, 49, NULL, 3, 250, 0, 'Deposit', NULL, '2022-02-03 10:39:00', '2022-02-03 10:39:00'),
(53, 'spr-20220203-033838', 44, NULL, 50, NULL, 3, 10, 340, 'Cash', NULL, '2022-02-03 22:38:38', '2022-02-03 22:38:38'),
(54, 'spr-20220203-034444', 44, NULL, 44, NULL, 3, 18, 0, 'Deposit', NULL, '2022-02-03 22:44:44', '2022-02-03 22:44:44'),
(55, 'spr-20220203-034445', 44, NULL, 44, NULL, 3, 18, 0, 'Deposit', NULL, '2022-02-03 22:44:45', '2022-02-03 22:44:45'),
(56, 'spr-20220203-075739', 44, NULL, 52, NULL, 3, 100, 250, 'Card', NULL, '2022-02-04 02:57:39', '2022-02-04 02:57:39'),
(57, 'spr-20220203-075914', 44, NULL, 53, NULL, 3, 350, 0, 'Deposit', NULL, '2022-02-04 02:59:14', '2022-02-04 02:59:14'),
(58, 'spr-20220203-080357', 44, NULL, 54, NULL, 3, 450, 0, 'Card', NULL, '2022-02-04 03:03:57', '2022-02-04 03:03:57'),
(59, 'spr-20220210-061825', 44, NULL, 55, NULL, 3, 350, 0, 'Card', NULL, '2022-02-11 01:18:25', '2022-02-11 01:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_cheque`
--

CREATE TABLE `payment_with_cheque` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_credit_card`
--

CREATE TABLE `payment_with_credit_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_with_credit_card`
--

INSERT INTO `payment_with_credit_card` (`id`, `payment_id`, `customer_id`, `customer_stripe_id`, `charge_id`, `created_at`, `updated_at`) VALUES
(1, 23, 64, '64', NULL, '2022-01-22 01:32:04', '2022-01-22 01:32:04'),
(2, 31, 65, '65', '2211', '2022-01-24 23:03:25', '2022-01-24 23:03:25'),
(3, 35, 64, '64', NULL, '2022-01-25 02:33:49', '2022-01-25 02:33:49'),
(4, 38, 64, '64', NULL, '2022-01-27 03:36:34', '2022-01-27 03:36:34'),
(5, 40, 64, '64', NULL, '2022-01-29 04:50:14', '2022-01-29 04:50:14'),
(6, 41, 66, '66', NULL, '2022-01-30 18:33:53', '2022-01-30 18:33:53'),
(7, 42, 64, '64', NULL, '2022-01-30 18:34:34', '2022-01-30 18:34:34'),
(8, 43, 64, '64', NULL, '2022-01-31 06:05:42', '2022-01-31 06:05:42'),
(9, 46, 64, '64', NULL, '2022-02-02 06:29:57', '2022-02-02 06:29:57'),
(10, 49, 64, '64', NULL, '2022-02-03 03:29:09', '2022-02-03 03:29:09'),
(11, 50, 64, '64', NULL, '2022-02-03 09:35:17', '2022-02-03 09:35:17'),
(12, 51, 64, '64', NULL, '2022-02-03 10:29:56', '2022-02-03 10:29:56'),
(13, 56, 69, '69', NULL, '2022-02-04 02:57:39', '2022-02-04 02:57:39'),
(14, 58, 69, '69', NULL, '2022-02-04 03:03:57', '2022-02-04 03:03:57'),
(15, 59, 70, '70', NULL, '2022-02-11 01:18:25', '2022-02-11 01:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_gift_card`
--

CREATE TABLE `payment_with_gift_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_paypal`
--

CREATE TABLE `payment_with_paypal` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(4, 'products-edit', 'web', '2018-06-03 01:00:09', '2018-06-03 01:00:09'),
(5, 'products-delete', 'web', '2018-06-03 22:54:22', '2018-06-03 22:54:22'),
(6, 'products-add', 'web', '2018-06-04 00:34:14', '2018-06-04 00:34:14'),
(7, 'products-index', 'web', '2018-06-04 03:34:27', '2018-06-04 03:34:27'),
(8, 'purchases-index', 'web', '2018-06-04 08:03:19', '2018-06-04 08:03:19'),
(9, 'purchases-add', 'web', '2018-06-04 08:12:25', '2018-06-04 08:12:25'),
(10, 'purchases-edit', 'web', '2018-06-04 09:47:36', '2018-06-04 09:47:36'),
(11, 'purchases-delete', 'web', '2018-06-04 09:47:36', '2018-06-04 09:47:36'),
(12, 'sales-index', 'web', '2018-06-04 10:49:08', '2018-06-04 10:49:08'),
(13, 'sales-add', 'web', '2018-06-04 10:49:52', '2018-06-04 10:49:52'),
(14, 'sales-edit', 'web', '2018-06-04 10:49:52', '2018-06-04 10:49:52'),
(15, 'sales-delete', 'web', '2018-06-04 10:49:53', '2018-06-04 10:49:53'),
(16, 'quotes-index', 'web', '2018-06-04 22:05:10', '2018-06-04 22:05:10'),
(17, 'quotes-add', 'web', '2018-06-04 22:05:10', '2018-06-04 22:05:10'),
(18, 'quotes-edit', 'web', '2018-06-04 22:05:10', '2018-06-04 22:05:10'),
(19, 'quotes-delete', 'web', '2018-06-04 22:05:10', '2018-06-04 22:05:10'),
(20, 'transfers-index', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(21, 'transfers-add', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(22, 'transfers-edit', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(23, 'transfers-delete', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(24, 'returns-index', 'web', '2018-06-04 22:50:24', '2018-06-04 22:50:24'),
(25, 'returns-add', 'web', '2018-06-04 22:50:24', '2018-06-04 22:50:24'),
(26, 'returns-edit', 'web', '2018-06-04 22:50:25', '2018-06-04 22:50:25'),
(27, 'returns-delete', 'web', '2018-06-04 22:50:25', '2018-06-04 22:50:25'),
(28, 'customers-index', 'web', '2018-06-04 23:15:54', '2018-06-04 23:15:54'),
(29, 'customers-add', 'web', '2018-06-04 23:15:55', '2018-06-04 23:15:55'),
(30, 'customers-edit', 'web', '2018-06-04 23:15:55', '2018-06-04 23:15:55'),
(31, 'customers-delete', 'web', '2018-06-04 23:15:55', '2018-06-04 23:15:55'),
(32, 'suppliers-index', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(33, 'suppliers-add', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(34, 'suppliers-edit', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(35, 'suppliers-delete', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(36, 'product-report', 'web', '2018-06-24 23:05:33', '2018-06-24 23:05:33'),
(37, 'purchase-report', 'web', '2018-06-24 23:24:56', '2018-06-24 23:24:56'),
(38, 'sale-report', 'web', '2018-06-24 23:33:13', '2018-06-24 23:33:13'),
(39, 'customer-report', 'web', '2018-06-24 23:36:51', '2018-06-24 23:36:51'),
(40, 'due-report', 'web', '2018-06-24 23:39:52', '2018-06-24 23:39:52'),
(41, 'users-index', 'web', '2018-06-25 00:00:10', '2018-06-25 00:00:10'),
(42, 'users-add', 'web', '2018-06-25 00:00:10', '2018-06-25 00:00:10'),
(43, 'users-edit', 'web', '2018-06-25 00:01:30', '2018-06-25 00:01:30'),
(44, 'users-delete', 'web', '2018-06-25 00:01:30', '2018-06-25 00:01:30'),
(45, 'profit-loss', 'web', '2018-07-14 21:50:05', '2018-07-14 21:50:05'),
(46, 'best-seller', 'web', '2018-07-14 22:01:38', '2018-07-14 22:01:38'),
(47, 'daily-sale', 'web', '2018-07-14 22:24:21', '2018-07-14 22:24:21'),
(48, 'monthly-sale', 'web', '2018-07-14 22:30:41', '2018-07-14 22:30:41'),
(49, 'daily-purchase', 'web', '2018-07-14 22:36:46', '2018-07-14 22:36:46'),
(50, 'monthly-purchase', 'web', '2018-07-14 22:48:17', '2018-07-14 22:48:17'),
(51, 'payment-report', 'web', '2018-07-14 23:10:41', '2018-07-14 23:10:41'),
(52, 'warehouse-stock-report', 'web', '2018-07-14 23:16:55', '2018-07-14 23:16:55'),
(53, 'product-qty-alert', 'web', '2018-07-14 23:33:21', '2018-07-14 23:33:21'),
(54, 'supplier-report', 'web', '2018-07-30 03:00:01', '2018-07-30 03:00:01'),
(55, 'expenses-index', 'web', '2018-09-05 01:07:10', '2018-09-05 01:07:10'),
(56, 'expenses-add', 'web', '2018-09-05 01:07:10', '2018-09-05 01:07:10'),
(57, 'expenses-edit', 'web', '2018-09-05 01:07:10', '2018-09-05 01:07:10'),
(58, 'expenses-delete', 'web', '2018-09-05 01:07:11', '2018-09-05 01:07:11'),
(59, 'general_setting', 'web', '2018-10-19 23:10:04', '2018-10-19 23:10:04'),
(60, 'mail_setting', 'web', '2018-10-19 23:10:04', '2018-10-19 23:10:04'),
(61, 'pos_setting', 'web', '2018-10-19 23:10:04', '2018-10-19 23:10:04'),
(62, 'hrm_setting', 'web', '2019-01-02 10:30:23', '2019-01-02 10:30:23'),
(63, 'purchase-return-index', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(64, 'purchase-return-add', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(65, 'purchase-return-edit', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(66, 'purchase-return-delete', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(67, 'account-index', 'web', '2019-01-02 22:06:13', '2019-01-02 22:06:13'),
(68, 'balance-sheet', 'web', '2019-01-02 22:06:14', '2019-01-02 22:06:14'),
(69, 'account-statement', 'web', '2019-01-02 22:06:14', '2019-01-02 22:06:14'),
(70, 'department', 'web', '2019-01-02 22:30:01', '2019-01-02 22:30:01'),
(71, 'attendance', 'web', '2019-01-02 22:30:01', '2019-01-02 22:30:01'),
(72, 'payroll', 'web', '2019-01-02 22:30:01', '2019-01-02 22:30:01'),
(73, 'employees-index', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(74, 'employees-add', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(75, 'employees-edit', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(76, 'employees-delete', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(77, 'user-report', 'web', '2019-01-16 06:48:18', '2019-01-16 06:48:18'),
(78, 'stock_count', 'web', '2019-02-17 10:32:01', '2019-02-17 10:32:01'),
(79, 'adjustment', 'web', '2019-02-17 10:32:02', '2019-02-17 10:32:02'),
(80, 'sms_setting', 'web', '2019-02-22 05:18:03', '2019-02-22 05:18:03'),
(81, 'create_sms', 'web', '2019-02-22 05:18:03', '2019-02-22 05:18:03'),
(82, 'print_barcode', 'web', '2019-03-07 05:02:19', '2019-03-07 05:02:19'),
(83, 'empty_database', 'web', '2019-03-07 05:02:19', '2019-03-07 05:02:19'),
(84, 'customer_group', 'web', '2019-03-07 05:37:15', '2019-03-07 05:37:15'),
(85, 'unit', 'web', '2019-03-07 05:37:15', '2019-03-07 05:37:15'),
(86, 'tax', 'web', '2019-03-07 05:37:15', '2019-03-07 05:37:15'),
(87, 'gift_card', 'web', '2019-03-07 06:29:38', '2019-03-07 06:29:38'),
(88, 'coupon', 'web', '2019-03-07 06:29:38', '2019-03-07 06:29:38'),
(89, 'holiday', 'web', '2019-10-19 08:57:15', '2019-10-19 08:57:15'),
(90, 'warehouse-report', 'web', '2019-10-22 06:00:23', '2019-10-22 06:00:23'),
(91, 'warehouse', 'web', '2020-02-26 06:47:32', '2020-02-26 06:47:32'),
(92, 'brand', 'web', '2020-02-26 06:59:59', '2020-02-26 06:59:59'),
(93, 'billers-index', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(94, 'billers-add', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(95, 'billers-edit', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(96, 'billers-delete', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(97, 'money-transfer', 'web', '2020-03-02 05:41:48', '2020-03-02 05:41:48'),
(98, 'category', 'web', '2020-07-13 12:13:16', '2020-07-13 12:13:16'),
(99, 'delivery', 'web', '2020-07-13 12:13:16', '2020-07-13 12:13:16'),
(100, 'send_notification', 'web', '2020-10-31 06:21:31', '2020-10-31 06:21:31'),
(101, 'today_sale', 'web', '2020-10-31 06:57:04', '2020-10-31 06:57:04'),
(102, 'today_profit', 'web', '2020-10-31 06:57:04', '2020-10-31 06:57:04'),
(103, 'currency', 'web', '2020-11-09 00:23:11', '2020-11-09 00:23:11'),
(104, 'backup_database', 'web', '2020-11-15 00:16:55', '2020-11-15 00:16:55');

-- --------------------------------------------------------

--
-- Table structure for table `pos_setting`
--

CREATE TABLE `pos_setting` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `stripe_public_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_setting`
--

INSERT INTO `pos_setting` (`id`, `customer_id`, `warehouse_id`, `biller_id`, `product_number`, `keybord_active`, `stripe_public_key`, `stripe_secret_key`, `created_at`, `updated_at`) VALUES
(1, 32, 9, 11, 4, 0, 'pk_test_ITN7KOYiIsHSCQ0UMRcgaYUB', 'sk_test_TtQQaawhEYRwa3mU9CzttrEy', '2018-09-02 03:17:04', '2021-12-20 23:31:40');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbology` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `cost` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `product_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `type`, `barcode_symbology`, `brand_id`, `category_id`, `unit_id`, `purchase_unit_id`, `sale_unit_id`, `cost`, `price`, `qty`, `alert_quantity`, `promotion`, `promotion_price`, `starting_date`, `last_date`, `tax_id`, `tax_method`, `image`, `file`, `is_variant`, `is_diffPrice`, `featured`, `product_list`, `qty_list`, `price_list`, `product_details`, `is_active`, `created_at`, `updated_at`) VALUES
(1457, 'Mouse', '24551960', 'standard', 'C128', 3, 22, 1, 1, 1, '2.00', '5', 0, 2, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '2021-12-31 22:29:31', '2022-01-01 03:33:52'),
(1458, '10/ X Screen Protector', '1', 'standard', 'C128', 7, 27, 1, 1, 1, '1.00', '24.99', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Iphone Tempered Glass', 0, '2022-01-01 03:34:00', '2022-01-15 15:03:40'),
(1459, '7 screen', '401', 'standard', 'C128', 7, 27, 1, 1, 1, '17.00', '79.99', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'I phone 7 screen change', 0, '2022-01-01 03:34:00', '2022-01-15 15:03:43'),
(1460, 'iPhone X', '70369482', 'standard', 'C128', NULL, 2, 1, 1, 1, '100.00', '350', 31, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, 1, NULL, NULL, NULL, '', 1, '2022-01-19 04:20:18', '2022-02-11 01:18:25'),
(1461, 'y screen', '19507625', 'standard', 'C128', NULL, 2, 1, 1, 1, '12.00', '18', 37, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-01-21 01:10:05', '2022-02-02 16:15:04'),
(1462, 'iPhone 14 Pro Max', '39801335', 'standard', 'C128', NULL, 27, 1, 1, 1, '200.00', '450', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>Iphone Screen&nbsp;</p>', 1, '2022-02-04 03:02:37', '2022-02-04 03:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `product_adjustments`
--

CREATE TABLE `product_adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_purchases`
--

CREATE TABLE `product_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_purchases`
--

INSERT INTO `product_purchases` (`id`, `purchase_id`, `product_id`, `variant_id`, `qty`, `recieved`, `purchase_unit_id`, `net_unit_cost`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(2, 2, 1460, NULL, 4, 4, 1, 150, 0, 0, 0, 600, '2022-01-19 06:42:37', '2022-01-19 06:42:37'),
(3, 3, 1460, NULL, 10, 10, 1, 150, 0, 0, 0, 1500, '2022-01-19 07:19:10', '2022-01-19 07:19:10'),
(5, 5, 1460, NULL, 5, 5, 1, 150, 0, 0, 0, 750, '2022-01-21 01:03:04', '2022-01-21 01:03:04'),
(6, 6, 1460, NULL, 10, 10, 1, 150, 0, 0, 0, 1500, '2022-01-21 01:04:34', '2022-01-21 01:04:34'),
(7, 7, 1461, NULL, 18, 18, 1, 12, 0, 0, 0, 216, '2022-01-21 01:11:10', '2022-01-21 01:11:10'),
(8, 8, 1461, NULL, 20, 20, 1, 12, 0, 0, 0, 240, '2022-01-21 01:11:54', '2022-01-21 01:11:54'),
(9, 9, 1461, NULL, 5, 5, 1, 12, 0, 0, 0, 60, '2022-01-21 02:10:03', '2022-01-21 02:10:03'),
(10, 10, 1460, NULL, 10, 10, 1, 120, 0, 0, 0, 1200, '2022-02-03 09:39:25', '2022-02-03 09:39:25'),
(11, 11, 1460, NULL, 10, 10, 1, 100, 0, 0, 0, 1000, '2022-02-04 03:01:01', '2022-02-04 03:01:01'),
(12, 12, 1462, NULL, 2, 2, 1, 200, 0, 0, 0, 400, '2022-02-04 03:03:33', '2022-02-04 03:03:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_quotation`
--

CREATE TABLE `product_quotation` (
  `id` int(10) UNSIGNED NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_returns`
--

CREATE TABLE `product_returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sales`
--

CREATE TABLE `product_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sales`
--

INSERT INTO `product_sales` (`id`, `sale_id`, `product_id`, `variant_id`, `qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(2, 2, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-19 06:47:44', '2022-01-19 06:47:44'),
(3, 3, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-19 07:11:51', '2022-01-19 07:11:51'),
(4, 4, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-19 07:14:24', '2022-01-19 07:14:24'),
(7, 7, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-19 07:18:09', '2022-01-19 07:18:09'),
(8, 8, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-19 07:22:27', '2022-01-19 07:22:27'),
(11, 11, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-19 07:33:35', '2022-01-19 07:33:35'),
(12, 12, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-19 07:33:36', '2022-01-19 07:33:36'),
(13, 13, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-19 07:38:46', '2022-01-19 07:38:46'),
(14, 14, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-22 00:53:24', '2022-01-22 00:53:24'),
(16, 16, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-22 01:12:32', '2022-01-22 01:12:32'),
(17, 17, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-22 01:32:04', '2022-01-22 01:32:04'),
(19, 19, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-24 19:00:08', '2022-01-24 19:00:08'),
(20, 20, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-24 19:02:45', '2022-01-24 19:02:45'),
(21, 21, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-24 19:03:59', '2022-01-24 19:03:59'),
(22, 22, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-24 19:06:57', '2022-01-24 19:06:57'),
(23, 23, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-24 19:07:42', '2022-01-24 19:07:42'),
(25, 25, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-24 19:10:47', '2022-01-24 19:10:47'),
(26, 26, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-24 19:11:19', '2022-01-24 19:11:19'),
(27, 27, 1461, NULL, 1, 1, 18, 0, 0, 0, 18, '2022-01-24 19:50:26', '2022-01-24 19:50:26'),
(28, 28, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-24 23:03:25', '2022-01-24 23:03:25'),
(29, 29, 1461, NULL, 1, 1, 18, 0, 0, 0, 18, '2022-01-24 23:46:45', '2022-01-24 23:46:45'),
(30, 30, 1461, NULL, 1, 1, 18, 0, 0, 0, 18, '2022-01-25 00:04:36', '2022-01-25 00:04:36'),
(31, 31, 1461, NULL, 1, 1, 18, 0, 0, 0, 18, '2022-01-25 00:15:15', '2022-01-25 00:15:15'),
(32, 32, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-25 02:33:49', '2022-01-25 02:33:49'),
(33, 33, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-25 02:38:05', '2022-01-25 02:38:05'),
(34, 34, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-25 07:16:36', '2022-01-25 07:16:36'),
(35, 35, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-27 03:36:34', '2022-01-27 03:36:34'),
(36, 36, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-27 14:26:17', '2022-01-27 14:26:17'),
(39, 39, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-30 18:33:53', '2022-01-30 18:33:53'),
(40, 40, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-30 18:34:31', '2022-01-30 18:34:31'),
(41, 41, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-01-31 06:05:41', '2022-01-31 06:05:41'),
(43, 43, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-02-02 06:29:56', '2022-02-02 06:29:56'),
(44, 44, 1461, NULL, 1, 1, 18, 0, 0, 0, 18, '2022-02-02 16:14:32', '2022-02-02 16:14:32'),
(45, 45, 1461, NULL, 1, 1, 18, 0, 0, 0, 18, '2022-02-02 16:15:04', '2022-02-02 16:15:04'),
(46, 46, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-02-02 17:02:02', '2022-02-02 17:02:02'),
(47, 47, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-02-03 03:29:08', '2022-02-03 03:29:08'),
(48, 48, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-02-03 09:35:17', '2022-02-03 09:35:17'),
(49, 49, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-02-03 10:29:56', '2022-02-03 10:29:56'),
(50, 50, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-02-03 22:38:37', '2022-02-03 22:38:37'),
(51, 51, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-02-03 22:39:57', '2022-02-03 22:39:57'),
(52, 52, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-02-04 02:57:37', '2022-02-04 02:57:37'),
(53, 53, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-02-04 02:59:13', '2022-02-04 02:59:13'),
(54, 54, 1462, NULL, 1, 1, 450, 0, 0, 0, 450, '2022-02-04 03:03:56', '2022-02-04 03:03:56'),
(55, 55, 1460, NULL, 1, 1, 350, 0, 0, 0, 350, '2022-02-11 01:18:25', '2022-02-11 01:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `product_transfer`
--

CREATE TABLE `product_transfer` (
  `id` int(10) UNSIGNED NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouse`
--

CREATE TABLE `product_warehouse` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_warehouse`
--

INSERT INTO `product_warehouse` (`id`, `product_id`, `variant_id`, `warehouse_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(156, '1457', NULL, 9, 0, 5, '2021-12-31 22:29:31', '2022-01-01 03:33:45'),
(157, '1457', NULL, 10, 0, 5, '2021-12-31 22:29:31', '2021-12-31 22:29:31'),
(158, '1458', NULL, 9, 0, 24.99, '2022-01-01 03:34:00', '2022-01-01 03:34:00'),
(159, '1458', NULL, 10, 0, 24.99, '2022-01-01 03:34:00', '2022-01-15 15:03:40'),
(160, '1459', NULL, 9, 0, 79.99, '2022-01-01 03:34:00', '2022-01-15 15:03:43'),
(161, '1459', NULL, 10, 0, 79.99, '2022-01-01 03:34:00', '2022-01-15 15:03:40'),
(162, '1459', NULL, 11, 0, NULL, '2022-01-03 12:50:47', '2022-01-15 15:03:40'),
(163, '1460', NULL, 12, 13, 350, '2022-01-19 04:20:18', '2022-02-02 16:14:06'),
(164, '1460', NULL, 13, 18, 350, '2022-01-19 04:20:18', '2022-02-11 01:18:25'),
(165, '1461', NULL, 12, 18, 18, '2022-01-21 01:10:05', '2022-01-21 01:11:10'),
(166, '1461', NULL, 13, 19, 18, '2022-01-21 01:10:05', '2022-02-02 16:15:04'),
(167, '1462', NULL, 12, 0, 450, '2022-02-04 03:02:37', '2022-02-04 03:02:37'),
(168, '1462', NULL, 13, 1, 450, '2022-02-04 03:02:37', '2022-02-04 03:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `reference_no`, `user_id`, `warehouse_id`, `supplier_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `paid_amount`, `status`, `payment_status`, `document`, `note`, `created_at`, `updated_at`) VALUES
(2, 'pr-20220118-114237', 46, 12, NULL, 1, 4, 0, 0, 600, 0, 0, NULL, NULL, 600, 600, 1, 2, NULL, NULL, '2022-01-19 06:42:37', '2022-01-21 01:01:23'),
(3, 'pr-20220119-121910', 46, 12, NULL, 1, 10, 0, 0, 1500, 0, 0, NULL, NULL, 1500, 1500, 1, 2, NULL, NULL, '2022-01-19 07:19:10', '2022-01-21 01:01:06'),
(5, 'pr-20220120-060304', 1, 12, NULL, 1, 5, 0, 0, 750, 0, 0, NULL, NULL, 750, 750, 1, 2, NULL, NULL, '2022-01-21 01:03:04', '2022-01-21 01:06:54'),
(6, 'pr-20220120-060434', 1, 13, NULL, 1, 10, 0, 0, 1500, 0, 0, NULL, NULL, 1500, 1500, 1, 2, NULL, NULL, '2022-01-21 01:04:34', '2022-01-21 01:06:32'),
(7, 'pr-20220120-061110', 1, 12, 7, 1, 18, 0, 0, 216, 0, 0, NULL, NULL, 216, 216, 1, 2, NULL, NULL, '2022-01-21 01:11:10', '2022-01-21 01:17:04'),
(8, 'pr-20220120-061154', 1, 13, 7, 1, 20, 0, 0, 240, 0, 0, NULL, NULL, 240, 240, 1, 2, NULL, NULL, '2022-01-21 01:11:54', '2022-01-21 01:16:41'),
(9, 'pr-20220120-071002', 44, 13, NULL, 1, 5, 0, 0, 60, 0, 0, NULL, NULL, 60, 0, 1, 1, NULL, NULL, '2022-01-21 02:10:02', '2022-01-21 02:10:02'),
(10, 'pr-20220203-023925', 44, 13, 7, 1, 10, 0, 0, 1200, 0, 0, NULL, NULL, 1200, 0, 1, 1, NULL, NULL, '2022-02-03 09:39:25', '2022-02-03 09:39:25'),
(11, 'pr-20220203-080101', 44, 13, 7, 1, 10, 0, 0, 1000, 0, 0, NULL, NULL, 1000, 0, 1, 1, NULL, NULL, '2022-02-04 03:01:01', '2022-02-04 03:01:01'),
(12, 'pr-20220203-080333', 44, 13, 7, 1, 2, 0, 0, 400, 0, 0, NULL, NULL, 400, 0, 1, 1, NULL, NULL, '2022-02-04 03:03:33', '2022-02-04 03:03:33');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_product_return`
--

CREATE TABLE `purchase_product_return` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_purchases`
--

CREATE TABLE `return_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `guard_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Access to everything', 'web', 1, '2018-06-01 23:46:44', '2021-12-20 17:31:44'),
(2, 'Owner', 'Owner of shop...', 'web', 1, '2018-10-22 02:38:13', '2018-10-22 02:38:13'),
(4, 'Team', 'Team', 'web', 1, '2018-06-02 00:05:27', '2021-12-20 17:31:29'),
(5, 'Customer', NULL, 'web', 1, '2020-11-05 06:43:16', '2020-11-15 00:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(6, 4),
(7, 1),
(7, 2),
(7, 4),
(8, 1),
(8, 2),
(8, 4),
(9, 1),
(9, 2),
(9, 4),
(10, 1),
(10, 2),
(10, 4),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(12, 4),
(13, 1),
(13, 2),
(13, 4),
(14, 1),
(14, 2),
(14, 4),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(20, 4),
(21, 1),
(21, 2),
(21, 4),
(22, 1),
(22, 2),
(22, 4),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(24, 4),
(25, 1),
(25, 2),
(25, 4),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(28, 4),
(29, 1),
(29, 2),
(29, 4),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(55, 4),
(56, 1),
(56, 2),
(56, 4),
(57, 1),
(57, 2),
(57, 4),
(58, 1),
(58, 2),
(59, 1),
(60, 1),
(60, 2),
(61, 1),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(63, 4),
(64, 1),
(64, 2),
(64, 4),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(90, 1),
(90, 2),
(91, 1),
(91, 2),
(92, 1),
(92, 2),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(97, 2),
(98, 1),
(98, 2),
(99, 1),
(99, 2),
(100, 1),
(100, 2),
(101, 1),
(101, 2),
(102, 1),
(102, 2),
(103, 1),
(103, 2),
(104, 1),
(104, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `reference_no`, `user_id`, `cash_register_id`, `customer_id`, `warehouse_id`, `biller_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `grand_total`, `order_tax_rate`, `order_tax`, `order_discount`, `coupon_id`, `coupon_discount`, `shipping_cost`, `sale_status`, `payment_status`, `document`, `paid_amount`, `sale_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(2, 'posr-20220118-114744', 46, NULL, 64, 12, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-19 06:47:44', '2022-01-19 06:47:44'),
(3, 'posr-20220119-121151', 46, NULL, 64, 12, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-19 07:11:51', '2022-01-19 07:11:51'),
(4, 'posr-20220119-121424', 46, NULL, 64, 12, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-01-19 07:14:24', '2022-01-19 07:14:24'),
(7, 'posr-20220119-121809', 46, NULL, 64, 12, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-01-19 07:18:09', '2022-01-19 07:18:09'),
(8, 'posr-20220119-122227', 46, NULL, 64, 12, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-01-19 07:22:27', '2022-01-19 07:22:27'),
(11, 'posr-20220119-123335', 46, NULL, 64, 12, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-01-19 07:33:35', '2022-01-19 07:33:35'),
(12, 'posr-20220119-123336', 46, NULL, 64, 12, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-01-19 07:33:36', '2022-01-19 07:33:36'),
(13, 'posr-20220119-123846', 46, NULL, 64, 12, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-01-19 07:38:46', '2022-01-19 07:38:46'),
(14, 'posr-20220121-055323', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-01-22 00:53:23', '2022-01-22 00:53:23'),
(16, 'posr-20220121-061232', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-22 01:12:32', '2022-01-22 01:12:32'),
(17, 'posr-20220121-063204', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-22 01:32:04', '2022-01-22 01:32:04'),
(19, 'posr-20220124-120008', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-24 19:00:08', '2022-01-24 19:00:08'),
(20, 'posr-20220124-120245', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-24 19:02:45', '2022-01-24 19:02:45'),
(21, 'posr-20220124-120359', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-01-24 19:03:59', '2022-01-24 19:03:59'),
(22, 'posr-20220124-120657', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-24 19:06:57', '2022-01-24 19:06:57'),
(23, 'posr-20220124-120742', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-01-24 19:07:42', '2022-01-24 19:07:42'),
(25, 'posr-20220124-121047', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-01-24 19:10:47', '2022-01-24 19:10:47'),
(26, 'posr-20220124-121119', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-24 19:11:19', '2022-01-24 19:11:19'),
(27, 'posr-20220124-125026', 44, NULL, 65, 13, 11, 1, 1, 0, 0, 18, 18, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 18, NULL, NULL, '2022-01-24 19:50:26', '2022-01-24 19:50:26'),
(28, 'posr-20220124-040324', 44, NULL, 65, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-01-24 23:03:24', '2022-01-24 23:03:24'),
(29, 'posr-20220124-044645', 44, NULL, 65, 13, 11, 1, 1, 0, 0, 18, 18, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 18, NULL, NULL, '2022-01-24 23:46:45', '2022-01-24 23:46:45'),
(30, 'posr-20220124-050436', 44, NULL, 65, 13, 11, 1, 1, 0, 0, 18, 18, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 18, NULL, NULL, '2022-01-25 00:04:36', '2022-01-25 00:04:36'),
(31, 'posr-20220124-051515', 44, NULL, 65, 13, 11, 1, 1, 0, 0, 18, 18, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 18, NULL, NULL, '2022-01-25 00:15:15', '2022-01-25 00:15:15'),
(32, 'posr-20220124-073349', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-25 02:33:49', '2022-01-25 02:33:49'),
(33, 'posr-20220124-073805', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-25 02:38:05', '2022-01-25 02:38:05'),
(34, 'posr-20220125-121636', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-25 07:16:36', '2022-01-25 07:16:36'),
(35, 'posr-20220126-083634', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-27 03:36:34', '2022-01-27 03:36:34'),
(36, 'posr-20220127-072617', 44, NULL, 65, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-27 14:26:17', '2022-01-27 14:26:17'),
(39, 'posr-20220130-113353', 44, NULL, 66, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-30 18:33:53', '2022-01-30 18:33:53'),
(40, 'posr-20220130-113431', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-30 18:34:31', '2022-01-30 18:34:31'),
(41, 'posr-20220130-110541', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-01-31 06:05:41', '2022-01-31 06:05:41'),
(43, 'posr-20220201-112956', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-02-02 06:29:56', '2022-02-02 06:29:56'),
(44, 'posr-20220202-091432', 44, NULL, 66, 13, 11, 1, 1, 0, 0, 18, 18, 0, 0, NULL, NULL, NULL, NULL, 1, 2, NULL, 36, NULL, NULL, '2022-02-02 16:14:32', '2022-02-03 22:44:45'),
(45, 'posr-20220202-091504', 44, NULL, 66, 13, 11, 1, 1, 0, 0, 18, 18, 0, 0, NULL, NULL, NULL, NULL, 1, 2, NULL, 10, NULL, NULL, '2022-02-02 16:15:04', '2022-02-02 16:15:04'),
(46, 'posr-20220202-100202', 44, NULL, 66, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 2, NULL, 50, NULL, NULL, '2022-02-02 17:02:02', '2022-02-02 17:02:02'),
(47, 'posr-20220202-082908', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-02-03 03:29:08', '2022-02-03 03:29:08'),
(48, 'posr-20220203-023517', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 3, 4, NULL, 350, NULL, NULL, '2022-02-03 09:35:17', '2022-02-03 09:35:17'),
(49, 'posr-20220203-032956', 44, NULL, 64, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-02-03 10:29:56', '2022-02-03 10:39:00'),
(50, 'posr-20220203-033837', 44, NULL, 50, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 2, NULL, 10, NULL, NULL, '2022-02-03 22:38:37', '2022-02-03 22:38:37'),
(51, 'posr-20220203-033957', 44, NULL, 50, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2022-02-03 22:39:57', '2022-02-03 22:39:57'),
(52, 'posr-20220203-075737', 44, NULL, 69, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 2, NULL, 100, NULL, NULL, '2022-02-04 02:57:37', '2022-02-04 02:57:37'),
(53, 'posr-20220203-075913', 44, NULL, 69, 13, 11, 1, 1, 0, 0, 350, 350, NULL, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-02-04 02:59:13', '2022-02-04 02:59:13'),
(54, 'posr-20220203-080356', 44, NULL, 69, 13, 11, 1, 1, 0, 0, 450, 450, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 450, NULL, NULL, '2022-02-04 03:03:56', '2022-02-04 03:03:56'),
(55, 'posr-20220210-061825', 44, NULL, 70, 13, 11, 1, 1, 0, 0, 350, 350, 0, 0, NULL, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2022-02-11 01:18:25', '2022-02-11 01:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `stock_counts`
--

CREATE TABLE `stock_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_counts`
--

INSERT INTO `stock_counts` (`id`, `reference_no`, `warehouse_id`, `category_id`, `brand_id`, `user_id`, `type`, `initial_file`, `final_file`, `note`, `is_adjusted`, `created_at`, `updated_at`) VALUES
(2, 'scr-20220102-104003', 9, NULL, NULL, 1, 'full', '20220102-104003.csv', NULL, NULL, 0, '2022-01-02 17:40:03', '2022-01-02 17:40:03');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(7, 'Maya Cellular Parts', NULL, 'Maya Cellular Parts', NULL, NULL, '(424)248-3896', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-20 17:36:16', '2021-12-20 17:36:16');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'vat@10', 10, 0, '2018-05-12 09:58:30', '2021-12-03 14:39:18'),
(2, 'vat@15', 15, 0, '2018-05-12 09:58:43', '2021-12-03 14:39:18'),
(3, 'test', 6, 0, '2018-05-27 23:32:54', '2018-05-27 23:34:44'),
(4, 'vat 20', 20, 0, '2018-09-01 00:58:57', '2021-12-03 14:39:18'),
(5, 'Lake Elsinore', 8.75, 1, '2021-12-03 14:39:11', '2021-12-20 17:38:56'),
(6, 'Wildomar', 8.75, 1, '2021-12-20 17:39:10', '2021-12-20 17:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_code`, `unit_name`, `base_unit`, `operator`, `operation_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'pc', 'Piece', NULL, '*', 1, 1, '2018-05-12 02:27:46', '2021-12-22 17:09:10'),
(2, 'dozen', 'dozen box', 1, '*', 12, 0, '2018-05-12 09:57:05', '2021-12-20 16:44:14'),
(3, 'cartoon', 'cartoon box', 1, '*', 24, 0, '2018-05-12 09:57:45', '2021-12-20 16:44:14'),
(4, 'm', 'meter', NULL, '*', 1, 0, '2018-05-12 09:58:07', '2021-12-20 16:44:14'),
(6, 'test', 'test', NULL, '*', 1, 0, '2018-05-27 23:20:20', '2018-05-27 23:20:25'),
(7, 'kg', 'kilogram', NULL, '*', 1, 0, '2018-06-25 00:49:26', '2021-12-20 17:37:30'),
(8, '20', 'ni33', 8, '*', 1, 0, '2018-07-31 22:35:51', '2018-07-31 22:40:54'),
(9, 'gm', 'gram', 7, '/', 1000, 0, '2018-09-01 00:06:28', '2021-12-20 16:44:14'),
(10, 'gz', 'goz', NULL, '*', 1, 0, '2018-11-29 03:40:29', '2019-03-02 11:53:29'),
(11, 'Service', 'Service', NULL, '*', 1, 0, '2021-12-20 16:27:36', '2021-12-22 09:57:04'),
(12, 'labor', 'Labor', NULL, '*', 1, 1, '2021-12-20 16:51:40', '2021-12-20 16:51:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `phone`, `company_name`, `role_id`, `biller_id`, `warehouse_id`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$OAYH6QhpmdYdccrzMxFmR./3w8Hvs4keZ1ktlt4AR97Wm8KCdvlS6', '2LuR4r2VJ5ZaPiqP4fUyKpUYNuhL3px4JSLlkwPzW5bpWmYSqApBJf1Jwa1n', '12112', '911Gadget', 1, NULL, NULL, 1, 1, '2018-06-02 03:24:15', '2022-01-15 15:04:36'),
(37, 'Adrian Amrel', 'adrianlermaa@yahoo.com', '$2y$10$DWAHTfjcvwCpOCXaJg11MOhsqns03uvlwiSUOQwkHL2YYrtrXPcL6', NULL, '3237169175', NULL, 4, 11, 9, 0, 1, '2021-12-20 17:26:33', '2022-01-15 15:04:36'),
(38, 'Spencer Clingman', 'notfortheflesh@gmail.com', '$2y$10$Q943s3jAqAwmnn6gne/xxucWyVGxPQPKkvd7clQZB/peClnyfSA3m', NULL, '9513997911', NULL, 4, 12, 10, 0, 1, '2021-12-20 17:27:34', '2022-01-15 15:04:36'),
(39, 'javid', 'javidiqbals@gmail.com', '$2y$10$nFa556f5YxN7CKzfPJa6FO8nZIzPE7upFeebxegmp8T0s62KmipAm', NULL, '03346974159', 'softageage', 5, NULL, NULL, 0, 1, '2021-12-30 17:39:41', '2022-01-15 15:04:36'),
(40, 'ALI', 'aliwazir101@gmail.com', '$2y$10$QTbGngS52J1MzCf55icCWe0IAc8TkEXJMcnBm494OW5vB6WaulvF6', NULL, '123456789', 'Softage', 5, NULL, NULL, 0, 1, '2021-12-31 21:22:22', '2022-01-15 15:04:36'),
(41, 'Georgina Chavez', 'az003777@yahoo.com', '$2y$10$FqSdJc4kseehqjRJJwWYX.WRxiZ.BolS6MLX1TXGJsRq1DI8A.Wd.', NULL, '9154225182', NULL, 4, 13, 11, 0, 1, '2022-01-03 12:26:59', '2022-01-15 15:04:36'),
(42, 'Wendy Amrel', 'cu018246@gmail.com', '$2y$10$pLnUmvCGueGJukFhtJwgy.hMv5V0xp.bK1tv3XuS/nE46Zhd1Ryta', NULL, '3237169174', NULL, 4, 11, 9, 0, 1, '2022-01-03 12:30:48', '2022-01-15 15:04:36'),
(43, 'perfectomota', 'midwaycellphone@gmail.com', '$2y$10$PFJCx3MRjIIBqU02oeDWNORNLuH2drsdXFFRpfsmrXIXTK3d3L3/.', NULL, '7735847592', 'Midway Cell Phone Repair', 2, NULL, NULL, 1, 0, '2022-01-15 15:26:14', '2022-01-15 15:26:14'),
(44, 'adrianamrel', 'contact@911gadgets.com', '$2y$10$yiGtO2PpngbRuOeCMcSPj.uGUmoJmpgLZ7fgq4V0MUCxJmT3hk5Li', NULL, '9513997911', '911 Gadgets', 4, 11, 13, 1, 0, '2022-01-15 15:27:02', '2022-01-21 02:15:04'),
(45, 'adrianlermaa', 'adrianlermaa@yahoo.com', '$2y$10$2QpHhD4BOErbfvoa/MyeiOhGO0US4u0KT11c2QjLh4etkCxQwiY7y', NULL, '3237169175', 'Tuscany HIlls Repair', 4, 11, 13, 1, 0, '2022-01-19 04:32:50', '2022-01-19 04:51:47'),
(46, 'wendyfrancoo', 'wfranco209@gmail.com', '$2y$10$T2/ff9ZgZJyNs8T1a0ECYeiIMiO5tjr.sRW557N6F0uNG1A.waHHi', NULL, '3237169174', 'Franco Repair', 4, 11, 12, 1, 0, '2022-01-19 04:50:00', '2022-01-19 04:50:00'),
(47, 'valeryamrel', 'cu018246@gmail.com', '$2y$10$YxZasyWpcgqgTguvEOOa4.Jnnaglq/09roR3gR9guQZoT7vLRdVu.', NULL, '3237169175', NULL, 2, NULL, NULL, 1, 0, '2022-01-19 05:47:08', '2022-01-19 05:47:08');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(9, 'Tuscany Hills', '9513997911', 'contact@911gadgets.com', '18 Della Cava Ln, Lake Elsinore, CA 92532', 0, '2021-12-03 13:51:04', '2022-01-15 15:04:04'),
(10, 'Wildomar', '9514503451', 'gadgetsmurrieta@gmail.com', '25015 Palomasr', 0, '2021-12-04 09:11:22', '2022-01-15 15:04:04'),
(11, 'El Paso', '9514225182', 'adrianlermaa@yahoo.com', '7127 North Loop Dr, El Paso, Texas 79915', 0, '2022-01-03 11:35:45', '2022-01-15 15:04:04'),
(12, '911 Gadgets Tuscany Hills', '9513997911', 'contact@911gadgets.com', '18 Della Cava Ln, Lake Elsinore, CA 92532', 1, '2022-01-15 15:21:26', '2022-01-15 15:21:26'),
(13, 'Midway Cell Phone Repair', '7735847592', 'midwaycellphone@gmail.com', '4887 S Archer Ave Suite B, Chicago, IL 60632', 1, '2022-01-15 15:23:53', '2022-01-15 15:23:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billers`
--
ALTER TABLE `billers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_transfers`
--
ALTER TABLE `money_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_setting`
--
ALTER TABLE `pos_setting`
  ADD UNIQUE KEY `pos_setting_id_unique` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_purchases`
--
ALTER TABLE `product_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_quotation`
--
ALTER TABLE `product_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_returns`
--
ALTER TABLE `product_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sales`
--
ALTER TABLE `product_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_transfer`
--
ALTER TABLE `product_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_purchases`
--
ALTER TABLE `return_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_counts`
--
ALTER TABLE `stock_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billers`
--
ALTER TABLE `billers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1463;

--
-- AUTO_INCREMENT for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_purchases`
--
ALTER TABLE `product_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_quotation`
--
ALTER TABLE `product_quotation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_returns`
--
ALTER TABLE `product_returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sales`
--
ALTER TABLE `product_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `product_transfer`
--
ALTER TABLE `product_transfer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_purchases`
--
ALTER TABLE `return_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `stock_counts`
--
ALTER TABLE `stock_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
