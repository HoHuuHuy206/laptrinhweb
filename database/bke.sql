-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th3 19, 2026 lúc 12:18 PM
-- Phiên bản máy phục vụ: 9.1.0
-- Phiên bản PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bke`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `updated_at`, `created_at`) VALUES
(1, 1, '2026-03-19 11:17:24', '2026-03-19 18:18:30'),
(2, 1, '2026-03-19 11:17:24', '2026-03-19 18:18:30'),
(3, 2, '2026-03-19 11:18:43', '2026-03-19 18:19:31'),
(4, 3, '2026-03-19 11:18:43', '2026-03-19 18:19:31'),
(5, 3, '2026-03-19 11:19:32', '2026-03-19 18:19:42'),
(6, 4, '2026-03-19 11:19:32', '2026-03-19 18:19:42'),
(7, 7, '2026-03-19 11:19:44', '2026-03-19 18:19:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_detail_id`, `order_id`, `product_id`, `updated_at`, `created_at`) VALUES
(1, 1, 1, '2026-03-19 11:22:47', '2026-03-19 18:22:58'),
(2, 1, 2, '2026-03-19 11:22:47', '2026-03-19 18:22:58'),
(3, 2, 3, '2026-03-19 11:25:19', '2026-03-19 18:25:49'),
(4, 3, 2, '2026-03-19 11:25:19', '2026-03-19 18:25:49'),
(5, 4, 1, '2026-03-19 11:25:58', '2026-03-19 18:26:27'),
(6, 4, 4, '2026-03-19 11:25:58', '2026-03-19 18:26:27'),
(7, 5, 3, '2026-03-19 11:26:30', '2026-03-19 18:26:50'),
(8, 6, 4, '2026-03-19 11:26:30', '2026-03-19 18:26:50'),
(9, 7, 1, '2026-03-19 11:26:53', '2026-03-19 18:27:04'),
(10, 7, 2, '2026-03-19 11:26:53', '2026-03-19 18:27:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `products_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double NOT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`products_id`, `product_name`, `product_price`, `product_description`, `updated_at`, `created_at`) VALUES
(1, 'Apple iPhone 14', 15000000, 'Điện Thoại Apple', '2026-03-19 11:13:08', '2026-03-19 18:15:21'),
(2, 'Macbook Pro Apple', 30000000, 'Laptop xịn', '2026-03-19 11:13:08', '2026-03-19 18:15:21'),
(3, 'SamSung Galaxy S23', 14000000, 'Điện Thoại SamSung', '2026-03-19 11:15:26', '2026-03-19 18:17:09'),
(4, 'Sony Tivi 4K', 10000000, 'TiVi 4k Sắc n', '2026-03-19 11:15:26', '2026-03-19 18:17:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_pass`, `updated_at`, `created_at`) VALUES
(1, 'mai', 'mai@gmail.com', '123456', '2026-03-19 11:05:12', '2026-03-19 18:08:23'),
(2, 'minh', 'minh@gmail.com', '123456', '2026-03-19 11:05:12', '2026-03-19 18:08:23'),
(3, 'maria', 'maria@gmail.com', '123456', '2026-03-19 11:08:29', '2026-03-19 18:09:56'),
(4, 'albert', 'albert@gmail.com', '123456', '2026-03-19 11:08:29', '2026-03-19 18:09:56'),
(5, 'trancaotrong', 'trong@gmail.com', '123456', '2026-03-19 11:10:02', '2026-03-19 18:11:31'),
(6, 'thanh', 'thanh@yahoo.com', '123456', '2026-03-19 11:10:02', '2026-03-19 18:11:31'),
(7, 'phong', 'phong@gmail.com', '123456', '2026-03-19 11:11:37', '2026-03-19 18:12:29'),
(8, 'huy', 'huy@gmail.com', '123456', '2026-03-19 11:11:37', '2026-03-19 18:12:29');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
