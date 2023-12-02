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
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like` (
  `user_id` varchar(20) NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`post_id`),
  KEY `fk-post-post_id-like-post_id_idx` (`post_id`),
  CONSTRAINT `fk-post-post_id-like-post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk-user-user_id-like-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES ('hong2@gmail.com',2),('hong4@gmail.com',4),('hong2@gmail.com',5),('hong3@gmail.com',6),('hong4@gmail.com',7),('hong2@gmail.com',11),('hong3@gmail.com',12),('hong4@gmail.com',13),('hong3@gmail.com',15),('hong4@gmail.com',16),('hong2@gmail.com',17),('hong3@gmail.com',18),('hong4@gmail.com',19),('hong2@gmail.com',20),('hong3@gmail.com',21),('hong4@gmail.com',22),('hong2@gmail.com',23),('hong3@gmail.com',24),('hong4@gmail.com',25),('hong2@gmail.com',26),('hong3@gmail.com',27),('hong4@gmail.com',28),('hong2@gmail.com',29),('hong3@gmail.com',30),('hong4@gmail.com',31),('hong2@gmail.com',32),('hong3@gmail.com',33),('hong4@gmail.com',34),('hong2@gmail.com',35),('hong3@gmail.com',36),('hong4@gmail.com',37),('hong2@gmail.com',38),('hong3@gmail.com',39),('hong4@gmail.com',40),('hong2@gmail.com',41),('hong3@gmail.com',42),('hong4@gmail.com',43),('hong2@gmail.com',44),('hong3@gmail.com',45),('hong4@gmail.com',46),('hong2@gmail.com',47),('hong3@gmail.com',48),('hong4@gmail.com',49),('hong2@gmail.com',50),('hong3@gmail.com',51);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
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
