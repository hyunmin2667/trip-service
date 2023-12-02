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
-- Temporary view structure for view `myview`
--

DROP TABLE IF EXISTS `myview`;
/*!50001 DROP VIEW IF EXISTS `myview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `myview` AS SELECT 
 1 AS `content_id`,
 1 AS `content_type_id`,
 1 AS `title`,
 1 AS `addr1`,
 1 AS `addr2`,
 1 AS `zipcode`,
 1 AS `tel`,
 1 AS `first_image`,
 1 AS `first_image2`,
 1 AS `readcount`,
 1 AS `sido_code`,
 1 AS `gugun_code`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `mlevel`,
 1 AS `sido_name`,
 1 AS `gugun_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `region`
--

DROP TABLE IF EXISTS `region`;
/*!50001 DROP VIEW IF EXISTS `region`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `region` AS SELECT 
 1 AS `region_name`,
 1 AS `sido_code`,
 1 AS `gugun_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `post_img_attraction_info`
--

DROP TABLE IF EXISTS `post_img_attraction_info`;
/*!50001 DROP VIEW IF EXISTS `post_img_attraction_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `post_img_attraction_info` AS SELECT 
 1 AS `post_id`,
 1 AS `user_id`,
 1 AS `travel_place_id`,
 1 AS `post_title`,
 1 AS `post_content`,
 1 AS `image_id`,
 1 AS `image_name`,
 1 AS `image_size`,
 1 AS `image_type`,
 1 AS `image_url`,
 1 AS `image_upload_date`,
 1 AS `content_id`,
 1 AS `content_type_id`,
 1 AS `title`,
 1 AS `addr1`,
 1 AS `addr2`,
 1 AS `zipcode`,
 1 AS `tel`,
 1 AS `first_image`,
 1 AS `first_image2`,
 1 AS `readcount`,
 1 AS `sido_code`,
 1 AS `gugun_code`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `mlevel`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `attraction_all`
--

DROP TABLE IF EXISTS `attraction_all`;
/*!50001 DROP VIEW IF EXISTS `attraction_all`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `attraction_all` AS SELECT 
 1 AS `content_id`,
 1 AS `content_type_id`,
 1 AS `title`,
 1 AS `addr1`,
 1 AS `addr2`,
 1 AS `zipcode`,
 1 AS `tel`,
 1 AS `first_image`,
 1 AS `first_image2`,
 1 AS `readcount`,
 1 AS `sido_code`,
 1 AS `gugun_code`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `mlevel`,
 1 AS `sido_name`,
 1 AS `gugun_name`,
 1 AS `homepage`,
 1 AS `overview`,
 1 AS `telname`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `myview`
--

/*!50001 DROP VIEW IF EXISTS `myview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `myview` AS select `ai`.`content_id` AS `content_id`,`ai`.`content_type_id` AS `content_type_id`,`ai`.`title` AS `title`,`ai`.`addr1` AS `addr1`,`ai`.`addr2` AS `addr2`,`ai`.`zipcode` AS `zipcode`,`ai`.`tel` AS `tel`,`ai`.`first_image` AS `first_image`,`ai`.`first_image2` AS `first_image2`,`ai`.`readcount` AS `readcount`,`ai`.`sido_code` AS `sido_code`,`ai`.`gugun_code` AS `gugun_code`,`ai`.`latitude` AS `latitude`,`ai`.`longitude` AS `longitude`,`ai`.`mlevel` AS `mlevel`,`sub`.`sido_name` AS `sido_name`,`sub`.`gugun_name` AS `gugun_name` from ((select `sido`.`sido_code` AS `sido_code`,`sido`.`sido_name` AS `sido_name`,`gugun`.`gugun_code` AS `gugun_code`,`gugun`.`gugun_name` AS `gugun_name` from (`sido` join `gugun`) where (`sido`.`sido_code` = `gugun`.`sido_code`)) `sub` join `attraction_info` `ai`) where ((`ai`.`sido_code` = `sub`.`sido_code`) and (`ai`.`gugun_code` = `sub`.`gugun_code`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `region`
--

/*!50001 DROP VIEW IF EXISTS `region`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `region` AS select concat(`sido`.`sido_name`,' ',`gugun`.`gugun_name`) AS `region_name`,`sido`.`sido_code` AS `sido_code`,`gugun`.`gugun_code` AS `gugun_code` from (`gugun` join `sido`) where (`gugun`.`sido_code` = `sido`.`sido_code`) union all select `sido`.`sido_name` AS `sido_name`,`sido`.`sido_code` AS `sido_code`,NULL AS `NULL` from `sido` order by `region_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `post_img_attraction_info`
--

/*!50001 DROP VIEW IF EXISTS `post_img_attraction_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `post_img_attraction_info` AS select `post`.`post_id` AS `post_id`,`post`.`user_id` AS `user_id`,`post`.`travel_place_id` AS `travel_place_id`,`post`.`post_title` AS `post_title`,`post`.`post_content` AS `post_content`,`image`.`image_id` AS `image_id`,`image`.`image_name` AS `image_name`,`image`.`image_size` AS `image_size`,`image`.`image_type` AS `image_type`,`image`.`image_url` AS `image_url`,`image`.`image_upload_date` AS `image_upload_date`,`attraction_info`.`content_id` AS `content_id`,`attraction_info`.`content_type_id` AS `content_type_id`,`attraction_info`.`title` AS `title`,`attraction_info`.`addr1` AS `addr1`,`attraction_info`.`addr2` AS `addr2`,`attraction_info`.`zipcode` AS `zipcode`,`attraction_info`.`tel` AS `tel`,`attraction_info`.`first_image` AS `first_image`,`attraction_info`.`first_image2` AS `first_image2`,`attraction_info`.`readcount` AS `readcount`,`attraction_info`.`sido_code` AS `sido_code`,`attraction_info`.`gugun_code` AS `gugun_code`,`attraction_info`.`latitude` AS `latitude`,`attraction_info`.`longitude` AS `longitude`,`attraction_info`.`mlevel` AS `mlevel` from ((`post` join `image` on((`post`.`post_id` = `image`.`post_id`))) join `attraction_info` on((`post`.`travel_place_id` = `attraction_info`.`content_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `attraction_all`
--

/*!50001 DROP VIEW IF EXISTS `attraction_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attraction_all` AS select `myview`.`content_id` AS `content_id`,`myview`.`content_type_id` AS `content_type_id`,`myview`.`title` AS `title`,`myview`.`addr1` AS `addr1`,`myview`.`addr2` AS `addr2`,`myview`.`zipcode` AS `zipcode`,`myview`.`tel` AS `tel`,`myview`.`first_image` AS `first_image`,`myview`.`first_image2` AS `first_image2`,`myview`.`readcount` AS `readcount`,`myview`.`sido_code` AS `sido_code`,`myview`.`gugun_code` AS `gugun_code`,`myview`.`latitude` AS `latitude`,`myview`.`longitude` AS `longitude`,`myview`.`mlevel` AS `mlevel`,`myview`.`sido_name` AS `sido_name`,`myview`.`gugun_name` AS `gugun_name`,`attraction_description`.`homepage` AS `homepage`,`attraction_description`.`overview` AS `overview`,`attraction_description`.`telname` AS `telname` from (`myview` join `attraction_description` on((`myview`.`content_id` = `attraction_description`.`content_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23 16:35:20
