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
  `start_date` date DEFAULT '0000-00-00',
  `Project_id_project` int(10) NOT NULL,
  `finish_date` date DEFAULT '0000-00-00',
  `children_cost` varchar(45) DEFAULT NULL,
  `children_finish_date` date DEFAULT NULL,
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
INSERT INTO `activity` VALUES (1,'Proyecto inicial',0,0,1,0,0,0,'0000-00-00',0,'0000-00-00','0',NULL),(1,'Prueba',0,0,1,0,0,0,'2015-09-11',2,'2015-09-27','2000','2015-09-24'),(1,'Proyecto prueba',0,0,1,0,0,0,'2015-09-13',3,'2015-09-13','2000','0000-00-00'),(1,'prueba 2',0,0,1,0,0,0,'2015-09-21',4,'2015-10-11','2000','0000-00-00'),(1,'prueba admin',0,0,1,0,0,0,'2015-09-20',5,'2015-09-20',NULL,NULL),(11,'a',1,0,11,1000,NULL,1,'2015-09-21',2,'2015-09-27','2000','2015-09-26'),(11,'Actividad',1,0,11,1000,NULL,2,'0000-00-00',3,'0000-00-00','1000','0000-00-00'),(11,'actividad',1,0,11,1000,NULL,2,'0000-00-00',4,'0000-00-00','2000','0000-00-00'),(12,'b',1,0,12,1000,NULL,2,'2015-09-22',2,'2015-09-27','1000','2015-09-28'),(12,'Actividad',1,0,12,1000,NULL,3,'0000-00-00',3,'0000-00-00','1000','0000-00-00'),(12,'actividad',1,0,12,1000,NULL,3,'0000-00-00',4,'0000-00-00','2000','0000-00-00'),(111,'c',11,0,111,1000,NULL,2,'2015-09-24',2,'2015-09-27',NULL,NULL),(111,'Actividad',11,0,111,1000,NULL,2,'0000-00-00',3,'0000-00-00',NULL,NULL),(111,'actividad',11,0,111,1000,NULL,7,'0000-00-00',4,'0000-00-00',NULL,NULL),(112,'d',11,0,112,1000,NULL,1,'2015-09-23',2,'2015-09-27',NULL,NULL),(112,'actividad',11,0,112,1000,NULL,4,'0000-00-00',4,'0000-00-00',NULL,NULL),(121,'e',12,0,121,1000,NULL,4,'2015-09-15',2,'2015-09-27',NULL,NULL),(121,'Actividad',12,0,121,1000,NULL,3,'0000-00-00',3,'0000-00-00',NULL,NULL),(121,'actividad',12,0,121,1000,NULL,1,'0000-00-00',4,'0000-00-00','0','0000-00-00'),(122,'f',12,0,122,1000,0,6,'2015-09-22',2,'2015-09-28',NULL,NULL),(122,'actividad',12,0,122,1000,NULL,3,'0000-00-00',4,'0000-00-00',NULL,NULL);
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
INSERT INTO `calendar` VALUES (0,'Lunes','Enero','9:00','19:00','8',20,40,0),(2,'Lunes','Enero','9:00','19:00','8',20,40,2),(4,'Domingo','Abril','9:00','19:00','8',20,40,4),(5,'Lunes','Enero','9:00','19:00','8',20,40,5);
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
INSERT INTO `no_works` VALUES (0,'0000-00-00','0000-00-00','default');
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
INSERT INTO `no_works_has_project` VALUES (0,0);
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
INSERT INTO `project` VALUES (0,'0000-00-00',0,'0000-00-00',0,'default',''),(2,'2015-09-11',0,'2015-09-27',1,'Prueba',''),(3,'2015-09-13',0,'2015-09-13',6,'Proyecto prueba',''),(4,'2015-09-21',1,'2015-10-11',1,'prueba 2',''),(5,'2015-09-20',0,'2015-09-20',2,'prueba admin','');
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
INSERT INTO `project_has_user` VALUES (2,'',1),(4,'',1),(5,'',2),(3,'',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'root','root','1','root@wbs.com',1),(2,'admin','admin','2','admin@wbs.com',2),(3,'cristian','cristian','3','cristian@wbs.com',3),(4,'natii','nati','4','nati@wbs.com',4),(5,'prueba','prueba','5','prueba@wbs.com',5),(6,'Cristian Gonzalez','aaaa','6','cristian.alexis.g@gmail.com',6);
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


if(id_father='1')then
	set costo_total=(select sum(cost) from activity where Project_id_project=id_project);
	update activity set children_cost=costo_total where id_tree=id_father and Project_id_project=id_project;
else
	set costo_propio=(select cost from activity where id_tree=id_father and Project_id_project=id_project);
	set costo_hijos=(select sum(cost) from activity where parent_id=id_father and Project_id_project=id_project);
	update activity set children_cost=costo_hijos where id_tree=id_father and Project_id_project=id_project;
	set costo_total=(costo_propio+costo_hijos);

end if;

RETURN costo_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calculo_dias_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_dias_func`(dia_inicial varchar(11)) RETURNS varchar(11) CHARSET latin1
BEGIN

RETURN "";
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
CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_duracion_dias_func`(fecha_inicio date, duracion int (11)) RETURNS date
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

declare fecha_fin date;
declare fecha_inicio_actividad date;
declare fecha_fin_actividad date;
declare fecha_inicio_proyecto date;
declare fecha_fin_proyecto date;
declare fecha_fin_hijos date;
declare fecha_fin_nietos date;

set fecha_fin=(select children_finish_date from activity where parent_id=id_father and Project_id_project=id_project);


RETURN fecha_fin;
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
/*!50003 DROP PROCEDURE IF EXISTS `calculo_costo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculo_costo`(id_activity int(11),id_project int(11))
BEGIN

declare costo_total int(11);

set costo_total=calculo_costo_func(id_activity,id_project);

select costo_total;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculo_fechas`(fecha_inicio date,fecha_fin date)
BEGIN




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dias`(dia_inicial varchar(11))
BEGIN

declare dia1 varchar(11);
declare dia2 varchar(11);

if (dia_inicial="Lunes")then 
set dia1="Saturday"; 
set dia2="Sunday";
elseif (dia_inicial="Martes")then
set dia1="Sunday";
set dia2="Monday";
elseif (dia_inicial="Miercoles") then
set dia1="Monday";
set dia2="Tuesday";
elseif (dia_inicial="Jueves") then
set dia1="Tuesday";
set dia2="Wednesday";
elseif (dia_inicial="Viernes")then
set dia1="Wednesday";
set dia2="Thursday";
elseif (dia_inicial="Sabado")then
set dia1="Thursday";
set dia2="Friday";
elseif (dia_inicial="Domingo")then
set dia1="Friday";
set dia2="Saturday";
end if;

select dia1,dia2;
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
/*!50003 DROP PROCEDURE IF EXISTS `duracion_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `duracion_2`(fecha_inicio date,fecha_fin date)
BEGIN

declare duracion int(11);
DECLARE resultado INT(11);
set duracion=DATEDIFF(fecha_fin,fecha_inicio);
SET resultado=duracion;
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

-- Dump completed on 2015-09-22 10:25:52
