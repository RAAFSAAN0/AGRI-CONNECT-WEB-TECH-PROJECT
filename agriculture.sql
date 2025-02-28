-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2025 at 05:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agriculture`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `role` enum('Admin','User','Super Admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `dob`, `role`) VALUES
(1, 'Ishtiak', 'Emon', 'ishtiak@gmail.com', 'Emon1', '01310903819', '2002-12-10', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `crop_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price_per_kg` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `crop_id`, `quantity`, `price_per_kg`, `total_price`, `added_at`, `updated_at`) VALUES
(112, 11, 49, 4, 40.00, 160.00, '2025-01-21 20:56:23', '2025-01-21 20:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `consumer`
--

CREATE TABLE `consumer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `dob` date NOT NULL,
  `role` enum('Consumer','Admin') NOT NULL,
  `profile_image` varchar(255) DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consumer`
--

INSERT INTO `consumer` (`id`, `first_name`, `last_name`, `email`, `mobile`, `password`, `country`, `address`, `dob`, `role`, `profile_image`) VALUES
(1, 'Sakib', 'Al Hasan', 'sakib.ahsan@gmail.com', '01987654321', 'password123', 'Bangladesh', 'Dhaka, Banani, 1234', '1990-01-01', '', 'profile1.jpg'),
(2, 'Mahi', 'Hasan', 'mahi.hasan@gmail.com', '01976543210', 'password234', 'Bangladesh', 'Chittagong, Agrabad, 5678', '1992-02-02', 'Admin', 'profile2.jpg'),
(3, 'Shakil', 'Ahmed', 'shakil.ahmed@gmail.com', '01834567890', 'password345', 'Bangladesh', 'Sylhet, Zindabazar, 9101', '1993-03-03', '', 'profile3.jpg'),
(4, 'Ratul', 'Islam', 'ratul.islam@gmail.com', '01723456789', 'password456', 'Bangladesh', 'Khulna, Sonadanga, 1122', '1995-04-04', '', 'profile4.jpg'),
(5, 'Fahim', 'Hossain', 'fahim.hossain@gmail.com', '01654321098', 'password567', 'Bangladesh', 'Rajshahi, New Market, 3344', '1994-05-05', 'Admin', 'profile5.jpg'),
(6, 'Riya', 'Begum', 'riya.begum@gmail.com', '01901234567', 'password678', 'Bangladesh', 'Barisal, Kachubagan, 5566', '1996-06-06', '', 'profile6.jpg'),
(7, 'Anwar', 'Khan', 'anwar.khan@gmail.com', '01789012345', 'password789', 'Bangladesh', 'Narayanganj, Bandar, 7788', '1992-07-07', '', 'profile7.jpg'),
(8, 'Tania', 'Mia', 'tania.mia@gmail.com', '01823456789', 'password890', 'Bangladesh', 'Mymensingh, Station Rd, 9900', '1990-08-08', 'Admin', 'profile8.jpg'),
(9, 'Nashit', 'Farhan', 'nashit.farhan@gmail.com', '01723456701', 'password123', 'Bangladesh', 'Comilla, Kaptan Bazar, 2233', '1993-09-09', '', 'profile9.jpg'),
(10, 'Sharmin', 'Sultana', 'sharmin.sultana@gmail.com', '01934567890', 'password456', 'Bangladesh', 'Jessore, Bazar Rd, 4455', '1995-10-10', '', 'profile10.jpg'),
(11, 'Nazifa', 'Tabassum', 'nazifa@gmail.com', '01934567890', 'Nazifa1', 'Bangladesh', 'Jessore, Bazar Rd, 4455', '2002-10-10', '', 'profile10.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `consumer_account`
--

CREATE TABLE `consumer_account` (
  `account_id` int(11) NOT NULL,
  `consumer_id` int(11) NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consumer_account`
--

INSERT INTO `consumer_account` (`account_id`, `consumer_id`, `balance`, `created_at`, `updated_at`) VALUES
(18, 3, 1900.00, '2025-01-21 20:51:00', '2025-01-21 20:53:40'),
(19, 11, 15940.00, '2025-01-21 20:54:55', '2025-01-21 20:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `consumer_purchase`
--

CREATE TABLE `consumer_purchase` (
  `purchase_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `crop_id` int(11) NOT NULL,
  `amount_bought` decimal(10,2) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaction_type` enum('Mobile Banking','Retail Banking') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consumer_purchase`
--

INSERT INTO `consumer_purchase` (`purchase_id`, `user_id`, `crop_id`, `amount_bought`, `purchase_date`, `transaction_type`) VALUES
(176, 3, 45, 10.00, '2025-01-21 20:52:54', 'Mobile Banking'),
(177, 3, 46, 10.00, '2025-01-21 20:53:40', 'Retail Banking'),
(178, 11, 50, 2.00, '2025-01-21 20:55:33', 'Mobile Banking');

-- --------------------------------------------------------

--
-- Table structure for table `crop`
--

CREATE TABLE `crop` (
  `crop_id` int(11) NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `crop_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `quantity` float NOT NULL,
  `available_quantity` float NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crop`
--

INSERT INTO `crop` (`crop_id`, `farmer_id`, `crop_name`, `description`, `quantity`, `available_quantity`, `price`, `image`) VALUES
(45, 1, 'Rice', 'Locally grown miniket rice, suitable for daily meals', 100, 100, 75.00, '1737491658_rice.jpg'),
(46, 1, 'Potato', 'Fresh and high-quality potatoes from Barishal', 50, 50, 35.00, '1737491727_potato.jpg'),
(47, 1, 'Onion', 'Organic onions grown in the fields of Jessore', 100, 100, 120.00, '1737491910_onion.jpg'),
(48, 1, 'lettuce', 'Fresh lettuce, perfect for salads, grown in Sylhet', 2, 2, 200.00, '1737491970_lettuce.jpg'),
(49, 1, 'Tomato', 'Juicy and ripe tomatoes, harvested from Sylhet', 100, 100, 40.00, '1737492067_tomato.jpg'),
(50, 1, 'Cucumber', 'Fresh cucumbers grown in Gazipur', 55, 55, 30.00, '1737492112_cucumber.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `crop_exchange`
--

CREATE TABLE `crop_exchange` (
  `id` int(11) NOT NULL,
  `crop_name` varchar(255) NOT NULL,
  `crop_quantity` varchar(255) NOT NULL,
  `crop_description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crop_review`
--

CREATE TABLE `crop_review` (
  `id` int(11) NOT NULL,
  `crop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('Consumer','Farmer') NOT NULL,
  `review_text` text NOT NULL,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crop_review`
--

INSERT INTO `crop_review` (`id`, `crop_id`, `user_id`, `user_type`, `review_text`, `review_date`) VALUES
(111, 45, 3, 'Consumer', 'This is good Quality Rice', '2025-01-21 20:52:49'),
(112, 46, 3, 'Consumer', 'Great Quality', '2025-01-21 20:53:27');

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

CREATE TABLE `farmer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `role` enum('Farmer') NOT NULL DEFAULT 'Farmer',
  `profile_image` varchar(255) DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `farmer`
--

INSERT INTO `farmer` (`id`, `first_name`, `last_name`, `email`, `mobile`, `password`, `country`, `address`, `dob`, `role`, `profile_image`) VALUES
(1, 'Ishtiak', 'Emon', 'emon@gmail.com', '01987654321', 'Emon1', 'Bangladesh', 'Dhaka', '2002-12-10', 'Farmer', 'profile1.jpg'),
(2, 'Shahid', 'Rana', 'shahid.rana@gmail.com', '01976543210', 'password234', 'Bangladesh', 'Rajshahi, Puthia, 5678', '1987-02-02', 'Farmer', 'profile2.jpg'),
(3, 'Sultana', 'Begum', 'sultana.begum@gmail.com', '01834567890', 'password345', 'Bangladesh', 'Khulna, Dighalia, 9101', '1990-03-03', 'Farmer', 'profile3.jpg'),
(4, 'Masud', 'Ali', 'masud.ali@gmail.com', '01723456789', 'password456', 'Bangladesh', 'Sylhet, Beanibazar, 1122', '1992-04-04', 'Farmer', 'profile4.jpg'),
(5, 'Rokeya', 'Sultana', 'rokeya.sultana@gmail.com', '01654321098', 'password567', 'Bangladesh', 'Chittagong, Foy’s Lake, 3344', '1991-05-05', 'Farmer', 'profile5.jpg'),
(6, 'Jahangir', 'Hossain', 'jahangir.hossain@gmail.com', '01901234567', 'password678', 'Bangladesh', 'Mymensingh, Nandina, 5566', '1994-06-06', 'Farmer', 'profile6.jpg'),
(7, 'Fahima', 'Khatun', 'fahima.khatun@gmail.com', '01789012345', 'password789', 'Bangladesh', 'Barisal, Banaripara, 7788', '1993-07-07', 'Farmer', 'profile7.jpg'),
(8, 'Shahin', 'Miah', 'shahin.miah@gmail.com', '01823456789', 'password890', 'Bangladesh', 'Comilla, Daudkandi, 9900', '1992-08-08', 'Farmer', 'profile8.jpg'),
(9, 'Rashida', 'Akter', 'rashida.akter@gmail.com', '01723456701', 'password123', 'Bangladesh', 'Narayanganj, Rupganj, 2233', '1995-09-09', 'Farmer', 'profile9.jpg'),
(10, 'Abul', 'Kashem', 'abul.kashem@gmail.com', '01934567890', 'password456', 'Bangladesh', 'Dhaka, Uttara, 4455', '1990-10-10', 'Farmer', 'profile10.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `role`, `email`, `content`, `created_at`) VALUES
(4, 'Farmer', 'emon@gmail.com', 'This is a post', '2025-01-21 20:46:31'),
(5, 'Student', 'raihan@gmail.com', 'What is the season for tomatoes?', '2025-01-21 20:59:53'),
(6, 'Student', 'momena.begum@yahoo.com', 'What is the ideal temperature for growing rice?', '2025-01-21 21:00:50'),
(7, 'Student', 'momena.begum@yahoo.com', 'When is the best time to plant paddy in Bangladesh?', '2025-01-21 21:00:58'),
(8, 'Student', 'sujon.mia@gmail.com', 'What type of soil is best for growing potatoes?', '2025-01-21 21:01:34'),
(9, 'Student', 'sujon.mia@gmail.com', 'What is the main nutrient required for healthy crop growth?', '2025-01-21 21:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `post_id`, `user_id`, `user_type`, `comment_text`, `comment_date`) VALUES
(6, 5, 4, 'Student', 'The best season for tomatoes is during the warmer months, typically from spring to summer.', '2025-01-21 21:00:33'),
(7, 7, 5, 'Student', 'The ideal time to plant paddy is from June to July during the monsoon season.', '2025-01-21 21:01:58');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `dob` date NOT NULL,
  `role` enum('Student') NOT NULL,
  `profile_image` varchar(255) DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `first_name`, `last_name`, `email`, `mobile`, `password`, `country`, `address`, `dob`, `role`, `profile_image`) VALUES
(1, 'Rakib', 'Hossain', 'rakib.hossain@gmail.com', '01711223344', 'password123', 'Bangladesh', '123 Shahbagh, Dhaka', '1998-04-10', 'Student', 'rakib_hossain.jpg'),
(2, 'Sadia', 'Ahmed', 'sadia.ahmed@yahoo.com', '01922334455', 'password456', 'Bangladesh', '456 Banani, Dhaka', '1997-06-12', 'Student', 'sadia_ahmed.jpg'),
(3, 'Aminul', 'Islam', 'aminul.islam@gmail.com', '01833445566', 'password789', 'Bangladesh', '789 Dhanmondi, Dhaka', '1995-11-23', 'Student', 'aminul_islam.jpg'),
(4, 'Momena', 'Begum', 'momena.begum@yahoo.com', '01744556677', 'password102', 'Bangladesh', '321 Mirpur, Dhaka', '1996-09-05', 'Student', 'momena_begum.jpg'),
(5, 'Sujon', 'Mia', 'sujon.mia@gmail.com', '01655667788', 'password111', 'Bangladesh', '123 Uttara, Dhaka', '1999-01-15', 'Student', 'sujon_mia.jpg'),
(6, 'Rima', 'Khatun', 'rima.khatun@yahoo.com', '01766778899', 'password222', 'Bangladesh', '456 Bashundhara, Dhaka', '1998-12-25', 'Student', 'rima_khatun.jpg'),
(7, 'Shahin', 'Alam', 'shahin.alam@gmail.com', '01977889900', 'password333', 'Bangladesh', '789 Mohammadpur, Dhaka', '1997-08-30', 'Student', 'shahin_alam.jpg'),
(8, 'Niloy', 'Chowdhury', 'niloy.chowdhury@yahoo.com', '01888990011', 'password444', 'Bangladesh', '321 Gulshan, Dhaka', '1995-03-20', 'Student', 'niloy_chowdhury.jpg'),
(9, 'Nadia', 'Sultana', 'nadia.sultana@gmail.com', '01799001122', 'password555', 'Bangladesh', '654 Khilgaon, Dhaka', '1996-07-08', 'Student', 'nadia_sultana.jpg'),
(10, 'Raihan', 'Parvez', 'raihan@gmail.com', '01822334455', 'Raihan1', 'Bangladesh', '987 New Market, Dhaka', '1998-10-18', 'Student', 'imran_rahman.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `video_path` varchar(255) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) DEFAULT 0,
  `dislikes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `email`, `title`, `description`, `video_path`, `upload_date`, `likes`, `dislikes`) VALUES
(23, 'ddd@gmail.com', 'hold a', 'hosdasdfas', 'C:/xampp/htdocs/agri20/asset/video/video_677f68656c83f.mp4', '2025-01-09 01:10:45', 29, 26),
(24, 'ddd@gmail.com', 'dd', 'dd', 'C:/xampp/htdocs/agri20/asset/video/video_67890e20535f3.mp4', '2025-01-16 08:48:16', 9, 5),
(25, 'mahmudrafsan099@yahoo.comaa', 'another video ', 'asdjfaskdfkjasdhfljsadhfkjsahdf kjasdhfjkasd f kjashfjkasdnf kjassdhfjasdhf', 'C:/xampp/htdocs/agri20/asset/video/video_6789238fe3969.mp4', '2025-01-16 10:19:43', 0, 0),
(26, 'mahmudrafsan099@yahoo.comaa', 'ss', 'ss', '../asset/videos/1737228281_4k.mp4', '2025-01-18 19:24:41', 0, 0),
(28, 'cr7@gmail.com', 'sadf', 'sadf', '../asset/videos/1737228939_4k.mp4', '2025-01-18 19:35:39', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `video_comments`
--

CREATE TABLE `video_comments` (
  `id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('Consumer','Student') NOT NULL,
  `comment_text` text NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `crop_id` (`crop_id`);

--
-- Indexes for table `consumer`
--
ALTER TABLE `consumer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `consumer_account`
--
ALTER TABLE `consumer_account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `consumer_id` (`consumer_id`);

--
-- Indexes for table `consumer_purchase`
--
ALTER TABLE `consumer_purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `crop_id` (`crop_id`);

--
-- Indexes for table `crop`
--
ALTER TABLE `crop`
  ADD PRIMARY KEY (`crop_id`),
  ADD KEY `farmer_id` (`farmer_id`);

--
-- Indexes for table `crop_exchange`
--
ALTER TABLE `crop_exchange`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crop_review`
--
ALTER TABLE `crop_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crop_id` (`crop_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `farmer`
--
ALTER TABLE `farmer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_comments`
--
ALTER TABLE `video_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `consumer`
--
ALTER TABLE `consumer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `consumer_account`
--
ALTER TABLE `consumer_account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `consumer_purchase`
--
ALTER TABLE `consumer_purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `crop`
--
ALTER TABLE `crop`
  MODIFY `crop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `crop_exchange`
--
ALTER TABLE `crop_exchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crop_review`
--
ALTER TABLE `crop_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `farmer`
--
ALTER TABLE `farmer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `video_comments`
--
ALTER TABLE `video_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `consumer` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`crop_id`) REFERENCES `crop` (`crop_id`);

--
-- Constraints for table `consumer_account`
--
ALTER TABLE `consumer_account`
  ADD CONSTRAINT `consumer_account_ibfk_1` FOREIGN KEY (`consumer_id`) REFERENCES `consumer` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `consumer_purchase`
--
ALTER TABLE `consumer_purchase`
  ADD CONSTRAINT `consumer_purchase_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `consumer` (`id`),
  ADD CONSTRAINT `consumer_purchase_ibfk_2` FOREIGN KEY (`crop_id`) REFERENCES `crop` (`crop_id`);

--
-- Constraints for table `crop`
--
ALTER TABLE `crop`
  ADD CONSTRAINT `crop_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id`);

--
-- Constraints for table `crop_review`
--
ALTER TABLE `crop_review`
  ADD CONSTRAINT `crop_review_ibfk_1` FOREIGN KEY (`crop_id`) REFERENCES `crop` (`crop_id`),
  ADD CONSTRAINT `crop_review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `consumer` (`id`);

--
-- Constraints for table `video_comments`
--
ALTER TABLE `video_comments`
  ADD CONSTRAINT `video_comments_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`),
  ADD CONSTRAINT `video_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `consumer` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
