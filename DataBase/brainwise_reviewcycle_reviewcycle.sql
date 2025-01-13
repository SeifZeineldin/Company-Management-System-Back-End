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
-- Table structure for table `reviewcycle_reviewcycle`
--

DROP TABLE IF EXISTS `reviewcycle_reviewcycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewcycle_reviewcycle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stage_id` int NOT NULL,
  `review_date` date DEFAULT NULL,
  `feedback` longtext,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `employee_id` int NOT NULL,
  `manager_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_employee_stage` (`employee_id`,`stage_id`),
  KEY `ReviewCycle_reviewcy_manager_id_f7dd57c8_fk_EMPLOYEES` (`manager_id`),
  KEY `ReviewCycle_reviewcycle_stage_id_3443e71c` (`stage_id`),
  CONSTRAINT `ReviewCycle_reviewcy_employee_id_706da809_fk_EMPLOYEES` FOREIGN KEY (`employee_id`) REFERENCES `employees_employee` (`id`),
  CONSTRAINT `ReviewCycle_reviewcy_manager_id_f7dd57c8_fk_EMPLOYEES` FOREIGN KEY (`manager_id`) REFERENCES `employees_employee` (`id`),
  CONSTRAINT `ReviewCycle_reviewcy_stage_id_3443e71c_fk_ReviewCyc` FOREIGN KEY (`stage_id`) REFERENCES `reviewcycle_stage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewcycle_reviewcycle`
--

LOCK TABLES `reviewcycle_reviewcycle` WRITE;
/*!40000 ALTER TABLE `reviewcycle_reviewcycle` DISABLE KEYS */;
INSERT INTO `reviewcycle_reviewcycle` VALUES (14,3,'2025-01-13','ok','2025-01-13 20:11:42.038316','2025-01-13 20:19:46.406920',2,4);
/*!40000 ALTER TABLE `reviewcycle_reviewcycle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-13 22:42:30
