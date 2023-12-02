CREATE DATABASE  IF NOT EXISTS `enjoytrip` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `enjoytrip`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: enjoytrip
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `travel_place_id` int NOT NULL,
  `post_title` varchar(500) NOT NULL,
  `post_content` text,
  PRIMARY KEY (`post_id`),
  KEY `fk-user-user_id-post-user_id_idx` (`user_id`),
  KEY `fk-travel_place-post-travel_place_id_idx` (`travel_place_id`),
  CONSTRAINT `fk-travel_place-post-travel_place_id` FOREIGN KEY (`travel_place_id`) REFERENCES `travel_place` (`travel_place_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk-user-user_id-post-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (2,'hong1@gmail.com',125266,'게시물 제목입니다 1','게시물 내용입니다 : ) 1'),(3,'hong2@gmail.com',125405,'게시물 제목입니다 2','게시물 내용입니다 : ) 2'),(4,'hong3@gmail.com',125406,'게시물 제목입니다 3','게시물 내용입니다 : ) 3'),(5,'hong1@gmail.com',125407,'게시물 제목입니다 4','게시물 내용입니다 : ) 4'),(6,'hong2@gmail.com',125408,'게시물 제목입니다 5','게시물 내용입니다 : ) 5'),(7,'hong3@gmail.com',125409,'게시물 제목입니다 6','게시물 내용입니다 : ) 6'),(11,'hong1@gmail.com',125413,'게시물 제목입니다 10','게시물 내용입니다 : ) 10'),(12,'hong2@gmail.com',125414,'게시물 제목입니다 11','게시물 내용입니다 : ) 11'),(13,'hong3@gmail.com',125415,'게시물 제목입니다 12','게시물 내용입니다 : ) 12'),(15,'hong2@gmail.com',125417,'게시물 제목입니다 14','게시물 내용입니다 : ) 14'),(16,'hong3@gmail.com',125418,'게시물 제목입니다 15','게시물 내용입니다 : ) 15'),(17,'hong1@gmail.com',125419,'게시물 제목입니다 16','게시물 내용입니다 : ) 16'),(18,'hong2@gmail.com',125420,'게시물 제목입니다 17','게시물 내용입니다 : ) 17'),(19,'hong3@gmail.com',125421,'게시물 제목입니다 18','게시물 내용입니다 : ) 18'),(20,'hong1@gmail.com',125423,'게시물 제목입니다 19','게시물 내용입니다 : ) 19'),(21,'hong2@gmail.com',125424,'게시물 제목입니다 20','게시물 내용입니다 : ) 20'),(22,'hong3@gmail.com',125425,'게시물 제목입니다 21','게시물 내용입니다 : ) 21'),(23,'hong1@gmail.com',125427,'게시물 제목입니다 22','게시물 내용입니다 : ) 22'),(24,'hong2@gmail.com',125428,'게시물 제목입니다 23','게시물 내용입니다 : ) 23'),(25,'hong3@gmail.com',125429,'게시물 제목입니다 24','게시물 내용입니다 : ) 24'),(26,'hong1@gmail.com',125430,'게시물 제목입니다 25','게시물 내용입니다 : ) 25'),(27,'hong2@gmail.com',125431,'게시물 제목입니다 26','게시물 내용입니다 : ) 26'),(28,'hong3@gmail.com',125432,'게시물 제목입니다 27','게시물 내용입니다 : ) 27'),(29,'hong1@gmail.com',125433,'게시물 제목입니다 28','게시물 내용입니다 : ) 28'),(30,'hong2@gmail.com',125434,'게시물 제목입니다 29','게시물 내용입니다 : ) 29'),(31,'hong3@gmail.com',125435,'게시물 제목입니다 30','게시물 내용입니다 : ) 30'),(32,'hong1@gmail.com',125437,'게시물 제목입니다 31','게시물 내용입니다 : ) 31'),(33,'hong2@gmail.com',125442,'게시물 제목입니다 32','게시물 내용입니다 : ) 32'),(34,'hong3@gmail.com',125443,'게시물 제목입니다 33','게시물 내용입니다 : ) 33'),(35,'hong1@gmail.com',125445,'게시물 제목입니다 34','게시물 내용입니다 : ) 34'),(36,'hong2@gmail.com',125447,'게시물 제목입니다 35','게시물 내용입니다 : ) 35'),(37,'hong3@gmail.com',125448,'게시물 제목입니다 36','게시물 내용입니다 : ) 36'),(38,'hong1@gmail.com',125449,'게시물 제목입니다 37','게시물 내용입니다 : ) 37'),(39,'hong2@gmail.com',125450,'게시물 제목입니다 38','게시물 내용입니다 : ) 38'),(40,'hong3@gmail.com',125451,'게시물 제목입니다 39','게시물 내용입니다 : ) 39'),(41,'hong1@gmail.com',125452,'게시물 제목입니다 40','게시물 내용입니다 : ) 40'),(42,'hong2@gmail.com',125453,'게시물 제목입니다 41','게시물 내용입니다 : ) 41'),(43,'hong3@gmail.com',125454,'게시물 제목입니다 42','게시물 내용입니다 : ) 42'),(44,'hong1@gmail.com',125455,'게시물 제목입니다 43','게시물 내용입니다 : ) 43'),(45,'hong2@gmail.com',125456,'게시물 제목입니다 44','게시물 내용입니다 : ) 44'),(46,'hong3@gmail.com',125457,'게시물 제목입니다 45','게시물 내용입니다 : ) 45'),(47,'hong1@gmail.com',125458,'게시물 제목입니다 46','게시물 내용입니다 : ) 46'),(48,'hong2@gmail.com',125459,'게시물 제목입니다 47','게시물 내용입니다 : ) 47'),(49,'hong3@gmail.com',125460,'게시물 제목입니다 48','게시물 내용입니다 : ) 48'),(50,'hong1@gmail.com',125461,'게시물 제목입니다 49','게시물 내용입니다 : ) 49'),(51,'hong2@gmail.com',125462,'게시물 제목입니다 50','게시물 내용입니다 : ) 50');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23 16:35:18
