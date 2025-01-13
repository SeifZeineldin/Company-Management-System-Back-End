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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'COMPANIES','0001_initial','2025-01-13 18:25:26.222657'),(2,'DEPARTMENTS','0001_initial','2025-01-13 18:25:30.278471'),(3,'EMPLOYEES','0001_initial','2025-01-13 18:25:34.629982'),(4,'PROJECTS','0001_initial','2025-01-13 18:25:41.879795'),(5,'USER_ACCOUNTS','0001_initial','2025-01-13 18:25:44.274798'),(6,'ReviewCycle','0001_initial','2025-01-13 18:25:47.234944'),(7,'contenttypes','0001_initial','2025-01-13 18:25:48.097361'),(8,'admin','0001_initial','2025-01-13 18:25:51.243985'),(9,'admin','0002_logentry_remove_auto_add','2025-01-13 18:25:51.344982'),(10,'admin','0003_logentry_add_action_flag_choices','2025-01-13 18:25:51.432913'),(11,'contenttypes','0002_remove_content_type_name','2025-01-13 18:25:52.996093'),(12,'auth','0001_initial','2025-01-13 18:25:59.901242'),(13,'auth','0002_alter_permission_name_max_length','2025-01-13 18:26:01.168714'),(14,'auth','0003_alter_user_email_max_length','2025-01-13 18:26:01.326855'),(15,'auth','0004_alter_user_username_opts','2025-01-13 18:26:01.448845'),(16,'auth','0005_alter_user_last_login_null','2025-01-13 18:26:01.548607'),(17,'auth','0006_require_contenttypes_0002','2025-01-13 18:26:01.644767'),(18,'auth','0007_alter_validators_add_error_messages','2025-01-13 18:26:01.717383'),(19,'auth','0008_alter_user_username_max_length','2025-01-13 18:26:01.827266'),(20,'auth','0009_alter_user_last_name_max_length','2025-01-13 18:26:01.944479'),(21,'auth','0010_alter_group_name_max_length','2025-01-13 18:26:02.226254'),(22,'auth','0011_update_proxy_permissions','2025-01-13 18:26:02.370246'),(23,'auth','0012_alter_user_first_name_max_length','2025-01-13 18:26:02.439429'),(24,'authtoken','0001_initial','2025-01-13 18:26:04.614531'),(25,'authtoken','0002_auto_20160226_1747','2025-01-13 18:26:04.742539'),(26,'authtoken','0003_tokenproxy','2025-01-13 18:26:04.789760'),(27,'authtoken','0004_alter_tokenproxy_options','2025-01-13 18:26:04.870983'),(28,'sessions','0001_initial','2025-01-13 18:26:05.819580'),(29,'USER_ACCOUNTS','0002_alter_useraccount_employee_id','2025-01-13 18:46:21.252428'),(30,'ReviewCycle','0002_alter_reviewcycle_employee_alter_reviewcycle_id_and_more','2025-01-13 19:19:32.290519'),(31,'USER_ACCOUNTS','0003_alter_useraccount_employee_id','2025-01-13 19:19:32.372725'),(32,'ReviewCycle','0003_stage_alter_reviewcycle_stage','2025-01-13 19:33:02.200052'),(33,'ReviewCycle','0004_stage_next_stage','2025-01-13 19:41:01.811687'),(34,'ReviewCycle','0005_remove_stage_next_stage_stage_next_stage','2025-01-13 19:45:46.107796'),(35,'ReviewCycle','0006_remove_stage_next_stage_stage_next_stage','2025-01-13 19:47:16.105221');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-13 22:42:31
