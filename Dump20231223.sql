-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cse_it_asset
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `asset_type`
--

DROP TABLE IF EXISTS `asset_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_type` (
  `asset_type_code` int NOT NULL,
  `asset_type_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`asset_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_type`
--

LOCK TABLES `asset_type` WRITE;
/*!40000 ALTER TABLE `asset_type` DISABLE KEYS */;
INSERT INTO `asset_type` VALUES (1,'PC'),(2,'Router'),(3,'Printer'),(4,'hard drive'),(5,'Laptop'),(6,'keyboard'),(7,'mouse');
/*!40000 ALTER TABLE `asset_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_assets`
--

DROP TABLE IF EXISTS `employee_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_assets` (
  `employee_asset_id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `it_asset_id` int DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `date_returned` date DEFAULT NULL,
  `condition_out` varchar(45) DEFAULT NULL,
  `condition_returned` varchar(45) DEFAULT NULL,
  `other_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_asset_id`),
  KEY `employee_idx` (`employee_id`),
  KEY `it_asset_idx` (`it_asset_id`),
  CONSTRAINT `employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `it_asset_employee_asset` FOREIGN KEY (`it_asset_id`) REFERENCES `it_assets` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_assets`
--

LOCK TABLES `employee_assets` WRITE;
/*!40000 ALTER TABLE `employee_assets` DISABLE KEYS */;
INSERT INTO `employee_assets` VALUES (1,1,1,'2022-12-20','2023-02-15','good','good',NULL),(2,2,2,'2022-12-20','2023-01-15','good','good',NULL),(3,3,2,'2022-12-20','2023-01-15','good','damaged','HDD not readable'),(4,3,3,'2022-12-20','2023-01-15','good','good',NULL),(5,4,2,'2022-12-20','2023-01-25','good','damaged','thermal issue');
/*!40000 ALTER TABLE `employee_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `extension` varchar(45) DEFAULT NULL,
  `cell_mobile` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `other_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'UpdatedName',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Harry','Cabrera','Admin',NULL,'09886777758585','harrycabrera@abc.com','Admin'),(3,'Maverick','Serencio','Admin',NULL,'09875777577','mserencio@abc.com','Admin'),(4,'John Cletus','Blas','Admin',NULL,'0988588858','jcblas@abc.com','Admin'),(5,'Emmanuel','Juanich','Developers department','Devop','098847747883','emmanjuanich@abc.com','Devop'),(7,'Ken','Sendaydiego','Developer\'s department','Backend','0998839884','kensendaydiego@abc.com','Backend developer'),(8,'Mel','Paredes','Developer\'s department','Front end','0987567747775','melparedes@abc.com','Front end developer'),(9,'Vince','Espina','IT',NULL,'09875774774','vinceespina@abc.com','IT'),(11,'David','Dacallos','IT',NULL,'097775666664','david@abc.com','It personel'),(12,'Ivan','Coonde','Backend',NULL,'097775666664','ivanconde@abc.com','Django developer'),(13,'Philip','Alili','Frontend',NULL,'097775666664','philip@abc.com','Front end developer'),(14,'Mark','Creador','Data Science',NULL,'09777536664','mark@abc.com',''),(15,'John Cletus','Blas','Admin',NULL,'0988588858','jcblas@abc.com','Admin'),(16,'Milky','galicia','Admin','','09885888522','milkygalicia@abc.com','Admin'),(18,'John','Doe','IT',NULL,'1234567890','john@example.com','Some details'),(19,'John','Doe','IT',NULL,'1234567890','john@example.com','Some details'),(23,'Jessica','Cabilar','Data Science',NULL,'098774774784','jessicacabilar@abc.com',''),(24,'Ramil','Malate','back end',NULL,'098773474784','ramilmalate@abc.com','backend department head'),(25,'Lenor','Montiero','back end',NULL,'09234334784','lenormontiero@abc.com',''),(26,'Arnaldo','Olarte','Admin',NULL,'09234334344','arnaldoolarte@abc.com',''),(27,'Franz','Valonda','IT',NULL,'0923433374','franzvalonda@abc.com','');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `it_asset_inventory`
--

DROP TABLE IF EXISTS `it_asset_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `it_asset_inventory` (
  `it_asset_inventory_id` int NOT NULL,
  `inventory_date` date DEFAULT NULL,
  `number_assigned` int DEFAULT NULL,
  `number_in_stock` int DEFAULT NULL,
  `other_details` varchar(45) DEFAULT NULL,
  `it_assets_asset_id` int DEFAULT NULL,
  PRIMARY KEY (`it_asset_inventory_id`),
  KEY `it_asset_idx` (`it_assets_asset_id`),
  CONSTRAINT `it_asset` FOREIGN KEY (`it_assets_asset_id`) REFERENCES `it_assets` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `it_asset_inventory`
--

LOCK TABLES `it_asset_inventory` WRITE;
/*!40000 ALTER TABLE `it_asset_inventory` DISABLE KEYS */;
INSERT INTO `it_asset_inventory` VALUES (1,'2022-03-15',1,1,NULL,1),(2,'2022-05-20',3,3,NULL,2),(3,'2022-05-20',1,1,'',3),(4,'2022-05-30',5,4,'1 unit in repair',4),(5,'2022-05-30',10,10,NULL,5),(6,'2022-11-05',1,1,NULL,6);
/*!40000 ALTER TABLE `it_asset_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `it_assets`
--

DROP TABLE IF EXISTS `it_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `it_assets` (
  `asset_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `other_details` varchar(45) DEFAULT NULL,
  `asset_type_asset_type_code` int DEFAULT NULL,
  PRIMARY KEY (`asset_id`),
  KEY `it_assets_asset_type_idx` (`asset_type_asset_type_code`),
  CONSTRAINT `it_assets_asset_type` FOREIGN KEY (`asset_type_asset_type_code`) REFERENCES `asset_type` (`asset_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `it_assets`
--

LOCK TABLES `it_assets` WRITE;
/*!40000 ALTER TABLE `it_assets` DISABLE KEYS */;
INSERT INTO `it_assets` VALUES (1,'Presidential PC','Acer PC i5 processor',1),(2,'Admin PC','Acer PC with i5 processor',1),(3,'Admin office router','PLDT router',2),(4,'Customer support PC','Acer PC core i3 processor',1),(5,'Developer PC','Dell PC core i5 processor',1),(6,'Developers Router','ROG router',2);
/*!40000 ALTER TABLE `it_assets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-23 20:04:02
