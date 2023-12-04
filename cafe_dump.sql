-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: cafe
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
-- Table structure for table `appliance`
--

DROP TABLE IF EXISTS `appliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appliance` (
  `appliance_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint unsigned NOT NULL,
  `appliance_type` varchar(20) DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  `last_cleaned_date` datetime DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  PRIMARY KEY (`appliance_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `appliance_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appliance`
--

LOCK TABLES `appliance` WRITE;
/*!40000 ALTER TABLE `appliance` DISABLE KEYS */;
INSERT INTO `appliance` VALUES (1,1,'Espresso Machine','2024-08-15','2023-10-20 09:45:00','2024-01-05'),(2,1,'Coffee Grinder','2023-12-31','2023-11-12 15:20:00','2023-12-20'),(3,1,'Milk Frother','2025-03-10','2023-12-05 11:10:30','2024-03-25'),(4,1,'Cappuccino Maker','2023-09-22','2023-11-18 14:55:00','2024-02-10'),(5,1,'Tea Infuser','2024-12-05','2023-10-28 10:30:00','2023-12-18'),(6,1,'Commercial Blender','2025-02-28','2023-11-30 08:15:30','2024-02-15'),(7,1,'Juice Extractor','2023-10-15','2023-12-10 13:40:00','2024-01-28'),(8,1,'Drip Coffee Maker','2024-04-18','2023-12-20 16:25:00','2024-05-10'),(9,1,'Hot Water Kettle','2023-11-15','2023-11-05 09:10:00','2024-01-22'),(10,1,'Toaster Oven','2023-07-10','2023-10-15 12:50:30','2024-01-02'),(11,2,'Espresso Machine','2024-08-15','2023-10-20 09:45:00','2024-01-05'),(12,2,'Coffee Grinder','2023-12-31','2023-11-12 15:20:00','2023-12-20'),(13,2,'Milk Frother','2025-03-10','2023-12-05 11:10:30','2024-03-25'),(14,2,'Cappuccino Maker','2023-09-22','2023-11-18 14:55:00','2024-02-10'),(15,2,'Tea Infuser','2024-12-05','2023-10-28 10:30:00','2023-12-18'),(16,2,'Drip Coffee Maker','2024-04-18','2023-12-20 16:25:00','2024-05-10'),(17,2,'Hot Water Kettle','2023-11-15','2023-11-05 09:10:00','2024-01-22'),(18,2,'Toaster Oven','2023-07-10','2023-10-15 12:50:30','2024-01-02'),(19,3,'Espresso Machine','2024-08-15','2023-10-20 09:45:00','2024-01-05'),(20,3,'Coffee Grinder','2023-12-31','2023-11-12 15:20:00','2023-12-20'),(21,3,'Milk Frother','2025-03-10','2023-12-05 11:10:30','2024-03-25'),(22,3,'Cappuccino Maker','2023-09-22','2023-11-18 14:55:00','2024-02-10'),(23,3,'Tea Infuser','2024-12-05','2023-10-28 10:30:00','2023-12-18'),(24,3,'Commercial Blender','2025-02-28','2023-11-30 08:15:30','2024-02-15'),(25,3,'Juice Extractor','2023-10-15','2023-12-10 13:40:00','2024-01-28'),(26,3,'Drip Coffee Maker','2024-04-18','2023-12-20 16:25:00','2024-05-10'),(27,3,'Hot Water Kettle','2023-11-15','2023-11-05 09:10:00','2024-01-22'),(28,4,'Cappuccino Maker','2023-09-22','2023-11-18 14:55:00','2024-02-10'),(29,4,'Tea Infuser','2024-12-05','2023-10-28 10:30:00','2023-12-18'),(30,4,'Commercial Blender','2025-02-28','2023-11-30 08:15:30','2024-02-15'),(31,4,'Juice Extractor','2023-10-15','2023-12-10 13:40:00','2024-01-28'),(32,4,'Drip Coffee Maker','2024-04-18','2023-12-20 16:25:00','2024-05-10'),(33,4,'Hot Water Kettle','2023-11-15','2023-11-05 09:10:00','2024-01-22'),(34,4,'Toaster Oven','2023-07-10','2023-10-15 12:50:30','2024-01-02'),(35,5,'Espresso Machine','2024-08-15','2023-10-20 09:45:00','2024-01-05'),(36,5,'Coffee Grinder','2023-12-31','2023-11-12 15:20:00','2023-12-20'),(37,5,'Milk Frother','2025-03-10','2023-12-05 11:10:30','2024-03-25'),(38,5,'Cappuccino Maker','2023-09-22','2023-11-18 14:55:00','2024-02-10'),(39,5,'Tea Infuser','2024-12-05','2023-10-28 10:30:00','2023-12-18'),(40,5,'Hot Water Kettle','2023-11-15','2023-11-05 09:10:00','2024-01-22'),(41,5,'Toaster Oven','2023-07-10','2023-10-15 12:50:30','2024-01-02');
/*!40000 ALTER TABLE `appliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint unsigned NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `emp_birthdate` date NOT NULL,
  `emp_email` varchar(35) DEFAULT NULL,
  `emp_phone` char(10) NOT NULL,
  `start_date` date DEFAULT NULL,
  `emp_city` varchar(20) DEFAULT NULL,
  `emp_state` char(2) DEFAULT NULL,
  `emp_is_over_14` tinyint(1) DEFAULT ((timestampdiff(YEAR,`emp_birthdate`,now()) >= 14)),
  PRIMARY KEY (`employee_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'Sally','Davidson','2001-03-02','saldavidson@hotmail.com','8015672314','2020-04-05','Provo','UT',1),(2,1,'Emily','Johnson','1985-08-22','emily.johnson@example.com','8012345678','2019-01-05','Provo','UT',1),(3,1,'Michael','Davis','1993-03-10','michael.davis@example.com','8013456789','2021-04-18','Provo','UT',1),(4,1,'Sophia','Wilson','1988-11-28','sophia.wilson@example.com','8014567890','2018-07-01','Provo','UT',1),(5,1,'Daniel','Miller','1996-06-05','daniel.miller@example.com','8015678901','2022-09-15','Provo','UT',1),(6,1,'Olivia','Taylor','1991-01-17','olivia.taylor@example.com','8016789012','2017-11-22','Provo','UT',1),(7,3,'Ethan','Brown','1987-09-03','ethan.brown@example.com','3121234567','2016-05-20','Chicago','IL',1),(8,3,'Grace','Lee','1990-02-15','grace.lee@example.com','3122345678','2020-10-08','Chicago','IL',1),(9,3,'Liam','Anderson','1995-07-28','liam.anderson@example.com','3123456789','2018-03-12','Chicago','IL',1),(10,3,'Megan','Martin','1983-12-01','megan.martin@example.com','3124567890','2015-09-25','Chicago','IL',1),(11,3,'William','Smith','1992-04-18','william.smith@example.com','3125678901','2019-12-30','Chicago','IL',1),(12,3,'Emma','Taylor','1989-11-05','emma.taylor@example.com','3126789012','2017-02-14','Chicago','IL',1),(13,5,'Daniel','Johnson','1980-06-12','daniel.johnson@example.com','7131234567','2014-08-03','Houston','TX',1),(14,5,'Sophie','Smith','1986-03-25','sophie.smith@example.com','7132345678','2013-11-10','Houston','TX',1),(15,5,'Ryan','Miller','1994-10-08','ryan.miller@example.com','7133456789','2022-01-18','Houston','TX',1),(16,5,'Olivia','Davis','1982-05-20','olivia.davis@example.com','7134567890','2019-04-05','Houston','TX',1),(17,5,'Matthew','Anderson','1997-01-03','matthew.anderson@example.com','7135678901','2016-06-22','Houston','TX',1),(18,5,'Emma','Brown','1984-08-17','emma.brown@example.com','7136789012','2015-09-30','Houston','TX',1),(19,2,'Liam','Martin','1988-02-28','liam.martin@example.com','3031234567','2018-11-15','Denver','CO',1),(20,2,'Grace','Lee','1995-09-15','grace.lee@example.com','3032345678','2017-04-20','Denver','CO',1),(21,2,'Ethan','Wilson','1991-04-02','ethan.wilson@example.com','3033456789','2022-08-03','Denver','CO',1),(22,2,'Sophia','Anderson','1983-11-14','sophia.anderson@example.com','3034567890','2016-01-10','Denver','CO',1),(23,2,'Michael','Taylor','1996-06-27','michael.taylor@example.com','3035678901','2019-03-28','Denver','CO',1),(24,2,'Ava','Martin','1989-12-10','ava.martin@example.com','3036789012','2015-06-05','Denver','CO',1),(25,4,'Emma','Wilson','1993-05-22','emma.wilson@example.com','6171234567','2016-08-18','Boston','MA',1),(26,4,'Ava','Taylor','1985-12-05','ava.taylor@example.com','6172345678','2019-01-23','Boston','MA',1),(27,4,'Ethan','Smith','1990-07-18','ethan.smith@example.com','6173456789','2017-04-30','Boston','MA',1),(28,4,'Mia','Brown','1987-02-03','mia.brown@example.com','6174567890','2020-07-15','Boston','MA',1),(29,4,'William','Martin','1996-09-10','william.martin@example.com','6175678901','2015-10-22','Boston','MA',1),(30,4,'Olivia','Davis','1982-04-15','olivia.davis@example.com','6176789012','2018-02-08','Boston','MA',1),(31,4,'Jonathan','Meyers','2023-05-22','jonathan.meyers@example.com','6171234123','2016-08-18','Boston','MA',0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ingredient_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Mango Smoothie Mix Packet'),(2,'Espresso Beans'),(3,'Green Tea Bags'),(4,'Chocolate Syrup'),(5,'Strawberry Banana Smoothie Mix Packet'),(6,'Cinnamon Dolce Syrup'),(7,'Pineapple Coconut Smoothie Mix Packet'),(8,'Blueberry Lavender Lemonade Mix'),(9,'Hazelnut Hot Chocolate Mix'),(10,'Avocado Spread'),(11,'Fresh Mozzarella'),(12,'Eggs'),(13,'Quinoa'),(14,'Black Beans (Canned)'),(15,'Chocolate Chip Cookie Dough Balls'),(16,'Bucket of Pasta Salad'),(17,'Caramel Syrup'),(18,'Lemonade Mix'),(19,'Milk'),(20,'Yogurt'),(21,'Fresh Basil'),(22,'Coconut Milk'),(23,'Blueberries'),(24,'Lavender Syrup'),(25,'Hazelnut Spread'),(26,'Bread'),(30,'Taco Shells');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `ingredient_id` tinyint unsigned NOT NULL,
  `store_id` smallint unsigned DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `store_id` (`store_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`ingredient_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,2,3,'2023-11-17'),(2,1,1,'2023-10-15'),(3,3,2,'2023-12-05'),(4,4,1,'2024-01-20'),(5,2,4,'2023-11-30'),(6,5,3,'2023-10-25'),(7,1,5,'2023-11-10'),(8,3,4,'2023-12-15'),(9,4,2,'2024-02-08'),(10,2,5,'2023-12-01'),(11,5,1,'2023-10-31');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalty_member`
--

DROP TABLE IF EXISTS `loyalty_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty_member` (
  `member_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `mem_first_name` varchar(15) NOT NULL,
  `mem_last_name` varchar(20) NOT NULL,
  `mem_email` varchar(35) NOT NULL,
  `mem_phone` char(10) NOT NULL,
  `mem_birthdate` date NOT NULL,
  `loyalty_credit` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalty_member`
--

LOCK TABLES `loyalty_member` WRITE;
/*!40000 ALTER TABLE `loyalty_member` DISABLE KEYS */;
INSERT INTO `loyalty_member` VALUES (1,'Johnny','Doeson','johndoe@mail.com','1234567890','1990-01-01',100),(2,'Marton','Kovacs','marton@mail.com','9876543210','1985-05-15',50),(3,'Agnieszka','Nowak','agnieszka@mail.com','5556667777','1992-09-20',75),(4,'Andrei','Popescu','andrei@mail.com','4443332222','1988-03-10',120),(5,'Zsuzsanna','Nagy','zsuzsanna@mail.com','1112223333','1977-11-28',90),(6,'Piotr','Kowalski','piotr@mail.com','9998887777','1995-07-03',60),(7,'Elena','Ionescu','elena@mail.com','3334445555','1983-12-12',80),(8,'Gabor','Fekete','gabor@mail.com','7778889999','1980-06-18',110),(9,'Katarzyna','Wojcik','katarzyna@mail.com','6665554444','1998-04-25',95),(10,'Vlad','Dumitru','vlad@mail.com','2223334444','1982-08-08',70),(11,'Attila','Varga','attila@mail.com','8889990000','1996-09-05',85),(12,'Aleksandra','Zajac','aleksandra@mail.com','1231231234','1993-02-15',130),(13,'Dragos','Cozma','dragos@mail.com','4564564567','1975-10-30',110),(14,'Zoltan','Molnar','zoltan@mail.com','7897897890','1991-06-22',75),(15,'Patryk','Lewandowski','patryk@mail.com','2342342345','1986-04-03',100),(16,'Irina','Dumitrache','irina@mail.com','3453453456','1978-09-14',120),(17,'Bela','Kiss','bela@mail.com','5675675678','1997-12-01',90),(18,'Aneta','Sikora','aneta@mail.com','8768768765','1981-01-08',50),(19,'Alexandru','Enescu','alexandru@mail.com','6546546543','1989-07-12',65),(20,'Mihaly','Papp','mihaly@mail.com','9879879876','1994-11-19',110);
/*!40000 ALTER TABLE `loyalty_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_header`
--

DROP TABLE IF EXISTS `order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_header` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `subtotal` decimal(5,2) NOT NULL,
  `tax` decimal(5,2) NOT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `total` decimal(5,2) NOT NULL,
  `member_id` smallint unsigned DEFAULT NULL,
  `order_date` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `order_header_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `loyalty_member` (`member_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_header_chk_1` CHECK ((`total` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_header`
--

LOCK TABLES `order_header` WRITE;
/*!40000 ALTER TABLE `order_header` DISABLE KEYS */;
INSERT INTO `order_header` VALUES (1,50.00,5.00,10.00,45.00,1,'2023-11-30 00:00:00'),(2,75.50,7.00,15.75,66.75,2,'2022-10-23 00:00:00'),(3,120.00,10.50,20.00,109.50,3,'2000-01-01 00:00:00'),(4,30.25,3.50,5.25,28.50,4,'2005-03-05 00:00:00'),(5,90.00,8.00,18.00,80.00,5,'2003-07-04 00:00:00');
/*!40000 ALTER TABLE `order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line` (
  `order_id` int unsigned NOT NULL,
  `product_id` smallint unsigned NOT NULL,
  `quantity` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_header` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_line_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `order_line_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1,1,5),(1,2,3),(1,3,2),(1,4,4),(1,5,1),(1,6,2),(1,7,3),(1,8,1),(1,9,4),(1,10,2),(1,11,3),(2,1,2),(2,3,1),(2,5,3),(2,7,2),(2,9,4),(2,11,1),(2,13,3),(3,2,4),(3,4,2),(3,6,1),(3,8,3),(3,10,2),(3,12,4),(3,14,1),(3,16,3),(4,1,2),(4,3,1),(4,5,3),(4,7,2),(4,9,4),(4,11,1),(4,13,3),(5,2,4),(5,4,2),(5,6,1),(5,8,3),(5,10,2),(5,12,4),(5,14,1),(5,16,3);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` tinyint unsigned NOT NULL,
  `product_name` varchar(30) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `product_chk_1` CHECK ((`price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Mango Smoothie',5.99),(2,2,'Caramel Macchiato',4.99),(3,3,'Green Tea Lemonade',3.99),(4,4,'Iced Mocha',4.99),(5,5,'Strawberry Banana Smoothie',5.99),(6,6,'Cinnamon Dolce Latte',4.99),(7,7,'Pineapple Coconut Smoothie',5.99),(8,8,'Blueberry Lavender Lemonade',4.99),(9,9,'Hazelnut Hot Chocolate',3.99),(10,10,'Avocado Toast',6.99),(11,11,'Caprese Salad',5.99),(12,12,'Spinach and Feta Omelette',4.99),(13,13,'Quinoa Salad',6.99),(14,14,'Vegetarian Tacos',3.99),(15,15,'Chocolate Chip Cookies',1.99),(16,16,'Bucket of Cold Pasta Salad',19.99);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `recipe_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(30) DEFAULT NULL,
  `amount` tinyint unsigned DEFAULT NULL,
  `instruction` varchar(10000) DEFAULT NULL,
  `is_drink` tinyint(1) NOT NULL,
  PRIMARY KEY (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'Mango Smoothie',2,'Blend Water and Mango Smoothie.',1),(2,'Caramel Macchiato',1,'Brew strong espresso. Steam milk and add caramel syrup. Pour milk over espresso.',1),(3,'Green Tea Lemonade',1,'Brew green tea and mix with freshly squeezed lemonade. Serve over ice.',1),(4,'Iced Mocha',1,'Mix chocolate syrup with cold milk. Add espresso and ice. Stir well.',1),(5,'Strawberry Banana Smoothie',2,'Blend together strawberries, banana, yogurt, and ice.',1),(6,'Cinnamon Dolce Latte',1,'Brew espresso. Steam milk with cinnamon dolce syrup. Pour milk over espresso.',1),(7,'Pineapple Coconut Smoothie',2,'Blend pineapple, coconut milk, and ice until smooth.',1),(8,'Blueberry Lavender Lemonade',1,'Combine blueberries, lavender syrup, and freshly squeezed lemonade. Serve over ice.',1),(9,'Hazelnut Hot Chocolate',1,'Heat milk and mix with hazelnut spread. Add cocoa powder and stir until smooth.',1),(10,'Avocado Toast',2,'Toast bread and spread mashed avocado on top. Sprinkle with salt and pepper.',0),(11,'Caprese Salad',1,'Layer sliced tomatoes, fresh mozzarella, and basil leaves. Drizzle with balsamic glaze.',0),(12,'Spinach and Feta Omelette',3,'Whisk eggs and pour into dish. Add spinach and feta. Bake in oven for two minutes.',0),(13,'Quinoa Salad',2,'Cook quinoa and mix with diced vegetables, olive oil, and lemon juice.',0),(14,'Vegetarian Tacos',3,'Fill taco shells with seasoned black beans, corn, lettuce, and salsa.',0),(15,'Chocolate Chip Cookies',24,'Flatten cookie dough ball, and cook in oven for 5 minutes.',0),(16,'Bucket of Cold Pasta Salad',1,'Take bucket from refrigerator and serve cold.',0);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_appliance`
--

DROP TABLE IF EXISTS `recipe_appliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_appliance` (
  `recipe_id` tinyint unsigned NOT NULL,
  `appliance_type` varchar(20) NOT NULL,
  PRIMARY KEY (`recipe_id`,`appliance_type`),
  CONSTRAINT `recipe_appliance_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_appliance`
--

LOCK TABLES `recipe_appliance` WRITE;
/*!40000 ALTER TABLE `recipe_appliance` DISABLE KEYS */;
INSERT INTO `recipe_appliance` VALUES (1,'Commercial Blender'),(2,'Espresso Machine'),(2,'Milk Frother'),(3,'Tea Infuser'),(4,'Espresso Machine'),(5,'Commercial Blender'),(6,'Espresso Machine'),(6,'Milk Frother'),(7,'Commercial Blender'),(8,'Juice Extractor'),(9,'Hot Water Kettle'),(10,'Milk Frother'),(11,'Toaster Oven'),(13,'Toaster Oven'),(15,'Toaster Oven'),(16,'Toaster Oven');
/*!40000 ALTER TABLE `recipe_appliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredient`
--

DROP TABLE IF EXISTS `recipe_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredient` (
  `recipe_id` tinyint unsigned NOT NULL,
  `ingredient_id` tinyint unsigned NOT NULL,
  `ingredient_amount` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`recipe_id`,`ingredient_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `recipe_ingredient_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recipe_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`ingredient_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredient`
--

LOCK TABLES `recipe_ingredient` WRITE;
/*!40000 ALTER TABLE `recipe_ingredient` DISABLE KEYS */;
INSERT INTO `recipe_ingredient` VALUES (1,1,1),(2,2,1),(2,19,1),(3,3,1),(3,18,1),(4,2,1),(4,4,1),(4,19,1),(5,5,1),(6,2,1),(6,6,1),(6,19,1),(7,7,1),(8,8,1),(8,23,1),(9,9,1),(9,25,1),(10,10,1),(10,26,2),(11,11,1),(12,12,3),(13,13,2),(14,14,3),(15,15,24),(16,16,1);
/*!40000 ALTER TABLE `recipe_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `store_phone` char(10) DEFAULT NULL,
  `store_city` varchar(20) NOT NULL,
  `store_state` char(2) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'8011234567','Provo','UT'),(2,'4443332222','Denver','CO'),(3,'5551112222','Chicago','IL'),(4,'2223334444','Boston','MA'),(5,'3332221111','Houston','TX');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04 16:31:39
