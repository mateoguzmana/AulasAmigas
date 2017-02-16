-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-02-2017 a las 13:43:54
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aulas_amigas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `idcontent` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `points1` int(11) NOT NULL,
  `points2` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `idstate` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contents`
--

INSERT INTO `contents` (`idcontent`, `title`, `description`, `points1`, `points2`, `image`, `idstate`) VALUES
(1, 'Mascotas', 'Biologia', 50, 2050, 'assets/img/pet.png', 1),
(2, 'Algebra', 'DFisica', 40, 5000, 'http://playmyplanet.com/tienda/2435-thickbox_default/clicks-playmobil-5278-nina-india-con-animales-del-bosque.jpg', 1),
(3, 'Ingles', 'Ingles para niños', 20, 20000, 'https://www.glencovelibrary.org/wp-content/uploads/2015/04/BasicESL-1.png', 1),
(4, 'Artes', 'Artes graficas', 90, 90000, 'http://1.bp.blogspot.com/-xgn9GLfhNmo/Tdm7ieYGIpI/AAAAAAAAABU/6kOHS3uF8Ko/s1600/conociendo-el-arte.jpg', 1),
(5, 'Astrologia', 'Astros y planetas', 60, 6000, 'https://s-media-cache-ak0.pinimg.com/736x/8a/09/07/8a090781994bd8ae13ee9d6856a12014.jpg', 1),
(6, 'Ciencias', 'Ciencias básicas', 201, 25515, 'https://www.uniatlantico.edu.co/uatlantico/sites/default/files/docencia/facultades/img/ciencias-basicas/matematicas/Conferencia.JPG', 1),
(7, 'Salud', 'Deportes y salud', 70, 7000, 'https://image.freepik.com/iconos-gratis/variante-balon-de-futbol_318-49974.jpg', 1),
(8, 'Lectura', 'El arte de leer', 50, 5000, 'http://orig07.deviantart.net/53b9/f/2012/283/2/3/libro_png_by_trianagomezlovato-d5hfx8z.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `idstate` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `states`
--

INSERT INTO `states` (`idstate`, `description`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `iduser` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idstate` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`iduser`, `name`, `email`, `password`, `idstate`) VALUES
(1, 'Juanita', 'juanita@mail.com', '123456', 1),
(2, 'Juancho', 'juancho@mail.com', '123456', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`idcontent`),
  ADD KEY `idstate` (`idstate`);

--
-- Indices de la tabla `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`idstate`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`),
  ADD KEY `idstate` (`idstate`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contents`
--
ALTER TABLE `contents`
  MODIFY `idcontent` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `states`
--
ALTER TABLE `states`
  MODIFY `idstate` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`idstate`) REFERENCES `states` (`idstate`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idstate`) REFERENCES `states` (`idstate`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
