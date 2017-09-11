/* Alter script for ePammsM -- MySQL ePamms database */

/* Entity Keyword */
ALTER TABLE KEYWORD ADD REPLACEVALUE                       varchar( 254 )     NULL    ;

/* Entity LLD */
ALTER TABLE lld                                MODIFY COLUMN DEFAULTTEXTFONTFAMILY              longtext           NULL    ;
ALTER TABLE lld                                MODIFY COLUMN DEFAULTTEXTFONTSIZE                longtext           NULL    ;
ALTER TABLE lld                                MODIFY COLUMN DEFAULTFONTCOLOR                   longtext           NULL    ;

/* Entity LLD_Block */
ALTER TABLE lld_block                          MODIFY COLUMN LLD_COLUMNLISTTYPE                 longtext           NULL    ;
ALTER TABLE lld_block                          MODIFY COLUMN CAPITALIZETITLETEXTFLAG            longtext           NULL    ;
ALTER TABLE lld_block                          MODIFY COLUMN TEXTLETTERSPACE                    int                NULL    ;

/* Entity LLD_Panel */
ALTER TABLE lld_panel                          MODIFY COLUMN LLD_COLUMNLISTTYPE                 longtext           NULL    ;
ALTER TABLE lld_panel                          MODIFY COLUMN CAPITALIZETITLETEXTFLAG            longtext           NULL    ;
ALTER TABLE lld_panel                          MODIFY COLUMN TEXTLETTERSPACE                    int                NULL    ;

/* Entity M_DirectionsForUseSection */
ALTER TABLE m_directionsforusesection          MODIFY COLUMN NAME                               longtext           NULL    ;
ALTER TABLE m_directionsforusesection          MODIFY COLUMN STATEMENTSELECTEDBYUSAGEFLAG       longtext           NULL    ;

/* Entity M_GeneralSection */
ALTER TABLE m_generalsection                   MODIFY COLUMN NAME                               longtext           NULL    ;

/* Entity M_GeneralSubSection */
ALTER TABLE m_generalsubsection                MODIFY COLUMN CONTAINERVOLUMEENVIRONMENTHAZARD   longtext           NULL    ;

/* Entity S_DirectionsForUseSection */
ALTER TABLE s_directionsforusesection          MODIFY COLUMN NAME                               longtext           NULL    ;

/* Entity S_MarketingSection */
ALTER TABLE s_marketingsection                 MODIFY COLUMN NAME                               longtext           NULL    ;

/* Entity SPLD_DirectionsForUseSection */
ALTER TABLE spld_directionsforusesection       MODIFY COLUMN NAME                               longtext           NULL    ;

/* Entity SPLD_LLD */
ALTER TABLE spld_lld                           MODIFY COLUMN DEFAULTTEXTFONTFAMILY              longtext           NULL    ;
ALTER TABLE spld_lld                           MODIFY COLUMN DEFAULTTEXTFONTSIZE                longtext           NULL    ;
ALTER TABLE spld_lld                           MODIFY COLUMN DEFAULTFONTCOLOR                   longtext           NULL    ;

/* Entity SubregPhysicalLabelDef */
ALTER TABLE subregphysicallabeldef             MODIFY COLUMN PRODUCTNAME                        longtext           NULL    ;
