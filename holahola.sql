CREATE DATABASE  IF NOT EXISTS `wbs` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `wbs`;
-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: wbs
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id_tree` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent_id` int(10) NOT NULL,
  `hide` tinyint(1) NOT NULL,
  `id_wbs` int(11) NOT NULL,
  `cost` int(11) DEFAULT '0',
  `predecessors` int(10) DEFAULT NULL,
  `duration` decimal(10,0) DEFAULT '1',
  `start_date` date DEFAULT NULL,
  `Project_id_project` int(10) NOT NULL,
  `finish_date` date DEFAULT NULL,
  `children_cost` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tree`,`Project_id_project`),
  KEY `fk_tree_Project1_idx` (`Project_id_project`),
  CONSTRAINT `fk_tree_Project1` FOREIGN KEY (`Project_id_project`) REFERENCES `project` (`id_project`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'Proyecto de inicio',0,0,1,0,0,0,'0000-00-00',0,'0000-00-00','0'),(1,'Proyecto_1',0,0,1,0,0,1,'2014-11-11',1,'2014-09-11','3000'),(1,'Proyecto_2',0,0,1,0,0,0,'2014-09-11',2,'2014-11-11',NULL),(1,'Proyecto_3',0,0,1,0,0,0,'2014-09-11',3,'2014-11-11',NULL),(1,'Proyecto_4',0,0,1,0,0,0,'2014-09-11',4,'2014-11-11','2000'),(1,'Proyecto_5',0,0,1,0,0,0,'2014-09-11',5,'2014-11-11',NULL),(11,'actividad 1.1',1,0,11,1000,1,1,'2014-11-11',1,'2014-11-12','0'),(11,'actividad 1.1',1,0,11,1000,1,1,'2014-11-11',4,'2014-11-11','0'),(12,'actividad 1.2',1,0,12,1000,1,1,'2014-11-11',1,'2014-11-12','1000'),(12,'actividad 1.2',1,0,12,1000,1,1,'2014-11-11',4,'2014-11-12',NULL),(13,'actividad 1.3',1,0,13,1000,1,1,'2015-11-11',1,'2015-11-11','0'),(111,'actividad 1.1.1',11,0,111,500,11,1,'2014-11-11',4,'2015-11-11',NULL),(112,'actividad 1.1.2',11,0,112,500,11,1,'2014-11-11',4,'2014-11-12',NULL),(121,'actividad 1.2.1',12,0,121,500,12,1,'2014-11-11',1,'2014-11-11','0'),(121,'actividad 1.2.1',12,0,121,500,12,1,'2014-11-11',4,'2014-11-12',NULL),(122,'actividad 1.2.2',12,0,122,500,12,1,'2014-11-11',1,'2014-11-11','0'),(131,'actividad',13,0,131,1000,13,1,'2014-11-11',1,'2014-11-12',NULL),(132,'actividad ',13,0,132,1000,13,1,'2014-11-11',1,'2014-11-12',NULL),(1111,'ACTIVIDAD 1.1.1.1',111,0,1111,1000,111,1,'2014-11-11',4,'2014-11-12',NULL);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `id_calendar` int(11) NOT NULL,
  `start_week` varchar(45) DEFAULT NULL,
  `start_fiscalyear` varchar(45) DEFAULT NULL,
  `start_hours` varchar(45) DEFAULT NULL,
  `end_hours` varchar(45) DEFAULT NULL,
  `start_workday_hours` varchar(45) DEFAULT NULL,
  `days_for_month` int(2) DEFAULT NULL,
  `workweek` int(2) DEFAULT NULL,
  `Project_id_project` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_calendar`),
  KEY `fk_calendar_Project1_idx` (`Project_id_project`),
  CONSTRAINT `fk_calendar_Project1` FOREIGN KEY (`Project_id_project`) REFERENCES `project` (`id_project`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT INTO `calendar` VALUES (0,'lunes','enero','9:00','19:00','8',20,40,0),(1,'Lunes','Enero','9:00','19:00','8',20,40,1);
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `cod_menu` int(11) NOT NULL,
  `name_menu` varchar(50) NOT NULL,
  `order_menu` int(11) DEFAULT NULL,
  `sub_menu` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_has_sub_menu`
--

DROP TABLE IF EXISTS `menu_has_sub_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_has_sub_menu` (
  `menu_cod_menu` int(11) NOT NULL,
  `sub_menu_cod_sub` int(11) NOT NULL,
  PRIMARY KEY (`menu_cod_menu`,`sub_menu_cod_sub`),
  KEY `fk_menu_has_sub_menu_sub_menu1_idx` (`sub_menu_cod_sub`),
  KEY `fk_menu_has_sub_menu_menu1_idx` (`menu_cod_menu`),
  CONSTRAINT `fk_menu_has_sub_menu_menu1` FOREIGN KEY (`menu_cod_menu`) REFERENCES `menu` (`cod_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_has_sub_menu_sub_menu1` FOREIGN KEY (`sub_menu_cod_sub`) REFERENCES `sub_menu` (`cod_sub`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_has_sub_menu`
--

LOCK TABLES `menu_has_sub_menu` WRITE;
/*!40000 ALTER TABLE `menu_has_sub_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_has_sub_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_works`
--

DROP TABLE IF EXISTS `no_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_works` (
  `id_no_works` int(11) NOT NULL,
  `date_nowork` date DEFAULT NULL,
  PRIMARY KEY (`id_no_works`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_works`
--

LOCK TABLES `no_works` WRITE;
/*!40000 ALTER TABLE `no_works` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_works_has_project`
--

DROP TABLE IF EXISTS `no_works_has_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_works_has_project` (
  `no_works_id_no_works` int(11) NOT NULL,
  `Project_id_project` int(10) NOT NULL,
  PRIMARY KEY (`no_works_id_no_works`,`Project_id_project`),
  KEY `fk_no_works_has_Project_Project1_idx` (`Project_id_project`),
  KEY `fk_no_works_has_Project_no_works1_idx` (`no_works_id_no_works`),
  CONSTRAINT `fk_no_works_has_Project_no_works1` FOREIGN KEY (`no_works_id_no_works`) REFERENCES `no_works` (`id_no_works`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_no_works_has_Project_Project1` FOREIGN KEY (`Project_id_project`) REFERENCES `project` (`id_project`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_works_has_project`
--

LOCK TABLES `no_works_has_project` WRITE;
/*!40000 ALTER TABLE `no_works_has_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_works_has_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id_project` int(10) NOT NULL DEFAULT '0',
  `start_date_project` date DEFAULT NULL,
  `active` int(2) NOT NULL,
  `finish_date_project` date DEFAULT NULL,
  `id_project_user` int(11) DEFAULT '0',
  `name_project` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (0,'0000-00-00',0,'0000-00-00',0,'default'),(1,'2014-08-28',1,'2014-11-11',1,'proyecto 1 usuario root'),(2,'2014-09-11',0,'2014-09-11',2,'proyecto 1 usuario admin'),(3,'2014-09-11',0,'2014-09-11',1,'proyecto 2 usuario root'),(4,'2014-09-11',0,'2014-09-11',3,'proyecto 1 usuario cristian'),(5,'2014-09-11',0,'2014-09-11',0,NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_menu`
--

DROP TABLE IF EXISTS `sub_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_menu` (
  `cod_sub` int(11) NOT NULL,
  `name_sub` varchar(50) NOT NULL,
  `order_sub` varchar(50) DEFAULT NULL,
  `menu_pre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_sub`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_menu`
--

LOCK TABLES `sub_menu` WRITE;
/*!40000 ALTER TABLE `sub_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `cod_user` int(11) NOT NULL,
  `name_user` varchar(50) NOT NULL,
  `pass_user` varchar(30) NOT NULL,
  `digit_user` char(1) DEFAULT NULL,
  `email_user` varchar(50) NOT NULL,
  `Project_id_project` int(10) NOT NULL,
  PRIMARY KEY (`cod_user`),
  KEY `fk_User_Project1_idx` (`Project_id_project`),
  CONSTRAINT `fk_User_Project1` FOREIGN KEY (`Project_id_project`) REFERENCES `project` (`id_project`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'root','root','1','root@root.com',1),(2,'admin','admin','2','admin@admin.com',2),(3,'cristian','CristianOlii','3','cristian.alexis.g@gmail.com',3),(4,'natii','teo','4','nati@wbs.cl',4);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'wbs'
--
/*!50003 DROP PROCEDURE IF EXISTS `active_project` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `active_project`()
BEGIN

declare id_project int;
declare active_project int;

set id_project=(SELECT id_project from project where active=1);
set active_project=id_project;

select active_project;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculo_costo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculo_costo`(idwbs int(11))
BEGIN
declare suma_costo int;
declare costo_hijo int;
declare costo_base int;
declare costo_base_hijo int;

set costo_hijo=(select sum(children_cost) from activity where parent_id=idwbs );

set suma_costo = (select sum(cost) from activity where id_wbs=idwbs);

set costo_base_hijo = (select sum(cost) from activity where parent_id=idwbs );

set costo_base=(suma_costo);

if(costo_hijo>=0)then
set costo_base=(costo_base+costo_hijo);
end if;

if(costo_base_hijo>=0) then
set costo_base=(costo_base+costo_base_hijo);
end if;

select costo_base;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculo_costo2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculo_costo2`(idwbs int(11), idproject int(11))
BEGIN

declare suma_costo_hijos int;
declare costo_propio int;
declare suma_costo_total int;
declare costo int;

set suma_costo_total=(select sum(cost) from activity where Project_id_project=idproject);
set costo_propio=(select cost from activity where id_wbs=idwbs and Project_id_project=idproject);
set suma_costo_hijos=(select sum(cost) from activity where parent_id=idwbs and Project_id_project=idproject);

if(idwbs=1)then
	set costo=suma_costo_total;
    
elseif(suma_costo_hijos>=0)then
		set costo=suma_costo_hijos+costo_propio;
	else
		set costo=costo_propio;
end if;

#En el codigo PHP hacer un if donde se muestre el children_cost. si no tiene hijos que muestre el Cost.
select costo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculo_fechas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculo_fechas`(idwbs int(11),idproject int(11))
BEGIN

declare finish_date date;
declare start_date char;

set start_date=(select start_date from activity where id_wbs=idwbs and Project_id_project=idproject);
set finish_date=(select finish_date from activity where id_wbs=idwbs and Project_id_project=idproject);

#set start_date='2014-11-11';
#set finish_date='2014-12-15';

#set total_month=(select period_diff(start_date,finish_date);#calculo meses
select DATEDIFF(finish_date,start_date) as dias;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-26 22:13:44
