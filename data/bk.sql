-- MySQL dump 10.13  Distrib 5.6.25, for osx10.10 (x86_64)
--
-- Host: localhost    Database: php_test
-- ------------------------------------------------------
-- Server version	5.6.25

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
-- Table structure for table `user_rank`
--

DROP TABLE IF EXISTS `user_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rank`
--

LOCK TABLES `user_rank` WRITE;
/*!40000 ALTER TABLE `user_rank` DISABLE KEYS */;
INSERT INTO `user_rank` VALUES (1,'mojombo',NULL),(2,'defunkt',NULL),(3,'pjhyett',3),(4,'wycats',NULL),(5,'ezmobius',NULL),(6,'ivey',NULL),(7,'evanphx',NULL),(8,'vanpelt',NULL),(9,'wayneeseguin',NULL),(10,'brynary',NULL),(11,'kevinclark',NULL),(12,'technoweenie',NULL),(13,'macournoyer',NULL),(14,'takeo',NULL),(15,'Caged',NULL),(16,'topfunky',NULL),(17,'anotherjesse',NULL),(18,'roland',NULL),(19,'lukas',NULL),(20,'fanvsfan',NULL),(21,'tomtt',NULL),(22,'railsjitsu',NULL),(23,'nitay',NULL),(24,'kevwil',NULL),(25,'KirinDave',NULL),(26,'jamesgolick',NULL),(27,'atmos',NULL),(28,'errfree',NULL),(29,'mojodna',NULL),(30,'bmizerany',NULL),(31,'jnewland',NULL),(32,'joshknowles',NULL),(33,'hornbeck',NULL),(34,'jwhitmire',NULL),(35,'elbowdonkey',NULL),(36,'reinh',NULL),(37,'timocratic',NULL),(38,'bs',NULL),(39,'rsanheim',NULL),(40,'schacon',NULL),(41,'uggedal',NULL),(42,'bruce',NULL),(43,'sam',NULL),(44,'mmower',NULL),(45,'abhay',NULL),(46,'rabble',NULL),(47,'benburkert',NULL),(48,'indirect',NULL),(49,'fearoffish',NULL),(50,'ry',NULL);
/*!40000 ALTER TABLE `user_rank` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-16  5:39:42
