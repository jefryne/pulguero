-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2023 a las 22:39:50
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pulguero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account`
--

CREATE TABLE `account` (
  `id_account` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `account`
--

INSERT INTO `account` (`id_account`, `id_user`, `password`) VALUES
(1, 1, '$2y$10$u6o26CeyFgWuycFkg0dhsOF7anfXAzzwOGQ6rM.b0oQCdLU7ktEF6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accumulated`
--

CREATE TABLE `accumulated` (
  `id_accumulated` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `accumulated`
--

INSERT INTO `accumulated` (`id_accumulated`, `id_user`, `quantity`) VALUES
(1, 2, 120),
(2, 3, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id_category` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id_category`, `category_name`) VALUES
(1, 'dulces'),
(2, 'ropa'),
(3, 'celulares');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `history`
--

CREATE TABLE `history` (
  `id_history` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `date_history` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_invoice` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `history`
--

INSERT INTO `history` (`id_history`, `id_user`, `date_history`, `id_invoice`) VALUES
(1, 1, '2023-11-26 21:29:12', 61),
(2, 1, '2023-11-26 21:29:12', 61),
(3, 1, '2023-11-26 21:32:34', 62),
(4, 1, '2023-11-26 21:32:34', 62);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

CREATE TABLE `inventory` (
  `id_inventory` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_category` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `status_inventory` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventory`
--

INSERT INTO `inventory` (`id_inventory`, `name`, `description`, `id_user`, `id_category`, `price`, `status_inventory`) VALUES
(1, 'caramelo', 'rico', 2, 1, 200, 1),
(2, 'camiseta', 'roja', 2, 2, 200, 1),
(3, 'iphone', 'nuevo', 3, 3, 200, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE `invoice` (
  `id_invoice` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `invoice`
--

INSERT INTO `invoice` (`id_invoice`, `date`, `total`) VALUES
(46, '2023-11-26 20:45:43', 400.00),
(47, '2023-11-26 20:45:58', 400.00),
(48, '2023-11-26 20:50:34', 400.00),
(49, '2023-11-26 20:51:22', 400.00),
(50, '2023-11-26 20:51:57', 400.00),
(51, '2023-11-26 20:52:50', 400.00),
(52, '2023-11-26 20:53:15', 400.00),
(53, '2023-11-26 20:54:43', 400.00),
(54, '2023-11-26 20:55:02', 400.00),
(55, '2023-11-26 20:55:07', 400.00),
(56, '2023-11-26 20:56:05', 400.00),
(57, '2023-11-26 20:56:29', 400.00),
(58, '2023-11-26 20:57:47', 400.00),
(59, '2023-11-26 20:59:26', 400.00),
(60, '2023-11-26 21:27:51', 400.00),
(61, '2023-11-26 21:29:12', 400.00),
(62, '2023-11-26 21:32:34', 400.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_invoice`
--

CREATE TABLE `item_invoice` (
  `id_item` int(10) UNSIGNED NOT NULL,
  `id_invoice` int(10) UNSIGNED DEFAULT NULL,
  `id_inventory` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `item_invoice`
--

INSERT INTO `item_invoice` (`id_item`, `id_invoice`, `id_inventory`) VALUES
(65, 46, 1),
(66, 46, 2),
(67, 47, 1),
(68, 47, 2),
(69, 48, 1),
(70, 48, 2),
(71, 49, 1),
(72, 50, 1),
(73, 50, 2),
(74, 51, 1),
(75, 51, 2),
(76, 52, 1),
(77, 52, 2),
(78, 53, 1),
(79, 53, 2),
(80, 54, 1),
(81, 54, 2),
(82, 55, 1),
(83, 55, 2),
(84, 56, 1),
(85, 56, 2),
(86, 57, 1),
(87, 57, 2),
(88, 58, 1),
(89, 58, 2),
(90, 59, 2),
(91, 59, 3),
(92, 60, 2),
(93, 61, 2),
(94, 61, 3),
(95, 62, 2),
(96, 62, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidation`
--

CREATE TABLE `liquidation` (
  `id_liquidation` int(10) UNSIGNED NOT NULL,
  `id_customer_supplier` int(10) UNSIGNED DEFAULT NULL,
  `date_history` timestamp NOT NULL DEFAULT current_timestamp(),
  `liquidated_value` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `document_number` char(13) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `user_last_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `rol` enum('Admin','SuperVisor','Cliente','Vendedor') NOT NULL,
  `status_user` tinyint(1) NOT NULL DEFAULT 1,
  `cellphone` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `document_number`, `user_name`, `user_last_name`, `email`, `rol`, `status_user`, `cellphone`) VALUES
(1, '100800', 'fefe', 'lopez', 'fefe@gmail.com', 'Admin', 1, '7777'),
(2, '8888', 'pepe', 'nunez', 'pepe@gmail.com', 'Vendedor', 1, '66666'),
(3, '3333', 'esteban', 'uno', 'esteban@gmail.com', 'Vendedor', 1, '6666');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id_account`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `accumulated`
--
ALTER TABLE `accumulated`
  ADD PRIMARY KEY (`id_accumulated`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indices de la tabla `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_invoice` (`id_invoice`);

--
-- Indices de la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id_inventory`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_category` (`id_category`);

--
-- Indices de la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id_invoice`);

--
-- Indices de la tabla `item_invoice`
--
ALTER TABLE `item_invoice`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_invoice` (`id_invoice`),
  ADD KEY `id_inventory` (`id_inventory`);

--
-- Indices de la tabla `liquidation`
--
ALTER TABLE `liquidation`
  ADD PRIMARY KEY (`id_liquidation`),
  ADD KEY `id_customer_supplier` (`id_customer_supplier`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `account`
--
ALTER TABLE `account`
  MODIFY `id_account` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `accumulated`
--
ALTER TABLE `accumulated`
  MODIFY `id_accumulated` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id_inventory` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id_invoice` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `item_invoice`
--
ALTER TABLE `item_invoice`
  MODIFY `id_item` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de la tabla `liquidation`
--
ALTER TABLE `liquidation`
  MODIFY `id_liquidation` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `accumulated`
--
ALTER TABLE `accumulated`
  ADD CONSTRAINT `accumulated_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `id_invoice` FOREIGN KEY (`id_invoice`) REFERENCES `invoice` (`id_invoice`);

--
-- Filtros para la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`);

--
-- Filtros para la tabla `item_invoice`
--
ALTER TABLE `item_invoice`
  ADD CONSTRAINT `item_invoice_ibfk_1` FOREIGN KEY (`id_invoice`) REFERENCES `invoice` (`id_invoice`),
  ADD CONSTRAINT `item_invoice_ibfk_2` FOREIGN KEY (`id_inventory`) REFERENCES `inventory` (`id_inventory`);

--
-- Filtros para la tabla `liquidation`
--
ALTER TABLE `liquidation`
  ADD CONSTRAINT `liquidation_ibfk_1` FOREIGN KEY (`id_customer_supplier`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
