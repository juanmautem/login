-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-09-2021 a las 19:35:01
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dblogin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catpersonas`
--

CREATE TABLE `catpersonas` (
  `nIdPersona` int(11) NOT NULL,
  `txtNombre` varchar(30) NOT NULL,
  `txtApellidos` varchar(70) DEFAULT NULL,
  `txtRFC` varchar(15) DEFAULT NULL,
  `bActivo` bit(1) DEFAULT b'0',
  `fhCreacion` datetime DEFAULT current_timestamp(),
  `fhActualizacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cattipopersona`
--

CREATE TABLE `cattipopersona` (
  `nIdTipoP` int(11) NOT NULL,
  `txtTipo` varchar(30) NOT NULL,
  `txtDescripcion` varchar(150) DEFAULT NULL,
  `bActivo` bit(1) DEFAULT b'0',
  `fhCreacion` datetime DEFAULT current_timestamp(),
  `fhActualizacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relusuario`
--

CREATE TABLE `relusuario` (
  `nIdRPT` int(11) NOT NULL,
  `fk_eIdPersona` int(11) NOT NULL,
  `fk_eIdTipoP` int(11) NOT NULL,
  `txtNombreCorto` varchar(20) NOT NULL,
  `txtPassword` varchar(50) NOT NULL,
  `bActivo` bit(1) DEFAULT b'0',
  `fhCreacion` datetime DEFAULT current_timestamp(),
  `fhActualizacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catpersonas`
--
ALTER TABLE `catpersonas`
  ADD PRIMARY KEY (`nIdPersona`);

--
-- Indices de la tabla `cattipopersona`
--
ALTER TABLE `cattipopersona`
  ADD PRIMARY KEY (`nIdTipoP`);

--
-- Indices de la tabla `relusuario`
--
ALTER TABLE `relusuario`
  ADD PRIMARY KEY (`nIdRPT`),
  ADD UNIQUE KEY `foreign _key` (`fk_eIdPersona`,`fk_eIdTipoP`),
  ADD KEY `fk_eIdTipoP` (`fk_eIdTipoP`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catpersonas`
--
ALTER TABLE `catpersonas`
  MODIFY `nIdPersona` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cattipopersona`
--
ALTER TABLE `cattipopersona`
  MODIFY `nIdTipoP` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `relusuario`
--
ALTER TABLE `relusuario`
  MODIFY `nIdRPT` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `relusuario`
--
ALTER TABLE `relusuario`
  ADD CONSTRAINT `relusuario_ibfk_1` FOREIGN KEY (`fk_eIdTipoP`) REFERENCES `cattipopersona` (`nIdTipoP`),
  ADD CONSTRAINT `relusuario_ibfk_2` FOREIGN KEY (`fk_eIdPersona`) REFERENCES `catpersonas` (`nIdPersona`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
