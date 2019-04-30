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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Maurice','Roger',1,'2000-01-01','mauric@gmail.com','999999'),(2,'Maurice','Roger',1,'2000-01-01','mauric1@gmail.com','999999'),(3,'Maurice','Roger',1,'2000-01-01','mauric23@gmail.com','999999'),(4,'Maurice','Roger',1,'2000-01-01','mauric3@gmail.com','999999'),(5,'Maurice','Roger',1,'2000-01-01','mauric4@gmail.com','999999');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2019-04-30 18:50:49
