/* Alter script for ePammsM -- MySQL ePamms database */
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
 
/* Main key for Entity - Address */
CREATE UNIQUE INDEX UADDRESS_ID_2146070 
      ON ADDRESS ( 
           ID ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_PHONE1_2146160 
      ON ADDRESS ( 
           PHONE ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_CITY_2146110 
      ON ADDRESS ( 
           CITY ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_STATE_2146120 
      ON ADDRESS ( 
           STATE ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_ZIPCODE_2146150 
      ON ADDRESS ( 
           ZIPCODE ) ;
 
/* Index for Relationship - 'ORGANIZATION(has mail [0:1] ) ADDRESS' */
CREATE INDEX ADDRESS_FK_ID_ORGANIZATION_215789 
      ON ADDRESS ( 
           FK_ID_ORGANIZATION ) ;
 
/* Index for Relationship - 'ORGANIZATION(has [0:1] ) ADDRESS' */
CREATE INDEX ADDRESS_FK_ID_ORGANIZATION0221579 
      ON ADDRESS ( 
           FK_ID_ORGANIZATION02 ) ;
 
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
 
/* Main key for Entity - Color */
CREATE UNIQUE INDEX UCOLOR_ID_2146330 
      ON COLOR ( 
           ID ) ;
/* Main key for Entity - Color */
CREATE INDEX COLOR_NAME_2146340 
      ON COLOR ( 
           NAME ) ;
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) COLOR' */
CREATE INDEX COLOR_FK_ID_SUBREGISTRANT_2157520 
      ON COLOR ( 
           FK_ID_SUBREGISTRANT ) ;
 
/* Entity - Domain */
CREATE TABLE z_DOMAIN ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 128 )     NOT NULL, 
           z_DESC                             varchar( 254 )     NULL    , 
           SYSTEMREQUIRED                     varchar( 1 )       NULL     ) ;
 
/* Main key for Entity - Domain */
CREATE UNIQUE INDEX Uz_DOMAIN_ID_2146440 
      ON z_DOMAIN ( 
           ID ) ;
 
/* Entity - DomainValue */
CREATE TABLE DOMAINVALUE ( 
           DOMAINVALUE_TOKEN                  int                NOT NULL, 
           INTERNALINTEGERVALUE               int                NULL    , 
           INTERNALSTRINGVALUE                varchar( 128 )     NULL    , 
           SYSTEMREQUIRED                     varchar( 1 )       NULL    , 
           EXTERNALDESCRIPTION                varchar( 128 )     NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_Z_DOMAIN                     int                NOT NULL ) ;
 
/* Main key for Entity - DomainValue */
CREATE UNIQUE INDEX UDOMAINVALUE_DOMAINVALUEID_214655 
      ON DOMAINVALUE ( 
           DOMAINVALUE_TOKEN ) ;
 
/* Index for Relationship - 'z_DOMAIN(has [0:m] ) DOMAINVALUE' */
CREATE INDEX DOMAINVALUE_FK_ID_Z_DOMAIN_215909 
      ON DOMAINVALUE ( 
           FK_ID_Z_DOMAIN ) ;
 
/* Entity - EPA_ApplicationType */
CREATE TABLE EPA_APPLICATIONTYPE ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NOT NULL, 
           AUTOSEQ                            int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY           int                NOT NULL ) ;
 
/* Main key for Entity - EPA_ApplicationType */
CREATE UNIQUE INDEX UEPA_APPLICATIONTYPE_ID_2146570 
      ON EPA_APPLICATIONTYPE ( 
           ID ) ;
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_APPLICATIONTYPE' */
CREATE INDEX EPAAPPLICATIONTYPEFKIDEPACHE21577 
      ON EPA_APPLICATIONTYPE ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
/* Entity - EPA_ChemicalFamily */
CREATE TABLE EPA_CHEMICALFAMILY ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NOT NULL, 
           DESCRIPTION                        varchar( 254 )     NULL    , 
           CHEMICALFAMILY                     varchar( 2 )       NOT NULL, 
           FK_ID_EPAMMS                       int                NOT NULL ) ;
 
/* Main key for Entity - EPA_ChemicalFamily */
CREATE UNIQUE INDEX UEPA_CHEMICALFAMILY_ID_2146610 
      ON EPA_CHEMICALFAMILY ( 
           ID ) ;
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) EPA_CHEMICALFAMILY' */
CREATE INDEX EPA_CHEMICALFAMILYFKIDEPAMMS21577 
      ON EPA_CHEMICALFAMILY ( 
           FK_ID_EPAMMS ) ;
 
/* Entity - EPA_Claim */
CREATE TABLE EPA_CLAIM ( 
           ID                                 int                NOT NULL, 
           CLAIMSCLASSIFICATION               varchar( 16 )      NULL    , 
           NAME                               varchar( 254 )     NOT NULL, 
           AUTOSEQ                            int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY           int                NOT NULL ) ;
 
/* Main key for Entity - EPA_Claim */
CREATE UNIQUE INDEX UEPA_CLAIM_ID_2146670 
      ON EPA_CLAIM ( 
           ID ) ;
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_CLAIM' */
CREATE INDEX EPACLAIMFKIDEPACHEMICALFAMIL21585 
      ON EPA_CLAIM ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
/* Entity - EPA_Location */
CREATE TABLE EPA_LOCATION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NOT NULL, 
           AUTOSEQ                            int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY           int                NOT NULL ) ;
 
/* Main key for Entity - EPA_Location */
CREATE UNIQUE INDEX UEPA_LOCATION_ID_2146720 
      ON EPA_LOCATION ( 
           ID ) ;
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_LOCATION' */
CREATE INDEX EPALOCATIONFKIDEPACHEMICALFA21589 
      ON EPA_LOCATION ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
/* Entity - EPA_StorageDisposal */
CREATE TABLE EPA_STORAGEDISPOSAL ( 
           ID                                 int                NOT NULL, 
           NAME                               longtext           NOT NULL, 
           DESCRIPTION                        longtext           NULL    , 
           z_VOLUME                           double             NULL    , 
           UNITS                              varchar( 254 )     NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY           int                NOT NULL ) ;
 
/* Main key for Entity - EPA_StorageDisposal */
CREATE UNIQUE INDEX UEPA_STORAGEDISPOSAL_ID_2146760 
      ON EPA_STORAGEDISPOSAL ( 
           ID ) ;
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_STORAGEDISPOSAL' */
CREATE INDEX EPASTORAGEDISPOSALFKIDEPACHE21589 
      ON EPA_STORAGEDISPOSAL ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
/* Entity - EPA_Surface */
CREATE TABLE EPA_SURFACE ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NOT NULL, 
           AUTOSEQ                            int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY           int                NOT NULL ) ;
 
/* Main key for Entity - EPA_Surface */
CREATE UNIQUE INDEX UEPA_SURFACE_ID_2146830 
      ON EPA_SURFACE ( 
           ID ) ;
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_SURFACE' */
CREATE INDEX EPASURFACEFKIDEPACHEMICALFAM21589 
      ON EPA_SURFACE ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
/* Entity - ePamms */
CREATE TABLE EPAMMS ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 128 )     NOT NULL ) ;
 
/* Main key for Entity - ePamms */
CREATE UNIQUE INDEX UEPAMMS_ID_2146870 
      ON EPAMMS ( 
           ID ) ;
 
/* Entity - Feedback */
CREATE TABLE FEEDBACK ( 
           ID                                 int                NOT NULL, 
           USERID                             varchar( 32 )      NOT NULL, 
           DIALOG                             varchar( 32 )      NULL    , 
           WINDOW                             varchar( 32 )      NULL    , 
           COMMENT                            longtext           NULL    , 
           FK_ID_ORGANIZATION                 int                NOT NULL ) ;
 
/* Main key for Entity - Feedback */
CREATE UNIQUE INDEX UFEEDBACK_ID_2146910 
      ON FEEDBACK ( 
           ID ) ;
 
/* Index for Relationship - 'ORGANIZATION(has [0:m] ) FEEDBACK' */
CREATE INDEX FEEDBACK_FK_ID_ORGANIZATION_21577 
      ON FEEDBACK ( 
           FK_ID_ORGANIZATION ) ;
 
/* Entity - FootnoteSymbol */
CREATE TABLE FOOTNOTESYMBOL ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             varchar( 254 )     NOT NULL, 
           SYMBOL                             varchar( 2 )       NOT NULL, 
           FK_ID_EPAMMS                       int                NOT NULL ) ;
 
/* Main key for Entity - FootnoteSymbol */
CREATE UNIQUE INDEX UFOOTNOTESYMBOL_ID_2146980 
      ON FOOTNOTESYMBOL ( 
           ID ) ;
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) FOOTNOTESYMBOL' */
CREATE INDEX FOOTNOTESYMBOL_FK_ID_EPAMMS_21571 
      ON FOOTNOTESYMBOL ( 
           FK_ID_EPAMMS ) ;
 
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
 
/* Main key for Entity - GraphicLabelControl */
CREATE UNIQUE INDEX UGRAPHICLABELCONTROL_ID_2147030 
      ON GRAPHICLABELCONTROL ( 
           ID ) ;
 
/* Index for Relationship - 'GRAPHICLABELDEFINITION(has [0:m] ) GRAPHICLABELCONTROL' */
CREATE INDEX GRAPHICLABELCONTROLFKIDGRAPH21590 
      ON GRAPHICLABELCONTROL ( 
           FK_ID_GRAPHICLABELDEFINITION ) ;
 
/* Entity - GraphicLabelDefinition */
CREATE TABLE GRAPHICLABELDEFINITION ( 
           ID                                 int                NOT NULL, 
           PRODUCTNAME                        varchar( 254 )     NULL    , 
           HEIGHT                             double             NULL    , 
           WIDTH                              double             NULL    , 
           NETCONTENTSTEXT                    varchar( 254 )     NULL    , 
           FK_ID_SUBREGISTRANT                int                NOT NULL, 
           FK_ID_SUBREGLABELCONTENT           int                NULL     ) ;
 
/* Main key for Entity - GraphicLabelDefinition */
CREATE UNIQUE INDEX UGRAPHICLABELDEFINITION_ID_214711 
      ON GRAPHICLABELDEFINITION ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) GRAPHICLABELDEFINITION' */
CREATE INDEX GRAPHICLABELDEFINITIONFKIDSU21589 
      ON GRAPHICLABELDEFINITION ( 
           FK_ID_SUBREGISTRANT ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) GRAPHICLABELDEFINITION' */
CREATE INDEX GRAPHICLABELDEFINITIONFKIDSU21590 
      ON GRAPHICLABELDEFINITION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Entity - Help */
CREATE TABLE HELP ( 
           ID                                 int                NOT NULL, 
           DIALOGWINDOW                       varchar( 128 )     NOT NULL, 
           MESSAGE                            longtext           NULL    , 
           FK_ID_EPAMMS                       int                NOT NULL ) ;
 
/* Main key for Entity - Help */
CREATE UNIQUE INDEX UHELP_ID_2147180 
      ON HELP ( 
           ID ) ;
/* Main key for Entity - Help */
CREATE INDEX HELP_NAME_2147190 
      ON HELP ( 
           DIALOGWINDOW ) ;
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) HELP' */
CREATE INDEX HELP_FK_ID_EPAMMS_2157400 
      ON HELP ( 
           FK_ID_EPAMMS ) ;
 
/* Entity - Keyword */
CREATE TABLE KEYWORD ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NOT NULL, 
           FK_ID_EPAMMS                       int                NULL     ) ;
 
/* Main key for Entity - Keyword */
CREATE UNIQUE INDEX UKEYWORD_ID_2147240 
      ON KEYWORD ( 
           ID ) ;
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) KEYWORD' */
CREATE INDEX KEYWORD_FK_ID_EPAMMS_2157780 
      ON KEYWORD ( 
           FK_ID_EPAMMS ) ;
 
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
 
/* Main key for Entity - LLD */
CREATE UNIQUE INDEX ULLD_ID_2147280 
      ON LLD ( 
           ID ) ;
 
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
 
/* Main key for Entity - LLD_Block */
CREATE UNIQUE INDEX ULLD_BLOCK_ID_2147470 
      ON LLD_BLOCK ( 
           ID ) ;
 
/* Index for Relationship - 'COLOR(is background for [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_BG_ID_COLOR_2157490 
      ON LLD_BLOCK ( 
           BG_ID_COLOR ) ;
 
/* Index for Relationship - 'COLOR(is border for [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_BD_ID_COLOR_2157500 
      ON LLD_BLOCK ( 
           BD_ID_COLOR ) ;
 
/* Index for Relationship - 'COLOR(is Text for [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_TX_ID_COLOR_2157510 
      ON LLD_BLOCK ( 
           TX_ID_COLOR ) ;
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_FK_ID_SPLD_SECTION21577 
      ON LLD_BLOCK ( 
           FK_ID_SPLD_SECTION ) ;
 
/* Index for Relationship - 'LLD_PANEL(has [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_FK_ID_LLD_PANEL_2158290 
      ON LLD_BLOCK ( 
           FK_ID_LLD_PANEL ) ;
 
/* Index for Relationship - 'LLD_BLOCK(is linked to [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_FK_ID_LLD_BLOCK_2158360 
      ON LLD_BLOCK ( 
           FK_ID_LLD_BLOCK ) ;
 
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
 
/* Main key for Entity - LLD_Page */
CREATE UNIQUE INDEX ULLD_PAGE_ID_2147970 
      ON LLD_PAGE ( 
           ID ) ;
 
/* Index for Relationship - 'COLOR(is background for [0:m] ) LLD_PAGE' */
CREATE INDEX LLD_PAGE_FK_ID_COLOR_2157460 
      ON LLD_PAGE ( 
           FK_ID_COLOR ) ;
 
/* Index for Relationship - 'LLD(has [0:m] ) LLD_PAGE' */
CREATE INDEX LLD_PAGE_FK_ID_LLD_2157710 
      ON LLD_PAGE ( 
           FK_ID_LLD ) ;
 
/* Index for Relationship - 'SPLD_LLD(has [0:m] ) LLD_PAGE' */
CREATE INDEX LLD_PAGE_FK_ID_SPLD_LLD_2157720 
      ON LLD_PAGE ( 
           FK_ID_SPLD_LLD ) ;
 
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
 
/* Main key for Entity - LLD_Panel */
CREATE UNIQUE INDEX ULLD_PANEL_ID_2148080 
      ON LLD_PANEL ( 
           ID ) ;
 
/* Index for Relationship - 'COLOR(is background for [0:m] ) LLD_PANEL' */
CREATE INDEX LLD_PANEL_BG_ID_COLOR_2157470 
      ON LLD_PANEL ( 
           BG_ID_COLOR ) ;
 
/* Index for Relationship - 'COLOR(is border for [0:m] ) LLD_PANEL' */
CREATE INDEX LLD_PANEL_BD_ID_COLOR_2157480 
      ON LLD_PANEL ( 
           BD_ID_COLOR ) ;
 
/* Index for Relationship - 'LLD_PAGE(has [0:m] ) LLD_PANEL' */
CREATE INDEX LLD_PANEL_FK_ID_LLD_PAGE_2157700 
      ON LLD_PANEL ( 
           FK_ID_LLD_PAGE ) ;
 
/* Entity - LLD_SpecialSectionAttribute */
CREATE TABLE LLD_SPECIALSECTIONATTRIBUTE ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 128 )     NULL    , 
           PF1ID_LLD_BLOCK                    int                NOT NULL, 
           PF2ID_LLD_BLOCK                    int                NULL     ) ;
 
/* Main key for Entity - LLD_SpecialSectionAttribute */
CREATE UNIQUE INDEX ULLDSPECIALSECTIONATTRIBUTEI21485 
      ON LLD_SPECIALSECTIONATTRIBUTE ( 
           ID ) ;
 
/* Index for Relationship - 'LLD_BLOCK(contains [0:m] ) LLD_SPECIALSECTIONATTRIBUTE' */
CREATE INDEX LLDSPECIALSECTIONATTRIBUTEP121577 
      ON LLD_SPECIALSECTIONATTRIBUTE ( 
           PF1ID_LLD_BLOCK ) ;
 
/* Index for Relationship - 'LLD_BLOCK(is text characteristics (max 1) [0:m] ) LLD_SPECIALSECTIONATTRIBUTE' */
CREATE INDEX LLDSPECIALSECTIONATTRIBUTEP221577 
      ON LLD_SPECIALSECTIONATTRIBUTE ( 
           PF2ID_LLD_BLOCK ) ;
 
/* Entity - M_DilutionChartEntry */
CREATE TABLE M_DILUTIONCHARTENTRY ( 
           ID                                 int                NOT NULL, 
           z_USE                              varchar( 128 )     NULL    , 
           PRODUCTAMOUNTTEXT                  varchar( 254 )     NULL    , 
           WATERAMOUNTTEXT                    varchar( 254 )     NULL    , 
           CONTACTTIME                        varchar( 16 )      NULL    , 
           FK_ID_M_DILUTIONGROUP              int                NOT NULL ) ;
 
/* Main key for Entity - M_DilutionChartEntry */
CREATE UNIQUE INDEX UM_DILUTIONCHARTENTRY_ID_2148630 
      ON M_DILUTIONCHARTENTRY ( 
           ID ) ;
 
/* Index for Relationship - 'M_DILUTIONGROUP(has [0:m] ) M_DILUTIONCHARTENTRY' */
CREATE INDEX MDILUTIONCHARTENTRYFKIDMDILU21571 
      ON M_DILUTIONCHARTENTRY ( 
           FK_ID_M_DILUTIONGROUP ) ;
 
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
 
/* Main key for Entity - M_DilutionGroup */
CREATE UNIQUE INDEX UM_DILUTIONGROUP_ID_2148700 
      ON M_DILUTIONGROUP ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_DILUTIONGROUP' */
CREATE INDEX MDILUTIONGROUPFKIDMASTERLABE21576 
      ON M_DILUTIONGROUP ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Entity - M_DilutionGroupItem */
CREATE TABLE M_DILUTIONGROUPITEM ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             longtext           NULL    , 
           PPM                                int                NULL    , 
           FK_ID_M_DILUTIONGROUP              int                NOT NULL ) ;
 
/* Main key for Entity - M_DilutionGroupItem */
CREATE UNIQUE INDEX UM_DILUTIONGROUPITEM_ID_2148820 
      ON M_DILUTIONGROUPITEM ( 
           ID ) ;
 
/* Index for Relationship - 'M_DILUTIONGROUP(has [0:m] ) M_DILUTIONGROUPITEM' */
CREATE INDEX MDILUTIONGROUPITEMFKIDMDILUT21576 
      ON M_DILUTIONGROUPITEM ( 
           FK_ID_M_DILUTIONGROUP ) ;
 
/* Entity - M_DirectionsForUseSection */
CREATE TABLE M_DIRECTIONSFORUSESECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           SUBTITLE                           longtext           NULL    , 
           GENERALUSE                         varchar( 1 )       NULL    , 
           STATEMENTLISTTYPE                  varchar( 254 )     NULL    , 
           NUMBEREACHSTATEMENT                varchar( 1 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           STATEMENTSELECTEDBYUSAGEFLAG       varchar( 1 )       NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           XORID_M_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL, 
           FK_ID_M_DIRECTIONSFORUSESECTION    int                NULL     ) ;
 
/* Main key for Entity - M_DirectionsForUseSection */
CREATE UNIQUE INDEX UM_DIRECTIONSFORUSESECTIONID21488 
      ON M_DIRECTIONSFORUSESECTION ( 
           ID ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(exclusiveTo [0:1] ) M_DIRECTIONSFORUSESECTION' */
CREATE INDEX MDIRECTIONSFORUSESECTIONXORI21572 
      ON M_DIRECTIONSFORUSESECTION ( 
           XORID_M_DIRECTIONSFORUSESECTION ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_DIRECTIONSFORUSESECTION' */
CREATE INDEX MDIRECTIONSFORUSESECTIONFKID21584 
      ON M_DIRECTIONSFORUSESECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has next version [0:m] ) M_DIRECTIONSFORUSESECTION' */
CREATE INDEX MDIRECTIONSFORUSESECTIONFKID21586 
      ON M_DIRECTIONSFORUSESECTION ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
/* Entity - M_DirectionsForUseStatement */
CREATE TABLE M_DIRECTIONSFORUSESTATEMENT ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           NOTFORUSETEXT                      longtext           NULL    , 
           NOTFORUSETYPE                      varchar( 2 )       NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           SUBID_M_DIRECTIONSFORUSESTATEMEN   int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN   int                NULL     ) ;
 
/* Main key for Entity - M_DirectionsForUseStatement */
CREATE UNIQUE INDEX UMDIRECTIONSFORUSESTATEMENTI21490 
      ON M_DIRECTIONSFORUSESTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has sub [0:m] ) M_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX MDIRECTIONSFORUSESTATEMENTSU21570 
      ON M_DIRECTIONSFORUSESTATEMENT ( 
           SUBID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has [0:m] ) M_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX MDIRECTIONSFORUSESTATEMENTFK21584 
      ON M_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has next version [0:m] ) M_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX MDIRECTIONSFORUSESTATEMENTFK21584 
      ON M_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
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
 
/* Main key for Entity - M_GeneralSection */
CREATE UNIQUE INDEX UM_GENERALSECTION_ID_2149100 
      ON M_GENERALSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_GENERALSECTION' */
CREATE INDEX MGENERALSECTIONFKIDMASTERLAB21583 
      ON M_GENERALSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'M_GENERALSECTION(has next version [0:m] ) M_GENERALSECTION' */
CREATE INDEX MGENERALSECTIONFKIDMGENERALS21583 
      ON M_GENERALSECTION ( 
           FK_ID_M_GENERALSECTION ) ;
 
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
 
/* Main key for Entity - M_GeneralStatement */
CREATE UNIQUE INDEX UM_GENERALSTATEMENT_ID_2149260 
      ON M_GENERALSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_GENERALSUBSECTION(has [0:m] ) M_GENERALSTATEMENT' */
CREATE INDEX MGENERALSTATEMENTFKIDMGENERA21571 
      ON M_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSUBSECTION ) ;
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) M_GENERALSTATEMENT' */
CREATE INDEX MGENERALSTATEMENTFKIDMGENERA21583 
      ON M_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSECTION ) ;
 
/* Index for Relationship - 'M_GENERALSTATEMENT(has next version [0:m] ) M_GENERALSTATEMENT' */
CREATE INDEX MGENERALSTATEMENTFKIDMGENERA21583 
      ON M_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSTATEMENT ) ;
 
/* Entity - M_GeneralSubsection */
CREATE TABLE M_GENERALSUBSECTION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           CONTAINERVOLUMEENVIRONMENTHAZARD   varchar( 20 )      NULL    , 
           FK_ID_M_GENERALSECTION             int                NOT NULL ) ;
 
/* Main key for Entity - M_GeneralSubsection */
CREATE UNIQUE INDEX UM_GENERALSUBSECTION_ID_2149330 
      ON M_GENERALSUBSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) M_GENERALSUBSECTION' */
CREATE INDEX MGENERALSUBSECTIONFKIDMGENER21571 
      ON M_GENERALSUBSECTION ( 
           FK_ID_M_GENERALSECTION ) ;
 
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
 
/* Main key for Entity - M_HumanHazardSection */
CREATE UNIQUE INDEX UM_HUMANHAZARDSECTION_ID_2149390 
      ON M_HUMANHAZARDSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:1] ) M_HUMANHAZARDSECTION' */
CREATE INDEX MHUMANHAZARDSECTIONFKIDMASTE21585 
      ON M_HUMANHAZARDSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'M_HUMANHAZARDSECTION(has next version [0:m] ) M_HUMANHAZARDSECTION' */
CREATE INDEX MHUMANHAZARDSECTIONFKIDMHUMA21586 
      ON M_HUMANHAZARDSECTION ( 
           FK_ID_M_HUMANHAZARDSECTION ) ;
 
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
 
/* Main key for Entity - M_IngredientsSection */
CREATE UNIQUE INDEX UM_INGREDIENTSSECTION_ID_2149660 
      ON M_INGREDIENTSSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has next version [0:m] ) M_INGREDIENTSSECTION' */
CREATE INDEX MINGREDIENTSSECTIONFKIDMINGR21588 
      ON M_INGREDIENTSSECTION ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:1] ) M_INGREDIENTSSECTION' */
CREATE INDEX MINGREDIENTSSECTIONFKIDMASTE21589 
      ON M_INGREDIENTSSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
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
 
/* Main key for Entity - M_IngredientsStatement */
CREATE UNIQUE INDEX UM_INGREDIENTSSTATEMENT_ID_214975 
      ON M_INGREDIENTSSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has [0:m] ) M_INGREDIENTSSTATEMENT' */
CREATE INDEX MINGREDIENTSSTATEMENTFKIDMIN21588 
      ON M_INGREDIENTSSTATEMENT ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
/* Index for Relationship - 'M_INGREDIENTSSTATEMENT(has next version [0:m] ) M_INGREDIENTSSTATEMENT' */
CREATE INDEX MINGREDIENTSSTATEMENTFKIDMIN21588 
      ON M_INGREDIENTSSTATEMENT ( 
           FK_ID_M_INGREDIENTSSTATEMENT ) ;
 
/* Entity - M_InsertText */
CREATE TABLE M_INSERTTEXT ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_M_INSERTTEXTKEYWORD          int                NOT NULL ) ;
 
/* Main key for Entity - M_InsertText */
CREATE UNIQUE INDEX UM_INSERTTEXT_ID_2149840 
      ON M_INSERTTEXT ( 
           ID ) ;
 
/* Index for Relationship - 'M_INSERTTEXTKEYWORD(has [0:m] ) M_INSERTTEXT' */
CREATE INDEX MINSERTTEXTFKIDMINSERTTEXTKE21573 
      ON M_INSERTTEXT ( 
           FK_ID_M_INSERTTEXTKEYWORD ) ;
 
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
 
/* Main key for Entity - M_InsertTextKeyword */
CREATE UNIQUE INDEX UM_INSERTTEXTKEYWORD_ID_2149880 
      ON M_INSERTTEXTKEYWORD ( 
           ID ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMSTORA21572 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_STORAGEDISPOSALSTATEMENT ) ;
 
/* Index for Relationship - 'M_GENERALSTATEMENT(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMGENER21572 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_GENERALSTATEMENT ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has title [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMDIREC21573 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
/* Index for Relationship - 'M_MARKETINGSECTION(has title [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMMARKE21573 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMUSAGE21573 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_USAGE ) ;
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMMARKE21573 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has [0:m] ) M_INSERTTEXTKEYWORD' */
CREATE INDEX MINSERTTEXTKEYWORDFKIDMDIREC21573 
      ON M_INSERTTEXTKEYWORD ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
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
 
/* Main key for Entity - M_MarketingSection */
CREATE UNIQUE INDEX UM_MARKETINGSECTION_ID_2149930 
      ON M_MARKETINGSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_MARKETINGSECTION' */
CREATE INDEX MMARKETINGSECTIONFKIDMASTERL21585 
      ON M_MARKETINGSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'M_MARKETINGSECTION(has next version [0:m] ) M_MARKETINGSECTION' */
CREATE INDEX MMARKETINGSECTIONFKIDMMARKET21586 
      ON M_MARKETINGSECTION ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
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
 
/* Main key for Entity - M_MarketingStatement */
CREATE UNIQUE INDEX UM_MARKETINGSTATEMENT_ID_2150030 
      ON M_MARKETINGSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_MARKETINGSECTION(has [0:m] ) M_MARKETINGSTATEMENT' */
CREATE INDEX MMARKETINGSTATEMENTFKIDMMARK21580 
      ON M_MARKETINGSTATEMENT ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has next version [0:m] ) M_MARKETINGSTATEMENT' */
CREATE INDEX MMARKETINGSTATEMENTFKIDMMARK21586 
      ON M_MARKETINGSTATEMENT ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
/* Entity - M_ReviewerNote */
CREATE TABLE M_REVIEWERNOTE ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           FK_ID_M_MARKETINGSECTION           int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESECTION    int                NULL    , 
           FK_ID_M_GENERALSECTION             int                NULL    , 
           FK_ID_M_INGREDIENTSSECTION         int                NULL     ) ;
 
/* Main key for Entity - M_ReviewerNote */
CREATE UNIQUE INDEX UM_REVIEWERNOTE_ID_2150110 
      ON M_REVIEWERNOTE ( 
           ID ) ;
 
/* Index for Relationship - 'M_MARKETINGSECTION(has [0:m] ) M_REVIEWERNOTE' */
CREATE INDEX MREVIEWERNOTEFKIDMMARKETINGS21572 
      ON M_REVIEWERNOTE ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has [0:m] ) M_REVIEWERNOTE' */
CREATE INDEX MREVIEWERNOTEFKIDMDIRECTIONS21572 
      ON M_REVIEWERNOTE ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) M_REVIEWERNOTE' */
CREATE INDEX MREVIEWERNOTEFKIDMGENERALSEC21572 
      ON M_REVIEWERNOTE ( 
           FK_ID_M_GENERALSECTION ) ;
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has [0:m] ) M_REVIEWERNOTE' */
CREATE INDEX MREVIEWERNOTEFKIDMINGREDIENT21572 
      ON M_REVIEWERNOTE ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
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
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL, 
           FK_ID_M_STORAGEDISPOSALSECTION     int                NULL     ) ;
 
/* Main key for Entity - M_StorageDisposalSection */
CREATE UNIQUE INDEX UM_STORAGEDISPOSALSECTION_ID21501 
      ON M_STORAGEDISPOSALSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_STORAGEDISPOSALSECTION' */
CREATE INDEX MSTORAGEDISPOSALSECTIONFKIDM21585 
      ON M_STORAGEDISPOSALSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has next version [0:m] ) M_STORAGEDISPOSALSECTION' */
CREATE INDEX MSTORAGEDISPOSALSECTIONFKIDM21585 
      ON M_STORAGEDISPOSALSECTION ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
/* Entity - M_StorageDisposalStatement */
CREATE TABLE M_STORAGEDISPOSALSTATEMENT ( 
           ID                                 int                NOT NULL, 
           z_ORDER                            int                NULL    , 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             longtext           NULL    , 
           NOTFORUSETEXT                      longtext           NULL    , 
           NOTFORUSETYPE                      varchar( 2 )       NOT NULL, 
           REVIEWERNOTE                       longtext           NULL    , 
           EXCLUSIVESTATEMENTS                varchar( 1 )       NULL    , 
           DELETEDFLAG                        varchar( 1 )       NULL    , 
           AUTOSEQ                            int                NULL    , 
           SUBID_M_STORAGEDISPOSALSTATEMENT   int                NULL    , 
           FK_ID_M_STORAGEDISPOSALSECTION     int                NULL    , 
           FK_ID_M_STORAGEDISPOSALSTATEMENT   int                NULL     ) ;
 
/* Main key for Entity - M_StorageDisposalStatement */
CREATE UNIQUE INDEX UMSTORAGEDISPOSALSTATEMENTID21502 
      ON M_STORAGEDISPOSALSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has sub [0:m] ) M_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX MSTORAGEDISPOSALSTATEMENTSUB21570 
      ON M_STORAGEDISPOSALSTATEMENT ( 
           SUBID_M_STORAGEDISPOSALSTATEMENT ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has [0:m] ) M_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX MSTORAGEDISPOSALSTATEMENTFKI21583 
      ON M_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has next version [0:m] ) M_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX MSTORAGEDISPOSALSTATEMENTFKI21584 
      ON M_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_M_STORAGEDISPOSALSTATEMENT ) ;
 
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
 
/* Main key for Entity - M_Usage */
CREATE UNIQUE INDEX UM_USAGE_ID_2150400 
      ON M_USAGE ( 
           ID ) ;
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGE_2157130 
      ON M_USAGE ( 
           FK_ID_M_USAGE ) ;
 
/* Index for Relationship - 'M_USAGEGROUP(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGEGROUP_215728 
      ON M_USAGE ( 
           FK_ID_M_USAGEGROUP ) ;
 
/* Index for Relationship - 'M_USAGEFOOTNOTE(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_MUSAGEFOOTNOTE21575 
      ON M_USAGE ( 
           FK_ID_M_USAGEFOOTNOTE ) ;
 
/* Index for Relationship - 'M_USAGETYPE(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGETYPE_2157690 
      ON M_USAGE ( 
           FK_ID_M_USAGETYPE ) ;
 
/* Index for Relationship - 'M_USAGE(has next version [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGE02_2158660 
      ON M_USAGE ( 
           FK_ID_M_USAGE02 ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has (delete) [0:m] ) M_USAGE' */
CREATE INDEX MUSAGEFKIDMASTERLABELCONTENT21589 
      ON M_USAGE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Entity - M_UsageFootnote */
CREATE TABLE M_USAGEFOOTNOTE ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             longtext           NULL    , 
           SYMBOL                             varchar( 32 )      NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Main key for Entity - M_UsageFootnote */
CREATE UNIQUE INDEX UM_USAGEFOOTNOTE_ID_2150490 
      ON M_USAGEFOOTNOTE ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_USAGEFOOTNOTE' */
CREATE INDEX MUSAGEFOOTNOTEFKIDMASTERLABE21575 
      ON M_USAGEFOOTNOTE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Entity - M_UsageGroup */
CREATE TABLE M_USAGEGROUP ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           FK_ID_M_USAGETYPE                  int                NOT NULL ) ;
 
/* Main key for Entity - M_UsageGroup */
CREATE UNIQUE INDEX UM_USAGEGROUP_ID_2150540 
      ON M_USAGEGROUP ( 
           ID ) ;
 
/* Index for Relationship - 'M_USAGETYPE(has [0:m] ) M_USAGEGROUP' */
CREATE INDEX M_USAGEGROUP_FK_IDMUSAGETYPE21572 
      ON M_USAGEGROUP ( 
           FK_ID_M_USAGETYPE ) ;
 
/* Entity - M_UsageOrdering */
CREATE TABLE M_USAGEORDERING ( 
           ID                                 int                NOT NULL, 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_M_USAGE                      int                NOT NULL, 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN   int                NULL    , 
           FK_ID_M_MARKETINGSTATEMENT         int                NULL     ) ;
 
/* Main key for Entity - M_UsageOrdering */
CREATE UNIQUE INDEX UM_USAGEORDERING_ID_2150580 
      ON M_USAGEORDERING ( 
           ID ) ;
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX M_USAGEORDERING_FK_ID_MUSAGE21580 
      ON M_USAGEORDERING ( 
           FK_ID_M_USAGE ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX MUSAGEORDERINGFKIDMDIRECTION21580 
      ON M_USAGEORDERING ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX MUSAGEORDERINGFKIDMMARKETING21589 
      ON M_USAGEORDERING ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
/* Entity - M_UsageType */
CREATE TABLE M_USAGETYPE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           REVIEWERNOTE                       longtext           NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Main key for Entity - M_UsageType */
CREATE UNIQUE INDEX UM_USAGETYPE_ID_2150610 
      ON M_USAGETYPE ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_USAGETYPE' */
CREATE INDEX MUSAGETYPEFKIDMASTERLABELCON21576 
      ON M_USAGETYPE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
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
 
/* Main key for Entity - MasterLabelContent */
CREATE UNIQUE INDEX UMASTERLABELCONTENT_ID_2150670 
      ON MASTERLABELCONTENT ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has sub [0:m] ) MASTERLABELCONTENT' */
CREATE INDEX MASTERLABELCONTENTSUBIDMASTE21570 
      ON MASTERLABELCONTENT ( 
           SUBID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has next version (max 1) [0:m] ) MASTERLABELCONTENT' */
CREATE INDEX MASTERLABELCONTENTFKIDMASTER21581 
      ON MASTERLABELCONTENT ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'MASTERPRODUCT(has [0:m] ) MASTERLABELCONTENT' */
CREATE INDEX MASTERLABELCONTENTFKIDMASTER21589 
      ON MASTERLABELCONTENT ( 
           FK_ID_MASTERPRODUCT ) ;
 
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
 
/* Main key for Entity - MasterProduct */
CREATE UNIQUE INDEX UMASTERPRODUCT_ID_2150920 
      ON MASTERPRODUCT ( 
           ID ) ;
 
/* Index for Relationship - 'PRIMARYREGISTRANT(has [0:m] ) MASTERPRODUCT' */
CREATE INDEX MASTERPRODUCTFKIDPRIMARYREGI21590 
      ON MASTERPRODUCT ( 
           FK_ID_PRIMARYREGISTRANT ) ;
 
/* Entity - NetContents */
CREATE TABLE NETCONTENTS ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           DESCRIPTION                        longtext           NULL    , 
           z_TEXT                             longtext           NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Main key for Entity - NetContents */
CREATE UNIQUE INDEX UNETCONTENTS_ID_2151070 
      ON NETCONTENTS ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:1] ) NETCONTENTS' */
CREATE INDEX NETCONTENTSFKIDMASTERLABELCO21571 
      ON NETCONTENTS ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
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
 
/* Main key for Entity - Organization */
CREATE UNIQUE INDEX UORGANIZATION_ID_2151130 
      ON ORGANIZATION ( 
           ID ) ;
 
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
 
/* Main key for Entity - Person */
CREATE UNIQUE INDEX UPERSON_ID_2151260 
      ON PERSON ( 
           ID ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_LASTNAME_2151270 
      ON PERSON ( 
           LASTNAME ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_EMAILADDRESS_2151370 
      ON PERSON ( 
           EMAILADDRESS ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_HOMEPHONE_2151320 
      ON PERSON ( 
           HOMEPHONE ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_GENDER_2151310 
      ON PERSON ( 
           GENDER ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_WORKPHONE_2151340 
      ON PERSON ( 
           WORKPHONE ) ;
 
/* Index for Relationship - 'ADDRESS(for [0:1] ) PERSON' */
CREATE INDEX PERSON_FK_ID_ADDRESS_2159100 
      ON PERSON ( 
           FK_ID_ADDRESS ) ;
 
/* Index for Relationship - 'ORGANIZATION(has employee [0:m] ) PERSON' */
CREATE INDEX PERSON_FK_ID_ORGANIZATION_2159110 
      ON PERSON ( 
           FK_ID_ORGANIZATION ) ;
 
/* Index for Relationship - 'ORGANIZATION(has contact [0:1] ) PERSON' */
CREATE INDEX PERSONHASCONTACTIDORGANIZATI21591 
      ON PERSON ( 
           HASCONTACTID_ORGANIZATION ) ;
 
/* Entity - PrimaryRegistrant */
CREATE TABLE PRIMARYREGISTRANT ( 
           ID                                 int                NOT NULL, 
           EPA_COMPANYNUMBER                  varchar( 6 )       NULL    , 
           FK_ID_EPAMMS                       int                NOT NULL, 
           FK_ID_ORGANIZATION                 int                NOT NULL ) ;
 
/* Main key for Entity - PrimaryRegistrant */
CREATE UNIQUE INDEX UPRIMARYREGISTRANT_ID_2151510 
      ON PRIMARYREGISTRANT ( 
           ID ) ;
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) PRIMARYREGISTRANT' */
CREATE INDEX PRIMARYREGISTRANT_FKIDEPAMMS21575 
      ON PRIMARYREGISTRANT ( 
           FK_ID_EPAMMS ) ;
 
/* Index for Relationship - 'ORGANIZATION(has [0:1] ) PRIMARYREGISTRANT' */
CREATE INDEX PRIMARYREGISTRANTFKIDORGANIZ21579 
      ON PRIMARYREGISTRANT ( 
           FK_ID_ORGANIZATION ) ;
 
/* Entity - PrimarySub */
CREATE TABLE PRIMARYSUB ( 
           ID                                 int                NOT NULL, 
           FK_ID_PRIMARYREGISTRANT            int                NOT NULL, 
           FK_ID_SUBREGISTRANT                int                NOT NULL ) ;
 
/* Main key for Entity - PrimarySub */
CREATE UNIQUE INDEX UPRIMARYSUB_ID_2151550 
      ON PRIMARYSUB ( 
           ID ) ;
 
/* Index for Relationship - 'PRIMARYREGISTRANT(has [0:m] ) PRIMARYSUB' */
CREATE INDEX PRIMARYSUBFKIDPRIMARYREGISTR21570 
      ON PRIMARYSUB ( 
           FK_ID_PRIMARYREGISTRANT ) ;
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) PRIMARYSUB' */
CREATE INDEX PRIMARYSUB_FKIDSUBREGISTRANT21590 
      ON PRIMARYSUB ( 
           FK_ID_SUBREGISTRANT ) ;
 
/* Entity - ResumeObject */
CREATE TABLE RESUMEOBJECT ( 
           ID                                 int                NOT NULL, 
           LOD                                varchar( 64 )      NULL    , 
           ENTITYNAME                         varchar( 64 )      NULL    , 
           KEYATTRIBUTENAME                   varchar( 64 )      NULL    , 
           KEYATTRIBUTEVALUE                  int                NULL    , 
           VIEWNAME                           varchar( 64 )      NULL    , 
           FK_ID_RESUMEPATH                   int                NOT NULL ) ;
 
/* Main key for Entity - ResumeObject */
CREATE UNIQUE INDEX URESUMEOBJECT_ID_2151580 
      ON RESUMEOBJECT ( 
           ID ) ;
 
/* Index for Relationship - 'RESUMEPATH(has [0:m] ) RESUMEOBJECT' */
CREATE INDEX RESUMEOBJECT_FK_IDRESUMEPATH21572 
      ON RESUMEOBJECT ( 
           FK_ID_RESUMEPATH ) ;
 
/* Entity - ResumePath */
CREATE TABLE RESUMEPATH ( 
           ID                                 int                NOT NULL, 
           DIALOGWINDOW                       varchar( 64 )      NULL    , 
           FK_ID_Z_USER                       int                NOT NULL ) ;
 
/* Main key for Entity - ResumePath */
CREATE UNIQUE INDEX URESUMEPATH_ID_2151660 
      ON RESUMEPATH ( 
           ID ) ;
 
/* Index for Relationship - 'z_USER(has [0:m] ) RESUMEPATH' */
CREATE INDEX RESUMEPATH_FK_ID_Z_USER_2157300 
      ON RESUMEPATH ( 
           FK_ID_Z_USER ) ;
 
/* Entity - ReusableBlockDefinition */
CREATE TABLE REUSABLEBLOCKDEFINITION ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 128 )     NOT NULL, 
           DESCRIPTION                        longtext           NULL    , 
           LLD_SECTIONTYPE                    varchar( 32 )      NULL    , 
           FK_ID_SUBREGISTRANT                int                NOT NULL, 
           FK_ID_LLD_BLOCK                    int                NOT NULL ) ;
 
/* Main key for Entity - ReusableBlockDefinition */
CREATE UNIQUE INDEX UREUSABLEBLOCKDEFINITION_ID_21517 
      ON REUSABLEBLOCKDEFINITION ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) REUSABLEBLOCKDEFINITION' */
CREATE INDEX REUSABLEBLOCKDEFINITIONFKIDS21575 
      ON REUSABLEBLOCKDEFINITION ( 
           FK_ID_SUBREGISTRANT ) ;
 
/* Index for Relationship - 'LLD_BLOCK(has [0:1] ) REUSABLEBLOCKDEFINITION' */
CREATE INDEX REUSABLEBLOCKDEFINITIONFKIDL21575 
      ON REUSABLEBLOCKDEFINITION ( 
           FK_ID_LLD_BLOCK ) ;
 
/* Entity - S_DilutionGroup */
CREATE TABLE S_DILUTIONGROUP ( 
           ID                                 int                NOT NULL, 
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL, 
           FK_ID_M_DILUTIONGROUP              int                NOT NULL ) ;
 
/* Main key for Entity - S_DilutionGroup */
CREATE UNIQUE INDEX US_DILUTIONGROUP_ID_2151760 
      ON S_DILUTIONGROUP ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_DILUTIONGROUP' */
CREATE INDEX SDILUTIONGROUPFKIDSUBREGLABE21576 
      ON S_DILUTIONGROUP ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Index for Relationship - 'M_DILUTIONGROUP(has [0:m] ) S_DILUTIONGROUP' */
CREATE INDEX SDILUTIONGROUPFKIDMDILUTIONG21576 
      ON S_DILUTIONGROUP ( 
           FK_ID_M_DILUTIONGROUP ) ;
 
/* Entity - S_DilutionGroupItem */
CREATE TABLE S_DILUTIONGROUPITEM ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             longtext           NULL    , 
           FK_ID_S_DILUTIONGROUP              int                NOT NULL ) ;
 
/* Main key for Entity - S_DilutionGroupItem */
CREATE UNIQUE INDEX US_DILUTIONGROUPITEM_ID_2151800 
      ON S_DILUTIONGROUPITEM ( 
           ID ) ;
 
/* Index for Relationship - 'S_DILUTIONGROUP(has [0:m] ) S_DILUTIONGROUPITEM' */
CREATE INDEX SDILUTIONGROUPITEMFKIDSDILUT21574 
      ON S_DILUTIONGROUPITEM ( 
           FK_ID_S_DILUTIONGROUP ) ;
 
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
 
/* Main key for Entity - S_DirectionsForUseSection */
CREATE UNIQUE INDEX US_DIRECTIONSFORUSESECTIONID21518 
      ON S_DIRECTIONSFORUSESECTION ( 
           ID ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has [0:m] ) S_DIRECTIONSFORUSESECTION' */
CREATE INDEX SDIRECTIONSFORUSESECTIONFKID21585 
      ON S_DIRECTIONSFORUSESECTION ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_DIRECTIONSFORUSESECTION' */
CREATE INDEX SDIRECTIONSFORUSESECTIONFKID21587 
      ON S_DIRECTIONSFORUSESECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
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
 
/* Main key for Entity - S_DirectionsForUseStatement */
CREATE UNIQUE INDEX USDIRECTIONSFORUSESTATEMENTI21519 
      ON S_DIRECTIONSFORUSESTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has [0:m] ) S_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SDIRECTIONSFORUSESTATEMENTFK21584 
      ON S_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(has [0:m] ) S_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SDIRECTIONSFORUSESTATEMENTFK21587 
      ON S_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
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
 
/* Main key for Entity - S_GeneralSection */
CREATE UNIQUE INDEX US_GENERALSECTION_ID_2152080 
      ON S_GENERALSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) S_GENERALSECTION' */
CREATE INDEX SGENERALSECTIONFKIDMGENERALS21583 
      ON S_GENERALSECTION ( 
           FK_ID_M_GENERALSECTION ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_GENERALSECTION' */
CREATE INDEX SGENERALSECTIONFKIDSUBREGLAB21587 
      ON S_GENERALSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
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
 
/* Main key for Entity - S_GeneralStatement */
CREATE UNIQUE INDEX US_GENERALSTATEMENT_ID_2152230 
      ON S_GENERALSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_GENERALSTATEMENT(has [0:m] ) S_GENERALSTATEMENT' */
CREATE INDEX SGENERALSTATEMENTFKIDMGENERA21583 
      ON S_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSTATEMENT ) ;
 
/* Index for Relationship - 'S_GENERALSECTION(has [0:m] ) S_GENERALSTATEMENT' */
CREATE INDEX SGENERALSTATEMENTFKIDSGENERA21587 
      ON S_GENERALSTATEMENT ( 
           FK_ID_S_GENERALSECTION ) ;
 
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
 
/* Main key for Entity - S_HumanHazardSection */
CREATE UNIQUE INDEX US_HUMANHAZARDSECTION_ID_2152310 
      ON S_HUMANHAZARDSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'M_HUMANHAZARDSECTION(has [0:m] ) S_HUMANHAZARDSECTION' */
CREATE INDEX SHUMANHAZARDSECTIONFKIDMHUMA21586 
      ON S_HUMANHAZARDSECTION ( 
           FK_ID_M_HUMANHAZARDSECTION ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_HUMANHAZARDSECTION' */
CREATE INDEX SHUMANHAZARDSECTIONFKIDSUBRE21587 
      ON S_HUMANHAZARDSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
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
 
/* Main key for Entity - S_IngredientsSection */
CREATE UNIQUE INDEX US_INGREDIENTSSECTION_ID_2152590 
      ON S_INGREDIENTSSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_INGREDIENTSSECTION' */
CREATE INDEX SINGREDIENTSSECTIONFKIDSUBRE21587 
      ON S_INGREDIENTSSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has [0:m] ) S_INGREDIENTSSECTION' */
CREATE INDEX SINGREDIENTSSECTIONFKIDMINGR21588 
      ON S_INGREDIENTSSECTION ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
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
 
/* Main key for Entity - S_IngredientsStatement */
CREATE UNIQUE INDEX US_INGREDIENTSSTATEMENT_ID_215269 
      ON S_INGREDIENTSSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'S_INGREDIENTSSECTION(has [0:m] ) S_INGREDIENTSSTATEMENT' */
CREATE INDEX SINGREDIENTSSTATEMENTFKIDSIN21587 
      ON S_INGREDIENTSSTATEMENT ( 
           FK_ID_S_INGREDIENTSSECTION ) ;
 
/* Index for Relationship - 'M_INGREDIENTSSTATEMENT(has [0:m] ) S_INGREDIENTSSTATEMENT' */
CREATE INDEX SINGREDIENTSSTATEMENTFKIDMIN21588 
      ON S_INGREDIENTSSTATEMENT ( 
           FK_ID_M_INGREDIENTSSTATEMENT ) ;
 
/* Entity - S_InsertText */
CREATE TABLE S_INSERTTEXT ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             varchar( 254 )     NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_S_INSERTTEXTKEYWORD          int                NOT NULL ) ;
 
/* Main key for Entity - S_InsertText */
CREATE UNIQUE INDEX US_INSERTTEXT_ID_2152790 
      ON S_INSERTTEXT ( 
           ID ) ;
 
/* Index for Relationship - 'S_INSERTTEXTKEYWORD(has [0:m] ) S_INSERTTEXT' */
CREATE INDEX SINSERTTEXTFKIDSINSERTTEXTKE21573 
      ON S_INSERTTEXT ( 
           FK_ID_S_INSERTTEXTKEYWORD ) ;
 
/* Entity - S_InsertTextKeyword */
CREATE TABLE S_INSERTTEXTKEYWORD ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_S_MARKETINGSTATEMENT         int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN   int                NULL     ) ;
 
/* Main key for Entity - S_InsertTextKeyword */
CREATE UNIQUE INDEX US_INSERTTEXTKEYWORD_ID_2152840 
      ON S_INSERTTEXTKEYWORD ( 
           ID ) ;
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has [0:m] ) S_INSERTTEXTKEYWORD' */
CREATE INDEX SINSERTTEXTKEYWORDFKIDSMARKE21573 
      ON S_INSERTTEXTKEYWORD ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESTATEMENT(has [0:m] ) S_INSERTTEXTKEYWORD' */
CREATE INDEX SINSERTTEXTKEYWORDFKIDSDIREC21573 
      ON S_INSERTTEXTKEYWORD ( 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN ) ;
 
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
 
/* Main key for Entity - S_MarketingSection */
CREATE UNIQUE INDEX US_MARKETINGSECTION_ID_2152890 
      ON S_MARKETINGSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'S_MARKETINGSECTION(has next version [0:m] ) S_MARKETINGSECTION' */
CREATE INDEX SMARKETINGSECTIONFKIDSMARKET21578 
      ON S_MARKETINGSECTION ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'M_MARKETINGSECTION(has [0:m] ) S_MARKETINGSECTION' */
CREATE INDEX SMARKETINGSECTIONFKIDMMARKET21586 
      ON S_MARKETINGSECTION ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_MARKETINGSECTION' */
CREATE INDEX SMARKETINGSECTIONFKIDSUBREGL21588 
      ON S_MARKETINGSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
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
 
/* Main key for Entity - S_MarketingStatement */
CREATE UNIQUE INDEX US_MARKETINGSTATEMENT_ID_2152990 
      ON S_MARKETINGSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has next version [0:m] ) S_MARKETINGSTATEMENT' */
CREATE INDEX SMARKETINGSTATEMENTFKIDSMARK21578 
      ON S_MARKETINGSTATEMENT ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
/* Index for Relationship - 'S_MARKETINGSECTION(has [0:m] ) S_MARKETINGSTATEMENT' */
CREATE INDEX SMARKETINGSTATEMENTFKIDSMARK21580 
      ON S_MARKETINGSTATEMENT ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has [0:m] ) S_MARKETINGSTATEMENT' */
CREATE INDEX SMARKETINGSTATEMENTFKIDMMARK21586 
      ON S_MARKETINGSTATEMENT ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
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
 
/* Main key for Entity - S_StorageDisposalSection */
CREATE UNIQUE INDEX US_STORAGEDISPOSALSECTION_ID21530 
      ON S_STORAGEDISPOSALSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has [0:m] ) S_STORAGEDISPOSALSECTION' */
CREATE INDEX SSTORAGEDISPOSALSECTIONFKIDM21585 
      ON S_STORAGEDISPOSALSECTION ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_STORAGEDISPOSALSECTION' */
CREATE INDEX SSTORAGEDISPOSALSECTIONFKIDS21587 
      ON S_STORAGEDISPOSALSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
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
 
/* Main key for Entity - S_StorageDisposalStatement */
CREATE UNIQUE INDEX USSTORAGEDISPOSALSTATEMENTID21532 
      ON S_STORAGEDISPOSALSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has [0:m] ) S_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SSTORAGEDISPOSALSTATEMENTFKI21584 
      ON S_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_M_STORAGEDISPOSALSTATEMENT ) ;
 
/* Index for Relationship - 'S_STORAGEDISPOSALSECTION(has [0:m] ) S_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SSTORAGEDISPOSALSTATEMENTFKI21587 
      ON S_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_S_STORAGEDISPOSALSECTION ) ;
 
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
 
/* Main key for Entity - S_Usage */
CREATE UNIQUE INDEX US_USAGE_ID_2153330 
      ON S_USAGE ( 
           ID ) ;
 
/* Index for Relationship - 'S_USAGE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_S_USAGE_2157150 
      ON S_USAGE ( 
           FK_ID_S_USAGE ) ;
 
/* Index for Relationship - 'S_USAGEFOOTNOTE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_SUSAGEFOOTNOTE21575 
      ON S_USAGE ( 
           FK_ID_S_USAGEFOOTNOTE ) ;
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_M_USAGE_2158650 
      ON S_USAGE ( 
           FK_ID_M_USAGE ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has (delete) [0:m] ) S_USAGE' */
CREATE INDEX SUSAGEFKIDSUBREGLABELCONTENT21587 
      ON S_USAGE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Index for Relationship - 'S_USAGETYPE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_S_USAGETYPE_2158960 
      ON S_USAGE ( 
           FK_ID_S_USAGETYPE ) ;
 
/* Entity - S_UsageFootnote */
CREATE TABLE S_USAGEFOOTNOTE ( 
           ID                                 int                NOT NULL, 
           z_TEXT                             varchar( 254 )     NULL    , 
           SYMBOL                             varchar( 32 )      NULL    , 
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Main key for Entity - S_UsageFootnote */
CREATE UNIQUE INDEX US_USAGEFOOTNOTE_ID_2153420 
      ON S_USAGEFOOTNOTE ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_USAGEFOOTNOTE' */
CREATE INDEX SUSAGEFOOTNOTEFKIDSUBREGLABE21575 
      ON S_USAGEFOOTNOTE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Entity - S_UsageOrdering */
CREATE TABLE S_USAGEORDERING ( 
           ID                                 int                NOT NULL, 
           PRIMARYMLC_ID                      int                NULL    , 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_S_MARKETINGSTATEMENT         int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN   int                NULL    , 
           FK_ID_S_USAGE                      int                NOT NULL ) ;
 
/* Main key for Entity - S_UsageOrdering */
CREATE UNIQUE INDEX US_USAGEORDERING_ID_2153480 
      ON S_USAGEORDERING ( 
           ID ) ;
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX SUSAGEORDERINGFKIDSMARKETING21578 
      ON S_USAGEORDERING ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESTATEMENT(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX SUSAGEORDERINGFKIDSDIRECTION21584 
      ON S_USAGEORDERING ( 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN ) ;
 
/* Index for Relationship - 'S_USAGE(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX S_USAGEORDERING_FK_ID_SUSAGE21585 
      ON S_USAGEORDERING ( 
           FK_ID_S_USAGE ) ;
 
/* Entity - S_UsageType */
CREATE TABLE S_USAGETYPE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NOT NULL, 
           PRIMARYMLC_ID                      int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Main key for Entity - S_UsageType */
CREATE UNIQUE INDEX US_USAGETYPE_ID_2153520 
      ON S_USAGETYPE ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_USAGETYPE' */
CREATE INDEX SUSAGETYPEFKIDSUBREGLABELCON21589 
      ON S_USAGETYPE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Entity - S_VersionChangeMessage */
CREATE TABLE S_VERSIONCHANGEMESSAGE ( 
           ID                                 int                NOT NULL, 
           CHANGENOTE                         longtext           NULL    , 
           AUTOSEQ                            int                NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NOT NULL ) ;
 
/* Main key for Entity - S_VersionChangeMessage */
CREATE UNIQUE INDEX US_VERSIONCHANGEMESSAGE_ID_215357 
      ON S_VERSIONCHANGEMESSAGE ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_VERSIONCHANGEMESSAGE' */
CREATE INDEX SVERSIONCHANGEMESSAGEFKIDSUB21571 
      ON S_VERSIONCHANGEMESSAGE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
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
 
/* Main key for Entity - SPLD_DirectionsForUseSection */
CREATE UNIQUE INDEX USPLDDIRECTIONSFORUSESECTION21536 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIONF21579 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIONF21580 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(has [0:m] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIONF21585 
      ON SPLD_DIRECTIONSFORUSESECTION ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
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
 
/* Main key for Entity - SPLD_DirectionsForUseStatement */
CREATE UNIQUE INDEX USPLDDIRECTIONSFORUSESTATEME21537 
      ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESECTION(has [0:m] ) SPLD_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SPLDDIRECTIONSFORUSESTATEMEN21582 
      ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESTATEMENT(has [0:m] ) SPLD_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SPLDDIRECTIONSFORUSESTATEMEN21584 
      ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN ) ;
 
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
 
/* Main key for Entity - SPLD_GeneralSection */
CREATE UNIQUE INDEX USPLD_GENERALSECTION_ID_2153860 
      ON SPLD_GENERALSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_GENERALSECTION' */
CREATE INDEX SPLDGENERALSECTIONFKIDSPLDSE21579 
      ON SPLD_GENERALSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_GENERALSECTION' */
CREATE INDEX SPLDGENERALSECTIONFKIDSUBREG21580 
      ON SPLD_GENERALSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Index for Relationship - 'S_GENERALSECTION(has [0:m] ) SPLD_GENERALSECTION' */
CREATE INDEX SPLDGENERALSECTIONFKIDSGENER21583 
      ON SPLD_GENERALSECTION ( 
           FK_ID_S_GENERALSECTION ) ;
 
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
 
/* Main key for Entity - SPLD_GeneralStatement */
CREATE UNIQUE INDEX USPLD_GENERALSTATEMENT_ID_2154000 
      ON SPLD_GENERALSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_GENERALSECTION(has [0:m] ) SPLD_GENERALSTATEMENT' */
CREATE INDEX SPLDGENERALSTATEMENTFKIDSPLD21581 
      ON SPLD_GENERALSTATEMENT ( 
           FK_ID_SPLD_GENERALSECTION ) ;
 
/* Index for Relationship - 'S_GENERALSTATEMENT(has [0:m] ) SPLD_GENERALSTATEMENT' */
CREATE INDEX SPLDGENERALSTATEMENTFKIDSGEN21583 
      ON SPLD_GENERALSTATEMENT ( 
           FK_ID_S_GENERALSTATEMENT ) ;
 
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
 
/* Main key for Entity - SPLD_HumanHazardSection */
CREATE UNIQUE INDEX USPLD_HUMANHAZARDSECTION_ID_21541 
      ON SPLD_HUMANHAZARDSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_HUMANHAZARDSECTION' */
CREATE INDEX SPLDHUMANHAZARDSECTIONFKIDSU21580 
      ON SPLD_HUMANHAZARDSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Index for Relationship - 'S_HUMANHAZARDSECTION(has [0:m] ) SPLD_HUMANHAZARDSECTION' */
CREATE INDEX SPLDHUMANHAZARDSECTIONFKIDSH21586 
      ON SPLD_HUMANHAZARDSECTION ( 
           FK_ID_S_HUMANHAZARDSECTION ) ;
 
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
 
/* Main key for Entity - SPLD_IngredientsSection */
CREATE UNIQUE INDEX USPLD_INGREDIENTSSECTION_ID_21543 
      ON SPLD_INGREDIENTSSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_INGREDIENTSSECTION' */
CREATE INDEX SPLDINGREDIENTSSECTIONFKIDSP21579 
      ON SPLD_INGREDIENTSSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_INGREDIENTSSECTION' */
CREATE INDEX SPLDINGREDIENTSSECTIONFKIDSU21580 
      ON SPLD_INGREDIENTSSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Index for Relationship - 'S_INGREDIENTSSECTION(has [0:m] ) SPLD_INGREDIENTSSECTION' */
CREATE INDEX SPLDINGREDIENTSSECTIONFKIDSI21588 
      ON SPLD_INGREDIENTSSECTION ( 
           FK_ID_S_INGREDIENTSSECTION ) ;
 
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
 
/* Main key for Entity - SPLD_IngredientsStatement */
CREATE UNIQUE INDEX USPLD_INGREDIENTSSTATEMENTID21544 
      ON SPLD_INGREDIENTSSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_INGREDIENTSSECTION(has [0:m] ) SPLD_INGREDIENTSSTATEMENT' */
CREATE INDEX SPLDINGREDIENTSSTATEMENTFKID21581 
      ON SPLD_INGREDIENTSSTATEMENT ( 
           FK_ID_SPLD_INGREDIENTSSECTION ) ;
 
/* Index for Relationship - 'S_INGREDIENTSSTATEMENT(has [0:m] ) SPLD_INGREDIENTSSTATEMENT' */
CREATE INDEX SPLDINGREDIENTSSTATEMENTFKID21588 
      ON SPLD_INGREDIENTSSTATEMENT ( 
           FK_ID_S_INGREDIENTSSTATEMENT ) ;
 
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
 
/* Main key for Entity - SPLD_LLD */
CREATE UNIQUE INDEX USPLD_LLD_ID_2154570 
      ON SPLD_LLD ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_LLD' */
CREATE INDEX SPLDLLDFKIDSUBREGPHYSICALLAB21581 
      ON SPLD_LLD ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
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
 
/* Main key for Entity - SPLD_MarketingSection */
CREATE UNIQUE INDEX USPLD_MARKETINGSECTION_ID_2154770 
      ON SPLD_MARKETINGSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'S_MARKETINGSECTION(has [0:m] ) SPLD_MARKETINGSECTION' */
CREATE INDEX SPLDMARKETINGSECTIONFKIDSMAR21578 
      ON SPLD_MARKETINGSECTION ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_MARKETINGSECTION' */
CREATE INDEX SPLDMARKETINGSECTIONFKIDSPLD21579 
      ON SPLD_MARKETINGSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_MARKETINGSECTION' */
CREATE INDEX SPLDMARKETINGSECTIONFKIDSUBR21581 
      ON SPLD_MARKETINGSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
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
 
/* Main key for Entity - SPLD_MarketingStatement */
CREATE UNIQUE INDEX USPLD_MARKETINGSTATEMENT_ID_21548 
      ON SPLD_MARKETINGSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has [0:m] ) SPLD_MARKETINGSTATEMENT' */
CREATE INDEX SPLDMARKETINGSTATEMENTFKIDSM21579 
      ON SPLD_MARKETINGSTATEMENT ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
/* Index for Relationship - 'SPLD_MARKETINGSECTION(has [0:m] ) SPLD_MARKETINGSTATEMENT' */
CREATE INDEX SPLDMARKETINGSTATEMENTFKIDSP21580 
      ON SPLD_MARKETINGSTATEMENT ( 
           FK_ID_SPLD_MARKETINGSECTION ) ;
 
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
 
/* Main key for Entity - SPLD_Section */
CREATE UNIQUE INDEX USPLD_SECTION_ID_2154970 
      ON SPLD_SECTION ( 
           ID ) ;
 
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
 
/* Main key for Entity - SPLD_StorageDisposalSection */
CREATE UNIQUE INDEX USPLDSTORAGEDISPOSALSECTIONI21551 
      ON SPLD_STORAGEDISPOSALSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_STORAGEDISPOSALSECTION' */
CREATE INDEX SPLDSTORAGEDISPOSALSECTIONFK21579 
      ON SPLD_STORAGEDISPOSALSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_STORAGEDISPOSALSECTION' */
CREATE INDEX SPLDSTORAGEDISPOSALSECTIONFK21580 
      ON SPLD_STORAGEDISPOSALSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Index for Relationship - 'S_STORAGEDISPOSALSECTION(has [0:m] ) SPLD_STORAGEDISPOSALSECTION' */
CREATE INDEX SPLDSTORAGEDISPOSALSECTIONFK21585 
      ON SPLD_STORAGEDISPOSALSECTION ( 
           FK_ID_S_STORAGEDISPOSALSECTION ) ;
 
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
 
/* Main key for Entity - SPLD_StorageDisposalStatement */
CREATE UNIQUE INDEX USPLDSTORAGEDISPOSALSTATEMEN21553 
      ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_STORAGEDISPOSALSECTION(has [0:m] ) SPLD_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SPLDSTORAGEDISPOSALSTATEMENT21581 
      ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_SPLD_STORAGEDISPOSALSECTIO ) ;
 
/* Index for Relationship - 'S_STORAGEDISPOSALSTATEMENT(has [0:m] ) SPLD_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SPLDSTORAGEDISPOSALSTATEMENT21584 
      ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_S_STORAGEDISPOSALSTATEMENT ) ;
 
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
 
/* Main key for Entity - SPLD_Usage */
CREATE UNIQUE INDEX USPLD_USAGE_ID_2155440 
      ON SPLD_USAGE ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLD_USAGE_FK_ID_SPLD_USAGE_21571 
      ON SPLD_USAGE ( 
           FK_ID_SPLD_USAGE ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has (delete) [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLDUSAGEFKIDSUBREGPHYSICALL21581 
      ON SPLD_USAGE ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Index for Relationship - 'S_USAGE(has [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLD_USAGE_FK_ID_S_USAGE_2158150 
      ON SPLD_USAGE ( 
           FK_ID_S_USAGE ) ;
 
/* Index for Relationship - 'SPLD_USAGETYPE(has [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLD_USAGE_FKIDSPLDUSAGETYPE21588 
      ON SPLD_USAGE ( 
           FK_ID_SPLD_USAGETYPE ) ;
 
/* Entity - SPLD_UsageOrdering */
CREATE TABLE SPLD_USAGEORDERING ( 
           ID                                 int                NOT NULL, 
           AUTOSEQ                            int                NULL    , 
           AUTOSEQ02                          int                NULL    , 
           FK_ID_SPLD_USAGE                   int                NOT NULL, 
           FK_ID_SPLD_MARKETINGSTATEMENT      int                NULL    , 
           FK_ID_SPLDDIRECTIONSFORUSESTATEM   int                NULL     ) ;
 
/* Main key for Entity - SPLD_UsageOrdering */
CREATE UNIQUE INDEX USPLD_USAGEORDERING_ID_2155520 
      ON SPLD_USAGEORDERING ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDUSA21578 
      ON SPLD_USAGEORDERING ( 
           FK_ID_SPLD_USAGE ) ;
 
/* Index for Relationship - 'SPLD_MARKETINGSTATEMENT(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDMAR21579 
      ON SPLD_USAGEORDERING ( 
           FK_ID_SPLD_MARKETINGSTATEMENT ) ;
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESTATEMENT(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDDIR21584 
      ON SPLD_USAGEORDERING ( 
           FK_ID_SPLDDIRECTIONSFORUSESTATEM ) ;
 
/* Entity - SPLD_UsageType */
CREATE TABLE SPLD_USAGETYPE ( 
           ID                                 int                NOT NULL, 
           USAGETYPE                          varchar( 1 )       NOT NULL, 
           FK_ID_SUBREGPHYSICALLABELDEF       int                NOT NULL ) ;
 
/* Main key for Entity - SPLD_UsageType */
CREATE UNIQUE INDEX USPLD_USAGETYPE_ID_2155550 
      ON SPLD_USAGETYPE ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_USAGETYPE' */
CREATE INDEX SPLDUSAGETYPEFKIDSUBREGPHYSI21588 
      ON SPLD_USAGETYPE ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Entity - Subregistrant */
CREATE TABLE SUBREGISTRANT ( 
           ID                                 int                NOT NULL, 
           EPA_COMPANYNUMBER                  varchar( 6 )       NULL    , 
           FK_ID_ORGANIZATION                 int                NOT NULL ) ;
 
/* Main key for Entity - Subregistrant */
CREATE UNIQUE INDEX USUBREGISTRANT_ID_2155590 
      ON SUBREGISTRANT ( 
           ID ) ;
 
/* Index for Relationship - 'ORGANIZATION(has [0:1] ) SUBREGISTRANT' */
CREATE INDEX SUBREGISTRANTFKIDORGANIZATIO21579 
      ON SUBREGISTRANT ( 
           FK_ID_ORGANIZATION ) ;
 
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
 
/* Main key for Entity - SubregLabelContent */
CREATE UNIQUE INDEX USUBREGLABELCONTENT_ID_2155630 
      ON SUBREGLABELCONTENT ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has next version [0:m] ) SUBREGLABELCONTENT' */
CREATE INDEX SUBREGLABELCONTENTFKIDSUBREG21581 
      ON SUBREGLABELCONTENT ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Index for Relationship - 'SUBREGPRODUCT(has [0:m] ) SUBREGLABELCONTENT' */
CREATE INDEX SUBREGLABELCONTENTFKIDSUBREG21590 
      ON SUBREGLABELCONTENT ( 
           FK_ID_SUBREGPRODUCT ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) SUBREGLABELCONTENT' */
CREATE INDEX SUBREGLABELCONTENTFKIDMASTER21590 
      ON SUBREGLABELCONTENT ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Entity - SubregPhysicalLabelDef */
CREATE TABLE SUBREGPHYSICALLABELDEF ( 
           ID                                 int                NOT NULL, 
           NAME                               varchar( 254 )     NULL    , 
           PRODUCTNAME                        varchar( 254 )     NULL    , 
           CREATEDDATETIME                    datetime           NULL    , 
           MODIFIEDDATETIME                   datetime           NULL    , 
           FK_ID_SUBREGLABELCONTENT           int                NULL     ) ;
 
/* Main key for Entity - SubregPhysicalLabelDef */
CREATE UNIQUE INDEX USUBREGPHYSICALLABELDEF_ID_215577 
      ON SUBREGPHYSICALLABELDEF ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) SUBREGPHYSICALLABELDEF' */
CREATE INDEX SUBREGPHYSICALLABELDEFFKIDSU21581 
      ON SUBREGPHYSICALLABELDEF ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
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
 
/* Main key for Entity - SubregProduct */
CREATE UNIQUE INDEX USUBREGPRODUCT_ID_2155840 
      ON SUBREGPRODUCT ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERPRODUCT(has [0:m] ) SUBREGPRODUCT' */
CREATE INDEX SUBREGPRODUCTFKIDMASTERPRODU21590 
      ON SUBREGPRODUCT ( 
           FK_ID_MASTERPRODUCT ) ;
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) SUBREGPRODUCT' */
CREATE INDEX SUBREGPRODUCTFKIDSUBREGISTRA21590 
      ON SUBREGPRODUCT ( 
           FK_ID_SUBREGISTRANT ) ;
 
/* Entity - Temp */
CREATE TABLE z_TEMP ( 
           MARGINTOP                          double             NULL    , 
           MARGINBOTTOM                       double             NULL    , 
           MARGINLEFT                         double             NULL    , 
           MARGINRIGHT                        double             NULL     ) ;
 
 
/* Entity - TOC */
CREATE TABLE TOC ( 
           ID                                 int                NOT NULL, 
           TITLE                              varchar( 254 )     NULL    , 
           z_TEXT                             varchar( 254 )     NULL    , 
           PAGE                               int                NULL    , 
           FK_ID_MASTERLABELCONTENT           int                NOT NULL ) ;
 
/* Main key for Entity - TOC */
CREATE UNIQUE INDEX UTOC_ID_2156010 
      ON TOC ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) TOC' */
CREATE INDEX TOC_FK_ID_MASTERLABELCONTENT21571 
      ON TOC ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
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
 
/* Main key for Entity - User */
CREATE UNIQUE INDEX Uz_USER_ID_2156070 
      ON z_USER ( 
           ID ) ;
/* Main key for Entity - User */
CREATE INDEX z_USER_USERNAME_2156080 
      ON z_USER ( 
           USERNAME ) ;
 
/* Index for Relationship - 'PERSON(for [0:1] ) z_USER' */
CREATE INDEX z_USER_FK_ID_PERSON_2159020 
      ON z_USER ( 
           FK_ID_PERSON ) ;
 
/* Entity - ZeidonGenkeyTable */
CREATE TABLE ZEIDONGENKEYTABLE ( 
           CURRENTGENKEY                      int                NULL    , 
           TABLENAME                          varchar( 32 )      NOT NULL ) ;
 
/* Main key for Entity - ZeidonGenkeyTable */
CREATE UNIQUE INDEX UZEIDONGENKEYTABLE_TABLENAME21562 
      ON ZEIDONGENKEYTABLE ( 
           TABLENAME ) ;
 
/* Entity - ZeidonLocking */
CREATE TABLE ZEIDONLOCKING ( 
           LOD_NAME                           varchar( 35 )      NOT NULL, 
           KEYVALUE                           varchar( 200 )     NOT NULL, 
           USERNAME                           varchar( 32 )      NOT NULL, 
           ALLOWREAD                          varchar( 1 )       NULL    , 
           z_TIMESTAMP                        datetime           NOT NULL, 
           ID                                 int                NULL     ) ;
 
/* Main key for Entity - ZeidonLocking */
CREATE UNIQUE INDEX UZEIDONLOCKING_LOCKINGKEY_2156270 
      ON ZEIDONLOCKING ( 
           LOD_NAME, 
           KEYVALUE ) ;
 
CREATE TABLE MMSUSAGEDRVSSDIRECTIONSFORUSESECT ( 
           FK_ID_S_DIRECTIONSFORUSESECTION    int                NOT NULL, 
           FK_ID_S_USAGE                      int                NOT NULL ) ;
 
CREATE UNIQUE INDEX UMMSUSAGEDRVSSDIRECTIONSFORU21574 
      ON MMSUSAGEDRVSSDIRECTIONSFORUSESECT ( 
           FK_ID_S_DIRECTIONSFORUSESECTION, 
           FK_ID_S_USAGE ) ;
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(is driven by [0:m] ) MMSUSAGEDRVSSDIRECTIONSFORUSESECT' */
CREATE INDEX MMSUSAGEDRVSSDIRECTIONSFORUS21574 
      ON MMSUSAGEDRVSSDIRECTIONSFORUSESECT ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
/* Index for Relationship - 'S_USAGE(drives [0:m] ) MMSUSAGEDRVSSDIRECTIONSFORUSESECT' */
CREATE INDEX MMSUSAGEDRVSSDIRECTIONSFORUS21574 
      ON MMSUSAGEDRVSSDIRECTIONSFORUSESECT ( 
           FK_ID_S_USAGE ) ;
 
CREATE TABLE MMMUSAGEDRVSMDIRECTIONSFORUSESECT ( 
           FK_ID_M_DIRECTIONSFORUSESECTION    int                NOT NULL, 
           FK_ID_M_USAGE                      int                NOT NULL ) ;
 
CREATE UNIQUE INDEX UMMMUSAGEDRVSMDIRECTIONSFORU21576 
      ON MMMUSAGEDRVSMDIRECTIONSFORUSESECT ( 
           FK_ID_M_DIRECTIONSFORUSESECTION, 
           FK_ID_M_USAGE ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(is driven by [0:m] ) MMMUSAGEDRVSMDIRECTIONSFORUSESECT' */
CREATE INDEX MMMUSAGEDRVSMDIRECTIONSFORUS21576 
      ON MMMUSAGEDRVSMDIRECTIONSFORUSESECT ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
/* Index for Relationship - 'M_USAGE(drives [0:m] ) MMMUSAGEDRVSMDIRECTIONSFORUSESECT' */
CREATE INDEX MMMUSAGEDRVSMDIRECTIONSFORUS21576 
      ON MMMUSAGEDRVSMDIRECTIONSFORUSESECT ( 
           FK_ID_M_USAGE ) ;
 
CREATE TABLE MM_MASTERPRODUCT_FOR_SUBREGISTRAN ( 
           FK_ID_SUBREGISTRANT                int                NOT NULL, 
           FK_ID_MASTERPRODUCT                int                NOT NULL ) ;
 
CREATE UNIQUE INDEX UMMMASTERPRODUCTFORSUBREGIST21578 
      ON MM_MASTERPRODUCT_FOR_SUBREGISTRAN ( 
           FK_ID_SUBREGISTRANT, 
           FK_ID_MASTERPRODUCT ) ;
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) MM_MASTERPRODUCT_FOR_SUBREGISTRAN' */
CREATE INDEX MMMASTERPRODUCTFORSUBREGISTR21578 
      ON MM_MASTERPRODUCT_FOR_SUBREGISTRAN ( 
           FK_ID_SUBREGISTRANT ) ;
 
/* Index for Relationship - 'MASTERPRODUCT(for [0:m] ) MM_MASTERPRODUCT_FOR_SUBREGISTRAN' */
CREATE INDEX MMMASTERPRODUCTFORSUBREGISTR21578 
      ON MM_MASTERPRODUCT_FOR_SUBREGISTRAN ( 
           FK_ID_MASTERPRODUCT ) ;
 
CREATE TABLE MMSPLDDIRECTIONSFORUSESECTIONFRSP ( 
           FK_ID_SPLD_USAGE                   int                NOT NULL, 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI   int                NOT NULL ) ;
 
CREATE UNIQUE INDEX UMMSPLDDIRECTIONSFORUSESECTI21582 
      ON MMSPLDDIRECTIONSFORUSESECTIONFRSP ( 
           FK_ID_SPLD_USAGE, 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) MMSPLDDIRECTIONSFORUSESECTIONFRSP' */
CREATE INDEX MMSPLDDIRECTIONSFORUSESECTIO21582 
      ON MMSPLDDIRECTIONSFORUSESECTIONFRSP ( 
           FK_ID_SPLD_USAGE ) ;
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESECTION(for [0:m] ) MMSPLDDIRECTIONSFORUSESECTIONFRSP' */
CREATE INDEX MMSPLDDIRECTIONSFORUSESECTIO21582 
      ON MMSPLDDIRECTIONSFORUSESECTIONFRSP ( 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
CREATE TABLE MM_SPLD_MARKETINGSECTIONFRSPLDUSA ( 
           FK_ID_SPLD_USAGE                   int                NOT NULL, 
           FK_ID_SPLD_MARKETINGSECTION        int                NOT NULL ) ;
 
CREATE UNIQUE INDEX UMMSPLDMARKETINGSECTIONFRSPL21582 
      ON MM_SPLD_MARKETINGSECTIONFRSPLDUSA ( 
           FK_ID_SPLD_USAGE, 
           FK_ID_SPLD_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) MM_SPLD_MARKETINGSECTIONFRSPLDUSA' */
CREATE INDEX MMSPLDMARKETINGSECTIONFRSPLD21582 
      ON MM_SPLD_MARKETINGSECTIONFRSPLDUSA ( 
           FK_ID_SPLD_USAGE ) ;
 
/* Index for Relationship - 'SPLD_MARKETINGSECTION(for [0:m] ) MM_SPLD_MARKETINGSECTIONFRSPLDUSA' */
CREATE INDEX MMSPLDMARKETINGSECTIONFRSPLD21582 
      ON MM_SPLD_MARKETINGSECTIONFRSPLDUSA ( 
           FK_ID_SPLD_MARKETINGSECTION ) ;
 
