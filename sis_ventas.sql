-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 19-07-2024 a las 17:32:11
-- Versión del servidor: 10.6.18-MariaDB-0ubuntu0.22.04.1-log
-- Versión de PHP: 7.2.34-50+ubuntu22.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sis_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CabeceraVenta`
--

CREATE TABLE `CabeceraVenta` (
  `Consecutivo` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `ClienteCedula` varchar(20) DEFAULT NULL,
  `TotalVenta` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `Cedula` varchar(20) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`Cedula`, `Nombre`, `Direccion`, `Telefono`, `Email`, `ID`) VALUES
('65465465', 'ESTEBAN', 'calle 123', '555 555 555 ', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DetalleVenta`
--

CREATE TABLE `DetalleVenta` (
  `Id` int(11) NOT NULL,
  `ConsecutivoVenta` int(11) DEFAULT NULL,
  `ProductoCodigo` int(11) DEFAULT NULL,
  `ValorProducto` decimal(10,2) DEFAULT NULL,
  `IvaCalculado` decimal(10,2) DEFAULT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `ValorVenta` decimal(10,2) DEFAULT NULL,
  `ManejaIVA` tinyint(1) DEFAULT NULL,
  `PorcentajeIVA` decimal(5,2) DEFAULT NULL,
  `Imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`) VALUES
(1, 'anderson', '123', 'anderson@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CabeceraVenta`
--
ALTER TABLE `CabeceraVenta`
  ADD PRIMARY KEY (`Consecutivo`),
  ADD KEY `ClienteCedula` (`ClienteCedula`);

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`Cedula`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `DetalleVenta`
--
ALTER TABLE `DetalleVenta`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ConsecutivoVenta` (`ConsecutivoVenta`),
  ADD KEY `ProductoCodigo` (`ProductoCodigo`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`Codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `CabeceraVenta`
--
ALTER TABLE `CabeceraVenta`
  MODIFY `Consecutivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `DetalleVenta`
--
ALTER TABLE `DetalleVenta`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CabeceraVenta`
--
ALTER TABLE `CabeceraVenta`
  ADD CONSTRAINT `CabeceraVenta_ibfk_1` FOREIGN KEY (`ClienteCedula`) REFERENCES `Clientes` (`Cedula`);

--
-- Filtros para la tabla `DetalleVenta`
--
ALTER TABLE `DetalleVenta`
  ADD CONSTRAINT `DetalleVenta_ibfk_1` FOREIGN KEY (`ConsecutivoVenta`) REFERENCES `CabeceraVenta` (`Consecutivo`),
  ADD CONSTRAINT `DetalleVenta_ibfk_2` FOREIGN KEY (`ProductoCodigo`) REFERENCES `Productos` (`Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
