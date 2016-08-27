CREATE DATABASE  IF NOT EXISTS `blotterdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `blotterdb`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: blotterdb
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `industry`
--

DROP TABLE IF EXISTS `industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industry` (
  `IndustryID` int(11) NOT NULL,
  `IndustryName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IndustryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry`
--

LOCK TABLES `industry` WRITE;
/*!40000 ALTER TABLE `industry` DISABLE KEYS */;
/*!40000 ALTER TABLE `industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industrynotes`
--

DROP TABLE IF EXISTS `industrynotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industrynotes` (
  `Note` varchar(400) DEFAULT NULL,
  `TimeStamp` datetime NOT NULL,
  `Industry_IndustryID` int(11) NOT NULL,
  `user_userID` int(11) NOT NULL,
  PRIMARY KEY (`TimeStamp`),
  KEY `fk_SubjectNotes_Industry1_idx` (`Industry_IndustryID`),
  KEY `fk_IndustryNotes_user1_idx` (`user_userID`),
  CONSTRAINT `fk_IndustryNotes_user1` FOREIGN KEY (`user_userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SubjectNotes_Industry1` FOREIGN KEY (`Industry_IndustryID`) REFERENCES `industry` (`IndustryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industrynotes`
--

LOCK TABLES `industrynotes` WRITE;
/*!40000 ALTER TABLE `industrynotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `industrynotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProductID` varchar(45) NOT NULL,
  `ProductType` enum('Options','Future','Swap','Stock') NOT NULL DEFAULT 'Stock',
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade`
--

DROP TABLE IF EXISTS `trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade` (
  `TradeID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `TradeType` varchar(45) DEFAULT NULL,
  `Industry_IndustryID` int(11) NOT NULL,
  `user_userID` int(11) NOT NULL,
  `Client Name` varchar(45) DEFAULT NULL,
  `Status` enum('Booked','Confirmed','Cancelled') DEFAULT 'Booked',
  `Flow` enum('Electronic','Vioce') DEFAULT 'Electronic',
  `Product_ProductID` varchar(45) NOT NULL,
  `BookedTimeStamp` datetime DEFAULT NULL,
  `ConfirmedTimeStamp` datetime DEFAULT NULL,
  `CancelledTimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`TradeID`),
  KEY `fk_Blotter_Industry_idx` (`Industry_IndustryID`),
  KEY `fk_Trade_user1_idx` (`user_userID`),
  KEY `fk_Trade_Product1_idx` (`Product_ProductID`),
  CONSTRAINT `fk_Blotter_Industry` FOREIGN KEY (`Industry_IndustryID`) REFERENCES `industry` (`IndustryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trade_Product1` FOREIGN KEY (`Product_ProductID`) REFERENCES `product` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trade_user1` FOREIGN KEY (`user_userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade`
--

LOCK TABLES `trade` WRITE;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade notes`
--

DROP TABLE IF EXISTS `trade notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade notes` (
  `TimeStamp` datetime NOT NULL,
  `Note` varchar(400) DEFAULT NULL,
  `Trade_TradeID` int(11) NOT NULL,
  `user_userID` int(11) NOT NULL,
  PRIMARY KEY (`TimeStamp`),
  KEY `fk_Trade Notes_Trade1_idx` (`Trade_TradeID`),
  KEY `fk_Trade Notes_user1_idx` (`user_userID`),
  CONSTRAINT `fk_Trade Notes_Trade1` FOREIGN KEY (`Trade_TradeID`) REFERENCES `trade` (`TradeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trade Notes_user1` FOREIGN KEY (`user_userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade notes`
--

LOCK TABLES `trade notes` WRITE;
/*!40000 ALTER TABLE `trade notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `trade notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(65) NOT NULL,
  `email` varchar(65) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `Password` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `fk_user_Industry1_idx` (`GroupID`),
  CONSTRAINT `fk_user_Industry1` FOREIGN KEY (`GroupID`) REFERENCES `industry` (`IndustryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useranalysisnotes`
--

DROP TABLE IF EXISTS `useranalysisnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useranalysisnotes` (
  `Note` varchar(400) DEFAULT NULL,
  `TimeStamp` datetime NOT NULL,
  `user_userID` int(11) NOT NULL,
  PRIMARY KEY (`TimeStamp`),
  KEY `fk_UserAnalysisNotes_user1_idx` (`user_userID`),
  CONSTRAINT `fk_UserAnalysisNotes_user1` FOREIGN KEY (`user_userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useranalysisnotes`
--

LOCK TABLES `useranalysisnotes` WRITE;
/*!40000 ALTER TABLE `useranalysisnotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `useranalysisnotes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-27 12:57:30
