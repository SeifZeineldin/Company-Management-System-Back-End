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
-- Table structure for table `projects_employeeproject`
--

DROP TABLE IF EXISTS `projects_employeeproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_employeeproject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id_id` int NOT NULL,
  `project_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PROJECTS_employeepro_employee_id_id_f41f56e5_fk_EMPLOYEES` (`employee_id_id`),
  KEY `PROJECTS_employeepro_project_id_id_664e4c64_fk_PROJECTS_` (`project_id_id`),
  CONSTRAINT `PROJECTS_employeepro_employee_id_id_f41f56e5_fk_EMPLOYEES` FOREIGN KEY (`employee_id_id`) REFERENCES `employees_employee` (`id`),
  CONSTRAINT `PROJECTS_employeepro_project_id_id_664e4c64_fk_PROJECTS_` FOREIGN KEY (`project_id_id`) REFERENCES `projects_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_employeeproject`
--

LOCK TABLES `projects_employeeproject` WRITE;
/*!40000 ALTER TABLE `projects_employeeproject` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_employeeproject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-13 22:42:28
