-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: mp_playout
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-1

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
-- Table structure for table `Filter`
--

DROP TABLE IF EXISTS `Filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FilterArgs`
--

DROP TABLE IF EXISTS `FilterArgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FilterArgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filterId` int(11) DEFAULT NULL,
  `key` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_FilterArgs_1_idx` (`filterId`),
  CONSTRAINT `fk_FilterArgs_filterId_Filter_id` FOREIGN KEY (`filterId`) REFERENCES `Filter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Media`
--

DROP TABLE IF EXISTS `Media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `duration` varchar(45) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `frameRate` int(11) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `frameCount` int(11) DEFAULT NULL,
  `description` text,
  `resolution` varchar(45) DEFAULT NULL,
  `supplier` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MediaInfo`
--

DROP TABLE IF EXISTS `MediaInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MediaInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mediaId` int(11) DEFAULT NULL,
  `key` varchar(45) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_MediaInfo_mediaId_Media_id_idx` (`mediaId`),
  CONSTRAINT `FK_MediaInfo_mediaId_Media_id` FOREIGN KEY (`mediaId`) REFERENCES `Media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Occurrence`
--

DROP TABLE IF EXISTS `Occurrence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Occurrence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlistId` int(11) DEFAULT NULL,
  `pieceId` int(11) DEFAULT NULL,
  `startDateTime` varchar(45) NOT NULL,
  `filterId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `playlistId_idx` (`playlistId`),
  KEY `fk_Occurrence_pieceId_Piece_id_idx` (`pieceId`),
  CONSTRAINT `FK_Occurrence_playlistId_Playlist_id` FOREIGN KEY (`playlistId`) REFERENCES `Playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Occurrence_pieceId_Piece_id` FOREIGN KEY (`pieceId`) REFERENCES `Piece` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Piece`
--

DROP TABLE IF EXISTS `Piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Piece` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mediaId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `resolution` varchar(45) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `filterId` int(11) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `frameCount` int(11) NOT NULL,
  `frameRate` int(11) NOT NULL,
  `sketchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `mediaId_idx` (`mediaId`),
  KEY `FK_Piece_filterId_Filter_id_idx` (`filterId`),
  CONSTRAINT `FK_Piece_filterId_Filter_id` FOREIGN KEY (`filterId`) REFERENCES `Filter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Piece_mediaId_Media_id` FOREIGN KEY (`mediaId`) REFERENCES `Media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Playlist`
--

DROP TABLE IF EXISTS `Playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PlaylistPieces`
--

DROP TABLE IF EXISTS `PlaylistPieces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlaylistPieces` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `playlistId` int(11) NOT NULL,
  `pieceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`index`,`playlistId`),
  KEY `playlistId_idx` (`playlistId`),
  KEY `pieceId_idx` (`pieceId`),
  CONSTRAINT `FK_PlaylistPieces_pieceId_Piece_id` FOREIGN KEY (`pieceId`) REFERENCES `Piece` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PlaylistPieces_playlistId_Playlist_id` FOREIGN KEY (`playlistId`) REFERENCES `Playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TagPieces`
--

DROP TABLE IF EXISTS `TagPieces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TagPieces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `pieceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TagPieces_1_idx` (`tagId`),
  CONSTRAINT `fk_TagPieces_1` FOREIGN KEY (`tagId`) REFERENCES `Tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TagPlaylists`
--

DROP TABLE IF EXISTS `TagPlaylists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TagPlaylists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `playlistId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TagPlaylists_1_idx` (`tagId`),
  CONSTRAINT `fk_TagPlaylists_1` FOREIGN KEY (`tagId`) REFERENCES `Tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tags`
--

DROP TABLE IF EXISTS `Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Thumbnail`
--

DROP TABLE IF EXISTS `Thumbnail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Thumbnail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mediaId` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path_UNIQUE` (`path`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `mediaId_idx` (`mediaId`),
  CONSTRAINT `FK_Thumbnail_mediaId_Media_id` FOREIGN KEY (`mediaId`) REFERENCES `Media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-15 20:29:48
