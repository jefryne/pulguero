-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2023 a las 16:50:42
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

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
(2, 6, '$2y$10$2PogFAa/NgCqwjmDOjRtPOPCERVhsgiVBZf1NQ49Yd0nZb0JCOl.u'),
(3, 1, '$2y$10$u6o26CeyFgWuycFkg0dhsOF7anfXAzzwOGQ6rM.b0oQCdLU7ktEF6'),
(4, 18, '$2y$10$ynCrVpy6IcFkiJTx4WpIUuS6N3AWa0UAnOuxY9bhRLGKL8Dmt07Ne');

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
(1, 15, 0),
(2, 16, 80);

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
(1, 'dulces');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `history`
--

CREATE TABLE `history` (
  `id_history` int(10) UNSIGNED NOT NULL,
  `id_inventory` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_client` int(10) UNSIGNED NOT NULL,
  `date_history` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaction_status` enum('Venta') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `history`
--

INSERT INTO `history` (`id_history`, `id_inventory`, `id_user`, `id_client`, `date_history`, `transaction_status`) VALUES
(1, 1, 1, 2, '2023-11-19 05:51:33', 'Venta'),
(2, 1, 1, 16, '2023-11-21 13:53:56', 'Venta'),
(9, 1, 18, 16, '2023-11-21 15:41:50', 'Venta'),
(10, 1, 18, 15, '2023-11-21 15:45:55', 'Venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

CREATE TABLE `inventory` (
  `id_inventory` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_category` int(10) UNSIGNED NOT NULL,
  `cost` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `status_inventory` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventory`
--

INSERT INTO `inventory` (`id_inventory`, `nombre`, `descripcion`, `id_user`, `id_category`, `cost`, `price`, `status_inventory`) VALUES
(1, 'caramelo', 'de chocolate', 2, 1, 100, 200, 1);

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
(1, '777', 'fefe', 'nunez', 'fefe@gmail.com', 'Admin', 1, '44445'),
(2, '100', 'pepe', 'dasd', 'sad', 'Cliente', 1, 'asd'),
(6, '000', 'luna', '', 'luna@gmail.com', 'Admin', 1, ''),
(15, '333', 'luna', 'perez', 'luna4454@gmail.com', 'Vendedor', 1, '8888'),
(16, '0101', 'pepi', 'toto', 'pepi@gmail.com', 'Vendedor', 1, '8888'),
(17, '8888', 'supervisor', 'visor', 'popo@gmail.com', 'SuperVisor', 1, '123'),
(18, '987', 'monica', 'acosta', 'moni@gmail.com', 'SuperVisor', 1, '313560');

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
  ADD KEY `id_inventory` (`id_inventory`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_client` (`id_client`);

--
-- Indices de la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id_inventory`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_category` (`id_category`);

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
  MODIFY `id_account` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `accumulated`
--
ALTER TABLE `accumulated`
  MODIFY `id_accumulated` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id_inventory` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `liquidation`
--
ALTER TABLE `liquidation`
  MODIFY `id_liquidation` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`id_inventory`) REFERENCES `inventory` (`id_inventory`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`id_client`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`);

--
-- Filtros para la tabla `liquidation`
--
ALTER TABLE `liquidation`
  ADD CONSTRAINT `liquidation_ibfk_1` FOREIGN KEY (`id_customer_supplier`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
