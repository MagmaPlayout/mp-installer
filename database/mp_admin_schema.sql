-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mp_admin
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mp_admin
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mp_admin` DEFAULT CHARACTER SET latin1 ;
USE `mp_admin` ;

-- -----------------------------------------------------
-- Table `mp_admin`.`Action`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mp_admin`.`Action` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mp_admin`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mp_admin`.`Role` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mp_admin`.`RoleActions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mp_admin`.`RoleActions` (
  `idRole` INT(11) NOT NULL,
  `idAction` INT(11) NOT NULL,
  PRIMARY KEY (`idRole`, `idAction`),
  INDEX `fk_RoleActions_Action_idx` (`idAction` ASC),
  CONSTRAINT `fk_RoleActions_Action`
    FOREIGN KEY (`idAction`)
    REFERENCES `mp_admin`.`Action` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_RoleActions_Role`
    FOREIGN KEY (`idRole`)
    REFERENCES `mp_admin`.`Role` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mp_admin`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mp_admin`.`User` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mp_admin`.`UserActions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mp_admin`.`UserActions` (
  `idUser` INT(11) NOT NULL,
  `idAction` INT(11) NOT NULL,
  PRIMARY KEY (`idUser`, `idAction`),
  INDEX `fk_UserActions_Action_idx` (`idAction` ASC),
  CONSTRAINT `fk_UserActions_Action`
    FOREIGN KEY (`idAction`)
    REFERENCES `mp_admin`.`Action` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_UserActions_User`
    FOREIGN KEY (`idUser`)
    REFERENCES `mp_admin`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- -----------------------------------------------------
-- Table `mp_admin`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE `mp_admin`.`Supplier` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `phone` VARCHAR(45) NULL,
 `name` VARCHAR(45) NOT NULL,
 `email` VARCHAR(45) NULL,
 PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `mp_admin`.`RawMedia`
-- -----------------------------------------------------
CREATE TABLE `mp_admin`.`RawMedia` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `idSupplier` INT NULL,
 `location` VARCHAR(255) NULL,
 PRIMARY KEY (`id`),
 INDEX `fk_RawMedia_1_idx` (`idSupplier` ASC),
 CONSTRAINT `fk_RawMedia_Supplier`
   FOREIGN KEY (`idSupplier`)
   REFERENCES `mp_admin`.`Supplier` (`id`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mp_admin`.`PlayoutLog`
-- -----------------------------------------------------
CREATE TABLE `mp_admin`.`PlayoutLog` (
 `timestamp` DATETIME NOT NULL,
 `idRawMedia` INT NOT NULL,
 `filter` VARCHAR(45) NULL,
 `sketch` VARCHAR(45) NULL,
 PRIMARY KEY (`timestamp`),
 INDEX `fk_PlayoutLog_1_idx` (`idRawMedia` ASC),
 CONSTRAINT `fk_PlayoutLog_RawMedia`
   FOREIGN KEY (`idRawMedia`)
   REFERENCES `mp_admin`.`RawMedia` (`id`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
