-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.17.10.1

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `UserID` int(11) NOT NULL,
  `Street` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `fk_Address_Users1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Booking` (
  `BookingID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `NumTickets` int(11) DEFAULT NULL,
  `SubTotal` mediumtext,
  `Tax` mediumtext,
  `PromoCode` varchar(45) NOT NULL,
  `GrandTotal` varchar(45) DEFAULT NULL,
  `BillableTo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `fk_Booking_Users1_idx` (`UserID`),
  KEY `fk_Booking_Promotions1_idx` (`PromoCode`),
  CONSTRAINT `fk_Booking_Promotions1` FOREIGN KEY (`PromoCode`) REFERENCES `Promotions` (`Promo ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Users1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Movie` (
  `Title` varchar(45) DEFAULT NULL,
  `Poster` varchar(600) DEFAULT NULL,
  `IsShowing` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Genre` varchar(45) DEFAULT NULL,
  `Director` varchar(45) DEFAULT NULL,
  `Producer` varchar(45) DEFAULT NULL,
  `Rating` varchar(45) DEFAULT NULL,
  `Trailer` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES ('Black Panther','https://www.google.com/imgres?imgurl=http%3A%2F%2Fcdn.collider.com%2Fwp-content%2Fuploads%2F2017%2F11%2Fblack-panther-poster.jpg&imgrefurl=http%3A%2F%2Fcollider.com%2Fblack-panther-character-posters-chadwick-boseman-lupita-nyongo%2F&docid=imIBEYFrtwq8EM&tbnid=vbxoK3WYmpQ7mM%3A&vet=10ahUKEwi_p_v-h9TaAhWkneAKHc48DWYQMwi0AigAMAA..i&w=823&h=1200&bih=650&biw=1307&q=black%20panther%20poster&ved=0ahUKEwi_p_v-h9TaAhWkneAKHc48DWYQMwi0AigAMAA&iact=mrc&uact=8',1,1,'Action','Ryan Coogler','Kevin Feige','5 stars','https://www.youtube.com/watch?v=xjDjIWPwcPU'),('A Quiet Place','https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.impawards.com%2F2018%2Fposters%2Fquiet_place_xlg.jpg&imgrefurl=http%3A%2F%2Fwww.impawards.com%2F2018%2Fquiet_place.html&docid=P4PWLitKrKFvRM&tbnid=3COv7aiX7DM2aM%3A&vet=10ahUKEwjjl_aLiNTaAhUSON8KHc4wAxQQMwgwKAAwAA..i&w=1013&h=1500&bih=650&biw=1307&q=a%20quiet%20place%20poster&ved=0ahUKEwjjl_aLiNTaAhUSON8KHc4wAxQQMwgwKAAwAA&iact=mrc&uact=8',1,2,'Drama','John Krasinski','Michael Bay','5 stars','https://www.youtube.com/watch?v=WR7cc5t7tv8'),('Ready Player One','https://www.google.com/imgres?imgurl=https%3A%2F%2Fd13ezvd6yrslxm.cloudfront.net%2Fwp%2Fwp-content%2Fimages%2Freadyplayerone-tributeposter-highres-backtothefuture.jpg&imgrefurl=http%3A%2F%2Fwww.slashfilm.com%2Ffantastic-ready-player-one-posters%2F&docid=3dXC-dYfla9dnM&tbnid=km7cN6UqlAx-fM%3A&vet=10ahUKEwj397uSiNTaAhUCneAKHUDBBcAQMwiAASgBMAE..i&w=1405&h=2048&bih=650&biw=1307&q=ready%20player%20one%20poster&ved=0ahUKEwj397uSiNTaAhUCneAKHUDBBcAQMwiAASgBMAE&iact=mrc&uact=8',1,3,'Action','Ernest Cline','Random House','5 stars','https://www.youtube.com/watch?v=ixWL1BWi44U'),('Pacific Rim: Uprising','https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.impawards.com%2F2018%2Fposters%2Fpacific_rim_uprising_ver10_xlg.jpg&imgrefurl=http%3A%2F%2Fwww.impawards.com%2F2018%2Fpacific_rim_uprising_ver10.html&docid=2b8unJ02WQUyEM&tbnid=mUXgVfY2VD3aGM%3A&vet=10ahUKEwj98df7iNTaAhWNNd8KHY0eAWUQMwhhKAAwAA..i&w=947&h=1500&bih=650&biw=1307&q=pacific%20rim%20uprising%20poster&ved=0ahUKEwj98df7iNTaAhWNNd8KHY0eAWUQMwhhKAAwAA&iact=mrc&uact=8',1,4,'Action','Stephen DeKnight','John Boyega','5 stars','https://www.youtube.com/watch?v=_EhiLLOhVis'),('Blockers','https://teaser-trailer.com/blockers-movie-poster/',1,5,'Comedy','Kay Cannon','Seth Rogen','5 stars ','https://www.youtube.com/watch?v=uMDVa4yoCWw'),('Infinity War','https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.impawards.com%2F2018%2Fposters%2Favengers_infinity_war_ver2.jpg&imgrefurl=http%3A%2F%2Fwww.impawards.com%2F2018%2Favengers_infinity_war_ver2.html&docid=eDENvDSJD7RPsM&tbnid=viJ7el6Q0h1I1M%3A&vet=10ahUKEwidjLqMidTaAhVlmuAKHd64DHMQMwjsASgAMAA..i&w=509&h=755&bih=650&biw=1307&q=infinity%20war%20poster&ved=0ahUKEwidjLqMidTaAhVlmuAKHd64DHMQMwjsASgAMAA&iact=mrc&uact=8',0,6,'Action','Anthony Russo','Kevin Feige','5 stars ','https://www.youtube.com/watch?v=6ZfuNTqbHE8');
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Price`
--

DROP TABLE IF EXISTS `Price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Price` (
  `Type` int(11) NOT NULL,
  `AgeRange` varchar(45) DEFAULT NULL,
  `Amount` mediumtext,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Price`
--

LOCK TABLES `Price` WRITE;
/*!40000 ALTER TABLE `Price` DISABLE KEYS */;
/*!40000 ALTER TABLE `Price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Promotions`
--

DROP TABLE IF EXISTS `Promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Promotions` (
  `Promo ID` varchar(45) NOT NULL,
  `PercentageOff` mediumtext,
  `ExpirationDate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Promo ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promotions`
--

LOCK TABLES `Promotions` WRITE;
/*!40000 ALTER TABLE `Promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seat`
--

DROP TABLE IF EXISTS `Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seat` (
  `SeatID` int(11) NOT NULL AUTO_INCREMENT,
  `(Row,Col)` varchar(45) DEFAULT NULL,
  `HallNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`SeatID`),
  KEY `fk_Seat_Theater Hall1_idx` (`HallNumber`),
  CONSTRAINT `fk_Seat_Theater Hall1` FOREIGN KEY (`HallNumber`) REFERENCES `Theater Hall` (`HallNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seat`
--

LOCK TABLES `Seat` WRITE;
/*!40000 ALTER TABLE `Seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeatMap`
--

DROP TABLE IF EXISTS `SeatMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeatMap` (
  `ShowtimeID` int(11) NOT NULL AUTO_INCREMENT,
  `A1` int(11) NOT NULL DEFAULT '0',
  `A2` int(11) NOT NULL DEFAULT '0',
  `A3` int(11) NOT NULL DEFAULT '0',
  `A4` int(11) NOT NULL DEFAULT '0',
  `A5` int(11) NOT NULL DEFAULT '0',
  `A6` int(11) NOT NULL DEFAULT '0',
  `A7` int(11) NOT NULL DEFAULT '0',
  `B1` int(11) NOT NULL DEFAULT '0',
  `B2` int(11) NOT NULL DEFAULT '0',
  `B3` int(11) NOT NULL DEFAULT '0',
  `B4` int(11) NOT NULL DEFAULT '0',
  `B5` int(11) NOT NULL DEFAULT '0',
  `B6` int(11) NOT NULL DEFAULT '0',
  `B7` int(11) NOT NULL DEFAULT '0',
  `C1` int(11) NOT NULL DEFAULT '0',
  `C2` int(11) NOT NULL DEFAULT '0',
  `C3` int(11) NOT NULL DEFAULT '0',
  `C4` int(11) NOT NULL DEFAULT '0',
  `C5` int(11) NOT NULL DEFAULT '0',
  `C6` int(11) NOT NULL DEFAULT '0',
  `C7` int(11) NOT NULL DEFAULT '0',
  `D1` int(11) NOT NULL DEFAULT '0',
  `D2` int(11) NOT NULL DEFAULT '0',
  `D3` int(11) NOT NULL DEFAULT '0',
  `D4` int(11) NOT NULL DEFAULT '0',
  `D5` int(11) NOT NULL DEFAULT '0',
  `D6` int(11) NOT NULL DEFAULT '0',
  `D7` int(11) NOT NULL DEFAULT '0',
  `E1` int(11) NOT NULL DEFAULT '0',
  `E2` int(11) NOT NULL DEFAULT '0',
  `E3` int(11) NOT NULL DEFAULT '0',
  `E4` int(11) NOT NULL DEFAULT '0',
  `E5` int(11) NOT NULL DEFAULT '0',
  `E6` int(11) NOT NULL DEFAULT '0',
  `E7` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ShowtimeID`),
  CONSTRAINT `fk_SeatMap_Showtime1` FOREIGN KEY (`ShowtimeID`) REFERENCES `Showtime` (`ShowTimeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeatMap`
--

LOCK TABLES `SeatMap` WRITE;
/*!40000 ALTER TABLE `SeatMap` DISABLE KEYS */;
INSERT INTO `SeatMap` VALUES (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `SeatMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Showtime`
--

DROP TABLE IF EXISTS `Showtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Showtime` (
  `Time` varchar(10) DEFAULT NULL,
  `Theater` int(11) DEFAULT NULL,
  `MovieID` int(11) DEFAULT NULL,
  `ShowTimeID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ShowTimeID`),
  KEY `fk_Showtime_Theater Hall1_idx` (`Theater`),
  KEY `fk_Showtime_Movie1_idx` (`MovieID`),
  CONSTRAINT `fk_Showtime_Movie1` FOREIGN KEY (`MovieID`) REFERENCES `Movie` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Showtime_Theater Hall1` FOREIGN KEY (`Theater`) REFERENCES `Theater Hall` (`HallNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Showtime`
--

LOCK TABLES `Showtime` WRITE;
/*!40000 ALTER TABLE `Showtime` DISABLE KEYS */;
INSERT INTO `Showtime` VALUES ('1:00',1,1,1),('3:00',1,2,2),('1:00',2,3,3),('3:00',2,4,4),('5:00',1,5,5),('5:00',2,1,6);
/*!40000 ALTER TABLE `Showtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Theater Hall`
--

DROP TABLE IF EXISTS `Theater Hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Theater Hall` (
  `HallNumber` int(11) NOT NULL AUTO_INCREMENT,
  `NumSeats` int(11) DEFAULT NULL,
  PRIMARY KEY (`HallNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Theater Hall`
--

LOCK TABLES `Theater Hall` WRITE;
/*!40000 ALTER TABLE `Theater Hall` DISABLE KEYS */;
INSERT INTO `Theater Hall` VALUES (1,20),(2,20);
/*!40000 ALTER TABLE `Theater Hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ticket` (
  `BookingID` int(11) NOT NULL,
  `TicketNum` int(11) NOT NULL AUTO_INCREMENT,
  `MovieID` int(11) DEFAULT NULL,
  `SeatID` int(11) DEFAULT NULL,
  `TicketType` int(11) DEFAULT NULL,
  `ShowTimeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TicketNum`),
  KEY `fk_Ticket_Price1_idx` (`TicketType`),
  KEY `fk_Ticket_Movie1_idx` (`MovieID`),
  KEY `fk_Ticket_Showtime1_idx` (`ShowTimeID`),
  CONSTRAINT `fk_Ticket_Movie1` FOREIGN KEY (`MovieID`) REFERENCES `Movie` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Price1` FOREIGN KEY (`TicketType`) REFERENCES `Price` (`Type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Showtime1` FOREIGN KEY (`ShowTimeID`) REFERENCES `Showtime` (`ShowTimeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserTypes`
--

DROP TABLE IF EXISTS `UserTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserTypes` (
  `TypeID` int(11) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserTypes`
--

LOCK TABLES `UserTypes` WRITE;
/*!40000 ALTER TABLE `UserTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `EmailAddr` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `Suspended` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_Users_1_idx` (`Type`),
  CONSTRAINT `fk_Users_1` FOREIGN KEY (`Type`) REFERENCES `UserTypes` (`TypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-24 19:45:05
