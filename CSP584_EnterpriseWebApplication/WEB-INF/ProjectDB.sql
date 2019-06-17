CREATE DATABASE  IF NOT EXISTS `projectdatabase` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `projectdatabase`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: projectdatabase
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `checkout`
--

DROP TABLE IF EXISTS `checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout` (
  `userName` varchar(45) NOT NULL,
  `userEmail` varchar(45) NOT NULL,
  `userPhone` varchar(45) NOT NULL,
  `delivery` varchar(45) NOT NULL,
  `cardType` varchar(45) NOT NULL,
  `cardNumber` varchar(45) NOT NULL,
  `cardDate` varchar(45) NOT NULL,
  `cardCVV` varchar(45) NOT NULL,
  `save` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout`
--

LOCK TABLES `checkout` WRITE;
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
INSERT INTO `checkout` VALUES ('user1','user1@gmail.com','123','HomeDelivery','Visa','123','22/12','123','Yes'),('vinay','vinayjagannath@gmail.com','123','Pickup','Visa','123','12/17','708','Yes'),('user','user1@gmail.com','123','Pickup','Visa','123','12/17','234','Yes');
/*!40000 ALTER TABLE `checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `orderid` int(10) NOT NULL,
  `restaurantid` int(10) NOT NULL,
  `menuitem` varchar(45) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` float NOT NULL,
  KEY `orderid_idx` (`orderid`),
  KEY `hotelid_idx` (`restaurantid`),
  CONSTRAINT `htid` FOREIGN KEY (`restaurantid`) REFERENCES `restaurant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `oid` FOREIGN KEY (`orderid`) REFERENCES `userorder` (`orderid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,1,'Veg Biryani',2,20),(1,1,'Mango Lassi',2,10),(2,2,'Pasta',1,12),(2,3,'Chicken Soup',1,8),(2,1,'Rasmalai',2,14),(210383063,1,'Paneer Tikka',1,9);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration` (
  `userid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `usertype` varchar(30) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES ('owner10@gmail.com','owner10','owner10','Manager'),('owner11@gmail.com','owner11','owner11','Manager'),('owner1@gmail.com','owner1','owner1','Manager'),('owner2@gmail.com','owner2','owner2','Manager'),('owner3@gmail.com','owner3','owner3','Manager'),('owner4@gmail.com','owner4','owner4','Manager'),('owner5@gmail.com','owner5','owner5','Manager'),('owner6@gmail.com','owner6','owner6','Manager'),('owner7@gmail.com','owner7','owner7','Manager'),('owner8@gmail.com','owner8','owner8','Manager'),('owner9@gmail.com','owner9','owner9','Manager'),('user1@gmail.com','user1','user1','Customer'),('user2@gmail.com','user2','user2','Customer'),('user3@gmail.com','user3','user3','Customer'),('user4@gmail.com','user4','user4','Customer'),('vinayjagannath@gmail.com','vinay','vinay','Customer');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `restaurantid` int(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `timeofday` varchar(45) NOT NULL,
  `count` int(1) NOT NULL,
  PRIMARY KEY (`restaurantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'User A','2017-12-03','Lunch',2);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `id` int(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `owneremail` varchar(45) NOT NULL,
  `cuisine` varchar(45) NOT NULL,
  `serves` bit(4) NOT NULL,
  `opendays` bit(7) NOT NULL,
  `bio` varchar(250) DEFAULT NULL,
  `image` varchar(45) NOT NULL,
  `maxoccupancy` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owneremailid_idx` (`owneremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Great Indian Cuisine','Chicago','owner1@gmail.com','Indian','','}','Large selection of dishes from North & South India served in a simple setting with a lunch buffet.','gic.jpg',50),(2,'Macroni Grill','SanJose','owner2@gmail.com','Italian','','~','Lively Italian chain with an open kitchen, known for small plates, pizzas, pastas & wine.','mg.jpg',80),(3,'Chung\'s Kitchen','Dallas','owner3@gmail.com','Chinese','','','No-frills Chinese restaurant offering classic vegetarian, meat and noodle choices.','ck.jpg',40),(4,'Beijing Bites','Chicago','owner4@gmail.com','Chinese','','{','Popular Indianised Chinese and Thai dishes from a simple casual dining restaurant chain','bb.png',10),(5,'Daffodil','SanJose','owner5@gmail.com','Indian','','x','Sustainable Asian-fusion eats in an elegant space in the eco-friendly Orchard Hotel.','dd.jpg',60),(6,'Chipotle','SantaClara','owner6@gmail.com','Mexican','','','Fast-food chain offering Mexican fare, including design-your-own burritos, tacos & bowls.','chip.png',100),(7,'Ivy Garden','Virginia','owner7@gmail.com','Italian','','y','Refined locavore American fare served in an early 19th-century house with an Old Virginia feel.','ig.jpg',50),(8,'Anjappar','SantaClara','owner8@gmail.com','Indian','','}','Part of a global chain that originated in Chennai serving classic Indian dishes.','anjappar.jpg',80),(9,'DishnDash','Dallas','owner9@gmail.com','Mediterranean','','x','This fast-food spot serves Middle Eastern fare with an eye towards healthy, sustainable ingredients.','dnd.jpg',70),(10,'Falafel Bites','Virginia','owner10@gmail.com','Mediterranean','','y','This spot serves Lebanese fare with Greek, Armenian & Turkish accents in a no-frills setting.','ffb.jpg',60),(11,'Giorgio','SanJose','owner11@gmail.com','Italian','','','Casual, family-owned Italian joint dishing up pizza, pasta & other comforting standards.','gip.png',40);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribedusers`
--

DROP TABLE IF EXISTS `subscribedusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribedusers` (
  `userid` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribedusers`
--

LOCK TABLES `subscribedusers` WRITE;
/*!40000 ALTER TABLE `subscribedusers` DISABLE KEYS */;
INSERT INTO `subscribedusers` VALUES ('vinayjagannath@gmail.com');
/*!40000 ALTER TABLE `subscribedusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userorder`
--

DROP TABLE IF EXISTS `userorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userorder` (
  `orderid` int(10) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `orderdate` varchar(45) NOT NULL,
  `deliveryaddress` varchar(45) NOT NULL,
  `deliverytime` varchar(45) NOT NULL,
  `deliverytype` varchar(45) NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `emailid_idx` (`userid`),
  CONSTRAINT `emailid` FOREIGN KEY (`userid`) REFERENCES `registration` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userorder`
--

LOCK TABLES `userorder` WRITE;
/*!40000 ALTER TABLE `userorder` DISABLE KEYS */;
INSERT INTO `userorder` VALUES (1,'user1@gmail.com','Fri Nov 10 02:17:03 PST 2017','1501 California Cir','Fri Nov 10 03:00:00 PST 2017','Pickup'),(2,'user1@gmail.com','Fri Nov 12 01:15:00 PST 2017','1501 California Cir','Fri Nov 12 01:45:00 PST 2017','HomeDelivery'),(210383063,'user1@gmail.com','Sun Dec 03 02:33:09 PST 2017','2901 S king Dr','Sun Dec 17 02:33:09 PST 2017','HomeDelivery');
/*!40000 ALTER TABLE `userorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-03  3:15:42
