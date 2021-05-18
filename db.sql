-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: django_shop
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add корзина',7,'add_cart'),(26,'Can change корзина',7,'change_cart'),(27,'Can delete корзина',7,'delete_cart'),(28,'Can view корзина',7,'view_cart'),(29,'Can add категория',8,'add_category'),(30,'Can change категория',8,'change_category'),(31,'Can delete категория',8,'delete_category'),(32,'Can view категория',8,'view_category'),(33,'Can add пользователь',9,'add_customer'),(34,'Can change пользователь',9,'change_customer'),(35,'Can delete пользователь',9,'delete_customer'),(36,'Can view пользователь',9,'view_customer'),(37,'Can add Главная категория',10,'add_main_category'),(38,'Can change Главная категория',10,'change_main_category'),(39,'Can delete Главная категория',10,'delete_main_category'),(40,'Can view Главная категория',10,'view_main_category'),(41,'Can add Телевизор',11,'add_tv'),(42,'Can change Телевизор',11,'change_tv'),(43,'Can delete Телевизор',11,'delete_tv'),(44,'Can view Телевизор',11,'view_tv'),(45,'Can add Планшет',12,'add_tablet'),(46,'Can change Планшет',12,'change_tablet'),(47,'Can delete Планшет',12,'delete_tablet'),(48,'Can view Планшет',12,'view_tablet'),(49,'Can add Смартфон',13,'add_smartphones'),(50,'Can change Смартфон',13,'change_smartphones'),(51,'Can delete Смартфон',13,'delete_smartphones'),(52,'Can view Смартфон',13,'view_smartphones'),(53,'Can add Проектор',14,'add_projector'),(54,'Can change Проектор',14,'change_projector'),(55,'Can delete Проектор',14,'delete_projector'),(56,'Can view Проектор',14,'view_projector'),(57,'Can add Персональный компьютер',15,'add_pc'),(58,'Can change Персональный компьютер',15,'change_pc'),(59,'Can delete Персональный компьютер',15,'delete_pc'),(60,'Can view Персональный компьютер',15,'view_pc'),(61,'Can add заказ',16,'add_order'),(62,'Can change заказ',16,'change_order'),(63,'Can delete заказ',16,'delete_order'),(64,'Can view заказ',16,'view_order'),(65,'Can add Ноутбук',17,'add_laptops'),(66,'Can change Ноутбук',17,'change_laptops'),(67,'Can delete Ноутбук',17,'delete_laptops'),(68,'Can view Ноутбук',17,'view_laptops'),(69,'Can add продукт корзины',18,'add_cartproduct'),(70,'Can change продукт корзины',18,'change_cartproduct'),(71,'Can delete продукт корзины',18,'delete_cartproduct'),(72,'Can view продукт корзины',18,'view_cartproduct');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$PjW13a5EjEprdpsURC3C1l$GadOqhD0OO/Gy+q2ezs4yeLzzEivVgM8bXBAdFTe07s=','2021-05-06 13:28:34.000000',1,'alexey','alexey','','alexey@mail.ru',1,1,'2021-04-27 07:20:46.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-04-27 07:22:14.882122','1','Телефоны и гаджеты',1,'[{\"added\": {}}]',10,1),(2,'2021-04-27 07:24:46.366856','1','Смартфоны',1,'[{\"added\": {}}]',8,1),(3,'2021-04-27 07:31:37.384435','1','Смартфоны',2,'[]',8,1),(4,'2021-04-27 07:32:37.861553','1','Смартфоны',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(5,'2021-04-27 07:36:43.340536','2','Планшеты',1,'[{\"added\": {}}]',8,1),(6,'2021-04-27 07:37:34.897341','2','Ноутбуки и компьютеры',1,'[{\"added\": {}}]',10,1),(7,'2021-04-27 07:38:08.837924','3','Ноутбуки',1,'[{\"added\": {}}]',8,1),(8,'2021-04-27 07:57:36.880477','2','Ноутбуки и компьютеры',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',10,1),(9,'2021-04-27 07:57:50.014364','3','Ноутбуки',2,'[]',8,1),(10,'2021-04-27 07:57:53.883005','1','Смартфоны',2,'[]',8,1),(11,'2021-04-27 07:58:29.476631','4','Системные блоки',1,'[{\"added\": {}}]',8,1),(12,'2021-04-27 07:59:00.898437','3','tv_projector',1,'[{\"added\": {}}]',10,1),(13,'2021-04-27 07:59:22.449859','5','Телевизоры',1,'[{\"added\": {}}]',8,1),(14,'2021-04-27 07:59:46.463508','3','Телевизоры и проекторы',2,'[{\"changed\": {\"fields\": [\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\"]}}]',10,1),(15,'2021-04-27 08:00:30.449692','6','Проекторы и экраны',1,'[{\"added\": {}}]',8,1),(16,'2021-04-27 20:00:51.564918','1','НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005)',1,'[{\"added\": {}}]',17,1),(17,'2021-04-27 20:19:34.131421','1','СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE',1,'[{\"added\": {}}]',13,1),(18,'2021-04-27 20:20:18.939682','1','Смартфоны',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(19,'2021-04-28 08:43:08.922005','2','НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005)',1,'[{\"added\": {}}]',17,1),(20,'2021-04-29 16:41:32.381711','1','Смартфоны',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(21,'2021-04-29 16:44:54.749094','1','СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\"]}}]',13,1),(22,'2021-04-30 16:25:08.300432','2','НОУТБУК ACER NITRO 5 AN515-44 R585SGN (NH.Q9HER.007)',2,'[{\"changed\": {\"fields\": [\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\", \"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\", \"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\", \"\\u0426\\u0435\\u043d\\u0430\", \"\\u041c\\u043e\\u0434\\u0435\\u043b\\u044c \\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u043e\\u0440\\u0430\", \"\\u0427\\u0438\\u0441\\u0442\\u043e\\u0442\\u0430 \\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u043e\\u0440\\u0430\", \"\\u041e\\u0431\\u044c\\u0435\\u043c \\u043e\\u043f\\u0435\\u0440\\u0430\\u0442\\u0438\\u0432\\u043d\\u043e\\u0439 \\u043f\\u0430\\u043c\\u044f\\u0442\\u0438\", \"\\u0427\\u0438\\u043f\\u0441\\u0435\\u0442 \\u0432\\u0438\\u0434\\u0435\\u043e\\u0430\\u0434\\u0430\\u043f\\u0442\\u0435\\u0440\\u0430\", \"\\u041e\\u0431\\u044c\\u0435\\u043c \\u0432\\u0438\\u0434\\u0435\\u043e\\u0430\\u0434\\u0430\\u043f\\u0442\\u0435\\u0440\\u0430\", \"\\u041e\\u0441\\u043e\\u0431\\u0435\\u043d\\u043e\\u0441\\u0442\\u0438\"]}}]',17,1),(23,'2021-05-01 06:15:37.340852','1','НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005)',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\"]}}]',17,1),(24,'2021-05-01 09:58:26.056433','1','СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\"]}}]',13,1),(25,'2021-05-01 13:30:46.324575','1','СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\", \"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\", \"\\u0426\\u0435\\u043d\\u0430\", \"\\u0414\\u0438\\u0430\\u0433\\u043e\\u043d\\u0430\\u043b\\u044c \\u0434\\u0438\\u0441\\u043f\\u043b\\u0435\\u044f \", \"\\u0420\\u0430\\u0437\\u0440\\u0435\\u0448\\u0435\\u043d\\u0438\\u0435 \\u044d\\u043a\\u0440\\u0430\\u043d\\u0430\", \"\\u041e\\u0431\\u044c\\u0435\\u043c \\u0432\\u0441\\u0442\\u0440\\u043e\\u0435\\u043d\\u043d\\u043e\\u0439  \\u043f\\u0430\\u043d\\u044f\\u0442\\u0438\", \"\\u041e\\u0441\\u043d\\u043e\\u0432\\u043d\\u0430\\u044f \\u043a\\u0430\\u043c\\u0435\\u0440\\u0430\", \"\\u041e\\u0441\\u043e\\u0431\\u0435\\u043d\\u043e\\u0441\\u0442\\u0438\"]}}]',13,1),(26,'2021-05-01 15:04:31.064730','1','OLED ТЕЛЕВИЗОР LG OLED65GXRLA',1,'[{\"added\": {}}]',11,1),(27,'2021-05-03 15:36:02.964784','1','НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005)',2,'[{\"changed\": {\"fields\": [\"\\u0426\\u0435\\u043d\\u0430\"]}}]',17,1),(28,'2021-05-03 15:46:21.590899','3','УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER',1,'[{\"added\": {}}]',17,1),(29,'2021-05-03 15:58:08.681003','2','СМАРТФОН ОРРО RENO5 LITE FANTASTIC PURPLE',1,'[{\"added\": {}}]',13,1),(30,'2021-05-03 16:01:44.534742','3','СМАРТФОН XIAOMI REDMI 9A 2/32GB SKY BLUE',1,'[{\"added\": {}}]',13,1),(31,'2021-05-03 16:34:50.872036','2','LED ТЕЛЕВИЗОР SAMSUNG UE43T5300AUXCE',1,'[{\"added\": {}}]',11,1),(32,'2021-05-03 16:38:57.549112','1','ПРОЕКТОР BYINTEK BL110',1,'[{\"added\": {}}]',14,1),(33,'2021-05-03 16:48:14.864020','1','КОМПЬЮТЕР ACER NITRO N50-600, I7161TGN, DG.E1ZMC.007',1,'[{\"added\": {}}]',15,1),(34,'2021-05-03 16:52:56.766623','1','ПЛАНШЕТ SAMSUNG GALAXY TAB A 10.1″ 32GB (SM-T515) GOLD',1,'[{\"added\": {}}]',12,1),(35,'2021-05-03 16:59:06.892790','2','ПЛАНШЕТ HUAWEI MEDIAPAD T3 10″ 16GB (AGS-L09) GRAY',1,'[{\"added\": {}}]',12,1),(36,'2021-05-05 09:34:15.435338','3','УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER',2,'[{\"changed\": {\"fields\": [\"Slug\", \"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\"]}}]',17,1),(37,'2021-05-05 17:32:39.361687','3','УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\"]}}]',17,1),(38,'2021-05-06 13:29:14.159968','2','НОУТБУК ACER NITRO 5 AN515-44 R585SGN (NH.Q9HER.007)',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\"]}}]',17,1),(39,'2021-05-09 08:38:54.238849','1','Покупатель  ',1,'[{\"added\": {}}]',9,1),(40,'2021-05-09 08:38:57.388933','1','Покупатель  ',2,'[]',9,1),(41,'2021-05-09 08:40:06.802205','1','Корзина №1',1,'[{\"added\": {}}]',7,1),(42,'2021-05-09 11:20:41.789186','14','Продукт НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005) из корзины 1',1,'[{\"added\": {}}]',18,1),(43,'2021-05-09 11:21:19.821914','1','Корзина №1',2,'[{\"changed\": {\"fields\": [\"In order\"]}}]',7,1),(44,'2021-05-09 11:21:27.663758','1','Корзина №1',2,'[{\"changed\": {\"fields\": [\"In order\"]}}]',7,1),(45,'2021-05-09 11:33:33.678260','1','Корзина №1',2,'[{\"changed\": {\"fields\": [\"In order\", \"\\u0421\\u0434\\u0435\\u043b\\u0430\\u0442\\u044c \\u0437\\u0430\\u043a\\u0430\\u0437 \\u0430\\u043d\\u043e\\u043d\\u0438\\u043c\\u043d\\u043e\"]}}]',7,1),(46,'2021-05-09 11:33:49.483690','1','Корзина №1',2,'[{\"changed\": {\"fields\": [\"Total products\", \"In order\", \"\\u0421\\u0434\\u0435\\u043b\\u0430\\u0442\\u044c \\u0437\\u0430\\u043a\\u0430\\u0437 \\u0430\\u043d\\u043e\\u043d\\u0438\\u043c\\u043d\\u043e\"]}}]',7,1),(47,'2021-05-09 11:43:38.963937','2','Корзина №2',1,'[{\"added\": {}}]',7,1),(48,'2021-05-09 11:44:00.315072','2','Корзина №2',3,'',7,1),(49,'2021-05-09 11:54:04.418908','14','Продукт НОУТБУК ACER NITRO 5 AN515-44 R585SGN (NH.Q9HER.007) из корзины 1',2,'[{\"changed\": {\"fields\": [\"Object id\"]}}]',18,1),(50,'2021-05-09 11:54:32.374899','1','Корзина №1',2,'[{\"changed\": {\"fields\": [\"\\u0421\\u0434\\u0435\\u043b\\u0430\\u0442\\u044c \\u0437\\u0430\\u043a\\u0430\\u0437 \\u0430\\u043d\\u043e\\u043d\\u0438\\u043c\\u043d\\u043e\"]}}]',7,1),(51,'2021-05-09 12:21:15.165471','1','Корзина №1',3,'',7,1),(52,'2021-05-09 12:23:22.160888','3','Корзина №3',1,'[{\"added\": {}}]',7,1),(53,'2021-05-09 12:23:25.504138','15','Продукт УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER из корзины 3',1,'[{\"added\": {}}]',18,1),(54,'2021-05-09 12:51:55.365790','2','Elena',1,'[{\"added\": {}}]',4,1),(55,'2021-05-09 12:52:30.541553','2','Elena',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(56,'2021-05-09 12:53:19.002818','2','Покупатель Елена Мустафина',1,'[{\"added\": {}}]',9,1),(57,'2021-05-09 12:53:55.896896','16','Продукт УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER из корзины 3',1,'[{\"added\": {}}]',18,1),(58,'2021-05-09 12:54:31.473736','4','Корзина №4',1,'[{\"added\": {}}]',7,1),(59,'2021-05-09 12:55:08.051617','1','alexey',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',4,1),(60,'2021-05-09 12:55:46.198834','3','Корзина №3',2,'[{\"changed\": {\"fields\": [\"In order\"]}}]',7,1),(61,'2021-05-09 12:55:55.917817','3','Корзина №3',2,'[{\"changed\": {\"fields\": [\"Total products\", \"In order\"]}}]',7,1),(62,'2021-05-09 13:00:16.784475','4','4',3,'',7,1),(63,'2021-05-09 13:33:52.400764','3','3',2,'[{\"changed\": {\"fields\": [\"In order\"]}}]',7,1),(64,'2021-05-09 13:34:06.947817','3','3',2,'[{\"changed\": {\"fields\": [\"In order\"]}}]',7,1),(65,'2021-05-09 13:34:23.468710','15','Продукт УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER из корзины 3',3,'',18,1),(66,'2021-05-09 13:34:44.963243','16','Продукт УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER из корзины 3',2,'[{\"changed\": {\"fields\": [\"\\u041f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u044c\"]}}]',18,1),(67,'2021-05-09 13:35:14.267072','16','Продукт УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER из корзины 3',2,'[]',18,1),(68,'2021-05-09 13:35:52.359828','16','Продукт СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE из корзины 3',2,'[{\"changed\": {\"fields\": [\"Content type\", \"Object id\"]}}]',18,1),(69,'2021-05-09 13:36:11.371860','16','Продукт КОМПЬЮТЕР ACER NITRO N50-600, I7161TGN, DG.E1ZMC.007 из корзины 3',2,'[{\"changed\": {\"fields\": [\"Content type\"]}}]',18,1),(70,'2021-05-09 13:36:24.977974','16','Продукт НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005) из корзины 3',2,'[{\"changed\": {\"fields\": [\"Content type\"]}}]',18,1),(71,'2021-05-09 13:36:58.741881','1','Заказ №1',1,'[{\"added\": {}}]',16,1),(72,'2021-05-09 13:37:07.709613','1','Заказ №1',3,'',16,1),(73,'2021-05-09 15:53:21.475942','17','Продукт СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE из корзины 3',1,'[{\"added\": {}}]',18,1),(74,'2021-05-09 17:08:34.676181','3','3',2,'[]',7,1),(75,'2021-05-09 17:09:15.189019','3','3',2,'[{\"changed\": {\"fields\": [\"In order\"]}}]',7,1),(76,'2021-05-09 17:09:33.180226','3','3',2,'[{\"changed\": {\"fields\": [\"In order\"]}}]',7,1),(77,'2021-05-09 17:11:50.258200','5','5',1,'[{\"added\": {}}]',7,1),(78,'2021-05-09 17:11:53.163057','17','Продукт: СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE (для корзины)',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430\"]}}]',18,1),(79,'2021-05-09 17:12:07.476861','3','3',3,'',7,1),(80,'2021-05-09 17:12:32.082996','18','Продукт: НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005) (для корзины)',1,'[{\"added\": {}}]',18,1),(81,'2021-05-09 17:12:36.072175','5','5',2,'[]',7,1),(82,'2021-05-09 17:13:08.444439','2','Заказ №2',1,'[{\"added\": {}}]',16,1),(83,'2021-05-09 17:13:12.219718','1','Покупатель alexey ',2,'[{\"changed\": {\"fields\": [\"\\u0417\\u0430\\u043a\\u0430\\u0437\\u044b \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u044f\"]}}]',9,1),(84,'2021-05-09 17:13:13.977199','5','5',2,'[]',7,1),(85,'2021-05-09 17:13:27.922929','2','Заказ №2',2,'[{\"changed\": {\"fields\": [\"\\u0421\\u0442\\u0430\\u0442\\u0443\\u0441 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430\"]}}]',16,1),(86,'2021-05-09 17:13:38.296303','5','5',2,'[]',7,1),(87,'2021-05-09 17:13:51.478798','6','6',1,'[{\"added\": {}}]',7,1),(88,'2021-05-09 17:14:04.420252','5','5',3,'',7,1),(89,'2021-05-09 17:14:32.729659','20','Продукт: НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005) (для корзины)',1,'[{\"added\": {}}]',18,1),(90,'2021-05-09 17:14:35.837851','6','6',2,'[{\"changed\": {\"fields\": [\"Products\"]}}]',7,1),(91,'2021-05-09 17:15:23.888724','21','Продукт: СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE (для корзины)',1,'[{\"added\": {}}]',18,1),(92,'2021-05-09 17:15:25.706628','6','6',2,'[{\"changed\": {\"fields\": [\"Products\"]}}]',7,1),(93,'2021-05-11 08:54:00.521906','29','Продукт: LED ТЕЛЕВИЗОР SAMSUNG UE43T5300AUXCE (для корзины)',3,'',18,1),(94,'2021-05-11 08:54:00.528226','28','Продукт: КОМПЬЮТЕР ACER NITRO N50-600, I7161TGN, DG.E1ZMC.007 (для корзины)',3,'',18,1),(95,'2021-05-11 08:54:00.532862','27','Продукт: СМАРТФОН ОРРО RENO5 LITE FANTASTIC PURPLE (для корзины)',3,'',18,1),(96,'2021-05-11 08:54:00.539005','26','Продукт: СМАРТФОН ОРРО RENO5 LITE FANTASTIC PURPLE (для корзины)',3,'',18,1),(97,'2021-05-11 08:54:00.541857','25','Продукт: КОМПЬЮТЕР ACER NITRO N50-600, I7161TGN, DG.E1ZMC.007 (для корзины)',3,'',18,1),(98,'2021-05-11 08:54:00.548153','24','Продукт: OLED ТЕЛЕВИЗОР LG OLED65GXRLA (для корзины)',3,'',18,1),(99,'2021-05-11 08:54:00.554956','23','Продукт: СМАРТФОН XIAOMI REDMI 9A 2/32GB SKY BLUE (для корзины)',3,'',18,1),(100,'2021-05-11 08:54:00.566878','22','Продукт: УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER (для корзины)',3,'',18,1),(101,'2021-05-11 08:54:00.576246','21','Продукт: СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE (для корзины)',3,'',18,1),(102,'2021-05-11 08:54:00.582399','20','Продукт: НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005) (для корзины)',3,'',18,1),(103,'2021-05-11 09:07:39.117671','31','Продукт: НОУТБУК ACER NITRO 5 AN515-44 R585SGN (NH.Q9HER.007) (для корзины)',3,'',18,1),(104,'2021-05-11 09:07:39.130719','30','Продукт: УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER (для корзины)',3,'',18,1),(105,'2021-05-11 09:09:18.411278','32','Продукт: НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005) (для корзины)',3,'',18,1),(106,'2021-05-11 12:13:00.134534','35','Продукт: СМАРТФОН ОРРО RENO5 LITE FANTASTIC PURPLE (для корзины)',3,'',18,1),(107,'2021-05-11 12:13:00.147709','34','Продукт: СМАРТФОН XIAOMI REDMI 9A 2/32GB SKY BLUE (для корзины)',3,'',18,1),(108,'2021-05-11 12:13:00.164958','33','Продукт: НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005) (для корзины)',3,'',18,1),(109,'2021-05-11 17:34:20.888100','1','СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\", \"\\u0426\\u0435\\u043d\\u0430\"]}}]',13,1),(110,'2021-05-11 17:41:34.775586','38','Продукт: LED ТЕЛЕВИЗОР SAMSUNG UE43T5300AUXCE (для корзины)',3,'',18,1),(111,'2021-05-11 17:41:34.781272','37','Продукт: СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE (для корзины)',3,'',18,1),(112,'2021-05-11 17:41:34.784611','36','Продукт: НОУТБУК ACER NITRO 5 AN515-44 R585SGN (NH.Q9HER.007) (для корзины)',3,'',18,1),(113,'2021-05-11 17:47:03.808934','39','Продукт: СМАРТФОН XIAOMI REDMI 9A 2/32GB SKY BLUE (для корзины)',3,'',18,1),(114,'2021-05-11 17:48:39.144183','6','6',2,'[{\"changed\": {\"fields\": [\"Total products\", \"\\u0426\\u0435\\u043d\\u0430\"]}}]',7,1),(115,'2021-05-11 17:49:35.009649','6','6',2,'[{\"changed\": {\"fields\": [\"\\u0426\\u0435\\u043d\\u0430\"]}}]',7,1),(116,'2021-05-11 17:50:06.508417','6','6',2,'[{\"changed\": {\"fields\": [\"Total products\"]}}]',7,1),(117,'2021-05-11 18:17:23.325340','41','Продукт: LED ТЕЛЕВИЗОР SAMSUNG UE43T5300AUXCE (для корзины)',3,'',18,1),(118,'2021-05-11 18:17:23.337428','40','Продукт: УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER (для корзины)',3,'',18,1),(119,'2021-05-11 18:17:39.693040','6','6',2,'[{\"changed\": {\"fields\": [\"Total products\", \"\\u0426\\u0435\\u043d\\u0430\"]}}]',7,1),(120,'2021-05-11 18:19:28.152739','1','СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\", \"\\u0426\\u0435\\u043d\\u0430\"]}}]',13,1),(121,'2021-05-11 18:19:58.637618','43','Продукт: НОУТБУК ACER NITRO 5 AN515-44 R585SGN (NH.Q9HER.007) (для корзины)',3,'',18,1),(122,'2021-05-11 18:19:58.647538','42','Продукт: СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE (для корзины)',3,'',18,1),(123,'2021-05-11 18:20:42.473855','44','Продукт: СМАРТФОН XIAOMI REDMI 9A 2/32GB SKY BLUE (для корзины)',3,'',18,1),(124,'2021-05-11 18:39:30.549737','46','Продукт: LED ТЕЛЕВИЗОР SAMSUNG UE43T5300AUXCE (для корзины)',3,'',18,1),(125,'2021-05-11 18:39:30.561864','45','Продукт: УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER (для корзины)',3,'',18,1),(126,'2021-05-12 07:28:24.278350','53','Продукт: OLED ТЕЛЕВИЗОР LG OLED65GXRLA (для корзины)',3,'',18,1),(127,'2021-05-12 07:28:24.288641','52','Продукт: СМАРТФОН XIAOMI REDMI 9A 2/32GB SKY BLUE (для корзины)',3,'',18,1),(128,'2021-05-12 07:28:24.293154','51','Продукт: КОМПЬЮТЕР ACER NITRO N50-600, I7161TGN, DG.E1ZMC.007 (для корзины)',3,'',18,1),(129,'2021-05-12 07:28:24.297873','50','Продукт: УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER (для корзины)',3,'',18,1),(130,'2021-05-12 07:28:24.300361','49','Продукт: НОУТБУК ACER NITRO 5 AN515-44 R585SGN (NH.Q9HER.007) (для корзины)',3,'',18,1),(131,'2021-05-12 07:28:24.306486','48','Продукт: НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005) (для корзины)',3,'',18,1),(132,'2021-05-12 07:28:24.309324','47','Продукт: СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE (для корзины)',3,'',18,1),(133,'2021-05-12 07:29:42.538204','56','Продукт: СМАРТФОН XIAOMI REDMI 9A 2/32GB SKY BLUE (для корзины)',3,'',18,1),(134,'2021-05-12 07:37:38.506990','58','Продукт: СМАРТФОН XIAOMI REDMI 9A 2/32GB SKY BLUE (для корзины)',3,'',18,1),(135,'2021-05-12 07:37:38.520008','55','Продукт: НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005) (для корзины)',3,'',18,1),(136,'2021-05-12 07:37:57.860945','57','Продукт: КОМПЬЮТЕР ACER NITRO N50-600, I7161TGN, DG.E1ZMC.007 (для корзины)',3,'',18,1),(137,'2021-05-12 07:37:57.872056','54','Продукт: УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER (для корзины)',3,'',18,1),(138,'2021-05-12 17:47:14.500644','1','Заказ №1',3,'',16,1),(139,'2021-05-12 17:47:20.711765','6','6',3,'',7,1),(140,'2021-05-12 17:52:39.791966','7','7',1,'[{\"added\": {}}]',7,1),(141,'2021-05-12 17:52:54.089552','73','Продукт: НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005) (для корзины)',1,'[{\"added\": {}}]',18,1),(142,'2021-05-12 17:52:55.991255','7','7',2,'[{\"changed\": {\"fields\": [\"Products\"]}}]',7,1),(143,'2021-05-12 17:57:45.608525','2','Elena',3,'',4,1),(144,'2021-05-12 17:58:20.790315','8','8',3,'',7,1),(145,'2021-05-12 18:10:52.681461','9','9',3,'',7,1),(146,'2021-05-12 18:10:52.694684','7','7',3,'',7,1),(147,'2021-05-12 18:11:03.571086','10','10',1,'[{\"added\": {}}]',7,1),(148,'2021-05-12 18:11:16.524411','75','Продукт: НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005) (для корзины)',1,'[{\"added\": {}}]',18,1),(149,'2021-05-12 18:11:18.026169','10','10',2,'[{\"changed\": {\"fields\": [\"Products\"]}}]',7,1),(150,'2021-05-12 18:13:03.907379','10','10',3,'',7,1),(151,'2021-05-12 18:20:37.660248','11','11',3,'',7,1),(152,'2021-05-12 18:29:45.902869','12','12',3,'',7,1),(153,'2021-05-12 18:31:51.710683','14','14',3,'',7,1),(154,'2021-05-12 18:31:51.721036','13','13',3,'',7,1),(155,'2021-05-12 18:54:11.140370','15','15',2,'[{\"changed\": {\"fields\": [\"In order\"]}}]',7,1),(156,'2021-05-12 18:54:31.886506','15','15',3,'',7,1),(157,'2021-05-12 19:06:12.162587','16','16',3,'',7,1),(158,'2021-05-13 06:01:34.561964','20','20',3,'',7,1),(159,'2021-05-13 06:01:34.567729','19','19',3,'',7,1),(160,'2021-05-13 06:01:34.570720','18','18',3,'',7,1),(161,'2021-05-13 06:01:34.577584','17','17',3,'',7,1),(162,'2021-05-13 13:31:09.542052','24','24',3,'',7,1),(163,'2021-05-13 13:31:09.554128','23','23',3,'',7,1),(164,'2021-05-13 13:31:09.559149','22','22',3,'',7,1),(165,'2021-05-13 13:31:09.562224','21','21',3,'',7,1),(166,'2021-05-14 07:51:36.677599','27','27',3,'',7,1),(167,'2021-05-14 07:51:36.686748','26','26',3,'',7,1),(168,'2021-05-14 07:51:36.690119','25','25',3,'',7,1),(169,'2021-05-14 08:05:43.720825','2','НОУТБУК ACER NITRO 5 AN515-44 R585SGN (NH.Q9HER.007)',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\", \"\\u0426\\u0435\\u043d\\u0430\"]}}]',17,1),(170,'2021-05-14 08:06:51.870789','1','НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005)',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\", \"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\"]}}]',17,1),(171,'2021-05-14 08:29:27.201935','3','LED TV HAIER 50 SMART TV BX',1,'[{\"added\": {}}]',11,1),(172,'2021-05-14 08:42:02.500904','4','СМАРТФОН ОРРО RENO5 LITE FANTASTIC PURPLE',1,'[{\"added\": {}}]',13,1),(173,'2021-05-14 08:42:38.652084','2','СМАРТФОН ОРРО RENO5 LITE FANTASTIC PURPLE',3,'',13,1),(174,'2021-05-17 14:16:38.981556','28','28',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'shop','cart'),(18,'shop','cartproduct'),(8,'shop','category'),(9,'shop','customer'),(17,'shop','laptops'),(10,'shop','main_category'),(16,'shop','order'),(15,'shop','pc'),(14,'shop','projector'),(13,'shop','smartphones'),(12,'shop','tablet'),(11,'shop','tv');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-04-27 07:17:46.358449'),(2,'auth','0001_initial','2021-04-27 07:17:46.968007'),(3,'admin','0001_initial','2021-04-27 07:17:47.129882'),(4,'admin','0002_logentry_remove_auto_add','2021-04-27 07:17:47.148110'),(5,'admin','0003_logentry_add_action_flag_choices','2021-04-27 07:17:47.164879'),(6,'contenttypes','0002_remove_content_type_name','2021-04-27 07:17:47.310580'),(7,'auth','0002_alter_permission_name_max_length','2021-04-27 07:17:47.388153'),(8,'auth','0003_alter_user_email_max_length','2021-04-27 07:17:47.476653'),(9,'auth','0004_alter_user_username_opts','2021-04-27 07:17:47.492322'),(10,'auth','0005_alter_user_last_login_null','2021-04-27 07:17:47.562688'),(11,'auth','0006_require_contenttypes_0002','2021-04-27 07:17:47.582684'),(12,'auth','0007_alter_validators_add_error_messages','2021-04-27 07:17:47.603987'),(13,'auth','0008_alter_user_username_max_length','2021-04-27 07:17:47.680037'),(14,'auth','0009_alter_user_last_name_max_length','2021-04-27 07:17:47.756963'),(15,'auth','0010_alter_group_name_max_length','2021-04-27 07:17:47.827713'),(16,'auth','0011_update_proxy_permissions','2021-04-27 07:17:47.851200'),(17,'auth','0012_alter_user_first_name_max_length','2021-04-27 07:17:47.925882'),(18,'sessions','0001_initial','2021-04-27 07:17:47.976075'),(19,'shop','0001_initial','2021-04-27 07:17:49.625488');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jj2cmhcmq0a2vu0b0t73x1y5h2dr3pox','.eJxVjMsOwiAQRf-FtSG8woBL934DGYZBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pKuIstDj9bhnpwX0H5Y79Nkua-7pMWe6KPOiQ17nw83K4fwcNR_vWwNpbhmrQxWhjzFWVYjgSgQomOGKsoDyZQIRgtQUoJjrj2HqqnsX7A-VBN-0:1lee3O:k6nN1bsLVXKQ8sdfzwj3cPznZzB2ecG1bEWoZWNh0Ks','2021-05-20 13:28:34.422156'),('xajg48fq4oyiwc87yyfeamt4lnmzh0m8','.eJxVjMsOwiAQRf-FtSG8woBL934DGYZBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pKuIstDj9bhnpwX0H5Y79Nkua-7pMWe6KPOiQ17nw83K4fwcNR_vWwNpbhmrQxWhjzFWVYjgSgQomOGKsoDyZQIRgtQUoJjrj2HqqnsX7A-VBN-0:1lbI1o:TOaa-6STWqwuph9iYI6wkFu6Bku3PvuSJVDlBIu9KAQ','2021-05-11 07:21:04.720337');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cart`
--

DROP TABLE IF EXISTS `shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `total_products` int(10) unsigned NOT NULL,
  `in_order` tinyint(1) NOT NULL,
  `for_anonymoys_user` tinyint(1) NOT NULL,
  `final_price` decimal(9,2) NOT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_cart_owner_id_ba905fb5_fk_shop_customer_id` (`owner_id`),
  CONSTRAINT `shop_cart_owner_id_ba905fb5_fk_shop_customer_id` FOREIGN KEY (`owner_id`) REFERENCES `shop_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cart`
--

LOCK TABLES `shop_cart` WRITE;
/*!40000 ALTER TABLE `shop_cart` DISABLE KEYS */;
INSERT INTO `shop_cart` VALUES (29,1,1,0,329990.00,1),(30,0,0,0,0.00,1);
/*!40000 ALTER TABLE `shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cart_products`
--

DROP TABLE IF EXISTS `shop_cart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_cart_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cart_id` bigint(20) NOT NULL,
  `cartproduct_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_cart_products_cart_id_cartproduct_id_c0702b54_uniq` (`cart_id`,`cartproduct_id`),
  KEY `shop_cart_products_cartproduct_id_2475a580_fk_shop_cart` (`cartproduct_id`),
  CONSTRAINT `shop_cart_products_cart_id_71a1dc92_fk_shop_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `shop_cart` (`id`),
  CONSTRAINT `shop_cart_products_cartproduct_id_2475a580_fk_shop_cart` FOREIGN KEY (`cartproduct_id`) REFERENCES `shop_cartproduct` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cart_products`
--

LOCK TABLES `shop_cart_products` WRITE;
/*!40000 ALTER TABLE `shop_cart_products` DISABLE KEYS */;
INSERT INTO `shop_cart_products` VALUES (3,29,3);
/*!40000 ALTER TABLE `shop_cart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cartproduct`
--

DROP TABLE IF EXISTS `shop_cartproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_cartproduct` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `cart_fk_id` bigint(20) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_cartproduct_cart_fk_id_0e71a233_fk_shop_cart_id` (`cart_fk_id`),
  KEY `shop_cartproduct_content_type_id_6c843a1f_fk_django_co` (`content_type_id`),
  KEY `shop_cartproduct_user_id_f879de3b_fk_shop_customer_id` (`user_id`),
  CONSTRAINT `shop_cartproduct_cart_fk_id_0e71a233_fk_shop_cart_id` FOREIGN KEY (`cart_fk_id`) REFERENCES `shop_cart` (`id`),
  CONSTRAINT `shop_cartproduct_content_type_id_6c843a1f_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `shop_cartproduct_user_id_f879de3b_fk_shop_customer_id` FOREIGN KEY (`user_id`) REFERENCES `shop_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cartproduct`
--

LOCK TABLES `shop_cartproduct` WRITE;
/*!40000 ALTER TABLE `shop_cartproduct` DISABLE KEYS */;
INSERT INTO `shop_cartproduct` VALUES (3,2,1,329990.00,29,17,1);
/*!40000 ALTER TABLE `shop_cartproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_category_category_id_04f643b4_fk_shop_main_category_id` (`category_id`),
  CONSTRAINT `shop_category_category_id_04f643b4_fk_shop_main_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_main_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (1,'Смартфоны','smartphones',1),(2,'Планшеты','tables',1),(3,'Ноутбуки','laptops',2),(4,'Системные блоки','pc',2),(5,'Телевизоры','tv',3),(6,'Проекторы и экраны','projectors',3);
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_customer`
--

DROP TABLE IF EXISTS `shop_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_customer_user_id_7e6c4129_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_customer_user_id_7e6c4129_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_customer`
--

LOCK TABLES `shop_customer` WRITE;
/*!40000 ALTER TABLE `shop_customer` DISABLE KEYS */;
INSERT INTO `shop_customer` VALUES (1,'+7 (705)-705-79-02','Almaty',1);
/*!40000 ALTER TABLE `shop_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_customer_orders`
--

DROP TABLE IF EXISTS `shop_customer_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_customer_orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_customer_orders_customer_id_order_id_8dc36da9_uniq` (`customer_id`,`order_id`),
  KEY `shop_customer_orders_order_id_28160f75_fk_shop_order_id` (`order_id`),
  CONSTRAINT `shop_customer_orders_customer_id_d4b04032_fk_shop_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer` (`id`),
  CONSTRAINT `shop_customer_orders_order_id_28160f75_fk_shop_order_id` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_customer_orders`
--

LOCK TABLES `shop_customer_orders` WRITE;
/*!40000 ALTER TABLE `shop_customer_orders` DISABLE KEYS */;
INSERT INTO `shop_customer_orders` VALUES (2,1,2);
/*!40000 ALTER TABLE `shop_customer_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_laptops`
--

DROP TABLE IF EXISTS `shop_laptops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_laptops` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `title` varchar(250) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext,
  `price` decimal(9,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `diagonal` varchar(200) NOT NULL,
  `screen_resolution` varchar(200) NOT NULL,
  `videoadapter` varchar(200) NOT NULL,
  `system` varchar(200) NOT NULL,
  `cpu` varchar(200) NOT NULL,
  `frequency_cpu` varchar(200) NOT NULL,
  `ozu` decimal(5,0) NOT NULL,
  `disk_type` varchar(200) NOT NULL,
  `drive_volume` decimal(5,0) NOT NULL,
  `video_adapter_chipset` decimal(5,0) NOT NULL,
  `video_memory` decimal(5,1) NOT NULL,
  `features` varchar(200) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_laptops_category_id_6ca896a0_fk_shop_category_id` (`category_id`),
  CONSTRAINT `shop_laptops_category_id_6ca896a0_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_laptops`
--

LOCK TABLES `shop_laptops` WRITE;
/*!40000 ALTER TABLE `shop_laptops` DISABLE KEYS */;
INSERT INTO `shop_laptops` VALUES (1,'laptops','НОУТБУК ACER NITRO 5 AN515-55-50CH (NH.Q7MER.005)','media/img_0_62_1878_0_1_1.jpg','Nitro 5\r\nNitro 5 это мощный игровой ноутбук. Крепкий корпус, экран с быстрой частотой обновления и высокопроизводительные компоненты, оснащенные эффективной системой охлаждения обеспечат новые впечатления от игр.\r\n\r\nВсе необходимое для победы\r\nДоминируйте в играх благодаря сочетанию мощного процессора Intel®  или AMD Ryzen1 для мобильных устройств и видеокарты  AMD или NVIDIA®.',419990.00,12312,'15,6″ - 39,62 см','1920х1080 (FullHD)','nVidia GeForce GTX','DOS','Intel ® Core™ i5-10300H','2.5 ГГц',16,'SSD',512,1600,8.0,'Слот для замка Kensington. Цифровая клавиатура с подсветкой. Локализация клавиатуры: русский. TouchPad. Мультитач жест',3),(2,'laptop','НОУТБУК ACER NITRO 5 AN515-44 R585SGN (NH.Q9HER.007)','media/img_0_62_2021_3_6.png','Nitro 5 это мощный игровой ноутбук. Крепкий корпус, экран с быстрой частотой обновления и высокопроизводительные компоненты, оснащенные эффективной системой охлаждения обеспечат новые впечатления от игр.\r\n\r\nВсе необходимое для победы\r\nДоминируйте в играх благодаря сочетанию мощного процессора Intel®  или AMD Ryzen1 для мобильных устройств и видеокарты  AMD или NVIDIA®. \r\n\r\nМощной технике — мощное охлаждение\r\n2 вентилятора, технология Acer CoolBoost™ и 4 вентиляционных отверстия помогут быстро охладить устройство при интенсивной работе. CoolBoost™ повышает скорость вентилятора на 10% и улучшает охлаждение ЦП и видеокарты на 9% (сравнение с авторежимом). Используйте NitroSense, чтобы настроить температуру, скорость вентиляторов и другие параметры.',329990.00,12,'15,6″ - 39,62 см','1920х1080 (FullHD)','nVidia GeForce GTX','DOS','AMD® Ryzen ™ 5 4600H','3.0 ГГц',8,'SSD',512,1650,4.0,'kensington / noble замок',3),(3,'ACERS_WIFT','УЛЬТРАБУК ACER SWIFT 1 SF114-32-C6XS (NX.GXVER.001) SPARKLY SILVER','media/img_0_62_2171_4_6.png','Swift 1\r\n\r\n\r\nЭффективно работайте или наслаждайтесь отдыхом благодаря мощному процессору Intel®  и ярким цветам 13/14 дюймового дисплея с узкой рамкой. Тонкий корпус и длительная автономная работа в течение 10/16 часов2 — берите устройство с собой куда угодно.\r\n\r\nПрочный, легкий и тонкий\r\nБерите его с собой куда угодно и выражайте свой стиль с помощью подходящего цвета корпуса. Ноутбук будет с вами каждый день, ведь он весит всего 1,3 кг1, а его толщина составляет 14,95 мм.',171690.00,12,'13,3″ - 33,78 см','1280x720 (HD)','Intel HD Graphics','Windows 10 Home','Intel® Celeron® 1000M','1.10 ГГц',4,'SSD',128,500,512.0,'USB 2.0 (x1), USB 3.2 Gen 1 (3.1 Gen 1) Type-A (x2), USB 3.2 Gen 1 (3.1 Gen 1) Type-C(x1)',3);
/*!40000 ALTER TABLE `shop_laptops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_main_category`
--

DROP TABLE IF EXISTS `shop_main_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_main_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_main_category`
--

LOCK TABLES `shop_main_category` WRITE;
/*!40000 ALTER TABLE `shop_main_category` DISABLE KEYS */;
INSERT INTO `shop_main_category` VALUES (1,'Телефоны и гаджеты','Phones_gadgets'),(2,'Ноутбуки и компьютеры','laptopspc'),(3,'Телевизоры и проекторы','tv_projector');
/*!40000 ALTER TABLE `shop_main_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `coment` longtext NOT NULL,
  `status` varchar(150) NOT NULL,
  `buying_type` varchar(100) NOT NULL,
  `creation_date` datetime(6) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_order_cart_id_5b16e4f1_fk_shop_cart_id` (`cart_id`),
  KEY `shop_order_customer_id_f638df20_fk_shop_customer_id` (`customer_id`),
  CONSTRAINT `shop_order_cart_id_5b16e4f1_fk_shop_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `shop_cart` (`id`),
  CONSTRAINT `shop_order_customer_id_f638df20_fk_shop_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` VALUES (2,'Алексей','Мустафин','+7 (705)-705-79-02','Б.Мамуш-улы 30','','new','delivery','2021-05-17 14:37:18.299604','2021-05-17 18:00:00.000000',29,1);
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_pc`
--

DROP TABLE IF EXISTS `shop_pc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_pc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `title` varchar(250) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext,
  `price` decimal(9,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `cpu` varchar(200) NOT NULL,
  `number_of_cores` decimal(3,0) NOT NULL,
  `frequency_cpu` varchar(200) NOT NULL,
  `ozu` decimal(5,0) NOT NULL,
  `drive_volume` decimal(5,0) NOT NULL,
  `system` varchar(200) NOT NULL,
  `video_adapter_chipset` decimal(5,0) NOT NULL,
  `videoadapter` varchar(200) NOT NULL,
  `video_memory` decimal(5,0) NOT NULL,
  `features` varchar(200) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_pc_category_id_b6688b42_fk_shop_category_id` (`category_id`),
  CONSTRAINT `shop_pc_category_id_b6688b42_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_pc`
--

LOCK TABLES `shop_pc` WRITE;
/*!40000 ALTER TABLE `shop_pc` DISABLE KEYS */;
INSERT INTO `shop_pc` VALUES (1,'ACERNITRON50-600','КОМПЬЮТЕР ACER NITRO N50-600, I7161TGN, DG.E1ZMC.007','media/img_0_66_265_1_1.jpg','Нитро 50\r\nНастольный компьютер Nitro 50 обеспечивает высокую производительность для игр без задержек и плавных задач с интенсивной графикой благодаря процессору Intel ® Core ™ i7 и GeForce ® RTX 1650 SUPER ™ во главе.\r\n\r\nСоздан, чтобы побеждать\r\nДинамичные контуры и горящие красные светодиоды создают настроение для интенсивного путешествия в мир игр. Мастерски созданное 18-литровое шасси аккуратно поместится на вашем столе или на полу, а система охлаждения FrostBlade ™ Cooling максимально поддерживает высокие температуры и рамки.',519990.00,13,'Intel® Core™  i7-10700',8,'3.0 ГГц',16,2256,'Linux',1650,'GeForce GTX',6,'Максимальная мощность источника питания 500 Вт',4);
/*!40000 ALTER TABLE `shop_pc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_projector`
--

DROP TABLE IF EXISTS `shop_projector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_projector` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `title` varchar(250) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext,
  `price` decimal(9,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `screen_resolution` varchar(200) NOT NULL,
  `max_screen_resolution` varchar(200) NOT NULL,
  `three_d` tinyint(1) NOT NULL,
  `Max_projection_distance` decimal(3,0) NOT NULL,
  `min_projection_distance` decimal(3,0) NOT NULL,
  `features` varchar(200) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_projector_category_id_85abbe88_fk_shop_category_id` (`category_id`),
  CONSTRAINT `shop_projector_category_id_85abbe88_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_projector`
--

LOCK TABLES `shop_projector` WRITE;
/*!40000 ALTER TABLE `shop_projector` DISABLE KEYS */;
INSERT INTO `shop_projector` VALUES (1,'BYINTEKBL110','ПРОЕКТОР BYINTEK BL110','media/img_0_1318_16_0_1.jpg','Одно из самых бюджетных решений\r\nХорошие показатели срока службы LED лампы, яркое изображение, встроенная акустика, широкая совместимость с устройствами, в нем есть все что необходимо как для работы, так и для мультимедийных развлечений.',99990.00,9,'800x600','800x600',0,4,2,'HDMI х 2, VGA (D-sub), компонентный (Y/Pb/Pr), композитный AV (RCA), mini Jack 3.5 мм',6);
/*!40000 ALTER TABLE `shop_projector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_smartphones`
--

DROP TABLE IF EXISTS `shop_smartphones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_smartphones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `title` varchar(250) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext,
  `price` decimal(9,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `diagonal` varchar(200) NOT NULL,
  `screen_resolution` varchar(200) NOT NULL,
  `system` varchar(200) NOT NULL,
  `sim_quantity` decimal(2,0) NOT NULL,
  `memory_size` decimal(4,0) NOT NULL,
  `main_camera` varchar(200) NOT NULL,
  `front_camera` varchar(200) NOT NULL,
  `features` varchar(200) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_smartphones_category_id_b189d4ed_fk_shop_category_id` (`category_id`),
  CONSTRAINT `shop_smartphones_category_id_b189d4ed_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_smartphones`
--

LOCK TABLES `shop_smartphones` WRITE;
/*!40000 ALTER TABLE `shop_smartphones` DISABLE KEYS */;
INSERT INTO `shop_smartphones` VALUES (1,'smartphones','СМАРТФОН APPLE IPHONE 12 MINI 64GB BLUE','media/img_0_77_2609_0_1_kB1N54o.jpg','Самый мощный компактный iPhone.\r\n\r\nМощные функции в небольшом корпусе с диагональю 5,4 дюйма.\r\n\r\nВеликолепный дисплей Super Retina XDR\r\nПередняя панель Ceramic Shield, с которой риск повреждений дисплея при падении в 4 раза ниже.\r\n\r\nСъёмка, монтаж и воспроизведение видео кинематографического качества в стандарте Dolby Vision.\r\nПотрясающее качество снимков при слабом освещении благодаря Ночному режиму на всех камерах.',399890.00,123,'5,4″ - 13,7 см','2340x1080','iOS 14',1,64,'12 Mpx + 12 Mpx','12 Mpx','Вспышка экрана, Двойная камера, Поддержка 4G, Поддержка 5G, Пыле/-влагозащита, Распознавание лица, NFC',1),(3,'XIAOMiREDMI9A','СМАРТФОН XIAOMI REDMI 9A 2/32GB SKY BLUE','media/img_0_77_2504_1_6.png','Большой дисплей 6,53\" HD\r\nЯркий и красочный HD дисплей Xiaomi Redmi 9A позволит вам полностью погрузиться в мир по ту сторону экрана. Неважно смотрите вы любимый фильм или играете в онлайн игры картинка будет живой и детализированной.\r\n\r\nЗабота о вашем зрении\r\nXiaomi Redmi 9A имеет сертификат, подтверждающий проверки на излучение синего света. Смартфон излучает комфортный глазам свет, не напрягает их даже после долгого просмотра.\r\n\r\nДлительное время автономной работы\r\nТесты аккумулятора Xiaomi Redmi 9A показали, что батарея имеет до 1000 циклов зарядки. При ежедневной подзарядке вы сможете использовать устройство в течение 2,5 лет без какой-либо деградации батареи. Но смартфон прослужит вам намного дольше, ведь вам не нужно заряжать его каждый день. Даже при активном использовании смартфона батареи в 5000 мАч хватит на несколько дней.\r\n\r\nСрок службы батареи Xiaomi Redmi 9A увеличился на 25% по сравнению с обычными смартфонами',48990.00,14,'6,53″ - 16,59 см','1600x720','Android 10',2,32,'13 Mpx','5 Mpx','Акселерометр, Датчик приближения, Датчик освещения, Компас, Быстрая зарядка',1),(4,'RENO5LITE','СМАРТФОН ОРРО RENO5 LITE FANTASTIC PURPLE','media/img_0_77_2927_4_6.png','OPPO Reno5 Lite\r\nСоздай Свою Историю\r\n\r\nЧетыре AI Камеры 48MP\r\nСнимайте жизнь на своих условиях\r\nКамера Reno5 Lite с четырьмя объективами и искусственным интеллектом идеально подходит для съемки всех моментов жизни. Reno5 Lite отображает жизненный путь в ярких и кристально чистых деталях - от макросъемки до сверхширокоугольных и зум-снимков.\r\n\r\nAI Color Portrait Video\r\nОказывайтесь в центре внимания\r\nAI Color Portrait Video подчеркивает естественные цвета вашего объекта, делая фон черно-белым, создавая потрясающие снимки, которые позволят любому быть в центре внимания.',152990.00,52,'6,4″ - 16,3 см','2400x1080','Android 11',2,128,'48 Mpx + 8 Mpx + 2 Mpx + 2 Mpx','16 Mpx','Память 8GB/128GB; основная камера 48M+8M+2M+2M; фронтальная камера 16М; быстрая зарядка 30W; ультратонкий дизайн 7.8мм',1);
/*!40000 ALTER TABLE `shop_smartphones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_tablet`
--

DROP TABLE IF EXISTS `shop_tablet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_tablet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `title` varchar(250) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext,
  `price` decimal(9,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `diagonal` varchar(200) NOT NULL,
  `screen_resolution` varchar(200) NOT NULL,
  `system` varchar(200) NOT NULL,
  `memory_size` decimal(4,0) NOT NULL,
  `main_camera` varchar(200) NOT NULL,
  `front_camera` varchar(200) NOT NULL,
  `features` varchar(200) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_tablet_category_id_1bcb364a_fk_shop_category_id` (`category_id`),
  CONSTRAINT `shop_tablet_category_id_1bcb364a_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_tablet`
--

LOCK TABLES `shop_tablet` WRITE;
/*!40000 ALTER TABLE `shop_tablet` DISABLE KEYS */;
INSERT INTO `shop_tablet` VALUES (1,'SAMSUNGGALAXYTABA10','ПЛАНШЕТ SAMSUNG GALAXY TAB A 10.1″ 32GB (SM-T515) GOLD','media/img_0_64_473_0.png','Новое поколение развлечений в планшетах\r\nМы создали универсальный и функциональный планшет, доступный для каждого. С Galaxy Tab A10.1 (2019) вы получите опыт использования устройства премиального уровня по демократичной цене.',89890.00,6,'10,1\" - 25,65 см','1920х1200','Android',32,'8 Mpx','5 Mpx','Емкость аккумулятора 	6150 мАч,Wi-Fi Есть (встроенный), 3G Да, 4G Да, Bluetooth 5.0 GPS Да',2),(2,'HUAWEIMEDIAPADT3','ПЛАНШЕТ HUAWEI MEDIAPAD T3 10″ 16GB (AGS-L09) GRAY','media/img_0_64_388_0.jpg','Элегантный дизайн, яркие цвета\r\nОткройте мир красоты и совершенства с HUAWEI MediaPad T3 10! Оцените богатство цветовой палитры и великолепное качество стильного планшета с корпусом из анодированного алюминия и экраном 9,6 дюймов.\r\n\r\nЧеткое изображение\r\nВсегда четкое изображение при любых условиях освещения. Специальный режим снижения яркости и защиты зрения позволяет использовать HUAWEI MediaPad T3 10 в темное время суток, не давая вашим глазам устать.\r\n\r\nНадежный помощник\r\nHUAWEI MediaPad T3 10 — ваш надежный помощник ночью и днем, он всегда под рукой. Высокоемкая батарея обеспечивает удивительно длительное время работы планшета без подзарядки. Устройство вас никогда не подведет!',69890.00,4,'9,6″ - 24,3 см','1280x800 (Wide XGA)','Android 7.0 Nougat',16,'5 Mpx','2 Mpx','micro-USB, выход аудио/наушники 3.5 мм',2);
/*!40000 ALTER TABLE `shop_tablet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_tv`
--

DROP TABLE IF EXISTS `shop_tv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_tv` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `title` varchar(250) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext,
  `price` decimal(9,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `diagonal` varchar(200) NOT NULL,
  `screen_resolution` varchar(200) NOT NULL,
  `technology` varchar(250) NOT NULL,
  `features` varchar(200) NOT NULL,
  `smart_tv` tinyint(1) NOT NULL,
  `hdr` tinyint(1) NOT NULL,
  `wi_fi` tinyint(1) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_tv_category_id_c1aed16e_fk_shop_category_id` (`category_id`),
  CONSTRAINT `shop_tv_category_id_c1aed16e_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_tv`
--

LOCK TABLES `shop_tv` WRITE;
/*!40000 ALTER TABLE `shop_tv` DISABLE KEYS */;
INSERT INTO `shop_tv` VALUES (1,'oled_lg','OLED ТЕЛЕВИЗОР LG OLED65GXRLA','media/img_0_95_1806_2_1.jpg','Телевизор LG OLED 65’ 4K, ThinQ AI, WebOS 5.0, Dolby Atmos\r\nOLED65GXRLA\r\nOLED - технология самоподсвечивающихся пикселей\r\nA9 Gen3 AI Процессор 4K\r\nThinQ AI- управление домашними устройствами\r\nDolby Vision IQ & Dolby Atmos\r\nСовместимость с G-Sync, HDR, HDMI 2.1',1299990.00,12312,'65″ -165,1 см','3840x2160 (4K UHD)','OLED','OLED 4K, α9 gen3, ThinQ AI, Dolby Vision, Dolby Atmos, G-sync, AI picture Pro, AI sound Pro',1,1,1,5),(2,'SAMSUNGUE43T5300AUXCE','LED ТЕЛЕВИЗОР SAMSUNG UE43T5300AUXCE','media/img_0_95_1687_0.jpg','Смотрите, играйте, подключайтесь\r\n\r\nHDR: видеть больше деталей\r\nСмотрите HDR контент с улучшенной четкостью и точнейшей цветопередачей. Телевизор Samsung UHD обеспечивает более точную передачу деталей в самых ярких и темных сценах.\r\n\r\nТехнология Ultra Clean View\r\nТехнология Ultra Clean View анализирует исходный контент с помощью новейшего алгоритма и формирует более качественные изображения с минимальным искажением. Наслаждайтесь четкостью изображения.\r\n\r\nТехнология PurColour\r\nСмотрите любимые программы в естественных цветах, которые воспроизводят детали также четко, как в реальности. Получите более красочное впечатление от просмотра.',164990.00,16,'43″ - 109,2 см','1920х1080 (FullHD)','LED','Класс энергоэффективности A+. Мощность звука: 20 Вт',1,0,1,5),(3,'HAIER50','LED TV HAIER 50 SMART TV BX','media/img_0_95_1866_0_1.jpg','Android TV\r\nAndroid TV — это простой и элегантный интерфейс, игры и приложения из магазина Google Play, YouTube на большом экране, голосовой поиск и управление Google assistant, отображение экрана вашего смартфона на экране телевизора при помощи Chromecast, а также самые популярные фильмы, сериалы и телеканалы от OKKO, ivi, Megogo, Netflix.\r\n\r\nGoogle Ассистент\r\nGoogle Ассистент открывает широчайшие возможности по взаимодействию с вашим телевизором при помощи голоса. Найти фильм или сериал, узнать прогноз погоды, открыть настройки - просто сделайте голосовой запрос Google Ассистенту.\r\n\r\nТехнология Chromecast\r\nТехнология Chromecast позволяет выйти за рамки маленького экрана – теперь вы можете транслировать контент со смартфона, планшета или компьютера на телевизор, в любом приложении поддерживающем встроенную технологию Chromecast для платформы Android TV.',169990.00,14,'50″ - 127 см','3840x2160 (4K UHD)','LED','Операционная система Android TV, HDR10, 4K UHD upscaling, Bluetooth 5.0, голосовой помощник Google, WiFi 5 GHz. Для голосового управления необходимо приобрести отдельно пульт Remote Control HTR-U27E (',1,1,1,5);
/*!40000 ALTER TABLE `shop_tv` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-18 16:55:34
