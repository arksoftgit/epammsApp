-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: epammsm
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(128) DEFAULT NULL,
  `ADDRESS` varchar(128) DEFAULT NULL,
  `ADDRESSLINE2` varchar(128) DEFAULT NULL,
  `CITY` varchar(128) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT NULL,
  `COUNTRY` varchar(128) DEFAULT NULL,
  `COUNTY` varchar(128) DEFAULT NULL,
  `ZIPCODE` varchar(10) DEFAULT NULL,
  `PHONE` varchar(11) DEFAULT NULL,
  `FAX` varchar(11) DEFAULT NULL,
  `TOLLFREEPHONE` varchar(11) DEFAULT NULL,
  `EMERGENCYPHONE` varchar(11) DEFAULT NULL,
  `ATTENTIONLINE` varchar(128) DEFAULT NULL,
  `TIMEZONE` varchar(128) DEFAULT NULL,
  `SHIPPINGFLAG` varchar(1) DEFAULT NULL,
  `CREATEDDATETIME` datetime DEFAULT NULL,
  `MODIFIEDDATETIME` datetime DEFAULT NULL,
  `CREATEDBY` varchar(128) DEFAULT NULL,
  `LASTMODIFIEDBY` varchar(128) DEFAULT NULL,
  `FK_ID_ORGANIZATION` int(11) DEFAULT NULL,
  `FK_ID_ORGANIZATION02` int(11) DEFAULT NULL,
  UNIQUE KEY `UADDRESS_ID_798510` (`ID`),
  KEY `ADDRESS_PHONE1_798600` (`PHONE`),
  KEY `ADDRESS_CITY_798550` (`CITY`),
  KEY `ADDRESS_STATE_798560` (`STATE`),
  KEY `ADDRESS_ZIPCODE_798590` (`ZIPCODE`),
  KEY `ADDRESS_FK_ID_ORGANIZATION_80809` (`FK_ID_ORGANIZATION`),
  KEY `ADDRESS_FK_IDORGANIZATION0280810` (`FK_ID_ORGANIZATION02`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (2,NULL,'90 Boroline Rd',NULL,'Allendale','NJ','USA',NULL,'07401',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(3,NULL,'22 W Frontage Rd',NULL,'Northfield','IL','USA',NULL,'60039',NULL,NULL,'8002285635',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(4,NULL,NULL,NULL,NULL,NULL,'USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domainvalue`
--

DROP TABLE IF EXISTS `domainvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domainvalue` (
  `DOMAINVALUE_TOKEN` int(11) NOT NULL,
  `INTERNALINTEGERVALUE` int(11) DEFAULT NULL,
  `INTERNALSTRINGVALUE` varchar(128) DEFAULT NULL,
  `SYSTEMREQUIRED` varchar(1) DEFAULT NULL,
  `EXTERNALDESCRIPTION` varchar(128) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_Z_DOMAIN` int(11) NOT NULL,
  UNIQUE KEY `UDOMAINVALUE_DOMAINVALUEID_79888` (`DOMAINVALUE_TOKEN`),
  KEY `DOMAINVALUE_FK_ID_Z_DOMAIN_80929` (`FK_ID_Z_DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domainvalue`
--

LOCK TABLES `domainvalue` WRITE;
/*!40000 ALTER TABLE `domainvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `domainvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epa_applicationtype`
--

DROP TABLE IF EXISTS `epa_applicationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epa_applicationtype` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) NOT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_EPA_CHEMICALFAMILY` int(11) NOT NULL,
  UNIQUE KEY `UEPA_APPLICATIONTYPE_ID_798900` (`ID`),
  KEY `EPAAPPLICATIONTYPEFKIDEPACH80799` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epa_applicationtype`
--

LOCK TABLES `epa_applicationtype` WRITE;
/*!40000 ALTER TABLE `epa_applicationtype` DISABLE KEYS */;
INSERT INTO `epa_applicationtype` VALUES (1,'Disinfectant',NULL,1,3),(2,'Sanitizer',NULL,2,3),(3,'Viruscide',NULL,3,3),(4,'Fungicide',NULL,4,3),(5,'Algaecide',NULL,5,3),(6,'General Purpose Anti-microbial',NULL,6,3),(7,'Tuberculocide',NULL,7,3);
/*!40000 ALTER TABLE `epa_applicationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epa_areaofuse`
--

DROP TABLE IF EXISTS `epa_areaofuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epa_areaofuse` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) NOT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_EPA_CHEMICALFAMILY` int(11) NOT NULL,
  UNIQUE KEY `UEPA_AREAOFUSE_ID_798950` (`ID`),
  KEY `EPAAREAOFUSEFKIDEPACHEMICAL80911` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epa_areaofuse`
--

LOCK TABLES `epa_areaofuse` WRITE;
/*!40000 ALTER TABLE `epa_areaofuse` DISABLE KEYS */;
INSERT INTO `epa_areaofuse` VALUES (1,'Bathrooms',NULL,1,3),(2,'Homes (Households)',NULL,2,3),(3,'Kitchens',NULL,3,3),(4,'Dental Offices',NULL,4,3),(5,'Health Care Facilities',NULL,5,3),(6,'Hospitals',NULL,6,3),(7,'Medical Clinics',NULL,7,3),(8,'Medical Offices',NULL,8,3),(9,'Nursing Homes',NULL,9,3),(10,'Day Care Centers',NULL,10,3),(11,'Nurseries',NULL,11,3),(12,'Schools',NULL,12,3),(13,'Bars',NULL,13,3),(14,'Cafeterias',NULL,14,3),(15,'Convenience Stores',NULL,15,3),(16,'Food Processing Plants',NULL,16,3),(17,'Food Storage Areas',NULL,17,3),(18,'Institutional Kitchens',NULL,18,3),(19,'Restaurants',NULL,19,3),(20,'USDA Inspected Food Processing Facilities',NULL,20,3),(21,'Athletic Facilities',NULL,21,3),(22,'Barber Shops',NULL,22,3),(23,'Business and Office Buildings',NULL,23,3),(24,'Colleges',NULL,24,3),(25,'Commercial Institutions',NULL,25,3),(26,'Correctional Facilities',NULL,26,3),(27,'Factories',NULL,27,3),(28,'Hotels',NULL,28,3),(29,'Industrial Institutions',NULL,29,3),(30,'Institutional Facilities',NULL,30,3),(31,'Institutions',NULL,31,3),(32,'Laundry Industry',NULL,32,3),(33,'Locker Rooms',NULL,33,3),(34,'Morgues',NULL,34,3),(35,'Mortuaries',NULL,35,3),(36,'Motels',NULL,36,3),(37,'Office Buildings',NULL,37,3),(38,'Prisons',NULL,38,3),(39,'Public Facilities',NULL,39,3),(40,'Public Rest Rooms',NULL,40,3),(41,'Schools',NULL,41,3),(42,'Shower and Bath Areas',NULL,42,3),(43,'Salons (Beauty)',NULL,43,3),(44,'Tanning Salons',NULL,44,3),(45,'Whirlpool and Foot Spa Use',NULL,45,3),(46,'Camp Grounds',NULL,46,3),(47,'Playground Equipment',NULL,47,3),(48,'Protective Safety Gear',NULL,48,3),(49,'Animal Laboratories',NULL,49,3),(50,'Animal Life Science Laboratories',NULL,50,3),(51,'Dairy Farms',NULL,51,3),(52,'Equine Farms',NULL,52,3),(53,'Farms',NULL,53,3),(54,'Federally Inspected Meat and Poultry Plants',NULL,54,3),(55,'Funeral Homes',NULL,55,3),(56,'Hog Farms',NULL,56,3),(57,'Kennels',NULL,57,3),(58,'Mushroom Farms',NULL,58,3),(59,'Poultry Farms',NULL,59,3),(60,'Pet Animal Quarters',NULL,60,3),(61,'Pet Shops',NULL,61,3),(62,'Tack Shops',NULL,62,3),(63,'Turkey Farms',NULL,63,3),(64,'Verterinary Clinics',NULL,64,3),(65,'Zoos',NULL,65,3),(66,'Beverage Plants',NULL,66,3),(67,'Breeding and Grooming Establishments',NULL,67,3),(68,'Breweries',NULL,68,3),(69,'Carpeting',NULL,69,3),(70,'Citus Plants ',NULL,70,3),(71,'Airplanes',NULL,71,3),(72,'Airports',NULL,72,3),(73,'Automotive Industy',NULL,73,3),(74,'Boats',NULL,74,3),(75,'Buses',NULL,75,3),(76,'Campers',NULL,76,3),(77,'Cars',NULL,77,3),(78,'Emergency Vehicles',NULL,78,3),(79,'Mobile Homes',NULL,79,3),(80,'Recreational Vehicle Use',NULL,80,3),(81,'Ships',NULL,81,3),(82,'Taxis',NULL,82,3),(83,'Trailers',NULL,83,3),(84,'Trains',NULL,84,3),(85,'Transportation Terminals',NULL,85,3);
/*!40000 ALTER TABLE `epa_areaofuse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epa_chemicalfamily`
--

DROP TABLE IF EXISTS `epa_chemicalfamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epa_chemicalfamily` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) NOT NULL,
  `DESCRIPTION` varchar(254) DEFAULT NULL,
  `CHEMICALFAMILY` varchar(2) NOT NULL,
  `FK_ID_EPAMMS` int(11) NOT NULL,
  UNIQUE KEY `UEPA_CHEMICALFAMILY_ID_799000` (`ID`),
  KEY `EPACHEMICALFAMILYFKIDEPAMMS80797` (`FK_ID_EPAMMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epa_chemicalfamily`
--

LOCK TABLES `epa_chemicalfamily` WRITE;
/*!40000 ALTER TABLE `epa_chemicalfamily` DISABLE KEYS */;
INSERT INTO `epa_chemicalfamily` VALUES (3,'xx','xx','P',1);
/*!40000 ALTER TABLE `epa_chemicalfamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epa_claim`
--

DROP TABLE IF EXISTS `epa_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epa_claim` (
  `ID` int(11) NOT NULL,
  `CLAIMSCLASSIFICATION` varchar(16) DEFAULT NULL,
  `NAME` varchar(254) NOT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_EPA_CHEMICALFAMILY` int(11) NOT NULL,
  UNIQUE KEY `UEPA_CLAIM_ID_799060` (`ID`),
  KEY `EPACLAIMFKIDEPACHEMICALFAMI80870` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epa_claim`
--

LOCK TABLES `epa_claim` WRITE;
/*!40000 ALTER TABLE `epa_claim` DISABLE KEYS */;
INSERT INTO `epa_claim` VALUES (56,NULL,'Streptococcus faecalis (1)',NULL,28,3),(57,'Fungi','Aspergillus niger',NULL,29,3),(58,'Fungi','Candida albicans',NULL,30,3),(59,'Fungi','Trichophyton mentagrophytes [Athlete\'s Foot Fungus]',NULL,31,3),(60,NULL,'[a cause of Ringworm] [a cause of Ringworm of the foot]',NULL,32,3),(61,'Viruses','*Adenovirus Type 4',NULL,33,3),(62,'Viruses','*Hepatitis B Virus (HBV)',NULL,34,3),(63,'Viruses','*Hepatitis C Virus (HCV)',NULL,35,3),(64,'Viruses','*Herpes Simplex Type 1',NULL,36,3),(65,'Viruses','*Herpes Simplex Type 2',NULL,37,3),(66,'Viruses','*Human coronavirus ',NULL,38,3),(67,'Viruses','*HIV-1 (AIDS virus)',NULL,39,3),(68,'Viruses','*Influenza A/ Hong Kong',NULL,40,3),(69,'Viruses','*Respiratory Syncytial Virus (RSV)',NULL,41,3),(70,'Viruses','*Rubella (German Measles)',NULL,42,3),(71,'Viruses','*Vaccinia [Pox virus]',NULL,43,3),(72,'Viruses','*Avian polyomavirus',NULL,44,3),(73,'Viruses','*Canine distemper',NULL,45,3),(74,'Viruses','*Canine parvovirus- at 2 oz. per gallon',NULL,46,3),(75,'Viruses','*Feline leukemia',NULL,47,3),(76,'Viruses','*Feline picomavirus',NULL,48,3),(77,'Viruses','*Infectious bovine rhinotracheitis',NULL,49,3),(78,'Viruses','*Infectious bronchitis (Avian IBV)',NULL,50,3),(79,'Viruses','*Pseudorabies (PRV)',NULL,51,3),(80,'Viruses','*Rabies',NULL,52,3),(81,'Bacteria','*Transmissible gastroenteritis virus (TGE)',NULL,26,3),(82,'Bacteria','Steptococcus pyogenes [cause of Scarlet fever]',NULL,27,3),(83,'Bacteria','Pseudomonas aeruginosa (1)',NULL,28,3),(84,'Bacteria','Staphylococcus aureus (1)',NULL,29,3),(85,'Bacteria','Salmonella choleraesuis ',NULL,30,3),(86,'Bacteria','Acinetobacter calcoaceticus',NULL,31,3),(87,'Bacteria','Bordetella bronchiseptica',NULL,32,3),(88,'Bacteria','Chlamydia psittaci',NULL,33,3),(89,'Bacteria','Enterobacter aerogenes',NULL,34,3),(90,'Bacteria','Enterobacter cloacae',NULL,35,3),(91,'Bacteria','Enterococcus faecalis- Vancomycin Resistant (VRE)',NULL,36,3),(92,'Bacteria','Escherichia coli (1)',NULL,37,3),(93,'Bacteria','Fusobacterium necrophorum',NULL,38,3),(94,'Bacteria','Kiebsiella pneumoniae (1)',NULL,39,3),(95,'Bacteria','Legionella pneumophilia',NULL,40,3),(96,'Bacteria','Listeria monocytogenes',NULL,41,3),(97,'Bacteria','Pasteurella multocida ',NULL,42,3),(98,'Bacteria','Proteus mirabilis',NULL,43,3),(99,'Bacteria','Proteus vulgaris',NULL,44,3),(100,'Bacteria','Salmonella enteritidis',NULL,45,3),(101,'Bacteria','Salmonella typhi',NULL,46,3),(102,'Bacteria','Salmonella typhimurium',NULL,47,3),(103,'Bacteria','Serratia marcescens',NULL,48,3),(104,'Bacteria','Shigella fiexneri',NULL,49,3),(105,'Bacteria','Shigella sonnei',NULL,50,3),(106,'Bacteria','Staphylococcus aureus- Methicillin resistant (MRSA)',NULL,51,3),(107,'Bacteria','Staphylococcus aureus- Vancomycin Intermediate Resistant (VISA)',NULL,52,3),(108,NULL,'Staphylococcus epidermidis (2)',NULL,53,3);
/*!40000 ALTER TABLE `epa_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epa_storagedisposal`
--

DROP TABLE IF EXISTS `epa_storagedisposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epa_storagedisposal` (
  `ID` int(11) NOT NULL,
  `NAME` longtext NOT NULL,
  `DESCRIPTION` longtext,
  `z_VOLUME` double DEFAULT NULL,
  `UNITS` varchar(254) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_EPA_CHEMICALFAMILY` int(11) NOT NULL,
  UNIQUE KEY `UEPA_STORAGEDISPOSAL_ID_799120` (`ID`),
  KEY `EPASTORAGEDISPOSALFKIDEPACH80910` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epa_storagedisposal`
--

LOCK TABLES `epa_storagedisposal` WRITE;
/*!40000 ALTER TABLE `epa_storagedisposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `epa_storagedisposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epa_surface`
--

DROP TABLE IF EXISTS `epa_surface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epa_surface` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) NOT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_EPA_CHEMICALFAMILY` int(11) NOT NULL,
  UNIQUE KEY `UEPA_SURFACE_ID_799190` (`ID`),
  KEY `EPASURFACEFKIDEPACHEMICALFA80912` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epa_surface`
--

LOCK TABLES `epa_surface` WRITE;
/*!40000 ALTER TABLE `epa_surface` DISABLE KEYS */;
INSERT INTO `epa_surface` VALUES (1,'Use Formulatin HWS-256 on washable hard',NULL,1,3),(2,'Appliances',NULL,2,3),(3,'Bathroom fixtures',NULL,3,3),(4,'Bathtubs (Fiberglass)',NULL,4,3),(5,'Cabinets',NULL,5,3),(6,'Cages',NULL,6,3),(7,'Chairs',NULL,7,3),(8,'Coils and drain pans of air conditioning and refrigeration equipment and heat pumps',NULL,8,3),(9,'Conductive flooring',NULL,9,3),(10,'Counters (countertops)',NULL,10,3),(11,'Countertop laminates',NULL,11,3),(12,'Desks',NULL,12,3),(13,'Doorknobs',NULL,13,3),(14,'Floors',NULL,14,3),(15,'Garbage cans',NULL,15,3),(16,'Highchairs',NULL,16,3),(17,'Kennel runs',NULL,17,3),(18,'Microwave ovens',NULL,18,3),(19,'Outdoor furniture',NULL,19,3),(20,'Refrigerators',NULL,20,3),(21,'Refrigerated storage and display equipment',NULL,21,3),(22,'Tanning Beds',NULL,22,3),(23,'Tanning Equipment',NULL,23,3),(24,'Telephones',NULL,24,3),(25,'Other hard nonporous surfaces made of:',NULL,25,3),(26,'Glazed ceramic',NULL,26,3),(27,'Glazed enameled surfaces',NULL,27,3),(28,'Laminated surfaces',NULL,28,3),(29,'Metal',NULL,29,3),(30,'Plastic (such as polystyrene or polypropylene)',NULL,30,3),(31,'Sealed granite',NULL,31,3),(32,'Sealed limestone',NULL,32,3),(33,'Sealed marble',NULL,33,3),(34,'Sealed slate',NULL,34,3),(35,'Sealed stone',NULL,35,3),(36,'Sealed terra cotta',NULL,36,3),(37,'Sealed terrazzo',NULL,37,3),(38,'Stainless steel',NULL,38,3),(39,'Upholstery',NULL,39,3),(40,'Woodwork',NULL,40,3);
/*!40000 ALTER TABLE `epa_surface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epamms`
--

DROP TABLE IF EXISTS `epamms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epamms` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) NOT NULL,
  UNIQUE KEY `UEPAMMS_ID_799240` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epamms`
--

LOCK TABLES `epamms` WRITE;
/*!40000 ALTER TABLE `epamms` DISABLE KEYS */;
INSERT INTO `epamms` VALUES (1,'Seitz');
/*!40000 ALTER TABLE `epamms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `ID` int(11) NOT NULL,
  `USERID` varchar(32) NOT NULL,
  `DIALOG` varchar(32) DEFAULT NULL,
  `WINDOW` varchar(32) DEFAULT NULL,
  `COMMENT` longtext,
  `FK_ID_ORGANIZATION` int(11) NOT NULL,
  UNIQUE KEY `UFEEDBACK_ID_799280` (`ID`),
  KEY `FEEDBACK_FK_ID_ORGANIZATION80796` (`FK_ID_ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphiclabelcontrol`
--

DROP TABLE IF EXISTS `graphiclabelcontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphiclabelcontrol` (
  `ID` int(11) NOT NULL,
  `POSITIONX` int(11) DEFAULT NULL,
  `POSITIONY` varchar(254) DEFAULT NULL,
  `SIZEX` int(11) DEFAULT NULL,
  `SIZEY` int(11) DEFAULT NULL,
  `FONT` varchar(254) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_GRAPHICLABELDEFINITION` int(11) NOT NULL,
  UNIQUE KEY `UGRAPHICLABELCONTROL_ID_799350` (`ID`),
  KEY `GRAPHICLABELCONTROLFKIDGRAP80921` (`FK_ID_GRAPHICLABELDEFINITION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphiclabelcontrol`
--

LOCK TABLES `graphiclabelcontrol` WRITE;
/*!40000 ALTER TABLE `graphiclabelcontrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `graphiclabelcontrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphiclabeldefinition`
--

DROP TABLE IF EXISTS `graphiclabeldefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphiclabeldefinition` (
  `ID` int(11) NOT NULL,
  `PRODUCTNAME` varchar(254) DEFAULT NULL,
  `HEIGHT` double DEFAULT NULL,
  `WIDTH` double DEFAULT NULL,
  `NETCONTENTSTEXT` varchar(254) DEFAULT NULL,
  `FK_ID_SUBREGISTRANT` int(11) NOT NULL,
  `FK_ID_SUBREGLABELCONTENT` int(11) DEFAULT NULL,
  UNIQUE KEY `UGRAPHICLABELDEFINITION_ID_79943` (`ID`),
  KEY `GRAPHICLABELDEFINITIONFKIDS80919` (`FK_ID_SUBREGISTRANT`),
  KEY `GRAPHICLABELDEFINITIONFKIDS80920` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphiclabeldefinition`
--

LOCK TABLES `graphiclabeldefinition` WRITE;
/*!40000 ALTER TABLE `graphiclabeldefinition` DISABLE KEYS */;
/*!40000 ALTER TABLE `graphiclabeldefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) NOT NULL,
  `FK_ID_EPAMMS` int(11) DEFAULT NULL,
  UNIQUE KEY `UKEYWORD_ID_799500` (`ID`),
  KEY `KEYWORD_FK_ID_EPAMMS_807980` (`FK_ID_EPAMMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
INSERT INTO `keyword` VALUES (2,'xx',1);
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lld`
--

DROP TABLE IF EXISTS `lld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lld` (
  `ID` int(11) NOT NULL,
  `TAG` varchar(64) DEFAULT NULL,
  `NAME` varchar(128) DEFAULT NULL,
  `CSS_FILENAME` varchar(254) DEFAULT NULL,
  `BACKGROUNDCOLOR` varchar(254) DEFAULT NULL,
  `HAZARDPANEL` int(11) DEFAULT NULL,
  `CONTINUATIONPREVIOUSPAGETEXT` longtext,
  `CONTNEXTPAGETEXTMARKETING` longtext,
  `CONTNEXTPAGETEXTDIRFORUSE` longtext,
  `DEFAULTTEXTFONTFAMILY` varchar(20) DEFAULT NULL,
  `DEFAULTTEXTFONTSIZE` varchar(20) DEFAULT NULL,
  `DEFAULTFONTCOLOR` varchar(20) DEFAULT NULL,
  `DEFAULTTITLEMARGINTOP` double DEFAULT NULL,
  `DEFAULTTITLEMARGINBOTTOM` double DEFAULT NULL,
  `DEFAULTTEXTMARGINTOP` double DEFAULT NULL,
  `DEFAULTTEXTMARGINBOTTOM` double DEFAULT NULL,
  `DEPTH` int(11) DEFAULT NULL,
  UNIQUE KEY `ULLD_ID_799540` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lld`
--

LOCK TABLES `lld` WRITE;
/*!40000 ALTER TABLE `lld` DISABLE KEYS */;
/*!40000 ALTER TABLE `lld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lld_block`
--

DROP TABLE IF EXISTS `lld_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lld_block` (
  `ID` int(11) NOT NULL,
  `TAG` varchar(64) DEFAULT NULL,
  `NAME` varchar(128) DEFAULT NULL,
  `BLOCKTITLE` varchar(254) DEFAULT NULL,
  `LLD_SECTIONTYPE` varchar(20) DEFAULT NULL,
  `LLD_COLUMNLISTTYPE` varchar(2) DEFAULT NULL,
  `CONTINUATIONBLOCKFLAG` varchar(1) DEFAULT NULL,
  `IMAGENAME` varchar(254) DEFAULT NULL,
  `z_TOP` double DEFAULT NULL,
  `z_LEFT` double DEFAULT NULL,
  `HEIGHT` double DEFAULT NULL,
  `WIDTH` double DEFAULT NULL,
  `TEXTCOLOR` varchar(20) DEFAULT NULL,
  `TEXTCOLOROVERRIDE` varchar(1) DEFAULT NULL,
  `BACKGROUNDCOLOR` varchar(20) DEFAULT NULL,
  `BACKGROUNDCOLOROVERRIDE` varchar(1) DEFAULT NULL,
  `BORDERCOLOR` varchar(20) DEFAULT NULL,
  `BORDERCOLOROVERRIDE` varchar(1) DEFAULT NULL,
  `BORDERSTYLE` varchar(20) DEFAULT NULL,
  `BORDERWIDTH` double DEFAULT NULL,
  `FONTFAMILY` varchar(20) DEFAULT NULL,
  `FONTSIZE` varchar(20) DEFAULT NULL,
  `FONTWEIGHT` varchar(20) DEFAULT NULL,
  `MARGIN` double DEFAULT NULL,
  `MARGINTOP` double DEFAULT NULL,
  `MARGINBOTTOM` double DEFAULT NULL,
  `MARGINLEFT` double DEFAULT NULL,
  `MARGINRIGHT` double DEFAULT NULL,
  `MARGINOVERRIDE` varchar(1) DEFAULT NULL,
  `BORDER` double DEFAULT NULL,
  `BORDERTOP` double DEFAULT NULL,
  `BORDERBOTTOM` double DEFAULT NULL,
  `BORDERLEFT` double DEFAULT NULL,
  `BORDERRIGHT` double DEFAULT NULL,
  `BORDEROVERRIDE` varchar(1) DEFAULT NULL,
  `PADDING` double DEFAULT NULL,
  `PADDINGTOP` double DEFAULT NULL,
  `PADDINGBOTTOM` double DEFAULT NULL,
  `PADDINGLEFT` double DEFAULT NULL,
  `PADDINGRIGHT` double DEFAULT NULL,
  `PADDINGOVERRIDE` varchar(1) DEFAULT NULL,
  `TITLEPOSITION` varchar(5) DEFAULT NULL,
  `CAPITALIZETITLETEXTFLAG` varchar(1) DEFAULT NULL,
  `TEXTALIGN` varchar(20) DEFAULT NULL,
  `TEXTLINEHEIGHT` double DEFAULT NULL,
  `DEPTH` int(11) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_SPLD_SECTION` int(11) DEFAULT NULL,
  `FK_ID_LLD_PANEL` int(11) DEFAULT NULL,
  `FK_ID_LLD_BLOCK` int(11) DEFAULT NULL,
  UNIQUE KEY `ULLD_BLOCK_ID_799730` (`ID`),
  KEY `LLD_BLOCK_FK_ID_SPLDSECTION80795` (`FK_ID_SPLD_SECTION`),
  KEY `LLD_BLOCK_FK_ID_LLD_PANEL_808490` (`FK_ID_LLD_PANEL`),
  KEY `LLD_BLOCK_FK_ID_LLD_BLOCK_808560` (`FK_ID_LLD_BLOCK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lld_block`
--

LOCK TABLES `lld_block` WRITE;
/*!40000 ALTER TABLE `lld_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `lld_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lld_page`
--

DROP TABLE IF EXISTS `lld_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lld_page` (
  `ID` int(11) NOT NULL,
  `TAG` varchar(64) DEFAULT NULL,
  `NAME` varchar(128) DEFAULT NULL,
  `HEIGHT` double DEFAULT NULL,
  `WIDTH` double DEFAULT NULL,
  `PAGENBR` int(11) DEFAULT NULL,
  `DEPTH` int(11) DEFAULT NULL,
  `FK_ID_LLD` int(11) DEFAULT NULL,
  `FK_ID_SPLD_LLD` int(11) DEFAULT NULL,
  UNIQUE KEY `ULLD_PAGE_ID_800210` (`ID`),
  KEY `LLD_PAGE_FK_ID_LLD_807910` (`FK_ID_LLD`),
  KEY `LLD_PAGE_FK_ID_SPLD_LLD_807920` (`FK_ID_SPLD_LLD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lld_page`
--

LOCK TABLES `lld_page` WRITE;
/*!40000 ALTER TABLE `lld_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `lld_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lld_panel`
--

DROP TABLE IF EXISTS `lld_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lld_panel` (
  `ID` int(11) NOT NULL,
  `TAG` varchar(64) DEFAULT NULL,
  `NAME` varchar(128) DEFAULT NULL,
  `PANELNUMBER` int(11) DEFAULT NULL,
  `LLD_SECTIONTYPE` varchar(20) DEFAULT NULL,
  `LLD_COLUMNLISTTYPE` varchar(2) DEFAULT NULL,
  `CONTINUATIONBLOCKFLAG` varchar(1) DEFAULT NULL,
  `IMAGENAME` varchar(254) DEFAULT NULL,
  `z_TOP` double DEFAULT NULL,
  `z_LEFT` double DEFAULT NULL,
  `HEIGHT` double DEFAULT NULL,
  `WIDTH` double DEFAULT NULL,
  `TEXTCOLOR` varchar(20) DEFAULT NULL,
  `TEXTCOLOROVERRIDE` varchar(1) DEFAULT NULL,
  `BACKGROUNDCOLOR` varchar(20) DEFAULT NULL,
  `BACKGROUNDCOLOROVERRIDE` varchar(1) DEFAULT NULL,
  `BORDERCOLOR` varchar(20) DEFAULT NULL,
  `BORDERCOLOROVERRIDE` varchar(1) DEFAULT NULL,
  `BORDERSTYLE` varchar(20) DEFAULT NULL,
  `BORDERWIDTH` double DEFAULT NULL,
  `FONTFAMILY` varchar(20) DEFAULT NULL,
  `FONTSIZE` varchar(20) DEFAULT NULL,
  `FONTWEIGHT` varchar(20) DEFAULT NULL,
  `MARGIN` double DEFAULT NULL,
  `MARGINTOP` double DEFAULT NULL,
  `MARGINBOTTOM` double DEFAULT NULL,
  `MARGINLEFT` double DEFAULT NULL,
  `MARGINRIGHT` double DEFAULT NULL,
  `MARGINOVERRIDE` varchar(1) DEFAULT NULL,
  `BORDER` double DEFAULT NULL,
  `BORDERTOP` double DEFAULT NULL,
  `BORDERBOTTOM` double DEFAULT NULL,
  `BORDERLEFT` double DEFAULT NULL,
  `BORDERRIGHT` double DEFAULT NULL,
  `BORDEROVERRIDE` varchar(1) DEFAULT NULL,
  `PADDING` double DEFAULT NULL,
  `PADDINGTOP` double DEFAULT NULL,
  `PADDINGBOTTOM` double DEFAULT NULL,
  `PADDINGLEFT` double DEFAULT NULL,
  `PADDINGRIGHT` double DEFAULT NULL,
  `PADDINGOVERRIDE` varchar(1) DEFAULT NULL,
  `TITLEPOSITION` varchar(5) DEFAULT NULL,
  `CAPITALIZETITLETEXTFLAG` varchar(1) DEFAULT NULL,
  `TEXTALIGN` varchar(20) DEFAULT NULL,
  `TEXTLINEHEIGHT` double DEFAULT NULL,
  `BLOCKTITLE` varchar(254) DEFAULT NULL,
  `DEPTH` int(11) DEFAULT NULL,
  `FK_ID_LLD_PAGE` int(11) NOT NULL,
  UNIQUE KEY `ULLD_PANEL_ID_800300` (`ID`),
  KEY `LLD_PANEL_FK_ID_LLD_PAGE_807900` (`FK_ID_LLD_PAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lld_panel`
--

LOCK TABLES `lld_panel` WRITE;
/*!40000 ALTER TABLE `lld_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `lld_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lld_specialsectionattribute`
--

DROP TABLE IF EXISTS `lld_specialsectionattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lld_specialsectionattribute` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(128) DEFAULT NULL,
  `PF1ID_LLD_BLOCK` int(11) NOT NULL,
  `PF2ID_LLD_BLOCK` int(11) DEFAULT NULL,
  UNIQUE KEY `ULLDSPECIALSECTIONATTRIBUTE80079` (`ID`),
  KEY `LLDSPECIALSECTIONATTRIBUTE180793` (`PF1ID_LLD_BLOCK`),
  KEY `LLDSPECIALSECTIONATTRIBUTE280794` (`PF2ID_LLD_BLOCK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lld_specialsectionattribute`
--

LOCK TABLES `lld_specialsectionattribute` WRITE;
/*!40000 ALTER TABLE `lld_specialsectionattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `lld_specialsectionattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_dilutionchartentry`
--

DROP TABLE IF EXISTS `m_dilutionchartentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_dilutionchartentry` (
  `ID` int(11) NOT NULL,
  `PRODUCTAMOUNTTEXT` varchar(254) DEFAULT NULL,
  `WATERAMOUNTTEXT` varchar(254) DEFAULT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) NOT NULL,
  UNIQUE KEY `UM_DILUTIONCHARTENTRY_ID_800830` (`ID`),
  KEY `MDILUTIONCHARTENTRYFKIDMAST80778` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_dilutionchartentry`
--

LOCK TABLES `m_dilutionchartentry` WRITE;
/*!40000 ALTER TABLE `m_dilutionchartentry` DISABLE KEYS */;
INSERT INTO `m_dilutionchartentry` VALUES (1,'½ oz','1 gallon',1),(2,'2 ½ oz.','5 gallons',1);
/*!40000 ALTER TABLE `m_dilutionchartentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_dilutiongroup`
--

DROP TABLE IF EXISTS `m_dilutiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_dilutiongroup` (
  `ID` int(11) NOT NULL,
  `DILUTIONRATIOTEXT` varchar(254) DEFAULT NULL,
  `DILUTIONQUATTEXT` varchar(254) DEFAULT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) NOT NULL,
  UNIQUE KEY `UM_DILUTIONGROUP_ID_800880` (`ID`),
  KEY `MDILUTIONGROUPFKIDMASTERLAB80779` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_dilutiongroup`
--

LOCK TABLES `m_dilutiongroup` WRITE;
/*!40000 ALTER TABLE `m_dilutiongroup` DISABLE KEYS */;
INSERT INTO `m_dilutiongroup` VALUES (1,'DILUTION:  1:256','(660 ppm quat) ',1);
/*!40000 ALTER TABLE `m_dilutiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_dilutiongroupitem`
--

DROP TABLE IF EXISTS `m_dilutiongroupitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_dilutiongroupitem` (
  `ID` int(11) NOT NULL,
  `z_TEXT` varchar(254) DEFAULT NULL,
  `FK_ID_M_DILUTIONGROUP` int(11) NOT NULL,
  UNIQUE KEY `UM_DILUTIONGROUPITEM_ID_800930` (`ID`),
  KEY `MDILUTIONGROUPITEMFKIDMDILU80780` (`FK_ID_M_DILUTIONGROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_dilutiongroupitem`
--

LOCK TABLES `m_dilutiongroupitem` WRITE;
/*!40000 ALTER TABLE `m_dilutiongroupitem` DISABLE KEYS */;
INSERT INTO `m_dilutiongroupitem` VALUES (1,'½ ounce per gallon of water',1),(2,'1 ounce per 2 gallons of water',1),(3,'2 ounces per 4 gallons of water',1),(4,'2½ ounces per 5 gallons of water',1),(5,'4 ounces per 8 gallons of water',1);
/*!40000 ALTER TABLE `m_dilutiongroupitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_directionsforusesection`
--

DROP TABLE IF EXISTS `m_directionsforusesection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_directionsforusesection` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `SUBTITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `GENERALUSE` varchar(1) DEFAULT NULL,
  `STATEMENTLISTTYPE` varchar(254) DEFAULT NULL,
  `NUMBEREACHSTATEMENT` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `DELETEDFLAG` varchar(1) DEFAULT NULL,
  `STATEMENTSELECTEDBYUSAGEFLAG` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) NOT NULL,
  `FK_ID_M_DIRECTIONSFORUSESECTION` int(11) DEFAULT NULL,
  UNIQUE KEY `UMDIRECTIONSFORUSESECTIONID80097` (`ID`),
  KEY `MDIRECTIONSFORUSESECTIONFKI80869` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MDIRECTIONSFORUSESECTIONFKI80880` (`FK_ID_M_DIRECTIONSFORUSESECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_directionsforusesection`
--

LOCK TABLES `m_directionsforusesection` WRITE;
/*!40000 ALTER TABLE `m_directionsforusesection` DISABLE KEYS */;
INSERT INTO `m_directionsforusesection` VALUES (1,'MEDICAL','medical premises and metal and / or stainless steel surfaces',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(2,'BACTERICIDAL','Bactericidal Stability of Use-Dilution',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(3,'DISINFECTION','DISINFECTION / Cleaning / Deodorizing Directions: ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(4,'TOILET BOWLS','TOILET BOWLS [ / URINALS]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL),(5,'FUNGICIDAL','Fungicidal Directions:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL),(6,'MILDEWSTATIC','MILDEWSTATIC INSTRUCTIONS: ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,NULL),(7,'HARD NONPOROUS SURFACES ','CLEANING AND DISINFECTING ON PERSONAL PROTECTIVE EQUIPMENT (RESPIRATORS):',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,NULL),(8,'AIDS / HEPATITIS b / Hepatitis C','HIV-1 AND HBV and HCV',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,NULL),(9,'SALON (BARBER) INSTRUMENTS AND TOOLS DISINFECTION','BACTERICIDE / VIRUCIDE / FUNGICIDE DIRECTIONS:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,1,NULL),(10,'DISINFECTION OF HARD, NON-POROUS SURFACES','FOOTBATHS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,1,NULL),(11,'CLEANSING OF BODY SURFACES AND BODY ORIFICES','HUMAN REMAINS: ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,1,NULL),(12,'FARM PREMISE','LIVESTOCK, POULTRY & TURKEY HOUSE DISINFECTANT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,1,NULL),(13,'VETERINARY','Veterinary Practice / Animal Care / Animal Laboratory / Zoos / Pet Shop / Kennels Disinfection Directions:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,1,NULL),(14,'CITRUS','CITRUS CANKER DISEASE CONTROL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,1,NULL),(15,'HOME','non-porous surfaces',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,1,NULL),(16,'OTHER','Other suggested Uses:  ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,1,NULL);
/*!40000 ALTER TABLE `m_directionsforusesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_directionsforusestatement`
--

DROP TABLE IF EXISTS `m_directionsforusestatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_directionsforusestatement` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `z_TEXT` longtext,
  `NOTFORUSETEXT` longtext,
  `NOTFORUSETYPE` varchar(2) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `DELETEDFLAG` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_DIRECTIONSFORUSESECTION` int(11) NOT NULL,
  `FK_ID_M_DIRECTIONSFORUSESTATEMEN` int(11) DEFAULT NULL,
  UNIQUE KEY `UMDIRECTIONSFORUSESTATEMENT80111` (`ID`),
  KEY `MDIRECTIONSFORUSESTATEMENTF80863` (`FK_ID_M_DIRECTIONSFORUSESECTION`),
  KEY `MDIRECTIONSFORUSESTATEMENTF80868` (`FK_ID_M_DIRECTIONSFORUSESTATEMEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_directionsforusestatement`
--

LOCK TABLES `m_directionsforusestatement` WRITE;
/*!40000 ALTER TABLE `m_directionsforusestatement` DISABLE KEYS */;
INSERT INTO `m_directionsforusestatement` VALUES (1,NULL,'This product is not to be used as a terminal sterilant / high level disinfectant on any surface or instrument that (1) is introduced directly into the human body, either into or in contact with the bloodstream or normally sterile areas of the body, or (2) contacts intact mucous membranes but which does not ordinarily penetrate the blood barrier or otherwise enter normally sterile areas of the body.  This product may be used to preclean or decontaminate critical or semi-critical devices prior to sterilization or high-level disinfection.',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(2,NULL,'This product is not for use on medical device surfaces.',NULL,NULL,NULL,NULL,NULL,2,1,NULL),(3,'Bactericidal Stability of Use-Dilution','Tests confirm that Formulation HWS-256, when diluted in 400 ppm hard water (via use of automatic dispensing devices), remains effective against Pseudomonas aeruginosa, Staphylococcus aureus and Salmonella choleraesuis for (up to 7 days) (for up to one week) (for up to one month) (for up to 2 months) (for up to 3 months) (up to 4 months) (up to 5 months) (up to 6 months) (up to 7 months) (up to 8 months) (up to 9 months) (up to 10 months) (up to 11 months) (up to 12 months) (up to one year) when stored in a sealed container such as a spray bottle.  If product becomes visibly dirty or contaminated, the use-dilution must be discarded and fresh product prepared.  Always use clean, properly labeled containers when diluting this product.  Bactericidal stability of the use-dilution does not apply to open containers such as buckets or pails.',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(4,'DISINFECTION / Cleaning / Deodorizing Directions:','Remove heavy soil deposits from surface.  Then thoroughly wet surface with a use-solution of ½ oz. of the concentrate per gallon of water.  (Use 2 oz per gallon of water to kill Adenovirus Type 7). The use-solution can be applied with a cloth, mop, sponge, or coarse spray, or soaking.  For sprayer applications, use a coarse spray device.  Spray 6-8 inches from the surface, rub with a brush, cloth or sponge.  Do not breathe spray.  Let solution remain on surface for a minimum of 10 minutes.  Rinse or allow to air dry.  Rinsing of floors is not necessary unless they are to be waxed or polished.',NULL,NULL,NULL,NULL,NULL,1,3,NULL),(5,NULL,'Prepare a fresh solution daily or more often if the solution becomes visibly dirty or diluted.',NULL,NULL,NULL,NULL,NULL,2,3,NULL),(6,NULL,'Swab bowl with brush to remove heavy soil prior to cleaning or disinfecting.  Clean by applying use-solution around the bowl and up under the rim.  Stubborn stains may require brushing.  To disinfect, first preclean to remove heavy soil, then remove or expel over the inner trap the residual bowl water. Pour in 3 oz. of the use-solution.  Swab the bowl completely using a scrub brush or mop, making sure to get under rim. Let stand for 10 minutes or overnight, then flush.',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL),(7,'Fungicidal Directions:','For use in areas such as locker rooms, dressing rooms, shower and bath areas and exercise facilities follow disinfection directions.',NULL,NULL,NULL,NULL,NULL,NULL,5,NULL),(8,'MILDEWSTATIC INSTRUCTIONS:','Will effectively control the growth of mold and mildew plus the odors caused by them when applied to hard, nonporous surfaces such as walls, floors, and table tops.  Apply use-solution of ½ oz. per gallon of water with a cloth, mop, sponge, or coarse spray.  Make sure to wet all surfaces completely. Let air dry. Repeat application weekly or when growth reappears.',NULL,NULL,NULL,NULL,NULL,NULL,6,NULL),(9,'CLEANING AND DISINFECTING HARD NONPOROUS SURFACES ON PERSONAL PROTECTIVE EQUIPMENT (RESPIRATORS):','Preclean equipment if heavily soiled to ensure proper surface contact. Add ½ oz. of Formulation HWS-256 to one gallon of water.  (Use 2 oz per gallon of water to kill Adenovirus Type 7).  Gently mix for a uniform solution.  Apply solution to hard, nonporous surfaces of the respirator with a brush, coarse spray device, sponge, or by immersion.  Thoroughly wet all surfaces to be disinfected.  Treated surfaces should remain wet for 10 minutes.  Remove excess solution from equipment prior to storage.  Comply with all OSHA regulations for cleaning respiratory protection (29 CFR §1910.134).\r\n',NULL,NULL,NULL,NULL,NULL,NULL,7,NULL),(10,'* Kills HIV-1 (AIDS virus) AND HBV (HEPATITIS b vIRUS) and HCV (Hepatitis C Virus) OF','precleaned, environmental surfaces / objects previously soiled with blood / body fluids in health care settings or other settings in which there is an expected likelihood of soiling of inanimate surfaces / objects with blood / body fluids, and in which the surfaces / objects likely to be soiled with blood / body fluids can be associated with the potential for transmission of Human Immunodeficiency Virus Type I (HIV-1)(associated with AIDS) or Hepatitis B Virus (HBV) or Hepatitis C Virus (HCV).\r\n',NULL,NULL,NULL,NULL,NULL,1,8,NULL),(11,NULL,'SPECIAL INSTRUCTIONS FOR CLEANING AND DECONTAMINATION AGAINST HIV-1 (AIDS VIRUS) OR HBV OR HCV ON SURFACES / OBJECTS SOILED WITH BLOOD / BODY FLUIDS:\r\nPersonal Protection: Disposable protective gloves, gowns, face masks, or eye coverings as appropriate must be worn during all cleaning of blood / body fluids and during decontamination procedures.\r\nCleaning Procedures: Blood / body fluids must be thoroughly cleaned from surfaces / objects before application of disinfectant.\r\nContact Time: HIV-1 (AIDS virus) is inactivated after a contact time of 4 minutes at 25°C (77ºF) (room temperature).  HBV and HCV are inactivated after a 10 minute contact time.  Use a 10-minute contact time for all other viruses, fungi, and bacteria listed.\r\nDisposal of Infectious Materials: Blood / body fluids should be autoclaved and disposed of according to federal, state, and local regulations for infectious waste disposal.',NULL,NULL,NULL,NULL,NULL,2,8,NULL),(12,'SALON (BARBER) INSTRUMENTS AND TOOLS DISINFECTION (BACTERICIDE) / VIRUCIDE / FUNGICIDE DIRECTIONS:','Mix ½ oz of Formulation HWS-256 per gallon of water (or equivalent dilution) to disinfect hard, nonporous instruments and tools.  (Use 2 oz per gallon of water to kill Adenovirus Type 7.)  Completely immerse combs, brushes, rollers, razors, scissors, blades, manicure and other salon instruments and tools for 10 minutes. For heavily soiled instruments and tools, a preliminary cleaning is required. Rinse thoroughly and dry before use. Prepare a fresh solution daily or more often if the solution becomes visibly diluted, cloudy or soiled.\r\nNote: Plastics may remain immersed until ready to use. Stainless steel shears and instruments must be removed after 10 minutes, rinsed, dried and kept in a clean, non-contaminated receptacle. Prolonged soaking may cause damage to metal instruments.',NULL,NULL,NULL,NULL,NULL,NULL,9,NULL),(13,'DISINFECTION OF HARD, NON-POROUS SURFACES IN FOOTBATHS','To remove body oils, dead tissue, soil and all other buildups or organic matter on inanimate surfaces after using the footbath, drain the water and thoroughly clean all hard, non-porous surfaces with soap or detergent, then rinse with water.  Saturate surfaces with a use solution of ½ oz. per gallon of water (or equivalent use dilution) to exposed surfaces with a cloth, mop, sponge or sprayer.  (Use 2 oz per gallon of water to kill Adenovirus Type 7).  For spray applications, use a coarse spray device.  Do not breathe spray.  Brush or swab thoroughly and allow solution to stand for 10 minutes.  After the unit has been thoroughly disinfected, rinse all surfaces with fresh water.  Do not use equipment until treatment has been absorbed, set or dried.',NULL,NULL,NULL,NULL,NULL,NULL,10,NULL),(14,'CLEANSING OF BODY SURFACES AND BODY ORIFICES OF HUMAN REMAINS:','This product removes body secretions, soil, and blood, along with their accompanying malodor, from the surfaces and orifices of human remains.  Using a sponge or washcloth, bathe the entire body with a use-solution of ½ oz per gallon of water.  (Use 2 oz per gallon of water to kill Adenovirus Type 7.)  A soft hand brush may be employed on surfaces other than the face.  Prepare a fresh solution for each (cadaver) remains or when solution becomes visibly dirty or diluted.',NULL,NULL,NULL,NULL,NULL,NULL,11,NULL),(15,'FARM PREMISE, LIVESTOCK, POULTRY & TURKEY HOUSE DISINFECTANT','DILUTION: 1:256	½ ounce per gallon of water\r\n\r\n(Use 2 oz per gallon of water to kill Adenovirus Type 7.)  \r\n\r\n1.	Remove all animals and feeds from premises, trucks, coops, crates, and enclosures.\r\n\r\n2.	Remove all litter and manure from floors, walls, and surfaces of barns, pens, stalls, chutes, vehicles, and other facilities and fixtures occupied or traversed by animals.\r\n\r\n3.	Empty all troughs, racks, and other feeding and watering appliances.\r\n\r\n4.	Thoroughly clean all surfaces with soap or detergent, and rinse with water.\r\n\r\n5.	Saturate all surfaces with the recommended disinfecting solution for a period of 10 minutes.\r\n\r\n6.	Immerse all halters, ropes, and other types of equipment used in handling and restraining animals, as well as forks, shovels, and scrapers used for removing litter and manure.\r\n\r\n7. Ventilate buildings, coops, cars, trucks, boats, and other closed spaces.  Do not house animals or employ equipment until treatment has been absorbed, set, or dried.\r\n\r\n8. After treatment with disinfectant, thoroughly scrub feed racks, troughs, automatic feeders, fountains, and waterers with soap or detergent, and rinse with potable water before reuse.',NULL,NULL,NULL,NULL,NULL,NULL,12,NULL),(16,'Veterinary Practice / Animal Care / Animal Laboratory / Zoos / Pet Shop / Kennels Disinfection Directions:','For cleaning and disinfecting hard nonporous surfaces: equipment used for animal food or water, utensils, instruments, cages, kennels, stables, catteries, etc.  Remove all animals and feeds from premises, animal transportation vehicles, crates, etc. Remove all litter, droppings and manure from floors, walls and surfaces of facilities occupied or traversed by animals. Empty all feeding and watering appliances. Thoroughly clean all surfaces with soap or detergent and rinse with water.  Saturate surfaces with a use-solution of ½ oz. of FORMULATION HWS-256 per gallon of water (or equivalent dilution) for a period of 10 minutes. (Use 2 oz per gallon of water to kill Adenovirus Type 7.)  Wipe or allow to air dry.  Ventilate buildings and other closed spaces. Thoroughly scrub all treated surfaces that come into contact with food, including equipment used for feeding or watering, with soap or detergent and rinse with potable water before reuse. Do not house animals or employ equipment until treatment has been absorbed, set or dried.\r\n\r\nFor Heavy Duty Cleaning and / or Odor Control: When greater cleaning is desired, use 1 - 2 oz. of Formulation HWS-256 per gallon of water.  Heavily soiled areas may require repeated cleaning before treatment.\r\n\r\n',NULL,NULL,NULL,NULL,NULL,NULL,13,NULL),(17,'CITRUS CANKER DISEASE CONTROL','For prevention of Citrus Canker Disease through treatment of equipment.  Effective against Xanthomonas axonopodis pv. citri (Citrus Canker Disease) at 2000 ppm active quat. Treatments can be applied to trucks, attached trailers, and field equipment including cargo area, wheels, tires, undercarriage, hood, roof, fenders, and any other hard nonporous equipment taken into infested areas.\r\nSaturate surfaces with a 1:84 use-dilution (5 oz. per 3¼ gallons of deionized water) (or equivalent dilution) (2000 ppm active quat) for a period of 10 minutes.  Allow to air dry.  All surfaces that come in contact with food or crop must be rinsed with potable water before reuse.  To prevent the spread of Citrus Canker Disease by this artificial means of transportation, treatments are made by trigger spraying, dipping or brushing. Thoroughly rinse or launder clothing before reuse.  Rinse footwear before reuse. ',NULL,NULL,NULL,NULL,NULL,NULL,14,NULL),(18,'non-porous surfaces','Formulation HWS-256 is effective at eliminating odors on porous surfaces such as upholstery, drapes, carpets, bedding, shower curtains, mattresses and non-porous surfaces such as walls and floors.  Excellent for fire restoration.\r\n',NULL,NULL,NULL,NULL,NULL,NULL,15,NULL),(19,'Other suggested Uses:','Homes, Veterinary Clinics, Fish Markets, Kennels, Trash Compactors, Offices, Beauty Salons, Locker Rooms, Health Spas, Conference rooms, Elevators, Smoking Areas, Lounges, Day Care Centers, Dry Cleaners, Theaters, Farms, Auditoriums and  Churches.',NULL,NULL,NULL,NULL,NULL,NULL,16,NULL);
/*!40000 ALTER TABLE `m_directionsforusestatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_generalsection`
--

DROP TABLE IF EXISTS `m_generalsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_generalsection` (
  `ID` int(11) NOT NULL,
  `CONTAINERVOLUME` varchar(254) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `SUBTITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `SECTIONTYPE` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `CONTACTNOTE` longtext,
  `NOTETOPHYSICIAN` longtext,
  `DELETEDFLAG` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) NOT NULL,
  `FK_ID_M_GENERALSECTION` int(11) DEFAULT NULL,
  UNIQUE KEY `UM_GENERALSECTION_ID_801210` (`ID`),
  KEY `MGENERALSECTIONFKIDMASTERLA80850` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MGENERALSECTIONFKIDMGENERAL80858` (`FK_ID_M_GENERALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_generalsection`
--

LOCK TABLES `m_generalsection` WRITE;
/*!40000 ALTER TABLE `m_generalsection` DISABLE KEYS */;
INSERT INTO `m_generalsection` VALUES (1,NULL,'FIRST AID',NULL,NULL,'F',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(2,NULL,'PRECAUTIONARY STATEMENTS','HAZARDS TO HUMANS AND DOMESTIC ANIMALS',NULL,'P',NULL,NULL,NULL,NULL,NULL,2,1,NULL),(3,NULL,'ENVIRONMENTAL HAZARDS',NULL,NULL,'E',NULL,NULL,NULL,NULL,NULL,3,1,NULL);
/*!40000 ALTER TABLE `m_generalsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_generalstatement`
--

DROP TABLE IF EXISTS `m_generalstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_generalstatement` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `z_TEXT` longtext,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `DELETEDFLAG` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_GENERALSECTION` int(11) NOT NULL,
  `FK_ID_M_GENERALSTATEMENT` int(11) DEFAULT NULL,
  UNIQUE KEY `UM_GENERALSTATEMENT_ID_801340` (`ID`),
  KEY `MGENERALSTATEMENTFKIDMGENER80851` (`FK_ID_M_GENERALSECTION`),
  KEY `MGENERALSTATEMENTFKIDMGENER80854` (`FK_ID_M_GENERALSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_generalstatement`
--

LOCK TABLES `m_generalstatement` WRITE;
/*!40000 ALTER TABLE `m_generalstatement` DISABLE KEYS */;
INSERT INTO `m_generalstatement` VALUES (1,NULL,'IF IN EYES: Hold eye open and rinse slowly and gently with water for 15  20 minutes.  Remove contact lenses, if present, after the first 5 minutes, then continue rinsing eye.  \r\nIF ON SKIN OR CLOTHING: Take off contaminated clothing. Rinse skin immediately with plenty of water for 15  20 minutes. \r\nIf swallowed: Call a poison control center or doctor immediately for treatment advice. Have person sip a glass of water if able to swallow.  Do not induce vomiting unless told to do so by the poison control center or doctor. Do not give anything by mouth to an unconscious person.\r\nIF INHALED: Move person to fresh air. If person is not breathing, call 911 or an ambulance, then give artificial respiration, preferably by mouth-to-mouth, if possible. \r\n\r\nCall a poison control center or doctor for treatment advice.\r\nHave the product container or label with you when calling a poison control center or doctor or going for treatment.\r\nNOTE TO PHYSICIAN: Probable mucosal damage may contraindicate the use of gastric lavage. Measures against circulatory shock, respiratory depression and convulsion may be needed.\r\n',NULL,NULL,NULL,1,NULL),(2,NULL,'DANGER. CORROSIVE. Causes irreversible eye damage and skin burns. Harmful if swallowed. Do not get in eyes, on skin, or on clothing. Wear protective eyewear (goggles, face shield or safety glasses), protective clothing and protective gloves (rubber or chemical resistant). Harmful if inhaled. Wash thoroughly with soap and water after handling. Remove contaminated clothing and wash clothing before reuse.',NULL,NULL,NULL,2,NULL),(3,NULL,'Do not discharge effluent containing this product into lakes, streams, ponds, estuaries, oceans, or other waters unless in accordance with the requirements of a National Pollutant Discharge Elimination System (NPDES) permit and the permitting authority has been notified in writing prior to discharge.  Do not discharge effluent containing this product to sewer systems without previously notifying the local sewage treatment plant authority.  For guidance contact your State Water Board or Regional Office of the EPA.\r\n',NULL,NULL,NULL,3,NULL);
/*!40000 ALTER TABLE `m_generalstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_humanhazardsection`
--

DROP TABLE IF EXISTS `m_humanhazardsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_humanhazardsection` (
  `ID` int(11) NOT NULL,
  `EPA_SIGNALWORD` varchar(32) DEFAULT NULL,
  `EPA_CHILDHAZARDWARNING` varchar(1) DEFAULT NULL,
  `PRECAUTIONARYSTATEMENT` longtext,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `LOCATION1` varchar(254) DEFAULT NULL,
  `LOCATION2` varchar(254) DEFAULT NULL,
  `LOCATION3` varchar(254) DEFAULT NULL,
  `LOCATION4` varchar(254) DEFAULT NULL,
  `LOCATION5` varchar(254) DEFAULT NULL,
  `DELETEDFLAG` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) NOT NULL,
  `FK_ID_M_HUMANHAZARDSECTION` int(11) DEFAULT NULL,
  UNIQUE KEY `UM_HUMANHAZARDSECTION_ID_801410` (`ID`),
  KEY `MHUMANHAZARDSECTIONFKIDMAST80875` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MHUMANHAZARDSECTIONFKIDMHUM80884` (`FK_ID_M_HUMANHAZARDSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_humanhazardsection`
--

LOCK TABLES `m_humanhazardsection` WRITE;
/*!40000 ALTER TABLE `m_humanhazardsection` DISABLE KEYS */;
INSERT INTO `m_humanhazardsection` VALUES (1,'DANGER','U','See {{Precautionary Position}} Panel for Precautionary Statements and First Aid','R','Right','Left','Side','Back',NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `m_humanhazardsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_ingredientssection`
--

DROP TABLE IF EXISTS `m_ingredientssection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_ingredientssection` (
  `ID` int(11) NOT NULL,
  `ACTIVETITLE` varchar(254) DEFAULT NULL,
  `ACTIVEBOLDITALIC` varchar(1) DEFAULT NULL,
  `ARSENICPRECAUTIONARYTEXT` varchar(254) DEFAULT NULL,
  `INERTTITLE` varchar(254) DEFAULT NULL,
  `INERTBOLDITALIC` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `GENERALINACTIVEPERCENT` double DEFAULT NULL,
  `DELETEDFLAG` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_INGREDIENTSSECTION` int(11) DEFAULT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) NOT NULL,
  UNIQUE KEY `UM_INGREDIENTSSECTION_ID_801540` (`ID`),
  KEY `MINGREDIENTSSECTIONFKIDMING80906` (`FK_ID_M_INGREDIENTSSECTION`),
  KEY `MINGREDIENTSSECTIONFKIDMAST80913` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_ingredientssection`
--

LOCK TABLES `m_ingredientssection` WRITE;
/*!40000 ALTER TABLE `m_ingredientssection` DISABLE KEYS */;
INSERT INTO `m_ingredientssection` VALUES (1,'Active Ingredients:',NULL,NULL,'Inert Ingredients:',NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `m_ingredientssection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_ingredientsstatement`
--

DROP TABLE IF EXISTS `m_ingredientsstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_ingredientsstatement` (
  `ID` int(11) NOT NULL,
  `CHEMICALNAME` varchar(254) NOT NULL,
  `COMMONNAME` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `ACTIVE` varchar(1) NOT NULL,
  `PROMPT` varchar(254) DEFAULT NULL,
  `z_PERCENT` double DEFAULT NULL,
  `DELETEDFLAG` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_INGREDIENTSSECTION` int(11) NOT NULL,
  `FK_ID_M_INGREDIENTSSTATEMENT` int(11) DEFAULT NULL,
  UNIQUE KEY `UM_INGREDIENTSSTATEMENT_ID_80165` (`ID`),
  KEY `MINGREDIENTSSTATEMENTFKIDMI80903` (`FK_ID_M_INGREDIENTSSECTION`),
  KEY `MINGREDIENTSSTATEMENTFKIDMI80909` (`FK_ID_M_INGREDIENTSSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_ingredientsstatement`
--

LOCK TABLES `m_ingredientsstatement` WRITE;
/*!40000 ALTER TABLE `m_ingredientsstatement` DISABLE KEYS */;
INSERT INTO `m_ingredientsstatement` VALUES (1,'Didecyl dimethyl ammonium chloride n-Alkyl (C14 50%, C12 40%, C16 10%)',NULL,NULL,'A',NULL,10.14,NULL,1,1,NULL),(3,'n-Alkyl (C14 50%, C12 40%, C16 10%) dimethyl benzyl ammonium chloride',NULL,NULL,'A',NULL,6.76,NULL,3,1,NULL),(4,'Inert',NULL,NULL,'I',NULL,83.1,NULL,3,1,NULL);
/*!40000 ALTER TABLE `m_ingredientsstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_marketingsection`
--

DROP TABLE IF EXISTS `m_marketingsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_marketingsection` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `SUBTITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `DELETEDFLAG` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) NOT NULL,
  `FK_ID_M_MARKETINGSECTION` int(11) DEFAULT NULL,
  UNIQUE KEY `UM_MARKETINGSECTION_ID_801750` (`ID`),
  KEY `MMARKETINGSECTIONFKIDMASTER80876` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MMARKETINGSECTIONFKIDMMARKE80889` (`FK_ID_M_MARKETINGSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_marketingsection`
--

LOCK TABLES `m_marketingsection` WRITE;
/*!40000 ALTER TABLE `m_marketingsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_marketingsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_marketingstatement`
--

DROP TABLE IF EXISTS `m_marketingstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_marketingstatement` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `z_TEXT` longtext,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `DELETEDFLAG` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_MARKETINGSECTION` int(11) NOT NULL,
  `FK_ID_M_MARKETINGSTATEMENT` int(11) DEFAULT NULL,
  UNIQUE KEY `UM_MARKETINGSTATEMENT_ID_801850` (`ID`),
  KEY `MMARKETINGSTATEMENTFKIDMMAR80823` (`FK_ID_M_MARKETINGSECTION`),
  KEY `MMARKETINGSTATEMENTFKIDMMAR80881` (`FK_ID_M_MARKETINGSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_marketingstatement`
--

LOCK TABLES `m_marketingstatement` WRITE;
/*!40000 ALTER TABLE `m_marketingstatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_marketingstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_storagedisposaldrivingconvol`
--

DROP TABLE IF EXISTS `m_storagedisposaldrivingconvol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_storagedisposaldrivingconvol` (
  `ID` int(11) NOT NULL,
  `CONTAINERVOLUME` varchar(3) DEFAULT NULL,
  `FK_ID_M_STORAGEDISPOSALSECTION` int(11) NOT NULL,
  UNIQUE KEY `UMSTORAGEDISPOSALDRIVINGCON80192` (`ID`),
  KEY `MSTORAGEDISPOSALDRIVINGCONV80789` (`FK_ID_M_STORAGEDISPOSALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_storagedisposaldrivingconvol`
--

LOCK TABLES `m_storagedisposaldrivingconvol` WRITE;
/*!40000 ALTER TABLE `m_storagedisposaldrivingconvol` DISABLE KEYS */;
INSERT INTO `m_storagedisposaldrivingconvol` VALUES (1,'1',1),(2,'5',2);
/*!40000 ALTER TABLE `m_storagedisposaldrivingconvol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_storagedisposalsection`
--

DROP TABLE IF EXISTS `m_storagedisposalsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_storagedisposalsection` (
  `ID` int(11) NOT NULL,
  `CONTAINERVOLUME` varchar(3) DEFAULT NULL,
  `SDSECTIONTYPE` varchar(20) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `SUBTITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `NUMBEREACHSTATEMENT` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `DELETEDFLAG` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) NOT NULL,
  `FK_ID_M_STORAGEDISPOSALSECTION` int(11) DEFAULT NULL,
  UNIQUE KEY `UM_STORAGEDISPOSALSECTIONID80196` (`ID`),
  KEY `MSTORAGEDISPOSALSECTIONFKID80871` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MSTORAGEDISPOSALSECTIONFKID80874` (`FK_ID_M_STORAGEDISPOSALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_storagedisposalsection`
--

LOCK TABLES `m_storagedisposalsection` WRITE;
/*!40000 ALTER TABLE `m_storagedisposalsection` DISABLE KEYS */;
INSERT INTO `m_storagedisposalsection` VALUES (1,NULL,NULL,'STORAGE AND DISPOSAL','(Note to reviewer: If the container size is one gallon or less, the following Storage and Disposal directions will be used:)',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(2,NULL,NULL,'STORAGE AND DISPOSAL',' (Note to reviewer: If the container size is greater than one gallon, the following Storage and Disposal directions will be used:)',NULL,NULL,NULL,NULL,NULL,2,1,NULL);
/*!40000 ALTER TABLE `m_storagedisposalsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_storagedisposalstatement`
--

DROP TABLE IF EXISTS `m_storagedisposalstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_storagedisposalstatement` (
  `ID` int(11) NOT NULL,
  `z_ORDER` int(11) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `z_TEXT` longtext,
  `NOTFORUSETEXT` longtext,
  `NOTFORUSETYPE` varchar(2) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `DELETEDFLAG` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_STORAGEDISPOSALSECTION` int(11) NOT NULL,
  `FK_ID_M_STORAGEDISPOSALSTATEMENT` int(11) DEFAULT NULL,
  UNIQUE KEY `UMSTORAGEDISPOSALSTATEMENTI80208` (`ID`),
  KEY `MSTORAGEDISPOSALSTATEMENTFK80859` (`FK_ID_M_STORAGEDISPOSALSECTION`),
  KEY `MSTORAGEDISPOSALSTATEMENTFK80862` (`FK_ID_M_STORAGEDISPOSALSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_storagedisposalstatement`
--

LOCK TABLES `m_storagedisposalstatement` WRITE;
/*!40000 ALTER TABLE `m_storagedisposalstatement` DISABLE KEYS */;
INSERT INTO `m_storagedisposalstatement` VALUES (1,NULL,'STORAGE AND DISPOSAL',NULL,'Store in original container in areas inaccessible to children. Do not reuse empty container.  (Wrap and) Discard in trash or recycle.',NULL,'NA',NULL,NULL,NULL,1,NULL),(2,NULL,'STORAGE AND DISPOSAL',NULL,'Do not contaminate water, food, or feed by storage or disposal. \r\nPesticide Storage\r\nStore in original container in areas inaccessible to children. Open dumping is prohibited.  Do not reuse empty container.\r\nPesticide Disposal\r\nPesticide wastes are acutely hazardous.  Improper disposal of excess pesticide, spray mixture, or rinsate is a violation of Federal law.  If these wastes cannot be disposed of by use according to label instructions, contact your State Pesticide or Environmental Control Agency, or the Hazardous Waste representative at the nearest EPA Regional Office for guidance.\r\nContainer Disposal\r\n(Plastic containers:) Triple rinse (or equivalent).  Then offer for recycling or reconditioning, or puncture and dispose of in a sanitary landfill, or incinerate, or if allowed by state and local authorities, burn.  If burned, stay out of smoke.\r\n(Fiber Drums With Liner:) Completely empty liner by shaking and tapping sides and bottom to loosen clinging particles.  Empty residue into application equipment.  Then dispose of liner in a sanitary landfill or by incineration if allowed by state and local authorities.  If drum is contaminated and cannot by reused, dispose of in the same manner.\r\n(Metal Container:) Triple rinse (or equivalent).  Then offer for recycling or reconditioning or puncture and dispose of in a sanitary landfill, or dispose of by other procedures approved by state and local authorities.\r\n(For Bag-in-Box Containers:) Completely empty bag into application equipment. Dispose of empty bag in a sanitary landfill or by incineration, or if allowed by state and local authorities by burning or dispose of by other procedures approved by state and local authorities.  If burned, stay out of smoke.',NULL,'NA',NULL,NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `m_storagedisposalstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_usage`
--

DROP TABLE IF EXISTS `m_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_usage` (
  `ID` int(11) NOT NULL,
  `USAGETYPE` varchar(1) DEFAULT NULL,
  `CLAIMSCLASSIFICATION` varchar(16) DEFAULT NULL,
  `NAME` varchar(254) NOT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` varchar(254) DEFAULT NULL,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `DELETEDFLAG` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_USAGEFOOTNOTE` int(11) DEFAULT NULL,
  `FK_ID_M_USAGETYPE` int(11) DEFAULT NULL,
  `FK_ID_M_USAGE` int(11) DEFAULT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) DEFAULT NULL,
  UNIQUE KEY `UM_USAGE_ID_802190` (`ID`),
  KEY `M_USAGE_FK_IDMUSAGEFOOTNOTE80777` (`FK_ID_M_USAGEFOOTNOTE`),
  KEY `M_USAGE_FK_ID_M_USAGETYPE_807880` (`FK_ID_M_USAGETYPE`),
  KEY `M_USAGE_FK_ID_M_USAGE_808860` (`FK_ID_M_USAGE`),
  KEY `MUSAGEFKIDMASTERLABELCONTEN80914` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_usage`
--

LOCK TABLES `m_usage` WRITE;
/*!40000 ALTER TABLE `m_usage` DISABLE KEYS */;
INSERT INTO `m_usage` VALUES (1,NULL,'Bacteria','Pseudomonas aeruginosa',NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL),(2,NULL,'Bacteria','Staphylococcus aureus',NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `m_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_usagefootnote`
--

DROP TABLE IF EXISTS `m_usagefootnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_usagefootnote` (
  `ID` int(11) NOT NULL,
  `z_TEXT` varchar(254) DEFAULT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) NOT NULL,
  UNIQUE KEY `UM_USAGEFOOTNOTE_ID_802290` (`ID`),
  KEY `MUSAGEFOOTNOTEFKIDMASTERLAB80776` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_usagefootnote`
--

LOCK TABLES `m_usagefootnote` WRITE;
/*!40000 ALTER TABLE `m_usagefootnote` DISABLE KEYS */;
INSERT INTO `m_usagefootnote` VALUES (1,'ATCC & antibiotic-resistant strain',1),(2,'antibiotic-resistant strain only',1);
/*!40000 ALTER TABLE `m_usagefootnote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_usageordering`
--

DROP TABLE IF EXISTS `m_usageordering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_usageordering` (
  `ID` int(11) NOT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `AUTOSEQ02` int(11) DEFAULT NULL,
  `FK_ID_M_USAGE` int(11) NOT NULL,
  `FK_ID_M_DIRECTIONSFORUSESTATEMEN` int(11) DEFAULT NULL,
  `FK_ID_M_MARKETINGSTATEMENT` int(11) DEFAULT NULL,
  UNIQUE KEY `UM_USAGEORDERING_ID_802330` (`ID`),
  KEY `M_USAGEORDERING_FK_IDMUSAGE80820` (`FK_ID_M_USAGE`),
  KEY `MUSAGEORDERINGFKIDMDIRECTIO80821` (`FK_ID_M_DIRECTIONSFORUSESTATEMEN`),
  KEY `MUSAGEORDERINGFKIDMMARKETIN80917` (`FK_ID_M_MARKETINGSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_usageordering`
--

LOCK TABLES `m_usageordering` WRITE;
/*!40000 ALTER TABLE `m_usageordering` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_usageordering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_usagetype`
--

DROP TABLE IF EXISTS `m_usagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_usagetype` (
  `ID` int(11) NOT NULL,
  `USAGETYPE` varchar(1) NOT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) NOT NULL,
  UNIQUE KEY `UM_USAGETYPE_ID_802360` (`ID`),
  KEY `MUSAGETYPEFKIDMASTERLABELCO80787` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_usagetype`
--

LOCK TABLES `m_usagetype` WRITE;
/*!40000 ALTER TABLE `m_usagetype` DISABLE KEYS */;
INSERT INTO `m_usagetype` VALUES (1,'C',1),(2,'S',1),(3,'U',1),(4,'T',1);
/*!40000 ALTER TABLE `m_usagetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masterlabelcontent`
--

DROP TABLE IF EXISTS `masterlabelcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterlabelcontent` (
  `ID` int(11) NOT NULL,
  `VERSION` varchar(254) NOT NULL,
  `REVISIONDATE` datetime NOT NULL,
  `CREATEDDATETIME` datetime DEFAULT NULL,
  `MODIFIEDDATETIME` datetime DEFAULT NULL,
  `FINALIZED` varchar(1) DEFAULT NULL,
  `DILUTIONCHARTSTRENGTHTITLE` varchar(254) DEFAULT NULL,
  `DILUTIONCHARTSTRENGTHTEXT` varchar(254) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `AUTOSEQ02` int(11) DEFAULT NULL,
  `AUTOSEQ03` int(11) DEFAULT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) DEFAULT NULL,
  `FK_ID_MASTERPRODUCT` int(11) NOT NULL,
  UNIQUE KEY `UMASTERLABELCONTENT_ID_802400` (`ID`),
  KEY `MASTERLABELCONTENTFKIDMASTE80830` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MASTERLABELCONTENTFKIDMASTE80918` (`FK_ID_MASTERPRODUCT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masterlabelcontent`
--

LOCK TABLES `masterlabelcontent` WRITE;
/*!40000 ALTER TABLE `masterlabelcontent` DISABLE KEYS */;
INSERT INTO `masterlabelcontent` VALUES (1,'1.0','2015-03-17 08:33:01','2015-03-17 08:33:01',NULL,NULL,'Correct Solution Strength','0.39% (1:256, ½ oz. per gallon)',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `masterlabelcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masterproduct`
--

DROP TABLE IF EXISTS `masterproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterproduct` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) NOT NULL,
  `z_NUMBER` varchar(128) NOT NULL,
  `DESCRIPTION` varchar(254) DEFAULT NULL,
  `CHEMICALFAMILY` varchar(2) NOT NULL,
  `EPA_REGISTRATIONNUMBER` varchar(128) DEFAULT NULL,
  `EPA_ESTABLISHMENTNUMBER` varchar(128) DEFAULT NULL,
  `EPA_DRAFTLABEL` datetime DEFAULT NULL,
  `ESL_DATE` datetime DEFAULT NULL,
  `EPA_TOXICITYCATEGORY` int(11) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_PRIMARYREGISTRANT` int(11) NOT NULL,
  UNIQUE KEY `UMASTERPRODUCT_ID_802500` (`ID`),
  KEY `MASTERPRODUCTFKIDPRIMARYREG80923` (`FK_ID_PRIMARYREGISTRANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masterproduct`
--

LOCK TABLES `masterproduct` WRITE;
/*!40000 ALTER TABLE `masterproduct` DISABLE KEYS */;
INSERT INTO `masterproduct` VALUES (1,'FORMULATION HWS-256','129','ONE-STEP DISINFECTANT GERMICIDAL DETERGENT AND DEODORANT','DQ',NULL,'47371',NULL,NULL,4,NULL,3);
/*!40000 ALTER TABLE `masterproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_masterproduct_fr_subregistran`
--

DROP TABLE IF EXISTS `mm_masterproduct_fr_subregistran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_masterproduct_fr_subregistran` (
  `FK_ID_SUBREGISTRANT` int(11) NOT NULL,
  `FK_ID_MASTERPRODUCT` int(11) NOT NULL,
  UNIQUE KEY `UMMMASTERPRODUCTFRSUBREGIST80802` (`FK_ID_SUBREGISTRANT`,`FK_ID_MASTERPRODUCT`),
  KEY `MMMASTERPRODUCTFRSUBREGISTR80802` (`FK_ID_SUBREGISTRANT`),
  KEY `MMMASTERPRODUCTFRSUBREGISTR80804` (`FK_ID_MASTERPRODUCT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_masterproduct_fr_subregistran`
--

LOCK TABLES `mm_masterproduct_fr_subregistran` WRITE;
/*!40000 ALTER TABLE `mm_masterproduct_fr_subregistran` DISABLE KEYS */;
/*!40000 ALTER TABLE `mm_masterproduct_fr_subregistran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_usergroup_containsmembr_z_use`
--

DROP TABLE IF EXISTS `mm_usergroup_containsmembr_z_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_usergroup_containsmembr_z_use` (
  `FK_ID_Z_USER` int(11) NOT NULL,
  `FK_ID_USERGROUP` int(11) NOT NULL,
  UNIQUE KEY `UMMUSERGROUPCONTAINSMEMBRZU80931` (`FK_ID_Z_USER`,`FK_ID_USERGROUP`),
  KEY `MMUSERGROUPCONTAINSMEMBRZUS80931` (`FK_ID_Z_USER`),
  KEY `MMUSERGROUPCONTAINSMEMBRZUS80933` (`FK_ID_USERGROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_usergroup_containsmembr_z_use`
--

LOCK TABLES `mm_usergroup_containsmembr_z_use` WRITE;
/*!40000 ALTER TABLE `mm_usergroup_containsmembr_z_use` DISABLE KEYS */;
/*!40000 ALTER TABLE `mm_usergroup_containsmembr_z_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmmusagedrvsmdirectionsforusesec`
--

DROP TABLE IF EXISTS `mmmusagedrvsmdirectionsforusesec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmmusagedrvsmdirectionsforusesec` (
  `FK_ID_M_DIRECTIONSFORUSESECTION` int(11) NOT NULL,
  `FK_ID_M_USAGE` int(11) NOT NULL,
  UNIQUE KEY `UMMMUSAGEDRVSMDIRECTIONSFOR80782` (`FK_ID_M_DIRECTIONSFORUSESECTION`,`FK_ID_M_USAGE`),
  KEY `MMMUSAGEDRVSMDIRECTIONSFORU80782` (`FK_ID_M_DIRECTIONSFORUSESECTION`),
  KEY `MMMUSAGEDRVSMDIRECTIONSFORU80784` (`FK_ID_M_USAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmmusagedrvsmdirectionsforusesec`
--

LOCK TABLES `mmmusagedrvsmdirectionsforusesec` WRITE;
/*!40000 ALTER TABLE `mmmusagedrvsmdirectionsforusesec` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmmusagedrvsmdirectionsforusesec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmsplddirectionsforusesectionfrs`
--

DROP TABLE IF EXISTS `mmsplddirectionsforusesectionfrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmsplddirectionsforusesectionfrs` (
  `FK_ID_SPLD_USAGE` int(11) NOT NULL,
  `FK_ID_SPLDDIRECTIONSFORUSESECTIO` int(11) NOT NULL,
  UNIQUE KEY `UMMSPLDDIRECTIONSFORUSESECT80842` (`FK_ID_SPLD_USAGE`,`FK_ID_SPLDDIRECTIONSFORUSESECTIO`),
  KEY `MMSPLDDIRECTIONSFORUSESECTI80842` (`FK_ID_SPLD_USAGE`),
  KEY `MMSPLDDIRECTIONSFORUSESECTI80844` (`FK_ID_SPLDDIRECTIONSFORUSESECTIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmsplddirectionsforusesectionfrs`
--

LOCK TABLES `mmsplddirectionsforusesectionfrs` WRITE;
/*!40000 ALTER TABLE `mmsplddirectionsforusesectionfrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmsplddirectionsforusesectionfrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmspldmarketingsectionfrspldusag`
--

DROP TABLE IF EXISTS `mmspldmarketingsectionfrspldusag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmspldmarketingsectionfrspldusag` (
  `FK_ID_SPLD_USAGE` int(11) NOT NULL,
  `FK_ID_SPLD_MARKETINGSECTION` int(11) NOT NULL,
  UNIQUE KEY `UMMSPLDMARKETINGSECTIONFRSP80846` (`FK_ID_SPLD_USAGE`,`FK_ID_SPLD_MARKETINGSECTION`),
  KEY `MMSPLDMARKETINGSECTIONFRSPL80846` (`FK_ID_SPLD_USAGE`),
  KEY `MMSPLDMARKETINGSECTIONFRSPL80848` (`FK_ID_SPLD_MARKETINGSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmspldmarketingsectionfrspldusag`
--

LOCK TABLES `mmspldmarketingsectionfrspldusag` WRITE;
/*!40000 ALTER TABLE `mmspldmarketingsectionfrspldusag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmspldmarketingsectionfrspldusag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) NOT NULL,
  `DESCRIPTION` varchar(254) DEFAULT NULL,
  `LOGINNAME` varchar(128) NOT NULL,
  `ADMINISTRATORPASSWORD` varchar(128) DEFAULT NULL,
  `LASTLOGINDATETIME` datetime DEFAULT NULL,
  `PASSWORDEXPIRESDATETIME` datetime DEFAULT NULL,
  `EMAILADDRESS` varchar(254) DEFAULT NULL,
  `ACTIVE` varchar(1) DEFAULT NULL,
  `ROLE` varchar(1) DEFAULT NULL,
  UNIQUE KEY `UORGANIZATION_ID_802620` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'ePamms Administrator',NULL,'Admin','zPrefixGgEwBjVR+KVMfGcK7BX8ZS4WUuyfalFeMyPXTg1bGEgzosroL9oFQg==','2015-03-11 19:50:48',NULL,NULL,NULL,NULL),(3,'Lonza, Inc','H&S Chemicals Division','Lonza','zPrefixYxc3Xt6K6U8OW/8A3fZ+uUcq5GHbKdxeALqM3ki4PVoTuGQmUQnNKQ==',NULL,NULL,NULL,NULL,'P'),(4,'Alpha Tech Pet, Inc.','Veterinary Products Supplier','ATP','zPrefixYz4jZwwN6bevhc3+pma1CBzuSE9a1DpEZllEQVp47DAMjDfHa90T7Q==',NULL,NULL,NULL,NULL,'S'),(5,'test',NULL,'test','zPrefixsq3HgbRFHopVsciXDzLUVhLBwNd7L65jVJ/RWwvv5lkt/U8yF5Qfig==',NULL,NULL,NULL,NULL,'S');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `ID` int(11) NOT NULL,
  `LASTNAME` varchar(64) DEFAULT NULL,
  `FIRSTNAME` varchar(64) DEFAULT NULL,
  `MIDDLENAME` varchar(64) DEFAULT NULL,
  `SUFFIX` varchar(128) DEFAULT NULL,
  `GENDER` varchar(1) DEFAULT NULL,
  `HOMEPHONE` varchar(11) DEFAULT NULL,
  `MOBILEPHONE` varchar(11) DEFAULT NULL,
  `WORKPHONE` varchar(11) DEFAULT NULL,
  `WORKPHONEEXTENSION` varchar(30) DEFAULT NULL,
  `FAX` varchar(11) DEFAULT NULL,
  `EMAILADDRESS` varchar(128) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `z_NOTE` longtext,
  `CREATEDDATETIME` datetime DEFAULT NULL,
  `MODIFIEDDATETIME` datetime DEFAULT NULL,
  `CREATEDBY` varchar(128) DEFAULT NULL,
  `LASTMODIFIEDBY` varchar(128) DEFAULT NULL,
  `FK_ID_ADDRESS` int(11) DEFAULT NULL,
  `FK_ID_ORGANIZATION` int(11) DEFAULT NULL,
  `HASCONTACTID_ORGANIZATION` int(11) DEFAULT NULL,
  UNIQUE KEY `UPERSON_ID_802740` (`ID`),
  KEY `PERSON_LASTNAME_802750` (`LASTNAME`),
  KEY `PERSON_EMAILADDRESS_802850` (`EMAILADDRESS`),
  KEY `PERSON_HOMEPHONE_802800` (`HOMEPHONE`),
  KEY `PERSON_GENDER_802790` (`GENDER`),
  KEY `PERSON_WORKPHONE_802820` (`WORKPHONE`),
  KEY `PERSON_FK_ID_ADDRESS_809340` (`FK_ID_ADDRESS`),
  KEY `PERSON_FK_ID_ORGANIZATION_809350` (`FK_ID_ORGANIZATION`),
  KEY `PERSONHASCONTACTIDORGANIZAT80936` (`HASCONTACTID_ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (2,'Sloan','Robert',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sr. Regulatory Services Associate',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `primaryregistrant`
--

DROP TABLE IF EXISTS `primaryregistrant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `primaryregistrant` (
  `ID` int(11) NOT NULL,
  `EPA_COMPANYNUMBER` varchar(128) DEFAULT NULL,
  `FK_ID_EPAMMS` int(11) NOT NULL,
  `FK_ID_ORGANIZATION` int(11) NOT NULL,
  UNIQUE KEY `UPRIMARYREGISTRANT_ID_802990` (`ID`),
  KEY `PRIMARYREGISTRANTFKIDEPAMMS80775` (`FK_ID_EPAMMS`),
  KEY `PRIMARYREGISTRANTFKIDORGANI80811` (`FK_ID_ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primaryregistrant`
--

LOCK TABLES `primaryregistrant` WRITE;
/*!40000 ALTER TABLE `primaryregistrant` DISABLE KEYS */;
INSERT INTO `primaryregistrant` VALUES (1,NULL,1,1),(3,'47371',1,3);
/*!40000 ALTER TABLE `primaryregistrant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `primarysub`
--

DROP TABLE IF EXISTS `primarysub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `primarysub` (
  `ID` int(11) NOT NULL,
  `FK_ID_PRIMARYREGISTRANT` int(11) NOT NULL,
  `FK_ID_SUBREGISTRANT` int(11) NOT NULL,
  UNIQUE KEY `UPRIMARYSUB_ID_803030` (`ID`),
  KEY `PRIMARYSUBFKIDPRIMARYREGIST80774` (`FK_ID_PRIMARYREGISTRANT`),
  KEY `PRIMARYSUBFKIDSUBREGISTRANT80928` (`FK_ID_SUBREGISTRANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primarysub`
--

LOCK TABLES `primarysub` WRITE;
/*!40000 ALTER TABLE `primarysub` DISABLE KEYS */;
INSERT INTO `primarysub` VALUES (1,3,1),(2,3,2);
/*!40000 ALTER TABLE `primarysub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_dilutiongroup`
--

DROP TABLE IF EXISTS `s_dilutiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_dilutiongroup` (
  `ID` int(11) NOT NULL,
  `FK_ID_SUBREGLABELCONTENT` int(11) NOT NULL,
  `FK_ID_M_DILUTIONGROUP` int(11) NOT NULL,
  UNIQUE KEY `US_DILUTIONGROUP_ID_803060` (`ID`),
  KEY `SDILUTIONGROUPFKIDSUBREGLAB80785` (`FK_ID_SUBREGLABELCONTENT`),
  KEY `SDILUTIONGROUPFKIDMDILUTION80786` (`FK_ID_M_DILUTIONGROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_dilutiongroup`
--

LOCK TABLES `s_dilutiongroup` WRITE;
/*!40000 ALTER TABLE `s_dilutiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_dilutiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_directionsforusesection`
--

DROP TABLE IF EXISTS `s_directionsforusesection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_directionsforusesection` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `SUBTITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `GENERALUSE` varchar(1) DEFAULT NULL,
  `STATEMENTLISTTYPE` varchar(254) DEFAULT NULL,
  `NUMBEREACHSTATEMENT` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_DIRECTIONSFORUSESECTION` int(11) DEFAULT NULL,
  `FK_ID_SUBREGLABELCONTENT` int(11) NOT NULL,
  UNIQUE KEY `USDIRECTIONSFORUSESECTIONID80309` (`ID`),
  KEY `SDIRECTIONSFORUSESECTIONFKI80878` (`FK_ID_M_DIRECTIONSFORUSESECTION`),
  KEY `SDIRECTIONSFORUSESECTIONFKI80897` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_directionsforusesection`
--

LOCK TABLES `s_directionsforusesection` WRITE;
/*!40000 ALTER TABLE `s_directionsforusesection` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_directionsforusesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_directionsforusestatement`
--

DROP TABLE IF EXISTS `s_directionsforusestatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_directionsforusestatement` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `z_TEXT` longtext,
  `NOTFORUSETEXT` longtext,
  `NOTFORUSETYPE` varchar(2) NOT NULL,
  `REVIEWERNOTE` longtext,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_DIRECTIONSFORUSESTATEMEN` int(11) DEFAULT NULL,
  `FK_ID_S_DIRECTIONSFORUSESECTION` int(11) NOT NULL,
  UNIQUE KEY `USDIRECTIONSFORUSESTATEMENT80322` (`ID`),
  KEY `SDIRECTIONSFORUSESTATEMENTF80864` (`FK_ID_M_DIRECTIONSFORUSESTATEMEN`),
  KEY `SDIRECTIONSFORUSESTATEMENTF80898` (`FK_ID_S_DIRECTIONSFORUSESECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_directionsforusestatement`
--

LOCK TABLES `s_directionsforusestatement` WRITE;
/*!40000 ALTER TABLE `s_directionsforusestatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_directionsforusestatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_generalsection`
--

DROP TABLE IF EXISTS `s_generalsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_generalsection` (
  `ID` int(11) NOT NULL,
  `CONTAINERVOLUME` varchar(254) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `SUBTITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `SECTIONTYPE` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `CONTACTNOTE` longtext,
  `NOTETOPHYSICIAN` longtext,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_GENERALSECTION` int(11) DEFAULT NULL,
  `FK_ID_SUBREGLABELCONTENT` int(11) NOT NULL,
  UNIQUE KEY `US_GENERALSECTION_ID_803320` (`ID`),
  KEY `SGENERALSECTIONFKIDMGENERAL80855` (`FK_ID_M_GENERALSECTION`),
  KEY `SGENERALSECTIONFKIDSUBREGLA80890` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_generalsection`
--

LOCK TABLES `s_generalsection` WRITE;
/*!40000 ALTER TABLE `s_generalsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_generalsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_generalstatement`
--

DROP TABLE IF EXISTS `s_generalstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_generalstatement` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `z_TEXT` longtext,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_GENERALSTATEMENT` int(11) DEFAULT NULL,
  `FK_ID_S_GENERALSECTION` int(11) NOT NULL,
  UNIQUE KEY `US_GENERALSTATEMENT_ID_803450` (`ID`),
  KEY `SGENERALSTATEMENTFKIDMGENER80852` (`FK_ID_M_GENERALSTATEMENT`),
  KEY `SGENERALSTATEMENTFKIDSGENER80891` (`FK_ID_S_GENERALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_generalstatement`
--

LOCK TABLES `s_generalstatement` WRITE;
/*!40000 ALTER TABLE `s_generalstatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_generalstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_humanhazardsection`
--

DROP TABLE IF EXISTS `s_humanhazardsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_humanhazardsection` (
  `ID` int(11) NOT NULL,
  `EPA_SIGNALWORD` varchar(32) DEFAULT NULL,
  `EPA_CHILDHAZARDWARNING` varchar(1) DEFAULT NULL,
  `PRECAUTIONARYSTATEMENT` longtext,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `LOCATION1` varchar(254) DEFAULT NULL,
  `LOCATION2` varchar(254) DEFAULT NULL,
  `LOCATION3` varchar(254) DEFAULT NULL,
  `LOCATION4` varchar(254) DEFAULT NULL,
  `LOCATION5` varchar(254) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_HUMANHAZARDSECTION` int(11) DEFAULT NULL,
  `FK_ID_SUBREGLABELCONTENT` int(11) NOT NULL,
  UNIQUE KEY `US_HUMANHAZARDSECTION_ID_803520` (`ID`),
  KEY `SHUMANHAZARDSECTIONFKIDMHUM80882` (`FK_ID_M_HUMANHAZARDSECTION`),
  KEY `SHUMANHAZARDSECTIONFKIDSUBR80894` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_humanhazardsection`
--

LOCK TABLES `s_humanhazardsection` WRITE;
/*!40000 ALTER TABLE `s_humanhazardsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_humanhazardsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_ingredientssection`
--

DROP TABLE IF EXISTS `s_ingredientssection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_ingredientssection` (
  `ID` int(11) NOT NULL,
  `ACTIVETITLE` varchar(254) DEFAULT NULL,
  `ACTIVEBOLDITALIC` varchar(1) DEFAULT NULL,
  `ARSENICPRECAUTIONARYTEXT` varchar(254) DEFAULT NULL,
  `INERTTITLE` varchar(254) DEFAULT NULL,
  `INERTBOLDITALIC` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `GENERALINACTIVEPERCENT` double DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_SUBREGLABELCONTENT` int(11) NOT NULL,
  `FK_ID_M_INGREDIENTSSECTION` int(11) DEFAULT NULL,
  UNIQUE KEY `US_INGREDIENTSSECTION_ID_803650` (`ID`),
  KEY `SINGREDIENTSSECTIONFKIDSUBR80892` (`FK_ID_SUBREGLABELCONTENT`),
  KEY `SINGREDIENTSSECTIONFKIDMING80904` (`FK_ID_M_INGREDIENTSSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_ingredientssection`
--

LOCK TABLES `s_ingredientssection` WRITE;
/*!40000 ALTER TABLE `s_ingredientssection` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_ingredientssection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_ingredientsstatement`
--

DROP TABLE IF EXISTS `s_ingredientsstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_ingredientsstatement` (
  `ID` int(11) NOT NULL,
  `CHEMICALNAME` varchar(254) NOT NULL,
  `COMMONNAME` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `ACTIVE` varchar(1) NOT NULL,
  `PROMPT` varchar(254) DEFAULT NULL,
  `z_PERCENT` double DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_S_INGREDIENTSSECTION` int(11) NOT NULL,
  `FK_ID_M_INGREDIENTSSTATEMENT` int(11) DEFAULT NULL,
  UNIQUE KEY `US_INGREDIENTSSTATEMENT_ID_80376` (`ID`),
  KEY `SINGREDIENTSSTATEMENTFKIDSI80893` (`FK_ID_S_INGREDIENTSSECTION`),
  KEY `SINGREDIENTSSTATEMENTFKIDMI80907` (`FK_ID_M_INGREDIENTSSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_ingredientsstatement`
--

LOCK TABLES `s_ingredientsstatement` WRITE;
/*!40000 ALTER TABLE `s_ingredientsstatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_ingredientsstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_marketingsection`
--

DROP TABLE IF EXISTS `s_marketingsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_marketingsection` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `SUBTITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_S_MARKETINGSECTION` int(11) DEFAULT NULL,
  `FK_ID_M_MARKETINGSECTION` int(11) DEFAULT NULL,
  `FK_ID_SUBREGLABELCONTENT` int(11) NOT NULL,
  UNIQUE KEY `US_MARKETINGSECTION_ID_803860` (`ID`),
  KEY `SMARKETINGSECTIONFKIDSMARKE80805` (`FK_ID_S_MARKETINGSECTION`),
  KEY `SMARKETINGSECTIONFKIDMMARKE80887` (`FK_ID_M_MARKETINGSECTION`),
  KEY `SMARKETINGSECTIONFKIDSUBREG80902` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_marketingsection`
--

LOCK TABLES `s_marketingsection` WRITE;
/*!40000 ALTER TABLE `s_marketingsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_marketingsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_marketingstatement`
--

DROP TABLE IF EXISTS `s_marketingstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_marketingstatement` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `z_TEXT` longtext,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_S_MARKETINGSTATEMENT` int(11) DEFAULT NULL,
  `FK_ID_S_MARKETINGSECTION` int(11) NOT NULL,
  `FK_ID_M_MARKETINGSTATEMENT` int(11) DEFAULT NULL,
  UNIQUE KEY `US_MARKETINGSTATEMENT_ID_803960` (`ID`),
  KEY `SMARKETINGSTATEMENTFKIDSMAR80807` (`FK_ID_S_MARKETINGSTATEMENT`),
  KEY `SMARKETINGSTATEMENTFKIDSMAR80824` (`FK_ID_S_MARKETINGSECTION`),
  KEY `SMARKETINGSTATEMENTFKIDMMAR80888` (`FK_ID_M_MARKETINGSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_marketingstatement`
--

LOCK TABLES `s_marketingstatement` WRITE;
/*!40000 ALTER TABLE `s_marketingstatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_marketingstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_storagedisposalsection`
--

DROP TABLE IF EXISTS `s_storagedisposalsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_storagedisposalsection` (
  `ID` int(11) NOT NULL,
  `CONTAINERVOLUME` varchar(3) DEFAULT NULL,
  `SDSECTIONTYPE` varchar(20) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `SUBTITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `NUMBEREACHSTATEMENT` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_STORAGEDISPOSALSECTION` int(11) DEFAULT NULL,
  `FK_ID_SUBREGLABELCONTENT` int(11) NOT NULL,
  UNIQUE KEY `US_STORAGEDISPOSALSECTIONID80403` (`ID`),
  KEY `SSTORAGEDISPOSALSECTIONFKID80872` (`FK_ID_M_STORAGEDISPOSALSECTION`),
  KEY `SSTORAGEDISPOSALSECTIONFKID80895` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_storagedisposalsection`
--

LOCK TABLES `s_storagedisposalsection` WRITE;
/*!40000 ALTER TABLE `s_storagedisposalsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_storagedisposalsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_storagedisposalstatement`
--

DROP TABLE IF EXISTS `s_storagedisposalstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_storagedisposalstatement` (
  `ID` int(11) NOT NULL,
  `z_ORDER` int(11) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `z_TEXT` longtext,
  `NOTFORUSETEXT` longtext,
  `NOTFORUSETYPE` varchar(2) NOT NULL,
  `REVIEWERNOTE` longtext,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_STORAGEDISPOSALSTATEMENT` int(11) DEFAULT NULL,
  `FK_ID_S_STORAGEDISPOSALSECTION` int(11) NOT NULL,
  UNIQUE KEY `USSTORAGEDISPOSALSTATEMENTI80415` (`ID`),
  KEY `SSTORAGEDISPOSALSTATEMENTFK80860` (`FK_ID_M_STORAGEDISPOSALSTATEMENT`),
  KEY `SSTORAGEDISPOSALSTATEMENTFK80896` (`FK_ID_S_STORAGEDISPOSALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_storagedisposalstatement`
--

LOCK TABLES `s_storagedisposalstatement` WRITE;
/*!40000 ALTER TABLE `s_storagedisposalstatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_storagedisposalstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_usage`
--

DROP TABLE IF EXISTS `s_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_usage` (
  `ID` int(11) NOT NULL,
  `USAGETYPE` varchar(1) DEFAULT NULL,
  `CLAIMSCLASSIFICATION` varchar(16) DEFAULT NULL,
  `NAME` varchar(254) NOT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` varchar(254) DEFAULT NULL,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_M_USAGE` int(11) DEFAULT NULL,
  `FK_ID_SUBREGLABELCONTENT` int(11) DEFAULT NULL,
  `FK_ID_S_USAGETYPE` int(11) DEFAULT NULL,
  UNIQUE KEY `US_USAGE_ID_804260` (`ID`),
  KEY `S_USAGE_FK_ID_M_USAGE_808850` (`FK_ID_M_USAGE`),
  KEY `SUSAGEFKIDSUBREGLABELCONTEN80899` (`FK_ID_SUBREGLABELCONTENT`),
  KEY `S_USAGE_FK_ID_S_USAGETYPE_809160` (`FK_ID_S_USAGETYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_usage`
--

LOCK TABLES `s_usage` WRITE;
/*!40000 ALTER TABLE `s_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_usageordering`
--

DROP TABLE IF EXISTS `s_usageordering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_usageordering` (
  `ID` int(11) NOT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `AUTOSEQ02` int(11) DEFAULT NULL,
  `FK_ID_S_MARKETINGSTATEMENT` int(11) DEFAULT NULL,
  `FK_ID_S_DIRECTIONSFORUSESTATEMEN` int(11) DEFAULT NULL,
  `FK_ID_S_USAGE` int(11) NOT NULL,
  UNIQUE KEY `US_USAGEORDERING_ID_804360` (`ID`),
  KEY `SUSAGEORDERINGFKIDSMARKETIN80808` (`FK_ID_S_MARKETINGSTATEMENT`),
  KEY `SUSAGEORDERINGFKIDSDIRECTIO80867` (`FK_ID_S_DIRECTIONSFORUSESTATEMEN`),
  KEY `S_USAGEORDERING_FK_IDSUSAGE80877` (`FK_ID_S_USAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_usageordering`
--

LOCK TABLES `s_usageordering` WRITE;
/*!40000 ALTER TABLE `s_usageordering` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_usageordering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_usagetype`
--

DROP TABLE IF EXISTS `s_usagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_usagetype` (
  `ID` int(11) NOT NULL,
  `USAGETYPE` varchar(1) NOT NULL,
  `FK_ID_SUBREGLABELCONTENT` int(11) NOT NULL,
  UNIQUE KEY `US_USAGETYPE_ID_804390` (`ID`),
  KEY `SUSAGETYPEFKIDSUBREGLABELCO80915` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_usagetype`
--

LOCK TABLES `s_usagetype` WRITE;
/*!40000 ALTER TABLE `s_usagetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_usagetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_directionsforusesection`
--

DROP TABLE IF EXISTS `spld_directionsforusesection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_directionsforusesection` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `SUBTITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `GENERALUSE` varchar(1) DEFAULT NULL,
  `STATEMENTLISTTYPE` varchar(254) DEFAULT NULL,
  `NUMBEREACHSTATEMENT` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `CONTINUATIONBREAKFLAG` varchar(254) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `AUTOSEQ02` int(11) DEFAULT NULL,
  `FK_ID_SPLD_SECTION` int(11) DEFAULT NULL,
  `FK_ID_SUBREGPHYSICALLABELDEF` int(11) NOT NULL,
  `FK_ID_S_DIRECTIONSFORUSESECTION` int(11) DEFAULT NULL,
  UNIQUE KEY `USPLDDIRECTIONSFORUSESECTIO80443` (`ID`),
  KEY `SPLDDIRECTIONSFORUSESECTION80817` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDDIRECTIONSFORUSESECTION80829` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDDIRECTIONSFORUSESECTION80879` (`FK_ID_S_DIRECTIONSFORUSESECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_directionsforusesection`
--

LOCK TABLES `spld_directionsforusesection` WRITE;
/*!40000 ALTER TABLE `spld_directionsforusesection` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_directionsforusesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_directionsforusestatement`
--

DROP TABLE IF EXISTS `spld_directionsforusestatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_directionsforusestatement` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `z_TEXT` longtext,
  `NOTFORUSETEXT` longtext,
  `NOTFORUSETYPE` varchar(2) NOT NULL,
  `REVIEWERNOTE` longtext,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `CONTINUATIONBREAKFLAG` varchar(1) DEFAULT NULL,
  `CONTINUATIONTEXT` longtext,
  `CONTINUATIONLEADINGTEXT` longtext,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_SPLDDIRECTIONSFORUSESECTIO` int(11) NOT NULL,
  `FK_ID_S_DIRECTIONSFORUSESTATEMEN` int(11) DEFAULT NULL,
  UNIQUE KEY `USPLDDIRECTIONSFORUSESTATEM80457` (`ID`),
  KEY `SPLDDIRECTIONSFORUSESTATEME80840` (`FK_ID_SPLDDIRECTIONSFORUSESECTIO`),
  KEY `SPLDDIRECTIONSFORUSESTATEME80865` (`FK_ID_S_DIRECTIONSFORUSESTATEMEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_directionsforusestatement`
--

LOCK TABLES `spld_directionsforusestatement` WRITE;
/*!40000 ALTER TABLE `spld_directionsforusestatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_directionsforusestatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_generalsection`
--

DROP TABLE IF EXISTS `spld_generalsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_generalsection` (
  `ID` int(11) NOT NULL,
  `CONTAINERVOLUME` varchar(254) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `SUBTITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `SECTIONTYPE` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `CONTACTNOTE` longtext,
  `NOTETOPHYSICIAN` longtext,
  `SELECTED` varchar(1) DEFAULT NULL,
  `CONTINUATIONBREAKFLAG` varchar(254) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `AUTOSEQ02` int(11) DEFAULT NULL,
  `FK_ID_SPLD_SECTION` int(11) DEFAULT NULL,
  `FK_ID_SUBREGPHYSICALLABELDEF` int(11) NOT NULL,
  `FK_ID_S_GENERALSECTION` int(11) DEFAULT NULL,
  UNIQUE KEY `USPLD_GENERALSECTION_ID_804700` (`ID`),
  KEY `SPLDGENERALSECTIONFKIDSPLDS80818` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDGENERALSECTIONFKIDSUBRE80825` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDGENERALSECTIONFKIDSGENE80857` (`FK_ID_S_GENERALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_generalsection`
--

LOCK TABLES `spld_generalsection` WRITE;
/*!40000 ALTER TABLE `spld_generalsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_generalsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_generalstatement`
--

DROP TABLE IF EXISTS `spld_generalstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_generalstatement` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `z_TEXT` longtext,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `CONTINUATIONBREAKFLAG` varchar(254) DEFAULT NULL,
  `CONTINUATIONTEXT` longtext,
  `CONTINUATIONLEADINGTEXT` longtext,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_SPLD_GENERALSECTION` int(11) NOT NULL,
  `FK_ID_S_GENERALSTATEMENT` int(11) DEFAULT NULL,
  UNIQUE KEY `USPLD_GENERALSTATEMENT_ID_804840` (`ID`),
  KEY `SPLDGENERALSTATEMENTFKIDSPL80837` (`FK_ID_SPLD_GENERALSECTION`),
  KEY `SPLDGENERALSTATEMENTFKIDSGE80853` (`FK_ID_S_GENERALSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_generalstatement`
--

LOCK TABLES `spld_generalstatement` WRITE;
/*!40000 ALTER TABLE `spld_generalstatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_generalstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_humanhazardsection`
--

DROP TABLE IF EXISTS `spld_humanhazardsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_humanhazardsection` (
  `ID` int(11) NOT NULL,
  `EPA_SIGNALWORD` varchar(32) DEFAULT NULL,
  `EPA_CHILDHAZARDWARNING` varchar(1) DEFAULT NULL,
  `PRECAUTIONARYSTATEMENT` longtext,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `LOCATION1` varchar(254) DEFAULT NULL,
  `LOCATION2` varchar(254) DEFAULT NULL,
  `LOCATION3` varchar(254) DEFAULT NULL,
  `LOCATION4` varchar(254) DEFAULT NULL,
  `LOCATION5` varchar(254) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_SUBREGPHYSICALLABELDEF` int(11) NOT NULL,
  `FK_ID_S_HUMANHAZARDSECTION` int(11) DEFAULT NULL,
  UNIQUE KEY `USPLD_HUMANHAZARDSECTION_ID80494` (`ID`),
  KEY `SPLDHUMANHAZARDSECTIONFKIDS80826` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDHUMANHAZARDSECTIONFKIDS80883` (`FK_ID_S_HUMANHAZARDSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_humanhazardsection`
--

LOCK TABLES `spld_humanhazardsection` WRITE;
/*!40000 ALTER TABLE `spld_humanhazardsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_humanhazardsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_ingredientssection`
--

DROP TABLE IF EXISTS `spld_ingredientssection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_ingredientssection` (
  `ID` int(11) NOT NULL,
  `ACTIVETITLE` varchar(254) DEFAULT NULL,
  `ACTIVEBOLDITALIC` varchar(1) DEFAULT NULL,
  `ARSENICPRECAUTIONARYTEXT` varchar(254) DEFAULT NULL,
  `INERTTITLE` varchar(254) DEFAULT NULL,
  `INERTBOLDITALIC` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `GENERALINACTIVEPERCENT` double DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `AUTOSEQ02` int(11) DEFAULT NULL,
  `FK_ID_SPLD_SECTION` int(11) DEFAULT NULL,
  `FK_ID_SUBREGPHYSICALLABELDEF` int(11) NOT NULL,
  `FK_ID_S_INGREDIENTSSECTION` int(11) DEFAULT NULL,
  UNIQUE KEY `USPLD_INGREDIENTSSECTION_ID80507` (`ID`),
  KEY `SPLDINGREDIENTSSECTIONFKIDS80815` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDINGREDIENTSSECTIONFKIDS80827` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDINGREDIENTSSECTIONFKIDS80905` (`FK_ID_S_INGREDIENTSSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_ingredientssection`
--

LOCK TABLES `spld_ingredientssection` WRITE;
/*!40000 ALTER TABLE `spld_ingredientssection` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_ingredientssection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_ingredientsstatement`
--

DROP TABLE IF EXISTS `spld_ingredientsstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_ingredientsstatement` (
  `ID` int(11) NOT NULL,
  `CHEMICALNAME` varchar(254) NOT NULL,
  `COMMONNAME` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `ACTIVE` varchar(1) NOT NULL,
  `PROMPT` varchar(254) DEFAULT NULL,
  `z_PERCENT` double DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_SPLD_INGREDIENTSSECTION` int(11) NOT NULL,
  `FK_ID_S_INGREDIENTSSTATEMENT` int(11) DEFAULT NULL,
  UNIQUE KEY `USPLDINGREDIENTSSTATEMENTID80518` (`ID`),
  KEY `SPLDINGREDIENTSSTATEMENTFKI80838` (`FK_ID_SPLD_INGREDIENTSSECTION`),
  KEY `SPLDINGREDIENTSSTATEMENTFKI80908` (`FK_ID_S_INGREDIENTSSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_ingredientsstatement`
--

LOCK TABLES `spld_ingredientsstatement` WRITE;
/*!40000 ALTER TABLE `spld_ingredientsstatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_ingredientsstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_lld`
--

DROP TABLE IF EXISTS `spld_lld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_lld` (
  `ID` int(11) NOT NULL,
  `TAG` varchar(64) DEFAULT NULL,
  `NAME` varchar(128) DEFAULT NULL,
  `CSS_FILENAME` varchar(254) DEFAULT NULL,
  `BACKGROUNDCOLOR` varchar(254) DEFAULT NULL,
  `HAZARDPANEL` int(11) DEFAULT NULL,
  `CONTINUATIONPREVIOUSPAGETEXT` longtext,
  `CONTNEXTPAGETEXTMARKETING` longtext,
  `CONTNEXTPAGETEXTDIRFORUSE` longtext,
  `DEFAULTTEXTFONTFAMILY` varchar(20) DEFAULT NULL,
  `DEFAULTTEXTFONTSIZE` varchar(20) DEFAULT NULL,
  `DEFAULTFONTCOLOR` varchar(20) DEFAULT NULL,
  `DEFAULTTITLEMARGINTOP` double DEFAULT NULL,
  `DEFAULTTITLEMARGINBOTTOM` double DEFAULT NULL,
  `DEFAULTTEXTMARGINTOP` double DEFAULT NULL,
  `DEFAULTTEXTMARGINBOTTOM` double DEFAULT NULL,
  `DEPTH` int(11) DEFAULT NULL,
  `FK_ID_SUBREGPHYSICALLABELDEF` int(11) NOT NULL,
  UNIQUE KEY `USPLD_LLD_ID_805280` (`ID`),
  KEY `SPLDLLDFKIDSUBREGPHYSICALLA80836` (`FK_ID_SUBREGPHYSICALLABELDEF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_lld`
--

LOCK TABLES `spld_lld` WRITE;
/*!40000 ALTER TABLE `spld_lld` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_lld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_marketingsection`
--

DROP TABLE IF EXISTS `spld_marketingsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_marketingsection` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `SUBTITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `CONTINUATIONBREAKFLAG` varchar(254) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `AUTOSEQ02` int(11) DEFAULT NULL,
  `FK_ID_S_MARKETINGSECTION` int(11) DEFAULT NULL,
  `FK_ID_SPLD_SECTION` int(11) DEFAULT NULL,
  `FK_ID_SUBREGPHYSICALLABELDEF` int(11) NOT NULL,
  UNIQUE KEY `USPLD_MARKETINGSECTION_ID_805470` (`ID`),
  KEY `SPLDMARKETINGSECTIONFKIDSMA80806` (`FK_ID_S_MARKETINGSECTION`),
  KEY `SPLDMARKETINGSECTIONFKIDSPL80819` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDMARKETINGSECTIONFKIDSUB80831` (`FK_ID_SUBREGPHYSICALLABELDEF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_marketingsection`
--

LOCK TABLES `spld_marketingsection` WRITE;
/*!40000 ALTER TABLE `spld_marketingsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_marketingsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_marketingstatement`
--

DROP TABLE IF EXISTS `spld_marketingstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_marketingstatement` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `z_TEXT` longtext,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `CONTINUATIONBREAKFLAG` varchar(1) DEFAULT NULL,
  `CONTINUATIONLEADINGTEXT` varchar(2) DEFAULT NULL,
  `CONTINUATIONTEXT` longtext,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_S_MARKETINGSTATEMENT` int(11) DEFAULT NULL,
  `FK_ID_SPLD_MARKETINGSECTION` int(11) NOT NULL,
  UNIQUE KEY `USPLD_MARKETINGSTATEMENT_ID80558` (`ID`),
  KEY `SPLDMARKETINGSTATEMENTFKIDS80813` (`FK_ID_S_MARKETINGSTATEMENT`),
  KEY `SPLDMARKETINGSTATEMENTFKIDS80822` (`FK_ID_SPLD_MARKETINGSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_marketingstatement`
--

LOCK TABLES `spld_marketingstatement` WRITE;
/*!40000 ALTER TABLE `spld_marketingstatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_marketingstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_section`
--

DROP TABLE IF EXISTS `spld_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_section` (
  `ID` int(11) NOT NULL,
  `TSECTIONTYPE` varchar(20) DEFAULT NULL,
  `TITLEOVERRIDE` varchar(254) DEFAULT NULL,
  `TITLEPOSITION` varchar(5) DEFAULT NULL,
  `TITLEBOLDITALIC` varchar(1) DEFAULT NULL,
  `TITLECLASS` varchar(254) DEFAULT NULL,
  `SUBTITLEOVERRIDE` varchar(254) DEFAULT NULL,
  `SUBTITLEPOSITION` varchar(5) DEFAULT NULL,
  `SUBTITLEBOLDITALIC` varchar(1) DEFAULT NULL,
  `SUBTITLECLASS` varchar(254) DEFAULT NULL,
  `STATEMENTFORMAT` varchar(5) DEFAULT NULL,
  `USAGESEPARATORCHARACTERS` varchar(254) DEFAULT NULL,
  `USAGETYPE` varchar(1) DEFAULT NULL,
  `STATEMENTCLASS` varchar(254) DEFAULT NULL,
  `KERNINGUNITS` varchar(10) DEFAULT NULL,
  `KERNINGWIDTH` double DEFAULT NULL,
  `WORDSPACINGUNITS` varchar(10) DEFAULT NULL,
  `WORDSPACINGWIDTH` double DEFAULT NULL,
  `LEADINGUNITS` varchar(10) DEFAULT NULL,
  `LEADINGHEIGHT` double DEFAULT NULL,
  UNIQUE KEY `USPLD_SECTION_ID_805680` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_section`
--

LOCK TABLES `spld_section` WRITE;
/*!40000 ALTER TABLE `spld_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_storagedisposalsection`
--

DROP TABLE IF EXISTS `spld_storagedisposalsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_storagedisposalsection` (
  `ID` int(11) NOT NULL,
  `CONTAINERVOLUME` varchar(3) DEFAULT NULL,
  `SDSECTIONTYPE` varchar(20) DEFAULT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `SUBTITLE` varchar(254) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `NUMBEREACHSTATEMENT` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` longtext,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `CONTINUATIONBREAKFLAG` varchar(254) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `AUTOSEQ02` int(11) DEFAULT NULL,
  `FK_ID_SPLD_SECTION` int(11) DEFAULT NULL,
  `FK_ID_SUBREGPHYSICALLABELDEF` int(11) NOT NULL,
  `FK_ID_S_STORAGEDISPOSALSECTION` int(11) DEFAULT NULL,
  UNIQUE KEY `USPLDSTORAGEDISPOSALSECTION80590` (`ID`),
  KEY `SPLDSTORAGEDISPOSALSECTIONF80816` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDSTORAGEDISPOSALSECTIONF80828` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDSTORAGEDISPOSALSECTIONF80873` (`FK_ID_S_STORAGEDISPOSALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_storagedisposalsection`
--

LOCK TABLES `spld_storagedisposalsection` WRITE;
/*!40000 ALTER TABLE `spld_storagedisposalsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_storagedisposalsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_storagedisposalstatement`
--

DROP TABLE IF EXISTS `spld_storagedisposalstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_storagedisposalstatement` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(254) DEFAULT NULL,
  `z_ORDER` int(11) DEFAULT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `z_TEXT` longtext,
  `NOTFORUSETEXT` longtext,
  `NOTFORUSETYPE` varchar(2) NOT NULL,
  `REVIEWERNOTE` longtext,
  `SELECTED` varchar(1) DEFAULT NULL,
  `CONTINUATIONBREAKFLAG` varchar(1) DEFAULT NULL,
  `CONTINUATIONLEADINGTEXT` longtext,
  `CONTINUATIONTEXT` longtext,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_SPLD_STORAGEDISPOSALSECTIO` int(11) NOT NULL,
  `FK_ID_S_STORAGEDISPOSALSTATEMENT` int(11) DEFAULT NULL,
  UNIQUE KEY `USPLDSTORAGEDISPOSALSTATEME80603` (`ID`),
  KEY `SPLDSTORAGEDISPOSALSTATEMEN80839` (`FK_ID_SPLD_STORAGEDISPOSALSECTIO`),
  KEY `SPLDSTORAGEDISPOSALSTATEMEN80861` (`FK_ID_S_STORAGEDISPOSALSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_storagedisposalstatement`
--

LOCK TABLES `spld_storagedisposalstatement` WRITE;
/*!40000 ALTER TABLE `spld_storagedisposalstatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_storagedisposalstatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_usage`
--

DROP TABLE IF EXISTS `spld_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_usage` (
  `ID` int(11) NOT NULL,
  `USAGETYPE` varchar(1) DEFAULT NULL,
  `CLAIMSCLASSIFICATION` varchar(16) DEFAULT NULL,
  `NAME` varchar(254) NOT NULL,
  `BOLDITALIC` varchar(1) DEFAULT NULL,
  `REVIEWERNOTE` varchar(254) DEFAULT NULL,
  `NOTEBOLDITALIC` varchar(1) DEFAULT NULL,
  `SELECTED` varchar(1) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_SUBREGPHYSICALLABELDEF` int(11) DEFAULT NULL,
  `FK_ID_S_USAGE` int(11) DEFAULT NULL,
  `FK_ID_SPLD_USAGETYPE` int(11) DEFAULT NULL,
  UNIQUE KEY `USPLD_USAGE_ID_806170` (`ID`),
  KEY `SPLDUSAGEFKIDSUBREGPHYSICAL80832` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLD_USAGE_FK_ID_S_USAGE_808350` (`FK_ID_S_USAGE`),
  KEY `SPLD_USAGEFKIDSPLDUSAGETYPE80901` (`FK_ID_SPLD_USAGETYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_usage`
--

LOCK TABLES `spld_usage` WRITE;
/*!40000 ALTER TABLE `spld_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_usageordering`
--

DROP TABLE IF EXISTS `spld_usageordering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_usageordering` (
  `ID` int(11) NOT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `AUTOSEQ02` int(11) DEFAULT NULL,
  `FK_ID_SPLD_USAGE` int(11) NOT NULL,
  `FK_ID_SPLD_MARKETINGSTATEMENT` int(11) DEFAULT NULL,
  `FKIDSPLDDIRECTIONSFORUSESTATEMEN` int(11) DEFAULT NULL,
  UNIQUE KEY `USPLD_USAGEORDERING_ID_806270` (`ID`),
  KEY `SPLDUSAGEORDERINGFKIDSPLDUS80800` (`FK_ID_SPLD_USAGE`),
  KEY `SPLDUSAGEORDERINGFKIDSPLDMA80814` (`FK_ID_SPLD_MARKETINGSTATEMENT`),
  KEY `SPLDUSAGEORDERINGFKIDSPLDDI80866` (`FKIDSPLDDIRECTIONSFORUSESTATEMEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_usageordering`
--

LOCK TABLES `spld_usageordering` WRITE;
/*!40000 ALTER TABLE `spld_usageordering` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_usageordering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spld_usagetype`
--

DROP TABLE IF EXISTS `spld_usagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spld_usagetype` (
  `ID` int(11) NOT NULL,
  `USAGETYPE` varchar(1) NOT NULL,
  `FK_ID_SUBREGPHYSICALLABELDEF` int(11) NOT NULL,
  UNIQUE KEY `USPLD_USAGETYPE_ID_806300` (`ID`),
  KEY `SPLDUSAGETYPEFKIDSUBREGPHYS80900` (`FK_ID_SUBREGPHYSICALLABELDEF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spld_usagetype`
--

LOCK TABLES `spld_usagetype` WRITE;
/*!40000 ALTER TABLE `spld_usagetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `spld_usagetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subregistrant`
--

DROP TABLE IF EXISTS `subregistrant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subregistrant` (
  `ID` int(11) NOT NULL,
  `EPA_COMPANYNUMBER` varchar(128) DEFAULT NULL,
  `FK_ID_ORGANIZATION` int(11) NOT NULL,
  UNIQUE KEY `USUBREGISTRANT_ID_806340` (`ID`),
  KEY `SUBREGISTRANTFKIDORGANIZATI80812` (`FK_ID_ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subregistrant`
--

LOCK TABLES `subregistrant` WRITE;
/*!40000 ALTER TABLE `subregistrant` DISABLE KEYS */;
INSERT INTO `subregistrant` VALUES (1,NULL,4),(2,NULL,5);
/*!40000 ALTER TABLE `subregistrant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subreglabelcontent`
--

DROP TABLE IF EXISTS `subreglabelcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subreglabelcontent` (
  `ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(254) DEFAULT NULL,
  `EPA_REGISTRATIONNUMBER` varchar(128) DEFAULT NULL,
  `EPA_ESTABLISHMENTNUMBER` varchar(128) DEFAULT NULL,
  `EPA_DRAFTLABEL` datetime DEFAULT NULL,
  `ESL_DATE` datetime DEFAULT NULL,
  `VERSION` varchar(254) DEFAULT NULL,
  `REVISIONDATE` datetime DEFAULT NULL,
  `CREATEDDATETIME` datetime DEFAULT NULL,
  `MODIFIEDDATETIME` datetime DEFAULT NULL,
  `NETCONTENTS` double DEFAULT NULL,
  `NETCONTENTSUNITS` varchar(254) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `AUTOSEQ02` int(11) DEFAULT NULL,
  `FK_ID_SUBREGLABELCONTENT` int(11) DEFAULT NULL,
  `FK_ID_SUBREGPRODUCT` int(11) NOT NULL,
  `FK_ID_MASTERLABELCONTENT` int(11) DEFAULT NULL,
  UNIQUE KEY `USUBREGLABELCONTENT_ID_806380` (`ID`),
  KEY `SUBREGLABELCONTENTFKIDSUBRE80834` (`FK_ID_SUBREGLABELCONTENT`),
  KEY `SUBREGLABELCONTENTFKIDSUBRE80925` (`FK_ID_SUBREGPRODUCT`),
  KEY `SUBREGLABELCONTENTFKIDMASTE80927` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subreglabelcontent`
--

LOCK TABLES `subreglabelcontent` WRITE;
/*!40000 ALTER TABLE `subreglabelcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `subreglabelcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subregphysicallabeldef`
--

DROP TABLE IF EXISTS `subregphysicallabeldef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subregphysicallabeldef` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) DEFAULT NULL,
  `PRODUCTNAME` varchar(254) DEFAULT NULL,
  `CREATEDDATETIME` datetime DEFAULT NULL,
  `MODIFIEDDATETIME` datetime DEFAULT NULL,
  `FK_ID_SUBREGLABELCONTENT` int(11) DEFAULT NULL,
  UNIQUE KEY `USUBREGPHYSICALLABELDEF_ID_80652` (`ID`),
  KEY `SUBREGPHYSICALLABELDEFFKIDS80833` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subregphysicallabeldef`
--

LOCK TABLES `subregphysicallabeldef` WRITE;
/*!40000 ALTER TABLE `subregphysicallabeldef` DISABLE KEYS */;
/*!40000 ALTER TABLE `subregphysicallabeldef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subregproduct`
--

DROP TABLE IF EXISTS `subregproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subregproduct` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(254) NOT NULL,
  `z_NUMBER` varchar(128) NOT NULL,
  `DESCRIPTION` varchar(254) DEFAULT NULL,
  `CHEMICALFAMILY` varchar(2) NOT NULL,
  `EPA_REGISTRATIONNUMBER` varchar(128) DEFAULT NULL,
  `EPA_ESTABLISHMENTNUMBER` varchar(128) DEFAULT NULL,
  `EPA_DRAFTLABEL` datetime DEFAULT NULL,
  `ESL_DATE` datetime DEFAULT NULL,
  `EPA_TOXICITYCATEGORY` int(11) DEFAULT NULL,
  `AUTOSEQ` int(11) DEFAULT NULL,
  `FK_ID_MASTERPRODUCT` int(11) NOT NULL,
  `FK_ID_SUBREGISTRANT` int(11) NOT NULL,
  UNIQUE KEY `USUBREGPRODUCT_ID_806590` (`ID`),
  KEY `SUBREGPRODUCTFKIDMASTERPROD80924` (`FK_ID_MASTERPRODUCT`),
  KEY `SUBREGPRODUCTFKIDSUBREGISTR80926` (`FK_ID_SUBREGISTRANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subregproduct`
--

LOCK TABLES `subregproduct` WRITE;
/*!40000 ALTER TABLE `subregproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `subregproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup` (
  `ID` int(11) NOT NULL,
  `GROUPNAME` varchar(128) NOT NULL,
  `DESCRIPTION` longtext,
  `CREATEDDATETIME` datetime DEFAULT NULL,
  `MODIFIEDDATETIME` datetime DEFAULT NULL,
  `CREATEDBY` varchar(128) DEFAULT NULL,
  `LASTMODIFIEDBY` varchar(128) DEFAULT NULL,
  UNIQUE KEY `UUSERGROUP_ID_806920` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_domain`
--

DROP TABLE IF EXISTS `z_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_domain` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(128) NOT NULL,
  `z_DESC` varchar(254) DEFAULT NULL,
  `SYSTEMREQUIRED` varchar(1) DEFAULT NULL,
  UNIQUE KEY `Uz_DOMAIN_ID_798770` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_domain`
--

LOCK TABLES `z_domain` WRITE;
/*!40000 ALTER TABLE `z_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_temp`
--

DROP TABLE IF EXISTS `z_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_temp` (
  `MARGINTOP` double DEFAULT NULL,
  `MARGINBOTTOM` double DEFAULT NULL,
  `MARGINLEFT` double DEFAULT NULL,
  `MARGINRIGHT` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_temp`
--

LOCK TABLES `z_temp` WRITE;
/*!40000 ALTER TABLE `z_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_user`
--

DROP TABLE IF EXISTS `z_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_user` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(128) NOT NULL,
  `USERPASSWORD` varchar(128) DEFAULT NULL,
  `LASTLOGINDATETIME` datetime DEFAULT NULL,
  `PASSWORDEXPIRESDATETIME` datetime DEFAULT NULL,
  `EMAILADDRESS` varchar(254) DEFAULT NULL,
  `ACTIVE` varchar(1) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  `z_NOTE` longtext,
  `CREATEDDATETIME` datetime DEFAULT NULL,
  `MODIFIEDDATETIME` datetime DEFAULT NULL,
  `CREATEDBY` varchar(128) DEFAULT NULL,
  `LASTMODIFIEDBY` varchar(128) DEFAULT NULL,
  `FK_ID_PERSON` int(11) DEFAULT NULL,
  UNIQUE KEY `Uz_USER_ID_806760` (`ID`),
  KEY `z_USER_USERNAME_806770` (`USERNAME`),
  KEY `z_USER_FK_ID_PERSON_809220` (`FK_ID_PERSON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_user`
--

LOCK TABLES `z_user` WRITE;
/*!40000 ALTER TABLE `z_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zeidongenkeytable`
--

DROP TABLE IF EXISTS `zeidongenkeytable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zeidongenkeytable` (
  `CURRENTGENKEY` int(11) DEFAULT NULL,
  `TABLENAME` varchar(32) NOT NULL,
  UNIQUE KEY `UZEIDONGENKEYTABLETABLENAME80702` (`TABLENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zeidongenkeytable`
--

LOCK TABLES `zeidongenkeytable` WRITE;
/*!40000 ALTER TABLE `zeidongenkeytable` DISABLE KEYS */;
INSERT INTO `zeidongenkeytable` VALUES (4,'ADDRESS'),(7,'EPA_APPLICATIONTYPE'),(85,'EPA_AREAOFUSE'),(3,'EPA_CHEMICALFAMILY'),(108,'EPA_CLAIM'),(40,'EPA_SURFACE'),(2,'KEYWORD'),(1,'MASTERLABELCONTENT'),(1,'MASTERPRODUCT'),(2,'M_DILUTIONCHARTENTRY'),(1,'M_DILUTIONGROUP'),(5,'M_DILUTIONGROUPITEM'),(16,'M_DIRECTIONSFORUSESECTION'),(19,'M_DIRECTIONSFORUSESTATEMENT'),(3,'M_GENERALSECTION'),(3,'M_GENERALSTATEMENT'),(1,'M_HUMANHAZARDSECTION'),(1,'M_INGREDIENTSSECTION'),(4,'M_INGREDIENTSSTATEMENT'),(2,'M_STORAGEDISPOSALDRIVINGCONVOL'),(2,'M_STORAGEDISPOSALSECTION'),(2,'M_STORAGEDISPOSALSTATEMENT'),(2,'M_USAGE'),(2,'M_USAGEFOOTNOTE'),(4,'M_USAGETYPE'),(5,'ORGANIZATION'),(4,'PERSON'),(3,'PRIMARYREGISTRANT'),(2,'PRIMARYSUB'),(2,'SUBREGISTRANT');
/*!40000 ALTER TABLE `zeidongenkeytable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zeidonlocking`
--

DROP TABLE IF EXISTS `zeidonlocking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zeidonlocking` (
  `LOD_NAME` varchar(35) NOT NULL,
  `KEYVALUE` varchar(200) NOT NULL,
  `USERNAME` varchar(32) NOT NULL,
  `ALLOWREAD` varchar(1) DEFAULT NULL,
  `z_TIMESTAMP` datetime NOT NULL,
  `ID` int(11) DEFAULT NULL,
  UNIQUE KEY `UZEIDONLOCKING_LOCKINGKEY_807050` (`LOD_NAME`,`KEYVALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zeidonlocking`
--

LOCK TABLES `zeidonlocking` WRITE;
/*!40000 ALTER TABLE `zeidonlocking` DISABLE KEYS */;
/*!40000 ALTER TABLE `zeidonlocking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'epammsm'
--

--
-- Dumping routines for database 'epammsm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 10:33:12
