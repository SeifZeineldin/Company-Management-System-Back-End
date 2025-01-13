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
-- Table structure for table `departments_companydepartment`
--

DROP TABLE IF EXISTS `departments_companydepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments_companydepartment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_id_id` int NOT NULL,
  `department_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DEPARTMENTS_companyd_company_id_id_2929317d_fk_COMPANIES` (`company_id_id`),
  KEY `DEPARTMENTS_companyd_department_id_id_628e005e_fk_DEPARTMEN` (`department_id_id`),
  CONSTRAINT `DEPARTMENTS_companyd_company_id_id_2929317d_fk_COMPANIES` FOREIGN KEY (`company_id_id`) REFERENCES `companies_company` (`id`),
  CONSTRAINT `DEPARTMENTS_companyd_department_id_id_628e005e_fk_DEPARTMEN` FOREIGN KEY (`department_id_id`) REFERENCES `departments_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments_companydepartment`
--

LOCK TABLES `departments_companydepartment` WRITE;
/*!40000 ALTER TABLE `departments_companydepartment` DISABLE KEYS */;
INSERT INTO `departments_companydepartment` VALUES (1,1,1);
/*!40000 ALTER TABLE `departments_companydepartment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-13 22:42:29
