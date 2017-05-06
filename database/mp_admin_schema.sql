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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
