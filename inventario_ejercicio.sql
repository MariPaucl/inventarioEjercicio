-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2023 a las 21:13:38
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario_ejercicio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `idIngreso` int(11) NOT NULL,
  `codProd` int(11) DEFAULT NULL,
  `fechaIngreso` date DEFAULT current_timestamp(),
  `cantidadIngreso` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`idIngreso`, `codProd`, `fechaIngreso`, `cantidadIngreso`) VALUES
(1, 1, '2023-11-20', 20),
(2, 2, '2023-11-20', 10),
(3, 1, '2023-11-20', 5),
(4, 2, '2023-11-20', 10),
(5, 3, '2023-11-20', 35),
(6, 3, '2023-11-20', 5),
(7, 4, '2023-11-21', 50),
(8, 4, '2023-11-21', 10),
(9, 5, '2023-11-21', 12),
(10, 5, '2023-11-21', 12),
(11, 6, '2023-11-21', 50),
(12, 6, '2023-11-21', 20),
(13, 6, '2023-11-21', 15),
(14, 6, '2023-11-21', 16),
(15, 6, '2023-11-21', 20),
(16, 6, '2023-11-21', 40),
(17, 5, '2023-11-21', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codProd` int(11) NOT NULL,
  `nomProd` varchar(30) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fechaRegistro` date DEFAULT current_timestamp(),
  `cantidad` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codProd`, `nomProd`, `precio`, `fechaRegistro`, `cantidad`) VALUES
(1, 'Lana Morada Nube 50g', 6500.00, '2023-11-20', 23),
(2, 'Aguja crochet 2,5 mm', 2000.00, '2023-11-20', 15),
(3, 'Lana Copito Negra 100g', 13000.00, '2023-11-20', 28),
(4, 'Tijeras medianas con tapa', 3500.00, '2023-11-21', 55),
(5, 'Lana Azul Nube 50g', 6500.00, '2023-11-21', 0),
(6, 'Marcadores crochet x10', 2500.00, '2023-11-21', 74);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` int(11) NOT NULL,
  `codProd` int(11) NOT NULL,
  `fechaVenta` date NOT NULL DEFAULT current_timestamp(),
  `cantidadVenta` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idVenta`, `codProd`, `fechaVenta`, `cantidadVenta`) VALUES
(1, 1, '2023-11-20', 2),
(2, 2, '2023-11-20', 5),
(3, 3, '2023-11-20', 12),
(4, 4, '2023-11-21', 5),
(5, 5, '2023-11-21', 24),
(6, 6, '2023-11-21', 80),
(7, 6, '2023-11-21', 5),
(8, 6, '2023-11-21', 2),
(9, 5, '2023-11-21', 15);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`idIngreso`),
  ADD KEY `codProd` (`codProd`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codProd`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `codProd` (`codProd`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `idIngreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `codProd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`codProd`) REFERENCES `productos` (`codProd`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`codProd`) REFERENCES `productos` (`codProd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
