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
-- Table structure for table `travel_day`
--

DROP TABLE IF EXISTS `travel_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_day` (
  `travel_day_id` int NOT NULL AUTO_INCREMENT,
  `travel_plan_id` int NOT NULL,
  `travel_day_date` date NOT NULL,
  `travel_day_day_of_plan` int NOT NULL,
  PRIMARY KEY (`travel_day_id`),
  KEY `fk-travel_plan-travel_plan_id-travel_day_travel_plan_id_idx` (`travel_plan_id`),
  CONSTRAINT `fk-travel_plan-travel_plan_id-travel_day_travel_plan_id` FOREIGN KEY (`travel_plan_id`) REFERENCES `travel_plan` (`travel_plan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_day`
--

LOCK TABLES `travel_day` WRITE;
/*!40000 ALTER TABLE `travel_day` DISABLE KEYS */;
INSERT INTO `travel_day` VALUES (1,1,'2023-01-01',1),(2,1,'2023-01-02',2),(3,1,'2023-01-03',3),(4,2,'2023-01-04',1),(5,2,'2023-01-05',2),(6,2,'2023-01-06',3),(10,4,'2023-01-10',1),(11,4,'2023-01-11',2),(12,4,'2023-01-12',3),(14,5,'2023-01-14',2),(15,5,'2023-01-15',3),(16,6,'2023-01-16',1),(17,6,'2023-01-17',2),(18,6,'2023-01-18',3),(19,7,'2023-01-19',1),(20,7,'2023-01-20',2),(21,7,'2023-01-21',3),(22,8,'2023-01-22',1),(23,8,'2023-01-23',2),(24,8,'2023-01-24',3),(25,9,'2023-01-25',1),(26,9,'2023-01-26',2),(27,9,'2023-01-27',3),(28,10,'2023-01-28',1),(29,10,'2023-01-29',2),(30,10,'2023-01-30',3),(31,11,'2023-01-31',1),(32,11,'2023-02-01',2),(33,11,'2023-02-02',3),(34,12,'2023-02-03',1),(35,12,'2023-02-04',2),(36,12,'2023-02-05',3),(37,13,'2023-02-06',1),(38,13,'2023-02-07',2),(39,13,'2023-02-08',3),(40,14,'2023-02-09',1),(41,14,'2023-02-10',2),(42,14,'2023-02-11',3),(43,15,'2023-02-12',1),(44,15,'2023-02-13',2),(45,15,'2023-02-14',3),(46,16,'2023-02-15',1),(47,16,'2023-02-16',2),(48,16,'2023-02-17',3),(49,17,'2023-02-18',1),(50,17,'2023-02-19',2),(51,5,'2099-01-01',100);
/*!40000 ALTER TABLE `travel_day` ENABLE KEYS */;
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
