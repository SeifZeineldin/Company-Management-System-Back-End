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
-- Table structure for table `user_accounts_useraccount`
--

DROP TABLE IF EXISTS `user_accounts_useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_accounts_useraccount` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `role` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `employee_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `USER_ACCOUNTS_userac_employee_id_id_da9e778b_fk_EMPLOYEES` (`employee_id_id`),
  CONSTRAINT `USER_ACCOUNTS_userac_employee_id_id_da9e778b_fk_EMPLOYEES` FOREIGN KEY (`employee_id_id`) REFERENCES `employees_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_accounts_useraccount`
--

LOCK TABLES `user_accounts_useraccount` WRITE;
/*!40000 ALTER TABLE `user_accounts_useraccount` DISABLE KEYS */;
INSERT INTO `user_accounts_useraccount` VALUES (1,'pbkdf2_sha256$870000$s516XZc4T0cEP6HLoHkVXr$PTD9QYf4F+Z3M4YNJWyRDuc+/dY6ei3FfODM3zVYYuY=',NULL,'brainWiseEmployee@yahoo.com','employee',1,2),(2,'pbkdf2_sha256$870000$EnQvhHBOv49g5r6uTBPGqr$sIn7XjI3VFt6ncK+x/GQ+6LpwIrjZhR8dWBYMdZFhuI=',NULL,'brainWiseAdmin@yahoo.com','admin',1,1),(3,'pbkdf2_sha256$870000$l9cPhMmY2DaSc0BcPSYWqj$jKFgCmdOcDXXmll/o12nNWNjt2ZSHfsxyVbWxQm93FA=',NULL,'brainWiseManager@yahoo.com','manager',1,4);
/*!40000 ALTER TABLE `user_accounts_useraccount` ENABLE KEYS */;
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
