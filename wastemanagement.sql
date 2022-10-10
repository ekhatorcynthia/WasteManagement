/*
SQLyog Community v12.09 (64 bit)
MySQL - 10.4.8-MariaDB-log : Database - waste_management
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`waste_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `waste_management`;

/*Table structure for table `cities` */

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cities` */

insert  into `cities`(`id`,`name`,`created_at`,`updated_at`) values (1,'Adabraka','2020-06-11 15:41:18','2020-06-11 15:41:18'),(2,'Osu','2020-06-11 15:41:25','2020-06-11 15:41:25');

/*Table structure for table `data_rows` */

DROP TABLE IF EXISTS `data_rows`;

CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `data_rows` */

insert  into `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) values (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(56,9,'id','text','Id',1,0,0,0,0,0,'{}',1),(57,9,'name','text','Name',1,1,1,1,1,1,'{}',2),(58,9,'created_at','timestamp','Created At',0,1,1,0,0,0,'{\"validation\":{\"rule\":\"required|max:100|unique:statuses,name\"}}',3),(59,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(60,10,'id','text','Id',1,0,0,0,0,0,'{}',1),(61,10,'name','text','Name',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:100|unique:cities,name\"}}',2),(62,10,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',3),(63,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(64,11,'id','text','Id',1,0,0,0,0,0,'{}',1),(65,11,'name','text','Name',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|unique:types,name|max:100\"}}',2),(66,11,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',3),(67,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(68,12,'id','text','Id',1,0,0,0,0,0,'{}',1),(69,12,'name','text','Name',1,1,1,0,1,1,'{\"validation\":{\"rule\":\"required|max:100\"}}',2),(70,12,'email','text','Email',1,1,1,0,1,1,'{\"validation\":{\"rule\":\"max:100\"}}',3),(71,12,'amount','number','Amount',1,1,1,0,1,1,'{\"validation\":{\"rule\":\"required\"}}',4),(72,12,'created_at','timestamp','Created At',0,1,0,0,0,0,'{}',5),(73,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(74,12,'location','coordinates','Location',0,0,0,0,0,0,'{}',7),(75,12,'waste_belongsto_city_relationship','relationship','City',0,1,1,0,1,1,'{\"model\":\"App\\\\City\",\"table\":\"cities\",\"type\":\"belongsTo\",\"column\":\"city_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(76,12,'waste_belongsto_type_relationship','relationship','Waste Type',0,1,1,0,1,1,'{\"model\":\"App\\\\Type\",\"table\":\"types\",\"type\":\"belongsTo\",\"column\":\"type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}',9),(77,12,'city_id','text','City Id',1,1,1,0,1,1,'{}',8),(78,12,'status_id','text','Status Id',1,1,1,0,1,1,'{}',9),(79,12,'type_id','text','Type Id',1,1,1,0,1,1,'{}',10),(80,12,'waste_belongsto_status_relationship','relationship','Status',0,1,1,1,1,1,'{\"model\":\"App\\\\Status\",\"table\":\"statuses\",\"type\":\"belongsTo\",\"column\":\"status_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}',11);

/*Table structure for table `data_types` */

DROP TABLE IF EXISTS `data_types`;

CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `data_types` */

insert  into `data_types`(`id`,`name`,`slug`,`display_name_singular`,`display_name_plural`,`icon`,`model_name`,`policy_name`,`controller`,`description`,`generate_permissions`,`server_side`,`details`,`created_at`,`updated_at`) values (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2020-06-11 14:43:29','2020-06-11 14:43:29'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2020-06-11 14:43:29','2020-06-11 14:43:29'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2020-06-11 14:43:29','2020-06-11 14:43:29'),(9,'statuses','statuses','Status','Statuses','voyager-paper-plane','App\\Status',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2020-06-11 15:17:23','2020-06-11 15:27:16'),(10,'cities','cities','City','Cities','voyager-lighthouse','App\\City',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2020-06-11 15:19:56','2020-06-11 15:26:59'),(11,'types','types','Type of Waste','Type of Wastes','voyager-truck','App\\Type',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2020-06-11 15:25:55','2020-06-11 15:27:49'),(12,'wastes','wastes','Waste','Wastes','voyager-rum','App\\Waste',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2020-06-11 15:34:43','2020-06-11 15:50:13');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `menu_items` */

DROP TABLE IF EXISTS `menu_items`;

CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menu_items` */

insert  into `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) values (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2020-06-11 14:43:29','2020-06-11 14:43:29','voyager.dashboard',NULL),(3,1,'Users','','_self','voyager-person',NULL,15,1,'2020-06-11 14:43:29','2020-06-11 15:05:54','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,15,2,'2020-06-11 14:43:29','2020-06-11 15:05:58','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,3,'2020-06-11 14:43:29','2020-06-11 15:28:53',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2020-06-11 14:43:29','2020-06-11 15:05:09','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2020-06-11 14:43:29','2020-06-11 15:05:09','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2020-06-11 14:43:29','2020-06-11 15:05:09','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2020-06-11 14:43:29','2020-06-11 15:05:09','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,4,'2020-06-11 14:43:29','2020-06-11 15:28:53','voyager.settings.index',NULL),(11,1,'Hooks','','_self','voyager-hook',NULL,5,5,'2020-06-11 14:43:29','2020-06-11 15:05:09','voyager.hooks',NULL),(15,1,'User Management','','_self','voyager-people','#000000',NULL,5,'2020-06-11 15:05:40','2020-06-11 15:28:53',NULL,''),(16,1,'Statuses','','_self','voyager-paper-plane',NULL,19,3,'2020-06-11 15:17:23','2020-06-11 15:28:43','voyager.statuses.index',NULL),(17,1,'Cities','','_self','voyager-lighthouse',NULL,19,2,'2020-06-11 15:19:56','2020-06-11 15:28:41','voyager.cities.index',NULL),(18,1,'Type of Wastes','','_self','voyager-truck','#000000',19,1,'2020-06-11 15:25:55','2020-06-11 15:28:39','voyager.types.index','null'),(19,1,'Masters','#','_self','voyager-wallet','#000000',NULL,2,'2020-06-11 15:28:27','2020-06-11 15:29:15',NULL,''),(20,1,'Wastes','','_self','voyager-rum',NULL,NULL,6,'2020-06-11 15:34:43','2020-06-11 15:34:43','voyager.wastes.index',NULL);

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`name`,`created_at`,`updated_at`) values (1,'admin','2020-06-11 14:43:29','2020-06-11 14:43:29');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_08_19_000000_create_failed_jobs_table',1),(24,'2016_01_01_000000_create_pages_table',2),(25,'2016_01_01_000000_create_posts_table',2),(26,'2016_02_15_204651_create_categories_table',2),(27,'2017_04_11_000000_alter_post_nullable_fields_table',2);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permission_role` */

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permission_role` */

insert  into `permission_role`(`permission_id`,`role_id`) values (1,1),(1,2),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(42,1),(42,2),(43,1),(43,2),(44,1),(45,1),(46,1),(47,1),(47,2),(48,1),(48,2),(49,1),(50,1),(51,1),(52,1),(52,2),(53,1),(53,2),(54,1),(55,1),(56,1),(57,1),(57,2),(58,1),(58,2),(59,1),(60,1),(61,1);

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) values (1,'browse_admin',NULL,'2020-06-11 14:43:29','2020-06-11 14:43:29'),(2,'browse_bread',NULL,'2020-06-11 14:43:29','2020-06-11 14:43:29'),(3,'browse_database',NULL,'2020-06-11 14:43:29','2020-06-11 14:43:29'),(4,'browse_media',NULL,'2020-06-11 14:43:29','2020-06-11 14:43:29'),(5,'browse_compass',NULL,'2020-06-11 14:43:29','2020-06-11 14:43:29'),(6,'browse_menus','menus','2020-06-11 14:43:29','2020-06-11 14:43:29'),(7,'read_menus','menus','2020-06-11 14:43:29','2020-06-11 14:43:29'),(8,'edit_menus','menus','2020-06-11 14:43:29','2020-06-11 14:43:29'),(9,'add_menus','menus','2020-06-11 14:43:29','2020-06-11 14:43:29'),(10,'delete_menus','menus','2020-06-11 14:43:29','2020-06-11 14:43:29'),(11,'browse_roles','roles','2020-06-11 14:43:29','2020-06-11 14:43:29'),(12,'read_roles','roles','2020-06-11 14:43:29','2020-06-11 14:43:29'),(13,'edit_roles','roles','2020-06-11 14:43:29','2020-06-11 14:43:29'),(14,'add_roles','roles','2020-06-11 14:43:29','2020-06-11 14:43:29'),(15,'delete_roles','roles','2020-06-11 14:43:29','2020-06-11 14:43:29'),(16,'browse_users','users','2020-06-11 14:43:29','2020-06-11 14:43:29'),(17,'read_users','users','2020-06-11 14:43:29','2020-06-11 14:43:29'),(18,'edit_users','users','2020-06-11 14:43:29','2020-06-11 14:43:29'),(19,'add_users','users','2020-06-11 14:43:29','2020-06-11 14:43:29'),(20,'delete_users','users','2020-06-11 14:43:29','2020-06-11 14:43:29'),(21,'browse_settings','settings','2020-06-11 14:43:29','2020-06-11 14:43:29'),(22,'read_settings','settings','2020-06-11 14:43:29','2020-06-11 14:43:29'),(23,'edit_settings','settings','2020-06-11 14:43:29','2020-06-11 14:43:29'),(24,'add_settings','settings','2020-06-11 14:43:29','2020-06-11 14:43:29'),(25,'delete_settings','settings','2020-06-11 14:43:29','2020-06-11 14:43:29'),(26,'browse_hooks',NULL,'2020-06-11 14:43:29','2020-06-11 14:43:29'),(42,'browse_statuses','statuses','2020-06-11 15:17:23','2020-06-11 15:17:23'),(43,'read_statuses','statuses','2020-06-11 15:17:23','2020-06-11 15:17:23'),(44,'edit_statuses','statuses','2020-06-11 15:17:23','2020-06-11 15:17:23'),(45,'add_statuses','statuses','2020-06-11 15:17:23','2020-06-11 15:17:23'),(46,'delete_statuses','statuses','2020-06-11 15:17:23','2020-06-11 15:17:23'),(47,'browse_cities','cities','2020-06-11 15:19:56','2020-06-11 15:19:56'),(48,'read_cities','cities','2020-06-11 15:19:56','2020-06-11 15:19:56'),(49,'edit_cities','cities','2020-06-11 15:19:56','2020-06-11 15:19:56'),(50,'add_cities','cities','2020-06-11 15:19:56','2020-06-11 15:19:56'),(51,'delete_cities','cities','2020-06-11 15:19:56','2020-06-11 15:19:56'),(52,'browse_types','types','2020-06-11 15:25:55','2020-06-11 15:25:55'),(53,'read_types','types','2020-06-11 15:25:55','2020-06-11 15:25:55'),(54,'edit_types','types','2020-06-11 15:25:55','2020-06-11 15:25:55'),(55,'add_types','types','2020-06-11 15:25:55','2020-06-11 15:25:55'),(56,'delete_types','types','2020-06-11 15:25:55','2020-06-11 15:25:55'),(57,'browse_wastes','wastes','2020-06-11 15:34:43','2020-06-11 15:34:43'),(58,'read_wastes','wastes','2020-06-11 15:34:43','2020-06-11 15:34:43'),(59,'edit_wastes','wastes','2020-06-11 15:34:43','2020-06-11 15:34:43'),(60,'add_wastes','wastes','2020-06-11 15:34:43','2020-06-11 15:34:43'),(61,'delete_wastes','wastes','2020-06-11 15:34:43','2020-06-11 15:34:43');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`display_name`,`created_at`,`updated_at`) values (1,'admin','Administrator','2020-06-11 14:43:29','2020-06-11 14:43:29'),(2,'user','Normal User','2020-06-11 14:43:29','2020-06-11 14:43:29');

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings` */

insert  into `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) values (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Waste Management','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to WMS','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');

/*Table structure for table `statuses` */

DROP TABLE IF EXISTS `statuses`;

CREATE TABLE `statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `statuses_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `statuses` */

insert  into `statuses`(`id`,`name`,`created_at`,`updated_at`) values (1,'Collected','2020-06-11 15:17:40','2020-06-11 15:17:40'),(2,'Cancelled','2020-06-11 15:17:49','2020-06-11 15:17:49');

/*Table structure for table `translations` */

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `translations` */

insert  into `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) values (1,'data_types','display_name_singular',5,'pt','Post','2020-06-11 14:45:10','2020-06-11 14:45:10'),(2,'data_types','display_name_singular',6,'pt','Página','2020-06-11 14:45:10','2020-06-11 14:45:10'),(3,'data_types','display_name_singular',1,'pt','Utilizador','2020-06-11 14:45:10','2020-06-11 14:45:10'),(4,'data_types','display_name_singular',4,'pt','Categoria','2020-06-11 14:45:10','2020-06-11 14:45:10'),(5,'data_types','display_name_singular',2,'pt','Menu','2020-06-11 14:45:10','2020-06-11 14:45:10'),(6,'data_types','display_name_singular',3,'pt','Função','2020-06-11 14:45:10','2020-06-11 14:45:10'),(7,'data_types','display_name_plural',5,'pt','Posts','2020-06-11 14:45:10','2020-06-11 14:45:10'),(8,'data_types','display_name_plural',6,'pt','Páginas','2020-06-11 14:45:10','2020-06-11 14:45:10'),(9,'data_types','display_name_plural',1,'pt','Utilizadores','2020-06-11 14:45:10','2020-06-11 14:45:10'),(10,'data_types','display_name_plural',4,'pt','Categorias','2020-06-11 14:45:10','2020-06-11 14:45:10'),(11,'data_types','display_name_plural',2,'pt','Menus','2020-06-11 14:45:10','2020-06-11 14:45:10'),(12,'data_types','display_name_plural',3,'pt','Funções','2020-06-11 14:45:10','2020-06-11 14:45:10'),(13,'categories','slug',1,'pt','categoria-1','2020-06-11 14:45:10','2020-06-11 14:45:10'),(14,'categories','name',1,'pt','Categoria 1','2020-06-11 14:45:10','2020-06-11 14:45:10'),(15,'categories','slug',2,'pt','categoria-2','2020-06-11 14:45:10','2020-06-11 14:45:10'),(16,'categories','name',2,'pt','Categoria 2','2020-06-11 14:45:10','2020-06-11 14:45:10'),(17,'pages','title',1,'pt','Olá Mundo','2020-06-11 14:45:10','2020-06-11 14:45:10'),(18,'pages','slug',1,'pt','ola-mundo','2020-06-11 14:45:10','2020-06-11 14:45:10'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2020-06-11 14:45:10','2020-06-11 14:45:10'),(20,'menu_items','title',1,'pt','Painel de Controle','2020-06-11 14:45:10','2020-06-11 14:45:10'),(21,'menu_items','title',2,'pt','Media','2020-06-11 14:45:10','2020-06-11 14:45:10'),(22,'menu_items','title',13,'pt','Publicações','2020-06-11 14:45:10','2020-06-11 14:45:10'),(23,'menu_items','title',3,'pt','Utilizadores','2020-06-11 14:45:11','2020-06-11 14:45:11'),(24,'menu_items','title',12,'pt','Categorias','2020-06-11 14:45:11','2020-06-11 14:45:11'),(25,'menu_items','title',14,'pt','Páginas','2020-06-11 14:45:11','2020-06-11 14:45:11'),(26,'menu_items','title',4,'pt','Funções','2020-06-11 14:45:11','2020-06-11 14:45:11'),(27,'menu_items','title',5,'pt','Ferramentas','2020-06-11 14:45:11','2020-06-11 14:45:11'),(28,'menu_items','title',6,'pt','Menus','2020-06-11 14:45:11','2020-06-11 14:45:11'),(29,'menu_items','title',7,'pt','Base de dados','2020-06-11 14:45:11','2020-06-11 14:45:11'),(30,'menu_items','title',10,'pt','Configurações','2020-06-11 14:45:11','2020-06-11 14:45:11');

/*Table structure for table `types` */

DROP TABLE IF EXISTS `types`;

CREATE TABLE `types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `types` */

insert  into `types`(`id`,`name`,`created_at`,`updated_at`) values (1,'Garbage','2020-06-11 15:26:14','2020-06-11 15:26:14');

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_roles` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`role_id`,`name`,`email`,`avatar`,`email_verified_at`,`password`,`remember_token`,`settings`,`created_at`,`updated_at`) values (1,1,'Admin','admin@admin.com','users/default.png',NULL,'$2y$10$qUtFidaoDpM3q5Z7YiNyRO0vtGV0YCoIikK59T3Bqi2o1LV88Fv0q','MhmDBwCmnwHYuo91qTmxc5CcpUwcDgArd2y3G7DBEhdb63IBo860nlKykyT7',NULL,'2020-06-11 14:45:10','2020-06-11 14:45:10'),(2,2,'Bright','brightmensah@gmail.com','users/default.png',NULL,'$2y$10$cPOhYdCpASgrnQOEl.cdmewA2IC72FMj56nhnM0ik78MtZ9uX.hqK',NULL,'{\"locale\":\"en\"}','2020-06-11 15:43:30','2020-06-11 15:43:30');

/*Table structure for table `wastes` */

DROP TABLE IF EXISTS `wastes`;

CREATE TABLE `wastes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location` geometrycollection DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `wastes` */

insert  into `wastes`(`id`,`name`,`email`,`amount`,`created_at`,`updated_at`,`location`,`city_id`,`status_id`,`type_id`) values (1,'Bright','brightmensah064@gmail.com',100,'2020-06-11 15:41:39','2020-06-11 15:41:39',NULL,1,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
