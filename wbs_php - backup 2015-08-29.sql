CREATE DATABASE  IF NOT EXISTS `wbs` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `wbs`;
-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: wbs
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
INSERT INTO `activity` VALUES (1,'Proyecto inicial',0,0,1,0,0,0,'0000-00-00',0,'0000-00-00','NULL'),(1,'Proyecto inicial',0,0,1,0,0,0,'0000-00-00',1,'0000-00-00','NULL'),(1,'Proyecto inicial',0,0,1,0,0,0,'0000-00-00',3,'0000-00-00','NULL'),(1,'Proyecto inicial',0,0,1,0,0,0,'0000-00-00',4,'0000-00-00','NULL'),(1,'Proyecto inicial',0,0,1,0,0,0,'0000-00-00',5,'0000-00-00','NULL'),(1,'Proyecto inicial',0,0,1,0,0,0,'0000-00-00',6,'0000-00-00','NULL'),(1,'Proyecto inicial',0,0,1,0,0,0,'0000-00-00',7,'0000-00-00','NULL'),(1,'Proyecto inicial',0,0,1,0,0,0,'0000-00-00',8,'0000-00-00','NULL'),(1,'Proyecto inicial',0,0,1,0,0,0,'0000-00-00',11,'0000-00-00','NULL'),(1,'Proyecto inicial',0,0,1,0,0,0,'0000-00-00',12,'0000-00-00','NULL'),(1,'Proyecto_13',0,0,1,0,0,0,'0000-00-00',13,'0000-00-00',NULL),(11,'actividad',1,0,11,1000,1,1,'2015-05-10',1,'2015-05-11','NULL'),(11,'actividad',1,0,11,1000,1,1,'2015-05-10',3,'2015-05-11','NULL'),(11,'actividad',1,0,11,1000,1,1,'2014-11-11',4,'2014-11-12','NULL'),(11,'actividad',1,0,11,1000,1,1,'2014-11-11',5,'2014-12-11','NULL'),(11,'actividad',1,0,11,1000,1,1,'2014-11-11',6,'2014-11-12','NULL'),(11,'actividad',1,0,11,1000,1,1,'2014-11-11',7,'2014-11-12','NULL'),(11,'actividad',1,0,11,1000,1,1,'2014-11-11',8,'2014-11-12','NULL'),(11,'actividad',1,0,11,1000,1,1,'2014-11-11',11,'2014-11-12','NULL'),(11,'actividad',1,0,11,1000,1,1,'2015-05-26',12,'2015-05-27','NULL'),(11,'actividad',1,0,11,1000,1,1,'2015-07-22',13,'2015-07-23',NULL),(12,'actividad',1,0,12,1000,1,1,'2015-07-07',1,'2015-07-08','NULL'),(12,'actividad',1,0,12,1000,1,1,'2015-08-25',3,'2015-08-26',NULL),(12,'actividad',1,0,12,1000,1,1,'2015-08-28',4,'2015-08-29',NULL),(12,'actividad',1,0,12,1000,1,1,'2014-11-11',6,'2014-11-12','NULL'),(12,'actividad',1,0,12,1000,1,1,'2014-11-11',8,'2014-11-13','NULL'),(13,'actividad',1,0,13,1000,1,1,'2015-08-25',3,'2015-08-26',NULL),(111,'actividad',11,0,111,1500,11,1,'2015-08-19',1,'2015-08-30','NULL'),(111,'actividad',11,0,111,1000,1,1,'2014-11-11',4,'2014-11-12','NULL'),(111,'actividad',11,0,111,1000,11,1,'2015-08-18',6,'2015-08-19',NULL),(111,'actividad',11,0,111,1000,1,1,'2015-05-10',7,'2015-05-11','NULL'),(112,'actividad',11,0,112,1200,11,3,'2015-08-26',1,'2015-08-29','NULL'),(112,'actividad',11,0,112,1000,1,1,'2015-05-17',4,'2015-05-18','NULL'),(112,'actividad',11,0,112,1000,11,1,'2015-08-18',6,'2015-08-19',NULL),(112,'actividad',11,0,112,1000,1,1,'2014-11-11',7,'2014-11-12','NULL'),(121,'actividad',12,0,121,1400,12,1,'2015-08-24',1,'2015-08-25','NULL'),(121,'actividad',12,0,121,1000,1,1,'2015-05-15',6,'2015-05-16','NULL'),(122,'actividad',12,0,122,1000,12,1,'2015-07-09',1,'2015-07-10','NULL'),(122,'actividad',12,0,122,1000,1,1,'2015-05-15',6,'2015-05-16','NULL'),(1121,'actividad',112,0,1121,1000,112,1,'2015-05-17',4,'2015-05-18','0');
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
INSERT INTO `calendar` VALUES (0,'lunes','enero','9:00','19:00','8',20,40,0),(1,'Lunes','Enero','9:00','19:00','8',20,40,1),(3,'Lunes','Enero','9:00','19:00','8',20,40,3);
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_works`
--

DROP TABLE IF EXISTS `no_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_works` (
  `id_no_works` int(11) NOT NULL,
  `start_date_nowork` date NOT NULL,
  `finish_date_nowork` date NOT NULL,
  `name_date_nowork` varchar(45) NOT NULL,
  PRIMARY KEY (`id_no_works`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_works`
--

LOCK TABLES `no_works` WRITE;
/*!40000 ALTER TABLE `no_works` DISABLE KEYS */;
INSERT INTO `no_works` VALUES (0,'0000-00-00','0000-00-00','default'),(1,'2015-08-25','2015-08-26','Prueba dia no laborables'),(2,'2015-08-19','0000-00-00','pruebaaa'),(3,'2015-08-25','2015-08-26','Prueba');
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
INSERT INTO `no_works_has_project` VALUES (0,0),(1,1),(2,1),(3,4);
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
  `id_shared` varchar(45) NOT NULL,
  PRIMARY KEY (`id_project`,`id_shared`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (0,'0000-00-00',0,'0000-00-00',0,'default',''),(1,'0000-00-00',1,'0000-00-00',1,'Proyecto 1 usuario root','1'),(3,'2015-06-15',0,'2015-06-19',1,'Proyecto 3 usuario root',''),(4,'0000-00-00',0,'0000-00-00',2,'Proyecto 1 Usuario admin',''),(5,'0000-00-00',0,'0000-00-00',2,'Proyecto 2 Usuario admin',''),(6,'0000-00-00',0,'0000-00-00',3,'Proyecto 1 Usuario cristian',''),(7,'0000-00-00',0,'0000-00-00',3,'Proyecto 2 Usuario cristian',''),(8,'0000-00-00',0,'0000-00-00',4,'Proyecto 1 Usuario natii',''),(11,'0000-00-00',0,'0000-00-00',2,'Proyecto 3 Usuario admin',''),(12,'0000-00-00',0,'0000-00-00',5,'Proyecto 1 Usuario prueba',''),(13,'0000-00-00',0,'0000-00-00',3,'Proyecto 3 Usuario cristian','');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_has_user`
--

DROP TABLE IF EXISTS `project_has_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_has_user` (
  `project_id_project` int(10) NOT NULL,
  `project_id_shared` varchar(45) NOT NULL,
  `user_cod_user` int(11) NOT NULL,
  PRIMARY KEY (`project_id_project`,`project_id_shared`,`user_cod_user`),
  KEY `fk_project_has_user_user1_idx` (`user_cod_user`),
  KEY `fk_project_has_user_project1_idx` (`project_id_project`),
  CONSTRAINT `fk_project_has_user_project1` FOREIGN KEY (`project_id_project`) REFERENCES `project` (`id_project`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_project_has_user_user1` FOREIGN KEY (`user_cod_user`) REFERENCES `user` (`cod_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_has_user`
--

LOCK TABLES `project_has_user` WRITE;
/*!40000 ALTER TABLE `project_has_user` DISABLE KEYS */;
INSERT INTO `project_has_user` VALUES (1,'',1),(3,'',1),(4,' ',1),(4,'',2),(5,'',2),(11,'',2),(6,'',3),(7,'',3),(13,'',3),(8,'',4),(12,'',5);
/*!40000 ALTER TABLE `project_has_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `cod_user` int(11) NOT NULL AUTO_INCREMENT,
  `name_user` varchar(50) NOT NULL,
  `pass_user` varchar(30) NOT NULL,
  `digit_user` char(1) DEFAULT NULL,
  `email_user` varchar(50) NOT NULL,
  `Project_id_project` int(10) NOT NULL,
  PRIMARY KEY (`cod_user`),
  KEY `fk_User_Project1_idx` (`Project_id_project`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'root','root','1','root@wbs.com',1),(2,'admin','admin','2','admin@wbs.com',2),(3,'cristian','cristian','3','cristian@wbs.com',3),(4,'natii','nati','4','nati@wbs.com',4),(5,'prueba','prueba','5','prueba@wbs.com',5);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'wbs'
--
/*!50003 DROP FUNCTION IF EXISTS `calculo_costo_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_costo_func`(id_father int(11),id_project int(11)) RETURNS int(11)
BEGIN

declare costo_hijos int(11);
declare costo_propio int(11);
declare costo_total int(11);

set costo_propio=(select cost from activity where id_tree=id_father and Project_id_project=id_project);
set costo_hijos=(select sum(cost) from activity where parent_id=id_father and Project_id_project=id_project);
set costo_total=(costo_propio+costo);
RETURN costo_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calculo_duracion_dias_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_duracion_dias_func`(fecha_inicio date, duracion int (11)) RETURNS int(11)
BEGIN

declare fecha_final date;
declare resultado date;

set fecha_final=DATE(DATE_ADD(fecha_inicio, INTERVAL duracion DAY));
set resultado=fecha_final;


RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calculo_duracion_fechas_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_duracion_fechas_func`(id_father int(11),id_project int(11)) RETURNS date
BEGIN

declare fecha_inicio date;
declare fecha_final date;
declare fecha_final_hijos date;
declare nueva_fecha_final date;

set fecha_inicio=(select start_date from activity where id_tree=id_father and Project_id_project=id_project);
set fecha_final=(select finish_date from activity where id_tree=id_father and Project_id_project=id_project);
set fecha_final_hijos=(SELECT MAX(finish_date) FROM activity where parent_id=id_father and Project_id_project=id_project);
set nueva_fecha_final=fecha_final_hijos;
RETURN nueva_fecha_final;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `is_father_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_father_func`(id_father int (11), id_project int(11)) RETURNS int(11)
BEGIN
declare esPadre int (11);
declare resultado int (11);

set esPadre=(SELECT DISTINCT parent_id FROM activity where parent_id=id_father and Project_id_project=id_project);

if (esPadre!='') then
	set resultado=1;
else
	set resultado=0;
end if;

RETURN resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculos`(id_father int(11),id_project int(11))
BEGIN

declare padre int(11);
#declare hijo int(11);

declare fecha_inicio date;
declare fecha_fin date;

declare costo_total int (11);
#declare costo_propio int (11);
#declare costo_hijos int (11);

declare duracion_total int(11);
declare duracion_propia int(11);
#declare duracion_hijos int(11);

declare resultado int(11);

set padre=is_father_func(id_father,id_project);

if (padre=1) then
	set costo_total=calculo_costo_func(id_father,id_project);
	set fecha_inicio=(select start_date from activity where id_tree=id_father and Project_id_project=id_project);
	set fecha_fin=(select finish_date from activity where id_tree=id_father and Project_id_project=id_project);
	set duracion_propia=(select duration from activity where id_tree=id_father and Project_id_project=id_project);
	
	if(fecha_fin='0000-00-00')then
		set duracion_total=calculo_duracion_dias_func(fecha_inicio,duracion_propia);
	else
		set duracion_total=calculo_duracion_fechas_func(id_father,id_project);
	end if;

else
	select costo_total;
	select duracion_total;
end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `duracion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `duracion`(fecha_inicio date,duracion int(11))
BEGIN
declare fecha_final date;
declare resultado date;

set fecha_final=DATE(DATE_ADD(fecha_inicio, INTERVAL duracion DAY));
set resultado=fecha_final;

select resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `is_father` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `is_father`(id_father int(11),id_project int(11))
BEGIN

declare esPadre int (11);
declare resultado int (11);

set esPadre=(SELECT DISTINCT parent_id FROM activity where parent_id=id_father and Project_id_project=id_project);

if (esPadre!='') then
set resultado=1;
else
set resultado=0;
end if;

select resultado;
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

-- Dump completed on 2015-08-29 20:40:12
