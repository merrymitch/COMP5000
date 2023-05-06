CREATE DATABASE  IF NOT EXISTS `hobbyhelper` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hobbyhelper`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: hobbyhelper
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `activityID` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'Baseball','5'),(2,'Basketball','5'),(3,'Bass fishing','3'),(4,'Clay Shooting','4'),(5,'Climbing','2'),(6,'cycling','3'),(7,'Field Hockey','4'),(8,'Golf','5'),(9,'Ice Hockey','5'),(10,'Lacrosse','4'),(11,'Powerlifting','2'),(12,'Rowing','2'),(13,'Rugby','5'),(14,'Sailing','3'),(15,'Soccer','5'),(16,'Softball','5'),(17,'Swimming','3'),(18,'Team Handball','5'),(19,'Tennis','5'),(20,'Ultimate Frisbee','5'),(21,'Volleyball','5'),(22,'Waterpolo','5'),(23,'Waterski','3'),(24,'Wrestling','2');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `categoryID` varchar(10) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `activityID` int NOT NULL,
  `activity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('5','ball sports',1,'Baseball'),('5','ball sports',2,'Basketball'),('3','water sports',3,'Bass fishing'),('4','field sports',4,'Clay Shooting'),('2','strength',5,'Climbing'),('4','field sports',6,'Field Hocky'),('5','ball sports',7,'Golf'),('5','ball sports',8,'Ice Hocky'),('4','field sports',9,'Lacrosse'),('2','strength',10,'Powerlifting'),('2','strength',11,'Rowing'),('5','ball sports',12,'Rugby'),('3','water sports',13,'Sailling'),('5','ball sports',14,'Soccer'),('5','ball sports',15,'Softball'),('3','water sports',16,'Swimming'),('5','ball sports',17,'Team Handball'),('2','strength',18,'Climbing'),('5','ball sports',19,'Tennis'),('5','ball sports',20,'Ultimate Frisbee'),('5','ball sports',21,'Volleyball'),('5','ball sports',22,'Waterpolo'),('3','water sports',23,'Waterski'),('2','strength',24,'Wrestling');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `group_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `activity_id` int DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Baseball Club',5,1),(2,'Basketball Club',5,2),(3,'Bass Fishing Club',3,3),(4,'Clay Shooting Club',4,4),(5,'Climbing Club',2,5),(6,'Cycling Club',3,6),(7,'Field Hockey Club',4,7),(8,'Golf Club',5,8),(9,'Ice Hockey Club',5,9),(10,'Lacrosse Club',4,10),(11,'Powerlifting Club',2,11),(12,'Rowing Club',2,12),(13,'Rugby Club',5,13),(14,'Sailing Club',3,14),(15,'Soccer Club',5,15),(16,'Softball Club',5,16),(17,'Swimming Club',3,17),(18,'Team Handball Club',5,18),(19,'Tennis Club',5,19),(20,'Ultimate Frisbee Club',5,20),(21,'Volleyball Club',5,21),(22,'Waterpolo Club',5,22),(23,'Waterski Club',3,23),(24,'Wrestling Club',2,24);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity_data`
--

DROP TABLE IF EXISTS `user_activity_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_activity_data` (
  `user_id` int NOT NULL,
  `activity_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity_data`
--

LOCK TABLES `user_activity_data` WRITE;
/*!40000 ALTER TABLE `user_activity_data` DISABLE KEYS */;
INSERT INTO `user_activity_data` VALUES (1,1),(1,4),(1,5),(1,13),(1,15),(1,16),(1,18),(1,19),(1,21),(2,9),(2,12),(2,19),(2,22),(3,1),(3,4),(3,13),(3,20),(4,14),(4,15),(4,19),(4,23),(5,1),(5,2),(5,3),(5,9),(5,10),(5,11),(5,12),(5,13),(5,18),(5,19),(5,21),(5,24),(6,5),(6,9),(6,11),(6,12),(6,14),(6,17),(6,19),(6,20),(6,21),(6,23),(6,24);
/*!40000 ALTER TABLE `user_activity_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_data`
--

DROP TABLE IF EXISTS `user_group_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_data` (
  `user_id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_data`
--

LOCK TABLES `user_group_data` WRITE;
/*!40000 ALTER TABLE `user_group_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `user_id` int NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `activites` int DEFAULT NULL,
  `groups` int DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'Wyatt_l','Wyatt','LeMaster','wwl0004@auburn.edu','1234',NULL,NULL),(2,'Megan','Megan','Sawhorse','Meg003@auburn.edu','Mpass',NULL,NULL),(3,'Gmaw','Glenda','Stuart','G003@auburn.edu','Gpass',NULL,NULL),(4,'Sahara','Sarah','Peter','S9909@tigermail.edu','Spass',NULL,NULL),(5,'SteveTheMan','Steven ','Grace','S393@auburn.edu','Spass',NULL,NULL),(6,'Nicluth','Nicole','Luther','NCL009@auburn.edu','Ilovetorun',NULL,NULL);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-04 19:32:45
