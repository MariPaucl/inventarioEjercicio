-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2023 a las 19:50:50
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
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL,
  `codProd` int(11) DEFAULT NULL,
  `fechaPedido` date DEFAULT NULL,
  `horaPedido` time DEFAULT NULL,
  `total` double DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `codProd`, `fechaPedido`, `horaPedido`, `total`, `direccion`) VALUES
(1, 5, '2023-11-16', '12:00:34', 2500, 'Cra 88D # 6B - 13'),
(2, 1, '2023-11-04', '16:32:16', 13000, 'Calle 68C # 10A - 23'),
(3, 4, '2023-11-11', '13:41:03', 3500, 'Av 68D # 11D - 13'),
(4, 1, '2023-11-15', '08:10:40', 13000, 'Calle 71A # 3B - 24'),
(5, 3, '2023-11-15', '18:32:11', 2000, 'Cra 80 # 24B - 14'),
(6, 6, '2023-11-16', '15:01:53', 2000, 'Calle 67 # 9A - 20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codProd` int(11) NOT NULL,
  `nomProd` varchar(30) DEFAULT NULL,
  `categoria` varchar(25) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `cantidad` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codProd`, `nomProd`, `categoria`, `precio`, `fechaIngreso`, `cantidad`) VALUES
(1, 'Lana Naranja 100g Copito', 'Lanas', 13000, '2023-09-25', 3),
(2, 'Lana Azul Rey 50g Nube', 'Lanas', 6500, '2023-10-09', 10),
(3, 'Aguja crochet 2,5 mm', 'Agujas', 2000, '2023-11-01', 14),
(4, 'Tijeras con seguro pequeñas', 'Accesorios', 3500, '2023-10-30', 8),
(5, 'Marcadores crochet x12', 'Accesorios', 2500, '2023-11-15', 19);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `codProd` (`codProd`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codProd`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `codProd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`codProd`) REFERENCES `productos` (`codProd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
