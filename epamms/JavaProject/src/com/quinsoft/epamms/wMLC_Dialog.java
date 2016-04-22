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

/**
   @author QuinSoft
**/

public class wMLC_Dialog extends VmlDialog
{
   private final ZDRVROPR m_ZDRVROPR;
   public wMLC_Dialog( View view )
   {
      super( view );
      m_ZDRVROPR = new ZDRVROPR( view );
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
//:RemoveMLC_UsageEntriesFromGroup( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
RemoveMLC_UsageEntriesFromGroup( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   String   szTempString_0 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Exclude each selected M_Usage from under the group.
   //:FOR EACH mMasLC.M_UsageGroupUsage
   RESULT = SetCursorFirstEntity( mMasLC, "M_UsageGroupUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_UsageGroupUsage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_UsageGroupUsage", "wSelected", "Y" ) == 0 )
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
         //:INCLUDE mMasLC.M_UsageNonGroupUsage FROM mMasLC.M_Usage
         RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_UsageNonGroupUsage", mMasLC, "M_Usage", zPOS_AFTER );
         //:EXCLUDE mMasLC.M_UsageUsageGroup NONE
         RESULT = ExcludeEntity( mMasLC, "M_UsageUsageGroup", zREPOS_NONE );
         //:EXCLUDE mMasLC.M_UsageGroupUsage NONE
         RESULT = ExcludeEntity( mMasLC, "M_UsageGroupUsage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_UsageGroupUsage", "" );
      //:END
   } 

   //:END
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
//:GOTO_DU_SectionAddBefore( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DU_SectionAddBefore( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:CreateTemporalEntity( mMasLC, "M_DirectionsForUseSection", zPOS_BEFORE )
   CreateTemporalEntity( mMasLC, "M_DirectionsForUseSection", zPOS_BEFORE );
   return( 0 );
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
   //:mMasLC.MasterLabelContent.wAddStatementsEntityName    = "M_Usage"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_Usage" );
   //:mMasLC.MasterLabelContent.wAddStatementsAttributeName = "Name"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsAttributeName", "Name" );
   //:mMasLC.MasterLabelContent.wAddStatementsWorkText      = ""
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsWorkText", "" );
   //:IF mMasLC.M_UsageType.UsageType = "S"
   if ( CompareAttributeToString( mMasLC, "M_UsageType", "UsageType", "S" ) == 0 )
   { 
      //:// Surfaces
      //:mMasLC.MasterLabelContent.wAddStatementsPageTitle = "Surfaces"
      SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "Surfaces" );
      //:ELSE
   } 
   else
   { 
      //:IF mMasLC.M_UsageType.UsageType = "L"
      if ( CompareAttributeToString( mMasLC, "M_UsageType", "UsageType", "L" ) == 0 )
      { 
         //:// Locations
         //:mMasLC.MasterLabelContent.wAddStatementsPageTitle = "Locations"
         SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "Locations" );
         //:ELSE
      } 
      else
      { 
         //:IF mMasLC.M_UsageType.UsageType = "T"
         if ( CompareAttributeToString( mMasLC, "M_UsageType", "UsageType", "T" ) == 0 )
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
//:GOTO_AddSubUsageStatements( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_AddSubUsageStatements( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Set up the work areas that define to the Add SubItems page which items are being added.
   //:mMasLC.MasterLabelContent.wAddStatementsEntityName    = "M_SubUsage"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_SubUsage" );
   //:mMasLC.MasterLabelContent.wAddStatementsAttributeName = "Name"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsAttributeName", "Name" );
   //:mMasLC.MasterLabelContent.wAddStatementsWorkText      = ""
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsWorkText", "" );
   //:IF mMasLC.M_UsageType.UsageType = "S"
   if ( CompareAttributeToString( mMasLC, "M_UsageType", "UsageType", "S" ) == 0 )
   { 
      //:// Surfaces
      //:mMasLC.MasterLabelContent.wAddStatementsPageTitle = "Surfaces"
      SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "Surfaces" );
      //:ELSE
   } 
   else
   { 
      //:IF mMasLC.M_UsageType.UsageType = "L"
      if ( CompareAttributeToString( mMasLC, "M_UsageType", "UsageType", "L" ) == 0 )
      { 
         //:// Locations
         //:mMasLC.MasterLabelContent.wAddStatementsPageTitle = "Locations"
         SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "Locations" );
         //:ELSE
      } 
      else
      { 
         //:IF mMasLC.M_UsageType.UsageType = "T"
         if ( CompareAttributeToString( mMasLC, "M_UsageType", "UsageType", "T" ) == 0 )
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
//:GOTO_AddGroupUsageStatements( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_AddGroupUsageStatements( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Set up the work areas that define to the Add Items page which items are being added.
   //:mMasLC.MasterLabelContent.wAddStatementsEntityName    = "M_UsageGroupUsageTemp"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsEntityName", "M_UsageGroupUsageTemp" );
   //:mMasLC.MasterLabelContent.wAddStatementsAttributeName = "Name"
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsAttributeName", "Name" );
   //:mMasLC.MasterLabelContent.wAddStatementsWorkText      = ""
   SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsWorkText", "" );
   //:IF mMasLC.M_UsageType.UsageType = "S"
   if ( CompareAttributeToString( mMasLC, "M_UsageType", "UsageType", "S" ) == 0 )
   { 
      //:// Surfaces
      //:mMasLC.MasterLabelContent.wAddStatementsPageTitle = "Surfaces"
      SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "Surfaces" );
      //:ELSE
   } 
   else
   { 
      //:IF mMasLC.M_UsageType.UsageType = "L"
      if ( CompareAttributeToString( mMasLC, "M_UsageType", "UsageType", "L" ) == 0 )
      { 
         //:// Locations
         //:mMasLC.MasterLabelContent.wAddStatementsPageTitle = "Locations"
         SetAttributeFromString( mMasLC, "MasterLabelContent", "wAddStatementsPageTitle", "Locations" );
         //:ELSE
      } 
      else
      { 
         //:IF mMasLC.M_UsageType.UsageType = "T"
         if ( CompareAttributeToString( mMasLC, "M_UsageType", "UsageType", "T" ) == 0 )
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
   //:SHORT   nRC
   int      nRC = 0;
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
   //:SHORT   nRC
   int      nRC = 0;
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
   //:SHORT   nRC
   int      nRC = 0;
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
   //:SHORT   nRC
   int      nRC = 0;
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
//:SelectMLC_UsageEntries( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
SelectMLC_UsageEntries( View     ViewToWindow )
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
            //:SET CURSOR FIRST mMasLC.M_DrivingUsage WHERE mMasLC.M_DrivingUsage.ID = mMasLC.M_Usage.ID
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                         GetIntegerFromAttribute( mi_lTempInteger_0, mMasLC, "M_Usage", "ID" );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_DrivingUsage", "ID", lTempInteger_0, "" );
            //:IF RESULT < zCURSOR_SET
            if ( RESULT < zCURSOR_SET )
            { 
               //:INCLUDE mMasLC.M_DrivingUsage FROM mMasLC.M_Usage
               RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_DrivingUsage", mMasLC, "M_Usage", zPOS_AFTER );
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
      //:FOR EACH mMasLC.M_DrivingUsage
      RESULT = SetCursorFirstEntity( mMasLC, "M_DrivingUsage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mMasLC.M_DrivingUsage.wSelected = "Y"
         if ( CompareAttributeToString( mMasLC, "M_DrivingUsage", "wSelected", "Y" ) == 0 )
         { 
            //:EXCLUDE  mMasLC.M_DrivingUsage NONE
            RESULT = ExcludeEntity( mMasLC, "M_DrivingUsage", zREPOS_NONE );
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_DrivingUsage", "" );
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
      //:FOR EACH mMasLC.M_DrivingUsage
      RESULT = SetCursorFirstEntity( mMasLC, "M_DrivingUsage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mMasLC.M_DrivingUsage.wSelected = ""
         SetAttributeFromString( mMasLC, "M_DrivingUsage", "wSelected", "" );
         RESULT = SetCursorNextEntity( mMasLC, "M_DrivingUsage", "" );
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
      //:FOR EACH mMasLC.M_DrivingUsage
      RESULT = SetCursorFirstEntity( mMasLC, "M_DrivingUsage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:mMasLC.M_DrivingUsage.wSelected = "Y"
         SetAttributeFromString( mMasLC, "M_DrivingUsage", "wSelected", "Y" );
         RESULT = SetCursorNextEntity( mMasLC, "M_DrivingUsage", "" );
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
   //:SET CURSOR LAST mMasLC.M_DirectionsForUseStatement
   RESULT = SetCursorLastEntity( mMasLC, "M_DirectionsForUseStatement", "" );
   //:CreateTemporalEntity( mMasLC, "M_DirectionsForUseStatement", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_DirectionsForUseStatement", zPOS_AFTER );
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
      //:MessageSend( ViewToWindow, "", "Save And Add New Dirs for Use Statement",
      //:             "Error saving Dirs for Use statement.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Save And Add New Dirs for Use Statement", "Error saving Dirs for Use statement.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
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
            //:SET CURSOR FIRST mMasLC.M_DrivingUsage WHERE mMasLC.M_DrivingUsage.ID = mMasLC.M_Usage.ID
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                         GetIntegerFromAttribute( mi_lTempInteger_2, mMasLC, "M_Usage", "ID" );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_DrivingUsage", "ID", lTempInteger_2, "" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:EXCLUDE mMasLC.M_DrivingUsage
               RESULT = ExcludeEntity( mMasLC, "M_DrivingUsage", zREPOS_AFTER );
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
//:DELETE_SelectedUsageEntries( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
DELETE_SelectedUsageEntries( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;
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
   int      lTempInteger_0 = 0;
   zVIEW    vTempViewVar_0 = new zVIEW( );
   String   szTempString_0 = null;
   int      lTempInteger_1 = 0;

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
            lTempInteger_1 = CheckExistenceOfEntity( mMasLC, "M_DirectionsUsage" );
            if ( lTempInteger_1 != 0 )
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

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );

   //:ACTIVATE mMasLC EMPTY
   RESULT = ActivateEmptyObjectInstance( mMasLC, "mMasLC", ViewToWindow, zSINGLE );
   //:NAME VIEW mMasLC "mMasLC"
   SetNameForView( mMasLC, "mMasLC", null, zLEVEL_TASK );
   //:CREATE ENTITY mMasLC.MasterLabelContent
   RESULT = CreateEntity( mMasLC, "MasterLabelContent", zPOS_AFTER );
   //:INCLUDE mMasLC.MasterProduct FROM mMasProd.MasterProduct
   RESULT = IncludeSubobjectFromSubobject( mMasLC, "MasterProduct", mMasProd, "MasterProduct", zPOS_AFTER );
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
   //:INTEGER lID
   int      lID = 0;
   //:SHORT   nRC
   int      nRC = 0;
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
   //:SHORT   nRC
   int      nRC = 0;
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
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasProd, "mMasProd", ViewToWindow, zLEVEL_TASK );
   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

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
   //:STRING ( 1 ) szFound
   String   szFound = null;
   //:INTEGER      MasProdID
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

   //:IF mMasLC.MasterLabelContent.Finalized = ""
   if ( CompareAttributeToString( mMasLC, "MasterLabelContent", "Finalized", "" ) == 0 )
   { 
      //:mMasLC.MasterLabelContent.Finalized = "W"
      SetAttributeFromString( mMasLC, "MasterLabelContent", "Finalized", "W" );
      //:mMasLC.MasterLabelContent.CreatedDateTime = wWebXfer.Root.dCurrentDateTime
      SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "CreatedDateTime", wWebXfer, "Root", "dCurrentDateTime" );
      //:mMasLC.MasterLabelContent.RevisionDate = wWebXfer.Root.dCurrentDateTime
      SetAttributeFromAttribute( mMasLC, "MasterLabelContent", "RevisionDate", wWebXfer, "Root", "dCurrentDateTime" );
   } 

   //:END
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
   //:SHORT nRC
   int      nRC = 0;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// We are creating the new temporal entity in this operation, rather than as auto action, so that
   //:// the NotForUseType attribute can be set, since it's currently required in the database.
   //:SET CURSOR LAST mMasLC.M_StorageDisposalStatement
   RESULT = SetCursorLastEntity( mMasLC, "M_StorageDisposalStatement", "" );
   //:CreateTemporalEntity( mMasLC, "M_StorageDisposalStatement", zPOS_AFTER )
   CreateTemporalEntity( mMasLC, "M_StorageDisposalStatement", zPOS_AFTER );
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
   //:SHORT nRC
   int      nRC = 0;
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
//:GOTO_DisplayGeneratedTextMktg( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DisplayGeneratedTextMktg( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   String   szTempString_0 = null;
   String   szTempString_1 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Build the display Keyword entries from the Marketing keyword entries.
   //:BuildUsageKeyEntries( mMasLC,
   //:                      "M_InsertTextKeywordMarketing",
   //:                      "M_InsertTextMarketing",
   //:                      mMasLC.M_MarketingStatement.Text,
   //:                      mMasLC.M_MarketingStatement.Title )
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_MarketingStatement", "Text" );
   szTempString_0 = sb_szTempString_0.toString( );}
   {StringBuilder sb_szTempString_1;
   if ( szTempString_1 == null )
      sb_szTempString_1 = new StringBuilder( 32 );
   else
      sb_szTempString_1 = new StringBuilder( szTempString_1 );
       GetStringFromAttribute( sb_szTempString_1, mMasLC, "M_MarketingStatement", "Title" );
   szTempString_1 = sb_szTempString_1.toString( );}
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLC );
    m_mMasLC_Object.omMasLC_BuildUsageKeyEntries( mMasLC, "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", szTempString_0, szTempString_1 );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DisplayGeneratedTextDU( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DisplayGeneratedTextDU( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   String   szTempString_0 = null;
   String   szTempString_1 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Build the display Keyword entries from the Directions For Use keyword entries.
   //:BuildUsageKeyEntries( mMasLC,
   //:                      "M_InsertTextKeywordDU",
   //:                      "M_InsertTextDU",
   //:                      mMasLC.M_DirectionsForUseStatement.Text,
   //:                      mMasLC.M_DirectionsForUseStatement.Title )
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_DirectionsForUseStatement", "Text" );
   szTempString_0 = sb_szTempString_0.toString( );}
   {StringBuilder sb_szTempString_1;
   if ( szTempString_1 == null )
      sb_szTempString_1 = new StringBuilder( 32 );
   else
      sb_szTempString_1 = new StringBuilder( szTempString_1 );
       GetStringFromAttribute( sb_szTempString_1, mMasLC, "M_DirectionsForUseStatement", "Title" );
   szTempString_1 = sb_szTempString_1.toString( );}
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLC );
    m_mMasLC_Object.omMasLC_BuildUsageKeyEntries( mMasLC, "M_InsertTextKeywordDU", "M_InsertTextDU", szTempString_0, szTempString_1 );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DisplayGeneratedTextSD( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DisplayGeneratedTextSD( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   String   szTempString_0 = null;
   String   szTempString_1 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Build the display Keyword entries from the Directions For Use keyword entries.
   //:BuildUsageKeyEntries( mMasLC,
   //:                      "M_InsertTextKeywordSD",
   //:                      "M_InsertTextSD",
   //:                      mMasLC.M_StorageDisposalStatement.Text,
   //:                      mMasLC.M_StorageDisposalStatement.Title )
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_StorageDisposalStatement", "Text" );
   szTempString_0 = sb_szTempString_0.toString( );}
   {StringBuilder sb_szTempString_1;
   if ( szTempString_1 == null )
      sb_szTempString_1 = new StringBuilder( 32 );
   else
      sb_szTempString_1 = new StringBuilder( szTempString_1 );
       GetStringFromAttribute( sb_szTempString_1, mMasLC, "M_StorageDisposalStatement", "Title" );
   szTempString_1 = sb_szTempString_1.toString( );}
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLC );
    m_mMasLC_Object.omMasLC_BuildUsageKeyEntries( mMasLC, "M_InsertTextKeywordSD", "M_InsertTextSD", szTempString_0, szTempString_1 );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:GOTO_DisplayGeneratedTextGeneral( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DisplayGeneratedTextGeneral( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   String   szTempString_0 = null;
   String   szTempString_1 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Build the display Keyword entries from the Directions For Use keyword entries.
   //:BuildUsageKeyEntries( mMasLC,
   //:                      "M_InsertTextKeywordGeneral",
   //:                      "M_InsertTextGeneral",
   //:                      mMasLC.M_GeneralStatement.Text ,
   //:                      mMasLC.M_GeneralStatement.Title )
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_GeneralStatement", "Text" );
   szTempString_0 = sb_szTempString_0.toString( );}
   {StringBuilder sb_szTempString_1;
   if ( szTempString_1 == null )
      sb_szTempString_1 = new StringBuilder( 32 );
   else
      sb_szTempString_1 = new StringBuilder( szTempString_1 );
       GetStringFromAttribute( sb_szTempString_1, mMasLC, "M_GeneralStatement", "Title" );
   szTempString_1 = sb_szTempString_1.toString( );}
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLC );
    m_mMasLC_Object.omMasLC_BuildUsageKeyEntries( mMasLC, "M_InsertTextKeywordGeneral", "M_InsertTextGeneral", szTempString_0, szTempString_1 );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
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
//:GOTO_DisplayGeneratedTextUsage( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
GOTO_DisplayGeneratedTextUsage( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   String   szTempString_0 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:BuildUsageKeyEntries( mMasLC, "M_InsertTextKeywordUsage",
   //:                      "M_InsertTextUsage", mMasLC.M_Usage.Name, "" )
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_Usage", "Name" );
   szTempString_0 = sb_szTempString_0.toString( );}
   {
    mMasLC_Object m_mMasLC_Object = new mMasLC_Object( mMasLC );
    m_mMasLC_Object.omMasLC_BuildUsageKeyEntries( mMasLC, "M_InsertTextKeywordUsage", "M_InsertTextUsage", szTempString_0, "" );
    // m_mMasLC_Object = null;  // permit gc  (unnecessary)
   }
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
//:DELETE_UsageGroupEntriesOnly( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
DELETE_UsageGroupEntriesOnly( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;
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
//:DELETE_SelectedGroupUsageEntries( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
DELETE_SelectedGroupUsageEntries( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;
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
      //:MessageSend( ViewToWindow, "", "Accept and Add New Surface Statement",
      //:             "Error saving sub-surface statement.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( ViewToWindow, "", "Accept and Add New Surface Statement", "Error saving sub-surface statement.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
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
//:SelectMLC_UsageEntriesForGroup( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
SelectMLC_UsageEntriesForGroup( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   String   szTempString_0 = null;

   RESULT = GetViewByName( mMasLC, "mMasLC", ViewToWindow, zLEVEL_TASK );

   //:// Include each selected M_Usage entry under the current Group.
   //:FOR EACH mMasLC.M_UsageNonGroupUsage
   RESULT = SetCursorFirstEntity( mMasLC, "M_UsageNonGroupUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_UsageNonGroupUsage.wSelected = "Y"
      if ( CompareAttributeToString( mMasLC, "M_UsageNonGroupUsage", "wSelected", "Y" ) == 0 )
      { 
         //:SET CURSOR FIRST mMasLC.M_Usage WHERE mMasLC.M_Usage.Name = mMasLC.M_UsageNonGroupUsage.Name
         {StringBuilder sb_szTempString_0;
         if ( szTempString_0 == null )
            sb_szTempString_0 = new StringBuilder( 32 );
         else
            sb_szTempString_0 = new StringBuilder( szTempString_0 );
                   GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_UsageNonGroupUsage", "Name" );
         szTempString_0 = sb_szTempString_0.toString( );}
         RESULT = SetCursorFirstEntityByString( mMasLC, "M_Usage", "Name", szTempString_0, "" );
         //:INCLUDE mMasLC.M_UsageUsageGroup FROM mMasLC.M_UsageGroup
         RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_UsageUsageGroup", mMasLC, "M_UsageGroup", zPOS_AFTER );
         //:INCLUDE mMasLC.M_UsageGroupUsage FROM mMasLC.M_Usage
         RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_UsageGroupUsage", mMasLC, "M_Usage", zPOS_AFTER );
         //:EXCLUDE mMasLC.M_UsageNonGroupUsage NONE
         RESULT = ExcludeEntity( mMasLC, "M_UsageNonGroupUsage", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_UsageNonGroupUsage", "" );
      //:END
   } 

   //:END
   //:OrderEntityForView( mMasLC, "M_UsageGroupUsage", "Name A" )
   OrderEntityForView( mMasLC, "M_UsageGroupUsage", "Name A" );
   return( 0 );
// END
} 


//:DIALOG OPERATION
//:DELETE_UsageGroupEntries( VIEW ViewToWindow )

//:   VIEW mMasLC REGISTERED AS mMasLC
public int 
DELETE_UsageGroupEntries( View     ViewToWindow )
{
   zVIEW    mMasLC = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC
   int      nRC = 0;
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
   //:   
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
//:DummyOperationForPositioning( VIEW ViewToWindow )

public int 
DummyOperationForPositioning( View     ViewToWindow )
{

   return( 0 );
//    // Do nothing ... for positioning only
// END
} 



}
