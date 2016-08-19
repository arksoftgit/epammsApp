/* Alter script for ePammsM -- MySQL ePamms database */
ALTER TABLE MMSPLDDIRECTIONSFORUSESECTIONFRSP ADD FK_ID_SPLD_DIRECTIONSFORUSESECTI   int                NOT NULL;
/* Index for Relationship - 'SPLD_DIRECTIONSFORUSESECTION(for [0:m] ) MMSPLDDIRECTIONSFORUSESECTIONFRSP' */
CREATE INDEX MMSPLDDIRECTIONSFORUSESECTIO24240 
      ON MMSPLDDIRECTIONSFORUSESECTIONFRSP ( 
           FK_ID_SPLD_DIRECTIONSFORUSESECTI ) ;
 
DROP TABLE m_storagedisposaldrivingconvol ;
DROP TABLE mm_color_for_lld_block ;
DROP TABLE mm_color_for_lld_panel ;
DROP TABLE mm_masterproductfrsubregistran ;
DROP TABLE mm_musagefrdltmmarketingsectio ;
DROP TABLE mm_smarketingsectionfrdltsusag ;
DROP TABLE mm_usergroup_containsmembr_z_use ;
DROP TABLE mm_usergroup_contansmmbr_z_use ;
DROP TABLE mmmusagefrdltmdirectionsforuse ;
DROP TABLE mmsdirectionsforusesectionfror ;
DROP TABLE mmsmarketingsectionfrorgnldlts ;
DROP TABLE mmsplddirectionsforusesectio02 ;
DROP TABLE mmsplddirectionsforusesectionf ;
DROP TABLE mmspldmarketingsectionfrorgnls ;
DROP TABLE mmspldmarketingsectionfrspldus ;
DROP TABLE mmsusagefrdltsdirectionsforuse ;
DROP TABLE usergroup ;

/* Entity LLD */
ALTER TABLE lld                                ALTER COLUMN DEFAULTTEXTFONTFAMILY              longtext           NULL    ;
ALTER TABLE lld                                ALTER COLUMN DEFAULTTEXTFONTSIZE                longtext           NULL    ;
ALTER TABLE lld                                ALTER COLUMN DEFAULTFONTCOLOR                   longtext           NULL    ;

/* Entity LLD_Block */
ALTER TABLE lld_block                          ALTER COLUMN LLD_COLUMNLISTTYPE                 longtext           NULL    ;
ALTER TABLE lld_block                          ALTER COLUMN CAPITALIZETITLETEXTFLAG            longtext           NULL    ;
ALTER TABLE lld_block                          ALTER COLUMN TEXTLETTERSPACE                    int                NULL    ;

/* Entity LLD_Panel */
ALTER TABLE lld_panel                          ALTER COLUMN LLD_COLUMNLISTTYPE                 longtext           NULL    ;
ALTER TABLE lld_panel                          ALTER COLUMN CAPITALIZETITLETEXTFLAG            longtext           NULL    ;
ALTER TABLE lld_panel                          ALTER COLUMN TEXTLETTERSPACE                    int                NULL    ;
ALTER TABLE lld_panel DROP COLUMN FK_ID_COLOR ;

/* Entity M_DirectionsForUseSection */
ALTER TABLE m_directionsforusesection          ALTER COLUMN NAME                               longtext           NULL    ;
ALTER TABLE m_directionsforusesection          ALTER COLUMN STATEMENTSELECTEDBYUSAGEFLAG       longtext           NULL    ;

/* Entity M_GeneralSection */
ALTER TABLE m_generalsection                   ALTER COLUMN NAME                               longtext           NULL    ;

/* Entity M_GeneralSubsection */
ALTER TABLE m_generalsubsection                ALTER COLUMN CONTAINERVOLUMEENVIRONMENTHAZARD   longtext           NULL    ;

/* Entity M_Usage */
ALTER TABLE m_usage DROP COLUMN AUTOSEQ02 ;
DROP INDEX M_USAGE_PARENTFK_ID_M_USAGE_1582 ON m_usage ;
ALTER TABLE m_usage DROP COLUMN PARENTFK_ID_M_USAGE ;
