-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mp_playout_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mp_playout_db` ;

-- -----------------------------------------------------
-- Schema mp_playout_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mp_playout_db` DEFAULT CHARACTER SET utf8 ;
USE `mp_playout_db` ;

-- -----------------------------------------------------
-- Table `mp_playout_db`.`Media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout_db`.`Media` ;

CREATE TABLE IF NOT EXISTS `mp_playout_db`.`Media` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `duration` VARCHAR(45) NULL,
  `name` VARCHAR(255) NOT NULL,
  `frameRate` INT NULL,
  `path` VARCHAR(255) NOT NULL,
  `frameCount` INT NULL,
  `description` TEXT NULL,
  `resolution` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout_db`.`Thumbnail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout_db`.`Thumbnail` ;

CREATE TABLE IF NOT EXISTS `mp_playout_db`.`Thumbnail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mediaId` INT NOT NULL,
  `path` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `path_UNIQUE` (`path` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `mediaId_idx` (`mediaId` ASC),
  CONSTRAINT `FK_Thumbnail_mediaId_Media_id`
    FOREIGN KEY (`mediaId`)
    REFERENCES `mp_playout_db`.`Media` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout_db`.`MediaInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout_db`.`MediaInfo` ;

CREATE TABLE IF NOT EXISTS `mp_playout_db`.`MediaInfo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mediaId` INT NULL,
  `key` VARCHAR(45) NOT NULL,
  `value` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `FK_MediaInfo_mediaId_Media_id_idx` (`mediaId` ASC),
  CONSTRAINT `FK_MediaInfo_mediaId_Media_id`
    FOREIGN KEY (`mediaId`)
    REFERENCES `mp_playout_db`.`Media` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout_db`.`Sketch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout_db`.`Sketch` ;

CREATE TABLE IF NOT EXISTS `mp_playout_db`.`Sketch` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `htmlContent` MEDIUMTEXT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout_db`.`CompositeSketch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout_db`.`CompositeSketch` ;

CREATE TABLE IF NOT EXISTS `mp_playout_db`.`CompositeSketch` (
  `idComposite` INT NOT NULL AUTO_INCREMENT,
  `idLeaf` INT NOT NULL,
  PRIMARY KEY (`idComposite`, `idLeaf`),
  INDEX `idLeaf_idx` (`idLeaf` ASC),
  CONSTRAINT `idLeaf`
    FOREIGN KEY (`idLeaf`)
    REFERENCES `mp_playout_db`.`Sketch` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout_db`.`Piece`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout_db`.`Piece` ;

CREATE TABLE IF NOT EXISTS `mp_playout_db`.`Piece` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mediaId` INT NOT NULL,
  `sketchId` INT NULL,
  `resolution` VARCHAR(45) NULL,
  `duration` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `mediaId_idx` (`mediaId` ASC),
  INDEX `sketchId_idx` (`sketchId` ASC),
  CONSTRAINT `FK_Piece_mediaId_Media_id`
    FOREIGN KEY (`mediaId`)
    REFERENCES `mp_playout_db`.`Media` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Piece_sketchId_Media_id`
    FOREIGN KEY (`sketchId`)
    REFERENCES `mp_playout_db`.`Sketch` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout_db`.`Playlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout_db`.`Playlist` ;

CREATE TABLE IF NOT EXISTS `mp_playout_db`.`Playlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `duration` VARCHAR(45) NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout_db`.`PlaylistPieces`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout_db`.`PlaylistPieces` ;

CREATE TABLE IF NOT EXISTS `mp_playout_db`.`PlaylistPieces` (
  `index` INT NOT NULL AUTO_INCREMENT,
  `playlistId` INT NOT NULL,
  `pieceId` INT NULL,
  PRIMARY KEY (`index`, `playlistId`),
  INDEX `playlistId_idx` (`playlistId` ASC),
  INDEX `pieceId_idx` (`pieceId` ASC),
  CONSTRAINT `FK_PlaylistPieces_playlistId_Playlist_id`
    FOREIGN KEY (`playlistId`)
    REFERENCES `mp_playout_db`.`Playlist` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PlaylistPieces_pieceId_Piece_id`
    FOREIGN KEY (`pieceId`)
    REFERENCES `mp_playout_db`.`Piece` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout_db`.`Occurrence`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout_db`.`Occurrence` ;

CREATE TABLE IF NOT EXISTS `mp_playout_db`.`Occurrence` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `playlistId` INT NULL,
  `startDateTime` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `playlistId_idx` (`playlistId` ASC),
  CONSTRAINT `FK_Occurrence_playlistId_Playlist_id`
    FOREIGN KEY (`playlistId`)
    REFERENCES `mp_playout_db`.`Playlist` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
