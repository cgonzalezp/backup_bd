SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `wbs2` DEFAULT CHARACTER SET latin1 ;
USE `wbs2` ;

-- -----------------------------------------------------
-- Table `wbs`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wbs2`.`project` (
  `id_project` INT(10) NOT NULL DEFAULT '0',
  `start_date_project` DATE NULL DEFAULT NULL,
  `active` INT(2) NOT NULL,
  `finish_date_project` DATE NULL DEFAULT NULL,
  `id_project_user` INT(11) NULL DEFAULT '0',
  `name_project` VARCHAR(45) NULL DEFAULT NULL,
  `id_shared` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_project`, `id_shared`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wbs`.`activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wbs2`.`activity` (
  `id_tree` INT(10) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `parent_id` INT(10) NOT NULL,
  `hide` TINYINT(1) NOT NULL,
  `id_wbs` INT(11) NOT NULL,
  `cost` INT(11) NULL DEFAULT '0',
  `predecessors` INT(10) NULL DEFAULT NULL,
  `duration` DECIMAL(10,0) NULL DEFAULT '1',
  `start_date` DATE NULL DEFAULT NULL,
  `Project_id_project` INT(10) NOT NULL,
  `finish_date` DATE NULL DEFAULT NULL,
  `children_cost` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tree`, `Project_id_project`),
  INDEX `fk_tree_Project1_idx` (`Project_id_project` ASC),
  CONSTRAINT `fk_tree_Project1`
    FOREIGN KEY (`Project_id_project`)
    REFERENCES `wbs`.`project` (`id_project`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wbs`.`calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wbs2`.`calendar` (
  `id_calendar` INT(11) NOT NULL,
  `start_week` VARCHAR(45) NULL DEFAULT NULL,
  `start_fiscalyear` VARCHAR(45) NULL DEFAULT NULL,
  `start_hours` VARCHAR(45) NULL DEFAULT NULL,
  `end_hours` VARCHAR(45) NULL DEFAULT NULL,
  `start_workday_hours` VARCHAR(45) NULL DEFAULT NULL,
  `days_for_month` INT(2) NULL DEFAULT NULL,
  `workweek` INT(2) NULL DEFAULT NULL,
  `Project_id_project` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id_calendar`),
  INDEX `fk_calendar_Project1_idx` (`Project_id_project` ASC),
  CONSTRAINT `fk_calendar_Project1`
    FOREIGN KEY (`Project_id_project`)
    REFERENCES `wbs`.`project` (`id_project`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wbs`.`no_works`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wbs2`.`no_works` (
  `id_no_works` INT(11) NOT NULL,
  `start_date_nowork` DATE NOT NULL,
  `finish_date_nowork` DATE NOT NULL,
  `name_date_nowork` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_no_works`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wbs`.`no_works_has_project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wbs2`.`no_works_has_project` (
  `no_works_id_no_works` INT(11) NOT NULL,
  `Project_id_project` INT(10) NOT NULL,
  PRIMARY KEY (`no_works_id_no_works`, `Project_id_project`),
  INDEX `fk_no_works_has_Project_Project1_idx` (`Project_id_project` ASC),
  INDEX `fk_no_works_has_Project_no_works1_idx` (`no_works_id_no_works` ASC),
  CONSTRAINT `fk_no_works_has_Project_no_works1`
    FOREIGN KEY (`no_works_id_no_works`)
    REFERENCES `wbs`.`no_works` (`id_no_works`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_no_works_has_Project_Project1`
    FOREIGN KEY (`Project_id_project`)
    REFERENCES `wbs`.`project` (`id_project`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wbs`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wbs2`.`user` (
  `cod_user` INT(11) NOT NULL AUTO_INCREMENT,
  `name_user` VARCHAR(50) NOT NULL,
  `pass_user` VARCHAR(30) NOT NULL,
  `digit_user` CHAR(1) NULL DEFAULT NULL,
  `email_user` VARCHAR(50) NOT NULL,
  `Project_id_project` INT(10) NOT NULL,
  PRIMARY KEY (`cod_user`),
  INDEX `fk_User_Project1_idx` (`Project_id_project` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wbs`.`project_has_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wbs2`.`project_has_user` (
  `project_id_project` INT(10) NOT NULL,
  `project_id_shared` VARCHAR(45) NOT NULL,
  `user_cod_user` INT(11) NOT NULL,
  PRIMARY KEY (`project_id_project`, `project_id_shared`, `user_cod_user`),
  INDEX `fk_project_has_user_user1_idx` (`user_cod_user` ASC),
  INDEX `fk_project_has_user_project1_idx` (`project_id_project` ASC, `project_id_shared` ASC),
  CONSTRAINT `fk_project_has_user_project1`
    FOREIGN KEY (`project_id_project` , `project_id_shared`)
    REFERENCES `wbs`.`project` (`id_project` , `id_shared`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_has_user_user1`
    FOREIGN KEY (`user_cod_user`)
    REFERENCES `wbs`.`user` (`cod_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wbs`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wbs2`.`menu` (
  `cod_menu` INT(11) NOT NULL,
  `name_menu` VARCHAR(50) NOT NULL,
  `order_menu` INT(11) NULL DEFAULT NULL,
  `sub_menu` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_menu`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wbs`.`sub_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wbs2`.`sub_menu` (
  `cod_sub` INT(11) NOT NULL,
  `name_sub` VARCHAR(50) NOT NULL,
  `order_sub` VARCHAR(50) NULL DEFAULT NULL,
  `menu_pre` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_sub`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wbs`.`menu_has_sub_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wbs2`.`menu_has_sub_menu` (
  `menu_cod_menu` INT(11) NOT NULL,
  `sub_menu_cod_sub` INT(11) NOT NULL,
  PRIMARY KEY (`menu_cod_menu`, `sub_menu_cod_sub`),
  INDEX `fk_menu_has_sub_menu_sub_menu1_idx` (`sub_menu_cod_sub` ASC),
  INDEX `fk_menu_has_sub_menu_menu1_idx` (`menu_cod_menu` ASC),
  CONSTRAINT `fk_menu_has_sub_menu_menu1`
    FOREIGN KEY (`menu_cod_menu`)
    REFERENCES `wbs`.`menu` (`cod_menu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_has_sub_menu_sub_menu1`
    FOREIGN KEY (`sub_menu_cod_sub`)
    REFERENCES `wbs`.`sub_menu` (`cod_sub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

USE `wbs` ;

-- -----------------------------------------------------
-- procedure active_project
-- -----------------------------------------------------

DELIMITER $$
USE `wbs2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `active_project`()
BEGIN

declare id_project int;
declare active_project int;

set id_project=(SELECT id_project from project where active=1);
set active_project=id_project;

select active_project;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure calculo_costo
-- -----------------------------------------------------

DELIMITER $$
USE `wbs2`$$
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

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure calculo_costo2
-- -----------------------------------------------------

DELIMITER $$
USE `wbs2`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure calculo_fechas
-- -----------------------------------------------------

DELIMITER $$
USE `wbs2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculo_fechas`(idwbs int(11),idproject int(11))
BEGIN

declare espadre int;
declare total_dias int;
declare dias int;

set dias=0;
set total_dias=(select DATEDIFF(finish_date,start_date) as dias from activity where id_wbs=idwbs and Project_id_project=idproject);
set espadre=(select sum(cost) from activity where parent_id=idwbs and Project_id_project=idproject);

if(espadre>0)then
	set dias=total_dias;
	set total_dias=(select sum(DATEDIFF(finish_date,start_date)) as dias from activity where parent_id=idwbs and Project_id_project=idproject);
	set dias=dias+total_dias;
else
	select total_dias;
end if;

select dias;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
