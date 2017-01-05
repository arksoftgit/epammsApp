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
DROP TABLE FONT IF EXISTS ;
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
DROP TABLE M_TOC IF EXISTS ;
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
DROP TABLE S_DILUTIONCHARTENTRY IF EXISTS ;
DROP TABLE S_DILUTIONGROUP IF EXISTS ;
DROP TABLE S_DILUTIONGROUPITEM IF EXISTS ;
DROP TABLE S_DIRECTIONSFORUSECATEGORY IF EXISTS ;
DROP TABLE S_DIRECTIONSFORUSESECTION IF EXISTS ;
DROP TABLE S_DIRECTIONSFORUSESTATEMENT IF EXISTS ;
DROP TABLE S_GENERALSECTION IF EXISTS ;
DROP TABLE S_GENERALSTATEMENT IF EXISTS ;
DROP TABLE S_GENERALSUBSECTION IF EXISTS ;
DROP TABLE S_HUMANHAZARDSECTION IF EXISTS ;
DROP TABLE S_INGREDIENTSSECTION IF EXISTS ;
DROP TABLE S_INGREDIENTSSTATEMENT IF EXISTS ;
DROP TABLE S_INSERTTEXT IF EXISTS ;
DROP TABLE S_INSERTTEXTKEYWORD IF EXISTS ;
DROP TABLE S_MARKETINGSECTION IF EXISTS ;
DROP TABLE S_MARKETINGSTATEMENT IF EXISTS ;
DROP TABLE S_METATABLE IF EXISTS ;
DROP TABLE S_ROWS IF EXISTS ;
DROP TABLE S_STORAGEDISPOSALSECTION IF EXISTS ;
DROP TABLE S_STORAGEDISPOSALSTATEMENT IF EXISTS ;
DROP TABLE S_USAGE IF EXISTS ;
DROP TABLE S_USAGEFOOTNOTE IF EXISTS ;
DROP TABLE S_USAGEORDERING IF EXISTS ;
DROP TABLE S_USAGETYPE IF EXISTS ;
DROP TABLE S_VERSIONCHANGEMESSAGE IF EXISTS ;
DROP TABLE SPLD_DILUTIONCHARTENTRY IF EXISTS ;
DROP TABLE SPLD_DILUTIONGROUP IF EXISTS ;
DROP TABLE SPLD_DILUTIONGROUPITEM IF EXISTS ;
DROP TABLE SPLD_DIRECTIONSFORUSECATEGORY IF EXISTS ;
DROP TABLE SPLD_DIRECTIONSFORUSESECTION IF EXISTS ;
DROP TABLE SPLD_DIRECTIONSFORUSESTATEMENT IF EXISTS ;
DROP TABLE SPLD_GENERALSECTION IF EXISTS ;
DROP TABLE SPLD_GENERALSTATEMENT IF EXISTS ;
DROP TABLE SPLD_GENERALSUBSECTION IF EXISTS ;
DROP TABLE SPLD_HUMANHAZARDSECTION IF EXISTS ;
DROP TABLE SPLD_INGREDIENTSSECTION IF EXISTS ;
DROP TABLE SPLD_INGREDIENTSSTATEMENT IF EXISTS ;
DROP TABLE SPLD_INSERTTEXT IF EXISTS ;
DROP TABLE SPLD_INSERTTEXTKEYWORD IF EXISTS ;
DROP TABLE SPLD_LLD IF EXISTS ;
DROP TABLE SPLD_MARKETINGSECTION IF EXISTS ;
DROP TABLE SPLD_MARKETINGSTATEMENT IF EXISTS ;
DROP TABLE SPLD_METATABLE IF EXISTS ;
DROP TABLE SPLD_ROWS IF EXISTS ;
DROP TABLE SPLD_SECTION IF EXISTS ;
DROP TABLE SPLD_STORAGEDISPOSALSECTION IF EXISTS ;
DROP TABLE SPLD_STORAGEDISPOSALSTATEMENT IF EXISTS ;
DROP TABLE SPLD_USAGE IF EXISTS ;
DROP TABLE SPLD_USAGEFOOTNOTE IF EXISTS ;
DROP TABLE SPLD_USAGEORDERING IF EXISTS ;
DROP TABLE SPLD_USAGETYPE IF EXISTS ;
DROP TABLE SUBREGISTRANT IF EXISTS ;
DROP TABLE SUBREGLABELCONTENT IF EXISTS ;
DROP TABLE SUBREGPHYSICALLABELDEF IF EXISTS ;
DROP TABLE SUBREGPRODUCT IF EXISTS ;
DROP TABLE z_TEMP IF EXISTS ;
DROP TABLE z_USER IF EXISTS ;
DROP TABLE ZEIDONGENKEYTABLE IF EXISTS ;
DROP TABLE ZEIDONLOCKING IF EXISTS ;
DROP TABLE MMSUSAGEDRVSSDIRECTIONSFORUSESECT IF EXISTS ;
DROP TABLE MMMUSAGEDRVSMDIRECTIONSFORUSESECT IF EXISTS ;
DROP TABLE MM_MASTERPRODUCT_FOR_SUBREGISTRAN IF EXISTS ;
DROP TABLE MMSPLDDIRECTIONSFORUSESECTIONSDRV IF EXISTS ;
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
 
/* Entity - Font */
CREATE TABLE FONT ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 32 )      NOT NULL, 
           FK_ID_SUBREGISTRANT                int                NOT NULL ) ;
 
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
           DEFAULTTEXTFONTFAMILY              varchar( 32 )      NULL    , 
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
           FONTFAMILY                         varchar( 32 )      NULL    , 
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
           FK_ID_REUSABLEBLOCKDEFINITION      int                NULL    , 
           FK_ID_LLD_SPECIALSECTIONATTRIBUT   int                NULL    , 
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
           BORDERWIDTH                        int                NULL    , 
           FONTFAMILY                         varchar( 32 )      NULL    , 
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
           BLOCKTITLE                         varchar( 254 )     NULL    , 
           BG_ID_COLOR                        int                NULL    , 
           BD_ID_COLOR                        int                NULL    , 
           FK_ID_LLD_PAGE                     int                NOT NULL ) ;
 
/* Entity - LLD_SpecialSectionAttribute */
CREATE TABLE LLD_SPECIALSECTIONATTRIBUTE ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 128 )     NULL    , 
           PF1ID_LLD_BLOCK                    int                NOT NULL ) ;
 
/* Entity - M_DilutionChartEntry */
CREATE TABLE M_DILUTIONCHARTENTRY ( 
           ID                                 int                NOT NULL, 
           z_USE                              varchar( 128 )     NULL    , 
           PRODUCTAMOUNTTEXT                  varchar( 254 )     NULL    , 
           WATERAMOUNTTEXT                    varchar( 254 )     NULL    , 
           CONTACTTIME                        varchar( 16 )      NULL    , 
           AUTOSEQ                            int                NULL    , 
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
           USAGETYPE                          varchar( 1 )       NULL    , 
           NAME                               varchar( 128 )     NULL    , 
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
           NOTETOPHYSICIAN                    varchar( 254 )     NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
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
 
/* Entity - M_GeneralSubSection */
CREATE TABLE M_GENERALSUBSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           CONTAINERVOLUMEENVIRONMENTHAZARD   varchar( 20 )      NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           FK_ID_M_GENERALSUBSECTION          int                NULL    , 
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
           CONTAINERVOLUME                    varchar( 3 )       NULL    , 
           CONTAINERTYPE                      varchar( 30 )      NULL    , 
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
 
/* Entity - M_TOC */
CREATE TABLE M_TOC ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             varchar( 254 )     NULL    , 
           PAGE                               int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - M_Usage */
CREATE TABLE M_USAGE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NULL    , 
           CLAIMSCLASSIFICATION               varchar( 16 )      NULL    , 
           NAME                               varchar( 254 )     NOT NULL, 
           REVIEWERNOTE                       longtext           NULL    , 
           GROUPSEQUENCENUMBER                int                NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
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
           FK_ID_M_MARKETINGSECTION           int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_M_USAGE                      int                NULL    , 
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
           VERSION                            varchar( 254 )     NOT NULL, 
           REVISIONDATE                       datetime           NOT NULL, 
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
           PRIMARYSITEID                      int                NULL    , 
           FINALIZED                          varchar( 1 )       NULL    , 
           CREATEDDATETIME                    datetime           NULL    , 
           MODIFIEDDATETIME                   datetime           NULL    , 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           AUTOSEQ03                          int                NULL    , 
           SUBID_MASTERLABELCONTENT           int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NULL    , 
           FK_ID_MASTERPRODUCT                int                NULL     ) ;
 
/* Entity - MasterProduct */
CREATE TABLE MASTERPRODUCT ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NOT NULL, 
           z_NUMBER                           varchar( 5 )       NULL    , 
           DESCRIPTION                        longtext           NULL    , 
           CHEMICALFAMILY                     varchar( 2 )       NULL    , 
           EPA_REGISTRATIONNUMBER             varchar( 128 )     NULL    , 
           EPA_ESTABLISHMENTNUMBER            varchar( 128 )     NULL    , 
           EPA_DRAFTLABEL                     datetime           NULL    , 
           ESL_DATE                           datetime           NULL    , 
           EPA_TOXICITYCATEGORY               int                NULL    , 
           PRIMARYSITEID                      int                NULL    , 
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
           FK_ID_SUBREGISTRANT                int                NOT NULL ) ;
 
/* Entity - S_DilutionChartEntry */
CREATE TABLE S_DILUTIONCHARTENTRY ( 
           ID                                 int                NOT NULL, 
           z_USE                              varchar( 128 )     NULL    , 
           PRODUCTAMOUNTTEXT                  varchar( 254 )     NULL    , 
           WATERAMOUNTTEXT                    varchar( 254 )     NULL    , 
           CONTACTTIME                        varchar( 16 )      NULL    , 
           FK_ID_S_DILUTIONGROUP              int                NOT NULL ) ;
 
/* Entity - S_DilutionGroup */
CREATE TABLE S_DILUTIONGROUP ( 
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
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL, 
           FK_ID_M_DILUTIONGROUP              int                NULL     ) ;
 
/* Entity - S_DilutionGroupItem */
CREATE TABLE S_DILUTIONGROUPITEM ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             longtext           NULL    , 
           PPM                                int                NULL    , 
           FK_ID_S_DILUTIONGROUP              int                NOT NULL ) ;
 
/* Entity - S_DirectionsForUseCategory */
CREATE TABLE S_DIRECTIONSFORUSECATEGORY ( 
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
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - S_DirectionsForUseSection */
CREATE TABLE S_DIRECTIONSFORUSESECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           GENERALUSE                         varchar( 1 )       NULL    , 
           STATEMENTLISTTYPE                  varchar( 254 )     NULL    , 
           NUMBEREACHSTATEMENT                varchar( 1 )       NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           XORID_S_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSECATEGORY   int                NOT NULL ) ;
 
/* Entity - S_DirectionsForUseStatement */
CREATE TABLE S_DIRECTIONSFORUSESTATEMENT ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NULL    , 
           NAME                               varchar( 128 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           NOTFORUSETEXT                      longtext           NULL    , 
           NOTFORUSETYPE                      varchar( 2 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           EXCLUSIVETOPREVIOUSSTATEMENT       varchar( 1 )       NULL    , 
           EXCLUSIVETONEXTSTATEMENT           varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           SUBID_S_DIRECTIONSFORUSESTATEMEN   int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN   int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSESECTION    int                NULL     ) ;
 
/* Entity - S_GeneralSection */
CREATE TABLE S_GENERALSECTION ( 
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
           NOTETOPHYSICIAN                    varchar( 254 )     NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
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
           FK_ID_S_GENERALSUBSECTION          int                NULL    , 
           FK_ID_M_GENERALSTATEMENT           int                NULL    , 
           FK_ID_S_GENERALSECTION             int                NULL     ) ;
 
/* Entity - S_GeneralSubSection */
CREATE TABLE S_GENERALSUBSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           CONTAINERVOLUMEENVIRONMENTHAZARD   varchar( 20 )      NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_S_GENERALSECTION             int                NULL    , 
           FK_ID_M_GENERALSUBSECTION          int                NULL     ) ;
 
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
           TYPE                               varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_S_GENERALSTATEMENT           int                NULL    , 
           FK_ID_S_STORAGEDISPOSALSTATEMENT   int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_S_USAGE                      int                NULL    , 
           FK_ID_S_MARKETINGSECTION           int                NULL    , 
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
 
/* Entity - S_MetaTable */
CREATE TABLE S_METATABLE ( 
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
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - S_Rows */
CREATE TABLE S_ROWS ( 
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
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_S_METATABLE                  int                NOT NULL ) ;
 
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
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
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
           CONTAINERVOLUME                    varchar( 3 )       NULL    , 
           CONTAINERTYPE                      varchar( 30 )      NULL    , 
           NOTFORUSETEXT                      longtext           NULL    , 
           NOTFORUSETYPE                      varchar( 2 )       NOT NULL, 
           NUMBEREACHSTATEMENT                varchar( 1 )       NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           EXCLUSIVETOPREVIOUSSTATEMENT       varchar( 1 )       NULL    , 
           EXCLUSIVETONEXTSTATEMENT           varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           SUBID_S_STORAGEDISPOSALSTATEMENT   int                NULL    , 
           FK_ID_M_STORAGEDISPOSALSTATEMENT   int                NULL    , 
           FK_ID_S_STORAGEDISPOSALSECTION     int                NULL     ) ;
 
/* Entity - S_Usage */
CREATE TABLE S_USAGE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NULL    , 
           CLAIMSCLASSIFICATION               varchar( 16 )      NULL    , 
           NAME                               varchar( 254 )     NOT NULL, 
           REVIEWERNOTE                       longtext           NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           GROUPSEQUENCENUMBER                int                NULL    , 
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
           FK_ID_S_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_S_MARKETINGSTATEMENT         int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN   int                NULL    , 
           FK_ID_S_USAGE                      int                NOT NULL, 
           FK_ID_S_MARKETINGSECTION           int                NULL     ) ;
 
/* Entity - S_UsageType */
CREATE TABLE S_USAGETYPE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_M_USAGETYPE                  int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - S_VersionChangeMessage */
CREATE TABLE S_VERSIONCHANGEMESSAGE ( 
           ID                                 int                NOT NULL, 
           CHANGENOTE                         longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Entity - SPLD_DilutionChartEntry */
CREATE TABLE SPLD_DILUTIONCHARTENTRY ( 
           ID                                 int                NOT NULL, 
           z_USE                              varchar( 128 )     NULL    , 
           PRODUCTAMOUNTTEXT                  varchar( 254 )     NULL    , 
           WATERAMOUNTTEXT                    varchar( 254 )     NULL    , 
           CONTACTTIME                        varchar( 16 )      NULL    , 
           FK_ID_SPLD_DILUTIONGROUP           int                NOT NULL ) ;
 
/* Entity - SPLD_DilutionGroup */
CREATE TABLE SPLD_DILUTIONGROUP ( 
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
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL, 
           FK_ID_S_DILUTIONGROUP              int                NULL     ) ;
 
/* Entity - SPLD_DilutionGroupItem */
CREATE TABLE SPLD_DILUTIONGROUPITEM ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             longtext           NULL    , 
           PPM                                int                NULL    , 
           FK_ID_SPLD_DILUTIONGROUP           int                NOT NULL ) ;
 
/* Entity - SPLD_DirectionsForUseCategory */
CREATE TABLE SPLD_DIRECTIONSFORUSECATEGORY ( 
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
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL, 
           FK_ID_S_DIRECTIONSFORUSECATEGORY   int                NULL     ) ;
 
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
           XORID_SPLD_DIRECTIONSFORUSESECTI   int                NULL    , 
           FK_ID_SPLD_DIRECTIONSFORUSECATEG   int                NOT NULL, 
           FK_ID_SPLD_SECTION                 int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSESECTION    int                NULL     ) ;
 
/* Entity - SPLD_DirectionsForUseStatement */
CREATE TABLE SPLD_DIRECTIONSFORUSESTATEMENT ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NULL    , 
           NAME                               varchar( 128 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           NOTFORUSETEXT                      longtext           NULL    , 
           NOTFORUSETYPE                      varchar( 2 )       NOT NULL, 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           EXCLUSIVETOPREVIOUSSTATEMENT       varchar( 1 )       NULL    , 
           EXCLUSIVETONEXTSTATEMENT           varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG              varchar( 1 )       NULL    , 
           CONTINUATIONTEXT                   longtext           NULL    , 
           CONTINUATIONLEADINGTEXT            longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           SUBID_SPLDDIRECTIONSFORUSESTATEM   int                NULL    , 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI   int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN   int                NULL     ) ;
 
/* Entity - SPLD_GeneralSection */
CREATE TABLE SPLD_GENERALSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           CONTAINERVOLUME                    varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           COMBINED                           varchar( 1 )       NULL    , 
           BOLDTITLE                          varchar( 1 )       NULL    , 
           BOLDTEXT                           varchar( 1 )       NULL    , 
           SECTIONTYPE                        varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           CONTACTNOTE                        varchar( 254 )     NULL    , 
           NOTETOPHYSICIAN                    varchar( 254 )     NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG              varchar( 254 )     NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL, 
           FK_ID_S_GENERALSECTION             int                NULL     ) ;
 
/* Entity - SPLD_GeneralStatement */
CREATE TABLE SPLD_GENERALSTATEMENT ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG              varchar( 254 )     NULL    , 
           CONTINUATIONTEXT                   longtext           NULL    , 
           CONTINUATIONLEADINGTEXT            longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SPLD_GENERALSUBSECTION       int                NULL    , 
           FK_ID_SPLD_GENERALSECTION          int                NULL    , 
           FK_ID_S_GENERALSTATEMENT           int                NULL     ) ;
 
/* Entity - SPLD_GeneralSubSection */
CREATE TABLE SPLD_GENERALSUBSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           CONTAINERVOLUMEENVIRONMENTHAZARD   varchar( 20 )      NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           FK_ID_SPLD_GENERALSECTION          int                NULL    , 
           FK_ID_S_GENERALSUBSECTION          int                NULL     ) ;
 
/* Entity - SPLD_HumanHazardSection */
CREATE TABLE SPLD_HUMANHAZARDSECTION ( 
           ID                                 int                NOT NULL, 
           EPA_SIGNALWORD                     varchar( 32 )      NULL    , 
           EPA_CHILDHAZARDWARNING             varchar( 1 )       NULL    , 
           PRECAUTIONARYSTATEMENT             longtext           NULL    , 
           LOCATIONSEPARATOR                  varchar( 2 )       NULL    , 
           ENCLOSEFIRSTLOCATION               varchar( 1 )       NULL    , 
           PANELLOC                           longtext           NULL    , 
           PANELLOC1                          varchar( 254 )     NULL    , 
           PANELLOC2                          varchar( 254 )     NULL    , 
           PANELLOC3                          varchar( 254 )     NULL    , 
           PANELLOC4                          varchar( 254 )     NULL    , 
           PANELLOC5                          varchar( 254 )     NULL    , 
           PANELLOC6                          varchar( 254 )     NULL    , 
           PANELLOC7                          varchar( 254 )     NULL    , 
           PANELLOC8                          varchar( 254 )     NULL    , 
           PANELLOC9                          varchar( 254 )     NULL    , 
           LABELLOC                           longtext           NULL    , 
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
 
/* Entity - SPLD_InsertText */
CREATE TABLE SPLD_INSERTTEXT ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             varchar( 254 )     NULL    , 
           FK_ID_SPLD_INSERTTEXTKEYWORD       int                NOT NULL ) ;
 
/* Entity - SPLD_InsertTextKeyword */
CREATE TABLE SPLD_INSERTTEXTKEYWORD ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           TYPE                               varchar( 1 )       NULL    , 
           FK_ID_SPLD_STORAGEDISPOSALSTATEM   int                NULL    , 
           FK_ID_SPLDDIRECTIONSFORUSESTATEM   int                NULL    , 
           FK_ID_SPLD_MARKETINGSTATEMENT      int                NULL    , 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI   int                NULL    , 
           FK_ID_SPLD_MARKETINGSECTION        int                NULL    , 
           FK_ID_SPLD_USAGE                   int                NULL    , 
           FK_ID_SPLD_GENERALSTATEMENT        int                NULL     ) ;
 
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
           DEFAULTTEXTFONTFAMILY              varchar( 32 )      NULL    , 
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
 
/* Entity - SPLD_MetaTable */
CREATE TABLE SPLD_METATABLE ( 
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
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL ) ;
 
/* Entity - SPLD_Rows */
CREATE TABLE SPLD_ROWS ( 
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
           FK_ID_SPLD_METATABLE               int                NOT NULL ) ;
 
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
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
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
           CONTAINERVOLUME                    varchar( 3 )       NULL    , 
           CONTAINERTYPE                      varchar( 30 )      NULL    , 
           NOTFORUSETEXT                      longtext           NULL    , 
           NOTFORUSETYPE                      varchar( 2 )       NOT NULL, 
           NUMBEREACHSTATEMENT                varchar( 1 )       NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           EXCLUSIVETOPREVIOUSSTATEMENT       varchar( 1 )       NULL    , 
           EXCLUSIVETONEXTSTATEMENT           varchar( 1 )       NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG              varchar( 1 )       NULL    , 
           CONTINUATIONLEADINGTEXT            longtext           NULL    , 
           CONTINUATIONTEXT                   longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           SUBID_SPLD_STORAGEDISPOSALSTATEM   int                NULL    , 
           FK_ID_SPLD_STORAGEDISPOSALSECTIO   int                NULL    , 
           FK_ID_S_STORAGEDISPOSALSTATEMENT   int                NULL     ) ;
 
/* Entity - SPLD_Usage */
CREATE TABLE SPLD_USAGE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NULL    , 
           CLAIMSCLASSIFICATION               varchar( 16 )      NULL    , 
           NAME                               varchar( 254 )     NOT NULL, 
           REVIEWERNOTE                       longtext           NULL    , 
           SELECTED                           varchar( 1 )       NULL    , 
           PRIMARYSLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NULL    , 
           FK_ID_SPLD_USAGE                   int                NULL    , 
           FK_ID_SPLD_USAGEFOOTNOTE           int                NULL    , 
           FK_ID_S_USAGE                      int                NULL    , 
           FK_ID_SPLD_USAGETYPE               int                NULL     ) ;
 
/* Entity - SPLD_UsageFootnote */
CREATE TABLE SPLD_USAGEFOOTNOTE ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             varchar( 254 )     NULL    , 
           SYMBOL                             varchar( 32 )      NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL ) ;
 
/* Entity - SPLD_UsageOrdering */
CREATE TABLE SPLD_USAGEORDERING ( 
           ID                                 int                NOT NULL, 
           PRIMARYSLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_SPLD_USAGE                   int                NOT NULL, 
           FK_ID_SPLD_MARKETINGSTATEMENT      int                NULL    , 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI   int                NULL    , 
           FK_ID_SPLDDIRECTIONSFORUSESTATEM   int                NULL     ) ;
 
/* Entity - SPLD_UsageType */
CREATE TABLE SPLD_USAGETYPE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           FK_ID_S_USAGETYPE                  int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL ) ;
 
/* Entity - Subregistrant */
CREATE TABLE SUBREGISTRANT ( 
           ID                                 int                NOT NULL, 
           EPA_COMPANYNUMBER                  varchar( 6 )       NULL    , 
           FK_ID_ORGANIZATION                 int                NOT NULL ) ;
 
/* Entity - SubregLabelContent */
CREATE TABLE SUBREGLABELCONTENT ( 
           ID                                 int                NOT NULL, 
           VERSION                            varchar( 254 )     NULL    , 
           REVISIONDATE                       datetime           NULL    , 
           DILUTIONCHARTSTRENGTHTITLE         varchar( 254 )     NULL    , 
           DILUTIONCHARTSTRENGTHTEXT          varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           TITLEMARKETING                     varchar( 254 )     NULL    , 
           TEXTMARKETING                      longtext           NULL    , 
           TITLETOC                           varchar( 254 )     NULL    , 
           TEXTTOC                            longtext           NULL    , 
           TITLEDFU                           varchar( 254 )     NULL    , 
           TEXTDFU                            longtext           NULL    , 
           TITLESAD                           varchar( 254 )     NULL    , 
           TEXTSAD                            longtext           NULL    , 
           DESCRIPTION                        longtext           NULL    , 
           NETCONTENTS                        double             NULL    , 
           NETCONTENTSUNITS                   varchar( 254 )     NULL    , 
           EPA_REGISTRATIONNUMBER             varchar( 128 )     NULL    , 
           EPA_ESTABLISHMENTNUMBER            varchar( 128 )     NULL    , 
           EPA_DRAFTLABEL                     datetime           NULL    , 
           ESL_DATE                           datetime           NULL    , 
           CREATEDDATETIME                    datetime           NULL    , 
           MODIFIEDDATETIME                   datetime           NULL    , 
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
 
CREATE TABLE MMSPLDDIRECTIONSFORUSESECTIONSDRV ( 
           FK_ID_SPLD_USAGE                   int                NOT NULL, 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI   int                NOT NULL ) ;
 
CREATE TABLE MM_SPLD_MARKETINGSECTIONFRSPLDUSA ( 
           FK_ID_SPLD_USAGE                   int                NOT NULL, 
           FK_ID_SPLD_MARKETINGSECTION        int                NOT NULL ) ;
 
/* Main key for Entity - Address */
CREATE UNIQUE INDEX UADDRESS_ID_4065700 
      ON ADDRESS ( 
           ID ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_PHONE1_4065790 
      ON ADDRESS ( 
           PHONE ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_CITY_4065740 
      ON ADDRESS ( 
           CITY ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_STATE_4065750 
      ON ADDRESS ( 
           STATE ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_ZIPCODE_4065780 
      ON ADDRESS ( 
           ZIPCODE ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has mail [0:1] ) ADDRESS' */
CREATE INDEX ADDRESS_FK_ID_ORGANIZATION_408066 
      ON ADDRESS ( 
           FK_ID_ORGANIZATION ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has [0:1] ) ADDRESS' */
CREATE INDEX ADDRESS_FK_ID_ORGANIZATION0240806 
      ON ADDRESS ( 
           FK_ID_ORGANIZATION02 ) ;
 
 
/* Main key for Entity - Color */
CREATE UNIQUE INDEX UCOLOR_ID_4065960 
      ON COLOR ( 
           ID ) ;
/* Main key for Entity - Color */
CREATE INDEX COLOR_NAME_4065970 
      ON COLOR ( 
           NAME ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) COLOR' */
CREATE INDEX COLOR_FK_ID_SUBREGISTRANT_4080270 
      ON COLOR ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
/* Main key for Entity - Domain */
CREATE UNIQUE INDEX Uz_DOMAIN_ID_4066070 
      ON z_DOMAIN ( 
           ID ) ;
 
 
/* Main key for Entity - DomainValue */
CREATE UNIQUE INDEX UDOMAINVALUE_DOMAINVALUEID_406618 
      ON DOMAINVALUE ( 
           DOMAINVALUE_TOKEN ) ;
 
 
/* Index for Relationship - 'z_DOMAIN(has [0:m] ) DOMAINVALUE' */
CREATE INDEX DOMAINVALUE_FK_ID_Z_DOMAIN_408187 
      ON DOMAINVALUE ( 
           FK_ID_Z_DOMAIN ) ;
 
 
/* Main key for Entity - EPA_ApplicationType */
CREATE UNIQUE INDEX UEPA_APPLICATIONTYPE_ID_4066200 
      ON EPA_APPLICATIONTYPE ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_APPLICATIONTYPE' */
CREATE INDEX EPAAPPLICATIONTYPEFKIDEPACHE40805 
      ON EPA_APPLICATIONTYPE ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
 
/* Main key for Entity - EPA_ChemicalFamily */
CREATE UNIQUE INDEX UEPA_CHEMICALFAMILY_ID_4066240 
      ON EPA_CHEMICALFAMILY ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) EPA_CHEMICALFAMILY' */
CREATE INDEX EPA_CHEMICALFAMILYFKIDEPAMMS40805 
      ON EPA_CHEMICALFAMILY ( 
           FK_ID_EPAMMS ) ;
 
 
/* Main key for Entity - EPA_Claim */
CREATE UNIQUE INDEX UEPA_CLAIM_ID_4066300 
      ON EPA_CLAIM ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_CLAIM' */
CREATE INDEX EPACLAIMFKIDEPACHEMICALFAMIL40812 
      ON EPA_CLAIM ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
 
/* Main key for Entity - EPA_Location */
CREATE UNIQUE INDEX UEPA_LOCATION_ID_4066350 
      ON EPA_LOCATION ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_LOCATION' */
CREATE INDEX EPALOCATIONFKIDEPACHEMICALFA40816 
      ON EPA_LOCATION ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
 
/* Main key for Entity - EPA_StorageDisposal */
CREATE UNIQUE INDEX UEPA_STORAGEDISPOSAL_ID_4066390 
      ON EPA_STORAGEDISPOSAL ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_STORAGEDISPOSAL' */
CREATE INDEX EPASTORAGEDISPOSALFKIDEPACHE40816 
      ON EPA_STORAGEDISPOSAL ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
 
/* Main key for Entity - EPA_Surface */
CREATE UNIQUE INDEX UEPA_SURFACE_ID_4066460 
      ON EPA_SURFACE ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_SURFACE' */
CREATE INDEX EPASURFACEFKIDEPACHEMICALFAM40816 
      ON EPA_SURFACE ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
 
/* Main key for Entity - ePamms */
CREATE UNIQUE INDEX UEPAMMS_ID_4066500 
      ON EPAMMS ( 
           ID ) ;
 
 
/* Main key for Entity - Feedback */
CREATE UNIQUE INDEX UFEEDBACK_ID_4066540 
      ON FEEDBACK ( 
           ID ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has [0:m] ) FEEDBACK' */
CREATE INDEX FEEDBACK_FK_ID_ORGANIZATION_40805 
      ON FEEDBACK ( 
           FK_ID_ORGANIZATION ) ;
 
 
/* Main key for Entity - Font */
CREATE UNIQUE INDEX UFONT_ID_4066610 
      ON FONT ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) FONT' */
CREATE INDEX FONT_FK_ID_SUBREGISTRANT_4079330 
      ON FONT ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
/* Main key for Entity - FootnoteSymbol */
CREATE UNIQUE INDEX UFOOTNOTESYMBOL_ID_4066650 
      ON FOOTNOTESYMBOL ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) FOOTNOTESYMBOL' */
CREATE INDEX FOOTNOTESYMBOL_FK_ID_EPAMMS_40797 
      ON FOOTNOTESYMBOL ( 
           FK_ID_EPAMMS ) ;
 
 
/* Main key for Entity - GraphicLabelControl */
CREATE UNIQUE INDEX UGRAPHICLABELCONTROL_ID_4066700 
      ON GRAPHICLABELCONTROL ( 
           ID ) ;
 
 
/* Index for Relationship - 'GRAPHICLABELDEFINITION(has [0:m] ) GRAPHICLABELCONTROL' */
CREATE INDEX GRAPHICLABELCONTROLFKIDGRAPH40817 
      ON GRAPHICLABELCONTROL ( 
           FK_ID_GRAPHICLABELDEFINITION ) ;
 
 
/* Main key for Entity - GraphicLabelDefinition */
CREATE UNIQUE INDEX UGRAPHICLABELDEFINITION_ID_406678 
      ON GRAPHICLABELDEFINITION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) GRAPHICLABELDEFINITION' */
CREATE INDEX GRAPHICLABELDEFINITIONFKIDSU40817 
      ON GRAPHICLABELDEFINITION ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) GRAPHICLABELDEFINITION' */
CREATE INDEX GRAPHICLABELDEFINITIONFKIDSU40817 
      ON GRAPHICLABELDEFINITION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - Help */
CREATE UNIQUE INDEX UHELP_ID_4066850 
      ON HELP ( 
           ID ) ;
/* Main key for Entity - Help */
CREATE INDEX HELP_NAME_4066860 
      ON HELP ( 
           DIALOGWINDOW ) ;
 
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) HELP' */
CREATE INDEX HELP_FK_ID_EPAMMS_4080140 
      ON HELP ( 
           FK_ID_EPAMMS ) ;
 
 
/* Main key for Entity - Keyword */
CREATE UNIQUE INDEX UKEYWORD_ID_4066910 
      ON KEYWORD ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) KEYWORD' */
CREATE INDEX KEYWORD_FK_ID_EPAMMS_4080550 
      ON KEYWORD ( 
           FK_ID_EPAMMS ) ;
 
 
/* Main key for Entity - LLD */
CREATE UNIQUE INDEX ULLD_ID_4066950 
      ON LLD ( 
           ID ) ;
 
 
/* Main key for Entity - LLD_Block */
CREATE UNIQUE INDEX ULLD_BLOCK_ID_4067140 
      ON LLD_BLOCK ( 
           ID ) ;
 
 
/* Index for Relationship - 'COLOR(is background for [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_BG_ID_COLOR_4080240 
      ON LLD_BLOCK ( 
           BG_ID_COLOR ) ;
 
 
/* Index for Relationship - 'COLOR(is border for [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_BD_ID_COLOR_4080250 
      ON LLD_BLOCK ( 
           BD_ID_COLOR ) ;
 
 
/* Index for Relationship - 'COLOR(is Text for [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_TX_ID_COLOR_4080260 
      ON LLD_BLOCK ( 
           TX_ID_COLOR ) ;
 
 
/* Index for Relationship - 'REUSABLEBLOCKDEFINITION(for [0:1] ) LLD_BLOCK' */
CREATE INDEX LLDBLOCKFKIDREUSABLEBLOCKDEF40802 
      ON LLD_BLOCK ( 
           FK_ID_REUSABLEBLOCKDEFINITION ) ;
 
 
/* Index for Relationship - 'LLD_SPECIALSECTIONATTRIBUTE(has text characteristics [0:m] ) LLD_BLOCK' */
CREATE INDEX LLDBLOCKFKIDLLDSPECIALSECTIO40805 
      ON LLD_BLOCK ( 
           FK_ID_LLD_SPECIALSECTIONATTRIBUT ) ;
 
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_FK_ID_SPLD_SECTION40805 
      ON LLD_BLOCK ( 
           FK_ID_SPLD_SECTION ) ;
 
 
/* Index for Relationship - 'LLD_PANEL(has [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_FK_ID_LLD_PANEL_4081030 
      ON LLD_BLOCK ( 
           FK_ID_LLD_PANEL ) ;
 
 
/* Index for Relationship - 'LLD_BLOCK(is linked to [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_FK_ID_LLD_BLOCK_4081100 
      ON LLD_BLOCK ( 
           FK_ID_LLD_BLOCK ) ;
 
 
/* Main key for Entity - LLD_Page */
CREATE UNIQUE INDEX ULLD_PAGE_ID_4067640 
      ON LLD_PAGE ( 
           ID ) ;
 
 
/* Index for Relationship - 'COLOR(is background for [0:m] ) LLD_PAGE' */
CREATE INDEX LLD_PAGE_FK_ID_COLOR_4080210 
      ON LLD_PAGE ( 
           FK_ID_COLOR ) ;
 
 
/* Index for Relationship - 'LLD(has [0:m] ) LLD_PAGE' */
CREATE INDEX LLD_PAGE_FK_ID_LLD_4080480 
      ON LLD_PAGE ( 
           FK_ID_LLD ) ;
 
 
/* Index for Relationship - 'SPLD_LLD(has [0:m] ) LLD_PAGE' */
CREATE INDEX LLD_PAGE_FK_ID_SPLD_LLD_4080490 
      ON LLD_PAGE ( 
           FK_ID_SPLD_LLD ) ;
 
 
/* Main key for Entity - LLD_Panel */
CREATE UNIQUE INDEX ULLD_PANEL_ID_4067750 
      ON LLD_PANEL ( 
           ID ) ;
 
 
/* Index for Relationship - 'COLOR(is background for [0:m] ) LLD_PANEL' */
CREATE INDEX LLD_PANEL_BG_ID_COLOR_4080220 
      ON LLD_PANEL ( 
           BG_ID_COLOR ) ;
 
 
/* Index for Relationship - 'COLOR(is border for [0:m] ) LLD_PANEL' */
CREATE INDEX LLD_PANEL_BD_ID_COLOR_4080230 
      ON LLD_PANEL ( 
           BD_ID_COLOR ) ;
 
 
/* Index for Relationship - 'LLD_PAGE(has [0:m] ) LLD_PANEL' */
CREATE INDEX LLD_PANEL_FK_ID_LLD_PAGE_4080470 
      ON LLD_PANEL ( 
           FK_ID_LLD_PAGE ) ;
 
 
/* Main key for Entity - LLD_SpecialSectionAttribute */
CREATE UNIQUE INDEX ULLDSPECIALSECTIONATTRIBUTEI40682 
      ON LLD_SPECIALSECTIONATTRIBUTE ( 
           ID ) ;
 
 
/* Index for Relationship - 'LLD_BLOCK(contains [0:m] ) LLD_SPECIALSECTIONATTRIBUTE' */
CREATE INDEX LLDSPECIALSECTIONATTRIBUTEP140805 
      ON LLD_SPECIALSECTIONATTRIBUTE ( 
           PF1ID_LLD_BLOCK ) ;
 
 
/* Main key for Entity - M_DilutionChartEntry */
CREATE UNIQUE INDEX UM_DILUTIONCHARTENTRY_ID_4068300 
      ON M_DILUTIONCHARTENTRY ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DILUTIONGROUP(has [0:m] ) M_DILUTIONCHARTENTRY' */
CREATE INDEX MDILUTIONCHARTENTRYFKIDMDILU40797 
      ON M_DILUTIONCHARTENTRY ( 
           FK_ID_M_DILUTIONGROUP ) ;
 
 
/* Main key for Entity - M_DilutionGroup */
CREATE UNIQUE INDEX UM_DILUTIONGROUP_ID_4068370 
      ON M_DILUTIONGROUP ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_DILUTIONGROUP' */
CREATE INDEX MDILUTIONGROUPFKIDMASTERLABE40803 
      ON M_DILUTIONGROUP ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_DilutionGroupItem */
CREATE UNIQUE INDEX UM_DILUTIONGROUPITEM_ID_4068490 
      ON M_DILUTIONGROUPITEM ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DILUTIONGROUP(has [0:m] ) M_DILUTIONGROUPITEM' */
CREATE INDEX MDILUTIONGROUPITEMFKIDMDILUT40803 
      ON M_DILUTIONGROUPITEM ( 
           FK_ID_M_DILUTIONGROUP ) ;
 
 
/* Main key for Entity - M_DirectionsForUseCategory */
CREATE UNIQUE INDEX UMDIRECTIONSFORUSECATEGORYID40685 
      ON M_DIRECTIONSFORUSECATEGORY ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSECATEGORY(has next version [0:m] ) M_DIRECTIONSFORUSECATEGORY' */
CREATE INDEX MDIRECTIONSFORUSECATEGORYFKI40796 
      ON M_DIRECTIONSFORUSECATEGORY ( 
           FK_ID_M_DIRECTIONSFORUSECATEGORY ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_DIRECTIONSFORUSECATEGORY' */
CREATE INDEX MDIRECTIONSFORUSECATEGORYFKI40796 
      ON M_DIRECTIONSFORUSECATEGORY ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_DirectionsForUseSection */
CREATE UNIQUE INDEX UM_DIRECTIONSFORUSESECTIONID40686 
      ON M_DIRECTIONSFORUSESECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSECATEGORY(has [0:m] ) M_DIRECTIONSFORUSESECTION' */
CREATE INDEX MDIRECTIONSFORUSESECTIONFKID40796 
      ON M_DIRECTIONSFORUSESECTION ( 
           FK_ID_M_DIRECTIONSFORUSECATEGORY ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(exclusiveTo [0:1] ) M_DIRECTIONSFORUSESECTION' */
CREATE INDEX MDIRECTIONSFORUSESECTIONXORI40798 
      ON M_DIRECTIONSFORUSESECTION ( 
           XORID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has next version [0:m] ) M_DIRECTIONSFORUSESECTION' */
CREATE INDEX MDIRECTIONSFORUSESECTIONFKID40813 
      ON M_DIRECTIONSFORUSESECTION ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Main key for Entity - M_DirectionsForUseStatement */
CREATE UNIQUE INDEX UMDIRECTIONSFORUSESTATEMENTI40688 
      ON M_DIRECTIONSFORUSESTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has sub [0:m] ) M_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX MDIRECTIONSFORUSESTATEMENTSU40796 
      ON M_DIRECTIONSFORUSESTATEMENT ( 
           SUBID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has [0:m] ) M_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX MDIRECTIONSFORUSESTATEMENTFK40811 
      ON M_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has next version [0:m] ) M_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX MDIRECTIONSFORUSESTATEMENTFK40812 
      ON M_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Main key for Entity - M_GeneralSection */
CREATE UNIQUE INDEX UM_GENERALSECTION_ID_4068970 
      ON M_GENERALSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_GENERALSECTION' */
CREATE INDEX MGENERALSECTIONFKIDMASTERLAB40810 
      ON M_GENERALSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Index for Relationship - 'M_GENERALSECTION(has next version [0:m] ) M_GENERALSECTION' */
CREATE INDEX MGENERALSECTIONFKIDMGENERALS40811 
      ON M_GENERALSECTION ( 
           FK_ID_M_GENERALSECTION ) ;
 
 
/* Main key for Entity - M_GeneralStatement */
CREATE UNIQUE INDEX UM_GENERALSTATEMENT_ID_4069130 
      ON M_GENERALSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_GENERALSUBSECTION(has [0:m] ) M_GENERALSTATEMENT' */
CREATE INDEX MGENERALSTATEMENTFKIDMGENERA40797 
      ON M_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSUBSECTION ) ;
 
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) M_GENERALSTATEMENT' */
CREATE INDEX MGENERALSTATEMENTFKIDMGENERA40810 
      ON M_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSECTION ) ;
 
 
/* Index for Relationship - 'M_GENERALSTATEMENT(has next version [0:m] ) M_GENERALSTATEMENT' */
CREATE INDEX MGENERALSTATEMENTFKIDMGENERA40810 
      ON M_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSTATEMENT ) ;
 
 
/* Main key for Entity - M_GeneralSubSection */
CREATE UNIQUE INDEX UM_GENERALSUBSECTION_ID_4069200 
      ON M_GENERALSUBSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_GENERALSUBSECTION(has next version [0:m] ) M_GENERALSUBSECTION' */
CREATE INDEX MGENERALSUBSECTIONFKIDMGENER40794 
      ON M_GENERALSUBSECTION ( 
           FK_ID_M_GENERALSUBSECTION ) ;
 
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) M_GENERALSUBSECTION' */
CREATE INDEX MGENERALSUBSECTIONFKIDMGENER40797 
      ON M_GENERALSUBSECTION ( 
           FK_ID_M_GENERALSECTION ) ;
 
 
/* Main key for Entity - M_HumanHazardSection */
CREATE UNIQUE INDEX UM_HUMANHAZARDSECTION_ID_4069270 
      ON M_HUMANHAZARDSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:1] ) M_HUMANHAZARDSECTION' */
CREATE INDEX MHUMANHAZARDSECTIONFKIDMASTE40812 
      ON M_HUMANHAZARDSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Index for Relationship - 'M_HUMANHAZARDSECTION(has next version [0:m] ) M_HUMANHAZARDSECTION' */
CREATE INDEX MHUMANHAZARDSECTIONFKIDMHUMA40813 
      ON M_HUMANHAZARDSECTION ( 
           FK_ID_M_HUMANHAZARDSECTION ) ;
 
 
/* Main key for Entity - M_IngredientsSection */
CREATE UNIQUE INDEX UM_INGREDIENTSSECTION_ID_4069540 
      ON M_INGREDIENTSSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has next version [0:m] ) M_INGREDIENTSSECTION' */
CREATE INDEX MINGREDIENTSSECTIONFKIDMINGR40816 
      ON M_INGREDIENTSSECTION ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:1] ) M_INGREDIENTSSECTION' */
CREATE INDEX MINGREDIENTSSECTIONFKIDMASTE40817 
      ON M_INGREDIENTSSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_IngredientsStatement */
CREATE UNIQUE INDEX UM_INGREDIENTSSTATEMENT_ID_406963 
      ON M_INGREDIENTSSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has [0:m] ) M_INGREDIENTSSTATEMENT' */
CREATE INDEX MINGREDIENTSSTATEMENTFKIDMIN40816 
      ON M_INGREDIENTSSTATEMENT ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
 
/* Index for Relationship - 'M_INGREDIENTSSTATEMENT(has next version [0:m] ) M_INGREDIENTSSTATEMENT' */
CREATE INDEX MINGREDIENTSSTATEMENTFKIDMIN40816 
      ON M_INGREDIENTSSTATEMENT ( 
           FK_ID_M_INGREDIENTSSTATEMENT ) ;
 
 
/* Main key for Entity - M_InsertText */
CREATE UNIQUE INDEX UM_INSERTTEXT_ID_4069720 
      ON M_INSERTTEXT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_INSERTTEXTKEYWORD(has [0:m] ) M_INSERTTEXT' */
CREATE INDEX MINSERTTEXTFKIDMINSERTTEXTKE40801 
      ON M_INSERTTEXT ( 
           FK_ID_M_INSERTTEXTKEYWORD ) ;
 
 
/* Main key for Entity - M_InsertTextKeyword */
CREATE UNIQUE INDEX UM_INSERTTEXTKEYWORD_ID_4069760 
      ON M_INSERTTEXTKEYWORD ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMSTORA40798 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_STORAGEDISPOSALSTATEMENT ) ;
 
 
/* Index for Relationship - 'M_GENERALSTATEMENT(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMGENER40798 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_GENERALSTATEMENT ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has title [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMDIREC40799 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSECTION(has title [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMMARKE40800 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMUSAGE40800 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_USAGE ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMMARKE40801 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMDIREC40801 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Main key for Entity - M_MarketingSection */
CREATE UNIQUE INDEX UM_MARKETINGSECTION_ID_4069810 
      ON M_MARKETINGSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_MARKETINGSECTION' */
CREATE INDEX MMARKETINGSECTIONFKIDMASTERL40812 
      ON M_MARKETINGSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSECTION(has next version [0:m] ) M_MARKETINGSECTION' */
CREATE INDEX MMARKETINGSECTIONFKIDMMARKET40814 
      ON M_MARKETINGSECTION ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
 
/* Main key for Entity - M_MarketingStatement */
CREATE UNIQUE INDEX UM_MARKETINGSTATEMENT_ID_4069910 
      ON M_MARKETINGSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSECTION(has [0:m] ) M_MARKETINGSTATEMENT' */
CREATE INDEX MMARKETINGSTATEMENTFKIDMMARK40807 
      ON M_MARKETINGSTATEMENT ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has next version [0:m] ) M_MARKETINGSTATEMENT' */
CREATE INDEX MMARKETINGSTATEMENTFKIDMMARK40813 
      ON M_MARKETINGSTATEMENT ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
 
/* Main key for Entity - M_MetaTable */
CREATE UNIQUE INDEX UM_METATABLE_ID_4069990 
      ON M_METATABLE ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_METATABLE' */
CREATE INDEX MMETATABLEFKIDMASTERLABELCON40795 
      ON M_METATABLE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_ReviewerNote */
CREATE UNIQUE INDEX UM_REVIEWERNOTE_ID_4070150 
      ON M_REVIEWERNOTE ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSECTION(has [0:m] ) M_REVIEWERNOTE' */
CREATE INDEX MREVIEWERNOTEFKIDMMARKETINGS40798 
      ON M_REVIEWERNOTE ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has [0:m] ) M_REVIEWERNOTE' */
CREATE INDEX MREVIEWERNOTEFKIDMDIRECTIONS40798 
      ON M_REVIEWERNOTE ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) M_REVIEWERNOTE' */
CREATE INDEX MREVIEWERNOTEFKIDMGENERALSEC40798 
      ON M_REVIEWERNOTE ( 
           FK_ID_M_GENERALSECTION ) ;
 
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has [0:m] ) M_REVIEWERNOTE' */
CREATE INDEX MREVIEWERNOTEFKIDMINGREDIENT40798 
      ON M_REVIEWERNOTE ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
 
/* Main key for Entity - M_Rows */
CREATE UNIQUE INDEX UM_ROWS_ID_4070200 
      ON M_ROWS ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_METATABLE(has [0:m] ) M_ROWS' */
CREATE INDEX M_ROWS_FK_ID_M_METATABLE_4079600 
      ON M_ROWS ( 
           FK_ID_M_METATABLE ) ;
 
 
/* Main key for Entity - M_StorageDisposalSection */
CREATE UNIQUE INDEX UM_STORAGEDISPOSALSECTION_ID40703 
      ON M_STORAGEDISPOSALSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_STORAGEDISPOSALSECTION' */
CREATE INDEX MSTORAGEDISPOSALSECTIONFKIDM40812 
      ON M_STORAGEDISPOSALSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has next version [0:m] ) M_STORAGEDISPOSALSECTION' */
CREATE INDEX MSTORAGEDISPOSALSECTIONFKIDM40812 
      ON M_STORAGEDISPOSALSECTION ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
 
/* Main key for Entity - M_StorageDisposalStatement */
CREATE UNIQUE INDEX UMSTORAGEDISPOSALSTATEMENTID40704 
      ON M_STORAGEDISPOSALSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has sub [0:m] ) M_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX MSTORAGEDISPOSALSTATEMENTSUB40796 
      ON M_STORAGEDISPOSALSTATEMENT ( 
           SUBID_M_STORAGEDISPOSALSTATEMENT ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has [0:m] ) M_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX MSTORAGEDISPOSALSTATEMENTFKI40811 
      ON M_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has next version [0:m] ) M_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX MSTORAGEDISPOSALSTATEMENTFKI40811 
      ON M_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_M_STORAGEDISPOSALSTATEMENT ) ;
 
 
/* Main key for Entity - M_TOC */
CREATE UNIQUE INDEX UM_TOC_ID_4070620 
      ON M_TOC ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_TOC' */
CREATE INDEX M_TOC_FKIDMASTERLABELCONTENT40797 
      ON M_TOC ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_Usage */
CREATE UNIQUE INDEX UM_USAGE_ID_4070680 
      ON M_USAGE ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGE_4079730 
      ON M_USAGE ( 
           FK_ID_M_USAGE ) ;
 
 
/* Index for Relationship - 'M_USAGEGROUP(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGEGROUP_407988 
      ON M_USAGE ( 
           FK_ID_M_USAGEGROUP ) ;
 
 
/* Index for Relationship - 'M_USAGEFOOTNOTE(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_MUSAGEFOOTNOTE40803 
      ON M_USAGE ( 
           FK_ID_M_USAGEFOOTNOTE ) ;
 
 
/* Index for Relationship - 'M_USAGETYPE(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGETYPE_4080460 
      ON M_USAGE ( 
           FK_ID_M_USAGETYPE ) ;
 
 
/* Index for Relationship - 'M_USAGE(has next version [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGE02_4081420 
      ON M_USAGE ( 
           FK_ID_M_USAGE02 ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has (delete) [0:m] ) M_USAGE' */
CREATE INDEX MUSAGEFKIDMASTERLABELCONTENT40817 
      ON M_USAGE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_UsageFootnote */
CREATE UNIQUE INDEX UM_USAGEFOOTNOTE_ID_4070770 
      ON M_USAGEFOOTNOTE ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_USAGEFOOTNOTE' */
CREATE INDEX MUSAGEFOOTNOTEFKIDMASTERLABE40803 
      ON M_USAGEFOOTNOTE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - M_UsageGroup */
CREATE UNIQUE INDEX UM_USAGEGROUP_ID_4070820 
      ON M_USAGEGROUP ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_USAGETYPE(has [0:m] ) M_USAGEGROUP' */
CREATE INDEX M_USAGEGROUP_FK_IDMUSAGETYPE40798 
      ON M_USAGEGROUP ( 
           FK_ID_M_USAGETYPE ) ;
 
 
/* Main key for Entity - M_UsageOrdering */
CREATE UNIQUE INDEX UM_USAGEORDERING_ID_4070860 
      ON M_USAGEORDERING ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSECTION(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX MUSAGEORDERINGFKIDMMARKETING40794 
      ON M_USAGEORDERING ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX MUSAGEORDERINGFKIDMDIRECTION40795 
      ON M_USAGEORDERING ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX M_USAGEORDERING_FK_ID_MUSAGE40807 
      ON M_USAGEORDERING ( 
           FK_ID_M_USAGE ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX MUSAGEORDERINGFKIDMDIRECTION40807 
      ON M_USAGEORDERING ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX MUSAGEORDERINGFKIDMMARKETING40817 
      ON M_USAGEORDERING ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
 
/* Main key for Entity - M_UsageType */
CREATE UNIQUE INDEX UM_USAGETYPE_ID_4070890 
      ON M_USAGETYPE ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_USAGETYPE' */
CREATE INDEX MUSAGETYPEFKIDMASTERLABELCON40804 
      ON M_USAGETYPE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - MasterLabelContent */
CREATE UNIQUE INDEX UMASTERLABELCONTENT_ID_4070950 
      ON MASTERLABELCONTENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has sub [0:m] ) MASTERLABELCONTENT' */
CREATE INDEX MASTERLABELCONTENTSUBIDMASTE40796 
      ON MASTERLABELCONTENT ( 
           SUBID_MASTERLABELCONTENT ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has next version (max 1) [0:m] ) MASTERLABELCONTENT' */
CREATE INDEX MASTERLABELCONTENTFKIDMASTER40808 
      ON MASTERLABELCONTENT ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Index for Relationship - 'MASTERPRODUCT(has [0:m] ) MASTERLABELCONTENT' */
CREATE INDEX MASTERLABELCONTENTFKIDMASTER40817 
      ON MASTERLABELCONTENT ( 
           FK_ID_MASTERPRODUCT ) ;
 
 
/* Main key for Entity - MasterProduct */
CREATE UNIQUE INDEX UMASTERPRODUCT_ID_4071200 
      ON MASTERPRODUCT ( 
           ID ) ;
 
 
/* Index for Relationship - 'PRIMARYREGISTRANT(has [0:m] ) MASTERPRODUCT' */
CREATE INDEX MASTERPRODUCTFKIDPRIMARYREGI40818 
      ON MASTERPRODUCT ( 
           FK_ID_PRIMARYREGISTRANT ) ;
 
 
/* Main key for Entity - NetContents */
CREATE UNIQUE INDEX UNETCONTENTS_ID_4071350 
      ON NETCONTENTS ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:1] ) NETCONTENTS' */
CREATE INDEX NETCONTENTSFKIDMASTERLABELCO40797 
      ON NETCONTENTS ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - Organization */
CREATE UNIQUE INDEX UORGANIZATION_ID_4071410 
      ON ORGANIZATION ( 
           ID ) ;
 
 
/* Main key for Entity - Person */
CREATE UNIQUE INDEX UPERSON_ID_4071540 
      ON PERSON ( 
           ID ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_LASTNAME_4071550 
      ON PERSON ( 
           LASTNAME ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_EMAILADDRESS_4071650 
      ON PERSON ( 
           EMAILADDRESS ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_HOMEPHONE_4071600 
      ON PERSON ( 
           HOMEPHONE ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_GENDER_4071590 
      ON PERSON ( 
           GENDER ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_WORKPHONE_4071620 
      ON PERSON ( 
           WORKPHONE ) ;
 
 
/* Index for Relationship - 'ADDRESS(for [0:1] ) PERSON' */
CREATE INDEX PERSON_FK_ID_ADDRESS_4081880 
      ON PERSON ( 
           FK_ID_ADDRESS ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has employee [0:m] ) PERSON' */
CREATE INDEX PERSON_FK_ID_ORGANIZATION_4081890 
      ON PERSON ( 
           FK_ID_ORGANIZATION ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has contact [0:1] ) PERSON' */
CREATE INDEX PERSONHASCONTACTIDORGANIZATI40819 
      ON PERSON ( 
           HASCONTACTID_ORGANIZATION ) ;
 
 
/* Main key for Entity - PrimaryRegistrant */
CREATE UNIQUE INDEX UPRIMARYREGISTRANT_ID_4071790 
      ON PRIMARYREGISTRANT ( 
           ID ) ;
 
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) PRIMARYREGISTRANT' */
CREATE INDEX PRIMARYREGISTRANT_FKIDEPAMMS40803 
      ON PRIMARYREGISTRANT ( 
           FK_ID_EPAMMS ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has [0:1] ) PRIMARYREGISTRANT' */
CREATE INDEX PRIMARYREGISTRANTFKIDORGANIZ40806 
      ON PRIMARYREGISTRANT ( 
           FK_ID_ORGANIZATION ) ;
 
 
/* Main key for Entity - PrimarySub */
CREATE UNIQUE INDEX UPRIMARYSUB_ID_4071830 
      ON PRIMARYSUB ( 
           ID ) ;
 
 
/* Index for Relationship - 'PRIMARYREGISTRANT(has [0:m] ) PRIMARYSUB' */
CREATE INDEX PRIMARYSUBFKIDPRIMARYREGISTR40793 
      ON PRIMARYSUB ( 
           FK_ID_PRIMARYREGISTRANT ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) PRIMARYSUB' */
CREATE INDEX PRIMARYSUB_FKIDSUBREGISTRANT40818 
      ON PRIMARYSUB ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
/* Main key for Entity - ResumeObject */
CREATE UNIQUE INDEX URESUMEOBJECT_ID_4071860 
      ON RESUMEOBJECT ( 
           ID ) ;
 
 
/* Index for Relationship - 'RESUMEPATH(has [0:m] ) RESUMEOBJECT' */
CREATE INDEX RESUMEOBJECT_FK_IDRESUMEPATH40798 
      ON RESUMEOBJECT ( 
           FK_ID_RESUMEPATH ) ;
 
 
/* Main key for Entity - ResumePath */
CREATE UNIQUE INDEX URESUMEPATH_ID_4071940 
      ON RESUMEPATH ( 
           ID ) ;
 
 
/* Index for Relationship - 'z_USER(has [0:m] ) RESUMEPATH' */
CREATE INDEX RESUMEPATH_FK_ID_Z_USER_4079900 
      ON RESUMEPATH ( 
           FK_ID_Z_USER ) ;
 
 
/* Main key for Entity - ReusableBlockDefinition */
CREATE UNIQUE INDEX UREUSABLEBLOCKDEFINITION_ID_40719 
      ON REUSABLEBLOCKDEFINITION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) REUSABLEBLOCKDEFINITION' */
CREATE INDEX REUSABLEBLOCKDEFINITIONFKIDS40802 
      ON REUSABLEBLOCKDEFINITION ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
/* Main key for Entity - S_DilutionChartEntry */
CREATE UNIQUE INDEX USDILUTIONCHARTENTRYIDSDILUTIONCH 
      ON S_DILUTIONCHARTENTRY ( 
 
 
/* Index for Relationship - 'S_DILUTIONGROUP(has [0:m] ) S_DILUTIONCHARTENTRY' */
CREATE INDEX SDILUTIONCHARTENTRYFKIDSDILU40800 
      ON S_DILUTIONCHARTENTRY ( 
           FK_ID_S_DILUTIONGROUP ) ;
 
 
/* Main key for Entity - S_DilutionGroup */
CREATE UNIQUE INDEX US_DILUTIONGROUP_ID_4072100 
      ON S_DILUTIONGROUP ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_DILUTIONGROUP' */
CREATE INDEX SDILUTIONGROUPFKIDSUBREGLABE40804 
      ON S_DILUTIONGROUP ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Index for Relationship - 'M_DILUTIONGROUP(has [0:m] ) S_DILUTIONGROUP' */
CREATE INDEX SDILUTIONGROUPFKIDMDILUTIONG40804 
      ON S_DILUTIONGROUP ( 
           FK_ID_M_DILUTIONGROUP ) ;
 
 
/* Main key for Entity - S_DilutionGroupItem */
CREATE UNIQUE INDEX US_DILUTIONGROUPITEM_ID_4072230 
      ON S_DILUTIONGROUPITEM ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_DILUTIONGROUP(has [0:m] ) S_DILUTIONGROUPITEM' */
CREATE INDEX SDILUTIONGROUPITEMFKIDSDILUT40801 
      ON S_DILUTIONGROUPITEM ( 
           FK_ID_S_DILUTIONGROUP ) ;
 
 
/* Main key for Entity - S_DirectionsForUseCategory */
CREATE UNIQUE INDEX USDIRECTIONSFORUSECATEGORYID40722 
      ON S_DIRECTIONSFORUSECATEGORY ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSECATEGORY(has [0:m] ) S_DIRECTIONSFORUSECATEGORY' */
CREATE INDEX SDIRECTIONSFORUSECATEGORYFKI40813 
      ON S_DIRECTIONSFORUSECATEGORY ( 
           FK_ID_M_DIRECTIONSFORUSECATEGORY ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_DIRECTIONSFORUSECATEGORY' */
CREATE INDEX SDIRECTIONSFORUSECATEGORYFKI40815 
      ON S_DIRECTIONSFORUSECATEGORY ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_DirectionsForUseSection */
CREATE UNIQUE INDEX US_DIRECTIONSFORUSESECTIONID40724 
      ON S_DIRECTIONSFORUSESECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(exclusiveTo [0:1] ) S_DIRECTIONSFORUSESECTION' */
CREATE INDEX SDIRECTIONSFORUSESECTIONXORI40802 
      ON S_DIRECTIONSFORUSESECTION ( 
           XORID_S_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has [0:m] ) S_DIRECTIONSFORUSESECTION' */
CREATE INDEX SDIRECTIONSFORUSESECTIONFKID40813 
      ON S_DIRECTIONSFORUSESECTION ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSECATEGORY(has [0:m] ) S_DIRECTIONSFORUSESECTION' */
CREATE INDEX SDIRECTIONSFORUSESECTIONFKID40815 
      ON S_DIRECTIONSFORUSESECTION ( 
           FK_ID_S_DIRECTIONSFORUSECATEGORY ) ;
 
 
/* Main key for Entity - S_DirectionsForUseStatement */
CREATE UNIQUE INDEX USDIRECTIONSFORUSESTATEMENTI40725 
      ON S_DIRECTIONSFORUSESTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESTATEMENT(has sub [0:m] ) S_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SDIRECTIONSFORUSESTATEMENTSU40795 
      ON S_DIRECTIONSFORUSESTATEMENT ( 
           SUBID_S_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has [0:m] ) S_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SDIRECTIONSFORUSESTATEMENTFK40811 
      ON S_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(has [0:m] ) S_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SDIRECTIONSFORUSESTATEMENTFK40815 
      ON S_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
 
/* Main key for Entity - S_GeneralSection */
CREATE UNIQUE INDEX US_GENERALSECTION_ID_4072700 
      ON S_GENERALSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) S_GENERALSECTION' */
CREATE INDEX SGENERALSECTIONFKIDMGENERALS40810 
      ON S_GENERALSECTION ( 
           FK_ID_M_GENERALSECTION ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_GENERALSECTION' */
CREATE INDEX SGENERALSECTIONFKIDSUBREGLAB40814 
      ON S_GENERALSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_GeneralStatement */
CREATE UNIQUE INDEX US_GENERALSTATEMENT_ID_4072870 
      ON S_GENERALSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_GENERALSUBSECTION(has [0:m] ) S_GENERALSTATEMENT' */
CREATE INDEX SGENERALSTATEMENTFKIDSGENERA40795 
      ON S_GENERALSTATEMENT ( 
           FK_ID_S_GENERALSUBSECTION ) ;
 
 
/* Index for Relationship - 'M_GENERALSTATEMENT(has [0:m] ) S_GENERALSTATEMENT' */
CREATE INDEX SGENERALSTATEMENTFKIDMGENERA40810 
      ON S_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSTATEMENT ) ;
 
 
/* Index for Relationship - 'S_GENERALSECTION(has [0:m] ) S_GENERALSTATEMENT' */
CREATE INDEX SGENERALSTATEMENTFKIDSGENERA40814 
      ON S_GENERALSTATEMENT ( 
           FK_ID_S_GENERALSECTION ) ;
 
 
/* Main key for Entity - S_GeneralSubSection */
CREATE UNIQUE INDEX US_GENERALSUBSECTION_ID_4072950 
      ON S_GENERALSUBSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_GENERALSECTION(has [0:m] ) S_GENERALSUBSECTION' */
CREATE INDEX SGENERALSUBSECTIONFKIDSGENER40794 
      ON S_GENERALSUBSECTION ( 
           FK_ID_S_GENERALSECTION ) ;
 
 
/* Index for Relationship - 'M_GENERALSUBSECTION(has [0:m] ) S_GENERALSUBSECTION' */
CREATE INDEX SGENERALSUBSECTIONFKIDMGENER40795 
      ON S_GENERALSUBSECTION ( 
           FK_ID_M_GENERALSUBSECTION ) ;
 
 
/* Main key for Entity - S_HumanHazardSection */
CREATE UNIQUE INDEX US_HUMANHAZARDSECTION_ID_4073030 
      ON S_HUMANHAZARDSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_HUMANHAZARDSECTION(has [0:m] ) S_HUMANHAZARDSECTION' */
CREATE INDEX SHUMANHAZARDSECTIONFKIDMHUMA40813 
      ON S_HUMANHAZARDSECTION ( 
           FK_ID_M_HUMANHAZARDSECTION ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_HUMANHAZARDSECTION' */
CREATE INDEX SHUMANHAZARDSECTIONFKIDSUBRE40815 
      ON S_HUMANHAZARDSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_IngredientsSection */
CREATE UNIQUE INDEX US_INGREDIENTSSECTION_ID_4073310 
      ON S_INGREDIENTSSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_INGREDIENTSSECTION' */
CREATE INDEX SINGREDIENTSSECTIONFKIDSUBRE40814 
      ON S_INGREDIENTSSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has [0:m] ) S_INGREDIENTSSECTION' */
CREATE INDEX SINGREDIENTSSECTIONFKIDMINGR40816 
      ON S_INGREDIENTSSECTION ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
 
/* Main key for Entity - S_IngredientsStatement */
CREATE UNIQUE INDEX US_INGREDIENTSSTATEMENT_ID_407341 
      ON S_INGREDIENTSSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_INGREDIENTSSECTION(has [0:m] ) S_INGREDIENTSSTATEMENT' */
CREATE INDEX SINGREDIENTSSTATEMENTFKIDSIN40814 
      ON S_INGREDIENTSSTATEMENT ( 
           FK_ID_S_INGREDIENTSSECTION ) ;
 
 
/* Index for Relationship - 'M_INGREDIENTSSTATEMENT(has [0:m] ) S_INGREDIENTSSTATEMENT' */
CREATE INDEX SINGREDIENTSSTATEMENTFKIDMIN40816 
      ON S_INGREDIENTSSTATEMENT ( 
           FK_ID_M_INGREDIENTSSTATEMENT ) ;
 
 
/* Main key for Entity - S_InsertText */
CREATE UNIQUE INDEX US_INSERTTEXT_ID_4073510 
      ON S_INSERTTEXT ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_INSERTTEXTKEYWORD(has [0:m] ) S_INSERTTEXT' */
CREATE INDEX SINSERTTEXTFKIDSINSERTTEXTKE40800 
      ON S_INSERTTEXT ( 
           FK_ID_S_INSERTTEXTKEYWORD ) ;
 
 
/* Main key for Entity - S_InsertTextKeyword */
CREATE UNIQUE INDEX US_INSERTTEXTKEYWORD_ID_4073560 
      ON S_INSERTTEXTKEYWORD ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_GENERALSTATEMENT(has [0:m] ) S_INSERTTEXTKEYWORD' */
CREATE INDEX SINSERTTEXTKEYWORDFKIDSGENER40795 
      ON S_INSERTTEXTKEYWORD ( 
           FK_ID_S_GENERALSTATEMENT ) ;
 
 
/* Index for Relationship - 'S_STORAGEDISPOSALSTATEMENT(has [0:m] ) S_INSERTTEXTKEYWORD' */
CREATE INDEX SINSERTTEXTKEYWORDFKIDSSTORA40799 
      ON S_INSERTTEXTKEYWORD ( 
           FK_ID_S_STORAGEDISPOSALSTATEMENT ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(has [0:m] ) S_INSERTTEXTKEYWORD' */
CREATE INDEX SINSERTTEXTKEYWORDFKIDSDIREC40799 
      ON S_INSERTTEXTKEYWORD ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'S_USAGE(has [0:m] ) S_INSERTTEXTKEYWORD' */
CREATE INDEX SINSERTTEXTKEYWORDFKIDSUSAGE40800 
      ON S_INSERTTEXTKEYWORD ( 
           FK_ID_S_USAGE ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSECTION(has title [0:m] ) S_INSERTTEXTKEYWORD' */
CREATE INDEX SINSERTTEXTKEYWORDFKIDSMARKE40800 
      ON S_INSERTTEXTKEYWORD ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has [0:m] ) S_INSERTTEXTKEYWORD' */
CREATE INDEX SINSERTTEXTKEYWORDFKIDSMARKE40800 
      ON S_INSERTTEXTKEYWORD ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESTATEMENT(has [0:m] ) S_INSERTTEXTKEYWORD' */
CREATE INDEX SINSERTTEXTKEYWORDFKIDSDIREC40801 
      ON S_INSERTTEXTKEYWORD ( 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Main key for Entity - S_MarketingSection */
CREATE UNIQUE INDEX US_MARKETINGSECTION_ID_4073620 
      ON S_MARKETINGSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSECTION(has next version [0:m] ) S_MARKETINGSECTION' */
CREATE INDEX SMARKETINGSECTIONFKIDSMARKET40806 
      ON S_MARKETINGSECTION ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSECTION(has [0:m] ) S_MARKETINGSECTION' */
CREATE INDEX SMARKETINGSECTIONFKIDMMARKET40814 
      ON S_MARKETINGSECTION ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_MARKETINGSECTION' */
CREATE INDEX SMARKETINGSECTIONFKIDSUBREGL40815 
      ON S_MARKETINGSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_MarketingStatement */
CREATE UNIQUE INDEX US_MARKETINGSTATEMENT_ID_4073720 
      ON S_MARKETINGSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has next version [0:m] ) S_MARKETINGSTATEMENT' */
CREATE INDEX SMARKETINGSTATEMENTFKIDSMARK40806 
      ON S_MARKETINGSTATEMENT ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSECTION(has [0:m] ) S_MARKETINGSTATEMENT' */
CREATE INDEX SMARKETINGSTATEMENTFKIDSMARK40808 
      ON S_MARKETINGSTATEMENT ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has [0:m] ) S_MARKETINGSTATEMENT' */
CREATE INDEX SMARKETINGSTATEMENTFKIDMMARK40814 
      ON S_MARKETINGSTATEMENT ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
 
/* Main key for Entity - S_MetaTable */
CREATE UNIQUE INDEX US_METATABLE_ID_4073800 
      ON S_METATABLE ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_METATABLE' */
CREATE INDEX SMETATABLEFKIDSUBREGLABELCON40794 
      ON S_METATABLE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_Rows */
CREATE UNIQUE INDEX US_ROWS_ID_4073970 
      ON S_ROWS ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_METATABLE(has [0:m] ) S_ROWS' */
CREATE INDEX S_ROWS_FK_ID_S_METATABLE_4079430 
      ON S_ROWS ( 
           FK_ID_S_METATABLE ) ;
 
 
/* Main key for Entity - S_StorageDisposalSection */
CREATE UNIQUE INDEX US_STORAGEDISPOSALSECTION_ID40741 
      ON S_STORAGEDISPOSALSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has [0:m] ) S_STORAGEDISPOSALSECTION' */
CREATE INDEX SSTORAGEDISPOSALSECTIONFKIDM40812 
      ON S_STORAGEDISPOSALSECTION ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_STORAGEDISPOSALSECTION' */
CREATE INDEX SSTORAGEDISPOSALSECTIONFKIDS40815 
      ON S_STORAGEDISPOSALSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_StorageDisposalStatement */
CREATE UNIQUE INDEX USSTORAGEDISPOSALSTATEMENTID40742 
      ON S_STORAGEDISPOSALSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_STORAGEDISPOSALSTATEMENT(has sub [0:m] ) S_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SSTORAGEDISPOSALSTATEMENTSUB40795 
      ON S_STORAGEDISPOSALSTATEMENT ( 
           SUBID_S_STORAGEDISPOSALSTATEMENT ) ;
 
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has [0:m] ) S_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SSTORAGEDISPOSALSTATEMENTFKI40811 
      ON S_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_M_STORAGEDISPOSALSTATEMENT ) ;
 
 
/* Index for Relationship - 'S_STORAGEDISPOSALSECTION(has [0:m] ) S_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SSTORAGEDISPOSALSTATEMENTFKI40815 
      ON S_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_S_STORAGEDISPOSALSECTION ) ;
 
 
/* Main key for Entity - S_Usage */
CREATE UNIQUE INDEX US_USAGE_ID_4074420 
      ON S_USAGE ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_USAGE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_S_USAGE_4079750 
      ON S_USAGE ( 
           FK_ID_S_USAGE ) ;
 
 
/* Index for Relationship - 'S_USAGEFOOTNOTE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_SUSAGEFOOTNOTE40803 
      ON S_USAGE ( 
           FK_ID_S_USAGEFOOTNOTE ) ;
 
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_M_USAGE_4081390 
      ON S_USAGE ( 
           FK_ID_M_USAGE ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has (delete) [0:m] ) S_USAGE' */
CREATE INDEX SUSAGEFKIDSUBREGLABELCONTENT40815 
      ON S_USAGE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Index for Relationship - 'S_USAGETYPE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_S_USAGETYPE_4081730 
      ON S_USAGE ( 
           FK_ID_S_USAGETYPE ) ;
 
 
/* Main key for Entity - S_UsageFootnote */
CREATE UNIQUE INDEX US_USAGEFOOTNOTE_ID_4074520 
      ON S_USAGEFOOTNOTE ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_USAGEFOOTNOTE' */
CREATE INDEX SUSAGEFOOTNOTEFKIDSUBREGLABE40803 
      ON S_USAGEFOOTNOTE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_UsageOrdering */
CREATE UNIQUE INDEX US_USAGEORDERING_ID_4074580 
      ON S_USAGEORDERING ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX SUSAGEORDERINGFKIDSDIRECTION40794 
      ON S_USAGEORDERING ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX SUSAGEORDERINGFKIDSMARKETING40806 
      ON S_USAGEORDERING ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESTATEMENT(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX SUSAGEORDERINGFKIDSDIRECTION40812 
      ON S_USAGEORDERING ( 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Index for Relationship - 'S_USAGE(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX S_USAGEORDERING_FK_ID_SUSAGE40813 
      ON S_USAGEORDERING ( 
           FK_ID_S_USAGE ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSECTION(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX SUSAGEORDERINGFKIDSMARKETING40817 
      ON S_USAGEORDERING ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
 
/* Main key for Entity - S_UsageType */
CREATE UNIQUE INDEX US_USAGETYPE_ID_4074620 
      ON S_USAGETYPE ( 
           ID ) ;
 
 
/* Index for Relationship - 'M_USAGETYPE(has [0:m] ) S_USAGETYPE' */
CREATE INDEX S_USAGETYPE_FK_ID_MUSAGETYPE40814 
      ON S_USAGETYPE ( 
           FK_ID_M_USAGETYPE ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_USAGETYPE' */
CREATE INDEX SUSAGETYPEFKIDSUBREGLABELCON40817 
      ON S_USAGETYPE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - S_VersionChangeMessage */
CREATE UNIQUE INDEX US_VERSIONCHANGEMESSAGE_ID_407468 
      ON S_VERSIONCHANGEMESSAGE ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_VERSIONCHANGEMESSAGE' */
CREATE INDEX SVERSIONCHANGEMESSAGEFKIDSUB40797 
      ON S_VERSIONCHANGEMESSAGE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - SPLD_DilutionChartEntry */
CREATE UNIQUE INDEX USPLD_DILUTIONCHARTENTRY_ID_40747 
      ON SPLD_DILUTIONCHARTENTRY ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_DILUTIONGROUP(has [0:m] ) SPLD_DILUTIONCHARTENTRY' */
CREATE INDEX SPLDDILUTIONCHARTENTRYFKIDSP40793 
      ON SPLD_DILUTIONCHARTENTRY ( 
           FK_ID_SPLD_DILUTIONGROUP ) ;
 
 
/* Main key for Entity - SPLD_DilutionGroup */
CREATE UNIQUE INDEX USPLD_DILUTIONGROUP_ID_4074790 
      ON SPLD_DILUTIONGROUP ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_DILUTIONGROUP' */
CREATE INDEX SPLDDILUTIONGROUPFKIDSUBREGP40793 
      ON SPLD_DILUTIONGROUP ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'S_DILUTIONGROUP(has [0:m] ) SPLD_DILUTIONGROUP' */
CREATE INDEX SPLDDILUTIONGROUPFKIDSDILUTI40800 
      ON SPLD_DILUTIONGROUP ( 
           FK_ID_S_DILUTIONGROUP ) ;
 
 
/* Main key for Entity - SPLD_DilutionGroupItem */
CREATE UNIQUE INDEX USPLD_DILUTIONGROUPITEM_ID_407491 
      ON SPLD_DILUTIONGROUPITEM ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_DILUTIONGROUP(has [0:m] ) SPLD_DILUTIONGROUPITEM' */
CREATE INDEX SPLDDILUTIONGROUPITEMFKIDSPL40793 
      ON SPLD_DILUTIONGROUPITEM ( 
           FK_ID_SPLD_DILUTIONGROUP ) ;
 
 
/* Main key for Entity - SPLD_DirectionsForUseCategory */
CREATE UNIQUE INDEX USPLDDIRECTIONSFORUSECATEGOR40749 
      ON SPLD_DIRECTIONSFORUSECATEGORY ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_DIRECTIONSFORUSECATEGORY' */
CREATE INDEX SPLDDIRECTIONSFORUSECATEGORY40796 
      ON SPLD_DIRECTIONSFORUSECATEGORY ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSECATEGORY(has [0:m] ) SPLD_DIRECTIONSFORUSECATEGORY' */
CREATE INDEX SPLDDIRECTIONSFORUSECATEGORY40796 
      ON SPLD_DIRECTIONSFORUSECATEGORY ( 
           FK_ID_S_DIRECTIONSFORUSECATEGORY ) ;
 
 
/* Main key for Entity - SPLD_DirectionsForUseSection */
CREATE UNIQUE INDEX USPLDDIRECTIONSFORUSESECTION40751 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESECTION(exclusiveTo [0:1] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIONX40795 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           XORID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSECATEGORY(has [0:m] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIONF40796 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           FK_ID_SPLD_DIRECTIONSFORUSECATEG ) ;
 
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIONF40807 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(has [0:m] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIONF40813 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
 
/* Main key for Entity - SPLD_DirectionsForUseStatement */
CREATE UNIQUE INDEX USPLDDIRECTIONSFORUSESTATEME40752 
      ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESTATEMENT(has sub [0:m] ) SPLD_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SPLDDIRECTIONSFORUSESTATEMEN40795 
      ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           SUBID_SPLDDIRECTIONSFORUSESTATEM ) ;
 
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESECTION(has [0:m] ) SPLD_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SPLDDIRECTIONSFORUSESTATEMEN40809 
      ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESTATEMENT(has [0:m] ) SPLD_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SPLDDIRECTIONSFORUSESTATEMEN40811 
      ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN ) ;
 
 
/* Main key for Entity - SPLD_GeneralSection */
CREATE UNIQUE INDEX USPLD_GENERALSECTION_ID_4075390 
      ON SPLD_GENERALSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_GENERALSECTION' */
CREATE INDEX SPLDGENERALSECTIONFKIDSUBREG40808 
      ON SPLD_GENERALSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'S_GENERALSECTION(has [0:m] ) SPLD_GENERALSECTION' */
CREATE INDEX SPLDGENERALSECTIONFKIDSGENER40811 
      ON SPLD_GENERALSECTION ( 
           FK_ID_S_GENERALSECTION ) ;
 
 
/* Main key for Entity - SPLD_GeneralStatement */
CREATE UNIQUE INDEX USPLD_GENERALSTATEMENT_ID_4075560 
      ON SPLD_GENERALSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_GENERALSUBSECTION(has [0:m] ) SPLD_GENERALSTATEMENT' */
CREATE INDEX SPLDGENERALSTATEMENTFKIDSPLD40794 
      ON SPLD_GENERALSTATEMENT ( 
           FK_ID_SPLD_GENERALSUBSECTION ) ;
 
 
/* Index for Relationship - 'SPLD_GENERALSECTION(has [0:m] ) SPLD_GENERALSTATEMENT' */
CREATE INDEX SPLDGENERALSTATEMENTFKIDSPLD40794 
      ON SPLD_GENERALSTATEMENT ( 
           FK_ID_SPLD_GENERALSECTION ) ;
 
 
/* Index for Relationship - 'S_GENERALSTATEMENT(has [0:m] ) SPLD_GENERALSTATEMENT' */
CREATE INDEX SPLDGENERALSTATEMENTFKIDSGEN40810 
      ON SPLD_GENERALSTATEMENT ( 
           FK_ID_S_GENERALSTATEMENT ) ;
 
 
/* Main key for Entity - SPLD_GeneralSubSection */
CREATE UNIQUE INDEX USPLD_GENERALSUBSECTION_ID_407566 
      ON SPLD_GENERALSUBSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_GENERALSECTION(has [0:m] ) SPLD_GENERALSUBSECTION' */
CREATE INDEX SPLDGENERALSUBSECTIONFKIDSPL40793 
      ON SPLD_GENERALSUBSECTION ( 
           FK_ID_SPLD_GENERALSECTION ) ;
 
 
/* Index for Relationship - 'S_GENERALSUBSECTION(has [0:m] ) SPLD_GENERALSUBSECTION' */
CREATE INDEX SPLDGENERALSUBSECTIONFKIDSGE40794 
      ON SPLD_GENERALSUBSECTION ( 
           FK_ID_S_GENERALSUBSECTION ) ;
 
 
/* Main key for Entity - SPLD_HumanHazardSection */
CREATE UNIQUE INDEX USPLD_HUMANHAZARDSECTION_ID_40757 
      ON SPLD_HUMANHAZARDSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_HUMANHAZARDSECTION' */
CREATE INDEX SPLDHUMANHAZARDSECTIONFKIDSU40808 
      ON SPLD_HUMANHAZARDSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'S_HUMANHAZARDSECTION(has [0:m] ) SPLD_HUMANHAZARDSECTION' */
CREATE INDEX SPLDHUMANHAZARDSECTIONFKIDSH40813 
      ON SPLD_HUMANHAZARDSECTION ( 
           FK_ID_S_HUMANHAZARDSECTION ) ;
 
 
/* Main key for Entity - SPLD_IngredientsSection */
CREATE UNIQUE INDEX USPLD_INGREDIENTSSECTION_ID_40760 
      ON SPLD_INGREDIENTSSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_INGREDIENTSSECTION' */
CREATE INDEX SPLDINGREDIENTSSECTIONFKIDSP40807 
      ON SPLD_INGREDIENTSSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_INGREDIENTSSECTION' */
CREATE INDEX SPLDINGREDIENTSSECTIONFKIDSU40808 
      ON SPLD_INGREDIENTSSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'S_INGREDIENTSSECTION(has [0:m] ) SPLD_INGREDIENTSSECTION' */
CREATE INDEX SPLDINGREDIENTSSECTIONFKIDSI40816 
      ON SPLD_INGREDIENTSSECTION ( 
           FK_ID_S_INGREDIENTSSECTION ) ;
 
 
/* Main key for Entity - SPLD_IngredientsStatement */
CREATE UNIQUE INDEX USPLD_INGREDIENTSSTATEMENTID40761 
      ON SPLD_INGREDIENTSSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_INGREDIENTSSECTION(has [0:m] ) SPLD_INGREDIENTSSTATEMENT' */
CREATE INDEX SPLDINGREDIENTSSTATEMENTFKID40809 
      ON SPLD_INGREDIENTSSTATEMENT ( 
           FK_ID_SPLD_INGREDIENTSSECTION ) ;
 
 
/* Index for Relationship - 'S_INGREDIENTSSTATEMENT(has [0:m] ) SPLD_INGREDIENTSSTATEMENT' */
CREATE INDEX SPLDINGREDIENTSSTATEMENTFKID40816 
      ON SPLD_INGREDIENTSSTATEMENT ( 
           FK_ID_S_INGREDIENTSSTATEMENT ) ;
 
 
/* Main key for Entity - SPLD_InsertText */
CREATE UNIQUE INDEX USPLD_INSERTTEXT_ID_4076200 
      ON SPLD_INSERTTEXT ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_INSERTTEXTKEYWORD(has [0:m] ) SPLD_INSERTTEXT' */
CREATE INDEX SPLDINSERTTEXTFKIDSPLDINSERT40794 
      ON SPLD_INSERTTEXT ( 
           FK_ID_SPLD_INSERTTEXTKEYWORD ) ;
 
 
/* Main key for Entity - SPLD_InsertTextKeyword */
CREATE UNIQUE INDEX USPLD_INSERTTEXTKEYWORD_ID_407624 
      ON SPLD_INSERTTEXTKEYWORD ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_STORAGEDISPOSALSTATEMENT(has [0:m] ) SPLD_INSERTTEXTKEYWORD' */
CREATE INDEX SPLDINSERTTEXTKEYWORDFKIDSPL40799 
      ON SPLD_INSERTTEXTKEYWORD ( 
           FK_ID_SPLD_STORAGEDISPOSALSTATEM ) ;
 
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESTATEMENT(has [0:m] ) SPLD_INSERTTEXTKEYWORD' */
CREATE INDEX SPLDINSERTTEXTKEYWORDFKIDSPL40799 
      ON SPLD_INSERTTEXTKEYWORD ( 
           FK_ID_SPLDDIRECTIONSFORUSESTATEM ) ;
 
 
/* Index for Relationship - 'SPLD_MARKETINGSTATEMENT(has [0:m] ) SPLD_INSERTTEXTKEYWORD' */
CREATE INDEX SPLDINSERTTEXTKEYWORDFKIDSPL40799 
      ON SPLD_INSERTTEXTKEYWORD ( 
           FK_ID_SPLD_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESECTION(has [0:m] ) SPLD_INSERTTEXTKEYWORD' */
CREATE INDEX SPLDINSERTTEXTKEYWORDFKIDSPL40799 
      ON SPLD_INSERTTEXTKEYWORD ( 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
 
/* Index for Relationship - 'SPLD_MARKETINGSECTION(has [0:m] ) SPLD_INSERTTEXTKEYWORD' */
CREATE INDEX SPLDINSERTTEXTKEYWORDFKIDSPL40799 
      ON SPLD_INSERTTEXTKEYWORD ( 
           FK_ID_SPLD_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) SPLD_INSERTTEXTKEYWORD' */
CREATE INDEX SPLDINSERTTEXTKEYWORDFKIDSPL40799 
      ON SPLD_INSERTTEXTKEYWORD ( 
           FK_ID_SPLD_USAGE ) ;
 
 
/* Index for Relationship - 'SPLD_GENERALSTATEMENT(has [0:m] ) SPLD_INSERTTEXTKEYWORD' */
CREATE INDEX SPLDINSERTTEXTKEYWORDFKIDSPL40800 
      ON SPLD_INSERTTEXTKEYWORD ( 
           FK_ID_SPLD_GENERALSTATEMENT ) ;
 
 
/* Main key for Entity - SPLD_LLD */
CREATE UNIQUE INDEX USPLD_LLD_ID_4076290 
      ON SPLD_LLD ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_LLD' */
CREATE INDEX SPLDLLDFKIDSUBREGPHYSICALLAB40809 
      ON SPLD_LLD ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Main key for Entity - SPLD_MarketingSection */
CREATE UNIQUE INDEX USPLD_MARKETINGSECTION_ID_4076490 
      ON SPLD_MARKETINGSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSECTION(has [0:m] ) SPLD_MARKETINGSECTION' */
CREATE INDEX SPLDMARKETINGSECTIONFKIDSMAR40806 
      ON SPLD_MARKETINGSECTION ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_MARKETINGSECTION' */
CREATE INDEX SPLDMARKETINGSECTIONFKIDSPLD40807 
      ON SPLD_MARKETINGSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_MARKETINGSECTION' */
CREATE INDEX SPLDMARKETINGSECTIONFKIDSUBR40808 
      ON SPLD_MARKETINGSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Main key for Entity - SPLD_MarketingStatement */
CREATE UNIQUE INDEX USPLD_MARKETINGSTATEMENT_ID_40765 
      ON SPLD_MARKETINGSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has [0:m] ) SPLD_MARKETINGSTATEMENT' */
CREATE INDEX SPLDMARKETINGSTATEMENTFKIDSM40807 
      ON SPLD_MARKETINGSTATEMENT ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'SPLD_MARKETINGSECTION(has [0:m] ) SPLD_MARKETINGSTATEMENT' */
CREATE INDEX SPLDMARKETINGSTATEMENTFKIDSP40807 
      ON SPLD_MARKETINGSTATEMENT ( 
           FK_ID_SPLD_MARKETINGSECTION ) ;
 
 
/* Main key for Entity - SPLD_MetaTable */
CREATE UNIQUE INDEX USPLD_METATABLE_ID_4076690 
      ON SPLD_METATABLE ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_METATABLE' */
CREATE INDEX SPLDMETATABLEFKIDSUBREGPHYSI40793 
      ON SPLD_METATABLE ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Main key for Entity - SPLD_Rows */
CREATE UNIQUE INDEX USPLD_ROWS_ID_4076850 
      ON SPLD_ROWS ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_METATABLE(has [0:m] ) SPLD_ROWS' */
CREATE INDEX SPLD_ROWS_FK_IDSPLDMETATABLE40793 
      ON SPLD_ROWS ( 
           FK_ID_SPLD_METATABLE ) ;
 
 
/* Main key for Entity - SPLD_Section */
CREATE UNIQUE INDEX USPLD_SECTION_ID_4076980 
      ON SPLD_SECTION ( 
           ID ) ;
 
 
/* Main key for Entity - SPLD_StorageDisposalSection */
CREATE UNIQUE INDEX USPLDSTORAGEDISPOSALSECTIONI40771 
      ON SPLD_STORAGEDISPOSALSECTION ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_STORAGEDISPOSALSECTION' */
CREATE INDEX SPLDSTORAGEDISPOSALSECTIONFK40807 
      ON SPLD_STORAGEDISPOSALSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_STORAGEDISPOSALSECTION' */
CREATE INDEX SPLDSTORAGEDISPOSALSECTIONFK40808 
      ON SPLD_STORAGEDISPOSALSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'S_STORAGEDISPOSALSECTION(has [0:m] ) SPLD_STORAGEDISPOSALSECTION' */
CREATE INDEX SPLDSTORAGEDISPOSALSECTIONFK40812 
      ON SPLD_STORAGEDISPOSALSECTION ( 
           FK_ID_S_STORAGEDISPOSALSECTION ) ;
 
 
/* Main key for Entity - SPLD_StorageDisposalStatement */
CREATE UNIQUE INDEX USPLDSTORAGEDISPOSALSTATEMEN40773 
      ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_STORAGEDISPOSALSTATEMENT(has sub [0:m] ) SPLD_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SPLDSTORAGEDISPOSALSTATEMENT40795 
      ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           SUBID_SPLD_STORAGEDISPOSALSTATEM ) ;
 
 
/* Index for Relationship - 'SPLD_STORAGEDISPOSALSECTION(has [0:m] ) SPLD_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SPLDSTORAGEDISPOSALSTATEMENT40809 
      ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_SPLD_STORAGEDISPOSALSECTIO ) ;
 
 
/* Index for Relationship - 'S_STORAGEDISPOSALSTATEMENT(has [0:m] ) SPLD_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SPLDSTORAGEDISPOSALSTATEMENT40811 
      ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_S_STORAGEDISPOSALSTATEMENT ) ;
 
 
/* Main key for Entity - SPLD_Usage */
CREATE UNIQUE INDEX USPLD_USAGE_ID_4077500 
      ON SPLD_USAGE ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has (delete) [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLDUSAGEFKIDSUBREGPHYSICALL40793 
      ON SPLD_USAGE ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLD_USAGE_FK_ID_SPLD_USAGE_40797 
      ON SPLD_USAGE ( 
           FK_ID_SPLD_USAGE ) ;
 
 
/* Index for Relationship - 'SPLD_USAGEFOOTNOTE(has [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLDUSAGEFKIDSPLDUSAGEFOOTNO40803 
      ON SPLD_USAGE ( 
           FK_ID_SPLD_USAGEFOOTNOTE ) ;
 
 
/* Index for Relationship - 'S_USAGE(has [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLD_USAGE_FK_ID_S_USAGE_4080890 
      ON SPLD_USAGE ( 
           FK_ID_S_USAGE ) ;
 
 
/* Index for Relationship - 'SPLD_USAGETYPE(has [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLD_USAGE_FKIDSPLDUSAGETYPE40815 
      ON SPLD_USAGE ( 
           FK_ID_SPLD_USAGETYPE ) ;
 
 
/* Main key for Entity - SPLD_UsageFootnote */
CREATE UNIQUE INDEX USPLD_USAGEFOOTNOTE_ID_4077590 
      ON SPLD_USAGEFOOTNOTE ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_USAGEFOOTNOTE' */
CREATE INDEX SPLDUSAGEFOOTNOTEFKIDSUBREGP40803 
      ON SPLD_USAGEFOOTNOTE ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Main key for Entity - SPLD_UsageOrdering */
CREATE UNIQUE INDEX USPLD_USAGEORDERING_ID_4077640 
      ON SPLD_USAGEORDERING ( 
           ID ) ;
 
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDUSA40805 
      ON SPLD_USAGEORDERING ( 
           FK_ID_SPLD_USAGE ) ;
 
 
/* Index for Relationship - 'SPLD_MARKETINGSTATEMENT(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDMAR40807 
      ON SPLD_USAGEORDERING ( 
           FK_ID_SPLD_MARKETINGSTATEMENT ) ;
 
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESECTION(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDDIR40809 
      ON SPLD_USAGEORDERING ( 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESTATEMENT(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDDIR40812 
      ON SPLD_USAGEORDERING ( 
           FK_ID_SPLDDIRECTIONSFORUSESTATEM ) ;
 
 
/* Main key for Entity - SPLD_UsageType */
CREATE UNIQUE INDEX USPLD_USAGETYPE_ID_4077680 
      ON SPLD_USAGETYPE ( 
           ID ) ;
 
 
/* Index for Relationship - 'S_USAGETYPE(has [0:m] ) SPLD_USAGETYPE' */
CREATE INDEX SPLD_USAGETYPEFKIDSUSAGETYPE40814 
      ON SPLD_USAGETYPE ( 
           FK_ID_S_USAGETYPE ) ;
 
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_USAGETYPE' */
CREATE INDEX SPLDUSAGETYPEFKIDSUBREGPHYSI40815 
      ON SPLD_USAGETYPE ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
 
/* Main key for Entity - Subregistrant */
CREATE UNIQUE INDEX USUBREGISTRANT_ID_4077730 
      ON SUBREGISTRANT ( 
           ID ) ;
 
 
/* Index for Relationship - 'ORGANIZATION(has [0:1] ) SUBREGISTRANT' */
CREATE INDEX SUBREGISTRANTFKIDORGANIZATIO40806 
      ON SUBREGISTRANT ( 
           FK_ID_ORGANIZATION ) ;
 
 
/* Main key for Entity - SubregLabelContent */
CREATE UNIQUE INDEX USUBREGLABELCONTENT_ID_4077770 
      ON SUBREGLABELCONTENT ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has next version [0:m] ) SUBREGLABELCONTENT' */
CREATE INDEX SUBREGLABELCONTENTFKIDSUBREG40808 
      ON SUBREGLABELCONTENT ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Index for Relationship - 'SUBREGPRODUCT(has [0:m] ) SUBREGLABELCONTENT' */
CREATE INDEX SUBREGLABELCONTENTFKIDSUBREG40818 
      ON SUBREGLABELCONTENT ( 
           FK_ID_SUBREGPRODUCT ) ;
 
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) SUBREGLABELCONTENT' */
CREATE INDEX SUBREGLABELCONTENTFKIDMASTER40818 
      ON SUBREGLABELCONTENT ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
 
/* Main key for Entity - SubregPhysicalLabelDef */
CREATE UNIQUE INDEX USUBREGPHYSICALLABELDEF_ID_407802 
      ON SUBREGPHYSICALLABELDEF ( 
           ID ) ;
 
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) SUBREGPHYSICALLABELDEF' */
CREATE INDEX SUBREGPHYSICALLABELDEFFKIDSU40808 
      ON SUBREGPHYSICALLABELDEF ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
 
/* Main key for Entity - SubregProduct */
CREATE UNIQUE INDEX USUBREGPRODUCT_ID_4078090 
      ON SUBREGPRODUCT ( 
           ID ) ;
 
 
/* Index for Relationship - 'MASTERPRODUCT(has [0:m] ) SUBREGPRODUCT' */
CREATE INDEX SUBREGPRODUCTFKIDMASTERPRODU40818 
      ON SUBREGPRODUCT ( 
           FK_ID_MASTERPRODUCT ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) SUBREGPRODUCT' */
CREATE INDEX SUBREGPRODUCTFKIDSUBREGISTRA40818 
      ON SUBREGPRODUCT ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
 
 
/* Main key for Entity - User */
CREATE UNIQUE INDEX Uz_USER_ID_4078260 
      ON z_USER ( 
           ID ) ;
/* Main key for Entity - User */
CREATE INDEX z_USER_USERNAME_4078270 
      ON z_USER ( 
           USERNAME ) ;
 
 
/* Index for Relationship - 'PERSON(for [0:1] ) z_USER' */
CREATE INDEX z_USER_FK_ID_PERSON_4081800 
      ON z_USER ( 
           FK_ID_PERSON ) ;
 
 
/* Main key for Entity - ZeidonGenkeyTable */
CREATE UNIQUE INDEX UZEIDONGENKEYTABLE_TABLENAME40784 
      ON ZEIDONGENKEYTABLE ( 
           TABLENAME ) ;
 
 
/* Main key for Entity - ZeidonLocking */
CREATE UNIQUE INDEX UZEIDONLOCKING_LOCKINGKEY_4078460 
      ON ZEIDONLOCKING ( 
           LOD_NAME, 
           KEYVALUE ) ;
 
 
CREATE UNIQUE INDEX UMMSUSAGEDRVSSDIRECTIONSFORU40801 
      ON MMSUSAGEDRVSSDIRECTIONSFORUSESECT ( 
           FK_ID_S_DIRECTIONSFORUSESECTION, 
           FK_ID_S_USAGE ) ;
 
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(is driven by [0:m] ) MMSUSAGEDRVSSDIRECTIONSFORUSESECT' */
CREATE INDEX MMSUSAGEDRVSSDIRECTIONSFORUS40801 
      ON MMSUSAGEDRVSSDIRECTIONSFORUSESECT ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'S_USAGE(drives [0:m] ) MMSUSAGEDRVSSDIRECTIONSFORUSESECT' */
CREATE INDEX MMSUSAGEDRVSSDIRECTIONSFORUS40801 
      ON MMSUSAGEDRVSSDIRECTIONSFORUSESECT ( 
           FK_ID_S_USAGE ) ;
 
 
CREATE UNIQUE INDEX UMMMUSAGEDRVSMDIRECTIONSFORU40804 
      ON MMMUSAGEDRVSMDIRECTIONSFORUSESECT ( 
           FK_ID_M_DIRECTIONSFORUSESECTION, 
           FK_ID_M_USAGE ) ;
 
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(is driven by [0:m] ) MMMUSAGEDRVSMDIRECTIONSFORUSESECT' */
CREATE INDEX MMMUSAGEDRVSMDIRECTIONSFORUS40804 
      ON MMMUSAGEDRVSMDIRECTIONSFORUSESECT ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
 
/* Index for Relationship - 'M_USAGE(drives [0:m] ) MMMUSAGEDRVSMDIRECTIONSFORUSESECT' */
CREATE INDEX MMMUSAGEDRVSMDIRECTIONSFORUS40804 
      ON MMMUSAGEDRVSMDIRECTIONSFORUSESECT ( 
           FK_ID_M_USAGE ) ;
 
 
CREATE UNIQUE INDEX UMMMASTERPRODUCTFORSUBREGIST40805 
      ON MM_MASTERPRODUCT_FOR_SUBREGISTRAN ( 
           FK_ID_SUBREGISTRANT, 
           FK_ID_MASTERPRODUCT ) ;
 
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) MM_MASTERPRODUCT_FOR_SUBREGISTRAN' */
CREATE INDEX MMMASTERPRODUCTFORSUBREGISTR40805 
      ON MM_MASTERPRODUCT_FOR_SUBREGISTRAN ( 
           FK_ID_SUBREGISTRANT ) ;
 
 
/* Index for Relationship - 'MASTERPRODUCT(for [0:m] ) MM_MASTERPRODUCT_FOR_SUBREGISTRAN' */
CREATE INDEX MMMASTERPRODUCTFORSUBREGISTR40806 
      ON MM_MASTERPRODUCT_FOR_SUBREGISTRAN ( 
           FK_ID_MASTERPRODUCT ) ;
 
 
CREATE UNIQUE INDEX UMMSPLDDIRECTIONSFORUSESECTI40809 
      ON MMSPLDDIRECTIONSFORUSESECTIONSDRV ( 
           FK_ID_SPLD_USAGE, 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
 
/* Index for Relationship - 'SPLD_USAGE(drives [0:m] ) MMSPLDDIRECTIONSFORUSESECTIONSDRV' */
CREATE INDEX MMSPLDDIRECTIONSFORUSESECTIO40809 
      ON MMSPLDDIRECTIONSFORUSESECTIONSDRV ( 
           FK_ID_SPLD_USAGE ) ;
 
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESECTION(is driven by [0:m] ) MMSPLDDIRECTIONSFORUSESECTIONSDRV' */
CREATE INDEX MMSPLDDIRECTIONSFORUSESECTIO40809 
      ON MMSPLDDIRECTIONSFORUSESECTIONSDRV ( 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
 
CREATE UNIQUE INDEX UMMSPLDMARKETINGSECTIONFRSPL40810 
      ON MM_SPLD_MARKETINGSECTIONFRSPLDUSA ( 
           FK_ID_SPLD_USAGE, 
           FK_ID_SPLD_MARKETINGSECTION ) ;
 
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) MM_SPLD_MARKETINGSECTIONFRSPLDUSA' */
CREATE INDEX MMSPLDMARKETINGSECTIONFRSPLD40810 
      ON MM_SPLD_MARKETINGSECTIONFRSPLDUSA ( 
           FK_ID_SPLD_USAGE ) ;
 
 
/* Index for Relationship - 'SPLD_MARKETINGSECTION(for [0:m] ) MM_SPLD_MARKETINGSECTIONFRSPLDUSA' */
CREATE INDEX MMSPLDMARKETINGSECTIONFRSPLD40810 
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
GRANT ALL ON FONT TO PUBLIC 
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
GRANT ALL ON M_TOC TO PUBLIC 
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
GRANT ALL ON S_DILUTIONCHARTENTRY TO PUBLIC 
GRANT ALL ON S_DILUTIONGROUP TO PUBLIC 
GRANT ALL ON S_DILUTIONGROUPITEM TO PUBLIC 
GRANT ALL ON S_DIRECTIONSFORUSECATEGORY TO PUBLIC 
GRANT ALL ON S_DIRECTIONSFORUSESECTION TO PUBLIC 
GRANT ALL ON S_DIRECTIONSFORUSESTATEMENT TO PUBLIC 
GRANT ALL ON S_GENERALSECTION TO PUBLIC 
GRANT ALL ON S_GENERALSTATEMENT TO PUBLIC 
GRANT ALL ON S_GENERALSUBSECTION TO PUBLIC 
GRANT ALL ON S_HUMANHAZARDSECTION TO PUBLIC 
GRANT ALL ON S_INGREDIENTSSECTION TO PUBLIC 
GRANT ALL ON S_INGREDIENTSSTATEMENT TO PUBLIC 
GRANT ALL ON S_INSERTTEXT TO PUBLIC 
GRANT ALL ON S_INSERTTEXTKEYWORD TO PUBLIC 
GRANT ALL ON S_MARKETINGSECTION TO PUBLIC 
GRANT ALL ON S_MARKETINGSTATEMENT TO PUBLIC 
GRANT ALL ON S_METATABLE TO PUBLIC 
GRANT ALL ON S_ROWS TO PUBLIC 
GRANT ALL ON S_STORAGEDISPOSALSECTION TO PUBLIC 
GRANT ALL ON S_STORAGEDISPOSALSTATEMENT TO PUBLIC 
GRANT ALL ON S_USAGE TO PUBLIC 
GRANT ALL ON S_USAGEFOOTNOTE TO PUBLIC 
GRANT ALL ON S_USAGEORDERING TO PUBLIC 
GRANT ALL ON S_USAGETYPE TO PUBLIC 
GRANT ALL ON S_VERSIONCHANGEMESSAGE TO PUBLIC 
GRANT ALL ON SPLD_DILUTIONCHARTENTRY TO PUBLIC 
GRANT ALL ON SPLD_DILUTIONGROUP TO PUBLIC 
GRANT ALL ON SPLD_DILUTIONGROUPITEM TO PUBLIC 
GRANT ALL ON SPLD_DIRECTIONSFORUSECATEGORY TO PUBLIC 
GRANT ALL ON SPLD_DIRECTIONSFORUSESECTION TO PUBLIC 
GRANT ALL ON SPLD_DIRECTIONSFORUSESTATEMENT TO PUBLIC 
GRANT ALL ON SPLD_GENERALSECTION TO PUBLIC 
GRANT ALL ON SPLD_GENERALSTATEMENT TO PUBLIC 
GRANT ALL ON SPLD_GENERALSUBSECTION TO PUBLIC 
GRANT ALL ON SPLD_HUMANHAZARDSECTION TO PUBLIC 
GRANT ALL ON SPLD_INGREDIENTSSECTION TO PUBLIC 
GRANT ALL ON SPLD_INGREDIENTSSTATEMENT TO PUBLIC 
GRANT ALL ON SPLD_INSERTTEXT TO PUBLIC 
GRANT ALL ON SPLD_INSERTTEXTKEYWORD TO PUBLIC 
GRANT ALL ON SPLD_LLD TO PUBLIC 
GRANT ALL ON SPLD_MARKETINGSECTION TO PUBLIC 
GRANT ALL ON SPLD_MARKETINGSTATEMENT TO PUBLIC 
GRANT ALL ON SPLD_METATABLE TO PUBLIC 
GRANT ALL ON SPLD_ROWS TO PUBLIC 
GRANT ALL ON SPLD_SECTION TO PUBLIC 
GRANT ALL ON SPLD_STORAGEDISPOSALSECTION TO PUBLIC 
GRANT ALL ON SPLD_STORAGEDISPOSALSTATEMENT TO PUBLIC 
GRANT ALL ON SPLD_USAGE TO PUBLIC 
GRANT ALL ON SPLD_USAGEFOOTNOTE TO PUBLIC 
GRANT ALL ON SPLD_USAGEORDERING TO PUBLIC 
GRANT ALL ON SPLD_USAGETYPE TO PUBLIC 
GRANT ALL ON SUBREGISTRANT TO PUBLIC 
GRANT ALL ON SUBREGLABELCONTENT TO PUBLIC 
GRANT ALL ON SUBREGPHYSICALLABELDEF TO PUBLIC 
GRANT ALL ON SUBREGPRODUCT TO PUBLIC 
GRANT ALL ON z_TEMP TO PUBLIC 
GRANT ALL ON z_USER TO PUBLIC 
GRANT ALL ON ZEIDONGENKEYTABLE TO PUBLIC 
GRANT ALL ON ZEIDONLOCKING TO PUBLIC 
GRANT ALL ON MMSUSAGEDRVSSDIRECTIONSFORUSESECT TO PUBLIC 
GRANT ALL ON MMMUSAGEDRVSMDIRECTIONSFORUSESECT TO PUBLIC 
GRANT ALL ON MM_MASTERPRODUCT_FOR_SUBREGISTRAN TO PUBLIC 
GRANT ALL ON MMSPLDDIRECTIONSFORUSESECTIONSDRV TO PUBLIC 
GRANT ALL ON MM_SPLD_MARKETINGSECTIONFRSPLDUSA TO PUBLIC 
COMMIT;
