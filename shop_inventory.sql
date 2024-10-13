-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2024 at 09:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `buyer_id` int(11) NOT NULL,
  `buyer_identification` varchar(100) NOT NULL,
  `buyer_name` varchar(255) NOT NULL,
  `buyer_address` varchar(255) NOT NULL,
  `buyer_phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`buyer_id`, `buyer_identification`, `buyer_name`, `buyer_address`, `buyer_phone`) VALUES
(1, '', '', '', ''),
(2, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `barcode` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `article_code` varchar(100) DEFAULT NULL,
  `relative_code` varchar(100) DEFAULT NULL,
  `unit_of_measure` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `min_quantity` double DEFAULT NULL,
  `cost_price` double NOT NULL,
  `price1` double DEFAULT NULL,
  `price2` double DEFAULT NULL,
  `price3` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `is_produced` tinyint(1) DEFAULT NULL,
  `is_service` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `barcode`, `name`, `article_code`, `relative_code`, `unit_of_measure`, `department`, `min_quantity`, `cost_price`, `price1`, `price2`, `price3`, `weight`, `is_produced`, `is_service`, `created_at`, `updated_at`) VALUES
(1, '001001', 'ვაშლი 2', 'ART123', 'REL001', 'ცალი', 'ხილი', 10, 1, 1.2, 1.5, 1.7, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-10-05 10:09:29'),
(2, '001002', 'ბანანი', 'ART124', 'REL002', 'ცალი', 'ხილი', 20, 1.5, 2, 2.5, 3, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-08-03 19:59:41'),
(3, '001003', 'ფორთოხალი', 'ART125', 'REL003', 'ცალი', 'ხილი', 30, 2, 2.5, 3, 3.5, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-08-03 19:59:41'),
(4, '001004', 'კივი', 'ART126', 'REL004', 'ცალი', 'ხილი', 15, 1.2, 1.5, 1.8, 2, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-08-03 19:59:41'),
(5, '001005', 'ყურძენი', 'ART127', 'REL005', 'ცალი', 'ხილი', 25, 3, 3.5, 4, 4.5, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-08-03 19:59:41'),
(6, '001006', 'ანანასი', 'ART128', 'REL006', 'ცალი', 'ხილი', 8, 5, 5.5, 6, 6.5, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-08-03 19:59:41'),
(7, '001007', 'ტოატი', 'ART129', 'REL007', 'კილო', 'ხილი', 5, 0.8, 1, 1.2, 1.4, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-09-25 21:30:11'),
(8, '001008', 'კიტრი', 'ART130', 'REL008', 'კილო', 'ბოსტნეული', 12, 0.9, 1.1, 1.3, 1.5, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-08-03 19:59:41'),
(9, '001009', 'სტაფილო', 'ART131', 'REL009', 'კილო', 'ბოსტნეული', 18, 0.6, 0.8, 1, 1.2, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-08-03 19:59:41'),
(10, '001010', 'კარტოფილი', 'ART132', 'REL010', 'ცალი', 'ბოსტნეული', 50, 0.5, 0.7, 0.9, 1.1, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-09-25 21:29:25'),
(11, '123456789012', 'პროდუქტის სახელი', 'ABC123', 'REL123', 'ცალი', 'ხილი', 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-04 06:05:56', '2024-08-04 06:05:56'),
(12, '1231231', '123123', '123123', '123123', 'ცალი', 'ხილი', 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-04 15:02:25', '2024-08-04 15:02:25'),
(13, '212121212', 'ვარდ კაჭაჭა', '212121212', '21212121212', 'ცალი', 'პლანები', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-06 06:36:49', '2024-08-06 06:36:49'),
(14, '0010012', 'ვაშლი', 'ART123', 'REL001', 'ცალი', '0', 10, 0, 1.2, 1.5, 1.7, NULL, NULL, NULL, '2024-08-06 17:15:09', '2024-08-06 17:15:09'),
(15, '41414', 'ქოქოსი', '1111', '', 'კგ', '0', 2, 0, 5, 4, 5, NULL, NULL, NULL, '2024-08-06 17:40:13', '2024-08-06 17:40:13'),
(16, '14141414', 'ქოქოქო', 'ქოქოქო', 'ქოქოქო', '', '0', NULL, 0, 1, 2, NULL, NULL, NULL, NULL, '2024-08-06 17:48:27', '2024-08-06 17:48:27'),
(17, '5252', '2525', '5252', '2525', '25252', '52', 25, 0, 25, 25, 25, NULL, NULL, NULL, '2024-08-06 17:56:43', '2024-08-06 17:56:43'),
(20, '0010013', 'ვაშლიd', 'ART123', 'REL001d', 'ცალი', 'ხილი', 10, 1, 1.2, 1.5, 1.7, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-08-03 19:59:41'),
(21, '0010032', 'ფორთოხალი', 'ART125', 'REL003', 'ცალი', 'ხილი', 30, 2, 2.5, 3, 3.5, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-08-03 19:59:41'),
(22, '0010019', 'ფსხალი', 'ART123', 'REL001', 'ცალი', 'ხილი', 10, 1, 1.2, 1.5, 1.7, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-08-03 19:59:41'),
(23, '2001001', 'ვაშლი 2', 'ART123', 'REL001', 'ცალი', 'ხილი', 10, 1, 1.2, 1.5, 1.7, NULL, NULL, NULL, '2024-08-03 19:59:41', '2024-10-05 10:09:29'),
(24, '2020', 'ვერმიშელი', '2020', '2020', 'ცალი', '0', 2, 0, 4, 4, 3, NULL, NULL, NULL, '2024-10-11 18:37:17', '2024-10-11 18:37:17'),
(25, '999', 'ოქრო', '999', '999', 'ცალი', '0', 1, 0, 120000, 120000, 130000, NULL, NULL, NULL, '2024-10-13 04:10:42', '2024-10-13 04:10:42');

-- --------------------------------------------------------

--
-- Table structure for table `product_receipts`
--

CREATE TABLE `product_receipts` (
  `receipt_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_received` double NOT NULL,
  `cost_price` double NOT NULL,
  `receipt_date` date NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `batch_number` varchar(100) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `received_by` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_receipts`
--

INSERT INTO `product_receipts` (`receipt_id`, `product_id`, `quantity_received`, `cost_price`, `receipt_date`, `supplier_id`, `batch_number`, `expiry_date`, `location`, `received_by`, `remarks`) VALUES
(4, 11, 50, 1.5, '2024-01-01', 1, 'DOC001', NULL, NULL, NULL, 'Received with document DOC001'),
(19, 11, 50, 1.5, '2024-01-01', 1, 'DOC001', NULL, NULL, NULL, 'Received with document DOC001'),
(28, 1, 444, 1, '2024-08-05', 1, '1', NULL, NULL, NULL, 'Received with document 1'),
(29, 1, 4445, 1, '2024-08-06', 1, '1', NULL, NULL, NULL, 'Received with document 1'),
(30, 13, 12, 2, '2024-08-06', 1, '222', NULL, NULL, NULL, 'Received with document 222'),
(31, 1, 5, 1, '2024-08-06', 1, '33', NULL, NULL, NULL, 'Received with document 33'),
(32, 14, 5, 1, '2024-08-06', 1, '33', NULL, NULL, NULL, 'Received with document 33'),
(33, 1, 2, 1, '2024-08-06', 3, '131313', NULL, NULL, NULL, 'Received with document 131313'),
(34, 1, 2, 1, '2024-08-06', 3, '131313', NULL, NULL, NULL, 'Received with document 131313'),
(35, 1, 2, 1, '2024-08-06', 3, '131313', NULL, NULL, NULL, 'Received with document 131313'),
(36, 15, 1, 3, '2024-08-06', 1, '2', NULL, NULL, NULL, 'Received with document 2'),
(37, 16, 4, 1, '2024-08-06', 4, '1414141414', NULL, NULL, NULL, 'Received with document 1414141414'),
(38, 17, 52, 25, '2024-08-06', 5, '2525', NULL, NULL, NULL, 'Received with document 2525'),
(39, 1, 3, 1, '2024-08-07', 1, '23', NULL, NULL, NULL, 'Received with document 23'),
(40, 1, 1, 1, '2024-08-07', 1, '1', NULL, NULL, NULL, 'Received with document 1'),
(41, 1, 1, 1, '2024-08-07', 1, '1', NULL, NULL, NULL, 'Received with document 1'),
(42, 1, 2, 1, '2024-08-07', 1, '2', NULL, NULL, NULL, 'Received with document 2'),
(43, 1, 1, 1, '2024-08-07', 1, '1', NULL, NULL, NULL, 'Received with document 1'),
(44, 1, 2, 1, '2024-08-08', 1, '1', NULL, NULL, NULL, 'Received with document 1'),
(45, 3, 3, 2, '2024-08-12', 1, '1', NULL, NULL, NULL, 'Received with document 1'),
(46, 1, 1, 1, '2024-08-13', 1, '1', NULL, NULL, NULL, 'Received with document 1'),
(47, 22, 50, 1.5, '2024-01-01', 1, 'DOC001', NULL, NULL, NULL, 'Received with document DOC001'),
(48, 22, 50, 1.5, '2024-01-01', 1, 'DOC001', NULL, NULL, NULL, 'Received with document DOC001'),
(49, 23, 50, 1.5, '2024-01-01', 1, 'DOC001', NULL, NULL, NULL, 'Received with document DOC001'),
(73, 12, 50, 1.5, '2024-01-01', 1, 'DOC001', NULL, NULL, NULL, 'Received with document DOC001'),
(74, 13, 50, 1.5, '2024-01-01', 1, 'DOC001', NULL, NULL, NULL, 'Received with document DOC001'),
(75, 14, 50, 1.5, '2024-01-01', 1, 'DOC001', NULL, NULL, NULL, 'Received with document DOC001'),
(76, 24, 10, 1, '2024-10-11', 1, '22', NULL, NULL, NULL, 'Received with document 22'),
(77, 25, 1, 10000, '2024-10-13', 1, '333', NULL, NULL, NULL, 'Received with document 333');

-- --------------------------------------------------------

--
-- Table structure for table `product_sales`
--

CREATE TABLE `product_sales` (
  `sale_id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity_sold` int(11) NOT NULL,
  `cost_price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `sale_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `store_name`, `location`) VALUES
(1, 'მთავარი მაღაზია', 'თბილისი'),
(2, 'მეორე მაღაზია', 'ბათუმი');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `identification_number` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `identification_number`, `name`, `address`, `phone`) VALUES
(1, '123456789', 'მომწოდებელი 1', 'თბილისი, საქართველო', '555-123456'),
(2, '987654321', 'მომწოდებელი 2', 'ბათუმი, საქართველო', '555-654321'),
(3, '313131313', '131313131', NULL, NULL),
(4, '414141414', '141414141', NULL, NULL),
(5, '525', '2525', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `barcode` (`barcode`);

--
-- Indexes for table `product_receipts`
--
ALTER TABLE `product_receipts`
  ADD PRIMARY KEY (`receipt_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `product_sales`
--
ALTER TABLE `product_sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_buyer_id` (`buyer_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `identification_number` (`identification_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buyers`
--
ALTER TABLE `buyers`
  MODIFY `buyer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `product_receipts`
--
ALTER TABLE `product_receipts`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `product_sales`
--
ALTER TABLE `product_sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_receipts`
--
ALTER TABLE `product_receipts`
  ADD CONSTRAINT `product_receipts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_receipts_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Constraints for table `product_sales`
--
ALTER TABLE `product_sales`
  ADD CONSTRAINT `fk_buyer_sales` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`buyer_id`),
  ADD CONSTRAINT `product_sales_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  ADD CONSTRAINT `product_sales_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
