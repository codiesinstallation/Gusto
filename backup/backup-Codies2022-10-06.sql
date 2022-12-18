-- MySQL dump 10.13  Distrib 5.7.39, for Win64 (x86_64)
--
-- Host: localhost    Database: Codies
-- ------------------------------------------------------
-- Server version	5.7.39-log

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
-- Current Database: `Codies`
--

/*!40000 DROP DATABASE IF EXISTS `Codies`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Codies` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `Codies`;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `leave_date` timestamp NULL DEFAULT NULL,
  `late_over` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid2s_idx` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES (11,5,'2022-10-02 22:17:10','2022-10-02 22:17:10',0,'2022-10-03 08:49:47',0.53333333333333),(12,1,'2022-10-02 22:17:10','2022-10-02 23:05:58',0,'2022-10-02 23:06:24',0.53333333333333),(13,7,'2022-10-03 16:38:46','2022-10-03 16:38:46',1,NULL,0);
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcodes`
--

DROP TABLE IF EXISTS `barcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `format` varchar(45) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `displayValue` tinyint(1) DEFAULT '0',
  `text` varchar(45) DEFAULT NULL,
  `fontOptions` varchar(45) DEFAULT NULL,
  `font` varchar(45) DEFAULT NULL,
  `textAlign` varchar(45) DEFAULT NULL,
  `textPosition` varchar(45) DEFAULT NULL,
  `textMargin` int(11) DEFAULT NULL,
  `fontSize` int(11) DEFAULT NULL,
  `background` varchar(45) DEFAULT NULL,
  `lineColor` varchar(45) DEFAULT NULL,
  `margin` int(11) DEFAULT NULL,
  `marginTop` int(11) DEFAULT NULL,
  `marginBottom` int(11) DEFAULT NULL,
  `marginLeft` int(11) DEFAULT NULL,
  `marginRight` int(11) DEFAULT NULL,
  `flat` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcodes`
--

LOCK TABLES `barcodes` WRITE;
/*!40000 ALTER TABLE `barcodes` DISABLE KEYS */;
INSERT INTO `barcodes` VALUES (1,'CODE128',4,100,1,'123456','normal','monospace','center','bottom',2,20,'#ffffff','#000000',9,NULL,NULL,NULL,NULL,0),(2,'CODE128',3,145,1,'55555','normal','monospace','center','bottom',-10,35,'#ffffff','#000000',9,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `barcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_types`
--

DROP TABLE IF EXISTS `bill_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_types` (
  `bill_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_no` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `type_count` double DEFAULT '0',
  `type_price` double DEFAULT '0',
  `type_total_price` double DEFAULT '0',
  `type_discount` double DEFAULT '0',
  `type_vat` double DEFAULT '0',
  `type_exp_date` date DEFAULT NULL,
  `sell_unit` int(11) DEFAULT NULL,
  `returned` tinyint(1) DEFAULT '0',
  `returned_qty` double DEFAULT '0',
  `type_cost` double DEFAULT '0',
  `type_note` varchar(555) DEFAULT NULL,
  `returned_total` double DEFAULT '0',
  `without_stock` tinyint(1) DEFAULT NULL,
  `calc_count` double DEFAULT NULL,
  `type_purchases_price` double DEFAULT NULL,
  `type_discount_percent` double DEFAULT '0',
  PRIMARY KEY (`bill_type_id`),
  KEY `bill_no_idx` (`bill_no`),
  KEY `bill_type_id_idx` (`type_id`),
  CONSTRAINT `bill_no` FOREIGN KEY (`bill_no`) REFERENCES `bills` (`bill_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bill_type_id` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=916 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_types`
--

LOCK TABLES `bill_types` WRITE;
/*!40000 ALTER TABLE `bill_types` DISABLE KEYS */;
INSERT INTO `bill_types` VALUES (899,1,103131,1,30,30,0,0,NULL,278,0,0,0,NULL,0,NULL,NULL,NULL,0),(900,2,103131,1,30,30,0,0,NULL,278,0,0,0,NULL,0,NULL,NULL,NULL,0),(901,3,103131,1,30,30,0,0,NULL,278,1,1,0,NULL,30,NULL,NULL,0,0),(902,4,103096,1,35,35,0,0,NULL,308,0,0,0,NULL,0,NULL,NULL,0,0),(903,4,103124,1,55,55,0,0,NULL,262,0,0,0,NULL,0,NULL,NULL,0,0),(904,4,103125,1,110,110,0,0,NULL,263,0,0,0,NULL,0,NULL,NULL,0,0),(905,5,103131,1,30,30,0,0,NULL,278,0,0,0,NULL,0,NULL,NULL,NULL,0),(906,6,103131,1,30,30,0,0,NULL,278,0,0,0,NULL,0,NULL,NULL,NULL,0),(907,7,103068,1,5,5,0,0,NULL,143,0,0,0,NULL,0,NULL,NULL,NULL,0),(908,7,103067,1,5,5,0,0,NULL,138,0,0,0,NULL,0,NULL,NULL,NULL,0),(909,8,103068,1,5,5,0,0,NULL,143,0,0,0,NULL,0,NULL,NULL,NULL,0),(910,8,103067,1,0,0,0,0,NULL,138,0,0,0,NULL,0,NULL,NULL,NULL,0),(911,9,103131,1,30,30,0,0,NULL,278,0,0,0,NULL,0,NULL,NULL,NULL,0),(912,9,103131,1,30,30,0,0,NULL,278,0,0,0,NULL,0,NULL,NULL,NULL,0),(913,9,103131,1,30,30,0,0,NULL,278,0,0,0,NULL,0,NULL,NULL,NULL,0),(914,9,103131,1,30,30,0,0,NULL,278,0,0,0,NULL,0,NULL,NULL,NULL,0),(915,10,103131,1,30,30,0,0,NULL,278,0,0,0,NULL,0,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `bill_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bills` (
  `bill_no` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) DEFAULT NULL,
  `cust_id` bigint(20) DEFAULT NULL,
  `bill_sum` double DEFAULT '0' COMMENT 'Tha actual sum for the bill',
  `bill_discount` double DEFAULT '0',
  `bill_total` double DEFAULT '0' COMMENT 'The summation after discount',
  `bill_date` datetime DEFAULT NULL,
  `bill_is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `bill_extra` double DEFAULT '0',
  `bill_remain_val` double DEFAULT NULL,
  `bill_paid_val` double DEFAULT NULL,
  `delete_date` date DEFAULT NULL,
  `bill_notes` text,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `bill_vat_val` double DEFAULT NULL,
  `bill_paid_type` tinyint(1) DEFAULT '1',
  `cust_balance_after` double DEFAULT NULL,
  `cust_balance_before` varchar(45) DEFAULT NULL,
  `mixins_store` int(11) DEFAULT NULL,
  `hold_bill` tinyint(1) DEFAULT '0',
  `total_returned` double DEFAULT '0',
  `all_returned_val` double DEFAULT '0',
  `bill_discount_percent` tinyint(1) DEFAULT NULL,
  `returned` tinyint(1) DEFAULT '0',
  `offer_discount` double DEFAULT '0',
  `return_sum` double DEFAULT '0',
  `return_vat` double DEFAULT '0',
  PRIMARY KEY (`bill_no`),
  KEY `bill_cust_idx` (`cust_id`),
  KEY `bill_user_idx` (`user_id`),
  KEY `bill_store_idx` (`mixins_store`),
  CONSTRAINT `bill_cust` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bill_store` FOREIGN KEY (`mixins_store`) REFERENCES `mixins_store` (`mixins_store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bill_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='The bill for customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,NULL,NULL,30,0,33,'2022-10-03 20:43:10',0,0,0,33,NULL,NULL,0,1,3,1,NULL,NULL,NULL,0,0,0,0,0,0,0,0),(2,NULL,NULL,30,0,33,'2022-10-03 20:43:21',0,0,0,33,NULL,NULL,0,1,3,1,NULL,NULL,NULL,0,0,0,0,0,0,0,0),(3,NULL,NULL,0,0,0,'2022-10-03 20:46:58',0,0,0,33,NULL,NULL,0,1,0,1,NULL,NULL,NULL,0,33,0,0,1,0,30,3),(4,NULL,NULL,200,0,220,'2022-10-04 00:27:39',0,0,0,220,NULL,NULL,0,1,20,1,NULL,NULL,NULL,0,0,0,0,0,0,0,0),(5,NULL,NULL,30,0,33,'2022-10-06 21:24:41',0,0,0,33,NULL,NULL,0,1,3,1,NULL,NULL,NULL,0,0,0,0,0,0,0,0),(6,NULL,NULL,30,50,16.5,'2022-10-06 21:25:20',0,0,0,16.5,NULL,NULL,0,1,1.5,1,NULL,NULL,NULL,0,0,0,1,0,0,0,0),(7,NULL,NULL,10,0,11,'2022-10-06 21:33:04',0,0,0,11,NULL,NULL,0,1,1,1,NULL,NULL,NULL,0,0,0,0,0,0,0,0),(8,NULL,NULL,5,0,5.5,'2022-10-06 21:41:05',0,0,0,5.5,NULL,NULL,0,1,0.5,1,NULL,NULL,NULL,0,0,0,0,0,0,0,0),(9,NULL,NULL,120,50,66,'2022-10-06 21:43:06',0,0,0,66,NULL,NULL,0,1,6,1,NULL,NULL,NULL,0,0,0,1,0,0,0,0),(10,NULL,2,30,50,16.5,'2022-10-06 21:46:10',0,0,6.5,10,NULL,NULL,0,1,1.5,3,NULL,NULL,NULL,0,0,0,1,0,0,0,0);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_ar` varchar(45) DEFAULT NULL,
  `currency_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'ريال','Riyal'),(2,'دينار','Dinar'),(3,'درهم','Derham'),(4,'جنية','Pound'),(5,'دولار','Dollar'),(6,'يورو','Euro'),(7,'فلس','Fels'),(8,'شيلينغ','Shilling'),(9,'هللة','Halala');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_pay`
--

DROP TABLE IF EXISTS `customer_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_pay` (
  `customer_cash_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `paid_value` double DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `cust_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pay_method` int(11) DEFAULT '0',
  `cust_after_after` double DEFAULT NULL,
  `cust_balance_before` double DEFAULT NULL,
  `is_pay` tinyint(1) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_cash_id`),
  KEY `for_cust_id_idx` (`cust_id`),
  KEY `for_user_id_idx` (`user_id`),
  CONSTRAINT `for_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `for_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_pay`
--

LOCK TABLES `customer_pay` WRITE;
/*!40000 ALTER TABLE `customer_pay` DISABLE KEYS */;
INSERT INTO `customer_pay` VALUES (176,3,'2022-09-27 19:09:55',2,1,1,0,0,1,'فاتورة رقم 319'),(177,33,'2022-10-02 00:00:05',3,1,1,0,0,1,'فاتورة رقم 371'),(178,10,'2022-10-06 21:46:10',2,1,1,6.5,0,1,'فاتورة رقم 10');
/*!40000 ALTER TABLE `customer_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `cust_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(50) DEFAULT NULL,
  `cust_mobile` varchar(25) DEFAULT NULL,
  `cust_address` varchar(50) DEFAULT NULL,
  `cust_balance` double DEFAULT NULL,
  `cust_discount_val` double DEFAULT '0',
  `cust_discount_percent` double DEFAULT '0',
  `active_customer` tinyint(1) DEFAULT '1',
  `pay_method` int(11) DEFAULT '0',
  `max_balance` double DEFAULT NULL,
  `cust_vat_num` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Customers for laundry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (2,'ادارة القرية','01007501440','قرية حورس السياحية',6.5,NULL,50,1,0,NULL,NULL),(3,'المستشار احمد على عابدين',NULL,NULL,0,NULL,NULL,1,0,NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `expense_title` varchar(255) DEFAULT NULL,
  `expense_cost` double DEFAULT NULL,
  `expense_icon` varchar(255) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expense_vat` double DEFAULT NULL,
  `paid_Type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exp_user_id_idx` (`user_id`),
  CONSTRAINT `exp_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,'qq',7,'backend/expense/product.png','2022-09-30',1,2,2);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gusto_stocks`
--

DROP TABLE IF EXISTS `gusto_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gusto_stocks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `stock` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gusto_stocks`
--

LOCK TABLES `gusto_stocks` WRITE;
/*!40000 ALTER TABLE `gusto_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `gusto_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gusto_type_stock`
--

DROP TABLE IF EXISTS `gusto_type_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gusto_type_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) DEFAULT NULL,
  `stock_id` bigint(20) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `mount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `for_type_id_idx` (`type_id`),
  KEY `for_stoc_id_idx` (`stock_id`),
  KEY `for_op_id_idx` (`unit_id`),
  CONSTRAINT `for_op_id` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `for_stoc_id` FOREIGN KEY (`stock_id`) REFERENCES `gusto_stocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `for_type_id` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gusto_type_stock`
--

LOCK TABLES `gusto_type_stock` WRITE;
/*!40000 ALTER TABLE `gusto_type_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `gusto_type_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaves` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `uid2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
INSERT INTO `leaves` VALUES (10,5,0,'2022-10-02 22:49:47','2022-10-02 22:49:47'),(11,1,0,'2022-10-02 23:06:24','2022-10-02 23:06:24');
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2022_06_27_143930_create_bill_types_table',0),(2,'2022_06_27_143930_create_bills_table',0),(3,'2022_06_27_143930_create_currencies_table',0),(4,'2022_06_27_143930_create_customer_pay_table',0),(5,'2022_06_27_143930_create_customers_table',0),(6,'2022_06_27_143930_create_expenses_table',0),(7,'2022_06_27_143930_create_gusto_stocks_table',0),(8,'2022_06_27_143930_create_gusto_type_stock_table',0),(9,'2022_06_27_143930_create_mixins_cash_table',0),(10,'2022_06_27_143930_create_mixins_info_table',0),(11,'2022_06_27_143930_create_mixins_item_request_table',0),(12,'2022_06_27_143930_create_mixins_main_types_table',0),(13,'2022_06_27_143930_create_mixins_purchase_bills_table',0),(14,'2022_06_27_143930_create_mixins_roles_table',0),(15,'2022_06_27_143930_create_mixins_store_table',0),(16,'2022_06_27_143930_create_mixins_suppliers_table',0),(17,'2022_06_27_143930_create_mixins_type_stock_table',0),(18,'2022_06_27_143930_create_offers_table',0),(19,'2022_06_27_143930_create_pay_methods_table',0),(20,'2022_06_27_143930_create_purchase_bill_types_table',0),(21,'2022_06_27_143930_create_return_types_table',0),(22,'2022_06_27_143930_create_returns_table',0),(23,'2022_06_27_143930_create_sales_type_table',0),(24,'2022_06_27_143930_create_shifts_table',0),(25,'2022_06_27_143930_create_table_types_table',0),(26,'2022_06_27_143930_create_tables_table',0),(27,'2022_06_27_143930_create_tables_bill_table',0),(28,'2022_06_27_143930_create_type_units_table',0),(29,'2022_06_27_143930_create_types_table',0),(30,'2022_06_27_143930_create_types_sold_without_balance_table',0),(31,'2022_06_27_143930_create_units_table',0),(32,'2022_06_27_143930_create_user_roles_table',0),(33,'2022_06_27_143930_create_users_table',0),(34,'2022_06_27_143931_add_foreign_keys_to_bill_types_table',0),(35,'2022_06_27_143931_add_foreign_keys_to_customer_pay_table',0),(36,'2022_06_27_143931_add_foreign_keys_to_gusto_type_stock_table',0),(37,'2022_06_27_143931_add_foreign_keys_to_mixins_cash_table',0),(38,'2022_06_27_143931_add_foreign_keys_to_return_types_table',0),(39,'2022_06_27_143931_add_foreign_keys_to_types_table',0);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixins_cash`
--

DROP TABLE IF EXISTS `mixins_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mixins_cash` (
  `cash_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `cash_sill_point` double DEFAULT NULL,
  `cash_drawer` double DEFAULT NULL,
  `cash_transfer` double DEFAULT NULL,
  `cash_remain` double DEFAULT NULL,
  `cash_later` double DEFAULT NULL,
  `cash_total` double DEFAULT NULL,
  `start_period` tinyint(1) DEFAULT NULL,
  `end_period` tinyint(1) DEFAULT NULL,
  `cash_end_date` datetime DEFAULT NULL,
  `cash_start_date` datetime DEFAULT NULL,
  `cash_current_user` int(11) DEFAULT NULL,
  `cash_recieve_user` int(11) DEFAULT NULL,
  `deficit_or_increase` double DEFAULT NULL,
  PRIMARY KEY (`cash_id`),
  KEY `curr_user_idx` (`cash_current_user`),
  KEY `re_user_idx` (`cash_recieve_user`),
  CONSTRAINT `curr_user` FOREIGN KEY (`cash_current_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `re_user` FOREIGN KEY (`cash_recieve_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_cash`
--

LOCK TABLES `mixins_cash` WRITE;
/*!40000 ALTER TABLE `mixins_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `mixins_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixins_info`
--

DROP TABLE IF EXISTS `mixins_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mixins_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mixins_name` text,
  `mixins_adress` text,
  `mixins_mobile` text,
  `mixins_vat_val` text,
  `mixins_price_include_vat` tinyint(1) DEFAULT '1',
  `mixins_note` text,
  `main_mixins_store` int(11) DEFAULT NULL,
  `closure_hour` varchar(45) DEFAULT NULL,
  `mixins_logo` varchar(60) DEFAULT NULL,
  `mixins_mac_serial` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `render_bills` tinyint(1) DEFAULT '0',
  `render_new_bill` tinyint(1) DEFAULT '0',
  `render_bill_reports` tinyint(1) DEFAULT '0',
  `render_purchase_bills` tinyint(1) DEFAULT '0',
  `render_purchase_bills_reports` tinyint(1) DEFAULT '0',
  `render_withdraw_cash` tinyint(1) DEFAULT '0',
  `render_cash` tinyint(1) DEFAULT '0',
  `end_support_date` date DEFAULT NULL,
  `mixins_font_size` int(11) DEFAULT '15',
  `mixins_font_color` varchar(45) DEFAULT '#FFF',
  `default_lang` varchar(45) DEFAULT 'ar',
  `bill_with_main_type` tinyint(1) DEFAULT '0',
  `mixins_theme` int(11) DEFAULT '1',
  `render_en_names` tinyint(1) DEFAULT '0',
  `bill_type` tinyint(1) DEFAULT '0',
  `item_request_qty` int(11) DEFAULT NULL,
  `mixins_main_payment_method` int(11) DEFAULT '1',
  `bill_column_num` int(11) DEFAULT '3',
  `render_bill_img` tinyint(1) DEFAULT '1',
  `main_type_column_num` int(11) DEFAULT '2',
  `use_type_uints` tinyint(1) DEFAULT '1',
  `render_bill_note` tinyint(1) DEFAULT NULL,
  `render_types_note` tinyint(1) DEFAULT NULL,
  `render_bill_footer_note` tinyint(1) DEFAULT NULL,
  `partition_folder` varchar(45) DEFAULT 'E',
  `contruct_no` varchar(255) DEFAULT NULL,
  `render_cash_point` tinyint(1) DEFAULT '1',
  `logo_width` int(11) DEFAULT '250',
  `logo_height` int(11) DEFAULT '250',
  `type_discount` int(11) DEFAULT '0',
  `bill_discount` int(11) DEFAULT '0',
  `show_reset_btn` tinyint(1) DEFAULT '0',
  `active_type_offer` tinyint(1) DEFAULT NULL,
  `offer_start_date` date DEFAULT NULL,
  `offer_end_date` date DEFAULT NULL,
  `offer_value` int(11) DEFAULT '0',
  `offer_percenet` int(11) DEFAULT '0',
  `active_offer` tinyint(1) DEFAULT '0',
  `fixed_vat` tinyint(1) DEFAULT NULL,
  `process_bills` tinyint(1) DEFAULT '1',
  `currency` int(11) DEFAULT NULL,
  `digit` varchar(45) DEFAULT '00',
  `mixins_name_en` text,
  `mixins_adress_en` text,
  `printer_type` tinyint(1) DEFAULT '1',
  `email_from` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `send_time` varchar(45) DEFAULT NULL,
  `reqeust_alert` tinyint(1) DEFAULT NULL,
  `weight_barcode` tinyint(1) DEFAULT NULL,
  `weight_barcode_count` varchar(45) DEFAULT NULL,
  `weight` tinyint(1) DEFAULT NULL,
  `codies_type` tinyint(1) DEFAULT '1',
  `country` tinyint(2) DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `curr_id_idx` (`currency`),
  KEY `pay_method_idx` (`mixins_main_payment_method`),
  KEY `pay_method_idsx` (`mixins_main_payment_method`),
  CONSTRAINT `curr_id` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pay_method` FOREIGN KEY (`mixins_main_payment_method`) REFERENCES `pay_methods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_info`
--

LOCK TABLES `mixins_info` WRITE;
/*!40000 ALTER TABLE `mixins_info` DISABLE KEYS */;
INSERT INTO `mixins_info` VALUES (1,'مطعم حورس','قرية حورس السياحية - طريق سنتريس القناطر الخيرية','01094956708','10',0,'الاسعار شاملة الضريبة والخدمة\nتشرفنا بزيارتكم \nقرية حورس السياحية',2,'19','backend/mixins/1664374638.jpeg','6479_A7FF_F000_4675',NULL,1,1,1,0,0,0,0,'2021-12-16',20,'white','ar',1,0,0,1,1,NULL,3,1,2,1,NULL,NULL,NULL,'E','455454545445',1,125,125,0,0,0,0,'2022-05-01','2022-10-22',0,50,1,1,1,4,'2',NULL,NULL,1,'chaircoder@gmail.com','m.abdalmoamen@gmail.com','00:35',0,0,'13',0,0,2);
/*!40000 ALTER TABLE `mixins_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixins_item_request`
--

DROP TABLE IF EXISTS `mixins_item_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mixins_item_request` (
  `mixins_item_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `add_to_request` tinyint(1) DEFAULT '1',
  `type_request` bigint(20) DEFAULT NULL,
  `added_request_date` date DEFAULT NULL,
  PRIMARY KEY (`mixins_item_request_id`),
  KEY `type_request_id_idx` (`type_request`),
  KEY `type_request_id_idxs` (`type_request`),
  KEY `type_request_id_id_idx` (`type_request`),
  KEY `type_request_id_idsx` (`type_request`),
  KEY `type_requests_id_idsx` (`type_request`),
  CONSTRAINT `type_request_ids` FOREIGN KEY (`type_request`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_item_request`
--

LOCK TABLES `mixins_item_request` WRITE;
/*!40000 ALTER TABLE `mixins_item_request` DISABLE KEYS */;
INSERT INTO `mixins_item_request` VALUES (1,1,103131,'2022-10-01'),(2,1,103067,'2022-10-01');
/*!40000 ALTER TABLE `mixins_item_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixins_main_types`
--

DROP TABLE IF EXISTS `mixins_main_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mixins_main_types` (
  `main_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `main_type_title_ar` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_type_title_en` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `printer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bill_type` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'kitchen',
  `number_of_copies` int(5) DEFAULT '1',
  PRIMARY KEY (`main_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_main_types`
--

LOCK TABLES `mixins_main_types` WRITE;
/*!40000 ALTER TABLE `mixins_main_types` DISABLE KEYS */;
INSERT INTO `mixins_main_types` VALUES (1,'شاورما',NULL,'Microsoft Print to PDF','kitchen',1),(2,'مشروبات ساخنة','Drinks','OneNote for Windows 10','kitchen',1),(4,'مشروبات باردة','Ice','طابعة البار','kitchen',1),(5,'عصائر',NULL,'طابعة البار','kitchen',1),(8,'كوفى',NULL,'طابعة البار','kitchen',1),(9,'ميلك شيك',NULL,'طابعة البار','kitchen',1),(10,'سموزى',NULL,'طابعة البار','kitchen',1),(11,'فواكة',NULL,'طابعة البار','kitchen',1),(12,'ايس كريم',NULL,'طابعة البار','kitchen',1),(13,'سندوتشات',NULL,'طابعة مطبخ','kitchen',1),(14,'طواجن',NULL,'طابعة مطبخ','kitchen',1),(15,'ركن حلويات المجزر',NULL,'طابعة مطبخ','kitchen',1),(16,'اطباق جانبية',NULL,'طابعة مطبخ','kitchen',1),(17,'سلطات',NULL,'طابعة مطبخ','kitchen',1),(18,'مشويات',NULL,'طابعة مطبخ','kitchen',1),(19,'كريب',NULL,'طابعة الشاورما','kitchen',1),(20,'شوربة',NULL,'طابعة مطبخ','kitchen',1),(21,'اطباق رئيسية',NULL,'طابعة مطبخ','kitchen',1),(22,'وجبات تيك واى',NULL,'طابعة مطبخ','kitchen',1),(24,'شيشة',NULL,'طابعة البار','kitchen',1),(25,'صودا',NULL,'طابعة البار','kitchen',1);
/*!40000 ALTER TABLE `mixins_main_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixins_purchase_bills`
--

DROP TABLE IF EXISTS `mixins_purchase_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mixins_purchase_bills` (
  `purchase_bill_no` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_name` int(11) DEFAULT NULL,
  `bill_serial` varchar(255) DEFAULT NULL,
  `bill_sum` double DEFAULT NULL,
  `bill_discount` double DEFAULT NULL,
  `bill_extra` varchar(45) DEFAULT NULL,
  `bill_vat_val` double DEFAULT NULL,
  `bill_total` double DEFAULT NULL,
  `bill_paid_val` double DEFAULT NULL,
  `bill_remain_val` double DEFAULT NULL,
  `bill_paid_type` varchar(45) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mixins_purchase_billscol` double DEFAULT NULL,
  `bill_notes` text,
  `deleted_bill` tinyint(1) DEFAULT '0',
  `mixins_store` int(11) DEFAULT NULL,
  `purchase_img` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`purchase_bill_no`),
  KEY `p_user_id_idx` (`user_id`),
  KEY `p_supp_id_idx` (`supplier_name`),
  CONSTRAINT `p_supp_id` FOREIGN KEY (`supplier_name`) REFERENCES `mixins_suppliers` (`supplier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `p_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_purchase_bills`
--

LOCK TABLES `mixins_purchase_bills` WRITE;
/*!40000 ALTER TABLE `mixins_purchase_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `mixins_purchase_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixins_roles`
--

DROP TABLE IF EXISTS `mixins_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mixins_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin_role` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_roles`
--

LOCK TABLES `mixins_roles` WRITE;
/*!40000 ALTER TABLE `mixins_roles` DISABLE KEYS */;
INSERT INTO `mixins_roles` VALUES (1,'الأصناف',1),(2,'الإعدادات',1),(3,'فواتير البيع',1),(4,'اعدادات الباركود',1),(5,'مرتجعات البيع',1),(6,'أصناف مباعة بدون رصيد',1),(7,'فواتير الشراء',1),(8,'تقرير المبيعات',1),(9,'صرف نقدية',1),(10,'العملاء',1),(11,'المستخدمون',1),(12,'خصم ع الفاتورة',1),(13,'توريد نقدية',1),(14,'تعديل العملاء',1),(15,'الصلاحيات',1),(16,'تعديل المستخدمون',1),(17,'حذف مستخدم',1),(18,'حذف فاتورة',1),(19,'اعادة الطباعة',1),(20,'حذف عميل',1),(21,'ايقاف  \\تفعيل العملاء',1),(22,'تعديل سعر البيع ',1),(23,'نقطة البيع',1),(24,'اظهار كلمات المرور',1);
/*!40000 ALTER TABLE `mixins_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixins_store`
--

DROP TABLE IF EXISTS `mixins_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mixins_store` (
  `mixins_store_id` int(11) NOT NULL AUTO_INCREMENT,
  `mixins_store_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mixins_store_id`),
  UNIQUE KEY `mixins_stoke_name_UNIQUE` (`mixins_store_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_store`
--

LOCK TABLES `mixins_store` WRITE;
/*!40000 ALTER TABLE `mixins_store` DISABLE KEYS */;
INSERT INTO `mixins_store` VALUES (3,'المخزن'),(2,'مخزن ترانزيت'),(1,'منفذ البيع');
/*!40000 ALTER TABLE `mixins_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixins_suppliers`
--

DROP TABLE IF EXISTS `mixins_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mixins_suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(45) NOT NULL,
  `supplier_mobile` varchar(45) NOT NULL,
  `supplier_total_withdrawals` double DEFAULT NULL,
  `supplier_total_paid` double DEFAULT NULL,
  `supplier_total_remain` double DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_suppliers`
--

LOCK TABLES `mixins_suppliers` WRITE;
/*!40000 ALTER TABLE `mixins_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mixins_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixins_type_stock`
--

DROP TABLE IF EXISTS `mixins_type_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mixins_type_stock` (
  `mixins_type_stock_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mixins_type_stock` double DEFAULT NULL,
  `type_stock_id` bigint(20) DEFAULT NULL,
  `type_exp_date` date DEFAULT NULL,
  `mixins_store` int(11) DEFAULT NULL,
  PRIMARY KEY (`mixins_type_stock_id`),
  KEY `type_stoke_id_idx` (`type_stock_id`),
  KEY `mixins_store_id_idx` (`mixins_store`),
  CONSTRAINT `st_m_store` FOREIGN KEY (`mixins_store`) REFERENCES `mixins_store` (`mixins_store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `st_type_id` FOREIGN KEY (`type_stock_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_type_stock`
--

LOCK TABLES `mixins_type_stock` WRITE;
/*!40000 ALTER TABLE `mixins_type_stock` DISABLE KEYS */;
INSERT INTO `mixins_type_stock` VALUES (1,1,103130,NULL,NULL);
/*!40000 ALTER TABLE `mixins_type_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `types_id` bigint(20) NOT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `tpe_id_note_idx` (`types_id`),
  CONSTRAINT `tpe_id_note` FOREIGN KEY (`types_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_type` bigint(20) DEFAULT NULL,
  `sup_type` bigint(20) DEFAULT NULL,
  `offer_discount_percent` int(11) DEFAULT NULL,
  `main_type_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `off_main_type_idx` (`main_type`),
  KEY `off_sub_type_idx` (`sup_type`),
  CONSTRAINT `off_main_type` FOREIGN KEY (`main_type`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `off_sub_type` FOREIGN KEY (`sup_type`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,103068,103067,100,1);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_methods`
--

DROP TABLE IF EXISTS `pay_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_method_name` varchar(45) DEFAULT NULL,
  `pay_method_name_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_methods`
--

LOCK TABLES `pay_methods` WRITE;
/*!40000 ALTER TABLE `pay_methods` DISABLE KEYS */;
INSERT INTO `pay_methods` VALUES (1,'كاش/Cash','Cash'),(2,'شبكة/Card','Card'),(3,'آجل/Later','Later');
/*!40000 ALTER TABLE `pay_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_bill_types`
--

DROP TABLE IF EXISTS `purchase_bill_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_bill_types` (
  `purchase_bill_types_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_bills` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `type_count` double DEFAULT NULL,
  `type_purchase_price` double DEFAULT NULL,
  `type_sill_price` double DEFAULT NULL,
  `total_purchase_price` double DEFAULT NULL,
  `type_vat` double DEFAULT NULL,
  `mixins_type_stock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`purchase_bill_types_id`),
  KEY `purchase_bills_id_idx` (`purchase_bills`),
  KEY `pu_type_id_idx` (`type_id`),
  KEY `purchase_bills_ids_idx` (`purchase_bills`),
  KEY `pur_type_id_idx` (`type_id`),
  CONSTRAINT `pu_type_id` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchase_bills_id` FOREIGN KEY (`purchase_bills`) REFERENCES `mixins_purchase_bills` (`purchase_bill_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_bill_types`
--

LOCK TABLES `purchase_bill_types` WRITE;
/*!40000 ALTER TABLE `purchase_bill_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_bill_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recover_password`
--

DROP TABLE IF EXISTS `recover_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recover_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recover_password`
--

LOCK TABLES `recover_password` WRITE;
/*!40000 ALTER TABLE `recover_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `recover_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_types`
--

DROP TABLE IF EXISTS `return_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_types` (
  `return_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `return_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `type_count` double DEFAULT '0',
  `type_price` double DEFAULT '0',
  `type_total_price` double DEFAULT '0',
  `type_discount` double DEFAULT '0',
  `type_vat` double DEFAULT '0',
  `type_exp_date` date DEFAULT NULL,
  `sell_unit` int(11) DEFAULT NULL,
  `returned` tinyint(1) DEFAULT '0',
  `returned_qty` double DEFAULT '0',
  `type_cost` double DEFAULT '0',
  `type_note` varchar(555) DEFAULT NULL,
  `returned_total` double DEFAULT '0',
  PRIMARY KEY (`return_type_id`),
  KEY `return_id_idx` (`return_id`),
  KEY `retur_type_idx` (`type_id`),
  KEY `returs_type_idx` (`type_id`),
  CONSTRAINT `retur_type` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `return_id` FOREIGN KEY (`return_id`) REFERENCES `returns` (`return_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_types`
--

LOCK TABLES `return_types` WRITE;
/*!40000 ALTER TABLE `return_types` DISABLE KEYS */;
INSERT INTO `return_types` VALUES (1,1,103131,1,30,30,0,0,NULL,NULL,0,1,0,NULL,0),(2,1,103122,1,120,120,0,0,NULL,NULL,0,1,0,NULL,0),(3,1,103122,1,120,120,0,0,NULL,NULL,0,1,0,NULL,0),(4,1,103122,1,120,120,0,0,NULL,NULL,0,1,0,NULL,0),(5,2,103131,1,30,30,0,0,NULL,NULL,0,1,0,NULL,30),(6,3,103131,4,30,120,0,0,NULL,NULL,0,4,0,NULL,120),(7,4,103130,1,25,25,0,0,NULL,NULL,0,1,0,NULL,25);
/*!40000 ALTER TABLE `return_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returns` (
  `return_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_no` bigint(20) DEFAULT NULL,
  `vat` bigint(20) DEFAULT NULL,
  `sum` double DEFAULT '0',
  `total` double DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `returns_date` datetime DEFAULT NULL,
  PRIMARY KEY (`return_id`),
  KEY `bill_no_idx` (`bill_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (1,370,0,0,0,1,'2022-10-01 21:11:51'),(2,369,3,30,33,1,'2022-10-01 21:19:00'),(3,368,12,120,132,1,'2022-10-01 21:19:34'),(4,333,3,25,27.5,1,'2022-10-02 00:06:56');
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_type`
--

DROP TABLE IF EXISTS `sales_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sill_type_name` varchar(45) DEFAULT NULL,
  `sill_type_discount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_type`
--

LOCK TABLES `sales_type` WRITE;
/*!40000 ALTER TABLE `sales_type` DISABLE KEYS */;
INSERT INTO `sales_type` VALUES (1,'جملة',100);
/*!40000 ALTER TABLE `sales_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shifts` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `current_user` int(11) DEFAULT NULL,
  `recived_user` int(11) DEFAULT NULL,
  `starter_point` double DEFAULT NULL,
  `cash` double DEFAULT '0',
  `later` double DEFAULT '0',
  `card` double DEFAULT '0',
  `transfer` double DEFAULT '0',
  `increase` double DEFAULT '0',
  `deficit` double DEFAULT '0',
  `remain` double DEFAULT '0',
  `starter_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recived_user_id_idx` (`recived_user`),
  KEY `curr_u_id_idx` (`current_user`),
  CONSTRAINT `curr_u_id` FOREIGN KEY (`current_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recived_user_id` FOREIGN KEY (`recived_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (6,5,1,0,3053.7000000000003,0,0,100,0,2953.7,0,'2022-09-28 12:28:59','2022-09-30 23:00:29'),(7,5,1,0,3053.7000000000003,0,0,100,0,2953.7,0,'2022-09-20 12:28:59','2022-09-21 23:00:29'),(8,1,NULL,0,1363,6.5,0,0,0,0,0,'2022-10-01 20:23:22',NULL);
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_types`
--

DROP TABLE IF EXISTS `table_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_types` (
  `table_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_bill_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `type_count` double DEFAULT '0',
  `type_price` double DEFAULT '0',
  `type_total_price` double DEFAULT '0',
  `type_discount` double DEFAULT '0',
  `type_vat` double DEFAULT '0',
  `sell_unit` int(11) DEFAULT NULL,
  `type_cost` double DEFAULT '0',
  `type_note` varchar(555) DEFAULT NULL,
  `type_purchases_price` double DEFAULT '0',
  `type_unit_id` int(11) DEFAULT NULL,
  `type_vat_percent` int(11) DEFAULT '0',
  `is_print` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`table_type_id`),
  KEY `table_bill_id_idx` (`table_bill_id`),
  KEY `ta_type_id_idx` (`type_id`),
  CONSTRAINT `ta_type_id` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `table_bill_id` FOREIGN KEY (`table_bill_id`) REFERENCES `tables_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_types`
--

LOCK TABLES `table_types` WRITE;
/*!40000 ALTER TABLE `table_types` DISABLE KEYS */;
INSERT INTO `table_types` VALUES (255,104,103131,1,30,30,0,0,278,0,NULL,0,NULL,0,1),(256,104,103131,1,30,30,0,0,278,0,NULL,0,NULL,0,1),(257,104,103131,1,30,30,0,0,278,0,NULL,0,NULL,0,1),(258,104,103131,1,30,30,0,0,278,0,NULL,0,NULL,0,0);
/*!40000 ALTER TABLE `table_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_no` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `is_resrved` tinyint(4) DEFAULT '0',
  `mini_charge` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='The bill for customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (8,'1',NULL,0,50),(9,'2',NULL,1,0),(10,'3',NULL,0,0),(11,'4',NULL,0,0),(12,'5',NULL,0,0),(13,'6',NULL,0,0),(14,'7',NULL,0,0),(15,'8',NULL,0,0),(16,'9',NULL,0,0),(17,'10',NULL,0,0),(18,'11',NULL,0,0),(19,'12',NULL,0,0),(20,'13',NULL,0,0),(21,'14',NULL,0,0),(22,'15',NULL,0,0),(23,'16',NULL,0,0),(24,'17',NULL,0,0),(25,'18',NULL,0,0),(26,'19',NULL,0,0),(27,'20',NULL,0,0),(28,'21',NULL,0,0),(29,'تيك اوى','تيك اوى',0,0),(30,'22',NULL,0,0),(31,'23',NULL,0,0),(32,'24',NULL,0,0),(33,'25',NULL,0,0),(34,NULL,'الادارة',0,0),(35,NULL,'افراح',0,0);
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_bill`
--

DROP TABLE IF EXISTS `tables_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables_bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_id` bigint(20) DEFAULT NULL,
  `cust_id` bigint(20) DEFAULT NULL,
  `bill_sum` double DEFAULT '0' COMMENT 'Tha actual sum for the bill',
  `bill_total` double DEFAULT '0' COMMENT 'The summation after discount',
  `bill_extra` double DEFAULT '0',
  `bill_notes` text,
  `user_id` int(11) DEFAULT NULL,
  `bill_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_user_idx` (`user_id`),
  KEY `tb_cus_idx` (`cust_id`),
  CONSTRAINT `tb_cus` FOREIGN KEY (`cust_id`) REFERENCES `expenses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tb_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='The bill for customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_bill`
--

LOCK TABLES `tables_bill` WRITE;
/*!40000 ALTER TABLE `tables_bill` DISABLE KEYS */;
INSERT INTO `tables_bill` VALUES (104,9,NULL,120,132,0,NULL,1,'2022-10-03 15:10:41');
/*!40000 ALTER TABLE `tables_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_units`
--

DROP TABLE IF EXISTS `type_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_units` (
  `type_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `no_of_unit` int(11) DEFAULT NULL,
  `deff_price` double DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_unit_id`),
  UNIQUE KEY `barcode_UNIQUE` (`barcode`),
  KEY `tu_type_id_idx` (`type_id`),
  KEY `uu_unit_id_idx` (`unit_id`),
  CONSTRAINT `tu_type_id` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `uu_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_units`
--

LOCK TABLES `type_units` WRITE;
/*!40000 ALTER TABLE `type_units` DISABLE KEYS */;
INSERT INTO `type_units` VALUES (75,10,103044,3,1,0,NULL),(76,10,103044,5,1,0,NULL),(77,10,103044,4,1,0,NULL),(78,10,103044,6,1,0,NULL),(79,10,103044,7,1,0,NULL),(80,15,103045,3,1,0,NULL),(81,15,103045,5,1,0,NULL),(82,15,103045,4,1,0,NULL),(83,15,103045,6,1,0,NULL),(84,15,103045,7,1,0,NULL),(85,15,103046,3,1,0,NULL),(86,15,103046,5,1,0,NULL),(87,15,103046,4,1,0,NULL),(88,15,103046,6,1,0,NULL),(89,15,103046,7,1,0,NULL),(90,20,103047,3,1,0,NULL),(91,20,103047,5,1,0,NULL),(92,20,103047,4,1,0,NULL),(93,20,103047,5,1,0,NULL),(94,20,103047,6,1,0,NULL),(95,20,103047,7,1,0,NULL),(96,20,103048,3,1,0,NULL),(97,20,103048,5,1,0,NULL),(98,20,103048,4,1,0,NULL),(99,20,103048,6,1,0,NULL),(100,20,103048,7,1,0,NULL),(101,20,103049,3,1,0,NULL),(102,20,103049,5,1,0,NULL),(103,20,103049,4,1,0,NULL),(104,20,103049,5,1,0,NULL),(105,20,103049,6,1,0,NULL),(106,20,103049,7,1,0,NULL),(107,20,103050,3,1,0,NULL),(108,20,103050,5,1,0,NULL),(109,20,103050,4,1,0,NULL),(110,20,103050,6,1,0,NULL),(111,20,103050,7,1,0,NULL),(112,20,103051,3,1,0,NULL),(113,20,103051,5,1,0,NULL),(114,20,103051,4,1,0,NULL),(115,20,103051,6,1,0,NULL),(116,20,103051,7,1,0,NULL),(117,20,103052,3,1,0,NULL),(118,20,103052,5,1,0,NULL),(119,20,103052,4,1,0,NULL),(120,20,103052,6,1,0,NULL),(121,20,103052,7,1,0,NULL),(122,20,103053,3,1,0,NULL),(123,20,103053,5,1,0,NULL),(124,20,103053,4,1,0,NULL),(125,20,103053,6,1,0,NULL),(126,20,103053,7,1,0,NULL),(127,20,103056,8,1,0,NULL),(128,20,103057,8,1,0,NULL),(129,20,103058,8,1,0,NULL),(130,20,103059,8,1,0,NULL),(133,25,103062,8,1,0,NULL),(135,25,103064,8,1,0,NULL),(136,25,103065,8,1,0,NULL),(137,6,103066,8,1,0,NULL),(138,10,103067,8,1,0,NULL),(139,10,103068,20,1,0,NULL),(140,20,103068,21,1,0,NULL),(141,30,103068,22,1,0,NULL),(143,5,103068,23,1,0,NULL),(144,15,103068,24,1,0,NULL),(145,8,103069,8,1,0,NULL),(146,10,103070,8,1,0,NULL),(147,7,103071,8,1,0,NULL),(148,7,103072,8,1,0,NULL),(149,7,103073,8,1,0,NULL),(150,10,103074,8,1,0,NULL),(155,10,103076,8,1,0,NULL),(157,10,103077,27,1,0,NULL),(158,15,103077,26,1,0,NULL),(159,10,103078,8,1,0,NULL),(160,15,103078,26,1,0,NULL),(161,15,103079,28,1,0,NULL),(162,20,103079,16,1,0,NULL),(163,20,103079,9,1,0,NULL),(164,20,103079,17,1,0,NULL),(165,25,103080,18,1,0,NULL),(166,25,103080,17,1,0,NULL),(167,25,103080,19,1,0,NULL),(168,20,103081,8,1,0,NULL),(169,7,103082,8,1,0,NULL),(170,10,103082,13,1,0,NULL),(171,10,103082,12,1,0,NULL),(172,10,103082,14,1,0,NULL),(173,10,103082,15,1,0,NULL),(174,25,103083,8,1,0,NULL),(175,15,103084,8,1,0,NULL),(176,15,103085,8,1,0,NULL),(177,15,103086,8,1,0,NULL),(178,20,103086,29,1,0,NULL),(179,15,103087,8,1,0,NULL),(180,15,103088,8,1,0,NULL),(181,25,103089,8,1,0,NULL),(182,35,103089,30,1,0,NULL),(183,35,103089,31,1,0,NULL),(184,20,103090,8,1,0,NULL),(185,25,103091,8,1,0,NULL),(186,20,103092,8,1,0,NULL),(187,20,103093,8,1,0,NULL),(188,15,103094,8,1,0,NULL),(189,25,103094,32,1,0,NULL),(190,25,103094,33,1,0,NULL),(191,25,103094,34,1,0,NULL),(192,25,103094,35,1,0,NULL),(193,25,103094,36,1,0,NULL),(194,25,103094,37,1,0,NULL),(195,25,103094,38,1,0,NULL),(196,20,103094,12,1,0,NULL),(197,25,103095,8,1,0,NULL),(200,25,103083,39,1,0,NULL),(201,25,103083,40,1,0,NULL),(202,30,103089,40,1,0,NULL),(203,30,103089,41,1,0,NULL),(204,25,103097,8,1,0,NULL),(205,20,103098,8,1,0,NULL),(206,30,103099,8,1,0,NULL),(207,25,103100,8,1,0,NULL),(208,25,103101,31,1,0,NULL),(209,25,103101,16,1,0,NULL),(210,25,103101,35,1,0,NULL),(211,25,103101,36,1,0,NULL),(212,25,103101,17,1,0,NULL),(213,25,103101,42,1,0,NULL),(214,25,103102,34,1,0,NULL),(215,25,103102,35,1,0,NULL),(216,25,103102,36,1,0,NULL),(217,25,103102,43,1,0,NULL),(218,25,103102,30,1,0,NULL),(219,25,103102,44,1,0,NULL),(220,25,103103,8,1,0,NULL),(221,30,103103,39,1,0,NULL),(222,35,103103,45,1,0,NULL),(223,40,103104,8,1,0,NULL),(224,12,103105,42,1,0,NULL),(225,12,103105,16,1,0,NULL),(226,12,103105,31,1,0,NULL),(227,12,103105,35,1,0,NULL),(228,12,103105,36,1,0,NULL),(229,12,103105,11,1,0,NULL),(230,12,103105,17,1,0,NULL),(231,35,103106,8,1,0,NULL),(232,30,103107,8,1,0,NULL),(233,12,103105,46,1,0,NULL),(234,25,103108,8,1,0,NULL),(235,30,103109,8,1,0,NULL),(236,25,103110,8,1,0,NULL),(237,10,103111,47,1,0,NULL),(238,20,103111,48,1,0,NULL),(239,85,103112,8,1,0,NULL),(240,100,103113,8,1,0,NULL),(241,70,103114,8,1,0,NULL),(242,40,103115,8,1,0,NULL),(243,70,103116,8,1,0,NULL),(244,65,103117,8,1,0,NULL),(245,10,103118,49,1,0,NULL),(247,15,103119,8,1,0,NULL),(248,15,103120,8,1,0,NULL),(249,10,103121,51,1,0,NULL),(250,10,103121,52,1,0,NULL),(251,20,103121,46,1,0,NULL),(253,200,103123,56,1,0,NULL),(254,100,103123,55,1,0,NULL),(255,150,103123,57,1,0,NULL),(256,50,103123,54,1,0,NULL),(258,120,103122,58,1,0,NULL),(259,60,103122,55,1,0,NULL),(260,35,103122,54,1,0,NULL),(261,90,103122,57,1,0,NULL),(262,55,103124,8,1,0,NULL),(263,110,103125,8,1,0,NULL),(264,340,103126,56,1,0,NULL),(265,170,103126,55,1,0,NULL),(266,85,103126,54,1,0,NULL),(267,360,103127,56,1,0,NULL),(268,180,103127,55,1,0,NULL),(269,90,103127,54,1,0,NULL),(270,275,103128,56,1,0,NULL),(271,140,103128,55,1,0,NULL),(272,70,103128,54,1,0,NULL),(273,130,103129,58,1,0,NULL),(274,100,103129,57,1,0,NULL),(275,65,103129,55,1,0,NULL),(276,35,103129,54,1,0,NULL),(277,25,103130,8,1,0,NULL),(278,30,103131,8,1,0,NULL),(279,35,103132,8,1,0,NULL),(280,35,103133,8,1,0,NULL),(281,35,103134,8,1,0,NULL),(282,30,103135,8,1,0,NULL),(283,35,103136,8,1,0,NULL),(284,30,103137,8,1,0,NULL),(285,25,103138,8,1,0,NULL),(286,30,103139,8,1,0,NULL),(287,30,103140,8,1,0,NULL),(288,25,103141,8,1,0,NULL),(289,35,103142,8,1,0,NULL),(290,30,103143,8,1,0,NULL),(291,30,103144,8,1,0,NULL),(292,15,103145,8,1,0,NULL),(293,65,103146,59,1,0,NULL),(294,125,103147,8,1,0,NULL),(295,110,103148,8,1,0,NULL),(296,80,103149,8,1,0,NULL),(297,140,103150,8,1,0,NULL),(298,100,103151,8,1,0,NULL),(299,90,103152,8,1,0,NULL),(300,120,103153,8,1,0,NULL),(301,130,103154,8,1,0,NULL),(302,95,103155,8,1,0,NULL),(303,275,103156,8,1,0,NULL),(304,60,103157,8,1,0,NULL),(305,15,103158,60,1,0,NULL),(306,20,103158,61,1,0,NULL),(307,15,103118,50,1,0,NULL),(308,35,103096,8,1,0,NULL),(309,45,103159,8,1,0,NULL),(310,20,103160,8,1,0,NULL),(311,15,103161,8,1,0,NULL),(312,25,103162,8,1,0,NULL),(313,7,103163,63,1,0,NULL),(314,7,103163,62,1,0,NULL),(315,20,103164,30,1,0,NULL),(316,20,103164,44,1,0,NULL),(317,20,103164,64,1,0,NULL),(318,20,103164,65,1,0,NULL),(319,25,103165,8,1,0,NULL),(320,35,103166,8,1,0,NULL),(321,25,103167,8,1,0,NULL),(322,30,103168,8,1,0,NULL),(323,35,103169,29,1,0,NULL),(324,35,103169,35,1,0,NULL),(325,35,103169,43,1,0,NULL),(326,30,103170,8,1,0,NULL),(327,35,103170,66,1,0,NULL),(328,10,103171,67,1,0,NULL),(329,10,103171,68,1,0,NULL),(330,10,103171,69,1,0,NULL),(331,12,103171,70,1,0,NULL),(332,12,103171,71,1,0,NULL),(333,12,103171,72,1,0,NULL),(334,5,103172,73,1,0,NULL),(335,10,103172,74,1,0,NULL),(336,20,103173,8,1,0,NULL),(337,20,103174,8,1,0,NULL),(338,25,103175,42,1,0,NULL),(339,25,103175,9,1,0,NULL),(340,25,103175,11,1,0,NULL),(341,30,103176,8,1,0,NULL),(342,25,103123,59,1,0,NULL);
/*!40000 ALTER TABLE `type_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_name_ar` varchar(200) DEFAULT NULL,
  `type_name_en` varchar(100) DEFAULT NULL,
  `type_icon` varchar(100) DEFAULT NULL,
  `type_location` int(11) DEFAULT '0',
  `type_purchases_price` double DEFAULT '0',
  `type_count` double DEFAULT '0',
  `type_has_vat` tinyint(1) NOT NULL DEFAULT '1',
  `type_vat_value` double NOT NULL DEFAULT '0',
  `type_vat_percent` int(11) DEFAULT '0',
  `type_note` varchar(255) DEFAULT NULL,
  `type_sill_price` double DEFAULT '0',
  `type_discount_value` double DEFAULT '0',
  `type_discount_percent` int(11) DEFAULT '0',
  `total_type_cost` double DEFAULT '0',
  `type_barcode` varchar(45) DEFAULT NULL,
  `type_unit` int(11) DEFAULT NULL,
  `type_exp_date` date DEFAULT NULL,
  `main_type` int(11) DEFAULT NULL,
  `sell_unit` int(11) DEFAULT '1',
  `lg_unit` varchar(255) DEFAULT 'وحدة كبرى',
  `md_unit` varchar(255) DEFAULT 'وحدة كبرى',
  `no_md_unit` int(11) DEFAULT '1',
  `sm_unit` varchar(255) DEFAULT 'وحدة كبرى',
  `no_sm_unit` int(11) DEFAULT '1',
  `diff_md_unit_price` double DEFAULT '0',
  `diff_sm_unit_price` double DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `minimum_sill_price` double DEFAULT '0',
  `type_code` varchar(45) DEFAULT '0',
  `has_offer` tinyint(1) DEFAULT '0',
  `calc_count` double DEFAULT NULL,
  `is_print` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_barcode_UNIQUE` (`type_barcode`),
  KEY `mainType_idx` (`main_type`),
  CONSTRAINT `mainType` FOREIGN KEY (`main_type`) REFERENCES `mixins_main_types` (`main_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=103177 DEFAULT CHARSET=utf8 COMMENT='types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (103044,'قهوة تركى سنجل',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,10,0,0,0,NULL,NULL,NULL,8,77,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103045,'قهوة تركى دبل',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,8,82,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103046,'قهوة فرنساوى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,8,87,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103047,'قهوة فرنساوى فانليا',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,92,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103048,'قهوة فرنساوى بندق',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,98,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103049,'قهوة فرنساوى كراميل',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,103,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103050,'قهوة بندق',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,109,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103051,'قهوة فانليا',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,114,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103052,'قهوة كراميل',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,119,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103053,'قهوة نوتيلا',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,124,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103056,'كابتشينو كراميل',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,127,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103057,'كابتشينو فانيليا',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,128,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103058,'كابتشينو شكولات',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,129,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103059,'كابتشينو بندق',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,130,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103060,'لاتية',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,'2022-09-30',8,NULL,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103061,'كوفى موكا',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,132,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103062,'كراميل نوتيلا كوفى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,8,133,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103063,'ميكاتو سنجل',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,8,134,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103064,'ميكاتو دوبل',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,8,135,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103065,'امريكان كوفى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,8,136,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103066,'شاي',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,6,0,0,0,NULL,NULL,NULL,2,137,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103067,'شاي بحليب',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,10,0,0,0,NULL,NULL,NULL,2,138,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103068,'شاي براد',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,5,0,0,0,NULL,NULL,NULL,2,143,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103069,'شاي اخضر',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,8,0,0,0,NULL,NULL,NULL,2,145,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103070,'شاي نكهات',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,10,0,0,0,NULL,NULL,NULL,2,146,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103071,'ينسون',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,7,0,0,0,NULL,NULL,NULL,2,147,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103072,'نعناع',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,7,0,0,0,NULL,NULL,NULL,2,148,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103073,'كركرية',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,7,0,0,0,NULL,NULL,NULL,2,149,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103074,'هوت سيدر',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,10,0,0,0,NULL,NULL,NULL,2,150,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103075,'هوت شوكلت',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,'1136',NULL,NULL,2,NULL,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103076,'كوكتيل اعشاب',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,10,0,0,0,NULL,NULL,NULL,2,155,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103077,'نسكافية',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,10,0,0,0,NULL,NULL,NULL,2,158,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103078,'قرفة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,10,0,0,0,NULL,NULL,NULL,2,159,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103079,'سحلب',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,2,161,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103080,'سحلب حورس',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,2,165,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103081,'هوت اوريو',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,2,168,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103082,'زنجبيل',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,7,0,0,0,NULL,NULL,NULL,2,169,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103083,'مانجو',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,5,174,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103084,'فروالة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,5,175,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103085,'جوافة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,5,176,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103086,'ليمون',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,5,177,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103087,'برتقال',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,5,179,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103088,'عناب',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,5,180,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103089,'كيوى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,5,181,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103090,'موز بالحليب',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,5,184,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103091,'بلح بالحليب',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,5,185,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103092,'بطيخ',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,5,186,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103093,'رومان',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,5,187,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103094,'زبادى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,5,188,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103095,'فلوريدا',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,5,197,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103096,'ربع فراخ تيك واى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,35,0,0,0,NULL,NULL,NULL,22,308,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103097,'تروبكان',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,5,204,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103098,'فيتامين C',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,5,205,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103099,'ميكس حورس',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,5,206,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103100,'اوريو',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,5,207,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103101,'ميك شيك',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,9,213,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103102,'سموزى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,10,214,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103103,'فروت سلاط',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,11,220,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103104,'ميكس فواكة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,40,0,0,0,NULL,NULL,NULL,11,223,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103105,'ايس كريم مينى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,12,0,0,0,NULL,NULL,NULL,12,233,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103106,'ايس كريم حورس',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,35,0,0,0,NULL,NULL,NULL,12,231,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103107,'فتة اوريو',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,12,232,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103108,'سندوتش فراخ بانية',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,13,234,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103109,'سندوتش شيش طاووك',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,13,235,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103110,'سندوتش كفتة ضانى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,13,236,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103111,'حواوشى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,10,0,0,0,NULL,NULL,NULL,13,237,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103112,'طاجن بامية باللحمة الضانى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,85,0,0,0,NULL,NULL,NULL,14,239,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103113,'طاجن عكاوى بالبصل',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,100,0,0,0,NULL,NULL,NULL,14,240,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103114,'طاجن تورلى باللحمة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,70,0,0,0,NULL,NULL,NULL,14,241,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103115,'طاجن مسقعة بالبشاميل',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,40,0,0,0,NULL,NULL,NULL,14,242,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103116,'ربع ك كبدة ضانى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,70,0,0,0,NULL,NULL,NULL,15,243,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103117,'نص ك مخاصى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,65,0,0,0,NULL,NULL,NULL,15,244,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103118,'ارز',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,10,0,0,0,NULL,NULL,NULL,16,245,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103119,'بطاطس محمرة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,16,247,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103120,'خضار سوتية',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,16,248,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103121,'سلطة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,10,0,0,0,NULL,NULL,NULL,17,249,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103122,'فراخ شيش',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,120,0,0,0,NULL,NULL,NULL,18,258,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103123,'كفتة ضانى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,200,0,0,0,NULL,NULL,NULL,18,253,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103124,'ربع فراخ+تمن كفتة تيك واى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,55,0,0,0,NULL,NULL,NULL,22,262,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103125,'مكس جريل ربع كباب+ربع فراخ تيك واى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,110,0,0,0,NULL,NULL,NULL,22,263,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103126,'كباب ضانى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,340,0,0,0,NULL,NULL,NULL,18,264,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103127,'ريش ضانى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,360,0,0,0,NULL,NULL,NULL,18,267,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103128,'كباب مشكل',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,275,0,0,0,NULL,NULL,NULL,18,270,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103129,'فراخ مخلية',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,130,0,0,0,NULL,NULL,NULL,18,273,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103130,'سندوتش شاورما فراخ',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,1,277,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,1,NULL,NULL,0,NULL,0),(103131,'سندوتش شاورما لحمة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,1,278,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103132,'كريب شاورما ميكس',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,35,0,0,0,NULL,NULL,NULL,19,279,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103133,'كريب فراخ مشوى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,35,0,0,0,NULL,NULL,NULL,19,280,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103134,'كريب شيش طاووق',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,35,0,0,0,NULL,NULL,NULL,19,281,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103135,'كريب فاهيتا فراخ',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,19,282,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103136,'كريب فاهيتا زنجر',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,35,0,0,0,NULL,NULL,NULL,19,283,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103137,'كريب شاورما لحم',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,19,284,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103138,'كريب ميكس جبن',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,19,285,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103139,'كريب كبدة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,19,286,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103140,'كريب كفتة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,19,287,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103141,'كريب بطاطس',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,19,288,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103142,'كريب شوكلاتة وفاكهة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,35,0,0,0,NULL,NULL,NULL,19,289,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103143,'شوربة فراخ بالكريمة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,20,290,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103144,'شوربة خضار باللحمة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,20,291,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103145,'شوربة لسان عصفور',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,20,292,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103146,'شوربة حورس الشهيرة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,65,0,0,0,NULL,NULL,NULL,20,293,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103147,'ميكس جريل لبنانى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,125,0,0,0,NULL,NULL,NULL,21,294,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103148,'كباب وكفتة ع الطريقة المصرية',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,110,0,0,0,NULL,NULL,NULL,21,295,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103149,'فراخ مسحبة لبنانى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,80,0,0,0,NULL,NULL,NULL,21,296,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103150,'مشويات حورس الشهيرة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,140,0,0,0,NULL,NULL,NULL,21,297,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103151,'شيش طاووك لبنانى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,100,0,0,0,NULL,NULL,NULL,21,298,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103152,'فراخ بانية مكس جبن',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,90,0,0,0,NULL,NULL,NULL,21,1,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103153,'موزة ضانى مع رز خلطة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,120,0,0,0,NULL,NULL,NULL,21,300,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103154,'موزة ضانى فتة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,130,0,0,0,NULL,NULL,NULL,21,301,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103155,'ملوخية بالطشة والفراخ',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,95,0,0,0,NULL,NULL,NULL,21,302,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103156,'وجبة حورس الشهيرة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,275,0,0,0,NULL,NULL,NULL,21,303,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103157,'فرد حمام محشى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,60,0,0,0,NULL,NULL,NULL,21,304,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103158,'سبريسو',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,8,305,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103159,'ربع كفتة ضانى تيك واى',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,45,0,0,0,NULL,NULL,NULL,22,309,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103160,'ايس كريم بالبندق',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,12,310,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103161,'ايس كريم بالموز',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,15,0,0,0,NULL,NULL,NULL,12,311,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103162,'ايس كريم جامبو',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,12,312,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103163,'حجر معسل',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,7,0,0,0,NULL,NULL,NULL,24,314,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103164,'حجر فواكة',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,24,318,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103165,'حجر مكس',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,24,319,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103166,'حجر مكس فاخر',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,35,0,0,0,NULL,NULL,NULL,24,320,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103167,'صن شاين',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,25,321,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103168,'شرى كولا',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,25,322,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103169,'موهيتو',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,35,0,0,0,NULL,NULL,NULL,25,323,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103170,'ريدبول',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,25,326,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103171,'كانز',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,10,0,0,0,NULL,NULL,NULL,25,328,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103172,'مياة معدنية',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,5,0,0,0,NULL,NULL,NULL,25,334,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103173,'ايس لاتية',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,4,336,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103174,'ايس موكا',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,20,0,0,0,NULL,NULL,NULL,4,337,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103175,'ايس شوكلت',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,25,0,0,0,NULL,NULL,NULL,4,338,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0),(103176,'ايس كراميل ميكاتو',NULL,'backend/products/product.png',NULL,0,0,1,0,0,NULL,30,0,0,0,NULL,NULL,NULL,4,341,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,NULL,NULL,0,NULL,0);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_sold_without_balance`
--

DROP TABLE IF EXISTS `types_sold_without_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types_sold_without_balance` (
  `types_sold_without_balance_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  PRIMARY KEY (`types_sold_without_balance_id`),
  KEY `so_type_id_idx` (`type_id`),
  KEY `sold_type_id_idx` (`type_id`),
  KEY `sold_type_ids_idx` (`type_id`),
  CONSTRAINT `so_type_id` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_sold_without_balance`
--

LOCK TABLES `types_sold_without_balance` WRITE;
/*!40000 ALTER TABLE `types_sold_without_balance` DISABLE KEYS */;
INSERT INTO `types_sold_without_balance` VALUES (1,103131,22),(2,103060,13),(3,103075,4),(4,103068,2),(5,103072,1),(6,103076,4),(7,103096,4),(8,103175,1),(9,103174,3),(10,103173,2),(11,103067,1),(12,103069,1),(13,103176,1),(14,103122,3),(15,103124,1),(16,103125,1);
/*!40000 ALTER TABLE `types_sold_without_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_ar_name` varchar(255) DEFAULT NULL,
  `unit_en_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (3,'سادة',NULL),(4,'مظبوط',NULL),(5,'على الريحة',NULL),(6,'مانو',NULL),(7,'زيادة',NULL),(8,'-',NULL),(9,'كراميل',NULL),(10,'كيت كات',NULL),(11,'بندق',NULL),(12,'عسل',NULL),(13,'ليمون',NULL),(14,'ينسون',NULL),(15,'قرفة',NULL),(16,'شوكلاتة',NULL),(17,'اوريو',NULL),(18,'فواكة',NULL),(19,'صوصات',NULL),(20,'2',NULL),(21,'4',NULL),(22,'6',NULL),(23,'1',NULL),(24,'3',NULL),(25,'5',NULL),(26,'حليب',NULL),(27,'بلاك',NULL),(28,'مكسرات',NULL),(29,'نعناع',NULL),(30,'ليمون نعناع',NULL),(31,'مانجو',NULL),(32,'فواكة',NULL),(33,'خوخ',NULL),(34,'مانجو',NULL),(35,'فراولة',NULL),(36,'بلوبري',NULL),(37,'كيوى',NULL),(38,'ميكس فواكة',NULL),(39,'ايس فانليا',NULL),(40,'بيتش',NULL),(41,'زايت',NULL),(42,'فانليا',NULL),(43,'بطيخ',NULL),(44,'خوخ',NULL),(45,'فخفخينا',NULL),(46,'ميكس',NULL),(47,'وسط',NULL),(48,'كبير',NULL),(49,'ابيض',NULL),(50,'بالخلطة',NULL),(51,'زبادى',NULL),(52,'بابا غنوج',NULL),(54,'ربع',NULL),(55,'نص',NULL),(56,'كيلو',NULL),(57,'تلات اربع',NULL),(58,'فرخة',NULL),(59,'تمن',NULL),(60,'سنجل',NULL),(61,'دوبل',NULL),(62,'قص',NULL),(63,'سلوم',NULL),(64,'عنب',NULL),(65,'تفاح',NULL),(66,'ستروبري',NULL),(67,'بيبسي',NULL),(68,'سفن',NULL),(69,'ميرندا',NULL),(70,'بريل',NULL),(71,'فيروز',NULL),(72,'شويبس',NULL),(73,'صغيرة',NULL),(74,'كبيرة',NULL);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `mixins_role` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `role_us_id_idx` (`user_id`),
  CONSTRAINT `role_us_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (27,24,1),(39,3,1),(41,5,1),(43,7,1),(44,8,1),(45,9,1),(46,10,1),(47,22,1),(50,11,1),(51,16,1),(52,15,1),(53,1,1),(54,2,1),(55,12,1),(56,13,1),(57,14,1),(58,17,1),(59,4,1),(60,6,1),(61,18,1),(62,19,1),(63,20,1),(64,21,1),(65,23,1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `mobile` varchar(45) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `is_user` tinyint(1) DEFAULT '1',
  `hour_price` varchar(45) DEFAULT NULL,
  `work_hour_count` varchar(45) DEFAULT NULL,
  `jop_title` varchar(45) DEFAULT NULL,
  `bill_details` tinyint(1) DEFAULT '0',
  `bills` tinyint(1) DEFAULT '0',
  `new_bill` tinyint(1) DEFAULT '0',
  `puraches_bill` tinyint(1) DEFAULT '0',
  `expenses` tinyint(1) DEFAULT '0',
  `puraches_bills` tinyint(1) DEFAULT '0',
  `customers` tinyint(1) DEFAULT '0',
  `delete_customer` tinyint(1) DEFAULT '0',
  `edit_customer` tinyint(1) DEFAULT '0',
  `create_customer` tinyint(1) DEFAULT '0',
  `users` tinyint(1) DEFAULT '0',
  `delete_user` tinyint(1) DEFAULT '0',
  `edit_user` tinyint(1) DEFAULT '0',
  `create_user` tinyint(1) DEFAULT '0',
  `user_roles` tinyint(1) DEFAULT '0',
  `change_price` tinyint(1) DEFAULT '0',
  `types` tinyint(1) DEFAULT '0',
  `create_type` tinyint(1) DEFAULT '0',
  `delete_type` tinyint(1) DEFAULT '0',
  `edit_type` tinyint(1) DEFAULT '0',
  `reports` tinyint(1) DEFAULT '0',
  `daily_report` tinyint(1) DEFAULT '0',
  `monthly_report` tinyint(1) DEFAULT '0',
  `bills_report` tinyint(1) DEFAULT '0',
  `puraches_bill_report` tinyint(1) DEFAULT '0',
  `expenses_reports` tinyint(1) DEFAULT '0',
  `process_bill` tinyint(1) DEFAULT '0',
  `process_bill_report` tinyint(1) DEFAULT '0',
  `stock` tinyint(1) DEFAULT '0',
  `pay_bill` tinyint(1) DEFAULT '0',
  `remove_from_cart` tinyint(1) DEFAULT '0',
  `bill_discount` tinyint(1) DEFAULT '0',
  `type_discount` tinyint(1) DEFAULT '0',
  `bill_extra` tinyint(1) DEFAULT '0',
  `shift` tinyint(1) DEFAULT '0',
  `shift_report` tinyint(1) DEFAULT '0',
  `customer_pay` tinyint(1) DEFAULT '0',
  `customer_pay_report` tinyint(1) DEFAULT '0',
  `suppliers` tinyint(1) DEFAULT '0',
  `supplier_report` tinyint(1) DEFAULT '0',
  `create_supplier` tinyint(1) DEFAULT '0',
  `edit_supplier` tinyint(1) DEFAULT '0',
  `delete_supplier` tinyint(1) DEFAULT '0',
  `settings` tinyint(1) DEFAULT '0',
  `period_report` tinyint(1) DEFAULT '0',
  `units` tinyint(1) DEFAULT '0',
  `create_unit` tinyint(1) DEFAULT '0',
  `add_unit` tinyint(1) DEFAULT '0',
  `edit_unit` tinyint(1) DEFAULT '0',
  `offers` tinyint(1) DEFAULT '0',
  `create_offer` tinyint(1) DEFAULT '0',
  `edit_offer` tinyint(1) DEFAULT '0',
  `delete_offer` tinyint(1) DEFAULT '0',
  `barcode_settings` tinyint(1) DEFAULT '0',
  `print_barcode` tinyint(1) DEFAULT '0',
  `reprint_bill` tinyint(1) DEFAULT '0',
  `main_types` tinyint(1) DEFAULT '0',
  `create_main_type` tinyint(1) DEFAULT '0',
  `edit_main_type` tinyint(1) DEFAULT '0',
  `delete_unit` tinyint(1) DEFAULT '0',
  `delete_main_type` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `pin_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (-1,'codies','$2y$10$zYygvrgsUDrhu/MLJq.ZH.CyEnHp59CYxFX5EOe92bUcaJbr7UT6O',2,'01002208627',0,NULL,'codeis.solutions@gmail.com',2,'5','8',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(1,'admin','$2y$10$cd3wWPSmH0pDfrZxTQd/6ebfIIbVzgM2GOBK3t0pFNCT3/7zwfAKu',1,'01032210229',NULL,'مصطفى','m.abdalmoamen@gmail.com',1,'5','8',NULL,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,'555555'),(5,'mohamed rashed','$2y$10$goX3TqDC/e.qVEG3RVOFoeCRc5Rwt7fSiAEbB6VqkTgwB6K2erXfi',0,'01009475895',0,NULL,'aaa',1,'5','8',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'123456'),(6,'مصطفى','$2y$10$BQAbgJ5ozxmYMp1x2/SR8OJXCFjZRGE3QGYRIsmDS0r95t6vGokka',1,NULL,0,NULL,NULL,1,'0','8',NULL,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,NULL),(7,'1',NULL,0,'1',0,NULL,NULL,0,'0','8',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'443322');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-06 21:46:10
