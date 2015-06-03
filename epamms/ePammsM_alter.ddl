/* Alter script for ePammsM -- MySQL ePamms database */
/* Entity - Address */
CREATE TABLE ADDRESS ( 
           ID                               int                NOT NULL, 
           DESCRIPTION                      varchar( 128 )     NULL    , 
           ADDRESS                          varchar( 128 )     NULL    , 
           ADDRESSLINE2                     varchar( 128 )     NULL    , 
           CITY                             varchar( 128 )     NULL    , 
           STATE                            varchar( 2 )       NULL    , 
           COUNTRY                          varchar( 128 )     NULL    , 
           COUNTY                           varchar( 128 )     NULL    , 
           ZIPCODE                          varchar( 10 )      NULL    , 
           PHONE                            varchar( 11 )      NULL    , 
           FAX                              varchar( 11 )      NULL    , 
           TOLLFREEPHONE                    varchar( 11 )      NULL    , 
           EMERGENCYPHONE                   varchar( 11 )      NULL    , 
           ATTENTIONLINE                    varchar( 128 )     NULL    , 
           TIMEZONE                         varchar( 128 )     NULL    , 
           SHIPPINGFLAG                     varchar( 1 )       NULL    , 
           CREATEDDATETIME                  datetime           NULL    , 
           MODIFIEDDATETIME                 datetime           NULL    , 
           CREATEDBY                        varchar( 128 )     NULL    , 
           LASTMODIFIEDBY                   varchar( 128 )     NULL    , 
           FK_ID_ORGANIZATION               int                NULL    , 
           FK_ID_ORGANIZATION02             int                NULL     ) ;
 
/* Main key for Entity - Address */
CREATE UNIQUE INDEX UADDRESS_ID_1043940 
       ON ADDRESS ( 
           ID ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_PHONE1_1044030 
       ON ADDRESS ( 
           PHONE ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_CITY_1043980 
       ON ADDRESS ( 
           CITY ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_STATE_1043990 
       ON ADDRESS ( 
           STATE ) ;
/* Main key for Entity - Address */
CREATE INDEX ADDRESS_ZIPCODE_1044020 
       ON ADDRESS ( 
           ZIPCODE ) ;
 
/* Index for Relationship - 'ORGANIZATION(has mail [0:1] ) ADDRESS' */
CREATE INDEX ADDRESS_FK_ID_ORGANIZATION105437 
       ON ADDRESS ( 
           FK_ID_ORGANIZATION ) ;
 
/* Index for Relationship - 'ORGANIZATION(has [0:1] ) ADDRESS' */
CREATE INDEX ADDRESS_FKIDORGANIZATION02105438 
       ON ADDRESS ( 
           FK_ID_ORGANIZATION02 ) ;
 
/* Entity - Color */
CREATE TABLE COLOR ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 32 )      NOT NULL, 
           RGB                              varchar( 6 )       NOT NULL, 
           C                                int                NULL    , 
           M                                int                NULL    , 
           Y                                int                NULL    , 
           K                                int                NULL    , 
           PANTONE                          varchar( 32 )      NULL    , 
           FK_ID_SUBREGISTRANT              int                NOT NULL ) ;
 
/* Main key for Entity - Color */
CREATE UNIQUE INDEX UCOLOR_ID_1044200 
       ON COLOR ( 
           ID ) ;
/* Main key for Entity - Color */
CREATE INDEX COLOR_NAME_1044210 
       ON COLOR ( 
           NAME ) ;
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) COLOR' */
CREATE INDEX COLOR_FK_ID_SUBREGISTRANT_105398 
       ON COLOR ( 
           FK_ID_SUBREGISTRANT ) ;
 
/* Entity - Domain */
CREATE TABLE z_DOMAIN ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 128 )     NOT NULL, 
           z_DESC                           varchar( 254 )     NULL    , 
           SYSTEMREQUIRED                   varchar( 1 )       NULL     ) ;
 
/* Main key for Entity - Domain */
CREATE UNIQUE INDEX Uz_DOMAIN_ID_1044310 
       ON z_DOMAIN ( 
           ID ) ;
 
/* Entity - DomainValue */
CREATE TABLE DOMAINVALUE ( 
           DOMAINVALUE_TOKEN                int                NOT NULL, 
           INTERNALINTEGERVALUE             int                NULL    , 
           INTERNALSTRINGVALUE              varchar( 128 )     NULL    , 
           SYSTEMREQUIRED                   varchar( 1 )       NULL    , 
           EXTERNALDESCRIPTION              varchar( 128 )     NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_Z_DOMAIN                   int                NOT NULL ) ;
 
/* Main key for Entity - DomainValue */
CREATE UNIQUE INDEX UDOMAINVALUE_DOMAINVALUEID104442 
       ON DOMAINVALUE ( 
           DOMAINVALUE_TOKEN ) ;
 
/* Index for Relationship - 'z_DOMAIN(has [0:m] ) DOMAINVALUE' */
CREATE INDEX DOMAINVALUE_FK_ID_Z_DOMAIN105557 
       ON DOMAINVALUE ( 
           FK_ID_Z_DOMAIN ) ;
 
/* Entity - EPA_ApplicationType */
CREATE TABLE EPA_APPLICATIONTYPE ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NOT NULL, 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY         int                NOT NULL ) ;
 
/* Main key for Entity - EPA_ApplicationType */
CREATE UNIQUE INDEX UEPA_APPLICATIONTYPE_ID_1044440 
       ON EPA_APPLICATIONTYPE ( 
           ID ) ;
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_APPLICATIONTYPE' */
CREATE INDEX EPAAPPLICATIONTYPEFKIDEPAC105427 
       ON EPA_APPLICATIONTYPE ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
/* Entity - EPA_AreaOfUse */
CREATE TABLE EPA_AREAOFUSE ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NOT NULL, 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY         int                NOT NULL ) ;
 
/* Main key for Entity - EPA_AreaOfUse */
CREATE UNIQUE INDEX UEPA_AREAOFUSE_ID_1044490 
       ON EPA_AREAOFUSE ( 
           ID ) ;
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_AREAOFUSE' */
CREATE INDEX EPAAREAOFUSEFKIDEPACHEMICA105539 
       ON EPA_AREAOFUSE ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
/* Entity - EPA_ChemicalFamily */
CREATE TABLE EPA_CHEMICALFAMILY ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NOT NULL, 
           DESCRIPTION                      varchar( 254 )     NULL    , 
           CHEMICALFAMILY                   varchar( 2 )       NOT NULL, 
           FK_ID_EPAMMS                     int                NOT NULL ) ;
 
/* Main key for Entity - EPA_ChemicalFamily */
CREATE UNIQUE INDEX UEPA_CHEMICALFAMILY_ID_1044540 
       ON EPA_CHEMICALFAMILY ( 
           ID ) ;
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) EPA_CHEMICALFAMILY' */
CREATE INDEX EPACHEMICALFAMILYFKIDEPAMM105425 
       ON EPA_CHEMICALFAMILY ( 
           FK_ID_EPAMMS ) ;
 
/* Entity - EPA_Claim */
CREATE TABLE EPA_CLAIM ( 
           ID                               int                NOT NULL, 
           CLAIMSCLASSIFICATION             varchar( 16 )      NULL    , 
           NAME                             varchar( 254 )     NOT NULL, 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY         int                NOT NULL ) ;
 
/* Main key for Entity - EPA_Claim */
CREATE UNIQUE INDEX UEPA_CLAIM_ID_1044600 
       ON EPA_CLAIM ( 
           ID ) ;
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_CLAIM' */
CREATE INDEX EPACLAIMFKIDEPACHEMICALFAM105498 
       ON EPA_CLAIM ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
/* Entity - EPA_StorageDisposal */
CREATE TABLE EPA_STORAGEDISPOSAL ( 
           ID                               int                NOT NULL, 
           NAME                             longtext           NOT NULL, 
           DESCRIPTION                      longtext           NULL    , 
           z_VOLUME                         double             NULL    , 
           UNITS                            varchar( 254 )     NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY         int                NOT NULL ) ;
 
/* Main key for Entity - EPA_StorageDisposal */
CREATE UNIQUE INDEX UEPA_STORAGEDISPOSAL_ID_1044660 
       ON EPA_STORAGEDISPOSAL ( 
           ID ) ;
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_STORAGEDISPOSAL' */
CREATE INDEX EPASTORAGEDISPOSALFKIDEPAC105538 
       ON EPA_STORAGEDISPOSAL ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
/* Entity - EPA_Surface */
CREATE TABLE EPA_SURFACE ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NOT NULL, 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_EPA_CHEMICALFAMILY         int                NOT NULL ) ;
 
/* Main key for Entity - EPA_Surface */
CREATE UNIQUE INDEX UEPA_SURFACE_ID_1044730 
       ON EPA_SURFACE ( 
           ID ) ;
 
/* Index for Relationship - 'EPA_CHEMICALFAMILY(has [0:m] ) EPA_SURFACE' */
CREATE INDEX EPASURFACEFKIDEPACHEMICALF105540 
       ON EPA_SURFACE ( 
           FK_ID_EPA_CHEMICALFAMILY ) ;
 
/* Entity - ePamms */
CREATE TABLE EPAMMS ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 128 )     NOT NULL ) ;
 
/* Main key for Entity - ePamms */
CREATE UNIQUE INDEX UEPAMMS_ID_1044780 
       ON EPAMMS ( 
           ID ) ;
 
/* Entity - Feedback */
CREATE TABLE FEEDBACK ( 
           ID                               int                NOT NULL, 
           USERID                           varchar( 32 )      NOT NULL, 
           DIALOG                           varchar( 32 )      NULL    , 
           WINDOW                           varchar( 32 )      NULL    , 
           COMMENT                          longtext           NULL    , 
           FK_ID_ORGANIZATION               int                NOT NULL ) ;
 
/* Main key for Entity - Feedback */
CREATE UNIQUE INDEX UFEEDBACK_ID_1044820 
       ON FEEDBACK ( 
           ID ) ;
 
/* Index for Relationship - 'ORGANIZATION(has [0:m] ) FEEDBACK' */
CREATE INDEX FEEDBACK_FK_IDORGANIZATION105424 
       ON FEEDBACK ( 
           FK_ID_ORGANIZATION ) ;
 
/* Entity - GraphicLabelControl */
CREATE TABLE GRAPHICLABELCONTROL ( 
           ID                               int                NOT NULL, 
           POSITIONX                        int                NULL    , 
           POSITIONY                        varchar( 254 )     NULL    , 
           SIZEX                            int                NULL    , 
           SIZEY                            int                NULL    , 
           FONT                             varchar( 254 )     NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_GRAPHICLABELDEFINITION     int                NOT NULL ) ;
 
/* Main key for Entity - GraphicLabelControl */
CREATE UNIQUE INDEX UGRAPHICLABELCONTROL_ID_1044890 
       ON GRAPHICLABELCONTROL ( 
           ID ) ;
 
/* Index for Relationship - 'GRAPHICLABELDEFINITION(has [0:m] ) GRAPHICLABELCONTROL' */
CREATE INDEX GRAPHICLABELCONTROLFKIDGRA105549 
       ON GRAPHICLABELCONTROL ( 
           FK_ID_GRAPHICLABELDEFINITION ) ;
 
/* Entity - GraphicLabelDefinition */
CREATE TABLE GRAPHICLABELDEFINITION ( 
           ID                               int                NOT NULL, 
           PRODUCTNAME                      varchar( 254 )     NULL    , 
           HEIGHT                           double             NULL    , 
           WIDTH                            double             NULL    , 
           NETCONTENTSTEXT                  varchar( 254 )     NULL    , 
           FK_ID_SUBREGISTRANT              int                NOT NULL, 
           FK_ID_SUBREGLABELCONTENT         int                NULL     ) ;
 
/* Main key for Entity - GraphicLabelDefinition */
CREATE UNIQUE INDEX UGRAPHICLABELDEFINITION_ID104497 
       ON GRAPHICLABELDEFINITION ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) GRAPHICLABELDEFINITION' */
CREATE INDEX GRAPHICLABELDEFINITIONFKID105547 
       ON GRAPHICLABELDEFINITION ( 
           FK_ID_SUBREGISTRANT ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) GRAPHICLABELDEFINITION' */
CREATE INDEX GRAPHICLABELDEFINITIONFKID105548 
       ON GRAPHICLABELDEFINITION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Entity - Keyword */
CREATE TABLE KEYWORD ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NOT NULL, 
           FK_ID_EPAMMS                     int                NULL     ) ;
 
/* Main key for Entity - Keyword */
CREATE UNIQUE INDEX UKEYWORD_ID_1045040 
       ON KEYWORD ( 
           ID ) ;
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) KEYWORD' */
CREATE INDEX KEYWORD_FK_ID_EPAMMS_1054260 
       ON KEYWORD ( 
           FK_ID_EPAMMS ) ;
 
/* Entity - LLD */
CREATE TABLE LLD ( 
           ID                               int                NOT NULL, 
           TAG                              varchar( 64 )      NULL    , 
           NAME                             varchar( 128 )     NULL    , 
           CSS_FILENAME                     varchar( 254 )     NULL    , 
           BACKGROUNDCOLOR                  varchar( 254 )     NULL    , 
           HAZARDPANEL                      int                NULL    , 
           CONTINUATIONPREVIOUSPAGETEXT     longtext           NULL    , 
           CONTNEXTPAGETEXTMARKETING        longtext           NULL    , 
           CONTNEXTPAGETEXTDIRFORUSE        longtext           NULL    , 
           DEFAULTTEXTFONTFAMILY            varchar( 20 )      NULL    , 
           DEFAULTTEXTFONTSIZE              varchar( 20 )      NULL    , 
           DEFAULTFONTCOLOR                 varchar( 20 )      NULL    , 
           DEFAULTTITLEMARGINTOP            double             NULL    , 
           DEFAULTTITLEMARGINBOTTOM         double             NULL    , 
           DEFAULTTEXTMARGINTOP             double             NULL    , 
           DEFAULTTEXTMARGINBOTTOM          double             NULL    , 
           DEPTH                            int                NULL     ) ;
 
/* Main key for Entity - LLD */
CREATE UNIQUE INDEX ULLD_ID_1045080 
       ON LLD ( 
           ID ) ;
 
/* Entity - LLD_Block */
CREATE TABLE LLD_BLOCK ( 
           ID                               int                NOT NULL, 
           TAG                              varchar( 64 )      NULL    , 
           NAME                             varchar( 128 )     NULL    , 
           BLOCKTITLE                       varchar( 254 )     NULL    , 
           LLD_SECTIONTYPE                  varchar( 32 )      NULL    , 
           LLD_COLUMNLISTTYPE               varchar( 2 )       NULL    , 
           CONTINUATIONBLOCKFLAG            varchar( 1 )       NULL    , 
           IMAGENAME                        varchar( 254 )     NULL    , 
           z_TOP                            double             NULL    , 
           z_LEFT                           double             NULL    , 
           HEIGHT                           double             NULL    , 
           WIDTH                            double             NULL    , 
           TEXTCOLOR                        varchar( 32 )      NULL    , 
           TEXTCOLOROVERRIDE                varchar( 1 )       NULL    , 
           BACKGROUNDCOLOR                  varchar( 32 )      NULL    , 
           BACKGROUNDCOLOROVERRIDE          varchar( 1 )       NULL    , 
           BORDERCOLOR                      varchar( 32 )      NULL    , 
           BORDERCOLOROVERRIDE              varchar( 1 )       NULL    , 
           BORDERSTYLE                      varchar( 20 )      NULL    , 
           BORDERWIDTH                      int                NULL    , 
           FONTFAMILY                       varchar( 20 )      NULL    , 
           FONTSIZE                         varchar( 20 )      NULL    , 
           FONTWEIGHT                       varchar( 20 )      NULL    , 
           MARGIN                           double             NULL    , 
           MARGINTOP                        double             NULL    , 
           MARGINBOTTOM                     double             NULL    , 
           MARGINLEFT                       double             NULL    , 
           MARGINRIGHT                      double             NULL    , 
           MARGINOVERRIDE                   varchar( 1 )       NULL    , 
           BORDER                           double             NULL    , 
           BORDERTOP                        double             NULL    , 
           BORDERBOTTOM                     double             NULL    , 
           BORDERLEFT                       double             NULL    , 
           BORDERRIGHT                      double             NULL    , 
           BORDEROVERRIDE                   varchar( 1 )       NULL    , 
           PADDING                          double             NULL    , 
           PADDINGTOP                       double             NULL    , 
           PADDINGBOTTOM                    double             NULL    , 
           PADDINGLEFT                      double             NULL    , 
           PADDINGRIGHT                     double             NULL    , 
           PADDINGOVERRIDE                  varchar( 1 )       NULL    , 
           TITLEPOSITION                    varchar( 5 )       NULL    , 
           CAPITALIZETITLETEXTFLAG          varchar( 1 )       NULL    , 
           TEXTALIGN                        varchar( 20 )      NULL    , 
           TEXTLINEHEIGHT                   double             NULL    , 
           TEXTLETTERSPACE                  double             NULL    , 
           DEPTH                            int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           BG_ID_COLOR                      int                NULL    , 
           BD_ID_COLOR                      int                NULL    , 
           TX_ID_COLOR                      int                NULL    , 
           FK_ID_SPLD_SECTION               int                NULL    , 
           FK_ID_LLD_PANEL                  int                NULL    , 
           FK_ID_LLD_BLOCK                  int                NULL     ) ;
 
/* Main key for Entity - LLD_Block */
CREATE UNIQUE INDEX ULLD_BLOCK_ID_1045270 
       ON LLD_BLOCK ( 
           ID ) ;
 
/* Index for Relationship - 'COLOR(is background for [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_BG_ID_COLOR_1053950 
       ON LLD_BLOCK ( 
           BG_ID_COLOR ) ;
 
/* Index for Relationship - 'COLOR(is border for [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_BD_ID_COLOR_1053960 
       ON LLD_BLOCK ( 
           BD_ID_COLOR ) ;
 
/* Index for Relationship - 'COLOR(is Text for [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_TX_ID_COLOR_1053970 
       ON LLD_BLOCK ( 
           TX_ID_COLOR ) ;
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_FK_IDSPLDSECTION105423 
       ON LLD_BLOCK ( 
           FK_ID_SPLD_SECTION ) ;
 
/* Index for Relationship - 'LLD_PANEL(has [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_FK_ID_LLD_PANEL_105477 
       ON LLD_BLOCK ( 
           FK_ID_LLD_PANEL ) ;
 
/* Index for Relationship - 'LLD_BLOCK(is linked to [0:m] ) LLD_BLOCK' */
CREATE INDEX LLD_BLOCK_FK_ID_LLD_BLOCK_105484 
       ON LLD_BLOCK ( 
           FK_ID_LLD_BLOCK ) ;
 
/* Entity - LLD_Page */
CREATE TABLE LLD_PAGE ( 
           ID                               int                NOT NULL, 
           TAG                              varchar( 64 )      NULL    , 
           NAME                             varchar( 128 )     NULL    , 
           HEIGHT                           double             NULL    , 
           WIDTH                            double             NULL    , 
           BACKGROUNDCOLOR                  varchar( 32 )      NULL    , 
           BACKGROUNDCOLOROVERRIDE          varchar( 1 )       NULL    , 
           PAGENBR                          int                NULL    , 
           DEPTH                            int                NULL    , 
           FK_ID_COLOR                      int                NULL    , 
           FK_ID_LLD                        int                NULL    , 
           FK_ID_SPLD_LLD                   int                NULL     ) ;
 
/* Main key for Entity - LLD_Page */
CREATE UNIQUE INDEX ULLD_PAGE_ID_1045760 
       ON LLD_PAGE ( 
           ID ) ;
 
/* Index for Relationship - 'COLOR(is background for [0:m] ) LLD_PAGE' */
CREATE INDEX LLD_PAGE_FK_ID_COLOR_1053920 
       ON LLD_PAGE ( 
           FK_ID_COLOR ) ;
 
/* Index for Relationship - 'LLD(has [0:m] ) LLD_PAGE' */
CREATE INDEX LLD_PAGE_FK_ID_LLD_1054190 
       ON LLD_PAGE ( 
           FK_ID_LLD ) ;
 
/* Index for Relationship - 'SPLD_LLD(has [0:m] ) LLD_PAGE' */
CREATE INDEX LLD_PAGE_FK_ID_SPLD_LLD_1054200 
       ON LLD_PAGE ( 
           FK_ID_SPLD_LLD ) ;
 
/* Entity - LLD_Panel */
CREATE TABLE LLD_PANEL ( 
           ID                               int                NOT NULL, 
           TAG                              varchar( 64 )      NULL    , 
           NAME                             varchar( 128 )     NULL    , 
           PANELNUMBER                      int                NULL    , 
           LLD_SECTIONTYPE                  varchar( 32 )      NULL    , 
           LLD_COLUMNLISTTYPE               varchar( 2 )       NULL    , 
           CONTINUATIONBLOCKFLAG            varchar( 1 )       NULL    , 
           IMAGENAME                        varchar( 254 )     NULL    , 
           z_TOP                            double             NULL    , 
           z_LEFT                           double             NULL    , 
           HEIGHT                           double             NULL    , 
           WIDTH                            double             NULL    , 
           TEXTCOLOR                        varchar( 32 )      NULL    , 
           TEXTCOLOROVERRIDE                varchar( 1 )       NULL    , 
           BACKGROUNDCOLOR                  varchar( 32 )      NULL    , 
           BACKGROUNDCOLOROVERRIDE          varchar( 1 )       NULL    , 
           BORDERCOLOR                      varchar( 32 )      NULL    , 
           BORDERCOLOROVERRIDE              varchar( 1 )       NULL    , 
           BORDERSTYLE                      varchar( 20 )      NULL    , 
           BORDERWIDTH                      double             NULL    , 
           FONTFAMILY                       varchar( 20 )      NULL    , 
           FONTSIZE                         varchar( 20 )      NULL    , 
           FONTWEIGHT                       varchar( 20 )      NULL    , 
           MARGIN                           double             NULL    , 
           MARGINTOP                        double             NULL    , 
           MARGINBOTTOM                     double             NULL    , 
           MARGINLEFT                       double             NULL    , 
           MARGINRIGHT                      double             NULL    , 
           MARGINOVERRIDE                   varchar( 1 )       NULL    , 
           BORDER                           double             NULL    , 
           BORDERTOP                        double             NULL    , 
           BORDERBOTTOM                     double             NULL    , 
           BORDERLEFT                       double             NULL    , 
           BORDERRIGHT                      double             NULL    , 
           BORDEROVERRIDE                   varchar( 1 )       NULL    , 
           PADDING                          double             NULL    , 
           PADDINGTOP                       double             NULL    , 
           PADDINGBOTTOM                    double             NULL    , 
           PADDINGLEFT                      double             NULL    , 
           PADDINGRIGHT                     double             NULL    , 
           PADDINGOVERRIDE                  varchar( 1 )       NULL    , 
           TITLEPOSITION                    varchar( 5 )       NULL    , 
           CAPITALIZETITLETEXTFLAG          varchar( 1 )       NULL    , 
           TEXTALIGN                        varchar( 20 )      NULL    , 
           TEXTLINEHEIGHT                   double             NULL    , 
           TEXTLETTERSPACE                  double             NULL    , 
           BLOCKTITLE                       varchar( 254 )     NULL    , 
           DEPTH                            int                NULL    , 
           BG_ID_COLOR                      int                NULL    , 
           BD_ID_COLOR                      int                NULL    , 
           FK_ID_LLD_PAGE                   int                NOT NULL ) ;
 
/* Main key for Entity - LLD_Panel */
CREATE UNIQUE INDEX ULLD_PANEL_ID_1045870 
       ON LLD_PANEL ( 
           ID ) ;
 
/* Index for Relationship - 'COLOR(is background for [0:m] ) LLD_PANEL' */
CREATE INDEX LLD_PANEL_BG_ID_COLOR_1053930 
       ON LLD_PANEL ( 
           BG_ID_COLOR ) ;
 
/* Index for Relationship - 'COLOR(is border for [0:m] ) LLD_PANEL' */
CREATE INDEX LLD_PANEL_BD_ID_COLOR_1053940 
       ON LLD_PANEL ( 
           BD_ID_COLOR ) ;
 
/* Index for Relationship - 'LLD_PAGE(has [0:m] ) LLD_PANEL' */
CREATE INDEX LLD_PANEL_FK_ID_LLD_PAGE_1054180 
       ON LLD_PANEL ( 
           FK_ID_LLD_PAGE ) ;
 
/* Entity - LLD_SpecialSectionAttribute */
CREATE TABLE LLD_SPECIALSECTIONATTRIBUTE ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 128 )     NULL    , 
           PF1ID_LLD_BLOCK                  int                NOT NULL, 
           PF2ID_LLD_BLOCK                  int                NULL     ) ;
 
/* Main key for Entity - LLD_SpecialSectionAttribute */
CREATE UNIQUE INDEX ULLDSPECIALSECTIONATTRIBUT104637 
       ON LLD_SPECIALSECTIONATTRIBUTE ( 
           ID ) ;
 
/* Index for Relationship - 'LLD_BLOCK(contains [0:m] ) LLD_SPECIALSECTIONATTRIBUTE' */
CREATE INDEX LLDSPECIALSECTIONATTRIBUT1105421 
       ON LLD_SPECIALSECTIONATTRIBUTE ( 
           PF1ID_LLD_BLOCK ) ;
 
/* Index for Relationship - 'LLD_BLOCK(is text characteristics (max 1) [0:m] ) LLD_SPECIALSECTIONATTRIBUTE' */
CREATE INDEX LLDSPECIALSECTIONATTRIBUT2105422 
       ON LLD_SPECIALSECTIONATTRIBUTE ( 
           PF2ID_LLD_BLOCK ) ;
 
/* Entity - M_DilutionChartEntry */
CREATE TABLE M_DILUTIONCHARTENTRY ( 
           ID                               int                NOT NULL, 
           PRODUCTAMOUNTTEXT                varchar( 254 )     NULL    , 
           WATERAMOUNTTEXT                  varchar( 254 )     NULL    , 
           FK_ID_MASTERLABELCONTENT         int                NOT NULL ) ;
 
/* Main key for Entity - M_DilutionChartEntry */
CREATE UNIQUE INDEX UM_DILUTIONCHARTENTRY_ID_1046410 
       ON M_DILUTIONCHARTENTRY ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_DILUTIONCHARTENTRY' */
CREATE INDEX MDILUTIONCHARTENTRYFKIDMAS105406 
       ON M_DILUTIONCHARTENTRY ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Entity - M_DilutionGroup */
CREATE TABLE M_DILUTIONGROUP ( 
           ID                               int                NOT NULL, 
           DILUTIONRATIOTEXT                varchar( 254 )     NULL    , 
           DILUTIONQUATTEXT                 varchar( 254 )     NULL    , 
           FK_ID_MASTERLABELCONTENT         int                NOT NULL ) ;
 
/* Main key for Entity - M_DilutionGroup */
CREATE UNIQUE INDEX UM_DILUTIONGROUP_ID_1046460 
       ON M_DILUTIONGROUP ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_DILUTIONGROUP' */
CREATE INDEX MDILUTIONGROUPFKIDMASTERLA105407 
       ON M_DILUTIONGROUP ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Entity - M_DilutionGroupItem */
CREATE TABLE M_DILUTIONGROUPITEM ( 
           ID                               int                NOT NULL, 
           z_TEXT                           varchar( 254 )     NULL    , 
           FK_ID_M_DILUTIONGROUP            int                NOT NULL ) ;
 
/* Main key for Entity - M_DilutionGroupItem */
CREATE UNIQUE INDEX UM_DILUTIONGROUPITEM_ID_1046510 
       ON M_DILUTIONGROUPITEM ( 
           ID ) ;
 
/* Index for Relationship - 'M_DILUTIONGROUP(has [0:m] ) M_DILUTIONGROUPITEM' */
CREATE INDEX MDILUTIONGROUPITEMFKIDMDIL105408 
       ON M_DILUTIONGROUPITEM ( 
           FK_ID_M_DILUTIONGROUP ) ;
 
/* Entity - M_DirectionsForUseSection */
CREATE TABLE M_DIRECTIONSFORUSESECTION ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           SUBTITLE                         varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           GENERALUSE                       varchar( 1 )       NULL    , 
           STATEMENTLISTTYPE                varchar( 254 )     NULL    , 
           NUMBEREACHSTATEMENT              varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           DELETEDFLAG                      varchar( 1 )       NULL    , 
           STATEMENTSELECTEDBYUSAGEFLAG     varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_MASTERLABELCONTENT         int                NOT NULL, 
           FK_ID_M_DIRECTIONSFORUSESECTION  int                NULL     ) ;
 
/* Main key for Entity - M_DirectionsForUseSection */
CREATE UNIQUE INDEX UMDIRECTIONSFORUSESECTIONI104655 
       ON M_DIRECTIONSFORUSESECTION ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_DIRECTIONSFORUSESECTION' */
CREATE INDEX MDIRECTIONSFORUSESECTIONFK105497 
       ON M_DIRECTIONSFORUSESECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has next version [0:m] ) M_DIRECTIONSFORUSESECTION' */
CREATE INDEX MDIRECTIONSFORUSESECTIONFK105508 
       ON M_DIRECTIONSFORUSESECTION ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
/* Entity - M_DirectionsForUseStatement */
CREATE TABLE M_DIRECTIONSFORUSESTATEMENT ( 
           ID                               int                NOT NULL, 
           TITLE                            varchar( 254 )     NULL    , 
           z_TEXT                           longtext           NULL    , 
           NOTFORUSETEXT                    longtext           NULL    , 
           NOTFORUSETYPE                    varchar( 2 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           DELETEDFLAG                      varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESECTION  int                NOT NULL, 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN int                NULL     ) ;
 
/* Main key for Entity - M_DirectionsForUseStatement */
CREATE UNIQUE INDEX UMDIRECTIONSFORUSESTATEMEN104669 
       ON M_DIRECTIONSFORUSESTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has [0:m] ) M_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX MDIRECTIONSFORUSESTATEMENT105491 
       ON M_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has next version [0:m] ) M_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX MDIRECTIONSFORUSESTATEMENT105496 
       ON M_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
/* Entity - M_GeneralSection */
CREATE TABLE M_GENERALSECTION ( 
           ID                               int                NOT NULL, 
           CONTAINERVOLUME                  varchar( 254 )     NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           SUBTITLE                         varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           SECTIONTYPE                      varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           CONTACTNOTE                      longtext           NULL    , 
           NOTETOPHYSICIAN                  longtext           NULL    , 
           DELETEDFLAG                      varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_MASTERLABELCONTENT         int                NOT NULL, 
           FK_ID_M_GENERALSECTION           int                NULL     ) ;
 
/* Main key for Entity - M_GeneralSection */
CREATE UNIQUE INDEX UM_GENERALSECTION_ID_1046790 
       ON M_GENERALSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_GENERALSECTION' */
CREATE INDEX MGENERALSECTIONFKIDMASTERL105478 
       ON M_GENERALSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'M_GENERALSECTION(has next version [0:m] ) M_GENERALSECTION' */
CREATE INDEX MGENERALSECTIONFKIDMGENERA105486 
       ON M_GENERALSECTION ( 
           FK_ID_M_GENERALSECTION ) ;
 
/* Entity - M_GeneralStatement */
CREATE TABLE M_GENERALSTATEMENT ( 
           ID                               int                NOT NULL, 
           TITLE                            varchar( 254 )     NULL    , 
           z_TEXT                           longtext           NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           DELETEDFLAG                      varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_GENERALSECTION           int                NOT NULL, 
           FK_ID_M_GENERALSTATEMENT         int                NULL     ) ;
 
/* Main key for Entity - M_GeneralStatement */
CREATE UNIQUE INDEX UM_GENERALSTATEMENT_ID_1046920 
       ON M_GENERALSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) M_GENERALSTATEMENT' */
CREATE INDEX MGENERALSTATEMENTFKIDMGENE105479 
       ON M_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSECTION ) ;
 
/* Index for Relationship - 'M_GENERALSTATEMENT(has next version [0:m] ) M_GENERALSTATEMENT' */
CREATE INDEX MGENERALSTATEMENTFKIDMGENE105482 
       ON M_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSTATEMENT ) ;
 
/* Entity - M_HumanHazardSection */
CREATE TABLE M_HUMANHAZARDSECTION ( 
           ID                               int                NOT NULL, 
           EPA_SIGNALWORD                   varchar( 32 )      NULL    , 
           EPA_CHILDHAZARDWARNING           varchar( 1 )       NULL    , 
           PRECAUTIONARYSTATEMENT           longtext           NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           LOCATIONSEPARATOR                varchar( 2 )       NULL    , 
           ENCLOSEFIRSTLOCATION             varchar( 1 )       NULL    , 
           PANELLOC1                        varchar( 254 )     NULL    , 
           PANELLOC2                        varchar( 254 )     NULL    , 
           PANELLOC3                        varchar( 254 )     NULL    , 
           PANELLOC4                        varchar( 254 )     NULL    , 
           PANELLOC5                        varchar( 254 )     NULL    , 
           LABELLOC1                        varchar( 254 )     NULL    , 
           LABELLOC2                        varchar( 254 )     NULL    , 
           LABELLOC3                        varchar( 254 )     NULL    , 
           LABELLOC4                        varchar( 254 )     NULL    , 
           LABELLOC5                        varchar( 254 )     NULL    , 
           DELETEDFLAG                      varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_MASTERLABELCONTENT         int                NOT NULL, 
           FK_ID_M_HUMANHAZARDSECTION       int                NULL     ) ;
 
/* Main key for Entity - M_HumanHazardSection */
CREATE UNIQUE INDEX UM_HUMANHAZARDSECTION_ID_1046990 
       ON M_HUMANHAZARDSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:1] ) M_HUMANHAZARDSECTION' */
CREATE INDEX MHUMANHAZARDSECTIONFKIDMAS105503 
       ON M_HUMANHAZARDSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'M_HUMANHAZARDSECTION(has next version [0:m] ) M_HUMANHAZARDSECTION' */
CREATE INDEX MHUMANHAZARDSECTIONFKIDMHU105512 
       ON M_HUMANHAZARDSECTION ( 
           FK_ID_M_HUMANHAZARDSECTION ) ;
 
/* Entity - M_IngredientsSection */
CREATE TABLE M_INGREDIENTSSECTION ( 
           ID                               int                NOT NULL, 
           ACTIVETITLE                      varchar( 254 )     NULL    , 
           ACTIVEBOLDITALIC                 varchar( 1 )       NULL    , 
           ARSENICPRECAUTIONARYTEXT         varchar( 254 )     NULL    , 
           INERTTITLE                       varchar( 254 )     NULL    , 
           INERTBOLDITALIC                  varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           GENERALINACTIVEPERCENT           double             NULL    , 
           DELETEDFLAG                      varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_INGREDIENTSSECTION       int                NULL    , 
           FK_ID_MASTERLABELCONTENT         int                NOT NULL ) ;
 
/* Main key for Entity - M_IngredientsSection */
CREATE UNIQUE INDEX UM_INGREDIENTSSECTION_ID_1047190 
       ON M_INGREDIENTSSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has next version [0:m] ) M_INGREDIENTSSECTION' */
CREATE INDEX MINGREDIENTSSECTIONFKIDMIN105534 
       ON M_INGREDIENTSSECTION ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:1] ) M_INGREDIENTSSECTION' */
CREATE INDEX MINGREDIENTSSECTIONFKIDMAS105541 
       ON M_INGREDIENTSSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Entity - M_IngredientsStatement */
CREATE TABLE M_INGREDIENTSSTATEMENT ( 
           ID                               int                NOT NULL, 
           CHEMICALNAME                     varchar( 254 )     NOT NULL, 
           COMMONNAME                       varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           ACTIVE                           varchar( 1 )       NOT NULL, 
           PROMPT                           varchar( 254 )     NULL    , 
           z_PERCENT                        double             NULL    , 
           DELETEDFLAG                      varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_INGREDIENTSSECTION       int                NOT NULL, 
           FK_ID_M_INGREDIENTSSTATEMENT     int                NULL     ) ;
 
/* Main key for Entity - M_IngredientsStatement */
CREATE UNIQUE INDEX UM_INGREDIENTSSTATEMENT_ID104730 
       ON M_INGREDIENTSSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has [0:m] ) M_INGREDIENTSSTATEMENT' */
CREATE INDEX MINGREDIENTSSTATEMENTFKIDM105531 
       ON M_INGREDIENTSSTATEMENT ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
/* Index for Relationship - 'M_INGREDIENTSSTATEMENT(has next version [0:m] ) M_INGREDIENTSSTATEMENT' */
CREATE INDEX MINGREDIENTSSTATEMENTFKIDM105537 
       ON M_INGREDIENTSSTATEMENT ( 
           FK_ID_M_INGREDIENTSSTATEMENT ) ;
 
/* Entity - M_MarketingSection */
CREATE TABLE M_MARKETINGSECTION ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           SUBTITLE                         varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           DELETEDFLAG                      varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_MASTERLABELCONTENT         int                NOT NULL, 
           FK_ID_M_MARKETINGSECTION         int                NULL     ) ;
 
/* Main key for Entity - M_MarketingSection */
CREATE UNIQUE INDEX UM_MARKETINGSECTION_ID_1047400 
       ON M_MARKETINGSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_MARKETINGSECTION' */
CREATE INDEX MMARKETINGSECTIONFKIDMASTE105504 
       ON M_MARKETINGSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'M_MARKETINGSECTION(has next version [0:m] ) M_MARKETINGSECTION' */
CREATE INDEX MMARKETINGSECTIONFKIDMMARK105517 
       ON M_MARKETINGSECTION ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
/* Entity - M_MarketingStatement */
CREATE TABLE M_MARKETINGSTATEMENT ( 
           ID                               int                NOT NULL, 
           TITLE                            varchar( 254 )     NULL    , 
           z_TEXT                           longtext           NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           DELETEDFLAG                      varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_MARKETINGSECTION         int                NOT NULL, 
           FK_ID_M_MARKETINGSTATEMENT       int                NULL     ) ;
 
/* Main key for Entity - M_MarketingStatement */
CREATE UNIQUE INDEX UM_MARKETINGSTATEMENT_ID_1047500 
       ON M_MARKETINGSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_MARKETINGSECTION(has [0:m] ) M_MARKETINGSTATEMENT' */
CREATE INDEX MMARKETINGSTATEMENTFKIDMMA105451 
       ON M_MARKETINGSTATEMENT ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has next version [0:m] ) M_MARKETINGSTATEMENT' */
CREATE INDEX MMARKETINGSTATEMENTFKIDMMA105509 
       ON M_MARKETINGSTATEMENT ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
/* Entity - M_StorageDisposalDrivingConVol */
CREATE TABLE M_STORAGEDISPOSALDRIVINGCONVOL ( 
           ID                               int                NOT NULL, 
           CONTAINERVOLUME                  varchar( 3 )       NULL    , 
           FK_ID_M_STORAGEDISPOSALSECTION   int                NOT NULL ) ;
 
/* Main key for Entity - M_StorageDisposalDrivingConVol */
CREATE UNIQUE INDEX UMSTORAGEDISPOSALDRIVINGCO104757 
       ON M_STORAGEDISPOSALDRIVINGCONVOL ( 
           ID ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has [0:m] ) M_STORAGEDISPOSALDRIVINGCONVOL' */
CREATE INDEX MSTORAGEDISPOSALDRIVINGCON105417 
       ON M_STORAGEDISPOSALDRIVINGCONVOL ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
/* Entity - M_StorageDisposalSection */
CREATE TABLE M_STORAGEDISPOSALSECTION ( 
           ID                               int                NOT NULL, 
           CONTAINERVOLUME                  varchar( 3 )       NULL    , 
           SDSECTIONTYPE                    varchar( 20 )      NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           SUBTITLE                         varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           NUMBEREACHSTATEMENT              varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           DELETEDFLAG                      varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_MASTERLABELCONTENT         int                NOT NULL, 
           FK_ID_M_STORAGEDISPOSALSECTION   int                NULL     ) ;
 
/* Main key for Entity - M_StorageDisposalSection */
CREATE UNIQUE INDEX UMSTORAGEDISPOSALSECTIONID104761 
       ON M_STORAGEDISPOSALSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_STORAGEDISPOSALSECTION' */
CREATE INDEX MSTORAGEDISPOSALSECTIONFKI105499 
       ON M_STORAGEDISPOSALSECTION ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has next version [0:m] ) M_STORAGEDISPOSALSECTION' */
CREATE INDEX MSTORAGEDISPOSALSECTIONFKI105502 
       ON M_STORAGEDISPOSALSECTION ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
/* Entity - M_StorageDisposalStatement */
CREATE TABLE M_STORAGEDISPOSALSTATEMENT ( 
           ID                               int                NOT NULL, 
           z_ORDER                          int                NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           z_TEXT                           longtext           NULL    , 
           NOTFORUSETEXT                    longtext           NULL    , 
           NOTFORUSETYPE                    varchar( 2 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           DELETEDFLAG                      varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_STORAGEDISPOSALSECTION   int                NOT NULL, 
           FK_ID_M_STORAGEDISPOSALSTATEMENT int                NULL     ) ;
 
/* Main key for Entity - M_StorageDisposalStatement */
CREATE UNIQUE INDEX UMSTORAGEDISPOSALSTATEMENT104773 
       ON M_STORAGEDISPOSALSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has [0:m] ) M_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX MSTORAGEDISPOSALSTATEMENTF105487 
       ON M_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has next version [0:m] ) M_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX MSTORAGEDISPOSALSTATEMENTF105490 
       ON M_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_M_STORAGEDISPOSALSTATEMENT ) ;
 
/* Entity - M_Usage */
CREATE TABLE M_USAGE ( 
           ID                               int                NOT NULL, 
           USAGETYPE                        varchar( 1 )       NULL    , 
           CLAIMSCLASSIFICATION             varchar( 16 )      NULL    , 
           NAME                             varchar( 254 )     NOT NULL, 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           REVIEWERNOTE                     varchar( 254 )     NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           DELETEDFLAG                      varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_USAGEFOOTNOTE            int                NULL    , 
           FK_ID_M_USAGETYPE                int                NULL    , 
           FK_ID_M_USAGE                    int                NULL    , 
           FK_ID_MASTERLABELCONTENT         int                NULL     ) ;
 
/* Main key for Entity - M_Usage */
CREATE UNIQUE INDEX UM_USAGE_ID_1047840 
       ON M_USAGE ( 
           ID ) ;
 
/* Index for Relationship - 'M_USAGEFOOTNOTE(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FKIDMUSAGEFOOTNOTE105405 
       ON M_USAGE ( 
           FK_ID_M_USAGEFOOTNOTE ) ;
 
/* Index for Relationship - 'M_USAGETYPE(has [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGETYPE_105416 
       ON M_USAGE ( 
           FK_ID_M_USAGETYPE ) ;
 
/* Index for Relationship - 'M_USAGE(has next version [0:m] ) M_USAGE' */
CREATE INDEX M_USAGE_FK_ID_M_USAGE_1055140 
       ON M_USAGE ( 
           FK_ID_M_USAGE ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has (delete) [0:m] ) M_USAGE' */
CREATE INDEX MUSAGEFKIDMASTERLABELCONTE105542 
       ON M_USAGE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Entity - M_UsageFootnote */
CREATE TABLE M_USAGEFOOTNOTE ( 
           ID                               int                NOT NULL, 
           z_TEXT                           varchar( 254 )     NULL    , 
           FK_ID_MASTERLABELCONTENT         int                NOT NULL ) ;
 
/* Main key for Entity - M_UsageFootnote */
CREATE UNIQUE INDEX UM_USAGEFOOTNOTE_ID_1047940 
       ON M_USAGEFOOTNOTE ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_USAGEFOOTNOTE' */
CREATE INDEX MUSAGEFOOTNOTEFKIDMASTERLA105402 
       ON M_USAGEFOOTNOTE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Entity - M_UsageOrdering */
CREATE TABLE M_USAGEORDERING ( 
           ID                               int                NOT NULL, 
           AUTOSEQ                          int                NULL    , 
           AUTOSEQ02                        int                NULL    , 
           FK_ID_M_USAGE                    int                NOT NULL, 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN int                NULL    , 
           FK_ID_M_MARKETINGSTATEMENT       int                NULL     ) ;
 
/* Main key for Entity - M_UsageOrdering */
CREATE UNIQUE INDEX UM_USAGEORDERING_ID_1047980 
       ON M_USAGEORDERING ( 
           ID ) ;
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX M_USAGEORDERING_FKIDMUSAGE105448 
       ON M_USAGEORDERING ( 
           FK_ID_M_USAGE ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX MUSAGEORDERINGFKIDMDIRECTI105449 
       ON M_USAGEORDERING ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has [0:m] ) M_USAGEORDERING' */
CREATE INDEX MUSAGEORDERINGFKIDMMARKETI105545 
       ON M_USAGEORDERING ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
/* Entity - M_UsageType */
CREATE TABLE M_USAGETYPE ( 
           ID                               int                NOT NULL, 
           USAGETYPE                        varchar( 1 )       NOT NULL, 
           FK_ID_MASTERLABELCONTENT         int                NOT NULL ) ;
 
/* Main key for Entity - M_UsageType */
CREATE UNIQUE INDEX UM_USAGETYPE_ID_1048010 
       ON M_USAGETYPE ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) M_USAGETYPE' */
CREATE INDEX MUSAGETYPEFKIDMASTERLABELC105415 
       ON M_USAGETYPE ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Entity - MasterLabelContent */
CREATE TABLE MASTERLABELCONTENT ( 
           ID                               int                NOT NULL, 
           PRIMARYSITEID                    int                NULL    , 
           VERSION                          varchar( 254 )     NOT NULL, 
           REVISIONDATE                     datetime           NOT NULL, 
           CREATEDDATETIME                  datetime           NULL    , 
           MODIFIEDDATETIME                 datetime           NULL    , 
           FINALIZED                        varchar( 1 )       NULL    , 
           DILUTIONCHARTSTRENGTHTITLE       varchar( 254 )     NULL    , 
           DILUTIONCHARTSTRENGTHTEXT        varchar( 254 )     NULL    , 
           AUTOSEQ                          int                NULL    , 
           AUTOSEQ02                        int                NULL    , 
           AUTOSEQ03                        int                NULL    , 
           FK_ID_MASTERLABELCONTENT         int                NULL    , 
           FK_ID_MASTERPRODUCT              int                NOT NULL ) ;
 
/* Main key for Entity - MasterLabelContent */
CREATE UNIQUE INDEX UMASTERLABELCONTENT_ID_1048050 
       ON MASTERLABELCONTENT ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has next version (max 1) [0:m] ) MASTERLABELCONTENT' */
CREATE INDEX MASTERLABELCONTENTFKIDMAST105458 
       ON MASTERLABELCONTENT ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Index for Relationship - 'MASTERPRODUCT(has [0:m] ) MASTERLABELCONTENT' */
CREATE INDEX MASTERLABELCONTENTFKIDMAST105546 
       ON MASTERLABELCONTENT ( 
           FK_ID_MASTERPRODUCT ) ;
 
/* Entity - MasterProduct */
CREATE TABLE MASTERPRODUCT ( 
           ID                               int                NOT NULL, 
           PRIMARYSITEID                    int                NULL    , 
           NAME                             varchar( 254 )     NOT NULL, 
           z_NUMBER                         varchar( 5 )       NOT NULL, 
           DESCRIPTION                      varchar( 254 )     NULL    , 
           CHEMICALFAMILY                   varchar( 2 )       NOT NULL, 
           EPA_REGISTRATIONNUMBER           varchar( 128 )     NULL    , 
           EPA_ESTABLISHMENTNUMBER          varchar( 128 )     NULL    , 
           EPA_DRAFTLABEL                   datetime           NULL    , 
           ESL_DATE                         datetime           NULL    , 
           EPA_TOXICITYCATEGORY             int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_PRIMARYREGISTRANT          int                NOT NULL ) ;
 
/* Main key for Entity - MasterProduct */
CREATE UNIQUE INDEX UMASTERPRODUCT_ID_1048160 
       ON MASTERPRODUCT ( 
           ID ) ;
 
/* Index for Relationship - 'PRIMARYREGISTRANT(has [0:m] ) MASTERPRODUCT' */
CREATE INDEX MASTERPRODUCTFKIDPRIMARYRE105551 
       ON MASTERPRODUCT ( 
           FK_ID_PRIMARYREGISTRANT ) ;
 
/* Entity - Organization */
CREATE TABLE ORGANIZATION ( 
           ID                               int                NOT NULL, 
           PRIMARYSITEID                    int                NULL    , 
           NAME                             varchar( 254 )     NOT NULL, 
           DESCRIPTION                      varchar( 254 )     NULL    , 
           LOGINNAME                        varchar( 128 )     NOT NULL, 
           ADMINISTRATORPASSWORD            varchar( 128 )     NULL    , 
           LASTLOGINDATETIME                datetime           NULL    , 
           PASSWORDEXPIRESDATETIME          datetime           NULL    , 
           EMAILADDRESS                     varchar( 254 )     NULL    , 
           ACTIVE                           varchar( 1 )       NULL    , 
           ROLE                             varchar( 1 )       NULL     ) ;
 
/* Main key for Entity - Organization */
CREATE UNIQUE INDEX UORGANIZATION_ID_1048290 
       ON ORGANIZATION ( 
           ID ) ;
 
/* Entity - Person */
CREATE TABLE PERSON ( 
           ID                               int                NOT NULL, 
           LASTNAME                         varchar( 64 )      NULL    , 
           FIRSTNAME                        varchar( 64 )      NULL    , 
           MIDDLENAME                       varchar( 64 )      NULL    , 
           SUFFIX                           varchar( 128 )     NULL    , 
           GENDER                           varchar( 1 )       NULL    , 
           HOMEPHONE                        varchar( 11 )      NULL    , 
           MOBILEPHONE                      varchar( 11 )      NULL    , 
           WORKPHONE                        varchar( 11 )      NULL    , 
           WORKPHONEEXTENSION               varchar( 30 )      NULL    , 
           FAX                              varchar( 11 )      NULL    , 
           EMAILADDRESS                     varchar( 128 )     NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           z_NOTE                           longtext           NULL    , 
           CREATEDDATETIME                  datetime           NULL    , 
           MODIFIEDDATETIME                 datetime           NULL    , 
           CREATEDBY                        varchar( 128 )     NULL    , 
           LASTMODIFIEDBY                   varchar( 128 )     NULL    , 
           FK_ID_ADDRESS                    int                NULL    , 
           FK_ID_ORGANIZATION               int                NULL    , 
           HASCONTACTID_ORGANIZATION        int                NULL     ) ;
 
/* Main key for Entity - Person */
CREATE UNIQUE INDEX UPERSON_ID_1048420 
       ON PERSON ( 
           ID ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_LASTNAME_1048430 
       ON PERSON ( 
           LASTNAME ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_EMAILADDRESS_1048530 
       ON PERSON ( 
           EMAILADDRESS ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_HOMEPHONE_1048480 
       ON PERSON ( 
           HOMEPHONE ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_GENDER_1048470 
       ON PERSON ( 
           GENDER ) ;
/* Main key for Entity - Person */
CREATE INDEX PERSON_WORKPHONE_1048500 
       ON PERSON ( 
           WORKPHONE ) ;
 
/* Index for Relationship - 'ADDRESS(for [0:1] ) PERSON' */
CREATE INDEX PERSON_FK_ID_ADDRESS_1055620 
       ON PERSON ( 
           FK_ID_ADDRESS ) ;
 
/* Index for Relationship - 'ORGANIZATION(has employee [0:m] ) PERSON' */
CREATE INDEX PERSON_FK_ID_ORGANIZATION_105563 
       ON PERSON ( 
           FK_ID_ORGANIZATION ) ;
 
/* Index for Relationship - 'ORGANIZATION(has contact [0:1] ) PERSON' */
CREATE INDEX PERSONHASCONTACTIDORGANIZA105564 
       ON PERSON ( 
           HASCONTACTID_ORGANIZATION ) ;
 
/* Entity - PrimaryRegistrant */
CREATE TABLE PRIMARYREGISTRANT ( 
           ID                               int                NOT NULL, 
           EPA_COMPANYNUMBER                varchar( 6 )       NULL    , 
           FK_ID_EPAMMS                     int                NOT NULL, 
           FK_ID_ORGANIZATION               int                NOT NULL ) ;
 
/* Main key for Entity - PrimaryRegistrant */
CREATE UNIQUE INDEX UPRIMARYREGISTRANT_ID_1048670 
       ON PRIMARYREGISTRANT ( 
           ID ) ;
 
/* Index for Relationship - 'EPAMMS(has [0:m] ) PRIMARYREGISTRANT' */
CREATE INDEX PRIMARYREGISTRANTFKIDEPAMM105401 
       ON PRIMARYREGISTRANT ( 
           FK_ID_EPAMMS ) ;
 
/* Index for Relationship - 'ORGANIZATION(has [0:1] ) PRIMARYREGISTRANT' */
CREATE INDEX PRIMARYREGISTRANTFKIDORGAN105439 
       ON PRIMARYREGISTRANT ( 
           FK_ID_ORGANIZATION ) ;
 
/* Entity - PrimarySub */
CREATE TABLE PRIMARYSUB ( 
           ID                               int                NOT NULL, 
           FK_ID_PRIMARYREGISTRANT          int                NOT NULL, 
           FK_ID_SUBREGISTRANT              int                NOT NULL ) ;
 
/* Main key for Entity - PrimarySub */
CREATE UNIQUE INDEX UPRIMARYSUB_ID_1048710 
       ON PRIMARYSUB ( 
           ID ) ;
 
/* Index for Relationship - 'PRIMARYREGISTRANT(has [0:m] ) PRIMARYSUB' */
CREATE INDEX PRIMARYSUBFKIDPRIMARYREGIS105386 
       ON PRIMARYSUB ( 
           FK_ID_PRIMARYREGISTRANT ) ;
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) PRIMARYSUB' */
CREATE INDEX PRIMARYSUBFKIDSUBREGISTRAN105556 
       ON PRIMARYSUB ( 
           FK_ID_SUBREGISTRANT ) ;
 
/* Entity - ReusableBlockDefinition */
CREATE TABLE REUSABLEBLOCKDEFINITION ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 128 )     NOT NULL, 
           DESCRIPTION                      longtext           NULL    , 
           LLD_SECTIONTYPE                  varchar( 32 )      NULL    , 
           FK_ID_SUBREGISTRANT              int                NOT NULL, 
           FK_ID_LLD_BLOCK                  int                NOT NULL ) ;
 
/* Main key for Entity - ReusableBlockDefinition */
CREATE UNIQUE INDEX UREUSABLEBLOCKDEFINITIONID104874 
       ON REUSABLEBLOCKDEFINITION ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) REUSABLEBLOCKDEFINITION' */
CREATE INDEX REUSABLEBLOCKDEFINITIONFKI105399 
       ON REUSABLEBLOCKDEFINITION ( 
           FK_ID_SUBREGISTRANT ) ;
 
/* Index for Relationship - 'LLD_BLOCK(has [0:1] ) REUSABLEBLOCKDEFINITION' */
CREATE INDEX REUSABLEBLOCKDEFINITIONFKI105400 
       ON REUSABLEBLOCKDEFINITION ( 
           FK_ID_LLD_BLOCK ) ;
 
/* Entity - S_DilutionGroup */
CREATE TABLE S_DILUTIONGROUP ( 
           ID                               int                NOT NULL, 
           PRIMARYMLC_ID                    int                NULL    , 
           FK_ID_SUBREGLABELCONTENT         int                NOT NULL, 
           FK_ID_M_DILUTIONGROUP            int                NOT NULL ) ;
 
/* Main key for Entity - S_DilutionGroup */
CREATE UNIQUE INDEX US_DILUTIONGROUP_ID_1048800 
       ON S_DILUTIONGROUP ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_DILUTIONGROUP' */
CREATE INDEX SDILUTIONGROUPFKIDSUBREGLA105413 
       ON S_DILUTIONGROUP ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Index for Relationship - 'M_DILUTIONGROUP(has [0:m] ) S_DILUTIONGROUP' */
CREATE INDEX SDILUTIONGROUPFKIDMDILUTIO105414 
       ON S_DILUTIONGROUP ( 
           FK_ID_M_DILUTIONGROUP ) ;
 
/* Entity - S_DilutionGroupItem */
CREATE TABLE S_DILUTIONGROUPITEM ( 
           ID                               int                NOT NULL, 
           z_TEXT                           varchar( 254 )     NULL    , 
           FK_ID_S_DILUTIONGROUP            int                NOT NULL ) ;
 
/* Main key for Entity - S_DilutionGroupItem */
CREATE UNIQUE INDEX US_DILUTIONGROUPITEM_ID_1048840 
       ON S_DILUTIONGROUPITEM ( 
           ID ) ;
 
/* Index for Relationship - 'S_DILUTIONGROUP(has [0:m] ) S_DILUTIONGROUPITEM' */
CREATE INDEX SDILUTIONGROUPITEMFKIDSDIL105387 
       ON S_DILUTIONGROUPITEM ( 
           FK_ID_S_DILUTIONGROUP ) ;
 
/* Entity - S_DirectionsForUseSection */
CREATE TABLE S_DIRECTIONSFORUSESECTION ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           SUBTITLE                         varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           GENERALUSE                       varchar( 1 )       NULL    , 
           STATEMENTLISTTYPE                varchar( 254 )     NULL    , 
           NUMBEREACHSTATEMENT              varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESECTION  int                NULL    , 
           FK_ID_SUBREGLABELCONTENT         int                NOT NULL ) ;
 
/* Main key for Entity - S_DirectionsForUseSection */
CREATE UNIQUE INDEX USDIRECTIONSFORUSESECTIONI104888 
       ON S_DIRECTIONSFORUSESECTION ( 
           ID ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(has [0:m] ) S_DIRECTIONSFORUSESECTION' */
CREATE INDEX SDIRECTIONSFORUSESECTIONFK105506 
       ON S_DIRECTIONSFORUSESECTION ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_DIRECTIONSFORUSESECTION' */
CREATE INDEX SDIRECTIONSFORUSESECTIONFK105525 
       ON S_DIRECTIONSFORUSESECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Entity - S_DirectionsForUseStatement */
CREATE TABLE S_DIRECTIONSFORUSESTATEMENT ( 
           ID                               int                NOT NULL, 
           TITLE                            varchar( 254 )     NULL    , 
           z_TEXT                           longtext           NULL    , 
           NOTFORUSETEXT                    longtext           NULL    , 
           NOTFORUSETYPE                    varchar( 2 )       NOT NULL, 
           REVIEWERNOTE                     longtext           NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSESECTION  int                NOT NULL ) ;
 
/* Main key for Entity - S_DirectionsForUseStatement */
CREATE UNIQUE INDEX USDIRECTIONSFORUSESTATEMEN104902 
       ON S_DIRECTIONSFORUSESTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESTATEMENT(has [0:m] ) S_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SDIRECTIONSFORUSESTATEMENT105492 
       ON S_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_M_DIRECTIONSFORUSESTATEMEN ) ;
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(has [0:m] ) S_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SDIRECTIONSFORUSESTATEMENT105526 
       ON S_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
/* Entity - S_GeneralSection */
CREATE TABLE S_GENERALSECTION ( 
           ID                               int                NOT NULL, 
           CONTAINERVOLUME                  varchar( 254 )     NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           SUBTITLE                         varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           SECTIONTYPE                      varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           CONTACTNOTE                      longtext           NULL    , 
           NOTETOPHYSICIAN                  longtext           NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_GENERALSECTION           int                NULL    , 
           FK_ID_SUBREGLABELCONTENT         int                NOT NULL ) ;
 
/* Main key for Entity - S_GeneralSection */
CREATE UNIQUE INDEX US_GENERALSECTION_ID_1049130 
       ON S_GENERALSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'M_GENERALSECTION(has [0:m] ) S_GENERALSECTION' */
CREATE INDEX SGENERALSECTIONFKIDMGENERA105483 
       ON S_GENERALSECTION ( 
           FK_ID_M_GENERALSECTION ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_GENERALSECTION' */
CREATE INDEX SGENERALSECTIONFKIDSUBREGL105518 
       ON S_GENERALSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Entity - S_GeneralStatement */
CREATE TABLE S_GENERALSTATEMENT ( 
           ID                               int                NOT NULL, 
           TITLE                            varchar( 254 )     NULL    , 
           z_TEXT                           longtext           NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_GENERALSTATEMENT         int                NULL    , 
           FK_ID_S_GENERALSECTION           int                NOT NULL ) ;
 
/* Main key for Entity - S_GeneralStatement */
CREATE UNIQUE INDEX US_GENERALSTATEMENT_ID_1049270 
       ON S_GENERALSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_GENERALSTATEMENT(has [0:m] ) S_GENERALSTATEMENT' */
CREATE INDEX SGENERALSTATEMENTFKIDMGENE105480 
       ON S_GENERALSTATEMENT ( 
           FK_ID_M_GENERALSTATEMENT ) ;
 
/* Index for Relationship - 'S_GENERALSECTION(has [0:m] ) S_GENERALSTATEMENT' */
CREATE INDEX SGENERALSTATEMENTFKIDSGENE105519 
       ON S_GENERALSTATEMENT ( 
           FK_ID_S_GENERALSECTION ) ;
 
/* Entity - S_HumanHazardSection */
CREATE TABLE S_HUMANHAZARDSECTION ( 
           ID                               int                NOT NULL, 
           EPA_SIGNALWORD                   varchar( 32 )      NULL    , 
           EPA_CHILDHAZARDWARNING           varchar( 1 )       NULL    , 
           PRECAUTIONARYSTATEMENT           longtext           NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           LOCATIONSEPARATOR                varchar( 2 )       NULL    , 
           ENCLOSEFIRSTLOCATION             varchar( 1 )       NULL    , 
           PANELLOC1                        varchar( 254 )     NULL    , 
           PANELLOC2                        varchar( 254 )     NULL    , 
           PANELLOC3                        varchar( 254 )     NULL    , 
           PANELLOC4                        varchar( 254 )     NULL    , 
           PANELLOC5                        varchar( 254 )     NULL    , 
           LABELLOC1                        varchar( 254 )     NULL    , 
           LABELLOC2                        varchar( 254 )     NULL    , 
           LABELLOC3                        varchar( 254 )     NULL    , 
           LABELLOC4                        varchar( 254 )     NULL    , 
           LABELLOC5                        varchar( 254 )     NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_HUMANHAZARDSECTION       int                NULL    , 
           FK_ID_SUBREGLABELCONTENT         int                NOT NULL ) ;
 
/* Main key for Entity - S_HumanHazardSection */
CREATE UNIQUE INDEX US_HUMANHAZARDSECTION_ID_1049350 
       ON S_HUMANHAZARDSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'M_HUMANHAZARDSECTION(has [0:m] ) S_HUMANHAZARDSECTION' */
CREATE INDEX SHUMANHAZARDSECTIONFKIDMHU105510 
       ON S_HUMANHAZARDSECTION ( 
           FK_ID_M_HUMANHAZARDSECTION ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_HUMANHAZARDSECTION' */
CREATE INDEX SHUMANHAZARDSECTIONFKIDSUB105522 
       ON S_HUMANHAZARDSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Entity - S_IngredientsSection */
CREATE TABLE S_INGREDIENTSSECTION ( 
           ID                               int                NOT NULL, 
           ACTIVETITLE                      varchar( 254 )     NULL    , 
           ACTIVEBOLDITALIC                 varchar( 1 )       NULL    , 
           ARSENICPRECAUTIONARYTEXT         varchar( 254 )     NULL    , 
           INERTTITLE                       varchar( 254 )     NULL    , 
           INERTBOLDITALIC                  varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           GENERALINACTIVEPERCENT           double             NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_SUBREGLABELCONTENT         int                NOT NULL, 
           FK_ID_M_INGREDIENTSSECTION       int                NULL     ) ;
 
/* Main key for Entity - S_IngredientsSection */
CREATE UNIQUE INDEX US_INGREDIENTSSECTION_ID_1049560 
       ON S_INGREDIENTSSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_INGREDIENTSSECTION' */
CREATE INDEX SINGREDIENTSSECTIONFKIDSUB105520 
       ON S_INGREDIENTSSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Index for Relationship - 'M_INGREDIENTSSECTION(has [0:m] ) S_INGREDIENTSSECTION' */
CREATE INDEX SINGREDIENTSSECTIONFKIDMIN105532 
       ON S_INGREDIENTSSECTION ( 
           FK_ID_M_INGREDIENTSSECTION ) ;
 
/* Entity - S_IngredientsStatement */
CREATE TABLE S_INGREDIENTSSTATEMENT ( 
           ID                               int                NOT NULL, 
           CHEMICALNAME                     varchar( 254 )     NOT NULL, 
           COMMONNAME                       varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           ACTIVE                           varchar( 1 )       NOT NULL, 
           PROMPT                           varchar( 254 )     NULL    , 
           z_PERCENT                        double             NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_S_INGREDIENTSSECTION       int                NOT NULL, 
           FK_ID_M_INGREDIENTSSTATEMENT     int                NULL     ) ;
 
/* Main key for Entity - S_IngredientsStatement */
CREATE UNIQUE INDEX US_INGREDIENTSSTATEMENT_ID104968 
       ON S_INGREDIENTSSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'S_INGREDIENTSSECTION(has [0:m] ) S_INGREDIENTSSTATEMENT' */
CREATE INDEX SINGREDIENTSSTATEMENTFKIDS105521 
       ON S_INGREDIENTSSTATEMENT ( 
           FK_ID_S_INGREDIENTSSECTION ) ;
 
/* Index for Relationship - 'M_INGREDIENTSSTATEMENT(has [0:m] ) S_INGREDIENTSSTATEMENT' */
CREATE INDEX SINGREDIENTSSTATEMENTFKIDM105535 
       ON S_INGREDIENTSSTATEMENT ( 
           FK_ID_M_INGREDIENTSSTATEMENT ) ;
 
/* Entity - S_MarketingSection */
CREATE TABLE S_MARKETINGSECTION ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           SUBTITLE                         varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_S_MARKETINGSECTION         int                NULL    , 
           FK_ID_M_MARKETINGSECTION         int                NULL    , 
           FK_ID_SUBREGLABELCONTENT         int                NOT NULL ) ;
 
/* Main key for Entity - S_MarketingSection */
CREATE UNIQUE INDEX US_MARKETINGSECTION_ID_1049790 
       ON S_MARKETINGSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'S_MARKETINGSECTION(has next version [0:m] ) S_MARKETINGSECTION' */
CREATE INDEX SMARKETINGSECTIONFKIDSMARK105433 
       ON S_MARKETINGSECTION ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'M_MARKETINGSECTION(has [0:m] ) S_MARKETINGSECTION' */
CREATE INDEX SMARKETINGSECTIONFKIDMMARK105515 
       ON S_MARKETINGSECTION ( 
           FK_ID_M_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_MARKETINGSECTION' */
CREATE INDEX SMARKETINGSECTIONFKIDSUBRE105530 
       ON S_MARKETINGSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Entity - S_MarketingStatement */
CREATE TABLE S_MARKETINGSTATEMENT ( 
           ID                               int                NOT NULL, 
           TITLE                            varchar( 254 )     NULL    , 
           z_TEXT                           longtext           NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_S_MARKETINGSTATEMENT       int                NULL    , 
           FK_ID_S_MARKETINGSECTION         int                NOT NULL, 
           FK_ID_M_MARKETINGSTATEMENT       int                NULL     ) ;
 
/* Main key for Entity - S_MarketingStatement */
CREATE UNIQUE INDEX US_MARKETINGSTATEMENT_ID_1049900 
       ON S_MARKETINGSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has next version [0:m] ) S_MARKETINGSTATEMENT' */
CREATE INDEX SMARKETINGSTATEMENTFKIDSMA105435 
       ON S_MARKETINGSTATEMENT ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
/* Index for Relationship - 'S_MARKETINGSECTION(has [0:m] ) S_MARKETINGSTATEMENT' */
CREATE INDEX SMARKETINGSTATEMENTFKIDSMA105452 
       ON S_MARKETINGSTATEMENT ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'M_MARKETINGSTATEMENT(has [0:m] ) S_MARKETINGSTATEMENT' */
CREATE INDEX SMARKETINGSTATEMENTFKIDMMA105516 
       ON S_MARKETINGSTATEMENT ( 
           FK_ID_M_MARKETINGSTATEMENT ) ;
 
/* Entity - S_StorageDisposalSection */
CREATE TABLE S_STORAGEDISPOSALSECTION ( 
           ID                               int                NOT NULL, 
           CONTAINERVOLUME                  varchar( 3 )       NULL    , 
           SDSECTIONTYPE                    varchar( 20 )      NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           SUBTITLE                         varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           NUMBEREACHSTATEMENT              varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_STORAGEDISPOSALSECTION   int                NULL    , 
           FK_ID_SUBREGLABELCONTENT         int                NOT NULL ) ;
 
/* Main key for Entity - S_StorageDisposalSection */
CREATE UNIQUE INDEX USSTORAGEDISPOSALSECTIONID104998 
       ON S_STORAGEDISPOSALSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSECTION(has [0:m] ) S_STORAGEDISPOSALSECTION' */
CREATE INDEX SSTORAGEDISPOSALSECTIONFKI105500 
       ON S_STORAGEDISPOSALSECTION ( 
           FK_ID_M_STORAGEDISPOSALSECTION ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_STORAGEDISPOSALSECTION' */
CREATE INDEX SSTORAGEDISPOSALSECTIONFKI105523 
       ON S_STORAGEDISPOSALSECTION ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Entity - S_StorageDisposalStatement */
CREATE TABLE S_STORAGEDISPOSALSTATEMENT ( 
           ID                               int                NOT NULL, 
           z_ORDER                          int                NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           z_TEXT                           longtext           NULL    , 
           NOTFORUSETEXT                    longtext           NULL    , 
           NOTFORUSETYPE                    varchar( 2 )       NOT NULL, 
           REVIEWERNOTE                     longtext           NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_M_STORAGEDISPOSALSTATEMENT int                NULL    , 
           FK_ID_S_STORAGEDISPOSALSECTION   int                NOT NULL ) ;
 
/* Main key for Entity - S_StorageDisposalStatement */
CREATE UNIQUE INDEX USSTORAGEDISPOSALSTATEMENT105011 
       ON S_STORAGEDISPOSALSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'M_STORAGEDISPOSALSTATEMENT(has [0:m] ) S_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SSTORAGEDISPOSALSTATEMENTF105488 
       ON S_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_M_STORAGEDISPOSALSTATEMENT ) ;
 
/* Index for Relationship - 'S_STORAGEDISPOSALSECTION(has [0:m] ) S_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SSTORAGEDISPOSALSTATEMENTF105524 
       ON S_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_S_STORAGEDISPOSALSECTION ) ;
 
/* Entity - S_Usage */
CREATE TABLE S_USAGE ( 
           ID                               int                NOT NULL, 
           USAGETYPE                        varchar( 1 )       NULL    , 
           CLAIMSCLASSIFICATION             varchar( 16 )      NULL    , 
           NAME                             varchar( 254 )     NOT NULL, 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           REVIEWERNOTE                     varchar( 254 )     NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_S_USAGEFOOTNOTE            int                NULL    , 
           FK_ID_M_USAGE                    int                NULL    , 
           FK_ID_SUBREGLABELCONTENT         int                NULL    , 
           FK_ID_S_USAGETYPE                int                NULL     ) ;
 
/* Main key for Entity - S_Usage */
CREATE UNIQUE INDEX US_USAGE_ID_1050230 
       ON S_USAGE ( 
           ID ) ;
 
/* Index for Relationship - 'S_USAGEFOOTNOTE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FKIDSUSAGEFOOTNOTE105404 
       ON S_USAGE ( 
           FK_ID_S_USAGEFOOTNOTE ) ;
 
/* Index for Relationship - 'M_USAGE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_M_USAGE_1055130 
       ON S_USAGE ( 
           FK_ID_M_USAGE ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has (delete) [0:m] ) S_USAGE' */
CREATE INDEX SUSAGEFKIDSUBREGLABELCONTE105527 
       ON S_USAGE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Index for Relationship - 'S_USAGETYPE(has [0:m] ) S_USAGE' */
CREATE INDEX S_USAGE_FK_ID_S_USAGETYPE_105544 
       ON S_USAGE ( 
           FK_ID_S_USAGETYPE ) ;
 
/* Entity - S_UsageFootnote */
CREATE TABLE S_USAGEFOOTNOTE ( 
           ID                               int                NOT NULL, 
           z_TEXT                           varchar( 254 )     NULL    , 
           PRIMARYMLC_ID                    int                NULL    , 
           FK_ID_SUBREGLABELCONTENT         int                NOT NULL ) ;
 
/* Main key for Entity - S_UsageFootnote */
CREATE UNIQUE INDEX US_USAGEFOOTNOTE_ID_1050340 
       ON S_USAGEFOOTNOTE ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_USAGEFOOTNOTE' */
CREATE INDEX SUSAGEFOOTNOTEFKIDSUBREGLA105403 
       ON S_USAGEFOOTNOTE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Entity - S_UsageOrdering */
CREATE TABLE S_USAGEORDERING ( 
           ID                               int                NOT NULL, 
           PRIMARYMLC_ID                    int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           AUTOSEQ02                        int                NULL    , 
           FK_ID_S_MARKETINGSTATEMENT       int                NULL    , 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN int                NULL    , 
           FK_ID_S_USAGE                    int                NOT NULL ) ;
 
/* Main key for Entity - S_UsageOrdering */
CREATE UNIQUE INDEX US_USAGEORDERING_ID_1050390 
       ON S_USAGEORDERING ( 
           ID ) ;
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX SUSAGEORDERINGFKIDSMARKETI105436 
       ON S_USAGEORDERING ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESTATEMENT(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX SUSAGEORDERINGFKIDSDIRECTI105495 
       ON S_USAGEORDERING ( 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN ) ;
 
/* Index for Relationship - 'S_USAGE(has [0:m] ) S_USAGEORDERING' */
CREATE INDEX S_USAGEORDERING_FKIDSUSAGE105505 
       ON S_USAGEORDERING ( 
           FK_ID_S_USAGE ) ;
 
/* Entity - S_UsageType */
CREATE TABLE S_USAGETYPE ( 
           ID                               int                NOT NULL, 
           USAGETYPE                        varchar( 1 )       NOT NULL, 
           PRIMARYMLC_ID                    int                NULL    , 
           FK_ID_SUBREGLABELCONTENT         int                NOT NULL ) ;
 
/* Main key for Entity - S_UsageType */
CREATE UNIQUE INDEX US_USAGETYPE_ID_1050430 
       ON S_USAGETYPE ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) S_USAGETYPE' */
CREATE INDEX SUSAGETYPEFKIDSUBREGLABELC105543 
       ON S_USAGETYPE ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Entity - SPLD_DirectionsForUseSection */
CREATE TABLE SPLD_DIRECTIONSFORUSESECTION ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           SUBTITLE                         varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           GENERALUSE                       varchar( 1 )       NULL    , 
           STATEMENTLISTTYPE                varchar( 254 )     NULL    , 
           NUMBEREACHSTATEMENT              varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG            varchar( 254 )     NULL    , 
           AUTOSEQ                          int                NULL    , 
           AUTOSEQ02                        int                NULL    , 
           FK_ID_SPLD_SECTION               int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF     int                NOT NULL, 
           FK_ID_S_DIRECTIONSFORUSESECTION  int                NULL     ) ;
 
/* Main key for Entity - SPLD_DirectionsForUseSection */
CREATE UNIQUE INDEX USPLDDIRECTIONSFORUSESECTI105048 
       ON SPLD_DIRECTIONSFORUSESECTION ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIO105445 
       ON SPLD_DIRECTIONSFORUSESECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIO105457 
       ON SPLD_DIRECTIONSFORUSESECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(has [0:m] ) SPLD_DIRECTIONSFORUSESECTION' */
CREATE INDEX SPLDDIRECTIONSFORUSESECTIO105507 
       ON SPLD_DIRECTIONSFORUSESECTION ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
/* Entity - SPLD_DirectionsForUseStatement */
CREATE TABLE SPLD_DIRECTIONSFORUSESTATEMENT ( 
           ID                               int                NOT NULL, 
           TITLE                            varchar( 254 )     NULL    , 
           z_TEXT                           longtext           NULL    , 
           NOTFORUSETEXT                    longtext           NULL    , 
           NOTFORUSETYPE                    varchar( 2 )       NOT NULL, 
           REVIEWERNOTE                     longtext           NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG            varchar( 1 )       NULL    , 
           CONTINUATIONTEXT                 longtext           NULL    , 
           CONTINUATIONLEADINGTEXT          longtext           NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_SPLDDIRECTIONSFORUSESECTIO int                NOT NULL, 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN int                NULL     ) ;
 
/* Main key for Entity - SPLD_DirectionsForUseStatement */
CREATE UNIQUE INDEX USPLDDIRECTIONSFORUSESTATE105062 
       ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESECTION(has [0:m] ) SPLD_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SPLDDIRECTIONSFORUSESTATEM105468 
       ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_SPLDDIRECTIONSFORUSESECTIO ) ;
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESTATEMENT(has [0:m] ) SPLD_DIRECTIONSFORUSESTATEMENT' */
CREATE INDEX SPLDDIRECTIONSFORUSESTATEM105493 
       ON SPLD_DIRECTIONSFORUSESTATEMENT ( 
           FK_ID_S_DIRECTIONSFORUSESTATEMEN ) ;
 
/* Entity - SPLD_GeneralSection */
CREATE TABLE SPLD_GENERALSECTION ( 
           ID                               int                NOT NULL, 
           CONTAINERVOLUME                  varchar( 254 )     NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           SUBTITLE                         varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           SECTIONTYPE                      varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           CONTACTNOTE                      longtext           NULL    , 
           NOTETOPHYSICIAN                  longtext           NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG            varchar( 254 )     NULL    , 
           AUTOSEQ                          int                NULL    , 
           AUTOSEQ02                        int                NULL    , 
           FK_ID_SPLD_SECTION               int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF     int                NOT NULL, 
           FK_ID_S_GENERALSECTION           int                NULL     ) ;
 
/* Main key for Entity - SPLD_GeneralSection */
CREATE UNIQUE INDEX USPLD_GENERALSECTION_ID_1050750 
       ON SPLD_GENERALSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_GENERALSECTION' */
CREATE INDEX SPLDGENERALSECTIONFKIDSPLD105446 
       ON SPLD_GENERALSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_GENERALSECTION' */
CREATE INDEX SPLDGENERALSECTIONFKIDSUBR105453 
       ON SPLD_GENERALSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Index for Relationship - 'S_GENERALSECTION(has [0:m] ) SPLD_GENERALSECTION' */
CREATE INDEX SPLDGENERALSECTIONFKIDSGEN105485 
       ON SPLD_GENERALSECTION ( 
           FK_ID_S_GENERALSECTION ) ;
 
/* Entity - SPLD_GeneralStatement */
CREATE TABLE SPLD_GENERALSTATEMENT ( 
           ID                               int                NOT NULL, 
           TITLE                            varchar( 254 )     NULL    , 
           z_TEXT                           longtext           NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG            varchar( 254 )     NULL    , 
           CONTINUATIONTEXT                 longtext           NULL    , 
           CONTINUATIONLEADINGTEXT          longtext           NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_SPLD_GENERALSECTION        int                NOT NULL, 
           FK_ID_S_GENERALSTATEMENT         int                NULL     ) ;
 
/* Main key for Entity - SPLD_GeneralStatement */
CREATE UNIQUE INDEX USPLD_GENERALSTATEMENT_ID_105089 
       ON SPLD_GENERALSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_GENERALSECTION(has [0:m] ) SPLD_GENERALSTATEMENT' */
CREATE INDEX SPLDGENERALSTATEMENTFKIDSP105465 
       ON SPLD_GENERALSTATEMENT ( 
           FK_ID_SPLD_GENERALSECTION ) ;
 
/* Index for Relationship - 'S_GENERALSTATEMENT(has [0:m] ) SPLD_GENERALSTATEMENT' */
CREATE INDEX SPLDGENERALSTATEMENTFKIDSG105481 
       ON SPLD_GENERALSTATEMENT ( 
           FK_ID_S_GENERALSTATEMENT ) ;
 
/* Entity - SPLD_HumanHazardSection */
CREATE TABLE SPLD_HUMANHAZARDSECTION ( 
           ID                               int                NOT NULL, 
           EPA_SIGNALWORD                   varchar( 32 )      NULL    , 
           EPA_CHILDHAZARDWARNING           varchar( 1 )       NULL    , 
           PRECAUTIONARYSTATEMENT           longtext           NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           LOCATIONSEPARATOR                varchar( 2 )       NULL    , 
           ENCLOSEFIRSTLOCATION             varchar( 1 )       NULL    , 
           PANELLOC1                        varchar( 254 )     NULL    , 
           PANELLOC2                        varchar( 254 )     NULL    , 
           PANELLOC3                        varchar( 254 )     NULL    , 
           PANELLOC4                        varchar( 254 )     NULL    , 
           PANELLOC5                        varchar( 254 )     NULL    , 
           LABELLOC1                        varchar( 254 )     NULL    , 
           LABELLOC2                        varchar( 254 )     NULL    , 
           LABELLOC3                        varchar( 254 )     NULL    , 
           LABELLOC4                        varchar( 254 )     NULL    , 
           LABELLOC5                        varchar( 254 )     NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF     int                NOT NULL, 
           FK_ID_S_HUMANHAZARDSECTION       int                NULL     ) ;
 
/* Main key for Entity - SPLD_HumanHazardSection */
CREATE UNIQUE INDEX USPLD_HUMANHAZARDSECTIONID105099 
       ON SPLD_HUMANHAZARDSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_HUMANHAZARDSECTION' */
CREATE INDEX SPLDHUMANHAZARDSECTIONFKID105454 
       ON SPLD_HUMANHAZARDSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Index for Relationship - 'S_HUMANHAZARDSECTION(has [0:m] ) SPLD_HUMANHAZARDSECTION' */
CREATE INDEX SPLDHUMANHAZARDSECTIONFKID105511 
       ON SPLD_HUMANHAZARDSECTION ( 
           FK_ID_S_HUMANHAZARDSECTION ) ;
 
/* Entity - SPLD_IngredientsSection */
CREATE TABLE SPLD_INGREDIENTSSECTION ( 
           ID                               int                NOT NULL, 
           ACTIVETITLE                      varchar( 254 )     NULL    , 
           ACTIVEBOLDITALIC                 varchar( 1 )       NULL    , 
           ARSENICPRECAUTIONARYTEXT         varchar( 254 )     NULL    , 
           INERTTITLE                       varchar( 254 )     NULL    , 
           INERTBOLDITALIC                  varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           GENERALINACTIVEPERCENT           double             NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           AUTOSEQ02                        int                NULL    , 
           FK_ID_SPLD_SECTION               int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF     int                NOT NULL, 
           FK_ID_S_INGREDIENTSSECTION       int                NULL     ) ;
 
/* Main key for Entity - SPLD_IngredientsSection */
CREATE UNIQUE INDEX USPLD_INGREDIENTSSECTIONID105119 
       ON SPLD_INGREDIENTSSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_INGREDIENTSSECTION' */
CREATE INDEX SPLDINGREDIENTSSECTIONFKID105443 
       ON SPLD_INGREDIENTSSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_INGREDIENTSSECTION' */
CREATE INDEX SPLDINGREDIENTSSECTIONFKID105455 
       ON SPLD_INGREDIENTSSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Index for Relationship - 'S_INGREDIENTSSECTION(has [0:m] ) SPLD_INGREDIENTSSECTION' */
CREATE INDEX SPLDINGREDIENTSSECTIONFKID105533 
       ON SPLD_INGREDIENTSSECTION ( 
           FK_ID_S_INGREDIENTSSECTION ) ;
 
/* Entity - SPLD_IngredientsStatement */
CREATE TABLE SPLD_INGREDIENTSSTATEMENT ( 
           ID                               int                NOT NULL, 
           CHEMICALNAME                     varchar( 254 )     NOT NULL, 
           COMMONNAME                       varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           ACTIVE                           varchar( 1 )       NOT NULL, 
           PROMPT                           varchar( 254 )     NULL    , 
           z_PERCENT                        double             NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_SPLD_INGREDIENTSSECTION    int                NOT NULL, 
           FK_ID_S_INGREDIENTSSTATEMENT     int                NULL     ) ;
 
/* Main key for Entity - SPLD_IngredientsStatement */
CREATE UNIQUE INDEX USPLDINGREDIENTSSTATEMENTI105130 
       ON SPLD_INGREDIENTSSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_INGREDIENTSSECTION(has [0:m] ) SPLD_INGREDIENTSSTATEMENT' */
CREATE INDEX SPLDINGREDIENTSSTATEMENTFK105466 
       ON SPLD_INGREDIENTSSTATEMENT ( 
           FK_ID_SPLD_INGREDIENTSSECTION ) ;
 
/* Index for Relationship - 'S_INGREDIENTSSTATEMENT(has [0:m] ) SPLD_INGREDIENTSSTATEMENT' */
CREATE INDEX SPLDINGREDIENTSSTATEMENTFK105536 
       ON SPLD_INGREDIENTSSTATEMENT ( 
           FK_ID_S_INGREDIENTSSTATEMENT ) ;
 
/* Entity - SPLD_LLD */
CREATE TABLE SPLD_LLD ( 
           ID                               int                NOT NULL, 
           TAG                              varchar( 64 )      NULL    , 
           NAME                             varchar( 128 )     NULL    , 
           CSS_FILENAME                     varchar( 254 )     NULL    , 
           BACKGROUNDCOLOR                  varchar( 254 )     NULL    , 
           HAZARDPANEL                      int                NULL    , 
           CONTINUATIONPREVIOUSPAGETEXT     longtext           NULL    , 
           CONTNEXTPAGETEXTMARKETING        longtext           NULL    , 
           CONTNEXTPAGETEXTDIRFORUSE        longtext           NULL    , 
           DEFAULTTEXTFONTFAMILY            varchar( 20 )      NULL    , 
           DEFAULTTEXTFONTSIZE              varchar( 20 )      NULL    , 
           DEFAULTFONTCOLOR                 varchar( 20 )      NULL    , 
           DEFAULTTITLEMARGINTOP            double             NULL    , 
           DEFAULTTITLEMARGINBOTTOM         double             NULL    , 
           DEFAULTTEXTMARGINTOP             double             NULL    , 
           DEFAULTTEXTMARGINBOTTOM          double             NULL    , 
           DEPTH                            int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF     int                NOT NULL ) ;
 
/* Main key for Entity - SPLD_LLD */
CREATE UNIQUE INDEX USPLD_LLD_ID_1051400 
       ON SPLD_LLD ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_LLD' */
CREATE INDEX SPLDLLDFKIDSUBREGPHYSICALL105464 
       ON SPLD_LLD ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Entity - SPLD_MarketingSection */
CREATE TABLE SPLD_MARKETINGSECTION ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           SUBTITLE                         varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG            varchar( 254 )     NULL    , 
           AUTOSEQ                          int                NULL    , 
           AUTOSEQ02                        int                NULL    , 
           FK_ID_S_MARKETINGSECTION         int                NULL    , 
           FK_ID_SPLD_SECTION               int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF     int                NOT NULL ) ;
 
/* Main key for Entity - SPLD_MarketingSection */
CREATE UNIQUE INDEX USPLD_MARKETINGSECTION_ID_105159 
       ON SPLD_MARKETINGSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'S_MARKETINGSECTION(has [0:m] ) SPLD_MARKETINGSECTION' */
CREATE INDEX SPLDMARKETINGSECTIONFKIDSM105434 
       ON SPLD_MARKETINGSECTION ( 
           FK_ID_S_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_MARKETINGSECTION' */
CREATE INDEX SPLDMARKETINGSECTIONFKIDSP105447 
       ON SPLD_MARKETINGSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_MARKETINGSECTION' */
CREATE INDEX SPLDMARKETINGSECTIONFKIDSU105459 
       ON SPLD_MARKETINGSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Entity - SPLD_MarketingStatement */
CREATE TABLE SPLD_MARKETINGSTATEMENT ( 
           ID                               int                NOT NULL, 
           TITLE                            varchar( 254 )     NULL    , 
           z_TEXT                           longtext           NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG            varchar( 1 )       NULL    , 
           CONTINUATIONLEADINGTEXT          longtext           NULL    , 
           CONTINUATIONTEXT                 longtext           NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_S_MARKETINGSTATEMENT       int                NULL    , 
           FK_ID_SPLD_MARKETINGSECTION      int                NOT NULL ) ;
 
/* Main key for Entity - SPLD_MarketingStatement */
CREATE UNIQUE INDEX USPLD_MARKETINGSTATEMENTID105170 
       ON SPLD_MARKETINGSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'S_MARKETINGSTATEMENT(has [0:m] ) SPLD_MARKETINGSTATEMENT' */
CREATE INDEX SPLDMARKETINGSTATEMENTFKID105441 
       ON SPLD_MARKETINGSTATEMENT ( 
           FK_ID_S_MARKETINGSTATEMENT ) ;
 
/* Index for Relationship - 'SPLD_MARKETINGSECTION(has [0:m] ) SPLD_MARKETINGSTATEMENT' */
CREATE INDEX SPLDMARKETINGSTATEMENTFKID105450 
       ON SPLD_MARKETINGSTATEMENT ( 
           FK_ID_SPLD_MARKETINGSECTION ) ;
 
/* Entity - SPLD_Section */
CREATE TABLE SPLD_SECTION ( 
           ID                               int                NOT NULL, 
           TSECTIONTYPE                     varchar( 32 )      NULL    , 
           TITLEOVERRIDE                    varchar( 254 )     NULL    , 
           TITLEPOSITION                    varchar( 5 )       NULL    , 
           TITLEBOLDITALIC                  varchar( 1 )       NULL    , 
           TITLECLASS                       varchar( 254 )     NULL    , 
           SUBTITLEOVERRIDE                 varchar( 254 )     NULL    , 
           SUBTITLEPOSITION                 varchar( 5 )       NULL    , 
           SUBTITLEBOLDITALIC               varchar( 1 )       NULL    , 
           SUBTITLECLASS                    varchar( 254 )     NULL    , 
           STATEMENTFORMAT                  varchar( 5 )       NULL    , 
           USAGESEPARATORCHARACTERS         varchar( 254 )     NULL    , 
           USAGETYPE                        varchar( 1 )       NULL    , 
           STATEMENTCLASS                   varchar( 254 )     NULL    , 
           KERNINGUNITS                     varchar( 10 )      NULL    , 
           KERNINGWIDTH                     double             NULL    , 
           WORDSPACINGUNITS                 varchar( 10 )      NULL    , 
           WORDSPACINGWIDTH                 double             NULL    , 
           LEADINGUNITS                     varchar( 10 )      NULL    , 
           LEADINGHEIGHT                    double             NULL     ) ;
 
/* Main key for Entity - SPLD_Section */
CREATE UNIQUE INDEX USPLD_SECTION_ID_1051800 
       ON SPLD_SECTION ( 
           ID ) ;
 
/* Entity - SPLD_StorageDisposalSection */
CREATE TABLE SPLD_STORAGEDISPOSALSECTION ( 
           ID                               int                NOT NULL, 
           CONTAINERVOLUME                  varchar( 3 )       NULL    , 
           SDSECTIONTYPE                    varchar( 20 )      NULL    , 
           TITLE                            varchar( 254 )     NULL    , 
           SUBTITLE                         varchar( 254 )     NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           NUMBEREACHSTATEMENT              varchar( 1 )       NULL    , 
           REVIEWERNOTE                     longtext           NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG            varchar( 254 )     NULL    , 
           AUTOSEQ                          int                NULL    , 
           AUTOSEQ02                        int                NULL    , 
           FK_ID_SPLD_SECTION               int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF     int                NOT NULL, 
           FK_ID_S_STORAGEDISPOSALSECTION   int                NULL     ) ;
 
/* Main key for Entity - SPLD_StorageDisposalSection */
CREATE UNIQUE INDEX USPLDSTORAGEDISPOSALSECTIO105202 
       ON SPLD_STORAGEDISPOSALSECTION ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_SECTION(has [0:m] ) SPLD_STORAGEDISPOSALSECTION' */
CREATE INDEX SPLDSTORAGEDISPOSALSECTION105444 
       ON SPLD_STORAGEDISPOSALSECTION ( 
           FK_ID_SPLD_SECTION ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_STORAGEDISPOSALSECTION' */
CREATE INDEX SPLDSTORAGEDISPOSALSECTION105456 
       ON SPLD_STORAGEDISPOSALSECTION ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Index for Relationship - 'S_STORAGEDISPOSALSECTION(has [0:m] ) SPLD_STORAGEDISPOSALSECTION' */
CREATE INDEX SPLDSTORAGEDISPOSALSECTION105501 
       ON SPLD_STORAGEDISPOSALSECTION ( 
           FK_ID_S_STORAGEDISPOSALSECTION ) ;
 
/* Entity - SPLD_StorageDisposalStatement */
CREATE TABLE SPLD_STORAGEDISPOSALSTATEMENT ( 
           ID                               int                NOT NULL, 
           TITLE                            varchar( 254 )     NULL    , 
           z_ORDER                          int                NULL    , 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           z_TEXT                           longtext           NULL    , 
           NOTFORUSETEXT                    longtext           NULL    , 
           NOTFORUSETYPE                    varchar( 2 )       NOT NULL, 
           REVIEWERNOTE                     longtext           NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           CONTINUATIONBREAKFLAG            varchar( 1 )       NULL    , 
           CONTINUATIONLEADINGTEXT          longtext           NULL    , 
           CONTINUATIONTEXT                 longtext           NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_SPLD_STORAGEDISPOSALSECTIO int                NOT NULL, 
           FK_ID_S_STORAGEDISPOSALSTATEMENT int                NULL     ) ;
 
/* Main key for Entity - SPLD_StorageDisposalStatement */
CREATE UNIQUE INDEX USPLDSTORAGEDISPOSALSTATEM105215 
       ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_STORAGEDISPOSALSECTION(has [0:m] ) SPLD_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SPLDSTORAGEDISPOSALSTATEME105467 
       ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_SPLD_STORAGEDISPOSALSECTIO ) ;
 
/* Index for Relationship - 'S_STORAGEDISPOSALSTATEMENT(has [0:m] ) SPLD_STORAGEDISPOSALSTATEMENT' */
CREATE INDEX SPLDSTORAGEDISPOSALSTATEME105489 
       ON SPLD_STORAGEDISPOSALSTATEMENT ( 
           FK_ID_S_STORAGEDISPOSALSTATEMENT ) ;
 
/* Entity - SPLD_Usage */
CREATE TABLE SPLD_USAGE ( 
           ID                               int                NOT NULL, 
           USAGETYPE                        varchar( 1 )       NULL    , 
           CLAIMSCLASSIFICATION             varchar( 16 )      NULL    , 
           NAME                             varchar( 254 )     NOT NULL, 
           BOLDITALIC                       varchar( 1 )       NULL    , 
           REVIEWERNOTE                     varchar( 254 )     NULL    , 
           NOTEBOLDITALIC                   varchar( 1 )       NULL    , 
           SELECTED                         varchar( 1 )       NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_SUBREGPHYSICALLABELDEF     int                NULL    , 
           FK_ID_S_USAGE                    int                NULL    , 
           FK_ID_SPLD_USAGETYPE             int                NULL     ) ;
 
/* Main key for Entity - SPLD_Usage */
CREATE UNIQUE INDEX USPLD_USAGE_ID_1052290 
       ON SPLD_USAGE ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has (delete) [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLDUSAGEFKIDSUBREGPHYSICA105460 
       ON SPLD_USAGE ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Index for Relationship - 'S_USAGE(has [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLD_USAGE_FK_ID_S_USAGE_1054630 
       ON SPLD_USAGE ( 
           FK_ID_S_USAGE ) ;
 
/* Index for Relationship - 'SPLD_USAGETYPE(has [0:m] ) SPLD_USAGE' */
CREATE INDEX SPLDUSAGEFKIDSPLDUSAGETYPE105529 
       ON SPLD_USAGE ( 
           FK_ID_SPLD_USAGETYPE ) ;
 
/* Entity - SPLD_UsageOrdering */
CREATE TABLE SPLD_USAGEORDERING ( 
           ID                               int                NOT NULL, 
           AUTOSEQ                          int                NULL    , 
           AUTOSEQ02                        int                NULL    , 
           FK_ID_SPLD_USAGE                 int                NOT NULL, 
           FK_ID_SPLD_MARKETINGSTATEMENT    int                NULL    , 
           FKIDSPLDDIRECTIONSFORUSESTATEMEN int                NULL     ) ;
 
/* Main key for Entity - SPLD_UsageOrdering */
CREATE UNIQUE INDEX USPLD_USAGEORDERING_ID_1052390 
       ON SPLD_USAGEORDERING ( 
           ID ) ;
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDU105428 
       ON SPLD_USAGEORDERING ( 
           FK_ID_SPLD_USAGE ) ;
 
/* Index for Relationship - 'SPLD_MARKETINGSTATEMENT(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDM105442 
       ON SPLD_USAGEORDERING ( 
           FK_ID_SPLD_MARKETINGSTATEMENT ) ;
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESTATEMENT(has [0:m] ) SPLD_USAGEORDERING' */
CREATE INDEX SPLDUSAGEORDERINGFKIDSPLDD105494 
       ON SPLD_USAGEORDERING ( 
           FKIDSPLDDIRECTIONSFORUSESTATEMEN ) ;
 
/* Entity - SPLD_UsageType */
CREATE TABLE SPLD_USAGETYPE ( 
           ID                               int                NOT NULL, 
           USAGETYPE                        varchar( 1 )       NOT NULL, 
           FK_ID_SUBREGPHYSICALLABELDEF     int                NOT NULL ) ;
 
/* Main key for Entity - SPLD_UsageType */
CREATE UNIQUE INDEX USPLD_USAGETYPE_ID_1052420 
       ON SPLD_USAGETYPE ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGPHYSICALLABELDEF(has [0:m] ) SPLD_USAGETYPE' */
CREATE INDEX SPLDUSAGETYPEFKIDSUBREGPHY105528 
       ON SPLD_USAGETYPE ( 
           FK_ID_SUBREGPHYSICALLABELDEF ) ;
 
/* Entity - Subregistrant */
CREATE TABLE SUBREGISTRANT ( 
           ID                               int                NOT NULL, 
           EPA_COMPANYNUMBER                varchar( 6 )       NULL    , 
           FK_ID_ORGANIZATION               int                NOT NULL ) ;
 
/* Main key for Entity - Subregistrant */
CREATE UNIQUE INDEX USUBREGISTRANT_ID_1052460 
       ON SUBREGISTRANT ( 
           ID ) ;
 
/* Index for Relationship - 'ORGANIZATION(has [0:1] ) SUBREGISTRANT' */
CREATE INDEX SUBREGISTRANTFKIDORGANIZAT105440 
       ON SUBREGISTRANT ( 
           FK_ID_ORGANIZATION ) ;
 
/* Entity - SubregLabelContent */
CREATE TABLE SUBREGLABELCONTENT ( 
           ID                               int                NOT NULL, 
           DESCRIPTION                      varchar( 254 )     NULL    , 
           EPA_REGISTRATIONNUMBER           varchar( 128 )     NULL    , 
           EPA_ESTABLISHMENTNUMBER          varchar( 128 )     NULL    , 
           EPA_DRAFTLABEL                   datetime           NULL    , 
           ESL_DATE                         datetime           NULL    , 
           VERSION                          varchar( 254 )     NULL    , 
           REVISIONDATE                     datetime           NULL    , 
           CREATEDDATETIME                  datetime           NULL    , 
           MODIFIEDDATETIME                 datetime           NULL    , 
           NETCONTENTS                      double             NULL    , 
           NETCONTENTSUNITS                 varchar( 254 )     NULL    , 
           AUTOSEQ                          int                NULL    , 
           AUTOSEQ02                        int                NULL    , 
           FK_ID_SUBREGLABELCONTENT         int                NULL    , 
           FK_ID_SUBREGPRODUCT              int                NOT NULL, 
           FK_ID_MASTERLABELCONTENT         int                NULL     ) ;
 
/* Main key for Entity - SubregLabelContent */
CREATE UNIQUE INDEX USUBREGLABELCONTENT_ID_1052500 
       ON SUBREGLABELCONTENT ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has next version [0:m] ) SUBREGLABELCONTENT' */
CREATE INDEX SUBREGLABELCONTENTFKIDSUBR105462 
       ON SUBREGLABELCONTENT ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Index for Relationship - 'SUBREGPRODUCT(has [0:m] ) SUBREGLABELCONTENT' */
CREATE INDEX SUBREGLABELCONTENTFKIDSUBR105553 
       ON SUBREGLABELCONTENT ( 
           FK_ID_SUBREGPRODUCT ) ;
 
/* Index for Relationship - 'MASTERLABELCONTENT(has [0:m] ) SUBREGLABELCONTENT' */
CREATE INDEX SUBREGLABELCONTENTFKIDMAST105555 
       ON SUBREGLABELCONTENT ( 
           FK_ID_MASTERLABELCONTENT ) ;
 
/* Entity - SubregPhysicalLabelDef */
CREATE TABLE SUBREGPHYSICALLABELDEF ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NULL    , 
           PRODUCTNAME                      varchar( 254 )     NULL    , 
           CREATEDDATETIME                  datetime           NULL    , 
           MODIFIEDDATETIME                 datetime           NULL    , 
           FK_ID_SUBREGLABELCONTENT         int                NULL     ) ;
 
/* Main key for Entity - SubregPhysicalLabelDef */
CREATE UNIQUE INDEX USUBREGPHYSICALLABELDEF_ID105264 
       ON SUBREGPHYSICALLABELDEF ( 
           ID ) ;
 
/* Index for Relationship - 'SUBREGLABELCONTENT(has [0:m] ) SUBREGPHYSICALLABELDEF' */
CREATE INDEX SUBREGPHYSICALLABELDEFFKID105461 
       ON SUBREGPHYSICALLABELDEF ( 
           FK_ID_SUBREGLABELCONTENT ) ;
 
/* Entity - SubregProduct */
CREATE TABLE SUBREGPRODUCT ( 
           ID                               int                NOT NULL, 
           NAME                             varchar( 254 )     NOT NULL, 
           z_NUMBER                         varchar( 5 )       NOT NULL, 
           DESCRIPTION                      varchar( 254 )     NULL    , 
           CHEMICALFAMILY                   varchar( 2 )       NOT NULL, 
           EPA_REGISTRATIONNUMBER           varchar( 128 )     NULL    , 
           EPA_ESTABLISHMENTNUMBER          varchar( 128 )     NULL    , 
           EPA_DRAFTLABEL                   datetime           NULL    , 
           ESL_DATE                         datetime           NULL    , 
           EPA_TOXICITYCATEGORY             int                NULL    , 
           AUTOSEQ                          int                NULL    , 
           FK_ID_MASTERPRODUCT              int                NOT NULL, 
           FK_ID_SUBREGISTRANT              int                NOT NULL ) ;
 
/* Main key for Entity - SubregProduct */
CREATE UNIQUE INDEX USUBREGPRODUCT_ID_1052710 
       ON SUBREGPRODUCT ( 
           ID ) ;
 
/* Index for Relationship - 'MASTERPRODUCT(has [0:m] ) SUBREGPRODUCT' */
CREATE INDEX SUBREGPRODUCTFKIDMASTERPRO105552 
       ON SUBREGPRODUCT ( 
           FK_ID_MASTERPRODUCT ) ;
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) SUBREGPRODUCT' */
CREATE INDEX SUBREGPRODUCTFKIDSUBREGIST105554 
       ON SUBREGPRODUCT ( 
           FK_ID_SUBREGISTRANT ) ;
 
/* Entity - Temp */
CREATE TABLE z_TEMP ( 
           MARGINTOP                        double             NULL    , 
           MARGINBOTTOM                     double             NULL    , 
           MARGINLEFT                       double             NULL    , 
           MARGINRIGHT                      double             NULL     ) ;
 
 
/* Entity - User */
CREATE TABLE z_USER ( 
           ID                               int                NOT NULL, 
           USERNAME                         varchar( 128 )     NOT NULL, 
           USERPASSWORD                     varchar( 128 )     NULL    , 
           LASTLOGINDATETIME                datetime           NULL    , 
           PASSWORDEXPIRESDATETIME          datetime           NULL    , 
           EMAILADDRESS                     varchar( 254 )     NULL    , 
           ACTIVE                           varchar( 1 )       NULL    , 
           STATUS                           varchar( 1 )       NULL    , 
           z_NOTE                           longtext           NULL    , 
           CREATEDDATETIME                  datetime           NULL    , 
           MODIFIEDDATETIME                 datetime           NULL    , 
           CREATEDBY                        varchar( 128 )     NULL    , 
           LASTMODIFIEDBY                   varchar( 128 )     NULL    , 
           FK_ID_PERSON                     int                NULL     ) ;
 
/* Main key for Entity - User */
CREATE UNIQUE INDEX Uz_USER_ID_1052880 
       ON z_USER ( 
           ID ) ;
/* Main key for Entity - User */
CREATE INDEX z_USER_USERNAME_1052890 
       ON z_USER ( 
           USERNAME ) ;
 
/* Index for Relationship - 'PERSON(for [0:1] ) z_USER' */
CREATE INDEX z_USER_FK_ID_PERSON_1055500 
       ON z_USER ( 
           FK_ID_PERSON ) ;
 
/* Entity - UserGroup */
CREATE TABLE USERGROUP ( 
           ID                               int                NOT NULL, 
           GROUPNAME                        varchar( 128 )     NOT NULL, 
           DESCRIPTION                      longtext           NULL    , 
           CREATEDDATETIME                  datetime           NULL    , 
           MODIFIEDDATETIME                 datetime           NULL    , 
           CREATEDBY                        varchar( 128 )     NULL    , 
           LASTMODIFIEDBY                   varchar( 128 )     NULL     ) ;
 
/* Main key for Entity - UserGroup */
CREATE UNIQUE INDEX UUSERGROUP_ID_1053040 
       ON USERGROUP ( 
           ID ) ;
 
/* Entity - ZeidonGenkeyTable */
CREATE TABLE ZEIDONGENKEYTABLE ( 
           CURRENTGENKEY                    int                NULL    , 
           TABLENAME                        varchar( 32 )      NOT NULL ) ;
 
/* Main key for Entity - ZeidonGenkeyTable */
CREATE UNIQUE INDEX UZEIDONGENKEYTABLETABLENAM105314 
       ON ZEIDONGENKEYTABLE ( 
           TABLENAME ) ;
 
/* Entity - ZeidonLocking */
CREATE TABLE ZEIDONLOCKING ( 
           LOD_NAME                         varchar( 35 )      NOT NULL, 
           KEYVALUE                         varchar( 200 )     NOT NULL, 
           USERNAME                         varchar( 32 )      NOT NULL, 
           ALLOWREAD                        varchar( 1 )       NULL    , 
           z_TIMESTAMP                      datetime           NOT NULL, 
           ID                               int                NULL     ) ;
 
/* Main key for Entity - ZeidonLocking */
CREATE UNIQUE INDEX UZEIDONLOCKING_LOCKINGKEY_105317 
       ON ZEIDONLOCKING ( 
           LOD_NAME, 
           KEYVALUE ) ;
 
CREATE TABLE MMSUSAGEDRVSSDIRECTIONSFORUSESEC ( 
           FK_ID_S_DIRECTIONSFORUSESECTION  int                NOT NULL, 
           FK_ID_S_USAGE                    int                NOT NULL ) ;
 
CREATE UNIQUE INDEX UMMSUSAGEDRVSSDIRECTIONSFO105389 
       ON MMSUSAGEDRVSSDIRECTIONSFORUSESEC ( 
           FK_ID_S_DIRECTIONSFORUSESECTION, 
           FK_ID_S_USAGE ) ;
 
/* Index for Relationship - 'S_DIRECTIONSFORUSESECTION(is driven by [0:m] ) MMSUSAGEDRVSSDIRECTIONSFORUSESEC' */
CREATE INDEX MMSUSAGEDRVSSDIRECTIONSFOR105389 
       ON MMSUSAGEDRVSSDIRECTIONSFORUSESEC ( 
           FK_ID_S_DIRECTIONSFORUSESECTION ) ;
 
/* Index for Relationship - 'S_USAGE(drives [0:m] ) MMSUSAGEDRVSSDIRECTIONSFORUSESEC' */
CREATE INDEX MMSUSAGEDRVSSDIRECTIONSFOR105391 
       ON MMSUSAGEDRVSSDIRECTIONSFORUSESEC ( 
           FK_ID_S_USAGE ) ;
 
CREATE TABLE MMMUSAGEDRVSMDIRECTIONSFORUSESEC ( 
           FK_ID_M_DIRECTIONSFORUSESECTION  int                NOT NULL, 
           FK_ID_M_USAGE                    int                NOT NULL ) ;
 
CREATE UNIQUE INDEX UMMMUSAGEDRVSMDIRECTIONSFO105410 
       ON MMMUSAGEDRVSMDIRECTIONSFORUSESEC ( 
           FK_ID_M_DIRECTIONSFORUSESECTION, 
           FK_ID_M_USAGE ) ;
 
/* Index for Relationship - 'M_DIRECTIONSFORUSESECTION(is driven by [0:m] ) MMMUSAGEDRVSMDIRECTIONSFORUSESEC' */
CREATE INDEX MMMUSAGEDRVSMDIRECTIONSFOR105410 
       ON MMMUSAGEDRVSMDIRECTIONSFORUSESEC ( 
           FK_ID_M_DIRECTIONSFORUSESECTION ) ;
 
/* Index for Relationship - 'M_USAGE(drives [0:m] ) MMMUSAGEDRVSMDIRECTIONSFORUSESEC' */
CREATE INDEX MMMUSAGEDRVSMDIRECTIONSFOR105412 
       ON MMMUSAGEDRVSMDIRECTIONSFORUSESEC ( 
           FK_ID_M_USAGE ) ;
 
CREATE TABLE MM_MASTERPRODUCT_FR_SUBREGISTRAN ( 
           FK_ID_SUBREGISTRANT              int                NOT NULL, 
           FK_ID_MASTERPRODUCT              int                NOT NULL ) ;
 
CREATE UNIQUE INDEX UMMMASTERPRODUCTFRSUBREGIS105430 
       ON MM_MASTERPRODUCT_FR_SUBREGISTRAN ( 
           FK_ID_SUBREGISTRANT, 
           FK_ID_MASTERPRODUCT ) ;
 
/* Index for Relationship - 'SUBREGISTRANT(has [0:m] ) MM_MASTERPRODUCT_FR_SUBREGISTRAN' */
CREATE INDEX MMMASTERPRODUCTFRSUBREGIST105430 
       ON MM_MASTERPRODUCT_FR_SUBREGISTRAN ( 
           FK_ID_SUBREGISTRANT ) ;
 
/* Index for Relationship - 'MASTERPRODUCT(for [0:m] ) MM_MASTERPRODUCT_FR_SUBREGISTRAN' */
CREATE INDEX MMMASTERPRODUCTFRSUBREGIST105432 
       ON MM_MASTERPRODUCT_FR_SUBREGISTRAN ( 
           FK_ID_MASTERPRODUCT ) ;
 
CREATE TABLE MMSPLDDIRECTIONSFORUSESECTIONFRS ( 
           FK_ID_SPLD_USAGE                 int                NOT NULL, 
           FK_ID_SPLDDIRECTIONSFORUSESECTIO int                NOT NULL ) ;
 
CREATE UNIQUE INDEX UMMSPLDDIRECTIONSFORUSESEC105470 
       ON MMSPLDDIRECTIONSFORUSESECTIONFRS ( 
           FK_ID_SPLD_USAGE, 
           FK_ID_SPLDDIRECTIONSFORUSESECTIO ) ;
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) MMSPLDDIRECTIONSFORUSESECTIONFRS' */
CREATE INDEX MMSPLDDIRECTIONSFORUSESECT105470 
       ON MMSPLDDIRECTIONSFORUSESECTIONFRS ( 
           FK_ID_SPLD_USAGE ) ;
 
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESECTION(for [0:m] ) MMSPLDDIRECTIONSFORUSESECTIONFRS' */
CREATE INDEX MMSPLDDIRECTIONSFORUSESECT105472 
       ON MMSPLDDIRECTIONSFORUSESECTIONFRS ( 
           FK_ID_SPLDDIRECTIONSFORUSESECTIO ) ;
 
CREATE TABLE MMSPLDMARKETINGSECTIONFRSPLDUSAG ( 
           FK_ID_SPLD_USAGE                 int                NOT NULL, 
           FK_ID_SPLD_MARKETINGSECTION      int                NOT NULL ) ;
 
CREATE UNIQUE INDEX UMMSPLDMARKETINGSECTIONFRS105474 
       ON MMSPLDMARKETINGSECTIONFRSPLDUSAG ( 
           FK_ID_SPLD_USAGE, 
           FK_ID_SPLD_MARKETINGSECTION ) ;
 
/* Index for Relationship - 'SPLD_USAGE(has [0:m] ) MMSPLDMARKETINGSECTIONFRSPLDUSAG' */
CREATE INDEX MMSPLDMARKETINGSECTIONFRSP105474 
       ON MMSPLDMARKETINGSECTIONFRSPLDUSAG ( 
           FK_ID_SPLD_USAGE ) ;
 
/* Index for Relationship - 'SPLD_MARKETINGSECTION(for [0:m] ) MMSPLDMARKETINGSECTIONFRSPLDUSAG' */
CREATE INDEX MMSPLDMARKETINGSECTIONFRSP105476 
       ON MMSPLDMARKETINGSECTIONFRSPLDUSAG ( 
           FK_ID_SPLD_MARKETINGSECTION ) ;
 
CREATE TABLE MM_USERGROUP_CONTAINSMEMBR_Z_USE ( 
           FK_ID_Z_USER                     int                NOT NULL, 
           FK_ID_USERGROUP                  int                NOT NULL ) ;
 
CREATE UNIQUE INDEX UMMUSERGROUPCONTAINSMEMBRZ105559 
       ON MM_USERGROUP_CONTAINSMEMBR_Z_USE ( 
           FK_ID_Z_USER, 
           FK_ID_USERGROUP ) ;
 
/* Index for Relationship - 'z_USER(belongs to [0:m] ) MM_USERGROUP_CONTAINSMEMBR_Z_USE' */
CREATE INDEX MMUSERGROUPCONTAINSMEMBRZU105559 
       ON MM_USERGROUP_CONTAINSMEMBR_Z_USE ( 
           FK_ID_Z_USER ) ;
 
/* Index for Relationship - 'USERGROUP(contains member [0:m] ) MM_USERGROUP_CONTAINSMEMBR_Z_USE' */
CREATE INDEX MMUSERGROUPCONTAINSMEMBRZU105561 
       ON MM_USERGROUP_CONTAINSMEMBR_Z_USE ( 
           FK_ID_USERGROUP ) ;
 
