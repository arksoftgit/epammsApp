CREATE DATABASE  IF NOT EXISTS `epammsm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `epammsm`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: epammsm
-- ------------------------------------------------------
-- Server version	5.6.19

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
  UNIQUE KEY `UADDRESS_ID_636160` (`ID`),
  KEY `ADDRESS_PHONE1_636250` (`PHONE`),
  KEY `ADDRESS_CITY_636200` (`CITY`),
  KEY `ADDRESS_STATE_636210` (`STATE`),
  KEY `ADDRESS_ZIPCODE_636240` (`ZIPCODE`),
  KEY `ADDRESS_FK_ID_ORGANIZATION_64532` (`FK_ID_ORGANIZATION`),
  KEY `ADDRESS_FK_IDORGANIZATION0264533` (`FK_ID_ORGANIZATION02`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,NULL,NULL,NULL,NULL,NULL,'USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,NULL,'90 Boroline Road',NULL,'Allendale','NJ','USA',NULL,'07401',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2);
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
  UNIQUE KEY `UDOMAINVALUE_DOMAINVALUEID_63653` (`DOMAINVALUE_TOKEN`),
  KEY `DOMAINVALUE_FK_ID_Z_DOMAIN_64652` (`FK_ID_Z_DOMAIN`)
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
  UNIQUE KEY `UEPA_APPLICATIONTYPE_ID_636550` (`ID`),
  KEY `EPAAPPLICATIONTYPEFKIDEPACH64522` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epa_applicationtype`
--

LOCK TABLES `epa_applicationtype` WRITE;
/*!40000 ALTER TABLE `epa_applicationtype` DISABLE KEYS */;
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
  UNIQUE KEY `UEPA_AREAOFUSE_ID_636600` (`ID`),
  KEY `EPAAREAOFUSEFKIDEPACHEMICAL64634` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epa_areaofuse`
--

LOCK TABLES `epa_areaofuse` WRITE;
/*!40000 ALTER TABLE `epa_areaofuse` DISABLE KEYS */;
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
  UNIQUE KEY `UEPA_CHEMICALFAMILY_ID_636650` (`ID`),
  KEY `EPACHEMICALFAMILYFKIDEPAMMS64520` (`FK_ID_EPAMMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epa_chemicalfamily`
--

LOCK TABLES `epa_chemicalfamily` WRITE;
/*!40000 ALTER TABLE `epa_chemicalfamily` DISABLE KEYS */;
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
  UNIQUE KEY `UEPA_CLAIM_ID_636710` (`ID`),
  KEY `EPACLAIMFKIDEPACHEMICALFAMI64593` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epa_claim`
--

LOCK TABLES `epa_claim` WRITE;
/*!40000 ALTER TABLE `epa_claim` DISABLE KEYS */;
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
  UNIQUE KEY `UEPA_STORAGEDISPOSAL_ID_636770` (`ID`),
  KEY `EPASTORAGEDISPOSALFKIDEPACH64633` (`FK_ID_EPA_CHEMICALFAMILY`)
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
  UNIQUE KEY `UEPA_SURFACE_ID_636840` (`ID`),
  KEY `EPASURFACEFKIDEPACHEMICALFA64635` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epa_surface`
--

LOCK TABLES `epa_surface` WRITE;
/*!40000 ALTER TABLE `epa_surface` DISABLE KEYS */;
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
  UNIQUE KEY `UEPAMMS_ID_636890` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epamms`
--

LOCK TABLES `epamms` WRITE;
/*!40000 ALTER TABLE `epamms` DISABLE KEYS */;
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
  UNIQUE KEY `UFEEDBACK_ID_636930` (`ID`),
  KEY `FEEDBACK_FK_ID_ORGANIZATION64519` (`FK_ID_ORGANIZATION`)
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
  UNIQUE KEY `UGRAPHICLABELCONTROL_ID_637000` (`ID`),
  KEY `GRAPHICLABELCONTROLFKIDGRAP64644` (`FK_ID_GRAPHICLABELDEFINITION`)
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
  UNIQUE KEY `UGRAPHICLABELDEFINITION_ID_63708` (`ID`),
  KEY `GRAPHICLABELDEFINITIONFKIDS64642` (`FK_ID_SUBREGISTRANT`),
  KEY `GRAPHICLABELDEFINITIONFKIDS64643` (`FK_ID_SUBREGLABELCONTENT`)
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
  UNIQUE KEY `UKEYWORD_ID_637150` (`ID`),
  KEY `KEYWORD_FK_ID_EPAMMS_645210` (`FK_ID_EPAMMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
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
  UNIQUE KEY `ULLD_ID_637190` (`ID`)
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
  UNIQUE KEY `ULLD_BLOCK_ID_637380` (`ID`),
  KEY `LLD_BLOCK_FK_ID_SPLDSECTION64518` (`FK_ID_SPLD_SECTION`),
  KEY `LLD_BLOCK_FK_ID_LLD_PANEL_645720` (`FK_ID_LLD_PANEL`),
  KEY `LLD_BLOCK_FK_ID_LLD_BLOCK_645790` (`FK_ID_LLD_BLOCK`)
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
  UNIQUE KEY `ULLD_PAGE_ID_637860` (`ID`),
  KEY `LLD_PAGE_FK_ID_LLD_645140` (`FK_ID_LLD`),
  KEY `LLD_PAGE_FK_ID_SPLD_LLD_645150` (`FK_ID_SPLD_LLD`)
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
  `z_TOP` double DEFAULT NULL,
  `z_LEFT` double DEFAULT NULL,
  `HEIGHT` double DEFAULT NULL,
  `WIDTH` double DEFAULT NULL,
  `PANELNUMBER` int(11) DEFAULT NULL,
  `DEPTH` int(11) DEFAULT NULL,
  `FK_ID_LLD_PAGE` int(11) NOT NULL,
  UNIQUE KEY `ULLD_PANEL_ID_637950` (`ID`),
  KEY `LLD_PANEL_FK_ID_LLD_PAGE_645130` (`FK_ID_LLD_PAGE`)
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
  UNIQUE KEY `ULLDSPECIALSECTIONATTRIBUTE63806` (`ID`),
  KEY `LLDSPECIALSECTIONATTRIBUTE164516` (`PF1ID_LLD_BLOCK`),
  KEY `LLDSPECIALSECTIONATTRIBUTE264517` (`PF2ID_LLD_BLOCK`)
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
  UNIQUE KEY `UM_DILUTIONCHARTENTRY_ID_638100` (`ID`),
  KEY `MDILUTIONCHARTENTRYFKIDMAST64501` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_dilutionchartentry`
--

LOCK TABLES `m_dilutionchartentry` WRITE;
/*!40000 ALTER TABLE `m_dilutionchartentry` DISABLE KEYS */;
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
  UNIQUE KEY `UM_DILUTIONGROUP_ID_638150` (`ID`),
  KEY `MDILUTIONGROUPFKIDMASTERLAB64502` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_dilutiongroup`
--

LOCK TABLES `m_dilutiongroup` WRITE;
/*!40000 ALTER TABLE `m_dilutiongroup` DISABLE KEYS */;
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
  UNIQUE KEY `UM_DILUTIONGROUPITEM_ID_638230` (`ID`),
  KEY `MDILUTIONGROUPITEMFKIDMDILU64503` (`FK_ID_M_DILUTIONGROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_dilutiongroupitem`
--

LOCK TABLES `m_dilutiongroupitem` WRITE;
/*!40000 ALTER TABLE `m_dilutiongroupitem` DISABLE KEYS */;
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
  UNIQUE KEY `UMDIRECTIONSFORUSESECTIONID63827` (`ID`),
  KEY `MDIRECTIONSFORUSESECTIONFKI64592` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MDIRECTIONSFORUSESECTIONFKI64603` (`FK_ID_M_DIRECTIONSFORUSESECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_directionsforusesection`
--

LOCK TABLES `m_directionsforusesection` WRITE;
/*!40000 ALTER TABLE `m_directionsforusesection` DISABLE KEYS */;
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
  UNIQUE KEY `UMDIRECTIONSFORUSESTATEMENT63841` (`ID`),
  KEY `MDIRECTIONSFORUSESTATEMENTF64586` (`FK_ID_M_DIRECTIONSFORUSESECTION`),
  KEY `MDIRECTIONSFORUSESTATEMENTF64591` (`FK_ID_M_DIRECTIONSFORUSESTATEMEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_directionsforusestatement`
--

LOCK TABLES `m_directionsforusestatement` WRITE;
/*!40000 ALTER TABLE `m_directionsforusestatement` DISABLE KEYS */;
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
  UNIQUE KEY `UM_GENERALSECTION_ID_638510` (`ID`),
  KEY `MGENERALSECTIONFKIDMASTERLA64573` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MGENERALSECTIONFKIDMGENERAL64581` (`FK_ID_M_GENERALSECTION`)
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
  UNIQUE KEY `UM_GENERALSTATEMENT_ID_638640` (`ID`),
  KEY `MGENERALSTATEMENTFKIDMGENER64574` (`FK_ID_M_GENERALSECTION`),
  KEY `MGENERALSTATEMENTFKIDMGENER64577` (`FK_ID_M_GENERALSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_generalstatement`
--

LOCK TABLES `m_generalstatement` WRITE;
/*!40000 ALTER TABLE `m_generalstatement` DISABLE KEYS */;
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
  UNIQUE KEY `UM_HUMANHAZARDSECTION_ID_638710` (`ID`),
  KEY `MHUMANHAZARDSECTIONFKIDMAST64598` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MHUMANHAZARDSECTIONFKIDMHUM64607` (`FK_ID_M_HUMANHAZARDSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_humanhazardsection`
--

LOCK TABLES `m_humanhazardsection` WRITE;
/*!40000 ALTER TABLE `m_humanhazardsection` DISABLE KEYS */;
INSERT INTO `m_humanhazardsection` VALUES (1,'CAUTION','U','See {{Precautionary Position}} Panel for Precautionary Statements','R','Back','Side','Left','Right','United States',NULL,NULL,1,NULL);
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
  UNIQUE KEY `UM_INGREDIENTSSECTION_ID_638840` (`ID`),
  KEY `MINGREDIENTSSECTIONFKIDMING64629` (`FK_ID_M_INGREDIENTSSECTION`),
  KEY `MINGREDIENTSSECTIONFKIDMAST64636` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_ingredientssection`
--

LOCK TABLES `m_ingredientssection` WRITE;
/*!40000 ALTER TABLE `m_ingredientssection` DISABLE KEYS */;
INSERT INTO `m_ingredientssection` VALUES (1,'Active Ingredients:',NULL,NULL,'Inert Ingredients:',NULL,NULL,95.775,NULL,NULL,NULL,1);
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
  UNIQUE KEY `UM_INGREDIENTSSTATEMENT_ID_63895` (`ID`),
  KEY `MINGREDIENTSSTATEMENTFKIDMI64626` (`FK_ID_M_INGREDIENTSSECTION`),
  KEY `MINGREDIENTSSTATEMENTFKIDMI64632` (`FK_ID_M_INGREDIENTSSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_ingredientsstatement`
--

LOCK TABLES `m_ingredientsstatement` WRITE;
/*!40000 ALTER TABLE `m_ingredientsstatement` DISABLE KEYS */;
INSERT INTO `m_ingredientsstatement` VALUES (1,'xyz',NULL,NULL,'A',NULL,2,NULL,1,1,NULL),(2,'zyx',NULL,NULL,'A',NULL,3,NULL,2,1,NULL);
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
  UNIQUE KEY `UM_MARKETINGSECTION_ID_639050` (`ID`),
  KEY `MMARKETINGSECTIONFKIDMASTER64599` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MMARKETINGSECTIONFKIDMMARKE64612` (`FK_ID_M_MARKETINGSECTION`)
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
  UNIQUE KEY `UM_MARKETINGSTATEMENT_ID_639150` (`ID`),
  KEY `MMARKETINGSTATEMENTFKIDMMAR64546` (`FK_ID_M_MARKETINGSECTION`),
  KEY `MMARKETINGSTATEMENTFKIDMMAR64604` (`FK_ID_M_MARKETINGSTATEMENT`)
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
  UNIQUE KEY `UMSTORAGEDISPOSALDRIVINGCON63922` (`ID`),
  KEY `MSTORAGEDISPOSALDRIVINGCONV64512` (`FK_ID_M_STORAGEDISPOSALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_storagedisposaldrivingconvol`
--

LOCK TABLES `m_storagedisposaldrivingconvol` WRITE;
/*!40000 ALTER TABLE `m_storagedisposaldrivingconvol` DISABLE KEYS */;
INSERT INTO `m_storagedisposaldrivingconvol` VALUES (1,'1',1);
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
  UNIQUE KEY `UM_STORAGEDISPOSALSECTIONID63926` (`ID`),
  KEY `MSTORAGEDISPOSALSECTIONFKID64594` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MSTORAGEDISPOSALSECTIONFKID64597` (`FK_ID_M_STORAGEDISPOSALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_storagedisposalsection`
--

LOCK TABLES `m_storagedisposalsection` WRITE;
/*!40000 ALTER TABLE `m_storagedisposalsection` DISABLE KEYS */;
INSERT INTO `m_storagedisposalsection` VALUES (1,NULL,NULL,'s&d','sss',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL);
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
  UNIQUE KEY `UMSTORAGEDISPOSALSTATEMENTI63938` (`ID`),
  KEY `MSTORAGEDISPOSALSTATEMENTFK64582` (`FK_ID_M_STORAGEDISPOSALSECTION`),
  KEY `MSTORAGEDISPOSALSTATEMENTFK64585` (`FK_ID_M_STORAGEDISPOSALSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_storagedisposalstatement`
--

LOCK TABLES `m_storagedisposalstatement` WRITE;
/*!40000 ALTER TABLE `m_storagedisposalstatement` DISABLE KEYS */;
INSERT INTO `m_storagedisposalstatement` VALUES (1,NULL,'abc',NULL,'def',NULL,'NA',NULL,NULL,NULL,1,NULL);
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
  UNIQUE KEY `UM_USAGE_ID_639490` (`ID`),
  KEY `M_USAGE_FK_IDMUSAGEFOOTNOTE64500` (`FK_ID_M_USAGEFOOTNOTE`),
  KEY `M_USAGE_FK_ID_M_USAGETYPE_645110` (`FK_ID_M_USAGETYPE`),
  KEY `M_USAGE_FK_ID_M_USAGE_646090` (`FK_ID_M_USAGE`),
  KEY `MUSAGEFKIDMASTERLABELCONTEN64637` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_usage`
--

LOCK TABLES `m_usage` WRITE;
/*!40000 ALTER TABLE `m_usage` DISABLE KEYS */;
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
  UNIQUE KEY `UM_USAGEFOOTNOTE_ID_639590` (`ID`),
  KEY `MUSAGEFOOTNOTEFKIDMASTERLAB64499` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_usagefootnote`
--

LOCK TABLES `m_usagefootnote` WRITE;
/*!40000 ALTER TABLE `m_usagefootnote` DISABLE KEYS */;
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
  UNIQUE KEY `UM_USAGEORDERING_ID_639630` (`ID`),
  KEY `M_USAGEORDERING_FK_IDMUSAGE64543` (`FK_ID_M_USAGE`),
  KEY `MUSAGEORDERINGFKIDMDIRECTIO64544` (`FK_ID_M_DIRECTIONSFORUSESTATEMEN`),
  KEY `MUSAGEORDERINGFKIDMMARKETIN64640` (`FK_ID_M_MARKETINGSTATEMENT`)
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
  UNIQUE KEY `UM_USAGETYPE_ID_639660` (`ID`),
  KEY `MUSAGETYPEFKIDMASTERLABELCO64510` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_usagetype`
--

LOCK TABLES `m_usagetype` WRITE;
/*!40000 ALTER TABLE `m_usagetype` DISABLE KEYS */;
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
  UNIQUE KEY `UMASTERLABELCONTENT_ID_639700` (`ID`),
  KEY `MASTERLABELCONTENTFKIDMASTE64553` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MASTERLABELCONTENTFKIDMASTE64641` (`FK_ID_MASTERPRODUCT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masterlabelcontent`
--

LOCK TABLES `masterlabelcontent` WRITE;
/*!40000 ALTER TABLE `masterlabelcontent` DISABLE KEYS */;
INSERT INTO `masterlabelcontent` VALUES (1,'1.1','2014-12-17 11:10:50','2014-12-17 11:10:50',NULL,NULL,'0.7','Virucidal',NULL,NULL,NULL,NULL,1);
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
  UNIQUE KEY `UMASTERPRODUCT_ID_639800` (`ID`),
  KEY `MASTERPRODUCTFKIDPRIMARYREG64646` (`FK_ID_PRIMARYREGISTRANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masterproduct`
--

LOCK TABLES `masterproduct` WRITE;
/*!40000 ALTER TABLE `masterproduct` DISABLE KEYS */;
INSERT INTO `masterproduct` VALUES (1,'HWS-256','123','descr','DQ',NULL,'456',NULL,NULL,4,NULL,2);
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
  UNIQUE KEY `UMMMASTERPRODUCTFRSUBREGIST64525` (`FK_ID_SUBREGISTRANT`,`FK_ID_MASTERPRODUCT`),
  KEY `MMMASTERPRODUCTFRSUBREGISTR64525` (`FK_ID_SUBREGISTRANT`),
  KEY `MMMASTERPRODUCTFRSUBREGISTR64527` (`FK_ID_MASTERPRODUCT`)
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
  UNIQUE KEY `UMMUSERGROUPCONTAINSMEMBRZU64654` (`FK_ID_Z_USER`,`FK_ID_USERGROUP`),
  KEY `MMUSERGROUPCONTAINSMEMBRZUS64654` (`FK_ID_Z_USER`),
  KEY `MMUSERGROUPCONTAINSMEMBRZUS64656` (`FK_ID_USERGROUP`)
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
  UNIQUE KEY `UMMMUSAGEDRVSMDIRECTIONSFOR64505` (`FK_ID_M_DIRECTIONSFORUSESECTION`,`FK_ID_M_USAGE`),
  KEY `MMMUSAGEDRVSMDIRECTIONSFORU64505` (`FK_ID_M_DIRECTIONSFORUSESECTION`),
  KEY `MMMUSAGEDRVSMDIRECTIONSFORU64507` (`FK_ID_M_USAGE`)
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
  UNIQUE KEY `UMMSPLDDIRECTIONSFORUSESECT64565` (`FK_ID_SPLD_USAGE`,`FK_ID_SPLDDIRECTIONSFORUSESECTIO`),
  KEY `MMSPLDDIRECTIONSFORUSESECTI64565` (`FK_ID_SPLD_USAGE`),
  KEY `MMSPLDDIRECTIONSFORUSESECTI64567` (`FK_ID_SPLDDIRECTIONSFORUSESECTIO`)
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
  UNIQUE KEY `UMMSPLDMARKETINGSECTIONFRSP64569` (`FK_ID_SPLD_USAGE`,`FK_ID_SPLD_MARKETINGSECTION`),
  KEY `MMSPLDMARKETINGSECTIONFRSPL64569` (`FK_ID_SPLD_USAGE`),
  KEY `MMSPLDMARKETINGSECTIONFRSPL64571` (`FK_ID_SPLD_MARKETINGSECTION`)
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
  `LOGINNAME` varchar(128) NOT NULL,
  `NAME` varchar(254) NOT NULL,
  `DESCRIPTION` varchar(254) DEFAULT NULL,
  `ADMINISTRATORPASSWORD` varchar(128) DEFAULT NULL,
  `ROLE` varchar(1) DEFAULT NULL,
  UNIQUE KEY `UORGANIZATION_ID_639920` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'Admin','Administrator','ePamms Administrator','zPrefixaxJL9G0aC/gDIS3KuNB1v5rjqxJCv9dH1fVslboRY5f2RtGohgE81A==','P'),(2,'Lonza','Lonza','H & S Chemicals Division','zPrefixPCPN0CD61dI1Mj/5BJdYVyjcPZI2POuULYY0bIaq6fHS5v/NRb5hMQ==','P');
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
  UNIQUE KEY `UPERSON_ID_640000` (`ID`),
  KEY `PERSON_LASTNAME_640010` (`LASTNAME`),
  KEY `PERSON_EMAILADDRESS_640110` (`EMAILADDRESS`),
  KEY `PERSON_HOMEPHONE_640060` (`HOMEPHONE`),
  KEY `PERSON_GENDER_640050` (`GENDER`),
  KEY `PERSON_WORKPHONE_640080` (`WORKPHONE`),
  KEY `PERSON_FK_ID_ADDRESS_646570` (`FK_ID_ADDRESS`),
  KEY `PERSON_FK_ID_ORGANIZATION_646580` (`FK_ID_ORGANIZATION`),
  KEY `PERSONHASCONTACTIDORGANIZAT64659` (`HASCONTACTID_ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,'Sloan','Robert',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sr. Regulatory Services Associate',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2);
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
  `FK_ID_ORGANIZATION` int(11) NOT NULL,
  UNIQUE KEY `UPRIMARYREGISTRANT_ID_640250` (`ID`),
  KEY `PRIMARYREGISTRANTFKIDORGANI64534` (`FK_ID_ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primaryregistrant`
--

LOCK TABLES `primaryregistrant` WRITE;
/*!40000 ALTER TABLE `primaryregistrant` DISABLE KEYS */;
INSERT INTO `primaryregistrant` VALUES (1,NULL,1),(2,'47371',2);
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
  UNIQUE KEY `UPRIMARYSUB_ID_640290` (`ID`),
  KEY `PRIMARYSUBFKIDPRIMARYREGIST64498` (`FK_ID_PRIMARYREGISTRANT`),
  KEY `PRIMARYSUBFKIDSUBREGISTRANT64651` (`FK_ID_SUBREGISTRANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primarysub`
--

LOCK TABLES `primarysub` WRITE;
/*!40000 ALTER TABLE `primarysub` DISABLE KEYS */;
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
  UNIQUE KEY `US_DILUTIONGROUP_ID_638200` (`ID`),
  KEY `SDILUTIONGROUPFKIDSUBREGLAB64508` (`FK_ID_SUBREGLABELCONTENT`),
  KEY `SDILUTIONGROUPFKIDMDILUTION64509` (`FK_ID_M_DILUTIONGROUP`)
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
  UNIQUE KEY `USDIRECTIONSFORUSESECTIONID64032` (`ID`),
  KEY `SDIRECTIONSFORUSESECTIONFKI64601` (`FK_ID_M_DIRECTIONSFORUSESECTION`),
  KEY `SDIRECTIONSFORUSESECTIONFKI64620` (`FK_ID_SUBREGLABELCONTENT`)
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
  UNIQUE KEY `USDIRECTIONSFORUSESTATEMENT64045` (`ID`),
  KEY `SDIRECTIONSFORUSESTATEMENTF64587` (`FK_ID_M_DIRECTIONSFORUSESTATEMEN`),
  KEY `SDIRECTIONSFORUSESTATEMENTF64621` (`FK_ID_S_DIRECTIONSFORUSESECTION`)
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
  UNIQUE KEY `US_GENERALSECTION_ID_640550` (`ID`),
  KEY `SGENERALSECTIONFKIDMGENERAL64578` (`FK_ID_M_GENERALSECTION`),
  KEY `SGENERALSECTIONFKIDSUBREGLA64613` (`FK_ID_SUBREGLABELCONTENT`)
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
  UNIQUE KEY `US_GENERALSTATEMENT_ID_640680` (`ID`),
  KEY `SGENERALSTATEMENTFKIDMGENER64575` (`FK_ID_M_GENERALSTATEMENT`),
  KEY `SGENERALSTATEMENTFKIDSGENER64614` (`FK_ID_S_GENERALSECTION`)
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
  UNIQUE KEY `US_HUMANHAZARDSECTION_ID_640750` (`ID`),
  KEY `SHUMANHAZARDSECTIONFKIDMHUM64605` (`FK_ID_M_HUMANHAZARDSECTION`),
  KEY `SHUMANHAZARDSECTIONFKIDSUBR64617` (`FK_ID_SUBREGLABELCONTENT`)
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
  UNIQUE KEY `US_INGREDIENTSSECTION_ID_640880` (`ID`),
  KEY `SINGREDIENTSSECTIONFKIDSUBR64615` (`FK_ID_SUBREGLABELCONTENT`),
  KEY `SINGREDIENTSSECTIONFKIDMING64627` (`FK_ID_M_INGREDIENTSSECTION`)
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
  UNIQUE KEY `US_INGREDIENTSSTATEMENT_ID_64099` (`ID`),
  KEY `SINGREDIENTSSTATEMENTFKIDSI64616` (`FK_ID_S_INGREDIENTSSECTION`),
  KEY `SINGREDIENTSSTATEMENTFKIDMI64630` (`FK_ID_M_INGREDIENTSSTATEMENT`)
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
  UNIQUE KEY `US_MARKETINGSECTION_ID_641090` (`ID`),
  KEY `SMARKETINGSECTIONFKIDSMARKE64528` (`FK_ID_S_MARKETINGSECTION`),
  KEY `SMARKETINGSECTIONFKIDMMARKE64610` (`FK_ID_M_MARKETINGSECTION`),
  KEY `SMARKETINGSECTIONFKIDSUBREG64625` (`FK_ID_SUBREGLABELCONTENT`)
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
  UNIQUE KEY `US_MARKETINGSTATEMENT_ID_641190` (`ID`),
  KEY `SMARKETINGSTATEMENTFKIDSMAR64530` (`FK_ID_S_MARKETINGSTATEMENT`),
  KEY `SMARKETINGSTATEMENTFKIDSMAR64547` (`FK_ID_S_MARKETINGSECTION`),
  KEY `SMARKETINGSTATEMENTFKIDMMAR64611` (`FK_ID_M_MARKETINGSTATEMENT`)
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
  UNIQUE KEY `US_STORAGEDISPOSALSECTIONID64126` (`ID`),
  KEY `SSTORAGEDISPOSALSECTIONFKID64595` (`FK_ID_M_STORAGEDISPOSALSECTION`),
  KEY `SSTORAGEDISPOSALSECTIONFKID64618` (`FK_ID_SUBREGLABELCONTENT`)
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
  UNIQUE KEY `USSTORAGEDISPOSALSTATEMENTI64138` (`ID`),
  KEY `SSTORAGEDISPOSALSTATEMENTFK64583` (`FK_ID_M_STORAGEDISPOSALSTATEMENT`),
  KEY `SSTORAGEDISPOSALSTATEMENTFK64619` (`FK_ID_S_STORAGEDISPOSALSECTION`)
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
  UNIQUE KEY `US_USAGE_ID_641490` (`ID`),
  KEY `S_USAGE_FK_ID_M_USAGE_646080` (`FK_ID_M_USAGE`),
  KEY `SUSAGEFKIDSUBREGLABELCONTEN64622` (`FK_ID_SUBREGLABELCONTENT`),
  KEY `S_USAGE_FK_ID_S_USAGETYPE_646390` (`FK_ID_S_USAGETYPE`)
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
  UNIQUE KEY `US_USAGEORDERING_ID_641590` (`ID`),
  KEY `SUSAGEORDERINGFKIDSMARKETIN64531` (`FK_ID_S_MARKETINGSTATEMENT`),
  KEY `SUSAGEORDERINGFKIDSDIRECTIO64590` (`FK_ID_S_DIRECTIONSFORUSESTATEMEN`),
  KEY `S_USAGEORDERING_FK_IDSUSAGE64600` (`FK_ID_S_USAGE`)
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
  UNIQUE KEY `US_USAGETYPE_ID_641620` (`ID`),
  KEY `SUSAGETYPEFKIDSUBREGLABELCO64638` (`FK_ID_SUBREGLABELCONTENT`)
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
  UNIQUE KEY `USPLDDIRECTIONSFORUSESECTIO64166` (`ID`),
  KEY `SPLDDIRECTIONSFORUSESECTION64540` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDDIRECTIONSFORUSESECTION64552` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDDIRECTIONSFORUSESECTION64602` (`FK_ID_S_DIRECTIONSFORUSESECTION`)
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
  UNIQUE KEY `USPLDDIRECTIONSFORUSESTATEM64180` (`ID`),
  KEY `SPLDDIRECTIONSFORUSESTATEME64563` (`FK_ID_SPLDDIRECTIONSFORUSESECTIO`),
  KEY `SPLDDIRECTIONSFORUSESTATEME64588` (`FK_ID_S_DIRECTIONSFORUSESTATEMEN`)
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
  UNIQUE KEY `USPLD_GENERALSECTION_ID_641930` (`ID`),
  KEY `SPLDGENERALSECTIONFKIDSPLDS64541` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDGENERALSECTIONFKIDSUBRE64548` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDGENERALSECTIONFKIDSGENE64580` (`FK_ID_S_GENERALSECTION`)
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
  UNIQUE KEY `USPLD_GENERALSTATEMENT_ID_642070` (`ID`),
  KEY `SPLDGENERALSTATEMENTFKIDSPL64560` (`FK_ID_SPLD_GENERALSECTION`),
  KEY `SPLDGENERALSTATEMENTFKIDSGE64576` (`FK_ID_S_GENERALSTATEMENT`)
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
  UNIQUE KEY `USPLD_HUMANHAZARDSECTION_ID64217` (`ID`),
  KEY `SPLDHUMANHAZARDSECTIONFKIDS64549` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDHUMANHAZARDSECTIONFKIDS64606` (`FK_ID_S_HUMANHAZARDSECTION`)
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
  UNIQUE KEY `USPLD_INGREDIENTSSECTION_ID64230` (`ID`),
  KEY `SPLDINGREDIENTSSECTIONFKIDS64538` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDINGREDIENTSSECTIONFKIDS64550` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDINGREDIENTSSECTIONFKIDS64628` (`FK_ID_S_INGREDIENTSSECTION`)
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
  UNIQUE KEY `USPLDINGREDIENTSSTATEMENTID64241` (`ID`),
  KEY `SPLDINGREDIENTSSTATEMENTFKI64561` (`FK_ID_SPLD_INGREDIENTSSECTION`),
  KEY `SPLDINGREDIENTSSTATEMENTFKI64631` (`FK_ID_S_INGREDIENTSSTATEMENT`)
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
  UNIQUE KEY `USPLD_LLD_ID_642510` (`ID`),
  KEY `SPLDLLDFKIDSUBREGPHYSICALLA64559` (`FK_ID_SUBREGPHYSICALLABELDEF`)
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
  UNIQUE KEY `USPLD_MARKETINGSECTION_ID_642700` (`ID`),
  KEY `SPLDMARKETINGSECTIONFKIDSMA64529` (`FK_ID_S_MARKETINGSECTION`),
  KEY `SPLDMARKETINGSECTIONFKIDSPL64542` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDMARKETINGSECTIONFKIDSUB64554` (`FK_ID_SUBREGPHYSICALLABELDEF`)
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
  UNIQUE KEY `USPLD_MARKETINGSTATEMENT_ID64281` (`ID`),
  KEY `SPLDMARKETINGSTATEMENTFKIDS64536` (`FK_ID_S_MARKETINGSTATEMENT`),
  KEY `SPLDMARKETINGSTATEMENTFKIDS64545` (`FK_ID_SPLD_MARKETINGSECTION`)
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
  UNIQUE KEY `USPLD_SECTION_ID_642910` (`ID`)
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
  UNIQUE KEY `USPLDSTORAGEDISPOSALSECTION64313` (`ID`),
  KEY `SPLDSTORAGEDISPOSALSECTIONF64539` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDSTORAGEDISPOSALSECTIONF64551` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDSTORAGEDISPOSALSECTIONF64596` (`FK_ID_S_STORAGEDISPOSALSECTION`)
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
  UNIQUE KEY `USPLDSTORAGEDISPOSALSTATEME64326` (`ID`),
  KEY `SPLDSTORAGEDISPOSALSTATEMEN64562` (`FK_ID_SPLD_STORAGEDISPOSALSECTIO`),
  KEY `SPLDSTORAGEDISPOSALSTATEMEN64584` (`FK_ID_S_STORAGEDISPOSALSTATEMENT`)
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
  UNIQUE KEY `USPLD_USAGE_ID_643400` (`ID`),
  KEY `SPLDUSAGEFKIDSUBREGPHYSICAL64555` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLD_USAGE_FK_ID_S_USAGE_645580` (`FK_ID_S_USAGE`),
  KEY `SPLD_USAGEFKIDSPLDUSAGETYPE64624` (`FK_ID_SPLD_USAGETYPE`)
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
  UNIQUE KEY `USPLD_USAGEORDERING_ID_643500` (`ID`),
  KEY `SPLDUSAGEORDERINGFKIDSPLDUS64523` (`FK_ID_SPLD_USAGE`),
  KEY `SPLDUSAGEORDERINGFKIDSPLDMA64537` (`FK_ID_SPLD_MARKETINGSTATEMENT`),
  KEY `SPLDUSAGEORDERINGFKIDSPLDDI64589` (`FKIDSPLDDIRECTIONSFORUSESTATEMEN`)
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
  UNIQUE KEY `USPLD_USAGETYPE_ID_643530` (`ID`),
  KEY `SPLDUSAGETYPEFKIDSUBREGPHYS64623` (`FK_ID_SUBREGPHYSICALLABELDEF`)
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
  UNIQUE KEY `USUBREGISTRANT_ID_643570` (`ID`),
  KEY `SUBREGISTRANTFKIDORGANIZATI64535` (`FK_ID_ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subregistrant`
--

LOCK TABLES `subregistrant` WRITE;
/*!40000 ALTER TABLE `subregistrant` DISABLE KEYS */;
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
  UNIQUE KEY `USUBREGLABELCONTENT_ID_643610` (`ID`),
  KEY `SUBREGLABELCONTENTFKIDSUBRE64557` (`FK_ID_SUBREGLABELCONTENT`),
  KEY `SUBREGLABELCONTENTFKIDSUBRE64648` (`FK_ID_SUBREGPRODUCT`),
  KEY `SUBREGLABELCONTENTFKIDMASTE64650` (`FK_ID_MASTERLABELCONTENT`)
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
  UNIQUE KEY `USUBREGPHYSICALLABELDEF_ID_64375` (`ID`),
  KEY `SUBREGPHYSICALLABELDEFFKIDS64556` (`FK_ID_SUBREGLABELCONTENT`)
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
  UNIQUE KEY `USUBREGPRODUCT_ID_643820` (`ID`),
  KEY `SUBREGPRODUCTFKIDMASTERPROD64647` (`FK_ID_MASTERPRODUCT`),
  KEY `SUBREGPRODUCTFKIDSUBREGISTR64649` (`FK_ID_SUBREGISTRANT`)
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
  UNIQUE KEY `UUSERGROUP_ID_644160` (`ID`)
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
  UNIQUE KEY `Uz_DOMAIN_ID_636420` (`ID`)
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
  `EMAILPASSWORD` varchar(128) DEFAULT NULL,
  `EMAILUSERNAME` varchar(254) DEFAULT NULL,
  `SMTPSERVER` varchar(254) DEFAULT NULL,
  `ACTIVE` varchar(1) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  `z_NOTE` longtext,
  `LASTLOGINDATETIME` datetime DEFAULT NULL,
  `CREATEDDATETIME` datetime DEFAULT NULL,
  `MODIFIEDDATETIME` datetime DEFAULT NULL,
  `CREATEDBY` varchar(128) DEFAULT NULL,
  `LASTMODIFIEDBY` varchar(128) DEFAULT NULL,
  `FK_ID_PERSON` int(11) DEFAULT NULL,
  UNIQUE KEY `Uz_USER_ID_643990` (`ID`),
  KEY `z_USER_USERNAME_644000` (`USERNAME`),
  KEY `z_USER_FK_ID_PERSON_646450` (`FK_ID_PERSON`)
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
  UNIQUE KEY `UZEIDONGENKEYTABLETABLENAME64426` (`TABLENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zeidongenkeytable`
--

LOCK TABLES `zeidongenkeytable` WRITE;
/*!40000 ALTER TABLE `zeidongenkeytable` DISABLE KEYS */;
INSERT INTO `zeidongenkeytable` VALUES (2,'ADDRESS'),(1,'MASTERLABELCONTENT'),(1,'MASTERPRODUCT'),(3,'M_GENERALSECTION'),(1,'M_HUMANHAZARDSECTION'),(1,'M_INGREDIENTSSECTION'),(2,'M_INGREDIENTSSTATEMENT'),(1,'M_STORAGEDISPOSALDRIVINGCONVOL'),(1,'M_STORAGEDISPOSALSECTION'),(1,'M_STORAGEDISPOSALSTATEMENT'),(2,'ORGANIZATION'),(2,'PERSON'),(2,'PRIMARYREGISTRANT');
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
  UNIQUE KEY `UZEIDONLOCKING_LOCKINGKEY_644290` (`LOD_NAME`,`KEYVALUE`)
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

-- Dump completed on 2014-12-17 14:29:17
