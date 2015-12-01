CREATE DATABASE  IF NOT EXISTS `invetario` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `invetario`;
-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: invetario
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `idArea` int(11) NOT NULL AUTO_INCREMENT,
  `nameArea` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idArea`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Informatica'),(2,'Comercio exterior'),(3,'Finanzas'),(999,'Desconocido');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer`
--

DROP TABLE IF EXISTS `computer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computer` (
  `idComputer` int(11) NOT NULL AUTO_INCREMENT,
  `User` int(11) DEFAULT NULL,
  `Manufacturer` int(11) DEFAULT NULL,
  `typeComputer` int(11) DEFAULT NULL,
  `Deliverytype` int(11) DEFAULT NULL,
  `Office` int(11) DEFAULT NULL,
  `Operatings` int(11) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `serial` varchar(40) DEFAULT NULL,
  `model` varchar(30) DEFAULT NULL,
  `harddisk` int(11) DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `processor` varchar(10) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `taf` varchar(40) DEFAULT NULL,
  `fechaentrega` date DEFAULT NULL,
  PRIMARY KEY (`idComputer`),
  KEY `FK_TIPO` (`Deliverytype`),
  KEY `FK_OFFICE` (`Office`),
  KEY `FK_OPERATINGS` (`Operatings`),
  KEY `FK_STATE` (`State`),
  KEY `FK_MANUFACTURER` (`Manufacturer`),
  KEY `FK_POSEE` (`User`),
  KEY `FK_TYPE` (`typeComputer`),
  CONSTRAINT `FK_MANUFACTURER` FOREIGN KEY (`Manufacturer`) REFERENCES `manufacturercomputer` (`IDMANUFACTURER`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OFFICE` FOREIGN KEY (`Office`) REFERENCES `officecomputer` (`idOfficecomputer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OPERATINGS` FOREIGN KEY (`Operatings`) REFERENCES `operatingsystem` (`idOperatingsystem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_POSEE` FOREIGN KEY (`User`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_STATE` FOREIGN KEY (`State`) REFERENCES `statecomputer` (`idStatecomputer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TIPO` FOREIGN KEY (`Deliverytype`) REFERENCES `deliverytype` (`idDeliverytype`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TYPE` FOREIGN KEY (`typeComputer`) REFERENCES `typecomputer` (`IDTYPECOMPUTER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer`
--

LOCK TABLES `computer` WRITE;
/*!40000 ALTER TABLE `computer` DISABLE KEYS */;
INSERT INTO `computer` VALUES (1,2,2,1,1,1,1,1,'200gb93932','latitude 5420',500,2,'3.0','fiordos83109','5050016641','2004-12-31'),(2,2,3,2,1,1,1,1,'3000gbs','e430',250,4,'2.0','fiordos8311','5050010589','2014-02-02'),(3,6,3,2,1,1,1,1,'3000gbs','e430',250,4,'2.0','fiordos8311','5050010510','2004-12-31'),(4,5,1,3,1,6,2,1,'732','r430',500,4,'2.2','fiordos8310','5050010511','2004-12-31'),(5,1,3,2,1,6,2,1,'5938373662','e430',500,6,'2.2','fiordos83102','5050010585','2000-12-31'),(6,1,3,3,1,6,2,1,'5050016641','latitude',500,4,'2','fiordos83111','5050010512','2004-12-31'),(7,1,2,1,1,3,2,1,'2r3wfwe','latitude',3,3,'3','fiordos8322','5050010513','2004-12-31'),(8,1,2,1,1,5,1,2,'1ddfg6','latitude',1,1,'1','fiordos8314','5050010586','2014-12-31'),(9,1,1,1,999,999,999,999,'2244dd454','ASD',0,0,'0','fiordos8321','5050010588','2000-12-12'),(10,8,999,999,2,999,999,3,'1122222222222222222','1111',0,0,'s','s','5050010587','1988-11-12'),(11,1,999,999,999,999,999,999,'22222222','2222222',0,0,'','','5050010514','1970-01-01'),(12,1,1,2,1,6,2,1,'636367','latitude',0,0,'','','500500099','2014-12-31'),(13,1,1,1,1,5,999,1,'hshs5','r430',2,233,'12','hhs','50005005','2014-10-30'),(14,8,2,1,2,999,999,1,'737636','lat',500,6,'2.2','equipo','50050','2004-10-10'),(15,1,2,4,2,999,999,1,'sds33455','moit',0,0,'0','','55454','2014-12-21');
/*!40000 ALTER TABLE `computer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverytype`
--

DROP TABLE IF EXISTS `deliverytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliverytype` (
  `idDeliverytype` int(11) NOT NULL AUTO_INCREMENT,
  `nameDeliverytype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDeliverytype`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverytype`
--

LOCK TABLES `deliverytype` WRITE;
/*!40000 ALTER TABLE `deliverytype` DISABLE KEYS */;
INSERT INTO `deliverytype` VALUES (1,'Nuevo'),(2,'Prestamo'),(999,'Desconocido');
/*!40000 ALTER TABLE `deliverytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturercomputer`
--

DROP TABLE IF EXISTS `manufacturercomputer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturercomputer` (
  `idManufacturer` int(11) NOT NULL AUTO_INCREMENT,
  `nameManufacturer` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idManufacturer`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturercomputer`
--

LOCK TABLES `manufacturercomputer` WRITE;
/*!40000 ALTER TABLE `manufacturercomputer` DISABLE KEYS */;
INSERT INTO `manufacturercomputer` VALUES (1,'Samsung'),(2,'Dell'),(3,'Lenovo'),(4,'Hp'),(999,'Desconocido');
/*!40000 ALTER TABLE `manufacturercomputer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officecomputer`
--

DROP TABLE IF EXISTS `officecomputer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `officecomputer` (
  `idOfficecomputer` int(11) NOT NULL AUTO_INCREMENT,
  `nameOfficecomputer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOfficecomputer`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officecomputer`
--

LOCK TABLES `officecomputer` WRITE;
/*!40000 ALTER TABLE `officecomputer` DISABLE KEYS */;
INSERT INTO `officecomputer` VALUES (1,'Office 2003 standard'),(2,'Office 2003 profesional'),(3,'Office 2007 standard'),(4,'Office 2007 profesional'),(5,'Office 2010 standard'),(6,'Office 2010 profesional'),(999,'Desconocido');
/*!40000 ALTER TABLE `officecomputer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operatingsystem`
--

DROP TABLE IF EXISTS `operatingsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operatingsystem` (
  `idOperatingsystem` int(11) NOT NULL AUTO_INCREMENT,
  `nameOperatingsystem` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`idOperatingsystem`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatingsystem`
--

LOCK TABLES `operatingsystem` WRITE;
/*!40000 ALTER TABLE `operatingsystem` DISABLE KEYS */;
INSERT INTO `operatingsystem` VALUES (1,'Windows xp profesional'),(2,'Windows 7 profesional'),(999,'Desconocido');
/*!40000 ALTER TABLE `operatingsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statecomputer`
--

DROP TABLE IF EXISTS `statecomputer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statecomputer` (
  `idStatecomputer` int(11) NOT NULL AUTO_INCREMENT,
  `nameStatecomputer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idStatecomputer`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statecomputer`
--

LOCK TABLES `statecomputer` WRITE;
/*!40000 ALTER TABLE `statecomputer` DISABLE KEYS */;
INSERT INTO `statecomputer` VALUES (1,'Activo'),(2,'Perdida'),(3,'Backup'),(999,'Desconocido');
/*!40000 ALTER TABLE `statecomputer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typecomputer`
--

DROP TABLE IF EXISTS `typecomputer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typecomputer` (
  `idTypeComputer` int(11) NOT NULL AUTO_INCREMENT,
  `nameTypeComputer` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idTypeComputer`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecomputer`
--

LOCK TABLES `typecomputer` WRITE;
/*!40000 ALTER TABLE `typecomputer` DISABLE KEYS */;
INSERT INTO `typecomputer` VALUES (1,'PC'),(2,'Notebook'),(3,'Netbook'),(4,'Monitor'),(999,'Desconocido');
/*!40000 ALTER TABLE `typecomputer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `Area` int(11) DEFAULT NULL,
  `rut` int(11) DEFAULT NULL,
  `dv` char(1) DEFAULT NULL,
  `nameUser` varchar(60) DEFAULT NULL,
  `lastnamefUser` varchar(30) DEFAULT NULL,
  `lastnamemUser` varchar(30) DEFAULT NULL,
  `nameusersession` varchar(30) DEFAULT NULL,
  `emailUser` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  KEY `FK_PERTENECE` (`Area`),
  CONSTRAINT `FK_PERTENECE` FOREIGN KEY (`Area`) REFERENCES `area` (`idArea`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,16587043,'3','Germán  gabriel','Barrientos','Tereucan','gbarrientos','gbarrientos88@gmail.com'),(2,3,8659770,'5','Juan','Barriaaa','Barriaaa','jbarria','jbarria@losfiordos.cl'),(3,1,24013892,'1','nombre','apellido','apellio m','nombre','email@losfiordos.cl'),(4,2,5053881,'8','prueba2nombre','prueba2llido','prueba2 m','usern','prueba2@@losfiordos.cl'),(5,1,11761626,'6','name','apellido','jdjdj','jdhdeh','jdjdjd@losfiordos.cl'),(6,1,9220239,'9','neuvo','evo','eno','idnd','enoee@losfiordos.cl'),(7,3,23663489,'2','nuevo agregar','agregar','agregar','agregar','agregar@losfiordos.cl'),(8,1,12308252,'4','cesar','robles','robles','crobles','r@losfirodos.cl');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'invetario'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-01 16:56:38
