

CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES("1","11111","Sales Account","1000","1000","this is first account","0","1","2018-12-18 07:58:02","2021-12-02 22:26:41");
INSERT INTO accounts VALUES("3","21211","Sa","","0","","1","1","2018-12-18 07:58:56","2021-12-02 22:26:41");



CREATE TABLE `adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `billers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO billers VALUES("11","911 Gadgets","","","","","9513997911","","","","","","1","2021-12-20 23:57:34","2021-12-20 23:57:34");
INSERT INTO billers VALUES("12","911 Gadgets Murrieta","","911 Gadgets Murrieta","","","9514503451","","","","","","1","2021-12-21 00:37:23","2021-12-21 00:37:23");
INSERT INTO billers VALUES("13","911 Gadgets El Paso","","El Paso","","","9514225182","","","","","","1","2022-01-03 17:22:39","2022-01-03 17:22:39");



CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO brands VALUES("3","HP","HP.jpg","0","2018-05-12 14:06:14","2022-01-20 10:03:25");
INSERT INTO brands VALUES("4","samsung","samsung.jpg","0","2018-05-12 14:08:41","2022-01-20 10:03:25");
INSERT INTO brands VALUES("5","Apple","Apple.jpg","0","2018-09-01 04:34:49","2022-01-20 10:03:25");
INSERT INTO brands VALUES("6","Lotto","","0","2021-12-18 04:47:07","2022-01-20 10:02:26");
INSERT INTO brands VALUES("7","None","","0","2021-12-23 23:30:11","2022-01-20 10:02:49");



CREATE TABLE `cash_registers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cash_registers VALUES("1","100","44","12","1","2022-04-06 16:57:19","2022-04-06 16:57:19");



CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("2","electronics","","","0","2018-05-12 08:35:57","2022-04-05 18:22:10");
INSERT INTO categories VALUES("4","toy","","","1","2018-05-24 03:57:48","2019-03-01 20:09:27");
INSERT INTO categories VALUES("22","accessories","","","0","2021-12-17 22:24:05","2022-04-05 18:22:10");
INSERT INTO categories VALUES("23","food","","","0","2021-12-17 22:24:05","2022-04-05 18:31:20");
INSERT INTO categories VALUES("24","Service","","","1","2021-12-20 20:58:24","2021-12-20 20:58:24");
INSERT INTO categories VALUES("26","Group","","","1","2021-12-20 22:03:04","2021-12-20 22:03:04");
INSERT INTO categories VALUES("27","Inventory","","","1","2021-12-20 22:03:04","2021-12-20 22:03:04");
INSERT INTO categories VALUES("28","Non-Inventory","","","1","2021-12-20 22:03:06","2021-12-20 22:03:06");
INSERT INTO categories VALUES("29","Special Order","","","1","2021-12-20 22:03:07","2021-12-20 22:03:07");
INSERT INTO categories VALUES("30","","","","0","2021-12-21 14:13:21","2022-04-05 18:21:49");
INSERT INTO categories VALUES("31","elwctronics","","","0","2021-12-23 23:16:33","2022-04-05 18:22:53");



CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO coupons VALUES("1","Black Friday","percentage","20","0","100","2","2020-11-19","1","1","2018-10-26 03:38:50","2021-07-27 22:33:47");
INSERT INTO coupons VALUES("2","i love Iphone","fixed","200","1000","50","1","2018-12-31","1","1","2018-10-27 07:59:26","2019-03-02 10:46:48");



CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO currencies VALUES("1","US Dollar","USD","1","2020-11-01 05:22:58","2020-11-01 05:34:55");
INSERT INTO currencies VALUES("2","Euro","Euro","0.85","2020-11-01 06:29:12","2020-11-11 04:15:34");



CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customer_groups VALUES("1","general","0","0","2018-05-12 13:09:36","2021-12-04 17:43:21");
INSERT INTO customer_groups VALUES("2","distributor","-10","0","2018-05-12 13:12:14","2021-12-04 17:43:21");
INSERT INTO customer_groups VALUES("3","reseller","5","0","2018-05-12 13:12:26","2021-12-04 17:43:21");
INSERT INTO customer_groups VALUES("6","General","0","1","2021-12-04 17:43:39","2021-12-04 17:43:39");
INSERT INTO customer_groups VALUES("7","Business","5","1","2021-12-04 17:43:52","2021-12-04 17:43:52");



CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `dv_le_sph` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dv_le_cyl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dv_le_axis` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dv_re_sph` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dv_re_cyl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dv_re_axis` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nv_le_sph` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nv_le_cyl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nv_le_axis` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nv_re_sph` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nv_re_cyl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nv_re_axis` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customers VALUES("1","1","22","dhiman","lioncoders","dhiman@gmail.com","+8801111111101","","kajir deuri","chittagong","","","bd","190","0","0","2018-05-12 15:00:48","2021-12-04 14:28:35","","","","","","","","","","","","");
INSERT INTO customers VALUES("2","2","","moinul","lioncoders","","+8801200000001","","jamalkhan","chittagong","","","bd","100","0","0","2018-05-12 15:04:51","2021-12-04 14:28:35","","","","","","","","","","","","");
INSERT INTO customers VALUES("11","1","","walk-in-customer","","ashfaqdev.php@gmail.com","01923000001","11111","mohammadpur","dhaka","","","","","0","0","2018-09-02 06:30:54","2021-12-04 14:35:14","","","","","","","","","","","","");
INSERT INTO customers VALUES("26","6","","walkin","911 Gadget","walkin@demo.com","03439446591","","xyz wales","Islamabad","wales","44000","USA","","","0","2021-12-06 20:04:12","2021-12-06 23:04:29","","","","","","","","","","","","");
INSERT INTO customers VALUES("27","6","","Test","911Gadget","Test@gmail.com","03333333333","","Test","Test","Test","44000","USA","","","0","2021-12-06 23:23:46","2021-12-08 02:56:11","","","","","","","","","","","","");
INSERT INTO customers VALUES("28","6","","Test2","911Gadget","Test2@gmail.com","03333123456","","Test2","Test2","Test2","Test2","Test2","","","0","2021-12-06 23:26:10","2021-12-08 02:57:27","","","","","","","","","","","","");
INSERT INTO customers VALUES("29","6","","kkkk","","","4444","","","","","","","","","0","2021-12-07 21:58:52","2021-12-20 22:24:20","","","","","","","","","","","","");
INSERT INTO customers VALUES("30","6","","jjjj","","","+100000000","","","","","","","","","0","2021-12-07 22:00:01","2021-12-20 22:24:20","","","","","","","","","","","","");
INSERT INTO customers VALUES("31","6","","dadf","","","3237169175","","","","","","","","","0","2021-12-08 02:22:04","2021-12-20 22:24:20","","","","","","","","","","","","");
INSERT INTO customers VALUES("32","6","","Adrian Amrel","","","9513997911","","","","","","","","24.99","1","2021-12-08 14:45:01","2021-12-23 00:27:24","","","","","","","","","","","","");
INSERT INTO customers VALUES("33","6","","5 Star","","adrianlermaa@yahoo.com","3234741986","","","","","","","","","1","2021-12-20 22:45:09","2021-12-29 00:06:09","","","","","","","","","","","","");
INSERT INTO customers VALUES("34","6","","Rger p","","","3234545454","","","","","","","","","1","2021-12-20 23:06:24","2021-12-20 23:06:24","","","","","","","","","","","","");
INSERT INTO customers VALUES("35","6","","Jayden","","adrianlermaa@yahoo.com","3236521254","","","","","","","","","1","2021-12-20 23:59:42","2021-12-20 23:59:42","","","","","","","","","","","","");
INSERT INTO customers VALUES("36","6","","Jayden","","adrianlermaa@yahoo.com","3236521254","","","","","","","","","1","2021-12-20 23:59:43","2021-12-20 23:59:43","","","","","","","","","","","","");
INSERT INTO customers VALUES("37","6","","Juanito","","","3234545878","","","","","","","","","1","2021-12-21 00:18:29","2021-12-21 00:18:29","","","","","","","","","","","","");
INSERT INTO customers VALUES("38","6","","Spencer","","","9514503451","","","","","","","","","1","2021-12-21 19:21:11","2021-12-21 19:21:11","","","","","","","","","","","","");
INSERT INTO customers VALUES("39","6","","Adrian  Gonzales","","","4744545121","","","","","","","","","1","2021-12-23 00:28:58","2021-12-23 00:28:58","","","","","","","","","","","","");
INSERT INTO customers VALUES("40","6","","Test customer","","","3232145454","","","","","","","","","1","2021-12-23 00:29:34","2021-12-23 00:29:34","","","","","","","","","","","","");
INSERT INTO customers VALUES("41","6","","mama","ttt","mama@pharma.com","223355","","fdsfdsf dsfsda asdfds fdsaf","newyork","Alaska","44003","USA","","","1","2021-12-23 19:58:53","2021-12-25 05:34:26","","","","","","","","","","","","");
INSERT INTO customers VALUES("42","6","","kaka","chacha","kaka@gmail.com","35698745","","xyz chachi korany","bundale","ahawadehwa","3000","usa","","","1","2021-12-23 21:24:03","2021-12-23 21:24:03","","","","","","","","","","","","");
INSERT INTO customers VALUES("43","6","","Rajeev Mehra","","","3234741984","","","","","","","","","1","2021-12-23 23:34:13","2021-12-23 23:34:13","","","","","","","","","","","","");
INSERT INTO customers VALUES("44","6","","Me Test","","","4548457845","","","","","","","","","1","2021-12-24 19:50:43","2021-12-24 19:50:43","","","","","","","","","","","","");
INSERT INTO customers VALUES("45","6","","Adrian Amrellll","","","3236585458","","","","","","","","","1","2021-12-24 23:41:21","2021-12-24 23:41:21","","","","","","","","","","","","");
INSERT INTO customers VALUES("46","6","","Email Test customer","","adrianlermaa@yahoo.com","4152125214","","","","","","","","","1","2021-12-24 23:44:15","2021-12-24 23:44:15","","","","","","","","","","","","");
INSERT INTO customers VALUES("47","6","","Spencer","","","9518169446","","","","","","","","","1","2021-12-25 11:18:18","2021-12-25 11:18:18","","","","","","","","","","","","");
INSERT INTO customers VALUES("48","6","","test test test","","","3236565847","","","","","","","","","1","2021-12-26 20:28:41","2021-12-26 20:28:41","","","","","","","","","","","","");
INSERT INTO customers VALUES("49","6","","Leo","","","9512909952","","","","","","","","","1","2021-12-27 13:11:05","2021-12-27 13:11:05","","","","","","","","","","","","");
INSERT INTO customers VALUES("50","6","","javid","softageage","javidiqbals@gmail.com","03346974159","","2nd flate meezan bank ghouri town islamabd","islamabad","","44000","Pakistan","1500","","1","2021-12-28 04:56:25","2022-01-01 02:15:12","","","","","","","","","","","","");
INSERT INTO customers VALUES("51","6","","Adrian test NEW","911 Gadgets","contact@911gadgets.com","3235421542","","","","","","","","","1","2021-12-29 08:09:03","2021-12-29 08:09:03","","","","","","","","","","","","");
INSERT INTO customers VALUES("52","6","","Last Test","","notfortheflesh@gmail.com","3239585454","","","","","","","","","1","2021-12-30 21:37:02","2021-12-30 21:37:02","","","","","","","","","","","","");
INSERT INTO customers VALUES("53","6","","FINAL TEST","","notfortheflesh@gmail.com","3234548754","","","","","","","","","1","2021-12-30 21:38:05","2021-12-30 21:38:05","","","","","","","","","","","","");
INSERT INTO customers VALUES("54","6","","FINAL","","Notfortheflesh@gmail.com","3235454545","","","","","","","","","1","2021-12-30 21:38:42","2021-12-30 21:38:42","","","","","","","","","","","","");
INSERT INTO customers VALUES("55","6","","Prueba","","adrianlermaa@yahoo.com","3235689568","","","","","","","","","1","2021-12-30 21:56:00","2021-12-30 21:56:00","","","","","","","","","","","","");
INSERT INTO customers VALUES("56","6","","javid iqbal","softagesolution","javidiqbals@gmail.com","22222","","xyz yzb islamabad pakistan","Islamabad","","44000","Pakistan","","","0","2021-12-31 22:35:22","2022-01-01 02:14:37","","","","","","","","","","","","");
INSERT INTO customers VALUES("57","6","","Ali Khan","TSC","javidiqbals@gmail.com","55555","","xyz yzb islamabad pakistan","Islamabad","","44000","Pakistan","","","0","2021-12-31 22:45:17","2022-01-01 02:14:04","","","","","","","","","","","","");
INSERT INTO customers VALUES("58","6","","New Testing","","notfortheflesh@gmail.com","3234444444","","","","","","","","","1","2022-01-01 08:53:22","2022-01-01 08:53:22","","","","","","","","","","","","");
INSERT INTO customers VALUES("59","6","","Adrian","","adrianlermaa@yahoo.com","3232222222","","","","","","","","","1","2022-01-02 19:35:34","2022-01-02 19:35:34","","","","","","","","","","","","");
INSERT INTO customers VALUES("60","6","","LAST TEST","","adrianlermaa@yahoo.com","4747454545","","","","","","","","","1","2022-01-02 22:25:13","2022-01-02 22:25:13","","","","","","","","","","","","");
INSERT INTO customers VALUES("61","6","","Mat","","flkaj","4843267438","","","","","","","","","1","2022-01-07 14:41:21","2022-01-07 14:41:21","","","","","","","","","","","","");
INSERT INTO customers VALUES("62","6","","Claudia","","","5624758281","","","","","","","","","1","2022-01-14 09:36:09","2022-01-14 09:36:09","","","","","","","","","","","","");
INSERT INTO customers VALUES("63","6","","Wendy Franco","","wfranco209@gmail.com","3237169174","","","","","","","","","1","2022-01-17 12:58:23","2022-01-17 12:58:23","","","","","","","","","","","","");
INSERT INTO customers VALUES("64","6","","Adrian Amrel","","cu018246@gmail.com","3237169175","","","","","","","","1300","1","2022-01-18 13:21:15","2022-02-03 15:39:00","","","","","","","","","","","","");
INSERT INTO customers VALUES("65","6","","Gregg","","Adrianlermaa@yahoo.com","3234987654","","","","","","","","54","1","2022-01-25 00:21:37","2022-01-25 05:15:15","","","","","","","","","","","","");
INSERT INTO customers VALUES("66","6","","Kenny","","","3234548547","","","","","","","","36","1","2022-01-30 18:41:48","2022-02-04 03:44:46","","","","","","","","","","","","");
INSERT INTO customers VALUES("67","6","","Steve","","sclariv4@gmail.com","2077190564","","","","","","","","","1","2022-02-03 14:32:58","2022-02-03 14:32:58","","","","","","","","","","","","");
INSERT INTO customers VALUES("68","6","","Donny","","nightmaredevices@gmail.com","2762434654","","","","","","","","","1","2022-02-04 07:51:46","2022-02-04 07:51:46","","","","","","","","","","","","");
INSERT INTO customers VALUES("69","6","","Adrian Amrelll","","adrianlermaa@yahoo.com","9513997912","","","","","","","","350","1","2022-02-04 07:52:53","2022-02-04 07:59:14","","","","","","","","","","","","");
INSERT INTO customers VALUES("70","6","","Arjit","","Suru4k@gmail.com","6143788428","","","","","","","","","1","2022-02-11 06:16:46","2022-02-11 06:16:46","","","","","","","","","","","","");
INSERT INTO customers VALUES("71","6","","Umer","asd","","03152069236","","asd","casd","asdas","74800","pak","","","1","2022-03-09 10:26:18","2022-03-09 10:26:18","","","","","","","","","","","","");
INSERT INTO customers VALUES("72","6","","Giacomo Norris","Wilkerson and Rivera Traders","umer@yopmail.com","+1 (238) 648-7507","","Dolorem quasi sapien","Enim officia vero nu","Anim dolores blandit","Veniam odit non par","Culpa nobis dolor d","","","1","2022-03-25 00:50:08","2022-03-25 00:50:08","","","","","","","","","","","","");



CREATE TABLE `deliveries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES("1","Sale","1","2018-12-27 10:16:47","2018-12-27 15:40:23");
INSERT INTO departments VALUES("3","Repair","1","2021-12-02 22:27:27","2021-12-02 22:27:27");



CREATE TABLE `deposits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO employees VALUES("4","Adrian Amrel","adrianamrel@yahoo.com","3237169174","3","","","","","","1","2021-12-20 22:33:43","2021-12-20 22:33:43");



CREATE TABLE `expense_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expense_categories VALUES("1","16718342","washing","1","2018-08-16 05:32:48","2019-03-02 12:02:07");
INSERT INTO expense_categories VALUES("2","60128975","electric bill","1","2018-08-16 05:39:18","2018-08-16 05:39:18");



CREATE TABLE `expenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `general_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `currency_position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES("1","My track","open.png","1","own","m-d-Y","911 Gadgets, LLC","standard","1","default.css","2020-12-01 12:13:11","2021-12-20 22:53:31","prefix");



CREATE TABLE `gift_card_recharges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `gift_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `card_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `hrm_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `checkin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO languages VALUES("1","en","2018-07-08 03:59:17","2019-12-24 22:34:20");



CREATE TABLE `logo_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO logo_settings VALUES("3","44","112742.jpg","2022-03-24 23:12:58","2022-03-24 23:27:42");



CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("3","2018_02_17_060412_create_categories_table","1");
INSERT INTO migrations VALUES("4","2018_02_20_035727_create_brands_table","1");
INSERT INTO migrations VALUES("5","2018_02_25_100635_create_suppliers_table","1");
INSERT INTO migrations VALUES("6","2018_02_27_101619_create_warehouse_table","1");
INSERT INTO migrations VALUES("7","2018_03_03_040448_create_units_table","1");
INSERT INTO migrations VALUES("8","2018_03_04_041317_create_taxes_table","1");
INSERT INTO migrations VALUES("9","2018_03_10_061915_create_customer_groups_table","1");
INSERT INTO migrations VALUES("10","2018_03_10_090534_create_customers_table","1");
INSERT INTO migrations VALUES("11","2018_03_11_095547_create_billers_table","1");
INSERT INTO migrations VALUES("12","2018_04_05_054401_create_products_table","1");
INSERT INTO migrations VALUES("13","2018_04_06_133606_create_purchases_table","1");
INSERT INTO migrations VALUES("14","2018_04_06_154600_create_product_purchases_table","1");
INSERT INTO migrations VALUES("15","2018_04_06_154915_create_product_warhouse_table","1");
INSERT INTO migrations VALUES("16","2018_04_10_085927_create_sales_table","1");
INSERT INTO migrations VALUES("17","2018_04_10_090133_create_product_sales_table","1");
INSERT INTO migrations VALUES("18","2018_04_10_090254_create_payments_table","1");
INSERT INTO migrations VALUES("19","2018_04_10_090341_create_payment_with_cheque_table","1");
INSERT INTO migrations VALUES("20","2018_04_10_090509_create_payment_with_credit_card_table","1");
INSERT INTO migrations VALUES("21","2018_04_13_121436_create_quotation_table","1");
INSERT INTO migrations VALUES("22","2018_04_13_122324_create_product_quotation_table","1");
INSERT INTO migrations VALUES("23","2018_04_14_121802_create_transfers_table","1");
INSERT INTO migrations VALUES("24","2018_04_14_121913_create_product_transfer_table","1");
INSERT INTO migrations VALUES("25","2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table","2");
INSERT INTO migrations VALUES("26","2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table","3");
INSERT INTO migrations VALUES("27","2018_05_20_054532_create_adjustments_table","4");
INSERT INTO migrations VALUES("28","2018_05_20_054859_create_product_adjustments_table","4");
INSERT INTO migrations VALUES("29","2018_05_21_163419_create_returns_table","5");
INSERT INTO migrations VALUES("30","2018_05_21_163443_create_product_returns_table","5");
INSERT INTO migrations VALUES("31","2018_06_02_050905_create_roles_table","6");
INSERT INTO migrations VALUES("32","2018_06_02_073430_add_columns_to_users_table","7");
INSERT INTO migrations VALUES("33","2018_06_03_053738_create_permission_tables","8");
INSERT INTO migrations VALUES("36","2018_06_21_063736_create_pos_setting_table","9");
INSERT INTO migrations VALUES("37","2018_06_21_094155_add_user_id_to_sales_table","10");
INSERT INTO migrations VALUES("38","2018_06_21_101529_add_user_id_to_purchases_table","11");
INSERT INTO migrations VALUES("39","2018_06_21_103512_add_user_id_to_transfers_table","12");
INSERT INTO migrations VALUES("40","2018_06_23_061058_add_user_id_to_quotations_table","13");
INSERT INTO migrations VALUES("41","2018_06_23_082427_add_is_deleted_to_users_table","14");
INSERT INTO migrations VALUES("42","2018_06_25_043308_change_email_to_users_table","15");
INSERT INTO migrations VALUES("43","2018_07_06_115449_create_general_settings_table","16");
INSERT INTO migrations VALUES("44","2018_07_08_043944_create_languages_table","17");
INSERT INTO migrations VALUES("45","2018_07_11_102144_add_user_id_to_returns_table","18");
INSERT INTO migrations VALUES("46","2018_07_11_102334_add_user_id_to_payments_table","18");
INSERT INTO migrations VALUES("47","2018_07_22_130541_add_digital_to_products_table","19");
INSERT INTO migrations VALUES("49","2018_07_24_154250_create_deliveries_table","20");
INSERT INTO migrations VALUES("50","2018_08_16_053336_create_expense_categories_table","21");
INSERT INTO migrations VALUES("51","2018_08_17_115415_create_expenses_table","22");
INSERT INTO migrations VALUES("55","2018_08_18_050418_create_gift_cards_table","23");
INSERT INTO migrations VALUES("56","2018_08_19_063119_create_payment_with_gift_card_table","24");
INSERT INTO migrations VALUES("57","2018_08_25_042333_create_gift_card_recharges_table","25");
INSERT INTO migrations VALUES("58","2018_08_25_101354_add_deposit_expense_to_customers_table","26");
INSERT INTO migrations VALUES("59","2018_08_26_043801_create_deposits_table","27");
INSERT INTO migrations VALUES("60","2018_09_02_044042_add_keybord_active_to_pos_setting_table","28");
INSERT INTO migrations VALUES("61","2018_09_09_092713_create_payment_with_paypal_table","29");
INSERT INTO migrations VALUES("62","2018_09_10_051254_add_currency_to_general_settings_table","30");
INSERT INTO migrations VALUES("63","2018_10_22_084118_add_biller_and_store_id_to_users_table","31");
INSERT INTO migrations VALUES("65","2018_10_26_034927_create_coupons_table","32");
INSERT INTO migrations VALUES("66","2018_10_27_090857_add_coupon_to_sales_table","33");
INSERT INTO migrations VALUES("67","2018_11_07_070155_add_currency_position_to_general_settings_table","34");
INSERT INTO migrations VALUES("68","2018_11_19_094650_add_combo_to_products_table","35");
INSERT INTO migrations VALUES("69","2018_12_09_043712_create_accounts_table","36");
INSERT INTO migrations VALUES("70","2018_12_17_112253_add_is_default_to_accounts_table","37");
INSERT INTO migrations VALUES("71","2018_12_19_103941_add_account_id_to_payments_table","38");
INSERT INTO migrations VALUES("72","2018_12_20_065900_add_account_id_to_expenses_table","39");
INSERT INTO migrations VALUES("73","2018_12_20_082753_add_account_id_to_returns_table","40");
INSERT INTO migrations VALUES("74","2018_12_26_064330_create_return_purchases_table","41");
INSERT INTO migrations VALUES("75","2018_12_26_144210_create_purchase_product_return_table","42");
INSERT INTO migrations VALUES("76","2018_12_26_144708_create_purchase_product_return_table","43");
INSERT INTO migrations VALUES("77","2018_12_27_110018_create_departments_table","44");
INSERT INTO migrations VALUES("78","2018_12_30_054844_create_employees_table","45");
INSERT INTO migrations VALUES("79","2018_12_31_125210_create_payrolls_table","46");
INSERT INTO migrations VALUES("80","2018_12_31_150446_add_department_id_to_employees_table","47");
INSERT INTO migrations VALUES("81","2019_01_01_062708_add_user_id_to_expenses_table","48");
INSERT INTO migrations VALUES("82","2019_01_02_075644_create_hrm_settings_table","49");
INSERT INTO migrations VALUES("83","2019_01_02_090334_create_attendances_table","50");
INSERT INTO migrations VALUES("84","2019_01_27_160956_add_three_columns_to_general_settings_table","51");
INSERT INTO migrations VALUES("85","2019_02_15_183303_create_stock_counts_table","52");
INSERT INTO migrations VALUES("86","2019_02_17_101604_add_is_adjusted_to_stock_counts_table","53");
INSERT INTO migrations VALUES("87","2019_04_13_101707_add_tax_no_to_customers_table","54");
INSERT INTO migrations VALUES("89","2019_10_14_111455_create_holidays_table","55");
INSERT INTO migrations VALUES("90","2019_11_13_145619_add_is_variant_to_products_table","56");
INSERT INTO migrations VALUES("91","2019_11_13_150206_create_product_variants_table","57");
INSERT INTO migrations VALUES("92","2019_11_13_153828_create_variants_table","57");
INSERT INTO migrations VALUES("93","2019_11_25_134041_add_qty_to_product_variants_table","58");
INSERT INTO migrations VALUES("94","2019_11_25_134922_add_variant_id_to_product_purchases_table","58");
INSERT INTO migrations VALUES("95","2019_11_25_145341_add_variant_id_to_product_warehouse_table","58");
INSERT INTO migrations VALUES("96","2019_11_29_182201_add_variant_id_to_product_sales_table","59");
INSERT INTO migrations VALUES("97","2019_12_04_121311_add_variant_id_to_product_quotation_table","60");
INSERT INTO migrations VALUES("98","2019_12_05_123802_add_variant_id_to_product_transfer_table","61");
INSERT INTO migrations VALUES("100","2019_12_08_114954_add_variant_id_to_product_returns_table","62");
INSERT INTO migrations VALUES("101","2019_12_08_203146_add_variant_id_to_purchase_product_return_table","63");
INSERT INTO migrations VALUES("102","2020_02_28_103340_create_money_transfers_table","64");
INSERT INTO migrations VALUES("103","2020_07_01_193151_add_image_to_categories_table","65");
INSERT INTO migrations VALUES("105","2020_09_26_130426_add_user_id_to_deliveries_table","66");
INSERT INTO migrations VALUES("107","2020_10_11_125457_create_cash_registers_table","67");
INSERT INTO migrations VALUES("108","2020_10_13_155019_add_cash_register_id_to_sales_table","68");
INSERT INTO migrations VALUES("109","2020_10_13_172624_add_cash_register_id_to_returns_table","69");
INSERT INTO migrations VALUES("110","2020_10_17_212338_add_cash_register_id_to_payments_table","70");
INSERT INTO migrations VALUES("111","2020_10_18_124200_add_cash_register_id_to_expenses_table","71");
INSERT INTO migrations VALUES("112","2020_10_21_121632_add_developed_by_to_general_settings_table","72");
INSERT INTO migrations VALUES("113","2019_08_19_000000_create_failed_jobs_table","73");
INSERT INTO migrations VALUES("114","2020_10_30_135557_create_notifications_table","73");
INSERT INTO migrations VALUES("115","2020_11_01_044954_create_currencies_table","74");
INSERT INTO migrations VALUES("116","2020_11_01_140736_add_price_to_product_warehouse_table","75");
INSERT INTO migrations VALUES("117","2020_11_02_050633_add_is_diff_price_to_products_table","76");
INSERT INTO migrations VALUES("118","2020_11_09_055222_add_user_id_to_customers_table","77");
INSERT INTO migrations VALUES("119","2020_11_17_054806_add_invoice_format_to_general_settings_table","78");
INSERT INTO migrations VALUES("120","2021_07_28_152353_add_nv_le_sph_to_customers_table","79");
INSERT INTO migrations VALUES("121","2022_03_24_215755_create_logo_settings_table","80");



CREATE TABLE `money_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO notifications VALUES("249beded-5431-40a3-ba1e-d255ffb047a3","App\Notifications\SendNotification","App\User","9","{"message":"Please delete all pending purchase."}","2020-11-01 06:33:32","2020-11-01 06:33:07","2020-11-01 06:33:32");
INSERT INTO notifications VALUES("5870cb87-9ff6-4364-833c-8d5911ee2001","App\Notifications\SendNotification","App\User","38","{"message":"Hey bro"}","","2021-12-25 00:18:33","2021-12-25 00:18:33");
INSERT INTO notifications VALUES("60df3140-0014-496c-867c-de5cb216a54f","App\Notifications\SendNotification","App\User","37","{"message":"Hey bro"}","","2021-12-25 00:17:44","2021-12-25 00:17:44");



CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_cheque` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_credit_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_gift_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_paypal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payrolls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES("4","products-edit","web","2018-06-03 06:00:09","2018-06-03 06:00:09");
INSERT INTO permissions VALUES("5","products-delete","web","2018-06-04 03:54:22","2018-06-04 03:54:22");
INSERT INTO permissions VALUES("6","products-add","web","2018-06-04 05:34:14","2018-06-04 05:34:14");
INSERT INTO permissions VALUES("7","products-index","web","2018-06-04 08:34:27","2018-06-04 08:34:27");
INSERT INTO permissions VALUES("8","purchases-index","web","2018-06-04 13:03:19","2018-06-04 13:03:19");
INSERT INTO permissions VALUES("9","purchases-add","web","2018-06-04 13:12:25","2018-06-04 13:12:25");
INSERT INTO permissions VALUES("10","purchases-edit","web","2018-06-04 14:47:36","2018-06-04 14:47:36");
INSERT INTO permissions VALUES("11","purchases-delete","web","2018-06-04 14:47:36","2018-06-04 14:47:36");
INSERT INTO permissions VALUES("12","sales-index","web","2018-06-04 15:49:08","2018-06-04 15:49:08");
INSERT INTO permissions VALUES("13","sales-add","web","2018-06-04 15:49:52","2018-06-04 15:49:52");
INSERT INTO permissions VALUES("14","sales-edit","web","2018-06-04 15:49:52","2018-06-04 15:49:52");
INSERT INTO permissions VALUES("15","sales-delete","web","2018-06-04 15:49:53","2018-06-04 15:49:53");
INSERT INTO permissions VALUES("16","quotes-index","web","2018-06-05 03:05:10","2018-06-05 03:05:10");
INSERT INTO permissions VALUES("17","quotes-add","web","2018-06-05 03:05:10","2018-06-05 03:05:10");
INSERT INTO permissions VALUES("18","quotes-edit","web","2018-06-05 03:05:10","2018-06-05 03:05:10");
INSERT INTO permissions VALUES("19","quotes-delete","web","2018-06-05 03:05:10","2018-06-05 03:05:10");
INSERT INTO permissions VALUES("20","transfers-index","web","2018-06-05 03:30:03","2018-06-05 03:30:03");
INSERT INTO permissions VALUES("21","transfers-add","web","2018-06-05 03:30:03","2018-06-05 03:30:03");
INSERT INTO permissions VALUES("22","transfers-edit","web","2018-06-05 03:30:03","2018-06-05 03:30:03");
INSERT INTO permissions VALUES("23","transfers-delete","web","2018-06-05 03:30:03","2018-06-05 03:30:03");
INSERT INTO permissions VALUES("24","returns-index","web","2018-06-05 03:50:24","2018-06-05 03:50:24");
INSERT INTO permissions VALUES("25","returns-add","web","2018-06-05 03:50:24","2018-06-05 03:50:24");
INSERT INTO permissions VALUES("26","returns-edit","web","2018-06-05 03:50:25","2018-06-05 03:50:25");
INSERT INTO permissions VALUES("27","returns-delete","web","2018-06-05 03:50:25","2018-06-05 03:50:25");
INSERT INTO permissions VALUES("28","customers-index","web","2018-06-05 04:15:54","2018-06-05 04:15:54");
INSERT INTO permissions VALUES("29","customers-add","web","2018-06-05 04:15:55","2018-06-05 04:15:55");
INSERT INTO permissions VALUES("30","customers-edit","web","2018-06-05 04:15:55","2018-06-05 04:15:55");
INSERT INTO permissions VALUES("31","customers-delete","web","2018-06-05 04:15:55","2018-06-05 04:15:55");
INSERT INTO permissions VALUES("32","suppliers-index","web","2018-06-05 04:40:12","2018-06-05 04:40:12");
INSERT INTO permissions VALUES("33","suppliers-add","web","2018-06-05 04:40:12","2018-06-05 04:40:12");
INSERT INTO permissions VALUES("34","suppliers-edit","web","2018-06-05 04:40:12","2018-06-05 04:40:12");
INSERT INTO permissions VALUES("35","suppliers-delete","web","2018-06-05 04:40:12","2018-06-05 04:40:12");
INSERT INTO permissions VALUES("36","product-report","web","2018-06-25 04:05:33","2018-06-25 04:05:33");
INSERT INTO permissions VALUES("37","purchase-report","web","2018-06-25 04:24:56","2018-06-25 04:24:56");
INSERT INTO permissions VALUES("38","sale-report","web","2018-06-25 04:33:13","2018-06-25 04:33:13");
INSERT INTO permissions VALUES("39","customer-report","web","2018-06-25 04:36:51","2018-06-25 04:36:51");
INSERT INTO permissions VALUES("40","due-report","web","2018-06-25 04:39:52","2018-06-25 04:39:52");
INSERT INTO permissions VALUES("41","users-index","web","2018-06-25 05:00:10","2018-06-25 05:00:10");
INSERT INTO permissions VALUES("42","users-add","web","2018-06-25 05:00:10","2018-06-25 05:00:10");
INSERT INTO permissions VALUES("43","users-edit","web","2018-06-25 05:01:30","2018-06-25 05:01:30");
INSERT INTO permissions VALUES("44","users-delete","web","2018-06-25 05:01:30","2018-06-25 05:01:30");
INSERT INTO permissions VALUES("45","profit-loss","web","2018-07-15 02:50:05","2018-07-15 02:50:05");
INSERT INTO permissions VALUES("46","best-seller","web","2018-07-15 03:01:38","2018-07-15 03:01:38");
INSERT INTO permissions VALUES("47","daily-sale","web","2018-07-15 03:24:21","2018-07-15 03:24:21");
INSERT INTO permissions VALUES("48","monthly-sale","web","2018-07-15 03:30:41","2018-07-15 03:30:41");
INSERT INTO permissions VALUES("49","daily-purchase","web","2018-07-15 03:36:46","2018-07-15 03:36:46");
INSERT INTO permissions VALUES("50","monthly-purchase","web","2018-07-15 03:48:17","2018-07-15 03:48:17");
INSERT INTO permissions VALUES("51","payment-report","web","2018-07-15 04:10:41","2018-07-15 04:10:41");
INSERT INTO permissions VALUES("52","warehouse-stock-report","web","2018-07-15 04:16:55","2018-07-15 04:16:55");
INSERT INTO permissions VALUES("53","product-qty-alert","web","2018-07-15 04:33:21","2018-07-15 04:33:21");
INSERT INTO permissions VALUES("54","supplier-report","web","2018-07-30 08:00:01","2018-07-30 08:00:01");
INSERT INTO permissions VALUES("55","expenses-index","web","2018-09-05 06:07:10","2018-09-05 06:07:10");
INSERT INTO permissions VALUES("56","expenses-add","web","2018-09-05 06:07:10","2018-09-05 06:07:10");
INSERT INTO permissions VALUES("57","expenses-edit","web","2018-09-05 06:07:10","2018-09-05 06:07:10");
INSERT INTO permissions VALUES("58","expenses-delete","web","2018-09-05 06:07:11","2018-09-05 06:07:11");
INSERT INTO permissions VALUES("59","general_setting","web","2018-10-20 04:10:04","2018-10-20 04:10:04");
INSERT INTO permissions VALUES("60","mail_setting","web","2018-10-20 04:10:04","2018-10-20 04:10:04");
INSERT INTO permissions VALUES("61","pos_setting","web","2018-10-20 04:10:04","2018-10-20 04:10:04");
INSERT INTO permissions VALUES("62","hrm_setting","web","2019-01-02 15:30:23","2019-01-02 15:30:23");
INSERT INTO permissions VALUES("63","purchase-return-index","web","2019-01-03 02:45:14","2019-01-03 02:45:14");
INSERT INTO permissions VALUES("64","purchase-return-add","web","2019-01-03 02:45:14","2019-01-03 02:45:14");
INSERT INTO permissions VALUES("65","purchase-return-edit","web","2019-01-03 02:45:14","2019-01-03 02:45:14");
INSERT INTO permissions VALUES("66","purchase-return-delete","web","2019-01-03 02:45:14","2019-01-03 02:45:14");
INSERT INTO permissions VALUES("67","account-index","web","2019-01-03 03:06:13","2019-01-03 03:06:13");
INSERT INTO permissions VALUES("68","balance-sheet","web","2019-01-03 03:06:14","2019-01-03 03:06:14");
INSERT INTO permissions VALUES("69","account-statement","web","2019-01-03 03:06:14","2019-01-03 03:06:14");
INSERT INTO permissions VALUES("70","department","web","2019-01-03 03:30:01","2019-01-03 03:30:01");
INSERT INTO permissions VALUES("71","attendance","web","2019-01-03 03:30:01","2019-01-03 03:30:01");
INSERT INTO permissions VALUES("72","payroll","web","2019-01-03 03:30:01","2019-01-03 03:30:01");
INSERT INTO permissions VALUES("73","employees-index","web","2019-01-03 03:52:19","2019-01-03 03:52:19");
INSERT INTO permissions VALUES("74","employees-add","web","2019-01-03 03:52:19","2019-01-03 03:52:19");
INSERT INTO permissions VALUES("75","employees-edit","web","2019-01-03 03:52:19","2019-01-03 03:52:19");
INSERT INTO permissions VALUES("76","employees-delete","web","2019-01-03 03:52:19","2019-01-03 03:52:19");
INSERT INTO permissions VALUES("77","user-report","web","2019-01-16 11:48:18","2019-01-16 11:48:18");
INSERT INTO permissions VALUES("78","stock_count","web","2019-02-17 15:32:01","2019-02-17 15:32:01");
INSERT INTO permissions VALUES("79","adjustment","web","2019-02-17 15:32:02","2019-02-17 15:32:02");
INSERT INTO permissions VALUES("80","sms_setting","web","2019-02-22 10:18:03","2019-02-22 10:18:03");
INSERT INTO permissions VALUES("81","create_sms","web","2019-02-22 10:18:03","2019-02-22 10:18:03");
INSERT INTO permissions VALUES("82","print_barcode","web","2019-03-07 10:02:19","2019-03-07 10:02:19");
INSERT INTO permissions VALUES("83","empty_database","web","2019-03-07 10:02:19","2019-03-07 10:02:19");
INSERT INTO permissions VALUES("84","customer_group","web","2019-03-07 10:37:15","2019-03-07 10:37:15");
INSERT INTO permissions VALUES("85","unit","web","2019-03-07 10:37:15","2019-03-07 10:37:15");
INSERT INTO permissions VALUES("86","tax","web","2019-03-07 10:37:15","2019-03-07 10:37:15");
INSERT INTO permissions VALUES("87","gift_card","web","2019-03-07 11:29:38","2019-03-07 11:29:38");
INSERT INTO permissions VALUES("88","coupon","web","2019-03-07 11:29:38","2019-03-07 11:29:38");
INSERT INTO permissions VALUES("89","holiday","web","2019-10-19 13:57:15","2019-10-19 13:57:15");
INSERT INTO permissions VALUES("90","warehouse-report","web","2019-10-22 11:00:23","2019-10-22 11:00:23");
INSERT INTO permissions VALUES("91","warehouse","web","2020-02-26 11:47:32","2020-02-26 11:47:32");
INSERT INTO permissions VALUES("92","brand","web","2020-02-26 11:59:59","2020-02-26 11:59:59");
INSERT INTO permissions VALUES("93","billers-index","web","2020-02-26 12:11:15","2020-02-26 12:11:15");
INSERT INTO permissions VALUES("94","billers-add","web","2020-02-26 12:11:15","2020-02-26 12:11:15");
INSERT INTO permissions VALUES("95","billers-edit","web","2020-02-26 12:11:15","2020-02-26 12:11:15");
INSERT INTO permissions VALUES("96","billers-delete","web","2020-02-26 12:11:15","2020-02-26 12:11:15");
INSERT INTO permissions VALUES("97","money-transfer","web","2020-03-02 10:41:48","2020-03-02 10:41:48");
INSERT INTO permissions VALUES("98","category","web","2020-07-13 17:13:16","2020-07-13 17:13:16");
INSERT INTO permissions VALUES("99","delivery","web","2020-07-13 17:13:16","2020-07-13 17:13:16");
INSERT INTO permissions VALUES("100","send_notification","web","2020-10-31 11:21:31","2020-10-31 11:21:31");
INSERT INTO permissions VALUES("101","today_sale","web","2020-10-31 11:57:04","2020-10-31 11:57:04");
INSERT INTO permissions VALUES("102","today_profit","web","2020-10-31 11:57:04","2020-10-31 11:57:04");
INSERT INTO permissions VALUES("103","currency","web","2020-11-09 05:23:11","2020-11-09 05:23:11");
INSERT INTO permissions VALUES("104","backup_database","web","2020-11-15 05:16:55","2020-11-15 05:16:55");
INSERT INTO permissions VALUES("105","upload_logo","web","2022-03-25 02:47:14","2022-03-25 02:47:18");



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
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `pos_setting_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pos_setting VALUES("1","32","9","11","4","0","pk_test_ITN7KOYiIsHSCQ0UMRcgaYUB","sk_test_TtQQaawhEYRwa3mU9CzttrEy","2018-09-02 08:17:04","2021-12-21 04:31:40");



CREATE TABLE `product_adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_quotation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_warehouse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbology` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `purchase_unit_id` int(11) DEFAULT NULL,
  `sale_unit_id` int(11) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `purchase_product_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `quotations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `return_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO role_has_permissions VALUES("4","1");
INSERT INTO role_has_permissions VALUES("4","2");
INSERT INTO role_has_permissions VALUES("5","1");
INSERT INTO role_has_permissions VALUES("5","2");
INSERT INTO role_has_permissions VALUES("6","1");
INSERT INTO role_has_permissions VALUES("6","2");
INSERT INTO role_has_permissions VALUES("6","4");
INSERT INTO role_has_permissions VALUES("7","1");
INSERT INTO role_has_permissions VALUES("7","2");
INSERT INTO role_has_permissions VALUES("7","4");
INSERT INTO role_has_permissions VALUES("8","1");
INSERT INTO role_has_permissions VALUES("8","2");
INSERT INTO role_has_permissions VALUES("8","4");
INSERT INTO role_has_permissions VALUES("9","1");
INSERT INTO role_has_permissions VALUES("9","2");
INSERT INTO role_has_permissions VALUES("9","4");
INSERT INTO role_has_permissions VALUES("10","1");
INSERT INTO role_has_permissions VALUES("10","2");
INSERT INTO role_has_permissions VALUES("10","4");
INSERT INTO role_has_permissions VALUES("11","1");
INSERT INTO role_has_permissions VALUES("11","2");
INSERT INTO role_has_permissions VALUES("12","1");
INSERT INTO role_has_permissions VALUES("12","2");
INSERT INTO role_has_permissions VALUES("12","4");
INSERT INTO role_has_permissions VALUES("13","1");
INSERT INTO role_has_permissions VALUES("13","2");
INSERT INTO role_has_permissions VALUES("13","4");
INSERT INTO role_has_permissions VALUES("14","1");
INSERT INTO role_has_permissions VALUES("14","2");
INSERT INTO role_has_permissions VALUES("14","4");
INSERT INTO role_has_permissions VALUES("15","1");
INSERT INTO role_has_permissions VALUES("15","2");
INSERT INTO role_has_permissions VALUES("16","1");
INSERT INTO role_has_permissions VALUES("16","2");
INSERT INTO role_has_permissions VALUES("17","1");
INSERT INTO role_has_permissions VALUES("17","2");
INSERT INTO role_has_permissions VALUES("18","1");
INSERT INTO role_has_permissions VALUES("18","2");
INSERT INTO role_has_permissions VALUES("19","1");
INSERT INTO role_has_permissions VALUES("19","2");
INSERT INTO role_has_permissions VALUES("20","1");
INSERT INTO role_has_permissions VALUES("20","2");
INSERT INTO role_has_permissions VALUES("20","4");
INSERT INTO role_has_permissions VALUES("21","1");
INSERT INTO role_has_permissions VALUES("21","2");
INSERT INTO role_has_permissions VALUES("21","4");
INSERT INTO role_has_permissions VALUES("22","1");
INSERT INTO role_has_permissions VALUES("22","2");
INSERT INTO role_has_permissions VALUES("22","4");
INSERT INTO role_has_permissions VALUES("23","1");
INSERT INTO role_has_permissions VALUES("23","2");
INSERT INTO role_has_permissions VALUES("24","1");
INSERT INTO role_has_permissions VALUES("24","2");
INSERT INTO role_has_permissions VALUES("24","4");
INSERT INTO role_has_permissions VALUES("25","1");
INSERT INTO role_has_permissions VALUES("25","2");
INSERT INTO role_has_permissions VALUES("25","4");
INSERT INTO role_has_permissions VALUES("26","1");
INSERT INTO role_has_permissions VALUES("26","2");
INSERT INTO role_has_permissions VALUES("27","1");
INSERT INTO role_has_permissions VALUES("27","2");
INSERT INTO role_has_permissions VALUES("28","1");
INSERT INTO role_has_permissions VALUES("28","2");
INSERT INTO role_has_permissions VALUES("28","4");
INSERT INTO role_has_permissions VALUES("29","1");
INSERT INTO role_has_permissions VALUES("29","2");
INSERT INTO role_has_permissions VALUES("29","4");
INSERT INTO role_has_permissions VALUES("30","1");
INSERT INTO role_has_permissions VALUES("30","2");
INSERT INTO role_has_permissions VALUES("31","1");
INSERT INTO role_has_permissions VALUES("31","2");
INSERT INTO role_has_permissions VALUES("32","1");
INSERT INTO role_has_permissions VALUES("32","2");
INSERT INTO role_has_permissions VALUES("33","1");
INSERT INTO role_has_permissions VALUES("33","2");
INSERT INTO role_has_permissions VALUES("34","1");
INSERT INTO role_has_permissions VALUES("34","2");
INSERT INTO role_has_permissions VALUES("35","1");
INSERT INTO role_has_permissions VALUES("35","2");
INSERT INTO role_has_permissions VALUES("36","1");
INSERT INTO role_has_permissions VALUES("36","2");
INSERT INTO role_has_permissions VALUES("37","1");
INSERT INTO role_has_permissions VALUES("37","2");
INSERT INTO role_has_permissions VALUES("38","1");
INSERT INTO role_has_permissions VALUES("38","2");
INSERT INTO role_has_permissions VALUES("39","1");
INSERT INTO role_has_permissions VALUES("39","2");
INSERT INTO role_has_permissions VALUES("40","1");
INSERT INTO role_has_permissions VALUES("40","2");
INSERT INTO role_has_permissions VALUES("41","1");
INSERT INTO role_has_permissions VALUES("42","1");
INSERT INTO role_has_permissions VALUES("43","1");
INSERT INTO role_has_permissions VALUES("44","1");
INSERT INTO role_has_permissions VALUES("45","1");
INSERT INTO role_has_permissions VALUES("45","2");
INSERT INTO role_has_permissions VALUES("46","1");
INSERT INTO role_has_permissions VALUES("46","2");
INSERT INTO role_has_permissions VALUES("47","1");
INSERT INTO role_has_permissions VALUES("47","2");
INSERT INTO role_has_permissions VALUES("48","1");
INSERT INTO role_has_permissions VALUES("48","2");
INSERT INTO role_has_permissions VALUES("49","1");
INSERT INTO role_has_permissions VALUES("49","2");
INSERT INTO role_has_permissions VALUES("50","1");
INSERT INTO role_has_permissions VALUES("50","2");
INSERT INTO role_has_permissions VALUES("51","1");
INSERT INTO role_has_permissions VALUES("51","2");
INSERT INTO role_has_permissions VALUES("52","1");
INSERT INTO role_has_permissions VALUES("52","2");
INSERT INTO role_has_permissions VALUES("53","1");
INSERT INTO role_has_permissions VALUES("53","2");
INSERT INTO role_has_permissions VALUES("54","1");
INSERT INTO role_has_permissions VALUES("54","2");
INSERT INTO role_has_permissions VALUES("55","1");
INSERT INTO role_has_permissions VALUES("55","2");
INSERT INTO role_has_permissions VALUES("55","4");
INSERT INTO role_has_permissions VALUES("56","1");
INSERT INTO role_has_permissions VALUES("56","2");
INSERT INTO role_has_permissions VALUES("56","4");
INSERT INTO role_has_permissions VALUES("57","1");
INSERT INTO role_has_permissions VALUES("57","2");
INSERT INTO role_has_permissions VALUES("57","4");
INSERT INTO role_has_permissions VALUES("58","1");
INSERT INTO role_has_permissions VALUES("58","2");
INSERT INTO role_has_permissions VALUES("59","1");
INSERT INTO role_has_permissions VALUES("60","1");
INSERT INTO role_has_permissions VALUES("60","2");
INSERT INTO role_has_permissions VALUES("61","1");
INSERT INTO role_has_permissions VALUES("62","1");
INSERT INTO role_has_permissions VALUES("62","2");
INSERT INTO role_has_permissions VALUES("63","1");
INSERT INTO role_has_permissions VALUES("63","2");
INSERT INTO role_has_permissions VALUES("63","4");
INSERT INTO role_has_permissions VALUES("64","1");
INSERT INTO role_has_permissions VALUES("64","2");
INSERT INTO role_has_permissions VALUES("64","4");
INSERT INTO role_has_permissions VALUES("65","1");
INSERT INTO role_has_permissions VALUES("65","2");
INSERT INTO role_has_permissions VALUES("66","1");
INSERT INTO role_has_permissions VALUES("66","2");
INSERT INTO role_has_permissions VALUES("67","1");
INSERT INTO role_has_permissions VALUES("67","2");
INSERT INTO role_has_permissions VALUES("68","1");
INSERT INTO role_has_permissions VALUES("68","2");
INSERT INTO role_has_permissions VALUES("69","1");
INSERT INTO role_has_permissions VALUES("69","2");
INSERT INTO role_has_permissions VALUES("70","1");
INSERT INTO role_has_permissions VALUES("70","2");
INSERT INTO role_has_permissions VALUES("71","1");
INSERT INTO role_has_permissions VALUES("71","2");
INSERT INTO role_has_permissions VALUES("72","1");
INSERT INTO role_has_permissions VALUES("72","2");
INSERT INTO role_has_permissions VALUES("73","1");
INSERT INTO role_has_permissions VALUES("73","2");
INSERT INTO role_has_permissions VALUES("74","1");
INSERT INTO role_has_permissions VALUES("74","2");
INSERT INTO role_has_permissions VALUES("75","1");
INSERT INTO role_has_permissions VALUES("75","2");
INSERT INTO role_has_permissions VALUES("76","1");
INSERT INTO role_has_permissions VALUES("76","2");
INSERT INTO role_has_permissions VALUES("77","1");
INSERT INTO role_has_permissions VALUES("77","2");
INSERT INTO role_has_permissions VALUES("78","1");
INSERT INTO role_has_permissions VALUES("78","2");
INSERT INTO role_has_permissions VALUES("79","1");
INSERT INTO role_has_permissions VALUES("79","2");
INSERT INTO role_has_permissions VALUES("80","1");
INSERT INTO role_has_permissions VALUES("80","2");
INSERT INTO role_has_permissions VALUES("81","1");
INSERT INTO role_has_permissions VALUES("81","2");
INSERT INTO role_has_permissions VALUES("82","1");
INSERT INTO role_has_permissions VALUES("82","2");
INSERT INTO role_has_permissions VALUES("83","1");
INSERT INTO role_has_permissions VALUES("83","2");
INSERT INTO role_has_permissions VALUES("84","1");
INSERT INTO role_has_permissions VALUES("84","2");
INSERT INTO role_has_permissions VALUES("85","1");
INSERT INTO role_has_permissions VALUES("85","2");
INSERT INTO role_has_permissions VALUES("86","1");
INSERT INTO role_has_permissions VALUES("86","2");
INSERT INTO role_has_permissions VALUES("87","1");
INSERT INTO role_has_permissions VALUES("87","2");
INSERT INTO role_has_permissions VALUES("88","1");
INSERT INTO role_has_permissions VALUES("88","2");
INSERT INTO role_has_permissions VALUES("89","1");
INSERT INTO role_has_permissions VALUES("89","2");
INSERT INTO role_has_permissions VALUES("90","1");
INSERT INTO role_has_permissions VALUES("90","2");
INSERT INTO role_has_permissions VALUES("91","1");
INSERT INTO role_has_permissions VALUES("91","2");
INSERT INTO role_has_permissions VALUES("92","1");
INSERT INTO role_has_permissions VALUES("92","2");
INSERT INTO role_has_permissions VALUES("93","1");
INSERT INTO role_has_permissions VALUES("94","1");
INSERT INTO role_has_permissions VALUES("95","1");
INSERT INTO role_has_permissions VALUES("96","1");
INSERT INTO role_has_permissions VALUES("97","1");
INSERT INTO role_has_permissions VALUES("97","2");
INSERT INTO role_has_permissions VALUES("98","1");
INSERT INTO role_has_permissions VALUES("98","2");
INSERT INTO role_has_permissions VALUES("99","1");
INSERT INTO role_has_permissions VALUES("99","2");
INSERT INTO role_has_permissions VALUES("100","1");
INSERT INTO role_has_permissions VALUES("100","2");
INSERT INTO role_has_permissions VALUES("101","1");
INSERT INTO role_has_permissions VALUES("101","2");
INSERT INTO role_has_permissions VALUES("102","1");
INSERT INTO role_has_permissions VALUES("102","2");
INSERT INTO role_has_permissions VALUES("103","1");
INSERT INTO role_has_permissions VALUES("103","2");
INSERT INTO role_has_permissions VALUES("104","1");
INSERT INTO role_has_permissions VALUES("104","2");
INSERT INTO role_has_permissions VALUES("105","2");



CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","Admin","Access to everything","web","1","2018-06-02 04:46:44","2021-12-20 22:31:44");
INSERT INTO roles VALUES("2","Owner","Owner of shop...","web","1","2018-10-22 07:38:13","2018-10-22 07:38:13");
INSERT INTO roles VALUES("4","Team","Team","web","1","2018-06-02 05:05:27","2021-12-20 22:31:29");
INSERT INTO roles VALUES("5","Customer","","web","1","2020-11-05 11:43:16","2020-11-15 05:24:15");



CREATE TABLE `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `payment_status` int(11) DEFAULT NULL,
  `card_payment` float DEFAULT NULL,
  `cash_payment` float DEFAULT NULL,
  `cheque_payment` float DEFAULT NULL,
  `e_transfer_payment` float DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `stock_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO stock_counts VALUES("2","scr-20220102-104003","9","","","1","full","20220102-104003.csv","","","0","2022-01-02 22:40:03","2022-01-02 22:40:03");



CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO suppliers VALUES("7","Maya Cellular Parts","","Maya Cellular Parts","","","(424)248-3896","","","","","","1","2021-12-20 22:36:16","2021-12-20 22:36:16");



CREATE TABLE `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO taxes VALUES("1","vat@10","10","0","2018-05-12 14:58:30","2021-12-03 19:39:18");
INSERT INTO taxes VALUES("2","vat@15","15","0","2018-05-12 14:58:43","2021-12-03 19:39:18");
INSERT INTO taxes VALUES("3","test","6","0","2018-05-28 04:32:54","2018-05-28 04:34:44");
INSERT INTO taxes VALUES("4","vat 20","20","0","2018-09-01 05:58:57","2021-12-03 19:39:18");
INSERT INTO taxes VALUES("5","Lake Elsinore","8.75","1","2021-12-03 19:39:11","2021-12-20 22:38:56");
INSERT INTO taxes VALUES("6","Wildomar","8.75","1","2021-12-20 22:39:10","2021-12-20 22:39:10");



CREATE TABLE `transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO units VALUES("1","pc","Piece","","*","1","1","2018-05-12 07:27:46","2021-12-22 22:09:10");
INSERT INTO units VALUES("2","dozen","dozen box","1","*","12","0","2018-05-12 14:57:05","2021-12-20 21:44:14");
INSERT INTO units VALUES("3","cartoon","cartoon box","1","*","24","0","2018-05-12 14:57:45","2021-12-20 21:44:14");
INSERT INTO units VALUES("4","m","meter","","*","1","0","2018-05-12 14:58:07","2021-12-20 21:44:14");
INSERT INTO units VALUES("6","test","test","","*","1","0","2018-05-28 04:20:20","2018-05-28 04:20:25");
INSERT INTO units VALUES("7","kg","kilogram","","*","1","0","2018-06-25 05:49:26","2021-12-20 22:37:30");
INSERT INTO units VALUES("8","20","ni33","8","*","1","0","2018-08-01 03:35:51","2018-08-01 03:40:54");
INSERT INTO units VALUES("9","gm","gram","7","/","1000","0","2018-09-01 05:06:28","2021-12-20 21:44:14");
INSERT INTO units VALUES("10","gz","goz","","*","1","0","2018-11-29 08:40:29","2019-03-02 16:53:29");
INSERT INTO units VALUES("11","Service","Service","","*","1","0","2021-12-20 21:27:36","2021-12-22 14:57:04");
INSERT INTO units VALUES("12","labor","Labor","","*","1","1","2021-12-20 21:51:40","2021-12-20 21:51:40");



CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","admin","admin@gmail.com","$2y$10$QhkmhP.JDnsOFcDjF5vDNujuxzdJlSiU1BPSUSzKk.kAsgGEcEwqa","QWFnLvRjTe9obS5yB5YYy5CZzh2v663QJsfwSCzbhdwr1TvbdgVPolbkeDOA","12112","911Gadget","1","","","1","1","2018-06-02 08:24:15","2022-01-15 20:04:36");
INSERT INTO users VALUES("37","Adrian Amrel","adrianlermaa@yahoo.com","$2y$10$QhkmhP.JDnsOFcDjF5vDNujuxzdJlSiU1BPSUSzKk.kAsgGEcEwqa","","3237169175","","4","11","9","0","1","2021-12-20 22:26:33","2022-01-15 20:04:36");
INSERT INTO users VALUES("38","Spencer Clingman","notfortheflesh@gmail.com","$2y$10$Q943s3jAqAwmnn6gne/xxucWyVGxPQPKkvd7clQZB/peClnyfSA3m","","9513997911","","4","12","10","0","1","2021-12-20 22:27:34","2022-01-15 20:04:36");
INSERT INTO users VALUES("39","javid","javidiqbals@gmail.com","$2y$10$QhkmhP.JDnsOFcDjF5vDNujuxzdJlSiU1BPSUSzKk.kAsgGEcEwqa","","03346974159","softageage","5","","","0","1","2021-12-30 22:39:41","2022-01-15 20:04:36");
INSERT INTO users VALUES("40","ALI","aliwazir101@gmail.com","$2y$10$QTbGngS52J1MzCf55icCWe0IAc8TkEXJMcnBm494OW5vB6WaulvF6","","123456789","Softage","5","","","0","1","2022-01-01 02:22:22","2022-01-15 20:04:36");
INSERT INTO users VALUES("41","Georgina Chavez","az003777@yahoo.com","$2y$10$FqSdJc4kseehqjRJJwWYX.WRxiZ.BolS6MLX1TXGJsRq1DI8A.Wd.","","9154225182","","4","13","11","0","1","2022-01-03 17:26:59","2022-01-15 20:04:36");
INSERT INTO users VALUES("42","Wendy Amrel","cu018246@gmail.com","$2y$10$pLnUmvCGueGJukFhtJwgy.hMv5V0xp.bK1tv3XuS/nE46Zhd1Ryta","","3237169174","","4","11","9","0","1","2022-01-03 17:30:48","2022-01-15 20:04:36");
INSERT INTO users VALUES("44","adrianamrel","contact@911gadgets.com","$2y$10$QhkmhP.JDnsOFcDjF5vDNujuxzdJlSiU1BPSUSzKk.kAsgGEcEwqa","","9513997911","911 Gadgets","2","11","13","1","0","2022-01-15 20:27:02","2022-01-21 07:15:04");
INSERT INTO users VALUES("48","umer3d","umer3d@yopmail.com","$2y$10$XFC4xJXqwYkh3ggmtBmqsOqn2BeasrkKgJ3LinXTWyjJR4AyYn7xK","","03152069236","Cyber Company","2","","12","1","0","2022-04-06 19:47:07","2022-04-06 19:47:07");



CREATE TABLE `variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `warehouses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO warehouses VALUES("9","Tuscany Hills","9513997911","contact@911gadgets.com","18 Della Cava Ln, Lake Elsinore, CA 92532","0","2021-12-03 18:51:04","2022-01-15 20:04:04");
INSERT INTO warehouses VALUES("10","Wildomar","9514503451","gadgetsmurrieta@gmail.com","25015 Palomasr","0","2021-12-04 14:11:22","2022-01-15 20:04:04");
INSERT INTO warehouses VALUES("11","El Paso","9514225182","adrianlermaa@yahoo.com","7127 North Loop Dr, El Paso, Texas 79915","0","2022-01-03 16:35:45","2022-01-15 20:04:04");
INSERT INTO warehouses VALUES("12","911 Gadgets Tuscany Hills","9513997911","contact@911gadgets.com","18 Della Cava Ln, Lake Elsinore, CA 92532","1","2022-01-15 20:21:26","2022-01-15 20:21:26");
INSERT INTO warehouses VALUES("13","Midway Cell Phone Repair","7735847592","midwaycellphone@gmail.com","4887 S Archer Ave Suite B, Chicago, IL 60632","1","2022-01-15 20:23:53","2022-01-15 20:23:53");

