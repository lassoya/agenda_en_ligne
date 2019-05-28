-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: agenda_en_ligne
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.9-MariaDB

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
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rue` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_adresse_client_idx` (`id_client`),
  CONSTRAINT `fk_adresse_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,'TEST','7782','17','MOUSCRON',1);
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` int(1) DEFAULT NULL,
  `date_de_naissance` date DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'ALBERT','TOTO 23',1,'2000-01-01','mauric@gmail.com','333333','0000-00-00 00:00:00'),(2,'Maurice2','Roger',1,'2000-01-01','mauric1@gmail.com','999999','0000-00-00 00:00:00'),(3,'Maurice3','Roger',1,'2000-01-01','mauric23@gmail.com','999999','0000-00-00 00:00:00'),(4,'Maurice4','Roger',1,'2000-01-01','mauric3@gmail.com','999999','0000-00-00 00:00:00'),(6,'qdsqds','qdsdsq',2,'2000-01-01','samuel.lassoie@gmail.com','602727071','0000-00-00 00:00:00'),(7,'TEST','TEST',1,'2000-01-02','samuel.lassoie+2@gmail.com','602727073','0000-00-00 00:00:00'),(8,'TOTO','ROGER',1,'2001-02-01','sss@ff.fr','909','0000-00-00 00:00:00'),(9,'Samuel','Lassoei',1,'2002-01-01','test@test.fr','90900','0000-00-00 00:00:00'),(11,'toto','fff',22,'2000-01-01','dddd@fff.fr','898989898989898','2019-05-15 20:29:51'),(12,'qsddsq','qdsdsq',22,'2000-01-01','ddsssd@fff.fr','88888','2019-05-15 20:53:45');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_client_nom_requis`
	BEFORE INSERT ON `client` FOR EACH ROW
  BEGIN
  
	IF NEW.`nom` is null or NEW.`nom`='' THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'Le nom est obligatoire';
	END IF;

	IF NEW.`prenom` is null or NEW.`prenom`='' THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'Le prenom est obligatoire';
	END IF;

	IF NEW.`genre` is null or NEW.`genre`='' THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'Le genre est obligatoire';
	END IF;

    IF NEW.`date_de_naissance` is null or NEW.`date_de_naissance`='' THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'La date de naissance est obligatoire';
	END IF;
    
	IF NEW.`email` is null or NEW.`email`='' THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'L\'email est obligatoire';
	END IF;
    
     IF NEW.`telephone` is null or NEW.`telephone`='' THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'Le téléphone est obligatoire';
	END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prestation`
--

DROP TABLE IF EXISTS `prestation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_rdv` int(11) NOT NULL,
  `temps_prestation` time NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prestation_rdv_idx` (`id_rdv`),
  CONSTRAINT `fk_prestation_rdv` FOREIGN KEY (`id_rdv`) REFERENCES `rdv` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestation`
--

LOCK TABLES `prestation` WRITE;
/*!40000 ALTER TABLE `prestation` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdv`
--

DROP TABLE IF EXISTS `rdv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `date_rdv` datetime NOT NULL,
  `commentaire` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rdv_client_idx` (`id_client`),
  CONSTRAINT `fk_rdv_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdv`
--

LOCK TABLES `rdv` WRITE;
/*!40000 ALTER TABLE `rdv` DISABLE KEYS */;
/*!40000 ALTER TABLE `rdv` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-28 19:44:59
