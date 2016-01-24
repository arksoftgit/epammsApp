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

/**
   @author QuinSoft
**/

public class ZGlobalS_Operation extends VmlDialog
{
   public ZGlobalS_Operation( View view )
   {
      super( view );
   }


//:GLOBAL OPERATION
//:BuildCompositeEntriesForSPLD( VIEW mSPLDef BASED ON LOD mSPLDef )

//:   STRING ( 256 )   szCompositeLocation
public void 
BuildCompositeEntriesForSPLD( View     mSPLDef )
{
   String   szCompositeLocation = null;
   //:STRING ( 4000 )  szDisplayValue
   String   szDisplayValue = null;
   //:STRING ( 4000 )  szOriginalDisplayValue
   String   szOriginalDisplayValue = null;
   //:STRING ( 32 )    szUsageType
   String   szUsageType = null;
   //:INTEGER          MaxDisplayLength
   int      MaxDisplayLength = 0;
   //:INTEGER          OriginalStringLength
   int      OriginalStringLength = 0;
   //:INTEGER          Count
   int      Count = 0;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   String   szTempString_0 = null;
   String   szTempString_1 = null;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   String   szTempString_2 = null;
   String   szTempString_3 = null;
   String   szTempString_4 = null;
   int      lTempInteger_4 = 0;
   int      lTempInteger_5 = 0;
   String   szTempString_5 = null;
   String   szTempString_6 = null;
   String   szTempString_7 = null;
   int      lTempInteger_6 = 0;
   String   szTempString_8 = null;
   int      lTempInteger_7 = 0;
   String   szTempString_9 = null;
   int      lTempInteger_8 = 0;
   String   szTempString_10 = null;
   int      lTempInteger_9 = 0;
   String   szTempString_11 = null;
   int      lTempInteger_10 = 0;


   //:// Build the flat display of all components subobject.
   //:MaxDisplayLength = 256
   MaxDisplayLength = 256;

   //:// First clear any current entries.
   //:FOR EACH mSPLDef.CompositeComponentList
   RESULT = SetCursorFirstEntity( mSPLDef, "CompositeComponentList", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mSPLDef.CompositeComponentList NONE
      RESULT = DeleteEntity( mSPLDef, "CompositeComponentList", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mSPLDef, "CompositeComponentList", "" );
   } 

   //:END

   //:// General Section and Statements.
   //:FOR EACH mSPLDef.SPLD_GeneralSection
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSPLDef.CompositeComponentList
      RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
      //:mSPLDef.CompositeComponentList.Type              = "SPLD_GeneralSection"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_GeneralSection" );
      //:mSPLDef.CompositeComponentList.SelectLevel       = 1
      SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 1 );
      //:mSPLDef.CompositeComponentList.DisplayType       = "General"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "General" );
      //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "General"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "General" );
      //:mSPLDef.CompositeComponentList.SectionType       = mSPLDef.SPLD_GeneralSection.SectionType
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "SectionType", mSPLDef, "SPLD_GeneralSection", "SectionType" );
      //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_GeneralSection.ID
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_GeneralSection", "ID" );
      //:mSPLDef.CompositeComponentList.DisplayValue      = mSPLDef.SPLD_GeneralSection.Title
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_GeneralSection", "Title" );
      //:mSPLDef.CompositeComponentList.Value             = mSPLDef.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "CompositeComponentList", "DisplayValue" );

      //:FOR EACH mSPLDef.SPLD_GeneralStatement
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSPLDef.CompositeComponentList
         RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
         //:mSPLDef.CompositeComponentList.Type              = "SPLD_GeneralStatement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_GeneralStatement" );
         //:mSPLDef.CompositeComponentList.SelectLevel       = 2
         SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 2 );
         //:mSPLDef.CompositeComponentList.DisplayType       = "Statement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Statement" );
         //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...Statement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_GeneralStatement.ID
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_GeneralStatement", "ID" );
         //:mSPLDef.CompositeComponentList.Value             = mSPLDef.SPLD_GeneralStatement.Text
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "SPLD_GeneralStatement", "Text" );
         //:SetMatchingAttributesByName( mSPLDef, "CompositeComponentList",
         //:                             mSPLDef, "SPLD_GeneralStatement", zSET_NULL )
         SetMatchingAttributesByName( mSPLDef, "CompositeComponentList", mSPLDef, "SPLD_GeneralStatement", zSET_NULL );

         //:szOriginalDisplayValue = mSPLDef.SPLD_GeneralStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_0, 'S', 4001, mSPLDef, "SPLD_GeneralStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:GetAttributeLength( OriginalStringLength, mSPLDef, "SPLD_GeneralStatement", "Text" )
         {MutableInt mi_OriginalStringLength = new MutableInt( OriginalStringLength );
                   GetAttributeLength( mi_OriginalStringLength, mSPLDef, "SPLD_GeneralStatement", "Text" );
         OriginalStringLength = mi_OriginalStringLength.intValue( );}
         //:IF MaxDisplayLength < OriginalStringLength
         if ( MaxDisplayLength < OriginalStringLength )
         { 
            //:szDisplayValue = szOriginalDisplayValue[1:100] + "....."
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringCopy( sb_szDisplayValue, 1, 0, szOriginalDisplayValue, 1, 100, 4001 );
            szDisplayValue = sb_szDisplayValue.toString( );}
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringConcat( sb_szDisplayValue, 1, 0, ".....", 1, 0, 4001 );
            szDisplayValue = sb_szDisplayValue.toString( );}
            //:ELSE
         } 
         else
         { 
            //:szDisplayValue = szOriginalDisplayValue
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringCopy( sb_szDisplayValue, 1, 0, szOriginalDisplayValue, 1, 0, 4001 );
            szDisplayValue = sb_szDisplayValue.toString( );}
         } 

         //:END
         //:mSPLDef.CompositeComponentList.DisplayValue   = szDisplayValue
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayValue", szDisplayValue );
         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_GeneralStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_GeneralSection", "" );
      //:END
   } 

   //:END

   //:// Ingredients Section and Statements.
   //:FOR EACH mSPLDef.SPLD_IngredientsSection
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSPLDef.CompositeComponentList
      RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
      //:mSPLDef.CompositeComponentList.Type              = "SPLD_IngredientsSection"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_IngredientsSection" );
      //:mSPLDef.CompositeComponentList.SelectLevel       = 1
      SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 1 );
      //:mSPLDef.CompositeComponentList.DisplayType       = "Ingredients"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Ingredients" );
      //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "Ingredients"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "Ingredients" );
      //:mSPLDef.CompositeComponentList.SectionType       = "I"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "SectionType", "I" );
      //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_IngredientsSection.ID
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_IngredientsSection", "ID" );
      //:mSPLDef.CompositeComponentList.DisplayValue      = mSPLDef.SPLD_IngredientsSection.ActiveTitle
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_IngredientsSection", "ActiveTitle" );
      //:mSPLDef.CompositeComponentList.Value             = mSPLDef.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "CompositeComponentList", "DisplayValue" );

      //:FOR EACH mSPLDef.SPLD_IngredientsStatement
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSPLDef.CompositeComponentList
         RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
         //:mSPLDef.CompositeComponentList.Type              = "SPLD_IngredientsStatement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_IngredientsStatement" );
         //:mSPLDef.CompositeComponentList.SelectLevel       = 2
         SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 2 );
         //:mSPLDef.CompositeComponentList.DisplayType       = "Statement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Statement" );
         //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...Statement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_IngredientsStatement.ID
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_IngredientsStatement", "ID" );
         //:mSPLDef.CompositeComponentList.DisplayValue      = mSPLDef.SPLD_IngredientsStatement.ChemicalName
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_IngredientsStatement", "ChemicalName" );
         //:mSPLDef.CompositeComponentList.Value             = mSPLDef.SPLD_IngredientsStatement.ChemicalName
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "SPLD_IngredientsStatement", "ChemicalName" );
         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_IngredientsStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_IngredientsSection", "" );
      //:END
   } 

   //:END

   //:// StorageDisposal Section and Statements.
   //:FOR EACH mSPLDef.SPLD_StorageDisposalSection
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSPLDef.CompositeComponentList
      RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
      //:mSPLDef.CompositeComponentList.Type              = "SPLD_StorageDisposalSection"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_StorageDisposalSection" );
      //:mSPLDef.CompositeComponentList.SelectLevel       = 1
      SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 1 );
      //:mSPLDef.CompositeComponentList.DisplayType       = "Storage and Disposal"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Storage and Disposal" );
      //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "Storage and Disposal"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "Storage and Disposal" );
      //:mSPLDef.CompositeComponentList.SectionType       = "S"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "SectionType", "S" );
      //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_StorageDisposalSection.ID
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_StorageDisposalSection", "ID" );
      //:mSPLDef.CompositeComponentList.DisplayValue      = mSPLDef.SPLD_StorageDisposalSection.Title
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_StorageDisposalSection", "Title" );
      //:mSPLDef.CompositeComponentList.Value             = mSPLDef.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "CompositeComponentList", "DisplayValue" );

      //:FOR EACH mSPLDef.SPLD_StorageDisposalStatement
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_StorageDisposalStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mSPLDef.SPLD_StorageDisposalStatement.Title != ""
         if ( CompareAttributeToString( mSPLDef, "SPLD_StorageDisposalStatement", "Title", "" ) != 0 )
         { 
            //:CREATE ENTITY mSPLDef.CompositeComponentList
            RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
            //:mSPLDef.CompositeComponentList.Type              = "SPLD_StorageDisposalTitle"
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_StorageDisposalTitle" );
            //:mSPLDef.CompositeComponentList.SelectLevel       = 2
            SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 2 );
            //:mSPLDef.CompositeComponentList.DisplayType       = "Title"
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Title" );
            //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...Stmt Title"
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "...Stmt Title" );
            //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_StorageDisposalStatement.ID
            SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_StorageDisposalStatement", "ID" );
            //:mSPLDef.CompositeComponentList.Value             = mSPLDef.SPLD_StorageDisposalStatement.Title
            SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "SPLD_StorageDisposalStatement", "Title" );
         } 

         //:END

         //:CREATE ENTITY mSPLDef.CompositeComponentList
         RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
         //:mSPLDef.CompositeComponentList.Type              = "SPLD_StorageDisposalStatement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_StorageDisposalStatement" );
         //:mSPLDef.CompositeComponentList.SelectLevel       = 2
         SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 2 );
         //:mSPLDef.CompositeComponentList.DisplayType       = "Statement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Statement" );
         //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...Statement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_StorageDisposalStatement.ID
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_StorageDisposalStatement", "ID" );
         //:mSPLDef.CompositeComponentList.Value             = mSPLDef.SPLD_StorageDisposalStatement.Text
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "SPLD_StorageDisposalStatement", "Text" );

         //:szOriginalDisplayValue = mSPLDef.SPLD_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_1, 'S', 4001, mSPLDef, "SPLD_StorageDisposalStatement", "Text", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:GetAttributeLength( OriginalStringLength, mSPLDef, "SPLD_StorageDisposalStatement", "Text" )
         {MutableInt mi_OriginalStringLength = new MutableInt( OriginalStringLength );
                   GetAttributeLength( mi_OriginalStringLength, mSPLDef, "SPLD_StorageDisposalStatement", "Text" );
         OriginalStringLength = mi_OriginalStringLength.intValue( );}
         //:IF MaxDisplayLength < OriginalStringLength
         if ( MaxDisplayLength < OriginalStringLength )
         { 
            //:szDisplayValue = szOriginalDisplayValue[1:100] + "....."
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringCopy( sb_szDisplayValue, 1, 0, szOriginalDisplayValue, 1, 100, 4001 );
            szDisplayValue = sb_szDisplayValue.toString( );}
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringConcat( sb_szDisplayValue, 1, 0, ".....", 1, 0, 4001 );
            szDisplayValue = sb_szDisplayValue.toString( );}
            //:ELSE
         } 
         else
         { 
            //:szDisplayValue = szOriginalDisplayValue
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringCopy( sb_szDisplayValue, 1, 0, szOriginalDisplayValue, 1, 0, 4001 );
            szDisplayValue = sb_szDisplayValue.toString( );}
         } 

         //:END
         //:mSPLDef.CompositeComponentList.DisplayValue   = szDisplayValue
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayValue", szDisplayValue );
         //:SetMatchingAttributesByName( mSPLDef, "CompositeComponentList",
         //:                             mSPLDef, "SPLD_StorageDisposalStatement", zSET_NULL )
         SetMatchingAttributesByName( mSPLDef, "CompositeComponentList", mSPLDef, "SPLD_StorageDisposalStatement", zSET_NULL );
         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_StorageDisposalStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_StorageDisposalSection", "" );
      //:END
   } 

   //:END

   //:// DirectionsForUse Section and Statements.
   //:FOR EACH mSPLDef.SPLD_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSPLDef.CompositeComponentList
      RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
      //:mSPLDef.CompositeComponentList.Type              = "SPLD_DirectionsForUseSection"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_DirectionsForUseSection" );
      //:mSPLDef.CompositeComponentList.SelectLevel       = 1
      SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 1 );
      //:mSPLDef.CompositeComponentList.DisplayType       = "Directions For Use"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Directions For Use" );
      //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "Directions For Use"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "Directions For Use" );
      //:mSPLDef.CompositeComponentList.SectionType       = "D"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "SectionType", "D" );
      //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_DirectionsForUseSection.ID
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_DirectionsForUseSection", "ID" );
      //:IF mSPLDef.SPLD_DirectionsForUseSection.Title != ""
      if ( CompareAttributeToString( mSPLDef, "SPLD_DirectionsForUseSection", "Title", "" ) != 0 )
      { 
         //:IF mSPLDef.SPLD_DirectionsForUseSection.Name = ""
         if ( CompareAttributeToString( mSPLDef, "SPLD_DirectionsForUseSection", "Name", "" ) == 0 )
         { 
            //:mSPLDef.CompositeComponentList.DisplayValue = mSPLDef.SPLD_DirectionsForUseSection.Title
            SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_DirectionsForUseSection", "Title" );
            //:ELSE
         } 
         else
         { 
            //:mSPLDef.CompositeComponentList.DisplayValue = mSPLDef.SPLD_DirectionsForUseSection.Name + " - " +
            //:                                             mSPLDef.SPLD_DirectionsForUseSection.Title
            {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetStringFromAttribute( sb_szTempString_0, mSPLDef, "SPLD_DirectionsForUseSection", "Name" );
            szTempString_0 = sb_szTempString_0.toString( );}
             {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                        ZeidonStringConcat( sb_szTempString_0, 1, 0, " - ", 1, 0, 32001 );
            szTempString_0 = sb_szTempString_0.toString( );}
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
            StringBuilder sb_szTempString_1;
            if ( szTempString_1 == null )
               sb_szTempString_1 = new StringBuilder( 32 );
            else
               sb_szTempString_1 = new StringBuilder( szTempString_1 );
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_2, 'S', 255, mSPLDef, "SPLD_DirectionsForUseSection", "Title", "", 0 );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );
            szTempString_1 = sb_szTempString_1.toString( );}
             {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                        ZeidonStringConcat( sb_szTempString_0, 1, 0, szTempString_1, 1, 0, 32001 );
            szTempString_0 = sb_szTempString_0.toString( );}
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayValue", szTempString_0 );
         } 

         //:END
         //:ELSE
      } 
      else
      { 
         //:mSPLDef.CompositeComponentList.DisplayValue = mSPLDef.SPLD_DirectionsForUseSection.Name
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_DirectionsForUseSection", "Name" );
      } 

      //:END
      //:mSPLDef.CompositeComponentList.Value              = mSPLDef.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "CompositeComponentList", "DisplayValue" );

      //:FOR EACH mSPLDef.SPLD_DirectionsForUseStatement
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_DirectionsForUseStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mSPLDef.SPLD_DirectionsForUseStatement.Title != ""
         if ( CompareAttributeToString( mSPLDef, "SPLD_DirectionsForUseStatement", "Title", "" ) != 0 )
         { 
            //:CREATE ENTITY mSPLDef.CompositeComponentList
            RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
            //:mSPLDef.CompositeComponentList.Type              = "SPLD_DirectionsForUseTitle"
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_DirectionsForUseTitle" );
            //:mSPLDef.CompositeComponentList.SelectLevel       = 2
            SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 2 );
            //:mSPLDef.CompositeComponentList.DisplayType       = "Title"
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Title" );
            //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...Stmt Title"
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "...Stmt Title" );
            //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_DirectionsForUseStatement.ID
            SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_DirectionsForUseStatement", "ID" );
            //:mSPLDef.CompositeComponentList.Value             = mSPLDef.SPLD_DirectionsForUseStatement.Title
            SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "SPLD_DirectionsForUseStatement", "Title" );
         } 

         //:END

         //:CREATE ENTITY mSPLDef.CompositeComponentList
         RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
         //:mSPLDef.CompositeComponentList.Type              = "SPLD_DirectionsForUseStatement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_DirectionsForUseStatement" );
         //:mSPLDef.CompositeComponentList.SelectLevel       = 2
         SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 2 );
         //:mSPLDef.CompositeComponentList.DisplayType       = "Statement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Statement" );
         //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...Statement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_DirectionsForUseStatement.ID
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_DirectionsForUseStatement", "ID" );
         //:mSPLDef.CompositeComponentList.Value             = mSPLDef.SPLD_DirectionsForUseStatement.Text
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "SPLD_DirectionsForUseStatement", "Text" );

         //:szOriginalDisplayValue = mSPLDef.SPLD_DirectionsForUseStatement.Text
         {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_3, 'S', 4001, mSPLDef, "SPLD_DirectionsForUseStatement", "Text", "", 0 );
         lTempInteger_3 = mi_lTempInteger_3.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:GetAttributeLength( OriginalStringLength, mSPLDef, "SPLD_DirectionsForUseStatement", "Text" )
         {MutableInt mi_OriginalStringLength = new MutableInt( OriginalStringLength );
                   GetAttributeLength( mi_OriginalStringLength, mSPLDef, "SPLD_DirectionsForUseStatement", "Text" );
         OriginalStringLength = mi_OriginalStringLength.intValue( );}
         //:IF MaxDisplayLength < OriginalStringLength
         if ( MaxDisplayLength < OriginalStringLength )
         { 
            //:szDisplayValue = szOriginalDisplayValue[1:100] + "....."
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringCopy( sb_szDisplayValue, 1, 0, szOriginalDisplayValue, 1, 100, 4001 );
            szDisplayValue = sb_szDisplayValue.toString( );}
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringConcat( sb_szDisplayValue, 1, 0, ".....", 1, 0, 4001 );
            szDisplayValue = sb_szDisplayValue.toString( );}
            //:ELSE
         } 
         else
         { 
            //:szDisplayValue = szOriginalDisplayValue
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringCopy( sb_szDisplayValue, 1, 0, szOriginalDisplayValue, 1, 0, 4001 );
            szDisplayValue = sb_szDisplayValue.toString( );}
         } 

         //:END
         //:mSPLDef.CompositeComponentList.DisplayValue   = szDisplayValue
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayValue", szDisplayValue );
         //:SetMatchingAttributesByName( mSPLDef, "CompositeComponentList",
         //:                             mSPLDef, "SPLD_DirectionsForUseStatement", zSET_NULL )
         SetMatchingAttributesByName( mSPLDef, "CompositeComponentList", mSPLDef, "SPLD_DirectionsForUseStatement", zSET_NULL );

         //:// Add any Usage entries.
         //:// First sort by Usage Type, but keeping the entries in their original order otherwise.
         //:Count = 0
         Count = 0;
         //:FOR EACH mSPLDef.SPLD_DirectionsUsageOrdering
         RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_DirectionsUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:Count = Count + 1
            Count = Count + 1;
            //:mSPLDef.SPLD_DirectionsUsageOrdering.wSortOrder = Count
            SetAttributeFromInteger( mSPLDef, "SPLD_DirectionsUsageOrdering", "wSortOrder", Count );
            RESULT = SetCursorNextEntity( mSPLDef, "SPLD_DirectionsUsageOrdering", "" );
         } 

         //:END
         //:OrderEntityForView( mSPLDef, "SPLD_DirectionsUsageOrdering", "SPLD_DirectionsUsage.UsageType A wSortOrder A" )
         OrderEntityForView( mSPLDef, "SPLD_DirectionsUsageOrdering", "SPLD_DirectionsUsage.UsageType A wSortOrder A" );
         //:FOR EACH mSPLDef.SPLD_DirectionsUsageOrdering
         RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_DirectionsUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY mSPLDef.CompositeComponentList
            RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
            //:GetStringFromAttributeByContext( szUsageType, mSPLDef, "SPLD_DirectionsUsage", "UsageType", "FullUsageType", 20 )
            {StringBuilder sb_szUsageType;
            if ( szUsageType == null )
               sb_szUsageType = new StringBuilder( 32 );
            else
               sb_szUsageType = new StringBuilder( szUsageType );
                         GetStringFromAttributeByContext( sb_szUsageType, mSPLDef, "SPLD_DirectionsUsage", "UsageType", "FullUsageType", 20 );
            szUsageType = sb_szUsageType.toString( );}
            //:mSPLDef.CompositeComponentList.Type              = "SPLD_DirectionsUsageOrdering"
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_DirectionsUsageOrdering" );
            //:mSPLDef.CompositeComponentList.SelectLevel       = 3
            SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 3 );
            //:mSPLDef.CompositeComponentList.DisplayType       = "DirUseUsage"
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "DirUseUsage" );
            //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...DU " + szUsageType
             {StringBuilder sb_szTempString_2;
            if ( szTempString_2 == null )
               sb_szTempString_2 = new StringBuilder( 32 );
            else
               sb_szTempString_2 = new StringBuilder( szTempString_2 );
                        ZeidonStringCopy( sb_szTempString_2, 1, 0, "...DU ", 1, 0, 255 );
            szTempString_2 = sb_szTempString_2.toString( );}
             {StringBuilder sb_szTempString_2;
            if ( szTempString_2 == null )
               sb_szTempString_2 = new StringBuilder( 32 );
            else
               sb_szTempString_2 = new StringBuilder( szTempString_2 );
                        ZeidonStringConcat( sb_szTempString_2, 1, 0, szUsageType, 1, 0, 255 );
            szTempString_2 = sb_szTempString_2.toString( );}
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", szTempString_2 );
            //:mSPLDef.CompositeComponentList.Value             = mSPLDef.SPLD_DirectionsUsage.Name
            SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "SPLD_DirectionsUsage", "Name" );
            //:mSPLDef.CompositeComponentList.DisplayValue      = mSPLDef.SPLD_DirectionsUsage.Name
            SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_DirectionsUsage", "Name" );
            //:SET CURSOR FIRST mSPLDef.SPLD_Usage WHERE mSPLDef.SPLD_Usage.UsageType        = mSPLDef.SPLD_DirectionsUsage.UsageType
            //:                                  AND mSPLDef.SPLD_Usage.ClaimsClassification = mSPLDef.SPLD_DirectionsUsage.ClaimsClassification
            //:                                  AND mSPLDef.SPLD_Usage.Name                 = mSPLDef.SPLD_DirectionsUsage.Name
            RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_Usage", "" );
            if ( RESULT > zCURSOR_UNCHANGED )
            { 
               while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( mSPLDef, "SPLD_Usage", "UsageType", mSPLDef, "SPLD_DirectionsUsage", "UsageType" ) != 0 ||
                       CompareAttributeToAttribute( mSPLDef, "SPLD_Usage", "ClaimsClassification", mSPLDef, "SPLD_DirectionsUsage", "ClaimsClassification" ) != 0 ||
                       CompareAttributeToAttribute( mSPLDef, "SPLD_Usage", "Name", mSPLDef, "SPLD_DirectionsUsage", "Name" ) != 0 ) )
               { 
                  RESULT = SetCursorNextEntity( mSPLDef, "SPLD_Usage", "" );
               } 

            } 

            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:mSPLDef.CompositeComponentList.OriginalTypeID     = mSPLDef.SPLD_Usage.ID
               SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_Usage", "ID" );
               //:// TraceLineI( "#### Valid Usage ID ", mSPLDef.SPLD_Usage.ID )
               //:ELSE
            } 
            else
            { 
            } 

            RESULT = SetCursorNextEntity( mSPLDef, "SPLD_DirectionsUsageOrdering", "" );
            //:// TraceLineS( "#### Invalid Usage ID ", mSPLDef.SPLD_DirectionsUsage.Name )
            //:END
         } 

         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_DirectionsForUseStatement", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// Marketing Section and Statements.
   //:FOR EACH mSPLDef.SPLD_MarketingSection
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSPLDef.CompositeComponentList
      RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
      //:mSPLDef.CompositeComponentList.Type              = "SPLD_MarketingSection"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_MarketingSection" );
      //:mSPLDef.CompositeComponentList.SelectLevel       = 1
      SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 1 );
      //:mSPLDef.CompositeComponentList.DisplayType       = "Marketing"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Marketing" );
      //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "Marketing"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "Marketing" );
      //:mSPLDef.CompositeComponentList.SectionType       = "M"
      SetAttributeFromString( mSPLDef, "CompositeComponentList", "SectionType", "M" );
      //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_MarketingSection.ID
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_MarketingSection", "ID" );
      //:mSPLDef.CompositeComponentList.Name              = mSPLDef.SPLD_MarketingSection.Name
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Name", mSPLDef, "SPLD_MarketingSection", "Name" );
      //:// TraceLineS( "SPLD BuildCompositeEntries Name: ", mSPLDef.SPLD_MarketingSection.Name )
      //:IF mSPLDef.SPLD_MarketingSection.Title != ""
      if ( CompareAttributeToString( mSPLDef, "SPLD_MarketingSection", "Title", "" ) != 0 )
      { 
         //:IF mSPLDef.SPLD_MarketingSection.Name = ""
         if ( CompareAttributeToString( mSPLDef, "SPLD_MarketingSection", "Name", "" ) == 0 )
         { 
            //:mSPLDef.CompositeComponentList.DisplayValue = mSPLDef.SPLD_MarketingSection.Title
            SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_MarketingSection", "Title" );
            //:ELSE
         } 
         else
         { 
            //:mSPLDef.CompositeComponentList.DisplayValue = mSPLDef.SPLD_MarketingSection.Name + " - " +
            //:                                             mSPLDef.SPLD_MarketingSection.Title
            {StringBuilder sb_szTempString_3;
            if ( szTempString_3 == null )
               sb_szTempString_3 = new StringBuilder( 32 );
            else
               sb_szTempString_3 = new StringBuilder( szTempString_3 );
                         GetStringFromAttribute( sb_szTempString_3, mSPLDef, "SPLD_MarketingSection", "Name" );
            szTempString_3 = sb_szTempString_3.toString( );}
             {StringBuilder sb_szTempString_3;
            if ( szTempString_3 == null )
               sb_szTempString_3 = new StringBuilder( 32 );
            else
               sb_szTempString_3 = new StringBuilder( szTempString_3 );
                        ZeidonStringConcat( sb_szTempString_3, 1, 0, " - ", 1, 0, 32001 );
            szTempString_3 = sb_szTempString_3.toString( );}
            {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
            StringBuilder sb_szTempString_4;
            if ( szTempString_4 == null )
               sb_szTempString_4 = new StringBuilder( 32 );
            else
               sb_szTempString_4 = new StringBuilder( szTempString_4 );
                         GetVariableFromAttribute( sb_szTempString_4, mi_lTempInteger_4, 'S', 255, mSPLDef, "SPLD_MarketingSection", "Title", "", 0 );
            lTempInteger_4 = mi_lTempInteger_4.intValue( );
            szTempString_4 = sb_szTempString_4.toString( );}
             {StringBuilder sb_szTempString_3;
            if ( szTempString_3 == null )
               sb_szTempString_3 = new StringBuilder( 32 );
            else
               sb_szTempString_3 = new StringBuilder( szTempString_3 );
                        ZeidonStringConcat( sb_szTempString_3, 1, 0, szTempString_4, 1, 0, 32001 );
            szTempString_3 = sb_szTempString_3.toString( );}
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayValue", szTempString_3 );
         } 

         //:END
         //:ELSE
      } 
      else
      { 
         //:mSPLDef.CompositeComponentList.DisplayValue = mSPLDef.SPLD_MarketingSection.Name
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_MarketingSection", "Name" );
      } 

      //:END
      //:mSPLDef.CompositeComponentList.Value              = mSPLDef.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "CompositeComponentList", "DisplayValue" );

      //:FOR EACH mSPLDef.SPLD_MarketingStatement
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mSPLDef.SPLD_MarketingStatement.Title != ""
         if ( CompareAttributeToString( mSPLDef, "SPLD_MarketingStatement", "Title", "" ) != 0 )
         { 
            //:CREATE ENTITY mSPLDef.CompositeComponentList
            RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
            //:mSPLDef.CompositeComponentList.Type              = "SPLD_MarketingTitle"
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_MarketingTitle" );
            //:mSPLDef.CompositeComponentList.SelectLevel       = 2
            SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 2 );
            //:mSPLDef.CompositeComponentList.DisplayType       = "Title"
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Title" );
            //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...Stmt Title"
            SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "...Stmt Title" );
            //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_MarketingStatement.ID
            SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_MarketingStatement", "ID" );
            //:mSPLDef.CompositeComponentList.Value             = mSPLDef.SPLD_MarketingStatement.Title
            SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "SPLD_MarketingStatement", "Title" );
         } 

         //:END

         //:CREATE ENTITY mSPLDef.CompositeComponentList
         RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
         //:mSPLDef.CompositeComponentList.Type              = "SPLD_MarketingStatement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_MarketingStatement" );
         //:mSPLDef.CompositeComponentList.SelectLevel       = 2
         SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 2 );
         //:mSPLDef.CompositeComponentList.DisplayType       = "Statement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Statement" );
         //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...Statement"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mSPLDef.CompositeComponentList.OriginalTypeID    = mSPLDef.SPLD_MarketingStatement.ID
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_MarketingStatement", "ID" );
         //:mSPLDef.CompositeComponentList.Value             = mSPLDef.SPLD_MarketingStatement.Text
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "SPLD_MarketingStatement", "Text" );

         //:szOriginalDisplayValue = mSPLDef.SPLD_MarketingStatement.Text
         {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_5, 'S', 4001, mSPLDef, "SPLD_MarketingStatement", "Text", "", 0 );
         lTempInteger_5 = mi_lTempInteger_5.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:GetAttributeLength( OriginalStringLength, mSPLDef, "SPLD_MarketingStatement", "Text" )
         {MutableInt mi_OriginalStringLength = new MutableInt( OriginalStringLength );
                   GetAttributeLength( mi_OriginalStringLength, mSPLDef, "SPLD_MarketingStatement", "Text" );
         OriginalStringLength = mi_OriginalStringLength.intValue( );}
         //:IF MaxDisplayLength < OriginalStringLength
         if ( MaxDisplayLength < OriginalStringLength )
         { 
            //:szDisplayValue = szOriginalDisplayValue[1:100] + "....."
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringCopy( sb_szDisplayValue, 1, 0, szOriginalDisplayValue, 1, 100, 4001 );
            szDisplayValue = sb_szDisplayValue.toString( );}
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringConcat( sb_szDisplayValue, 1, 0, ".....", 1, 0, 4001 );
            szDisplayValue = sb_szDisplayValue.toString( );}
            //:ELSE
         } 
         else
         { 
            //:szDisplayValue = szOriginalDisplayValue
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringCopy( sb_szDisplayValue, 1, 0, szOriginalDisplayValue, 1, 0, 4001 );
            szDisplayValue = sb_szDisplayValue.toString( );}
         } 

         //:END
         //:mSPLDef.CompositeComponentList.DisplayValue = szDisplayValue
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayValue", szDisplayValue );
         //:SetMatchingAttributesByName( mSPLDef, "CompositeComponentList",
         //:                             mSPLDef, "SPLD_MarketingStatement", zSET_NULL )
         SetMatchingAttributesByName( mSPLDef, "CompositeComponentList", mSPLDef, "SPLD_MarketingStatement", zSET_NULL );
         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingStatement", "" );
      } 

      //:END

      //:// Add any Usage entries.
      //:// First sort by Usage Type, but keeping the entries in their original order otherwise.
      //:Count = 0
      Count = 0;
      //:FOR EACH mSPLDef.SPLD_MarketingUsageOrdering
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:Count = Count + 1
         Count = Count + 1;
         //:mSPLDef.SPLD_MarketingUsageOrdering.wSortOrder = Count
         SetAttributeFromInteger( mSPLDef, "SPLD_MarketingUsageOrdering", "wSortOrder", Count );
         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "" );
      } 

      //:END
      //:OrderEntityForView( mSPLDef, "SPLD_MarketingUsageOrdering", "SPLD_MarketingUsage.UsageType A wSortOrder A" )
      OrderEntityForView( mSPLDef, "SPLD_MarketingUsageOrdering", "SPLD_MarketingUsage.UsageType A wSortOrder A" );
      //:FOR EACH mSPLDef.SPLD_MarketingUsageOrdering
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSPLDef.CompositeComponentList
         RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
         //:GetStringFromAttributeByContext( szUsageType, mSPLDef, "SPLD_MarketingUsage", "UsageType", "FullUsageType", 20 )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttributeByContext( sb_szUsageType, mSPLDef, "SPLD_MarketingUsage", "UsageType", "FullUsageType", 20 );
         szUsageType = sb_szUsageType.toString( );}
         //:mSPLDef.CompositeComponentList.Type              = "SPLD_MarketingUsageOrdering"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_MarketingUsageOrdering" );
         //:mSPLDef.CompositeComponentList.SelectLevel       = 3
         SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 3 );
         //:mSPLDef.CompositeComponentList.DisplayType       = "MarketingUsage"
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "MarketingUsage" );
         //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...Mktg " + szUsageType
          {StringBuilder sb_szTempString_5;
         if ( szTempString_5 == null )
            sb_szTempString_5 = new StringBuilder( 32 );
         else
            sb_szTempString_5 = new StringBuilder( szTempString_5 );
                  ZeidonStringCopy( sb_szTempString_5, 1, 0, "...Mktg ", 1, 0, 255 );
         szTempString_5 = sb_szTempString_5.toString( );}
          {StringBuilder sb_szTempString_5;
         if ( szTempString_5 == null )
            sb_szTempString_5 = new StringBuilder( 32 );
         else
            sb_szTempString_5 = new StringBuilder( szTempString_5 );
                  ZeidonStringConcat( sb_szTempString_5, 1, 0, szUsageType, 1, 0, 255 );
         szTempString_5 = sb_szTempString_5.toString( );}
         SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", szTempString_5 );
         //:mSPLDef.CompositeComponentList.Value             = mSPLDef.SPLD_MarketingUsage.Name
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "Value", mSPLDef, "SPLD_MarketingUsage", "Name" );
         //:mSPLDef.CompositeComponentList.DisplayValue      = mSPLDef.SPLD_MarketingUsage.Name
         SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_MarketingUsage", "Name" );
         //:SET CURSOR FIRST mSPLDef.SPLD_Usage WHERE mSPLDef.SPLD_Usage.UsageType            = mSPLDef.SPLD_MarketingUsage.UsageType
         //:                                  AND mSPLDef.SPLD_Usage.ClaimsClassification = mSPLDef.SPLD_MarketingUsage.ClaimsClassification
         //:                                  AND mSPLDef.SPLD_Usage.Name                 = mSPLDef.SPLD_MarketingUsage.Name
         RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_Usage", "" );
         if ( RESULT > zCURSOR_UNCHANGED )
         { 
            while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( mSPLDef, "SPLD_Usage", "UsageType", mSPLDef, "SPLD_MarketingUsage", "UsageType" ) != 0 ||
                    CompareAttributeToAttribute( mSPLDef, "SPLD_Usage", "ClaimsClassification", mSPLDef, "SPLD_MarketingUsage", "ClaimsClassification" ) != 0 ||
                    CompareAttributeToAttribute( mSPLDef, "SPLD_Usage", "Name", mSPLDef, "SPLD_MarketingUsage", "Name" ) != 0 ) )
            { 
               RESULT = SetCursorNextEntity( mSPLDef, "SPLD_Usage", "" );
            } 

         } 

         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:mSPLDef.CompositeComponentList.OriginalTypeID     = mSPLDef.SPLD_Usage.ID
            SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_Usage", "ID" );
            //:ELSE
         } 
         else
         { 
            //:TraceLineS( "#### Invalid Usage ID ", mSPLDef.SPLD_MarketingUsage.Name )
            {StringBuilder sb_szTempString_6;
            if ( szTempString_6 == null )
               sb_szTempString_6 = new StringBuilder( 32 );
            else
               sb_szTempString_6 = new StringBuilder( szTempString_6 );
                         GetStringFromAttribute( sb_szTempString_6, mSPLDef, "SPLD_MarketingUsage", "Name" );
            szTempString_6 = sb_szTempString_6.toString( );}
            TraceLineS( "#### Invalid Usage ID ", szTempString_6 );
         } 

         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingSection", "" );
      //:END
   } 

   //:END

   //:// Hazards Section
   //:CREATE ENTITY mSPLDef.CompositeComponentList
   RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
   //:mSPLDef.CompositeComponentList.Type               = "SPLD_HumanHazardSection"
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "Type", "SPLD_HumanHazardSection" );
   //:mSPLDef.CompositeComponentList.SelectLevel        = 1
   SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 1 );
   //:mSPLDef.CompositeComponentList.DisplayType        = "Hazards"
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Hazards" );
   //:mSPLDef.CompositeComponentList.DisplayTypeIndent  = "Hazards"
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "Hazards" );
   //:mSPLDef.CompositeComponentList.OriginalTypeID     = mSPLDef.SPLD_HumanHazardSection.ID
   SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "OriginalTypeID", mSPLDef, "SPLD_HumanHazardSection", "ID" );
   //:mSPLDef.CompositeComponentList.DisplayValue       = ""
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayValue", "" );

   //:CREATE ENTITY mSPLDef.CompositeComponentList
   RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
   //:mSPLDef.CompositeComponentList.SelectLevel       = 2
   SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 2 );
   //:mSPLDef.CompositeComponentList.DisplayType       = "Signal Word"
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Signal Word" );
   //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...Signal Word"
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "...Signal Word" );
   //:mSPLDef.CompositeComponentList.DisplayValue      = mSPLDef.SPLD_HumanHazardSection.EPA_SignalWord
   SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_HumanHazardSection", "EPA_SignalWord" );

   //:CREATE ENTITY mSPLDef.CompositeComponentList
   RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
   //:mSPLDef.CompositeComponentList.SelectLevel       = 2
   SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 2 );
   //:mSPLDef.CompositeComponentList.DisplayType       = "Child Warning"
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Child Warning" );
   //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...Child Warning"
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "...Child Warning" );
   //:mSPLDef.CompositeComponentList.DisplayValue      = mSPLDef.SPLD_HumanHazardSection.EPA_ChildHazardWarning
   SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_HumanHazardSection", "EPA_ChildHazardWarning" );

   //:CREATE ENTITY mSPLDef.CompositeComponentList
   RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
   //:mSPLDef.CompositeComponentList.SelectLevel       = 2
   SetAttributeFromInteger( mSPLDef, "CompositeComponentList", "SelectLevel", 2 );
   //:mSPLDef.CompositeComponentList.DisplayType       = "Precautionary Stmt"
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Precautionary Stmt" );
   //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "...Precautionary Stmt"
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "...Precautionary Stmt" );
   //:mSPLDef.CompositeComponentList.DisplayValue      = mSPLDef.SPLD_HumanHazardSection.PrecautionaryStatement
   SetAttributeFromAttribute( mSPLDef, "CompositeComponentList", "DisplayValue", mSPLDef, "SPLD_HumanHazardSection", "PrecautionaryStatement" );

   //:CREATE ENTITY mSPLDef.CompositeComponentList
   RESULT = CreateEntity( mSPLDef, "CompositeComponentList", zPOS_AFTER );
   //:mSPLDef.CompositeComponentList.DisplayType       = "Location"
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayType", "Location" );
   //:mSPLDef.CompositeComponentList.DisplayTypeIndent = "Location"
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayTypeIndent", "Location" );
   //:szCompositeLocation = "..." + mSPLDef.SPLD_HumanHazardSection.PanelLoc1
   {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
   StringBuilder sb_szTempString_7;
   if ( szTempString_7 == null )
      sb_szTempString_7 = new StringBuilder( 32 );
   else
      sb_szTempString_7 = new StringBuilder( szTempString_7 );
       GetVariableFromAttribute( sb_szTempString_7, mi_lTempInteger_6, 'S', 255, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc1", "", 0 );
   lTempInteger_6 = mi_lTempInteger_6.intValue( );
   szTempString_7 = sb_szTempString_7.toString( );}
    {StringBuilder sb_szCompositeLocation;
   if ( szCompositeLocation == null )
      sb_szCompositeLocation = new StringBuilder( 32 );
   else
      sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
      ZeidonStringCopy( sb_szCompositeLocation, 1, 0, "...", 1, 0, 257 );
   szCompositeLocation = sb_szCompositeLocation.toString( );}
    {StringBuilder sb_szCompositeLocation;
   if ( szCompositeLocation == null )
      sb_szCompositeLocation = new StringBuilder( 32 );
   else
      sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
      ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_7, 1, 0, 257 );
   szCompositeLocation = sb_szCompositeLocation.toString( );}
   //:IF mSPLDef.SPLD_HumanHazardSection.PanelLoc2 != ""
   if ( CompareAttributeToString( mSPLDef, "SPLD_HumanHazardSection", "PanelLoc2", "" ) != 0 )
   { 
      //:szCompositeLocation = szCompositeLocation + " / " + mSPLDef.SPLD_HumanHazardSection.PanelLoc2
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, " / ", 1, 0, 257 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
      {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
      StringBuilder sb_szTempString_8;
      if ( szTempString_8 == null )
         sb_szTempString_8 = new StringBuilder( 32 );
      else
         sb_szTempString_8 = new StringBuilder( szTempString_8 );
             GetVariableFromAttribute( sb_szTempString_8, mi_lTempInteger_7, 'S', 255, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc2", "", 0 );
      lTempInteger_7 = mi_lTempInteger_7.intValue( );
      szTempString_8 = sb_szTempString_8.toString( );}
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_8, 1, 0, 257 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
   } 

   //:END
   //:IF mSPLDef.SPLD_HumanHazardSection.PanelLoc3 != ""
   if ( CompareAttributeToString( mSPLDef, "SPLD_HumanHazardSection", "PanelLoc3", "" ) != 0 )
   { 
      //:szCompositeLocation = szCompositeLocation + " / " + mSPLDef.SPLD_HumanHazardSection.PanelLoc3
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, " / ", 1, 0, 257 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
      {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
      StringBuilder sb_szTempString_9;
      if ( szTempString_9 == null )
         sb_szTempString_9 = new StringBuilder( 32 );
      else
         sb_szTempString_9 = new StringBuilder( szTempString_9 );
             GetVariableFromAttribute( sb_szTempString_9, mi_lTempInteger_8, 'S', 255, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc3", "", 0 );
      lTempInteger_8 = mi_lTempInteger_8.intValue( );
      szTempString_9 = sb_szTempString_9.toString( );}
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_9, 1, 0, 257 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
   } 

   //:END
   //:IF mSPLDef.SPLD_HumanHazardSection.PanelLoc4 != ""
   if ( CompareAttributeToString( mSPLDef, "SPLD_HumanHazardSection", "PanelLoc4", "" ) != 0 )
   { 
      //:szCompositeLocation = szCompositeLocation + " / " + mSPLDef.SPLD_HumanHazardSection.PanelLoc4
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, " / ", 1, 0, 257 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
      {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
      StringBuilder sb_szTempString_10;
      if ( szTempString_10 == null )
         sb_szTempString_10 = new StringBuilder( 32 );
      else
         sb_szTempString_10 = new StringBuilder( szTempString_10 );
             GetVariableFromAttribute( sb_szTempString_10, mi_lTempInteger_9, 'S', 255, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc4", "", 0 );
      lTempInteger_9 = mi_lTempInteger_9.intValue( );
      szTempString_10 = sb_szTempString_10.toString( );}
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_10, 1, 0, 257 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
   } 

   //:END
   //:IF mSPLDef.SPLD_HumanHazardSection.PanelLoc5 != ""
   if ( CompareAttributeToString( mSPLDef, "SPLD_HumanHazardSection", "PanelLoc5", "" ) != 0 )
   { 
      //:szCompositeLocation = szCompositeLocation + " / " + mSPLDef.SPLD_HumanHazardSection.PanelLoc5
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, " / ", 1, 0, 257 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
      {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
      StringBuilder sb_szTempString_11;
      if ( szTempString_11 == null )
         sb_szTempString_11 = new StringBuilder( 32 );
      else
         sb_szTempString_11 = new StringBuilder( szTempString_11 );
             GetVariableFromAttribute( sb_szTempString_11, mi_lTempInteger_10, 'S', 255, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc5", "", 0 );
      lTempInteger_10 = mi_lTempInteger_10.intValue( );
      szTempString_11 = sb_szTempString_11.toString( );}
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_11, 1, 0, 257 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
   } 

   //:END
   //:mSPLDef.CompositeComponentList.DisplayValue   = szCompositeLocation
   SetAttributeFromString( mSPLDef, "CompositeComponentList", "DisplayValue", szCompositeLocation );
   return;
// END
} 



}
