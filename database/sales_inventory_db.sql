-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2022 at 04:23 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sales_inventory_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCustName` (IN `ads` VARCHAR(20))  BEGIN
     SELECT*FROM  customer_list
     WHERE address =ads;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`) VALUES
(1, 'Fruits and Vegetables'),
(2, 'Meat'),
(3, 'Hygiene'),
(4, 'Snacks'),
(5, 'Drinks'),
(7, 'Stationary');

-- --------------------------------------------------------

--
-- Table structure for table `customer_list`
--

CREATE TABLE `customer_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_list`
--

INSERT INTO `customer_list` (`id`, `name`, `contact`, `address`, `email`) VALUES
(1, 'Rahul', '8747808787', 'mumbai', 'rahul@gmail.com'),
(2, 'Sushma', '9625186612', 'Bangalore', 'sassysushma@gmail.com'),
(3, 'Praful', '8912317882', 'Chennai', ''),
(4, 'Sagar', '872384522', 'Bangalore', ''),
(5, 'Varun', '9875114862', 'Bangalore', ''),
(7, 'Raju', '8451762258', 'Hyderabad', '');

--
-- Triggers `customer_list`
--
DELIMITER $$
CREATE TRIGGER `deletelog` BEFORE DELETE ON `customer_list` FOR EACH ROW INSERT INTO logs VALUES(null,old.name,"Acc is deleted",NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1= stockin , 2 = stockout',
  `stock_from` varchar(100) NOT NULL COMMENT 'sales/receiving',
  `form_id` int(30) NOT NULL,
  `other_details` text NOT NULL,
  `remarks` text NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `qty`, `type`, `stock_from`, `form_id`, `other_details`, `remarks`, `date_updated`) VALUES
(18, 1, 2, 2, 'Sales', 0, '{\"price\":\"75\",\"qty\":\"2\"}', 'Stock out from Sales-00000000\r\n', '2020-09-22 15:19:22'),
(19, 1, 2, 2, 'Sales', 0, '{\"price\":\"75\",\"qty\":\"2\"}', 'Stock out from Sales-00000000\r\n', '2020-09-22 15:20:03'),
(24, 8, 20, 1, 'receiving', 3, '{\"price\":\"500\",\"qty\":\"20\"}', 'Stock from Receiving-00000000\n', '2022-02-01 16:48:20'),
(25, 5, 30, 1, 'receiving', 3, '{\"price\":\"1000\",\"qty\":\"30\"}', 'Stock from Receiving-00000000\n', '2022-02-01 16:48:20'),
(26, 6, 10, 1, 'receiving', 4, '{\"price\":\"1300\",\"qty\":\"10\"}', 'Stock from Receiving-31072260\n', '2022-02-01 16:48:56'),
(27, 7, 30, 1, 'receiving', 4, '{\"price\":\"300\",\"qty\":\"30\"}', 'Stock from Receiving-31072260\n', '2022-02-01 16:48:56'),
(28, 1, 20, 1, 'receiving', 5, '{\"price\":\"1500\",\"qty\":\"20\"}', 'Stock from Receiving-31374215\n', '2022-02-01 16:50:27'),
(29, 3, 15, 1, 'receiving', 5, '{\"price\":\"300\",\"qty\":\"15\"}', 'Stock from Receiving-31374215\n', '2022-02-01 16:50:27'),
(30, 6, 2, 1, 'receiving', 5, '{\"price\":\"200\",\"qty\":\"2\"}', 'Stock from Receiving-31374215\n', '2022-02-01 16:50:28'),
(31, 4, 30, 1, 'receiving', 6, '{\"price\":\"200\",\"qty\":\"30\"}', 'Stock from Receiving-15239079\n', '2022-02-01 16:54:15'),
(32, 8, 10, 1, 'receiving', 6, '{\"price\":\"180\",\"qty\":\"10\"}', 'Stock from Receiving-15239079\n', '2022-02-01 16:54:15'),
(33, 8, 10, 2, 'Sales', 7, '{\"price\":\"30\",\"qty\":\"10\"}', 'Stock out from Sales-00000000\n', '2022-02-01 16:55:27'),
(34, 5, 3, 2, 'Sales', 8, '{\"price\":\"25\",\"qty\":\"3\"}', 'Stock out from Sales-20643610\n', '2022-02-01 16:55:53'),
(35, 3, 5, 2, 'Sales', 9, '{\"price\":\"30\",\"qty\":\"5\"}', 'Stock out from Sales-69497504\n', '2022-02-01 16:56:37'),
(36, 7, 2, 2, 'Sales', 9, '{\"price\":\"30\",\"qty\":\"2\"}', 'Stock out from Sales-69497504\n', '2022-02-01 16:56:37'),
(37, 4, 10, 2, 'Sales', 10, '{\"price\":\"10\",\"qty\":\"10\"}', 'Stock out from Sales-10595403\n', '2022-02-01 16:57:11'),
(38, 9, 10, 1, 'receiving', 7, '{\"price\":\"80\",\"qty\":\"10\"}', 'Stock from Receiving-19822061\n', '2022-02-01 17:08:21'),
(39, 9, 2, 2, 'Sales', 11, '{\"price\":\"10\",\"qty\":\"2\"}', 'Stock out from Sales-77280274\n', '2022-02-01 17:09:18'),
(40, 4, 3, 2, 'Sales', 11, '{\"price\":\"10\",\"qty\":\"3\"}', 'Stock out from Sales-77280274\n', '2022-02-01 17:09:18'),
(41, 8, 2, 2, 'Sales', 11, '{\"price\":\"30\",\"qty\":\"2\"}', 'Stock out from Sales-77280274\n', '2022-02-01 17:09:18'),
(42, 8, 10, 2, 'Sales', 12, '{\"price\":\"30\",\"qty\":\"10\"}', 'Stock out from Sales-77063471\n', '2022-02-01 17:12:30'),
(43, 7, 20, 2, 'Sales', 12, '{\"price\":\"30\",\"qty\":\"20\"}', 'Stock out from Sales-77063471\n', '2022-02-01 17:12:30'),
(44, 6, 3, 2, 'Sales', 13, '{\"price\":\"130\",\"qty\":\"3\"}', 'Stock out from Sales-03739501\n', '2022-02-01 17:14:22'),
(45, 4, 5, 2, 'Sales', 14, '{\"price\":\"10\",\"qty\":\"5\"}', 'Stock out from Sales-26282422\n', '2022-02-01 17:18:57'),
(46, 7, 3, 2, 'Sales', 14, '{\"price\":\"30\",\"qty\":\"3\"}', 'Stock out from Sales-26282422\n', '2022-02-01 17:18:57'),
(47, 8, 3, 2, 'Sales', 14, '{\"price\":\"30\",\"qty\":\"3\"}', 'Stock out from Sales-26282422\n', '2022-02-01 17:18:57'),
(48, 6, 7, 2, 'Sales', 14, '{\"price\":\"130\",\"qty\":\"7\"}', 'Stock out from Sales-26282422\n', '2022-02-01 17:18:57'),
(49, 1, 5, 2, 'Sales', 15, '{\"price\":\"100\",\"qty\":\"5\"}', 'Stock out from Sales-45300764\n', '2022-02-01 17:19:23'),
(50, 9, 8, 2, 'Sales', 16, '{\"price\":\"10\",\"qty\":\"8\"}', 'Stock out from Sales-03853136\n', '2022-02-01 17:19:45'),
(51, 5, 5, 2, 'Sales', 17, '{\"price\":\"25\",\"qty\":\"5\"}', 'Stock out from Sales-06433347\n', '2022-02-01 17:20:12'),
(52, 1, 3, 2, 'Sales', 17, '{\"price\":\"100\",\"qty\":\"3\"}', 'Stock out from Sales-06433347\n', '2022-02-01 17:20:12');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `name`, `action`, `ddate`) VALUES
(1, 'Sushma', 'Acc is deleted', '2022-02-01 16:59:52'),
(3, 'Vishnu', 'Acc is deleted', '2022-02-01 19:42:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `sku`, `price`, `name`, `description`) VALUES
(1, 1, '56254', 100, 'Apple', 'shimla red apple'),
(3, 5, '91643', 30, 'Mountain dew', 'mountain dew drink 350ml'),
(4, 4, '11765', 10, 'Doritos', 'Big Chips'),
(5, 3, '74628', 25, 'Diapers', 'huggies'),
(6, 5, '93045251', 130, 'Roohafsa', 'Roohafsa 100 ml'),
(7, 1, '89688728', 30, 'Potatoes', '100gms'),
(8, 2, '05979522', 30, 'Eggs', 'A PACK OF SIX'),
(9, 7, '18203131', 10, 'Reynolds Pen', 'Blue Ball pen');

-- --------------------------------------------------------

--
-- Table structure for table `receiving_list`
--

CREATE TABLE `receiving_list` (
  `id` int(30) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receiving_list`
--

INSERT INTO `receiving_list` (`id`, `ref_no`, `supplier_id`, `total_amount`, `date_added`) VALUES
(3, '00000000\n', 4, 40000, '2022-02-01 16:48:20'),
(4, '31072260\n', 5, 22000, '2022-02-01 16:48:56'),
(5, '31374215\n', 3, 34900, '2022-02-01 16:50:27'),
(6, '15239079\n', 4, 7800, '2022-02-01 16:54:15'),
(7, '19822061\n', 4, 800, '2022-02-01 17:08:21');

-- --------------------------------------------------------

--
-- Table structure for table `sales_list`
--

CREATE TABLE `sales_list` (
  `id` int(30) NOT NULL,
  `ref_no` varchar(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `amount_tendered` double NOT NULL,
  `amount_change` double NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_list`
--

INSERT INTO `sales_list` (`id`, `ref_no`, `customer_id`, `total_amount`, `amount_tendered`, `amount_change`, `date_updated`) VALUES
(7, '00000000\n', 3, 300, 500, 200, '2022-02-01 16:55:27'),
(8, '20643610\n', 0, 75, 100, 25, '2022-02-01 16:55:53'),
(9, '69497504\n', 2, 210, 210, 0, '2022-02-01 16:56:37'),
(10, '10595403\n', 2, 100, 100, 0, '2022-02-01 16:57:11'),
(11, '77280274\n', 5, 110, 200, 90, '2022-02-01 17:09:18'),
(12, '77063471\n', 0, 900, 1000, 100, '2022-02-01 17:12:30'),
(13, '03739501\n', 2, 390, 400, 10, '2022-02-01 17:14:22'),
(14, '26282422\n', 4, 1140, 1500, 360, '2022-02-01 17:18:56'),
(15, '45300764\n', 0, 500, 500, 0, '2022-02-01 17:19:23'),
(16, '03853136\n', 0, 80, 100, 20, '2022-02-01 17:19:45'),
(17, '06433347\n', 0, 425, 500, 75, '2022-02-01 17:20:12');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_list`
--

CREATE TABLE `supplier_list` (
  `id` int(30) NOT NULL,
  `supplier_name` text NOT NULL,
  `contact` varchar(30) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier_list`
--

INSERT INTO `supplier_list` (`id`, `supplier_name`, `contact`, `address`) VALUES
(1, 'Rakesh Verma', '9765524556', 'Kolkat\r\n'),
(3, 'Manish Malhotra', '9365465315', 'Mumbai'),
(4, 'Rahul jain', '9866182881', 'Hyderabad'),
(5, 'Suresh  Sharma', '9831672661', 'Bangalore');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'wholesale management System', 'wms@sample.com', '9876453544', '1600654680_photo-1504674900247-0877df9cc836.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;ABOUT US&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;b style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Lorem Ipsum&lt;/b&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&amp;#x2019;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;&lt;br&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;h2 style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;Where does it come from?&lt;/h2&gt;&lt;p style=&quot;text-align: center; margin-bottom: 15px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400;&quot;&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.&lt;/p&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1= M, 2 = F',
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = cashier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `gender`, `username`, `password`, `type`) VALUES
(1, 'Shithin', 1, 'Shithin', 'admin', 1),
(3, 'Ullas', 1, 'Ullas', 'cashier', 2),
(4, 'Hima', 2, 'Hima', 'cashier', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_list`
--
ALTER TABLE `customer_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receiving_list`
--
ALTER TABLE `receiving_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_list`
--
ALTER TABLE `sales_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_list`
--
ALTER TABLE `supplier_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_list`
--
ALTER TABLE `customer_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `receiving_list`
--
ALTER TABLE `receiving_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales_list`
--
ALTER TABLE `sales_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `supplier_list`
--
ALTER TABLE `supplier_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
