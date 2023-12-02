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
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `image_name` varchar(500) NOT NULL,
  `image_size` int NOT NULL,
  `image_type` varchar(20) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `image_upload_date` datetime NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `fk-post_post_id-image_post_id_idx` (`post_id`),
  CONSTRAINT `fk-post_post_id-image_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (2,28,'img27',27,'jpg','/server/src/img','2023-10-27 00:00:00'),(3,29,'img28',28,'jpg','/server/src/img','2023-10-28 00:00:00'),(4,30,'img29',29,'jpg','/server/src/img','2023-10-29 00:00:00'),(5,31,'img30',30,'jpg','/server/src/img','2023-10-30 00:00:00'),(6,32,'img31',31,'jpg','/server/src/img','2023-10-31 00:00:00'),(7,33,'img32',32,'jpg','/server/src/img','2023-11-01 00:00:00'),(8,34,'img33',33,'jpg','/server/src/img','2023-11-02 00:00:00'),(9,35,'img34',34,'jpg','/server/src/img','2023-11-03 00:00:00'),(10,36,'img35',35,'jpg','/server/src/img','2023-11-04 00:00:00'),(11,37,'img36',36,'jpg','/server/src/img','2023-11-05 00:00:00'),(12,38,'img37',37,'jpg','/server/src/img','2023-11-06 00:00:00'),(13,39,'img38',38,'jpg','/server/src/img','2023-11-07 00:00:00'),(14,40,'img39',39,'jpg','/server/src/img','2023-11-08 00:00:00'),(15,41,'img40',40,'jpg','/server/src/img','2023-11-09 00:00:00'),(16,42,'img41',41,'jpg','/server/src/img','2023-11-10 00:00:00'),(17,43,'img42',42,'jpg','/server/src/img','2023-11-11 00:00:00'),(18,44,'img43',43,'jpg','/server/src/img','2023-11-12 00:00:00'),(19,45,'img44',44,'jpg','/server/src/img','2023-11-13 00:00:00'),(20,46,'img45',45,'jpg','/server/src/img','2023-11-14 00:00:00'),(21,47,'img46',46,'jpg','/server/src/img','2023-11-15 00:00:00'),(22,48,'img47',47,'jpg','/server/src/img','2023-11-16 00:00:00'),(23,49,'img48',48,'jpg','/server/src/img','2023-11-17 00:00:00'),(24,50,'img49',49,'jpg','/server/src/img','2023-11-18 00:00:00'),(25,51,'img50',50,'jpg','/server/src/img','2023-11-19 00:00:00'),(26,2,'img1',1,'jpg','/server/src/img','2023-10-01 00:00:00'),(27,3,'img2',2,'jpg','/server/src/img','2023-10-02 00:00:00'),(28,4,'img3',3,'jpg','/server/src/img','2023-10-03 00:00:00'),(29,5,'img4',4,'jpg','/server/src/img','2023-10-04 00:00:00'),(30,6,'img5',5,'jpg','/server/src/img','2023-10-05 00:00:00'),(31,7,'img6',6,'jpg','/server/src/img','2023-10-06 00:00:00'),(33,2,'img1',1,'jpg','/server/src/img','2023-10-01 00:00:00'),(34,3,'img2',2,'jpg','/server/src/img','2023-10-02 00:00:00'),(35,4,'img3',3,'jpg','/server/src/img','2023-10-03 00:00:00'),(36,5,'img4',4,'jpg','/server/src/img','2023-10-04 00:00:00'),(37,6,'img5',5,'jpg','/server/src/img','2023-10-05 00:00:00'),(38,7,'img6',6,'jpg','/server/src/img','2023-10-06 00:00:00');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23 16:35:19
