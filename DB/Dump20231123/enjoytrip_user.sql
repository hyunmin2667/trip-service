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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_profile_image_url` varchar(300) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('hong@gmail.com','1234','hong','noImage.jpg'),('hong1@gmail.com','1234','hong1','noImage.jpg'),('hong10@gmail.com','1234','hong10','noImage.jpg'),('hong11@gmail.com','1234','hong11','noImage.jpg'),('hong12@gmail.com','1234','hong12','noImage.jpg'),('hong13@gmail.com','1234','hong13','noImage.jpg'),('hong14@gmail.com','1234','hong14','noImage.jpg'),('hong15@gmail.com','1234','hong15','noImage.jpg'),('hong16@gmail.com','1234','hong16','noImage.jpg'),('hong17@gmail.com','1234','hong17','noImage.jpg'),('hong18@gmail.com','1234','hong18','noImage.jpg'),('hong19@gmail.com','1234','hong19','noImage.jpg'),('hong2@gmail.com','1234','hong2','noImage.jpg'),('hong20@gmail.com','1234','hong20','noImage.jpg'),('hong21@gmail.com','1234','hong21','noImage.jpg'),('hong22@gmail.com','1234','hong22','noImage.jpg'),('hong23@gmail.com','1234','hong23','noImage.jpg'),('hong24@gmail.com','1234','hong24','noImage.jpg'),('hong25@gmail.com','1234','hong25','noImage.jpg'),('hong26@gmail.com','1234','hong26','noImage.jpg'),('hong27@gmail.com','1234','hong27','noImage.jpg'),('hong28@gmail.com','1234','hong28','noImage.jpg'),('hong29@gmail.com','1234','hong29','noImage.jpg'),('hong3@gmail.com','1234','hong3','noImage.jpg'),('hong30@gmail.com','1234','hong30','noImage.jpg'),('hong31@gmail.com','1234','hong31','noImage.jpg'),('hong32@gmail.com','1234','hong32','noImage.jpg'),('hong33@gmail.com','1234','hong33','noImage.jpg'),('hong34@gmail.com','1234','hong34','noImage.jpg'),('hong35@gmail.com','1234','hong35','noImage.jpg'),('hong36@gmail.com','1234','hong36','noImage.jpg'),('hong37@gmail.com','1234','hong37','noImage.jpg'),('hong38@gmail.com','1234','hong38','noImage.jpg'),('hong39@gmail.com','1234','hong39','noImage.jpg'),('hong4@gmail.com','1234','hong4','noImage.jpg'),('hong40@gmail.com','1234','hong40','noImage.jpg'),('hong41@gmail.com','1234','hong41','noImage.jpg'),('hong42@gmail.com','1234','hong42','noImage.jpg'),('hong43@gmail.com','1234','hong43','noImage.jpg'),('hong44@gmail.com','1234','hong44','noImage.jpg'),('hong45@gmail.com','1234','hong45','noImage.jpg'),('hong46@gmail.com','1234','hong46','noImage.jpg'),('hong47@gmail.com','1234','hong47','noImage.jpg'),('hong48@gmail.com','1234','hong48','noImage.jpg'),('hong49@gmail.com','1234','hong49','noImage.jpg'),('hong5@gmail.com','1234','hong5','noImage.jpg'),('hong50@gmail.com','1234','hong50','noImage.jpg'),('hong6@gmail.com','1234','hong6','noImage.jpg'),('hong7@gmail.com','1234','hong7','noImage.jpg'),('hong8@gmail.com','1234','hong8','noImage.jpg'),('hong9@gmail.com','1234','hong9','noImage.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
