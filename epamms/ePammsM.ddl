/* CREATE DATABASE ePammsM */ ;
USE ePammsM ;
DROP TABLE ADDRESS IF EXISTS ;
DROP TABLE COLOR IF EXISTS ;
DROP TABLE z_DOMAIN IF EXISTS ;
DROP TABLE DOMAINVALUE IF EXISTS ;
DROP TABLE EPA_APPLICATIONTYPE IF EXISTS ;
DROP TABLE EPA_CHEMICALFAMILY IF EXISTS ;
DROP TABLE EPA_CLAIM IF EXISTS ;
DROP TABLE EPA_LOCATION IF EXISTS ;
DROP TABLE EPA_STORAGEDISPOSAL IF EXISTS ;
DROP TABLE EPA_SURFACE IF EXISTS ;
DROP TABLE EPAMMS IF EXISTS ;
DROP TABLE FEEDBACK IF EXISTS ;
DROP TABLE FOOTNOTESYMBOL IF EXISTS ;
DROP TABLE GRAPHICLABELCONTROL IF EXISTS ;
DROP TABLE GRAPHICLABELDEFINITION IF EXISTS ;
DROP TABLE HELP IF EXISTS ;
DROP TABLE KEYWORD IF EXISTS ;
DROP TABLE LLD IF EXISTS ;
DROP TABLE LLD_BLOCK IF EXISTS ;
DROP TABLE LLD_PAGE IF EXISTS ;
DROP TABLE LLD_PANEL IF EXISTS ;
DROP TABLE LLD_SPECIALSECTIONATTRIBUTE IF EXISTS ;
DROP TABLE M_DILUTIONCHARTENTRY IF EXISTS ;
DROP TABLE M_DILUTIONGROUP IF EXISTS ;
DROP TABLE M_DILUTIONGROUPITEM IF EXISTS ;
DROP TABLE M_DIRECTIONSFORUSECATEGORY IF EXISTS ;
DROP TABLE M_DIRECTIONSFORUSESECTION IF EXISTS ;
DROP TABLE M_DIRECTIONSFORUSESTATEMENT IF EXISTS ;
DROP TABLE M_GENERALSECTION IF EXISTS ;
DROP TABLE M_GENERALSTATEMENT IF EXISTS ;
DROP TABLE M_GENERALSUBSECTION IF EXISTS ;
DROP TABLE M_HUMANHAZARDSECTION IF EXISTS ;
DROP TABLE M_INGREDIENTSSECTION IF EXISTS ;
DROP TABLE M_INGREDIENTSSTATEMENT IF EXISTS ;
DROP TABLE M_INSERTTEXT IF EXISTS ;
DROP TABLE M_INSERTTEXTKEYWORD IF EXISTS ;
DROP TABLE M_MARKETINGSECTION IF EXISTS ;
DROP TABLE M_MARKETINGSTATEMENT IF EXISTS ;
DROP TABLE M_METATABLE IF EXISTS ;
DROP TABLE M_REVIEWERNOTE IF EXISTS ;
DROP TABLE M_ROWS IF EXISTS ;
DROP TABLE M_STORAGEDISPOSALSECTION IF EXISTS ;
DROP TABLE M_STORAGEDISPOSALSTATEMENT IF EXISTS ;
DROP TABLE M_USAGE IF EXISTS ;
DROP TABLE M_USAGEFOOTNOTE IF EXISTS ;
DROP TABLE M_USAGEGROUP IF EXISTS ;
DROP TABLE M_USAGEORDERING IF EXISTS ;
DROP TABLE M_USAGETYPE IF EXISTS ;
DROP TABLE MASTERLABELCONTENT IF EXISTS ;
DROP TABLE MASTERPRODUCT IF EXISTS ;
DROP TABLE NETCONTENTS IF EXISTS ;
DROP TABLE ORGANIZATION IF EXISTS ;
DROP TABLE PERSON IF EXISTS ;
DROP TABLE PRIMARYREGISTRANT IF EXISTS ;
DROP TABLE PRIMARYSUB IF EXISTS ;
DROP TABLE RESUMEOBJECT IF EXISTS ;
DROP TABLE RESUMEPATH IF EXISTS ;
DROP TABLE REUSABLEBLOCKDEFINITION IF EXISTS ;
DROP TABLE S_DILUTIONGROUP IF EXISTS ;
DROP TABLE S_DILUTIONGROUPITEM IF EXISTS ;
DROP TABLE S_DIRECTIONSFORUSESECTION IF EXISTS ;
DROP TABLE S_DIRECTIONSFORUSESTATEMENT IF EXISTS ;
DROP TABLE S_GENERALSECTION IF EXISTS ;
DROP TABLE S_GENERALSTATEMENT IF EXISTS ;
DROP TABLE S_HUMANHAZARDSECTION IF EXISTS ;
DROP TABLE S_INGREDIENTSSECTION IF EXISTS ;
DROP TABLE S_INGREDIENTSSTATEMENT IF EXISTS ;
DROP TABLE S_INSERTTEXT IF EXISTS ;
DROP TABLE S_INSERTTEXTKEYWORD IF EXISTS ;
DROP TABLE S_MARKETINGSECTION IF EXISTS ;
DROP TABLE S_MARKETINGSTATEMENT IF EXISTS ;
DROP TABLE S_STORAGEDISPOSALSECTION IF EXISTS ;
DROP TABLE S_STORAGEDISPOSALSTATEMENT IF EXISTS ;
DROP TABLE S_USAGE IF EXISTS ;
DROP TABLE S_USAGEFOOTNOTE IF EXISTS ;
DROP TABLE S_USAGEORDERING IF EXISTS ;
DROP TABLE S_USAGETYPE IF EXISTS ;
DROP TABLE S_VERSIONCHANGEMESSAGE IF EXISTS ;
DROP TABLE SPLD_DIRECTIONSFORUSESECTION IF EXISTS ;
DROP TABLE SPLD_DIRECTIONSFORUSESTATEMENT IF EXISTS ;
DROP TABLE SPLD_GENERALSECTION IF EXISTS ;
DROP TABLE SPLD_GENERALSTATEMENT IF EXISTS ;
DROP TABLE SPLD_HUMANHAZARDSECTION IF EXISTS ;
DROP TABLE SPLD_INGREDIENTSSECTION IF EXISTS ;
DROP TABLE SPLD_INGREDIENTSSTATEMENT IF EXISTS ;
DROP TABLE SPLD_LLD IF EXISTS ;
DROP TABLE SPLD_MARKETINGSECTION IF EXISTS ;
DROP TABLE SPLD_MARKETINGSTATEMENT IF EXISTS ;
DROP TABLE SPLD_SECTION IF EXISTS ;
DROP TABLE SPLD_STORAGEDISPOSALSECTION IF EXISTS ;
DROP TABLE SPLD_STORAGEDISPOSALSTATEMENT IF EXISTS ;
DROP TABLE SPLD_USAGE IF EXISTS ;
DROP TABLE SPLD_USAGEORDERING IF EXISTS ;
DROP TABLE SPLD_USAGETYPE IF EXISTS ;
DROP TABLE SUBREGISTRANT IF EXISTS ;
DROP TABLE SUBREGLABELCONTENT IF EXISTS ;
DROP TABLE SUBREGPHYSICALLABELDEF IF EXISTS ;
DROP TABLE SUBREGPRODUCT IF EXISTS ;
DROP TABLE z_TEMP IF EXISTS ;
DROP TABLE M_TOC IF EXISTS ;
DROP TABLE z_USER IF EXISTS ;
DROP TABLE ZEIDONGENKEYTABLE IF EXISTS ;
DROP TABLE ZEIDONLOCKING IF EXISTS ;
DROP TABLE MMSUSAGEDRVSSDIRECTIONSFORUSESECT IF EXISTS ;
DROP TABLE MMMUSAGEDRVSMDIRECTIONSFORUSESECT IF EXISTS ;
DROP TABLE MM_MASTERPRODUCT_FOR_SUBREGISTRAN IF EXISTS ;
DROP TABLE MMSPLDDIRECTIONSFORUSESECTIONFRSP IF EXISTS ;
DROP TABLE MM_SPLD_MARKETINGSECTIONFRSPLDUSA IF EXISTS ;

/* Entity - Address */
CREATE TABLE ADDRESS ( 
           ID                                 int                NOT NULL, 
           DESCRIPTION                        varchar( 128 )     NULL    , 
           ADDRESS                            varchar( 128 )     NULL    , 
           ADDRESSLINE2                       varchar( 128 )     NULL    , 
           CITY                               varchar( 128 )     NULL    , 
           STATE                              varchar( 2 )       NULL    , 
           COUNTRY                            varchar( 128 )     NULL    , 
           COUNTY                             varchar( 128 )     NULL    , 
           ZIPCODE                            varchar( 10 )      NULL    , 
           PHONE                              varchar( 11 )      NULL    , 
           FAX                                varchar( 11 )      NULL    , 
           TOLLFREEPHONE                      varchar( 11 )      NULL    , 
           EMERGENCYPHONE                     varchar( 11 )      NULL    , 
           ATTENTIONLINE                      varchar( 128 )     NULL    , 
           TIMEZONE                           varchar( 128 )     NULL    , 
           SHIPPINGFLAG                       varchar( 1 )       NULL    , 
           CREATEDDATETIME                    datetime           NULL    , 
           MODIFIEDDATETIME                   datetime           NULL    , 
           CREATEDBY                          varchar( 128 )     NULL    , 
           LASTMODIFIEDBY                     varchar( 128 )     NULL    , 
           FK_ID_ORGANIZATION                 int                NULL    , 
           FK_ID_ORGANIZATION02               int                NULL     ) ;
 
/* Entity - Color */
CREATE TABLE COLOR ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 32 )      NOT NULL, 
           RGB                                varchar( 6 )       NOT NULL, 
           C                                  int                NULL    , 
           M                                  int                NULL    , 
           Y                                  int                NULL    , 
           K                                  int                NULL    , 
           PANTONE                            varchar( 32 )      NULL    , 
           FK_ID_SUBREGISTRANT                int                NOT NULL ) ;
 
/* Entity - Domain */
CREATE TABLE z_DOMAIN ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 128 )     NOT NULL, 
           z_DESC                             varchar( 254 )     NULL    , 
           SYSTEMREQUIRED                     varchar( 1 )       NULL     ) ;
 
/* Entity - DomainValue */
CREATE TABLE DOMAINVALUE ( 
           DOMAINVALUE_TOKEN                  int                NOT NULL, 
           INTERNALINTEGERVALUE               int                NULL    , 
           INTERNALSTRINGVALUE                varchar( 128 )     NULL    , 
           SYSTEMREQUIRED                     varchar( 1 )       NULL    , 
           EXTERNALDESCRIPTION                varchar( 128 )     NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_Z_DOMAIN                     int                NOT NULL ) ;
 
/* Entity - EPA_ApplicationType */
CREATE TABLE EPA_APPLICATIONTYPE ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NOT NULL, 
           AUTOSEQ                            int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY           int                NOT NULL ) ;
 
/* Entity - EPA_ChemicalFamily */
CREATE TABLE EPA_CHEMICALFAMILY ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NOT NULL, 
           DESCRIPTION                        varchar( 254 )     NULL    , 
           CHEMICALFAMILY                     varchar( 2 )       NOT NULL, 
           FK_ID_EPAMMS                       int                NOT NULL ) ;
 
/* Entity - EPA_Claim */
CREATE TABLE EPA_CLAIM ( 
           ID                                 int                NOT NULL, 
           CLAIMSCLASSIFICATION               varchar( 16 )      NULL    , 
           NAME                               varchar( 254 )     NOT NULL, 
           AUTOSEQ                            int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY           int                NOT NULL ) ;
 
/* Entity - EPA_Location */
CREATE TABLE EPA_LOCATION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NOT NULL, 
           AUTOSEQ                            int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY           int                NOT NULL ) ;
 
/* Entity - EPA_StorageDisposal */
CREATE TABLE EPA_STORAGEDISPOSAL ( 
           ID                                 int                NOT NULL, 
           NAME                               longtext           NOT NULL, 
           DESCRIPTION                        longtext           NULL    , 
           z_VOLUME                           double             NULL    , 
           UNITS                              varchar( 254 )     NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY           int                NOT NULL ) ;
 
/* Entity - EPA_Surface */
CREATE TABLE EPA_SURFACE ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NOT NULL, 
           AUTOSEQ                            int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY           int                NOT NULL ) ;
 
/* Entity - ePamms */
CREATE TABLE EPAMMS ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 128 )     NOT NULL ) ;
 
/* Entity - Feedback */
CREATE TABLE FEEDBACK ( 
           ID                                 int                NOT NULL, 
           USERID                             varchar( 32 )      NOT NULL, 
           DIALOG                             varchar( 32 )      NULL    , 
           WINDOW                             varchar( 32 )      NULL    , 
           COMMENT                            longtext           NULL    , 
           FK_ID_ORGANIZATION                 int                NOT NULL ) ;
 
/* Entity - FootnoteSymbol */
CREATE TABLE FOOTNOTESYMBOL ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             varchar( 254 )     NOT NULL, 
           SYMBOL                             varchar( 2 )       NOT NULL, 
           FK_ID_EPAMMS                       int                NOT NULL ) ;
 
/* Entity - GraphicLabelControl */
CREATE TABLE GRAPHICLABELCONTROL ( 
           ID                                 int                NOT NULL, 
           POSITIONX                          int                NULL    , 
           POSITIONY                          varchar( 254 )     NULL    , 
           SIZEX                              int                NULL    , 
           SIZEY                              int                NULL    , 
           FONT                               varchar( 254 )     NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_GRAPHICLABELDEFINITION       int                NOT NULL ) ;
 
/* Entity - GraphicLabelDefinition */
CREATE TABLE GRAPHICLABELDEFINITION ( 
           ID                                 int                NOT NULL, 
           PRODUCTNAME                        varchar( 254 )     NULL    , 
           HEIGHT                             double             NULL    , 
           WIDTH                              double             NULL    , 
           NETCONTENTSTEXT                    varchar( 254 )     NULL    , 
           FK_ID_SUBREGISTRANT                int                NOT NULL, 
           FK_ID_SUBREGLABELCONTENT           int                NULL     ) ;
 
/* Entity - Help */
CREATE TABLE HELP ( 
           ID                                 int                NOT NULL, 
           DIALOGWINDOW                       varchar( 128 )     NOT NULL, 
           MESSAGE                            longtext           NULL    , 
           FK_ID_EPAMMS                       int                NOT NULL ) ;
 
/* Entity - Keyword */
CREATE TABLE KEYWORD ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NOT NULL, 
           FK_ID_EPAMMS                       int                NULL     ) ;
 
/* Entity - LLD */
CREATE TABLE LLD ( 
           ID                                 int                NOT NULL, 
           TAG                                varchar( 64 )      NULL    , 
           NAME                               varchar( 128 )     NULL    , 
           CSS_FILENAME                       varchar( 254 )     NULL    , 
           BACKGROUNDCOLOR                    varchar( 254 )     NULL    , 
           HAZARDPANEL                        int                NULL    , 
           CONTINUATIONPREVIOUSPAGETEXT       longtext           NULL    , 
           CONTNEXTPAGETEXTMARKETING          longtext           NULL    , 
           CONTNEXTPAGETEXTDIRFORUSE          longtext           NULL    , 
           DEFAULTTEXTFONTFAMILY              varchar( 20 )      NULL    , 
           DEFAULTTEXTFONTSIZE                varchar( 20 )      NULL    , 
           DEFAULTFONTCOLOR                   varchar( 20 )      NULL    , 
           DEFAULTTITLEMARGINTOP              double             NULL    , 
           DEFAULTTITLEMARGINBOTTOM           double             NULL    , 
           DEFAULTTEXTMARGINTOP               double             NULL    , 
           DEFAULTTEXTMARGINBOTTOM            double             NULL    , 
           DEPTH                              int                NULL     ) ;
 
/* Entity - LLD_Block */
CREATE TABLE LLD_BLOCK ( 
           ID                                 int                NOT NULL, 
           TAG                                varchar( 64 )      NULL    , 
           NAME                               varchar( 128 )     NULL    , 
           BLOCKTITLE                         varchar( 254 )     NULL    , 
           LLD_SECTIONTYPE                    varchar( 32 )      NULL    , 
           LLD_COLUMNLISTTYPE                 varchar( 2 )       NULL    , 
           CONTINUATIONBLOCKTAG               varchar( 64 )      NULL    , 
           CONTINUATIONBLOCKFLAG              varchar( 1 )       NULL    , 
           IMAGENAME                          varchar( 254 )     NULL    , 
           z_TOP                              double             NULL    , 
           z_LEFT                             double             NULL    , 
           HEIGHT                             double             NULL    , 
           WIDTH                              double             NULL    , 
           TEXTCOLOR                          varchar( 32 )      NULL    , 
           TEXTCOLOROVERRIDE                  varchar( 1 )       NULL    , 
           BACKGROUNDCOLOR                    varchar( 32 )      NULL    , 
           BACKGROUNDCOLOROVERRIDE            varchar( 1 )       NULL    , 
           BORDERCOLOR                        varchar( 32 )      NULL    , 
           BORDERCOLOROVERRIDE                varchar( 1 )       NULL    , 
           BORDERSTYLE                        varchar( 20 )      NULL    , 
           BORDERWIDTH                        int                NULL    , 
           FONTFAMILY                         varchar( 20 )      NULL    , 
           FONTSIZE                           varchar( 20 )      NULL    , 
           FONTWEIGHT                         varchar( 20 )      NULL    , 
           MARGIN                             double             NULL    , 
           MARGINTOP                          double             NULL    , 
           MARGINBOTTOM                       double             NULL    , 
           MARGINLEFT                         double             NULL    , 
           MARGINRIGHT                        double             NULL    , 
           MARGINOVERRIDE                     varchar( 1 )       NULL    , 
           BORDER                             double             NULL    , 
           BORDERTOP                          double             NULL    , 
           BORDERBOTTOM                       double             NULL    , 
           BORDERLEFT                         double             NULL    , 
           BORDERRIGHT                        double             NULL    , 
           BORDEROVERRIDE                     varchar( 1 )       NULL    , 
           PADDING                            double             NULL    , 
           PADDINGTOP                         double             NULL    , 
           PADDINGBOTTOM                      double             NULL    , 
           PADDINGLEFT                        double             NULL    , 
           PADDINGRIGHT                       double             NULL    , 
           PADDINGOVERRIDE                    varchar( 1 )       NULL    , 
           TITLEPOSITION                      varchar( 5 )       NULL    , 
           CAPITALIZETITLETEXTFLAG            varchar( 1 )       NULL    , 
           TEXTALIGN                          varchar( 20 )      NULL    , 
           TEXTLINEHEIGHT                     double             NULL    , 
           TEXTLETTERSPACE                    double             NULL    , 
           DEPTH                              int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           BG_ID_COLOR                        int                NULL    , 
           BD_ID_COLOR                        int                NULL    , 
           TX_ID_COLOR                        int                NULL    , 
           FK_ID_SPLD_SECTION                 int                NULL    , 
           FK_ID_LLD_PANEL                    int                NULL    , 
           FK_ID_LLD_BLOCK                    int                NULL     ) ;
 
/* Entity - LLD_Page */
CREATE TABLE LLD_PAGE ( 
           ID                                 int                NOT NULL, 
           TAG                                varchar( 64 )      NULL    , 
           NAME                               varchar( 128 )     NULL    , 
           HEIGHT                             double             NULL    , 
           WIDTH                              double             NULL    , 
           BACKGROUNDCOLOR                    varchar( 32 )      NULL    , 
           BACKGROUNDCOLOROVERRIDE            varchar( 1 )       NULL    , 
           PAGENBR                            int                NULL    , 
           DEPTH                              int                NULL    , 
           FK_ID_COLOR                        int                NULL    , 
           FK_ID_LLD                          int                NULL    , 
           FK_ID_SPLD_LLD                     int                NULL     ) ;
 
/* Entity - LLD_Panel */
CREATE TABLE LLD_PANEL ( 
           ID                                 int                NOT NULL, 
           TAG                                varchar( 64 )      NULL    , 
           NAME                               varchar( 128 )     NULL    , 
           PANELNUMBER                        int                NULL    , 
           LLD_SECTIONTYPE                    varchar( 32 )      NULL    , 
           LLD_COLUMNLISTTYPE                 varchar( 2 )       NULL    , 
           CONTINUATIONBLOCKTAG               varchar( 64 )      NULL    , 
           CONTINUATIONBLOCKFLAG              varchar( 1 )       NULL    , 
           IMAGENAME                          varchar( 254 )     NULL    , 
           z_TOP                              double             NULL    , 
           z_LEFT                             double             NULL    , 
           HEIGHT                             double             NULL    , 
           WIDTH                              double             NULL    , 
           TEXTCOLOR                          varchar( 32 )      NULL    , 
           TEXTCOLOROVERRIDE                  varchar( 1 )       NULL    , 
           BACKGROUNDCOLOR                    varchar( 32 )      NULL    , 
           BACKGROUNDCOLOROVERRIDE            varchar( 1 )       NULL    , 
           BORDERCOLOR                        varchar( 32 )      NULL    , 
           BORDERCOLOROVERRIDE                varchar( 1 )       NULL    , 
           BORDERSTYLE                        varchar( 20 )      NULL    , 
           BORDERWIDTH                        double             NULL    , 
           FONTFAMILY                         varchar( 20 )      NULL    , 
           FONTSIZE                           varchar( 20 )      NULL    , 
           FONTWEIGHT                         varchar( 20 )      NULL    , 
           MARGIN                             double             NULL    , 
           MARGINTOP                          double             NULL    , 
           MARGINBOTTOM                       double             NULL    , 
           MARGINLEFT                         double             NULL    , 
           MARGINRIGHT                        double             NULL    , 
           MARGINOVERRIDE                     varchar( 1 )       NULL    , 
           BORDER                             double             NULL    , 
           BORDERTOP                          double             NULL    , 
           BORDERBOTTOM                       double             NULL    , 
           BORDERLEFT                         double             NULL    , 
           BORDERRIGHT                        double             NULL    , 
           BORDEROVERRIDE                     varchar( 1 )       NULL    , 
           PADDING                            double             NULL    , 
           PADDINGTOP                         double             NULL    , 
           PADDINGBOTTOM                      double             NULL    , 
           PADDINGLEFT                        double             NULL    , 
           PADDINGRIGHT                       double             NULL    , 
           PADDINGOVERRIDE                    varchar( 1 )       NULL    , 
           TITLEPOSITION                      varchar( 5 )       NULL    , 
           CAPITALIZETITLETEXTFLAG            varchar( 1 )       NULL    , 
           TEXTALIGN                          varchar( 20 )      NULL    , 
           TEXTLINEHEIGHT                     double             NULL    , 
           TEXTLETTERSPACE                    double             NULL    , 
           BLOCKTITLE                         varchar( 254 )     NULL    , 
           DEPTH                              int                NULL    , 
           BG_ID_COLOR                        int                NULL    , 
           BD_ID_COLOR                        int                NULL    , 
           FK_ID_LLD_PAGE                     int                NOT NULL ) ;
 
/* Entity - LLD_SpecialSectionAttribute */
CREATE TABLE LLD_SPECIALSECTIONATTRIBUTE ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 128 )     NULL    , 
           PF1ID_LLD_BLOCK                    int                NOT NULL, 
           PF2ID_LLD_BLOCK                    int                NULL     ) ;
 
/* Entity - M_DilutionChartEntry */
CREATE TABLE M_DILUTIONCHARTENTRY ( 
           ID                                 int                NOT NULL, 
           z_USE                              varchar( 128 )     NULL    , 
           PRODUCTAMOUNTTEXT                  varchar( 254 )     NULL    , 
           WATERAMOUNTTEXT                    varchar( 254 )     NULL    , 
           CONTACTTIME                        varchar( 16 )      NULL    , 
           FK_ID_M_DILUTIONGROUP              int                NOT NULL ) ;
 
/* Entity - M_DilutionGroup */
CREATE TABLE M_DILUTIONGROUP ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             varchar( 254 )     NULL    , 
           DILUTIONRATIOTEXT                  varchar( 254 )     NULL    , 
           DILUTIONQUATTEXT                   varchar( 254 )     NULL    , 
           RATIO                              int                NULL    , 
           UNITSNUMERATOR                     varchar( 4 )       NULL    , 
           UNITSDENOMINATOR                   varchar( 4 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           REVIEWERNOTETABLE                  longtext           NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - M_DilutionGroupItem */
CREATE TABLE M_DILUTIONGROUPITEM ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             longtext           NULL    , 
           PPM                                int                NULL    , 
           FK_ID_M_DILUTIONGROUP              int                NOT NULL ) ;
 
/* Entity - M_DirectionsForUseCategory */
CREATE TABLE M_DIRECTIONSFORUSECATEGORY ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           z_NOTE                             longtext           NULL    , 
           GENERALUSE                         varchar( 1 )       NULL    , 
           STATEMENTLISTTYPE                  varchar( 254 )     NULL    , 
           NUMBEREACHSTATEMENT                varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           STATEMENTSELECTEDBYUSAGEFLAG       varchar( 1 )       NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSECATEGORY   int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - M_DirectionsForUseSection */
CREATE TABLE M_DIRECTIONSFORUSESECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           HEADNOTE                           longtext           NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           TAILNOTE                           longtext           NULL    , 
           GENERALUSE                         varchar( 1 )       NULL    , 
           STATEMENTLISTTYPE                  varchar( 254 )     NULL    , 
           NUMBEREACHSTATEMENT                varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           STATEMENTSELECTEDBYUSAGEFLAG       varchar( 1 )       NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSECATEGORY   int                NOT NULL, 
           XORID_M_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESECTION    int                NULL     ) ;
 
/* Entity - M_DirectionsForUseStatement */
CREATE TABLE M_DIRECTIONSFORUSESTATEMENT ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           NOTFORUSETEXT                      longtext           NULL    , 
           NOTFORUSETYPE                      varchar( 2 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           EXCLUSIVETOPREVIOUSSTATEMENT       varchar( 1 )       NULL    , 
           EXCLUSIVETONEXTSTATEMENT           varchar( 1 )       NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           SUBID_M_DIRECTIONSFORUSESTATEMEN   int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN   int                NULL     ) ;
 
/* Entity - M_GeneralSection */
CREATE TABLE M_GENERALSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           CONTAINERVOLUMEENVIRONMENTHAZARD   varchar( 20 )      NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           COMBINED                           varchar( 1 )       NULL    , 
           BOLDTITLE                          varchar( 1 )       NULL    , 
           BOLDTEXT                           varchar( 1 )       NULL    , 
           SECTIONTYPE                        varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           CONTACTNOTE                        varchar( 254 )     NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           NOTETOPHYSICIAN                    varchar( 254 )     NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL, 
           FK_ID_M_GENERALSECTION             int                NULL     ) ;
 
/* Entity - M_GeneralStatement */
CREATE TABLE M_GENERALSTATEMENT ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_GENERALSUBSECTION          int                NULL    , 
           FK_ID_M_GENERALSECTION             int                NULL    , 
           FK_ID_M_GENERALSTATEMENT           int                NULL     ) ;
 
/* Entity - M_GeneralSubsection */
CREATE TABLE M_GENERALSUBSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           CONTAINERVOLUMEENVIRONMENTHAZARD   varchar( 20 )      NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           FK_ID_M_GENERALSECTION             int                NOT NULL ) ;
 
/* Entity - M_HumanHazardSection */
CREATE TABLE M_HUMANHAZARDSECTION ( 
           ID                                 int                NOT NULL, 
           EPA_SIGNALWORD                     varchar( 32 )      NULL    , 
           EPA_CHILDHAZARDWARNING             varchar( 1 )       NULL    , 
           PRECAUTIONARYSTATEMENT             longtext           NULL    , 
           LOCATIONSEPARATOR                  varchar( 2 )       NULL    , 
           ENCLOSEFIRSTLOCATION               varchar( 1 )       NULL    , 
           PANELLOC1                          varchar( 254 )     NULL    , 
           PANELLOC2                          varchar( 254 )     NULL    , 
           PANELLOC3                          varchar( 254 )     NULL    , 
           PANELLOC4                          varchar( 254 )     NULL    , 
           PANELLOC5                          varchar( 254 )     NULL    , 
           PANELLOC6                          varchar( 254 )     NULL    , 
           PANELLOC7                          varchar( 254 )     NULL    , 
           PANELLOC8                          varchar( 254 )     NULL    , 
           PANELLOC9                          varchar( 254 )     NULL    , 
           LABELLOC1                          varchar( 254 )     NULL    , 
           LABELLOC2                          varchar( 254 )     NULL    , 
           LABELLOC3                          varchar( 254 )     NULL    , 
           LABELLOC4                          varchar( 254 )     NULL    , 
           LABELLOC5                          varchar( 254 )     NULL    , 
           LABELLOC6                          varchar( 254 )     NULL    , 
           LABELLOC7                          varchar( 254 )     NULL    , 
           LABELLOC8                          varchar( 254 )     NULL    , 
           LABELLOC9                          varchar( 254 )     NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL, 
           FK_ID_M_HUMANHAZARDSECTION         int                NULL     ) ;
 
/* Entity - M_IngredientsSection */
CREATE TABLE M_INGREDIENTSSECTION ( 
           ID                                 int                NOT NULL, 
           ACTIVETITLE                        varchar( 254 )     NULL    , 
           ARSENICPRECAUTIONARYTEXT           varchar( 254 )     NULL    , 
           INERTTITLE                         varchar( 254 )     NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           GENERALINACTIVEPERCENT             double             NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_INGREDIENTSSECTION         int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - M_IngredientsStatement */
CREATE TABLE M_INGREDIENTSSTATEMENT ( 
           ID                                 int                NOT NULL, 
           CHEMICALNAME                       varchar( 254 )     NOT NULL, 
           COMMONNAME                         varchar( 254 )     NULL    , 
           ACTIVE                             varchar( 1 )       NOT NULL, 
           PROMPT                             varchar( 254 )     NULL    , 
           z_PERCENT                          double             NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_INGREDIENTSSECTION         int                NOT NULL, 
           FK_ID_M_INGREDIENTSSTATEMENT       int                NULL     ) ;
 
/* Entity - M_InsertText */
CREATE TABLE M_INSERTTEXT ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_INSERTTEXTKEYWORD          int                NOT NULL ) ;
 
/* Entity - M_InsertTextKeyword */
CREATE TABLE M_INSERTTEXTKEYWORD ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           TYPE                               varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           AUTOSEQ03                          int                NULL    , 
           AUTOSEQ04                          int                NULL    , 
           AUTOSEQ05                          int                NULL    , 
           AUTOSEQ06                          int                NULL    , 
           AUTOSEQ07                          int                NULL    , 
           FK_ID_M_STORAGEDISPOSALSTATEMENT   int                NULL    , 
           FK_ID_M_GENERALSTATEMENT           int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_M_MARKETINGSECTION           int                NULL    , 
           FK_ID_M_USAGE                      int                NULL    , 
           FK_ID_M_MARKETINGSTATEMENT         int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN   int                NULL     ) ;
 
/* Entity - M_MarketingSection */
CREATE TABLE M_MARKETINGSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           SUBTITLE                           longtext           NULL    , 
           SUBREVIEWERNOTE                    longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL, 
           FK_ID_M_MARKETINGSECTION           int                NULL     ) ;
 
/* Entity - M_MarketingStatement */
CREATE TABLE M_MARKETINGSTATEMENT ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_MARKETINGSECTION           int                NOT NULL, 
           FK_ID_M_MARKETINGSTATEMENT         int                NULL     ) ;
 
/* Entity - M_MetaTable */
CREATE TABLE M_METATABLE ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 128 )     NULL    , 
           DESCRIPTION                        varchar( 254 )     NULL    , 
           COLUMNS                            int                NULL    , 
           TITLE1                             varchar( 254 )     NULL    , 
           TITLE2                             varchar( 254 )     NULL    , 
           TITLE3                             varchar( 254 )     NULL    , 
           TITLE4                             varchar( 254 )     NULL    , 
           TITLE5                             varchar( 254 )     NULL    , 
           TITLE6                             varchar( 254 )     NULL    , 
           TITLE7                             varchar( 254 )     NULL    , 
           TITLE8                             varchar( 254 )     NULL    , 
           TITLE9                             varchar( 254 )     NULL    , 
           TITLE10                            varchar( 254 )     NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - M_ReviewerNote */
CREATE TABLE M_REVIEWERNOTE ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           FK_ID_M_MARKETINGSECTION           int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_M_GENERALSECTION             int                NULL    , 
           FK_ID_M_INGREDIENTSSECTION         int                NULL     ) ;
 
/* Entity - M_Rows */
CREATE TABLE M_ROWS ( 
           ID                                 int                NOT NULL, 
           TEXT1                              varchar( 254 )     NULL    , 
           TEXT2                              varchar( 254 )     NULL    , 
           TEXT3                              varchar( 254 )     NULL    , 
           TEXT4                              varchar( 254 )     NULL    , 
           TEXT5                              varchar( 254 )     NULL    , 
           TEXT6                              varchar( 254 )     NULL    , 
           TEXT7                              varchar( 254 )     NULL    , 
           TEXT8                              varchar( 254 )     NULL    , 
           TEXT9                              varchar( 254 )     NULL    , 
           TEXT10                             varchar( 254 )     NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_METATABLE                  int                NOT NULL ) ;
 
/* Entity - M_StorageDisposalSection */
CREATE TABLE M_STORAGEDISPOSALSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           SDSECTIONTYPE                      varchar( 20 )      NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           NUMBEREACHSTATEMENT                varchar( 1 )       NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL, 
           FK_ID_M_STORAGEDISPOSALSECTION     int                NULL     ) ;
 
/* Entity - M_StorageDisposalStatement */
CREATE TABLE M_STORAGEDISPOSALSTATEMENT ( 
           ID                                 int                NOT NULL, 
           z_ORDER                            int                NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           CONTAINERVOLUME                    varchar( 3 )       NULL    , 
           CONTAINERTYPE                      varchar( 30 )      NULL    , 
           NOTFORUSETEXT                      longtext           NULL    , 
           NOTFORUSETYPE                      varchar( 2 )       NOT NULL, 
           NUMBEREACHSTATEMENT                varchar( 1 )       NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           EXCLUSIVETOPREVIOUSSTATEMENT       varchar( 1 )       NULL    , 
           EXCLUSIVETONEXTSTATEMENT           varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           SUBID_M_STORAGEDISPOSALSTATEMENT   int                NULL    , 
           FK_ID_M_STORAGEDISPOSALSECTION     int                NULL    , 
           FK_ID_M_STORAGEDISPOSALSTATEMENT   int                NULL     ) ;
 
/* Entity - M_Usage */
CREATE TABLE M_USAGE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NULL    , 
           CLAIMSCLASSIFICATION               varchar( 16 )      NULL    , 
           NAME                               varchar( 254 )     NOT NULL, 
           REVIEWERNOTE                       longtext           NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           GROUPSEQUENCENUMBER                int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_USAGE                      int                NULL    , 
           FK_ID_M_USAGEGROUP                 int                NULL    , 
           FK_ID_M_USAGEFOOTNOTE              int                NULL    , 
           FK_ID_M_USAGETYPE                  int                NULL    , 
           FK_ID_M_USAGE02                    int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NULL     ) ;
 
/* Entity - M_UsageFootnote */
CREATE TABLE M_USAGEFOOTNOTE ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             longtext           NULL    , 
           SYMBOL                             varchar( 32 )      NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - M_UsageGroup */
CREATE TABLE M_USAGEGROUP ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           FK_ID_M_USAGETYPE                  int                NOT NULL ) ;
 
/* Entity - M_UsageOrdering */
CREATE TABLE M_USAGEORDERING ( 
           ID                                 int                NOT NULL, 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_M_USAGE                      int                NOT NULL, 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN   int                NULL    , 
           FK_ID_M_MARKETINGSTATEMENT         int                NULL     ) ;
 
/* Entity - M_UsageType */
CREATE TABLE M_USAGETYPE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - MasterLabelContent */
CREATE TABLE MASTERLABELCONTENT ( 
           ID                                 int                NOT NULL, 
           PRIMARYSITEID                      int                NULL    , 
           VERSION                            varchar( 254 )     NOT NULL, 
           REVISIONDATE                       datetime           NOT NULL, 
           CREATEDDATETIME                    datetime           NULL    , 
           MODIFIEDDATETIME                   datetime           NULL    , 
           DILUTIONCHARTSTRENGTHTITLE         varchar( 254 )     NULL    , 
           DILUTIONCHARTSTRENGTHTEXT          varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           TITLEMARKETING                     varchar( 254 )     NULL    , 
           TEXTMARKETING                      longtext           NULL    , 
           REVIEWERNOTEMARKETING              longtext           NULL    , 
           TITLETOC                           varchar( 254 )     NULL    , 
           TEXTTOC                            longtext           NULL    , 
           REVIEWERNOTETOC                    longtext           NULL    , 
           TITLEDFU                           varchar( 254 )     NULL    , 
           TEXTDFU                            longtext           NULL    , 
           REVIEWERNOTEDFU                    longtext           NULL    , 
           TITLESAD                           varchar( 254 )     NULL    , 
           TEXTSAD                            longtext           NULL    , 
           REVIEWERNOTESAD                    longtext           NULL    , 
           FINALIZED                          varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           AUTOSEQ03                          int                NULL    , 
           SUBID_MASTERLABELCONTENT           int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NULL    , 
           FK_ID_MASTERPRODUCT                int                NULL     ) ;
 
/* Entity - MasterProduct */
CREATE TABLE MASTERPRODUCT ( 
           ID                                 int                NOT NULL, 
           PRIMARYSITEID                      int                NULL    , 
           NAME                               varchar( 254 )     NOT NULL, 
           z_NUMBER                           varchar( 5 )       NULL    , 
           DESCRIPTION                        longtext           NULL    , 
           CHEMICALFAMILY                     varchar( 2 )       NULL    , 
           EPA_REGISTRATIONNUMBER             varchar( 128 )     NULL    , 
           EPA_ESTABLISHMENTNUMBER            varchar( 128 )     NULL    , 
           EPA_DRAFTLABEL                     datetime           NULL    , 
           ESL_DATE                           datetime           NULL    , 
           EPA_TOXICITYCATEGORY               int                NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           FOOTER                             longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_PRIMARYREGISTRANT            int                NOT NULL ) ;
 
/* Entity - NetContents */
CREATE TABLE NETCONTENTS ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           DESCRIPTION                        longtext           NULL    , 
           z_TEXT                             longtext           NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - Organization */
CREATE TABLE ORGANIZATION ( 
           ID                                 int                NOT NULL, 
           PRIMARYSITEID                      int                NULL    , 
           NAME                               varchar( 254 )     NOT NULL, 
           DESCRIPTION                        varchar( 254 )     NULL    , 
           LOGINNAME                          varchar( 128 )     NOT NULL, 
           ADMINISTRATORPASSWORD              varchar( 128 )     NULL    , 
           LASTLOGINDATETIME                  datetime           NULL    , 
           PASSWORDEXPIRESDATETIME            datetime           NULL    , 
           EMAILADDRESS                       varchar( 254 )     NULL    , 
           ACTIVE                             varchar( 1 )       NULL    , 
           ROLE                               varchar( 1 )       NULL     ) ;
 
/* Entity - Person */
CREATE TABLE PERSON ( 
           ID                                 int                NOT NULL, 
           LASTNAME                           varchar( 64 )      NULL    , 
           FIRSTNAME                          varchar( 64 )      NULL    , 
           MIDDLENAME                         varchar( 64 )      NULL    , 
           SUFFIX                             varchar( 128 )     NULL    , 
           GENDER                             varchar( 1 )       NULL    , 
           HOMEPHONE                          varchar( 11 )      NULL    , 
           MOBILEPHONE                        varchar( 11 )      NULL    , 
           WORKPHONE                          varchar( 11 )      NULL    , 
           WORKPHONEEXTENSION                 varchar( 30 )      NULL    , 
           FAX                                varchar( 11 )      NULL    , 
           EMAILADDRESS                       varchar( 128 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           z_NOTE                             longtext           NULL    , 
           CREATEDDATETIME                    datetime           NULL    , 
           MODIFIEDDATETIME                   datetime           NULL    , 
           CREATEDBY                          varchar( 128 )     NULL    , 
           LASTMODIFIEDBY                     varchar( 128 )     NULL    , 
           FK_ID_ADDRESS                      int                NULL    , 
           FK_ID_ORGANIZATION                 int                NULL    , 
           HASCONTACTID_ORGANIZATION          int                NULL     ) ;
 
/* Entity - PrimaryRegistrant */
CREATE TABLE PRIMARYREGISTRANT ( 
           ID                                 int                NOT NULL, 
           EPA_COMPANYNUMBER                  varchar( 6 )       NULL    , 
           FK_ID_EPAMMS                       int                NOT NULL, 
           FK_ID_ORGANIZATION                 int                NOT NULL ) ;
 
/* Entity - PrimarySub */
CREATE TABLE PRIMARYSUB ( 
           ID                                 int                NOT NULL, 
           FK_ID_PRIMARYREGISTRANT            int                NOT NULL, 
           FK_ID_SUBREGISTRANT                int                NOT NULL ) ;
 
/* Entity - ResumeObject */
CREATE TABLE RESUMEOBJECT ( 
           ID                                 int                NOT NULL, 
           LOD                                varchar( 64 )      NULL    , 
           ENTITYNAME                         varchar( 64 )      NULL    , 
           KEYATTRIBUTENAME                   varchar( 64 )      NULL    , 
           KEYATTRIBUTEVALUE                  int                NULL    , 
           VIEWNAME                           varchar( 64 )      NULL    , 
           FK_ID_RESUMEPATH                   int                NOT NULL ) ;
 
/* Entity - ResumePath */
CREATE TABLE RESUMEPATH ( 
           ID                                 int                NOT NULL, 
           DIALOGWINDOW                       varchar( 64 )      NULL    , 
           FK_ID_Z_USER                       int                NOT NULL ) ;
 
/* Entity - ReusableBlockDefinition */
CREATE TABLE REUSABLEBLOCKDEFINITION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 128 )     NOT NULL, 
           DESCRIPTION                        longtext           NULL    , 
           LLD_SECTIONTYPE                    varchar( 32 )      NULL    , 
           FK_ID_SUBREGISTRANT                int                NOT NULL, 
           FK_ID_LLD_BLOCK                    int                NOT NULL ) ;
 
/* Entity - S_DilutionGroup */
CREATE TABLE S_DILUTIONGROUP ( 
           ID                                 int                NOT NULL, 
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL, 
           FK_ID_M_DILUTIONGROUP              int                NOT NULL ) ;
 
/* Entity - S_DilutionGroupItem */
CREATE TABLE S_DILUTIONGROUPITEM ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             longtext           NULL    , 
           FK_ID_S_DILUTIONGROUP              int                NOT NULL ) ;
 
/* Entity - S_DirectionsForUseSection */
CREATE TABLE S_DIRECTIONSFORUSESECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           GENERALUSE                         varchar( 1 )       NULL    , 
           STATEMENTLISTTYPE                  varchar( 254 )     NULL    , 
           NUMBEREACHSTATEMENT                varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - S_DirectionsForUseStatement */
CREATE TABLE S_DIRECTIONSFORUSESTATEMENT ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           NOTFORUSETEXT                      longtext           NULL    , 
           NOTFORUSETYPE                      varchar( 2 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN   int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSESECTION    int                NOT NULL ) ;
 
/* Entity - S_GeneralSection */
CREATE TABLE S_GENERALSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           CONTAINERVOLUMEENVIRONMENTHAZARD   varchar( 20 )      NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           COMBINED                           varchar( 1 )       NULL    , 
           SECTIONTYPE                        varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           CONTACTNOTE                        varchar( 254 )     NULL    , 
           NOTETOPHYSICIAN                    varchar( 254 )     NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_GENERALSECTION             int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - S_GeneralStatement */
CREATE TABLE S_GENERALSTATEMENT ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_GENERALSTATEMENT           int                NULL    , 
           FK_ID_S_GENERALSECTION             int                NOT NULL ) ;
 
/* Entity - S_HumanHazardSection */
CREATE TABLE S_HUMANHAZARDSECTION ( 
           ID                                 int                NOT NULL, 
           EPA_SIGNALWORD                     varchar( 32 )      NULL    , 
           EPA_CHILDHAZARDWARNING             varchar( 1 )       NULL    , 
           PRECAUTIONARYSTATEMENT             longtext           NULL    , 
           LOCATIONSEPARATOR                  varchar( 2 )       NULL    , 
           ENCLOSEFIRSTLOCATION               varchar( 1 )       NULL    , 
           PANELLOC1                          varchar( 254 )     NULL    , 
           PANELLOC2                          varchar( 254 )     NULL    , 
           PANELLOC3                          varchar( 254 )     NULL    , 
           PANELLOC4                          varchar( 254 )     NULL    , 
           PANELLOC5                          varchar( 254 )     NULL    , 
           PANELLOC6                          varchar( 254 )     NULL    , 
           PANELLOC7                          varchar( 254 )     NULL    , 
           PANELLOC8                          varchar( 254 )     NULL    , 
           PANELLOC9                          varchar( 254 )     NULL    , 
           LABELLOC1                          varchar( 254 )     NULL    , 
           LABELLOC2                          varchar( 254 )     NULL    , 
           LABELLOC3                          varchar( 254 )     NULL    , 
           LABELLOC4                          varchar( 254 )     NULL    , 
           LABELLOC5                          varchar( 254 )     NULL    , 
           LABELLOC6                          varchar( 254 )     NULL    , 
           LABELLOC7                          varchar( 254 )     NULL    , 
           LABELLOC8                          varchar( 254 )     NULL    , 
           LABELLOC9                          varchar( 254 )     NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_HUMANHAZARDSECTION         int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - S_IngredientsSection */
CREATE TABLE S_INGREDIENTSSECTION ( 
           ID                                 int                NOT NULL, 
           ACTIVETITLE                        varchar( 254 )     NULL    , 
           ARSENICPRECAUTIONARYTEXT           varchar( 254 )     NULL    , 
           INERTTITLE                         varchar( 254 )     NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           GENERALINACTIVEPERCENT             double             NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL, 
           FK_ID_M_INGREDIENTSSECTION         int                NULL     ) ;
 
/* Entity - S_IngredientsStatement */
CREATE TABLE S_INGREDIENTSSTATEMENT ( 
           ID                                 int                NOT NULL, 
           CHEMICALNAME                       varchar( 254 )     NOT NULL, 
           COMMONNAME                         varchar( 254 )     NULL    , 
           ACTIVE                             varchar( 1 )       NOT NULL, 
           PROMPT                             varchar( 254 )     NULL    , 
           z_PERCENT                          double             NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_S_INGREDIENTSSECTION         int                NOT NULL, 
           FK_ID_M_INGREDIENTSSTATEMENT       int                NULL     ) ;
 
/* Entity - S_InsertText */
CREATE TABLE S_INSERTTEXT ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             varchar( 254 )     NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_S_INSERTTEXTKEYWORD          int                NOT NULL ) ;
 
/* Entity - S_InsertTextKeyword */
CREATE TABLE S_INSERTTEXTKEYWORD ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_S_MARKETINGSTATEMENT         int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN   int                NULL     ) ;
 
/* Entity - S_MarketingSection */
CREATE TABLE S_MARKETINGSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_S_MARKETINGSECTION           int                NULL    , 
           FK_ID_M_MARKETINGSECTION           int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - S_MarketingStatement */
CREATE TABLE S_MARKETINGSTATEMENT ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_S_MARKETINGSTATEMENT         int                NULL    , 
           FK_ID_S_MARKETINGSECTION           int                NOT NULL, 
           FK_ID_M_MARKETINGSTATEMENT         int                NULL     ) ;
 
/* Entity - S_StorageDisposalSection */
CREATE TABLE S_STORAGEDISPOSALSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           CONTAINERVOLUME                    varchar( 3 )       NULL    , 
           CONTAINERTYPE                      varchar( 30 )      NULL    , 
           SDSECTIONTYPE                      varchar( 20 )      NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           NUMBEREACHSTATEMENT                varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_STORAGEDISPOSALSECTION     int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - S_StorageDisposalStatement */
CREATE TABLE S_STORAGEDISPOSALSTATEMENT ( 
           ID                                 int                NOT NULL, 
           z_ORDER                            int                NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           NOTFORUSETEXT                      longtext           NULL    , 
           NOTFORUSETYPE                      varchar( 2 )       NOT NULL, 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_STORAGEDISPOSALSTATEMENT   int                NULL    , 
           FK_ID_S_STORAGEDISPOSALSECTION     int                NOT NULL ) ;
 
/* Entity - S_Usage */
CREATE TABLE S_USAGE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NULL    , 
           CLAIMSCLASSIFICATION               varchar( 16 )      NULL    , 
           NAME                               varchar( 254 )     NOT NULL, 
           REVIEWERNOTE                       longtext           NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_S_USAGE                      int                NULL    , 
           FK_ID_S_USAGEFOOTNOTE              int                NULL    , 
           FK_ID_M_USAGE                      int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NULL    , 
           FK_ID_S_USAGETYPE                  int                NULL     ) ;
 
/* Entity - S_UsageFootnote */
CREATE TABLE S_USAGEFOOTNOTE ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             varchar( 254 )     NULL    , 
           SYMBOL                             varchar( 32 )      NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - S_UsageOrdering */
CREATE TABLE S_USAGEORDERING ( 
           ID                                 int                NOT NULL, 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_S_MARKETINGSTATEMENT         int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN   int                NULL    , 
           FK_ID_S_USAGE                      int                NOT NULL ) ;
 
/* Entity - S_UsageType */
CREATE TABLE S_USAGETYPE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NOT NULL, 
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - S_VersionChangeMessage */
CREATE TABLE S_VERSIONCHANGEMESSAGE ( 
           ID                                 int                NOT NULL, 
           CHANGENOTE                         longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - SPLD_DirectionsForUseSection */
CREATE TABLE SPLD_DIRECTIONSFORUSESECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           GENERALUSE                         varchar( 1 )       NULL    , 
           STATEMENTLISTTYPE                  varchar( 254 )     NULL    , 
           NUMBEREACHSTATEMENT                varchar( 1 )       NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG              varchar( 254 )     NULL    , 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_SPLD_SECTION                 int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL, 
           FK_ID_S_DIRECTIONSFORUSESECTION    int                NULL     ) ;
 
/* Entity - SPLD_DirectionsForUseStatement */
CREATE TABLE SPLD_DIRECTIONSFORUSESTATEMENT ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           NOTFORUSETEXT                      longtext           NULL    , 
           NOTFORUSETYPE                      varchar( 2 )       NOT NULL, 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG              varchar( 1 )       NULL    , 
           CONTINUATIONTEXT                   longtext           NULL    , 
           CONTINUATIONLEADINGTEXT            longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI   int                NOT NULL, 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN   int                NULL     ) ;
 
/* Entity - SPLD_GeneralSection */
CREATE TABLE SPLD_GENERALSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           CONTAINERVOLUME                    varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           SECTIONTYPE                        varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           CONTACTNOTE                        varchar( 254 )     NULL    , 
           NOTETOPHYSICIAN                    varchar( 254 )     NULL    , 
           CONTINUATIONBREAKFLAG              varchar( 254 )     NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_SPLD_SECTION                 int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL, 
           FK_ID_S_GENERALSECTION             int                NULL     ) ;
 
/* Entity - SPLD_GeneralStatement */
CREATE TABLE SPLD_GENERALSTATEMENT ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG              varchar( 254 )     NULL    , 
           CONTINUATIONTEXT                   longtext           NULL    , 
           CONTINUATIONLEADINGTEXT            longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SPLD_GENERALSECTION          int                NOT NULL, 
           FK_ID_S_GENERALSTATEMENT           int                NULL     ) ;
 
/* Entity - SPLD_HumanHazardSection */
CREATE TABLE SPLD_HUMANHAZARDSECTION ( 
           ID                                 int                NOT NULL, 
           EPA_SIGNALWORD                     varchar( 32 )      NULL    , 
           EPA_CHILDHAZARDWARNING             varchar( 1 )       NULL    , 
           PRECAUTIONARYSTATEMENT             longtext           NULL    , 
           LOCATIONSEPARATOR                  varchar( 2 )       NULL    , 
           ENCLOSEFIRSTLOCATION               varchar( 1 )       NULL    , 
           PANELLOC                           varchar( 254 )     NULL    , 
           PANELLOC1                          varchar( 254 )     NULL    , 
           PANELLOC2                          varchar( 254 )     NULL    , 
           PANELLOC3                          varchar( 254 )     NULL    , 
           PANELLOC4                          varchar( 254 )     NULL    , 
           PANELLOC5                          varchar( 254 )     NULL    , 
           PANELLOC6                          varchar( 254 )     NULL    , 
           PANELLOC7                          varchar( 254 )     NULL    , 
           PANELLOC8                          varchar( 254 )     NULL    , 
           PANELLOC9                          varchar( 254 )     NULL    , 
           LABELLOC                           varchar( 254 )     NULL    , 
           LABELLOC1                          varchar( 254 )     NULL    , 
           LABELLOC2                          varchar( 254 )     NULL    , 
           LABELLOC3                          varchar( 254 )     NULL    , 
           LABELLOC4                          varchar( 254 )     NULL    , 
           LABELLOC5                          varchar( 254 )     NULL    , 
           LABELLOC6                          varchar( 254 )     NULL    , 
           LABELLOC7                          varchar( 254 )     NULL    , 
           LABELLOC8                          varchar( 254 )     NULL    , 
           LABELLOC9                          varchar( 254 )     NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL, 
           FK_ID_S_HUMANHAZARDSECTION         int                NULL     ) ;
 
/* Entity - SPLD_IngredientsSection */
CREATE TABLE SPLD_INGREDIENTSSECTION ( 
           ID                                 int                NOT NULL, 
           ACTIVETITLE                        varchar( 254 )     NULL    , 
           ARSENICPRECAUTIONARYTEXT           varchar( 254 )     NULL    , 
           INERTTITLE                         varchar( 254 )     NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           GENERALINACTIVEPERCENT             double             NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_SPLD_SECTION                 int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL, 
           FK_ID_S_INGREDIENTSSECTION         int                NULL     ) ;
 
/* Entity - SPLD_IngredientsStatement */
CREATE TABLE SPLD_INGREDIENTSSTATEMENT ( 
           ID                                 int                NOT NULL, 
           CHEMICALNAME                       varchar( 254 )     NOT NULL, 
           COMMONNAME                         varchar( 254 )     NULL    , 
           ACTIVE                             varchar( 1 )       NOT NULL, 
           PROMPT                             varchar( 254 )     NULL    , 
           z_PERCENT                          double             NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SPLD_INGREDIENTSSECTION      int                NOT NULL, 
           FK_ID_S_INGREDIENTSSTATEMENT       int                NULL     ) ;
 
/* Entity - SPLD_LLD */
CREATE TABLE SPLD_LLD ( 
           ID                                 int                NOT NULL, 
           TAG                                varchar( 64 )      NULL    , 
           NAME                               varchar( 128 )     NULL    , 
           CSS_FILENAME                       varchar( 254 )     NULL    , 
           BACKGROUNDCOLOR                    varchar( 254 )     NULL    , 
           HAZARDPANEL                        int                NULL    , 
           CONTINUATIONPREVIOUSPAGETEXT       longtext           NULL    , 
           CONTNEXTPAGETEXTMARKETING          longtext           NULL    , 
           CONTNEXTPAGETEXTDIRFORUSE          longtext           NULL    , 
           DEFAULTTEXTFONTFAMILY              varchar( 20 )      NULL    , 
           DEFAULTTEXTFONTSIZE                varchar( 20 )      NULL    , 
           DEFAULTFONTCOLOR                   varchar( 20 )      NULL    , 
           DEFAULTTITLEMARGINTOP              double             NULL    , 
           DEFAULTTITLEMARGINBOTTOM           double             NULL    , 
           DEFAULTTEXTMARGINTOP               double             NULL    , 
           DEFAULTTEXTMARGINBOTTOM            double             NULL    , 
           USEFOPCONFIG                       varchar( 1 )       NULL    , 
           DEPTH                              int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL ) ;
 
/* Entity - SPLD_MarketingSection */
CREATE TABLE SPLD_MARKETINGSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG              varchar( 254 )     NULL    , 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_S_MARKETINGSECTION           int                NULL    , 
           FK_ID_SPLD_SECTION                 int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL ) ;
 
/* Entity - SPLD_MarketingStatement */
CREATE TABLE SPLD_MARKETINGSTATEMENT ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG              varchar( 1 )       NULL    , 
           CONTINUATIONLEADINGTEXT            longtext           NULL    , 
           CONTINUATIONTEXT                   longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_S_MARKETINGSTATEMENT         int                NULL    , 
           FK_ID_SPLD_MARKETINGSECTION        int                NOT NULL ) ;
 
/* Entity - SPLD_Section */
CREATE TABLE SPLD_SECTION ( 
           ID                                 int                NOT NULL, 
           TSECTIONTYPE                       varchar( 32 )      NULL    , 
           TITLEOVERRIDE                      varchar( 254 )     NULL    , 
           TITLEPOSITION                      varchar( 5 )       NULL    , 
           TITLECLASS                         varchar( 254 )     NULL    , 
           SUBTITLEOVERRIDE                   varchar( 254 )     NULL    , 
           SUBTITLEPOSITION                   varchar( 5 )       NULL    , 
           SUBTITLECLASS                      varchar( 254 )     NULL    , 
           STATEMENTFORMAT                    varchar( 5 )       NULL    , 
           USAGESEPARATORCHARACTERS           varchar( 254 )     NULL    , 
           USAGETYPE                          varchar( 1 )       NULL    , 
           STATEMENTCLASS                     varchar( 254 )     NULL    , 
           KERNINGUNITS                       varchar( 10 )      NULL    , 
           KERNINGWIDTH                       double             NULL    , 
           WORDSPACINGUNITS                   varchar( 10 )      NULL    , 
           WORDSPACINGWIDTH                   double             NULL    , 
           LEADINGUNITS                       varchar( 10 )      NULL    , 
           LEADINGHEIGHT                      double             NULL     ) ;
 
/* Entity - SPLD_StorageDisposalSection */
CREATE TABLE SPLD_STORAGEDISPOSALSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           CONTAINERVOLUME                    varchar( 3 )       NULL    , 
           CONTAINERTYPE                      varchar( 30 )      NULL    , 
           SDSECTIONTYPE                      varchar( 20 )      NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           NUMBEREACHSTATEMENT                varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG              varchar( 254 )     NULL    , 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_SPLD_SECTION                 int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL, 
           FK_ID_S_STORAGEDISPOSALSECTION     int                NULL     ) ;
 
/* Entity - SPLD_StorageDisposalStatement */
CREATE TABLE SPLD_STORAGEDISPOSALSTATEMENT ( 
           ID                                 int                NOT NULL, 
           z_ORDER                            int                NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           NOTFORUSETEXT                      longtext           NULL    , 
           NOTFORUSETYPE                      varchar( 2 )       NOT NULL, 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG              varchar( 1 )       NULL    , 
           CONTINUATIONLEADINGTEXT            longtext           NULL    , 
           CONTINUATIONTEXT                   longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SPLD_STORAGEDISPOSALSECTIO   int                NOT NULL, 
           FK_ID_S_STORAGEDISPOSALSTATEMENT   int                NULL     ) ;
 
/* Entity - SPLD_Usage */
CREATE TABLE SPLD_USAGE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NULL    , 
           CLAIMSCLASSIFICATION               varchar( 16 )      NULL    , 
           NAME                               varchar( 254 )     NOT NULL, 
           REVIEWERNOTE                       longtext           NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SPLD_USAGE                   int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NULL    , 
           FK_ID_S_USAGE                      int                NULL    , 
           FK_ID_SPLD_USAGETYPE               int                NULL     ) ;
 
/* Entity - SPLD_UsageOrdering */
CREATE TABLE SPLD_USAGEORDERING ( 
           ID                                 int                NOT NULL, 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_SPLD_USAGE                   int                NOT NULL, 
           FK_ID_SPLD_MARKETINGSTATEMENT      int                NULL    , 
           FK_ID_SPLDDIRECTIONSFORUSESTATEM   int                NULL     ) ;
 
/* Entity - SPLD_UsageType */
CREATE TABLE SPLD_USAGETYPE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NOT NULL, 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL ) ;
 
/* Entity - Subregistrant */
CREATE TABLE SUBREGISTRANT ( 
           ID                                 int                NOT NULL, 
           EPA_COMPANYNUMBER                  varchar( 6 )       NULL    , 
           FK_ID_ORGANIZATION                 int                NOT NULL ) ;
 
/* Entity - SubregLabelContent */
CREATE TABLE SUBREGLABELCONTENT ( 
           ID                                 int                NOT NULL, 
           DESCRIPTION                        longtext           NULL    , 
           EPA_REGISTRATIONNUMBER             varchar( 128 )     NULL    , 
           EPA_ESTABLISHMENTNUMBER            varchar( 128 )     NULL    , 
           EPA_DRAFTLABEL                     datetime           NULL    , 
           ESL_DATE                           datetime           NULL    , 
           VERSION                            varchar( 254 )     NULL    , 
           REVISIONDATE                       datetime           NULL    , 
           CREATEDDATETIME                    datetime           NULL    , 
           MODIFIEDDATETIME                   datetime           NULL    , 
           NETCONTENTS                        double             NULL    , 
           NETCONTENTSUNITS                   varchar( 254 )     NULL    , 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NULL    , 
           FK_ID_SUBREGPRODUCT                int                NOT NULL, 
           FK_ID_MASTERLABELCONTENT           int                NULL     ) ;
 
/* Entity - SubregPhysicalLabelDef */
CREATE TABLE SUBREGPHYSICALLABELDEF ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           PRODUCTNAME                        varchar( 254 )     NULL    , 
           CREATEDDATETIME                    datetime           NULL    , 
           MODIFIEDDATETIME                   datetime           NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NULL     ) ;
 
/* Entity - SubregProduct */
CREATE TABLE SUBREGPRODUCT ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NOT NULL, 
           z_NUMBER                           varchar( 5 )       NOT NULL, 
           DESCRIPTION                        longtext           NULL    , 
           CHEMICALFAMILY                     varchar( 2 )       NOT NULL, 
           EPA_REGISTRATIONNUMBER             varchar( 128 )     NULL    , 
           EPA_ESTABLISHMENTNUMBER            varchar( 128 )     NULL    , 
           EPA_DRAFTLABEL                     datetime           NULL    , 
           ESL_DATE                           datetime           NULL    , 
           EPA_TOXICITYCATEGORY               int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_MASTERPRODUCT                int                NOT NULL, 
           FK_ID_SUBREGISTRANT                int                NOT NULL ) ;
 
/* Entity - Temp */
CREATE TABLE z_TEMP ( 
           MARGINTOP                          double             NULL    , 
           MARGINBOTTOM                       double             NULL    , 
           MARGINLEFT                         double             NULL    , 
           MARGINRIGHT                        double             NULL     ) ;
 
/* Entity - M_TOC */
CREATE TABLE M_TOC ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             varchar( 254 )     NULL    , 
           PAGE                               int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - User */
CREATE TABLE z_USER ( 
           ID                                 int                NOT NULL, 
           USERNAME                           varchar( 128 )     NOT NULL, 
           USERPASSWORD                       varchar( 128 )     NULL    , 
           LASTLOGINDATETIME                  datetime           NULL    , 
           PASSWORDEXPIRESDATETIME            datetime           NULL    , 
           EMAILADDRESS                       varchar( 254 )     NULL    , 
           ACTIVE                             varchar( 1 )       NULL    , 
           STATUS                             varchar( 1 )       NULL    , 
           z_NOTE                             longtext           NULL    , 
           CREATEDDATETIME                    datetime           NULL    , 
           MODIFIEDDATETIME                   datetime           NULL    , 
           CREATEDBY                          varchar( 128 )     NULL    , 
           LASTMODIFIEDBY                     varchar( 128 )     NULL    , 
           FK_ID_PERSON                       int                NULL     ) ;
 
/* Entity - ZeidonGenkeyTable */
CREATE TABLE ZEIDONGENKEYTABLE ( 
           CURRENTGENKEY                      int                NULL    , 
           TABLENAME                          varchar( 32 )      NOT NULL ) ;
 
/* Entity - ZeidonLocking */
CREATE TABLE ZEIDONLOCKING ( 
           LOD_NAME                           varchar( 35 )      NOT NULL, 
           KEYVALUE                           varchar( 200 )     NOT NULL, 
           USERNAME                           varchar( 32 )      NOT NULL, 
           ALLOWREAD                          varchar( 1 )       NULL    , 
           z_TIMESTAMP                        datetime           NOT NULL, 
           ID                                 int                NULL     ) ;
 
CREATE TABLE MMSUSAGEDRVSSDIRECTIONSFORUSESECT ( 
           FK_ID_S_DIRECTIONSFORUSESECTION    int                NOT NULL, 
           FK_ID_S_USAGE                      int                NOT NULL ) ;
 
CREATE TABLE MMMUSAGEDRVSMDIRECTIONSFORUSESECT ( 
           FK_ID_M_DIRECTIONSFORUSESECTION    int                NOT NULL, 
           FK_ID_M_USAGE                      int                NOT NULL ) ;
 
CREATE TABLE MM_MASTERPRODUCT_FOR_SUBREGISTRAN ( 
           FK_ID_SUBREGISTRANT                int                NOT NULL, 
           FK_ID_MASTERPRODUCT                int                NOT NULL ) ;
 
CREATE TABLE MMSPLDDIRECTIONSFORUSESECTIONFRSP ( 
           FK_ID_SPLD_USAGE                   int                NOT NULL, 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI   int                NOT NULL ) ;
 
CREATE TABLE MM_SPLD_MARKETINGSECTIONFRSPLDUSA ( 
           FK_ID_SPLD_USAGE                   int                NOT NULL, 
           FK_ID_SPLD_MARKETINGSECTION        int                NOT NULL ) ;
 
/* Main key for Entity - Address */
CREATE UNIQUE INDEX UADDRESS_ID_2440540 
      ON ADDRESS ( 
           ID ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_PHONE1_2440630 
      ON ADDRESS ( 
           PHONE ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_CITY_2440580 
      ON ADDRESS ( 
           CITY ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_STATE_2440590 
      ON ADDRESS ( 
           STATE ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_ZIPCODE_2440620 
      ON ADDRESS ( 
           ZIPCODE ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has mail [0:1] ) ADDRESS' */
CREATE INDEX ADDRESS_FK_ID_ORGANIZATION_245295 
      ON ADDRESS ( 
           FK_ID_ORGANIZATION ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has [0:1] ) ADDRESS' */
CREATE INDEX ADDRESS_FK_ID_ORGANIZATION0224529 
      ON ADDRESS ( 
           FK_ID_ORGANIZATION02 ) ;
 
 
/* Main key for Entity - Color */
CREATE UNIQUE INDEX UCOLOR_ID_2440800 
      ON COLOR ( 
           ID ) ;
/* Main key for Entity - Color */
CREATE INDEX COLOR_NAME_2440810 
      ON COLOR ( 
           NAME ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) COLOR' */
CREATE INDEX COLOR_FK_ID_SUBREGISTRANT_2452580 
      ON COLOR ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
/* Main key for Entity - Domain */
CREATE UNIQUE INDEX Uz_DOMAIN_ID_2440910 
      ON z_DOMAIN ( 
           ID ) ;
 
 
/* Main key for Entity - DomainValue */
CREATE UNIQUE INDEX UDOMAINVALUE_DOMAINVALUEID_244102 
      ON DOMAINVALUE ( 
           DOMAINVALUE_TOKEN ) ;
 
 
/* Index for Relationship - 'z_DOMAIN(has [0:m] ) DOMAINVALUE' */
CREATE INDEX DOMAINVALUE_FK_ID_Z_DOMAIN_245414 
      ON DOMAINVALUE ( 
           FK_ID_Z_DOMAIN ) ;
 
 
/* Main key for Entity - EPA_ApplicationType */
CREATE UNIQUE INDEX UEPA_APPLICATIONTYPE_ID_2441040 
      ON EPA_APPLICATIONTYPE ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_APPLICATIONTYPE' */
CREATE INDEX EPAAPPLICATIONTYPEFKIDEPACHE24528 
      ON EPA_APPLICATIONTYPE ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
 
/* Main key for Entity - EPA_ChemicalFamily */
CREATE UNIQUE INDEX UEPA_CHEMICALFAMILY_ID_2441080 
      ON EPA_CHEMICALFAMILY ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) EPA_CHEMICALFAMILY' */
CREATE INDEX EPA_CHEMICALFAMILYFKIDEPAMMS24528 
      ON EPA_CHEMICALFAMILY ( 
           FK_ID_EPAMMS ) ;
 
 
/* Main key for Entity - EPA_Claim */
CREATE UNIQUE INDEX UEPA_CLAIM_ID_2441140 
      ON EPA_CLAIM ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_CLAIM' */
CREATE INDEX EPACLAIMFKIDEPACHEMICALFAMIL24535 
      ON EPA_CLAIM ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
 
/* Main key for Entity - EPA_Location */
CREATE UNIQUE INDEX UEPA_LOCATION_ID_2441190 
      ON EPA_LOCATION ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_LOCATION' */
CREATE INDEX EPALOCATIONFKIDEPACHEMICALFA24539 
      ON EPA_LOCATION ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
 
/* Main key for Entity - EPA_StorageDisposal */
CREATE UNIQUE INDEX UEPA_STORAGEDISPOSAL_ID_2441230 
      ON EPA_STORAGEDISPOSAL ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_STORAGEDISPOSAL' */
CREATE INDEX EPASTORAGEDISPOSALFKIDEPACHE24539 
      ON EPA_STORAGEDISPOSAL ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
 
/* Main key for Entity - EPA_Surface */
CREATE UNIQUE INDEX UEPA_SURFACE_ID_2441300 
      ON EPA_SURFACE ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_SURFACE' */
CREATE INDEX EPASURFACEFKIDEPACHEMICALFAM24539 
      ON EPA_SURFACE ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
 
/* Main key for Entity - ePamms */
CREATE UNIQUE INDEX UEPAMMS_ID_2441340 
      ON EPAMMS ( 
           ID ) ;
 
 
/* Main key for Entity - Feedback */
CREATE UNIQUE INDEX UFEEDBACK_ID_2441380 
      ON FEEDBACK ( 
           ID ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has [0:m] ) FEEDBACK' */
CREATE INDEX FEEDBACK_FK_ID_ORGANIZATION_24528 
      ON FEEDBACK ( 
           FK_ID_ORGANIZATION ) ;
 
 
/* Main key for Entity - FootnoteSymbol */
CREATE UNIQUE INDEX UFOOTNOTESYMBOL_ID_2441450 
      ON FOOTNOTESYMBOL ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) FOOTNOTESYMBOL' */
CREATE INDEX FOOTNOTESYMBOL_FK_ID_EPAMMS_24521 
      ON FOOTNOTESYMBOL ( 
           FK_ID_EPAMMS ) ;
 
 
/* Main key for Entity - GraphicLabelControl */
CREATE UNIQUE INDEX UGRAPHICLABELCONTROL_ID_2441500 
      ON GRAPHICLABELCONTROL ( 
           ID ) ;
 
 
/* Index for Relationship - 'GRAPHICLABELDEFINITION(has [0:m] ) GRAPHICLABELCONTROL' */
CREATE INDEX GRAPHICLABELCONTROLFKIDGRAPH24540 
      ON GRAPHICLABELCONTROL ( 
           FK_ID_GRAPHICLABELDEFINITION ) ;
 
 
/* Main key for Entity - GraphicLabelDefinition */
CREATE UNIQUE INDEX UGRAPHICLABELDEFINITION_ID_244158 
      ON GRAPHICLABELDEFINITION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) GRAPHICLABELDEFINITION' */
CREATE INDEX GRAPHICLABELDEFINITIONFKIDSU24540 
      ON GRAPHICLABELDEFINITION ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) GRAPHICLABELDEFINITION' */
CREATE INDEX GRAPHICLABELDEFINITIONFKIDSU24540 
      ON GRAPHICLABELDEFINITION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - Help */
CREATE UNIQUE INDEX UHELP_ID_2441650 
      ON HELP ( 
           ID ) ;
/* Main key for Entity - Help */
CREATE INDEX HELP_NAME_2441660 
      ON HELP ( 
           DIALOGWINDOW ) ;
 
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) HELP' */
CREATE INDEX HELP_FK_ID_EPAMMS_2452460 
      ON HELP ( 
           FK_ID_EPAMMS ) ;
 
 
/* Main key for Entity - Keyword */
CREATE UNIQUE INDEX UKEYWORD_ID_2441710 
      ON KEYWORD ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) KEYWORD' */
CREATE INDEX KEYWORD_FK_ID_EPAMMS_2452840 
      ON KEYWORD ( 
           FK_ID_EPAMMS ) ;
 
 
/* Main key for Entity - LLD */
CREATE UNIQUE INDEX ULLD_ID_2441750 
      ON LLD ( 
           ID ) ;
 
 
/* Main key for Entity - LLD_Block */
CREATE UNIQUE INDEX ULLD_BLOCK_ID_2441940 
      ON LLD_BLOCK ( 
           ID ) ;
 
 
/* Index for Relationship - 'COLOR(is background for [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_BG_ID_COLOR_2452550 
      ON LLD_BLOCK ( 
           BG_ID_COLOR ) ;
 
 
/* Index for Relationship - 'COLOR(is border for [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_BD_ID_COLOR_2452560 
      ON LLD_BLOCK ( 
           BD_ID_COLOR ) ;
 
 
/* Index for Relationship - 'COLOR(is Text for [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_TX_ID_COLOR_2452570 
      ON LLD_BLOCK ( 
           TX_ID_COLOR ) ;
 
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_FK_ID_SPLD_SECTION24528 
      ON LLD_BLOCK ( 
           FK_ID_SPLD_SECTION ) ;
 
 
/* Index for Relationship - 'LLD_PANEL(has [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_FK_ID_LLD_PANEL_2453350 
      ON LLD_BLOCK ( 
           FK_ID_LLD_PANEL ) ;
 
 
/* Index for Relationship - 'LLD_BLOCK(is linked to [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_FK_ID_LLD_BLOCK_2453420 
      ON LLD_BLOCK ( 
           FK_ID_LLD_BLOCK ) ;
 
 
/* Main key for Entity - LLD_Page */
CREATE UNIQUE INDEX ULLD_PAGE_ID_2442440 
      ON LLD_PAGE ( 
           ID ) ;
 
 
/* Index for Relationship - 'COLOR(is background for [0:m] ) LLD_PAGE' */
CREATE INDEX LLD_PAGE_FK_ID_COLOR_2452520 
      ON LLD_PAGE ( 
           FK_ID_COLOR ) ;
 
 
/* Index for Relationship - 'LLD(has [0:m] ) LLD_PAGE' */
CREATE INDEX LLD_PAGE_FK_ID_LLD_2452770 
      ON LLD_PAGE ( 
           FK_ID_LLD ) ;
 
 
/* Index for Relationship - 'SPLD_LLD(has [0:m] ) LLD_PAGE' */
CREATE INDEX LLD_PAGE_FK_ID_SPLD_LLD_2452780 
      ON LLD_PAGE ( 
           FK_ID_SPLD_LLD ) ;
 
 
/* Main key for Entity - LLD_Panel */
CREATE UNIQUE INDEX ULLD_PANEL_ID_2442550 
      ON LLD_PANEL ( 
           ID ) ;
 
 
/* Index for Relationship - 'COLOR(is background for [0:m] ) LLD_PANEL' */
CREATE INDEX LLD_PANEL_BG_ID_COLOR_2452530 
      ON LLD_PANEL ( 
           BG_ID_COLOR ) ;
 
 
/* Index for Relationship - 'COLOR(is border for [0:m] ) LLD_PANEL' */
CREATE INDEX LLD_PANEL_BD_ID_COLOR_2452540 
      ON LLD_PANEL ( 
           BD_ID_COLOR ) ;
 
 
/* Index for Relationship - 'LLD_PAGE(has [0:m] ) LLD_PANEL' */
CREATE INDEX LLD_PANEL_FK_ID_LLD_PAGE_2452760 
      ON LLD_PANEL ( 
           FK_ID_LLD_PAGE ) ;
 
 
/* Main key for Entity - LLD_SpecialSectionAttribute */
CREATE UNIQUE INDEX ULLDSPECIALSECTIONATTRIBUTEI24430 
      ON LLD_SPECIALSECTIONATTRIBUTE ( 
           ID ) ;
 
 
/* Index for Relationship - 'LLD_BLOCK(contains [0:m] ) LLD_SPECIALSECTIONATTRIBUTE' */
CREATE INDEX LLDSPECIALSECTIONATTRIBUTEP124527 
      ON LLD_SPECIALSECTIONATTRIBUTE ( 
           PF1ID_LLD_BLOCK ) ;
 
 
/* Index for Relationship - 'LLD_BLOCK(is text characteristics (max 1) [0:m] ) LLD_SPECIALSECTIONATTRIBUTE' */
CREATE INDEX LLDSPECIALSECTIONATTRIBUTEP224528 
      ON LLD_SPECIALSECTIONATTRIBUTE ( 
           PF2ID_LLD_BLOCK ) ;
 
 
/* Main key for Entity - M_DilutionChartEntry */
CREATE UNIQUE INDEX UM_DILUTIONCHARTENTRY_ID_2443100 
      ON M_DILUTIONCHARTENTRY ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DILUTIONGROUP(has [0:m] ) M_DILUTIONCHARTENTRY' */
CREATE INDEX MDILUTIONCHARTENTRYFKIDMDILU24521 
      ON M_DILUTIONCHARTENTRY ( 
           FK_ID_M_DILUTIONGROUP ) ;
 
 
/* Main key for Entity - M_DilutionGroup */
CREATE UNIQUE INDEX UM_DILUTIONGROUP_ID_2443170 
      ON M_DILUTIONGROUP ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_DILUTIONGROUP' */
CREATE INDEX MDILUTIONGROUPFKIDMASTERLABE24526 
      ON M_DILUTIONGROUP ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_DilutionGroupItem */
CREATE UNIQUE INDEX UM_DILUTIONGROUPITEM_ID_2443290 
      ON M_DILUTIONGROUPITEM ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DILUTIONGROUP(has [0:m] ) M_DILUTIONGROUPITEM' */
CREATE INDEX MDILUTIONGROUPITEMFKIDMDILUT24526 
      ON M_DILUTIONGROUPITEM ( 
           FK_ID_M_DILUTIONGROUP ) ;
 
 
/* Main key for Entity - M_DirectionsForUseCategory */
CREATE UNIQUE INDEX UMDIRECTIONSFORUSECATEGORYID24433 
      ON M_DIRECTIONSFORUSECATEGORY ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSECATEGORY(has next version [0:m] ) M_DIRECTIONSFORUSECATEGORY' */
CREATE INDEX MDIRECTIONSFORUSECATEGORYFKI24521 
      ON M_DIRECTIONSFORUSECATEGORY ( 
           FK_ID_M_DIRECTIONSFORUSECATEGORY ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_DIRECTIONSFORUSECATEGORY' */
CREATE INDEX MDIRECTIONSFORUSECATEGORYFKI24521 
      ON M_DIRECTIONSFORUSECATEGORY ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_DirectionsForUseSection */
CREATE UNIQUE INDEX UM_DIRECTIONSFORUSESECTIONID24434 
      ON M_DIRECTIONSFORUSESECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSECATEGORY(has [0:m] ) M_DIRECTIONSFORUSESECTION' */
CREATE INDEX MDIRECTIONSFORUSESECTIONFKID24521 
      ON M_DIRECTIONSFORUSESECTION ( 
           FK_ID_M_DIRECTIONSFORUSECATEGORY ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(exclusiveTo [0:1] ) M_DIRECTIONSFORUSESECTION' */
CREATE INDEX MDIRECTIONSFORUSESECTIONXORI24523 
      ON M_DIRECTIONSFORUSESECTION ( 
           XORID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has next version [0:m] ) M_DIRECTIONSFORUSESECTION' */
CREATE INDEX MDIRECTIONSFORUSESECTIONFKID24536 
      ON M_DIRECTIONSFORUSESECTION ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Main key for Entity - M_DirectionsForUseStatement */
CREATE UNIQUE INDEX UMDIRECTIONSFORUSESTATEMENTI24436 
      ON M_DIRECTIONSFORUSESTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has sub [0:m] ) M_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX MDIRECTIONSFORUSESTATEMENTSU24521 
      ON M_DIRECTIONSFORUSESTATEMENT ( 
           SUBID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has [0:m] ) M_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX MDIRECTIONSFORUSESTATEMENTFK24534 
      ON M_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has next version [0:m] ) M_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX MDIRECTIONSFORUSESTATEMENTFK24535 
      ON M_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Main key for Entity - M_GeneralSection */
CREATE UNIQUE INDEX UM_GENERALSECTION_ID_2443750 
      ON M_GENERALSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_GENERALSECTION' */
CREATE INDEX MGENERALSECTIONFKIDMASTERLAB24533 
      ON M_GENERALSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Index for Relationship - 'M_GENERALSECTION(has next version [0:m] ) M_GENERALSECTION' */
CREATE INDEX MGENERALSECTIONFKIDMGENERALS24534 
      ON M_GENERALSECTION ( 
           FK_ID_M_GENERALSECTION ) ;
 
 
/* Main key for Entity - M_GeneralStatement */
CREATE UNIQUE INDEX UM_GENERALSTATEMENT_ID_2443910 
      ON M_GENERALSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_GENERALSUBSECTION(has [0:m] ) M_GENERALSTATEMENT' */
CREATE INDEX MGENERALSTATEMENTFKIDMGENERA24522 
      ON M_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSUBSECTION ) ;
 
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) M_GENERALSTATEMENT' */
CREATE INDEX MGENERALSTATEMENTFKIDMGENERA24533 
      ON M_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSECTION ) ;
 
 
/* Index for Relationship - 'M_GENERALSTATEMENT(has next version [0:m] ) M_GENERALSTATEMENT' */
CREATE INDEX MGENERALSTATEMENTFKIDMGENERA24534 
      ON M_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSTATEMENT ) ;
 
 
/* Main key for Entity - M_GeneralSubsection */
CREATE UNIQUE INDEX UM_GENERALSUBSECTION_ID_2443980 
      ON M_GENERALSUBSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) M_GENERALSUBSECTION' */
CREATE INDEX MGENERALSUBSECTIONFKIDMGENER24522 
      ON M_GENERALSUBSECTION ( 
           FK_ID_M_GENERALSECTION ) ;
 
 
/* Main key for Entity - M_HumanHazardSection */
CREATE UNIQUE INDEX UM_HUMANHAZARDSECTION_ID_2444050 
      ON M_HUMANHAZARDSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:1] ) M_HUMANHAZARDSECTION' */
CREATE INDEX MHUMANHAZARDSECTIONFKIDMASTE24536 
      ON M_HUMANHAZARDSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Index for Relationship - 'M_HUMANHAZARDSECTION(has next version [0:m] ) M_HUMANHAZARDSECTION' */
CREATE INDEX MHUMANHAZARDSECTIONFKIDMHUMA24536 
      ON M_HUMANHAZARDSECTION ( 
           FK_ID_M_HUMANHAZARDSECTION ) ;
 
 
/* Main key for Entity - M_IngredientsSection */
CREATE UNIQUE INDEX UM_INGREDIENTSSECTION_ID_2444320 
      ON M_INGREDIENTSSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has next version [0:m] ) M_INGREDIENTSSECTION' */
CREATE INDEX MINGREDIENTSSECTIONFKIDMINGR24539 
      ON M_INGREDIENTSSECTION ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:1] ) M_INGREDIENTSSECTION' */
CREATE INDEX MINGREDIENTSSECTIONFKIDMASTE24539 
      ON M_INGREDIENTSSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_IngredientsStatement */
CREATE UNIQUE INDEX UM_INGREDIENTSSTATEMENT_ID_244441 
      ON M_INGREDIENTSSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has [0:m] ) M_INGREDIENTSSTATEMENT' */
CREATE INDEX MINGREDIENTSSTATEMENTFKIDMIN24538 
      ON M_INGREDIENTSSTATEMENT ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
 
/* Index for Relationship - 'M_INGREDIENTSSTATEMENT(has next version [0:m] ) M_INGREDIENTSSTATEMENT' */
CREATE INDEX MINGREDIENTSSTATEMENTFKIDMIN24539 
      ON M_INGREDIENTSSTATEMENT ( 
           FK_ID_M_INGREDIENTSSTATEMENT ) ;
 
 
/* Main key for Entity - M_InsertText */
CREATE UNIQUE INDEX UM_INSERTTEXT_ID_2444500 
      ON M_INSERTTEXT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_INSERTTEXTKEYWORD(has [0:m] ) M_INSERTTEXT' */
CREATE INDEX MINSERTTEXTFKIDMINSERTTEXTKE24524 
      ON M_INSERTTEXT ( 
           FK_ID_M_INSERTTEXTKEYWORD ) ;
 
 
/* Main key for Entity - M_InsertTextKeyword */
CREATE UNIQUE INDEX UM_INSERTTEXTKEYWORD_ID_2444540 
      ON M_INSERTTEXTKEYWORD ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMSTORA24522 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_STORAGEDISPOSALSTATEMENT ) ;
 
 
/* Index for Relationship - 'M_GENERALSTATEMENT(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMGENER24522 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_GENERALSTATEMENT ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has title [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMDIREC24523 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSECTION(has title [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMMARKE24523 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMUSAGE24523 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_USAGE ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMMARKE24524 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMDIREC24524 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Main key for Entity - M_MarketingSection */
CREATE UNIQUE INDEX UM_MARKETINGSECTION_ID_2444590 
      ON M_MARKETINGSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_MARKETINGSECTION' */
CREATE INDEX MMARKETINGSECTIONFKIDMASTERL24536 
      ON M_MARKETINGSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSECTION(has next version [0:m] ) M_MARKETINGSECTION' */
CREATE INDEX MMARKETINGSECTIONFKIDMMARKET24537 
      ON M_MARKETINGSECTION ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
 
/* Main key for Entity - M_MarketingStatement */
CREATE UNIQUE INDEX UM_MARKETINGSTATEMENT_ID_2444690 
      ON M_MARKETINGSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSECTION(has [0:m] ) M_MARKETINGSTATEMENT' */
CREATE INDEX MMARKETINGSTATEMENTFKIDMMARK24530 
      ON M_MARKETINGSTATEMENT ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has next version [0:m] ) M_MARKETINGSTATEMENT' */
CREATE INDEX MMARKETINGSTATEMENTFKIDMMARK24536 
      ON M_MARKETINGSTATEMENT ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
 
/* Main key for Entity - M_MetaTable */
CREATE UNIQUE INDEX UM_METATABLE_ID_2444770 
      ON M_METATABLE ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_METATABLE' */
CREATE INDEX MMETATABLEFKIDMASTERLABELCON24520 
      ON M_METATABLE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_ReviewerNote */
CREATE UNIQUE INDEX UM_REVIEWERNOTE_ID_2444930 
      ON M_REVIEWERNOTE ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSECTION(has [0:m] ) M_REVIEWERNOTE' */
CREATE INDEX MREVIEWERNOTEFKIDMMARKETINGS24522 
      ON M_REVIEWERNOTE ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has [0:m] ) M_REVIEWERNOTE' */
CREATE INDEX MREVIEWERNOTEFKIDMDIRECTIONS24522 
      ON M_REVIEWERNOTE ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) M_REVIEWERNOTE' */
CREATE INDEX MREVIEWERNOTEFKIDMGENERALSEC24523 
      ON M_REVIEWERNOTE ( 
           FK_ID_M_GENERALSECTION ) ;
 
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has [0:m] ) M_REVIEWERNOTE' */
CREATE INDEX MREVIEWERNOTEFKIDMINGREDIENT24523 
      ON M_REVIEWERNOTE ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
 
/* Main key for Entity - M_Rows */
CREATE UNIQUE INDEX UM_ROWS_ID_2444980 
      ON M_ROWS ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_METATABLE(has [0:m] ) M_ROWS' */
CREATE INDEX M_ROWS_FK_ID_M_METATABLE_2452090 
      ON M_ROWS ( 
           FK_ID_M_METATABLE ) ;
 
 
/* Main key for Entity - M_StorageDisposalSection */
CREATE UNIQUE INDEX UM_STORAGEDISPOSALSECTION_ID24451 
      ON M_STORAGEDISPOSALSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_STORAGEDISPOSALSECTION' */
CREATE INDEX MSTORAGEDISPOSALSECTIONFKIDM24535 
      ON M_STORAGEDISPOSALSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has next version [0:m] ) M_STORAGEDISPOSALSECTION' */
CREATE INDEX MSTORAGEDISPOSALSECTIONFKIDM24535 
      ON M_STORAGEDISPOSALSECTION ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
 
/* Main key for Entity - M_StorageDisposalStatement */
CREATE UNIQUE INDEX UMSTORAGEDISPOSALSTATEMENTID24452 
      ON M_STORAGEDISPOSALSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has sub [0:m] ) M_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX MSTORAGEDISPOSALSTATEMENTSUB24521 
      ON M_STORAGEDISPOSALSTATEMENT ( 
           SUBID_M_STORAGEDISPOSALSTATEMENT ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has [0:m] ) M_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX MSTORAGEDISPOSALSTATEMENTFKI24534 
      ON M_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has next version [0:m] ) M_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX MSTORAGEDISPOSALSTATEMENTFKI24534 
      ON M_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_M_STORAGEDISPOSALSTATEMENT ) ;
 
 
/* Main key for Entity - M_Usage */
CREATE UNIQUE INDEX UM_USAGE_ID_2445380 
      ON M_USAGE ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGE_2452190 
      ON M_USAGE ( 
           FK_ID_M_USAGE ) ;
 
 
/* Index for Relationship - 'M_USAGEGROUP(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGEGROUP_245234 
      ON M_USAGE ( 
           FK_ID_M_USAGEGROUP ) ;
 
 
/* Index for Relationship - 'M_USAGEFOOTNOTE(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_MUSAGEFOOTNOTE24526 
      ON M_USAGE ( 
           FK_ID_M_USAGEFOOTNOTE ) ;
 
 
/* Index for Relationship - 'M_USAGETYPE(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGETYPE_2452750 
      ON M_USAGE ( 
           FK_ID_M_USAGETYPE ) ;
 
 
/* Index for Relationship - 'M_USAGE(has next version [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGE02_2453710 
      ON M_USAGE ( 
           FK_ID_M_USAGE02 ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has (delete) [0:m] ) M_USAGE' */
CREATE INDEX MUSAGEFKIDMASTERLABELCONTENT24539 
      ON M_USAGE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_UsageFootnote */
CREATE UNIQUE INDEX UM_USAGEFOOTNOTE_ID_2445470 
      ON M_USAGEFOOTNOTE ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_USAGEFOOTNOTE' */
CREATE INDEX MUSAGEFOOTNOTEFKIDMASTERLABE24526 
      ON M_USAGEFOOTNOTE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_UsageGroup */
CREATE UNIQUE INDEX UM_USAGEGROUP_ID_2445520 
      ON M_USAGEGROUP ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_USAGETYPE(has [0:m] ) M_USAGEGROUP' */
CREATE INDEX M_USAGEGROUP_FK_IDMUSAGETYPE24523 
      ON M_USAGEGROUP ( 
           FK_ID_M_USAGETYPE ) ;
 
 
/* Main key for Entity - M_UsageOrdering */
CREATE UNIQUE INDEX UM_USAGEORDERING_ID_2445560 
      ON M_USAGEORDERING ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX M_USAGEORDERING_FK_ID_MUSAGE24530 
      ON M_USAGEORDERING ( 
           FK_ID_M_USAGE ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX MUSAGEORDERINGFKIDMDIRECTION24530 
      ON M_USAGEORDERING ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX MUSAGEORDERINGFKIDMMARKETING24540 
      ON M_USAGEORDERING ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
 
/* Main key for Entity - M_UsageType */
CREATE UNIQUE INDEX UM_USAGETYPE_ID_2445590 
      ON M_USAGETYPE ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_USAGETYPE' */
CREATE INDEX MUSAGETYPEFKIDMASTERLABELCON24527 
      ON M_USAGETYPE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - MasterLabelContent */
CREATE UNIQUE INDEX UMASTERLABELCONTENT_ID_2445650 
      ON MASTERLABELCONTENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has sub [0:m] ) MASTERLABELCONTENT' */
CREATE INDEX MASTERLABELCONTENTSUBIDMASTE24521 
      ON MASTERLABELCONTENT ( 
           SUBID_MASTERLABELCONTENT ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has next version (max 1) [0:m] ) MASTERLABELCONTENT' */
CREATE INDEX MASTERLABELCONTENTFKIDMASTER24531 
      ON MASTERLABELCONTENT ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Index for Relationship - 'MASTERPRODUCT(has [0:m] ) MASTERLABELCONTENT' */
CREATE INDEX MASTERLABELCONTENTFKIDMASTER24540 
      ON MASTERLABELCONTENT ( 
           FK_ID_MASTERPRODUCT ) ;
 
 
/* Main key for Entity - MasterProduct */
CREATE UNIQUE INDEX UMASTERPRODUCT_ID_2445900 
      ON MASTERPRODUCT ( 
           ID ) ;
 
 
/* Index for Relationship - 'PRIMARYREGISTRANT(has [0:m] ) MASTERPRODUCT' */
CREATE INDEX MASTERPRODUCTFKIDPRIMARYREGI24540 
      ON MASTERPRODUCT ( 
           FK_ID_PRIMARYREGISTRANT ) ;
 
 
/* Main key for Entity - NetContents */
CREATE UNIQUE INDEX UNETCONTENTS_ID_2446050 
      ON NETCONTENTS ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:1] ) NETCONTENTS' */
CREATE INDEX NETCONTENTSFKIDMASTERLABELCO24522 
      ON NETCONTENTS ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - Organization */
CREATE UNIQUE INDEX UORGANIZATION_ID_2446110 
      ON ORGANIZATION ( 
           ID ) ;
 
 
/* Main key for Entity - Person */
CREATE UNIQUE INDEX UPERSON_ID_2446240 
      ON PERSON ( 
           ID ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_LASTNAME_2446250 
      ON PERSON ( 
           LASTNAME ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_EMAILADDRESS_2446350 
      ON PERSON ( 
           EMAILADDRESS ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_HOMEPHONE_2446300 
      ON PERSON ( 
           HOMEPHONE ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_GENDER_2446290 
      ON PERSON ( 
           GENDER ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_WORKPHONE_2446320 
      ON PERSON ( 
           WORKPHONE ) ;
 
 
/* Index for Relationship - 'ADDRESS(for [0:1] ) PERSON' */
CREATE INDEX PERSON_FK_ID_ADDRESS_2454150 
      ON PERSON ( 
           FK_ID_ADDRESS ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has employee [0:m] ) PERSON' */
CREATE INDEX PERSON_FK_ID_ORGANIZATION_2454160 
      ON PERSON ( 
           FK_ID_ORGANIZATION ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has contact [0:1] ) PERSON' */
CREATE INDEX PERSONHASCONTACTIDORGANIZATI24541 
      ON PERSON ( 
           HASCONTACTID_ORGANIZATION ) ;
 
 
/* Main key for Entity - PrimaryRegistrant */
CREATE UNIQUE INDEX UPRIMARYREGISTRANT_ID_2446490 
      ON PRIMARYREGISTRANT ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) PRIMARYREGISTRANT' */
CREATE INDEX PRIMARYREGISTRANT_FKIDEPAMMS24526 
      ON PRIMARYREGISTRANT ( 
           FK_ID_EPAMMS ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has [0:1] ) PRIMARYREGISTRANT' */
CREATE INDEX PRIMARYREGISTRANTFKIDORGANIZ24529 
      ON PRIMARYREGISTRANT ( 
           FK_ID_ORGANIZATION ) ;
 
 
/* Main key for Entity - PrimarySub */
CREATE UNIQUE INDEX UPRIMARYSUB_ID_2446530 
      ON PRIMARYSUB ( 
           ID ) ;
 
 
/* Index for Relationship - 'PRIMARYREGISTRANT(has [0:m] ) PRIMARYSUB' */
CREATE INDEX PRIMARYSUBFKIDPRIMARYREGISTR24520 
      ON PRIMARYSUB ( 
           FK_ID_PRIMARYREGISTRANT ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) PRIMARYSUB' */
CREATE INDEX PRIMARYSUB_FKIDSUBREGISTRANT24541 
      ON PRIMARYSUB ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
/* Main key for Entity - ResumeObject */
CREATE UNIQUE INDEX URESUMEOBJECT_ID_2446560 
      ON RESUMEOBJECT ( 
           ID ) ;
 
 
/* Index for Relationship - 'RESUMEPATH(has [0:m] ) RESUMEOBJECT' */
CREATE INDEX RESUMEOBJECT_FK_IDRESUMEPATH24523 
      ON RESUMEOBJECT ( 
           FK_ID_RESUMEPATH ) ;
 
 
/* Main key for Entity - ResumePath */
CREATE UNIQUE INDEX URESUMEPATH_ID_2446640 
      ON RESUMEPATH ( 
           ID ) ;
 
 
/* Index for Relationship - 'z_USER(has [0:m] ) RESUMEPATH' */
CREATE INDEX RESUMEPATH_FK_ID_Z_USER_2452360 
      ON RESUMEPATH ( 
           FK_ID_Z_USER ) ;
 
 
/* Main key for Entity - ReusableBlockDefinition */
CREATE UNIQUE INDEX UREUSABLEBLOCKDEFINITION_ID_24466 
      ON REUSABLEBLOCKDEFINITION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) REUSABLEBLOCKDEFINITION' */
CREATE INDEX REUSABLEBLOCKDEFINITIONFKIDS24525 
      ON REUSABLEBLOCKDEFINITION ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
/* Index for Relationship - 'LLD_BLOCK(has [0:1] ) REUSABLEBLOCKDEFINITION' */
CREATE INDEX REUSABLEBLOCKDEFINITIONFKIDL24526 
      ON REUSABLEBLOCKDEFINITION ( 
           FK_ID_LLD_BLOCK ) ;
 
 
/* Main key for Entity - S_DilutionGroup */
CREATE UNIQUE INDEX US_DILUTIONGROUP_ID_2446740 
      ON S_DILUTIONGROUP ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_DILUTIONGROUP' */
CREATE INDEX SDILUTIONGROUPFKIDSUBREGLABE24527 
      ON S_DILUTIONGROUP ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Index for Relationship - 'M_DILUTIONGROUP(has [0:m] ) S_DILUTIONGROUP' */
CREATE INDEX SDILUTIONGROUPFKIDMDILUTIONG24527 
      ON S_DILUTIONGROUP ( 
           FK_ID_M_DILUTIONGROUP ) ;
 
 
/* Main key for Entity - S_DilutionGroupItem */
CREATE UNIQUE INDEX US_DILUTIONGROUPITEM_ID_2446780 
      ON S_DILUTIONGROUPITEM ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_DILUTIONGROUP(has [0:m] ) S_DILUTIONGROUPITEM' */
CREATE INDEX SDILUTIONGROUPITEMFKIDSDILUT24524 
      ON S_DILUTIONGROUPITEM ( 
           FK_ID_S_DILUTIONGROUP ) ;
 
 
/* Main key for Entity - S_DirectionsForUseSection */
CREATE UNIQUE INDEX US_DIRECTIONSFORUSESECTIONID24468 
      ON S_DIRECTIONSFORUSESECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has [0:m] ) S_DIRECTIONSFORUSESECTION' */
CREATE INDEX SDIRECTIONSFORUSESECTIONFKID24536 
      ON S_DIRECTIONSFORUSESECTION ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_DIRECTIONSFORUSESECTION' */
CREATE INDEX SDIRECTIONSFORUSESECTIONFKID24538 
      ON S_DIRECTIONSFORUSESECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_DirectionsForUseStatement */
CREATE UNIQUE INDEX USDIRECTIONSFORUSESTATEMENTI24469 
      ON S_DIRECTIONSFORUSESTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has [0:m] ) S_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SDIRECTIONSFORUSESTATEMENTFK24535 
      ON S_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(has [0:m] ) S_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SDIRECTIONSFORUSESTATEMENTFK24538 
      ON S_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
 
/* Main key for Entity - S_GeneralSection */
CREATE UNIQUE INDEX US_GENERALSECTION_ID_2447060 
      ON S_GENERALSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) S_GENERALSECTION' */
CREATE INDEX SGENERALSECTIONFKIDMGENERALS24534 
      ON S_GENERALSECTION ( 
           FK_ID_M_GENERALSECTION ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_GENERALSECTION' */
CREATE INDEX SGENERALSECTIONFKIDSUBREGLAB24537 
      ON S_GENERALSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_GeneralStatement */
CREATE UNIQUE INDEX US_GENERALSTATEMENT_ID_2447210 
      ON S_GENERALSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_GENERALSTATEMENT(has [0:m] ) S_GENERALSTATEMENT' */
CREATE INDEX SGENERALSTATEMENTFKIDMGENERA24533 
      ON S_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSTATEMENT ) ;
 
 
/* Index for Relationship - 'S_GENERALSECTION(has [0:m] ) S_GENERALSTATEMENT' */
CREATE INDEX SGENERALSTATEMENTFKIDSGENERA24537 
      ON S_GENERALSTATEMENT ( 
           FK_ID_S_GENERALSECTION ) ;
 
 
/* Main key for Entity - S_HumanHazardSection */
CREATE UNIQUE INDEX US_HUMANHAZARDSECTION_ID_2447290 
      ON S_HUMANHAZARDSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_HUMANHAZARDSECTION(has [0:m] ) S_HUMANHAZARDSECTION' */
CREATE INDEX SHUMANHAZARDSECTIONFKIDMHUMA24536 
      ON S_HUMANHAZARDSECTION ( 
           FK_ID_M_HUMANHAZARDSECTION ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_HUMANHAZARDSECTION' */
CREATE INDEX SHUMANHAZARDSECTIONFKIDSUBRE24537 
      ON S_HUMANHAZARDSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_IngredientsSection */
CREATE UNIQUE INDEX US_INGREDIENTSSECTION_ID_2447570 
      ON S_INGREDIENTSSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_INGREDIENTSSECTION' */
CREATE INDEX SINGREDIENTSSECTIONFKIDSUBRE24537 
      ON S_INGREDIENTSSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has [0:m] ) S_INGREDIENTSSECTION' */
CREATE INDEX SINGREDIENTSSECTIONFKIDMINGR24538 
      ON S_INGREDIENTSSECTION ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
 
/* Main key for Entity - S_IngredientsStatement */
CREATE UNIQUE INDEX US_INGREDIENTSSTATEMENT_ID_244767 
      ON S_INGREDIENTSSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_INGREDIENTSSECTION(has [0:m] ) S_INGREDIENTSSTATEMENT' */
CREATE INDEX SINGREDIENTSSTATEMENTFKIDSIN24537 
      ON S_INGREDIENTSSTATEMENT ( 
           FK_ID_S_INGREDIENTSSECTION ) ;
 
 
/* Index for Relationship - 'M_INGREDIENTSSTATEMENT(has [0:m] ) S_INGREDIENTSSTATEMENT' */
CREATE INDEX SINGREDIENTSSTATEMENTFKIDMIN24539 
      ON S_INGREDIENTSSTATEMENT ( 
           FK_ID_M_INGREDIENTSSTATEMENT ) ;
 
 
/* Main key for Entity - S_InsertText */
CREATE UNIQUE INDEX US_INSERTTEXT_ID_2447770 
      ON S_INSERTTEXT ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_INSERTTEXTKEYWORD(has [0:m] ) S_INSERTTEXT' */
CREATE INDEX SINSERTTEXTFKIDSINSERTTEXTKE24524 
      ON S_INSERTTEXT ( 
           FK_ID_S_INSERTTEXTKEYWORD ) ;
 
 
/* Main key for Entity - S_InsertTextKeyword */
CREATE UNIQUE INDEX US_INSERTTEXTKEYWORD_ID_2447820 
      ON S_INSERTTEXTKEYWORD ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has [0:m] ) S_INSERTTEXTKEYWORD' */
CREATE INDEX SINSERTTEXTKEYWORDFKIDSMARKE24524 
      ON S_INSERTTEXTKEYWORD ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESTATEMENT(has [0:m] ) S_INSERTTEXTKEYWORD' */
CREATE INDEX SINSERTTEXTKEYWORDFKIDSDIREC24524 
      ON S_INSERTTEXTKEYWORD ( 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Main key for Entity - S_MarketingSection */
CREATE UNIQUE INDEX US_MARKETINGSECTION_ID_2447870 
      ON S_MARKETINGSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSECTION(has next version [0:m] ) S_MARKETINGSECTION' */
CREATE INDEX SMARKETINGSECTIONFKIDSMARKET24529 
      ON S_MARKETINGSECTION ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSECTION(has [0:m] ) S_MARKETINGSECTION' */
CREATE INDEX SMARKETINGSECTIONFKIDMMARKET24537 
      ON S_MARKETINGSECTION ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_MARKETINGSECTION' */
CREATE INDEX SMARKETINGSECTIONFKIDSUBREGL24538 
      ON S_MARKETINGSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_MarketingStatement */
CREATE UNIQUE INDEX US_MARKETINGSTATEMENT_ID_2447970 
      ON S_MARKETINGSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has next version [0:m] ) S_MARKETINGSTATEMENT' */
CREATE INDEX SMARKETINGSTATEMENTFKIDSMARK24529 
      ON S_MARKETINGSTATEMENT ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSECTION(has [0:m] ) S_MARKETINGSTATEMENT' */
CREATE INDEX SMARKETINGSTATEMENTFKIDSMARK24531 
      ON S_MARKETINGSTATEMENT ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has [0:m] ) S_MARKETINGSTATEMENT' */
CREATE INDEX SMARKETINGSTATEMENTFKIDMMARK24537 
      ON S_MARKETINGSTATEMENT ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
 
/* Main key for Entity - S_StorageDisposalSection */
CREATE UNIQUE INDEX US_STORAGEDISPOSALSECTION_ID24480 
      ON S_STORAGEDISPOSALSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has [0:m] ) S_STORAGEDISPOSALSECTION' */
CREATE INDEX SSTORAGEDISPOSALSECTIONFKIDM24535 
      ON S_STORAGEDISPOSALSECTION ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_STORAGEDISPOSALSECTION' */
CREATE INDEX SSTORAGEDISPOSALSECTIONFKIDS24538 
      ON S_STORAGEDISPOSALSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_StorageDisposalStatement */
CREATE UNIQUE INDEX USSTORAGEDISPOSALSTATEMENTID24481 
      ON S_STORAGEDISPOSALSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has [0:m] ) S_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SSTORAGEDISPOSALSTATEMENTFKI24534 
      ON S_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_M_STORAGEDISPOSALSTATEMENT ) ;
 
 
/* Index for Relationship - 'S_STORAGEDISPOSALSECTION(has [0:m] ) S_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SSTORAGEDISPOSALSTATEMENTFKI24538 
      ON S_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_S_STORAGEDISPOSALSECTION ) ;
 
 
/* Main key for Entity - S_Usage */
CREATE UNIQUE INDEX US_USAGE_ID_2448310 
      ON S_USAGE ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_USAGE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_S_USAGE_2452210 
      ON S_USAGE ( 
           FK_ID_S_USAGE ) ;
 
 
/* Index for Relationship - 'S_USAGEFOOTNOTE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_SUSAGEFOOTNOTE24526 
      ON S_USAGE ( 
           FK_ID_S_USAGEFOOTNOTE ) ;
 
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_M_USAGE_2453700 
      ON S_USAGE ( 
           FK_ID_M_USAGE ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has (delete) [0:m] ) S_USAGE' */
CREATE INDEX SUSAGEFKIDSUBREGLABELCONTENT24538 
      ON S_USAGE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Index for Relationship - 'S_USAGETYPE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_S_USAGETYPE_2454010 
      ON S_USAGE ( 
           FK_ID_S_USAGETYPE ) ;
 
 
/* Main key for Entity - S_UsageFootnote */
CREATE UNIQUE INDEX US_USAGEFOOTNOTE_ID_2448400 
      ON S_USAGEFOOTNOTE ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_USAGEFOOTNOTE' */
CREATE INDEX SUSAGEFOOTNOTEFKIDSUBREGLABE24526 
      ON S_USAGEFOOTNOTE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_UsageOrdering */
CREATE UNIQUE INDEX US_USAGEORDERING_ID_2448460 
      ON S_USAGEORDERING ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX SUSAGEORDERINGFKIDSMARKETING24529 
      ON S_USAGEORDERING ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESTATEMENT(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX SUSAGEORDERINGFKIDSDIRECTION24535 
      ON S_USAGEORDERING ( 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Index for Relationship - 'S_USAGE(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX S_USAGEORDERING_FK_ID_SUSAGE24536 
      ON S_USAGEORDERING ( 
           FK_ID_S_USAGE ) ;
 
 
/* Main key for Entity - S_UsageType */
CREATE UNIQUE INDEX US_USAGETYPE_ID_2448500 
      ON S_USAGETYPE ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_USAGETYPE' */
CREATE INDEX SUSAGETYPEFKIDSUBREGLABELCON24540 
      ON S_USAGETYPE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_VersionChangeMessage */
CREATE UNIQUE INDEX US_VERSIONCHANGEMESSAGE_ID_244855 
      ON S_VERSIONCHANGEMESSAGE ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_VERSIONCHANGEMESSAGE' */
CREATE INDEX SVERSIONCHANGEMESSAGEFKIDSUB24522 
      ON S_VERSIONCHANGEMESSAGE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - SPLD_DirectionsForUseSection */
CREATE UNIQUE INDEX USPLDDIRECTIONSFORUSESECTION24485 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIONF24530 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIONF24531 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(has [0:m] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIONF24536 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
 
/* Main key for Entity - SPLD_DirectionsForUseStatement */
CREATE UNIQUE INDEX USPLDDIRECTIONSFORUSESTATEME24487 
      ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESECTION(has [0:m] ) SPLD_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SPLDDIRECTIONSFORUSESTATEMEN24532 
      ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESTATEMENT(has [0:m] ) SPLD_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SPLDDIRECTIONSFORUSESTATEMEN24535 
      ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Main key for Entity - SPLD_GeneralSection */
CREATE UNIQUE INDEX USPLD_GENERALSECTION_ID_2448840 
      ON SPLD_GENERALSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_GENERALSECTION' */
CREATE INDEX SPLDGENERALSECTIONFKIDSPLDSE24530 
      ON SPLD_GENERALSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_GENERALSECTION' */
CREATE INDEX SPLDGENERALSECTIONFKIDSUBREG24531 
      ON SPLD_GENERALSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'S_GENERALSECTION(has [0:m] ) SPLD_GENERALSECTION' */
CREATE INDEX SPLDGENERALSECTIONFKIDSGENER24534 
      ON SPLD_GENERALSECTION ( 
           FK_ID_S_GENERALSECTION ) ;
 
 
/* Main key for Entity - SPLD_GeneralStatement */
CREATE UNIQUE INDEX USPLD_GENERALSTATEMENT_ID_2448980 
      ON SPLD_GENERALSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_GENERALSECTION(has [0:m] ) SPLD_GENERALSTATEMENT' */
CREATE INDEX SPLDGENERALSTATEMENTFKIDSPLD24532 
      ON SPLD_GENERALSTATEMENT ( 
           FK_ID_SPLD_GENERALSECTION ) ;
 
 
/* Index for Relationship - 'S_GENERALSTATEMENT(has [0:m] ) SPLD_GENERALSTATEMENT' */
CREATE INDEX SPLDGENERALSTATEMENTFKIDSGEN24533 
      ON SPLD_GENERALSTATEMENT ( 
           FK_ID_S_GENERALSTATEMENT ) ;
 
 
/* Main key for Entity - SPLD_HumanHazardSection */
CREATE UNIQUE INDEX USPLD_HUMANHAZARDSECTION_ID_24490 
      ON SPLD_HUMANHAZARDSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_HUMANHAZARDSECTION' */
CREATE INDEX SPLDHUMANHAZARDSECTIONFKIDSU24531 
      ON SPLD_HUMANHAZARDSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'S_HUMANHAZARDSECTION(has [0:m] ) SPLD_HUMANHAZARDSECTION' */
CREATE INDEX SPLDHUMANHAZARDSECTIONFKIDSH24536 
      ON SPLD_HUMANHAZARDSECTION ( 
           FK_ID_S_HUMANHAZARDSECTION ) ;
 
 
/* Main key for Entity - SPLD_IngredientsSection */
CREATE UNIQUE INDEX USPLD_INGREDIENTSSECTION_ID_24493 
      ON SPLD_INGREDIENTSSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_INGREDIENTSSECTION' */
CREATE INDEX SPLDINGREDIENTSSECTIONFKIDSP24530 
      ON SPLD_INGREDIENTSSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_INGREDIENTSSECTION' */
CREATE INDEX SPLDINGREDIENTSSECTIONFKIDSU24531 
      ON SPLD_INGREDIENTSSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'S_INGREDIENTSSECTION(has [0:m] ) SPLD_INGREDIENTSSECTION' */
CREATE INDEX SPLDINGREDIENTSSECTIONFKIDSI24539 
      ON SPLD_INGREDIENTSSECTION ( 
           FK_ID_S_INGREDIENTSSECTION ) ;
 
 
/* Main key for Entity - SPLD_IngredientsStatement */
CREATE UNIQUE INDEX USPLD_INGREDIENTSSTATEMENTID24494 
      ON SPLD_INGREDIENTSSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_INGREDIENTSSECTION(has [0:m] ) SPLD_INGREDIENTSSTATEMENT' */
CREATE INDEX SPLDINGREDIENTSSTATEMENTFKID24532 
      ON SPLD_INGREDIENTSSTATEMENT ( 
           FK_ID_SPLD_INGREDIENTSSECTION ) ;
 
 
/* Index for Relationship - 'S_INGREDIENTSSTATEMENT(has [0:m] ) SPLD_INGREDIENTSSTATEMENT' */
CREATE INDEX SPLDINGREDIENTSSTATEMENTFKID24539 
      ON SPLD_INGREDIENTSSTATEMENT ( 
           FK_ID_S_INGREDIENTSSTATEMENT ) ;
 
 
/* Main key for Entity - SPLD_LLD */
CREATE UNIQUE INDEX USPLD_LLD_ID_2449550 
      ON SPLD_LLD ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_LLD' */
CREATE INDEX SPLDLLDFKIDSUBREGPHYSICALLAB24532 
      ON SPLD_LLD ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Main key for Entity - SPLD_MarketingSection */
CREATE UNIQUE INDEX USPLD_MARKETINGSECTION_ID_2449750 
      ON SPLD_MARKETINGSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSECTION(has [0:m] ) SPLD_MARKETINGSECTION' */
CREATE INDEX SPLDMARKETINGSECTIONFKIDSMAR24529 
      ON SPLD_MARKETINGSECTION ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_MARKETINGSECTION' */
CREATE INDEX SPLDMARKETINGSECTIONFKIDSPLD24530 
      ON SPLD_MARKETINGSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_MARKETINGSECTION' */
CREATE INDEX SPLDMARKETINGSECTIONFKIDSUBR24531 
      ON SPLD_MARKETINGSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Main key for Entity - SPLD_MarketingStatement */
CREATE UNIQUE INDEX USPLD_MARKETINGSTATEMENT_ID_24498 
      ON SPLD_MARKETINGSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has [0:m] ) SPLD_MARKETINGSTATEMENT' */
CREATE INDEX SPLDMARKETINGSTATEMENTFKIDSM24529 
      ON SPLD_MARKETINGSTATEMENT ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'SPLD_MARKETINGSECTION(has [0:m] ) SPLD_MARKETINGSTATEMENT' */
CREATE INDEX SPLDMARKETINGSTATEMENTFKIDSP24530 
      ON SPLD_MARKETINGSTATEMENT ( 
           FK_ID_SPLD_MARKETINGSECTION ) ;
 
 
/* Main key for Entity - SPLD_Section */
CREATE UNIQUE INDEX USPLD_SECTION_ID_2449950 
      ON SPLD_SECTION ( 
           ID ) ;
 
 
/* Main key for Entity - SPLD_StorageDisposalSection */
CREATE UNIQUE INDEX USPLDSTORAGEDISPOSALSECTIONI24501 
      ON SPLD_STORAGEDISPOSALSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_STORAGEDISPOSALSECTION' */
CREATE INDEX SPLDSTORAGEDISPOSALSECTIONFK24530 
      ON SPLD_STORAGEDISPOSALSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_STORAGEDISPOSALSECTION' */
CREATE INDEX SPLDSTORAGEDISPOSALSECTIONFK24531 
      ON SPLD_STORAGEDISPOSALSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'S_STORAGEDISPOSALSECTION(has [0:m] ) SPLD_STORAGEDISPOSALSECTION' */
CREATE INDEX SPLDSTORAGEDISPOSALSECTIONFK24535 
      ON SPLD_STORAGEDISPOSALSECTION ( 
           FK_ID_S_STORAGEDISPOSALSECTION ) ;
 
 
/* Main key for Entity - SPLD_StorageDisposalStatement */
CREATE UNIQUE INDEX USPLDSTORAGEDISPOSALSTATEMEN24502 
      ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_STORAGEDISPOSALSECTION(has [0:m] ) SPLD_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SPLDSTORAGEDISPOSALSTATEMENT24532 
      ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_SPLD_STORAGEDISPOSALSECTIO ) ;
 
 
/* Index for Relationship - 'S_STORAGEDISPOSALSTATEMENT(has [0:m] ) SPLD_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SPLDSTORAGEDISPOSALSTATEMENT24534 
      ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_S_STORAGEDISPOSALSTATEMENT ) ;
 
 
/* Main key for Entity - SPLD_Usage */
CREATE UNIQUE INDEX USPLD_USAGE_ID_2450420 
      ON SPLD_USAGE ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLD_USAGE_FK_ID_SPLD_USAGE_24522 
      ON SPLD_USAGE ( 
           FK_ID_SPLD_USAGE ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has (delete) [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLDUSAGEFKIDSUBREGPHYSICALL24531 
      ON SPLD_USAGE ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'S_USAGE(has [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLD_USAGE_FK_ID_S_USAGE_2453210 
      ON SPLD_USAGE ( 
           FK_ID_S_USAGE ) ;
 
 
/* Index for Relationship - 'SPLD_USAGETYPE(has [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLD_USAGE_FKIDSPLDUSAGETYPE24538 
      ON SPLD_USAGE ( 
           FK_ID_SPLD_USAGETYPE ) ;
 
 
/* Main key for Entity - SPLD_UsageOrdering */
CREATE UNIQUE INDEX USPLD_USAGEORDERING_ID_2450500 
      ON SPLD_USAGEORDERING ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDUSA24528 
      ON SPLD_USAGEORDERING ( 
           FK_ID_SPLD_USAGE ) ;
 
 
/* Index for Relationship - 'SPLD_MARKETINGSTATEMENT(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDMAR24530 
      ON SPLD_USAGEORDERING ( 
           FK_ID_SPLD_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESTATEMENT(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDDIR24535 
      ON SPLD_USAGEORDERING ( 
           FK_ID_SPLDDIRECTIONSFORUSESTATEM ) ;
 
 
/* Main key for Entity - SPLD_UsageType */
CREATE UNIQUE INDEX USPLD_USAGETYPE_ID_2450530 
      ON SPLD_USAGETYPE ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_USAGETYPE' */
CREATE INDEX SPLDUSAGETYPEFKIDSUBREGPHYSI24538 
      ON SPLD_USAGETYPE ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Main key for Entity - Subregistrant */
CREATE UNIQUE INDEX USUBREGISTRANT_ID_2450570 
      ON SUBREGISTRANT ( 
           ID ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has [0:1] ) SUBREGISTRANT' */
CREATE INDEX SUBREGISTRANTFKIDORGANIZATIO24529 
      ON SUBREGISTRANT ( 
           FK_ID_ORGANIZATION ) ;
 
 
/* Main key for Entity - SubregLabelContent */
CREATE UNIQUE INDEX USUBREGLABELCONTENT_ID_2450610 
      ON SUBREGLABELCONTENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has next version [0:m] ) SUBREGLABELCONTENT' */
CREATE INDEX SUBREGLABELCONTENTFKIDSUBREG24532 
      ON SUBREGLABELCONTENT ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Index for Relationship - 'SUBREGPRODUCT(has [0:m] ) SUBREGLABELCONTENT' */
CREATE INDEX SUBREGLABELCONTENTFKIDSUBREG24541 
      ON SUBREGLABELCONTENT ( 
           FK_ID_SUBREGPRODUCT ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) SUBREGLABELCONTENT' */
CREATE INDEX SUBREGLABELCONTENTFKIDMASTER24541 
      ON SUBREGLABELCONTENT ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - SubregPhysicalLabelDef */
CREATE UNIQUE INDEX USUBREGPHYSICALLABELDEF_ID_245075 
      ON SUBREGPHYSICALLABELDEF ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) SUBREGPHYSICALLABELDEF' */
CREATE INDEX SUBREGPHYSICALLABELDEFFKIDSU24531 
      ON SUBREGPHYSICALLABELDEF ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - SubregProduct */
CREATE UNIQUE INDEX USUBREGPRODUCT_ID_2450820 
      ON SUBREGPRODUCT ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERPRODUCT(has [0:m] ) SUBREGPRODUCT' */
CREATE INDEX SUBREGPRODUCTFKIDMASTERPRODU24540 
      ON SUBREGPRODUCT ( 
           FK_ID_MASTERPRODUCT ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) SUBREGPRODUCT' */
CREATE INDEX SUBREGPRODUCTFKIDSUBREGISTRA24541 
      ON SUBREGPRODUCT ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
 
 
/* Main key for Entity - M_TOC */
CREATE UNIQUE INDEX UM_TOC_ID_2450990 
      ON M_TOC ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_TOC' */
CREATE INDEX M_TOC_FKIDMASTERLABELCONTENT24521 
      ON M_TOC ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - User */
CREATE UNIQUE INDEX Uz_USER_ID_2451050 
      ON z_USER ( 
           ID ) ;
/* Main key for Entity - User */
CREATE INDEX z_USER_USERNAME_2451060 
      ON z_USER ( 
           USERNAME ) ;
 
 
/* Index for Relationship - 'PERSON(for [0:1] ) z_USER' */
CREATE INDEX z_USER_FK_ID_PERSON_2454070 
      ON z_USER ( 
           FK_ID_PERSON ) ;
 
 
/* Main key for Entity - ZeidonGenkeyTable */
CREATE UNIQUE INDEX UZEIDONGENKEYTABLE_TABLENAME24512 
      ON ZEIDONGENKEYTABLE ( 
           TABLENAME ) ;
 
 
/* Main key for Entity - ZeidonLocking */
CREATE UNIQUE INDEX UZEIDONLOCKING_LOCKINGKEY_2451250 
      ON ZEIDONLOCKING ( 
           LOD_NAME, 
           KEYVALUE ) ;
 
 
CREATE UNIQUE INDEX UMMSUSAGEDRVSSDIRECTIONSFORU24524 
      ON MMSUSAGEDRVSSDIRECTIONSFORUSESECT ( 
           FK_ID_S_DIRECTIONSFORUSESECTION, 
           FK_ID_S_USAGE ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(is driven by [0:m] ) MMSUSAGEDRVSSDIRECTIONSFORUSESECT' */
CREATE INDEX MMSUSAGEDRVSSDIRECTIONSFORUS24524 
      ON MMSUSAGEDRVSSDIRECTIONSFORUSESECT ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'S_USAGE(drives [0:m] ) MMSUSAGEDRVSSDIRECTIONSFORUSESECT' */
CREATE INDEX MMSUSAGEDRVSSDIRECTIONSFORUS24525 
      ON MMSUSAGEDRVSSDIRECTIONSFORUSESECT ( 
           FK_ID_S_USAGE ) ;
 
 
CREATE UNIQUE INDEX UMMMUSAGEDRVSMDIRECTIONSFORU24526 
      ON MMMUSAGEDRVSMDIRECTIONSFORUSESECT ( 
           FK_ID_M_DIRECTIONSFORUSESECTION, 
           FK_ID_M_USAGE ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(is driven by [0:m] ) MMMUSAGEDRVSMDIRECTIONSFORUSESECT' */
CREATE INDEX MMMUSAGEDRVSMDIRECTIONSFORUS24526 
      ON MMMUSAGEDRVSMDIRECTIONSFORUSESECT ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'M_USAGE(drives [0:m] ) MMMUSAGEDRVSMDIRECTIONSFORUSESECT' */
CREATE INDEX MMMUSAGEDRVSMDIRECTIONSFORUS24527 
      ON MMMUSAGEDRVSMDIRECTIONSFORUSESECT ( 
           FK_ID_M_USAGE ) ;
 
 
CREATE UNIQUE INDEX UMMMASTERPRODUCTFORSUBREGIST24528 
      ON MM_MASTERPRODUCT_FOR_SUBREGISTRAN ( 
           FK_ID_SUBREGISTRANT, 
           FK_ID_MASTERPRODUCT ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) MM_MASTERPRODUCT_FOR_SUBREGISTRAN' */
CREATE INDEX MMMASTERPRODUCTFORSUBREGISTR24528 
      ON MM_MASTERPRODUCT_FOR_SUBREGISTRAN ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
/* Index for Relationship - 'MASTERPRODUCT(for [0:m] ) MM_MASTERPRODUCT_FOR_SUBREGISTRAN' */
CREATE INDEX MMMASTERPRODUCTFORSUBREGISTR24529 
      ON MM_MASTERPRODUCT_FOR_SUBREGISTRAN ( 
           FK_ID_MASTERPRODUCT ) ;
 
 
CREATE UNIQUE INDEX UMMSPLDDIRECTIONSFORUSESECTI24532 
      ON MMSPLDDIRECTIONSFORUSESECTIONFRSP ( 
           FK_ID_SPLD_USAGE, 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) MMSPLDDIRECTIONSFORUSESECTIONFRSP' */
CREATE INDEX MMSPLDDIRECTIONSFORUSESECTIO24532 
      ON MMSPLDDIRECTIONSFORUSESECTIONFRSP ( 
           FK_ID_SPLD_USAGE ) ;
 
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESECTION(for [0:m] ) MMSPLDDIRECTIONSFORUSESECTIONFRSP' */
CREATE INDEX MMSPLDDIRECTIONSFORUSESECTIO24533 
      ON MMSPLDDIRECTIONSFORUSESECTIONFRSP ( 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
 
CREATE UNIQUE INDEX UMMSPLDMARKETINGSECTIONFRSPL24533 
      ON MM_SPLD_MARKETINGSECTIONFRSPLDUSA ( 
           FK_ID_SPLD_USAGE, 
           FK_ID_SPLD_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) MM_SPLD_MARKETINGSECTIONFRSPLDUSA' */
CREATE INDEX MMSPLDMARKETINGSECTIONFRSPLD24533 
      ON MM_SPLD_MARKETINGSECTIONFRSPLDUSA ( 
           FK_ID_SPLD_USAGE ) ;
 
 
/* Index for Relationship - 'SPLD_MARKETINGSECTION(for [0:m] ) MM_SPLD_MARKETINGSECTIONFRSPLDUSA' */
CREATE INDEX MMSPLDMARKETINGSECTIONFRSPLD24533 
      ON MM_SPLD_MARKETINGSECTIONFRSPLDUSA ( 
           FK_ID_SPLD_MARKETINGSECTION ) ;
 
 
GRANT ALL ON ADDRESS TO PUBLIC 
GRANT ALL ON COLOR TO PUBLIC 
GRANT ALL ON z_DOMAIN TO PUBLIC 
GRANT ALL ON DOMAINVALUE TO PUBLIC 
GRANT ALL ON EPA_APPLICATIONTYPE TO PUBLIC 
GRANT ALL ON EPA_CHEMICALFAMILY TO PUBLIC 
GRANT ALL ON EPA_CLAIM TO PUBLIC 
GRANT ALL ON EPA_LOCATION TO PUBLIC 
GRANT ALL ON EPA_STORAGEDISPOSAL TO PUBLIC 
GRANT ALL ON EPA_SURFACE TO PUBLIC 
GRANT ALL ON EPAMMS TO PUBLIC 
GRANT ALL ON FEEDBACK TO PUBLIC 
GRANT ALL ON FOOTNOTESYMBOL TO PUBLIC 
GRANT ALL ON GRAPHICLABELCONTROL TO PUBLIC 
GRANT ALL ON GRAPHICLABELDEFINITION TO PUBLIC 
GRANT ALL ON HELP TO PUBLIC 
GRANT ALL ON KEYWORD TO PUBLIC 
GRANT ALL ON LLD TO PUBLIC 
GRANT ALL ON LLD_BLOCK TO PUBLIC 
GRANT ALL ON LLD_PAGE TO PUBLIC 
GRANT ALL ON LLD_PANEL TO PUBLIC 
GRANT ALL ON LLD_SPECIALSECTIONATTRIBUTE TO PUBLIC 
GRANT ALL ON M_DILUTIONCHARTENTRY TO PUBLIC 
GRANT ALL ON M_DILUTIONGROUP TO PUBLIC 
GRANT ALL ON M_DILUTIONGROUPITEM TO PUBLIC 
GRANT ALL ON M_DIRECTIONSFORUSECATEGORY TO PUBLIC 
GRANT ALL ON M_DIRECTIONSFORUSESECTION TO PUBLIC 
GRANT ALL ON M_DIRECTIONSFORUSESTATEMENT TO PUBLIC 
GRANT ALL ON M_GENERALSECTION TO PUBLIC 
GRANT ALL ON M_GENERALSTATEMENT TO PUBLIC 
GRANT ALL ON M_GENERALSUBSECTION TO PUBLIC 
GRANT ALL ON M_HUMANHAZARDSECTION TO PUBLIC 
GRANT ALL ON M_INGREDIENTSSECTION TO PUBLIC 
GRANT ALL ON M_INGREDIENTSSTATEMENT TO PUBLIC 
GRANT ALL ON M_INSERTTEXT TO PUBLIC 
GRANT ALL ON M_INSERTTEXTKEYWORD TO PUBLIC 
GRANT ALL ON M_MARKETINGSECTION TO PUBLIC 
GRANT ALL ON M_MARKETINGSTATEMENT TO PUBLIC 
GRANT ALL ON M_METATABLE TO PUBLIC 
GRANT ALL ON M_REVIEWERNOTE TO PUBLIC 
GRANT ALL ON M_ROWS TO PUBLIC 
GRANT ALL ON M_STORAGEDISPOSALSECTION TO PUBLIC 
GRANT ALL ON M_STORAGEDISPOSALSTATEMENT TO PUBLIC 
GRANT ALL ON M_USAGE TO PUBLIC 
GRANT ALL ON M_USAGEFOOTNOTE TO PUBLIC 
GRANT ALL ON M_USAGEGROUP TO PUBLIC 
GRANT ALL ON M_USAGEORDERING TO PUBLIC 
GRANT ALL ON M_USAGETYPE TO PUBLIC 
GRANT ALL ON MASTERLABELCONTENT TO PUBLIC 
GRANT ALL ON MASTERPRODUCT TO PUBLIC 
GRANT ALL ON NETCONTENTS TO PUBLIC 
GRANT ALL ON ORGANIZATION TO PUBLIC 
GRANT ALL ON PERSON TO PUBLIC 
GRANT ALL ON PRIMARYREGISTRANT TO PUBLIC 
GRANT ALL ON PRIMARYSUB TO PUBLIC 
GRANT ALL ON RESUMEOBJECT TO PUBLIC 
GRANT ALL ON RESUMEPATH TO PUBLIC 
GRANT ALL ON REUSABLEBLOCKDEFINITION TO PUBLIC 
GRANT ALL ON S_DILUTIONGROUP TO PUBLIC 
GRANT ALL ON S_DILUTIONGROUPITEM TO PUBLIC 
GRANT ALL ON S_DIRECTIONSFORUSESECTION TO PUBLIC 
GRANT ALL ON S_DIRECTIONSFORUSESTATEMENT TO PUBLIC 
GRANT ALL ON S_GENERALSECTION TO PUBLIC 
GRANT ALL ON S_GENERALSTATEMENT TO PUBLIC 
GRANT ALL ON S_HUMANHAZARDSECTION TO PUBLIC 
GRANT ALL ON S_INGREDIENTSSECTION TO PUBLIC 
GRANT ALL ON S_INGREDIENTSSTATEMENT TO PUBLIC 
GRANT ALL ON S_INSERTTEXT TO PUBLIC 
GRANT ALL ON S_INSERTTEXTKEYWORD TO PUBLIC 
GRANT ALL ON S_MARKETINGSECTION TO PUBLIC 
GRANT ALL ON S_MARKETINGSTATEMENT TO PUBLIC 
GRANT ALL ON S_STORAGEDISPOSALSECTION TO PUBLIC 
GRANT ALL ON S_STORAGEDISPOSALSTATEMENT TO PUBLIC 
GRANT ALL ON S_USAGE TO PUBLIC 
GRANT ALL ON S_USAGEFOOTNOTE TO PUBLIC 
GRANT ALL ON S_USAGEORDERING TO PUBLIC 
GRANT ALL ON S_USAGETYPE TO PUBLIC 
GRANT ALL ON S_VERSIONCHANGEMESSAGE TO PUBLIC 
GRANT ALL ON SPLD_DIRECTIONSFORUSESECTION TO PUBLIC 
GRANT ALL ON SPLD_DIRECTIONSFORUSESTATEMENT TO PUBLIC 
GRANT ALL ON SPLD_GENERALSECTION TO PUBLIC 
GRANT ALL ON SPLD_GENERALSTATEMENT TO PUBLIC 
GRANT ALL ON SPLD_HUMANHAZARDSECTION TO PUBLIC 
GRANT ALL ON SPLD_INGREDIENTSSECTION TO PUBLIC 
GRANT ALL ON SPLD_INGREDIENTSSTATEMENT TO PUBLIC 
GRANT ALL ON SPLD_LLD TO PUBLIC 
GRANT ALL ON SPLD_MARKETINGSECTION TO PUBLIC 
GRANT ALL ON SPLD_MARKETINGSTATEMENT TO PUBLIC 
GRANT ALL ON SPLD_SECTION TO PUBLIC 
GRANT ALL ON SPLD_STORAGEDISPOSALSECTION TO PUBLIC 
GRANT ALL ON SPLD_STORAGEDISPOSALSTATEMENT TO PUBLIC 
GRANT ALL ON SPLD_USAGE TO PUBLIC 
GRANT ALL ON SPLD_USAGEORDERING TO PUBLIC 
GRANT ALL ON SPLD_USAGETYPE TO PUBLIC 
GRANT ALL ON SUBREGISTRANT TO PUBLIC 
GRANT ALL ON SUBREGLABELCONTENT TO PUBLIC 
GRANT ALL ON SUBREGPHYSICALLABELDEF TO PUBLIC 
GRANT ALL ON SUBREGPRODUCT TO PUBLIC 
GRANT ALL ON z_TEMP TO PUBLIC 
GRANT ALL ON M_TOC TO PUBLIC 
GRANT ALL ON z_USER TO PUBLIC 
GRANT ALL ON ZEIDONGENKEYTABLE TO PUBLIC 
GRANT ALL ON ZEIDONLOCKING TO PUBLIC 
GRANT ALL ON MMSUSAGEDRVSSDIRECTIONSFORUSESECT TO PUBLIC 
GRANT ALL ON MMMUSAGEDRVSMDIRECTIONSFORUSESECT TO PUBLIC 
GRANT ALL ON MM_MASTERPRODUCT_FOR_SUBREGISTRAN TO PUBLIC 
GRANT ALL ON MMSPLDDIRECTIONSFORUSESECTIONFRSP TO PUBLIC 
GRANT ALL ON MM_SPLD_MARKETINGSECTIONFRSPLDUSA TO PUBLIC 
COMMIT;
