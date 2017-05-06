-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mp_playout
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mp_playout` ;

-- -----------------------------------------------------
-- Schema mp_playout
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mp_playout` DEFAULT CHARACTER SET utf8 ;
USE `mp_playout` ;

-- -----------------------------------------------------
-- Table `mp_playout`.`Media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout`.`Media` ;

CREATE TABLE IF NOT EXISTS `mp_playout`.`Media` (
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
-- Table `mp_playout`.`Thumbnail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout`.`Thumbnail` ;

CREATE TABLE IF NOT EXISTS `mp_playout`.`Thumbnail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mediaId` INT NOT NULL,
  `path` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `path_UNIQUE` (`path` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `mediaId_idx` (`mediaId` ASC),
  CONSTRAINT `FK_Thumbnail_mediaId_Media_id`
    FOREIGN KEY (`mediaId`)
    REFERENCES `mp_playout`.`Media` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout`.`MediaInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout`.`MediaInfo` ;

CREATE TABLE IF NOT EXISTS `mp_playout`.`MediaInfo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mediaId` INT NULL,
  `key` VARCHAR(45) NOT NULL,
  `value` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `FK_MediaInfo_mediaId_Media_id_idx` (`mediaId` ASC),
  CONSTRAINT `FK_MediaInfo_mediaId_Media_id`
    FOREIGN KEY (`mediaId`)
    REFERENCES `mp_playout`.`Media` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout`.`Sketch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout`.`Sketch` ;

CREATE TABLE IF NOT EXISTS `mp_playout`.`Sketch` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `htmlContent` MEDIUMTEXT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout`.`CompositeSketch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout`.`CompositeSketch` ;

CREATE TABLE IF NOT EXISTS `mp_playout`.`CompositeSketch` (
  `idComposite` INT NOT NULL AUTO_INCREMENT,
  `idLeaf` INT NOT NULL,
  PRIMARY KEY (`idComposite`, `idLeaf`),
  INDEX `idLeaf_idx` (`idLeaf` ASC),
  CONSTRAINT `idLeaf`
    FOREIGN KEY (`idLeaf`)
    REFERENCES `mp_playout`.`Sketch` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout`.`Piece`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout`.`Piece` ;

CREATE TABLE IF NOT EXISTS `mp_playout`.`Piece` (
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
    REFERENCES `mp_playout`.`Media` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Piece_sketchId_Media_id`
    FOREIGN KEY (`sketchId`)
    REFERENCES `mp_playout`.`Sketch` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout`.`Playlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout`.`Playlist` ;

CREATE TABLE IF NOT EXISTS `mp_playout`.`Playlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `duration` VARCHAR(45) NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout`.`PlaylistPieces`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout`.`PlaylistPieces` ;

CREATE TABLE IF NOT EXISTS `mp_playout`.`PlaylistPieces` (
  `index` INT NOT NULL AUTO_INCREMENT,
  `playlistId` INT NOT NULL,
  `pieceId` INT NULL,
  PRIMARY KEY (`index`, `playlistId`),
  INDEX `playlistId_idx` (`playlistId` ASC),
  INDEX `pieceId_idx` (`pieceId` ASC),
  CONSTRAINT `FK_PlaylistPieces_playlistId_Playlist_id`
    FOREIGN KEY (`playlistId`)
    REFERENCES `mp_playout`.`Playlist` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PlaylistPieces_pieceId_Piece_id`
    FOREIGN KEY (`pieceId`)
    REFERENCES `mp_playout`.`Piece` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mp_playout`.`Occurrence`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mp_playout`.`Occurrence` ;

CREATE TABLE IF NOT EXISTS `mp_playout`.`Occurrence` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `playlistId` INT NULL,
  `startDateTime` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `playlistId_idx` (`playlistId` ASC),
  CONSTRAINT `FK_Occurrence_playlistId_Playlist_id`
    FOREIGN KEY (`playlistId`)
    REFERENCES `mp_playout`.`Playlist` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
