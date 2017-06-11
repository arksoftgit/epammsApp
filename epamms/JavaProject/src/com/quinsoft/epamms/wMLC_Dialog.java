/**
    This file is part of the Zeidon Java Object Engine (Zeidon JOE).

    Zeidon JOE is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Zeidon JOE is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with Zeidon JOE.  If not, see <http://www.gnu.org/licenses/>.

    Copyright (c) 2009 - 2016 QuinSoft, Inc.
**/

package com.quinsoft.epamms;

import com.quinsoft.zeidon.ActivateFlags;
import com.quinsoft.zeidon.CursorPosition;
import com.quinsoft.zeidon.Task;
import com.quinsoft.zeidon.vml.VmlDialog;
import com.quinsoft.zeidon.View;
import com.quinsoft.zeidon.ZeidonException;
import com.quinsoft.zeidon.vml.zVIEW;
import org.apache.commons.lang3.mutable.MutableDouble;
import org.apache.commons.lang3.mutable.MutableInt;

import com.quinsoft.epamms.ZGlobalV_Operation;
import com.quinsoft.epamms.mMasLC_Object;
import com.quinsoft.epamms.lMLCATgt_Object;
import com.quinsoft.epamms.ZGlobal1_Operation;

import com.quinsoft.zeidon.zeidonoperations.ZDRVROPR;
import com.quinsoft.zeidon.zeidonoperations.KZOEP1AA;

/**
   @author QuinSoft
**/

public class wMLC_Dialog extends VmlDialog
{
   private final ZDRVROPR m_ZDRVROPR;
   private final KZOEP1AA m_KZOEP1AA;
   public wMLC_Dialog( View view )
   {
      super( view );
      m_ZDRVROPR = new ZDRVROPR( view );
      m_KZOEP1AA = new KZOEP1AA( view );
   }


//:DIALOG OPERATION
//:GOTO_PrecautionaryStmtDelete( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_PrecautionaryStmtDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Precautionary Statement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Precautionary Statement" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_GeneralStatement.Text
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_GeneralStatement", "Text" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_GeneralStatement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_GeneralStatement" );
   return( 0 );
// END
} 


private int 
o_fnLocalBuildQual_13( View     vSubtask,
                       zVIEW    vQualObject,
                       int      lTempInteger_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_14( View     vSubtask,
                       zVIEW    vQualObject,
                       String   szTempString_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterProduct" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterProduct" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "Name" );
   SetAttributeFromString( vQualObject, "QualAttrib", "Value", szTempString_0.toString( ) );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_3( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lTempInteger_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterProduct" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "PrimaryRegistrant" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_4( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lTempInteger_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_5( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lTempInteger_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_6( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lID )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lID );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_7( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lTempInteger_1 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_1 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_8( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lTempInteger_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_9( View     vSubtask,
                      zVIEW    vQualObject,
                      String   szTempString_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "ePamms" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "EPA_ChemicalFamily" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ChemicalFamily" );
   SetAttributeFromString( vQualObject, "QualAttrib", "Value", szTempString_0.toString( ) );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_10( View     vSubtask,
                       zVIEW    vQualObject,
                       String   szTempString_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "ePamms" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "EPA_ChemicalFamily" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ChemicalFamily" );
   SetAttributeFromString( vQualObject, "QualAttrib", "Value", szTempString_0.toString( ) );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_11( View     vSubtask,
                       zVIEW    vQualObject,
                       String   szTempString_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "ePamms" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "EPA_ChemicalFamily" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ChemicalFamily" );
   SetAttributeFromString( vQualObject, "QualAttrib", "Value", szTempString_0.toString( ) );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_12( View     vSubtask,
                       zVIEW    vQualObject,
                       String   szTempString_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "ePamms" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "EPA_ChemicalFamily" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ChemicalFamily" );
   SetAttributeFromString( vQualObject, "QualAttrib", "Value", szTempString_0.toString( ) );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_0( View     vSubtask,
                      zVIEW    vQualObject,
                      int      MasProdID )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterProduct" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterProduct" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", MasProdID );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_1( View     vSubtask,
                      zVIEW    vQualObject,
                      int      MasProdID )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterProduct" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterProduct" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", MasProdID );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_2( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lTempInteger_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterProduct" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterProduct" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


//:DIALOG OPERATION
//:CancelMLC( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
CancelMLC( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:DropObjectInstance( mMasLC )
   DropObjectInstance( mMasLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CopyMLC_ToNewProductMLC( VIEW ViewToWindow )

//:   VIEW mMasProd  REGISTERED AS mMasProd
public int 
CopyMLC_ToNewProductMLC( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasProd2 BASED ON LOD  mMasProd
   zVIEW    mMasProd2 = new zVIEW( );
   //:VIEW mMasLC    REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   //:VIEW NewMLC    BASED ON LOD  mMasLC
   zVIEW    NewMLC = new zVIEW( );
   String   szTempString_0 = null;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// This check is done by JavaScript, so should never happen.
   //:IF mMasProd.MasterProduct.Name = ""
   if ( CompareAttributeToString( mMasProd, "MasterProduct", "Name", "" ) == 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Copy MLC to new Product MLC",
      //:             "A name must be specified.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Copy MLC to new Product MLC", "A name must be specified.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:// If a Product by same name exists, error.
   //:ACTIVATE mMasProd2 WHERE mMasProd2.MasterProduct.Name = mMasProd.MasterProduct.Name
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasProd, "MasterProduct", "Name" );
   szTempString_0 = sb_szTempString_0.toString( );}
   o_fnLocalBuildQual_14( ViewToWindow, vTempViewVar_0, szTempString_0 );
   RESULT = ActivateObjectInstance( mMasProd2, "mMasProd", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:DropObjectInstance( mMasProd2 )
   DropObjectInstance( mMasProd2 );
   //:IF RESULT >= 0
   if ( RESULT >= 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Copy MLC to New Product MLC",
      //:             "A unique Product Name must be specified.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Copy MLC to New Product MLC", "A unique Product Name must be specified.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:ACTIVATE NewMLC EMPTY
   RESULT = ActivateEmptyObjectInstance( NewMLC, "mMasLC", ViewToWindow, zSINGLE );
   //:CREATE ENTITY NewMLC.MasterLabelContent
   RESULT = CreateEntity( NewMLC, "MasterLabelContent", zPOS_AFTER );
   //:NAME VIEW NewMLC "NewMLC"
   SetNameForView( NewMLC, "NewMLC", null, zLEVEL_TASK );

   //:SetMatchingAttributesByName( mMasProd, "MasterProduct", mMasLC, "MasterProduct", zSET_NULL )
   SetMatchingAttributesByName( mMasProd, "MasterProduct", mMasLC, "MasterProduct", zSET_NULL );
   //:COMMIT mMasProd
   RESULT = CommitObjectInstance( mMasProd );
   //:INCLUDE NewMLC.MasterProduct FROM mMasProd.MasterProduct
   RESULT = IncludeSubobjectFromSubobject( NewMLC, "MasterProduct", mMasProd, "MasterProduct", zPOS_AFTER );
   //:DropObjectInstance( mMasProd )
   DropObjectInstance( mMasProd );

   //:CopyMLCToNewProduct( NewMLC, mMasLC )
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( NewMLC );
    m_mMasLC_Object.omMasLC_CopyMLCToNewProduct( NewMLC, mMasLC );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }

   //:COMMIT NewMLC
   RESULT = CommitObjectInstance( NewMLC );
   return( 0 );
// // ListMLCs( ViewToWindow )
// END
} 


//:DIALOG OPERATION
//:UpdateTable( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
UpdateTable( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateTemporalSubobjectVersion( mMasLC, "M_MetaTable" )
   CreateTemporalSubobjectVersion( mMasLC, "M_MetaTable" );
   //:InitTableColumns( ViewToWindow )
   InitTableColumns( ViewToWindow );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CreateIncludeExcludeView( VIEW mMasLC )

//:   VIEW mMasLCIncludeExclude BASED ON LOD mMasLC
private int 
o_CreateIncludeExcludeView( View     mMasLC )
{
   zVIEW    mMasLCIncludeExclude = new zVIEW( );


   //:CreateViewFromView( mMasLCIncludeExclude, mMasLC )
   CreateViewFromView( mMasLCIncludeExclude, mMasLC );
   //:NAME VIEW mMasLCIncludeExclude "mMasLCIncludeExclude"
   SetNameForView( mMasLCIncludeExclude, "mMasLCIncludeExclude", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ChangeSectionCategory( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
ChangeSectionCategory( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLCIncludeExclude REGISTERED AS mMasLCIncludeExclude
   zVIEW    mMasLCIncludeExclude = new zVIEW( );

   //:STRING ( 256 ) szNewCategoryName
   String   szNewCategoryName = null;
   //:STRING ( 256 ) szCurrentCategoryName
   String   szCurrentCategoryName = null;
   //:STRING ( 256 ) szNameTarget
   String   szNameTarget = null;
   //:STRING ( 512 ) szMsg
   String   szMsg = null;
   //:SHORT  nRC
   int      nRC = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLCIncludeExclude, "mMasLCIncludeExclude", ViewToWindow, zLEVEL_TASK );

   //:szNewCategoryName = mMasLC.DFU_CategoryNames.Name
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szNewCategoryName;
   if ( szNewCategoryName == null )
      sb_szNewCategoryName = new StringBuilder( 32 );
   else
      sb_szNewCategoryName = new StringBuilder( szNewCategoryName );
       GetVariableFromAttribute( sb_szNewCategoryName, mi_lTempInteger_0, 'S', 257, mMasLC, "DFU_CategoryNames", "Name", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szNewCategoryName = sb_szNewCategoryName.toString( );}
   //:szCurrentCategoryName = mMasLC.M_DirectionsForUseCategory.Name
   {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
   StringBuilder sb_szCurrentCategoryName;
   if ( szCurrentCategoryName == null )
      sb_szCurrentCategoryName = new StringBuilder( 32 );
   else
      sb_szCurrentCategoryName = new StringBuilder( szCurrentCategoryName );
       GetVariableFromAttribute( sb_szCurrentCategoryName, mi_lTempInteger_1, 'S', 257, mMasLC, "M_DirectionsForUseCategory", "Name", "", 0 );
   lTempInteger_1 = mi_lTempInteger_1.intValue( );
   szCurrentCategoryName = sb_szCurrentCategoryName.toString( );}
   //:TraceLineS( "Attempt to switch to DFU Category: ", szNewCategoryName )
   TraceLineS( "Attempt to switch to DFU Category: ", szNewCategoryName );
   //:TraceLineS( "                from DFU Category: ", szCurrentCategoryName )
   TraceLineS( "                from DFU Category: ", szCurrentCategoryName );

   //:nRC = SetCursorFirstEntityByString( mMasLCIncludeExclude, "M_DirectionsForUseCategory", "Name", szNewCategoryName, "" )
   nRC = SetCursorFirstEntityByString( mMasLCIncludeExclude, "M_DirectionsForUseCategory", "Name", szNewCategoryName, "" );
   //:IF nRC >= 0
   if ( nRC >= 0 )
   { 
      //:// Accept Direction for Use Section to get ready for move.
      //:nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseSection" )
      nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseSection" );
      //:nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseCategory" )
      nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseCategory" );
      //:IF nRC < 0
      if ( nRC < 0 )
      { 
         //:MessageSend( ViewToWindow, "", "Change Section Category Directions For Use Section",
         //:             "Error saving Directions For Use Section.",
         //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
         MessageSend( ViewToWindow, "", "Change Section Category Directions For Use Section", "Error saving Directions For Use Section.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
         //:RETURN 2
         if(8==8)return( 2 );
      } 

      //:END

      //:MoveSubobject( mMasLCIncludeExclude, "M_DirectionsForUseSection",
      //:               mMasLC, "M_DirectionsForUseSection", zPOS_LAST, zREPOS_NEXT )
      MoveSubobject( mMasLCIncludeExclude, "M_DirectionsForUseSection", mMasLC, "M_DirectionsForUseSection", zPOS_LAST, zREPOS_NEXT );
      //:SetViewFromView( mMasLC, mMasLCIncludeExclude )
      SetViewFromView( mMasLC, mMasLCIncludeExclude );
      //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseCategory" )
      CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseCategory" );
      //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseSection" )
      CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseSection" );
      //:ELSE
   } 
   else
   { 
      //:szMsg = "Cannot move section from: " + szCurrentCategoryName
       {StringBuilder sb_szMsg;
      if ( szMsg == null )
         sb_szMsg = new StringBuilder( 32 );
      else
         sb_szMsg = new StringBuilder( szMsg );
            ZeidonStringCopy( sb_szMsg, 1, 0, "Cannot move section from: ", 1, 0, 513 );
      szMsg = sb_szMsg.toString( );}
       {StringBuilder sb_szMsg;
      if ( szMsg == null )
         sb_szMsg = new StringBuilder( 32 );
      else
         sb_szMsg = new StringBuilder( szMsg );
            ZeidonStringConcat( sb_szMsg, 1, 0, szCurrentCategoryName, 1, 0, 513 );
      szMsg = sb_szMsg.toString( );}
      //:szMsg = szMsg + " to: "
       {StringBuilder sb_szMsg;
      if ( szMsg == null )
         sb_szMsg = new StringBuilder( 32 );
      else
         sb_szMsg = new StringBuilder( szMsg );
            ZeidonStringConcat( sb_szMsg, 1, 0, " to: ", 1, 0, 513 );
      szMsg = sb_szMsg.toString( );}
      //:szMsg = szMsg + szNewCategoryName
       {StringBuilder sb_szMsg;
      if ( szMsg == null )
         sb_szMsg = new StringBuilder( 32 );
      else
         sb_szMsg = new StringBuilder( szMsg );
            ZeidonStringConcat( sb_szMsg, 1, 0, szNewCategoryName, 1, 0, 513 );
      szMsg = sb_szMsg.toString( );}
      //:MessageSend( ViewToWindow, "", "Directions for Use Section", szMsg,
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Directions for Use Section", szMsg, zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CANCEL_MLC_Version( VIEW ViewToWindow )

//:   VIEW mMasLCNew REGISTERED AS mMasLC
public int 
CANCEL_MLC_Version( View     ViewToWindow )
{
   zVIEW    mMasLCNew = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLCNew, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Drop the temporary object.
   //:DropObjectInstance( mMasLCNew )
   DropObjectInstance( mMasLCNew );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:COPY_MLC_Version( VIEW ViewToWindow )

//:   VIEW mMasProd  REGISTERED AS mMasProd
public int 
COPY_MLC_Version( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW wWebXfer  REGISTERED AS wWebXfer
   zVIEW    wWebXfer = new zVIEW( );
   //:VIEW mMasLCNew REGISTERED AS mMasLC
   zVIEW    mMasLCNew = new zVIEW( );
   //:VIEW mMasLCOld BASED ON LOD  mMasLC
   zVIEW    mMasLCOld = new zVIEW( );
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLCNew, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Copy the selected MLC in mMasProd, creating a new version of the content in mMasLCNew.
   //:ACTIVATE mMasLCOld WHERE mMasLCOld.MasterLabelContent.ID = mMasProd.MasterLabelContent.ID
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, mMasProd, "MasterLabelContent", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_13( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( mMasLCOld, "mMasLC", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mMasLCOld "mMasLCOld"
   SetNameForView( mMasLCOld, "mMasLCOld", null, zLEVEL_TASK );
   //:CopyMLCToNewProduct( mMasLCNew,mMasLCOld )
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLCNew );
    m_mMasLC_Object.omMasLC_CopyMLCToNewProduct( mMasLCNew, mMasLCOld );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
   //:COMMIT mMasLCNew
   RESULT = CommitObjectInstance( mMasLCNew );
   //:DropObjectInstance( mMasLCNew )
   DropObjectInstance( mMasLCNew );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_MarketingSectionAddBefore( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_MarketingSectionAddBefore( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateTemporalEntity( mMasLC, "M_MarketingSection", zPOS_BEFORE )
   CreateTemporalEntity( mMasLC, "M_MarketingSection", zPOS_BEFORE );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DU_SectionAdd( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DU_SectionAdd( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateIncludeExcludeView( mMasLC )
   o_CreateIncludeExcludeView( mMasLC );
   //:CreateTemporalEntity( mMasLC, "M_DirectionsForUseSection", zPOS_LAST )
   CreateTemporalEntity( mMasLC, "M_DirectionsForUseSection", zPOS_LAST );
   //:BuildDFU_CategoryNameList( mMasLC )
   o_BuildDFU_CategoryNameList( mMasLC );
   //:BuildDFU_SectionNameList( mMasLC, "" )
   o_BuildDFU_SectionNameList( mMasLC, "" );
   return( 0 );
//    
// END
} 


//:DIALOG OPERATION
//:COPY_InsertKeywordMarketing( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
COPY_InsertKeywordMarketing( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Copy the M_InsertTextKeywordMarketing subobject to the base derived subobject.

   //:IF mMasLC.DisplayKeywordText EXISTS
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "DisplayKeywordText" );
   if ( lTempInteger_0 == 0 )
   { 
      //:DELETE ENTITY mMasLC.DisplayKeywordText
      RESULT = DeleteEntity( mMasLC, "DisplayKeywordText", zPOS_NEXT );
   } 

   //:END
   //:CREATE ENTITY mMasLC.DisplayKeywordText
   RESULT = CreateEntity( mMasLC, "DisplayKeywordText", zPOS_AFTER );
   //:CREATE ENTITY mMasLC.M_InsertTextKeywordBase
   RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordBase", zPOS_AFTER );
   //:SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordBase", mMasLC, "M_InsertTextKeywordMarketing", zSET_ALL )
   SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordBase", mMasLC, "M_InsertTextKeywordMarketing", zSET_ALL );
   //:FOR EACH mMasLC.M_InsertTextMarketing
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextMarketing", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_InsertTextBase
      RESULT = CreateEntity( mMasLC, "M_InsertTextBase", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_InsertTextBase", mMasLC, "M_InsertTextMarketing", zSET_ALL )
      SetMatchingAttributesByName( mMasLC, "M_InsertTextBase", mMasLC, "M_InsertTextMarketing", zSET_ALL );
      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextMarketing", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_AddUsageGroup( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_AddUsageGroup( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:INTEGER       SeqNo
   int      SeqNo = 0;
   //:STRING ( 3 )  szSeqNo
   String   szSeqNo = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Create a new Usage Group temporal entity and set Seq. No to last entry.
   //:SeqNo = 0
   SeqNo = 0;
   //:FOR EACH mMasLC.M_UsageGroup
   RESULT = SetCursorFirstEntity( mMasLC, "M_UsageGroup", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SeqNo = SeqNo + 1
      SeqNo = SeqNo + 1;
      RESULT = SetCursorNextEntity( mMasLC, "M_UsageGroup", "" );
   } 

   //:END
   //:SeqNo = SeqNo + 1
   SeqNo = SeqNo + 1;
   //:szSeqNo = SeqNo
    {StringBuilder sb_szSeqNo;
   if ( szSeqNo == null )
      sb_szSeqNo = new StringBuilder( 32 );
   else
      sb_szSeqNo = new StringBuilder( szSeqNo );
      ZeidonStringConvertFromNumber( sb_szSeqNo, 1, 0, 3, SeqNo, (double) 0.0, "I" );
   szSeqNo = sb_szSeqNo.toString( );}
   //:CREATE ENTITY mMasLC.M_UsageGroup
   RESULT = CreateEntity( mMasLC, "M_UsageGroup", zPOS_AFTER );
   //:mMasLC.M_UsageGroup.Name = szSeqNo
   SetAttributeFromString( mMasLC, "M_UsageGroup", "Name", szSeqNo );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_UpdateGroupUsageStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_UpdateGroupUsageStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   String   szTempString_0 = null;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on the corresponding M_Usage entity and create temporal subobject version.
   //:IF mMasLC.M_UsageGroupUsage.ID = ""
   if ( CompareAttributeToString( mMasLC, "M_UsageGroupUsage", "ID", "" ) == 0 )
   { 
      //:SET CURSOR FIRST mMasLC.M_Usage WHERE mMasLC.M_Usage.Name = mMasLC.M_UsageGroupUsage.Name
      {StringBuilder sb_szTempString_0;
      if ( szTempString_0 == null )
         sb_szTempString_0 = new StringBuilder( 32 );
      else
         sb_szTempString_0 = new StringBuilder( szTempString_0 );
             GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_UsageGroupUsage", "Name" );
      szTempString_0 = sb_szTempString_0.toString( );}
      RESULT = SetCursorFirstEntityByString( mMasLC, "M_Usage", "Name", szTempString_0, "" );
      //:ELSE
   } 
   else
   { 
      //:SET CURSOR FIRST mMasLC.M_Usage WHERE mMasLC.M_Usage.ID = mMasLC.M_UsageGroupUsage.ID
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
             GetIntegerFromAttribute( mi_lTempInteger_0, mMasLC, "M_UsageGroupUsage", "ID" );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_Usage", "ID", lTempInteger_0, "" );
   } 

   //:END
   //:CreateTemporalSubobjectVersion( mMasLC, "M_Usage" )
   CreateTemporalSubobjectVersion( mMasLC, "M_Usage" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_AddUsageStatements( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_AddUsageStatements( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Set up the work areas that define to the Add Items page which items are being added.
   //:mMasLC.MasterLabelContent.wAddStatementsEntityName = "M_Usage"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_Usage" );
   //:AddUsageStatements( mMasLC )
   o_AddUsageStatements( mMasLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_AddSubUsageStatements( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_AddSubUsageStatements( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Set up the work areas that define to the Add SubItems page which items are being added.
   //:mMasLC.MasterLabelContent.wAddStatementsEntityName = "M_SubUsage"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_SubUsage" );
   //:AddUsageStatements( mMasLC )
   o_AddUsageStatements( mMasLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_AddGroupUsageStatements( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_AddGroupUsageStatements( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Set up the work areas that define to the Add Items page which items are being added.
   //:mMasLC.MasterLabelContent.wAddStatementsEntityName = "M_UsageGroupUsageTemp"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_UsageGroupUsageTemp" );
   //:AddUsageStatements( mMasLC )
   o_AddUsageStatements( mMasLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_MarketingStatementAdd( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_MarketingStatementAdd( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Set up the work areas that define to the Add Items page that the items being added are
   //:// Marketing Statements.
   //:mMasLC.MasterLabelContent.wAddStatementsEntityName    = "M_MarketingStatement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_MarketingStatement" );
   //:mMasLC.MasterLabelContent.wAddStatementsAttributeName = "Text"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsAttributeName", "Text" );
   //:mMasLC.MasterLabelContent.wAddStatementsPageTitle     = "Marketing Statements"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "Marketing Statements" );
   //:mMasLC.MasterLabelContent.wAddStatementsWorkText      = ""
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsWorkText", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_LocationStatementAdd( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_LocationStatementAdd( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Set up the work areas that define to the Add Items page that the items being added are
   //:// Marketing Statements.
   //:mMasLC.MasterLabelContent.wAddStatementsEntityName    = "M_Usage"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_Usage" );
   //:mMasLC.MasterLabelContent.wAddStatementsAttributeName = "Name"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsAttributeName", "Name" );
   //:mMasLC.MasterLabelContent.wAddStatementsPageTitle     = "Location Statements"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "Location Statements" );
   //:mMasLC.MasterLabelContent.wAddStatementsWorkText      = ""
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsWorkText", "" );
   return( 0 );
// END
} 


//:LOCAL OPERATION
//:AddUsageStatements( VIEW mMasLC )

//:   STRING ( 1 )  szUsageType
private int 
o_AddUsageStatements( View     mMasLC )
{
   String   szUsageType = null;
   int      lTempInteger_0 = 0;


   //:mMasLC.MasterLabelContent.wAddStatementsAttributeName = "Name"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsAttributeName", "Name" );
   //:mMasLC.MasterLabelContent.wAddStatementsWorkText      = ""
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsWorkText", "" );
   //:szUsageType = mMasLC.M_UsageType.UsageType
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szUsageType;
   if ( szUsageType == null )
      sb_szUsageType = new StringBuilder( 32 );
   else
      sb_szUsageType = new StringBuilder( szUsageType );
       GetVariableFromAttribute( sb_szUsageType, mi_lTempInteger_0, 'S', 2, mMasLC, "M_UsageType", "UsageType", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szUsageType = sb_szUsageType.toString( );}

   //:IF szUsageType = "S"  // Surfaces
   if ( ZeidonStringCompare( szUsageType, 1, 0, "S", 1, 0, 2 ) == 0 )
   { 
      //:mMasLC.MasterLabelContent.wAddStatementsPageTitle = "Surfaces"
      SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "Surfaces" );
      //:ELSE
   } 
   else
   { 
      //:IF szUsageType = "L"  // Locations
      if ( ZeidonStringCompare( szUsageType, 1, 0, "L", 1, 0, 2 ) == 0 )
      { 
         //:mMasLC.MasterLabelContent.wAddStatementsPageTitle = "Locations"
         SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "Locations" );
         //:ELSE
      } 
      else
      { 
         //:IF szUsageType = "T"
         if ( ZeidonStringCompare( szUsageType, 1, 0, "T", 1, 0, 2 ) == 0 )
         { 
            //:mMasLC.MasterLabelContent.wAddStatementsPageTitle = "Application Use"
            SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "Application Use" );
            //:ELSE
         } 
         else
         { 
            //:mMasLC.MasterLabelContent.wAddStatementsPageTitle = "Unknown"
            SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "Unknown" );
         } 

         //:END
      } 

      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:InitLocationsStmtsForInsert( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
InitLocationsStmtsForInsert( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mEPA     BASED ON LOD  mEPA
   zVIEW    mEPA = new zVIEW( );
   String   szTempString_0 = null;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// CancelCurrentTemporalSubobject( ViewToWindow, "InitLocationsStmtsForInsert: " )
   //:GET VIEW mEPA NAMED "mEPA"
   RESULT = GetViewByName( mEPA, "mEPA", ViewToWindow, zLEVEL_TASK );
   //:IF mEPA != 0
   if ( getView( mEPA ) != null )
   { 
      //:DropObjectInstance( mEPA )
      DropObjectInstance( mEPA );
   } 

   //:END

   //:ACTIVATE mEPA WHERE mEPA.EPA_ChemicalFamily.ChemicalFamily = mMasLC.MasterProduct.ChemicalFamily
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasLC, "MasterProduct", "ChemicalFamily" );
   szTempString_0 = sb_szTempString_0.toString( );}
   o_fnLocalBuildQual_11( ViewToWindow, vTempViewVar_0, szTempString_0 );
   RESULT = ActivateObjectInstance( mEPA, "mEPA", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mEPA "mEPA"
   SetNameForView( mEPA, "mEPA", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ConfirmAddLocationsStmts( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
ConfirmAddLocationsStmts( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mEPA     REGISTERED AS mEPA
   zVIEW    mEPA = new zVIEW( );
   //:STRING ( 256 ) szName
   String   szName = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mEPA, "mEPA", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_Usage" )
   AcceptSubobject( mMasLC, "M_Usage" );
   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:szName = mMasLC.M_Usage.Name
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
      StringBuilder sb_szName;
      if ( szName == null )
         sb_szName = new StringBuilder( 32 );
      else
         sb_szName = new StringBuilder( szName );
             GetVariableFromAttribute( sb_szName, mi_lTempInteger_0, 'S', 257, mMasLC, "M_Usage", "Name", "", 0 );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );
      szName = sb_szName.toString( );}
      //:IF szName = ""
      if ( ZeidonStringCompare( szName, 1, 0, "", 1, 0, 257 ) == 0 )
      { 
         //:DeleteEntity( mMasLC, "M_Usage", zREPOS_NONE )
         DeleteEntity( mMasLC, "M_Usage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
      //:END
   } 

   //:END
   //:FOR EACH mEPA.EPA_Location
   RESULT = SetCursorFirstEntity( mEPA, "EPA_Location", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mEPA.EPA_Location.wkSelected = "Y"
      if ( CompareAttributeToString( mEPA, "EPA_Location", "wkSelected", "Y" ) == 0 )
      { 
         //:szName = mEPA.EPA_Location.Name
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szName;
         if ( szName == null )
            sb_szName = new StringBuilder( 32 );
         else
            sb_szName = new StringBuilder( szName );
                   GetVariableFromAttribute( sb_szName, mi_lTempInteger_1, 'S', 257, mEPA, "EPA_Location", "Name", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szName = sb_szName.toString( );}
         //:IF szName != ""
         if ( ZeidonStringCompare( szName, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:CreateEntity( mMasLC, "M_Usage", zPOS_LAST )
            CreateEntity( mMasLC, "M_Usage", zPOS_LAST );
            //:mMasLC.M_Usage.UsageType = "L" // Location
            SetAttributeFromString( mMasLC, "M_Usage", "UsageType", "L" );
            //:mMasLC.M_Usage.Name = szName
            SetAttributeFromString( mMasLC, "M_Usage", "Name", szName );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mEPA, "EPA_Location", "" );
      //:END
   } 

   //:END

   //:COMMIT mMasLC
   RESULT = CommitObjectInstance( mMasLC );
   //:DropObjectInstance( mEPA )
   DropObjectInstance( mEPA );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_Usage" )
   CreateTemporalSubobjectVersion( mMasLC, "M_Usage" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelAddLocationsStmts( VIEW ViewToWindow )

//:   VIEW mEPA     REGISTERED AS mEPA
public int 
CancelAddLocationsStmts( View     ViewToWindow )
{
   zVIEW    mEPA = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mEPA, "mEPA", ViewToWindow, zLEVEL_TASK );

   //:DropObjectInstance( mEPA )
   DropObjectInstance( mEPA );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:InitAppTypesStmtsForInsert( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
InitAppTypesStmtsForInsert( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mEPA     BASED ON LOD  mEPA
   zVIEW    mEPA = new zVIEW( );
   String   szTempString_0 = null;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// CancelCurrentTemporalSubobject( ViewToWindow, "InitAppTypesStmtsForInsert: " )
   //:GET VIEW mEPA NAMED "mEPA"
   RESULT = GetViewByName( mEPA, "mEPA", ViewToWindow, zLEVEL_TASK );
   //:IF mEPA != 0
   if ( getView( mEPA ) != null )
   { 
      //:DropObjectInstance( mEPA )
      DropObjectInstance( mEPA );
   } 

   //:END

   //:ACTIVATE mEPA WHERE mEPA.EPA_ChemicalFamily.ChemicalFamily = mMasLC.MasterProduct.ChemicalFamily
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasLC, "MasterProduct", "ChemicalFamily" );
   szTempString_0 = sb_szTempString_0.toString( );}
   o_fnLocalBuildQual_12( ViewToWindow, vTempViewVar_0, szTempString_0 );
   RESULT = ActivateObjectInstance( mEPA, "mEPA", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mEPA "mEPA"
   SetNameForView( mEPA, "mEPA", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ConfirmAddAppTypesStmts( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
ConfirmAddAppTypesStmts( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mEPA     REGISTERED AS mEPA
   zVIEW    mEPA = new zVIEW( );
   //:STRING ( 256 ) szName
   String   szName = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mEPA, "mEPA", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_Usage" )
   AcceptSubobject( mMasLC, "M_Usage" );
   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:szName = mMasLC.M_Usage.Name
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
      StringBuilder sb_szName;
      if ( szName == null )
         sb_szName = new StringBuilder( 32 );
      else
         sb_szName = new StringBuilder( szName );
             GetVariableFromAttribute( sb_szName, mi_lTempInteger_0, 'S', 257, mMasLC, "M_Usage", "Name", "", 0 );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );
      szName = sb_szName.toString( );}
      //:IF szName = ""
      if ( ZeidonStringCompare( szName, 1, 0, "", 1, 0, 257 ) == 0 )
      { 
         //:DeleteEntity( mMasLC, "M_Usage", zREPOS_NONE )
         DeleteEntity( mMasLC, "M_Usage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
      //:END
   } 

   //:END
   //:FOR EACH mEPA.EPA_ApplicationType
   RESULT = SetCursorFirstEntity( mEPA, "EPA_ApplicationType", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mEPA.EPA_ApplicationType.wkSelected = "Y"
      if ( CompareAttributeToString( mEPA, "EPA_ApplicationType", "wkSelected", "Y" ) == 0 )
      { 
         //:szName = mEPA.EPA_ApplicationType.Name
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szName;
         if ( szName == null )
            sb_szName = new StringBuilder( 32 );
         else
            sb_szName = new StringBuilder( szName );
                   GetVariableFromAttribute( sb_szName, mi_lTempInteger_1, 'S', 257, mEPA, "EPA_ApplicationType", "Name", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szName = sb_szName.toString( );}
         //:IF szName != ""
         if ( ZeidonStringCompare( szName, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:CreateEntity( mMasLC, "M_Usage", zPOS_LAST )
            CreateEntity( mMasLC, "M_Usage", zPOS_LAST );
            //:mMasLC.M_Usage.UsageType = "T" // Application Type
            SetAttributeFromString( mMasLC, "M_Usage", "UsageType", "T" );
            //:mMasLC.M_Usage.Name = szName
            SetAttributeFromString( mMasLC, "M_Usage", "Name", szName );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mEPA, "EPA_ApplicationType", "" );
      //:END
   } 

   //:END

   //:COMMIT mMasLC
   RESULT = CommitObjectInstance( mMasLC );
   //:DropObjectInstance( mEPA )
   DropObjectInstance( mEPA );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_Usage" )
   CreateTemporalSubobjectVersion( mMasLC, "M_Usage" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelAddAppTypesStmts( VIEW ViewToWindow )

//:   VIEW mEPA     REGISTERED AS mEPA
public int 
CancelAddAppTypesStmts( View     ViewToWindow )
{
   zVIEW    mEPA = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mEPA, "mEPA", ViewToWindow, zLEVEL_TASK );

   //:DropObjectInstance( mEPA )
   DropObjectInstance( mEPA );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:InitSurfacesStmtsForInsert( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
InitSurfacesStmtsForInsert( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mEPA     BASED ON LOD  mEPA
   zVIEW    mEPA = new zVIEW( );
   String   szTempString_0 = null;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// CancelCurrentTemporalSubobject( ViewToWindow, "InitSurfacesStmtsForInsert: " )
   //:GET VIEW mEPA NAMED "mEPA"
   RESULT = GetViewByName( mEPA, "mEPA", ViewToWindow, zLEVEL_TASK );
   //:IF mEPA != 0
   if ( getView( mEPA ) != null )
   { 
      //:DropObjectInstance( mEPA )
      DropObjectInstance( mEPA );
   } 

   //:END

   //:ACTIVATE mEPA WHERE mEPA.EPA_ChemicalFamily.ChemicalFamily = mMasLC.MasterProduct.ChemicalFamily
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasLC, "MasterProduct", "ChemicalFamily" );
   szTempString_0 = sb_szTempString_0.toString( );}
   o_fnLocalBuildQual_10( ViewToWindow, vTempViewVar_0, szTempString_0 );
   RESULT = ActivateObjectInstance( mEPA, "mEPA", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mEPA "mEPA"
   SetNameForView( mEPA, "mEPA", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ConfirmAddSurfacesStmts( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
ConfirmAddSurfacesStmts( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mEPA     REGISTERED AS mEPA
   zVIEW    mEPA = new zVIEW( );
   //:STRING ( 256 ) szName
   String   szName = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mEPA, "mEPA", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_Usage" )
   AcceptSubobject( mMasLC, "M_Usage" );
   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:szName = mMasLC.M_Usage.Name
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
      StringBuilder sb_szName;
      if ( szName == null )
         sb_szName = new StringBuilder( 32 );
      else
         sb_szName = new StringBuilder( szName );
             GetVariableFromAttribute( sb_szName, mi_lTempInteger_0, 'S', 257, mMasLC, "M_Usage", "Name", "", 0 );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );
      szName = sb_szName.toString( );}
      //:IF szName = ""
      if ( ZeidonStringCompare( szName, 1, 0, "", 1, 0, 257 ) == 0 )
      { 
         //:DeleteEntity( mMasLC, "M_Usage", zREPOS_NONE )
         DeleteEntity( mMasLC, "M_Usage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
      //:END
   } 

   //:END
   //:FOR EACH mEPA.EPA_Surface
   RESULT = SetCursorFirstEntity( mEPA, "EPA_Surface", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mEPA.EPA_Surface.wkSelected = "Y"
      if ( CompareAttributeToString( mEPA, "EPA_Surface", "wkSelected", "Y" ) == 0 )
      { 
         //:szName = mEPA.EPA_Surface.Name
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szName;
         if ( szName == null )
            sb_szName = new StringBuilder( 32 );
         else
            sb_szName = new StringBuilder( szName );
                   GetVariableFromAttribute( sb_szName, mi_lTempInteger_1, 'S', 257, mEPA, "EPA_Surface", "Name", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szName = sb_szName.toString( );}
         //:IF szName != ""
         if ( ZeidonStringCompare( szName, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:CreateEntity( mMasLC, "M_Usage", zPOS_LAST )
            CreateEntity( mMasLC, "M_Usage", zPOS_LAST );
            //:mMasLC.M_Usage.UsageType = "S" // Surface
            SetAttributeFromString( mMasLC, "M_Usage", "UsageType", "S" );
            //:mMasLC.M_Usage.Name = szName
            SetAttributeFromString( mMasLC, "M_Usage", "Name", szName );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mEPA, "EPA_Surface", "" );
      //:END
   } 

   //:END

   //:COMMIT mMasLC
   RESULT = CommitObjectInstance( mMasLC );
   //:DropObjectInstance( mEPA )
   DropObjectInstance( mEPA );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_Usage" )
   CreateTemporalSubobjectVersion( mMasLC, "M_Usage" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelAddSurfacesStmts( VIEW ViewToWindow )

//:   VIEW mEPA     REGISTERED AS mEPA
public int 
CancelAddSurfacesStmts( View     ViewToWindow )
{
   zVIEW    mEPA = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mEPA, "mEPA", ViewToWindow, zLEVEL_TASK );

   //:DropObjectInstance( mEPA )
   DropObjectInstance( mEPA );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:InitClaimsStmtsForInsert( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
InitClaimsStmtsForInsert( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mEPA     BASED ON LOD  mEPA
   zVIEW    mEPA = new zVIEW( );
   //:STRING ( 16 ) szClass
   String   szClass = null;
   String   szTempString_0 = null;
   zVIEW    vTempViewVar_0 = new zVIEW( );
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// CancelCurrentTemporalSubobject( ViewToWindow, "InitClaimsStmtsForInsert: " )
   //:GET VIEW mEPA NAMED "mEPA"
   RESULT = GetViewByName( mEPA, "mEPA", ViewToWindow, zLEVEL_TASK );
   //:IF mEPA != 0
   if ( getView( mEPA ) != null )
   { 
      //:DropObjectInstance( mEPA )
      DropObjectInstance( mEPA );
   } 

   //:END

   //:ACTIVATE mEPA WHERE mEPA.EPA_ChemicalFamily.ChemicalFamily = mMasLC.MasterProduct.ChemicalFamily
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasLC, "MasterProduct", "ChemicalFamily" );
   szTempString_0 = sb_szTempString_0.toString( );}
   o_fnLocalBuildQual_9( ViewToWindow, vTempViewVar_0, szTempString_0 );
   RESULT = ActivateObjectInstance( mEPA, "mEPA", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:FOR EACH mEPA.EPA_Claim
   RESULT = SetCursorFirstEntity( mEPA, "EPA_Claim", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:szClass = mEPA.EPA_Claim.ClaimsClassification
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
      StringBuilder sb_szClass;
      if ( szClass == null )
         sb_szClass = new StringBuilder( 32 );
      else
         sb_szClass = new StringBuilder( szClass );
             GetVariableFromAttribute( sb_szClass, mi_lTempInteger_0, 'S', 17, mEPA, "EPA_Claim", "ClaimsClassification", "", 0 );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );
      szClass = sb_szClass.toString( );}
      //:IF szClass = "Bacteria" OR szClass = "Fungi" OR szClass = "Viruses" OR szClass = "Protozoa"
      if ( ZeidonStringCompare( szClass, 1, 0, "Bacteria", 1, 0, 17 ) == 0 || ZeidonStringCompare( szClass, 1, 0, "Fungi", 1, 0, 17 ) == 0 || ZeidonStringCompare( szClass, 1, 0, "Viruses", 1, 0, 17 ) == 0 ||
           ZeidonStringCompare( szClass, 1, 0, "Protozoa", 1, 0, 17 ) == 0 )
      { 
         //:CreateEntity( mEPA, szClass, zPOS_LAST )
         CreateEntity( mEPA, szClass, zPOS_LAST );
         //:ELSE
      } 
      else
      { 
         //:TraceLineS( "Invalid ClaimsClassification: ", szClass )
         TraceLineS( "Invalid ClaimsClassification: ", szClass );
      } 

      RESULT = SetCursorNextEntity( mEPA, "EPA_Claim", "" );
      //:END
   } 

   //:END

   //:NAME VIEW mEPA "mEPA"
   SetNameForView( mEPA, "mEPA", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ConfirmAddClaimsStmts( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
ConfirmAddClaimsStmts( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mEPA     REGISTERED AS mEPA
   zVIEW    mEPA = new zVIEW( );
   //:STRING ( 256 ) szName
   String   szName = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mEPA, "mEPA", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_Usage" )
   AcceptSubobject( mMasLC, "M_Usage" );
   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:szName = mMasLC.M_Usage.Name
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
      StringBuilder sb_szName;
      if ( szName == null )
         sb_szName = new StringBuilder( 32 );
      else
         sb_szName = new StringBuilder( szName );
             GetVariableFromAttribute( sb_szName, mi_lTempInteger_0, 'S', 257, mMasLC, "M_Usage", "Name", "", 0 );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );
      szName = sb_szName.toString( );}
      //:IF szName = ""
      if ( ZeidonStringCompare( szName, 1, 0, "", 1, 0, 257 ) == 0 )
      { 
         //:DeleteEntity( mMasLC, "M_Usage", zREPOS_NONE )
         DeleteEntity( mMasLC, "M_Usage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
      //:END
   } 

   //:END
   //:FOR EACH mEPA.EPA_Claim
   RESULT = SetCursorFirstEntity( mEPA, "EPA_Claim", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mEPA.EPA_Claim.wkSelected = "Y"
      if ( CompareAttributeToString( mEPA, "EPA_Claim", "wkSelected", "Y" ) == 0 )
      { 
         //:szName = mEPA.EPA_Claim.Name
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szName;
         if ( szName == null )
            sb_szName = new StringBuilder( 32 );
         else
            sb_szName = new StringBuilder( szName );
                   GetVariableFromAttribute( sb_szName, mi_lTempInteger_1, 'S', 257, mEPA, "EPA_Claim", "Name", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szName = sb_szName.toString( );}
         //:IF szName != ""
         if ( ZeidonStringCompare( szName, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:CreateEntity( mMasLC, "M_Usage", zPOS_LAST )
            CreateEntity( mMasLC, "M_Usage", zPOS_LAST );
            //:mMasLC.M_Usage.UsageType = "C" // Claim
            SetAttributeFromString( mMasLC, "M_Usage", "UsageType", "C" );
            //:mMasLC.M_Usage.ClaimsClassification = mEPA.EPA_Claim.ClaimsClassification
            SetAttributeFromAttribute( mMasLC, "M_Usage", "ClaimsClassification", mEPA, "EPA_Claim", "ClaimsClassification" );
            //:mMasLC.M_Usage.Name = szName
            SetAttributeFromString( mMasLC, "M_Usage", "Name", szName );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mEPA, "EPA_Claim", "" );
      //:END
   } 

   //:END

   //:COMMIT mMasLC
   RESULT = CommitObjectInstance( mMasLC );
   //:DropObjectInstance( mEPA )
   DropObjectInstance( mEPA );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_Usage" )
   CreateTemporalSubobjectVersion( mMasLC, "M_Usage" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelAddClaimsStmts( VIEW ViewToWindow )

//:   VIEW mEPA     REGISTERED AS mEPA
public int 
CancelAddClaimsStmts( View     ViewToWindow )
{
   zVIEW    mEPA = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mEPA, "mEPA", ViewToWindow, zLEVEL_TASK );

   //:DropObjectInstance( mEPA )
   DropObjectInstance( mEPA );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_SelectRemoveMktgEntries( VIEW ViewToWindow )

//:   VIEW mMasLC  REGISTERED AS mMasLC
public int 
GOTO_SelectRemoveMktgEntries( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Initialize the mMasLC for selecting Statement Usage entries.
   //:mMasLC.MasterLabelContent.wSelectedUsageType = "M"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "M" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_FootnoteStmtDelete( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_FootnoteStmtDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Footnote Statement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Footnote Statement" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_UsageFootnote.Text
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_UsageFootnote", "Text" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_UsageFootnote"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_UsageFootnote" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DilutionChartItemDelete( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
GOTO_DilutionChartItemDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Dilution Chart Item"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Dilution Chart Item" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_DilutionChartEntry.Use
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_DilutionChartEntry", "Use" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_DilutionChartEntry"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_DilutionChartEntry" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAddNewDilutionChartEntry( VIEW ViewToWindow )

//:   VIEW  mMasLC   REGISTERED AS mMasLC
public int 
AcceptAddNewDilutionChartEntry( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Accept Ingredients Statement and add new temporal one.
   //:nRC = AcceptSubobject( mMasLC, "M_DilutionChartEntry" )
   nRC = AcceptSubobject( mMasLC, "M_DilutionChartEntry" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Save And Add New Dilution Chart Entry",
      //:             "Error saving Dilution Chart Entry.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Save And Add New Dilution Chart Entry", "Error saving Dilution Chart Entry.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:CreateTemporalEntity( mMasLC, "M_DilutionChartEntry", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_DilutionChartEntry", zPOS_AFTER );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DilutionGroupDelete( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
GOTO_DilutionGroupDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Dilution Group"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Dilution Group" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_DilutionGroup.DilutionRatioText
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_DilutionGroup", "DilutionRatioText" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_DilutionGroup"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_DilutionGroup" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DilutionGroupItemDelete( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
GOTO_DilutionGroupItemDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Dilution Group Item"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Dilution Group Item" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_DilutionGroupItem.Text
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_DilutionGroupItem", "Text" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_DilutionGroupItem"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_DilutionGroupItem" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SETALL_MLC_UsageSource( VIEW ViewToWindow )

//:   VIEW mMasLC  REGISTERED AS mMasLC
public int 
SETALL_MLC_UsageSource( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mMasLC.M_Usage.wSelected = "Y"
      SetAttributeFromString( mMasLC, "M_Usage", "wSelected", "Y" );
      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DirsForUseStatementDelete( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
GOTO_DirsForUseStatementDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Directions For Use Statement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Directions For Use Statement" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_DirectionsForUseStatement.Text
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_DirectionsForUseStatement", "Text" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_DirectionsForUseStatement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_DirectionsForUseStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_MarketingSectionDelete( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
GOTO_MarketingSectionDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Marketing Section"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Marketing Section" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_MarketingSection.Name
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_MarketingSection", "Name" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_MarketingSection"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_MarketingSection" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SelectUsageEntries( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
SelectUsageEntries( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Include each selected Usage Source entry in the Target subobject.
   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_Usage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_Usage", "wSelected", "Y" ) == 0 )
      { 
         //:// The target entity depends on the type of select set earlier.
         //:IF mMasLC.MasterLabelContent.wSelectedUsageType = "DC"   // Dir for Use Driving Claim
         if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "DC" ) == 0 )
         { 
            //:SET CURSOR FIRST mMasLC.M_ClaimsDrivingUsage WHERE mMasLC.M_ClaimsDrivingUsage.ID = mMasLC.M_Usage.ID
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                         GetIntegerFromAttribute( mi_lTempInteger_0, mMasLC, "M_Usage", "ID" );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_ClaimsDrivingUsage", "ID", lTempInteger_0, "" );
            //:IF RESULT < zCURSOR_SET
            if ( RESULT < zCURSOR_SET )
            { 
               //:INCLUDE mMasLC.M_ClaimsDrivingUsage FROM mMasLC.M_Usage
               RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_ClaimsDrivingUsage", mMasLC, "M_Usage", zPOS_AFTER );
            } 

            //:END
         } 

         //:END
         //:IF mMasLC.MasterLabelContent.wSelectedUsageType = "D"   // Dir for Use Statement
         if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "D" ) == 0 )
         { 
            //:SET CURSOR FIRST mMasLC.M_DirectionsUsage WITHIN mMasLC.M_DirectionsForUseStatement
            //:           WHERE mMasLC.M_DirectionsUsage.ID = mMasLC.M_Usage.ID
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                         GetIntegerFromAttribute( mi_lTempInteger_1, mMasLC, "M_Usage", "ID" );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_DirectionsUsage", "ID", lTempInteger_1, "M_DirectionsForUseStatement" );
            //:IF RESULT < zCURSOR_SET
            if ( RESULT < zCURSOR_SET )
            { 
               //:SET CURSOR LAST mMasLC.M_DirectionsUsageOrdering
               RESULT = SetCursorLastEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
               //:CREATE ENTITY  mMasLC.M_DirectionsUsageOrdering
               RESULT = CreateEntity( mMasLC, "M_DirectionsUsageOrdering", zPOS_AFTER );
               //:INCLUDE mMasLC.M_DirectionsUsage FROM mMasLC.M_Usage
               RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_DirectionsUsage", mMasLC, "M_Usage", zPOS_AFTER );
            } 

            //:END
         } 

         //:END
         //:IF mMasLC.MasterLabelContent.wSelectedUsageType = "M"   // Marketing Statement
         if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "M" ) == 0 )
         { 
            //:SET CURSOR FIRST mMasLC.M_MarketingUsage WITHIN mMasLC.M_MarketingStatement
            //:           WHERE mMasLC.M_MarketingUsage.ID = mMasLC.M_Usage.ID
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                         GetIntegerFromAttribute( mi_lTempInteger_2, mMasLC, "M_Usage", "ID" );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_MarketingUsage", "ID", lTempInteger_2, "M_MarketingStatement" );
            //:IF RESULT < zCURSOR_SET
            if ( RESULT < zCURSOR_SET )
            { 
               //:SET CURSOR LAST mMasLC.M_MarketingUsageOrdering
               RESULT = SetCursorLastEntity( mMasLC, "M_MarketingUsageOrdering", "" );
               //:CREATE ENTITY  mMasLC.M_MarketingUsageOrdering
               RESULT = CreateEntity( mMasLC, "M_MarketingUsageOrdering", zPOS_AFTER );
               //:INCLUDE mMasLC.M_MarketingUsage FROM mMasLC.M_Usage
               RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_MarketingUsage", mMasLC, "M_Usage", zPOS_AFTER );
            } 

            //:END
         } 

         //:END

         //:mMasLC.M_Usage.wSelected = ""
         SetAttributeFromString( mMasLC, "M_Usage", "wSelected", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:RemoveMLC_UsageEntries( VIEW ViewToWindow )

//:   VIEW mMasLC  REGISTERED AS mMasLC
public int 
RemoveMLC_UsageEntries( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Remove depends on the target entity.
   //:IF mMasLC.MasterLabelContent.wSelectedUsageType = "DC"   // Dir for Use Driving Claim
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "DC" ) == 0 )
   { 
      //:FOR EACH mMasLC.M_ClaimsDrivingUsage
      RESULT = SetCursorFirstEntity( mMasLC, "M_ClaimsDrivingUsage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mMasLC.M_ClaimsDrivingUsage.wSelected = "Y"
         if ( CompareAttributeToString( mMasLC, "M_ClaimsDrivingUsage", "wSelected", "Y" ) == 0 )
         { 
            //:EXCLUDE  mMasLC.M_ClaimsDrivingUsage NONE
            RESULT = ExcludeEntity( mMasLC, "M_ClaimsDrivingUsage", zREPOS_NONE );
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_ClaimsDrivingUsage", "" );
         //:END
      } 

      //:END
   } 

   //:END
   //:IF mMasLC.MasterLabelContent.wSelectedUsageType = "D"   // Dir for Use Statement
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "D" ) == 0 )
   { 
      //:FOR EACH mMasLC.M_DirectionsUsageOrdering
      RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mMasLC.M_DirectionsUsageOrdering.wSelected = "Y"
         if ( CompareAttributeToString( mMasLC, "M_DirectionsUsageOrdering", "wSelected", "Y" ) == 0 )
         { 
            //:DELETE ENTITY mMasLC.M_DirectionsUsageOrdering NONE
            RESULT = DeleteEntity( mMasLC, "M_DirectionsUsageOrdering", zREPOS_NONE );
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
         //:END
      } 

      //:END
   } 

   //:END
   //:IF mMasLC.MasterLabelContent.wSelectedUsageType = "M"   // Marketing Statement
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "M" ) == 0 )
   { 
      //:FOR EACH mMasLC.M_MarketingUsageOrdering
      RESULT = SetCursorFirstEntity( mMasLC, "M_MarketingUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mMasLC.M_MarketingUsageOrdering.wSelected = "Y"
         if ( CompareAttributeToString( mMasLC, "M_MarketingUsageOrdering", "wSelected", "Y" ) == 0 )
         { 
            //:DELETE ENTITY mMasLC.M_MarketingUsageOrdering NONE
            RESULT = DeleteEntity( mMasLC, "M_MarketingUsageOrdering", zREPOS_NONE );
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_MarketingUsageOrdering", "" );
         //:END
      } 

      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CLEAR_MLC_UsageTarget( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
CLEAR_MLC_UsageTarget( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Clear depends on the target entity.
   //:IF mMasLC.MasterLabelContent.wSelectedUsageType = "DC"   // Dir for Use Driving Claim
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "DC" ) == 0 )
   { 
      //:FOR EACH mMasLC.M_ClaimsDrivingUsage
      RESULT = SetCursorFirstEntity( mMasLC, "M_ClaimsDrivingUsage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mMasLC.M_ClaimsDrivingUsage.wSelected = ""
         SetAttributeFromString( mMasLC, "M_ClaimsDrivingUsage", "wSelected", "" );
         RESULT = SetCursorNextEntity( mMasLC, "M_ClaimsDrivingUsage", "" );
      } 

      //:END
   } 

   //:END
   //:IF mMasLC.MasterLabelContent.wSelectedUsageType = "D"   // Dir for Use Statement
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "D" ) == 0 )
   { 
      //:FOR EACH mMasLC.M_DirectionsUsageOrdering
      RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mMasLC.M_DirectionsUsageOrdering.wSelected = ""
         SetAttributeFromString( mMasLC, "M_DirectionsUsageOrdering", "wSelected", "" );
         RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
      } 

      //:END
   } 

   //:END
   //:IF mMasLC.MasterLabelContent.wSelectedUsageType = "M"   // Marketing Statement
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "M" ) == 0 )
   { 
      //:FOR EACH mMasLC.M_MarketingUsageOrdering
      RESULT = SetCursorFirstEntity( mMasLC, "M_MarketingUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mMasLC.M_MarketingUsageOrdering.wSelected = ""
         SetAttributeFromString( mMasLC, "M_MarketingUsageOrdering", "wSelected", "" );
         RESULT = SetCursorNextEntity( mMasLC, "M_MarketingUsageOrdering", "" );
      } 

      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SETALL_MLC_UsageTarget( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
SETALL_MLC_UsageTarget( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Set All depends on the target entity.
   //:IF mMasLC.MasterLabelContent.wSelectedUsageType = "DC"   // Dir for Use Driving Claim
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "DC" ) == 0 )
   { 
      //:FOR EACH mMasLC.M_ClaimsDrivingUsage
      RESULT = SetCursorFirstEntity( mMasLC, "M_ClaimsDrivingUsage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mMasLC.M_ClaimsDrivingUsage.wSelected = "Y"
         SetAttributeFromString( mMasLC, "M_ClaimsDrivingUsage", "wSelected", "Y" );
         RESULT = SetCursorNextEntity( mMasLC, "M_ClaimsDrivingUsage", "" );
      } 

      //:END
   } 

   //:END
   //:IF mMasLC.MasterLabelContent.wSelectedUsageType = "D"   // Dir for Use Statement
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "D" ) == 0 )
   { 
      //:FOR EACH mMasLC.M_DirectionsUsageOrdering
      RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mMasLC.M_DirectionsUsageOrdering.wSelected = "Y"
         SetAttributeFromString( mMasLC, "M_DirectionsUsageOrdering", "wSelected", "Y" );
         RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
      } 

      //:END
   } 

   //:END
   //:IF mMasLC.MasterLabelContent.wSelectedUsageType = "M"   // Marketing Statement
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "M" ) == 0 )
   { 
      //:FOR EACH mMasLC.M_MarketingUsageOrdering
      RESULT = SetCursorFirstEntity( mMasLC, "M_MarketingUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mMasLC.M_MarketingUsageOrdering.wSelected = "Y"
         SetAttributeFromString( mMasLC, "M_MarketingUsageOrdering", "wSelected", "Y" );
         RESULT = SetCursorNextEntity( mMasLC, "M_MarketingUsageOrdering", "" );
      } 

      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CLEAR_MLC_UsageSource( VIEW ViewToWindow )

//:   VIEW mMasLC  REGISTERED AS mMasLC
public int 
CLEAR_MLC_UsageSource( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mMasLC.M_Usage.wSelected = ""
      SetAttributeFromString( mMasLC, "M_Usage", "wSelected", "" );
      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DirsForUseStatementAdd( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DirsForUseStatementAdd( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Add new temporal entity as last statement under section.
   //:CreateTemporalEntity( mMasLC, "M_DirectionsForUseStatement", zPOS_LAST )
   CreateTemporalEntity( mMasLC, "M_DirectionsForUseStatement", zPOS_LAST );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DirsForUseSubStatementAdd( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DirsForUseSubStatementAdd( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:SetViewToSubobject( mMasLC, "M_DirectionsForUseSubStatement" )
   SetViewToSubobject( mMasLC, "M_DirectionsForUseSubStatement" );
   //:CreateTemporalEntity( mMasLC, "M_DirectionsForUseStatement", zPOS_LAST )
   CreateTemporalEntity( mMasLC, "M_DirectionsForUseStatement", zPOS_LAST );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DirsForUseSubStmtUpdate( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DirsForUseSubStmtUpdate( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:SetViewToSubobject( mMasLC, "M_DirectionsForUseSubStatement" )
   SetViewToSubobject( mMasLC, "M_DirectionsForUseSubStatement" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseStatement" )
   CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptDirectionsSubStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptDirectionsSubStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" )
   nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Accept Directions For Use Sub-statement",
      //:             "The Directions For Use Sub-Statement (Accept) contains errors.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Accept Directions For Use Sub-statement", "The Directions For Use Sub-Statement (Accept) contains errors.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN nRC
      if(8==8)return( nRC );
   } 

   //:END
   //:ResetViewFromSubobject( mMasLC )
   ResetViewFromSubobject( mMasLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AddNewDirectionsSubStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AddNewDirectionsSubStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" )
   nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Accept Directions For Use Sub-statement",
      //:             "The Directions For Use Sub-Statement (Accept) contains errors.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Accept Directions For Use Sub-statement", "The Directions For Use Sub-Statement (Accept) contains errors.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN nRC
      if(8==8)return( nRC );
   } 

   //:END
   //:CreateTemporalEntity( mMasLC, "M_DirectionsForUseStatement", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_DirectionsForUseStatement", zPOS_AFTER );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:NextDirectionsSubStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
NextDirectionsSubStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" )
   nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Accept Directions For Use Sub-statement",
      //:             "The Directions For Use Sub-Statement (Accept) contains errors.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Accept Directions For Use Sub-statement", "The Directions For Use Sub-Statement (Accept) contains errors.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN nRC
      if(8==8)return( nRC );
   } 

   //:END
   //:SET CURSOR NEXT mMasLC.M_DirectionsForUseStatement
   RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsForUseStatement", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseStatement" )
   CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:PreviousDirectionsSubStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
PreviousDirectionsSubStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" )
   nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Accept Directions For Use Sub-statement",
      //:             "The Directions For Use Sub-Statement (Accept) contains errors.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Accept Directions For Use Sub-statement", "The Directions For Use Sub-Statement (Accept) contains errors.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN nRC
      if(8==8)return( nRC );
   } 

   //:END
   //:SET CURSOR PREVIOUS mMasLC.M_DirectionsForUseStatement
   RESULT = SetCursorPrevEntity( mMasLC, "M_DirectionsForUseStatement", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseStatement" )
   CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptDirectionsForUseSection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptDirectionsForUseSection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLCIncludeExclude REGISTERED AS mMasLCIncludeExclude
   zVIEW    mMasLCIncludeExclude = new zVIEW( );

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLCIncludeExclude, "mMasLCIncludeExclude", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_DirectionsForUseSection" )
   AcceptSubobject( mMasLC, "M_DirectionsForUseSection" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptDirectionsForUseCategory( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptDirectionsForUseCategory( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLCIncludeExclude REGISTERED AS mMasLCIncludeExclude
   zVIEW    mMasLCIncludeExclude = new zVIEW( );

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLCIncludeExclude, "mMasLCIncludeExclude", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_DirectionsForUseCategory" )
   AcceptSubobject( mMasLC, "M_DirectionsForUseCategory" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptDFU_CategoryGoNext( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptDFU_CategoryGoNext( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_DirectionsForUseCategory" )
   AcceptSubobject( mMasLC, "M_DirectionsForUseCategory" );
   //:SetCursorNextEntity( mMasLC, "M_DirectionsForUseCategory", "" )
   SetCursorNextEntity( mMasLC, "M_DirectionsForUseCategory", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseCategory" )
   CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseCategory" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptDFU_CategoryGoPrev( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptDFU_CategoryGoPrev( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_DirectionsForUseCategory" )
   AcceptSubobject( mMasLC, "M_DirectionsForUseCategory" );
   //:SetCursorPrevEntity( mMasLC, "M_DirectionsForUseCategory", "" )
   SetCursorPrevEntity( mMasLC, "M_DirectionsForUseCategory", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseCategory" )
   CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseCategory" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptDFU_SectionGoNext( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptDFU_SectionGoNext( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLCIncludeExclude REGISTERED AS mMasLCIncludeExclude
   zVIEW    mMasLCIncludeExclude = new zVIEW( );
   //:STRING ( 256 ) szName
   String   szName = null;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLCIncludeExclude, "mMasLCIncludeExclude", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_DirectionsForUseSection" )
   AcceptSubobject( mMasLC, "M_DirectionsForUseSection" );
   //:SetCursorNextEntity( mMasLC, "M_DirectionsForUseSection", "" )
   SetCursorNextEntity( mMasLC, "M_DirectionsForUseSection", "" );
   //:szName = mMasLC.M_DirectionsForUseSection.Name
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szName;
   if ( szName == null )
      sb_szName = new StringBuilder( 32 );
   else
      sb_szName = new StringBuilder( szName );
       GetVariableFromAttribute( sb_szName, mi_lTempInteger_0, 'S', 257, mMasLC, "M_DirectionsForUseSection", "Name", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szName = sb_szName.toString( );}
   //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseSection" )
   CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseSection" );
   //:BuildDFU_SectionNameList( mMasLC, szName )
   o_BuildDFU_SectionNameList( mMasLC, szName );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptDFU_SectionGoPrev( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptDFU_SectionGoPrev( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLCIncludeExclude REGISTERED AS mMasLCIncludeExclude
   zVIEW    mMasLCIncludeExclude = new zVIEW( );
   //:STRING ( 256 ) szName
   String   szName = null;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLCIncludeExclude, "mMasLCIncludeExclude", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_DirectionsForUseSection" )
   AcceptSubobject( mMasLC, "M_DirectionsForUseSection" );
   //:SetCursorPrevEntity( mMasLC, "M_DirectionsForUseSection", "" )
   SetCursorPrevEntity( mMasLC, "M_DirectionsForUseSection", "" );
   //:szName = mMasLC.M_DirectionsForUseSection.Name
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szName;
   if ( szName == null )
      sb_szName = new StringBuilder( 32 );
   else
      sb_szName = new StringBuilder( szName );
       GetVariableFromAttribute( sb_szName, mi_lTempInteger_0, 'S', 257, mMasLC, "M_DirectionsForUseSection", "Name", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szName = sb_szName.toString( );}
   //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseSection" )
   CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseSection" );
   //:BuildDFU_SectionNameList( mMasLC, szName )
   o_BuildDFU_SectionNameList( mMasLC, szName );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptDFU_StatementGoNext( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptDFU_StatementGoNext( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" )
   AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" );
   //:SetCursorNextEntity( mMasLC, "M_DirectionsForUseStatement", "" )
   SetCursorNextEntity( mMasLC, "M_DirectionsForUseStatement", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseStatement" )
   CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptDFU_StatementGoPrev( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptDFU_StatementGoPrev( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" )
   AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" );
   //:SetCursorPrevEntity( mMasLC, "M_DirectionsForUseStatement", "" )
   SetCursorPrevEntity( mMasLC, "M_DirectionsForUseStatement", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseStatement" )
   CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelDirectionsForUseSection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
CancelDirectionsForUseSection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLCIncludeExclude REGISTERED AS mMasLCIncludeExclude
   zVIEW    mMasLCIncludeExclude = new zVIEW( );

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLCIncludeExclude, "mMasLCIncludeExclude", ViewToWindow, zLEVEL_TASK );

   //:CancelSubobject( mMasLC, "M_DirectionsForUseSection" )
   CancelSubobject( mMasLC, "M_DirectionsForUseSection" );
   //:DropView( mMasLCIncludeExclude )
   DropView( mMasLCIncludeExclude );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelDirectionsSubStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
CancelDirectionsSubStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = CancelSubobject( mMasLC, "M_DirectionsForUseStatement" )
   nRC = CancelSubobject( mMasLC, "M_DirectionsForUseStatement" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Cancel Directions For Use Sub-statement",
      //:             "The Directions For Use Sub-Statement (Cancel) contains errors.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Cancel Directions For Use Sub-statement", "The Directions For Use Sub-Statement (Cancel) contains errors.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN nRC
      if(8==8)return( nRC );
   } 

   //:END
   //:ResetViewFromSubobject( mMasLC )
   ResetViewFromSubobject( mMasLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AddNewUsageKeyword( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AddNewUsageKeyword( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateTemporalEntity( mMasLC, "M_InsertTextKeywordUsage", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_InsertTextKeywordUsage", zPOS_AFTER );
   //:mMasLC.M_InsertTextKeywordUsage.Type = "A"
   SetAttributeFromString( mMasLC, "M_InsertTextKeywordUsage", "Type", "A" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAddNewDU_Stmt( VIEW ViewToWindow )

//:   VIEW  mMasLC   REGISTERED AS mMasLC
public int 
AcceptAddNewDU_Stmt( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Accept Direction for Use Statement and add new temporal one.
   //:nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" )
   nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseStatement" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Add New Directions for Use Statement",
      //:             "Error saving Directions for Use statement.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Add New Directions for Use Statement", "Error saving Directions for Use statement.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:CreateTemporalEntity( mMasLC, "M_DirectionsForUseStatement", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_DirectionsForUseStatement", zPOS_AFTER );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AddNewDFU_Section( VIEW ViewToWindow )

//:   VIEW  mMasLC   REGISTERED AS mMasLC
public int 
AddNewDFU_Section( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Accept Direction for Use Section and add new temporal one.
   //:nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseSection" )
   nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseSection" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Add New Directions for Use Section",
      //:             "Error saving Directions for Use section.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Add New Directions for Use Section", "Error saving Directions for Use section.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:CreateTemporalEntity( mMasLC, "M_DirectionsForUseSection", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_DirectionsForUseSection", zPOS_AFTER );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AddNewDFU_Category( VIEW ViewToWindow )

//:   VIEW  mMasLC   REGISTERED AS mMasLC
public int 
AddNewDFU_Category( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Accept Direction for Use Section and add new temporal one.
   //:nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseCategory" )
   nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseCategory" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Add New Directions for Use Category",
      //:             "Error saving Directions for Use category.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Add New Directions for Use Category", "Error saving Directions for Use category.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:CreateTemporalEntity( mMasLC, "M_DirectionsForUseCategory", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_DirectionsForUseCategory", zPOS_AFTER );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_SelectRemoveDUEntries( VIEW ViewToWindow )

//:   VIEW mMasLC  REGISTERED AS mMasLC
public int 
GOTO_SelectRemoveDUEntries( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Initialize the mMasLC for selecting Statement Usage entries.
   //:mMasLC.MasterLabelContent.wSelectedUsageType = "D"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "D" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SaveAddNewUsage( VIEW ViewToWindow )

//:   VIEW  mMasLC REGISTERED AS mMasLC
public int 
SaveAddNewUsage( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_Usage" )
   nRC = AcceptSubobject( mMasLC, "M_Usage" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Save And Add New Usage Statement",
      //:             "Error accepting Statement.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Save And Add New Usage Statement", "Error accepting Statement.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:CreateTemporalEntity( mMasLC, "M_Usage", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_Usage", zPOS_AFTER );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ConfirmDeleteUsageEntry( VIEW ViewToWindow )

//:/*
//:   VIEW mMasLC REGISTERED AS mMasLC
//:   VIEW mMasLC2 BASED ON LOD mMasLC
//:   SHORT nContinue
//:   CreateViewFromView( mMasLC2, mMasLC )
//:   // Delete all selected Usage entries.
//:   FOR EACH mMasLC.M_Usage
//:      IF mMasLC.M_Usage.wSelected = "Y"
//:         nContinue = 1
//:         SET CURSOR FIRST mMasLC2.M_MarketingSection
//:         LOOP WHILE RESULT >= zCURSOR_SET AND nContinue > 0
//:            SET CURSOR FIRST mMasLC2.M_MarketingStatement
//:            LOOP WHILE RESULT >= zCURSOR_SET AND nContinue > 0
//:               SET CURSOR FIRST mMasLC2.M_MarketingUsage  WHERE mMasLC2.M_MarketingUsage.ID = mMasLC.M_Usage.ID
//:               IF RESULT >= zCURSOR_SET
//:                  DELETE ENTITY mMasLC2.M_MarketingUsageOrdering NONE
//:                  nContinue = -1
//:                  RESULT = zCURSOR_UNCHANGED
//:               END
//:               IF nContinue > 0
//:                  SET CURSOR NEXT mMasLC2.M_MarketingStatement
//:               END
//:            END
//:            IF nContinue > 0
//:               SET CURSOR NEXT mMasLC2.M_MarketingSection
//:            END
//:         END
//:         DELETE ENTITY mMasLC.M_Usage NONE
//:      END
//:   END
//:*/

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
ConfirmDeleteUsageEntry( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   String   szTempString_0 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Delete all selected Usage entries.
   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_Usage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_Usage", "wSelected", "Y" ) == 0 )
      { 
         //:// Delete any Usage entries that have been tied to a Marketing Statement.
         //:FOR EACH mMasLC.M_MarketingStatement WITHIN mMasLC.MasterLabelContent
         RESULT = SetCursorFirstEntity( mMasLC, "M_MarketingStatement", "MasterLabelContent" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST mMasLC.M_MarketingUsage WITHIN mMasLC.M_MarketingStatement
            //:           WHERE mMasLC.M_MarketingUsage.ID = mMasLC.M_Usage.ID
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                         GetIntegerFromAttribute( mi_lTempInteger_0, mMasLC, "M_Usage", "ID" );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_MarketingUsage", "ID", lTempInteger_0, "M_MarketingStatement" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:DELETE ENTITY mMasLC.M_MarketingUsageOrdering
               RESULT = DeleteEntity( mMasLC, "M_MarketingUsageOrdering", zPOS_NEXT );
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_MarketingStatement", "MasterLabelContent" );
            //:END
         } 

         //:END

         //:// Delete any Usage entries that have been tied to a Directions For Use Statement or that
         //:// drive a Directions For Use Section.
         //:FOR EACH mMasLC.M_DirectionsForUseSection
         RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsForUseSection", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:FOR EACH mMasLC.M_DirectionsForUseStatement
            RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsForUseStatement", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:SET CURSOR FIRST mMasLC.M_DirectionsUsage WITHIN mMasLC.M_DirectionsForUseStatement
               //:           WHERE mMasLC.M_DirectionsUsage.ID = mMasLC.M_Usage.ID
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, mMasLC, "M_Usage", "ID" );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_DirectionsUsage", "ID", lTempInteger_1, "M_DirectionsForUseStatement" );
               //:IF RESULT >= zCURSOR_SET
               if ( RESULT >= zCURSOR_SET )
               { 
                  //:DELETE ENTITY mMasLC.M_DirectionsUsageOrdering
                  RESULT = DeleteEntity( mMasLC, "M_DirectionsUsageOrdering", zPOS_NEXT );
               } 

               RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsForUseStatement", "" );
               //:END
            } 

            //:END
            //:SET CURSOR FIRST mMasLC.M_ClaimsDrivingUsage WHERE mMasLC.M_ClaimsDrivingUsage.ID = mMasLC.M_Usage.ID
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                         GetIntegerFromAttribute( mi_lTempInteger_2, mMasLC, "M_Usage", "ID" );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_ClaimsDrivingUsage", "ID", lTempInteger_2, "" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:EXCLUDE mMasLC.M_ClaimsDrivingUsage
               RESULT = ExcludeEntity( mMasLC, "M_ClaimsDrivingUsage", zREPOS_AFTER );
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsForUseSection", "" );
            //:END
         } 

         //:END

         //:// Delete the actual Usage entry.

         //:// We don't believe this should be necessary, but JOE is being extremely picky ... DKS 2016.01.23
         //:SET CURSOR FIRST mMasLC.M_UsageNonGroupUsage WHERE mMasLC.M_UsageNonGroupUsage.Name = mMasLC.M_Usage.Name 
         {StringBuilder sb_szTempString_0;
         if ( szTempString_0 == null )
            sb_szTempString_0 = new StringBuilder( 32 );
         else
            sb_szTempString_0 = new StringBuilder( szTempString_0 );
                   GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_Usage", "Name" );
         szTempString_0 = sb_szTempString_0.toString( );}
         RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageNonGroupUsage", "Name", szTempString_0, "" );
         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:EXCLUDE mMasLC.M_UsageNonGroupUsage NONE
            RESULT = ExcludeEntity( mMasLC, "M_UsageNonGroupUsage", zREPOS_NONE );
            //:ELSE
         } 
         else
         { 
            //:SET CURSOR FIRST mMasLC.M_UsageGroupUsage WITHIN mMasLC.M_UsageType 
            //:           WHERE mMasLC.M_UsageGroupUsage.Name = mMasLC.M_Usage.Name 
            {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_Usage", "Name" );
            szTempString_0 = sb_szTempString_0.toString( );}
            RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageGroupUsage", "Name", szTempString_0, "M_UsageType" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:EXCLUDE mMasLC.M_UsageGroupUsage NONE
               RESULT = ExcludeEntity( mMasLC, "M_UsageGroupUsage", zREPOS_NONE );
            } 

            //:END
         } 

         //:END
         //:// We don't believe the above should be necessary, but JOE is being extremely picky ... DKS 2016.01.23

         //:DELETE ENTITY mMasLC.M_Usage NONE
         RESULT = DeleteEntity( mMasLC, "M_Usage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelDeleteUsageEntry( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
CancelDeleteUsageEntry( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Cancel delete and clear selected entries.
   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_Usage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_Usage", "wSelected", "Y" ) == 0 )
      { 
         //:mMasLC.M_Usage.wSelected = ""
         SetAttributeFromString( mMasLC, "M_Usage", "wSelected", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DeleteSelectedUsageEntries( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
DeleteSelectedUsageEntries( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   String   szTempString_0 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_Usage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_Usage", "wSelected", "Y" ) == 0 )
      { 
         //:SET CURSOR FIRST mMasLC.M_UsageNonGroupUsage WHERE mMasLC.M_UsageNonGroupUsage.Name = mMasLC.M_Usage.Name
         {StringBuilder sb_szTempString_0;
         if ( szTempString_0 == null )
            sb_szTempString_0 = new StringBuilder( 32 );
         else
            sb_szTempString_0 = new StringBuilder( szTempString_0 );
                   GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_Usage", "Name" );
         szTempString_0 = sb_szTempString_0.toString( );}
         RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageNonGroupUsage", "Name", szTempString_0, "" );
         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:EXCLUDE mMasLC.M_UsageNonGroupUsage NONE
            RESULT = ExcludeEntity( mMasLC, "M_UsageNonGroupUsage", zREPOS_NONE );
            //:ELSE
         } 
         else
         { 
            //:SET CURSOR FIRST mMasLC.M_UsageGroupUsage WITHIN mMasLC.M_UsageType
            //:           WHERE mMasLC.M_UsageGroupUsage.Name = mMasLC.M_Usage.Name
            {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_Usage", "Name" );
            szTempString_0 = sb_szTempString_0.toString( );}
            RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageGroupUsage", "Name", szTempString_0, "M_UsageType" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:EXCLUDE mMasLC.M_UsageGroupUsage NONE
               RESULT = ExcludeEntity( mMasLC, "M_UsageGroupUsage", zREPOS_NONE );
            } 

            //:END
         } 

         //:END
         //:DELETE ENTITY  mMasLC.M_Usage NONE
         RESULT = DeleteEntity( mMasLC, "M_Usage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
      //:END
   } 

   //:END

   //:// Go to build the NonGroup Usage entries.
   //:BuildNonGroupEntries( mMasLC )
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLC );
    m_mMasLC_Object.omMasLC_BuildNonGroupEntries( mMasLC );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:InitHumanHazardSect( VIEW ViewToWindow )

//:   VIEW wWebXfer REGISTERED AS wWebXfer
public int 
InitHumanHazardSect( View     ViewToWindow )
{
   zVIEW    wWebXfer = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC   REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// AcceptCurrentTemporalSubobject( ViewToWindow, TRUE, "InitHumanHazardSect: " )

   //:IF mMasLC.M_HumanHazardSection DOES NOT EXIST
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_HumanHazardSection" );
   if ( lTempInteger_0 != 0 )
   { 
      //:CREATE ENTITY mMasLC.M_HumanHazardSection
      RESULT = CreateEntity( mMasLC, "M_HumanHazardSection", zPOS_AFTER );
      //:mMasLC.M_HumanHazardSection.PrecautionaryStatement = "See {{Precautionary Panel Location}} Panel {{Precautionary Label Location}} for Precautionary Statements"
      SetAttributeFromString( mMasLC, "M_HumanHazardSection", "PrecautionaryStatement", "See {{Precautionary Panel Location}} Panel {{Precautionary Label Location}} for Precautionary Statements" );
      //:mMasLC.M_HumanHazardSection.PanelLoc1 = "[Back]"
      SetAttributeFromString( mMasLC, "M_HumanHazardSection", "PanelLoc1", "[Back]" );
      //:mMasLC.M_HumanHazardSection.PanelLoc2 = "[Side]"
      SetAttributeFromString( mMasLC, "M_HumanHazardSection", "PanelLoc2", "[Side]" );
      //:mMasLC.M_HumanHazardSection.PanelLoc3 = "[Left]"
      SetAttributeFromString( mMasLC, "M_HumanHazardSection", "PanelLoc3", "[Left]" );
      //:mMasLC.M_HumanHazardSection.PanelLoc4 = "[Right]"
      SetAttributeFromString( mMasLC, "M_HumanHazardSection", "PanelLoc4", "[Right]" );
      //:mMasLC.M_HumanHazardSection.LabelLoc1 = "[of Panel]"
      SetAttributeFromString( mMasLC, "M_HumanHazardSection", "LabelLoc1", "[of Panel]" );
      //:mMasLC.M_HumanHazardSection.LabelLoc2 = "[below]"
      SetAttributeFromString( mMasLC, "M_HumanHazardSection", "LabelLoc2", "[below]" );
   } 

   //:END

   //:wWebXfer.Root.CurrentContentType = "H"  // Hazard
   SetAttributeFromString( wWebXfer, "Root", "CurrentContentType", "H" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ConfirmDeleteMasterLabelContent( VIEW ViewToWindow )

//:   VIEW mMasProd REGISTERED AS mMasProd
public int 
ConfirmDeleteMasterLabelContent( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC   BASED ON LOD  mMasLC
   zVIEW    mMasLC = new zVIEW( );
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );

   //:ACTIVATE mMasLC WHERE mMasLC.MasterLabelContent.ID = mMasProd.MasterLabelContent.ID
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, mMasProd, "MasterLabelContent", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_8( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( mMasLC, "mMasLC", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mMasLC "mMasLCDelete"
   SetNameForView( mMasLC, "mMasLCDelete", null, zLEVEL_TASK );
   //:DELETE ENTITY mMasLC.MasterLabelContent
   RESULT = DeleteEntity( mMasLC, "MasterLabelContent", zPOS_NEXT );
   //:COMMIT  mMasLC
   RESULT = CommitObjectInstance( mMasLC );
   //:DropObjectInstance( mMasLC )
   DropObjectInstance( mMasLC );
   //:EXCLUDE mMasProd.MasterLabelContent NONE
   RESULT = ExcludeEntity( mMasProd, "MasterLabelContent", zREPOS_NONE );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_StorageDispSectionUpdate( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_StorageDispSectionUpdate( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Create Temporal subobject version.
   //:CreateTemporalSubobjectVersion( mMasLC, "M_StorageDisposalSection" )
   CreateTemporalSubobjectVersion( mMasLC, "M_StorageDisposalSection" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ConfirmDeleteMasterProduct( VIEW ViewToWindow )

//:   VIEW mMasProdLST REGISTERED AS mMasProdLST
public int 
ConfirmDeleteMasterProduct( View     ViewToWindow )
{
   zVIEW    mMasProdLST = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasProd    REGISTERED AS mMasProd
   zVIEW    mMasProd = new zVIEW( );
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasProdLST, "mMasProdLST", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );

   //:IF mMasProd.SubregProduct EXISTS
   lTempInteger_0 = CheckExistenceOfEntity( mMasProd, "SubregProduct" );
   if ( lTempInteger_0 == 0 )
   { 

      //:MessageSend( ViewToWindow, "", "Delete Master Product",
      //:             "The Master Product has associated Subregistrant Products.  It cannot be deleted",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Delete Master Product", "The Master Product has associated Subregistrant Products.  It cannot be deleted", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:DELETE ENTITY mMasProd.MasterProduct
   RESULT = DeleteEntity( mMasProd, "MasterProduct", zPOS_NEXT );
   //:COMMIT mMasProd
   RESULT = CommitObjectInstance( mMasProd );
   //:DropObjectInstance( mMasProd )
   DropObjectInstance( mMasProd );

   //:InitListMasterProducts( ViewToWindow )
   InitListMasterProducts( ViewToWindow );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelDeleteMasterProduct( VIEW ViewToWindow )

//:   VIEW mMasProd REGISTERED AS mMasProd
public int 
CancelDeleteMasterProduct( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );

   //:DropObjectInstance( mMasProd )
   DropObjectInstance( mMasProd );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_UpdateMLC( VIEW ViewToWindow )

//:   VIEW mMasProd REGISTERED AS mMasProd
public int 
GOTO_UpdateMLC( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC   BASED ON LOD  mMasLC
   zVIEW    mMasLC = new zVIEW( );
   //:VIEW mMasLC_Root BASED ON LOD mMasLC
   zVIEW    mMasLC_Root = new zVIEW( );
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );
   int      lTempInteger_1 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_2 = 0;

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );

   //:GET VIEW mMasLC NAMED "mMasLC"
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   //:IF mMasLC != 0
   if ( getView( mMasLC ) != null )
   { 
      //:DropObjectInstance( mMasLC )
      DropObjectInstance( mMasLC );
   } 

   //:END

   //:ACTIVATE mMasLC WHERE mMasLC.MasterLabelContent.ID = mMasProd.MasterLabelContent.ID
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, mMasProd, "MasterLabelContent", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_4( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( mMasLC, "mMasLC", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mMasLC "mMasLC"
   SetNameForView( mMasLC, "mMasLC", null, zLEVEL_TASK );
   //:OrderEntityForView( mMasLC, "M_Usage", "UsageType A ClaimsClassification A Name A" )
   OrderEntityForView( mMasLC, "M_Usage", "UsageType A ClaimsClassification A Name A" );
   //:SET CURSOR FIRST mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );

   //:// Create NetContent section if it doesn't already exist.
   //:IF mMasLC.NetContents DOES NOT EXIST
   lTempInteger_1 = CheckExistenceOfEntity( mMasLC, "NetContents" );
   if ( lTempInteger_1 != 0 )
   { 
      //:CREATE ENTITY mMasLC.NetContents
      RESULT = CreateEntity( mMasLC, "NetContents", zPOS_AFTER );
   } 

   //:END
   //:// Create/Include Hazard, Precautionary and First Aid derived sections.

   //:// First Aid
   //:SET CURSOR FIRST mMasLC.M_GeneralSection WHERE mMasLC.M_GeneralSection.SectionType = "F"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_GeneralSection", "SectionType", "F", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mMasLC.M_GeneralSection
      RESULT = CreateEntity( mMasLC, "M_GeneralSection", zPOS_AFTER );
      //:mMasLC.M_GeneralSection.SectionType = "F" // First Aid
      SetAttributeFromString( mMasLC, "M_GeneralSection", "SectionType", "F" );
      //:mMasLC.M_GeneralSection.Title = "FIRST AID"
      SetAttributeFromString( mMasLC, "M_GeneralSection", "Title", "FIRST AID" );
   } 

   //:END
   //:INCLUDE mMasLC.MI_FirstAidSection FROM mMasLC.M_GeneralSection
   RESULT = IncludeSubobjectFromSubobject( mMasLC, "MI_FirstAidSection", mMasLC, "M_GeneralSection", zPOS_AFTER );

   //:// Precautionary
   //:SET CURSOR FIRST mMasLC.M_GeneralSection WHERE mMasLC.M_GeneralSection.SectionType = "P"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_GeneralSection", "SectionType", "P", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mMasLC.M_GeneralSection
      RESULT = CreateEntity( mMasLC, "M_GeneralSection", zPOS_AFTER );
      //:mMasLC.M_GeneralSection.SectionType = "P" // Precautionary
      SetAttributeFromString( mMasLC, "M_GeneralSection", "SectionType", "P" );
   } 

   //:END
   //:INCLUDE mMasLC.MI_PrecautionarySection FROM mMasLC.M_GeneralSection
   RESULT = IncludeSubobjectFromSubobject( mMasLC, "MI_PrecautionarySection", mMasLC, "M_GeneralSection", zPOS_AFTER );

   //:// Hazard
   //:SET CURSOR FIRST mMasLC.M_GeneralSection WHERE mMasLC.M_GeneralSection.SectionType = "E"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_GeneralSection", "SectionType", "E", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mMasLC.M_GeneralSection
      RESULT = CreateEntity( mMasLC, "M_GeneralSection", zPOS_AFTER );
      //:mMasLC.M_GeneralSection.SectionType = "E" // Environmental/Physical Hazard
      SetAttributeFromString( mMasLC, "M_GeneralSection", "SectionType", "E" );
   } 

   //:END
   //:INCLUDE mMasLC.MI_HazardSection FROM mMasLC.M_GeneralSection
   RESULT = IncludeSubobjectFromSubobject( mMasLC, "MI_HazardSection", mMasLC, "M_GeneralSection", zPOS_AFTER );

   //:// Convert any original Usage entries to the new UsageType subobject.
   //:FOR EACH mMasLC.OrigM_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "OrigM_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST mMasLC.M_UsageType WHERE mMasLC.M_UsageType.UsageType = mMasLC.OrigM_Usage.UsageType
      {StringBuilder sb_szTempString_0;
      if ( szTempString_0 == null )
         sb_szTempString_0 = new StringBuilder( 32 );
      else
         sb_szTempString_0 = new StringBuilder( szTempString_0 );
             GetStringFromAttribute( sb_szTempString_0, mMasLC, "OrigM_Usage", "UsageType" );
      szTempString_0 = sb_szTempString_0.toString( );}
      RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageType", "UsageType", szTempString_0, "" );
      //:IF RESULT < zCURSOR_SET
      if ( RESULT < zCURSOR_SET )
      { 
         //:CREATE ENTITY mMasLC.M_UsageType
         RESULT = CreateEntity( mMasLC, "M_UsageType", zPOS_AFTER );
         //:mMasLC.M_UsageType.UsageType = mMasLC.OrigM_Usage.UsageType
         SetAttributeFromAttribute( mMasLC, "M_UsageType", "UsageType", mMasLC, "OrigM_Usage", "UsageType" );
      } 

      //:END
      //:CREATE ENTITY mMasLC.M_Usage
      RESULT = CreateEntity( mMasLC, "M_Usage", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_Usage", mMasLC, "OrigM_Usage", zSET_NULL )
      SetMatchingAttributesByName( mMasLC, "M_Usage", mMasLC, "OrigM_Usage", zSET_NULL );
      //:DELETE ENTITY mMasLC.OrigM_Usage NONE
      RESULT = DeleteEntity( mMasLC, "OrigM_Usage", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mMasLC, "OrigM_Usage", "" );
   } 

   //:END

   //:// Delete any M_DirectionsUsageOrdering entities without children.
   //:FOR EACH mMasLC.M_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:FOR EACH mMasLC.M_DirectionsForUseStatement
      RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsForUseStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:FOR EACH mMasLC.M_DirectionsUsageOrdering
         RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF mMasLC.M_DirectionsUsage DOES NOT EXIST
            lTempInteger_2 = CheckExistenceOfEntity( mMasLC, "M_DirectionsUsage" );
            if ( lTempInteger_2 != 0 )
            { 
               //:DELETE ENTITY mMasLC.M_DirectionsUsageOrdering NONE
               RESULT = DeleteEntity( mMasLC, "M_DirectionsUsageOrdering", zREPOS_NONE );
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsForUseStatement", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// Make sure Usage Entries are sorted.
   //:FOR EACH mMasLC.M_UsageType
   RESULT = SetCursorFirstEntity( mMasLC, "M_UsageType", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:OrderEntityForView( mMasLC, "M_Usage", "ClaimsClassification A Name A" )
      OrderEntityForView( mMasLC, "M_Usage", "ClaimsClassification A Name A" );
      RESULT = SetCursorNextEntity( mMasLC, "M_UsageType", "" );
   } 

   //:END
   //:SET CURSOR FIRST mMasLC.M_UsageType
   RESULT = SetCursorFirstEntity( mMasLC, "M_UsageType", "" );

   //:CreateViewFromView( mMasLC_Root, mMasLC )
   CreateViewFromView( mMasLC_Root, mMasLC );
   //:NAME VIEW mMasLC_Root "mMasLC_Root"
   SetNameForView( mMasLC_Root, "mMasLC_Root", null, zLEVEL_TASK );

   //:// Build Usage Group Usage entries.
   //:BuildUsageGroupEntries( mMasLC )
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLC );
    m_mMasLC_Object.omMasLC_BuildUsageGroupEntries( mMasLC );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:NEW_MLC( VIEW ViewToWindow )

//:   VIEW mMasProd REGISTERED AS mMasProd
public int 
NEW_MLC( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC   BASED ON LOD  mMasLC
   zVIEW    mMasLC = new zVIEW( );
   //:VIEW mMasLC_Root BASED ON LOD mMasLC
   zVIEW    mMasLC_Root = new zVIEW( );

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );

   //:ACTIVATE mMasLC EMPTY
   RESULT = ActivateEmptyObjectInstance( mMasLC, "mMasLC", ViewToWindow, zSINGLE );
   //:NAME VIEW mMasLC "mMasLC"
   SetNameForView( mMasLC, "mMasLC", null, zLEVEL_TASK );
   //:CREATE ENTITY mMasLC.MasterLabelContent
   RESULT = CreateEntity( mMasLC, "MasterLabelContent", zPOS_AFTER );
   //:INCLUDE mMasLC.MasterProduct FROM mMasProd.MasterProduct
   RESULT = IncludeSubobjectFromSubobject( mMasLC, "MasterProduct", mMasProd, "MasterProduct", zPOS_AFTER );

   //:CreateViewFromView( mMasLC_Root, mMasLC )
   CreateViewFromView( mMasLC_Root, mMasLC );
   //:NAME VIEW mMasLC_Root "mMasLC_Root"
   SetNameForView( mMasLC_Root, "mMasLC_Root", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GenerateNewMLC_Version( VIEW ViewToWindow )

//:   VIEW mMasProd    REGISTERED AS mMasProd
public int 
GenerateNewMLC_Version( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW OriginalMLC BASED ON LOD  mMasLC
   zVIEW    OriginalMLC = new zVIEW( );
   //:VIEW NewMLC      BASED ON LOD  mMasLC
   zVIEW    NewMLC = new zVIEW( );
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );

   //:// Generate new MLC from the selected MLC.
   //:ACTIVATE OriginalMLC WHERE OriginalMLC.MasterLabelContent.ID = mMasProd.MasterLabelContent.ID
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, mMasProd, "MasterLabelContent", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_5( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( OriginalMLC, "mMasLC", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW OriginalMLC "OriginalMLC"
   SetNameForView( OriginalMLC, "OriginalMLC", null, zLEVEL_TASK );

   //:ACTIVATE NewMLC EMPTY
   RESULT = ActivateEmptyObjectInstance( NewMLC, "mMasLC", ViewToWindow, zSINGLE );
   //:NAME VIEW NewMLC "mMasLC"
   SetNameForView( NewMLC, "mMasLC", null, zLEVEL_TASK );

   //:BuildNewMLC_Version( NewMLC, OriginalMLC )    // Create NewMLC from OriginalMLC
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( NewMLC );
    m_mMasLC_Object.omMasLC_BuildNewMLC_Version( NewMLC, OriginalMLC );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
   //:NewMLC.MasterLabelContent.Finalized = "W"
   SetAttributeFromString( NewMLC, "MasterLabelContent", "Finalized", "W" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CompareToPreviousMLC( VIEW ViewToWindow )

//:   VIEW mMasProd    REGISTERED AS mMasProd
public int 
CompareToPreviousMLC( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW lMLCATgt    BASED ON LOD  lMLCATgt
   zVIEW    lMLCATgt = new zVIEW( );
   //:VIEW lMLCASrc    BASED ON LOD  lMLCASrc
   zVIEW    lMLCASrc = new zVIEW( );
   //:INTEGER lID
   int      lID = 0;
   //:SHORT   nRC
   int      nRC = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   zVIEW    vTempViewVar_1 = new zVIEW( );

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );

   //:lID = mMasProd.MasterLabelContent.ID
   {MutableInt mi_lID = new MutableInt( lID );
       GetIntegerFromAttribute( mi_lID, mMasProd, "MasterLabelContent", "ID" );
   lID = mi_lID.intValue( );}
   //:ACTIVATE lMLCATgt WHERE lMLCATgt.MasterLabelContent.ID = lID
   o_fnLocalBuildQual_6( ViewToWindow, vTempViewVar_0, lID );
   RESULT = ActivateObjectInstance( lMLCATgt, "lMLCATgt", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW lMLCATgt "lMLCATgt"
   SetNameForView( lMLCATgt, "lMLCATgt", null, zLEVEL_TASK );

   //:IF lMLCATgt.MP_MasterLabelContent DOES NOT EXIST
   lTempInteger_0 = CheckExistenceOfEntity( lMLCATgt, "MP_MasterLabelContent" );
   if ( lTempInteger_0 != 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Compare MLC's",
      //:             "The selected MLC is not a source MLC.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Compare MLC's", "The selected MLC is not a source MLC.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:DropObjectInstance( lMLCATgt )
      DropObjectInstance( lMLCATgt );
      //:nRC = 2
      nRC = 2;
      //:ELSE
   } 
   else
   { 
      //:ACTIVATE lMLCASrc WHERE lMLCASrc.MasterLabelContent.ID = lMLCATgt.MP_MasterLabelContent.ID
      {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
             GetIntegerFromAttribute( mi_lTempInteger_1, lMLCATgt, "MP_MasterLabelContent", "ID" );
      lTempInteger_1 = mi_lTempInteger_1.intValue( );}
      o_fnLocalBuildQual_7( ViewToWindow, vTempViewVar_1, lTempInteger_1 );
      RESULT = ActivateObjectInstance( lMLCASrc, "lMLCASrc", ViewToWindow, vTempViewVar_1, zSINGLE );
      DropView( vTempViewVar_1 );
      //:NAME VIEW lMLCASrc "lMLCASrc"
      SetNameForView( lMLCASrc, "lMLCASrc", null, zLEVEL_TASK );
      //:BuildDifferencesMLC( lMLCATgt, lMLCASrc )
      {
       lMLCATgt_Object m_lMLCATgt_Object = new lMLCATgt_Object( lMLCATgt );
       m_lMLCATgt_Object.olMLCATgt_BuildDifferencesMLC( lMLCATgt, lMLCASrc );
       // m_lMLCATgt_Object = null;  // permit gc  (unnecessary)
      }
      //:DropObjectInstance( lMLCASrc )
      DropObjectInstance( lMLCASrc );
      //:nRC = 0
      nRC = 0;
   } 

   //:END

   //:RETURN nRC
   return( nRC );
// END
} 


//:DIALOG OPERATION
//:CANCEL_MasterProduct( VIEW ViewToWindow )

//:   VIEW mMasProd REGISTERED AS mMasProd
public int 
CANCEL_MasterProduct( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );

   //:TraceLineS( "$$$$$ Before Drop", "" )
   TraceLineS( "$$$$$ Before Drop", "" );
   //:DropObjectInstance( mMasProd )
   DropObjectInstance( mMasProd );
   //:TraceLineS( "$$$$$ After Drop", "" )
   TraceLineS( "$$$$$ After Drop", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SAVE_MasterProduct( VIEW ViewToWindow )

//:   VIEW wWebXfer  REGISTERED AS wWebXfer
public int 
SAVE_MasterProduct( View     ViewToWindow )
{
   zVIEW    wWebXfer = new zVIEW( );
   int      RESULT = 0;
   //:VIEW lPrimReg  REGISTERED AS lPrimReg
   zVIEW    lPrimReg = new zVIEW( );
   //:VIEW mMasProd  REGISTERED AS mMasProd
   zVIEW    mMasProd = new zVIEW( );
   //:STRING ( 50 ) szProductName
   String   szProductName = null;
   //:STRING ( 50 ) szProductNumber
   String   szProductNumber = null;
   //:STRING ( 50 ) szVersion
   String   szVersion = null;
   //:INTEGER lProductNameLth
   int      lProductNameLth = 0;
   //:INTEGER lProductNumberLth
   int      lProductNumberLth = 0;
   //:INTEGER lVersionLth
   int      lVersionLth = 0;
   //:INTEGER lControl
   int      lControl = 0;
   //:INTEGER Ignore
   int      Ignore = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( lPrimReg, "lPrimReg", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );

   //:IF mMasProd = 0
   if ( getView( mMasProd ) == null )
   { 
      //:MessageSend( ViewToWindow, "", "Update Master Product",
      //:             "The Master Product view is empty.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Update Master Product", "The Master Product view is empty.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:szProductName = mMasProd.MasterProduct.Name
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szProductName;
   if ( szProductName == null )
      sb_szProductName = new StringBuilder( 32 );
   else
      sb_szProductName = new StringBuilder( szProductName );
       GetVariableFromAttribute( sb_szProductName, mi_lTempInteger_0, 'S', 51, mMasProd, "MasterProduct", "Name", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szProductName = sb_szProductName.toString( );}

   //:// Ensure product name is not blank and is unique.
   //:IF szProductName = ""
   if ( ZeidonStringCompare( szProductName, 1, 0, "", 1, 0, 51 ) == 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Update Master Product",
      //:             "The Master Product Name cannot be blank.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Update Master Product", "The Master Product Name cannot be blank.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
      //:ELSE
   } 
   else
   { 
      //:SET CURSOR FIRST lPrimReg.MasterProduct WHERE lPrimReg.MasterProduct.Name = szProductName
      //:                                          AND lPrimReg.MasterProduct.ID  != mMasProd.MasterProduct.ID
      RESULT = SetCursorFirstEntity( lPrimReg, "MasterProduct", "" );
      if ( RESULT > zCURSOR_UNCHANGED )
      { 
         while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToString( lPrimReg, "MasterProduct", "Name", szProductName ) != 0 || CompareAttributeToAttribute( lPrimReg, "MasterProduct", "ID", mMasProd, "MasterProduct", "ID" ) == 0 ) )
         { 
            RESULT = SetCursorNextEntity( lPrimReg, "MasterProduct", "" );
         } 

      } 

      //:IF RESULT >= zCURSOR_SET
      if ( RESULT >= zCURSOR_SET )
      { 
         //:MessageSend( ViewToWindow, "", "New Master Product",
         //:             "The Master Product Name must be unique.",
         //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
         MessageSend( ViewToWindow, "", "New Master Product", "The Master Product Name must be unique.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
         //:RETURN 2
         if(8==8)return( 2 );
      } 

      //:END
   } 

   //:END

   //:IF mMasProd.PrimaryRegistrant DOES NOT EXIST
   lTempInteger_1 = CheckExistenceOfEntity( mMasProd, "PrimaryRegistrant" );
   if ( lTempInteger_1 != 0 )
   { 
      //:IncludeSubobjectFromSubobject( mMasProd, "PrimaryRegistrant",
      //:                               lPrimReg, "PrimaryRegistrant", zPOS_BEFORE )
      IncludeSubobjectFromSubobject( mMasProd, "PrimaryRegistrant", lPrimReg, "PrimaryRegistrant", zPOS_BEFORE );
   } 

   //:END

   //:COMMIT mMasProd
   RESULT = CommitObjectInstance( mMasProd );

   //:// Make sure product list is updated.
   //:InitListMasterProducts( ViewToWindow )
   InitListMasterProducts( ViewToWindow );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_UpdateMasterProduct( VIEW ViewToWindow )

//:   VIEW wWebXfer REGISTERED AS wWebXfer
public int 
GOTO_UpdateMasterProduct( View     ViewToWindow )
{
   zVIEW    wWebXfer = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasProdLST REGISTERED AS mMasProdLST
   zVIEW    mMasProdLST = new zVIEW( );
   //:VIEW mMasProd    BASED ON LOD  mMasProd
   zVIEW    mMasProd = new zVIEW( );
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasProdLST, "mMasProdLST", ViewToWindow, zLEVEL_TASK );

   //:ACTIVATE mMasProd WHERE mMasProd.MasterProduct.ID = mMasProdLST.MasterProduct.ID
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, mMasProdLST, "MasterProduct", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_2( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( mMasProd, "mMasProd", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mMasProd "mMasProd"
   SetNameForView( mMasProd, "mMasProd", null, zLEVEL_TASK );

   //:wWebXfer.Root.AttemptProductName = mMasProd.MasterProduct.Name
   SetAttributeFromAttribute( wWebXfer, "Root", "AttemptProductName", mMasProd, "MasterProduct", "Name" );
   //:wWebXfer.Root.AttemptProductNumber = mMasProd.MasterProduct.Number
   SetAttributeFromAttribute( wWebXfer, "Root", "AttemptProductNumber", mMasProd, "MasterProduct", "Number" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:NEW_MasterProduct( VIEW ViewToWindow )

//:   VIEW wWebXfer REGISTERED AS wWebXfer
public int 
NEW_MasterProduct( View     ViewToWindow )
{
   zVIEW    wWebXfer = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasProd BASED ON LOD  mMasProd
   zVIEW    mMasProd = new zVIEW( );

   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );

   //:GET VIEW mMasProd NAMED "mMasProd"
   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );
   //:IF mMasProd != 0
   if ( getView( mMasProd ) != null )
   { 
      //:DropObjectInstance( mMasProd )
      DropObjectInstance( mMasProd );
   } 

   //:END

   //:// Initialize empty Product object.
   //:ACTIVATE mMasProd EMPTY
   RESULT = ActivateEmptyObjectInstance( mMasProd, "mMasProd", ViewToWindow, zSINGLE );
   //:NAME VIEW mMasProd "mMasProd"
   SetNameForView( mMasProd, "mMasProd", null, zLEVEL_TASK );
   //:CREATE ENTITY mMasProd.MasterProduct
   RESULT = CreateEntity( mMasProd, "MasterProduct", zPOS_AFTER );

   //:SetDynamicBannerName( ViewToWindow, "wMLC", "PrimaryRegistrantProduct" )
   {
    ZGlobalV_Operation m_ZGlobalV_Operation = new ZGlobalV_Operation( ViewToWindow );
    m_ZGlobalV_Operation.SetDynamicBannerName( ViewToWindow, "wMLC", "PrimaryRegistrantProduct" );
    // m_ZGlobalV_Operation = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:InitListMasterProducts( VIEW ViewToWindow )

//:   VIEW lPrimReg    REGISTERED AS lPrimReg
public int 
InitListMasterProducts( View     ViewToWindow )
{
   zVIEW    lPrimReg = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasProdLST BASED ON LOD mMasProd
   zVIEW    mMasProdLST = new zVIEW( );
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( lPrimReg, "lPrimReg", ViewToWindow, zLEVEL_TASK );

   //:GET VIEW mMasProdLST NAMED "mMasProdLST"
   RESULT = GetViewByName( mMasProdLST, "mMasProdLST", ViewToWindow, zLEVEL_TASK );
   //:IF RESULT >= 0
   if ( RESULT >= 0 )
   { 
      //:DropObjectInstance( mMasProdLST )
      DropObjectInstance( mMasProdLST );
   } 

   //:END
   //:ACTIVATE mMasProdLST RootOnlyMultiple WHERE mMasProdLST.PrimaryRegistrant.ID = lPrimReg.PrimaryRegistrant.ID
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, lPrimReg, "PrimaryRegistrant", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_3( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( mMasProdLST, "mMasProd", ViewToWindow, vTempViewVar_0, zACTIVATE_ROOTONLY_MULTIPLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mMasProdLST "mMasProdLST"
   SetNameForView( mMasProdLST, "mMasProdLST", null, zLEVEL_TASK );
   //:OrderEntityForView( mMasProdLST, "MasterProduct", "Name A" )
   OrderEntityForView( mMasProdLST, "MasterProduct", "Name A" );
   //:SET CURSOR FIRST mMasProdLST.MasterProduct
   RESULT = SetCursorFirstEntity( mMasProdLST, "MasterProduct", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelDeleteComponent( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
CancelDeleteComponent( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType = ""
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "" );
   //:mMasLC.MasterLabelContent.wDeleteText = ""
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteText", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ConfirmDeleteComponent( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
ConfirmDeleteComponent( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:STRING ( 32 ) szEntityName
   String   szEntityName = null;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// The entity to delete is passed in the wDeleteEntityName attribute.
   //:szEntityName = mMasLC.MasterLabelContent.wDeleteEntityName
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szEntityName;
   if ( szEntityName == null )
      sb_szEntityName = new StringBuilder( 32 );
   else
      sb_szEntityName = new StringBuilder( szEntityName );
       GetVariableFromAttribute( sb_szEntityName, mi_lTempInteger_0, 'S', 33, mMasLC, "MasterLabelContent", "wDeleteEntityName", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szEntityName = sb_szEntityName.toString( );}
   //:DeleteEntity( mMasLC, szEntityName, zREPOS_NONE )
   DeleteEntity( mMasLC, szEntityName, zREPOS_NONE );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAddNewStorDispStmt( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptAddNewStorDispStmt( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_StorageDisposalStatement" )
   nRC = AcceptSubobject( mMasLC, "M_StorageDisposalStatement" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Save And Add New Storage and Disposal statement",
      //:             "The Storage and Disposal Statement contains errors.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Save And Add New Storage and Disposal statement", "The Storage and Disposal Statement contains errors.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN nRC
      if(8==8)return( nRC );
   } 

   //:END
   //:CreateTemporalEntity( mMasLC, "M_StorageDisposalStatement", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_StorageDisposalStatement", zPOS_AFTER );
   //:mMasLC.M_StorageDisposalStatement.NotForUseType = "NA"
   SetAttributeFromString( mMasLC, "M_StorageDisposalStatement", "NotForUseType", "NA" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAddNewStorDispSect( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptAddNewStorDispSect( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_StorageDisposalSection" )
   nRC = AcceptSubobject( mMasLC, "M_StorageDisposalSection" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Save And Add New Storage and Disposal Section",
      //:             "The Storage and Disposal Section contains errors.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Save And Add New Storage and Disposal Section", "The Storage and Disposal Section contains errors.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN nRC
      if(8==8)return( nRC );
   } 

   //:END
   //:CreateTemporalEntity( mMasLC, "M_StorageDisposalSection", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_StorageDisposalSection", zPOS_AFTER );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptGoNextStorDispStmt( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptGoNextStorDispStmt( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_StorageDisposalStatement" )
   nRC = AcceptSubobject( mMasLC, "M_StorageDisposalStatement" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Accept and Go Next Storage and Disposal Statement",
      //:             "The Storage and Disposal Statement contains errors.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Accept and Go Next Storage and Disposal Statement", "The Storage and Disposal Statement contains errors.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN nRC
      if(8==8)return( nRC );
   } 

   //:END
   //:SetCursorNextEntity( mMasLC, "M_StorageDisposalStatement", "" )
   SetCursorNextEntity( mMasLC, "M_StorageDisposalStatement", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_StorageDisposalStatement" )
   CreateTemporalSubobjectVersion( mMasLC, "M_StorageDisposalStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptGoPrevStorDispStmt( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptGoPrevStorDispStmt( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_StorageDisposalStatement" )
   nRC = AcceptSubobject( mMasLC, "M_StorageDisposalStatement" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Accept and Go Previous Storage and Disposal Statement",
      //:             "The Storage and Disposal Statement contains errors.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Accept and Go Previous Storage and Disposal Statement", "The Storage and Disposal Statement contains errors.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN nRC
      if(8==8)return( nRC );
   } 

   //:END
   //:SetCursorPrevEntity( mMasLC, "M_StorageDisposalStatement", "" )
   SetCursorPrevEntity( mMasLC, "M_StorageDisposalStatement", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_StorageDisposalStatement" )
   CreateTemporalSubobjectVersion( mMasLC, "M_StorageDisposalStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_StorageDispStatementDelete( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_StorageDispStatementDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Storage and Disposal Statement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Storage and Disposal Statement" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_StorageDisposalStatement.Text
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_StorageDisposalStatement", "Text" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_StorageDisposalStatement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_StorageDisposalStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CleanStorDispStmtHTML( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
CleanStorDispStmtHTML( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:RemoveFormattingFromHTML_Attr( mMasLC, "M_StorageDisposalStatement", "Text", "p,strong,sup,sub" )
   m_ZDRVROPR.RemoveFormattingFromHTML_Attr( mMasLC, "M_StorageDisposalStatement", "Text", "p,strong,sup,sub" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_StorageDispSectionDelete( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
GOTO_StorageDispSectionDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Storage and Disposal Section"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Storage and Disposal Section" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_StorageDisposalSection.Title
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_StorageDisposalSection", "Title" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_StorageDisposalSection"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_StorageDisposalSection" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_IngredientsStatementDelete( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_IngredientsStatementDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Ingredients Statement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Ingredients Statement" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_IngredientsStatement.ChemicalName
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_IngredientsStatement", "ChemicalName" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_IngredientsStatement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_IngredientsStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAddNewIngredient( VIEW ViewToWindow )

//:   VIEW  mMasLC   REGISTERED AS mMasLC
public int 
AcceptAddNewIngredient( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Accept Ingredients Statement and add new temporal one.
   //:nRC = AcceptSubobject( mMasLC, "M_IngredientsStatement" )
   nRC = AcceptSubobject( mMasLC, "M_IngredientsStatement" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Save And Add New Ingredients Statement",
      //:             "Error saving ingredient statement.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Save And Add New Ingredients Statement", "Error saving ingredient statement.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:CreateTemporalEntity( mMasLC, "M_IngredientsStatement", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_IngredientsStatement", zPOS_AFTER );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAddNewTOC( VIEW ViewToWindow )

//:   VIEW  mMasLC   REGISTERED AS mMasLC
public int 
AcceptAddNewTOC( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Accept Ingredients Statement and add new temporal one.
   //:nRC = AcceptSubobject( mMasLC, "TOC" )
   nRC = AcceptSubobject( mMasLC, "TOC" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Save And Add New Table of Contents Entry",
      //:             "Error saving table of contents entry.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Save And Add New Table of Contents Entry", "Error saving table of contents entry.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:CreateTemporalEntity( mMasLC, "TOC", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "TOC", zPOS_AFTER );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptSD_KeywordGoPrev( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptSD_KeywordGoPrev( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_InsertTextKeywordSD" )
   AcceptSubobject( mMasLC, "M_InsertTextKeywordSD" );
   //:SetCursorPrevEntity( mMasLC, "M_InsertTextKeywordSD", "" )
   SetCursorPrevEntity( mMasLC, "M_InsertTextKeywordSD", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_InsertTextKeywordSD" )
   CreateTemporalSubobjectVersion( mMasLC, "M_InsertTextKeywordSD" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptSD_KeywordGoNext( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptSD_KeywordGoNext( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_InsertTextKeywordSD" )
   AcceptSubobject( mMasLC, "M_InsertTextKeywordSD" );
   //:SetCursorNextEntity( mMasLC, "M_InsertTextKeywordSD", "" )
   SetCursorNextEntity( mMasLC, "M_InsertTextKeywordSD", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_InsertTextKeywordSD" )
   CreateTemporalSubobjectVersion( mMasLC, "M_InsertTextKeywordSD" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:InitMasterLabelContentForUpdate( VIEW ViewToWindow )

//:   VIEW wWebXfer REGISTERED AS wWebXfer
public int 
InitMasterLabelContentForUpdate( View     ViewToWindow )
{
   zVIEW    wWebXfer = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasProd REGISTERED AS mMasProd
   zVIEW    mMasProd = new zVIEW( );

   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );

   //:// wWebXfer.Root.Banner1 = qOrganiz.Organization.dLoginUserName
   //:// wWebXfer.Root.Banner2 = qOrganiz.Organization.dLoginUserRole
   //:wWebXfer.Root.Banner3 = ""
   SetAttributeFromString( wWebXfer, "Root", "Banner3", "" );
   //:wWebXfer.Root.Banner4 = mMasProd.MasterProduct.dContentVersionRevDate
   SetAttributeFromAttribute( wWebXfer, "Root", "Banner4", mMasProd, "MasterProduct", "dContentVersionRevDate" );
   //:wWebXfer.Root.Banner5 = mMasProd.MasterProduct.dDescription
   SetAttributeFromAttribute( wWebXfer, "Root", "Banner5", mMasProd, "MasterProduct", "dDescription" );
   //:wWebXfer.Root.Banner6 = ""
   SetAttributeFromString( wWebXfer, "Root", "Banner6", "" );

   //:SetDynamicBannerName( ViewToWindow, "wMLC", "PrimaryRegistrantLabel" )
   {
    ZGlobalV_Operation m_ZGlobalV_Operation = new ZGlobalV_Operation( ViewToWindow );
    m_ZGlobalV_Operation.SetDynamicBannerName( ViewToWindow, "wMLC", "PrimaryRegistrantLabel" );
    // m_ZGlobalV_Operation = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// /*
//          mMasLC.cursor( "MasterLabelContent" ).createEntity();
//          mMasLC.cursor( "MasterLabelContent" ).createTemporalSubobjectVersion();
//          mMasLC.cursor( "MasterSubLabelContent" ).setToSubobject();
//          mMasLC.cursor("MasterSubLabelContent").createTemporalEntity();
// */
// END
} 


//:DIALOG OPERATION
//:FinalizeMasterLabelContent( VIEW ViewToWindow )

//:   VIEW mMasProd REGISTERED AS mMasProd
public int 
FinalizeMasterLabelContent( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   //:// SHORT nRC

   //:// This is checked by JavaScript
   //:// nRC = OperatorWebPrompt( ViewToWindow, "Finalize Master Label Content",
   //://                          "Once the Master Label Content has been Finalized,"
   //://                            "it cannot be updated.  Are you sure you want it Finalized?" )
   //:// IF nRC = 8
   //://    RETURN 2      // Return 2 to indicate Web client must prompt operator
   //:// END

   //:IF mMasLC.MasterLabelContent.Finalized = "" OR mMasLC.MasterLabelContent.Finalized = "W"
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "Finalized", "" ) == 0 || CompareAttributeToString( mMasLC, "MasterLabelContent", "Finalized", "W" ) == 0 )
   { 
      //:FOR EACH mMasProd.MasterLabelContent
      RESULT = SetCursorFirstEntity( mMasProd, "MasterLabelContent", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mMasProd.MasterLabelContent.Finalized = "P"
         if ( CompareAttributeToString( mMasProd, "MasterLabelContent", "Finalized", "P" ) == 0 )
         { 
            //:mMasProd.MasterLabelContent.Finalized = "H"
            SetAttributeFromString( mMasProd, "MasterLabelContent", "Finalized", "H" );
         } 

         RESULT = SetCursorNextEntity( mMasProd, "MasterLabelContent", "" );
         //:END
      } 

      //:END
      //:mMasLC.MasterLabelContent.Finalized = "P"
      SetAttributeFromString( mMasLC, "MasterLabelContent", "Finalized", "P" );
      //:ELSE
   } 
   else
   { 
      //:MessageSend( ViewToWindow, "", "Finalize Master Label Content",
      //:             "Cannot change Historical Master Label Content to Production",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Finalize Master Label Content", "Cannot change Historical Master Label Content to Production", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN 2      // Return 2 to indicate Web client must prompt operator
      if(8==8)return( 2 );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SaveAndReturnMLC( VIEW ViewToWindow )

//:   VIEW mMasProd REGISTERED AS mMasProd
public int 
SaveAndReturnMLC( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC   REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   //:STRING ( 1 ) szFound
   String   szFound = null;
   //:INTEGER      MasProdID
   int      MasProdID = 0;
   //:INTEGER      lRC
   int      lRC = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Reuse Save operation and drop current MLC.
   //:lRC = SaveMLC( ViewToWindow )
   lRC = SaveMLC( ViewToWindow );
   //:IF lRC != 0
   if ( lRC != 0 )
   { 
      //:RETURN lRC
      if(8==8)return( lRC );
   } 

   //:END
   //:DropObjectInstance( mMasLC )
   DropObjectInstance( mMasLC );

   //:// Reactivate mMasProd to get updated list of MasterLabelContent entries.
   //:MasProdID = mMasProd.MasterProduct.ID
   {MutableInt mi_MasProdID = new MutableInt( MasProdID );
       GetIntegerFromAttribute( mi_MasProdID, mMasProd, "MasterProduct", "ID" );
   MasProdID = mi_MasProdID.intValue( );}
   //:DropObjectInstance( mMasProd )
   DropObjectInstance( mMasProd );
   //:ACTIVATE mMasProd WHERE mMasProd.MasterProduct.ID = MasProdID
   o_fnLocalBuildQual_1( ViewToWindow, vTempViewVar_0, MasProdID );
   RESULT = ActivateObjectInstance( mMasProd, "mMasProd", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mMasProd "mMasProd"
   SetNameForView( mMasProd, "mMasProd", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelAndReturnMLC( VIEW ViewToWindow )

//:   VIEW mMasProd REGISTERED AS mMasProd
public int 
CancelAndReturnMLC( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC   REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   //:STRING ( 1 ) szFound
   String   szFound = null;
   //:INTEGER      MasProdID
   int      MasProdID = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Drop current MLC.
   //:DropObjectInstance( mMasLC )
   DropObjectInstance( mMasLC );

   //:// Reactivate mMasProd to get updated list of MasterLabelContent entries, in case MLC was saved earlier.
   //:MasProdID = mMasProd.MasterProduct.ID
   {MutableInt mi_MasProdID = new MutableInt( MasProdID );
       GetIntegerFromAttribute( mi_MasProdID, mMasProd, "MasterProduct", "ID" );
   MasProdID = mi_MasProdID.intValue( );}
   //:DropObjectInstance( mMasProd )
   DropObjectInstance( mMasProd );
   //:ACTIVATE mMasProd WHERE mMasProd.MasterProduct.ID = MasProdID
   o_fnLocalBuildQual_0( ViewToWindow, vTempViewVar_0, MasProdID );
   RESULT = ActivateObjectInstance( mMasProd, "mMasProd", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mMasProd "mMasProd"
   SetNameForView( mMasProd, "mMasProd", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SaveMLC( VIEW ViewToWindow )

//:   VIEW mMasProd REGISTERED AS mMasProd
public int 
SaveMLC( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC   REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   //:VIEW wWebXfer REGISTERED AS wWebXfer
   zVIEW    wWebXfer = new zVIEW( );
   //:STRING ( 1 )  szFound
   String   szFound = null;
   //:STRING ( 18 ) szDateTime
   String   szDateTime = null;
   //:INTEGER       MasProdID
   int      MasProdID = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );

   //:// Ensure section name is not blank and is unique.
   //:IF mMasLC.MasterLabelContent.Version = ""
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "Version", "" ) == 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Update Master Product Content",
      //:             "The Master Product Content Version cannot be blank.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Update Master Product Content", "The Master Product Content Version cannot be blank.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );

      //:ELSE
   } 
   else
   { 
      //:// See if there is a Version in the mMasProd object with the current Version value that is not the current mMasLC.
      //:szFound = ""
       {StringBuilder sb_szFound;
      if ( szFound == null )
         sb_szFound = new StringBuilder( 32 );
      else
         sb_szFound = new StringBuilder( szFound );
            ZeidonStringCopy( sb_szFound, 1, 0, "", 1, 0, 2 );
      szFound = sb_szFound.toString( );}
      //:FOR EACH mMasProd.MasterLabelContent
      RESULT = SetCursorFirstEntity( mMasProd, "MasterLabelContent", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mMasProd.MasterLabelContent.Version = mMasLC.MasterLabelContent.Version AND
         //:   mMasProd.MasterLabelContent.ID     != mMasLC.MasterLabelContent.ID
         if ( CompareAttributeToAttribute( mMasProd, "MasterLabelContent", "Version", mMasLC, "MasterLabelContent", "Version" ) == 0 && CompareAttributeToAttribute( mMasProd, "MasterLabelContent", "ID", mMasLC, "MasterLabelContent", "ID" ) != 0 )
         { 

            //:szFound = "Y"
             {StringBuilder sb_szFound;
            if ( szFound == null )
               sb_szFound = new StringBuilder( 32 );
            else
               sb_szFound = new StringBuilder( szFound );
                        ZeidonStringCopy( sb_szFound, 1, 0, "Y", 1, 0, 2 );
            szFound = sb_szFound.toString( );}
         } 

         RESULT = SetCursorNextEntity( mMasProd, "MasterLabelContent", "" );
         //:END
      } 

      //:END
      //:IF szFound = "Y"
      if ( ZeidonStringCompare( szFound, 1, 0, "Y", 1, 0, 2 ) == 0 )
      { 
         //:MessageSend( ViewToWindow, "", "Update Master Product Content",
         //:             "The Master Product Content Version must be unique.",
         //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
         MessageSend( ViewToWindow, "", "Update Master Product Content", "The Master Product Content Version must be unique.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
         //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
         m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
         //:RETURN 2
         if(8==8)return( 2 );
      } 

      //:END
   } 

   //:END

   //:SysGetDateTime( szDateTime )
    {StringBuilder sb_szDateTime;
   if ( szDateTime == null )
      sb_szDateTime = new StringBuilder( 32 );
   else
      sb_szDateTime = new StringBuilder( szDateTime );
      m_KZOEP1AA.SysGetDateTime( sb_szDateTime );
   szDateTime = sb_szDateTime.toString( );}
   //:IF mMasLC.MasterLabelContent.Finalized = ""
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "Finalized", "" ) == 0 )
   { 
      //:mMasLC.MasterLabelContent.Finalized = "W"
      SetAttributeFromString( mMasLC, "MasterLabelContent", "Finalized", "W" );
      //:mMasLC.MasterLabelContent.CreatedDateTime = szDateTime // wWebXfer.Root.dCurrentDateTime
      SetAttributeFromString( mMasLC, "MasterLabelContent", "CreatedDateTime", szDateTime );
   } 

   //:END
   //:mMasLC.MasterLabelContent.RevisionDate = szDateTime // wWebXfer.Root.dCurrentDateTime
   SetAttributeFromString( mMasLC, "MasterLabelContent", "RevisionDate", szDateTime );
   //:mMasLC.MasterLabelContent.ModifiedDateTime = szDateTime // wWebXfer.Root.dCurrentDateTime
   SetAttributeFromString( mMasLC, "MasterLabelContent", "ModifiedDateTime", szDateTime );

   //:IF mMasLC.MasterProduct DOES NOT EXIST
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "MasterProduct" );
   if ( lTempInteger_0 != 0 )
   { 
      //:IncludeSubobjectFromSubobject( mMasLC, "MasterProduct",
      //:                               mMasProd, "MasterProduct", zPOS_BEFORE )
      IncludeSubobjectFromSubobject( mMasLC, "MasterProduct", mMasProd, "MasterProduct", zPOS_BEFORE );
   } 

   //:END
   //:wWebXfer.Root.CurrentContentType = ""
   SetAttributeFromString( wWebXfer, "Root", "CurrentContentType", "" );

   //:COMMIT mMasLC
   RESULT = CommitObjectInstance( mMasLC );
   //:SetDynamicBannerName( ViewToWindow, "wMLC", "PrimaryRegistrantLabel" )
   {
    ZGlobalV_Operation m_ZGlobalV_Operation = new ZGlobalV_Operation( ViewToWindow );
    m_ZGlobalV_Operation.SetDynamicBannerName( ViewToWindow, "wMLC", "PrimaryRegistrantLabel" );
    // m_ZGlobalV_Operation = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_StorageDispStatementAdd( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_StorageDispStatementAdd( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// We are creating the new temporal entity in this operation, rather than as auto action, so that
   //:// the NotForUseType attribute can be set, since it's currently required in the database.
   //:CreateTemporalEntity( mMasLC, "M_StorageDisposalStatement", zPOS_LAST )
   CreateTemporalEntity( mMasLC, "M_StorageDisposalStatement", zPOS_LAST );
   //:mMasLC.M_StorageDisposalStatement.NotForUseType = "NA"
   SetAttributeFromString( mMasLC, "M_StorageDisposalStatement", "NotForUseType", "NA" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:EditPrecautionarySection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
EditPrecautionarySection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on "Precautionary" General Statement.
   //:SET CURSOR FIRST mMasLC.M_GeneralSection WHERE mMasLC.M_GeneralSection.SectionType = "P"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_GeneralSection", "SectionType", "P", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mMasLC.M_GeneralSection
      RESULT = CreateEntity( mMasLC, "M_GeneralSection", zPOS_AFTER );
      //:mMasLC.M_GeneralSection.SectionType = "P"
      SetAttributeFromString( mMasLC, "M_GeneralSection", "SectionType", "P" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_FirstAidStmtDelete( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_FirstAidStmtDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "First Aid Statement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "First Aid Statement" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_GeneralStatement.Text
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_GeneralStatement", "Text" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_GeneralStatement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_GeneralStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:EditFirstAidSection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
EditFirstAidSection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on "First Aid" General Statement.
   //:SET CURSOR FIRST mMasLC.M_GeneralSection WHERE mMasLC.M_GeneralSection.SectionType = "F"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_GeneralSection", "SectionType", "F", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mMasLC.M_GeneralSection
      RESULT = CreateEntity( mMasLC, "M_GeneralSection", zPOS_AFTER );
      //:mMasLC.M_GeneralSection.SectionType = "F"
      SetAttributeFromString( mMasLC, "M_GeneralSection", "SectionType", "F" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_HazardsStmtDelete( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_HazardsStmtDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Hazards Statement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Hazards Statement" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_GeneralStatement.Text
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_GeneralStatement", "Text" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_GeneralStatement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_GeneralStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:EditEnvironmentalHazardsSection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
EditEnvironmentalHazardsSection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on "Environmental Hazards" General Statement.
   //:SET CURSOR FIRST mMasLC.M_GeneralSection WHERE mMasLC.M_GeneralSection.SectionType = "E"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_GeneralSection", "SectionType", "E", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mMasLC.M_GeneralSection
      RESULT = CreateEntity( mMasLC, "M_GeneralSection", zPOS_AFTER );
      //:mMasLC.M_GeneralSection.SectionType = "E"
      SetAttributeFromString( mMasLC, "M_GeneralSection", "SectionType", "E" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:EditChemicalHazardsSection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
EditChemicalHazardsSection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on "Physical and Chemical Hazards" General Statement.
   //:SET CURSOR FIRST mMasLC.M_GeneralSection WHERE mMasLC.M_GeneralSection.SectionType = "C"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_GeneralSection", "SectionType", "C", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mMasLC.M_GeneralSection
      RESULT = CreateEntity( mMasLC, "M_GeneralSection", zPOS_AFTER );
      //:mMasLC.M_GeneralSection.SectionType = "C"
      SetAttributeFromString( mMasLC, "M_GeneralSection", "SectionType", "C" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:PrebuildDeleteUsageStatements( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
PrebuildDeleteUsageStatements( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Create list of Usage Entries selected for delete.
   //:FOR EACH mMasLC.MI_UsageList
   RESULT = SetCursorFirstEntity( mMasLC, "MI_UsageList", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:EXCLUDE mMasLC.MI_UsageList NONE
      RESULT = ExcludeEntity( mMasLC, "MI_UsageList", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mMasLC, "MI_UsageList", "" );
   } 

   //:END
   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_Usage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_Usage", "wSelected", "Y" ) == 0 )
      { 
         //:INCLUDE mMasLC.MI_UsageList FROM mMasLC.M_Usage
         RESULT = IncludeSubobjectFromSubobject( mMasLC, "MI_UsageList", mMasLC, "M_Usage", zPOS_AFTER );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:PrebuildKeywordSelection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
PrebuildKeywordSelection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Create list of Usage Entries selected for delete.
   //:FOR EACH mMasLC.M_SubUsage
   RESULT = SetCursorFirstEntity( mMasLC, "M_SubUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mMasLC.M_SubUsage.wSelected = ""
      SetAttributeFromString( mMasLC, "M_SubUsage", "wSelected", "" );
      RESULT = SetCursorNextEntity( mMasLC, "M_SubUsage", "" );
   } 

   //:END
   //:FOR EACH mMasLC.M_InsertTextKeywordUsage 
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextKeywordUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mMasLC.M_InsertTextKeywordUsage.wSelected = ""
      SetAttributeFromString( mMasLC, "M_InsertTextKeywordUsage", "wSelected", "" );
      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextKeywordUsage", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:MoveSelectedSurfacesToKeyword( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
MoveSelectedSurfacesToKeyword( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT Count
   int      Count = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Ensure there is only one Keyword selected.
   //:Count = 0
   Count = 0;
   //:FOR EACH mMasLC.M_InsertTextKeywordUsage 
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextKeywordUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_InsertTextKeywordUsage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_InsertTextKeywordUsage", "wSelected", "Y" ) == 0 )
      { 
         //:Count = Count + 1
         Count = Count + 1;
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextKeywordUsage", "" );
      //:END
   } 

   //:END
   //:IF Count != 1
   if ( Count != 1 )
   { 
      //:MessageSend( ViewToWindow, "", "Surface Statement Move Surfaces",
      //:             "Exactly one Keyword must be selected",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Surface Statement Move Surfaces", "Exactly one Keyword must be selected", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END
   //:SET CURSOR FIRST mMasLC.M_InsertTextKeywordUsage WHERE mMasLC.M_InsertTextKeywordUsage.wSelected = "Y"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_InsertTextKeywordUsage", "wSelected", "Y", "" );
   //:FOR EACH mMasLC.M_SubUsage
   RESULT = SetCursorFirstEntity( mMasLC, "M_SubUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_SubUsage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_SubUsage", "wSelected", "Y" ) == 0 )
      { 
         //:CREATE ENTITY mMasLC.M_InsertTextUsage 
         RESULT = CreateEntity( mMasLC, "M_InsertTextUsage", zPOS_AFTER );
         //:mMasLC.M_InsertTextUsage.Text = mMasLC.M_SubUsage.Name
         SetAttributeFromAttribute( mMasLC, "M_InsertTextUsage", "Text", mMasLC, "M_SubUsage", "Name" );
         //:DELETE ENTITY mMasLC.M_SubUsage NONE
         RESULT = DeleteEntity( mMasLC, "M_SubUsage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_SubUsage", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:MoveSelectedKeywordToSurfaces( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
MoveSelectedKeywordToSurfaces( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT Count
   int      Count = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Ensure there is only one Keyword selected.
   //:Count = 0
   Count = 0;
   //:FOR EACH mMasLC.M_InsertTextKeywordUsage
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextKeywordUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_InsertTextKeywordUsage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_InsertTextKeywordUsage", "wSelected", "Y" ) == 0 )
      { 
         //:Count = Count + 1
         Count = Count + 1;
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextKeywordUsage", "" );
      //:END
   } 

   //:END
   //:IF Count != 1
   if ( Count != 1 )
   { 
      //:MessageSend( ViewToWindow, "", "Surface Statement Move Keyword",
      //:             "Exactly one Keyword must be selected",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Surface Statement Move Keyword", "Exactly one Keyword must be selected", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END
   //:SET CURSOR FIRST mMasLC.M_InsertTextKeywordUsage WHERE mMasLC.M_InsertTextKeywordUsage.wSelected = "Y"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_InsertTextKeywordUsage", "wSelected", "Y", "" );
   //:mMasLC.M_InsertTextKeywordUsage.wSelected = ""
   SetAttributeFromString( mMasLC, "M_InsertTextKeywordUsage", "wSelected", "" );
   //:FOR EACH mMasLC.M_InsertTextUsage
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_SubUsage 
      RESULT = CreateEntity( mMasLC, "M_SubUsage", zPOS_AFTER );
      //:mMasLC.M_SubUsage.Name = mMasLC.M_InsertTextUsage.Text
      SetAttributeFromAttribute( mMasLC, "M_SubUsage", "Name", mMasLC, "M_InsertTextUsage", "Text" );
      //:DELETE ENTITY mMasLC.M_InsertTextUsage NONE
      RESULT = DeleteEntity( mMasLC, "M_InsertTextUsage", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextUsage", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:MoveSelectedLocationsToKeyword( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
MoveSelectedLocationsToKeyword( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT Count
   int      Count = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Ensure there is only one Keyword selected.
   //:Count = 0
   Count = 0;
   //:FOR EACH mMasLC.M_InsertTextKeywordUsage 
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextKeywordUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_InsertTextKeywordUsage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_InsertTextKeywordUsage", "wSelected", "Y" ) == 0 )
      { 
         //:Count = Count + 1
         Count = Count + 1;
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextKeywordUsage", "" );
      //:END
   } 

   //:END
   //:IF Count != 1
   if ( Count != 1 )
   { 
      //:MessageSend( ViewToWindow, "", "Location Statement Move Locations",
      //:             "Exactly one Keyword must be selected",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Location Statement Move Locations", "Exactly one Keyword must be selected", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END
   //:SET CURSOR FIRST mMasLC.M_InsertTextKeywordUsage WHERE mMasLC.M_InsertTextKeywordUsage.wSelected = "Y"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_InsertTextKeywordUsage", "wSelected", "Y", "" );
   //:FOR EACH mMasLC.M_SubUsage
   RESULT = SetCursorFirstEntity( mMasLC, "M_SubUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_SubUsage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_SubUsage", "wSelected", "Y" ) == 0 )
      { 
         //:CREATE ENTITY mMasLC.M_InsertTextUsage 
         RESULT = CreateEntity( mMasLC, "M_InsertTextUsage", zPOS_AFTER );
         //:mMasLC.M_InsertTextUsage.Text = mMasLC.M_SubUsage.Name
         SetAttributeFromAttribute( mMasLC, "M_InsertTextUsage", "Text", mMasLC, "M_SubUsage", "Name" );
         //:DELETE ENTITY mMasLC.M_SubUsage NONE
         RESULT = DeleteEntity( mMasLC, "M_SubUsage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_SubUsage", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:MoveSelectedKeywordToLocations( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
MoveSelectedKeywordToLocations( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT Count
   int      Count = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Ensure there is only one Keyword selected.
   //:Count = 0
   Count = 0;
   //:FOR EACH mMasLC.M_InsertTextKeywordUsage
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextKeywordUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_InsertTextKeywordUsage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_InsertTextKeywordUsage", "wSelected", "Y" ) == 0 )
      { 
         //:Count = Count + 1
         Count = Count + 1;
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextKeywordUsage", "" );
      //:END
   } 

   //:END
   //:IF Count != 1
   if ( Count != 1 )
   { 
      //:MessageSend( ViewToWindow, "", "Location Statement Move Keyword",
      //:             "Exactly one Keyword must be selected",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Location Statement Move Keyword", "Exactly one Keyword must be selected", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END
   //:SET CURSOR FIRST mMasLC.M_InsertTextKeywordUsage WHERE mMasLC.M_InsertTextKeywordUsage.wSelected = "Y"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_InsertTextKeywordUsage", "wSelected", "Y", "" );
   //:mMasLC.M_InsertTextKeywordUsage.wSelected = ""
   SetAttributeFromString( mMasLC, "M_InsertTextKeywordUsage", "wSelected", "" );
   //:FOR EACH mMasLC.M_InsertTextUsage
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_SubUsage 
      RESULT = CreateEntity( mMasLC, "M_SubUsage", zPOS_AFTER );
      //:mMasLC.M_SubUsage.Name = mMasLC.M_InsertTextUsage.Text
      SetAttributeFromAttribute( mMasLC, "M_SubUsage", "Name", mMasLC, "M_InsertTextUsage", "Text" );
      //:DELETE ENTITY mMasLC.M_InsertTextUsage NONE
      RESULT = DeleteEntity( mMasLC, "M_InsertTextUsage", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextUsage", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:EditClaimsSection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
EditClaimsSection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on Claims Usage Type.
   //:SET CURSOR FIRST mMasLC.M_UsageType WHERE mMasLC.M_UsageType.UsageType = "C"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageType", "UsageType", "C", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mMasLC.M_UsageType
      RESULT = CreateEntity( mMasLC, "M_UsageType", zPOS_AFTER );
      //:mMasLC.M_UsageType.UsageType = "C"
      SetAttributeFromString( mMasLC, "M_UsageType", "UsageType", "C" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:EditLocationsSection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
EditLocationsSection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on Claims Usage Type.
   //:SET CURSOR FIRST mMasLC.M_UsageType WHERE mMasLC.M_UsageType.UsageType = "L"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageType", "UsageType", "L", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mMasLC.M_UsageType
      RESULT = CreateEntity( mMasLC, "M_UsageType", zPOS_AFTER );
      //:mMasLC.M_UsageType.UsageType = "L"
      SetAttributeFromString( mMasLC, "M_UsageType", "UsageType", "L" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:EditSurfacesSection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
EditSurfacesSection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on Claims Usage Type.
   //:SET CURSOR FIRST mMasLC.M_UsageType WHERE mMasLC.M_UsageType.UsageType = "S"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageType", "UsageType", "S", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mMasLC.M_UsageType
      RESULT = CreateEntity( mMasLC, "M_UsageType", zPOS_AFTER );
      //:mMasLC.M_UsageType.UsageType = "S"
      SetAttributeFromString( mMasLC, "M_UsageType", "UsageType", "S" );
   } 

   //:END

   //:// Go to build the NonGroup Usage entries.
   //:BuildNonGroupEntries( mMasLC )
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLC );
    m_mMasLC_Object.omMasLC_BuildNonGroupEntries( mMasLC );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:EditApplicationTypesSection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
EditApplicationTypesSection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on Claims Usage Type.
   //:SET CURSOR FIRST mMasLC.M_UsageType WHERE mMasLC.M_UsageType.UsageType = "T"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageType", "UsageType", "T", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mMasLC.M_UsageType
      RESULT = CreateEntity( mMasLC, "M_UsageType", zPOS_AFTER );
      //:mMasLC.M_UsageType.UsageType = "T"
      SetAttributeFromString( mMasLC, "M_UsageType", "UsageType", "T" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DirsForUseSectionDelete( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
GOTO_DirsForUseSectionDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Directions For Use Section"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Directions For Use Section" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_DirectionsForUseSection.Name
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_DirectionsForUseSection", "Name" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_DirectionsForUseSection"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_DirectionsForUseSection" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DeleteDirectionsForUseSection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
DeleteDirectionsForUseSection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:DELETE ENTITY mMasLC.M_DirectionsForUseSection NONE
   RESULT = DeleteEntity( mMasLC, "M_DirectionsForUseSection", zREPOS_NONE );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DeleteDirectionsForUseStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
DeleteDirectionsForUseStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:DELETE ENTITY mMasLC.M_DirectionsForUseStatement NONE
   RESULT = DeleteEntity( mMasLC, "M_DirectionsForUseStatement", zREPOS_NONE );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_SelectRemoveDrivingDU( VIEW ViewToWindow )

//:   VIEW mMasLC  REGISTERED AS mMasLC
public int 
GOTO_SelectRemoveDrivingDU( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Initialize the mMasLC  for selecting Driving Claims.
   //:mMasLC.MasterLabelContent.wSelectedUsageType = "DC"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wSelectedUsageType", "DC" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:InitIngredientsSect( VIEW ViewToWindow )

//:   VIEW wWebXfer REGISTERED AS wWebXfer
public int 
InitIngredientsSect( View     ViewToWindow )
{
   zVIEW    wWebXfer = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC   REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// AcceptCurrentTemporalSubobject( ViewToWindow, TRUE, "InitIngredientsSect: " )

   //:IF mMasLC.M_IngredientsSection DOES NOT EXIST
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_IngredientsSection" );
   if ( lTempInteger_0 != 0 )
   { 
      //:CREATE ENTITY mMasLC.M_IngredientsSection
      RESULT = CreateEntity( mMasLC, "M_IngredientsSection", zPOS_AFTER );
   } 

   //:END

   //:wWebXfer.Root.CurrentContentType = "I"  // Ingredients
   SetAttributeFromString( wWebXfer, "Root", "CurrentContentType", "I" );
   //:wWebXfer.Root.FormValidationDLL = "wMLC"
   SetAttributeFromString( wWebXfer, "Root", "FormValidationDLL", "wMLC" );
   //:wWebXfer.Root.FormValidationOperation = "ValidateIngredientsSection"
   SetAttributeFromString( wWebXfer, "Root", "FormValidationOperation", "ValidateIngredientsSection" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ConfirmAddItemsMultiple( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
ConfirmAddItemsMultiple( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW wWebXfer REGISTERED AS wWebXfer
   zVIEW    wWebXfer = new zVIEW( );
   //:STRING ( 2048 ) szName
   String   szName = null;
   //:SHORT nCount
   int      nCount = 0;
   //:SHORT nSubCount
   int      nSubCount = 0;
   String   szTempString_0 = null;
   String   szTempString_1 = null;
   String   szTempString_2 = null;
   String   szTempString_3 = null;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );

   //:// Call operation to split text up into one or more entities, depending on the view, EntityName and
   //:// AttributeName passed in mMasLC root work entities.
   //:nCount = SplitParagraphOnLinefeed( mMasLC.MasterLabelContent.wAddStatementsWorkText,
   //:                                   mMasLC,
   //:                                   mMasLC.MasterLabelContent.wAddStatementsEntityName,
   //:                                   mMasLC.MasterLabelContent.wAddStatementsAttributeName,
   //:                                   wWebXfer.Root.String ) // delimiters
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasLC, "MasterLabelContent", "wAddStatementsWorkText" );
   szTempString_0 = sb_szTempString_0.toString( );}
   {StringBuilder sb_szTempString_1;
   if ( szTempString_1 == null )
      sb_szTempString_1 = new StringBuilder( 32 );
   else
      sb_szTempString_1 = new StringBuilder( szTempString_1 );
       GetStringFromAttribute( sb_szTempString_1, mMasLC, "MasterLabelContent", "wAddStatementsEntityName" );
   szTempString_1 = sb_szTempString_1.toString( );}
   {StringBuilder sb_szTempString_2;
   if ( szTempString_2 == null )
      sb_szTempString_2 = new StringBuilder( 32 );
   else
      sb_szTempString_2 = new StringBuilder( szTempString_2 );
       GetStringFromAttribute( sb_szTempString_2, mMasLC, "MasterLabelContent", "wAddStatementsAttributeName" );
   szTempString_2 = sb_szTempString_2.toString( );}
   {StringBuilder sb_szTempString_3;
   if ( szTempString_3 == null )
      sb_szTempString_3 = new StringBuilder( 32 );
   else
      sb_szTempString_3 = new StringBuilder( szTempString_3 );
       GetStringFromAttribute( sb_szTempString_3, wWebXfer, "Root", "String" );
   szTempString_3 = sb_szTempString_3.toString( );}
   {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
    nCount = m_ZGlobal1_Operation.SplitParagraphOnLinefeed( szTempString_0, mMasLC, szTempString_1, szTempString_2, szTempString_3 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   }

   //:// Usage Type Processing
   //:// Set Usage Type and Claims Classification for any entry for which the values haven't been set.
   //:IF mMasLC.MasterLabelContent.wAddStatementsEntityName = "M_Usage"
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_Usage" ) == 0 )
   { 
      //:// Set Usage Type for any entry for which the value hasn't been set.
      //:FOR EACH mMasLC.M_Usage
      RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mMasLC.M_Usage.UsageType = ""
         if ( CompareAttributeToString( mMasLC, "M_Usage", "UsageType", "" ) == 0 )
         { 
            //:mMasLC.M_Usage.UsageType = mMasLC.M_UsageType.UsageType
            SetAttributeFromAttribute( mMasLC, "M_Usage", "UsageType", mMasLC, "M_UsageType", "UsageType" );
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
         //:END
      } 

      //:END
   } 

   //:END

   //:// Convert UsageGroup temporary entries into persistent entries
   //:IF mMasLC.MasterLabelContent.wAddStatementsEntityName = "M_UsageGroupUsageTemp"
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_UsageGroupUsageTemp" ) == 0 )
   { 
      //:// Transfer temp entries to real entries.
      //:FOR EACH mMasLC.M_UsageGroupUsageTemp
      RESULT = SetCursorFirstEntity( mMasLC, "M_UsageGroupUsageTemp", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mMasLC.M_Usage
         RESULT = CreateEntity( mMasLC, "M_Usage", zPOS_AFTER );
         //:mMasLC.M_Usage.Name = mMasLC.M_UsageGroupUsageTemp.Name
         SetAttributeFromAttribute( mMasLC, "M_Usage", "Name", mMasLC, "M_UsageGroupUsageTemp", "Name" );
         //:mMasLC.M_Usage.UsageType = mMasLC.M_UsageType.UsageType
         SetAttributeFromAttribute( mMasLC, "M_Usage", "UsageType", mMasLC, "M_UsageType", "UsageType" );
         //://INCLUDE mMasLC.M_UsageUsageGroup FROM mMasLC.M_UsageGroup
         //:INCLUDE mMasLC.M_UsageGroupUsage FROM mMasLC.M_Usage
         RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_UsageGroupUsage", mMasLC, "M_Usage", zPOS_AFTER );
         //:INCLUDE mMasLC.M_UsageUsageGroup FROM mMasLC.M_UsageGroup
         RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_UsageUsageGroup", mMasLC, "M_UsageGroup", zPOS_AFTER );
         //:DELETE ENTITY mMasLC.M_UsageGroupUsageTemp NONE
         RESULT = DeleteEntity( mMasLC, "M_UsageGroupUsageTemp", zREPOS_NONE );
         RESULT = SetCursorNextEntity( mMasLC, "M_UsageGroupUsageTemp", "" );
      } 

      //:END

      //:// Sort the Usage entries just added.
      //:OrderEntityForView( mMasLC, "M_Usage", "Name A" )
      OrderEntityForView( mMasLC, "M_Usage", "Name A" );
      //:OrderEntityForView( mMasLC, "M_UsageGroupUsage", "Name A" )
      OrderEntityForView( mMasLC, "M_UsageGroupUsage", "Name A" );
   } 

   //:END

   //:IF wWebXfer.Root.Note != ""
   if ( CompareAttributeToString( wWebXfer, "Root", "Note", "" ) != 0 )
   { 
      //:wWebXfer.Root.String = wWebXfer.Root.Note
      SetAttributeFromAttribute( wWebXfer, "Root", "String", wWebXfer, "Root", "Note" );
      //:mMasLC.MasterLabelContent.wAddStatementsEntityName = "M_SubUsage"
      SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_SubUsage" );
      //:FOR EACH mMasLC.M_Usage
      RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mMasLC.MasterLabelContent.wAddStatementsWorkText = mMasLC.M_Usage.Name
         SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wAddStatementsWorkText", mMasLC, "M_Usage", "Name" );
         //:nSubCount = ConfirmAddSubitems( ViewToWindow )
         nSubCount = ConfirmAddSubitems( ViewToWindow );
         //:IF nSubCount >= 2
         if ( nSubCount >= 2 )
         { 
            //:SET CURSOR FIRST mMasLC.M_SubUsage
            RESULT = SetCursorFirstEntity( mMasLC, "M_SubUsage", "" );
            //:mMasLC.M_Usage.Name = "{{}}"
            SetAttributeFromString( mMasLC, "M_Usage", "Name", "{{}}" );
            //:szName = mMasLC.M_SubUsage.Name
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
            StringBuilder sb_szName;
            if ( szName == null )
               sb_szName = new StringBuilder( 32 );
            else
               sb_szName = new StringBuilder( szName );
                         GetVariableFromAttribute( sb_szName, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_SubUsage", "Name", "", 0 );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );
            szName = sb_szName.toString( );}
            //:SetFirstCharacterCase( szName, 0 )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( ViewToWindow );
              {StringBuilder sb_szName;
            if ( szName == null )
               sb_szName = new StringBuilder( 32 );
            else
               sb_szName = new StringBuilder( szName );
                        m_ZGlobal1_Operation.SetFirstCharacterCase( sb_szName, 0 );
            szName = sb_szName.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
            //:mMasLC.M_SubUsage.Name = szName
            SetAttributeFromString( mMasLC, "M_SubUsage", "Name", szName );
            //:ELSE
         } 
         else
         { 
            //:FOR EACH mMasLC.M_SubUsage
            RESULT = SetCursorFirstEntity( mMasLC, "M_SubUsage", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:DELETE ENTITY mMasLC.M_SubUsage NONE
               RESULT = DeleteEntity( mMasLC, "M_SubUsage", zREPOS_NONE );
               RESULT = SetCursorNextEntity( mMasLC, "M_SubUsage", "" );
            } 

            //:END
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
         //:END
      } 

      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ConfirmAddSubitems( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
ConfirmAddSubitems( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW wWebXfer REGISTERED AS wWebXfer
   zVIEW    wWebXfer = new zVIEW( );
   //:SHORT nCount
   int      nCount = 0;
   String   szTempString_0 = null;
   String   szTempString_1 = null;
   String   szTempString_2 = null;
   String   szTempString_3 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );

   //:// Call operation to split text up into one or more entities, depending on the view, EntityName and
   //:// AttributeName passed in mMasLC root work entities.
   //:nCount = SplitParagraphOnLinefeed( mMasLC.MasterLabelContent.wAddStatementsWorkText,
   //:                                   mMasLC,
   //:                                   mMasLC.MasterLabelContent.wAddStatementsEntityName,
   //:                                   mMasLC.MasterLabelContent.wAddStatementsAttributeName,
   //:                                   wWebXfer.Root.String ) // delimiters
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasLC, "MasterLabelContent", "wAddStatementsWorkText" );
   szTempString_0 = sb_szTempString_0.toString( );}
   {StringBuilder sb_szTempString_1;
   if ( szTempString_1 == null )
      sb_szTempString_1 = new StringBuilder( 32 );
   else
      sb_szTempString_1 = new StringBuilder( szTempString_1 );
       GetStringFromAttribute( sb_szTempString_1, mMasLC, "MasterLabelContent", "wAddStatementsEntityName" );
   szTempString_1 = sb_szTempString_1.toString( );}
   {StringBuilder sb_szTempString_2;
   if ( szTempString_2 == null )
      sb_szTempString_2 = new StringBuilder( 32 );
   else
      sb_szTempString_2 = new StringBuilder( szTempString_2 );
       GetStringFromAttribute( sb_szTempString_2, mMasLC, "MasterLabelContent", "wAddStatementsAttributeName" );
   szTempString_2 = sb_szTempString_2.toString( );}
   {StringBuilder sb_szTempString_3;
   if ( szTempString_3 == null )
      sb_szTempString_3 = new StringBuilder( 32 );
   else
      sb_szTempString_3 = new StringBuilder( szTempString_3 );
       GetStringFromAttribute( sb_szTempString_3, wWebXfer, "Root", "String" );
   szTempString_3 = sb_szTempString_3.toString( );}
   {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
    nCount = m_ZGlobal1_Operation.SplitParagraphOnLinefeed( szTempString_0, mMasLC, szTempString_1, szTempString_2, szTempString_3 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   }

   //:// Set Usage Type and Claims Classification for any entry for which the values haven't been set.
   //:IF mMasLC.MasterLabelContent.wAddStatementsEntityName = "M_SubUsage"
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_SubUsage" ) == 0 )
   { 
      //:FOR EACH mMasLC.M_SubUsage
      RESULT = SetCursorFirstEntity( mMasLC, "M_SubUsage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mMasLC.M_SubUsage.UsageType = mMasLC.M_UsageType.UsageType
         SetAttributeFromAttribute( mMasLC, "M_SubUsage", "UsageType", mMasLC, "M_UsageType", "UsageType" );
         RESULT = SetCursorNextEntity( mMasLC, "M_SubUsage", "" );
      } 

      //:END
   } 

   //:END
   //:RETURN nCount
   return( nCount );
// END
} 


//:DIALOG OPERATION
//:ConfirmAddItemsMultipleClaims( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
ConfirmAddItemsMultipleClaims( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW wWebXfer REGISTERED AS wWebXfer
   zVIEW    wWebXfer = new zVIEW( );
   String   szTempString_0 = null;
   String   szTempString_1 = null;
   String   szTempString_2 = null;
   String   szTempString_3 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );

   //:// Make sure that a Claims Classification has been selected.
   //:IF mMasLC.MasterLabelContent.wSelectedClaimsClassification = ""
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "wSelectedClaimsClassification", "" ) == 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Add Claims Entries",
      //:             "A Claims Classification value must be selected.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Add Claims Entries", "A Claims Classification value must be selected.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:// Call operation to split text up into one or more entities, depending on the view, EntityName and
   //:// AttributeName passed in mMasLC root work entities.
   //:SplitParagraphOnLinefeed( mMasLC.MasterLabelContent.wAddStatementsWorkText,
   //:                          mMasLC,
   //:                          mMasLC.MasterLabelContent.wAddStatementsEntityName,
   //:                          mMasLC.MasterLabelContent.wAddStatementsAttributeName,
   //:                          wWebXfer.Root.String ) // delimiters
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasLC, "MasterLabelContent", "wAddStatementsWorkText" );
   szTempString_0 = sb_szTempString_0.toString( );}
   {StringBuilder sb_szTempString_1;
   if ( szTempString_1 == null )
      sb_szTempString_1 = new StringBuilder( 32 );
   else
      sb_szTempString_1 = new StringBuilder( szTempString_1 );
       GetStringFromAttribute( sb_szTempString_1, mMasLC, "MasterLabelContent", "wAddStatementsEntityName" );
   szTempString_1 = sb_szTempString_1.toString( );}
   {StringBuilder sb_szTempString_2;
   if ( szTempString_2 == null )
      sb_szTempString_2 = new StringBuilder( 32 );
   else
      sb_szTempString_2 = new StringBuilder( szTempString_2 );
       GetStringFromAttribute( sb_szTempString_2, mMasLC, "MasterLabelContent", "wAddStatementsAttributeName" );
   szTempString_2 = sb_szTempString_2.toString( );}
   {StringBuilder sb_szTempString_3;
   if ( szTempString_3 == null )
      sb_szTempString_3 = new StringBuilder( 32 );
   else
      sb_szTempString_3 = new StringBuilder( szTempString_3 );
       GetStringFromAttribute( sb_szTempString_3, wWebXfer, "Root", "String" );
   szTempString_3 = sb_szTempString_3.toString( );}
   {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
    m_ZGlobal1_Operation.SplitParagraphOnLinefeed( szTempString_0, mMasLC, szTempString_1, szTempString_2, szTempString_3 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   }

   //:// Set Usage Type and Claims Classification for any entry for which the values haven't been set.
   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_Usage.UsageType = ""
      if ( CompareAttributeToString( mMasLC, "M_Usage", "UsageType", "" ) == 0 )
      { 
         //:mMasLC.M_Usage.UsageType = "C"
         SetAttributeFromString( mMasLC, "M_Usage", "UsageType", "C" );
         //:mMasLC.M_Usage.ClaimsClassification = mMasLC.MasterLabelContent.wSelectedClaimsClassification
         SetAttributeFromAttribute( mMasLC, "M_Usage", "ClaimsClassification", mMasLC, "MasterLabelContent", "wSelectedClaimsClassification" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_AddFirstAidStatements( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_AddFirstAidStatements( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Set up the work areas that define to the Add Items page that the items being added are First Aid
   //:// Statements.
   //:mMasLC.MasterLabelContent.wAddStatementsEntityName    = "M_GeneralStatement"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_GeneralStatement" );
   //:mMasLC.MasterLabelContent.wAddStatementsAttributeName = "Text"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsAttributeName", "Text" );
   //:mMasLC.MasterLabelContent.wAddStatementsPageTitle     = "First Aid Statements"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "First Aid Statements" );
   //:mMasLC.MasterLabelContent.wAddStatementsWorkText      = ""
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsWorkText", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAndNextUsage( VIEW ViewToWindow )

//:   VIEW  mMasLC REGISTERED AS mMasLC
public int 
AcceptAndNextUsage( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_Usage" )
   nRC = AcceptSubobject( mMasLC, "M_Usage" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Next Usage Statement",
      //:             "Error accepting current Statement.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Next Usage Statement", "Error accepting current Statement.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:SET CURSOR NEXT mMasLC.M_Usage
   RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_Usage" )
   CreateTemporalSubobjectVersion( mMasLC, "M_Usage" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAndPreviousUsage( VIEW ViewToWindow )

//:   VIEW  mMasLC REGISTERED AS mMasLC
public int 
AcceptAndPreviousUsage( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_Usage" )
   nRC = AcceptSubobject( mMasLC, "M_Usage" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Next Usage Statement",
      //:             "Error accepting current Statement.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Next Usage Statement", "Error accepting current Statement.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:SET CURSOR PREVIOUS mMasLC.M_Usage
   RESULT = SetCursorPrevEntity( mMasLC, "M_Usage", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_Usage" )
   CreateTemporalSubobjectVersion( mMasLC, "M_Usage" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DeleteUsageGroupEntriesOnly( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
DeleteUsageGroupEntriesOnly( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Delete each selected Group and the corresponding M_Usage entity.
   //:FOR EACH mMasLC.M_UsageGroup
   RESULT = SetCursorFirstEntity( mMasLC, "M_UsageGroup", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_UsageGroup.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_UsageGroup", "wSelected", "Y" ) == 0 )
      { 
         //:FOR EACH mMasLC.M_Usage
         RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF mMasLC.M_UsageUsageGroup EXISTS
            lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_UsageUsageGroup" );
            if ( lTempInteger_0 == 0 )
            { 
               //:IF mMasLC.M_UsageUsageGroup.Name = mMasLC.M_UsageGroup.Name
               if ( CompareAttributeToAttribute( mMasLC, "M_UsageUsageGroup", "Name", mMasLC, "M_UsageGroup", "Name" ) == 0 )
               { 
                  //:EXCLUDE mMasLC.M_UsageUsageGroup
                  RESULT = ExcludeEntity( mMasLC, "M_UsageUsageGroup", zREPOS_AFTER );
                  //:SET CURSOR FIRST mMasLC.M_UsageGroupUsage WHERE mMasLC.M_UsageGroupUsage.Name = mMasLC.M_Usage.Name
                  {StringBuilder sb_szTempString_0;
                  if ( szTempString_0 == null )
                     sb_szTempString_0 = new StringBuilder( 32 );
                  else
                     sb_szTempString_0 = new StringBuilder( szTempString_0 );
                                     GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_Usage", "Name" );
                  szTempString_0 = sb_szTempString_0.toString( );}
                  RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageGroupUsage", "Name", szTempString_0, "" );
                  //:EXCLUDE mMasLC.M_UsageGroupUsage NONE
                  RESULT = ExcludeEntity( mMasLC, "M_UsageGroupUsage", zREPOS_NONE );
               } 

               //:END
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
            //:END
         } 

         //:END
         //:DELETE ENTITY  mMasLC.M_UsageGroup NONE
         RESULT = DeleteEntity( mMasLC, "M_UsageGroup", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_UsageGroup", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DeleteSelectedGroupUsageEntries( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
DeleteSelectedGroupUsageEntries( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   String   szTempString_0 = null;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:FOR EACH mMasLC.M_UsageGroupUsage
   RESULT = SetCursorFirstEntity( mMasLC, "M_UsageGroupUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_UsageGroupUsage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_UsageGroupUsage", "wSelected", "Y" ) == 0 )
      { 
         //:// Position on corresponding M_Usage entry.
         //:IF mMasLC.M_UsageGroupUsage.ID = ""
         if ( CompareAttributeToString( mMasLC, "M_UsageGroupUsage", "ID", "" ) == 0 )
         { 
            //:SET CURSOR FIRST mMasLC.M_Usage WHERE mMasLC.M_Usage.Name = mMasLC.M_UsageGroupUsage.Name
            {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_UsageGroupUsage", "Name" );
            szTempString_0 = sb_szTempString_0.toString( );}
            RESULT = SetCursorFirstEntityByString( mMasLC, "M_Usage", "Name", szTempString_0, "" );
            //:ELSE
         } 
         else
         { 
            //:SET CURSOR FIRST mMasLC.M_Usage WHERE mMasLC.M_Usage.ID = mMasLC.M_UsageGroupUsage.ID
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                         GetIntegerFromAttribute( mi_lTempInteger_0, mMasLC, "M_UsageGroupUsage", "ID" );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_Usage", "ID", lTempInteger_0, "" );
         } 

         //:END
         //:EXCLUDE mMasLC.M_UsageGroupUsage NONE
         RESULT = ExcludeEntity( mMasLC, "M_UsageGroupUsage", zREPOS_NONE );
         //:DELETE ENTITY  mMasLC.M_Usage NONE
         RESULT = DeleteEntity( mMasLC, "M_Usage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_UsageGroupUsage", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SelectUsageEntriesForGroup( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
SelectUsageEntriesForGroup( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC2 BASED ON LOD mMasLC
   zVIEW    mMasLC2 = new zVIEW( );
   //:INTEGER ID
   int      ID = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateViewFromView( mMasLC2, mMasLC )
   CreateViewFromView( mMasLC2, mMasLC );

   //:// Include each selected M_Usage entry under the current Group.
   //:FOR EACH mMasLC2.M_UsageNonGroupUsage
   RESULT = SetCursorFirstEntity( mMasLC2, "M_UsageNonGroupUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC2.M_UsageNonGroupUsage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC2, "M_UsageNonGroupUsage", "wSelected", "Y" ) == 0 )
      { 
         //:ID = mMasLC2.M_UsageNonGroupUsage.ID
         {MutableInt mi_ID = new MutableInt( ID );
                   GetIntegerFromAttribute( mi_ID, mMasLC2, "M_UsageNonGroupUsage", "ID" );
         ID = mi_ID.intValue( );}
         //:SET CURSOR FIRST mMasLC2.M_Usage WHERE mMasLC2.M_Usage.ID = ID
         RESULT = SetCursorFirstEntityByInteger( mMasLC2, "M_Usage", "ID", ID, "" );
         //:IF RESULT = 0
         if ( RESULT == 0 )
         { 
            //:INCLUDE mMasLC2.M_UsageUsageGroup FROM mMasLC2.M_UsageGroup
            RESULT = IncludeSubobjectFromSubobject( mMasLC2, "M_UsageUsageGroup", mMasLC2, "M_UsageGroup", zPOS_AFTER );
            //:INCLUDE mMasLC2.M_UsageGroupUsage FROM mMasLC2.M_Usage
            RESULT = IncludeSubobjectFromSubobject( mMasLC2, "M_UsageGroupUsage", mMasLC2, "M_Usage", zPOS_AFTER );
            //:EXCLUDE mMasLC2.M_UsageNonGroupUsage NONE
            RESULT = ExcludeEntity( mMasLC2, "M_UsageNonGroupUsage", zREPOS_NONE );
            //:ELSE
         } 
         else
         { 
            //:MessageSend( ViewToWindow, "", "Select Usages For Group",
            //:             "Error locating Usage by Id.",
            //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
            MessageSend( ViewToWindow, "", "Select Usages For Group", "Error locating Usage by Id.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
            //:RETURN 2
            if(8==8)return( 2 );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mMasLC2, "M_UsageNonGroupUsage", "" );
      //:END
   } 

   //:END
   //:OrderEntityForView( mMasLC2, "M_UsageGroupUsage", "Name A" )
   OrderEntityForView( mMasLC2, "M_UsageGroupUsage", "Name A" );
   //:DropView( mMasLC2 )
   DropView( mMasLC2 );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:RemoveUsageEntriesFromGroup( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
RemoveUsageEntriesFromGroup( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC2 BASED ON LOD mMasLC
   zVIEW    mMasLC2 = new zVIEW( );
   //:INTEGER ID
   int      ID = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateViewFromView( mMasLC2, mMasLC )
   CreateViewFromView( mMasLC2, mMasLC );

   //:// Exclude each selected M_Usage from under the group.
   //:FOR EACH mMasLC2.M_UsageGroupUsage
   RESULT = SetCursorFirstEntity( mMasLC2, "M_UsageGroupUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC2.M_UsageGroupUsage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC2, "M_UsageGroupUsage", "wSelected", "Y" ) == 0 )
      { 
         //:ID = mMasLC2.M_UsageGroupUsage.ID
         {MutableInt mi_ID = new MutableInt( ID );
                   GetIntegerFromAttribute( mi_ID, mMasLC2, "M_UsageGroupUsage", "ID" );
         ID = mi_ID.intValue( );}
         //:SET CURSOR FIRST mMasLC2.M_Usage WHERE mMasLC2.M_Usage.ID = ID
         RESULT = SetCursorFirstEntityByInteger( mMasLC2, "M_Usage", "ID", ID, "" );
         //:IF RESULT = 0
         if ( RESULT == 0 )
         { 
            //:INCLUDE mMasLC2.M_UsageNonGroupUsage FROM mMasLC2.M_Usage
            RESULT = IncludeSubobjectFromSubobject( mMasLC2, "M_UsageNonGroupUsage", mMasLC2, "M_Usage", zPOS_AFTER );
            //:EXCLUDE mMasLC2.M_UsageUsageGroup NONE
            RESULT = ExcludeEntity( mMasLC2, "M_UsageUsageGroup", zREPOS_NONE );
            //:EXCLUDE mMasLC2.M_UsageGroupUsage NONE
            RESULT = ExcludeEntity( mMasLC2, "M_UsageGroupUsage", zREPOS_NONE );
            //:ELSE
         } 
         else
         { 
            //:MessageSend( ViewToWindow, "", "Remove Usages For Group",
            //:             "Error locating Usage by Id.",
            //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
            MessageSend( ViewToWindow, "", "Remove Usages For Group", "Error locating Usage by Id.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
            //:RETURN 2
            if(8==8)return( 2 );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mMasLC2, "M_UsageGroupUsage", "" );
      //:END
   } 

   //:END
   //:DropView( mMasLC2 )
   DropView( mMasLC2 );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:REMOVE_SelectedGroupUsageEntries( VIEW ViewToWindow )

public int 
REMOVE_SelectedGroupUsageEntries( View     ViewToWindow )
{

   return( 0 );
// END
} 


//:DIALOG OPERATION
//:REGENERATE_TitleText( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
REGENERATE_TitleText( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Rebuild the M_InsertTextKeyword subobject from the selected entries in M_InsertTextKeywordBase.
   //:FOR EACH mMasLC.M_InsertTextKeyword
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextKeyword", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mMasLC.M_InsertTextKeyword NONE
      RESULT = DeleteEntity( mMasLC, "M_InsertTextKeyword", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextKeyword", "" );
   } 

   //:END
   //:FOR EACH mMasLC.M_InsertTextKeywordBase
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextKeywordBase", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_InsertTextKeyword
      RESULT = CreateEntity( mMasLC, "M_InsertTextKeyword", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_InsertTextKeyword", mMasLC, "M_InsertTextKeywordBase", zSET_ALL )
      SetMatchingAttributesByName( mMasLC, "M_InsertTextKeyword", mMasLC, "M_InsertTextKeywordBase", zSET_ALL );
      //:FOR EACH mMasLC.M_InsertTextBase
      RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextBase", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mMasLC.M_InsertTextBase.wSelected = "Y"
         if ( CompareAttributeToString( mMasLC, "M_InsertTextBase", "wSelected", "Y" ) == 0 )
         { 
            //:CREATE ENTITY mMasLC.M_InsertText
            RESULT = CreateEntity( mMasLC, "M_InsertText", zPOS_AFTER );
            //:SetMatchingAttributesByName( mMasLC, "M_InsertText", mMasLC, "M_InsertTextBase", zSET_ALL )
            SetMatchingAttributesByName( mMasLC, "M_InsertText", mMasLC, "M_InsertTextBase", zSET_ALL );
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextBase", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextKeywordBase", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:PASTE_InsertKeywordMarketing( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
PASTE_InsertKeywordMarketing( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Paste the M_InsertTextKeywordBase subobject under the current M_MarketingStatement.

   //:IF mMasLC.M_InsertTextKeywordBase DOES NOT EXIST
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_InsertTextKeywordBase" );
   if ( lTempInteger_0 != 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Paste Keyword",
      //:             "No Insert Keyword entry have been copied.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Paste Keyword", "No Insert Keyword entry have been copied.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:FOR EACH mMasLC.M_InsertTextKeywordBase
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextKeywordBase", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_InsertTextKeywordMarketing
      RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordMarketing", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordMarketing", mMasLC, "M_InsertTextKeywordBase", zSET_NULL )
      SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordMarketing", mMasLC, "M_InsertTextKeywordBase", zSET_NULL );
      //:FOR EACH mMasLC.M_InsertTextBase
      RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextBase", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mMasLC.M_InsertTextMarketing
         RESULT = CreateEntity( mMasLC, "M_InsertTextMarketing", zPOS_AFTER );
         //:SetMatchingAttributesByName( mMasLC, "M_InsertTextMarketing", mMasLC, "M_InsertTextBase", zSET_NULL )
         SetMatchingAttributesByName( mMasLC, "M_InsertTextMarketing", mMasLC, "M_InsertTextBase", zSET_NULL );
         RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextBase", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextKeywordBase", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:PASTE_InsertKeywordDU( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
PASTE_InsertKeywordDU( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Paste the M_InsertTextKeywordBase subobject under the current M_DirectionsForUseStatement.

   //:IF mMasLC.M_InsertTextKeywordBase DOES NOT EXIST
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_InsertTextKeywordBase" );
   if ( lTempInteger_0 != 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Paste Keyword",
      //:             "No Insert Keyword entry have been copied.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Paste Keyword", "No Insert Keyword entry have been copied.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:FOR EACH mMasLC.M_InsertTextKeywordBase
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextKeywordBase", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_InsertTextKeywordDU
      RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordDU", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordDU", mMasLC, "M_InsertTextKeywordBase", zSET_NULL )
      SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordDU", mMasLC, "M_InsertTextKeywordBase", zSET_NULL );
      //:FOR EACH mMasLC.M_InsertTextBase
      RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextBase", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mMasLC.M_InsertTextDU
         RESULT = CreateEntity( mMasLC, "M_InsertTextDU", zPOS_AFTER );
         //:SetMatchingAttributesByName( mMasLC, "M_InsertTextDU", mMasLC, "M_InsertTextBase", zSET_NULL )
         SetMatchingAttributesByName( mMasLC, "M_InsertTextDU", mMasLC, "M_InsertTextBase", zSET_NULL );
         RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextBase", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextKeywordBase", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ParseDFU_StatementText( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
ParseDFU_StatementText( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   //:ParseStatementForKeywords( mMasLC, "M_DirectionsForUseStatement", "Text",
   //:                           "M_InsertTextKeywordDU", "M_InsertTextDU", "{}" )
   {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
    m_ZGlobal1_Operation.ParseStatementForKeywords( mMasLC, "M_DirectionsForUseStatement", "Text", "M_InsertTextKeywordDU", "M_InsertTextDU", "{}" );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ParseDFU_SectionText( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
ParseDFU_SectionText( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   //:ParseStatementForKeywords( mMasLC, "M_DirectionsForUseSection", "Title",
   //:                           "M_InsertTextKeywordSectionDU", "M_InsertTextSectionDU", "{}" )
   {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
    m_ZGlobal1_Operation.ParseStatementForKeywords( mMasLC, "M_DirectionsForUseSection", "Title", "M_InsertTextKeywordSectionDU", "M_InsertTextSectionDU", "{}" );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   }
   //:ParseStatementForKeywords( mMasLC, "M_DirectionsForUseSection", "Subtitle",
   //:                           "M_InsertTextKeywordSectionDU", "M_InsertTextSectionDU", "{}" )
   {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
    m_ZGlobal1_Operation.ParseStatementForKeywords( mMasLC, "M_DirectionsForUseSection", "Subtitle", "M_InsertTextKeywordSectionDU", "M_InsertTextSectionDU", "{}" );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:PASTE_InsertKeywordSD( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
PASTE_InsertKeywordSD( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Paste the M_InsertTextKeywordBase subobject under the current M_DirectionsForUseStatement.

   //:IF mMasLC.M_InsertTextKeywordBase DOES NOT EXIST
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_InsertTextKeywordBase" );
   if ( lTempInteger_0 != 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Paste Keyword",
      //:             "No Insert Keyword entry have been copied.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Paste Keyword", "No Insert Keyword entry have been copied.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:FOR EACH mMasLC.M_InsertTextKeywordBase
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextKeywordBase", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_InsertTextKeywordSD
      RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordSD", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordSD", mMasLC, "M_InsertTextKeywordBase", zSET_NULL )
      SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordSD", mMasLC, "M_InsertTextKeywordBase", zSET_NULL );
      //:FOR EACH mMasLC.M_InsertTextBase
      RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextBase", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mMasLC.M_InsertTextSD
         RESULT = CreateEntity( mMasLC, "M_InsertTextSD", zPOS_AFTER );
         //:SetMatchingAttributesByName( mMasLC, "M_InsertTextSD", mMasLC, "M_InsertTextBase", zSET_NULL )
         SetMatchingAttributesByName( mMasLC, "M_InsertTextSD", mMasLC, "M_InsertTextBase", zSET_NULL );
         RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextBase", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextKeywordBase", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:PASTE_InsertKeywordGeneral( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
PASTE_InsertKeywordGeneral( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Paste the M_InsertTextKeywordBase subobject under the current M_DirectionsForUseStatement.

   //:IF mMasLC.M_InsertTextKeywordBase DOES NOT EXIST
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_InsertTextKeywordBase" );
   if ( lTempInteger_0 != 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Paste Keyword",
      //:             "No Insert Keyword entry have been copied.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Paste Keyword", "No Insert Keyword entry have been copied.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:FOR EACH mMasLC.M_InsertTextKeywordBase
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextKeywordBase", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_InsertTextKeywordGeneral
      RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordGeneral", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordGeneral", mMasLC, "M_InsertTextKeywordBase", zSET_NULL )
      SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordGeneral", mMasLC, "M_InsertTextKeywordBase", zSET_NULL );
      //:FOR EACH mMasLC.M_InsertTextBase
      RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextBase", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mMasLC.M_InsertTextGeneral
         RESULT = CreateEntity( mMasLC, "M_InsertTextGeneral", zPOS_AFTER );
         //:SetMatchingAttributesByName( mMasLC, "M_InsertTextGeneral", mMasLC, "M_InsertTextBase", zSET_NULL )
         SetMatchingAttributesByName( mMasLC, "M_InsertTextGeneral", mMasLC, "M_InsertTextBase", zSET_NULL );
         RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextBase", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextKeywordBase", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:COPY_InsertKeywordDU( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
COPY_InsertKeywordDU( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Copy the M_InsertTextKeywordDU subobject to the base derived subobject.

   //:IF mMasLC.DisplayKeywordText EXISTS
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "DisplayKeywordText" );
   if ( lTempInteger_0 == 0 )
   { 
      //:DELETE ENTITY mMasLC.DisplayKeywordText
      RESULT = DeleteEntity( mMasLC, "DisplayKeywordText", zPOS_NEXT );
   } 

   //:END
   //:CREATE ENTITY mMasLC.DisplayKeywordText
   RESULT = CreateEntity( mMasLC, "DisplayKeywordText", zPOS_AFTER );
   //:CREATE ENTITY mMasLC.M_InsertTextKeywordBase
   RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordBase", zPOS_AFTER );
   //:SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordBase", mMasLC, "M_InsertTextKeywordDU", zSET_ALL )
   SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordBase", mMasLC, "M_InsertTextKeywordDU", zSET_ALL );
   //:FOR EACH mMasLC.M_InsertTextDU
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextDU", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_InsertTextBase
      RESULT = CreateEntity( mMasLC, "M_InsertTextBase", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_InsertTextBase", mMasLC, "M_InsertTextDU", zSET_ALL )
      SetMatchingAttributesByName( mMasLC, "M_InsertTextBase", mMasLC, "M_InsertTextDU", zSET_ALL );
      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextDU", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:COPY_InsertKeywordTitleDU( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
COPY_InsertKeywordTitleDU( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Copy the M_InsertTextKeywordDU subobject to the base derived subobject.

   //:IF mMasLC.DisplayKeywordText EXISTS
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "DisplayKeywordText" );
   if ( lTempInteger_0 == 0 )
   { 
      //:DELETE ENTITY mMasLC.DisplayKeywordText
      RESULT = DeleteEntity( mMasLC, "DisplayKeywordText", zPOS_NEXT );
   } 

   //:END
   //:CREATE ENTITY mMasLC.DisplayKeywordText
   RESULT = CreateEntity( mMasLC, "DisplayKeywordText", zPOS_AFTER );
   //:CREATE ENTITY mMasLC.M_InsertTextKeywordBase
   RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordBase", zPOS_AFTER );
   //:SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordBase", mMasLC, "M_InsertTextKeywordSectionDU", zSET_ALL )
   SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordBase", mMasLC, "M_InsertTextKeywordSectionDU", zSET_ALL );
   //:FOR EACH mMasLC.M_InsertTextDU
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextDU", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_InsertTextBase
      RESULT = CreateEntity( mMasLC, "M_InsertTextBase", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_InsertTextBase", mMasLC, "M_InsertTextSectionDU", zSET_ALL )
      SetMatchingAttributesByName( mMasLC, "M_InsertTextBase", mMasLC, "M_InsertTextSectionDU", zSET_ALL );
      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextDU", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CopyAndAddSectionDU( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
CopyAndAddSectionDU( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC2 BASED ON LOD mMasLC
   zVIEW    mMasLC2 = new zVIEW( );
   //:STRING ( 254 ) szName
   String   szName = null;
   //:SHORT  nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseSection" )
   nRC = AcceptSubobject( mMasLC, "M_DirectionsForUseSection" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Copy Directions For Use Section",
      //:             "Error saving Directions For Use Section.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Copy Directions For Use Section", "Error saving Directions For Use Section.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:CreateViewFromView( mMasLC2, mMasLC )
   CreateViewFromView( mMasLC2, mMasLC );
   //:CreateTemporalEntity( mMasLC, "M_DirectionsForUseSection", zPOS_LAST )
   CreateTemporalEntity( mMasLC, "M_DirectionsForUseSection", zPOS_LAST );
   //:SetMatchingAttributesByName( mMasLC, "M_DirectionsForUseSection", mMasLC2, "M_DirectionsForUseSection", zSET_NULL )
   SetMatchingAttributesByName( mMasLC, "M_DirectionsForUseSection", mMasLC2, "M_DirectionsForUseSection", zSET_NULL );
   //:szName = mMasLC2.M_DirectionsForUseSection.Name + " - copy"
   {StringBuilder sb_szName;
   if ( szName == null )
      sb_szName = new StringBuilder( 32 );
   else
      sb_szName = new StringBuilder( szName );
       GetStringFromAttribute( sb_szName, mMasLC2, "M_DirectionsForUseSection", "Name" );
   szName = sb_szName.toString( );}
    {StringBuilder sb_szName;
   if ( szName == null )
      sb_szName = new StringBuilder( 32 );
   else
      sb_szName = new StringBuilder( szName );
      ZeidonStringConcat( sb_szName, 1, 0, " - copy", 1, 0, 255 );
   szName = sb_szName.toString( );}
   //:mMasLC.M_DirectionsForUseSection.Name = szName
   SetAttributeFromString( mMasLC, "M_DirectionsForUseSection", "Name", szName );

   //:FOR EACH mMasLC2.M_InsertTextKeywordSectionDU
   RESULT = SetCursorFirstEntity( mMasLC2, "M_InsertTextKeywordSectionDU", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_InsertTextKeywordSectionDU
      RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordSectionDU", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordSectionDU", mMasLC2, "M_InsertTextKeywordSectionDU", zSET_NULL )
      SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordSectionDU", mMasLC2, "M_InsertTextKeywordSectionDU", zSET_NULL );
      //:FOR EACH mMasLC2.M_InsertTextSectionDU 
      RESULT = SetCursorFirstEntity( mMasLC2, "M_InsertTextSectionDU", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mMasLC.M_InsertTextSectionDU
         RESULT = CreateEntity( mMasLC, "M_InsertTextSectionDU", zPOS_AFTER );
         //:SetMatchingAttributesByName( mMasLC, "M_InsertTextSectionDU", mMasLC2, "M_InsertTextSectionDU", zSET_NULL )
         SetMatchingAttributesByName( mMasLC, "M_InsertTextSectionDU", mMasLC2, "M_InsertTextSectionDU", zSET_NULL );
         RESULT = SetCursorNextEntity( mMasLC2, "M_InsertTextSectionDU", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC2, "M_InsertTextKeywordSectionDU", "" );
      //:END
   } 

   //:END
   //:DropView( mMasLC2 )
   DropView( mMasLC2 );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:COPY_InsertKeywordSD( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
COPY_InsertKeywordSD( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Copy the M_InsertTextKeywordSD subobject to the base derived subobject.

   //:IF mMasLC.DisplayKeywordText EXISTS
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "DisplayKeywordText" );
   if ( lTempInteger_0 == 0 )
   { 
      //:DELETE ENTITY mMasLC.DisplayKeywordText
      RESULT = DeleteEntity( mMasLC, "DisplayKeywordText", zPOS_NEXT );
   } 

   //:END
   //:CREATE ENTITY mMasLC.DisplayKeywordText
   RESULT = CreateEntity( mMasLC, "DisplayKeywordText", zPOS_AFTER );
   //:CREATE ENTITY mMasLC.M_InsertTextKeywordBase
   RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordBase", zPOS_AFTER );
   //:SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordBase", mMasLC, "M_InsertTextKeywordSD", zSET_ALL )
   SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordBase", mMasLC, "M_InsertTextKeywordSD", zSET_ALL );
   //:FOR EACH mMasLC.M_InsertTextSD
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextSD", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_InsertTextBase
      RESULT = CreateEntity( mMasLC, "M_InsertTextBase", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_InsertTextBase", mMasLC, "M_InsertTextSD", zSET_ALL )
      SetMatchingAttributesByName( mMasLC, "M_InsertTextBase", mMasLC, "M_InsertTextSD", zSET_ALL );
      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextSD", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:COPY_InsertKeywordGeneral( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
COPY_InsertKeywordGeneral( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Copy the M_InsertTextKeywordGeneral subobject to the base derived subobject.

   //:IF mMasLC.DisplayKeywordText EXISTS
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "DisplayKeywordText" );
   if ( lTempInteger_0 == 0 )
   { 
      //:DELETE ENTITY mMasLC.DisplayKeywordText
      RESULT = DeleteEntity( mMasLC, "DisplayKeywordText", zPOS_NEXT );
   } 

   //:END
   //:CREATE ENTITY mMasLC.DisplayKeywordText
   RESULT = CreateEntity( mMasLC, "DisplayKeywordText", zPOS_AFTER );
   //:CREATE ENTITY mMasLC.M_InsertTextKeywordBase
   RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordBase", zPOS_AFTER );
   //:SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordBase", mMasLC, "M_InsertTextKeywordGeneral", zSET_ALL )
   SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordBase", mMasLC, "M_InsertTextKeywordGeneral", zSET_ALL );
   //:FOR EACH mMasLC.M_InsertTextGeneral
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextGeneral", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_InsertTextBase
      RESULT = CreateEntity( mMasLC, "M_InsertTextBase", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_InsertTextBase", mMasLC, "M_InsertTextGeneral", zSET_ALL )
      SetMatchingAttributesByName( mMasLC, "M_InsertTextBase", mMasLC, "M_InsertTextGeneral", zSET_ALL );
      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextGeneral", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_EnvironmentalSectionBefore( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_EnvironmentalSectionBefore( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateTemporalEntity( mMasLC, "M_GeneralSection", zPOS_BEFORE )
   CreateTemporalEntity( mMasLC, "M_GeneralSection", zPOS_BEFORE );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_StorageDispSectionAddBefore( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_StorageDispSectionAddBefore( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateTemporalEntity( mMasLC, "M_StorageDisposalSection", zPOS_BEFORE )
   CreateTemporalEntity( mMasLC, "M_StorageDisposalSection", zPOS_BEFORE );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DU_CategoryUpdate( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DU_CategoryUpdate( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseCategory" )
   CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseCategory" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DU_CategoryAdd( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DU_CategoryAdd( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateTemporalEntity( mMasLC, "M_DirectionsForUseCategory", zPOS_LAST )
   CreateTemporalEntity( mMasLC, "M_DirectionsForUseCategory", zPOS_LAST );
   return( 0 );
//    
// END
} 


//:DIALOG OPERATION
//:GOTO_DU_SectionUpdate( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DU_SectionUpdate( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:STRING ( 256 ) szName
   String   szName = null;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateIncludeExcludeView( mMasLC )
   o_CreateIncludeExcludeView( mMasLC );
   //:szName = mMasLC.M_DirectionsForUseSection.Name
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szName;
   if ( szName == null )
      sb_szName = new StringBuilder( 32 );
   else
      sb_szName = new StringBuilder( szName );
       GetVariableFromAttribute( sb_szName, mi_lTempInteger_0, 'S', 257, mMasLC, "M_DirectionsForUseSection", "Name", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szName = sb_szName.toString( );}
   //:CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseSection" )
   CreateTemporalSubobjectVersion( mMasLC, "M_DirectionsForUseSection" );
   //:BuildDFU_CategoryNameList( mMasLC )
   o_BuildDFU_CategoryNameList( mMasLC );
   //:BuildDFU_SectionNameList( mMasLC, szName )
   o_BuildDFU_SectionNameList( mMasLC, szName );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ADD_BlankClaimsKeywordAndText( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
ADD_BlankClaimsKeywordAndText( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Create Usage Keyword and one subordinate text entity.
   //:CREATE ENTITY mMasLC.M_InsertTextKeywordUsage
   RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordUsage", zPOS_AFTER );
   //:CREATE ENTITY mMasLC.M_InsertTextUsage
   RESULT = CreateEntity( mMasLC, "M_InsertTextUsage", zPOS_AFTER );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAndReturnUsageStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptAndReturnUsageStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Accept temporal Usage statement and go to build nongroup entries.
   //:AcceptSubobject( mMasLC, "M_Usage" )
   AcceptSubobject( mMasLC, "M_Usage" );
   //:BuildNonGroupEntries( mMasLC )
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLC );
    m_mMasLC_Object.omMasLC_BuildNonGroupEntries( mMasLC );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAndReturnSubUsageStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptAndReturnSubUsageStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.M_SubUsage.UsageType = "S"
   SetAttributeFromString( mMasLC, "M_SubUsage", "UsageType", "S" );
   //:   
   //:// Accept temporal Usage statement.
   //:AcceptSubobject( mMasLC, "M_SubUsage" )
   AcceptSubobject( mMasLC, "M_SubUsage" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAndReturnSubsurfaceStmt( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptAndReturnSubsurfaceStmt( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.M_Usage.UsageType = "S"
   SetAttributeFromString( mMasLC, "M_Usage", "UsageType", "S" );
   //:   
   //:// Accept temporal Usage statement.
   //:AcceptSubobject( mMasLC, "M_Usage" )
   AcceptSubobject( mMasLC, "M_Usage" );
   //:ResetViewFromSubobject( mMasLC )
   ResetViewFromSubobject( mMasLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAndReturnSubLocationStmt( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptAndReturnSubLocationStmt( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.M_Usage.UsageType = "L"
   SetAttributeFromString( mMasLC, "M_Usage", "UsageType", "L" );
   //:   
   //:// Accept temporal Usage statement.
   //:AcceptSubobject( mMasLC, "M_Usage" )
   AcceptSubobject( mMasLC, "M_Usage" );
   //:ResetViewFromSubobject( mMasLC )
   ResetViewFromSubobject( mMasLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelSubsurfacesStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
CancelSubsurfacesStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Cancel temporal Usage statement.
   //:CancelSubobject( mMasLC, "M_Usage" )
   CancelSubobject( mMasLC, "M_Usage" );
   //:ResetViewFromSubobject( mMasLC )
   ResetViewFromSubobject( mMasLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelSubLocationStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
CancelSubLocationStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Cancel temporal Usage statement.
   //:CancelSubobject( mMasLC, "M_Usage" )
   CancelSubobject( mMasLC, "M_Usage" );
   //:ResetViewFromSubobject( mMasLC )
   ResetViewFromSubobject( mMasLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAddNewSubUsageStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptAddNewSubUsageStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.M_SubUsage.UsageType = "S"
   SetAttributeFromString( mMasLC, "M_SubUsage", "UsageType", "S" );
   //:   
   //:// Accept temporal Usage statement.
   //:nRC = AcceptSubobject( mMasLC, "M_SubUsage" )
   nRC = AcceptSubobject( mMasLC, "M_SubUsage" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Accept and Add New Usage Statement",
      //:             "Error saving surface statement.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Accept and Add New Usage Statement", "Error saving surface statement.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END
   //:CreateTemporalEntity( mMasLC, "M_SubUsage", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_SubUsage", zPOS_AFTER );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAddNewSubsurfaceStatement( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptAddNewSubsurfaceStatement( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.M_SubUsage.UsageType = "S"
   SetAttributeFromString( mMasLC, "M_SubUsage", "UsageType", "S" );
   //:   
   //:// Accept temporal Usage statement.
   //:nRC = AcceptSubobject( mMasLC, "M_Usage" )
   nRC = AcceptSubobject( mMasLC, "M_Usage" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Accept and Add New Surface Statement",
      //:             "Error saving subsurface statement.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Accept and Add New Surface Statement", "Error saving subsurface statement.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END
   //:CreateTemporalEntity( mMasLC, "M_Usage", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_Usage", zPOS_AFTER );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DeleteUsageGroupEntries( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
DeleteUsageGroupEntries( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Delete each selected Group and exclude the Group from the corresponding M_Usage entity.
   //:FOR EACH mMasLC.M_UsageGroup
   RESULT = SetCursorFirstEntity( mMasLC, "M_UsageGroup", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_UsageGroup.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_UsageGroup", "wSelected", "Y" ) == 0 )
      { 
         //:FOR EACH mMasLC.M_Usage
         RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF mMasLC.M_UsageUsageGroup EXISTS
            lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_UsageUsageGroup" );
            if ( lTempInteger_0 == 0 )
            { 
               //:IF mMasLC.M_UsageUsageGroup.Name = mMasLC.M_UsageGroup.Name
               if ( CompareAttributeToAttribute( mMasLC, "M_UsageUsageGroup", "Name", mMasLC, "M_UsageGroup", "Name" ) == 0 )
               { 
                  //:EXCLUDE mMasLC.M_UsageUsageGroup
                  RESULT = ExcludeEntity( mMasLC, "M_UsageUsageGroup", zREPOS_AFTER );
                  //:SET CURSOR FIRST mMasLC.M_UsageGroupUsage WHERE mMasLC.M_UsageGroupUsage.Name = mMasLC.M_Usage.Name
                  {StringBuilder sb_szTempString_0;
                  if ( szTempString_0 == null )
                     sb_szTempString_0 = new StringBuilder( 32 );
                  else
                     sb_szTempString_0 = new StringBuilder( szTempString_0 );
                                     GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_Usage", "Name" );
                  szTempString_0 = sb_szTempString_0.toString( );}
                  RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageGroupUsage", "Name", szTempString_0, "" );
                  //:EXCLUDE mMasLC.M_UsageGroupUsage NONE
                  RESULT = ExcludeEntity( mMasLC, "M_UsageGroupUsage", zREPOS_NONE );
                  //:DELETE ENTITY mMasLC.M_Usage NONE
                  RESULT = DeleteEntity( mMasLC, "M_Usage", zREPOS_NONE );
               } 

               //:END
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
            //:END
         } 

         //:END
         //:DELETE ENTITY  mMasLC.M_UsageGroup NONE
         RESULT = DeleteEntity( mMasLC, "M_UsageGroup", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_UsageGroup", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:COPY_UsageKeywordAndText( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
COPY_UsageKeywordAndText( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Copy the current Usage Keyword subobject to the Keyword work subobject.

   //:// First delete any current copy entry.
   //:FOR EACH mMasLC.CopyM_InsertTextKeyword
   RESULT = SetCursorFirstEntity( mMasLC, "CopyM_InsertTextKeyword", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mMasLC.CopyM_InsertTextKeyword NONE
      RESULT = DeleteEntity( mMasLC, "CopyM_InsertTextKeyword", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mMasLC, "CopyM_InsertTextKeyword", "" );
   } 

   //:END

   //:// Copy in the current subobject.
   //:CREATE ENTITY mMasLC.CopyM_InsertTextKeyword
   RESULT = CreateEntity( mMasLC, "CopyM_InsertTextKeyword", zPOS_AFTER );
   //:SetMatchingAttributesByName( mMasLC, "CopyM_InsertTextKeyword", mMasLC, "M_InsertTextKeywordUsage", zSET_NULL )
   SetMatchingAttributesByName( mMasLC, "CopyM_InsertTextKeyword", mMasLC, "M_InsertTextKeywordUsage", zSET_NULL );
   //:FOR EACH mMasLC.M_InsertTextUsage
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.CopyM_InsertText
      RESULT = CreateEntity( mMasLC, "CopyM_InsertText", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "CopyM_InsertText", mMasLC, "M_InsertTextUsage", zSET_NULL )
      SetMatchingAttributesByName( mMasLC, "CopyM_InsertText", mMasLC, "M_InsertTextUsage", zSET_NULL );
      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextUsage", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:PASTE_UsageKeywordAndText( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
PASTE_UsageKeywordAndText( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Copy the Keyword work subobject to create a new CopyM_InsertTextKeyword subobject.

   //:IF mMasLC.CopyM_InsertTextKeyword DOES NOT EXIST
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "CopyM_InsertTextKeyword" );
   if ( lTempInteger_0 != 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Paste Usage Keyword",
      //:             "No current Keyword Copy exists.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Paste Usage Keyword", "No current Keyword Copy exists.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:// Copy in the current copy subobject.
   //:CREATE ENTITY mMasLC.M_InsertTextKeywordUsage
   RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordUsage", zPOS_AFTER );
   //:SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordUsage", mMasLC, "CopyM_InsertTextKeyword", zSET_NULL )
   SetMatchingAttributesByName( mMasLC, "M_InsertTextKeywordUsage", mMasLC, "CopyM_InsertTextKeyword", zSET_NULL );
   //:FOR EACH mMasLC.CopyM_InsertText
   RESULT = SetCursorFirstEntity( mMasLC, "CopyM_InsertText", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.M_InsertTextUsage
      RESULT = CreateEntity( mMasLC, "M_InsertTextUsage", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC, "M_InsertTextUsage", mMasLC, "CopyM_InsertText", zSET_NULL )
      SetMatchingAttributesByName( mMasLC, "M_InsertTextUsage", mMasLC, "CopyM_InsertText", zSET_NULL );
      RESULT = SetCursorNextEntity( mMasLC, "CopyM_InsertText", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_CopyMLC_Version( VIEW ViewToWindow )

//:   VIEW mMasProd  REGISTERED AS mMasProd
public int 
GOTO_CopyMLC_Version( View     ViewToWindow )
{
   zVIEW    mMasProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW wWebXfer  REGISTERED AS wWebXfer
   zVIEW    wWebXfer = new zVIEW( );
   //:VIEW mMasLCNew BASED ON LOD  mMasLC
   zVIEW    mMasLCNew = new zVIEW( );

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );

   //:// Initialize a new MLC for Copy.
   //:ACTIVATE mMasLCNew EMPTY
   RESULT = ActivateEmptyObjectInstance( mMasLCNew, "mMasLC", ViewToWindow, zSINGLE );
   //:NAME VIEW mMasLCNew "mMasLC"
   SetNameForView( mMasLCNew, "mMasLC", null, zLEVEL_TASK );
   //:CREATE ENTITY mMasLCNew.MasterLabelContent
   RESULT = CreateEntity( mMasLCNew, "MasterLabelContent", zPOS_AFTER );
   //:INCLUDE mMasLCNew.MasterProduct FROM mMasProd.MasterProduct
   RESULT = IncludeSubobjectFromSubobject( mMasLCNew, "MasterProduct", mMasProd, "MasterProduct", zPOS_AFTER );
   //:mMasLCNew.MasterLabelContent.Finalized        = "W"
   SetAttributeFromString( mMasLCNew, "MasterLabelContent", "Finalized", "W" );
   //:mMasLCNew.MasterLabelContent.RevisionDate     = wWebXfer.Root.dCurrentDateTime
   SetAttributeFromAttribute( mMasLCNew, "MasterLabelContent", "RevisionDate", wWebXfer, "Root", "dCurrentDateTime" );
   //:mMasLCNew.MasterLabelContent.CreatedDateTime  = wWebXfer.Root.dCurrentDateTime
   SetAttributeFromAttribute( mMasLCNew, "MasterLabelContent", "CreatedDateTime", wWebXfer, "Root", "dCurrentDateTime" );
   //:mMasLCNew.MasterLabelContent.ModifiedDateTime = wWebXfer.Root.dCurrentDateTime
   SetAttributeFromAttribute( mMasLCNew, "MasterLabelContent", "ModifiedDateTime", wWebXfer, "Root", "dCurrentDateTime" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:InitAddItems( VIEW ViewToWindow )

//:   VIEW wWebXfer REGISTERED AS wWebXfer
public int 
InitAddItems( View     ViewToWindow )
{
   zVIEW    wWebXfer = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );

   //:wWebXfer.Root.String = "\r\n"
   SetAttributeFromString( wWebXfer, "Root", "String", "\\r\\n" );
   //:wWebXfer.Root.Note = ","
   SetAttributeFromString( wWebXfer, "Root", "Note", "," );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AddUpdateNetContents( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AddUpdateNetContents( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:IF mMasLC.NetContents EXISTS
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "NetContents" );
   if ( lTempInteger_0 == 0 )
   { 
      //:CreateTemporalSubobjectVersion( mMasLC, "NetContents" )
      CreateTemporalSubobjectVersion( mMasLC, "NetContents" );
      //:ELSE
   } 
   else
   { 
      //:CreateTemporalEntity( mMasLC, "NetContents", zPOS_AFTER )
      CreateTemporalEntity( mMasLC, "NetContents", zPOS_AFTER );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SaveNetContents( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
SaveNetContents( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   //:   
   //:// Accept temporal NetContents.
   //:AcceptSubobject( mMasLC, "NetContents" )
   AcceptSubobject( mMasLC, "NetContents" );
   //:COMMIT mMasLC
   RESULT = CommitObjectInstance( mMasLC );
   return( 0 );
//    
// END
} 


//:DIALOG OPERATION
//:SaveTOC( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
SaveTOC( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:COMMIT mMasLC
   RESULT = CommitObjectInstance( mMasLC );
   return( 0 );
//    
// END
} 


//:DIALOG OPERATION
//:AttemptDecipheredEntry( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AttemptDecipheredEntry( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:STRING ( 2048 ) szName
   String   szName = null;
   //:STRING ( 256 ) szKeyword
   String   szKeyword = null;
   //:STRING ( 256 ) szKeyValue
   String   szKeyValue = null;
   //:SHORT  nRC
   int      nRC = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   //:   
   //:// Try to decipher the Keyword and the Text
   //:szName = mMasLC.M_Usage.Name
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szName;
   if ( szName == null )
      sb_szName = new StringBuilder( 32 );
   else
      sb_szName = new StringBuilder( szName );
       GetVariableFromAttribute( sb_szName, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_Usage", "Name", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szName = sb_szName.toString( );}
   //:nRC = DecipherUsageKeyword( szName, "{(", ")}", szKeyword, 256, szKeyValue, 256 )
   {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( ViewToWindow );
    {StringBuilder sb_szKeyValue;
   if ( szKeyValue == null )
      sb_szKeyValue = new StringBuilder( 32 );
   else
      sb_szKeyValue = new StringBuilder( szKeyValue );
   StringBuilder sb_szKeyword;
   if ( szKeyword == null )
      sb_szKeyword = new StringBuilder( 32 );
   else
      sb_szKeyword = new StringBuilder( szKeyword );
   StringBuilder sb_szName;
   if ( szName == null )
      sb_szName = new StringBuilder( 32 );
   else
      sb_szName = new StringBuilder( szName );
       nRC = m_ZGlobal1_Operation.DecipherUsageKeyword( sb_szName, "{(", ")}", sb_szKeyword, 256, sb_szKeyValue, 256 );
   szKeyValue = sb_szKeyValue.toString( );
   szKeyword = sb_szKeyword.toString( );
   szName = sb_szName.toString( );}
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   }
   //:IF nRC = 0
   if ( nRC == 0 )
   { 
      //:// Create Usage Keyword and one subordinate text entity.
      //:CREATE ENTITY mMasLC.M_InsertTextKeywordUsage
      RESULT = CreateEntity( mMasLC, "M_InsertTextKeywordUsage", zPOS_AFTER );
      //:CREATE ENTITY mMasLC.M_InsertTextUsage
      RESULT = CreateEntity( mMasLC, "M_InsertTextUsage", zPOS_AFTER );
      //:mMasLC.M_Usage.Name = szName
      SetAttributeFromString( mMasLC, "M_Usage", "Name", szName );
      //:mMasLC.M_InsertTextKeywordUsage.Name = szKeyword
      SetAttributeFromString( mMasLC, "M_InsertTextKeywordUsage", "Name", szKeyword );
      //:mMasLC.M_InsertTextUsage.Text = szKeyValue
      SetAttributeFromString( mMasLC, "M_InsertTextUsage", "Text", szKeyValue );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AttemptEmbedKeywords( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AttemptEmbedKeywords( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:AttemptDecipheredEntry( ViewToWindow )
      AttemptDecipheredEntry( ViewToWindow );
      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SaveMarketingSection( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
SaveMarketingSection( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   //:   
   //:// Accept temporal NetContents.
   //:AcceptSubobject( mMasLC, "M_MarketingSection" )
   AcceptSubobject( mMasLC, "M_MarketingSection" );
   //:COMMIT mMasLC
   RESULT = CommitObjectInstance( mMasLC );
   return( 0 );
//    
// END
} 


//:DIALOG OPERATION
//:SaveMarketingSectionVersion( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
SaveMarketingSectionVersion( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Accept temporal NetContents.
   //:AcceptSubobject( mMasLC, "M_MarketingSection" )
   AcceptSubobject( mMasLC, "M_MarketingSection" );
   //:COMMIT mMasLC
   RESULT = CommitObjectInstance( mMasLC );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_MarketingSection" )
   CreateTemporalSubobjectVersion( mMasLC, "M_MarketingSection" );
   return( 0 );
//    
// END
} 


//:DIALOG OPERATION
//:PositionOnSubUsage( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
PositionOnSubUsage( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:SetViewToSubobject( mMasLC, "M_SubUsage" )
   SetViewToSubobject( mMasLC, "M_SubUsage" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_Usage" )
   CreateTemporalSubobjectVersion( mMasLC, "M_Usage" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ParseMarketingStatementText( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
ParseMarketingStatementText( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   //:ParseStatementForKeywords( mMasLC, "M_MarketingStatement", "Text",
   //:                           "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", "{}" )
   {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
    m_ZGlobal1_Operation.ParseStatementForKeywords( mMasLC, "M_MarketingStatement", "Text", "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", "{}" );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_StorageDispSubStatementAdd( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_StorageDispSubStatementAdd( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// We are creating the new temporal entity in this operation, rather than as auto action, so that
   //:// the NotForUseType attribute can be set, since it's currently required in the database.
   //:SetViewToSubobject( mMasLC, "M_StorageDisposalSubStatement" )
   SetViewToSubobject( mMasLC, "M_StorageDisposalSubStatement" );
   //:CreateTemporalEntity( mMasLC, "M_StorageDisposalStatement", zPOS_LAST )
   CreateTemporalEntity( mMasLC, "M_StorageDisposalStatement", zPOS_LAST );
   //:mMasLC.M_StorageDisposalStatement.NotForUseType = "NA"
   SetAttributeFromString( mMasLC, "M_StorageDisposalStatement", "NotForUseType", "NA" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_StorageDispSubStmtUpdate( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_StorageDispSubStmtUpdate( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:SetViewToSubobject( mMasLC, "M_StorageDisposalSubStatement" )
   SetViewToSubobject( mMasLC, "M_StorageDisposalSubStatement" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_StorageDisposalStatement" )
   CreateTemporalSubobjectVersion( mMasLC, "M_StorageDisposalStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DirsForUseCategoryDelete( VIEW ViewToWindow )

//:   VIEW mMasLC   REGISTERED AS mMasLC
public int 
GOTO_DirsForUseCategoryDelete( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.MasterLabelContent.wDeleteType       = "Directions For Use Category"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteType", "Directions For Use Category" );
   //:mMasLC.MasterLabelContent.wDeleteText       = mMasLC.M_DirectionsForUseCategory.Name
   SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "wDeleteText", mMasLC, "M_DirectionsForUseCategory", "Name" );
   //:mMasLC.MasterLabelContent.wDeleteEntityName = "M_DirectionsForUseCategory"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wDeleteEntityName", "M_DirectionsForUseCategory" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptStorDispSubStmt( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptStorDispSubStmt( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = AcceptSubobject( mMasLC, "M_StorageDisposalStatement" )
   nRC = AcceptSubobject( mMasLC, "M_StorageDisposalStatement" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Accept Storage and Disposal Sub-statement",
      //:             "The Storage and Disposal Statement contains errors.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Accept Storage and Disposal Sub-statement", "The Storage and Disposal Statement contains errors.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN nRC
      if(8==8)return( nRC );
   } 

   //:END
   //:ResetViewFromSubobject( mMasLC )
   ResetViewFromSubobject( mMasLC );
   return( 0 );
//    
// END
} 


//:DIALOG OPERATION
//:CancelStorDispSubStmt( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
CancelStorDispSubStmt( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:nRC = CancelSubobject( mMasLC, "M_StorageDisposalStatement" )
   nRC = CancelSubobject( mMasLC, "M_StorageDisposalStatement" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Cancel Storage and Disposal Sub-statement",
      //:             "The Storage and Disposal Statement contains errors.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Cancel Storage and Disposal Sub-statement", "The Storage and Disposal Statement contains errors.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN nRC
      if(8==8)return( nRC );
   } 

   //:END
   //:ResetViewFromSubobject( mMasLC )
   ResetViewFromSubobject( mMasLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:IncludeExclusiveOrDU_Section( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
IncludeExclusiveOrDU_Section( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLCIncludeExclude REGISTERED AS mMasLCIncludeExclude
   zVIEW    mMasLCIncludeExclude = new zVIEW( );
   //:STRING ( 256 ) szNameXOR
   String   szNameXOR = null;
   //:STRING ( 256 ) szNameCurrent
   String   szNameCurrent = null;
   //:STRING ( 256 ) szNameTarget
   String   szNameTarget = null;
   //:STRING ( 512 ) szMsg
   String   szMsg = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   int      lTempInteger_5 = 0;
   int      lTempInteger_6 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLCIncludeExclude, "mMasLCIncludeExclude", ViewToWindow, zLEVEL_TASK );

   //:szNameXOR = mMasLC.DFU_SectionNames.Name
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szNameXOR;
   if ( szNameXOR == null )
      sb_szNameXOR = new StringBuilder( 32 );
   else
      sb_szNameXOR = new StringBuilder( szNameXOR );
       GetVariableFromAttribute( sb_szNameXOR, mi_lTempInteger_0, 'S', 257, mMasLC, "DFU_SectionNames", "Name", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szNameXOR = sb_szNameXOR.toString( );}
   //:TraceLineS( "Attempt to include DFU Section: ", szNameXOR )
   TraceLineS( "Attempt to include DFU Section: ", szNameXOR );

   //:// For the moment, we do not permit "XOR Chaining" ... e.g. A XOR B XOR C XOR A.  Not sure we need it ...
   //:IF szNameXOR != ""
   if ( ZeidonStringCompare( szNameXOR, 1, 0, "", 1, 0, 257 ) != 0 )
   { 
      //:SetCursorFirstEntityByString( mMasLCIncludeExclude, "M_DirectionsForUseSection", "Name", szNameXOR, "" )
      SetCursorFirstEntityByString( mMasLCIncludeExclude, "M_DirectionsForUseSection", "Name", szNameXOR, "" );
      //:IF mMasLCIncludeExclude.M_DirectionsForUseXORSection EXISTS
      lTempInteger_1 = CheckExistenceOfEntity( mMasLCIncludeExclude, "M_DirectionsForUseXORSection" );
      if ( lTempInteger_1 == 0 )
      { 
         //:szNameCurrent = mMasLC.M_DirectionsForUseSection.Name
         {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
         StringBuilder sb_szNameCurrent;
         if ( szNameCurrent == null )
            sb_szNameCurrent = new StringBuilder( 32 );
         else
            sb_szNameCurrent = new StringBuilder( szNameCurrent );
                   GetVariableFromAttribute( sb_szNameCurrent, mi_lTempInteger_2, 'S', 257, mMasLC, "M_DirectionsForUseSection", "Name", "", 0 );
         lTempInteger_2 = mi_lTempInteger_2.intValue( );
         szNameCurrent = sb_szNameCurrent.toString( );}
         //:szNameTarget = mMasLCIncludeExclude.M_DirectionsForUseXORSection.Name
         {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
         StringBuilder sb_szNameTarget;
         if ( szNameTarget == null )
            sb_szNameTarget = new StringBuilder( 32 );
         else
            sb_szNameTarget = new StringBuilder( szNameTarget );
                   GetVariableFromAttribute( sb_szNameTarget, mi_lTempInteger_3, 'S', 257, mMasLCIncludeExclude, "M_DirectionsForUseXORSection", "Name", "", 0 );
         lTempInteger_3 = mi_lTempInteger_3.intValue( );
         szNameTarget = sb_szNameTarget.toString( );}
         //:IF szNameCurrent = szNameTarget
         if ( ZeidonStringCompare( szNameCurrent, 1, 0, szNameTarget, 1, 0, 257 ) == 0 )
         { 
            //:IF mMasLCIncludeExclude.M_DirectionsForUseXORSection EXISTS
            lTempInteger_4 = CheckExistenceOfEntity( mMasLCIncludeExclude, "M_DirectionsForUseXORSection" );
            if ( lTempInteger_4 == 0 )
            { 
               //:EXCLUDE mMasLCIncludeExclude.M_DirectionsForUseXORSection NONE
               RESULT = ExcludeEntity( mMasLCIncludeExclude, "M_DirectionsForUseXORSection", zREPOS_NONE );
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szMsg = szNameXOR + ": Already exclusive to section: "
             {StringBuilder sb_szMsg;
            if ( szMsg == null )
               sb_szMsg = new StringBuilder( 32 );
            else
               sb_szMsg = new StringBuilder( szMsg );
                        ZeidonStringCopy( sb_szMsg, 1, 0, szNameXOR, 1, 0, 513 );
            szMsg = sb_szMsg.toString( );}
             {StringBuilder sb_szMsg;
            if ( szMsg == null )
               sb_szMsg = new StringBuilder( 32 );
            else
               sb_szMsg = new StringBuilder( szMsg );
                        ZeidonStringConcat( sb_szMsg, 1, 0, ": Already exclusive to section: ", 1, 0, 513 );
            szMsg = sb_szMsg.toString( );}
            //:szMsg = szMsg + szNameTarget
             {StringBuilder sb_szMsg;
            if ( szMsg == null )
               sb_szMsg = new StringBuilder( 32 );
            else
               sb_szMsg = new StringBuilder( szMsg );
                        ZeidonStringConcat( sb_szMsg, 1, 0, szNameTarget, 1, 0, 513 );
            szMsg = sb_szMsg.toString( );}
            //:MessageSend( ViewToWindow, "", "Directions for Use Section", szMsg,
            //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
            MessageSend( ViewToWindow, "", "Directions for Use Section", szMsg, zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
            //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
            m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
            //:RETURN 2
            if(8==8)return( 2 );
         } 

         //:END
      } 

      //:END
      //:IF mMasLC.M_DirectionsForUseXORSection EXISTS
      lTempInteger_5 = CheckExistenceOfEntity( mMasLC, "M_DirectionsForUseXORSection" );
      if ( lTempInteger_5 == 0 )
      { 
         //:EXCLUDE mMasLC.M_DirectionsForUseXORSection NONE
         RESULT = ExcludeEntity( mMasLC, "M_DirectionsForUseXORSection", zREPOS_NONE );
      } 

      //:END

      //:INCLUDE mMasLC.M_DirectionsForUseXORSection FROM mMasLCIncludeExclude.M_DirectionsForUseSection 
      RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_DirectionsForUseXORSection", mMasLCIncludeExclude, "M_DirectionsForUseSection", zPOS_AFTER );
      //:INCLUDE mMasLCIncludeExclude.M_DirectionsForUseXORSection FROM mMasLC.M_DirectionsForUseSection 
      RESULT = IncludeSubobjectFromSubobject( mMasLCIncludeExclude, "M_DirectionsForUseXORSection", mMasLC, "M_DirectionsForUseSection", zPOS_AFTER );
      //:ELSE
   } 
   else
   { 
      //:IF mMasLC.M_DirectionsForUseXORSection EXISTS
      lTempInteger_6 = CheckExistenceOfEntity( mMasLC, "M_DirectionsForUseXORSection" );
      if ( lTempInteger_6 == 0 )
      { 
         //:EXCLUDE mMasLC.M_DirectionsForUseXORSection NONE
         RESULT = ExcludeEntity( mMasLC, "M_DirectionsForUseXORSection", zREPOS_NONE );
      } 

      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:LOCAL OPERATION
//:BuildDFU_CategoryNameList( VIEW mMasLC )

//:   VIEW mMasLCIncludeExclude REGISTERED AS mMasLCIncludeExclude
private int 
o_BuildDFU_CategoryNameList( View     mMasLC )
{
   zVIEW    mMasLCIncludeExclude = new zVIEW( );
   int      RESULT = 0;
   //:STRING ( 256 ) szCurrentName
   String   szCurrentName = null;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLCIncludeExclude, "mMasLCIncludeExclude", mMasLC, zLEVEL_TASK );

   //:FOR EACH mMasLC.DFU_CategoryNames
   RESULT = SetCursorFirstEntity( mMasLC, "DFU_CategoryNames", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mMasLC.DFU_CategoryNames NONE
      RESULT = DeleteEntity( mMasLC, "DFU_CategoryNames", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mMasLC, "DFU_CategoryNames", "" );
   } 

   //:END
   //:FOR EACH mMasLCIncludeExclude.M_DirectionsForUseCategory
   RESULT = SetCursorFirstEntity( mMasLCIncludeExclude, "M_DirectionsForUseCategory", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:szCurrentName = mMasLCIncludeExclude.M_DirectionsForUseCategory.Name
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
      StringBuilder sb_szCurrentName;
      if ( szCurrentName == null )
         sb_szCurrentName = new StringBuilder( 32 );
      else
         sb_szCurrentName = new StringBuilder( szCurrentName );
             GetVariableFromAttribute( sb_szCurrentName, mi_lTempInteger_0, 'S', 257, mMasLCIncludeExclude, "M_DirectionsForUseCategory", "Name", "", 0 );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );
      szCurrentName = sb_szCurrentName.toString( );}
      //:CREATE ENTITY mMasLC.DFU_CategoryNames
      RESULT = CreateEntity( mMasLC, "DFU_CategoryNames", zPOS_AFTER );
      //:mMasLC.DFU_CategoryNames.Name = szCurrentName
      SetAttributeFromString( mMasLC, "DFU_CategoryNames", "Name", szCurrentName );
      RESULT = SetCursorNextEntity( mMasLCIncludeExclude, "M_DirectionsForUseCategory", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:LOCAL OPERATION
//:BuildDFU_SectionNameList( VIEW mMasLC, STRING ( 256 ) szSectionName )

//:   VIEW mMasLCIncludeExclude REGISTERED AS mMasLCIncludeExclude
private int 
o_BuildDFU_SectionNameList( View     mMasLC,
                            String   szSectionName )
{
   zVIEW    mMasLCIncludeExclude = new zVIEW( );
   int      RESULT = 0;
   //:STRING ( 256 ) szCurrentName
   String   szCurrentName = null;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLCIncludeExclude, "mMasLCIncludeExclude", mMasLC, zLEVEL_TASK );

   //:SetViewFromView( mMasLCIncludeExclude, mMasLC )
   SetViewFromView( mMasLCIncludeExclude, mMasLC );
   //:FOR EACH mMasLC.DFU_SectionNames
   RESULT = SetCursorFirstEntity( mMasLC, "DFU_SectionNames", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mMasLC.DFU_SectionNames NONE
      RESULT = DeleteEntity( mMasLC, "DFU_SectionNames", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mMasLC, "DFU_SectionNames", "" );
   } 

   //:END
   //:CREATE ENTITY mMasLC.DFU_SectionNames  // entry for blank section name
   RESULT = CreateEntity( mMasLC, "DFU_SectionNames", zPOS_AFTER );
   //:FOR EACH mMasLCIncludeExclude.M_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( mMasLCIncludeExclude, "M_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:szCurrentName = mMasLCIncludeExclude.M_DirectionsForUseSection.Name
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
      StringBuilder sb_szCurrentName;
      if ( szCurrentName == null )
         sb_szCurrentName = new StringBuilder( 32 );
      else
         sb_szCurrentName = new StringBuilder( szCurrentName );
             GetVariableFromAttribute( sb_szCurrentName, mi_lTempInteger_0, 'S', 257, mMasLCIncludeExclude, "M_DirectionsForUseSection", "Name", "", 0 );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );
      szCurrentName = sb_szCurrentName.toString( );}
      //:IF szCurrentName != szSectionName
      if ( ZeidonStringCompare( szCurrentName, 1, 0, szSectionName, 1, 0, 257 ) != 0 )
      { 
         //:CREATE ENTITY mMasLC.DFU_SectionNames
         RESULT = CreateEntity( mMasLC, "DFU_SectionNames", zPOS_AFTER );
         //:mMasLC.DFU_SectionNames.Name = szCurrentName
         SetAttributeFromString( mMasLC, "DFU_SectionNames", "Name", szCurrentName );
      } 

      RESULT = SetCursorNextEntity( mMasLCIncludeExclude, "M_DirectionsForUseSection", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptDFU_KeywordGoNext( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptDFU_KeywordGoNext( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_InsertTextKeywordDU" )
   AcceptSubobject( mMasLC, "M_InsertTextKeywordDU" );
   //:SetCursorNextEntity( mMasLC, "M_InsertTextKeywordDU", "" )
   SetCursorNextEntity( mMasLC, "M_InsertTextKeywordDU", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_InsertTextKeywordDU" )
   CreateTemporalSubobjectVersion( mMasLC, "M_InsertTextKeywordDU" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptDFU_KeywordGoPrev( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptDFU_KeywordGoPrev( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_InsertTextKeywordDU" )
   AcceptSubobject( mMasLC, "M_InsertTextKeywordDU" );
   //:SetCursorPrevEntity( mMasLC, "M_InsertTextKeywordDU", "" )
   SetCursorPrevEntity( mMasLC, "M_InsertTextKeywordDU", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_InsertTextKeywordDU" )
   CreateTemporalSubobjectVersion( mMasLC, "M_InsertTextKeywordDU" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptAddNewDU_SectionKeyword( VIEW ViewToWindow )

//:   VIEW  mMasLC   REGISTERED AS mMasLC
public int 
AcceptAddNewDU_SectionKeyword( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Accept Direction for Use Statement and add new temporal one.
   //:nRC = AcceptSubobject( mMasLC, "M_InsertTextKeywordSectionDU" ) 
   nRC = AcceptSubobject( mMasLC, "M_InsertTextKeywordSectionDU" );
   //:IF nRC < 0
   if ( nRC < 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Accept and Add New Directions for Use Section Keyword",
      //:             "Error saving Directions for Use Section Keyword.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Accept and Add New Directions for Use Section Keyword", "Error saving Directions for Use Section Keyword.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:CreateTemporalEntity( mMasLC, "M_InsertTextKeywordSectionDU", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_InsertTextKeywordSectionDU", zPOS_AFTER );
   //:mMasLC.M_InsertTextKeywordSectionDU.Type = "A"
   SetAttributeFromString( mMasLC, "M_InsertTextKeywordSectionDU", "Type", "A" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptMarketingStatementGoNext( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptMarketingStatementGoNext( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_MarketingStatement" )
   AcceptSubobject( mMasLC, "M_MarketingStatement" );
   //:SetCursorNextEntity( mMasLC, "M_MarketingStatement", "" )
   SetCursorNextEntity( mMasLC, "M_MarketingStatement", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_MarketingStatement" )
   CreateTemporalSubobjectVersion( mMasLC, "M_MarketingStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptMarketingStatementGoPrev( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptMarketingStatementGoPrev( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_MarketingStatement" )
   AcceptSubobject( mMasLC, "M_MarketingStatement" );
   //:SetCursorPrevEntity( mMasLC, "M_MarketingStatement", "" )
   SetCursorPrevEntity( mMasLC, "M_MarketingStatement", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_MarketingStatement" )
   CreateTemporalSubobjectVersion( mMasLC, "M_MarketingStatement" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptMarketingSectionGoNext( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptMarketingSectionGoNext( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_MarketingSection" )
   AcceptSubobject( mMasLC, "M_MarketingSection" );
   //:SetCursorNextEntity( mMasLC, "M_MarketingSection", "" )
   SetCursorNextEntity( mMasLC, "M_MarketingSection", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_MarketingSection" )
   CreateTemporalSubobjectVersion( mMasLC, "M_MarketingSection" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptMarketingSectionGoPrev( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AcceptMarketingSectionGoPrev( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:AcceptSubobject( mMasLC, "M_MarketingSection" )
   AcceptSubobject( mMasLC, "M_MarketingSection" );
   //:SetCursorPrevEntity( mMasLC, "M_MarketingSection", "" )
   SetCursorPrevEntity( mMasLC, "M_MarketingSection", "" );
   //:CreateTemporalSubobjectVersion( mMasLC, "M_MarketingSection" )
   CreateTemporalSubobjectVersion( mMasLC, "M_MarketingSection" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelTableUpdate( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
CancelTableUpdate( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW wWebXfer REGISTERED AS wWebXfer
   zVIEW    wWebXfer = new zVIEW( );

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );

   //:FOR EACH wWebXfer.Work
   RESULT = SetCursorFirstEntity( wWebXfer, "Work", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY wWebXfer.Work NONE
      RESULT = DeleteEntity( wWebXfer, "Work", zREPOS_NONE );
      RESULT = SetCursorNextEntity( wWebXfer, "Work", "" );
   } 

   //:END
   //:CancelSubobject( mMasLC, "M_MetaTable" )
   CancelSubobject( mMasLC, "M_MetaTable" );
   return( 0 );
// END
} 


//:LOCAL OPERATION
//:SetCursorNextWithData( VIEW wWebXfer,
//:                       STRING ( 256 ) szText )

//:   INTEGER nRC
private int 
o_SetCursorNextWithData( View     wWebXfer,
                         StringBuilder   szText )
{
   int      nRC = 0;


   //:nRC = zCURSOR_SET
   nRC = zCURSOR_SET;
   //:LOOP WHILE nRC >= zCURSOR_SET
   while ( nRC >= zCURSOR_SET )
   { 
      //:nRC = SetCursorNextEntity( wWebXfer, "Work", "" )
      nRC = SetCursorNextEntity( wWebXfer, "Work", "" );
      //:IF nRC >= zCURSOR_SET
      if ( nRC >= zCURSOR_SET )
      { 
         //:GetStringFromAttribute( szText, wWebXfer, "Work", "Text" )
         GetStringFromAttribute( szText, wWebXfer, "Work", "Text" );
         //:IF szText != ""
         if ( ZeidonStringCompare( szText.toString( ), 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:RETURN nRC
            if(8==8)return( nRC );
         } 

         //:END
      } 

      //:END
   } 

   //:END
   //:RETURN -1
   return( -1 );
// END
} 


//:DIALOG OPERATION
//:SaveTableColumns( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
SaveTableColumns( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW wWebXfer REGISTERED AS wWebXfer
   zVIEW    wWebXfer = new zVIEW( );
   //:STRING ( 256 ) szText
   String   szText = null;
   //:SHORT  nCnt
   int      nCnt = 0;
   //:SHORT  nRC
   int      nRC = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );

   //:mMasLC.M_MetaTable.Title1 = ""
   SetAttributeFromString( mMasLC, "M_MetaTable", "Title1", "" );
   //:mMasLC.M_MetaTable.Title2 = ""
   SetAttributeFromString( mMasLC, "M_MetaTable", "Title2", "" );
   //:mMasLC.M_MetaTable.Title3 = ""
   SetAttributeFromString( mMasLC, "M_MetaTable", "Title3", "" );
   //:mMasLC.M_MetaTable.Title4 = ""
   SetAttributeFromString( mMasLC, "M_MetaTable", "Title4", "" );
   //:mMasLC.M_MetaTable.Title5 = ""
   SetAttributeFromString( mMasLC, "M_MetaTable", "Title5", "" );
   //:mMasLC.M_MetaTable.Title6 = ""
   SetAttributeFromString( mMasLC, "M_MetaTable", "Title6", "" );
   //:mMasLC.M_MetaTable.Title7 = ""
   SetAttributeFromString( mMasLC, "M_MetaTable", "Title7", "" );
   //:mMasLC.M_MetaTable.Title8 = ""
   SetAttributeFromString( mMasLC, "M_MetaTable", "Title8", "" );
   //:mMasLC.M_MetaTable.Title9 = ""
   SetAttributeFromString( mMasLC, "M_MetaTable", "Title9", "" );
   //:mMasLC.M_MetaTable.Title10 = ""
   SetAttributeFromString( mMasLC, "M_MetaTable", "Title10", "" );

   //:nCnt = 0
   nCnt = 0;
   //:nRC = SetCursorFirstEntity( wWebXfer, "Work", "" )
   nRC = SetCursorFirstEntity( wWebXfer, "Work", "" );
   //:IF nRC >= zCURSOR_SET
   if ( nRC >= zCURSOR_SET )
   { 
      //:szText = wWebXfer.Work.Text
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
      StringBuilder sb_szText;
      if ( szText == null )
         sb_szText = new StringBuilder( 32 );
      else
         sb_szText = new StringBuilder( szText );
             GetVariableFromAttribute( sb_szText, mi_lTempInteger_0, 'S', 257, wWebXfer, "Work", "Text", "", 0 );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );
      szText = sb_szText.toString( );}
      //:IF szText = ""
      if ( ZeidonStringCompare( szText, 1, 0, "", 1, 0, 257 ) == 0 )
      { 
         //:nRC = SetCursorNextWithData( wWebXfer, szText )
         {StringBuilder sb_szText;
         if ( szText == null )
            sb_szText = new StringBuilder( 32 );
         else
            sb_szText = new StringBuilder( szText );
                   nRC = o_SetCursorNextWithData( wWebXfer, sb_szText );
         szText = sb_szText.toString( );}
         //:IF nRC >= zCURSOR_SET 
         if ( nRC >= zCURSOR_SET )
         { 
            //:nCnt = 1
            nCnt = 1;
            //:mMasLC.M_MetaTable.Title1 = szText
            SetAttributeFromString( mMasLC, "M_MetaTable", "Title1", szText );
         } 

         //:END
         //:ELSE
      } 
      else
      { 
         //:nCnt = 1
         nCnt = 1;
         //:mMasLC.M_MetaTable.Title1 = szText
         SetAttributeFromString( mMasLC, "M_MetaTable", "Title1", szText );
      } 

      //:END
   } 

   //:END

   //:// Indentation below is whacked for readability.
   //:nRC = SetCursorNextWithData( wWebXfer, szText )
   {StringBuilder sb_szText;
   if ( szText == null )
      sb_szText = new StringBuilder( 32 );
   else
      sb_szText = new StringBuilder( szText );
       nRC = o_SetCursorNextWithData( wWebXfer, sb_szText );
   szText = sb_szText.toString( );}
   //:IF nRC >= zCURSOR_SET
   if ( nRC >= zCURSOR_SET )
   { 
      //:nCnt = 2
      nCnt = 2;
      //:mMasLC.M_MetaTable.Title2 = szText
      SetAttributeFromString( mMasLC, "M_MetaTable", "Title2", szText );
      //:nRC = SetCursorNextWithData( wWebXfer, szText )
      {StringBuilder sb_szText;
      if ( szText == null )
         sb_szText = new StringBuilder( 32 );
      else
         sb_szText = new StringBuilder( szText );
             nRC = o_SetCursorNextWithData( wWebXfer, sb_szText );
      szText = sb_szText.toString( );}
      //:IF nRC >= zCURSOR_SET
      if ( nRC >= zCURSOR_SET )
      { 
         //:nCnt = 3
         nCnt = 3;
         //:mMasLC.M_MetaTable.Title3 = szText
         SetAttributeFromString( mMasLC, "M_MetaTable", "Title3", szText );
         //:nRC = SetCursorNextWithData( wWebXfer, szText )
         {StringBuilder sb_szText;
         if ( szText == null )
            sb_szText = new StringBuilder( 32 );
         else
            sb_szText = new StringBuilder( szText );
                   nRC = o_SetCursorNextWithData( wWebXfer, sb_szText );
         szText = sb_szText.toString( );}
         //:IF nRC >= zCURSOR_SET
         if ( nRC >= zCURSOR_SET )
         { 
            //:nCnt = 4
            nCnt = 4;
            //:mMasLC.M_MetaTable.Title4 = szText
            SetAttributeFromString( mMasLC, "M_MetaTable", "Title4", szText );
            //:nRC = SetCursorNextWithData( wWebXfer, szText )
            {StringBuilder sb_szText;
            if ( szText == null )
               sb_szText = new StringBuilder( 32 );
            else
               sb_szText = new StringBuilder( szText );
                         nRC = o_SetCursorNextWithData( wWebXfer, sb_szText );
            szText = sb_szText.toString( );}
            //:IF nRC >= zCURSOR_SET
            if ( nRC >= zCURSOR_SET )
            { 
               //:nCnt = 5
               nCnt = 5;
               //:mMasLC.M_MetaTable.Title5 = szText
               SetAttributeFromString( mMasLC, "M_MetaTable", "Title5", szText );
               //:nRC = SetCursorNextWithData( wWebXfer, szText )
               {StringBuilder sb_szText;
               if ( szText == null )
                  sb_szText = new StringBuilder( 32 );
               else
                  sb_szText = new StringBuilder( szText );
                               nRC = o_SetCursorNextWithData( wWebXfer, sb_szText );
               szText = sb_szText.toString( );}
               //:IF nRC >= zCURSOR_SET
               if ( nRC >= zCURSOR_SET )
               { 
                  //:nCnt = 6
                  nCnt = 6;
                  //:mMasLC.M_MetaTable.Title6 = szText
                  SetAttributeFromString( mMasLC, "M_MetaTable", "Title6", szText );
                  //:nRC = SetCursorNextWithData( wWebXfer, szText )
                  {StringBuilder sb_szText;
                  if ( szText == null )
                     sb_szText = new StringBuilder( 32 );
                  else
                     sb_szText = new StringBuilder( szText );
                                     nRC = o_SetCursorNextWithData( wWebXfer, sb_szText );
                  szText = sb_szText.toString( );}
                  //:IF nRC >= zCURSOR_SET
                  if ( nRC >= zCURSOR_SET )
                  { 
                     //:nCnt = 7
                     nCnt = 7;
                     //:mMasLC.M_MetaTable.Title7 = szText
                     SetAttributeFromString( mMasLC, "M_MetaTable", "Title7", szText );
                     //:nRC = SetCursorNextWithData( wWebXfer, szText )
                     {StringBuilder sb_szText;
                     if ( szText == null )
                        sb_szText = new StringBuilder( 32 );
                     else
                        sb_szText = new StringBuilder( szText );
                                           nRC = o_SetCursorNextWithData( wWebXfer, sb_szText );
                     szText = sb_szText.toString( );}
                     //:IF nRC >= zCURSOR_SET
                     if ( nRC >= zCURSOR_SET )
                     { 
                        //:nCnt = 8
                        nCnt = 8;
                        //:mMasLC.M_MetaTable.Title8 = szText
                        SetAttributeFromString( mMasLC, "M_MetaTable", "Title8", szText );
                        //:nRC = SetCursorNextWithData( wWebXfer, szText )
                        {StringBuilder sb_szText;
                        if ( szText == null )
                           sb_szText = new StringBuilder( 32 );
                        else
                           sb_szText = new StringBuilder( szText );
                                                 nRC = o_SetCursorNextWithData( wWebXfer, sb_szText );
                        szText = sb_szText.toString( );}
                        //:IF nRC >= zCURSOR_SET
                        if ( nRC >= zCURSOR_SET )
                        { 
                           //:nCnt = 9
                           nCnt = 9;
                           //:mMasLC.M_MetaTable.Title9 = szText
                           SetAttributeFromString( mMasLC, "M_MetaTable", "Title9", szText );
                           //:nRC = SetCursorNextWithData( wWebXfer, szText )
                           {StringBuilder sb_szText;
                           if ( szText == null )
                              sb_szText = new StringBuilder( 32 );
                           else
                              sb_szText = new StringBuilder( szText );
                                                       nRC = o_SetCursorNextWithData( wWebXfer, sb_szText );
                           szText = sb_szText.toString( );}
                           //:IF nRC >= zCURSOR_SET
                           if ( nRC >= zCURSOR_SET )
                           { 
                              //:nCnt = 10
                              nCnt = 10;
                              //:mMasLC.M_MetaTable.Title10 = szText
                              SetAttributeFromString( mMasLC, "M_MetaTable", "Title10", szText );
                           } 

                           //:END
                        } 

                        //:END
                     } 

                     //:END
                  } 

                  //:END
               } 

               //:END
            } 

            //:END
         } 

         //:END
      } 

      //:END
   } 

   //:END

   //:mMasLC.M_MetaTable.Columns = nCnt
   SetAttributeFromInteger( mMasLC, "M_MetaTable", "Columns", nCnt );
   //:FOR EACH wWebXfer.Work
   RESULT = SetCursorFirstEntity( wWebXfer, "Work", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY wWebXfer.Work NONE
      RESULT = DeleteEntity( wWebXfer, "Work", zREPOS_NONE );
      RESULT = SetCursorNextEntity( wWebXfer, "Work", "" );
   } 

   //:END
   //:AcceptSubobject( mMasLC, "M_MetaTable" )
   AcceptSubobject( mMasLC, "M_MetaTable" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:InitTableColumns( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
InitTableColumns( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW wWebXfer REGISTERED AS wWebXfer
   zVIEW    wWebXfer = new zVIEW( );

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( wWebXfer, "wWebXfer", ViewToWindow, zLEVEL_TASK );

   //:FOR EACH wWebXfer.Work
   RESULT = SetCursorFirstEntity( wWebXfer, "Work", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY wWebXfer.Work NONE
      RESULT = DeleteEntity( wWebXfer, "Work", zREPOS_NONE );
      RESULT = SetCursorNextEntity( wWebXfer, "Work", "" );
   } 

   //:END
   //:IF mMasLC.M_MetaTable.Title1 != ""
   if ( CompareAttributeToString( mMasLC, "M_MetaTable", "Title1", "" ) != 0 )
   { 
      //:CreateEntity( wWebXfer, "Work", zPOS_LAST )
      CreateEntity( wWebXfer, "Work", zPOS_LAST );
      //:wWebXfer.Work.Text = mMasLC.M_MetaTable.Title1
      SetAttributeFromAttribute( wWebXfer, "Work", "Text", mMasLC, "M_MetaTable", "Title1" );
   } 

   //:END
   //:IF mMasLC.M_MetaTable.Title2 != ""
   if ( CompareAttributeToString( mMasLC, "M_MetaTable", "Title2", "" ) != 0 )
   { 
      //:CreateEntity( wWebXfer, "Work", zPOS_LAST )
      CreateEntity( wWebXfer, "Work", zPOS_LAST );
      //:wWebXfer.Work.Text = mMasLC.M_MetaTable.Title2
      SetAttributeFromAttribute( wWebXfer, "Work", "Text", mMasLC, "M_MetaTable", "Title2" );
   } 

   //:END
   //:IF mMasLC.M_MetaTable.Title3 != ""
   if ( CompareAttributeToString( mMasLC, "M_MetaTable", "Title3", "" ) != 0 )
   { 
      //:CreateEntity( wWebXfer, "Work", zPOS_LAST )
      CreateEntity( wWebXfer, "Work", zPOS_LAST );
      //:wWebXfer.Work.Text = mMasLC.M_MetaTable.Title3
      SetAttributeFromAttribute( wWebXfer, "Work", "Text", mMasLC, "M_MetaTable", "Title3" );
   } 

   //:END
   //:IF mMasLC.M_MetaTable.Title4 != ""
   if ( CompareAttributeToString( mMasLC, "M_MetaTable", "Title4", "" ) != 0 )
   { 
      //:CreateEntity( wWebXfer, "Work", zPOS_LAST )
      CreateEntity( wWebXfer, "Work", zPOS_LAST );
      //:wWebXfer.Work.Text = mMasLC.M_MetaTable.Title4
      SetAttributeFromAttribute( wWebXfer, "Work", "Text", mMasLC, "M_MetaTable", "Title4" );
   } 

   //:END
   //:IF mMasLC.M_MetaTable.Title5 != ""
   if ( CompareAttributeToString( mMasLC, "M_MetaTable", "Title5", "" ) != 0 )
   { 
      //:CreateEntity( wWebXfer, "Work", zPOS_LAST )
      CreateEntity( wWebXfer, "Work", zPOS_LAST );
      //:wWebXfer.Work.Text = mMasLC.M_MetaTable.Title5
      SetAttributeFromAttribute( wWebXfer, "Work", "Text", mMasLC, "M_MetaTable", "Title5" );
   } 

   //:END
   //:IF mMasLC.M_MetaTable.Title6 != ""
   if ( CompareAttributeToString( mMasLC, "M_MetaTable", "Title6", "" ) != 0 )
   { 
      //:CreateEntity( wWebXfer, "Work", zPOS_LAST )
      CreateEntity( wWebXfer, "Work", zPOS_LAST );
      //:wWebXfer.Work.Text = mMasLC.M_MetaTable.Title6
      SetAttributeFromAttribute( wWebXfer, "Work", "Text", mMasLC, "M_MetaTable", "Title6" );
   } 

   //:END
   //:IF mMasLC.M_MetaTable.Title7 != ""
   if ( CompareAttributeToString( mMasLC, "M_MetaTable", "Title7", "" ) != 0 )
   { 
      //:CreateEntity( wWebXfer, "Work", zPOS_LAST )
      CreateEntity( wWebXfer, "Work", zPOS_LAST );
      //:wWebXfer.Work.Text = mMasLC.M_MetaTable.Title7
      SetAttributeFromAttribute( wWebXfer, "Work", "Text", mMasLC, "M_MetaTable", "Title7" );
   } 

   //:END
   //:IF mMasLC.M_MetaTable.Title8 != ""
   if ( CompareAttributeToString( mMasLC, "M_MetaTable", "Title8", "" ) != 0 )
   { 
      //:CreateEntity( wWebXfer, "Work", zPOS_LAST )
      CreateEntity( wWebXfer, "Work", zPOS_LAST );
      //:wWebXfer.Work.Text = mMasLC.M_MetaTable.Title8
      SetAttributeFromAttribute( wWebXfer, "Work", "Text", mMasLC, "M_MetaTable", "Title8" );
   } 

   //:END
   //:IF mMasLC.M_MetaTable.Title9 != ""
   if ( CompareAttributeToString( mMasLC, "M_MetaTable", "Title9", "" ) != 0 )
   { 
      //:CreateEntity( wWebXfer, "Work", zPOS_LAST )
      CreateEntity( wWebXfer, "Work", zPOS_LAST );
      //:wWebXfer.Work.Text = mMasLC.M_MetaTable.Title9
      SetAttributeFromAttribute( wWebXfer, "Work", "Text", mMasLC, "M_MetaTable", "Title9" );
   } 

   //:END
   //:IF mMasLC.M_MetaTable.Title10 != ""
   if ( CompareAttributeToString( mMasLC, "M_MetaTable", "Title10", "" ) != 0 )
   { 
      //:CreateEntity( wWebXfer, "Work", zPOS_LAST )
      CreateEntity( wWebXfer, "Work", zPOS_LAST );
      //:wWebXfer.Work.Text = mMasLC.M_MetaTable.Title10
      SetAttributeFromAttribute( wWebXfer, "Work", "Text", mMasLC, "M_MetaTable", "Title10" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AddTable( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
AddTable( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateTemporalEntity( mMasLC, "M_MetaTable", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_MetaTable", zPOS_AFTER );
   //:InitTableColumns( ViewToWindow )
   InitTableColumns( ViewToWindow );
   return( 0 );
// END
} 



}
