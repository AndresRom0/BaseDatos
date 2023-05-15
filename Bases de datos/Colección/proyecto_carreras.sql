CREATE DATABASE  IF NOT EXISTS `proyecto_carreras`;
USE `proyecto_carreras`;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL AUTO_INCREMENT,
  `id_ronda` int(11) NOT NULL,
  `num_vueltas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_carrera`),
  KEY `fk_carrera_ronda1_idx` (`id_ronda`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
INSERT INTO `carrera` VALUES (1,1,1),(2,2,3),(3,3,2),(4,4,2),(5,5,2),(6,6,2);
UNLOCK TABLES;

--
-- Table structure for table `estadistica_carrera`
--

DROP TABLE IF EXISTS `estadistica_carrera`;
CREATE TABLE `estadistica_carrera` (
  `no_vuelta` int(11) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `no_registro` int(11) NOT NULL,
  `posicion` int(11) DEFAULT NULL,
  `tiempo` time DEFAULT NULL,
  PRIMARY KEY (`no_vuelta`,`id_carrera`,`no_registro`),
  KEY `fk_estadistica_carrera_carrera1_idx` (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadistica_carrera`
--

LOCK TABLES `estadistica_carrera` WRITE;
INSERT INTO `estadistica_carrera` VALUES (1,1,1003,1,'05:15:00'),(1,1,1004,2,'05:35:00'),(1,2,2001,1,'01:01:00'),(1,2,2002,2,'01:05:00'),(1,2,2003,3,'01:07:00'),(1,2,2005,4,'01:10:00'),(1,3,2001,2,'01:23:00'),(1,3,2002,3,'01:25:00'),(1,3,2003,1,'01:20:00'),(1,3,2005,4,'01:27:00'),(1,5,3001,1,'03:30:00'),(1,5,3002,2,'03:32:00'),(1,6,3001,1,'03:03:00'),(1,6,3002,2,'03:08:00'),(2,2,2001,4,'01:24:00'),(2,2,2002,3,'01:23:00'),(2,2,2003,2,'01:18:00'),(2,2,2005,1,'01:15:00'),(2,3,2001,4,'01:10:00'),(2,3,2002,3,'01:08:00'),(2,3,2003,2,'01:03:00'),(2,3,2005,1,'00:59:00'),(2,5,3001,2,'03:21:00'),(2,5,3002,1,'03:18:00'),(2,6,3001,2,'03:15:00'),(2,6,3002,1,'03:01:00');
UNLOCK TABLES;

--
-- Table structure for table `participante`
--

DROP TABLE IF EXISTS `participante`;
CREATE TABLE `participante` (
  `id_participante` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `id_tipo_participante` int(11) NOT NULL,
  `id_manager` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_participante`),
  KEY `fk_participante_tipo_participante_idx` (`id_tipo_participante`),
  KEY `fk_participante_participante1_idx` (`id_manager`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participante`
--

LOCK TABLES `participante` WRITE;
INSERT INTO `participante` VALUES (28,'Emmet','McBean',2,NULL),(38,'Karl','Doe',1,28),(39,'Mike','Geller',1,45),(40,'Ron','Zimmerman',1,28),(41,'Zach','Merker',1,45),(42,'Ellie','Worth',1,46),(43,'Joe','Wegner',1,46),(44,'Dan','McDonald',1,45),(45,'Melanie','Parties',2,NULL),(46,'Alan','Oze',2,NULL);
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
CREATE TABLE `registro` (
  `no_registro` int(11) NOT NULL,
  `id_participante` int(11) NOT NULL,
  `id_torneo` int(11) NOT NULL,
  `estatus_registro` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`no_registro`,`id_participante`,`id_torneo`),
  KEY `fk_registro_participante1_idx` (`id_participante`),
  KEY `fk_registro_torneo1_idx` (`id_torneo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
INSERT INTO `registro` VALUES (1001,38,1,'Retiro - Falla de auto'),(1002,39,1,'No se presentó'),(1003,40,1,'Corrió - Ganó'),(1004,41,1,'Corrió - Perdió'),(2001,38,2,'Corrió - Perdió'),(2002,39,2,'Corrió - Perdió'),(2003,40,2,'Corrió - Perdió'),(2004,41,2,'Retiro - Accidente'),(2005,42,2,'Corrió - Ganó'),(3000,39,3,'Retiro - Accidente'),(3000,40,3,'Retiro - Accidente'),(3001,38,3,'Corrió - Perdió'),(3001,41,3,'Corrió - Perdió'),(3002,42,3,'Corrió - Ganó'),(3002,43,3,'Corrió - Ganó');
UNLOCK TABLES;

--
-- Table structure for table `ronda`
--

DROP TABLE IF EXISTS `ronda`;
CREATE TABLE `ronda` (
  `id_ronda` int(11) NOT NULL AUTO_INCREMENT,
  `num_ronda` int(11) NOT NULL,
  `id_torneo` int(11) NOT NULL,
  PRIMARY KEY (`id_ronda`),
  KEY `fk_ronda_torneo1_idx` (`id_torneo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ronda`
--

LOCK TABLES `ronda` WRITE;
INSERT INTO `ronda` VALUES (1,1,1),(2,1,2),(3,2,2),(4,1,3),(5,2,3),(6,3,3);
UNLOCK TABLES;

--
-- Table structure for table `tipo_participante`
--

DROP TABLE IF EXISTS `tipo_participante`;
CREATE TABLE `tipo_participante` (
  `id_tipo_participante` int(11) NOT NULL AUTO_INCREMENT,
  `desc_tipo_participante` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_participante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipo_participante`
--

LOCK TABLES `tipo_participante` WRITE;
INSERT INTO `tipo_participante` VALUES (1,'Corredor'),(2,'Manager');
UNLOCK TABLES;

--
-- Table structure for table `tipo_torneo`
--

DROP TABLE IF EXISTS `tipo_torneo`;
CREATE TABLE `tipo_torneo` (
  `id_tipo_torneo` int(11) NOT NULL AUTO_INCREMENT,
  `desc_tipo_torneo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_torneo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipo_torneo`
--

LOCK TABLES `tipo_torneo` WRITE;
INSERT INTO `tipo_torneo` VALUES (1,'De pista'),(2,'Rally (parejas)');
UNLOCK TABLES;

--
-- Table structure for table `torneo`
--

DROP TABLE IF EXISTS `torneo`;
CREATE TABLE `torneo` (
  `id_torneo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_torneo` varchar(45) NOT NULL,
  `id_tipo_torneo` int(11) NOT NULL,
  `no_registro_vencedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_torneo`),
  KEY `fk_torneo_tipo_torneo1_idx` (`id_tipo_torneo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `torneo`
--

LOCK TABLES `torneo` WRITE;
INSERT INTO `torneo` VALUES (1,'Copa del Rey',1,1003),(2,'Speed Track',1,2005),(3,'Copa Dorada',2,3002);
UNLOCK TABLES;

-- Dump completed on 2017-08-28 22:32:40
