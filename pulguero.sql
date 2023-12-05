-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2023 a las 14:26:45
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
(1, 2, 3000),
(2, 3, 0),
(3, 5, 1004000);

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
(3, 'celulares'),
(4, 'ropa elegante');

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
(28, 1, '2023-11-28 02:38:11', 74),
(29, 1, '2023-11-28 02:43:28', 75),
(30, 1, '2023-12-02 16:02:09', 76),
(31, 1, '2023-12-02 16:03:31', 77),
(32, 1, '2023-12-02 16:05:17', 78),
(33, 1, '2023-12-02 16:17:24', 79),
(34, 1, '2023-12-02 17:32:25', 80),
(35, 1, '2023-12-02 17:33:39', 81),
(36, 1, '2023-12-05 12:15:33', 82),
(37, 1, '2023-12-05 12:17:32', 83),
(38, 1, '2023-12-05 12:39:12', 84),
(39, 1, '2023-12-05 12:50:05', 85),
(40, 1, '2023-12-05 13:19:20', 86),
(41, 1, '2023-12-05 13:19:29', 87);

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
(1, 'caramelo', 'rico', 2, 1, 200, 0),
(2, 'camiseta', 'roja', 2, 2, 200, 0),
(3, 'iphone', 'nuevo', 3, 3, 200, 0),
(4, 'banana', 'rico', 2, 1, 1000, 0),
(5, 'pantalon', 'nuevo', 3, 2, 600, 0),
(6, 'pantalon', 'nuevo', 3, 2, 500000, 0),
(7, 'caramelo', 'rico', 2, 1, 5000000, 0),
(8, 'caramelo', 'rico', 3, 3, 5000000, 0),
(9, 'iphone', 'nuevo', 5, 3, 50000000, 0),
(10, 'pantalon', 'nuevo', 3, 2, 500000000, 0),
(11, 'pantalon', 'rico', 3, 2, 5000000, 0),
(12, 'gomitas', 'ricas', 3, 1, 20000, 0),
(13, 'banana', 'rica', 2, 1, 30000, 0),
(14, 'pantalon', 'bonito', 3, 2, 30000, 0),
(15, 'iphone', 'nuevo', 3, 3, 5000000, 0),
(16, 'pantalon', 'rojo', 5, 2, 40000, 0),
(17, 'caramelo', 'rico', 3, 1, 50000, 0),
(18, 'iphone', 'nuevo', 5, 3, 5000000, 0),
(19, 'camisa', 'azul', 3, 4, 3000, 0);

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
(74, '2023-11-28 02:38:11', 600.00),
(75, '2023-11-28 02:43:28', 1600.00),
(76, '2023-12-02 16:02:09', 500000.00),
(77, '2023-12-02 16:03:31', 5000000.00),
(78, '2023-12-02 16:05:14', 5000000.00),
(79, '2023-12-02 16:17:22', 50000000.00),
(80, '2023-12-02 17:32:23', 100000000.00),
(81, '2023-12-02 17:33:39', 5000000.00),
(82, '2023-12-05 12:15:33', 20000.00),
(83, '2023-12-05 12:17:32', 60000.00),
(84, '2023-12-05 12:39:09', 5000000.00),
(85, '2023-12-05 12:50:05', 40000.00),
(86, '2023-12-05 13:19:12', 5053000.00),
(87, '2023-12-05 13:19:20', 5053000.00);

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
(120, 74, 1),
(121, 74, 2),
(122, 74, 3),
(123, 75, 4),
(124, 75, 5),
(125, 76, 6),
(126, 77, 7),
(127, 78, 8),
(128, 79, 9),
(129, 80, 10),
(130, 81, 11),
(131, 82, 12),
(132, 83, 13),
(133, 83, 14),
(134, 84, 15),
(135, 85, 16),
(136, 86, 17),
(137, 86, 18),
(138, 86, 19),
(139, 87, 17),
(140, 87, 18),
(141, 87, 19);

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
(3, '3333', 'esteban', 'uno', 'esteban@gmail.com', 'Vendedor', 1, '6666'),
(4, '7777', 'luna', 'rave', 'luna@gmail.com', 'Admin', 1, '66666'),
(5, '5555', 'jeffry', 'nuñez', 'jefrynesena@outlook.com', 'Vendedor', 1, '44445');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `withdrawal_history`
--

CREATE TABLE `withdrawal_history` (
  `id_withdraw` int(10) UNSIGNED NOT NULL,
  `id_accumulated` int(10) UNSIGNED NOT NULL,
  `withdrawn_amount` int(10) UNSIGNED NOT NULL,
  `withdrawal_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `withdrawal_history`
--

INSERT INTO `withdrawal_history` (`id_withdraw`, `id_accumulated`, `withdrawn_amount`, `withdrawal_date`, `id_user`) VALUES
(1, 3, 0, '2023-12-02 17:25:07', 1),
(2, 2, 0, '2023-12-02 17:32:32', 1),
(3, 2, 500000, '2023-12-02 17:33:45', 1),
(4, 2, 515600, '2023-12-05 13:21:34', 1);

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
-- Indices de la tabla `withdrawal_history`
--
ALTER TABLE `withdrawal_history`
  ADD PRIMARY KEY (`id_withdraw`),
  ADD KEY `id_accumulated` (`id_accumulated`),
  ADD KEY `id_user` (`id_user`);

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
  MODIFY `id_accumulated` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id_inventory` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id_invoice` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `item_invoice`
--
ALTER TABLE `item_invoice`
  MODIFY `id_item` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT de la tabla `liquidation`
--
ALTER TABLE `liquidation`
  MODIFY `id_liquidation` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `withdrawal_history`
--
ALTER TABLE `withdrawal_history`
  MODIFY `id_withdraw` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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

--
-- Filtros para la tabla `withdrawal_history`
--
ALTER TABLE `withdrawal_history`
  ADD CONSTRAINT `fk_accumulated_withdrawal` FOREIGN KEY (`id_accumulated`) REFERENCES `accumulated` (`id_accumulated`),
  ADD CONSTRAINT `fk_user_withdrawal` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
