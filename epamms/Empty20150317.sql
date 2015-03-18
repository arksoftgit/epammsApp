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
  UNIQUE KEY `UADDRESS_ID_820250` (`ID`),
  KEY `ADDRESS_PHONE1_820340` (`PHONE`),
  KEY `ADDRESS_CITY_820290` (`CITY`),
  KEY `ADDRESS_STATE_820300` (`STATE`),
  KEY `ADDRESS_ZIPCODE_820330` (`ZIPCODE`),
  KEY `ADDRESS_FK_ID_ORGANIZATION_82983` (`FK_ID_ORGANIZATION`),
  KEY `ADDRESS_FK_IDORGANIZATION0282984` (`FK_ID_ORGANIZATION02`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UDOMAINVALUE_DOMAINVALUEID_82062` (`DOMAINVALUE_TOKEN`),
  KEY `DOMAINVALUE_FK_ID_Z_DOMAIN_83103` (`FK_ID_Z_DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UEPA_APPLICATIONTYPE_ID_820640` (`ID`),
  KEY `EPAAPPLICATIONTYPEFKIDEPACH82973` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UEPA_AREAOFUSE_ID_820690` (`ID`),
  KEY `EPAAREAOFUSEFKIDEPACHEMICAL83085` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UEPA_CHEMICALFAMILY_ID_820740` (`ID`),
  KEY `EPACHEMICALFAMILYFKIDEPAMMS82971` (`FK_ID_EPAMMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UEPA_CLAIM_ID_820800` (`ID`),
  KEY `EPACLAIMFKIDEPACHEMICALFAMI83044` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UEPA_STORAGEDISPOSAL_ID_820860` (`ID`),
  KEY `EPASTORAGEDISPOSALFKIDEPACH83084` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UEPA_SURFACE_ID_820930` (`ID`),
  KEY `EPASURFACEFKIDEPACHEMICALFA83086` (`FK_ID_EPA_CHEMICALFAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `epamms`
--

DROP TABLE IF EXISTS `epamms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epamms` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(128) NOT NULL,
  UNIQUE KEY `UEPAMMS_ID_820980` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UFEEDBACK_ID_821020` (`ID`),
  KEY `FEEDBACK_FK_ID_ORGANIZATION82970` (`FK_ID_ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UGRAPHICLABELCONTROL_ID_821090` (`ID`),
  KEY `GRAPHICLABELCONTROLFKIDGRAP83095` (`FK_ID_GRAPHICLABELDEFINITION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UGRAPHICLABELDEFINITION_ID_82117` (`ID`),
  KEY `GRAPHICLABELDEFINITIONFKIDS83093` (`FK_ID_SUBREGISTRANT`),
  KEY `GRAPHICLABELDEFINITIONFKIDS83094` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UKEYWORD_ID_821240` (`ID`),
  KEY `KEYWORD_FK_ID_EPAMMS_829720` (`FK_ID_EPAMMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `ULLD_ID_821280` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `ULLD_BLOCK_ID_821470` (`ID`),
  KEY `LLD_BLOCK_FK_ID_SPLDSECTION82969` (`FK_ID_SPLD_SECTION`),
  KEY `LLD_BLOCK_FK_ID_LLD_PANEL_830230` (`FK_ID_LLD_PANEL`),
  KEY `LLD_BLOCK_FK_ID_LLD_BLOCK_830300` (`FK_ID_LLD_BLOCK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `ULLD_PAGE_ID_821950` (`ID`),
  KEY `LLD_PAGE_FK_ID_LLD_829650` (`FK_ID_LLD`),
  KEY `LLD_PAGE_FK_ID_SPLD_LLD_829660` (`FK_ID_SPLD_LLD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `ULLD_PANEL_ID_822040` (`ID`),
  KEY `LLD_PANEL_FK_ID_LLD_PAGE_829640` (`FK_ID_LLD_PAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `ULLDSPECIALSECTIONATTRIBUTE82253` (`ID`),
  KEY `LLDSPECIALSECTIONATTRIBUTE182967` (`PF1ID_LLD_BLOCK`),
  KEY `LLDSPECIALSECTIONATTRIBUTE282968` (`PF2ID_LLD_BLOCK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_DILUTIONCHARTENTRY_ID_822570` (`ID`),
  KEY `MDILUTIONCHARTENTRYFKIDMAST82952` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_DILUTIONGROUP_ID_822620` (`ID`),
  KEY `MDILUTIONGROUPFKIDMASTERLAB82953` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_DILUTIONGROUPITEM_ID_822670` (`ID`),
  KEY `MDILUTIONGROUPITEMFKIDMDILU82954` (`FK_ID_M_DILUTIONGROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UMDIRECTIONSFORUSESECTIONID82271` (`ID`),
  KEY `MDIRECTIONSFORUSESECTIONFKI83043` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MDIRECTIONSFORUSESECTIONFKI83054` (`FK_ID_M_DIRECTIONSFORUSESECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UMDIRECTIONSFORUSESTATEMENT82285` (`ID`),
  KEY `MDIRECTIONSFORUSESTATEMENTF83037` (`FK_ID_M_DIRECTIONSFORUSESECTION`),
  KEY `MDIRECTIONSFORUSESTATEMENTF83042` (`FK_ID_M_DIRECTIONSFORUSESTATEMEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_GENERALSECTION_ID_822950` (`ID`),
  KEY `MGENERALSECTIONFKIDMASTERLA83024` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MGENERALSECTIONFKIDMGENERAL83032` (`FK_ID_M_GENERALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_GENERALSTATEMENT_ID_823080` (`ID`),
  KEY `MGENERALSTATEMENTFKIDMGENER83025` (`FK_ID_M_GENERALSECTION`),
  KEY `MGENERALSTATEMENTFKIDMGENER83028` (`FK_ID_M_GENERALSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_HUMANHAZARDSECTION_ID_823150` (`ID`),
  KEY `MHUMANHAZARDSECTIONFKIDMAST83049` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MHUMANHAZARDSECTIONFKIDMHUM83058` (`FK_ID_M_HUMANHAZARDSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_INGREDIENTSSECTION_ID_823280` (`ID`),
  KEY `MINGREDIENTSSECTIONFKIDMING83080` (`FK_ID_M_INGREDIENTSSECTION`),
  KEY `MINGREDIENTSSECTIONFKIDMAST83087` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_INGREDIENTSSTATEMENT_ID_82339` (`ID`),
  KEY `MINGREDIENTSSTATEMENTFKIDMI83077` (`FK_ID_M_INGREDIENTSSECTION`),
  KEY `MINGREDIENTSSTATEMENTFKIDMI83083` (`FK_ID_M_INGREDIENTSSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_MARKETINGSECTION_ID_823490` (`ID`),
  KEY `MMARKETINGSECTIONFKIDMASTER83050` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MMARKETINGSECTIONFKIDMMARKE83063` (`FK_ID_M_MARKETINGSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_MARKETINGSTATEMENT_ID_823590` (`ID`),
  KEY `MMARKETINGSTATEMENTFKIDMMAR82997` (`FK_ID_M_MARKETINGSECTION`),
  KEY `MMARKETINGSTATEMENTFKIDMMAR83055` (`FK_ID_M_MARKETINGSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UMSTORAGEDISPOSALDRIVINGCON82366` (`ID`),
  KEY `MSTORAGEDISPOSALDRIVINGCONV82963` (`FK_ID_M_STORAGEDISPOSALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_STORAGEDISPOSALSECTIONID82370` (`ID`),
  KEY `MSTORAGEDISPOSALSECTIONFKID83045` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MSTORAGEDISPOSALSECTIONFKID83048` (`FK_ID_M_STORAGEDISPOSALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UMSTORAGEDISPOSALSTATEMENTI82382` (`ID`),
  KEY `MSTORAGEDISPOSALSTATEMENTFK83033` (`FK_ID_M_STORAGEDISPOSALSECTION`),
  KEY `MSTORAGEDISPOSALSTATEMENTFK83036` (`FK_ID_M_STORAGEDISPOSALSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_USAGE_ID_823930` (`ID`),
  KEY `M_USAGE_FK_IDMUSAGEFOOTNOTE82951` (`FK_ID_M_USAGEFOOTNOTE`),
  KEY `M_USAGE_FK_ID_M_USAGETYPE_829620` (`FK_ID_M_USAGETYPE`),
  KEY `M_USAGE_FK_ID_M_USAGE_830600` (`FK_ID_M_USAGE`),
  KEY `MUSAGEFKIDMASTERLABELCONTEN83088` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_USAGEFOOTNOTE_ID_824030` (`ID`),
  KEY `MUSAGEFOOTNOTEFKIDMASTERLAB82950` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_USAGEORDERING_ID_824070` (`ID`),
  KEY `M_USAGEORDERING_FK_IDMUSAGE82994` (`FK_ID_M_USAGE`),
  KEY `MUSAGEORDERINGFKIDMDIRECTIO82995` (`FK_ID_M_DIRECTIONSFORUSESTATEMEN`),
  KEY `MUSAGEORDERINGFKIDMMARKETIN83091` (`FK_ID_M_MARKETINGSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UM_USAGETYPE_ID_824100` (`ID`),
  KEY `MUSAGETYPEFKIDMASTERLABELCO82961` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UMASTERLABELCONTENT_ID_824140` (`ID`),
  KEY `MASTERLABELCONTENTFKIDMASTE83004` (`FK_ID_MASTERLABELCONTENT`),
  KEY `MASTERLABELCONTENTFKIDMASTE83092` (`FK_ID_MASTERPRODUCT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UMASTERPRODUCT_ID_824240` (`ID`),
  KEY `MASTERPRODUCTFKIDPRIMARYREG83097` (`FK_ID_PRIMARYREGISTRANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mm_masterproduct_fr_subregistran`
--

DROP TABLE IF EXISTS `mm_masterproduct_fr_subregistran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_masterproduct_fr_subregistran` (
  `FK_ID_SUBREGISTRANT` int(11) NOT NULL,
  `FK_ID_MASTERPRODUCT` int(11) NOT NULL,
  UNIQUE KEY `UMMMASTERPRODUCTFRSUBREGIST82976` (`FK_ID_SUBREGISTRANT`,`FK_ID_MASTERPRODUCT`),
  KEY `MMMASTERPRODUCTFRSUBREGISTR82976` (`FK_ID_SUBREGISTRANT`),
  KEY `MMMASTERPRODUCTFRSUBREGISTR82978` (`FK_ID_MASTERPRODUCT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mm_usergroup_containsmembr_z_use`
--

DROP TABLE IF EXISTS `mm_usergroup_containsmembr_z_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_usergroup_containsmembr_z_use` (
  `FK_ID_Z_USER` int(11) NOT NULL,
  `FK_ID_USERGROUP` int(11) NOT NULL,
  UNIQUE KEY `UMMUSERGROUPCONTAINSMEMBRZU83105` (`FK_ID_Z_USER`,`FK_ID_USERGROUP`),
  KEY `MMUSERGROUPCONTAINSMEMBRZUS83105` (`FK_ID_Z_USER`),
  KEY `MMUSERGROUPCONTAINSMEMBRZUS83107` (`FK_ID_USERGROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mmmusagedrvsmdirectionsforusesec`
--

DROP TABLE IF EXISTS `mmmusagedrvsmdirectionsforusesec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmmusagedrvsmdirectionsforusesec` (
  `FK_ID_M_DIRECTIONSFORUSESECTION` int(11) NOT NULL,
  `FK_ID_M_USAGE` int(11) NOT NULL,
  UNIQUE KEY `UMMMUSAGEDRVSMDIRECTIONSFOR82956` (`FK_ID_M_DIRECTIONSFORUSESECTION`,`FK_ID_M_USAGE`),
  KEY `MMMUSAGEDRVSMDIRECTIONSFORU82956` (`FK_ID_M_DIRECTIONSFORUSESECTION`),
  KEY `MMMUSAGEDRVSMDIRECTIONSFORU82958` (`FK_ID_M_USAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mmsplddirectionsforusesectionfrs`
--

DROP TABLE IF EXISTS `mmsplddirectionsforusesectionfrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmsplddirectionsforusesectionfrs` (
  `FK_ID_SPLD_USAGE` int(11) NOT NULL,
  `FK_ID_SPLDDIRECTIONSFORUSESECTIO` int(11) NOT NULL,
  UNIQUE KEY `UMMSPLDDIRECTIONSFORUSESECT83016` (`FK_ID_SPLD_USAGE`,`FK_ID_SPLDDIRECTIONSFORUSESECTIO`),
  KEY `MMSPLDDIRECTIONSFORUSESECTI83016` (`FK_ID_SPLD_USAGE`),
  KEY `MMSPLDDIRECTIONSFORUSESECTI83018` (`FK_ID_SPLDDIRECTIONSFORUSESECTIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mmspldmarketingsectionfrspldusag`
--

DROP TABLE IF EXISTS `mmspldmarketingsectionfrspldusag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmspldmarketingsectionfrspldusag` (
  `FK_ID_SPLD_USAGE` int(11) NOT NULL,
  `FK_ID_SPLD_MARKETINGSECTION` int(11) NOT NULL,
  UNIQUE KEY `UMMSPLDMARKETINGSECTIONFRSP83020` (`FK_ID_SPLD_USAGE`,`FK_ID_SPLD_MARKETINGSECTION`),
  KEY `MMSPLDMARKETINGSECTIONFRSPL83020` (`FK_ID_SPLD_USAGE`),
  KEY `MMSPLDMARKETINGSECTIONFRSPL83022` (`FK_ID_SPLD_MARKETINGSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UORGANIZATION_ID_824360` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UPERSON_ID_824480` (`ID`),
  KEY `PERSON_LASTNAME_824490` (`LASTNAME`),
  KEY `PERSON_EMAILADDRESS_824590` (`EMAILADDRESS`),
  KEY `PERSON_HOMEPHONE_824540` (`HOMEPHONE`),
  KEY `PERSON_GENDER_824530` (`GENDER`),
  KEY `PERSON_WORKPHONE_824560` (`WORKPHONE`),
  KEY `PERSON_FK_ID_ADDRESS_831080` (`FK_ID_ADDRESS`),
  KEY `PERSON_FK_ID_ORGANIZATION_831090` (`FK_ID_ORGANIZATION`),
  KEY `PERSONHASCONTACTIDORGANIZAT83110` (`HASCONTACTID_ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UPRIMARYREGISTRANT_ID_824730` (`ID`),
  KEY `PRIMARYREGISTRANTFKIDEPAMMS82949` (`FK_ID_EPAMMS`),
  KEY `PRIMARYREGISTRANTFKIDORGANI82985` (`FK_ID_ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UPRIMARYSUB_ID_824770` (`ID`),
  KEY `PRIMARYSUBFKIDPRIMARYREGIST82948` (`FK_ID_PRIMARYREGISTRANT`),
  KEY `PRIMARYSUBFKIDSUBREGISTRANT83102` (`FK_ID_SUBREGISTRANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `US_DILUTIONGROUP_ID_824800` (`ID`),
  KEY `SDILUTIONGROUPFKIDSUBREGLAB82959` (`FK_ID_SUBREGLABELCONTENT`),
  KEY `SDILUTIONGROUPFKIDMDILUTION82960` (`FK_ID_M_DILUTIONGROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USDIRECTIONSFORUSESECTIONID82483` (`ID`),
  KEY `SDIRECTIONSFORUSESECTIONFKI83052` (`FK_ID_M_DIRECTIONSFORUSESECTION`),
  KEY `SDIRECTIONSFORUSESECTIONFKI83071` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USDIRECTIONSFORUSESTATEMENT82496` (`ID`),
  KEY `SDIRECTIONSFORUSESTATEMENTF83038` (`FK_ID_M_DIRECTIONSFORUSESTATEMEN`),
  KEY `SDIRECTIONSFORUSESTATEMENTF83072` (`FK_ID_S_DIRECTIONSFORUSESECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `US_GENERALSECTION_ID_825060` (`ID`),
  KEY `SGENERALSECTIONFKIDMGENERAL83029` (`FK_ID_M_GENERALSECTION`),
  KEY `SGENERALSECTIONFKIDSUBREGLA83064` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `US_GENERALSTATEMENT_ID_825190` (`ID`),
  KEY `SGENERALSTATEMENTFKIDMGENER83026` (`FK_ID_M_GENERALSTATEMENT`),
  KEY `SGENERALSTATEMENTFKIDSGENER83065` (`FK_ID_S_GENERALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `US_HUMANHAZARDSECTION_ID_825260` (`ID`),
  KEY `SHUMANHAZARDSECTIONFKIDMHUM83056` (`FK_ID_M_HUMANHAZARDSECTION`),
  KEY `SHUMANHAZARDSECTIONFKIDSUBR83068` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `US_INGREDIENTSSECTION_ID_825390` (`ID`),
  KEY `SINGREDIENTSSECTIONFKIDSUBR83066` (`FK_ID_SUBREGLABELCONTENT`),
  KEY `SINGREDIENTSSECTIONFKIDMING83078` (`FK_ID_M_INGREDIENTSSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `US_INGREDIENTSSTATEMENT_ID_82550` (`ID`),
  KEY `SINGREDIENTSSTATEMENTFKIDSI83067` (`FK_ID_S_INGREDIENTSSECTION`),
  KEY `SINGREDIENTSSTATEMENTFKIDMI83081` (`FK_ID_M_INGREDIENTSSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `US_MARKETINGSECTION_ID_825600` (`ID`),
  KEY `SMARKETINGSECTIONFKIDSMARKE82979` (`FK_ID_S_MARKETINGSECTION`),
  KEY `SMARKETINGSECTIONFKIDMMARKE83061` (`FK_ID_M_MARKETINGSECTION`),
  KEY `SMARKETINGSECTIONFKIDSUBREG83076` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `US_MARKETINGSTATEMENT_ID_825700` (`ID`),
  KEY `SMARKETINGSTATEMENTFKIDSMAR82981` (`FK_ID_S_MARKETINGSTATEMENT`),
  KEY `SMARKETINGSTATEMENTFKIDSMAR82998` (`FK_ID_S_MARKETINGSECTION`),
  KEY `SMARKETINGSTATEMENTFKIDMMAR83062` (`FK_ID_M_MARKETINGSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `US_STORAGEDISPOSALSECTIONID82577` (`ID`),
  KEY `SSTORAGEDISPOSALSECTIONFKID83046` (`FK_ID_M_STORAGEDISPOSALSECTION`),
  KEY `SSTORAGEDISPOSALSECTIONFKID83069` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USSTORAGEDISPOSALSTATEMENTI82589` (`ID`),
  KEY `SSTORAGEDISPOSALSTATEMENTFK83034` (`FK_ID_M_STORAGEDISPOSALSTATEMENT`),
  KEY `SSTORAGEDISPOSALSTATEMENTFK83070` (`FK_ID_S_STORAGEDISPOSALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `US_USAGE_ID_826000` (`ID`),
  KEY `S_USAGE_FK_ID_M_USAGE_830590` (`FK_ID_M_USAGE`),
  KEY `SUSAGEFKIDSUBREGLABELCONTEN83073` (`FK_ID_SUBREGLABELCONTENT`),
  KEY `S_USAGE_FK_ID_S_USAGETYPE_830900` (`FK_ID_S_USAGETYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `US_USAGEORDERING_ID_826100` (`ID`),
  KEY `SUSAGEORDERINGFKIDSMARKETIN82982` (`FK_ID_S_MARKETINGSTATEMENT`),
  KEY `SUSAGEORDERINGFKIDSDIRECTIO83041` (`FK_ID_S_DIRECTIONSFORUSESTATEMEN`),
  KEY `S_USAGEORDERING_FK_IDSUSAGE83051` (`FK_ID_S_USAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `US_USAGETYPE_ID_826130` (`ID`),
  KEY `SUSAGETYPEFKIDSUBREGLABELCO83089` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLDDIRECTIONSFORUSESECTIO82617` (`ID`),
  KEY `SPLDDIRECTIONSFORUSESECTION82991` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDDIRECTIONSFORUSESECTION83003` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDDIRECTIONSFORUSESECTION83053` (`FK_ID_S_DIRECTIONSFORUSESECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLDDIRECTIONSFORUSESTATEM82631` (`ID`),
  KEY `SPLDDIRECTIONSFORUSESTATEME83014` (`FK_ID_SPLDDIRECTIONSFORUSESECTIO`),
  KEY `SPLDDIRECTIONSFORUSESTATEME83039` (`FK_ID_S_DIRECTIONSFORUSESTATEMEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLD_GENERALSECTION_ID_826440` (`ID`),
  KEY `SPLDGENERALSECTIONFKIDSPLDS82992` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDGENERALSECTIONFKIDSUBRE82999` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDGENERALSECTIONFKIDSGENE83031` (`FK_ID_S_GENERALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLD_GENERALSTATEMENT_ID_826580` (`ID`),
  KEY `SPLDGENERALSTATEMENTFKIDSPL83011` (`FK_ID_SPLD_GENERALSECTION`),
  KEY `SPLDGENERALSTATEMENTFKIDSGE83027` (`FK_ID_S_GENERALSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLD_HUMANHAZARDSECTION_ID82668` (`ID`),
  KEY `SPLDHUMANHAZARDSECTIONFKIDS83000` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDHUMANHAZARDSECTIONFKIDS83057` (`FK_ID_S_HUMANHAZARDSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLD_INGREDIENTSSECTION_ID82681` (`ID`),
  KEY `SPLDINGREDIENTSSECTIONFKIDS82989` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDINGREDIENTSSECTIONFKIDS83001` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDINGREDIENTSSECTIONFKIDS83079` (`FK_ID_S_INGREDIENTSSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLDINGREDIENTSSTATEMENTID82692` (`ID`),
  KEY `SPLDINGREDIENTSSTATEMENTFKI83012` (`FK_ID_SPLD_INGREDIENTSSECTION`),
  KEY `SPLDINGREDIENTSSTATEMENTFKI83082` (`FK_ID_S_INGREDIENTSSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLD_LLD_ID_827020` (`ID`),
  KEY `SPLDLLDFKIDSUBREGPHYSICALLA83010` (`FK_ID_SUBREGPHYSICALLABELDEF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLD_MARKETINGSECTION_ID_827210` (`ID`),
  KEY `SPLDMARKETINGSECTIONFKIDSMA82980` (`FK_ID_S_MARKETINGSECTION`),
  KEY `SPLDMARKETINGSECTIONFKIDSPL82993` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDMARKETINGSECTIONFKIDSUB83005` (`FK_ID_SUBREGPHYSICALLABELDEF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLD_MARKETINGSTATEMENT_ID82732` (`ID`),
  KEY `SPLDMARKETINGSTATEMENTFKIDS82987` (`FK_ID_S_MARKETINGSTATEMENT`),
  KEY `SPLDMARKETINGSTATEMENTFKIDS82996` (`FK_ID_SPLD_MARKETINGSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLD_SECTION_ID_827420` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLDSTORAGEDISPOSALSECTION82764` (`ID`),
  KEY `SPLDSTORAGEDISPOSALSECTIONF82990` (`FK_ID_SPLD_SECTION`),
  KEY `SPLDSTORAGEDISPOSALSECTIONF83002` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLDSTORAGEDISPOSALSECTIONF83047` (`FK_ID_S_STORAGEDISPOSALSECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLDSTORAGEDISPOSALSTATEME82777` (`ID`),
  KEY `SPLDSTORAGEDISPOSALSTATEMEN83013` (`FK_ID_SPLD_STORAGEDISPOSALSECTIO`),
  KEY `SPLDSTORAGEDISPOSALSTATEMEN83035` (`FK_ID_S_STORAGEDISPOSALSTATEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLD_USAGE_ID_827910` (`ID`),
  KEY `SPLDUSAGEFKIDSUBREGPHYSICAL83006` (`FK_ID_SUBREGPHYSICALLABELDEF`),
  KEY `SPLD_USAGE_FK_ID_S_USAGE_830090` (`FK_ID_S_USAGE`),
  KEY `SPLD_USAGEFKIDSPLDUSAGETYPE83075` (`FK_ID_SPLD_USAGETYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLD_USAGEORDERING_ID_828010` (`ID`),
  KEY `SPLDUSAGEORDERINGFKIDSPLDUS82974` (`FK_ID_SPLD_USAGE`),
  KEY `SPLDUSAGEORDERINGFKIDSPLDMA82988` (`FK_ID_SPLD_MARKETINGSTATEMENT`),
  KEY `SPLDUSAGEORDERINGFKIDSPLDDI83040` (`FKIDSPLDDIRECTIONSFORUSESTATEMEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USPLD_USAGETYPE_ID_828040` (`ID`),
  KEY `SPLDUSAGETYPEFKIDSUBREGPHYS83074` (`FK_ID_SUBREGPHYSICALLABELDEF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USUBREGISTRANT_ID_828080` (`ID`),
  KEY `SUBREGISTRANTFKIDORGANIZATI82986` (`FK_ID_ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USUBREGLABELCONTENT_ID_828120` (`ID`),
  KEY `SUBREGLABELCONTENTFKIDSUBRE83008` (`FK_ID_SUBREGLABELCONTENT`),
  KEY `SUBREGLABELCONTENTFKIDSUBRE83099` (`FK_ID_SUBREGPRODUCT`),
  KEY `SUBREGLABELCONTENTFKIDMASTE83101` (`FK_ID_MASTERLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USUBREGPHYSICALLABELDEF_ID_82826` (`ID`),
  KEY `SUBREGPHYSICALLABELDEFFKIDS83007` (`FK_ID_SUBREGLABELCONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `USUBREGPRODUCT_ID_828330` (`ID`),
  KEY `SUBREGPRODUCTFKIDMASTERPROD83098` (`FK_ID_MASTERPRODUCT`),
  KEY `SUBREGPRODUCTFKIDSUBREGISTR83100` (`FK_ID_SUBREGISTRANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UUSERGROUP_ID_828660` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `Uz_DOMAIN_ID_820510` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `Uz_USER_ID_828500` (`ID`),
  KEY `z_USER_USERNAME_828510` (`USERNAME`),
  KEY `z_USER_FK_ID_PERSON_830960` (`FK_ID_PERSON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zeidongenkeytable`
--

DROP TABLE IF EXISTS `zeidongenkeytable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zeidongenkeytable` (
  `CURRENTGENKEY` int(11) DEFAULT NULL,
  `TABLENAME` varchar(32) NOT NULL,
  UNIQUE KEY `UZEIDONGENKEYTABLETABLENAME82876` (`TABLENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UZEIDONLOCKING_LOCKINGKEY_828790` (`LOD_NAME`,`KEYVALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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

-- Dump completed on 2015-03-17 11:19:02
