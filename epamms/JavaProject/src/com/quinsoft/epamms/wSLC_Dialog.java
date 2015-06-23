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

    Copyright 2009-2010 QuinSoft
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

import com.quinsoft.epamms.mSubLC_Object;
import com.quinsoft.epamms.mMasLC_Object;
import com.quinsoft.epamms.ZGlobalV_Operation;
import com.quinsoft.epamms.mSPLDef_Object;

import com.quinsoft.zeidon.zeidonoperations.ZDRVROPR;

/**
   @author QuinSoft
**/

public class wSLC_Dialog extends VmlDialog
{
   private final ZDRVROPR m_ZDRVROPR;
   public wSLC_Dialog( View view )
   {
      super( view );
      m_ZDRVROPR = new ZDRVROPR( view );
   }


//:DIALOG OPERATION
//:CancelAndReturnSLC( VIEW ViewToWindow )

//:   VIEW mSubLC   REGISTERED AS mSubLC
public int 
CancelAndReturnSLC( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Drop current SLC.
   //:DropObjectInstance( mSubLC )
   DropObjectInstance( mSubLC );
   return( 0 );
// END
} 


private int 
o_fnLocalBuildQual_10( View     vSubtask,
                       zVIEW    vQualObject,
                       int      lTempInteger_1 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregPhysicalLabelDef" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregProduct" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_1 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_11( View     vSubtask,
                       zVIEW    vQualObject,
                       int      lTempInteger_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterProduct" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_12( View     vSubtask,
                       zVIEW    vQualObject,
                       int      lTempInteger_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_13( View     vSubtask,
                       zVIEW    vQualObject,
                       int      lTempInteger_3 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_3 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_14( View     vSubtask,
                       zVIEW    vQualObject,
                       int      lTempInteger_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregPhysicalLabelDef" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregPhysicalLabelDef" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_15( View     vSubtask,
                       zVIEW    vQualObject,
                       int      lTempInteger_1 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_1 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_16( View     vSubtask,
                       zVIEW    vQualObject,
                       int      lTempInteger_4 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregPhysicalLabelDef" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregPhysicalLabelDef" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_4 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_17( View     vSubtask,
                       zVIEW    vQualObject,
                       int      SubregID )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "Subregistrant" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "Subregistrant" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", SubregID );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_0( View     vSubtask,
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
o_fnLocalBuildQual_1( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lTempInteger_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregProduct" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregProduct" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_2( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lTempInteger_1 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregPhysicalLabelDef" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregProduct" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_1 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_3( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lTempInteger_2 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_2 );
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
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregLabelContent" );
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
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_6( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lTempInteger_2 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "MasterLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "MasterLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_2 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_7( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lTempInteger_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregLabelContent" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregLabelContent" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_8( View     vSubtask,
                      zVIEW    vQualObject,
                      int      SubProdID )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregProduct" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregProduct" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", SubProdID );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


private int 
o_fnLocalBuildQual_9( View     vSubtask,
                      zVIEW    vQualObject,
                      int      lTempInteger_0 )
{
   int      RESULT = 0;

   RESULT = SfActivateSysEmptyOI( vQualObject, "KZDBHQUA", vSubtask, zMULTIPLE );
   CreateEntity( vQualObject, "EntitySpec", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "EntitySpec", "EntityName", "SubregPhysicalLabelDef" );
   CreateEntity( vQualObject, "QualAttrib", zPOS_AFTER );
   SetAttributeFromString( vQualObject, "QualAttrib", "EntityName", "SubregPhysicalLabelDef" );
   SetAttributeFromString( vQualObject, "QualAttrib", "AttributeName", "ID" );
   SetAttributeFromInteger( vQualObject, "QualAttrib", "Value", lTempInteger_0 );
   SetAttributeFromString( vQualObject, "QualAttrib", "Oper", "=" );
   return( 0 );
} 


//:DIALOG OPERATION
//:GOTO_DisplayGeneratedText( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
GOTO_DisplayGeneratedText( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:mSubLC.SubregLabelContent.wGeneratedTextDisplay = mSubLC.S_MarketingStatement.dDisplayKeywordText 
   SetAttributeFromAttribute( mSubLC, "SubregLabelContent", "wGeneratedTextDisplay", mSubLC, "S_MarketingStatement", "dDisplayKeywordText" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:RemoveMarketingKeywordEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
RemoveMarketingKeywordEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Remove each selected Usage entry.
   //:FOR EACH mSubLC.S_InsertTextMarketing WITHIN mSubLC.S_MarketingStatement 
   RESULT = SetCursorFirstEntity( mSubLC, "S_InsertTextMarketing", "S_MarketingStatement" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSubLC.S_InsertTextMarketing.wSelected = "Y"
      if ( CompareAttributeToString( mSubLC, "S_InsertTextMarketing", "wSelected", "Y" ) == 0 )
      { 
         //:DELETE ENTITY mSubLC.S_InsertTextMarketing NONE 
         RESULT = DeleteEntity( mSubLC, "S_InsertTextMarketing", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_InsertTextMarketing", "S_MarketingStatement" );
      //:END
   } 

   //:END
   //:SET CURSOR FIRST mSubLC.S_InsertTextKeywordMarketing 
   RESULT = SetCursorFirstEntity( mSubLC, "S_InsertTextKeywordMarketing", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SelectMarketingKeywordEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
SelectMarketingKeywordEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   String   szTempString_0 = null;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Include each selected Usage Source entry in the Target subobject.
   //:FOR EACH mMasLC.M_InsertTextMarketing WITHIN mMasLC.M_MarketingStatement 
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextMarketing", "M_MarketingStatement" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_InsertTextMarketing.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_InsertTextMarketing", "wSelected", "Y" ) == 0 )
      { 
         //:SET CURSOR FIRST mSubLC.S_InsertTextKeywordMarketing 
         //:           WHERE mSubLC.S_InsertTextKeywordMarketing.Name = mMasLC.M_InsertTextKeywordMarketing.Name  
         {StringBuilder sb_szTempString_0;
         if ( szTempString_0 == null )
            sb_szTempString_0 = new StringBuilder( 32 );
         else
            sb_szTempString_0 = new StringBuilder( szTempString_0 );
                   GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_InsertTextKeywordMarketing", "Name" );
         szTempString_0 = sb_szTempString_0.toString( );}
         RESULT = SetCursorFirstEntityByString( mSubLC, "S_InsertTextKeywordMarketing", "Name", szTempString_0, "" );
         //:IF RESULT < zCURSOR_SET
         if ( RESULT < zCURSOR_SET )
         { 
            //:CREATE ENTITY mSubLC.S_InsertTextKeywordMarketing 
            RESULT = CreateEntity( mSubLC, "S_InsertTextKeywordMarketing", zPOS_AFTER );
            //:mSubLC.S_InsertTextKeywordMarketing.Name          = mMasLC.M_InsertTextKeywordMarketing.Name
            SetAttributeFromAttribute( mSubLC, "S_InsertTextKeywordMarketing", "Name", mMasLC, "M_InsertTextKeywordMarketing", "Name" );
            //:mSubLC.S_InsertTextKeywordMarketing.PrimaryMLC_ID = mMasLC.M_InsertTextKeywordMarketing.ID 
            SetAttributeFromAttribute( mSubLC, "S_InsertTextKeywordMarketing", "PrimaryMLC_ID", mMasLC, "M_InsertTextKeywordMarketing", "ID" );
         } 

         //:END
         //:SET CURSOR FIRST mSubLC.S_InsertTextMarketing 
         //:           WHERE mSubLC.S_InsertTextMarketing.Text = mMasLC.M_InsertTextMarketing.Text 
         {StringBuilder sb_szTempString_0;
         if ( szTempString_0 == null )
            sb_szTempString_0 = new StringBuilder( 32 );
         else
            sb_szTempString_0 = new StringBuilder( szTempString_0 );
                   GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_InsertTextMarketing", "Text" );
         szTempString_0 = sb_szTempString_0.toString( );}
         RESULT = SetCursorFirstEntityByString( mSubLC, "S_InsertTextMarketing", "Text", szTempString_0, "" );
         //:IF RESULT < zCURSOR_SET
         if ( RESULT < zCURSOR_SET )
         { 
            //:CREATE ENTITY mSubLC.S_InsertTextMarketing 
            RESULT = CreateEntity( mSubLC, "S_InsertTextMarketing", zPOS_AFTER );
            //:mSubLC.S_InsertTextMarketing.Text          = mMasLC.M_InsertTextMarketing.Text
            SetAttributeFromAttribute( mSubLC, "S_InsertTextMarketing", "Text", mMasLC, "M_InsertTextMarketing", "Text" );
            //:mSubLC.S_InsertTextMarketing.PrimaryMLC_ID = mMasLC.M_InsertTextMarketing.ID 
            SetAttributeFromAttribute( mSubLC, "S_InsertTextMarketing", "PrimaryMLC_ID", mMasLC, "M_InsertTextMarketing", "ID" );
         } 

         //:END 
         //:mMasLC.M_InsertTextMarketing.wSelected = ""
         SetAttributeFromString( mMasLC, "M_InsertTextMarketing", "wSelected", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextMarketing", "M_MarketingStatement" );
      //:END
   } 

   //:END
   //:SET CURSOR FIRST mMasLC.M_InsertTextKeywordMarketing 
   RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextKeywordMarketing", "" );
   //:SET CURSOR FIRST mSubLC.S_InsertTextKeywordMarketing  
   RESULT = SetCursorFirstEntity( mSubLC, "S_InsertTextKeywordMarketing", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SaveSubregProduct( VIEW ViewToWindow )

//:   VIEW mSubreg  REGISTERED AS mSubreg
public int 
SaveSubregProduct( View     ViewToWindow )
{
   zVIEW    mSubreg = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mSubProd REGISTERED AS mSubProd 
   zVIEW    mSubProd = new zVIEW( );
   //:INTEGER SubregID
   int      SubregID = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mSubreg, "mSubreg", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mSubProd, "mSubProd", ViewToWindow, zLEVEL_TASK );

   //:// Save the Subreg Product and reactivate the Product list.
   //:COMMIT mSubProd
   RESULT = CommitObjectInstance( mSubProd );
   //:DropObjectInstance( mSubProd )
   DropObjectInstance( mSubProd );
   //:SubregID = mSubreg.Subregistrant.ID 
   {MutableInt mi_SubregID = new MutableInt( SubregID );
       GetIntegerFromAttribute( mi_SubregID, mSubreg, "Subregistrant", "ID" );
   SubregID = mi_SubregID.intValue( );}
   //:DropObjectInstance( mSubreg )
   DropObjectInstance( mSubreg );
   //:ACTIVATE mSubreg WHERE mSubreg.Subregistrant.ID = SubregID
   o_fnLocalBuildQual_17( ViewToWindow, vTempViewVar_0, SubregID );
   RESULT = ActivateObjectInstance( mSubreg, "mSubreg", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mSubreg "mSubreg"
   SetNameForView( mSubreg, "mSubreg", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_UpdateSubregProductSPLD( VIEW ViewToWindow )

//:   VIEW lSPLDLST REGISTERED AS lSPLDLST
public int 
GOTO_UpdateSubregProductSPLD( View     ViewToWindow )
{
   zVIEW    lSPLDLST = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mSPLDef  BASED ON LOD  mSPLDef
   zVIEW    mSPLDef = new zVIEW( );
   //:VIEW mSubLC   BASED ON LOD  mSubLC
   zVIEW    mSubLC = new zVIEW( );
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );
   int      lTempInteger_1 = 0;
   zVIEW    vTempViewVar_1 = new zVIEW( );
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   zVIEW    vTempViewVar_2 = new zVIEW( );
   int      lTempInteger_5 = 0;

   RESULT = GetViewByName( lSPLDLST, "lSPLDLST", ViewToWindow, zLEVEL_TASK );

   //:// Activate the mSPLDef object selected in mSubProd.
   //:ACTIVATE mSPLDef WHERE mSPLDef.SubregPhysicalLabelDef.ID = lSPLDLST.SubregPhysicalLabelDef.ID 
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, lSPLDLST, "SubregPhysicalLabelDef", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_14( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( mSPLDef, "mSPLDef", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mSPLDef "mSPLDef"
   SetNameForView( mSPLDef, "mSPLDef", null, zLEVEL_TASK );

   //:// Activate the related mSubLC object.
   //:ACTIVATE mSubLC WHERE mSubLC.SubregLabelContent.ID = mSPLDef.SubregLabelContent.ID 
   {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
       GetIntegerFromAttribute( mi_lTempInteger_1, mSPLDef, "SubregLabelContent", "ID" );
   lTempInteger_1 = mi_lTempInteger_1.intValue( );}
   o_fnLocalBuildQual_15( ViewToWindow, vTempViewVar_1, lTempInteger_1 );
   RESULT = ActivateObjectInstance( mSubLC, "mSubLC", ViewToWindow, vTempViewVar_1, zSINGLE );
   DropView( vTempViewVar_1 );
   //:NAME VIEW mSubLC "mSubLC"
   SetNameForView( mSubLC, "mSubLC", null, zLEVEL_TASK );

   //:// Rebuild DirectionsForUse and Marketing data.
   //:// If the DirectionsForUse or Marketing Statements are not tied to their SLC counterparts, then rebuild them.
   //:// (This is a correction to a data error.)
   //:IF mSPLDef.S_DirectionsForUseStatement DOES NOT EXIST OR mSPLDef.S_DirectionsForUseSection DOES NOT EXIST
   lTempInteger_2 = CheckExistenceOfEntity( mSPLDef, "S_DirectionsForUseStatement" );
   lTempInteger_3 = CheckExistenceOfEntity( mSPLDef, "S_DirectionsForUseSection" );
   if ( lTempInteger_2 != 0 || lTempInteger_3 != 0 )
   { 
      //:// The data is in error, so go to correct it.
      //:RebuildSPLD_FromSLC( mSPLDef, mSubLC )
      {
       mSPLDef_Object m_mSPLDef_Object = new mSPLDef_Object( mSPLDef );
       m_mSPLDef_Object.omSPLDef_RebuildSPLD_FromSLC( mSPLDef, mSubLC );
       // m_mSPLDef_Object = null;  // permit gc  (unnecessary)
      }
      //:ELSE
   } 
   else
   { 
      //:BuildUsageEntriesFrSLC( mSPLDef, mSubLC )
      {
       mSPLDef_Object m_mSPLDef_Object = new mSPLDef_Object( mSPLDef );
       m_mSPLDef_Object.omSPLDef_BuildUsageEntriesFrSLC( mSPLDef, mSubLC );
       // m_mSPLDef_Object = null;  // permit gc  (unnecessary)
      }
   } 

   //:END

   //:// Save and reactivate mSPLDef to make the object easier to see in the object browser.
   //:COMMIT mSPLDef
   RESULT = CommitObjectInstance( mSPLDef );
   //:DropObjectInstance( mSPLDef )
   DropObjectInstance( mSPLDef );
   //:ACTIVATE mSPLDef WHERE mSPLDef.SubregPhysicalLabelDef.ID = lSPLDLST.SubregPhysicalLabelDef.ID 
   {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
       GetIntegerFromAttribute( mi_lTempInteger_4, lSPLDLST, "SubregPhysicalLabelDef", "ID" );
   lTempInteger_4 = mi_lTempInteger_4.intValue( );}
   o_fnLocalBuildQual_16( ViewToWindow, vTempViewVar_2, lTempInteger_4 );
   RESULT = ActivateObjectInstance( mSPLDef, "mSPLDef", ViewToWindow, vTempViewVar_2, zSINGLE );
   DropView( vTempViewVar_2 );
   //:NAME VIEW mSPLDef "mSPLDef"
   SetNameForView( mSPLDef, "mSPLDef", null, zLEVEL_TASK );

   //:// Sort Panels and SubBlocks by position.
   //:ComputeTopPositions( mSPLDef )
   {
    mSPLDef_Object m_mSPLDef_Object = new mSPLDef_Object( mSPLDef );
    m_mSPLDef_Object.omSPLDef_ComputeTopPositions( mSPLDef );
    // m_mSPLDef_Object = null;  // permit gc  (unnecessary)
   }
   //:FOR EACH mSPLDef.LLD_Page 
   RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Page", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:OrderEntityForView( mSPLDef, "LLD_Panel", "Top A Left A" )
      OrderEntityForView( mSPLDef, "LLD_Panel", "Top A Left A" );
      //:FOR EACH mSPLDef.LLD_Panel 
      RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Panel", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:FOR EACH mSPLDef.LLD_Block 
         RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Block", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:OrderEntityForView( mSPLDef, "LLD_SubBlock", "LLD_SubBlock.Left A wComputedTopPosition A" )
            OrderEntityForView( mSPLDef, "LLD_SubBlock", "LLD_SubBlock.Left A wComputedTopPosition A" );
            RESULT = SetCursorNextEntity( mSPLDef, "LLD_Block", "" );
         } 

         RESULT = SetCursorNextEntity( mSPLDef, "LLD_Panel", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "LLD_Page", "" );
      //:END 
   } 

   //:END 
   //:SET CURSOR FIRST mSPLDef.LLD_Page 
   RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Page", "" );

   //:// Initialize LLD data, if it's not already initialized.
   //:IF mSPLDef.SPLD_LLD DOES NOT EXIST
   lTempInteger_5 = CheckExistenceOfEntity( mSPLDef, "SPLD_LLD" );
   if ( lTempInteger_5 != 0 )
   { 
      //:CREATE ENTITY mSPLDef.SPLD_LLD 
      RESULT = CreateEntity( mSPLDef, "SPLD_LLD", zPOS_AFTER );
      //:CREATE ENTITY mSPLDef.LLD_Page 
      RESULT = CreateEntity( mSPLDef, "LLD_Page", zPOS_AFTER );
      //:CREATE ENTITY mSPLDef.LLD_Panel 
      RESULT = CreateEntity( mSPLDef, "LLD_Panel", zPOS_AFTER );
      //:mSPLDef.LLD_Panel.Left = 0
      SetAttributeFromInteger( mSPLDef, "LLD_Panel", "Left", 0 );
      //:mSPLDef.LLD_Panel.Top = 0 
      SetAttributeFromInteger( mSPLDef, "LLD_Panel", "Top", 0 );
   } 

   //:END

   //:// Build the work components
   //:BuildCompositeEntries( mSPLDef )
   {
    mSPLDef_Object m_mSPLDef_Object = new mSPLDef_Object( mSPLDef );
    m_mSPLDef_Object.omSPLDef_BuildCompositeEntries( mSPLDef );
    // m_mSPLDef_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// // TraceLineS( "$$$$$$ end of oper", "GOTO_UpdateSubregProductSPLD" )
// // DisplayObjectInstance( mSPLDef, "", "" )
//    
//    // Also activate the corresponding SLC and build the composite subobject.
//    //ACTIVATE mSubLC WHERE mSubLC.SubregLabelContent.ID = mSPLDef.SubregLabelContent.ID 
//    //NAME VIEW mSubLC "mSubLC"
//    //BuildCompositeEntries( mSubLC )
// END
} 


//:DIALOG OPERATION
//:GOTO_UpdateSubregProductSLC( VIEW ViewToWindow )

//:   VIEW mSubProd REGISTERED AS mSubProd
public int 
GOTO_UpdateSubregProductSLC( View     ViewToWindow )
{
   zVIEW    mSubProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mSubLC   BASED ON LOD  mSubLC 
   zVIEW    mSubLC = new zVIEW( );
   //:VIEW mMasLC   BASED ON LOD  mMasLC
   zVIEW    mMasLC = new zVIEW( );
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );
   int      lTempInteger_1 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_2 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_3 = 0;
   zVIEW    vTempViewVar_1 = new zVIEW( );

   RESULT = GetViewByName( mSubProd, "mSubProd", ViewToWindow, zLEVEL_TASK );

   //:// Activate selected Subreg SLC and build the Components work entries from persistent entries.
   //:ACTIVATE mSubLC WHERE mSubLC.SubregLabelContent.ID = mSubProd.SubregLabelContent.ID 
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, mSubProd, "SubregLabelContent", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_12( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( mSubLC, "mSubLC", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mSubLC "mSubLC"
   SetNameForView( mSubLC, "mSubLC", null, zLEVEL_TASK );

   //:// Delete any S_Usage entries that aren't tied to an MLC.
   //:// Also delete any Directions for Use or Marketing Ordering entries not tied to a Usage.
   //:/*FOR EACH mSubLC.S_UsageType 
   //:   FOR EACH mSubLC.S_Usage 
   //:      IF mSubLC.M_Usage DOES NOT EXIST
   //:         DELETE ENTITY mSubLC.S_Usage NONE 
   //:      END
   //:   END
   //:END
   //:FOR EACH mSubLC.S_DirectionsForUseStatement WITHIN mSubLC.SubregLabelContent 
   //:   FOR EACH mSubLC.S_DirectionsUsageOrdering 
   //:      IF mSubLC.S_DirectionsUsage DOES NOT EXIST
   //:         DELETE ENTITY mSubLC.S_DirectionsUsageOrdering NONE 
   //:      END
   //:   END
   //:END
   //:FOR EACH mSubLC.S_MarketingStatement WITHIN mSubLC.SubregLabelContent 
   //:   FOR EACH mSubLC.S_MarketingUsageOrdering 
   //:      IF mSubLC.S_MarketingUsage DOES NOT EXIST
   //:         DELETE ENTITY mSubLC.S_MarketingUsageOrdering NONE 
   //:      END
   //:   END
   //:END

   //:FOR EACH mSubLC.S_MarketingSection 
   //:   FOR EACH mSubLC.S_MarketingStatement 
   //:      FOR EACH mSubLC.S_MarketingUsageOrdering 
   //:         IF mSubLC.S_MarketingUsage DOES NOT EXIST
   //:            MessageSend( ViewToWindow, "", "Test",
   //:                         "Missing usage.",
   //:                         zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
   //:            SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
   //:            RETURN 2            
   //:         END         
   //:      END      
   //:   END   
   //:END
   //:COMMIT mSubLC*/

   //:BuildCompositeEntries( mSubLC )
   {
    mSubLC_Object m_mSubLC_Object = new mSubLC_Object( mSubLC );
    m_mSubLC_Object.omSubLC_BuildCompositeEntries( mSubLC );
    // m_mSubLC_Object = null;  // permit gc  (unnecessary)
   }

   //:// Relink Usage.
   //:FOR EACH mSubLC.S_DirectionsForUseSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:FOR EACH mSubLC.S_DirectionsUsageOrdering 
      RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST mSubLC.S_Usage WHERE mSubLC.S_Usage.ID = mSubLC.S_DirectionsUsage.ID 
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                   GetIntegerFromAttribute( mi_lTempInteger_1, mSubLC, "S_DirectionsUsage", "ID" );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_Usage", "ID", lTempInteger_1, "" );
         //:IF RESULT < zCURSOR_SET
         if ( RESULT < zCURSOR_SET )
         { 
            //:TraceLineS( "######## No DU Link: ", mSubLC.S_DirectionsUsage.Name )
            {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetStringFromAttribute( sb_szTempString_0, mSubLC, "S_DirectionsUsage", "Name" );
            szTempString_0 = sb_szTempString_0.toString( );}
            TraceLineS( "######## No DU Link: ", szTempString_0 );
         } 

         RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsUsageOrdering", "" );
         //:END 
      } 

      //:END
      //:FOR EACH mSubLC.S_MarketingUsageOrdering 
      RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST mSubLC.S_Usage WHERE mSubLC.S_Usage.ID = mSubLC.S_MarketingUsage.ID 
         {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                   GetIntegerFromAttribute( mi_lTempInteger_2, mSubLC, "S_MarketingUsage", "ID" );
         lTempInteger_2 = mi_lTempInteger_2.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_Usage", "ID", lTempInteger_2, "" );
         //:IF RESULT < zCURSOR_SET
         if ( RESULT < zCURSOR_SET )
         { 
            //:TraceLineS( "######## No Mkt Link: ", mSubLC.S_MarketingUsage.Name )
            {StringBuilder sb_szTempString_1;
            if ( szTempString_1 == null )
               sb_szTempString_1 = new StringBuilder( 32 );
            else
               sb_szTempString_1 = new StringBuilder( szTempString_1 );
                         GetStringFromAttribute( sb_szTempString_1, mSubLC, "S_MarketingUsage", "Name" );
            szTempString_1 = sb_szTempString_1.toString( );}
            TraceLineS( "######## No Mkt Link: ", szTempString_1 );
         } 

         RESULT = SetCursorNextEntity( mSubLC, "S_MarketingUsageOrdering", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// Activate related MLC, which has the selectable content.
   //:ACTIVATE mMasLC WHERE mMasLC.MasterLabelContent.ID = mSubProd.MasterLabelContent.ID 
   {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
       GetIntegerFromAttribute( mi_lTempInteger_3, mSubProd, "MasterLabelContent", "ID" );
   lTempInteger_3 = mi_lTempInteger_3.intValue( );}
   o_fnLocalBuildQual_13( ViewToWindow, vTempViewVar_1, lTempInteger_3 );
   RESULT = ActivateObjectInstance( mMasLC, "mMasLC", ViewToWindow, vTempViewVar_1, zSINGLE );
   DropView( vTempViewVar_1 );
   //:NAME VIEW mMasLC "mMasLC"
   SetNameForView( mMasLC, "mMasLC", null, zLEVEL_TASK );
   //:BuildCompositeEntries( mMasLC )
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLC );
    m_mMasLC_Object.omMasLC_BuildCompositeEntries( mMasLC );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
   //:BuildWorkVariables( mSubLC, mMasLC )
   {
    mSubLC_Object m_mSubLC_Object = new mSubLC_Object( mSubLC );
    m_mSubLC_Object.omSubLC_BuildWorkVariables( mSubLC, mMasLC );
    // m_mSubLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_NewSubregProductSLC( VIEW ViewToWindow )

//:   VIEW mSubreg  REGISTERED AS mSubreg
public int 
GOTO_NewSubregProductSLC( View     ViewToWindow )
{
   zVIEW    mSubreg = new zVIEW( );
   int      RESULT = 0;
   //:VIEW lMLC     BASED ON LOD  lMLC
   zVIEW    lMLC = new zVIEW( );
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mSubreg, "mSubreg", ViewToWindow, zLEVEL_TASK );

   //:// Activate lMLC for selecting a MLC for creation of a new SLC.
   //:GET VIEW lMLC NAMED "lMLC"
   RESULT = GetViewByName( lMLC, "lMLC", ViewToWindow, zLEVEL_TASK );
   //:IF RESULT >= 0
   if ( RESULT >= 0 )
   { 
      //:DropObjectInstance( lMLC )
      DropObjectInstance( lMLC );
   } 

   //:END
   //:ACTIVATE lMLC Multiple WHERE lMLC.MasterProduct.ID = mSubreg.MasterProduct.ID 
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, mSubreg, "MasterProduct", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_11( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( lMLC, "lMLC", ViewToWindow, vTempViewVar_0, zMULTIPLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW lMLC "lMLC"
   SetNameForView( lMLC, "lMLC", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DuplicateSubregProductSPLD( VIEW ViewToWindow )

//:   VIEW mSubProd    REGISTERED AS mSubProd
public int 
DuplicateSubregProductSPLD( View     ViewToWindow )
{
   zVIEW    mSubProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW lSPLDLST    REGISTERED AS lSPLDLST
   zVIEW    lSPLDLST = new zVIEW( );
   //:VIEW mSPLDefOrig BASED ON LOD  mSPLDef 
   zVIEW    mSPLDefOrig = new zVIEW( );
   //:VIEW mSPLDefNew  BASED ON LOD  mSPLDef 
   zVIEW    mSPLDefNew = new zVIEW( );
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );
   int      lTempInteger_1 = 0;
   zVIEW    vTempViewVar_1 = new zVIEW( );

   RESULT = GetViewByName( mSubProd, "mSubProd", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( lSPLDLST, "lSPLDLST", ViewToWindow, zLEVEL_TASK );

   //:// Activate selected Subreg SLC and duplicate it.
   //://ACTIVATE mSPLDefOrig WHERE mSPLDefOrig.SubregPhysicalLabelDef.ID = mSubProd.SubregPhysicalLabelDef.ID 
   //:ACTIVATE mSPLDefOrig WHERE mSPLDefOrig.SubregPhysicalLabelDef.ID = lSPLDLST.SubregPhysicalLabelDef.ID 
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, lSPLDLST, "SubregPhysicalLabelDef", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_9( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( mSPLDefOrig, "mSPLDef", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mSPLDefOrig "mSPLDefOrig"
   SetNameForView( mSPLDefOrig, "mSPLDefOrig", null, zLEVEL_TASK );

   //:// Create empty target object.
   //:ACTIVATE mSPLDefNew EMPTY 
   RESULT = ActivateEmptyObjectInstance( mSPLDefNew, "mSPLDef", ViewToWindow, zSINGLE );
   //:NAME VIEW mSPLDefNew "mSPLDefNew"
   SetNameForView( mSPLDefNew, "mSPLDefNew", null, zLEVEL_TASK );

   //:// Execute duplication operation and commit it.
   //:DuplicateSPLD( mSPLDefNew, mSPLDefOrig )
   {
    mSPLDef_Object m_mSPLDef_Object = new mSPLDef_Object( mSPLDefNew );
    m_mSPLDef_Object.omSPLDef_DuplicateSPLD( mSPLDefNew, mSPLDefOrig );
    // m_mSPLDef_Object = null;  // permit gc  (unnecessary)
   }
   //:COMMIT mSPLDefNew
   RESULT = CommitObjectInstance( mSPLDefNew );

   //:DropObjectInstance( mSPLDefOrig )
   DropObjectInstance( mSPLDefOrig );
   //:DropObjectInstance( mSPLDefNew )
   DropObjectInstance( mSPLDefNew );

   //:// Reactivate mSubProd to pick up new SubLC.
   //:DropObjectInstance( lSPLDLST )
   DropObjectInstance( lSPLDLST );
   //:ACTIVATE lSPLDLST Multiple WHERE lSPLDLST.SubregProduct.ID = mSubProd.SubregProduct.ID 
   {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
       GetIntegerFromAttribute( mi_lTempInteger_1, mSubProd, "SubregProduct", "ID" );
   lTempInteger_1 = mi_lTempInteger_1.intValue( );}
   o_fnLocalBuildQual_10( ViewToWindow, vTempViewVar_1, lTempInteger_1 );
   RESULT = ActivateObjectInstance( lSPLDLST, "lSPLDLST", ViewToWindow, vTempViewVar_1, zMULTIPLE );
   DropView( vTempViewVar_1 );
   //:NAME VIEW lSPLDLST "lSPLDLST"
   SetNameForView( lSPLDLST, "lSPLDLST", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DuplicateSubregProductSLC( VIEW ViewToWindow )

//:   VIEW mSubProd   REGISTERED AS mSubProd
public int 
DuplicateSubregProductSLC( View     ViewToWindow )
{
   zVIEW    mSubProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mSubLCOrig BASED ON LOD  mSubLC 
   zVIEW    mSubLCOrig = new zVIEW( );
   //:VIEW mSubLCNew  BASED ON LOD  mSubLC 
   zVIEW    mSubLCNew = new zVIEW( );
   //:INTEGER SubProdID
   int      SubProdID = 0;
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );
   zVIEW    vTempViewVar_1 = new zVIEW( );

   RESULT = GetViewByName( mSubProd, "mSubProd", ViewToWindow, zLEVEL_TASK );

   //:// Activate selected Subreg SLC and duplicate it.
   //:ACTIVATE mSubLCOrig WHERE mSubLCOrig.SubregLabelContent.ID = mSubProd.SubregLabelContent.ID 
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, mSubProd, "SubregLabelContent", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_7( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( mSubLCOrig, "mSubLC", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mSubLCOrig "mSubLCOrig"
   SetNameForView( mSubLCOrig, "mSubLCOrig", null, zLEVEL_TASK );

   //:// Create empty target object.
   //:ACTIVATE mSubLCNew EMPTY 
   RESULT = ActivateEmptyObjectInstance( mSubLCNew, "mSubLC", ViewToWindow, zSINGLE );
   //:NAME VIEW mSubLCNew "mSubLCNew"
   SetNameForView( mSubLCNew, "mSubLCNew", null, zLEVEL_TASK );

   //:// Execute duplication operation and commit it.
   //:DuplicateSLC( mSubLCNew, mSubLCOrig )
   {
    mSubLC_Object m_mSubLC_Object = new mSubLC_Object( mSubLCNew );
    m_mSubLC_Object.omSubLC_DuplicateSLC( mSubLCNew, mSubLCOrig );
    // m_mSubLC_Object = null;  // permit gc  (unnecessary)
   }
   //:COMMIT mSubLCNew
   RESULT = CommitObjectInstance( mSubLCNew );

   //:DropObjectInstance( mSubLCOrig )
   DropObjectInstance( mSubLCOrig );
   //:DropObjectInstance( mSubLCNew )
   DropObjectInstance( mSubLCNew );

   //:// Reactivate mSubProd to pick up new SubLC.
   //:SubProdID = mSubProd.SubregProduct.ID 
   {MutableInt mi_SubProdID = new MutableInt( SubProdID );
       GetIntegerFromAttribute( mi_SubProdID, mSubProd, "SubregProduct", "ID" );
   SubProdID = mi_SubProdID.intValue( );}
   //:DropObjectInstance( mSubProd )
   DropObjectInstance( mSubProd );
   //:ACTIVATE mSubProd WHERE mSubProd.SubregProduct.ID = SubProdID
   o_fnLocalBuildQual_8( ViewToWindow, vTempViewVar_1, SubProdID );
   RESULT = ActivateObjectInstance( mSubProd, "mSubProd", ViewToWindow, vTempViewVar_1, zSINGLE );
   DropView( vTempViewVar_1 );
   //:NAME VIEW mSubProd "mSubProd"
   SetNameForView( mSubProd, "mSubProd", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelSubregProduct( VIEW ViewToWindow )

//:   VIEW mSubProd REGISTERED AS mSubProd 
public int 
CancelSubregProduct( View     ViewToWindow )
{
   zVIEW    mSubProd = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubProd, "mSubProd", ViewToWindow, zLEVEL_TASK );

   //:// Simply drop the Subreg Product.
   //:DropObjectInstance( mSubProd )
   DropObjectInstance( mSubProd );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:BACKUP_Objects( VIEW ViewToWindow )

//:   VIEW mSubreg  REGISTERED AS mSubreg
public int 
BACKUP_Objects( View     ViewToWindow )
{
   zVIEW    mSubreg = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mSubProd REGISTERED AS mSubProd 
   zVIEW    mSubProd = new zVIEW( );
   //:VIEW mSubLC   BASED ON LOD  mSubLC 
   zVIEW    mSubLC = new zVIEW( );
   //:VIEW mMasLC   BASED ON LOD  mMasLC
   zVIEW    mMasLC = new zVIEW( );
   //:STRING ( 100 )  szFileName
   String   szFileName = null;
   //:STRING ( 100 )  szNamedView
   String   szNamedView = null;
   //:STRING ( 2 )    szCount
   String   szCount = null;
   //:INTEGER         Count
   int      Count = 0;
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   zVIEW    vTempViewVar_1 = new zVIEW( );

   RESULT = GetViewByName( mSubreg, "mSubreg", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mSubProd, "mSubProd", ViewToWindow, zLEVEL_TASK );

   //:// Commit each object to a file.
   //:CommitOI_ToFile( mSubreg, "c:\lplr\epamms\objectback\mSubreg.por", zASCII )
   CommitOI_ToFile( mSubreg, "c:\\lplr\\epamms\\objectback\\mSubreg.por", zASCII );
   //:CommitOI_ToFile( mSubProd, "c:\lplr\epamms\objectback\mSubProd.por", zASCII )
   CommitOI_ToFile( mSubProd, "c:\\lplr\\epamms\\objectback\\mSubProd.por", zASCII );
   //:Count = 0
   Count = 0;
   //:FOR EACH mSubProd.SubregLabelContent 
   RESULT = SetCursorFirstEntity( mSubProd, "SubregLabelContent", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:Count = Count + 1
      Count = Count + 1;
      //:szCount = Count
       {StringBuilder sb_szCount;
      if ( szCount == null )
         sb_szCount = new StringBuilder( 32 );
      else
         sb_szCount = new StringBuilder( szCount );
            ZeidonStringConvertFromNumber( sb_szCount, 1, 0, 2, Count, (double) 0.0, "I" );
      szCount = sb_szCount.toString( );}
      //:szFileName = "c:\lplr\epamms\objectback\mSubLC" + szCount + ".por"
       {StringBuilder sb_szFileName;
      if ( szFileName == null )
         sb_szFileName = new StringBuilder( 32 );
      else
         sb_szFileName = new StringBuilder( szFileName );
            ZeidonStringCopy( sb_szFileName, 1, 0, "c:\\lplr\\epamms\\objectback\\mSubLC", 1, 0, 101 );
      szFileName = sb_szFileName.toString( );}
       {StringBuilder sb_szFileName;
      if ( szFileName == null )
         sb_szFileName = new StringBuilder( 32 );
      else
         sb_szFileName = new StringBuilder( szFileName );
            ZeidonStringConcat( sb_szFileName, 1, 0, szCount, 1, 0, 101 );
      szFileName = sb_szFileName.toString( );}
       {StringBuilder sb_szFileName;
      if ( szFileName == null )
         sb_szFileName = new StringBuilder( 32 );
      else
         sb_szFileName = new StringBuilder( szFileName );
            ZeidonStringConcat( sb_szFileName, 1, 0, ".por", 1, 0, 101 );
      szFileName = sb_szFileName.toString( );}
      //:szNamedView = "mSubLC" + szCount
       {StringBuilder sb_szNamedView;
      if ( szNamedView == null )
         sb_szNamedView = new StringBuilder( 32 );
      else
         sb_szNamedView = new StringBuilder( szNamedView );
            ZeidonStringCopy( sb_szNamedView, 1, 0, "mSubLC", 1, 0, 101 );
      szNamedView = sb_szNamedView.toString( );}
       {StringBuilder sb_szNamedView;
      if ( szNamedView == null )
         sb_szNamedView = new StringBuilder( 32 );
      else
         sb_szNamedView = new StringBuilder( szNamedView );
            ZeidonStringConcat( sb_szNamedView, 1, 0, szCount, 1, 0, 101 );
      szNamedView = sb_szNamedView.toString( );}
      //:ACTIVATE mSubLC WHERE mSubLC.SubregLabelContent.ID = mSubProd.SubregLabelContent.ID 
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
             GetIntegerFromAttribute( mi_lTempInteger_0, mSubProd, "SubregLabelContent", "ID" );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );}
      o_fnLocalBuildQual_5( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
      RESULT = ActivateObjectInstance( mSubLC, "mSubLC", ViewToWindow, vTempViewVar_0, zSINGLE );
      DropView( vTempViewVar_0 );
      //:NAME VIEW mSubLC szNamedView
      SetNameForView( mSubLC, szNamedView, null, zLEVEL_TASK );
      //:CommitOI_ToFile( mSubLC, szFileName, zASCII )
      CommitOI_ToFile( mSubLC, szFileName, zASCII );
      RESULT = SetCursorNextEntity( mSubProd, "SubregLabelContent", "" );
   } 

   //:END
   //:IF mSubProd.MasterLabelContent EXISTS
   lTempInteger_1 = CheckExistenceOfEntity( mSubProd, "MasterLabelContent" );
   if ( lTempInteger_1 == 0 )
   { 
      //:ACTIVATE mMasLC WHERE mMasLC.MasterLabelContent.ID = mSubProd.MasterLabelContent.ID 
      {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
             GetIntegerFromAttribute( mi_lTempInteger_2, mSubProd, "MasterLabelContent", "ID" );
      lTempInteger_2 = mi_lTempInteger_2.intValue( );}
      o_fnLocalBuildQual_6( ViewToWindow, vTempViewVar_1, lTempInteger_2 );
      RESULT = ActivateObjectInstance( mMasLC, "mMasLC", ViewToWindow, vTempViewVar_1, zSINGLE );
      DropView( vTempViewVar_1 );
      //:NAME VIEW mMasLC "mMasLC"
      SetNameForView( mMasLC, "mMasLC", null, zLEVEL_TASK );
      //:CommitOI_ToFile( mSubProd, "c:\lplr\epamms\objectback\mMasLC.por", zASCII )
      CommitOI_ToFile( mSubProd, "c:\\lplr\\epamms\\objectback\\mMasLC.por", zASCII );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DELETE_SubregProductSLC( VIEW ViewToWindow )

//:   VIEW mSubProd REGISTERED AS mSubProd
public int 
DELETE_SubregProductSLC( View     ViewToWindow )
{
   zVIEW    mSubProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mSubLC   BASED ON LOD  mSubLC 
   zVIEW    mSubLC = new zVIEW( );
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mSubProd, "mSubProd", ViewToWindow, zLEVEL_TASK );

   //:// Delete selected mSubLC.
   //:ACTIVATE mSubLC WHERE mSubLC.SubregLabelContent.ID = mSubProd.SubregLabelContent.ID 
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, mSubProd, "SubregLabelContent", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_4( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( mSubLC, "mSubLC", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mSubLC "mSubLCDelete"
   SetNameForView( mSubLC, "mSubLCDelete", null, zLEVEL_TASK );
   //:DELETE ENTITY mSubLC.SubregLabelContent 
   RESULT = DeleteEntity( mSubLC, "SubregLabelContent", zPOS_NEXT );
   //:COMMIT mSubLC
   RESULT = CommitObjectInstance( mSubLC );
   //:DropObjectInstance( mSubLC )
   DropObjectInstance( mSubLC );
   //:DropEntity( mSubProd, "SubregLabelContent", zREPOS_NONE )
   DropEntity( mSubProd, "SubregLabelContent", zREPOS_NONE );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:InitSPLD_ForDelete( VIEW ViewToWindow )

public int 
InitSPLD_ForDelete( View     ViewToWindow )
{

   return( 0 );
// END
} 


//:DIALOG OPERATION
//:ConfirmDeleteSubregProduct( VIEW ViewToWindow )

//:   VIEW mSubreg REGISTERED AS mSubreg
public int 
ConfirmDeleteSubregProduct( View     ViewToWindow )
{
   zVIEW    mSubreg = new zVIEW( );
   int      RESULT = 0;
   //:INTEGER lID
   int      lID = 0;
   //:SHORT   nRC
   int      nRC = 0;

   RESULT = GetViewByName( mSubreg, "mSubreg", ViewToWindow, zLEVEL_TASK );

   //:GET VIEW mSubreg NAMED "mSubreg"
   RESULT = GetViewByName( mSubreg, "mSubreg", ViewToWindow, zLEVEL_TASK );
   //:lID = mSubreg.Subregistrant.ID
   {MutableInt mi_lID = new MutableInt( lID );
       GetIntegerFromAttribute( mi_lID, mSubreg, "Subregistrant", "ID" );
   lID = mi_lID.intValue( );}

   //:DELETE ENTITY mSubreg.SubregProduct
   RESULT = DeleteEntity( mSubreg, "SubregProduct", zPOS_NEXT );
   //:COMMIT mSubreg
   RESULT = CommitObjectInstance( mSubreg );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelDeleteSubregProduct( VIEW ViewToWindow )

//:   VIEW mSubProd REGISTERED AS mSubProd 
public int 
CancelDeleteSubregProduct( View     ViewToWindow )
{
   zVIEW    mSubProd = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubProd, "mSubProd", ViewToWindow, zLEVEL_TASK );

   //:// Simply drop the Subreg Product.
   //:DropObjectInstance( mSubProd )
   DropObjectInstance( mSubProd );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_NewSubregProduct( VIEW ViewToWindow )

//:   VIEW mSubreg REGISTERED AS mSubreg
public int 
GOTO_NewSubregProduct( View     ViewToWindow )
{
   zVIEW    mSubreg = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   RESULT = GetViewByName( mSubreg, "mSubreg", ViewToWindow, zLEVEL_TASK );

   //:IF mSubreg.PrimaryRegistrant EXISTS
   lTempInteger_0 = CheckExistenceOfEntity( mSubreg, "PrimaryRegistrant" );
   if ( lTempInteger_0 == 0 )
   { 
      //:IF mSubreg.ListMasterProduct EXISTS
      lTempInteger_1 = CheckExistenceOfEntity( mSubreg, "ListMasterProduct" );
      if ( lTempInteger_1 == 0 )
      { 
         //:RETURN 0
         if(8==8)return( 0 );
         //:ELSE
      } 
      else
      { 
         //:MessageSend( ViewToWindow, "", "New Subregistrant Product",
         //:             "Primary Registrant must have at least one\nMaster Product to create a Subregistrant Product.",
         //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
         MessageSend( ViewToWindow, "", "New Subregistrant Product", "Primary Registrant must have at least one\\nMaster Product to create a Subregistrant Product.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
         //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
         m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
         //:RETURN 2
         if(8==8)return( 2 );
      } 

      //:END
      //:ELSE
   } 
   else
   { 
      //:// This should not be possible.
      //:MessageSend( ViewToWindow, "", "New Subregistrant Product",
      //:             "Subregistrant must be associated with a Primary Registrant\nto create a Subregistrant Product.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "New Subregistrant Product", "Subregistrant must be associated with a Primary Registrant\\nto create a Subregistrant Product.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
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
//:InitListSubregProducts( VIEW ViewToWindow )

//:   VIEW mLLD_LST BASED ON LOD  mLLD
public int 
InitListSubregProducts( View     ViewToWindow )
{
   zVIEW    mLLD_LST = new zVIEW( );
   int      RESULT = 0;


   //:SetDynamicBannerName( ViewToWindow, "wSPLD", "SubregistrantProduct" )
   {
    ZGlobalV_Operation m_ZGlobalV_Operation = new ZGlobalV_Operation( ViewToWindow );
    m_ZGlobalV_Operation.SetDynamicBannerName( ViewToWindow, "wSPLD", "SubregistrantProduct" );
    // m_ZGlobalV_Operation = null;  // permit gc  (unnecessary)
   }

   //:GET VIEW mLLD_LST NAMED "mLLD_LST"
   RESULT = GetViewByName( mLLD_LST, "mLLD_LST", ViewToWindow, zLEVEL_TASK );
   //:IF RESULT >= 0
   if ( RESULT >= 0 )
   { 
      //:DropObjectInstance( mLLD_LST )
      DropObjectInstance( mLLD_LST );
   } 

   //:END
   //:ACTIVATE mLLD_LST RootOnlyMultiple
   RESULT = ActivateObjectInstance( mLLD_LST, "mLLD", ViewToWindow, 0, zACTIVATE_ROOTONLY_MULTIPLE );
   //:NAME VIEW mLLD_LST "mLLD_LST" 
   SetNameForView( mLLD_LST, "mLLD_LST", null, zLEVEL_TASK );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_UpdateSubregProduct( VIEW ViewToWindow )

//:   VIEW mSubreg    REGISTERED AS mSubreg
public int 
GOTO_UpdateSubregProduct( View     ViewToWindow )
{
   zVIEW    mSubreg = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mSubProd   BASED ON LOD  mSubProd 
   zVIEW    mSubProd = new zVIEW( );
   //:VIEW mSubLC     BASED ON LOD  mSubLC 
   zVIEW    mSubLC = new zVIEW( );
   //:VIEW lSPLDLST   BASED ON LOD  lSPLDLST
   zVIEW    lSPLDLST = new zVIEW( );
   //:STRING ( 30 )  szDateTime
   String   szDateTime = null;
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );
   int      lTempInteger_1 = 0;
   zVIEW    vTempViewVar_1 = new zVIEW( );
   int      lTempInteger_2 = 0;
   zVIEW    vTempViewVar_2 = new zVIEW( );

   RESULT = GetViewByName( mSubreg, "mSubreg", ViewToWindow, zLEVEL_TASK );

   //:// Activate selected Subreg Product.
   //:ACTIVATE mSubProd WHERE mSubProd.SubregProduct.ID = mSubreg.SubregProduct.ID 
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, mSubreg, "SubregProduct", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_1( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( mSubProd, "mSubProd", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mSubProd "mSubProd"
   SetNameForView( mSubProd, "mSubProd", null, zLEVEL_TASK );

   //:ACTIVATE lSPLDLST Multiple WHERE lSPLDLST.SubregProduct.ID = mSubreg.SubregProduct.ID 
   {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
       GetIntegerFromAttribute( mi_lTempInteger_1, mSubreg, "SubregProduct", "ID" );
   lTempInteger_1 = mi_lTempInteger_1.intValue( );}
   o_fnLocalBuildQual_2( ViewToWindow, vTempViewVar_1, lTempInteger_1 );
   RESULT = ActivateObjectInstance( lSPLDLST, "lSPLDLST", ViewToWindow, vTempViewVar_1, zMULTIPLE );
   DropView( vTempViewVar_1 );
   //:NAME VIEW lSPLDLST "lSPLDLST"
   SetNameForView( lSPLDLST, "lSPLDLST", null, zLEVEL_TASK );

   //:// Temp code to correct name.
   //:SET CURSOR FIRST mSubProd.SubregLabelContent WHERE mSubProd.SubregLabelContent.Description = ""
   RESULT = SetCursorFirstEntityByString( mSubProd, "SubregLabelContent", "Description", "", "" );
   //:IF RESULT >= zCURSOR_SET
   if ( RESULT >= zCURSOR_SET )
   { 
      //:ACTIVATE mSubLC WHERE mSubLC.SubregLabelContent.ID = mSubProd.SubregLabelContent.ID 
      {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
             GetIntegerFromAttribute( mi_lTempInteger_2, mSubProd, "SubregLabelContent", "ID" );
      lTempInteger_2 = mi_lTempInteger_2.intValue( );}
      o_fnLocalBuildQual_3( ViewToWindow, vTempViewVar_2, lTempInteger_2 );
      RESULT = ActivateObjectInstance( mSubLC, "mSubLC", ViewToWindow, vTempViewVar_2, zSINGLE );
      DropView( vTempViewVar_2 );
      //:NAME VIEW mSubLC "mSubLCName"
      SetNameForView( mSubLC, "mSubLCName", null, zLEVEL_TASK );
      //:mSubLC.SubregLabelContent.Description = "TempName"
      SetAttributeFromString( mSubLC, "SubregLabelContent", "Description", "TempName" );
      //:COMMIT mSubLC
      RESULT = CommitObjectInstance( mSubLC );
      //:DropObjectInstance( mSubLC )
      DropObjectInstance( mSubLC );
   } 

   //:END 
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DeleteSubregProduct( VIEW ViewToWindow )

public int 
DeleteSubregProduct( View     ViewToWindow )
{

   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SaveSubregistrantLabelContent( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
SaveSubregistrantLabelContent( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   //:INTEGER OriginalTypeID
   int      OriginalTypeID = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Name and Version must be entered.
   //:IF mSubLC.SubregLabelContent.Description = "" OR mSubLC.SubregLabelContent.Version = ""
   if ( CompareAttributeToString( mSubLC, "SubregLabelContent", "Description", "" ) == 0 || CompareAttributeToString( mSubLC, "SubregLabelContent", "Version", "" ) == 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Save Subregistrant Label Content",
      //:             "Both a Name and Version must be entered. The SLC was not saved.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Save Subregistrant Label Content", "Both a Name and Version must be entered. The SLC was not saved.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:// Make sure that any selected Components Usage entries have S_Usage entries.
   //:/*FOR EACH mSubLC.CompositeComponentList
   //:   IF mSubLC.CompositeComponentList.Type = "M_DirectionsUsageOrdering" OR 
   //:      mSubLC.CompositeComponentList.Type = "M_MarketingUsageOrdering"
   //:      
   //:      OriginalTypeID = mSubLC.CompositeComponentList.OriginalTypeID 
   //:      SET CURSOR FIRST mSubLC.M_Usage WITHIN mSubLC.SubregLabelContent 
   //:                 WHERE mSubLC.M_Usage.ID = OriginalTypeID
   //:      IF RESULT < zCURSOR_SET
   //:         SET CURSOR FIRST mMasLC.M_Usage WHERE mMasLC.M_Usage.ID = OriginalTypeID
   //:         SET CURSOR LAST mSubLC.S_Usage 
   //:         CREATE ENTITY mSubLC.S_Usage 
   //:         SetMatchingAttributesByName( mSubLC, "S_Usage", mMasLC, "M_Usage", zSET_NULL )
   //:         INCLUDE mSubLC.M_Usage FROM mMasLC.M_Usage 
   //:      END
   //:   END
   //:END*/

   //:// If the S_Usage Statements are null, then we need to first commit mSubLC to get the ID's set.
   //:/*SET CURSOR FIRST mSubLC.S_Usage 
   //:IF mSubLC.S_Usage.ID = ""
   //:   COMMIT mSubLC
   //:END */
   //:// Commit the mSubLC object to make sure any S_Usage statements have ID's.
   //:COMMIT mSubLC
   RESULT = CommitObjectInstance( mSubLC );

   //:// Process any Changes in the CompositeComponentList entries against the main subobject structure of the SLC.
   //:// Note that only Marketing Statements and Usage entries under Directions for Use and Marketing are affected.

   //:// First delete any entries that are in the main structure but not in the Composite Component List.
   //:// Note that we only consider Marketing Statements and Directions Usage and Marketing Usage Statements.
   //:/*FOR EACH mSubLC.S_DirectionsForUseSection 
   //:   FOR EACH mSubLC.S_DirectionsUsageOrdering 
   //:      SET CURSOR FIRST mSubLC.CompositeComponentList 
   //:                 WHERE mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_DirectionsUsage.ID 
   //:                   AND mSubLC.CompositeComponentList.Type               = "M_DirectionsUsageOrdering" 
   //:      IF RESULT < zCURSOR_SET
   //:         //SET CURSOR FIRST mSubLC.S_Usage WHERE mSubLC.S_Usage.ID = mSubLC.S_DirectionsUsage.ID 
   //:         //IF RESULT >= zCURSOR_SET
   //:         //   DELETE ENTITY mSubLC.S_Usage NONE 
   //:         //END 
   //:         DELETE ENTITY mSubLC.S_DirectionsUsageOrdering NONE 
   //:      END
   //:   END
   //:END
   //:FOR EACH mSubLC.S_MarketingSection 
   //:   SET CURSOR FIRST mSubLC.CompositeComponentList 
   //:              WHERE mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_MarketingSection.ID 
   //:                AND mSubLC.CompositeComponentList.Type               = "M_MarketingSection" 
   //:   IF RESULT >= zCURSOR_SET
   //:      // The Marketing Section was NOT deleted.
   //:      FOR EACH mSubLC.S_MarketingStatement 
   //:         SET CURSOR FIRST mSubLC.CompositeComponentList 
   //:                    WHERE mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_MarketingStatement.ID 
   //:                      AND mSubLC.CompositeComponentList.Type               = "M_MarketingStatement" 
   //:         IF RESULT < zCURSOR_SET
   //:            // Delete the Marketing Statement.
   //:            DELETE ENTITY mSubLC.S_MarketingStatement NONE
   //:         ELSE
   //:            // See if we need to delete any Marketing Usage entries.
   //:            FOR EACH mSubLC.S_MarketingUsageOrdering 
   //:               SET CURSOR FIRST mSubLC.CompositeComponentList 
   //:                          WHERE mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_MarketingUsage.ID 
   //:                            AND mSubLC.CompositeComponentList.Type               = "M_MarketingUsageOrdering" 
   //:               IF RESULT < zCURSOR_SET
   //:                  DELETE ENTITY mSubLC.S_MarketingUsageOrdering NONE 
   //:               END
   //:            END
   //:         END
   //:      END
   //:   ELSE
   //:      // The Marketing Section WAS deleted.
   //:      DELETE ENTITY mSubLC.S_MarketingSection NONE
   //:   END
   //:END

   //:// Next add any new CompositeComponentList entries.
   //:// Note that we only consider Marketing Statements and Directions and Marketing Usage Statements.
   //:FOR EACH mSubLC.CompositeComponentList 
   //:   OriginalTypeID = mSubLC.CompositeComponentList.OriginalTypeID
   //:   // Directions for Use Section
   //:   IF mSubLC.CompositeComponentList.Type = "M_DirectionsForUseSection"
   //:      SET CURSOR FIRST mSubLC.M_DirectionsForUseSection WITHIN mSubLC.SubregLabelContent 
   //:                 WHERE mSubLC.M_DirectionsForUseSection.ID = OriginalTypeID 
   //:   END
   //:   
   //:   // Marketing Section
   //:   IF mSubLC.CompositeComponentList.Type = "M_MarketingSection" 
   //:      SET CURSOR FIRST mSubLC.M_MarketingSection WITHIN mSubLC.SubregLabelContent 
   //:                 WHERE mSubLC.M_MarketingSection.ID = OriginalTypeID 
   //:      IF RESULT < zCURSOR_SET
   //:         SET CURSOR FIRST mMasLC.M_MarketingSection 
   //:                    WHERE mMasLC.M_MarketingSection.ID = OriginalTypeID 
   //:         IF RESULT < zCURSOR_SET
   //:            TraceLineI( "######### No match on Marketing Section ID", OriginalTypeID )
   //:         END
   //:         // Add Marketing Section
   //:         CREATE ENTITY mSubLC.S_MarketingSection
   //:         SetMatchingAttributesByName( mSubLC, "S_MarketingSection", mMasLC, "M_MarketingSection", zSET_NULL )
   //:         INCLUDE mSubLC.M_MarketingSection FROM mMasLC.M_MarketingSection
   //:      END
   //:   END
   //:   
   //:   // Marketing Statement
   //:   IF mSubLC.CompositeComponentList.Type = "M_MarketingStatement" 
   //:      SET CURSOR FIRST mSubLC.M_MarketingStatement WITHIN mSubLC.S_MarketingSection 
   //:                 WHERE mSubLC.M_MarketingStatement.ID = OriginalTypeID 
   //:      IF RESULT < zCURSOR_SET
   //:         SET CURSOR FIRST mMasLC.M_MarketingStatement WITHIN mMasLC.MasterLabelContent 
   //:                    WHERE mMasLC.M_MarketingStatement.ID = OriginalTypeID 
   //:         IF RESULT < zCURSOR_SET
   //:            TraceLineI( "######### No match on Marketing Statement ID", OriginalTypeID )
   //:         END
   //:         // Add Marketing Statement
   //:         CREATE ENTITY mSubLC.S_MarketingStatement
   //:         SetMatchingAttributesByName( mSubLC, "S_MarketingStatement", mMasLC, "M_MarketingStatement", zSET_NULL )
   //:         INCLUDE mSubLC.M_MarketingStatement FROM mMasLC.M_MarketingStatement
   //:      END
   //:   END
   //:   
   //:   // Directions for Use Usage
   //:   IF mSubLC.CompositeComponentList.Type = "M_DirectionsUsageOrdering"
   //:      SET CURSOR FIRST mSubLC.M_Usage WITHIN mSubLC.SubregLabelContent 
   //:                 WHERE mSubLC.M_Usage.ID = OriginalTypeID 
   //:      SET CURSOR FIRST mSubLC.S_DirectionsUsage WITHIN mSubLC.S_DirectionsForUseSection 
   //:                 WHERE mSubLC.S_DirectionsUsage.ID = mSubLC.S_Usage.ID 
   //:      IF RESULT < zCURSOR_SET
   //:         CREATE ENTITY mSubLC.S_DirectionsUsageOrdering
   //:         INCLUDE mSubLC.S_DirectionsUsage FROM mSubLC.S_Usage
   //:      END
   //:   END
   //:   
   //:   // Marketing Usage
   //:   IF mSubLC.CompositeComponentList.Type = "M_MarketingUsageOrdering"
   //:      SET CURSOR FIRST mSubLC.M_Usage WITHIN mSubLC.SubregLabelContent 
   //:                 WHERE mSubLC.M_Usage.ID = OriginalTypeID 
   //:      SET CURSOR FIRST mSubLC.S_MarketingUsage WITHIN mSubLC.S_MarketingSection 
   //:                 WHERE mSubLC.S_MarketingUsage.ID = mSubLC.S_Usage.ID
   //:      IF RESULT < zCURSOR_SET
   //:         CREATE ENTITY mSubLC.S_MarketingUsageOrdering
   //:         INCLUDE mSubLC.S_MarketingUsage FROM mSubLC.S_Usage
   //:      END
   //:   END
   //:END

   //:SetAttributeFromCurrentDateTime( mSubLC, "SubregLabelContent", "ModifiedDateTime" )
   //:COMMIT mSubLC
   //:IF RESULT < 0
   //:   MessageSend( ViewToWindow, "", "Save Subregistrant Label Content",
   //:                "An error occurred during the commit. The SLC was not saved.",
   //:                zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
   //:   RETURN 2
   //:END*/
   //:DropObjectInstance( mSubLC )
   DropObjectInstance( mSubLC );
   //:DropObjectInstance( mMasLC )
   DropObjectInstance( mMasLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:PostbuildSLC_Update( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
PostbuildSLC_Update( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mSubLC REGISTERED AS mSubLC
   zVIEW    mSubLC = new zVIEW( );
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Remove any S_Usage statements not tied to M_Usage statements.
   //:FOR EACH mSubLC.S_Usage 
   RESULT = SetCursorFirstEntity( mSubLC, "S_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSubLC.M_Usage DOES NOT EXIST
      lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "M_Usage" );
      if ( lTempInteger_0 != 0 )
      { 
         //:DELETE ENTITY mSubLC.S_Usage NONE 
         RESULT = DeleteEntity( mSubLC, "S_Usage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_Usage", "" );
      //:END
   } 

   //:END

   //:// Go to select any mMLC entries that are already in the mSLC.
   //:SetMLC_SelectedFlags( mMasLC, mSubLC )
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLC );
    m_mMasLC_Object.omMasLC_SetMLC_SelectedFlags( mMasLC, mSubLC );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:CancelSubregistrantLabelContent( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
CancelSubregistrantLabelContent( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:DropObjectInstance( mMasLC )
   DropObjectInstance( mMasLC );
   //:DropObjectInstance( mSubLC )
   DropObjectInstance( mSubLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SELECT_MLC_ForNewSLC( VIEW ViewToWindow )

//:   VIEW mSubProd REGISTERED AS mSubProd
public int 
SELECT_MLC_ForNewSLC( View     ViewToWindow )
{
   zVIEW    mSubProd = new zVIEW( );
   int      RESULT = 0;
   //:VIEW lMLC     REGISTERED AS lMLC
   zVIEW    lMLC = new zVIEW( );
   //:VIEW mSubLC   BASED ON LOD  mSubLC 
   zVIEW    mSubLC = new zVIEW( );
   //:VIEW mMasLC   BASED ON LOD  mMasLC
   zVIEW    mMasLC = new zVIEW( );
   //:INTEGER SelectedContainerVolume
   int      SelectedContainerVolume = 0;
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );

   RESULT = GetViewByName( mSubProd, "mSubProd", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( lMLC, "lMLC", ViewToWindow, zLEVEL_TASK );

   //:// Make sure that a Container Volume has been specified.
   //:// Note that this value is in the first one in the list, which can get reposition below.
   //:IF lMLC.MasterLabelContent.wSelectedContainerVolume = ""
   if ( CompareAttributeToString( lMLC, "MasterLabelContent", "wSelectedContainerVolume", "" ) == 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Select Master Label Content",
      //:             "A Container Size must be specified.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Select Master Label Content", "A Container Size must be specified.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END 
   //:SelectedContainerVolume = lMLC.MasterLabelContent.wSelectedContainerVolume
   {MutableInt mi_SelectedContainerVolume = new MutableInt( SelectedContainerVolume );
       GetIntegerFromAttribute( mi_SelectedContainerVolume, lMLC, "MasterLabelContent", "wSelectedContainerVolume" );
   SelectedContainerVolume = mi_SelectedContainerVolume.intValue( );}

   //:// Make sure that an MLC has been selected.
   //:SET CURSOR FIRST lMLC.MasterLabelContent WHERE lMLC.MasterLabelContent.wSelected = "Y"
   RESULT = SetCursorFirstEntityByString( lMLC, "MasterLabelContent", "wSelected", "Y", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:MessageSend( ViewToWindow, "", "Select Master Label Content",
      //:             "An MLC must be selected.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Select Master Label Content", "An MLC must be selected.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END 

   //:// Create a new empty Subregistrant SLC.
   //:ACTIVATE mSubLC EMPTY 
   RESULT = ActivateEmptyObjectInstance( mSubLC, "mSubLC", ViewToWindow, zSINGLE );
   //:NAME VIEW mSubLC "mSubLC"
   SetNameForView( mSubLC, "mSubLC", null, zLEVEL_TASK );
   //:CREATE ENTITY mSubLC.SubregLabelContent 
   RESULT = CreateEntity( mSubLC, "SubregLabelContent", zPOS_AFTER );
   //:INCLUDE mSubLC.SubregProduct FROM mSubProd.SubregProduct 
   RESULT = IncludeSubobjectFromSubobject( mSubLC, "SubregProduct", mSubProd, "SubregProduct", zPOS_AFTER );
   //:mSubLC.SubregLabelContent.wContainerSize = SelectedContainerVolume 
   SetAttributeFromInteger( mSubLC, "SubregLabelContent", "wContainerSize", SelectedContainerVolume );

   //:// Activate the selected MLC, which has the selectable content.
   //:ACTIVATE mMasLC WHERE mMasLC.MasterLabelContent.ID = lMLC.MasterLabelContent.ID 
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, lMLC, "MasterLabelContent", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   o_fnLocalBuildQual_0( ViewToWindow, vTempViewVar_0, lTempInteger_0 );
   RESULT = ActivateObjectInstance( mMasLC, "mMasLC", ViewToWindow, vTempViewVar_0, zSINGLE );
   DropView( vTempViewVar_0 );
   //:NAME VIEW mMasLC "mMasLC"
   SetNameForView( mMasLC, "mMasLC", null, zLEVEL_TASK );
   //:INCLUDE mSubLC.MasterLabelContent FROM mMasLC.MasterLabelContent 
   RESULT = IncludeSubobjectFromSubobject( mSubLC, "MasterLabelContent", mMasLC, "MasterLabelContent", zPOS_AFTER );
   //:BuildCompositeEntries( mMasLC )
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLC );
    m_mMasLC_Object.omMasLC_BuildCompositeEntries( mMasLC );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }

   //:// Initialize the data in the SLC from the MLC.
   //:BuildSLC_FromMLC( mSubLC, mMasLC )
   {
    mSubLC_Object m_mSubLC_Object = new mSubLC_Object( mSubLC );
    m_mSubLC_Object.omSubLC_BuildSLC_FromMLC( mSubLC, mMasLC );
    // m_mSubLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
//    
//    // Build SLC Components subobject.
//    //BuildCompositeEntries( mSubLC )
// END
} 


//:DIALOG OPERATION
//:GOTO_SelectRemoveMktgStatements( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
GOTO_SelectRemoveMktgStatements( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Make sure the SLC Components are built.
   //:BuildCompositeEntries( mSubLC )
   {
    mSubLC_Object m_mSubLC_Object = new mSubLC_Object( mSubLC );
    m_mSubLC_Object.omSubLC_BuildCompositeEntries( mSubLC );
    // m_mSubLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SelectMLC_ComponentsForSLC( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
SelectMLC_ComponentsForSLC( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// For each selected MLC Marketing Statement, add the corresponding SLC Marketing Statement, along
   //:// with the Marketing Section parent, if necessary.
   //:// Then rebuild the SLC Component entries.

   //:// Create SLC Maketing Statements and necessary parent Marketing Sections.
   //:FOR EACH mMasLC.CompositeComponentList 
   RESULT = SetCursorFirstEntity( mMasLC, "CompositeComponentList", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.CompositeComponentList.Selected = "Y" AND 
      //:   mMasLC.CompositeComponentList.Type = "M_MarketingStatement"
      if ( CompareAttributeToString( mMasLC, "CompositeComponentList", "Selected", "Y" ) == 0 && CompareAttributeToString( mMasLC, "CompositeComponentList", "Type", "M_MarketingStatement" ) == 0 )
      { 

         //:SET CURSOR FIRST mMasLC.M_MarketingStatement WITHIN mMasLC.MasterLabelContent 
         //:           WHERE mMasLC.M_MarketingStatement.ID = mMasLC.CompositeComponentList.OriginalTypeID 
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                   GetIntegerFromAttribute( mi_lTempInteger_0, mMasLC, "CompositeComponentList", "OriginalTypeID" );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_MarketingStatement", "ID", lTempInteger_0, "MasterLabelContent" );
         //:SET CURSOR FIRST mSubLC.M_MarketingSection WITHIN mSubLC.SubregLabelContent 
         //:           WHERE mSubLC.M_MarketingSection.ID = mMasLC.M_MarketingSection.ID 
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                   GetIntegerFromAttribute( mi_lTempInteger_1, mMasLC, "M_MarketingSection", "ID" );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "M_MarketingSection", "ID", lTempInteger_1, "SubregLabelContent" );
         //:IF RESULT < zCURSOR_SET
         if ( RESULT < zCURSOR_SET )
         { 
            //:CREATE ENTITY mSubLC.S_MarketingSection 
            RESULT = CreateEntity( mSubLC, "S_MarketingSection", zPOS_AFTER );
            //:SetMatchingAttributesByName( mSubLC, "S_MarketingSection", mMasLC, "M_MarketingSection", zSET_NULL )
            SetMatchingAttributesByName( mSubLC, "S_MarketingSection", mMasLC, "M_MarketingSection", zSET_NULL );
            //:INCLUDE mSubLC.M_MarketingSection FROM mMasLC.M_MarketingSection  
            RESULT = IncludeSubobjectFromSubobject( mSubLC, "M_MarketingSection", mMasLC, "M_MarketingSection", zPOS_AFTER );
         } 

         //:END
         //:SET CURSOR FIRST mSubLC.M_MarketingStatement WITHIN mSubLC.S_MarketingSection 
         //:           WHERE mSubLC.M_MarketingStatement.ID = mMasLC.M_MarketingStatement.ID 
         {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                   GetIntegerFromAttribute( mi_lTempInteger_2, mMasLC, "M_MarketingStatement", "ID" );
         lTempInteger_2 = mi_lTempInteger_2.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "M_MarketingStatement", "ID", lTempInteger_2, "S_MarketingSection" );
         //:IF RESULT < zCURSOR_SET
         if ( RESULT < zCURSOR_SET )
         { 
            //:CREATE ENTITY mSubLC.S_MarketingStatement 
            RESULT = CreateEntity( mSubLC, "S_MarketingStatement", zPOS_AFTER );
            //:SetMatchingAttributesByName( mSubLC, "S_MarketingStatement", mMasLC, "M_MarketingStatement", zSET_NULL )
            SetMatchingAttributesByName( mSubLC, "S_MarketingStatement", mMasLC, "M_MarketingStatement", zSET_NULL );
            //:INCLUDE mSubLC.M_MarketingStatement FROM mMasLC.M_MarketingStatement  
            RESULT = IncludeSubobjectFromSubobject( mSubLC, "M_MarketingStatement", mMasLC, "M_MarketingStatement", zPOS_AFTER );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mMasLC, "CompositeComponentList", "" );
      //:END
   } 

   //:END

   //:// Rebuild the Marketing Components.
   //:BuildCompositeEntries( mSubLC )
   {
    mSubLC_Object m_mSubLC_Object = new mSubLC_Object( mSubLC );
    m_mSubLC_Object.omSubLC_BuildCompositeEntries( mSubLC );
    // m_mSubLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DeleteMLC_ComponentsForSLC( VIEW ViewToWindow )

//:   VIEW mSubLC  REGISTERED AS mSubLC
public int 
DeleteMLC_ComponentsForSLC( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC  REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// For each selected Marketing Statement from the Components subobject, delete the corresponding
   //:// S_MarketingStatement entity. 
   //:// Then delete any Marketing Section entities without a MarketStatement subobject.
   //:// Finally, rebuild the Components subobject.

   //:// Delete selected Marketing Statement entries.
   //:FOR EACH mSubLC.CompositeComponentList 
   RESULT = SetCursorFirstEntity( mSubLC, "CompositeComponentList", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSubLC.CompositeComponentList.Selected = "Y" AND 
      //:   mSubLC.CompositeComponentList.Type = "M_MarketingStatement"
      if ( CompareAttributeToString( mSubLC, "CompositeComponentList", "Selected", "Y" ) == 0 && CompareAttributeToString( mSubLC, "CompositeComponentList", "Type", "M_MarketingStatement" ) == 0 )
      { 

         //:SET CURSOR FIRST mSubLC.S_MarketingStatement WITHIN mSubLC.SubregLabelContent 
         //:           WHERE mSubLC.S_MarketingStatement.ID = mSubLC.CompositeComponentList.SLC_OriginalTypeID 
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                   GetIntegerFromAttribute( mi_lTempInteger_0, mSubLC, "CompositeComponentList", "SLC_OriginalTypeID" );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_MarketingStatement", "ID", lTempInteger_0, "SubregLabelContent" );
         //:DELETE ENTITY mSubLC.S_MarketingStatement   
         RESULT = DeleteEntity( mSubLC, "S_MarketingStatement", zPOS_NEXT );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "CompositeComponentList", "" );
      //:END
   } 

   //:END

   //:// Delete Marketing Sections without Marketing Statements.
   //:FOR EACH mSubLC.S_MarketingSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSubLC.S_MarketingStatement DOES NOT EXIST
      lTempInteger_1 = CheckExistenceOfEntity( mSubLC, "S_MarketingStatement" );
      if ( lTempInteger_1 != 0 )
      { 
         //:DELETE ENTITY mSubLC.S_MarketingSection  
         RESULT = DeleteEntity( mSubLC, "S_MarketingSection", zPOS_NEXT );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_MarketingSection", "" );
      //:END
   } 

   //:END

   //:// Rebuild the Marketing Components.
   //:BuildCompositeEntries( mSubLC )
   {
    mSubLC_Object m_mSubLC_Object = new mSubLC_Object( mSubLC );
    m_mSubLC_Object.omSubLC_BuildCompositeEntries( mSubLC );
    // m_mSubLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_SelectRemoveDUEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
GOTO_SelectRemoveDUEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC  REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on corresponding DirectionsForUseStatement entity in MLC to get list of potential Usage entries.
   //:SET CURSOR FIRST mMasLC.M_DirectionsForUseStatement 
   //:           WHERE mMasLC.M_DirectionsForUseStatement.ID = mSubLC.M_DirectionsForUseStatement.ID 
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, mSubLC, "M_DirectionsForUseStatement", "ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_DirectionsForUseStatement", "ID", lTempInteger_0, "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SelectDirsForUseUsageEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
SelectDirsForUseUsageEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Include each selected Usage Source entry in the Target subobject.
   //:FOR EACH mSubLC.S_SelectableDirsForUseUsage 
   RESULT = SetCursorFirstEntity( mSubLC, "S_SelectableDirsForUseUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSubLC.S_SelectableDirsForUseUsage.wSelected = "Y"
      if ( CompareAttributeToString( mSubLC, "S_SelectableDirsForUseUsage", "wSelected", "Y" ) == 0 )
      { 
         //:SET CURSOR FIRST mSubLC.S_DirectionsUsage WITHIN mSubLC.S_DirectionsForUseStatement 
         //:           WHERE mSubLC.S_DirectionsUsage.ID = mSubLC.S_SelectableDirsForUseUsage.ID 
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                   GetIntegerFromAttribute( mi_lTempInteger_0, mSubLC, "S_SelectableDirsForUseUsage", "ID" );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_DirectionsUsage", "ID", lTempInteger_0, "S_DirectionsForUseStatement" );
         //:IF RESULT < zCURSOR_SET
         if ( RESULT < zCURSOR_SET )
         { 
            //:CREATE ENTITY mSubLC.S_DirectionsUsageOrdering 
            RESULT = CreateEntity( mSubLC, "S_DirectionsUsageOrdering", zPOS_AFTER );
            //:INCLUDE mSubLC.S_DirectionsUsage FROM mSubLC.S_SelectableDirsForUseUsage 
            RESULT = IncludeSubobjectFromSubobject( mSubLC, "S_DirectionsUsage", mSubLC, "S_SelectableDirsForUseUsage", zPOS_AFTER );
         } 

         //:END 
         //:mSubLC.S_SelectableDirsForUseUsage.wSelected = ""
         SetAttributeFromString( mSubLC, "S_SelectableDirsForUseUsage", "wSelected", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_SelectableDirsForUseUsage", "" );
      //:END
   } 

   //:END
   //:SET CURSOR FIRST mSubLC.S_DirectionsUsageOrdering 
   RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsUsageOrdering", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:RemoveDirsForUseUsageEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
RemoveDirsForUseUsageEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Remove each selected Usage entry.
   //:FOR EACH mSubLC.S_DirectionsUsageOrdering 
   RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsUsageOrdering", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSubLC.S_DirectionsUsageOrdering.wSelected = "Y"
      if ( CompareAttributeToString( mSubLC, "S_DirectionsUsageOrdering", "wSelected", "Y" ) == 0 )
      { 
         //:DELETE ENTITY mSubLC.S_DirectionsUsageOrdering NONE 
         RESULT = DeleteEntity( mSubLC, "S_DirectionsUsageOrdering", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsUsageOrdering", "" );
      //:END
   } 

   //:END
   //:SET CURSOR FIRST mSubLC.S_DirectionsUsageOrdering 
   RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsUsageOrdering", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SelectMarketingUsageEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
SelectMarketingUsageEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Include each selected Usage Source entry in the Target subobject.
   //:FOR EACH mSubLC.S_SelectableMarketingUsage 
   RESULT = SetCursorFirstEntity( mSubLC, "S_SelectableMarketingUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSubLC.S_SelectableMarketingUsage.wSelected = "Y"
      if ( CompareAttributeToString( mSubLC, "S_SelectableMarketingUsage", "wSelected", "Y" ) == 0 )
      { 
         //:SET CURSOR FIRST mSubLC.S_MarketingUsage WITHIN mSubLC.S_MarketingStatement 
         //:           WHERE mSubLC.S_MarketingUsage.ID = mSubLC.S_SelectableMarketingUsage.ID 
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                   GetIntegerFromAttribute( mi_lTempInteger_0, mSubLC, "S_SelectableMarketingUsage", "ID" );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_MarketingUsage", "ID", lTempInteger_0, "S_MarketingStatement" );
         //:IF RESULT < zCURSOR_SET
         if ( RESULT < zCURSOR_SET )
         { 
            //:CREATE ENTITY mSubLC.S_MarketingUsageOrdering 
            RESULT = CreateEntity( mSubLC, "S_MarketingUsageOrdering", zPOS_AFTER );
            //:INCLUDE mSubLC.S_MarketingUsage FROM mSubLC.S_SelectableMarketingUsage 
            RESULT = IncludeSubobjectFromSubobject( mSubLC, "S_MarketingUsage", mSubLC, "S_SelectableMarketingUsage", zPOS_AFTER );
         } 

         //:END 
         //:mSubLC.S_SelectableMarketingUsage.wSelected = ""
         SetAttributeFromString( mSubLC, "S_SelectableMarketingUsage", "wSelected", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_SelectableMarketingUsage", "" );
      //:END
   } 

   //:END
   //:SET CURSOR FIRST mSubLC.S_MarketingUsageOrdering 
   RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingUsageOrdering", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:RemoveMarketingUsageEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
RemoveMarketingUsageEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Remove each selected Usage entry.
   //:FOR EACH mSubLC.S_MarketingUsageOrdering 
   RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingUsageOrdering", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSubLC.S_MarketingUsageOrdering.wSelected = "Y"
      if ( CompareAttributeToString( mSubLC, "S_MarketingUsageOrdering", "wSelected", "Y" ) == 0 )
      { 
         //:DELETE ENTITY mSubLC.S_MarketingUsageOrdering NONE 
         RESULT = DeleteEntity( mSubLC, "S_MarketingUsageOrdering", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_MarketingUsageOrdering", "" );
      //:END
   } 

   //:END
   //:SET CURSOR FIRST mSubLC.S_MarketingUsageOrdering 
   RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingUsageOrdering", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SaveSLC( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
SaveSLC( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Temporary code to set MLC pointers from included MLC entities.
   //:FOR EACH mSubLC.S_GeneralSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mSubLC.S_GeneralSection.PrimaryMLC_ID = mSubLC.M_GeneralSection.ID  
      SetAttributeFromAttribute( mSubLC, "S_GeneralSection", "PrimaryMLC_ID", mSubLC, "M_GeneralSection", "ID" );
      //:FOR EACH mSubLC.S_GeneralStatement 
      RESULT = SetCursorFirstEntity( mSubLC, "S_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mSubLC.S_GeneralStatement.PrimaryMLC_ID = mSubLC.M_GeneralStatement.ID 
         SetAttributeFromAttribute( mSubLC, "S_GeneralStatement", "PrimaryMLC_ID", mSubLC, "M_GeneralStatement", "ID" );
         RESULT = SetCursorNextEntity( mSubLC, "S_GeneralStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_GeneralSection", "" );
      //:END
   } 

   //:END
   //:FOR EACH mSubLC.S_IngredientsSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mSubLC.S_IngredientsSection.PrimaryMLC_ID = mSubLC.M_IngredientsSection.ID 
      SetAttributeFromAttribute( mSubLC, "S_IngredientsSection", "PrimaryMLC_ID", mSubLC, "M_IngredientsSection", "ID" );
      //:FOR EACH mSubLC.S_IngredientsStatement 
      RESULT = SetCursorFirstEntity( mSubLC, "S_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mSubLC.S_IngredientsStatement.PrimaryMLC_ID = mSubLC.M_IngredientsStatement.ID 
         SetAttributeFromAttribute( mSubLC, "S_IngredientsStatement", "PrimaryMLC_ID", mSubLC, "M_IngredientsStatement", "ID" );
         RESULT = SetCursorNextEntity( mSubLC, "S_IngredientsStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_IngredientsSection", "" );
      //:END
   } 

   //:END
   //:FOR EACH mSubLC.S_StorageDisposalSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mSubLC.S_StorageDisposalSection.PrimaryMLC_ID = mSubLC.M_StorageDisposalSection.ID 
      SetAttributeFromAttribute( mSubLC, "S_StorageDisposalSection", "PrimaryMLC_ID", mSubLC, "M_StorageDisposalSection", "ID" );
      //:FOR EACH mSubLC.S_StorageDisposalStatement 
      RESULT = SetCursorFirstEntity( mSubLC, "S_StorageDisposalStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mSubLC.S_StorageDisposalStatement.PrimaryMLC_ID = mSubLC.M_StorageDisposalStatement.ID 
         SetAttributeFromAttribute( mSubLC, "S_StorageDisposalStatement", "PrimaryMLC_ID", mSubLC, "M_StorageDisposalStatement", "ID" );
         RESULT = SetCursorNextEntity( mSubLC, "S_StorageDisposalStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_StorageDisposalSection", "" );
      //:END
   } 

   //:END
   //:FOR EACH mSubLC.S_DirectionsForUseSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mSubLC.S_DirectionsForUseSection.PrimaryMLC_ID = mSubLC.M_DirectionsForUseSection.ID 
      SetAttributeFromAttribute( mSubLC, "S_DirectionsForUseSection", "PrimaryMLC_ID", mSubLC, "M_DirectionsForUseSection", "ID" );
      //:FOR EACH mSubLC.S_DirectionsForUseStatement 
      RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mSubLC.S_DirectionsForUseStatement.PrimaryMLC_ID = mSubLC.M_DirectionsForUseStatement.ID 
         SetAttributeFromAttribute( mSubLC, "S_DirectionsForUseStatement", "PrimaryMLC_ID", mSubLC, "M_DirectionsForUseStatement", "ID" );
         RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseSection", "" );
      //:END
   } 

   //:END
   //:FOR EACH mSubLC.S_MarketingSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mSubLC.S_MarketingSection.PrimaryMLC_ID = mSubLC.M_MarketingSection.ID 
      SetAttributeFromAttribute( mSubLC, "S_MarketingSection", "PrimaryMLC_ID", mSubLC, "M_MarketingSection", "ID" );
      //:FOR EACH mSubLC.S_MarketingStatement 
      RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mSubLC.S_MarketingStatement.PrimaryMLC_ID = mSubLC.M_MarketingStatement.ID 
         SetAttributeFromAttribute( mSubLC, "S_MarketingStatement", "PrimaryMLC_ID", mSubLC, "M_MarketingStatement", "ID" );
         RESULT = SetCursorNextEntity( mSubLC, "S_MarketingStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_MarketingSection", "" );
      //:END
   } 

   //:END
   //:FOR EACH mSubLC.S_HumanHazardSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_HumanHazardSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mSubLC.S_HumanHazardSection.PrimaryMLC_ID = mSubLC.M_HumanHazardSection.ID 
      SetAttributeFromAttribute( mSubLC, "S_HumanHazardSection", "PrimaryMLC_ID", mSubLC, "M_HumanHazardSection", "ID" );
      RESULT = SetCursorNextEntity( mSubLC, "S_HumanHazardSection", "" );
   } 

   //:END
   //:FOR EACH mSubLC.S_DilutionGroup 
   RESULT = SetCursorFirstEntity( mSubLC, "S_DilutionGroup", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mSubLC.S_DilutionGroup.PrimaryMLC_ID = mSubLC.M_DilutionGroup.ID 
      SetAttributeFromAttribute( mSubLC, "S_DilutionGroup", "PrimaryMLC_ID", mSubLC, "M_DilutionGroup", "ID" );
      RESULT = SetCursorNextEntity( mSubLC, "S_DilutionGroup", "" );
   } 

   //:END

   //:COMMIT mSubLC
   RESULT = CommitObjectInstance( mSubLC );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DisplaySurfacesSection( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
DisplaySurfacesSection( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on Surfaces Usage Type.
   //:SET CURSOR FIRST mSubLC.S_UsageType WHERE mSubLC.S_UsageType.UsageType = "S" 
   RESULT = SetCursorFirstEntityByString( mSubLC, "S_UsageType", "UsageType", "S", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mSubLC.S_UsageType 
      RESULT = CreateEntity( mSubLC, "S_UsageType", zPOS_AFTER );
      //:mSubLC.S_UsageType.UsageType = "S" 
      SetAttributeFromString( mSubLC, "S_UsageType", "UsageType", "S" );
   } 

   //:END
   //:mSubLC.SubregLabelContent.wUsageSelectionText = "Surfaces"
   SetAttributeFromString( mSubLC, "SubregLabelContent", "wUsageSelectionText", "Surfaces" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DisplayPrecautionarySection( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
DisplayPrecautionarySection( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on "Precautionary" General Statement.
   //:SET CURSOR FIRST mSubLC.S_GeneralSection WHERE mSubLC.S_GeneralSection.SectionType = "P"
   RESULT = SetCursorFirstEntityByString( mSubLC, "S_GeneralSection", "SectionType", "P", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DisplayHazardsSection( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
DisplayHazardsSection( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on "Hazards" General Statement.
   //:SET CURSOR FIRST mSubLC.S_GeneralSection WHERE mSubLC.S_GeneralSection.SectionType = "E"
   RESULT = SetCursorFirstEntityByString( mSubLC, "S_GeneralSection", "SectionType", "E", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DisplayFirstAidSection( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
DisplayFirstAidSection( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on "First Aid" General Statement.
   //:SET CURSOR FIRST mSubLC.S_GeneralSection WHERE mSubLC.S_GeneralSection.SectionType = "F"
   RESULT = SetCursorFirstEntityByString( mSubLC, "S_GeneralSection", "SectionType", "F", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DisplayClaimsSection( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
DisplayClaimsSection( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on Claims Usage Type.
   //:SET CURSOR FIRST mSubLC.S_UsageType WHERE mSubLC.S_UsageType.UsageType = "C" 
   RESULT = SetCursorFirstEntityByString( mSubLC, "S_UsageType", "UsageType", "C", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mSubLC.S_UsageType 
      RESULT = CreateEntity( mSubLC, "S_UsageType", zPOS_AFTER );
      //:mSubLC.S_UsageType.UsageType = "C" 
      SetAttributeFromString( mSubLC, "S_UsageType", "UsageType", "C" );
   } 

   //:END
   //:mSubLC.SubregLabelContent.wUsageSelectionText = "Claims"
   SetAttributeFromString( mSubLC, "SubregLabelContent", "wUsageSelectionText", "Claims" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DisplayAreasOfUseSection( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
DisplayAreasOfUseSection( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on Areas of Use Usage Type.
   //:SET CURSOR FIRST mSubLC.S_UsageType WHERE mSubLC.S_UsageType.UsageType = "U" 
   RESULT = SetCursorFirstEntityByString( mSubLC, "S_UsageType", "UsageType", "U", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mSubLC.S_UsageType 
      RESULT = CreateEntity( mSubLC, "S_UsageType", zPOS_AFTER );
      //:mSubLC.S_UsageType.UsageType = "U" 
      SetAttributeFromString( mSubLC, "S_UsageType", "UsageType", "U" );
   } 

   //:END
   //:mSubLC.SubregLabelContent.wUsageSelectionText = "Areas of Use"
   SetAttributeFromString( mSubLC, "SubregLabelContent", "wUsageSelectionText", "Areas of Use" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DisplayApplicationTypesSection( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
DisplayApplicationTypesSection( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on Application Types Usage Type.
   //:SET CURSOR FIRST mSubLC.S_UsageType WHERE mSubLC.S_UsageType.UsageType = "T" 
   RESULT = SetCursorFirstEntityByString( mSubLC, "S_UsageType", "UsageType", "T", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mSubLC.S_UsageType 
      RESULT = CreateEntity( mSubLC, "S_UsageType", zPOS_AFTER );
      //:mSubLC.S_UsageType.UsageType = "T" 
      SetAttributeFromString( mSubLC, "S_UsageType", "UsageType", "T" );
   } 

   //:END
   //:mSubLC.SubregLabelContent.wUsageSelectionText = "Application Types"
   SetAttributeFromString( mSubLC, "SubregLabelContent", "wUsageSelectionText", "Application Types" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:SelectMLC_UsageEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
SelectMLC_UsageEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Include each selected Usage Source entry in the Target subobject, S_Usage.
   //:FOR EACH mMasLC.M_Usage 
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_Usage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_Usage", "wSelected", "Y" ) == 0 )
      { 
         //:SET CURSOR FIRST mSubLC.S_Usage WHERE mSubLC.S_Usage.ID = mMasLC.M_Usage.ID 
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                   GetIntegerFromAttribute( mi_lTempInteger_0, mMasLC, "M_Usage", "ID" );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_Usage", "ID", lTempInteger_0, "" );
         //:IF RESULT < zCURSOR_SET
         if ( RESULT < zCURSOR_SET )
         { 
            //:CREATE ENTITY mSubLC.S_Usage 
            RESULT = CreateEntity( mSubLC, "S_Usage", zPOS_AFTER );
            //:SetMatchingAttributesByName( mSubLC, "S_Usage", mMasLC, "M_Usage", zSET_NULL ) 
            SetMatchingAttributesByName( mSubLC, "S_Usage", mMasLC, "M_Usage", zSET_NULL );
            //:mSubLC.S_Usage.wSelected = ""
            SetAttributeFromString( mSubLC, "S_Usage", "wSelected", "" );
            //:mSubLC.S_Usage.PrimaryMLC_ID = mMasLC.M_Usage.ID 
            SetAttributeFromAttribute( mSubLC, "S_Usage", "PrimaryMLC_ID", mMasLC, "M_Usage", "ID" );
         } 

         //:END 
         //:mMasLC.M_Usage.wSelected = ""
         SetAttributeFromString( mMasLC, "M_Usage", "wSelected", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
      //:END
   } 

   //:END
   //:OrderEntityForView( mSubLC, "S_Usage", "dDisplayUsageName A" )
   OrderEntityForView( mSubLC, "S_Usage", "dDisplayUsageName A" );
   //:SET CURSOR FIRST mSubLC.S_Usage  
   RESULT = SetCursorFirstEntity( mSubLC, "S_Usage", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:RemoveSLC_UsageEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
RemoveSLC_UsageEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Remove each selected S_Usage entry.
   //:FOR EACH mSubLC.S_Usage 
   RESULT = SetCursorFirstEntity( mSubLC, "S_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSubLC.S_Usage.wSelected = "Y"
      if ( CompareAttributeToString( mSubLC, "S_Usage", "wSelected", "Y" ) == 0 )
      { 
         //:DELETE ENTITY mSubLC.S_Usage NONE 
         RESULT = DeleteEntity( mSubLC, "S_Usage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_Usage", "" );
      //:END
   } 

   //:END
   //:SET CURSOR FIRST mSubLC.S_Usage 
   RESULT = SetCursorFirstEntity( mSubLC, "S_Usage", "" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_SelectClaimsUsageEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
GOTO_SelectClaimsUsageEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Give Error Message if MLC doesn't have Claims Usage Types.
   //:SET CURSOR FIRST mMasLC.M_UsageType WHERE mMasLC.M_UsageType.UsageType = "C"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageType", "UsageType", "C", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:MessageSend( ViewToWindow, "", "Select MLC Claims Entries",
      //:             "The Master Product does not have any Claims entries.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Select MLC Claims Entries", "The Master Product does not have any Claims entries.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END 

   //:// Position on SLC and MLC Claims Usage Type.
   //:SET CURSOR FIRST mSubLC.S_UsageType WHERE mSubLC.S_UsageType.UsageType = "C"
   RESULT = SetCursorFirstEntityByString( mSubLC, "S_UsageType", "UsageType", "C", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mSubLC.S_UsageType 
      RESULT = CreateEntity( mSubLC, "S_UsageType", zPOS_AFTER );
      //:mSubLC.S_UsageType.UsageType = "C"
      SetAttributeFromString( mSubLC, "S_UsageType", "UsageType", "C" );
   } 

   //:END
   //:CreateTemporalSubobjectVersion( mSubLC, "S_UsageType" )
   CreateTemporalSubobjectVersion( mSubLC, "S_UsageType" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_SelectApplsUsageEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
GOTO_SelectApplsUsageEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Give Error Message if MLC doesn't have Claims Usage Types.
   //:SET CURSOR FIRST mMasLC.M_UsageType WHERE mMasLC.M_UsageType.UsageType = "T"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageType", "UsageType", "T", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:MessageSend( ViewToWindow, "", "Select MLC Claims Entries",
      //:             "The Master Product does not have any Claims entries.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Select MLC Claims Entries", "The Master Product does not have any Claims entries.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END 

   //:// Position on SLC and MLC Claims Usage Type.
   //:SET CURSOR FIRST mSubLC.S_UsageType WHERE mSubLC.S_UsageType.UsageType = "T"
   RESULT = SetCursorFirstEntityByString( mSubLC, "S_UsageType", "UsageType", "T", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mSubLC.S_UsageType 
      RESULT = CreateEntity( mSubLC, "S_UsageType", zPOS_AFTER );
      //:mSubLC.S_UsageType.UsageType = "T"
      SetAttributeFromString( mSubLC, "S_UsageType", "UsageType", "T" );
   } 

   //:END
   //:CreateTemporalSubobjectVersion( mSubLC, "S_UsageType" )
   CreateTemporalSubobjectVersion( mSubLC, "S_UsageType" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_SelectSurfacesUsageEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
GOTO_SelectSurfacesUsageEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Give Error Message if MLC doesn't have Claims Usage Types.
   //:SET CURSOR FIRST mMasLC.M_UsageType WHERE mMasLC.M_UsageType.UsageType = "S"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageType", "UsageType", "S", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:MessageSend( ViewToWindow, "", "Select MLC Claims Entries",
      //:             "The Master Product does not have any Claims entries.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Select MLC Claims Entries", "The Master Product does not have any Claims entries.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END 

   //:// Position on SLC and MLC Claims Usage Type.
   //:SET CURSOR FIRST mSubLC.S_UsageType WHERE mSubLC.S_UsageType.UsageType = "S"
   RESULT = SetCursorFirstEntityByString( mSubLC, "S_UsageType", "UsageType", "S", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mSubLC.S_UsageType 
      RESULT = CreateEntity( mSubLC, "S_UsageType", zPOS_AFTER );
      //:mSubLC.S_UsageType.UsageType = "S"
      SetAttributeFromString( mSubLC, "S_UsageType", "UsageType", "S" );
   } 

   //:END
   //:CreateTemporalSubobjectVersion( mSubLC, "S_UsageType" )
   CreateTemporalSubobjectVersion( mSubLC, "S_UsageType" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_SelectAreasUsageEntries( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
GOTO_SelectAreasUsageEntries( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Give Error Message if MLC doesn't have Claims Usage Types.
   //:SET CURSOR FIRST mMasLC.M_UsageType WHERE mMasLC.M_UsageType.UsageType = "U"
   RESULT = SetCursorFirstEntityByString( mMasLC, "M_UsageType", "UsageType", "U", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:MessageSend( ViewToWindow, "", "Select MLC Claims Entries",
      //:             "The Master Product does not have any Claims entries.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Select MLC Claims Entries", "The Master Product does not have any Claims entries.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" )
      m_ZDRVROPR.SetWindowActionBehavior( ViewToWindow, zWAB_StayOnWindow, "", "" );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END 

   //:// Position on SLC and MLC Claims Usage Type.
   //:SET CURSOR FIRST mSubLC.S_UsageType WHERE mSubLC.S_UsageType.UsageType = "U"
   RESULT = SetCursorFirstEntityByString( mSubLC, "S_UsageType", "UsageType", "U", "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:CREATE ENTITY mSubLC.S_UsageType 
      RESULT = CreateEntity( mSubLC, "S_UsageType", zPOS_AFTER );
      //:mSubLC.S_UsageType.UsageType = "U"
      SetAttributeFromString( mSubLC, "S_UsageType", "UsageType", "U" );
   } 

   //:END
   //:CreateTemporalSubobjectVersion( mSubLC, "S_UsageType" )
   CreateTemporalSubobjectVersion( mSubLC, "S_UsageType" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_MarketingStatementDetail( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
GOTO_MarketingStatementDetail( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on the correct Marketing Statement based on position on the corresponding Components entry.
   //:// If we're positioned on a Marketing Section component, give error.
   //:IF mSubLC.CompositeComponentList.Type = "M_MarketingSection"
   if ( CompareAttributeToString( mSubLC, "CompositeComponentList", "Type", "M_MarketingSection" ) == 0 )
   { 
      //:MessageSend( ViewToWindow, "", "Marketing Statement Detail",
      //:             "Only a Marketing Statement can be selected.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Marketing Statement Detail", "Only a Marketing Statement can be selected.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
      //:ELSE
   } 
   else
   { 
      //:SET CURSOR FIRST mSubLC.S_MarketingStatement WITHIN mSubLC.SubregLabelContent 
      //:           WHERE mSubLC.S_MarketingStatement.ID = mSubLC.CompositeComponentList.SLC_OriginalTypeID 
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
             GetIntegerFromAttribute( mi_lTempInteger_0, mSubLC, "CompositeComponentList", "SLC_OriginalTypeID" );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_MarketingStatement", "ID", lTempInteger_0, "SubregLabelContent" );
   } 

   //:END
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:AcceptUsageTypeUpdate( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
AcceptUsageTypeUpdate( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Accept the UsageType subobject and go to build Directions for Use entries based on Usage entries.
   //:AcceptSubobject( mSubLC, "S_UsageType" )
   AcceptSubobject( mSubLC, "S_UsageType" );
   //:BuildDirsForUseSects( mSubLC, mMasLC )
   {
    mSubLC_Object m_mSubLC_Object = new mSubLC_Object( mSubLC );
    m_mSubLC_Object.omSubLC_BuildDirsForUseSects( mSubLC, mMasLC );
    // m_mSubLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_MarketingKeywordSelect( VIEW ViewToWindow )

//:   VIEW mSubLC REGISTERED AS mSubLC
public int 
GOTO_MarketingKeywordSelect( View     ViewToWindow )
{
   zVIEW    mSubLC = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mMasLC REGISTERED AS mMasLC
   zVIEW    mMasLC = new zVIEW( );
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   RESULT = GetViewByName( mSubLC, "mSubLC", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Position on same Marketing Section and Statement in MLC as in SLC.
   //:SET CURSOR FIRST mMasLC.M_MarketingSection 
   //:           WHERE mMasLC.M_MarketingSection.ID = mSubLC.S_MarketingSection.PrimaryMLC_ID 
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
       GetIntegerFromAttribute( mi_lTempInteger_0, mSubLC, "S_MarketingSection", "PrimaryMLC_ID" );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );}
   RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_MarketingSection", "ID", lTempInteger_0, "" );
   //:SET CURSOR FIRST mMasLC.M_MarketingStatement 
   //:           WHERE mMasLC.M_MarketingStatement.ID = mSubLC.S_MarketingStatement.PrimaryMLC_ID  
   {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
       GetIntegerFromAttribute( mi_lTempInteger_1, mSubLC, "S_MarketingStatement", "PrimaryMLC_ID" );
   lTempInteger_1 = mi_lTempInteger_1.intValue( );}
   RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_MarketingStatement", "ID", lTempInteger_1, "" );
   return( 0 );
// END
} 



}
