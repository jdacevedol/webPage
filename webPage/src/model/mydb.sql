-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `nombresU` varchar(50) NOT NULL,
  `apellidosU` varchar(60) NOT NULL,
  `codigoCel` varchar(45) NOT NULL,
  `celular` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `Usuario_username` varchar(200) NOT NULL,
  PRIMARY KEY (`Usuario_username`),
  CONSTRAINT `fk_Administrador_Usuario1` FOREIGN KEY (`Usuario_username`) REFERENCES `usuario` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES ('Oscar','Rodriguez','+57','3136548799','oscaro@gmail.com','hola');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `nombresU` varchar(50) NOT NULL,
  `apellidosU` varchar(60) NOT NULL,
  `codigoCel` varchar(45) NOT NULL,
  `celular` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `documentoId` varchar(50) NOT NULL,
  `Usuario_username` varchar(200) NOT NULL,
  `Direccion_idDireccion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Usuario_username`),
  UNIQUE KEY `documentoId_UNIQUE` (`documentoId`),
  KEY `fk_Cliente_Direccion1_idx` (`Direccion_idDireccion`),
  CONSTRAINT `fk_Cliente_Direccion1` FOREIGN KEY (`Direccion_idDireccion`) REFERENCES `direccion` (`idDireccion`),
  CONSTRAINT `fk_Cliente_Usuario1` FOREIGN KEY (`Usuario_username`) REFERENCES `usuario` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('Lina','Restrepo','+57','3007569803','linares@gmail.com','10008675432','buenas',2),('Juana','Parra','+57','3115334876','juanisp@gmail.com','10003896754','hello',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `idCompras` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fechaC` date NOT NULL,
  `Cliente_Usuario_username` varchar(200) NOT NULL,
  PRIMARY KEY (`idCompras`),
  KEY `fk_Compras_Cliente1_idx` (`Cliente_Usuario_username`),
  CONSTRAINT `fk_Compras_Cliente1` FOREIGN KEY (`Cliente_Usuario_username`) REFERENCES `cliente` (`Usuario_username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'2020-05-01','hello'),(2,'2020-05-01','buenas');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `idDireccion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `direccion` varchar(200) NOT NULL,
  `departamento` varchar(200) NOT NULL,
  `ciudad` varchar(200) NOT NULL,
  `barrio` varchar(100) DEFAULT NULL,
  `codigoPostal` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Carrera 80 #44 - 56','Antioquia','Medellin','Laureles','050034'),(2,'Calle 12sur #74 - 112','Antioquia','Medellin','Poblado','050032'),(3,'Calle 42 #38 - 54','Antioquia','Medellin','Lorena','050034'),(4,'Carrera 43 #47 - 53','Atlantico','Barranquilla','El Rosario','050021'),(5,'Calle 55A #22 - 08','Caldas','Manizales','Palogrande','050048');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProductos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `precioP` int(11) NOT NULL,
  `nombreP` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `Vendedor_Usuario_username` varchar(200) NOT NULL,
  PRIMARY KEY (`idProductos`,`Vendedor_Usuario_username`),
  KEY `fk_Productos_Vendedor1_idx` (`Vendedor_Usuario_username`),
  CONSTRAINT `fk_Productos_Vendedor1` FOREIGN KEY (`Vendedor_Usuario_username`) REFERENCES `vendedor` (`Usuario_username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,20000,'Base ligera Engol',30,'Bases','hi'),(2,45000,'Sombras rude cosmetics',25,'Sombras','holi');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipousuario` (
  `idTipoU` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipoU` varchar(20) NOT NULL,
  PRIMARY KEY (`idTipoU`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'Administrador'),(2,'Vendedor'),(3,'Cliente');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `username` varchar(200) NOT NULL,
  `passwordU` varchar(200) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `fechaUAct` date NOT NULL,
  `TipoUsuario_idTipoU` int(10) unsigned NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `password_UNIQUE` (`passwordU`),
  KEY `fk_Usuario_TipoUsuario_idx` (`TipoUsuario_idTipoU`),
  CONSTRAINT `fk_Usuario_TipoUsuario` FOREIGN KEY (`TipoUsuario_idTipoU`) REFERENCES `tipousuario` (`idTipoU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('buenas','saludosssss','2020-05-01','2020-05-01',3),('hello','saludossss','2020-05-01','2020-05-01',3),('hi','saludosss','2020-05-01','2020-05-01',2),('hola','saludos','2020-05-01','2020-05-01',1),('holi','saludoss','2020-05-01','2020-05-01',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `nombresU` varchar(50) NOT NULL,
  `apellidosU` varchar(60) NOT NULL,
  `codigoCel` varchar(45) NOT NULL,
  `celular` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `Usuario_username` varchar(200) NOT NULL,
  PRIMARY KEY (`Usuario_username`),
  CONSTRAINT `fk_Vendedor_Usuario1` FOREIGN KEY (`Usuario_username`) REFERENCES `usuario` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES ('Marcela','Palacio','+57','3118534289','marcepala@gmail.com','hi'),('Rodrigo','Perez','+57','3008495516','rodripe@gmail.com','holi');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-01 22:15:47
