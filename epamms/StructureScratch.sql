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
  UNIQUE KEY `Uz_USER_ID_806760` (`ID`),
  KEY `z_USER_USERNAME_806770` (`USERNAME`),
  KEY `z_USER_FK_ID_PERSON_809220` (`FK_ID_PERSON`)
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
  UNIQUE KEY `UZEIDONGENKEYTABLETABLENAME80702` (`TABLENAME`)
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
  UNIQUE KEY `UZEIDONLOCKING_LOCKINGKEY_807050` (`LOD_NAME`,`KEYVALUE`)
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

-- Dump completed on 2015-03-17 10:49:48
