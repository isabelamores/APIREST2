-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2022 a las 17:28:18
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `database`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `allusers`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `allusers` (
`user` varchar(20)
,`pass` varchar(40)
,`Estado` tinyint(1)
,`userId` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `documentID` int(11) NOT NULL,
  `documentName` varchar(50) NOT NULL,
  `documentURL` varchar(150) NOT NULL,
  `documentType` varchar(30) NOT NULL,
  `personId` int(11) DEFAULT NULL,
  `bActive` tinyint(1) DEFAULT 1,
  `fCreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `noticeID` int(11) NOT NULL,
  `noticeTxt` text NOT NULL,
  `noticePhoto` varchar(200) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `bActive` tinyint(1) DEFAULT 0,
  `fCreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `personId` int(11) NOT NULL COMMENT 'Llave Principal',
  `personName` varchar(50) DEFAULT NULL COMMENT 'Nombre(s) de la persona',
  `personLastName` varchar(100) NOT NULL COMMENT 'Apellido(s) de la Persona',
  `personRFC` varchar(13) NOT NULL DEFAULT '0' COMMENT 'RFC de pa Persona',
  `bActive` tinyint(1) NOT NULL COMMENT 'Activo o inactivo',
  `dtCreatedAt` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación del registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`personId`, `personName`, `personLastName`, `personRFC`, `bActive`, `dtCreatedAt`) VALUES
(1, 'Admin', 'Admin', 'ADMI220222000', 1, '2022-02-22 12:39:57'),
(2, 'Secretario', 'General', 'SEGE220222001', 1, '2022-02-22 12:39:57'),
(3, 'Miémbro', 'Activo', 'MIAC220222002', 1, '2022-02-22 12:39:57'),
(4, 'Miémbro', 'Inactivo', 'MIIA220222003', 0, '2022-02-22 12:39:57'),
(5, 'Visitante', '', '', 1, '2022-02-22 12:39:57'),
(6, 'Alejandra', 'López', 'LELO123456789', 1, '2022-09-28 13:42:35'),
(7, 'Justin ', 'Bieber', 'justinBM12', 1, '2022-10-21 09:00:13');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `userdata`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `userdata` (
`personId` int(11)
,`userId` int(11)
,`Name` varchar(50)
,`Lastname` varchar(100)
,`RFC` varchar(13)
,`personActive` tinyint(1)
,`user` varchar(20)
,`userType` varchar(20)
,`userActive` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `userType` varchar(20) NOT NULL,
  `bActive` tinyint(1) NOT NULL DEFAULT 0,
  `dtCreatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`userId`, `personId`, `user`, `pass`, `userType`, `bActive`, `dtCreatedAt`) VALUES
(1, 1, 'admin', '0192023a7bbd73250516f069df18b500', 'Administrador', 1, '2022-02-22 12:47:08'),
(2, 2, 'sege', '1c14dc03fc8dd53f7ed5df8dc63991df', 'Secretario General', 1, '2022-02-22 12:47:08'),
(3, 3, 'miac', 'de697fc11fe70771f92db92d004b8583', 'Miembro', 1, '2022-02-22 12:47:08'),
(4, 4, 'miin', 'de697fc11fe70771f92db92d004b8583', 'Miembro', 0, '2022-02-22 12:47:08'),
(5, 5, 'visit', 'a213033c0d9f7d83cd8f18d2f96be975', 'Visitante', 1, '2022-02-22 12:47:08'),
(6, 6, 'Ale', 'ale123', '2', 1, '2022-09-28 13:44:35'),
(7, 3, 'EKISD', 'EXIS123', '1', 1, '2022-09-28 13:49:50'),
(8, 4, 'XD', 'exit123', '4', 0, '2022-09-28 13:49:50'),
(9, 7, 'Justin', '06475174d922e7dcbb3ed34c0236dbdf', 'Secretario General', 0, '2022-10-21 09:00:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_token`
--

CREATE TABLE `usuarios_token` (
  `tokenId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `txtToken` varchar(50) NOT NULL,
  `bEstado` varchar(10) NOT NULL,
  `feDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios_token`
--

INSERT INTO `usuarios_token` (`tokenId`, `userId`, `txtToken`, `bEstado`, `feDate`) VALUES
(1, 1, '3aa7eafaef2eb026eaeea1dd0769ab64', 'Activo', '2022-10-03 17:14:00'),
(2, 1, '04a9cb8c8fb11e896cb8faa2553a068f', 'Activo', '2022-10-03 17:17:00'),
(3, 1, 'a771c695700d2b7a0d1d61db125b8a38', 'Activo', '2022-10-03 17:23:00'),
(4, 1, 'c9760d7d57f9e26d00052d8376da220a', 'Activo', '2022-10-03 17:24:00'),
(5, 1, '14b3f8a9066dc0cbeb35d99362d32559', 'Activo', '2022-10-03 17:25:00'),
(6, 1, '8af642f5767be5d9b8eaa3144951f7ea', 'Activo', '2022-10-03 17:33:00'),
(7, 1, '70bcb9ce6f6e8b1588d6629cf27a2abe', 'Activo', '2022-10-03 18:35:00');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwuserdocuments`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwuserdocuments` (
`documentID` int(11)
,`Document` varchar(50)
,`URL` varchar(150)
,`Type` varchar(30)
,`fCreatedAt` datetime
,`personId` int(11)
,`Editor` varchar(151)
,`user` varchar(20)
,`userType` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `allusers`
--
DROP TABLE IF EXISTS `allusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `allusers`  AS SELECT `users`.`user` AS `user`, `users`.`pass` AS `pass`, `users`.`bActive` AS `Estado`, `users`.`userId` AS `userId` FROM `users``users`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `userdata`
--
DROP TABLE IF EXISTS `userdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userdata`  AS SELECT `p`.`personId` AS `personId`, `u`.`userId` AS `userId`, `p`.`personName` AS `Name`, `p`.`personLastName` AS `Lastname`, `p`.`personRFC` AS `RFC`, `p`.`bActive` AS `personActive`, `u`.`user` AS `user`, `u`.`userType` AS `userType`, `u`.`bActive` AS `userActive` FROM (`personas` `p` join `users` `u` on(`u`.`personId` = `p`.`personId`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwuserdocuments`
--
DROP TABLE IF EXISTS `vwuserdocuments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwuserdocuments`  AS SELECT `d`.`documentID` AS `documentID`, `d`.`documentName` AS `Document`, `d`.`documentURL` AS `URL`, `d`.`documentType` AS `Type`, `d`.`fCreatedAt` AS `fCreatedAt`, `p`.`personId` AS `personId`, concat(`p`.`Name`,' ',`p`.`Lastname`) AS `Editor`, `p`.`user` AS `user`, `p`.`userType` AS `userType` FROM (`documentos` `d` join `userdata` `p` on(`d`.`personId` = `p`.`personId`))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`documentID`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`noticeID`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`personId`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `usuario` (`user`);

--
-- Indices de la tabla `usuarios_token`
--
ALTER TABLE `usuarios_token`
  ADD PRIMARY KEY (`tokenId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `documentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `noticeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `personId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave Principal', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios_token`
--
ALTER TABLE `usuarios_token`
  MODIFY `tokenId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
