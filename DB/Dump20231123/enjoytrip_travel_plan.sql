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
-- Table structure for table `travel_plan`
--

DROP TABLE IF EXISTS `travel_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_plan` (
  `travel_plan_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `travel_plan_title` varchar(500) NOT NULL,
  `travel_plan_start_date` date NOT NULL,
  `travel_plan_end_date` date NOT NULL,
  `travel_plan_is_private` tinyint NOT NULL,
  PRIMARY KEY (`travel_plan_id`),
  KEY `fk-user-user_id-travel_plan-user_id_idx` (`user_id`),
  CONSTRAINT `fk-user-user_id-travel_plan-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_plan`
--

LOCK TABLES `travel_plan` WRITE;
/*!40000 ALTER TABLE `travel_plan` DISABLE KEYS */;
INSERT INTO `travel_plan` VALUES (1,'hong1@gmail.com','제목입니다 1','2023-01-01','2023-01-02',0),(2,'hong2@gmail.com','제목입니다 2','2023-01-02','2023-01-03',0),(4,'hong4@gmail.com','changed_title','2020-01-01','2020-12-31',1),(5,'hong5@gmail.com','changed_title','2020-01-01','2020-12-31',1),(6,'hong6@gmail.com','제목입니다 6','2023-01-06','2023-01-07',0),(7,'hong7@gmail.com','제목입니다 7','2023-01-07','2023-01-08',0),(8,'hong8@gmail.com','제목입니다 8','2023-01-08','2023-01-09',0),(9,'hong9@gmail.com','제목입니다 9','2023-01-09','2023-01-10',0),(10,'hong10@gmail.com','제목입니다 10','2023-01-10','2023-01-11',0),(11,'hong11@gmail.com','제목입니다 11','2023-01-11','2023-01-12',0),(12,'hong12@gmail.com','제목입니다 12','2023-01-12','2023-01-13',0),(13,'hong13@gmail.com','제목입니다 13','2023-01-13','2023-01-14',0),(14,'hong14@gmail.com','제목입니다 14','2023-01-14','2023-01-15',0),(15,'hong15@gmail.com','제목입니다 15','2023-01-15','2023-01-16',0),(16,'hong16@gmail.com','제목입니다 16','2023-01-16','2023-01-17',0),(17,'hong17@gmail.com','제목입니다 17','2023-01-17','2023-01-18',0),(18,'hong18@gmail.com','제목입니다 18','2023-01-18','2023-01-19',0),(19,'hong19@gmail.com','제목입니다 19','2023-01-19','2023-01-20',0),(20,'hong20@gmail.com','제목입니다 20','2023-01-20','2023-01-21',0),(21,'hong21@gmail.com','제목입니다 21','2023-01-21','2023-01-22',0),(22,'hong22@gmail.com','제목입니다 22','2023-01-22','2023-01-23',0),(23,'hong23@gmail.com','제목입니다 23','2023-01-23','2023-01-24',0),(24,'hong24@gmail.com','제목입니다 24','2023-01-24','2023-01-25',0),(25,'hong25@gmail.com','제목입니다 25','2023-01-25','2023-01-26',0),(26,'hong26@gmail.com','제목입니다 26','2023-01-26','2023-01-27',0),(27,'hong27@gmail.com','제목입니다 27','2023-01-27','2023-01-28',0),(28,'hong28@gmail.com','제목입니다 28','2023-01-28','2023-01-29',0),(29,'hong29@gmail.com','제목입니다 29','2023-01-29','2023-01-30',0),(30,'hong30@gmail.com','제목입니다 30','2023-01-30','2023-01-31',0),(31,'hong31@gmail.com','제목입니다 31','2023-01-31','2023-02-01',0),(32,'hong32@gmail.com','제목입니다 32','2023-02-01','2023-02-02',0),(33,'hong33@gmail.com','제목입니다 33','2023-02-02','2023-02-03',0),(34,'hong34@gmail.com','제목입니다 34','2023-02-03','2023-02-04',0),(35,'hong35@gmail.com','제목입니다 35','2023-02-04','2023-02-05',0),(36,'hong36@gmail.com','제목입니다 36','2023-02-05','2023-02-06',0),(37,'hong37@gmail.com','제목입니다 37','2023-02-06','2023-02-07',0),(38,'hong38@gmail.com','제목입니다 38','2023-02-07','2023-02-08',0),(39,'hong39@gmail.com','제목입니다 39','2023-02-08','2023-02-09',0),(40,'hong40@gmail.com','제목입니다 40','2023-02-09','2023-02-10',0),(41,'hong41@gmail.com','제목입니다 41','2023-02-10','2023-02-11',0),(42,'hong42@gmail.com','제목입니다 42','2023-02-11','2023-02-12',0),(43,'hong43@gmail.com','제목입니다 43','2023-02-12','2023-02-13',0),(44,'hong44@gmail.com','제목입니다 44','2023-02-13','2023-02-14',0),(45,'hong45@gmail.com','제목입니다 45','2023-02-14','2023-02-15',0),(46,'hong46@gmail.com','제목입니다 46','2023-02-15','2023-02-16',0),(47,'hong47@gmail.com','제목입니다 47','2023-02-16','2023-02-17',0),(48,'hong48@gmail.com','제목입니다 48','2023-02-17','2023-02-18',0),(49,'hong49@gmail.com','제목입니다 49','2023-02-18','2023-02-19',0),(50,'hong50@gmail.com','제목입니다 50','2023-02-19','2023-02-20',0),(51,'hong@gmail.com','changed_title','2030-01-01','2030-12-31',0);
/*!40000 ALTER TABLE `travel_plan` ENABLE KEYS */;
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
