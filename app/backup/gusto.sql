-- MySQL dump 10.13  Distrib 5.7.40, for Win64 (x86_64)
--
-- Host: localhost    Database: codies
-- ------------------------------------------------------
-- Server version	5.7.40-log

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
-- Current Database: `codies`
--

/*!40000 DROP DATABASE IF EXISTS `codies`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `codies` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `codies`;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES (11,5,'2022-10-02 22:17:10','2022-10-02 22:17:10',0,'2022-10-03 08:49:47',0.53333333333333),(12,1,'2022-10-02 22:17:10','2022-10-02 23:05:58',0,'2022-10-19 18:57:29',0),(13,7,'2022-10-03 16:38:46','2022-10-03 16:38:46',1,NULL,0),(14,1,'2022-10-19 18:57:14','2022-10-19 18:57:14',0,'2022-10-19 18:57:29',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_types`
--

LOCK TABLES `bill_types` WRITE;
/*!40000 ALTER TABLE `bill_types` DISABLE KEYS */;
INSERT INTO `bill_types` VALUES (1,1,1,1,120,120,0,0,NULL,1,0,0,0,NULL,0,NULL,NULL,100,0);
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
  `sale_type` int(11) DEFAULT NULL,
  `sale_discount` double DEFAULT '0',
  `sum_after_discount` double DEFAULT '0',
  `is_included` tinyint(1) DEFAULT '0',
  `vat` double DEFAULT '0',
  PRIMARY KEY (`bill_no`),
  KEY `bill_cust_idx` (`cust_id`),
  KEY `bill_user_idx` (`user_id`),
  KEY `bill_store_idx` (`mixins_store`),
  KEY `stype_idx` (`sale_type`),
  CONSTRAINT `bill_cust` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bill_store` FOREIGN KEY (`mixins_store`) REFERENCES `mixins_store` (`mixins_store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bill_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stype` FOREIGN KEY (`sale_type`) REFERENCES `sales_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='The bill for customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,NULL,NULL,120,0,120,'2022-12-12 18:03:16',0,0,0,120,NULL,NULL,0,1,0,1,NULL,NULL,NULL,0,0,0,0,0,0,0,0,1,0,120,0,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_pay`
--

LOCK TABLES `customer_pay` WRITE;
/*!40000 ALTER TABLE `customer_pay` DISABLE KEYS */;
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
  `cust_balance` double DEFAULT '0',
  `cust_discount_val` double DEFAULT '0',
  `cust_discount_percent` double DEFAULT '0',
  `active_customer` tinyint(1) DEFAULT '1',
  `pay_method` int(11) DEFAULT '0',
  `max_balance` double DEFAULT NULL,
  `cust_vat_num` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `identity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customers for laundry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gusto_stocks`
--

LOCK TABLES `gusto_stocks` WRITE;
/*!40000 ALTER TABLE `gusto_stocks` DISABLE KEYS */;
INSERT INTO `gusto_stocks` VALUES (1,'لحوم',98200),(2,'عيش',82);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gusto_type_stock`
--

LOCK TABLES `gusto_type_stock` WRITE;
/*!40000 ALTER TABLE `gusto_type_stock` DISABLE KEYS */;
INSERT INTO `gusto_type_stock` VALUES (1,103131,1,8,100),(2,103131,2,8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
INSERT INTO `leaves` VALUES (10,5,0,'2022-10-02 22:49:47','2022-10-02 22:49:47'),(11,1,1,'2022-10-02 23:06:24','2022-10-02 23:06:24'),(12,1,0,'2022-10-19 18:57:29','2022-10-19 18:57:29');
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
  `sale_type` int(11) DEFAULT NULL,
  `show_side_menu` tinyint(1) DEFAULT '1',
  `as_card` tinyint(1) DEFAULT '0',
  `count_in_row_bill` varchar(45) DEFAULT 'col-4',
  `count_in_row_main` varchar(45) DEFAULT 'col-4',
  `printer_count` int(11) DEFAULT '1',
  `pretty` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `curr_id_idx` (`currency`),
  KEY `pay_method_idx` (`mixins_main_payment_method`),
  KEY `pay_method_idsx` (`mixins_main_payment_method`),
  KEY `salType_idx` (`sale_type`),
  CONSTRAINT `curr_id` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pay_method` FOREIGN KEY (`mixins_main_payment_method`) REFERENCES `pay_methods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `salType` FOREIGN KEY (`sale_type`) REFERENCES `sales_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_info`
--

LOCK TABLES `mixins_info` WRITE;
/*!40000 ALTER TABLE `mixins_info` DISABLE KEYS */;
INSERT INTO `mixins_info` VALUES (1,'محلات الصحه و الجمال لمستحضرات التجميل ومستلزمات الصيدليات','اشمون -شارع سعد زغلول امام بنك مصر','01205096626 -01270570527',NULL,0,NULL,2,'23','backend/mixins/1669252425.jpeg','6479_A7FF_F000_4675',NULL,1,1,1,0,0,0,0,'2023-11-01',20,'white','ar',1,0,0,1,1,NULL,3,1,2,1,NULL,NULL,NULL,'E',NULL,1,0,0,0,0,0,1,'2022-05-01','2022-10-22',0,0,0,1,1,4,'2','el seha we elgamal',NULL,1,'chaircoder@gmail.com','m.abdalmoamen@gmail.com','00:35',0,0,'13',0,1,1,1,0,0,'col-4','col-4',1,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_item_request`
--

LOCK TABLES `mixins_item_request` WRITE;
/*!40000 ALTER TABLE `mixins_item_request` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_main_types`
--

LOCK TABLES `mixins_main_types` WRITE;
/*!40000 ALTER TABLE `mixins_main_types` DISABLE KEYS */;
INSERT INTO `mixins_main_types` VALUES (1,'صنف رئيسي','Main Types',NULL,'kitchen',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixins_type_stock`
--

LOCK TABLES `mixins_type_stock` WRITE;
/*!40000 ALTER TABLE `mixins_type_stock` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_types`
--

LOCK TABLES `return_types` WRITE;
/*!40000 ALTER TABLE `return_types` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_type`
--

LOCK TABLES `sales_type` WRITE;
/*!40000 ALTER TABLE `sales_type` DISABLE KEYS */;
INSERT INTO `sales_type` VALUES (1,'تجزئة',0),(2,'جملة',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (1,1,NULL,0,120,0,0,0,0,0,0,'2022-12-12 18:03:16',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_types`
--

LOCK TABLES `table_types` WRITE;
/*!40000 ALTER TABLE `table_types` DISABLE KEYS */;
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
  `is_resrved` tinyint(1) DEFAULT '0',
  `mini_charge` decimal(8,0) DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The bill for customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The bill for customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_bill`
--

LOCK TABLES `tables_bill` WRITE;
/*!40000 ALTER TABLE `tables_bill` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_units`
--

LOCK TABLES `type_units` WRITE;
/*!40000 ALTER TABLE `type_units` DISABLE KEYS */;
INSERT INTO `type_units` VALUES (1,120,1,1,1,0,NULL);
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
  `sell_unit` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'صنف جديد','New item','backend/products/product.png',NULL,100,0,1,0,0,NULL,120,0,0,0,'1131',NULL,'2023-03-25',1,1,'وحدة كبرى','وحدة كبرى',1,'وحدة كبرى',1,0,0,0,50,NULL,0,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_sold_without_balance`
--

LOCK TABLES `types_sold_without_balance` WRITE;
/*!40000 ALTER TABLE `types_sold_without_balance` DISABLE KEYS */;
INSERT INTO `types_sold_without_balance` VALUES (1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'علبة','Box');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (-1,'codies','$2y$10$zYygvrgsUDrhu/MLJq.ZH.CyEnHp59CYxFX5EOe92bUcaJbr7UT6O',2,'01002208627',0,NULL,'codeis.solutions@gmail.com',2,'5','8',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(1,'admin','$2y$10$m.44chK73pqF8/jieVZjBeH.vtV3ld5XubxuIV.l4UDkOxZbHNWB.',1,'01002208627',0,NULL,NULL,1,'0','8',NULL,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,NULL);
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

-- Dump completed on 2022-12-12 18:03:16
