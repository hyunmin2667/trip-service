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
-- Table structure for table `travel_place`
--

DROP TABLE IF EXISTS `travel_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_place` (
  `travel_place_id` int NOT NULL,
  `travel_day_id` int NOT NULL,
  PRIMARY KEY (`travel_place_id`,`travel_day_id`),
  KEY `fk-travel_day-travel_day_id-travel_place-travel_day_id_idx` (`travel_day_id`),
  CONSTRAINT `fk-attraction_info_content_id-travel_place_travel_place_id` FOREIGN KEY (`travel_place_id`) REFERENCES `attraction_info` (`content_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk-travel_day_travel_day_id-travel_place_travel_place_id` FOREIGN KEY (`travel_day_id`) REFERENCES `travel_day` (`travel_day_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_place`
--

LOCK TABLES `travel_place` WRITE;
/*!40000 ALTER TABLE `travel_place` DISABLE KEYS */;
INSERT INTO `travel_place` VALUES (125266,1),(125405,2),(125406,3),(125266,4),(125407,4),(125408,5),(125409,6),(125413,10),(125414,11),(125415,12),(125417,14),(125418,15),(125419,16),(125420,17),(125421,18),(125423,19),(125424,20),(125425,21),(125427,22),(125428,23),(125429,24),(125430,25),(125431,26),(125432,27),(125433,28),(125434,29),(125435,30),(125437,31),(125442,32),(125443,33),(125445,34),(125447,35),(125448,36),(125449,37),(125450,38),(125451,39),(125452,40),(125453,41),(125454,42),(125455,43),(125456,44),(125457,45),(125458,46),(125459,47),(125460,48),(125461,49),(125462,50);
/*!40000 ALTER TABLE `travel_place` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23 16:35:20
