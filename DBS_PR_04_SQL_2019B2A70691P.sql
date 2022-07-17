-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 12, 2022 at 02:17 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


--
-- Database: `bidding_db`
--
-- CREATE DATABASE 'bidding_db';
-- USE 'bidding_db';	
-- --------------------------------------------------------
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(40) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--


INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Clothes'),
(2, 'Appliances'),
(3, 'Desktop Computers'),
(4, 'Laptop'),
(5, 'Mobile Phone');


--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(40) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `category_id` int(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `start_bid` float NOT NULL,
  `regular_price` float NOT NULL,
  `bid_end_datetime` datetime NOT NULL,
  `img_fname` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--


INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `start_bid`, `regular_price`, `bid_end_datetime`, `img_fname`, `date_created`) VALUES
(1, 5, 'Huwei Galaxy 10', 'Good phone', 7000, 7000, '2022-10-27 19:00:00', '1.jpg', '2020-10-27 09:50:54'),
(3, 4, 'Macbook Pro', 'Simply the BEST!', 150000, 15000, '2022-10-27 17:00:00', '3.jpg', '2020-10-27 09:59:39'),
(4, 5, 'Iphone 13', 'Iphone 13 max pro plus ultra ', 150000, 150000, '2022-10-11 14:39:23', '2.jpg', '2022-04-11 18:10:33'),
(5, 2, 'LG 1.5 ton AC', 'Split AC with inverter compressor: variable speed compressor which adjusts power depending on heat load. It is most energy efficient and has lowest-noise operation ', 45000, 45000, '2022-10-11 14:41:30', '4.png', '2022-04-11 18:12:42'),
(6, 2, 'LG 190 L4 Refrigerator', ' Direct-cool refrigerator: Economical and Cooling without fluctuation\r\n\r\nCapacity 190 litres: Suitable for families with 2 to 3 members and bachelors\r\n\r\nEnergy Rating 4 Star: High energy efficiency ', 16000, 16000, '2022-07-11 14:45:41', '5.png', '2022-04-11 18:17:29'),
(7, 3, 'DELL Inspiron 3891 Desktop', '11th Gen Intel® Core™ i5-11400 (12 MB cache, 6 cores, 12 threads, 2.60 GHz to 4.40 GHz Turbo)\r\n\r\n', 68900, 68900, '2022-06-11 14:50:11', '6.png', '2022-04-11 18:21:47'),
(8, 1, 'Emporio Armani ', 'Men Light Blue Logo Shirt ', 22500, 22500, '2022-05-11 14:53:43', '7.png', '2022-04-11 18:24:25');


--

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(40) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2=Subscriber',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `contact`, `address`, `type`, `date_created`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 'admin@admin.com', '+123456789', '', 1, '2020-10-27 09:19:59'),
(6, 'Parikshit Vyas', 'vypar', '01513a08a1c618bc808ddc0bf5bac0cf', 'f20190691@pilani.com', '9119397181', 'KR 1131', 2, '2022-04-06 23:09:11'),
(7, 'Arnav Agrawal', 'arnia', '3971f2a82d7f32017d8d9cfa5e7f0dfb', 'f20190966@pilani.bits-pilani.ac.in', '1234567890', 'Ram 1120', 2, '2022-04-11 18:50:48');




-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` int(40) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user_id` int(40) NOT NULL,
  `product_id` int(40) NOT NULL,
  `bid_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=bid,2=confirmed,3=cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bids`
--


INSERT INTO `bids` (`id`, `user_id`, `product_id`, `bid_amount`, `status`, `date_created`) VALUES
(2, 5, 1, 7500, 1, '2020-10-27 14:18:50'),
(11, 7, 4, 151000, 1, '2022-04-12 17:04:39');

-- --------------------------------------------------------



-- --------------------------------------------------------

--


-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(40) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Live Auction', 'f20190691@pilani.bits-pilani.ac.in', '1234567890', '1649682540_poster.png', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;This is a live auction bidding site made by Parikshit Vyas and Arnav Agrawal as a part of DBS course evaluative project . We have used PHP , MySql , Bootstrap and JavaScript to create this project. Currently it is running locally using XAMPP WebServer.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');


-- --------------------------------------------------------



COMMIT;



/*

Rest of the select , update and delete queries are integrated into php files for better efficiency of the application.

DROP TABLE bids;
DROP TABLE categories;
DROP TABLE products;
DROP TABLE system_settings;
DROP TABLE users;

DROP DATABASE bidding_db;


*/

