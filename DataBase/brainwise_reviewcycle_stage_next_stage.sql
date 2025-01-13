-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: brainwise
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `reviewcycle_stage_next_stage`
--

DROP TABLE IF EXISTS `reviewcycle_stage_next_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewcycle_stage_next_stage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_stage_id` int NOT NULL,
  `to_stage_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ReviewCycle_stage_next_s_from_stage_id_to_stage_i_cd964334_uniq` (`from_stage_id`,`to_stage_id`),
  KEY `ReviewCycle_stage_ne_to_stage_id_8b6334a2_fk_ReviewCyc` (`to_stage_id`),
  CONSTRAINT `ReviewCycle_stage_ne_from_stage_id_d1c3a1a2_fk_ReviewCyc` FOREIGN KEY (`from_stage_id`) REFERENCES `reviewcycle_stage` (`id`),
  CONSTRAINT `ReviewCycle_stage_ne_to_stage_id_8b6334a2_fk_ReviewCyc` FOREIGN KEY (`to_stage_id`) REFERENCES `reviewcycle_stage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewcycle_stage_next_stage`
--

LOCK TABLES `reviewcycle_stage_next_stage` WRITE;
/*!40000 ALTER TABLE `reviewcycle_stage_next_stage` DISABLE KEYS */;
INSERT INTO `reviewcycle_stage_next_stage` VALUES (1,1,2),(2,2,3),(3,3,4),(4,4,5),(5,4,6),(6,5,2),(7,6,7);
/*!40000 ALTER TABLE `reviewcycle_stage_next_stage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-13 22:42:32
