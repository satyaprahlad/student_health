-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: student_health
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_activation`
--

DROP TABLE IF EXISTS `accounts_activation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_activation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `code` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `accounts_activation_user_id_25e4fc41_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `accounts_activation_user_id_25e4fc41_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_activation`
--

LOCK TABLES `accounts_activation` WRITE;
/*!40000 ALTER TABLE `accounts_activation` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_activation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `is_teacher` tinyint(1) NOT NULL,
  `is_manager` tinyint(1) NOT NULL,
  `is_common_user` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'pbkdf2_sha256$390000$REddWLDJeoaAPRf49QZstx$Gr+oi8Xafqe/l4IUgrfEqJRIFxN18tpZ0nsMJRde5Q0=','2023-08-31 22:50:41.296151',1,'prahlad','','','prahald@gmail.com',1,1,'2023-08-31 22:48:46.216597','',0,0,1),(2,'pbkdf2_sha256$390000$l7zBRsPKMu2M9QVF4Ng7Rb$l7L6qa4E2eKJykmo3BRQW4Y7UouQfYSYJwPqGLvcWi0=','2023-09-08 20:34:30.942970',1,'prahlad2','','','prahlad2@gmail.com',1,1,'2023-09-03 16:54:42.851585','',0,0,1),(3,'pbkdf2_sha256$390000$Tnu5iHP26j1VYgUBoQsrb3$ha9ocdGDYitcvfaIcYNl1ogDytmB2WgLCXDq91vakic=','2023-09-07 02:23:06.512705',1,'prahlad3','','','prahlad3@gmail.com',1,1,'2023-09-07 02:22:57.650032','',0,0,1),(4,'pbkdf2_sha256$390000$wdaBZIdUMHPzPz8yAqmCuv$HKjEzxESurf+pstZV9misFoudmv2ithhDOPr6ok610A=',NULL,1,'admin1','','','admin1@gamil.com',1,1,'2023-09-08 20:51:03.644312','',0,0,1);
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_groups`
--

DROP TABLE IF EXISTS `accounts_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_groups`
--

LOCK TABLES `accounts_user_groups` WRITE;
/*!40000 ALTER TABLE `accounts_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_user_permissions`
--

DROP TABLE IF EXISTS `accounts_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_user_permissions`
--

LOCK TABLES `accounts_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_address`
--

DROP TABLE IF EXISTS `address_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street_number` varchar(20) NOT NULL,
  `route` varchar(100) NOT NULL,
  `raw` varchar(200) NOT NULL,
  `formatted` varchar(200) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `locality_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_address_locality_id_5dd79609_fk_address_locality_id` (`locality_id`),
  CONSTRAINT `address_address_locality_id_5dd79609_fk_address_locality_id` FOREIGN KEY (`locality_id`) REFERENCES `address_locality` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_address`
--

LOCK TABLES `address_address` WRITE;
/*!40000 ALTER TABLE `address_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_country`
--

DROP TABLE IF EXISTS `address_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_country`
--

LOCK TABLES `address_country` WRITE;
/*!40000 ALTER TABLE `address_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_locality`
--

DROP TABLE IF EXISTS `address_locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_locality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(165) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `state_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_locality_name_postal_code_state_id_d1e927c2_uniq` (`name`,`postal_code`,`state_id`),
  KEY `address_locality_state_id_8dc32b8e_fk_address_state_id` (`state_id`),
  CONSTRAINT `address_locality_state_id_8dc32b8e_fk_address_state_id` FOREIGN KEY (`state_id`) REFERENCES `address_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_locality`
--

LOCK TABLES `address_locality` WRITE;
/*!40000 ALTER TABLE `address_locality` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_locality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_state`
--

DROP TABLE IF EXISTS `address_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(165) NOT NULL,
  `code` varchar(8) NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_state_name_country_id_a46a5987_uniq` (`name`,`country_id`),
  KEY `address_state_country_id_0a4efd43_fk_address_country_id` (`country_id`),
  CONSTRAINT `address_state_country_id_0a4efd43_fk_address_country_id` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_state`
--

LOCK TABLES `address_state` WRITE;
/*!40000 ALTER TABLE `address_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add site',6,'add_site'),(22,'Can change site',6,'change_site'),(23,'Can delete site',6,'delete_site'),(24,'Can view site',6,'view_site'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add activation',8,'add_activation'),(30,'Can change activation',8,'change_activation'),(31,'Can delete activation',8,'delete_activation'),(32,'Can view activation',8,'view_activation'),(33,'Can add address',9,'add_address'),(34,'Can change address',9,'change_address'),(35,'Can delete address',9,'delete_address'),(36,'Can view address',9,'view_address'),(37,'Can add country',10,'add_country'),(38,'Can change country',10,'change_country'),(39,'Can delete country',10,'delete_country'),(40,'Can view country',10,'view_country'),(41,'Can add locality',11,'add_locality'),(42,'Can change locality',11,'change_locality'),(43,'Can delete locality',11,'delete_locality'),(44,'Can view locality',11,'view_locality'),(45,'Can add state',12,'add_state'),(46,'Can change state',12,'change_state'),(47,'Can delete state',12,'delete_state'),(48,'Can view state',12,'view_state'),(49,'Can add gender master',13,'add_gendermaster'),(50,'Can change gender master',13,'change_gendermaster'),(51,'Can delete gender master',13,'delete_gendermaster'),(52,'Can view gender master',13,'view_gendermaster'),(53,'Can add patient',14,'add_patient'),(54,'Can change patient',14,'change_patient'),(55,'Can delete patient',14,'delete_patient'),(56,'Can view patient',14,'view_patient'),(57,'Can add symptom',15,'add_symptom'),(58,'Can change symptom',15,'change_symptom'),(59,'Can delete symptom',15,'delete_symptom'),(60,'Can view symptom',15,'view_symptom'),(61,'Can add guardian',16,'add_guardian'),(62,'Can change guardian',16,'change_guardian'),(63,'Can delete guardian',16,'delete_guardian'),(64,'Can view guardian',16,'view_guardian'),(65,'Can add care provider',17,'add_careprovider'),(66,'Can change care provider',17,'change_careprovider'),(67,'Can delete care provider',17,'delete_careprovider'),(68,'Can view care provider',17,'view_careprovider'),(69,'Can add immunization',18,'add_immunization'),(70,'Can change immunization',18,'change_immunization'),(71,'Can delete immunization',18,'delete_immunization'),(72,'Can view immunization',18,'view_immunization');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-08-31 22:54:16.170281','1','Male',1,'[{\"added\": {}}]',13,1),(2,'2023-08-31 22:54:54.108628','1','satya prahlad',1,'[{\"added\": {}}]',14,1),(3,'2023-08-31 22:55:42.945035','1','Prahlad Vadali',1,'[{\"added\": {}}]',17,1),(4,'2023-08-31 22:56:14.193581','1','sasdfasdfasdf',1,'[{\"added\": {}}]',15,1),(5,'2023-09-01 17:04:12.537355','1','satya prahlad',2,'[]',14,1),(6,'2023-09-01 17:05:03.172957','1','satya prahlad',2,'[{\"added\": {\"name\": \"care provider\", \"object\": \"Prahlad Vadali\"}}]',14,1),(7,'2023-09-01 17:07:46.761260','1','satya prahlad',2,'[{\"added\": {\"name\": \"guardian\", \"object\": \"ssss\"}}]',14,1),(8,'2023-09-04 00:56:01.500847','3','vadali prahladStronger',2,'[{\"changed\": {\"fields\": [\"Created by\", \"Updated by\"]}}, {\"changed\": {\"name\": \"care provider\", \"object\": \"angelina werner\", \"fields\": [\"Created by\", \"Updated by\"]}}]',14,2),(9,'2023-09-04 04:50:13.198275','2','vadali prahladStrong',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',15,2),(10,'2023-09-04 04:50:29.610531','4','adsfasdfasdfasdf',1,'[{\"added\": {}}]',15,2),(11,'2023-09-07 12:31:24.912957','21','Must Not Lose',2,'[{\"changed\": {\"fields\": [\"Description\", \"Date\"]}}]',15,3),(12,'2023-09-07 12:45:55.945154','20','sss',2,'[{\"changed\": {\"fields\": [\"Date\"]}}]',15,3),(13,'2023-09-07 12:46:20.008207','20','sss',2,'[{\"changed\": {\"fields\": [\"Patient\"]}}]',15,3),(14,'2023-09-07 15:21:11.807423','1','satya prahlad',2,'[{\"changed\": {\"name\": \"care provider\", \"object\": \"charkri\", \"fields\": [\"Created by\", \"Updated by\", \"Qualification\"]}}, {\"changed\": {\"name\": \"care provider\", \"object\": \"influencer\", \"fields\": [\"Created by\", \"Updated by\", \"Qualification\"]}}, {\"changed\": {\"name\": \"care provider\", \"object\": \"Must Win\", \"fields\": [\"Created by\", \"Updated by\", \"Qualification\"]}}, {\"changed\": {\"name\": \"care provider\", \"object\": \"ratnakar\", \"fields\": [\"Created by\", \"Updated by\", \"Qualification\"]}}, {\"deleted\": {\"name\": \"care provider\", \"object\": \"kkkkkkk\"}}, {\"changed\": {\"name\": \"guardian\", \"object\": \"ssss\", \"fields\": [\"Created by\", \"Updated by\"]}}, {\"changed\": {\"name\": \"guardian\", \"object\": \"jjjj\", \"fields\": [\"Created by\", \"Updated by\"]}}, {\"changed\": {\"name\": \"guardian\", \"object\": \"hhhhhh\", \"fields\": [\"Created by\", \"Updated by\"]}}, {\"changed\": {\"name\": \"guardian\", \"object\": \"influencer\", \"fields\": [\"Created by\", \"Updated by\"]}}, {\"changed\": {\"name\": \"guardian\", \"object\": \"dad\", \"fields\": [\"Created by\", \"Updated by\"]}}, {\"changed\": {\"name\": \"symptom\", \"object\": \"qqqqqqqq\", \"fields\": [\"Description\"]}}, {\"changed\": {\"name\": \"symptom\", \"object\": \"uuuuuu\", \"fields\": [\"Description\"]}}, {\"changed\": {\"name\": \"symptom\", \"object\": \"4-4-2\", \"fields\": [\"Description\"]}}, {\"changed\": {\"name\": \"symptom\", \"object\": \"ddgdadfadsfasdfasdfasdfadfasdf\", \"fields\": [\"Description\"]}}]',14,3),(15,'2023-09-07 15:22:33.683448','1','satya prahlad',2,'[{\"changed\": {\"fields\": [\"Profile pic\"]}}]',14,3),(16,'2023-09-08 20:46:05.736033','2','Female',1,'[{\"added\": {}}]',13,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'accounts','activation'),(7,'accounts','user'),(9,'address','address'),(10,'address','country'),(11,'address','locality'),(12,'address','state'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(13,'myutils','gendermaster'),(17,'operations','careprovider'),(16,'operations','guardian'),(18,'operations','immunization'),(14,'operations','patient'),(15,'operations','symptom'),(5,'sessions','session'),(6,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-31 22:45:34.031577'),(2,'contenttypes','0002_remove_content_type_name','2023-08-31 22:45:34.091798'),(3,'auth','0001_initial','2023-08-31 22:45:34.406871'),(4,'auth','0002_alter_permission_name_max_length','2023-08-31 22:45:34.472672'),(5,'auth','0003_alter_user_email_max_length','2023-08-31 22:45:34.483607'),(6,'auth','0004_alter_user_username_opts','2023-08-31 22:45:34.493911'),(7,'auth','0005_alter_user_last_login_null','2023-08-31 22:45:34.502980'),(8,'auth','0006_require_contenttypes_0002','2023-08-31 22:45:34.508316'),(9,'auth','0007_alter_validators_add_error_messages','2023-08-31 22:45:34.517964'),(10,'auth','0008_alter_user_username_max_length','2023-08-31 22:45:34.526331'),(11,'auth','0009_alter_user_last_name_max_length','2023-08-31 22:45:34.536500'),(12,'auth','0010_alter_group_name_max_length','2023-08-31 22:45:34.552531'),(13,'auth','0011_update_proxy_permissions','2023-08-31 22:45:34.561488'),(14,'auth','0012_alter_user_first_name_max_length','2023-08-31 22:45:34.569597'),(15,'accounts','0001_initial','2023-08-31 22:45:35.206527'),(16,'address','0001_initial','2023-08-31 22:45:35.608862'),(17,'address','0002_auto_20160213_1726','2023-08-31 22:45:35.686909'),(18,'address','0003_auto_20200830_1851','2023-08-31 22:45:35.714578'),(19,'admin','0001_initial','2023-08-31 22:45:35.862737'),(20,'admin','0002_logentry_remove_auto_add','2023-08-31 22:45:35.875020'),(21,'admin','0003_logentry_add_action_flag_choices','2023-08-31 22:45:35.888911'),(22,'myutils','0001_initial','2023-08-31 22:45:35.949155'),(23,'operations','0001_initial','2023-08-31 22:45:36.637987'),(24,'operations','0002_alter_symptom_date','2023-08-31 22:45:36.650169'),(25,'operations','0003_alter_symptom_date','2023-08-31 22:45:36.662992'),(26,'sessions','0001_initial','2023-08-31 22:45:36.707759'),(27,'sites','0001_initial','2023-08-31 22:45:36.737199'),(28,'sites','0002_alter_domain_unique','2023-08-31 22:45:36.761287'),(29,'operations','0004_alter_symptom_date_alter_symptom_name','2023-09-01 21:58:42.056034'),(30,'operations','0005_remove_guardian_description_and_more','2023-09-01 22:01:29.871783'),(31,'operations','0006_patient_profile_pic_alter_symptom_date','2023-09-04 00:55:13.830515'),(32,'operations','0007_patient_chronic_condition_alter_symptom_date','2023-09-04 02:04:43.312713'),(33,'operations','0008_patient_notes_alter_symptom_date','2023-09-04 16:15:11.281365'),(34,'operations','0009_alter_symptom_date','2023-09-04 18:29:25.691610'),(35,'operations','0010_alter_patient_chronic_condition_alter_symptom_date_and_more','2023-09-06 18:21:26.626070'),(36,'operations','0011_patient_past_30_days_condition_and_more','2023-09-07 01:27:37.215665');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6qmgomrzm9m875pevfei7398mzuo2f00','eyJ0ZXN0Y29va2llIjoid29ya2VkIn0:1qcQHH:x07J79zOvJ8cBmpulog9ejcgQu84lmxMJjSN4tfXXD8','2023-09-16 18:33:03.205646'),('bvh1lxye9y32pyus9nfwj32nq1f0a7ll','.eJxVjEEOwiAQRe_C2hBgkBaX7nsGMsxMpWrapLQr492VpAvdvvf-f6mE-1bSXmVNE6uLcur0yzLSQ-Ym-I7zbdG0zNs6Zd0Sfdiqh4XleT3av4OCtbR1DoQWwXfWhDNHM0YLLkAQMtDbLzWEMqLvJZDPxNyBMwAcwYHzot4f07k3VA:1qed26:I3gEzBTvGepRF8XGQgGCvr7CnXTvcgDu0uC8n8Arla8','2023-09-22 20:34:30.949232'),('gabi55yd6pimxz7pna4we8xjxmz9toyb','.eJxVjM0OwiAQhN-FsyHQ5ad69O4zkF1YpGpoUtqT8d2lSQ96m8z3zbxFwG0tYWu8hCmJiwBx-u0I45PrDtID632Wca7rMpHcFXnQJm9z4tf1cP8OCrbS1woABwtOOc06co_eaGu1QqsYRp_B5zON4JzJSKwoJrLAjnXX9GDE5wutijbI:1qdzWM:Fs1mN2wE-xCtUeg2rsbABp9N2uv84rZw1u9S86K8WVQ','2023-09-21 02:23:06.520534'),('lmaq9ez9xhvqcybisrp63usuvjehqd3t','.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZIahUjU0Ke3K-O_apAvd3nPOfYmE21rT1suSJhZnocXpdyPMj9J2wHdst1nmua3LRHJX5EG7vM5cnpfD_Tuo2Ou39poByLphyMyEI7F3DEpHTwpMgaitBReyHVFH8t5AjBiIVQETglHi_QHdUzc-:1qblLV:iBK5zhxTg9uzOjil7edSV2mhnu83CDXVvHg5FPkpgBU','2023-09-14 22:50:41.302470'),('n2nx9a1gyxoef9516ngwc2mbf5lar6j8','.eJxVjEEOwiAQRe_C2hBgkBaX7nsGMsxMpWrapLQr492VpAvdvvf-f6mE-1bSXmVNE6uLcur0yzLSQ-Ym-I7zbdG0zNs6Zd0Sfdiqh4XleT3av4OCtbR1DoQWwXfWhDNHM0YLLkAQMtDbLzWEMqLvJZDPxNyBMwAcwYHzot4f07k3VA:1qclEC:tedWGrJpb1aUJnQPf_xAvQxsKNJhS589z-JgnyozkdE','2023-09-17 16:55:16.615775');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myutils_gendermaster`
--

DROP TABLE IF EXISTS `myutils_gendermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myutils_gendermaster` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myutils_gendermaster`
--

LOCK TABLES `myutils_gendermaster` WRITE;
/*!40000 ALTER TABLE `myutils_gendermaster` DISABLE KEYS */;
INSERT INTO `myutils_gendermaster` VALUES (1,'Male','Male',1),(2,'Female','Female',1);
/*!40000 ALTER TABLE `myutils_gendermaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations_careprovider`
--

DROP TABLE IF EXISTS `operations_careprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations_careprovider` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `institute` varchar(100) DEFAULT NULL,
  `created_by_id` bigint DEFAULT NULL,
  `patient_id` bigint NOT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_careprovi_created_by_id_69dd4e2d_fk_accounts_` (`created_by_id`),
  KEY `operations_careprovi_patient_id_b8cbdced_fk_operation` (`patient_id`),
  KEY `operations_careprovi_updated_by_id_3125450b_fk_accounts_` (`updated_by_id`),
  CONSTRAINT `operations_careprovi_created_by_id_69dd4e2d_fk_accounts_` FOREIGN KEY (`created_by_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `operations_careprovi_patient_id_b8cbdced_fk_operation` FOREIGN KEY (`patient_id`) REFERENCES `operations_patient` (`id`),
  CONSTRAINT `operations_careprovi_updated_by_id_3125450b_fk_accounts_` FOREIGN KEY (`updated_by_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations_careprovider`
--

LOCK TABLES `operations_careprovider` WRITE;
/*!40000 ALTER TABLE `operations_careprovider` DISABLE KEYS */;
INSERT INTO `operations_careprovider` VALUES (1,'2023-08-31 22:55:42.942789','2023-08-31 22:55:42.942842','asdfasdf@gmail.com','+46771793336','Prahlad Vadali','mssss','sadfasd','sdfasdf',1,1,1),(2,'2023-09-01 17:05:03.170725','2023-09-01 17:05:03.170776','sssss@gmail.com','07207237814','Prahlad Vadali','asdfasdfasdf','sadfasdf','asdfasdf',1,1,1),(3,'2023-09-03 02:17:04.818089','2023-09-04 00:56:01.496801','satyaprahlad@gmail.com','+46771793336','angelina werner','sdfasdfsdasdf','sadfasdf','sdfasdfasdf',1,3,1),(4,'2023-09-04 09:23:20.374111','2023-09-04 09:23:20.374170','sssss@gmail.com','1111111','sdasdfasf','asdfasf','dasdfasdf','asdfasdfasdf',NULL,4,NULL),(5,'2023-09-05 17:31:44.209061','2023-09-05 17:31:44.209179','satyaprahlad@gmail.com','+46771793336','all good','all good','all good','all good',NULL,6,NULL),(7,'2023-09-07 04:50:49.539799','2023-09-07 15:21:11.778772',NULL,NULL,'charkri','sss','dasdfasdfasd',NULL,1,1,2),(8,'2023-09-07 05:15:29.568838','2023-09-07 15:21:11.780976',NULL,NULL,'influencer','sasdasd','sss',NULL,1,1,1),(9,'2023-09-07 05:18:38.580399','2023-09-07 15:21:11.783330',NULL,NULL,'Must Win','sadASD','sss',NULL,1,1,1),(10,'2023-09-07 12:29:15.325491','2023-09-07 15:21:11.785358',NULL,NULL,'ratnakar','ASDASDASD','ratnakar',NULL,1,1,1),(11,'2023-09-07 19:37:55.688322','2023-09-07 19:37:55.688458',NULL,NULL,'rrrrrrr','','ffffffff',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `operations_careprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations_guardian`
--

DROP TABLE IF EXISTS `operations_guardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations_guardian` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `patient_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` bigint DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_guardian_patient_id_c331ca69_fk_operations_patient_id` (`patient_id`),
  KEY `operations_guardian_created_by_id_5201593b_fk_accounts_user_id` (`created_by_id`),
  KEY `operations_guardian_updated_by_id_ce53a996_fk_accounts_user_id` (`updated_by_id`),
  CONSTRAINT `operations_guardian_created_by_id_5201593b_fk_accounts_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `operations_guardian_patient_id_c331ca69_fk_operations_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `operations_patient` (`id`),
  CONSTRAINT `operations_guardian_updated_by_id_ce53a996_fk_accounts_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations_guardian`
--

LOCK TABLES `operations_guardian` WRITE;
/*!40000 ALTER TABLE `operations_guardian` DISABLE KEYS */;
INSERT INTO `operations_guardian` VALUES (1,'ssss','aaaaaaa',1,'2023-09-01 22:01:29.386880',1,NULL,NULL,'2023-09-07 15:21:11.787575',1),(2,'asdfasdf','aaaaaaa',4,'2023-09-04 09:23:20.379055',NULL,'ssssss@gmail.com','dsasdasdasd','2023-09-04 09:23:20.379134',NULL),(3,'jjjj','jjjjj',1,'2023-09-07 05:28:48.578894',2,NULL,NULL,'2023-09-07 15:21:11.789440',2),(4,'hhhhhh','hhhh',1,'2023-09-07 05:29:21.115061',1,NULL,NULL,'2023-09-07 15:21:11.791259',1),(5,'influencer','iinnnn',1,'2023-09-07 08:42:40.715964',1,NULL,NULL,'2023-09-07 15:21:11.793360',2),(6,'dad','jjjjj',1,'2023-09-07 12:29:47.481718',2,NULL,NULL,'2023-09-07 15:21:11.796608',1),(7,'sdfasdfasdf','asdfasdfasd',1,'2023-09-07 19:38:04.747262',NULL,NULL,NULL,'2023-09-07 19:38:04.747363',NULL);
/*!40000 ALTER TABLE `operations_guardian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations_immunization`
--

DROP TABLE IF EXISTS `operations_immunization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations_immunization` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_immunizat_patient_id_230e48d7_fk_operation` (`patient_id`),
  CONSTRAINT `operations_immunizat_patient_id_230e48d7_fk_operation` FOREIGN KEY (`patient_id`) REFERENCES `operations_patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations_immunization`
--

LOCK TABLES `operations_immunization` WRITE;
/*!40000 ALTER TABLE `operations_immunization` DISABLE KEYS */;
INSERT INTO `operations_immunization` VALUES (1,'',1,'ggggggg','2023-09-06 00:00:00.000000',1),(2,'',1,'Normal Motivation','2023-09-07 00:00:00.000000',1),(3,'',1,'Normal Motivation','2023-09-07 00:00:00.000000',1),(4,'',1,'asfSADSAD','2023-09-07 00:00:00.000000',1),(5,'',1,'4-4-2','2023-09-07 00:00:00.000000',1),(6,'',1,'dfadfasdf','2023-09-07 00:00:00.000000',1);
/*!40000 ALTER TABLE `operations_immunization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations_patient`
--

DROP TABLE IF EXISTS `operations_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations_patient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `weight` double NOT NULL,
  `height` varchar(30) NOT NULL,
  `known_food_alergy` varchar(500) DEFAULT NULL,
  `known_insects_alergy` varchar(500) DEFAULT NULL,
  `known_medication_alergy` varchar(500) DEFAULT NULL,
  `known_contact_alergy` varchar(500) DEFAULT NULL,
  `known_common_pets_alergy` varchar(500) DEFAULT NULL,
  `known_seasonal_alergy` varchar(500) DEFAULT NULL,
  `created_by_id` bigint DEFAULT NULL,
  `gender_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `chronic_condition` varchar(500) DEFAULT NULL,
  `notes` longtext,
  `past_30_days_condition` varchar(500) DEFAULT NULL,
  `past_90_days_condition` varchar(500) DEFAULT NULL,
  `recent_illness` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_patient_created_by_id_8c34e04f_fk_accounts_user_id` (`created_by_id`),
  KEY `operations_patient_gender_id_f8801215_fk_myutils_gendermaster_id` (`gender_id`),
  KEY `operations_patient_updated_by_id_04403a86_fk_accounts_user_id` (`updated_by_id`),
  CONSTRAINT `operations_patient_created_by_id_8c34e04f_fk_accounts_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `operations_patient_gender_id_f8801215_fk_myutils_gendermaster_id` FOREIGN KEY (`gender_id`) REFERENCES `myutils_gendermaster` (`id`),
  CONSTRAINT `operations_patient_updated_by_id_04403a86_fk_accounts_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations_patient`
--

LOCK TABLES `operations_patient` WRITE;
/*!40000 ALTER TABLE `operations_patient` DISABLE KEYS */;
INSERT INTO `operations_patient` VALUES (1,'2023-08-31 22:54:54.105510','2023-09-08 20:43:14.585922','satya','prahlad','2023-08-31',23,'5\'10\"','aaa','asdfasfd','sdfasd','adsfasdf','kkkkk','uuuuuu',1,1,1,'images/patient_pics/upwork2.png','ddddddddddd','xdfsdsdf   ttttt  gggssssssssadsfasdfasdfxcZXCZX','dfasdfasdf','asdfasdfasdfasdfasdf','sdadad'),(2,'2023-09-01 22:02:25.032987','2023-09-01 22:02:25.033053','vadali','prahladStronger','2023-08-31',12,'11','adsfasdf','sss','sdfasd',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(3,'2023-09-03 02:16:55.778687','2023-09-04 00:56:01.494731','vadali','prahladStronger','2023-08-31',12,'5\'10\"',NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'',NULL,NULL,NULL,NULL,NULL),(4,'2023-09-04 09:23:20.354942','2023-09-04 09:23:20.355051','sudeep','tokkala','2023-08-31',12,'12\'','ddd, sdasdf, asdfasdf, asdfasdf, asdfasdf, asdfasdf, asdfasdf','asdfasf','sdfasd','sss','ssss','ssss',NULL,1,NULL,'','all good',NULL,NULL,NULL,NULL),(5,'2023-09-05 17:20:53.969939','2023-09-05 17:20:53.970039','ddddddddddd','ddddddddddd','2023-08-31',111,'111','ddddddddddd','ddddddddddd',NULL,NULL,NULL,NULL,NULL,1,NULL,'','ddddddddddd','',NULL,NULL,NULL),(6,'2023-09-05 17:31:44.191740','2023-09-05 17:31:44.191873','vadali','prahladStronger','2023-09-07',11,'111','all good','all good','all good','all good','all good','all good',NULL,1,NULL,'','all good','all good',NULL,NULL,NULL),(7,'2023-09-07 10:13:33.591640','2023-09-07 10:13:33.591691','Prahlad','sdsadfasdf','2023-09-09',222,'12','asdfasdf','asdfasdf',NULL,NULL,NULL,NULL,NULL,1,NULL,'','asdfasdf','asdfasdf',NULL,NULL,NULL);
/*!40000 ALTER TABLE `operations_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations_symptom`
--

DROP TABLE IF EXISTS `operations_symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations_symptom` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_symptom_patient_id_abaf072a_fk_operations_patient_id` (`patient_id`),
  CONSTRAINT `operations_symptom_patient_id_abaf072a_fk_operations_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `operations_patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations_symptom`
--

LOCK TABLES `operations_symptom` WRITE;
/*!40000 ALTER TABLE `operations_symptom` DISABLE KEYS */;
INSERT INTO `operations_symptom` VALUES (1,'sasdfasdfasdf','sdfasdfasdfasdf',1,'2023-08-31 22:49:59.000000',1),(2,'vadali prahladStrong','sssaaaaaa',1,'2023-09-01 21:36:04.000000',2),(3,'vadali prahladStronger','sss',1,'2023-09-03 00:00:00.000000',3),(4,'adsfasdfasdfasdf','dfadfadsfsadfasd',1,'2023-09-04 04:47:15.000000',1),(5,'ssssss','ssssss',1,'2023-09-04 00:00:00.000000',4),(6,'ssss','ssss',1,'2023-09-05 00:00:00.000000',5),(7,'vadali prahladStronger','ssssss',1,'2023-09-05 00:00:00.000000',6),(8,'high fever','high fever',1,'2023-09-05 00:00:00.000000',1),(9,'gggggggggg','ggggggggggg',1,'2023-09-06 00:00:00.000000',1),(10,'Must Not Lose','Must Not Lose Desc',1,'2023-09-06 00:00:00.000000',1),(11,'Must Not Lose','Must Not Lose Desc',1,'2023-09-06 00:00:00.000000',1),(12,'4-4-2','4-4-2',1,'2023-09-06 00:00:00.000000',1),(13,'yyyyy','yyyy',1,'2023-09-06 00:00:00.000000',1),(14,'99999','99999999',1,'2023-09-06 00:00:00.000000',1),(15,'ffff','fffff',1,'2023-09-06 00:00:00.000000',1),(16,'ttttt','tttt',1,'2023-09-06 00:00:00.000000',1),(17,'qqqqqqqq','ASDASD',1,'2023-09-06 00:00:00.000000',1),(18,'uuuuuu','asdASD',1,'2023-09-07 00:00:00.000000',1),(19,'4-4-2','ASdASD',1,'2023-09-07 00:00:00.000000',1),(20,'sss','ssss',1,'2023-07-05 00:00:00.000000',1),(21,'Must Not Lose','Must Win Desc',1,'2023-08-11 00:00:00.000000',1),(22,'ddgdadfadsfasdfasdfasdfadfasdf','ASd',1,'2023-09-07 00:00:00.000000',1),(23,'rrrrrrr','',1,'2023-07-20 00:00:00.000000',1);
/*!40000 ALTER TABLE `operations_symptom` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-08 21:09:03
