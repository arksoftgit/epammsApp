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
import com.quinsoft.zeidon.TaskQualification;
import com.quinsoft.zeidon.vml.VmlObjectOperations;
import com.quinsoft.zeidon.View;
import com.quinsoft.zeidon.ZeidonException;
import com.quinsoft.zeidon.vml.zVIEW;
import org.apache.commons.lang3.mutable.MutableDouble;
import org.apache.commons.lang3.mutable.MutableInt;

import com.quinsoft.epamms.ZGlobal1_Operation;

/**
   @author QuinSoft
**/

public class mMasLC_Object extends VmlObjectOperations
{
   public mMasLC_Object( View view )
   {
      super( view );
   }


//:DERIVED ATTRIBUTE OPERATION
//:dIngredientName( VIEW mMasLC BASED ON LOD mMasLC,
//:                 STRING ( 32 ) InternalEntityStructure,
//:                 STRING ( 32 ) InternalAttribStructure,
//:                 SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szString
public int 
omMasLC_dIngredientName( View     mMasLC,
                         String InternalEntityStructure,
                         String InternalAttribStructure,
                         Integer   GetOrSetFlag )
{
   String   szString = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:IF mMasLC.M_IngredientsStatement EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_IngredientsStatement" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = mMasLC.M_IngredientsStatement.CommonName
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_1, 'S', 2049, mMasLC, "M_IngredientsStatement", "CommonName", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szString = sb_szString.toString( );}
            //:IF szString = ""
            if ( ZeidonStringCompare( szString, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szString = mMasLC.M_IngredientsStatement.ChemicalName
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                               GetVariableFromAttribute( sb_szString, mi_lTempInteger_2, 'S', 2049, mMasLC, "M_IngredientsStatement", "ChemicalName", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szString = sb_szString.toString( );}
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szString = ""
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringCopy( sb_szString, 1, 0, "", 1, 0, 2049 );
            szString = sb_szString.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szString );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dDU_StmtTitleTxtKey( VIEW mMasLC BASED ON LOD mMasLC,
   //:                  STRING ( 32 ) InternalEntityStructure,
   //:                  STRING ( 32 ) InternalAttribStructure,
   //:                  SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dDU_StmtTitleTxtKey( View     mMasLC,
                             String InternalEntityStructure,
                             String InternalAttribStructure,
                             Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   //:STRING ( 256 )  szStatementTitle
   String   szStatementTitle = null;
   //:STRING ( 2048 ) szStatementText
   String   szStatementText = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Directions For Use Display Statement Text is a combination of Title/Text/Keywords.
         //:szStatementText = mMasLC.M_DirectionsForUseStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_DirectionsForUseStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szStatementText,
            //:                            "M_InsertTextKeywordDU", "M_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szStatementText, "M_InsertTextKeywordDU", "M_InsertTextDU", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:szStatementTitle = mMasLC.M_DirectionsForUseStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_1, 'S', 257, mMasLC, "M_DirectionsForUseStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szStatementTitle,
            //:                            "M_InsertTextKeywordDU", "M_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szStatementTitle, "M_InsertTextKeywordDU", "M_InsertTextDU", ", " );
            szStatementTitle = sb_szStatementTitle.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:szDisplayStatement = szStatementTitle
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szStatementTitle, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
            //:IF szStatementText != ""
            if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
            { 
               //:szDisplayStatement = szDisplayStatement + " --- " + szStatementText
                {StringBuilder sb_szDisplayStatement;
               if ( szDisplayStatement == null )
                  sb_szDisplayStatement = new StringBuilder( 32 );
               else
                  sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                              ZeidonStringConcat( sb_szDisplayStatement, 1, 0, " --- ", 1, 0, 2049 );
               szDisplayStatement = sb_szDisplayStatement.toString( );}
                {StringBuilder sb_szDisplayStatement;
               if ( szDisplayStatement == null )
                  sb_szDisplayStatement = new StringBuilder( 32 );
               else
                  sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                              ZeidonStringConcat( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
               szDisplayStatement = sb_szDisplayStatement.toString( );}
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szDisplayStatement = szStatementText
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dMasterProductNameNbr( VIEW mMasLC BASED ON LOD mMasLC,
//:                       STRING ( 32 ) InternalEntityStructure,
//:                       STRING ( 32 ) InternalAttribStructure,
//:                       SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szString
public int 
omMasLC_dMasterProductNameNbr( View     mMasLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   String   szString = null;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_1 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_2 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:IF mMasLC.MasterProduct  EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "MasterProduct" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = mMasLC.MasterProduct.Name + " (" +
            //:        mMasLC.PrimaryRegistrant.EPA_CompanyNumber + "-" +
            //:        mMasLC.MasterProduct.Number + ")"
            {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetStringFromAttribute( sb_szString, mMasLC, "MasterProduct", "Name" );
            szString = sb_szString.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, " (", 1, 0, 2049 );
            szString = sb_szString.toString( );}
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 7, mMasLC, "PrimaryRegistrant", "EPA_CompanyNumber", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szTempString_0 = sb_szTempString_0.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, szTempString_0, 1, 0, 2049 );
            szString = sb_szString.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, "-", 1, 0, 2049 );
            szString = sb_szString.toString( );}
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
            StringBuilder sb_szTempString_1;
            if ( szTempString_1 == null )
               sb_szTempString_1 = new StringBuilder( 32 );
            else
               sb_szTempString_1 = new StringBuilder( szTempString_1 );
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_2, 'S', 6, mMasLC, "MasterProduct", "Number", "", 0 );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );
            szTempString_1 = sb_szTempString_1.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, szTempString_1, 1, 0, 2049 );
            szString = sb_szString.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, ")", 1, 0, 2049 );
            szString = sb_szString.toString( );}
            //:ELSE
         } 
         else
         { 
            //:szString = ""
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringCopy( sb_szString, 1, 0, "", 1, 0, 2049 );
            szString = sb_szString.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szString );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dRegistrantNameID( VIEW mMasLC BASED ON LOD mMasLC,
   //:                STRING ( 32 ) InternalEntityStructure,
   //:                STRING ( 32 ) InternalAttribStructure,
   //:                SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szString
public int 
omMasLC_dRegistrantNameID( View     mMasLC,
                           String InternalEntityStructure,
                           String InternalAttribStructure,
                           Integer   GetOrSetFlag )
{
   String   szString = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_2 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:IF mMasLC.Organization  EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "Organization" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = mMasLC.Organization.Name
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_1, 'S', 2049, mMasLC, "Organization", "Name", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szString = sb_szString.toString( );}
            //:IF mMasLC.PrimaryRegistrant.EPA_CompanyNumber = ""
            if ( CompareAttributeToString( mMasLC, "PrimaryRegistrant", "EPA_CompanyNumber", "" ) == 0 )
            { 
               //:szString = szString + " (Non EPA)"
                {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                              ZeidonStringConcat( sb_szString, 1, 0, " (Non EPA)", 1, 0, 2049 );
               szString = sb_szString.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szString = szString + " (" + mMasLC.PrimaryRegistrant.EPA_CompanyNumber + ")"
                {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                              ZeidonStringConcat( sb_szString, 1, 0, " (", 1, 0, 2049 );
               szString = sb_szString.toString( );}
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_2, 'S', 7, mMasLC, "PrimaryRegistrant", "EPA_CompanyNumber", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                              ZeidonStringConcat( sb_szString, 1, 0, szTempString_0, 1, 0, 2049 );
               szString = sb_szString.toString( );}
                {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                              ZeidonStringConcat( sb_szString, 1, 0, ")", 1, 0, 2049 );
               szString = sb_szString.toString( );}
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szString = ""
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringCopy( sb_szString, 1, 0, "", 1, 0, 2049 );
            szString = sb_szString.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szString );
         //:RETURN 0
         if(8==8)return( 0 );
         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:TRANSFORMATION OPERATION
   //:BuildNewMLC_Version( VIEW NewMLC      BASED ON LOD mMasLC,
   //:                  VIEW PreviousMLC BASED ON LOD mMasLC )

   //:STRING ( 10 ) szVersion
public int 
omMasLC_BuildNewMLC_Version( View     NewMLC,
                             View     PreviousMLC )
{
   String   szVersion = null;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;


   //:// Create a new MLC from a previous MLC, tieing the new back to the original.

   //:// Root and single includes
   //:CREATE ENTITY NewMLC.MasterLabelContent
   RESULT = CreateEntity( NewMLC, "MasterLabelContent", zPOS_AFTER );
   //:SetMatchingAttributesByName( NewMLC, "MasterLabelContent", PreviousMLC, "MasterLabelContent", zSET_NULL )
   SetMatchingAttributesByName( NewMLC, "MasterLabelContent", PreviousMLC, "MasterLabelContent", zSET_NULL );
   //:SetAttributeFromCurrentDateTime( NewMLC, "MasterLabelContent", "RevisionDate" )
   {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( NewMLC );
    m_ZGlobal1_Operation.SetAttributeFromCurrentDateTime( NewMLC, "MasterLabelContent", "RevisionDate" );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   }
   //:szVersion = NewMLC.MasterLabelContent.RevisionDate
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szVersion;
   if ( szVersion == null )
      sb_szVersion = new StringBuilder( 32 );
   else
      sb_szVersion = new StringBuilder( szVersion );
       GetVariableFromAttribute( sb_szVersion, mi_lTempInteger_0, 'S', 11, NewMLC, "MasterLabelContent", "RevisionDate", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szVersion = sb_szVersion.toString( );}
   //:NewMLC.MasterLabelContent.Version = szVersion
   SetAttributeFromString( NewMLC, "MasterLabelContent", "Version", szVersion );
   //:INCLUDE NewMLC.MasterProduct FROM PreviousMLC.MasterProduct
   RESULT = IncludeSubobjectFromSubobject( NewMLC, "MasterProduct", PreviousMLC, "MasterProduct", zPOS_AFTER );
   //:INCLUDE NewMLC.MP_MasterLabelContent FROM PreviousMLC.MasterLabelContent
   RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_MasterLabelContent", PreviousMLC, "MasterLabelContent", zPOS_AFTER );

   //:// M_Usage Subobject
   //:// Check to make sure we are not copying duplicates.
   //:FOR EACH PreviousMLC.M_Usage
   RESULT = SetCursorFirstEntity( PreviousMLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST NewMLC.M_Usage WHERE NewMLC.M_Usage.UsageType = PreviousMLC.M_Usage.UsageType
      //:                                  AND NewMLC.M_Usage.Name = PreviousMLC.M_Usage.Name
      RESULT = SetCursorFirstEntity( NewMLC, "M_Usage", "" );
      if ( RESULT > zCURSOR_UNCHANGED )
      { 
         while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( NewMLC, "M_Usage", "UsageType", PreviousMLC, "M_Usage", "UsageType" ) != 0 || CompareAttributeToAttribute( NewMLC, "M_Usage", "Name", PreviousMLC, "M_Usage", "Name" ) != 0 ) )
         { 
            RESULT = SetCursorNextEntity( NewMLC, "M_Usage", "" );
         } 

      } 

      //:IF RESULT < zCURSOR_SET
      if ( RESULT < zCURSOR_SET )
      { 
         //:CREATE ENTITY NewMLC.M_Usage
         RESULT = CreateEntity( NewMLC, "M_Usage", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewMLC, "M_Usage", PreviousMLC, "M_Usage", zSET_NULL )
         SetMatchingAttributesByName( NewMLC, "M_Usage", PreviousMLC, "M_Usage", zSET_NULL );
         //:INCLUDE NewMLC.MP_Usage FROM PreviousMLC.M_Usage
         RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_Usage", PreviousMLC, "M_Usage", zPOS_AFTER );
      } 

      RESULT = SetCursorNextEntity( PreviousMLC, "M_Usage", "" );
      //:END
   } 

   //:END

   //:// M_GeneralSection Subobject
   //:FOR EACH PreviousMLC.M_GeneralSection
   RESULT = SetCursorFirstEntity( PreviousMLC, "M_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewMLC.M_GeneralSection
      RESULT = CreateEntity( NewMLC, "M_GeneralSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewMLC, "M_GeneralSection", PreviousMLC, "M_GeneralSection", zSET_NULL )
      SetMatchingAttributesByName( NewMLC, "M_GeneralSection", PreviousMLC, "M_GeneralSection", zSET_NULL );
      //:INCLUDE NewMLC.MP_GeneralSection FROM PreviousMLC.M_GeneralSection
      RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_GeneralSection", PreviousMLC, "M_GeneralSection", zPOS_AFTER );
      //:FOR EACH PreviousMLC.M_GeneralStatement
      RESULT = SetCursorFirstEntity( PreviousMLC, "M_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewMLC.M_GeneralStatement
         RESULT = CreateEntity( NewMLC, "M_GeneralStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewMLC, "M_GeneralStatement", PreviousMLC, "M_GeneralStatement", zSET_NULL )
         SetMatchingAttributesByName( NewMLC, "M_GeneralStatement", PreviousMLC, "M_GeneralStatement", zSET_NULL );
         //:INCLUDE NewMLC.MP_GeneralStatement FROM PreviousMLC.M_GeneralStatement
         RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_GeneralStatement", PreviousMLC, "M_GeneralStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( PreviousMLC, "M_GeneralStatement", "" );
      } 

      RESULT = SetCursorNextEntity( PreviousMLC, "M_GeneralSection", "" );
      //:END
   } 

   //:END

   //:// M_IngredientsSection Subobject
   //:FOR EACH PreviousMLC.M_IngredientsSection
   RESULT = SetCursorFirstEntity( PreviousMLC, "M_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewMLC.M_IngredientsSection
      RESULT = CreateEntity( NewMLC, "M_IngredientsSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewMLC, "M_IngredientsSection", PreviousMLC, "M_IngredientsSection", zSET_NULL )
      SetMatchingAttributesByName( NewMLC, "M_IngredientsSection", PreviousMLC, "M_IngredientsSection", zSET_NULL );
      //:INCLUDE NewMLC.MP_IngredientsSection FROM PreviousMLC.M_IngredientsSection
      RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_IngredientsSection", PreviousMLC, "M_IngredientsSection", zPOS_AFTER );
      //:FOR EACH PreviousMLC.M_IngredientsStatement
      RESULT = SetCursorFirstEntity( PreviousMLC, "M_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewMLC.M_IngredientsStatement
         RESULT = CreateEntity( NewMLC, "M_IngredientsStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewMLC, "M_IngredientsStatement", PreviousMLC, "M_IngredientsStatement", zSET_NULL )
         SetMatchingAttributesByName( NewMLC, "M_IngredientsStatement", PreviousMLC, "M_IngredientsStatement", zSET_NULL );
         //:INCLUDE NewMLC.MP_IngredientsStatement FROM PreviousMLC.M_IngredientsStatement
         RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_IngredientsStatement", PreviousMLC, "M_IngredientsStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( PreviousMLC, "M_IngredientsStatement", "" );
      } 

      RESULT = SetCursorNextEntity( PreviousMLC, "M_IngredientsSection", "" );
      //:END
   } 

   //:END

   //:// M_StorageDisposalSection Subobject
   //:FOR EACH PreviousMLC.M_StorageDisposalSection
   RESULT = SetCursorFirstEntity( PreviousMLC, "M_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewMLC.M_StorageDisposalSection
      RESULT = CreateEntity( NewMLC, "M_StorageDisposalSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewMLC, "M_StorageDisposalSection", PreviousMLC, "M_StorageDisposalSection", zSET_NULL )
      SetMatchingAttributesByName( NewMLC, "M_StorageDisposalSection", PreviousMLC, "M_StorageDisposalSection", zSET_NULL );
      //:INCLUDE NewMLC.MP_StorageDisposalSection FROM PreviousMLC.M_StorageDisposalSection
      RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_StorageDisposalSection", PreviousMLC, "M_StorageDisposalSection", zPOS_AFTER );
      //:FOR EACH PreviousMLC.M_StorageDisposalStatement
      RESULT = SetCursorFirstEntity( PreviousMLC, "M_StorageDisposalStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewMLC.M_StorageDisposalStatement
         RESULT = CreateEntity( NewMLC, "M_StorageDisposalStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewMLC, "M_StorageDisposalStatement", PreviousMLC, "M_StorageDisposalStatement", zSET_NULL )
         SetMatchingAttributesByName( NewMLC, "M_StorageDisposalStatement", PreviousMLC, "M_StorageDisposalStatement", zSET_NULL );
         //:INCLUDE NewMLC.MP_StorageDisposalStatement FROM PreviousMLC.M_StorageDisposalStatement
         RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_StorageDisposalStatement", PreviousMLC, "M_StorageDisposalStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( PreviousMLC, "M_StorageDisposalStatement", "" );
      } 

      RESULT = SetCursorNextEntity( PreviousMLC, "M_StorageDisposalSection", "" );
      //:END
   } 

   //:END
   //:TraceLineS( "!!! Commit 3", "" )
   TraceLineS( "!!! Commit 3", "" );
   //:COMMIT NewMLC
   RESULT = CommitObjectInstance( NewMLC );

   //:// M_DirectionsForUseSection Subobject
   //:FOR EACH PreviousMLC.M_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( PreviousMLC, "M_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewMLC.M_DirectionsForUseSection
      RESULT = CreateEntity( NewMLC, "M_DirectionsForUseSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewMLC, "M_DirectionsForUseSection", PreviousMLC, "M_DirectionsForUseSection", zSET_NULL )
      SetMatchingAttributesByName( NewMLC, "M_DirectionsForUseSection", PreviousMLC, "M_DirectionsForUseSection", zSET_NULL );
      //:INCLUDE NewMLC.MP_DirectionsForUseSection FROM PreviousMLC.M_DirectionsForUseSection
      RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_DirectionsForUseSection", PreviousMLC, "M_DirectionsForUseSection", zPOS_AFTER );
      //:FOR EACH PreviousMLC.M_DirectionsForUseStatement
      RESULT = SetCursorFirstEntity( PreviousMLC, "M_DirectionsForUseStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewMLC.M_DirectionsForUseStatement
         RESULT = CreateEntity( NewMLC, "M_DirectionsForUseStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewMLC, "M_DirectionsForUseStatement", PreviousMLC, "M_DirectionsForUseStatement", zSET_NULL )
         SetMatchingAttributesByName( NewMLC, "M_DirectionsForUseStatement", PreviousMLC, "M_DirectionsForUseStatement", zSET_NULL );
         //:INCLUDE NewMLC.MP_DirectionsForUseStatement FROM PreviousMLC.M_DirectionsForUseStatement
         RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_DirectionsForUseStatement", PreviousMLC, "M_DirectionsForUseStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( PreviousMLC, "M_DirectionsForUseStatement", "" );
      } 

      //:END

      //:// Include appropriate Usage statements.
      //:TraceLineS( "!!! Commit 4", "" )
      TraceLineS( "!!! Commit 4", "" );
      //:COMMIT NewMLC
      RESULT = CommitObjectInstance( NewMLC );
      RESULT = SetCursorNextEntity( PreviousMLC, "M_DirectionsForUseSection", "" );
   } 

   //:   /*FOR EACH PreviousMLC.M_DirectionsUsageOrdering
   //:      // Check to see if the Usage already exists. This can happen if two Usages have the same name.
   //:      SET CURSOR FIRST NewMLC.M_DirectionsUsage WHERE NewMLC.M_DirectionsUsage.Name                 = PreviousMLC.M_DirectionsUsage.Name
   //:                                                  AND NewMLC.M_DirectionsUsage.UsageType            = PreviousMLC.M_DirectionsUsage.UsageType
   //:                                                  AND NewMLC.M_DirectionsUsage.ClaimsClassification = PreviousMLC.M_DirectionsUsage.ClaimsClassification
   //:      IF RESULT < zCURSOR_SET
   //:         SET CURSOR FIRST NewMLC.M_Usage WHERE NewMLC.M_Usage.Name                 = PreviousMLC.M_DirectionsUsage.Name
   //:                                           AND NewMLC.M_Usage.UsageType            = PreviousMLC.M_DirectionsUsage.UsageType
   //:                                           AND NewMLC.M_Usage.ClaimsClassification = PreviousMLC.M_DirectionsUsage.ClaimsClassification
   //:         IF RESULT >= zCURSOR_SET
   //:            CREATE ENTITY NewMLC.M_DirectionsUsageOrdering
   //:            INCLUDE NewMLC.M_DirectionsUsage FROM NewMLC.M_Usage
   //:    TraceLineS( "!!! Commit 5", "" )
   //:    COMMIT NewMLC
   //:         END
   //:      END
   //:   END*/
   //:END
   //:TraceLineS( "!!! Commit 6", "" )
   TraceLineS( "!!! Commit 6", "" );
   //:COMMIT NewMLC
   RESULT = CommitObjectInstance( NewMLC );

   //:// M_MarketingSection Subobject
   //:FOR EACH PreviousMLC.M_MarketingSection
   RESULT = SetCursorFirstEntity( PreviousMLC, "M_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewMLC.M_MarketingSection
      RESULT = CreateEntity( NewMLC, "M_MarketingSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewMLC, "M_MarketingSection", PreviousMLC, "M_MarketingSection", zSET_NULL )
      SetMatchingAttributesByName( NewMLC, "M_MarketingSection", PreviousMLC, "M_MarketingSection", zSET_NULL );
      //:INCLUDE NewMLC.MP_MarketingSection FROM PreviousMLC.M_MarketingSection
      RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_MarketingSection", PreviousMLC, "M_MarketingSection", zPOS_AFTER );
      //:FOR EACH PreviousMLC.M_MarketingStatement
      RESULT = SetCursorFirstEntity( PreviousMLC, "M_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewMLC.M_MarketingStatement
         RESULT = CreateEntity( NewMLC, "M_MarketingStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewMLC, "M_MarketingStatement", PreviousMLC, "M_MarketingStatement", zSET_NULL )
         SetMatchingAttributesByName( NewMLC, "M_MarketingStatement", PreviousMLC, "M_MarketingStatement", zSET_NULL );
         //:INCLUDE NewMLC.MP_MarketingStatement FROM PreviousMLC.M_MarketingStatement
         RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_MarketingStatement", PreviousMLC, "M_MarketingStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( PreviousMLC, "M_MarketingStatement", "" );
      } 

      RESULT = SetCursorNextEntity( PreviousMLC, "M_MarketingSection", "" );
      //:END
   } 


   //:    // Include appropriate Usage statements.
   //:   /*FOR EACH PreviousMLC.M_MarketingUsage WITHIN PreviousMLC.M_MarketingSection
   //:      // Check to see if the Usage already exists. This can happen if two Usages have the same name.
   //:      SET CURSOR FIRST NewMLC.M_MarketingUsage WHERE NewMLC.M_MarketingUsage.Name = PreviousMLC.M_MarketingUsage.Name
   //:                                                 AND NewMLC.M_MarketingUsage.UsageType = PreviousMLC.M_MarketingUsage.UsageType
   //:      IF RESULT < zCURSOR_SET
   //:         SET CURSOR FIRST NewMLC.M_Usage WHERE NewMLC.M_Usage.Name = PreviousMLC.M_MarketingUsage.Name
   //:                                           AND NewMLC.M_Usage.UsageType = PreviousMLC.M_MarketingUsage.UsageType
   //:         CREATE ENTITY NewMLC.M_MarketingUsageOrdering
   //:         INCLUDE NewMLC.M_MarketingUsage FROM NewMLC.M_Usage
   //:      END
   //:   END*/
   //:END
   //:TraceLineS( "!!! Commit 7", "" )
   TraceLineS( "!!! Commit 7", "" );
   //:COMMIT NewMLC
   RESULT = CommitObjectInstance( NewMLC );

   //:// M_HumanHazardSection Subobject
   //:FOR EACH PreviousMLC.M_HumanHazardSection
   RESULT = SetCursorFirstEntity( PreviousMLC, "M_HumanHazardSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewMLC.M_HumanHazardSection
      RESULT = CreateEntity( NewMLC, "M_HumanHazardSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewMLC, "M_HumanHazardSection", PreviousMLC, "M_HumanHazardSection", zSET_NULL )
      SetMatchingAttributesByName( NewMLC, "M_HumanHazardSection", PreviousMLC, "M_HumanHazardSection", zSET_NULL );
      //:INCLUDE NewMLC.MP_HumanHazardSection FROM PreviousMLC.M_HumanHazardSection
      RESULT = IncludeSubobjectFromSubobject( NewMLC, "MP_HumanHazardSection", PreviousMLC, "M_HumanHazardSection", zPOS_AFTER );
      RESULT = SetCursorNextEntity( PreviousMLC, "M_HumanHazardSection", "" );
   } 

   //:END
   //:TraceLineS( "!!! Commit 8", "" )
   TraceLineS( "!!! Commit 8", "" );
   //:COMMIT NewMLC
   RESULT = CommitObjectInstance( NewMLC );
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:CopyMLCToNewProduct( VIEW TargetMLC BASED ON LOD mMasLC,
//:                     VIEW SourceMLC BASED ON LOD mMasLC )

//:   VIEW TargetMLC2  BASED ON LOD mMasLC
public int 
omMasLC_CopyMLCToNewProduct( View     TargetMLC,
                             View     SourceMLC )
{
   zVIEW    TargetMLC2 = new zVIEW( );
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;


   //:// Copy the Source MLC to the new Target MLC, which is for a new Product.
   //:// The root entity of the new Target MLC will have been created and linked to the appropriate Product
   //:// prior to entering this operation.

   //:// For root, only set attributes.
   //:SetMatchingAttributesByName( TargetMLC, "MasterLabelContent", SourceMLC, "MasterLabelContent", zSET_NULL )
   SetMatchingAttributesByName( TargetMLC, "MasterLabelContent", SourceMLC, "MasterLabelContent", zSET_NULL );
   //:TargetMLC.MasterLabelContent.Finalized = "W"
   SetAttributeFromString( TargetMLC, "MasterLabelContent", "Finalized", "W" );

   //:// Tie to previous version.
   //:INCLUDE TargetMLC.MP_MasterLabelContent FROM SourceMLC.MasterLabelContent
   RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_MasterLabelContent", SourceMLC, "MasterLabelContent", zPOS_AFTER );

   //:// Usage Footnotes.
   //:FOR EACH SourceMLC.M_UsageFootnote
   RESULT = SetCursorFirstEntity( SourceMLC, "M_UsageFootnote", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY TargetMLC.M_UsageFootnote
      RESULT = CreateEntity( TargetMLC, "M_UsageFootnote", zPOS_AFTER );
      //:SetMatchingAttributesByName( TargetMLC, "M_UsageFootnote", SourceMLC, "M_UsageFootnote", zSET_NULL )
      SetMatchingAttributesByName( TargetMLC, "M_UsageFootnote", SourceMLC, "M_UsageFootnote", zSET_NULL );
      RESULT = SetCursorNextEntity( SourceMLC, "M_UsageFootnote", "" );
   } 

   //:END

   //:// M_Usage Subobject
   //:// Check to make sure we are not copying duplicates.
   //:FOR EACH SourceMLC.M_UsageType
   RESULT = SetCursorFirstEntity( SourceMLC, "M_UsageType", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY TargetMLC.M_UsageType
      RESULT = CreateEntity( TargetMLC, "M_UsageType", zPOS_AFTER );
      //:SetMatchingAttributesByName( TargetMLC, "M_UsageType", SourceMLC, "M_UsageType", zSET_NULL )
      SetMatchingAttributesByName( TargetMLC, "M_UsageType", SourceMLC, "M_UsageType", zSET_NULL );
      //:FOR EACH SourceMLC.M_Usage
      RESULT = SetCursorFirstEntity( SourceMLC, "M_Usage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST TargetMLC.M_Usage WHERE TargetMLC.M_Usage.UsageType = SourceMLC.M_Usage.UsageType
         //:                                     AND TargetMLC.M_Usage.Name = SourceMLC.M_Usage.Name
         RESULT = SetCursorFirstEntity( TargetMLC, "M_Usage", "" );
         if ( RESULT > zCURSOR_UNCHANGED )
         { 
            while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( TargetMLC, "M_Usage", "UsageType", SourceMLC, "M_Usage", "UsageType" ) != 0 ||
                    CompareAttributeToAttribute( TargetMLC, "M_Usage", "Name", SourceMLC, "M_Usage", "Name" ) != 0 ) )
            { 
               RESULT = SetCursorNextEntity( TargetMLC, "M_Usage", "" );
            } 

         } 

         //:IF RESULT < zCURSOR_SET
         if ( RESULT < zCURSOR_SET )
         { 
            //:CREATE ENTITY TargetMLC.M_Usage
            RESULT = CreateEntity( TargetMLC, "M_Usage", zPOS_AFTER );
            //:SetMatchingAttributesByName( TargetMLC, "M_Usage", SourceMLC, "M_Usage", zSET_NULL )
            SetMatchingAttributesByName( TargetMLC, "M_Usage", SourceMLC, "M_Usage", zSET_NULL );
            //:INCLUDE TargetMLC.MP_Usage FROM SourceMLC.M_Usage
            RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_Usage", SourceMLC, "M_Usage", zPOS_AFTER );
            //:IF SourceMLC.M_UsageFootnoteUsed EXISTS
            lTempInteger_0 = CheckExistenceOfEntity( SourceMLC, "M_UsageFootnoteUsed" );
            if ( lTempInteger_0 == 0 )
            { 
               //:SET CURSOR FIRST TargetMLC.M_UsageFootnote
               //:           WHERE TargetMLC.M_UsageFootnote.Text = SourceMLC.M_UsageFootnoteUsed.Text
               {StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetStringFromAttribute( sb_szTempString_0, SourceMLC, "M_UsageFootnoteUsed", "Text" );
               szTempString_0 = sb_szTempString_0.toString( );}
               RESULT = SetCursorFirstEntityByString( TargetMLC, "M_UsageFootnote", "Text", szTempString_0, "" );
               //:IF RESULT >= zCURSOR_SET
               if ( RESULT >= zCURSOR_SET )
               { 
                  //:INCLUDE TargetMLC.M_UsageFootnoteUsed FROM TargetMLC.M_UsageFootnote
                  RESULT = IncludeSubobjectFromSubobject( TargetMLC, "M_UsageFootnoteUsed", TargetMLC, "M_UsageFootnote", zPOS_AFTER );
               } 

               //:END
            } 

            //:END
         } 

         RESULT = SetCursorNextEntity( SourceMLC, "M_Usage", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SourceMLC, "M_UsageType", "" );
      //:END
   } 

   //:END

   //:// General Section
   //:FOR EACH SourceMLC.M_GeneralSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY TargetMLC.M_GeneralSection
      RESULT = CreateEntity( TargetMLC, "M_GeneralSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( TargetMLC, "M_GeneralSection", SourceMLC, "M_GeneralSection", zSET_NULL )
      SetMatchingAttributesByName( TargetMLC, "M_GeneralSection", SourceMLC, "M_GeneralSection", zSET_NULL );
      //:INCLUDE TargetMLC.MP_GeneralSection FROM SourceMLC.M_GeneralSection
      RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_GeneralSection", SourceMLC, "M_GeneralSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_GeneralStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY TargetMLC.M_GeneralStatement
         RESULT = CreateEntity( TargetMLC, "M_GeneralStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( TargetMLC, "M_GeneralStatement", SourceMLC, "M_GeneralStatement", zSET_NULL )
         SetMatchingAttributesByName( TargetMLC, "M_GeneralStatement", SourceMLC, "M_GeneralStatement", zSET_NULL );
         //:INCLUDE TargetMLC.MP_GeneralStatement FROM SourceMLC.M_GeneralStatement
         RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_GeneralStatement", SourceMLC, "M_GeneralStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceMLC, "M_GeneralStatement", "" );
      } 

      //:END

      //:// ReviewerNote
      //:FOR EACH SourceMLC.M_GeneralReviewerNote
      RESULT = SetCursorFirstEntity( SourceMLC, "M_GeneralReviewerNote", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY TargetMLC.M_GeneralReviewerNote
         RESULT = CreateEntity( TargetMLC, "M_GeneralReviewerNote", zPOS_AFTER );
         //:SetMatchingAttributesByName( TargetMLC, "M_GeneralReviewerNote", SourceMLC, "M_GeneralReviewerNote", zSET_NULL )
         SetMatchingAttributesByName( TargetMLC, "M_GeneralReviewerNote", SourceMLC, "M_GeneralReviewerNote", zSET_NULL );
         RESULT = SetCursorNextEntity( SourceMLC, "M_GeneralReviewerNote", "" );
      } 

      RESULT = SetCursorNextEntity( SourceMLC, "M_GeneralSection", "" );
      //:END
   } 

   //:END

   //:// Ingredients Section
   //:FOR EACH SourceMLC.M_IngredientsSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY TargetMLC.M_IngredientsSection
      RESULT = CreateEntity( TargetMLC, "M_IngredientsSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( TargetMLC, "M_IngredientsSection", SourceMLC, "M_IngredientsSection", zSET_NULL )
      SetMatchingAttributesByName( TargetMLC, "M_IngredientsSection", SourceMLC, "M_IngredientsSection", zSET_NULL );
      //:INCLUDE TargetMLC.MP_IngredientsSection FROM SourceMLC.M_IngredientsSection
      RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_IngredientsSection", SourceMLC, "M_IngredientsSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_IngredientsStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY TargetMLC.M_IngredientsStatement
         RESULT = CreateEntity( TargetMLC, "M_IngredientsStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( TargetMLC, "M_IngredientsStatement", SourceMLC, "M_IngredientsStatement", zSET_NULL )
         SetMatchingAttributesByName( TargetMLC, "M_IngredientsStatement", SourceMLC, "M_IngredientsStatement", zSET_NULL );
         //:INCLUDE TargetMLC.MP_IngredientsStatement FROM SourceMLC.M_IngredientsStatement
         RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_IngredientsStatement", SourceMLC, "M_IngredientsStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceMLC, "M_IngredientsStatement", "" );
      } 

      //:END

      //:// ReviewerNote
      //:FOR EACH SourceMLC.M_IngredientsReviewerNote
      RESULT = SetCursorFirstEntity( SourceMLC, "M_IngredientsReviewerNote", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY TargetMLC.M_IngredientsReviewerNote
         RESULT = CreateEntity( TargetMLC, "M_IngredientsReviewerNote", zPOS_AFTER );
         //:SetMatchingAttributesByName( TargetMLC, "M_IngredientsReviewerNote", SourceMLC, "M_IngredientsReviewerNote", zSET_NULL )
         SetMatchingAttributesByName( TargetMLC, "M_IngredientsReviewerNote", SourceMLC, "M_IngredientsReviewerNote", zSET_NULL );
         RESULT = SetCursorNextEntity( SourceMLC, "M_IngredientsReviewerNote", "" );
      } 

      RESULT = SetCursorNextEntity( SourceMLC, "M_IngredientsSection", "" );
      //:END
   } 

   //:END

   //:// StorageDisposal Section
   //:FOR EACH SourceMLC.M_StorageDisposalSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY TargetMLC.M_StorageDisposalSection
      RESULT = CreateEntity( TargetMLC, "M_StorageDisposalSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( TargetMLC, "M_StorageDisposalSection", SourceMLC, "M_StorageDisposalSection", zSET_NULL )
      SetMatchingAttributesByName( TargetMLC, "M_StorageDisposalSection", SourceMLC, "M_StorageDisposalSection", zSET_NULL );
      //:INCLUDE TargetMLC.MP_StorageDisposalSection FROM SourceMLC.M_StorageDisposalSection
      RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_StorageDisposalSection", SourceMLC, "M_StorageDisposalSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_StorageDisposalStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_StorageDisposalStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY TargetMLC.M_StorageDisposalStatement
         RESULT = CreateEntity( TargetMLC, "M_StorageDisposalStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( TargetMLC, "M_StorageDisposalStatement", SourceMLC, "M_StorageDisposalStatement", zSET_NULL )
         SetMatchingAttributesByName( TargetMLC, "M_StorageDisposalStatement", SourceMLC, "M_StorageDisposalStatement", zSET_NULL );
         //:INCLUDE TargetMLC.MP_StorageDisposalStatement FROM SourceMLC.M_StorageDisposalStatement
         RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_StorageDisposalStatement", SourceMLC, "M_StorageDisposalStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceMLC, "M_StorageDisposalStatement", "" );
      } 

      RESULT = SetCursorNextEntity( SourceMLC, "M_StorageDisposalSection", "" );
      //:END
   } 

   //:END

   //:// DirectionsForUse Section
   //:FOR EACH SourceMLC.M_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY TargetMLC.M_DirectionsForUseSection
      RESULT = CreateEntity( TargetMLC, "M_DirectionsForUseSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( TargetMLC, "M_DirectionsForUseSection", SourceMLC, "M_DirectionsForUseSection", zSET_NULL )
      SetMatchingAttributesByName( TargetMLC, "M_DirectionsForUseSection", SourceMLC, "M_DirectionsForUseSection", zSET_NULL );
      //:INCLUDE TargetMLC.MP_DirectionsForUseSection FROM SourceMLC.M_DirectionsForUseSection
      RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_DirectionsForUseSection", SourceMLC, "M_DirectionsForUseSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_DirectionsForUseStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_DirectionsForUseStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY TargetMLC.M_DirectionsForUseStatement
         RESULT = CreateEntity( TargetMLC, "M_DirectionsForUseStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( TargetMLC, "M_DirectionsForUseStatement", SourceMLC, "M_DirectionsForUseStatement", zSET_NULL )
         SetMatchingAttributesByName( TargetMLC, "M_DirectionsForUseStatement", SourceMLC, "M_DirectionsForUseStatement", zSET_NULL );
         //:INCLUDE TargetMLC.MP_DirectionsForUseStatement FROM SourceMLC.M_DirectionsForUseStatement
         RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_DirectionsForUseStatement", SourceMLC, "M_DirectionsForUseStatement", zPOS_AFTER );

         //:// Statement Directions Usage
         //:FOR EACH SourceMLC.M_DirectionsUsageOrdering
         RESULT = SetCursorFirstEntity( SourceMLC, "M_DirectionsUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY TargetMLC.M_DirectionsUsageOrdering
            RESULT = CreateEntity( TargetMLC, "M_DirectionsUsageOrdering", zPOS_AFTER );
            //:SetMatchingAttributesByName( TargetMLC, "M_DirectionsUsageOrdering", SourceMLC, "M_DirectionsUsageOrdering", zSET_NULL )
            SetMatchingAttributesByName( TargetMLC, "M_DirectionsUsageOrdering", SourceMLC, "M_DirectionsUsageOrdering", zSET_NULL );
            //:SET CURSOR FIRST TargetMLC.MP_Usage WITHIN TargetMLC.MasterLabelContent
            //:           WHERE TargetMLC.MP_Usage.ID = SourceMLC.M_Usage.ID
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                         GetIntegerFromAttribute( mi_lTempInteger_1, SourceMLC, "M_Usage", "ID" );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( TargetMLC, "MP_Usage", "ID", lTempInteger_1, "MasterLabelContent" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:INCLUDE TargetMLC.M_DirectionsUsage FROM TargetMLC.M_Usage
               RESULT = IncludeSubobjectFromSubobject( TargetMLC, "M_DirectionsUsage", TargetMLC, "M_Usage", zPOS_AFTER );
               //:ELSE
            } 
            else
            { 
               //:TraceLineS( "Programming Error 1", "" )
               TraceLineS( "Programming Error 1", "" );
               //:IssueError( TargetMLC,0,0, "Programming Error 1" )
               IssueError( TargetMLC, 0, 0, "Programming Error 1" );
            } 

            RESULT = SetCursorNextEntity( SourceMLC, "M_DirectionsUsageOrdering", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( SourceMLC, "M_DirectionsForUseStatement", "" );
         //:END
      } 

      //:END

      //:// Driving Usage
      //:FOR EACH SourceMLC.M_ClaimsDrivingUsage
      RESULT = SetCursorFirstEntity( SourceMLC, "M_ClaimsDrivingUsage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST TargetMLC.MP_Usage WITHIN TargetMLC.MasterLabelContent
         //:           WHERE TargetMLC.MP_Usage.ID = SourceMLC.M_ClaimsDrivingUsage.ID
         {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                   GetIntegerFromAttribute( mi_lTempInteger_2, SourceMLC, "M_ClaimsDrivingUsage", "ID" );
         lTempInteger_2 = mi_lTempInteger_2.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( TargetMLC, "MP_Usage", "ID", lTempInteger_2, "MasterLabelContent" );
         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:INCLUDE TargetMLC.M_ClaimsDrivingUsage FROM TargetMLC.M_Usage
            RESULT = IncludeSubobjectFromSubobject( TargetMLC, "M_ClaimsDrivingUsage", TargetMLC, "M_Usage", zPOS_AFTER );
            //:ELSE
         } 
         else
         { 
            //:TraceLineS( "Programming Error 2", "" )
            TraceLineS( "Programming Error 2", "" );
            //:IssueError( TargetMLC,0,0, "Programming Error 2" )
            IssueError( TargetMLC, 0, 0, "Programming Error 2" );
         } 

         RESULT = SetCursorNextEntity( SourceMLC, "M_ClaimsDrivingUsage", "" );
         //:END
      } 

      //:END

      //:// Text Keyword
      //:/*FOR EACH SourceMLC.M_InsertTextKeywordSectionDU
      //:   CREATE ENTITY TargetMLC.M_InsertTextKeywordSectionDU
      //:   SetMatchingAttributesByName( TargetMLC, "M_InsertTextKeywordSectionDU", SourceMLC, "M_InsertTextKeywordSectionDU", zSET_NULL )
      //:   FOR EACH SourceMLC.M_InsertTextSectionDU
      //:      CREATE ENTITY TargetMLC.M_InsertTextSectionDU
      //:      SetMatchingAttributesByName( TargetMLC, "M_InsertTextSectionDU", SourceMLC, "M_InsertTextSectionDU", zSET_NULL )
      //:   END
      //:END*/

      //:// Reviewer Note
      //:FOR EACH SourceMLC.M_DirectionsForUseReviewerNote
      RESULT = SetCursorFirstEntity( SourceMLC, "M_DirectionsForUseReviewerNote", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY TargetMLC.M_DirectionsForUseReviewerNote
         RESULT = CreateEntity( TargetMLC, "M_DirectionsForUseReviewerNote", zPOS_AFTER );
         //:SetMatchingAttributesByName( TargetMLC, "M_DirectionsForUseReviewerNote", SourceMLC, "M_DirectionsForUseReviewerNote", zSET_NULL )
         SetMatchingAttributesByName( TargetMLC, "M_DirectionsForUseReviewerNote", SourceMLC, "M_DirectionsForUseReviewerNote", zSET_NULL );
         RESULT = SetCursorNextEntity( SourceMLC, "M_DirectionsForUseReviewerNote", "" );
      } 

      RESULT = SetCursorNextEntity( SourceMLC, "M_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// Marketing Section
   //:FOR EACH SourceMLC.M_MarketingSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY TargetMLC.M_MarketingSection
      RESULT = CreateEntity( TargetMLC, "M_MarketingSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( TargetMLC, "M_MarketingSection", SourceMLC, "M_MarketingSection", zSET_NULL )
      SetMatchingAttributesByName( TargetMLC, "M_MarketingSection", SourceMLC, "M_MarketingSection", zSET_NULL );
      //:INCLUDE TargetMLC.MP_MarketingSection FROM SourceMLC.M_MarketingSection
      RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_MarketingSection", SourceMLC, "M_MarketingSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_MarketingStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY TargetMLC.M_MarketingStatement
         RESULT = CreateEntity( TargetMLC, "M_MarketingStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( TargetMLC, "M_MarketingStatement", SourceMLC, "M_MarketingStatement", zSET_NULL )
         SetMatchingAttributesByName( TargetMLC, "M_MarketingStatement", SourceMLC, "M_MarketingStatement", zSET_NULL );
         //:INCLUDE TargetMLC.MP_MarketingStatement FROM SourceMLC.M_MarketingStatement
         RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_MarketingStatement", SourceMLC, "M_MarketingStatement", zPOS_AFTER );
         //:// Statement Marketing Usage
         //:FOR EACH SourceMLC.M_MarketingUsageOrdering
         RESULT = SetCursorFirstEntity( SourceMLC, "M_MarketingUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF SourceMLC.M_MarketingUsage EXISTS
            lTempInteger_3 = CheckExistenceOfEntity( SourceMLC, "M_MarketingUsage" );
            if ( lTempInteger_3 == 0 )
            { 
               //:CREATE ENTITY TargetMLC.M_MarketingUsageOrdering
               RESULT = CreateEntity( TargetMLC, "M_MarketingUsageOrdering", zPOS_AFTER );
               //:SetMatchingAttributesByName( TargetMLC, "M_MarketingUsageOrdering", SourceMLC, "M_MarketingUsageOrdering", zSET_NULL )
               SetMatchingAttributesByName( TargetMLC, "M_MarketingUsageOrdering", SourceMLC, "M_MarketingUsageOrdering", zSET_NULL );
               //:SET CURSOR FIRST TargetMLC.MP_Usage WITHIN TargetMLC.MasterLabelContent
               //:           WHERE TargetMLC.MP_Usage.ID = SourceMLC.M_MarketingUsage.ID
               {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
                               GetIntegerFromAttribute( mi_lTempInteger_4, SourceMLC, "M_MarketingUsage", "ID" );
               lTempInteger_4 = mi_lTempInteger_4.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( TargetMLC, "MP_Usage", "ID", lTempInteger_4, "MasterLabelContent" );
               //:IF RESULT >= zCURSOR_SET
               if ( RESULT >= zCURSOR_SET )
               { 
                  //:INCLUDE TargetMLC.M_MarketingUsage FROM TargetMLC.M_Usage
                  RESULT = IncludeSubobjectFromSubobject( TargetMLC, "M_MarketingUsage", TargetMLC, "M_Usage", zPOS_AFTER );
                  //:ELSE
               } 
               else
               { 
                  //:TraceLineS( "Programming Error 3", "" )
                  TraceLineS( "Programming Error 3", "" );
                  //:IssueError( TargetMLC,0,0, "Programming Error 3" )
                  IssueError( TargetMLC, 0, 0, "Programming Error 3" );
               } 

               //:END
            } 

            RESULT = SetCursorNextEntity( SourceMLC, "M_MarketingUsageOrdering", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( SourceMLC, "M_MarketingStatement", "" );
         //:END
      } 

      //:END

      //:// Reviewer Note
      //:FOR EACH SourceMLC.M_MarketingReviewerNote
      RESULT = SetCursorFirstEntity( SourceMLC, "M_MarketingReviewerNote", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY TargetMLC.M_MarketingReviewerNote
         RESULT = CreateEntity( TargetMLC, "M_MarketingReviewerNote", zPOS_AFTER );
         //:SetMatchingAttributesByName( TargetMLC, "M_MarketingReviewerNote", SourceMLC, "M_MarketingReviewerNote", zSET_NULL )
         SetMatchingAttributesByName( TargetMLC, "M_MarketingReviewerNote", SourceMLC, "M_MarketingReviewerNote", zSET_NULL );
         RESULT = SetCursorNextEntity( SourceMLC, "M_MarketingReviewerNote", "" );
      } 

      RESULT = SetCursorNextEntity( SourceMLC, "M_MarketingSection", "" );
      //:END
   } 

   //:END

   //:// HumanHazard Section
   //:FOR EACH SourceMLC.M_HumanHazardSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_HumanHazardSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY TargetMLC.M_HumanHazardSection
      RESULT = CreateEntity( TargetMLC, "M_HumanHazardSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( TargetMLC, "M_HumanHazardSection", SourceMLC, "M_HumanHazardSection", zSET_NULL )
      SetMatchingAttributesByName( TargetMLC, "M_HumanHazardSection", SourceMLC, "M_HumanHazardSection", zSET_NULL );
      //:INCLUDE TargetMLC.MP_HumanHazardSection FROM SourceMLC.M_HumanHazardSection
      RESULT = IncludeSubobjectFromSubobject( TargetMLC, "MP_HumanHazardSection", SourceMLC, "M_HumanHazardSection", zPOS_AFTER );
      RESULT = SetCursorNextEntity( SourceMLC, "M_HumanHazardSection", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:OBJECT CONSTRAINT OPERATION
//:ObjectConstraints( VIEW mMasLC BASED ON LOD mMasLC,
//:                   SHORT Event,
//:                   SHORT State )

//:   STRING ( 100 ) szCompositeLocation
public int 
omMasLC_ObjectConstraints( View     mMasLC,
                           Integer   Event,
                           Integer   State )
{
   String   szCompositeLocation = null;


   //:CASE Event
   switch( Event )
   { 
      //:OF   zOCE_ACTIVATE:
      case zOCE_ACTIVATE :

         //:// Go to build the flat display of all components subobject.
         //://BuildCompEntriesForMLC( mMasLC )

         //:// Build Usage Group Usages.
         //:BuildUsageGroupEntries( mMasLC )
         omMasLC_BuildUsageGroupEntries( mMasLC );
         break ;



      //:  // end zOCE_ACTIVATE */
      //:OF   zOCE_ACTIVATE_EMPTY:
      case zOCE_ACTIVATE_EMPTY :
         break ;

      //:  // end zOCE_ACTIVATE_EMPTY */
      //:OF   zOCE_COMMIT:
      case zOCE_COMMIT :
         break ;

      //:  // end zOCE_COMMIT */
      //:OF   zOCE_DROPOI:
      case zOCE_DROPOI :
         break ;
   } 


   //:     // end zOCE_DROPOI */
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dFullHazardStatement( VIEW mMasLC BASED ON LOD mMasLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   STRING ( 256 ) szString
public int 
omMasLC_dFullHazardStatement( View     mMasLC,
                              String InternalEntityStructure,
                              String InternalAttribStructure,
                              Integer   GetOrSetFlag )
{
   String   szString = null;
   //:STRING ( 256 ) szReplaceString
   String   szReplaceString = null;
   //:STRING ( 256 ) szLocation
   String   szLocation = null;
   //:STRING ( 2 )   szSeparator
   String   szSeparator = null;
   //:STRING ( 1 )   szOpenSeparator
   String   szOpenSeparator = null;
   //:STRING ( 1 )   szCloseSeparator
   String   szCloseSeparator = null;
   //:STRING ( 1 )   szEncloseFirst
   String   szEncloseFirst = null;
   //:SHORT nPosStart
   int      nPosStart = 0;
   //:SHORT nPosEnd
   int      nPosEnd = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   int      lTempInteger_5 = 0;
   int      lTempInteger_6 = 0;
   int      lTempInteger_7 = 0;
   int      lTempInteger_8 = 0;
   int      lTempInteger_9 = 0;
   int      lTempInteger_10 = 0;
   int      lTempInteger_11 = 0;
   int      lTempInteger_12 = 0;
   int      lTempInteger_13 = 0;
   int      lTempInteger_14 = 0;
   int      lTempInteger_15 = 0;
   int      lTempInteger_16 = 0;
   int      lTempInteger_17 = 0;
   int      lTempInteger_18 = 0;
   int      lTempInteger_19 = 0;
   int      lTempInteger_20 = 0;
   int      lTempInteger_21 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:IF mMasLC.M_HumanHazardSection  EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_HumanHazardSection" );
         if ( lTempInteger_0 == 0 )
         { 

            //:szSeparator = mMasLC.M_HumanHazardSection.LocationSeparator
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szSeparator;
            if ( szSeparator == null )
               sb_szSeparator = new StringBuilder( 32 );
            else
               sb_szSeparator = new StringBuilder( szSeparator );
                         GetVariableFromAttribute( sb_szSeparator, mi_lTempInteger_1, 'S', 3, mMasLC, "M_HumanHazardSection", "LocationSeparator", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szSeparator = sb_szSeparator.toString( );}
            //:szOpenSeparator = ""
             {StringBuilder sb_szOpenSeparator;
            if ( szOpenSeparator == null )
               sb_szOpenSeparator = new StringBuilder( 32 );
            else
               sb_szOpenSeparator = new StringBuilder( szOpenSeparator );
                        ZeidonStringCopy( sb_szOpenSeparator, 1, 0, "", 1, 0, 2 );
            szOpenSeparator = sb_szOpenSeparator.toString( );}
            //:szCloseSeparator = ""
             {StringBuilder sb_szCloseSeparator;
            if ( szCloseSeparator == null )
               sb_szCloseSeparator = new StringBuilder( 32 );
            else
               sb_szCloseSeparator = new StringBuilder( szCloseSeparator );
                        ZeidonStringCopy( sb_szCloseSeparator, 1, 0, "", 1, 0, 2 );
            szCloseSeparator = sb_szCloseSeparator.toString( );}
            //:nPosStart  = zstrlen( szSeparator )
            nPosStart = zstrlen( szSeparator );
            //:IF nPosStart > 0
            if ( nPosStart > 0 )
            { 
               //:zstrncpy( szOpenSeparator, szSeparator, 1 )
                {StringBuilder sb_szOpenSeparator;
               if ( szOpenSeparator == null )
                  sb_szOpenSeparator = new StringBuilder( 32 );
               else
                  sb_szOpenSeparator = new StringBuilder( szOpenSeparator );
                              zstrncpy( sb_szOpenSeparator, szSeparator, 1 );
               szOpenSeparator = sb_szOpenSeparator.toString( );}
               //:IF nPosStart > 1
               if ( nPosStart > 1 )
               { 
                  //:zstrncpyoffset( szCloseSeparator, szSeparator, 1, 1 )
                   {StringBuilder sb_szCloseSeparator;
                  if ( szCloseSeparator == null )
                     sb_szCloseSeparator = new StringBuilder( 32 );
                  else
                     sb_szCloseSeparator = new StringBuilder( szCloseSeparator );
                                    zstrncpyoffset( sb_szCloseSeparator, szSeparator, 1, 1 );
                  szCloseSeparator = sb_szCloseSeparator.toString( );}
               } 

               //:END
            } 

            //:END

            //:szEncloseFirst = mMasLC.M_HumanHazardSection.EncloseFirstLocation
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
            StringBuilder sb_szEncloseFirst;
            if ( szEncloseFirst == null )
               sb_szEncloseFirst = new StringBuilder( 32 );
            else
               sb_szEncloseFirst = new StringBuilder( szEncloseFirst );
                         GetVariableFromAttribute( sb_szEncloseFirst, mi_lTempInteger_2, 'S', 2, mMasLC, "M_HumanHazardSection", "EncloseFirstLocation", "", 0 );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );
            szEncloseFirst = sb_szEncloseFirst.toString( );}
            //:szString = mMasLC.M_HumanHazardSection.PrecautionaryStatement
            {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_3, 'S', 257, mMasLC, "M_HumanHazardSection", "PrecautionaryStatement", "", 0 );
            lTempInteger_3 = mi_lTempInteger_3.intValue( );
            szString = sb_szString.toString( );}
            //:nPosStart  = zSearchSubString( szString, "{{Precautionary Panel Location}}", "f", 0 )
            nPosStart = zSearchSubString( szString, "{{Precautionary Panel Location}}", "f", 0 );
            //:IF nPosStart >= 0
            if ( nPosStart >= 0 )
            { 

               //:nPosEnd = nPosStart + 32 // length of "{{Precautionary Panel Location}}"
               nPosEnd = nPosStart + 32;
               //:szReplaceString = ""
                {StringBuilder sb_szReplaceString;
               if ( szReplaceString == null )
                  sb_szReplaceString = new StringBuilder( 32 );
               else
                  sb_szReplaceString = new StringBuilder( szReplaceString );
                              ZeidonStringCopy( sb_szReplaceString, 1, 0, "", 1, 0, 257 );
               szReplaceString = sb_szReplaceString.toString( );}
               //:szLocation = mMasLC.M_HumanHazardSection.PanelLoc1
               {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_4, 'S', 257, mMasLC, "M_HumanHazardSection", "PanelLoc1", "", 0 );
               lTempInteger_4 = mi_lTempInteger_4.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:IF szEncloseFirst = "Y" AND szCloseSeparator != ""
                  if ( ZeidonStringCompare( szEncloseFirst, 1, 0, "Y", 1, 0, 2 ) == 0 && ZeidonStringCompare( szCloseSeparator, 1, 0, "", 1, 0, 2 ) != 0 )
                  { 
                     //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                      {StringBuilder sb_szReplaceString;
                     if ( szReplaceString == null )
                        sb_szReplaceString = new StringBuilder( 32 );
                     else
                        sb_szReplaceString = new StringBuilder( szReplaceString );
                                          ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                     szReplaceString = sb_szReplaceString.toString( );}
                      {StringBuilder sb_szReplaceString;
                     if ( szReplaceString == null )
                        sb_szReplaceString = new StringBuilder( 32 );
                     else
                        sb_szReplaceString = new StringBuilder( szReplaceString );
                                          ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                     szReplaceString = sb_szReplaceString.toString( );}
                      {StringBuilder sb_szReplaceString;
                     if ( szReplaceString == null )
                        sb_szReplaceString = new StringBuilder( 32 );
                     else
                        sb_szReplaceString = new StringBuilder( szReplaceString );
                                          ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                     szReplaceString = sb_szReplaceString.toString( );}
                     //:ELSE
                  } 
                  else
                  { 
                     //:szReplaceString = szReplaceString + szLocation
                      {StringBuilder sb_szReplaceString;
                     if ( szReplaceString == null )
                        sb_szReplaceString = new StringBuilder( 32 );
                     else
                        sb_szReplaceString = new StringBuilder( szReplaceString );
                                          ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                     szReplaceString = sb_szReplaceString.toString( );}
                  } 

                  //:END
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.PanelLoc2
               {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_5, 'S', 257, mMasLC, "M_HumanHazardSection", "PanelLoc2", "", 0 );
               lTempInteger_5 = mi_lTempInteger_5.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.PanelLoc3
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_6, 'S', 257, mMasLC, "M_HumanHazardSection", "PanelLoc3", "", 0 );
               lTempInteger_6 = mi_lTempInteger_6.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.PanelLoc4
               {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_7, 'S', 257, mMasLC, "M_HumanHazardSection", "PanelLoc4", "", 0 );
               lTempInteger_7 = mi_lTempInteger_7.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.PanelLoc5
               {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_8, 'S', 257, mMasLC, "M_HumanHazardSection", "PanelLoc5", "", 0 );
               lTempInteger_8 = mi_lTempInteger_8.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.PanelLoc6
               {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_9, 'S', 257, mMasLC, "M_HumanHazardSection", "PanelLoc6", "", 0 );
               lTempInteger_9 = mi_lTempInteger_9.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.PanelLoc7
               {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_10, 'S', 257, mMasLC, "M_HumanHazardSection", "PanelLoc7", "", 0 );
               lTempInteger_10 = mi_lTempInteger_10.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.PanelLoc8
               {MutableInt mi_lTempInteger_11 = new MutableInt( lTempInteger_11 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_11, 'S', 257, mMasLC, "M_HumanHazardSection", "PanelLoc8", "", 0 );
               lTempInteger_11 = mi_lTempInteger_11.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.PanelLoc9
               {MutableInt mi_lTempInteger_12 = new MutableInt( lTempInteger_12 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_12, 'S', 257, mMasLC, "M_HumanHazardSection", "PanelLoc9", "", 0 );
               lTempInteger_12 = mi_lTempInteger_12.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:zReplaceSubString( szString, nPosStart, nPosEnd, szReplaceString )
               {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                               zReplaceSubString( sb_szString, nPosStart, nPosEnd, szReplaceString );
               szString = sb_szString.toString( );}
            } 

            //:END

            //:nPosStart  = zSearchSubString( szString, "{{Precautionary Label Location}}", "f", 0 )
            nPosStart = zSearchSubString( szString, "{{Precautionary Label Location}}", "f", 0 );
            //:IF nPosStart >= 0
            if ( nPosStart >= 0 )
            { 

               //:nPosEnd = nPosStart + 32 // length of "{{Precautionary Label Location}}"
               nPosEnd = nPosStart + 32;
               //:szReplaceString = ""
                {StringBuilder sb_szReplaceString;
               if ( szReplaceString == null )
                  sb_szReplaceString = new StringBuilder( 32 );
               else
                  sb_szReplaceString = new StringBuilder( szReplaceString );
                              ZeidonStringCopy( sb_szReplaceString, 1, 0, "", 1, 0, 257 );
               szReplaceString = sb_szReplaceString.toString( );}
               //:szLocation = mMasLC.M_HumanHazardSection.LabelLoc1
               {MutableInt mi_lTempInteger_13 = new MutableInt( lTempInteger_13 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_13, 'S', 257, mMasLC, "M_HumanHazardSection", "LabelLoc1", "", 0 );
               lTempInteger_13 = mi_lTempInteger_13.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:IF szCloseSeparator != ""
                  if ( ZeidonStringCompare( szCloseSeparator, 1, 0, "", 1, 0, 2 ) != 0 )
                  { 
                     //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                      {StringBuilder sb_szReplaceString;
                     if ( szReplaceString == null )
                        sb_szReplaceString = new StringBuilder( 32 );
                     else
                        sb_szReplaceString = new StringBuilder( szReplaceString );
                                          ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                     szReplaceString = sb_szReplaceString.toString( );}
                      {StringBuilder sb_szReplaceString;
                     if ( szReplaceString == null )
                        sb_szReplaceString = new StringBuilder( 32 );
                     else
                        sb_szReplaceString = new StringBuilder( szReplaceString );
                                          ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                     szReplaceString = sb_szReplaceString.toString( );}
                      {StringBuilder sb_szReplaceString;
                     if ( szReplaceString == null )
                        sb_szReplaceString = new StringBuilder( 32 );
                     else
                        sb_szReplaceString = new StringBuilder( szReplaceString );
                                          ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                     szReplaceString = sb_szReplaceString.toString( );}
                     //:ELSE
                  } 
                  else
                  { 
                     //:szReplaceString = szReplaceString + szLocation
                      {StringBuilder sb_szReplaceString;
                     if ( szReplaceString == null )
                        sb_szReplaceString = new StringBuilder( 32 );
                     else
                        sb_szReplaceString = new StringBuilder( szReplaceString );
                                          ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                     szReplaceString = sb_szReplaceString.toString( );}
                  } 

                  //:END
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.LabelLoc2
               {MutableInt mi_lTempInteger_14 = new MutableInt( lTempInteger_14 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_14, 'S', 257, mMasLC, "M_HumanHazardSection", "LabelLoc2", "", 0 );
               lTempInteger_14 = mi_lTempInteger_14.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.LabelLoc3
               {MutableInt mi_lTempInteger_15 = new MutableInt( lTempInteger_15 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_15, 'S', 257, mMasLC, "M_HumanHazardSection", "LabelLoc3", "", 0 );
               lTempInteger_15 = mi_lTempInteger_15.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.LabelLoc4
               {MutableInt mi_lTempInteger_16 = new MutableInt( lTempInteger_16 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_16, 'S', 257, mMasLC, "M_HumanHazardSection", "LabelLoc4", "", 0 );
               lTempInteger_16 = mi_lTempInteger_16.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.LabelLoc5
               {MutableInt mi_lTempInteger_17 = new MutableInt( lTempInteger_17 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_17, 'S', 257, mMasLC, "M_HumanHazardSection", "LabelLoc5", "", 0 );
               lTempInteger_17 = mi_lTempInteger_17.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.LabelLoc6
               {MutableInt mi_lTempInteger_18 = new MutableInt( lTempInteger_18 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_18, 'S', 257, mMasLC, "M_HumanHazardSection", "LabelLoc6", "", 0 );
               lTempInteger_18 = mi_lTempInteger_18.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.LabelLoc7
               {MutableInt mi_lTempInteger_19 = new MutableInt( lTempInteger_19 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_19, 'S', 257, mMasLC, "M_HumanHazardSection", "LabelLoc7", "", 0 );
               lTempInteger_19 = mi_lTempInteger_19.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.LabelLoc8
               {MutableInt mi_lTempInteger_20 = new MutableInt( lTempInteger_20 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_20, 'S', 257, mMasLC, "M_HumanHazardSection", "LabelLoc8", "", 0 );
               lTempInteger_20 = mi_lTempInteger_20.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mMasLC.M_HumanHazardSection.LabelLoc9
               {MutableInt mi_lTempInteger_21 = new MutableInt( lTempInteger_21 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_21, 'S', 257, mMasLC, "M_HumanHazardSection", "LabelLoc9", "", 0 );
               lTempInteger_21 = mi_lTempInteger_21.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + szOpenSeparator + szLocation + szCloseSeparator
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szOpenSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szLocation, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, szCloseSeparator, 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:zReplaceSubString( szString, nPosStart, nPosEnd, szReplaceString )
               {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                               zReplaceSubString( sb_szString, nPosStart, nPosEnd, szReplaceString );
               szString = sb_szString.toString( );}
            } 

            //:END

            //:ELSE
         } 
         else
         { 
            //:szString = ""
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringCopy( sb_szString, 1, 0, "", 1, 0, 257 );
            szString = sb_szString.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szString );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:// end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dUsgTextSubUsageNames( VIEW mMasLC BASED ON LOD mMasLC,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:VIEW mMasLC2 BASED ON LOD mMasLC
public int 
omMasLC_dUsgTextSubUsageNames( View     mMasLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   zVIEW    mMasLC2 = new zVIEW( );
   //:STRING ( 2048 ) szDisplayStatement
   String   szDisplayStatement = null;
   //:STRING ( 100 ) szUsageName
   String   szUsageName = null;
   //:STRING ( 100 ) szUsageText
   String   szUsageText = null;
   //:STRING ( 1 ) szUsageType
   String   szUsageType = null;
   //:SHORT bFirst
   int      bFirst = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      RESULT = 0;
   int      lTempInteger_3 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_4 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_5 = 0;
   String   szTempString_2 = null;
   int      lTempInteger_6 = 0;
   String   szTempString_3 = null;
   int      lTempInteger_7 = 0;
   String   szTempString_4 = null;
   int      lTempInteger_8 = 0;
   String   szTempString_5 = null;
   int      lTempInteger_9 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:IF mMasLC.M_Usage EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_Usage" );
         if ( lTempInteger_0 == 0 )
         { 
            //:// Display required text combined with optional usage(s).
            //:szDisplayStatement = mMasLC.M_Usage.Name
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_1, 'S', 2049, mMasLC, "M_Usage", "Name", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
            //:InsertOptionalSubUsages( mMasLC, szDisplayStatement, "M_SubUsage", 1 )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
              {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        m_ZGlobal1_Operation.InsertOptionalSubUsages( mMasLC, sb_szDisplayStatement, "M_SubUsage", 1 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }

            //:IF mMasLC.M_InsertTextKeywordUsage EXISTS
            lTempInteger_2 = CheckExistenceOfEntity( mMasLC, "M_InsertTextKeywordUsage" );
            if ( lTempInteger_2 == 0 )
            { 
               //:CreateViewFromView( mMasLC2, mMasLC )
               CreateViewFromView( mMasLC2, mMasLC );
               //:FOR EACH mMasLC2.M_InsertTextKeywordUsage
               RESULT = SetCursorFirstEntity( mMasLC2, "M_InsertTextKeywordUsage", "" );
               while ( RESULT > zCURSOR_UNCHANGED )
               { 
                  //:szUsageType = mMasLC2.M_InsertTextKeywordUsage.Type // A - all optional; O - Zero or one allowed; R - at least one required; X - exactly one required
                  {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                  StringBuilder sb_szUsageType;
                  if ( szUsageType == null )
                     sb_szUsageType = new StringBuilder( 32 );
                  else
                     sb_szUsageType = new StringBuilder( szUsageType );
                                     GetVariableFromAttribute( sb_szUsageType, mi_lTempInteger_3, 'S', 2, mMasLC2, "M_InsertTextKeywordUsage", "Type", "", 0 );
                  lTempInteger_3 = mi_lTempInteger_3.intValue( );
                  szUsageType = sb_szUsageType.toString( );}
                  //:szUsageName = "{" + mMasLC2.M_InsertTextKeywordUsage.Name + "}"
                  {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
                  StringBuilder sb_szTempString_0;
                  if ( szTempString_0 == null )
                     sb_szTempString_0 = new StringBuilder( 32 );
                  else
                     sb_szTempString_0 = new StringBuilder( szTempString_0 );
                                     GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_4, 'S', 255, mMasLC2, "M_InsertTextKeywordUsage", "Name", "", 0 );
                  lTempInteger_4 = mi_lTempInteger_4.intValue( );
                  szTempString_0 = sb_szTempString_0.toString( );}
                   {StringBuilder sb_szUsageName;
                  if ( szUsageName == null )
                     sb_szUsageName = new StringBuilder( 32 );
                  else
                     sb_szUsageName = new StringBuilder( szUsageName );
                                    ZeidonStringCopy( sb_szUsageName, 1, 0, "{", 1, 0, 101 );
                  szUsageName = sb_szUsageName.toString( );}
                   {StringBuilder sb_szUsageName;
                  if ( szUsageName == null )
                     sb_szUsageName = new StringBuilder( 32 );
                  else
                     sb_szUsageName = new StringBuilder( szUsageName );
                                    ZeidonStringConcat( sb_szUsageName, 1, 0, szTempString_0, 1, 0, 101 );
                  szUsageName = sb_szUsageName.toString( );}
                   {StringBuilder sb_szUsageName;
                  if ( szUsageName == null )
                     sb_szUsageName = new StringBuilder( 32 );
                  else
                     sb_szUsageName = new StringBuilder( szUsageName );
                                    ZeidonStringConcat( sb_szUsageName, 1, 0, "}", 1, 0, 101 );
                  szUsageName = sb_szUsageName.toString( );}
                  //:bFirst = 1
                  bFirst = 1;
                  //:IF szUsageType = "A"
                  if ( ZeidonStringCompare( szUsageType, 1, 0, "A", 1, 0, 2 ) == 0 )
                  { 
                     //:szUsageText = ""
                      {StringBuilder sb_szUsageText;
                     if ( szUsageText == null )
                        sb_szUsageText = new StringBuilder( 32 );
                     else
                        sb_szUsageText = new StringBuilder( szUsageText );
                                          ZeidonStringCopy( sb_szUsageText, 1, 0, "", 1, 0, 101 );
                     szUsageText = sb_szUsageText.toString( );}
                     //:ELSE
                  } 
                  else
                  { 
                     //:szUsageText = "["
                      {StringBuilder sb_szUsageText;
                     if ( szUsageText == null )
                        sb_szUsageText = new StringBuilder( 32 );
                     else
                        sb_szUsageText = new StringBuilder( szUsageText );
                                          ZeidonStringCopy( sb_szUsageText, 1, 0, "[", 1, 0, 101 );
                     szUsageText = sb_szUsageText.toString( );}
                  } 

                  //:END
                  //:FOR EACH mMasLC2.M_InsertTextUsage
                  RESULT = SetCursorFirstEntity( mMasLC2, "M_InsertTextUsage", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:IF bFirst = 1
                     if ( bFirst == 1 )
                     { 
                        //:bFirst = 0
                        bFirst = 0;
                        //:szUsageText = szUsageText + "<b>" + mMasLC2.M_InsertTextUsage.Text + "</b>"
                         {StringBuilder sb_szUsageText;
                        if ( szUsageText == null )
                           sb_szUsageText = new StringBuilder( 32 );
                        else
                           sb_szUsageText = new StringBuilder( szUsageText );
                                                ZeidonStringConcat( sb_szUsageText, 1, 0, "<b>", 1, 0, 101 );
                        szUsageText = sb_szUsageText.toString( );}
                        {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
                        StringBuilder sb_szTempString_1;
                        if ( szTempString_1 == null )
                           sb_szTempString_1 = new StringBuilder( 32 );
                        else
                           sb_szTempString_1 = new StringBuilder( szTempString_1 );
                                                 GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_5, 'S', 4097, mMasLC2, "M_InsertTextUsage", "Text", "", 0 );
                        lTempInteger_5 = mi_lTempInteger_5.intValue( );
                        szTempString_1 = sb_szTempString_1.toString( );}
                         {StringBuilder sb_szUsageText;
                        if ( szUsageText == null )
                           sb_szUsageText = new StringBuilder( 32 );
                        else
                           sb_szUsageText = new StringBuilder( szUsageText );
                                                ZeidonStringConcat( sb_szUsageText, 1, 0, szTempString_1, 1, 0, 101 );
                        szUsageText = sb_szUsageText.toString( );}
                         {StringBuilder sb_szUsageText;
                        if ( szUsageText == null )
                           sb_szUsageText = new StringBuilder( 32 );
                        else
                           sb_szUsageText = new StringBuilder( szUsageText );
                                                ZeidonStringConcat( sb_szUsageText, 1, 0, "</b>", 1, 0, 101 );
                        szUsageText = sb_szUsageText.toString( );}
                        //:ELSE
                     } 
                     else
                     { 
                        //:IF szUsageType = "A"
                        if ( ZeidonStringCompare( szUsageType, 1, 0, "A", 1, 0, 2 ) == 0 )
                        { 
                           //:szUsageText = szUsageText + ", <b>" + mMasLC2.M_InsertTextUsage.Text + "</b>"
                            {StringBuilder sb_szUsageText;
                           if ( szUsageText == null )
                              sb_szUsageText = new StringBuilder( 32 );
                           else
                              sb_szUsageText = new StringBuilder( szUsageText );
                                                      ZeidonStringConcat( sb_szUsageText, 1, 0, ", <b>", 1, 0, 101 );
                           szUsageText = sb_szUsageText.toString( );}
                           {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
                           StringBuilder sb_szTempString_2;
                           if ( szTempString_2 == null )
                              sb_szTempString_2 = new StringBuilder( 32 );
                           else
                              sb_szTempString_2 = new StringBuilder( szTempString_2 );
                                                       GetVariableFromAttribute( sb_szTempString_2, mi_lTempInteger_6, 'S', 4097, mMasLC2, "M_InsertTextUsage", "Text", "", 0 );
                           lTempInteger_6 = mi_lTempInteger_6.intValue( );
                           szTempString_2 = sb_szTempString_2.toString( );}
                            {StringBuilder sb_szUsageText;
                           if ( szUsageText == null )
                              sb_szUsageText = new StringBuilder( 32 );
                           else
                              sb_szUsageText = new StringBuilder( szUsageText );
                                                      ZeidonStringConcat( sb_szUsageText, 1, 0, szTempString_2, 1, 0, 101 );
                           szUsageText = sb_szUsageText.toString( );}
                            {StringBuilder sb_szUsageText;
                           if ( szUsageText == null )
                              sb_szUsageText = new StringBuilder( 32 );
                           else
                              sb_szUsageText = new StringBuilder( szUsageText );
                                                      ZeidonStringConcat( sb_szUsageText, 1, 0, "</b>", 1, 0, 101 );
                           szUsageText = sb_szUsageText.toString( );}
                           //:ELSE
                        } 
                        else
                        { 
                           //:IF szUsageType = "O"
                           if ( ZeidonStringCompare( szUsageType, 1, 0, "O", 1, 0, 2 ) == 0 )
                           { 
                              //:szUsageText = szUsageText + " || <b>" + mMasLC2.M_InsertTextUsage.Text + "</b>"
                               {StringBuilder sb_szUsageText;
                              if ( szUsageText == null )
                                 sb_szUsageText = new StringBuilder( 32 );
                              else
                                 sb_szUsageText = new StringBuilder( szUsageText );
                                                            ZeidonStringConcat( sb_szUsageText, 1, 0, " | <b>", 1, 0, 101 );
                              szUsageText = sb_szUsageText.toString( );}
                              {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
                              StringBuilder sb_szTempString_3;
                              if ( szTempString_3 == null )
                                 sb_szTempString_3 = new StringBuilder( 32 );
                              else
                                 sb_szTempString_3 = new StringBuilder( szTempString_3 );
                                                             GetVariableFromAttribute( sb_szTempString_3, mi_lTempInteger_7, 'S', 4097, mMasLC2, "M_InsertTextUsage", "Text", "", 0 );
                              lTempInteger_7 = mi_lTempInteger_7.intValue( );
                              szTempString_3 = sb_szTempString_3.toString( );}
                               {StringBuilder sb_szUsageText;
                              if ( szUsageText == null )
                                 sb_szUsageText = new StringBuilder( 32 );
                              else
                                 sb_szUsageText = new StringBuilder( szUsageText );
                                                            ZeidonStringConcat( sb_szUsageText, 1, 0, szTempString_3, 1, 0, 101 );
                              szUsageText = sb_szUsageText.toString( );}
                               {StringBuilder sb_szUsageText;
                              if ( szUsageText == null )
                                 sb_szUsageText = new StringBuilder( 32 );
                              else
                                 sb_szUsageText = new StringBuilder( szUsageText );
                                                            ZeidonStringConcat( sb_szUsageText, 1, 0, "</b>", 1, 0, 101 );
                              szUsageText = sb_szUsageText.toString( );}
                              //:ELSE
                           } 
                           else
                           { 
                              //:IF szUsageType = "R"
                              if ( ZeidonStringCompare( szUsageType, 1, 0, "R", 1, 0, 2 ) == 0 )
                              { 
                                 //:szUsageText = szUsageText + " or <b>" + mMasLC2.M_InsertTextUsage.Text + "</b>"
                                  {StringBuilder sb_szUsageText;
                                 if ( szUsageText == null )
                                    sb_szUsageText = new StringBuilder( 32 );
                                 else
                                    sb_szUsageText = new StringBuilder( szUsageText );
                                                                  ZeidonStringConcat( sb_szUsageText, 1, 0, " or <b>", 1, 0, 101 );
                                 szUsageText = sb_szUsageText.toString( );}
                                 {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
                                 StringBuilder sb_szTempString_4;
                                 if ( szTempString_4 == null )
                                    sb_szTempString_4 = new StringBuilder( 32 );
                                 else
                                    sb_szTempString_4 = new StringBuilder( szTempString_4 );
                                                                   GetVariableFromAttribute( sb_szTempString_4, mi_lTempInteger_8, 'S', 4097, mMasLC2, "M_InsertTextUsage", "Text", "", 0 );
                                 lTempInteger_8 = mi_lTempInteger_8.intValue( );
                                 szTempString_4 = sb_szTempString_4.toString( );}
                                  {StringBuilder sb_szUsageText;
                                 if ( szUsageText == null )
                                    sb_szUsageText = new StringBuilder( 32 );
                                 else
                                    sb_szUsageText = new StringBuilder( szUsageText );
                                                                  ZeidonStringConcat( sb_szUsageText, 1, 0, szTempString_4, 1, 0, 101 );
                                 szUsageText = sb_szUsageText.toString( );}
                                  {StringBuilder sb_szUsageText;
                                 if ( szUsageText == null )
                                    sb_szUsageText = new StringBuilder( 32 );
                                 else
                                    sb_szUsageText = new StringBuilder( szUsageText );
                                                                  ZeidonStringConcat( sb_szUsageText, 1, 0, "</b>", 1, 0, 101 );
                                 szUsageText = sb_szUsageText.toString( );}
                                 //:ELSE
                              } 
                              else
                              { 
                                 //:// IF szUsageType = "X"
                                 //:szUsageText = szUsageText + " / <b>" + mMasLC2.M_InsertTextUsage.Text + "</b>"
                                  {StringBuilder sb_szUsageText;
                                 if ( szUsageText == null )
                                    sb_szUsageText = new StringBuilder( 32 );
                                 else
                                    sb_szUsageText = new StringBuilder( szUsageText );
                                                                  ZeidonStringConcat( sb_szUsageText, 1, 0, " / <b>", 1, 0, 101 );
                                 szUsageText = sb_szUsageText.toString( );}
                                 {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
                                 StringBuilder sb_szTempString_5;
                                 if ( szTempString_5 == null )
                                    sb_szTempString_5 = new StringBuilder( 32 );
                                 else
                                    sb_szTempString_5 = new StringBuilder( szTempString_5 );
                                                                   GetVariableFromAttribute( sb_szTempString_5, mi_lTempInteger_9, 'S', 4097, mMasLC2, "M_InsertTextUsage", "Text", "", 0 );
                                 lTempInteger_9 = mi_lTempInteger_9.intValue( );
                                 szTempString_5 = sb_szTempString_5.toString( );}
                                  {StringBuilder sb_szUsageText;
                                 if ( szUsageText == null )
                                    sb_szUsageText = new StringBuilder( 32 );
                                 else
                                    sb_szUsageText = new StringBuilder( szUsageText );
                                                                  ZeidonStringConcat( sb_szUsageText, 1, 0, szTempString_5, 1, 0, 101 );
                                 szUsageText = sb_szUsageText.toString( );}
                                  {StringBuilder sb_szUsageText;
                                 if ( szUsageText == null )
                                    sb_szUsageText = new StringBuilder( 32 );
                                 else
                                    sb_szUsageText = new StringBuilder( szUsageText );
                                                                  ZeidonStringConcat( sb_szUsageText, 1, 0, "</b>", 1, 0, 101 );
                                 szUsageText = sb_szUsageText.toString( );}
                              } 

                              //:// END
                              //:END
                           } 

                           //:END
                        } 

                        //:END
                     } 

                     RESULT = SetCursorNextEntity( mMasLC2, "M_InsertTextUsage", "" );
                     //:END
                  } 

                  //:END
                  //:IF szUsageType != "A"
                  if ( ZeidonStringCompare( szUsageType, 1, 0, "A", 1, 0, 2 ) != 0 )
                  { 
                     //:szUsageText = szUsageText + "]"
                      {StringBuilder sb_szUsageText;
                     if ( szUsageText == null )
                        sb_szUsageText = new StringBuilder( 32 );
                     else
                        sb_szUsageText = new StringBuilder( szUsageText );
                                          ZeidonStringConcat( sb_szUsageText, 1, 0, "]", 1, 0, 101 );
                     szUsageText = sb_szUsageText.toString( );}
                  } 

                  //:END
                  //:zSearchAndReplace( szDisplayStatement, 2048, szUsageName, szUsageText )
                  {StringBuilder sb_szDisplayStatement;
                  if ( szDisplayStatement == null )
                     sb_szDisplayStatement = new StringBuilder( 32 );
                  else
                     sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                                     zSearchAndReplace( sb_szDisplayStatement, 2048, szUsageName, szUsageText );
                  szDisplayStatement = sb_szDisplayStatement.toString( );}
                  RESULT = SetCursorNextEntity( mMasLC2, "M_InsertTextKeywordUsage", "" );
               } 

               //:END
               //:DropView( mMasLC2 )
               DropView( mMasLC2 );
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szDisplayStatement = ""
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, "", 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dDU_StatementTitleText( VIEW mMasLC BASED ON LOD mMasLC,
//:                        STRING ( 32 ) InternalEntityStructure,
//:                        STRING ( 32 ) InternalAttribStructure,
//:                        SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dDU_StatementTitleText( View     mMasLC,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   //:STRING ( 2048 ) szStatementText
   String   szStatementText = null;
   //:STRING ( 256 )  szTitle
   String   szTitle = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Directions For Use Display Statement Text is a combination of Title and Text.
         //:szStatementText = mMasLC.M_DirectionsForUseStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_DirectionsForUseStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:szTitle = mMasLC.M_DirectionsForUseStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szTitle;
         if ( szTitle == null )
            sb_szTitle = new StringBuilder( 32 );
         else
            sb_szTitle = new StringBuilder( szTitle );
                   GetVariableFromAttribute( sb_szTitle, mi_lTempInteger_1, 'S', 257, mMasLC, "M_DirectionsForUseStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szTitle = sb_szTitle.toString( );}
         //:IF szTitle != ""
         if ( ZeidonStringCompare( szTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:szDisplayStatement = "<b>" + szTitle + "</b>"
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, "<b>", 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringConcat( sb_szDisplayStatement, 1, 0, szTitle, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringConcat( sb_szDisplayStatement, 1, 0, "</b>", 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
            //:IF szStatementText != ""
            if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
            { 
               //:szDisplayStatement = szDisplayStatement + " --- " + szStatementText
                {StringBuilder sb_szDisplayStatement;
               if ( szDisplayStatement == null )
                  sb_szDisplayStatement = new StringBuilder( 32 );
               else
                  sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                              ZeidonStringConcat( sb_szDisplayStatement, 1, 0, " --- ", 1, 0, 2049 );
               szDisplayStatement = sb_szDisplayStatement.toString( );}
                {StringBuilder sb_szDisplayStatement;
               if ( szDisplayStatement == null )
                  sb_szDisplayStatement = new StringBuilder( 32 );
               else
                  sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                              ZeidonStringConcat( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
               szDisplayStatement = sb_szDisplayStatement.toString( );}
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szDisplayStatement = szStatementText
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dDU_StmtTitleKeyword( VIEW mMasLC BASED ON LOD mMasLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dDU_StmtTitleKeyword( View     mMasLC,
                              String InternalEntityStructure,
                              String InternalAttribStructure,
                              Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Directions For Use Display Section Title embeds keywords into the Title.
         //:szDisplayStatement = mMasLC.M_DirectionsForUseStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_DirectionsForUseStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}

         //:IF szDisplayStatement != ""
         if ( ZeidonStringCompare( szDisplayStatement, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szDisplayStatement,
            //:                            "M_InsertTextKeywordDU", "M_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szDisplayStatement, "M_InsertTextKeywordDU", "M_InsertTextDU", ", " );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dDU_StmtTextKeyword( VIEW mMasLC BASED ON LOD mMasLC,
   //:                  STRING ( 32 ) InternalEntityStructure,
   //:                  STRING ( 32 ) InternalAttribStructure,
   //:                  SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dDU_StmtTextKeyword( View     mMasLC,
                             String InternalEntityStructure,
                             String InternalAttribStructure,
                             Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   //:STRING ( 2048 ) szStatementText
   String   szStatementText = null;
   //:STRING ( 256 )  szTitle
   String   szTitle = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Directions For Use Display Section Text embeds keywords into the Text.
         //:szDisplayStatement = mMasLC.M_DirectionsForUseStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_DirectionsForUseStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}

         //:IF szDisplayStatement != ""
         if ( ZeidonStringCompare( szDisplayStatement, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szDisplayStatement,
            //:                            "M_InsertTextKeywordDU", "M_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szDisplayStatement, "M_InsertTextKeywordDU", "M_InsertTextDU", ", " );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dDU_SubStmtTitleText( VIEW mMasLC BASED ON LOD mMasLC,
   //:                   STRING ( 32 ) InternalEntityStructure,
   //:                   STRING ( 32 ) InternalAttribStructure,
   //:                   SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dDU_SubStmtTitleText( View     mMasLC,
                              String InternalEntityStructure,
                              String InternalAttribStructure,
                              Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   //:STRING ( 2048 ) szStatementText
   String   szStatementText = null;
   //:STRING ( 256 )  szTitle
   String   szTitle = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Directions For Use Display Statement Text is a combination of Title and Text.
         //:szTitle = mMasLC.M_DirectionsForUseSubStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szTitle;
         if ( szTitle == null )
            sb_szTitle = new StringBuilder( 32 );
         else
            sb_szTitle = new StringBuilder( szTitle );
                   GetVariableFromAttribute( sb_szTitle, mi_lTempInteger_0, 'S', 257, mMasLC, "M_DirectionsForUseSubStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szTitle = sb_szTitle.toString( );}
         //:szStatementText = mMasLC.M_DirectionsForUseSubStatement.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_1, 'S', 2049, mMasLC, "M_DirectionsForUseSubStatement", "Text", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szTitle != ""
         if ( ZeidonStringCompare( szTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:szDisplayStatement = szTitle + " --- " + szStatementText
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szTitle, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringConcat( sb_szDisplayStatement, 1, 0, " --- ", 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringConcat( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
            //:ELSE
         } 
         else
         { 
            //:szDisplayStatement = szStatementText
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dDU_DrivingUsgTxtNames( VIEW mMasLC BASED ON LOD mMasLC,
   //:                     STRING ( 32 ) InternalEntityStructure,
   //:                     STRING ( 32 ) InternalAttribStructure,
   //:                     SHORT GetOrSetFlag )

   //:VIEW mMasLC1 BASED ON LOD mMasLC
public int 
omMasLC_dDU_DrivingUsgTxtNames( View     mMasLC,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   zVIEW    mMasLC1 = new zVIEW( );
   //:VIEW mMasLC2 BASED ON LOD mMasLC
   zVIEW    mMasLC2 = new zVIEW( );
   //:STRING ( 2048 ) szDisplayStatement
   String   szDisplayStatement = null;
   //:STRING ( 100 )  szUsageName
   String   szUsageName = null;
   //:STRING ( 100 )  szUsageText
   String   szUsageText = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      RESULT = 0;
   String   szTempString_0 = null;
   int      lTempInteger_3 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_4 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:IF mMasLC.M_ClaimsDrivingUsage EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_ClaimsDrivingUsage" );
         if ( lTempInteger_0 == 0 )
         { 
            //:// Display required text combined with optional usage(s).
            //:CreateViewFromView( mMasLC1, mMasLC )
            CreateViewFromView( mMasLC1, mMasLC );
            //:SetCursorFirstEntityByAttr( mMasLC1, "M_UsageType", "UsageType",
            //:                         mMasLC, "M_ClaimsDrivingUsage", "UsageType", "" )
            SetCursorFirstEntityByAttr( mMasLC1, "M_UsageType", "UsageType", mMasLC, "M_ClaimsDrivingUsage", "UsageType", "" );
            //:SetCursorFirstEntityByAttr( mMasLC1, "M_Usage", "ID",
            //:                         mMasLC, "M_ClaimsDrivingUsage", "ID", "" )
            SetCursorFirstEntityByAttr( mMasLC1, "M_Usage", "ID", mMasLC, "M_ClaimsDrivingUsage", "ID", "" );
            //:// SetCursorFirstEntityByEntityCsr( mMasLC1, "M_Usage", mMasLC, "M_ClaimsDrivingUsage", "" )

            //:szDisplayStatement = mMasLC1.M_Usage.Name
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_1, 'S', 2049, mMasLC1, "M_Usage", "Name", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
            //:InsertOptionalSubUsages( mMasLC1, szDisplayStatement, "M_SubUsage", 1 )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC1 );
              {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        m_ZGlobal1_Operation.InsertOptionalSubUsages( mMasLC1, sb_szDisplayStatement, "M_SubUsage", 1 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
            //:// SetFirstCharacterCase( szDisplayStatement, 1 )

            //:IF mMasLC1.M_InsertTextKeywordUsage EXISTS
            lTempInteger_2 = CheckExistenceOfEntity( mMasLC1, "M_InsertTextKeywordUsage" );
            if ( lTempInteger_2 == 0 )
            { 
               //:CreateViewFromView( mMasLC2, mMasLC1 )
               CreateViewFromView( mMasLC2, mMasLC1 );
               //:FOR EACH mMasLC2.M_InsertTextKeywordUsage
               RESULT = SetCursorFirstEntity( mMasLC2, "M_InsertTextKeywordUsage", "" );
               while ( RESULT > zCURSOR_UNCHANGED )
               { 
                  //:szUsageName = "{" + mMasLC2.M_InsertTextKeywordUsage.Name + "}"
                  {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                  StringBuilder sb_szTempString_0;
                  if ( szTempString_0 == null )
                     sb_szTempString_0 = new StringBuilder( 32 );
                  else
                     sb_szTempString_0 = new StringBuilder( szTempString_0 );
                                     GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_3, 'S', 255, mMasLC2, "M_InsertTextKeywordUsage", "Name", "", 0 );
                  lTempInteger_3 = mi_lTempInteger_3.intValue( );
                  szTempString_0 = sb_szTempString_0.toString( );}
                   {StringBuilder sb_szUsageName;
                  if ( szUsageName == null )
                     sb_szUsageName = new StringBuilder( 32 );
                  else
                     sb_szUsageName = new StringBuilder( szUsageName );
                                    ZeidonStringCopy( sb_szUsageName, 1, 0, "{", 1, 0, 101 );
                  szUsageName = sb_szUsageName.toString( );}
                   {StringBuilder sb_szUsageName;
                  if ( szUsageName == null )
                     sb_szUsageName = new StringBuilder( 32 );
                  else
                     sb_szUsageName = new StringBuilder( szUsageName );
                                    ZeidonStringConcat( sb_szUsageName, 1, 0, szTempString_0, 1, 0, 101 );
                  szUsageName = sb_szUsageName.toString( );}
                   {StringBuilder sb_szUsageName;
                  if ( szUsageName == null )
                     sb_szUsageName = new StringBuilder( 32 );
                  else
                     sb_szUsageName = new StringBuilder( szUsageName );
                                    ZeidonStringConcat( sb_szUsageName, 1, 0, "}", 1, 0, 101 );
                  szUsageName = sb_szUsageName.toString( );}
                  //:szUsageText = "<b>" + mMasLC2.M_InsertTextUsage.Text + "</b>"
                  {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
                  StringBuilder sb_szTempString_1;
                  if ( szTempString_1 == null )
                     sb_szTempString_1 = new StringBuilder( 32 );
                  else
                     sb_szTempString_1 = new StringBuilder( szTempString_1 );
                                     GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_4, 'S', 4097, mMasLC2, "M_InsertTextUsage", "Text", "", 0 );
                  lTempInteger_4 = mi_lTempInteger_4.intValue( );
                  szTempString_1 = sb_szTempString_1.toString( );}
                   {StringBuilder sb_szUsageText;
                  if ( szUsageText == null )
                     sb_szUsageText = new StringBuilder( 32 );
                  else
                     sb_szUsageText = new StringBuilder( szUsageText );
                                    ZeidonStringCopy( sb_szUsageText, 1, 0, "<b>", 1, 0, 101 );
                  szUsageText = sb_szUsageText.toString( );}
                   {StringBuilder sb_szUsageText;
                  if ( szUsageText == null )
                     sb_szUsageText = new StringBuilder( 32 );
                  else
                     sb_szUsageText = new StringBuilder( szUsageText );
                                    ZeidonStringConcat( sb_szUsageText, 1, 0, szTempString_1, 1, 0, 101 );
                  szUsageText = sb_szUsageText.toString( );}
                   {StringBuilder sb_szUsageText;
                  if ( szUsageText == null )
                     sb_szUsageText = new StringBuilder( 32 );
                  else
                     sb_szUsageText = new StringBuilder( szUsageText );
                                    ZeidonStringConcat( sb_szUsageText, 1, 0, "</b>", 1, 0, 101 );
                  szUsageText = sb_szUsageText.toString( );}
                  //:zSearchAndReplace( szDisplayStatement, 2048, szUsageName, szUsageText )
                  {StringBuilder sb_szDisplayStatement;
                  if ( szDisplayStatement == null )
                     sb_szDisplayStatement = new StringBuilder( 32 );
                  else
                     sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                                     zSearchAndReplace( sb_szDisplayStatement, 2048, szUsageName, szUsageText );
                  szDisplayStatement = sb_szDisplayStatement.toString( );}
                  RESULT = SetCursorNextEntity( mMasLC2, "M_InsertTextKeywordUsage", "" );
               } 

               //:END
               //:DropView( mMasLC2 )
               DropView( mMasLC2 );
            } 

            //:END

            //:DropView( mMasLC1 )
            DropView( mMasLC1 );
            //:ELSE
         } 
         else
         { 
            //:szDisplayStatement = ""
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, "", 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dDU_DrvUsgClaimClass( VIEW mMasLC BASED ON LOD mMasLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   STRING ( 32 )  szEntityName
public int 
omMasLC_dDU_DrvUsgClaimClass( View     mMasLC,
                              String InternalEntityStructure,
                              String InternalAttribStructure,
                              Integer   GetOrSetFlag )
{
   String   szEntityName = null;
   //:STRING ( 64  ) szUsageType
   String   szUsageType = null;
   //:STRING ( 32 )  szClassification
   String   szClassification = null;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Combine the UsageType and the ClaimsClassification.
         //:GetEntityNameFromStructure( InternalEntityStructure, szEntityName )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttributeByContext( szUsageType, mMasLC, szEntityName, "UsageType", "FullUsageType", 32 )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttributeByContext( sb_szUsageType, mMasLC, szEntityName, "UsageType", "FullUsageType", 32 );
         szUsageType = sb_szUsageType.toString( );}
         //:GetStringFromAttribute( szClassification, mMasLC, szEntityName, "ClaimsClassification" )
         {StringBuilder sb_szClassification;
         if ( szClassification == null )
            sb_szClassification = new StringBuilder( 32 );
         else
            sb_szClassification = new StringBuilder( szClassification );
                   GetStringFromAttribute( sb_szClassification, mMasLC, szEntityName, "ClaimsClassification" );
         szClassification = sb_szClassification.toString( );}
         //:IF szClassification != ""
         if ( ZeidonStringCompare( szClassification, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szUsageType = szUsageType + "/" + szClassification
             {StringBuilder sb_szUsageType;
            if ( szUsageType == null )
               sb_szUsageType = new StringBuilder( 32 );
            else
               sb_szUsageType = new StringBuilder( szUsageType );
                        ZeidonStringConcat( sb_szUsageType, 1, 0, "/", 1, 0, 65 );
            szUsageType = sb_szUsageType.toString( );}
             {StringBuilder sb_szUsageType;
            if ( szUsageType == null )
               sb_szUsageType = new StringBuilder( 32 );
            else
               sb_szUsageType = new StringBuilder( szUsageType );
                        ZeidonStringConcat( sb_szUsageType, 1, 0, szClassification, 1, 0, 65 );
            szUsageType = sb_szUsageType.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szUsageType )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szUsageType );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dSD_TitleText( VIEW mMasLC BASED ON LOD mMasLC,
//:               STRING ( 32 ) InternalEntityStructure,
//:               STRING ( 32 ) InternalAttribStructure,
//:               SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dSD_TitleText( View     mMasLC,
                       String InternalEntityStructure,
                       String InternalAttribStructure,
                       Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   //:STRING ( 2048 ) szStatementText
   String   szStatementText = null;
   //:STRING ( 256 )  szTitle
   String   szTitle = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Storage and Disposal Display Statement Text is a combination of Title and Text.
         //:szTitle = mMasLC.M_StorageDisposalStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szTitle;
         if ( szTitle == null )
            sb_szTitle = new StringBuilder( 32 );
         else
            sb_szTitle = new StringBuilder( szTitle );
                   GetVariableFromAttribute( sb_szTitle, mi_lTempInteger_0, 'S', 257, mMasLC, "M_StorageDisposalStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szTitle = sb_szTitle.toString( );}
         //:szStatementText = mMasLC.M_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_1, 'S', 2049, mMasLC, "M_StorageDisposalStatement", "Text", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szTitle != ""
         if ( ZeidonStringCompare( szTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:szDisplayStatement = szTitle + " --- " + szStatementText
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szTitle, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringConcat( sb_szDisplayStatement, 1, 0, " --- ", 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringConcat( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
            //:ELSE
         } 
         else
         { 
            //:szDisplayStatement = szStatementText
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END


         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dSD_SubTitleText( VIEW mMasLC BASED ON LOD mMasLC,
   //:               STRING ( 32 ) InternalEntityStructure,
   //:               STRING ( 32 ) InternalAttribStructure,
   //:               SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dSD_SubTitleText( View     mMasLC,
                          String InternalEntityStructure,
                          String InternalAttribStructure,
                          Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   //:STRING ( 2048 ) szStatementText
   String   szStatementText = null;
   //:STRING ( 256 )  szTitle
   String   szTitle = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Storage and Disposal Display Statement Text is a combination of Title and Text.
         //:szTitle = mMasLC.M_StorageDisposalSubStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szTitle;
         if ( szTitle == null )
            sb_szTitle = new StringBuilder( 32 );
         else
            sb_szTitle = new StringBuilder( szTitle );
                   GetVariableFromAttribute( sb_szTitle, mi_lTempInteger_0, 'S', 257, mMasLC, "M_StorageDisposalSubStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szTitle = sb_szTitle.toString( );}
         //:szStatementText = mMasLC.M_StorageDisposalSubStatement.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_1, 'S', 2049, mMasLC, "M_StorageDisposalSubStatement", "Text", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szTitle != ""
         if ( ZeidonStringCompare( szTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:szDisplayStatement = szTitle + " --- " + szStatementText
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szTitle, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringConcat( sb_szDisplayStatement, 1, 0, " --- ", 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringConcat( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
            //:ELSE
         } 
         else
         { 
            //:szDisplayStatement = szStatementText
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END


         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dSD_StmtTitleKey( VIEW mMasLC BASED ON LOD mMasLC,
   //:               STRING ( 32 ) InternalEntityStructure,
   //:               STRING ( 32 ) InternalAttribStructure,
   //:               SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szStatementTitle
public int 
omMasLC_dSD_StmtTitleKey( View     mMasLC,
                          String InternalEntityStructure,
                          String InternalAttribStructure,
                          Integer   GetOrSetFlag )
{
   String   szStatementTitle = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Storage and Disposal Display Statement Title is a combination of Title/Keywords.
         //:szStatementTitle = mMasLC.M_StorageDisposalStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_StorageDisposalStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szStatementTitle,
            //:                            "M_InsertTextKeywordSD", "M_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szStatementTitle, "M_InsertTextKeywordSD", "M_InsertTextSD", ", " );
            szStatementTitle = sb_szStatementTitle.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szStatementTitle )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szStatementTitle );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dSD_StmtTextKey( VIEW mMasLC BASED ON LOD mMasLC,
//:                 STRING ( 32 ) InternalEntityStructure,
//:                 STRING ( 32 ) InternalAttribStructure,
//:                 SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szStatementText
public int 
omMasLC_dSD_StmtTextKey( View     mMasLC,
                         String InternalEntityStructure,
                         String InternalAttribStructure,
                         Integer   GetOrSetFlag )
{
   String   szStatementText = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Storage and Disposal Display Statement Text is a combination of Text/Keywords.
         //:szStatementText = mMasLC.M_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_StorageDisposalStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szStatementText,
            //:                            "M_InsertTextKeywordSD", "M_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szStatementText, "M_InsertTextKeywordSD", "M_InsertTextSD", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szStatementText )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szStatementText );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dSD_StmtTitleTxtKey( VIEW mMasLC BASED ON LOD mMasLC,
//:                     STRING ( 32 ) InternalEntityStructure,
//:                     STRING ( 32 ) InternalAttribStructure,
//:                     SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dSD_StmtTitleTxtKey( View     mMasLC,
                             String InternalEntityStructure,
                             String InternalAttribStructure,
                             Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   //:STRING ( 256 )  szStatementTitle
   String   szStatementTitle = null;
   //:STRING ( 2048 ) szStatementText
   String   szStatementText = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Storage and Disposal Display Statement Text is a combination of Title/Text/Keywords.
         //:szStatementText = mMasLC.M_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_StorageDisposalStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szStatementText,
            //:                            "M_InsertTextKeywordSD", "M_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szStatementText, "M_InsertTextKeywordSD", "M_InsertTextSD", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:szStatementTitle = mMasLC.M_StorageDisposalStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_1, 'S', 257, mMasLC, "M_StorageDisposalStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szStatementTitle,
            //:                            "M_InsertTextKeywordSD", "M_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szStatementTitle, "M_InsertTextKeywordSD", "M_InsertTextSD", ", " );
            szStatementTitle = sb_szStatementTitle.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
            //:szDisplayStatement = szStatementTitle
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szStatementTitle, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
            //:IF szStatementText != ""
            if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
            { 
               //:szDisplayStatement = szDisplayStatement + " --- " + szStatementText
                {StringBuilder sb_szDisplayStatement;
               if ( szDisplayStatement == null )
                  sb_szDisplayStatement = new StringBuilder( 32 );
               else
                  sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                              ZeidonStringConcat( sb_szDisplayStatement, 1, 0, " --- ", 1, 0, 2049 );
               szDisplayStatement = sb_szDisplayStatement.toString( );}
                {StringBuilder sb_szDisplayStatement;
               if ( szDisplayStatement == null )
                  sb_szDisplayStatement = new StringBuilder( 32 );
               else
                  sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                              ZeidonStringConcat( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
               szDisplayStatement = sb_szDisplayStatement.toString( );}
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szDisplayStatement = szStatementText
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dSD_SubStmtTitleTxtKey( VIEW mMasLC BASED ON LOD mMasLC,
//:                        STRING ( 32 ) InternalEntityStructure,
//:                        STRING ( 32 ) InternalAttribStructure,
//:                        SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dSD_SubStmtTitleTxtKey( View     mMasLC,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   //:STRING ( 256 )  szStatementTitle
   String   szStatementTitle = null;
   //:STRING ( 2048 ) szStatementText
   String   szStatementText = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Storage and Disposal Display Statement Text is a combination of Title/Text/Keywords.
         //:SetViewToSubobject( mMasLC, "M_StorageDisposalSubStatement" )
         SetViewToSubobject( mMasLC, "M_StorageDisposalSubStatement" );
         //:szStatementText = mMasLC.M_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_StorageDisposalStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szStatementText,
            //:                            "M_InsertTextKeywordSD", "M_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szStatementText, "M_InsertTextKeywordSD", "M_InsertTextSD", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:szStatementTitle = mMasLC.M_StorageDisposalStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_1, 'S', 257, mMasLC, "M_StorageDisposalStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szStatementTitle,
            //:                            "M_InsertTextKeywordSD", "M_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szStatementTitle, "M_InsertTextKeywordSD", "M_InsertTextSD", ", " );
            szStatementTitle = sb_szStatementTitle.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:szDisplayStatement = szStatementTitle
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szStatementTitle, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
            //:IF szStatementText != ""
            if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
            { 
               //:szDisplayStatement = szDisplayStatement + " --- " + szStatementText
                {StringBuilder sb_szDisplayStatement;
               if ( szDisplayStatement == null )
                  sb_szDisplayStatement = new StringBuilder( 32 );
               else
                  sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                              ZeidonStringConcat( sb_szDisplayStatement, 1, 0, " --- ", 1, 0, 2049 );
               szDisplayStatement = sb_szDisplayStatement.toString( );}
                {StringBuilder sb_szDisplayStatement;
               if ( szDisplayStatement == null )
                  sb_szDisplayStatement = new StringBuilder( 32 );
               else
                  sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                              ZeidonStringConcat( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
               szDisplayStatement = sb_szDisplayStatement.toString( );}
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szDisplayStatement = szStatementText
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END

         //:ResetViewFromSubobject( mMasLC )
         ResetViewFromSubobject( mMasLC );

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dEPA_RegistrationNbr( VIEW mMasLC BASED ON LOD mMasLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   STRING ( 1024 ) szString
public int 
omMasLC_dEPA_RegistrationNbr( View     mMasLC,
                              String InternalEntityStructure,
                              String InternalAttribStructure,
                              Integer   GetOrSetFlag )
{
   String   szString = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_2 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:IF mMasLC.PrimaryRegistrant EXISTS AND mMasLC.MasterProduct EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "PrimaryRegistrant" );
         lTempInteger_1 = CheckExistenceOfEntity( mMasLC, "MasterProduct" );
         if ( lTempInteger_0 == 0 && lTempInteger_1 == 0 )
         { 
            //:szString = mMasLC.PrimaryRegistrant.EPA_CompanyNumber + "-" + mMasLC.MasterProduct.Number
            {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetStringFromAttribute( sb_szString, mMasLC, "PrimaryRegistrant", "EPA_CompanyNumber" );
            szString = sb_szString.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, "-", 1, 0, 1025 );
            szString = sb_szString.toString( );}
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
            StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_2, 'S', 6, mMasLC, "MasterProduct", "Number", "", 0 );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );
            szTempString_0 = sb_szTempString_0.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, szTempString_0, 1, 0, 1025 );
            szString = sb_szString.toString( );}
            //:ELSE
         } 
         else
         { 
            //:szString = "EPA Registration Number unknown"
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringCopy( sb_szString, 1, 0, "EPA Registration Number unknown", 1, 0, 1025 );
            szString = sb_szString.toString( );}
         } 

         //:END


         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szString );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET */
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dCombinedContainerVol( VIEW mMasLC BASED ON LOD mMasLC,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 256 ) szCombinedName
public int 
omMasLC_dCombinedContainerVol( View     mMasLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   String   szCombinedName = null;
   //:STRING ( 20 )  szContainerVolume
   String   szContainerVolume = null;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Combine each volume name that drives this section.
         //:szCombinedName = "???"
          {StringBuilder sb_szCombinedName;
         if ( szCombinedName == null )
            sb_szCombinedName = new StringBuilder( 32 );
         else
            sb_szCombinedName = new StringBuilder( szCombinedName );
                  ZeidonStringCopy( sb_szCombinedName, 1, 0, "???", 1, 0, 257 );
         szCombinedName = sb_szCombinedName.toString( );}
         //:/*    FOR EACH mMasLC.M_StorageDisposalDrivingConVol
         //:???         GetStringFromAttributeByContext( szContainerVolume, mMasLC, "M_StorageDisposalDrivingConVol", "ContainerVolume", "", 20 )
         //:IF szCombinedName = ""
         //:   szCombinedName = szContainerVolume
         //:ELSE
         //:   szCombinedName = szCombinedName + ", " + szContainerVolume
         //:END
         //:END
         //:*/

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szCombinedName );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:TRANSFORMATION OPERATION
   //:BuildCompEntriesForMLC( VIEW mMasLC BASED ON LOD mMasLC )

   //:STRING ( 2052 ) szDisplayValue
public int 
omMasLC_BuildCompEntriesForMLC( View     mMasLC )
{
   String   szDisplayValue = null;
   //:STRING ( 2048 ) szOriginalDisplayValue
   String   szOriginalDisplayValue = null;
   //:STRING ( 256 )  szName
   String   szName = null;
   //:INTEGER         MaxDisplayLength
   int      MaxDisplayLength = 0;
   //:INTEGER         OriginalStringLength
   int      OriginalStringLength = 0;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;
   String   szTempString_1 = null;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;


   //:// Build the flat display of all components subobject.
   //:MaxDisplayLength = 2048
   MaxDisplayLength = 2048;

   //:// First clear any current entries.
   //:FOR EACH mMasLC.CompositeComponentList
   RESULT = SetCursorFirstEntity( mMasLC, "CompositeComponentList", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mMasLC.CompositeComponentList NONE
      RESULT = DeleteEntity( mMasLC, "CompositeComponentList", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mMasLC, "CompositeComponentList", "" );
   } 

   //:END

   //:// Build Marketing Section and Statement components.
   //:FOR EACH mMasLC.M_MarketingSection
   RESULT = SetCursorFirstEntity( mMasLC, "M_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.CompositeComponentList
      RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
      //:mMasLC.CompositeComponentList.Type               = "M_MarketingSection"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_MarketingSection" );
      //:mMasLC.CompositeComponentList.SelectLevel        = 1
      SetAttributeFromInteger( mMasLC, "CompositeComponentList", "SelectLevel", 1 );
      //:mMasLC.CompositeComponentList.DisplayType        = "Marketing"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Marketing" );
      //:mMasLC.CompositeComponentList.DisplayTypeIndent  = "Marketing Section"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "Marketing Section" );
      //:mMasLC.CompositeComponentList.OriginalTypeID     = mMasLC.M_MarketingSection.ID
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_MarketingSection", "ID" );
      //:szName                                           = mMasLC.M_MarketingSection.Name
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
      StringBuilder sb_szName;
      if ( szName == null )
         sb_szName = new StringBuilder( 32 );
      else
         sb_szName = new StringBuilder( szName );
             GetVariableFromAttribute( sb_szName, mi_lTempInteger_0, 'S', 257, mMasLC, "M_MarketingSection", "Name", "", 0 );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );
      szName = sb_szName.toString( );}
      //:mMasLC.CompositeComponentList.Name               = szName
      SetAttributeFromString( mMasLC, "CompositeComponentList", "Name", szName );

      //:TraceLineS( "BuildComposite Name: ", szName )
      TraceLineS( "BuildComposite Name: ", szName );
      //:IF mMasLC.M_MarketingSection.Title != ""
      if ( CompareAttributeToString( mMasLC, "M_MarketingSection", "Title", "" ) != 0 )
      { 
         //:IF szName = ""
         if ( ZeidonStringCompare( szName, 1, 0, "", 1, 0, 257 ) == 0 )
         { 
            //:mMasLC.CompositeComponentList.DisplayValue = mMasLC.M_MarketingSection.Title
            SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "M_MarketingSection", "Title" );
            //:ELSE
         } 
         else
         { 
            //:mMasLC.CompositeComponentList.DisplayValue = szName + " - " + mMasLC.M_MarketingSection.Title
             {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                        ZeidonStringCopy( sb_szTempString_0, 1, 0, szName, 1, 0, 32001 );
            szTempString_0 = sb_szTempString_0.toString( );}
             {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                        ZeidonStringConcat( sb_szTempString_0, 1, 0, " - ", 1, 0, 32001 );
            szTempString_0 = sb_szTempString_0.toString( );}
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szTempString_1;
            if ( szTempString_1 == null )
               sb_szTempString_1 = new StringBuilder( 32 );
            else
               sb_szTempString_1 = new StringBuilder( szTempString_1 );
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_1, 'S', 4097, mMasLC, "M_MarketingSection", "Title", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szTempString_1 = sb_szTempString_1.toString( );}
             {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                        ZeidonStringConcat( sb_szTempString_0, 1, 0, szTempString_1, 1, 0, 32001 );
            szTempString_0 = sb_szTempString_0.toString( );}
            SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayValue", szTempString_0 );
         } 

         //:END
         //:ELSE
      } 
      else
      { 
         //:mMasLC.CompositeComponentList.DisplayValue = szName
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayValue", szName );
      } 

      //:END
      //:mMasLC.CompositeComponentList.Title              = mMasLC.M_MarketingSection.Title
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Title", mMasLC, "M_MarketingSection", "Title" );
      //:mMasLC.CompositeComponentList.Value              = mMasLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Value", mMasLC, "CompositeComponentList", "DisplayValue" );

      //:FOR EACH mMasLC.M_MarketingStatement
      RESULT = SetCursorFirstEntity( mMasLC, "M_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mMasLC.CompositeComponentList
         RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
         //:mMasLC.CompositeComponentList.Type               = "M_MarketingStatement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_MarketingStatement" );
         //:mMasLC.CompositeComponentList.SelectLevel        = 2
         SetAttributeFromInteger( mMasLC, "CompositeComponentList", "SelectLevel", 2 );
         //:mMasLC.CompositeComponentList.DisplayType        = "Statement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Statement" );
         //:mMasLC.CompositeComponentList.DisplayTypeIndent  = "...Statement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mMasLC.CompositeComponentList.OriginalTypeID     = mMasLC.M_MarketingStatement.ID
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_MarketingStatement", "ID" );

         //:mMasLC.CompositeComponentList.Title              = mMasLC.M_MarketingStatement.Title
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Title", mMasLC, "M_MarketingStatement", "Title" );
         //:szOriginalDisplayValue = mMasLC.M_MarketingStatement.Text
         {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_2, 'S', 2049, mMasLC, "M_MarketingStatement", "Text", "", 0 );
         lTempInteger_2 = mi_lTempInteger_2.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:mMasLC.CompositeComponentList.Value              = szOriginalDisplayValue
         SetAttributeFromString( mMasLC, "CompositeComponentList", "Value", szOriginalDisplayValue );
         //:szOriginalDisplayValue = mMasLC.M_MarketingStatement.dDisplayKeywordText
         {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_3, 'S', 2049, mMasLC, "M_MarketingStatement", "dDisplayKeywordText", "", 0 );
         lTempInteger_3 = mi_lTempInteger_3.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:GetAttributeLength( OriginalStringLength, mMasLC, "M_MarketingStatement", "Text" )
         {MutableInt mi_OriginalStringLength = new MutableInt( OriginalStringLength );
                   GetAttributeLength( mi_OriginalStringLength, mMasLC, "M_MarketingStatement", "Text" );
         OriginalStringLength = mi_OriginalStringLength.intValue( );}
         //:IF MaxDisplayLength < OriginalStringLength
         if ( MaxDisplayLength < OriginalStringLength )
         { 
            //:szDisplayValue = szOriginalDisplayValue[1:2000] + "....."
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringCopy( sb_szDisplayValue, 1, 0, szOriginalDisplayValue, 1, 2000, 2053 );
            szDisplayValue = sb_szDisplayValue.toString( );}
             {StringBuilder sb_szDisplayValue;
            if ( szDisplayValue == null )
               sb_szDisplayValue = new StringBuilder( 32 );
            else
               sb_szDisplayValue = new StringBuilder( szDisplayValue );
                        ZeidonStringConcat( sb_szDisplayValue, 1, 0, ".....", 1, 0, 2053 );
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
                        ZeidonStringCopy( sb_szDisplayValue, 1, 0, szOriginalDisplayValue, 1, 0, 2053 );
            szDisplayValue = sb_szDisplayValue.toString( );}
         } 

         //:END
         //:mMasLC.CompositeComponentList.DisplayValue = szDisplayValue
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayValue", szDisplayValue );
         RESULT = SetCursorNextEntity( mMasLC, "M_MarketingStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_MarketingSection", "" );
      //:END
   } 

   //:END
   return( 0 );
// /*
//    STRING ( 2048 ) szCompositeLocation
//    STRING ( 20 )   szUsageType
//    INTEGER         Count
//    // First clear any current entries.
//    FOR EACH mMasLC.CompositeComponentList
//       DELETE ENTITY mMasLC.CompositeComponentList NONE
//    END
//    // General Section and Statements.
//    FOR EACH mMasLC.M_GeneralSection
//       CREATE ENTITY mMasLC.CompositeComponentList
//       mMasLC.CompositeComponentList.Type              = "M_GeneralSection"
//       mMasLC.CompositeComponentList.SelectLevel       = 1
//       mMasLC.CompositeComponentList.DisplayType       = "General"
//       mMasLC.CompositeComponentList.DisplayTypeIndent = "General"
//       mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_GeneralSection.ID
//       mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_GeneralSection.Title
//       mMasLC.CompositeComponentList.Title             = mMasLC.M_GeneralSection.Title
//       mMasLC.CompositeComponentList.Value             = mMasLC.CompositeComponentList.DisplayValue
//       FOR EACH mMasLC.M_GeneralStatement
//          CREATE ENTITY mMasLC.CompositeComponentList
//          mMasLC.CompositeComponentList.Type              = "M_GeneralStatement"
//          mMasLC.CompositeComponentList.SelectLevel       = 2
//          mMasLC.CompositeComponentList.DisplayType       = "Statement"
//          mMasLC.CompositeComponentList.DisplayTypeIndent = "...Statement"
//          mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_GeneralStatement.ID
//          mMasLC.CompositeComponentList.Title             = mMasLC.M_GeneralStatement.Title
//          mMasLC.CompositeComponentList.Value             = mMasLC.M_GeneralStatement.Text
//          szOriginalDisplayValue = mMasLC.M_GeneralStatement.Text
//          GetAttributeLength( OriginalStringLength, mMasLC, "M_GeneralStatement", "Text" )
//          IF MaxDisplayLength < OriginalStringLength
//             szDisplayValue = szOriginalDisplayValue + "....."
//          ELSE
//             szDisplayValue = szOriginalDisplayValue
//          END
//          mMasLC.CompositeComponentList.DisplayValue   = szDisplayValue
//       END
//    END
//    // Ingredients Section and Statements.
//    FOR EACH mMasLC.M_IngredientsSection
//       CREATE ENTITY mMasLC.CompositeComponentList
//       mMasLC.CompositeComponentList.Type              = "M_IngredientsSection"
//       mMasLC.CompositeComponentList.SelectLevel       = 1
//       mMasLC.CompositeComponentList.DisplayType       = "Ingredients"
//       mMasLC.CompositeComponentList.DisplayTypeIndent = "Ingredients"
//       mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_IngredientsSection.ID
//       mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_IngredientsSection.ActiveTitle
//       mMasLC.CompositeComponentList.Value             = mMasLC.CompositeComponentList.DisplayValue
//       FOR EACH mMasLC.M_IngredientsStatement
//          CREATE ENTITY mMasLC.CompositeComponentList
//          mMasLC.CompositeComponentList.Type              = "M_IngredientsStatement"
//          mMasLC.CompositeComponentList.SelectLevel       = 2
//          mMasLC.CompositeComponentList.DisplayType       = "Statement"
//          mMasLC.CompositeComponentList.DisplayTypeIndent = "...Statement"
//          mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_IngredientsStatement.ID
//          mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_IngredientsStatement.ChemicalName
//          mMasLC.CompositeComponentList.Value             = mMasLC.M_IngredientsStatement.ChemicalName
//       END
//    END
//    // StorageDisposal Section and Statements.
//    FOR EACH mMasLC.M_StorageDisposalSection
//       CREATE ENTITY mMasLC.CompositeComponentList
//       mMasLC.CompositeComponentList.Type              = "M_StorageDisposalSection"
//       mMasLC.CompositeComponentList.SelectLevel       = 1
//       mMasLC.CompositeComponentList.DisplayType       = "Storage and Disposal"
//       mMasLC.CompositeComponentList.DisplayTypeIndent = "Storage and Disposal"
//       mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_StorageDisposalSection.ID
//       mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_StorageDisposalSection.Title
//       mMasLC.CompositeComponentList.Title             = mMasLC.M_StorageDisposalSection.Title
//       mMasLC.CompositeComponentList.Value             = mMasLC.CompositeComponentList.DisplayValue
//       FOR EACH mMasLC.M_StorageDisposalStatement
//          CREATE ENTITY mMasLC.CompositeComponentList
//          mMasLC.CompositeComponentList.Type              = "M_StorageDisposalStatement"
//          mMasLC.CompositeComponentList.SelectLevel       = 2
//          mMasLC.CompositeComponentList.DisplayType       = "Statement"
//          mMasLC.CompositeComponentList.DisplayTypeIndent = "...Statement"
//          mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_StorageDisposalStatement.ID
//          mMasLC.CompositeComponentList.Title             = mMasLC.M_StorageDisposalStatement.Title
//          mMasLC.CompositeComponentList.Value             = mMasLC.M_StorageDisposalStatement.Text
//          szOriginalDisplayValue = mMasLC.M_StorageDisposalStatement.Text
//          GetAttributeLength( OriginalStringLength, mMasLC, "M_StorageDisposalStatement", "Text" )
//          IF MaxDisplayLength < OriginalStringLength
//             szDisplayValue = szOriginalDisplayValue + "....."
//          ELSE
//             szDisplayValue = szOriginalDisplayValue
//          END
//          mMasLC.CompositeComponentList.DisplayValue   = szDisplayValue
//       END
//    END
//    // DirectionsForUse Section and Statements.
//    FOR EACH mMasLC.M_DirectionsForUseSection
//       CREATE ENTITY mMasLC.CompositeComponentList
//       mMasLC.CompositeComponentList.Type              = "M_DirectionsForUseSection"
//       mMasLC.CompositeComponentList.SelectLevel       = 1
//       mMasLC.CompositeComponentList.DisplayType       = "Directions For Use"
//       mMasLC.CompositeComponentList.DisplayTypeIndent = "Directions For Use"
//       mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_DirectionsForUseSection.ID
//       IF mMasLC.M_DirectionsForUseSection.Title != ""
//          IF mMasLC.M_DirectionsForUseSection.Name = ""
//             mMasLC.CompositeComponentList.DisplayValue = mMasLC.M_DirectionsForUseSection.Title
//          ELSE
//             mMasLC.CompositeComponentList.DisplayValue = mMasLC.M_DirectionsForUseSection.Name + " - " +
//                                                          mMasLC.M_DirectionsForUseSection.Title
//          END
//       ELSE
//          mMasLC.CompositeComponentList.DisplayValue = mMasLC.M_DirectionsForUseSection.Name
//       END
//       mMasLC.CompositeComponentList.Title             = mMasLC.M_DirectionsForUseSection.Title
//       mMasLC.CompositeComponentList.Value             = mMasLC.CompositeComponentList.DisplayValue
//       FOR EACH mMasLC.M_DirectionsForUseStatement
//          CREATE ENTITY mMasLC.CompositeComponentList
//          mMasLC.CompositeComponentList.Type              = "M_DirectionsForUseStatement"
//          mMasLC.CompositeComponentList.SelectLevel       = 2
//          mMasLC.CompositeComponentList.DisplayType       = "Statement"
//          mMasLC.CompositeComponentList.DisplayTypeIndent = "...Statement"
//          mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_DirectionsForUseStatement.ID
//          mMasLC.CompositeComponentList.Title             = mMasLC.M_DirectionsForUseStatement.Title
//          mMasLC.CompositeComponentList.Value             = mMasLC.M_DirectionsForUseStatement.Text
//          szOriginalDisplayValue = mMasLC.M_DirectionsForUseStatement.Text
//          GetAttributeLength( OriginalStringLength, mMasLC, "M_DirectionsForUseStatement", "Text" )
//          IF MaxDisplayLength < OriginalStringLength
//             szDisplayValue = szOriginalDisplayValue + "....."
//          ELSE
//             szDisplayValue = szOriginalDisplayValue
//          END
//          mMasLC.CompositeComponentList.DisplayValue   = szDisplayValue
//       END
//       // Add any Usage entries.
//       // First sort by Usage Type, but keeping the entries in their original order otherwise.
//       Count = 0
//       FOR EACH mMasLC.M_DirectionsUsageOrdering
//          Count = Count + 1
//          mMasLC.M_DirectionsUsageOrdering.wSortOrder = Count
//       END
//       OrderEntityForView( mMasLC, "M_DirectionsUsageOrdering", "M_DirectionsUsage.UsageType A wSortOrder A" )
//       FOR EACH mMasLC.M_DirectionsUsageOrdering
//          CREATE ENTITY mMasLC.CompositeComponentList
//          GetStringFromAttributeByContext( szUsageType, mMasLC, "M_DirectionsUsage", "UsageType", "FullUsageType", 20 )
//          mMasLC.CompositeComponentList.Type              = "M_DirectionsUsageOrdering"
//          mMasLC.CompositeComponentList.SelectLevel       = 3
//          mMasLC.CompositeComponentList.DisplayType       = "DirUseUsage"
//          mMasLC.CompositeComponentList.DisplayTypeIndent = "...DU " + szUsageType
//          mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_DirectionsUsage.ID
//          mMasLC.CompositeComponentList.Value             = mMasLC.M_DirectionsUsage.Name
//          mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_DirectionsUsage.Name
//       END
//    END
//    // Marketing Section and Statements.
//    FOR EACH mMasLC.M_MarketingSection
//       CREATE ENTITY mMasLC.CompositeComponentList
//       mMasLC.CompositeComponentList.Type              = "M_MarketingSection"
//       mMasLC.CompositeComponentList.SelectLevel       = 1
//       mMasLC.CompositeComponentList.DisplayType       = "Marketing"
//       mMasLC.CompositeComponentList.DisplayTypeIndent = "Marketing"
//       mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_MarketingSection.ID
//       IF mMasLC.M_MarketingSection.Title != ""
//          IF mMasLC.M_MarketingSection.Name = ""
//             mMasLC.CompositeComponentList.DisplayValue = mMasLC.M_MarketingSection.Title
//          ELSE
//             mMasLC.CompositeComponentList.DisplayValue = mMasLC.M_MarketingSection.Name + " - " +
//                                                          mMasLC.M_MarketingSection.Title
//          END
//       ELSE
//          mMasLC.CompositeComponentList.DisplayValue = mMasLC.M_MarketingSection.Name
//       END
//       mMasLC.CompositeComponentList.Title             = mMasLC.M_MarketingSection.Title
//       mMasLC.CompositeComponentList.Value             = mMasLC.CompositeComponentList.DisplayValue
//       FOR EACH mMasLC.M_MarketingStatement
//          CREATE ENTITY mMasLC.CompositeComponentList
//          mMasLC.CompositeComponentList.Type              = "M_MarketingStatement"
//          mMasLC.CompositeComponentList.SelectLevel       = 2
//          mMasLC.CompositeComponentList.DisplayType       = "Statement"
//          mMasLC.CompositeComponentList.DisplayTypeIndent = "...Statement"
//          mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_MarketingStatement.ID
//          mMasLC.CompositeComponentList.Title             = mMasLC.M_MarketingStatement.Title
//          mMasLC.CompositeComponentList.Value             = mMasLC.M_MarketingStatement.Text
//          szOriginalDisplayValue = mMasLC.M_MarketingStatement.Text
//          GetAttributeLength( OriginalStringLength, mMasLC, "M_MarketingStatement", "Text" )
//          IF MaxDisplayLength < OriginalStringLength
//             szDisplayValue = szOriginalDisplayValue + "....."
//          ELSE
//             szDisplayValue = szOriginalDisplayValue
//          END
//          mMasLC.CompositeComponentList.DisplayValue = szDisplayValue
//       END
//       // Add any Usage entries.
//       // First sort by Usage Type, but keeping the entries in their original order otherwise.
//       Count = 0
//       FOR EACH mMasLC.M_MarketingUsageOrdering
//          Count = Count + 1
//          mMasLC.M_MarketingUsageOrdering.wSortOrder = Count
//       END
//       OrderEntityForView( mMasLC, "M_MarketingUsageOrdering", "M_MarketingUsage.UsageType A wSortOrder A" )
//       FOR EACH mMasLC.M_MarketingUsageOrdering
//          CREATE ENTITY mMasLC.CompositeComponentList
//          GetStringFromAttributeByContext( szUsageType, mMasLC, "M_MarketingUsage", "UsageType", "FullUsageType", 20 )
//          mMasLC.CompositeComponentList.Type              = "M_MarketingUsageOrdering"
//          mMasLC.CompositeComponentList.SelectLevel       = 3
//          mMasLC.CompositeComponentList.DisplayType       = "MarketingUsage"
//          mMasLC.CompositeComponentList.DisplayTypeIndent = "...Mktg " + szUsageType
//          mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_MarketingUsage.ID
//          mMasLC.CompositeComponentList.Value             = mMasLC.M_MarketingUsage.Name
//          mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_MarketingUsage.Name
//       END
//    END
//    // Hazards Section
//    CREATE ENTITY mMasLC.CompositeComponentList
//    mMasLC.CompositeComponentList.Type              = "M_HumanHazardSection"
//    mMasLC.CompositeComponentList.SelectLevel       = 1
//    mMasLC.CompositeComponentList.DisplayType       = "HumanHazard"
//    mMasLC.CompositeComponentList.DisplayTypeIndent = "Hazards"
//    mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_HumanHazardSection.ID
//    mMasLC.CompositeComponentList.DisplayValue      = ""
//    CREATE ENTITY mMasLC.CompositeComponentList
//    mMasLC.CompositeComponentList.SelectLevel       = 2
//    mMasLC.CompositeComponentList.DisplayType       = "Signal Word"
//    mMasLC.CompositeComponentList.DisplayTypeIndent = "...Signal Word"
//    mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_HumanHazardSection.EPA_SignalWord
//    CREATE ENTITY mMasLC.CompositeComponentList
//    mMasLC.CompositeComponentList.SelectLevel       = 2
//    mMasLC.CompositeComponentList.DisplayType       = "Child Warning"
//    mMasLC.CompositeComponentList.DisplayTypeIndent = "...Child Warning"
//    mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_HumanHazardSection.EPA_ChildHazardWarning
//    CREATE ENTITY mMasLC.CompositeComponentList
//    mMasLC.CompositeComponentList.SelectLevel       = 2
//    mMasLC.CompositeComponentList.DisplayType       = "Precautionary Stmt"
//    mMasLC.CompositeComponentList.DisplayTypeIndent = "...Precautionary Stmt"
//    mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_HumanHazardSection.PrecautionaryStatement
//    CREATE ENTITY mMasLC.CompositeComponentList
//    mMasLC.CompositeComponentList.DisplayType       = "Location"
//    mMasLC.CompositeComponentList.DisplayTypeIndent = "Location"
//    szCompositeLocation = "..." + mMasLC.M_HumanHazardSection.PanelLoc1
//    IF mMasLC.M_HumanHazardSection.PanelLoc2 != ""
//       szCompositeLocation = szCompositeLocation + " / " + mMasLC.M_HumanHazardSection.PanelLoc2
//    END
//    IF mMasLC.M_HumanHazardSection.PanelLoc3 != ""
//       szCompositeLocation = szCompositeLocation + " / " + mMasLC.M_HumanHazardSection.PanelLoc3
//    END
//    IF mMasLC.M_HumanHazardSection.PanelLoc4 != ""
//       szCompositeLocation = szCompositeLocation + " / " + mMasLC.M_HumanHazardSection.PanelLoc4
//    END
//    IF mMasLC.M_HumanHazardSection.PanelLoc5 != ""
//       szCompositeLocation = szCompositeLocation + " / " + mMasLC.M_HumanHazardSection.PanelLoc5
//    END
//    mMasLC.CompositeComponentList.DisplayValue   = szCompositeLocation
//    // Usage Section
//    CREATE ENTITY mMasLC.CompositeComponentList
//    mMasLC.CompositeComponentList.Type           = "UsageSection"
//    mMasLC.CompositeComponentList.DisplayType    = "Usage"
//    mMasLC.CompositeComponentList.OriginalTypeID = mMasLC.M_Usage.ID
//    mMasLC.CompositeComponentList.DisplayValue   = ""
//    FOR EACH mMasLC.M_Usage
//       CREATE ENTITY mMasLC.CompositeComponentList
//       mMasLC.CompositeComponentList.Type           = "M_Usage"
//       GetStringFromAttributeByContext( szUsageType, mMasLC, "M_Usage", "UsageType", "FullUsageType", 20 )
//       mMasLC.CompositeComponentList.DisplayType    = "..." + szUsageType
//       mMasLC.CompositeComponentList.OriginalTypeID = mMasLC.M_Usage.ID
//       mMasLC.CompositeComponentList.DisplayValue   = mMasLC.M_Usage.Name
//    END
// */
// END
} 


//:TRANSFORMATION OPERATION
//:BuildFullCompEntries( VIEW mMasLC BASED ON LOD mMasLC )

//:   STRING ( 2048 ) szCompositeLocation
public int 
omMasLC_BuildFullCompEntries( View     mMasLC )
{
   String   szCompositeLocation = null;
   //:STRING ( 2052 ) szDisplayValue
   String   szDisplayValue = null;
   //:STRING ( 2048 ) szOriginalDisplayValue
   String   szOriginalDisplayValue = null;
   //:STRING ( 20 )  szUsageType
   String   szUsageType = null;
   //:INTEGER        MaxDisplayLength
   int      MaxDisplayLength = 0;
   //:INTEGER        OriginalStringLength
   int      OriginalStringLength = 0;
   int      RESULT = 0;
   String   szTempString_0 = null;
   int      lTempInteger_0 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_1 = 0;
   String   szTempString_2 = null;
   int      lTempInteger_2 = 0;
   String   szTempString_3 = null;
   int      lTempInteger_3 = 0;
   String   szTempString_4 = null;
   int      lTempInteger_4 = 0;


   //:// Build the flat display of all components subobject.
   //:MaxDisplayLength = 100
   MaxDisplayLength = 100;

   //:// First clear any current entries.
   //:FOR EACH mMasLC.CompositeComponentList
   RESULT = SetCursorFirstEntity( mMasLC, "CompositeComponentList", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mMasLC.CompositeComponentList NONE
      RESULT = DeleteEntity( mMasLC, "CompositeComponentList", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mMasLC, "CompositeComponentList", "" );
   } 

   //:END

   //:// General Section and Statements.
   //:FOR EACH mMasLC.M_GeneralSection
   RESULT = SetCursorFirstEntity( mMasLC, "M_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.CompositeComponentList
      RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
      //:mMasLC.CompositeComponentList.Type              = "M_GeneralSection"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_GeneralSection" );
      //:mMasLC.CompositeComponentList.DisplayType       = "General"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "General" );
      //:mMasLC.CompositeComponentList.DisplayTypeIndent = "General"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "General" );
      //:mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_GeneralSection.ID
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_GeneralSection", "ID" );
      //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_GeneralSection.Title
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "M_GeneralSection", "Title" );
      //:mMasLC.CompositeComponentList.Title             = mMasLC.M_GeneralSection.Title
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Title", mMasLC, "M_GeneralSection", "Title" );
      //:mMasLC.CompositeComponentList.Value             = mMasLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Value", mMasLC, "CompositeComponentList", "DisplayValue" );

      //:FOR EACH mMasLC.M_GeneralStatement
      RESULT = SetCursorFirstEntity( mMasLC, "M_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mMasLC.CompositeComponentList
         RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
         //:mMasLC.CompositeComponentList.Type              = "M_GeneralStatement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_GeneralStatement" );
         //:mMasLC.CompositeComponentList.DisplayType       = "Statement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Statement" );
         //:mMasLC.CompositeComponentList.DisplayTypeIndent = "...Statement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_GeneralStatement.ID
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_GeneralStatement", "ID" );
         //:mMasLC.CompositeComponentList.Title             = mMasLC.M_GeneralStatement.Title
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Title", mMasLC, "M_GeneralStatement", "Title" );
         //:mMasLC.CompositeComponentList.Value             = mMasLC.M_GeneralStatement.Text
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Value", mMasLC, "M_GeneralStatement", "Text" );
         //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.CompositeComponentList.Value
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "CompositeComponentList", "Value" );
         RESULT = SetCursorNextEntity( mMasLC, "M_GeneralStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_GeneralSection", "" );
      //:END
   } 

   //:END

   //:// Ingredients Section and Statements.
   //:FOR EACH mMasLC.M_IngredientsSection
   RESULT = SetCursorFirstEntity( mMasLC, "M_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.CompositeComponentList
      RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
      //:mMasLC.CompositeComponentList.Type              = "M_IngredientsSection"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_IngredientsSection" );
      //:mMasLC.CompositeComponentList.DisplayType       = "Ingredients"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Ingredients" );
      //:mMasLC.CompositeComponentList.DisplayTypeIndent = "Ingredients"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "Ingredients" );
      //:mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_IngredientsSection.ID
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_IngredientsSection", "ID" );
      //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_IngredientsSection.ActiveTitle
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "M_IngredientsSection", "ActiveTitle" );
      //:mMasLC.CompositeComponentList.Value             = mMasLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Value", mMasLC, "CompositeComponentList", "DisplayValue" );

      //:FOR EACH mMasLC.M_IngredientsStatement
      RESULT = SetCursorFirstEntity( mMasLC, "M_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mMasLC.CompositeComponentList
         RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
         //:mMasLC.CompositeComponentList.Type              = "M_IngredientsStatement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_IngredientsStatement" );
         //:mMasLC.CompositeComponentList.DisplayType       = "Statement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Statement" );
         //:mMasLC.CompositeComponentList.DisplayTypeIndent = "...Statement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_IngredientsStatement.ID
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_IngredientsStatement", "ID" );
         //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_IngredientsStatement.ChemicalName
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "M_IngredientsStatement", "ChemicalName" );
         //:mMasLC.CompositeComponentList.Value             = mMasLC.M_IngredientsStatement.ChemicalName
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Value", mMasLC, "M_IngredientsStatement", "ChemicalName" );
         RESULT = SetCursorNextEntity( mMasLC, "M_IngredientsStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_IngredientsSection", "" );
      //:END
   } 

   //:END

   //:// StorageDisposal Section and Statements.
   //:FOR EACH mMasLC.M_StorageDisposalSection
   RESULT = SetCursorFirstEntity( mMasLC, "M_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.CompositeComponentList
      RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
      //:mMasLC.CompositeComponentList.Type              = "M_StorageDisposalSection"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_StorageDisposalSection" );
      //:mMasLC.CompositeComponentList.DisplayType       = "Storage and Disposal"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Storage and Disposal" );
      //:mMasLC.CompositeComponentList.DisplayTypeIndent = "Storage and Disposal"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "Storage and Disposal" );
      //:mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_StorageDisposalSection.ID
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_StorageDisposalSection", "ID" );
      //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_StorageDisposalSection.Title
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "M_StorageDisposalSection", "Title" );
      //:mMasLC.CompositeComponentList.Title             = mMasLC.M_StorageDisposalSection.Title
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Title", mMasLC, "M_StorageDisposalSection", "Title" );
      //:mMasLC.CompositeComponentList.Value             = mMasLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Value", mMasLC, "CompositeComponentList", "DisplayValue" );

      //:FOR EACH mMasLC.M_StorageDisposalStatement
      RESULT = SetCursorFirstEntity( mMasLC, "M_StorageDisposalStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mMasLC.CompositeComponentList
         RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
         //:mMasLC.CompositeComponentList.Type              = "M_StorageDisposalStatement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_StorageDisposalStatement" );
         //:mMasLC.CompositeComponentList.DisplayType       = "Statement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Statement" );
         //:mMasLC.CompositeComponentList.DisplayTypeIndent = "...Statement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_StorageDisposalStatement.ID
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_StorageDisposalStatement", "ID" );
         //:mMasLC.CompositeComponentList.Title             = mMasLC.M_StorageDisposalStatement.Title
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Title", mMasLC, "M_StorageDisposalStatement", "Title" );
         //:mMasLC.CompositeComponentList.Value             = mMasLC.M_StorageDisposalStatement.Text
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Value", mMasLC, "M_StorageDisposalStatement", "Text" );
         //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.CompositeComponentList.Value
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "CompositeComponentList", "Value" );
         RESULT = SetCursorNextEntity( mMasLC, "M_StorageDisposalStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_StorageDisposalSection", "" );
      //:END
   } 

   //:END

   //:// DirectionsForUse Section and Statements.
   //:FOR EACH mMasLC.M_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.CompositeComponentList
      RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
      //:mMasLC.CompositeComponentList.Type              = "M_DirectionsForUseSection"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_DirectionsForUseSection" );
      //:mMasLC.CompositeComponentList.DisplayType       = "Directions For Use"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Directions For Use" );
      //:mMasLC.CompositeComponentList.DisplayTypeIndent = "Directions For Use"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "Directions For Use" );
      //:mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_DirectionsForUseSection.ID
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_DirectionsForUseSection", "ID" );
      //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_DirectionsForUseSection.Title
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "M_DirectionsForUseSection", "Title" );
      //:mMasLC.CompositeComponentList.Title             = mMasLC.M_DirectionsForUseSection.Title
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Title", mMasLC, "M_DirectionsForUseSection", "Title" );
      //:mMasLC.CompositeComponentList.Value             = mMasLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Value", mMasLC, "CompositeComponentList", "DisplayValue" );

      //:FOR EACH mMasLC.M_DirectionsForUseStatement
      RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsForUseStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mMasLC.CompositeComponentList
         RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
         //:mMasLC.CompositeComponentList.Type              = "M_DirectionsForUseStatement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_DirectionsForUseStatement" );
         //:mMasLC.CompositeComponentList.DisplayType       = "Statement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Statement" );
         //:mMasLC.CompositeComponentList.DisplayTypeIndent = "...Statement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_DirectionsForUseStatement.ID
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_DirectionsForUseStatement", "ID" );
         //:mMasLC.CompositeComponentList.Title             = mMasLC.M_DirectionsForUseStatement.Title
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Title", mMasLC, "M_DirectionsForUseStatement", "Title" );
         //:mMasLC.CompositeComponentList.Value             = mMasLC.M_DirectionsForUseStatement.Text
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Value", mMasLC, "M_DirectionsForUseStatement", "Text" );
         //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.CompositeComponentList.Value
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "CompositeComponentList", "Value" );
         RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsForUseStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// Marketing Section and Statements.
   //:FOR EACH mMasLC.M_MarketingSection
   RESULT = SetCursorFirstEntity( mMasLC, "M_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC.CompositeComponentList
      RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
      //:mMasLC.CompositeComponentList.Type              = "M_MarketingSection"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_MarketingSection" );
      //:mMasLC.CompositeComponentList.DisplayType       = "Marketing"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Marketing" );
      //:mMasLC.CompositeComponentList.DisplayTypeIndent = "Marketing"
      SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "Marketing" );
      //:mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_MarketingSection.ID
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_MarketingSection", "ID" );
      //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_MarketingSection.Title
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "M_MarketingSection", "Title" );
      //:mMasLC.CompositeComponentList.Title             = mMasLC.M_MarketingSection.Title
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Title", mMasLC, "M_MarketingSection", "Title" );
      //:mMasLC.CompositeComponentList.Value             = mMasLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Value", mMasLC, "CompositeComponentList", "DisplayValue" );

      //:FOR EACH mMasLC.M_MarketingStatement
      RESULT = SetCursorFirstEntity( mMasLC, "M_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mMasLC.CompositeComponentList
         RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
         //:mMasLC.CompositeComponentList.Type              = "M_MarketingStatement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_MarketingStatement" );
         //:mMasLC.CompositeComponentList.DisplayType       = "Statement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Statement" );
         //:mMasLC.CompositeComponentList.DisplayTypeIndent = "...Statement"
         SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_MarketingStatement.ID
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_MarketingStatement", "ID" );
         //:mMasLC.CompositeComponentList.Title             = mMasLC.M_MarketingStatement.Title
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Title", mMasLC, "M_MarketingStatement", "Title" );
         //:mMasLC.CompositeComponentList.Value             = mMasLC.M_MarketingStatement.Text
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "Value", mMasLC, "M_MarketingStatement", "Text" );
         //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.CompositeComponentList.Value
         SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "CompositeComponentList", "Value" );
         RESULT = SetCursorNextEntity( mMasLC, "M_MarketingStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_MarketingSection", "" );
      //:END
   } 

   //:END

   //:// Hazards Section
   //:CREATE ENTITY mMasLC.CompositeComponentList
   RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
   //:mMasLC.CompositeComponentList.Type              = "M_HumanHazardSection"
   SetAttributeFromString( mMasLC, "CompositeComponentList", "Type", "M_HumanHazardSection" );
   //:mMasLC.CompositeComponentList.DisplayType       = "HumanHazard"
   SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "HumanHazard" );
   //:mMasLC.CompositeComponentList.OriginalTypeID    = mMasLC.M_HumanHazardSection.ID
   SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mMasLC, "M_HumanHazardSection", "ID" );
   //:mMasLC.CompositeComponentList.DisplayValue      = ""
   SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayValue", "" );

   //:CREATE ENTITY mMasLC.CompositeComponentList
   RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
   //:mMasLC.CompositeComponentList.DisplayType       = "Signal Word"
   SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Signal Word" );
   //:mMasLC.CompositeComponentList.DisplayTypeIndent = "...Signal Word"
   SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "...Signal Word" );
   //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_HumanHazardSection.EPA_SignalWord
   SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "M_HumanHazardSection", "EPA_SignalWord" );

   //:CREATE ENTITY mMasLC.CompositeComponentList
   RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
   //:mMasLC.CompositeComponentList.DisplayType       = "Child Warning"
   SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Child Warning" );
   //:mMasLC.CompositeComponentList.DisplayTypeIndent = "...Child Warning"
   SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "...Child Warning" );
   //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_HumanHazardSection.EPA_ChildHazardWarning
   SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "M_HumanHazardSection", "EPA_ChildHazardWarning" );

   //:CREATE ENTITY mMasLC.CompositeComponentList
   RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
   //:mMasLC.CompositeComponentList.DisplayType       = "Precautionary Stmt"
   SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Precautionary Stmt" );
   //:mMasLC.CompositeComponentList.DisplayTypeIndent = "...Precautionary Stmt"
   SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayTypeIndent", "...Precautionary Stmt" );
   //:mMasLC.CompositeComponentList.DisplayValue      = mMasLC.M_HumanHazardSection.PrecautionaryStatement
   SetAttributeFromAttribute( mMasLC, "CompositeComponentList", "DisplayValue", mMasLC, "M_HumanHazardSection", "PrecautionaryStatement" );

   //:CREATE ENTITY mMasLC.CompositeComponentList
   RESULT = CreateEntity( mMasLC, "CompositeComponentList", zPOS_AFTER );
   //:mMasLC.CompositeComponentList.DisplayType    = "Location"
   SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayType", "Location" );
   //:szCompositeLocation = "..." + mMasLC.M_HumanHazardSection.PanelLoc1
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_0, 'S', 255, mMasLC, "M_HumanHazardSection", "PanelLoc1", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szTempString_0 = sb_szTempString_0.toString( );}
    {StringBuilder sb_szCompositeLocation;
   if ( szCompositeLocation == null )
      sb_szCompositeLocation = new StringBuilder( 32 );
   else
      sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
      ZeidonStringCopy( sb_szCompositeLocation, 1, 0, "...", 1, 0, 2049 );
   szCompositeLocation = sb_szCompositeLocation.toString( );}
    {StringBuilder sb_szCompositeLocation;
   if ( szCompositeLocation == null )
      sb_szCompositeLocation = new StringBuilder( 32 );
   else
      sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
      ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_0, 1, 0, 2049 );
   szCompositeLocation = sb_szCompositeLocation.toString( );}
   //:IF mMasLC.M_HumanHazardSection.PanelLoc2 != ""
   if ( CompareAttributeToString( mMasLC, "M_HumanHazardSection", "PanelLoc2", "" ) != 0 )
   { 
      //:szCompositeLocation = szCompositeLocation + " / " + mMasLC.M_HumanHazardSection.PanelLoc2
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, " / ", 1, 0, 2049 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
      {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
      StringBuilder sb_szTempString_1;
      if ( szTempString_1 == null )
         sb_szTempString_1 = new StringBuilder( 32 );
      else
         sb_szTempString_1 = new StringBuilder( szTempString_1 );
             GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_1, 'S', 255, mMasLC, "M_HumanHazardSection", "PanelLoc2", "", 0 );
      lTempInteger_1 = mi_lTempInteger_1.intValue( );
      szTempString_1 = sb_szTempString_1.toString( );}
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_1, 1, 0, 2049 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
   } 

   //:END
   //:IF mMasLC.M_HumanHazardSection.PanelLoc3 != ""
   if ( CompareAttributeToString( mMasLC, "M_HumanHazardSection", "PanelLoc3", "" ) != 0 )
   { 
      //:szCompositeLocation = szCompositeLocation + " / " + mMasLC.M_HumanHazardSection.PanelLoc3
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, " / ", 1, 0, 2049 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
      {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
      StringBuilder sb_szTempString_2;
      if ( szTempString_2 == null )
         sb_szTempString_2 = new StringBuilder( 32 );
      else
         sb_szTempString_2 = new StringBuilder( szTempString_2 );
             GetVariableFromAttribute( sb_szTempString_2, mi_lTempInteger_2, 'S', 255, mMasLC, "M_HumanHazardSection", "PanelLoc3", "", 0 );
      lTempInteger_2 = mi_lTempInteger_2.intValue( );
      szTempString_2 = sb_szTempString_2.toString( );}
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_2, 1, 0, 2049 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
   } 

   //:END
   //:IF mMasLC.M_HumanHazardSection.PanelLoc4 != ""
   if ( CompareAttributeToString( mMasLC, "M_HumanHazardSection", "PanelLoc4", "" ) != 0 )
   { 
      //:szCompositeLocation = szCompositeLocation + " / " + mMasLC.M_HumanHazardSection.PanelLoc4
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, " / ", 1, 0, 2049 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
      {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
      StringBuilder sb_szTempString_3;
      if ( szTempString_3 == null )
         sb_szTempString_3 = new StringBuilder( 32 );
      else
         sb_szTempString_3 = new StringBuilder( szTempString_3 );
             GetVariableFromAttribute( sb_szTempString_3, mi_lTempInteger_3, 'S', 255, mMasLC, "M_HumanHazardSection", "PanelLoc4", "", 0 );
      lTempInteger_3 = mi_lTempInteger_3.intValue( );
      szTempString_3 = sb_szTempString_3.toString( );}
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_3, 1, 0, 2049 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
   } 

   //:END
   //:IF mMasLC.M_HumanHazardSection.PanelLoc5 != ""
   if ( CompareAttributeToString( mMasLC, "M_HumanHazardSection", "PanelLoc5", "" ) != 0 )
   { 
      //:szCompositeLocation = szCompositeLocation + " / " + mMasLC.M_HumanHazardSection.PanelLoc5
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, " / ", 1, 0, 2049 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
      {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
      StringBuilder sb_szTempString_4;
      if ( szTempString_4 == null )
         sb_szTempString_4 = new StringBuilder( 32 );
      else
         sb_szTempString_4 = new StringBuilder( szTempString_4 );
             GetVariableFromAttribute( sb_szTempString_4, mi_lTempInteger_4, 'S', 255, mMasLC, "M_HumanHazardSection", "PanelLoc5", "", 0 );
      lTempInteger_4 = mi_lTempInteger_4.intValue( );
      szTempString_4 = sb_szTempString_4.toString( );}
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_4, 1, 0, 2049 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
   } 

   //:END
   //:mMasLC.CompositeComponentList.DisplayValue   = szCompositeLocation
   SetAttributeFromString( mMasLC, "CompositeComponentList", "DisplayValue", szCompositeLocation );
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
public int 
omMasLC_BuildCompEntsWO_Usage( View     mMasLC )
{
   int      RESULT = 0;

   //:BuildCompEntsWO_Usage( VIEW mMasLC BASED ON LOD mMasLC )

   //:// Build Composite entries without Usage Statements.

   //:// Go to build Composite.
   //:BuildFullCompEntries( mMasLC )
   omMasLC_BuildFullCompEntries( mMasLC );

   //:// Remove Usage entries.
   //:FOR EACH mMasLC.CompositeComponentList
   RESULT = SetCursorFirstEntity( mMasLC, "CompositeComponentList", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.CompositeComponentList.DisplayType = "MarketingUsage" OR mMasLC.CompositeComponentList.DisplayType = "DirUseUsage"
      if ( CompareAttributeToString( mMasLC, "CompositeComponentList", "DisplayType", "MarketingUsage" ) == 0 || CompareAttributeToString( mMasLC, "CompositeComponentList", "DisplayType", "DirUseUsage" ) == 0 )
      { 
         //:DELETE ENTITY mMasLC.CompositeComponentList NONE
         RESULT = DeleteEntity( mMasLC, "CompositeComponentList", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "CompositeComponentList", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:BuildUsageSelectEnts( VIEW mMasLC BASED ON LOD mMasLC )

//:   STRING ( 32 ) szOrderingEntityName
public int 
omMasLC_BuildUsageSelectEnts( View     mMasLC )
{
   String   szOrderingEntityName = null;
   //:STRING ( 32 ) szUsageEntityName
   String   szUsageEntityName = null;
   //:STRING ( 20 ) szUsageType
   String   szUsageType = null;
   //:STRING ( 20 ) szSelectedUsageType
   String   szSelectedUsageType = null;
   //:STRING ( 20 ) szClaimsClassification
   String   szClaimsClassification = null;
   //:STRING ( 20 ) szSelectedClaimsClassification
   String   szSelectedClaimsClassification = null;
   //:SHORT         nRC
   int      nRC = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      RESULT = 0;


   //:// Use the source and target information defined in the UsageSelection entity to include the proper
   //:// M_UsageSelectTarget and M_UsageSelectSource entities for setting up the selection of Usage entries.
   //:szOrderingEntityName           = mMasLC.UsageSelection.TargetOrderingEntityName
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szOrderingEntityName;
   if ( szOrderingEntityName == null )
      sb_szOrderingEntityName = new StringBuilder( 32 );
   else
      sb_szOrderingEntityName = new StringBuilder( szOrderingEntityName );
       GetVariableFromAttribute( sb_szOrderingEntityName, mi_lTempInteger_0, 'S', 33, mMasLC, "UsageSelection", "TargetOrderingEntityName", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szOrderingEntityName = sb_szOrderingEntityName.toString( );}
   //:szUsageEntityName              = mMasLC.UsageSelection.TargetUsageEntityName
   {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
   StringBuilder sb_szUsageEntityName;
   if ( szUsageEntityName == null )
      sb_szUsageEntityName = new StringBuilder( 32 );
   else
      sb_szUsageEntityName = new StringBuilder( szUsageEntityName );
       GetVariableFromAttribute( sb_szUsageEntityName, mi_lTempInteger_1, 'S', 33, mMasLC, "UsageSelection", "TargetUsageEntityName", "", 0 );
   lTempInteger_1 = mi_lTempInteger_1.intValue( );
   szUsageEntityName = sb_szUsageEntityName.toString( );}
   //:szSelectedUsageType            = mMasLC.UsageSelection.UsageType
   {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
   StringBuilder sb_szSelectedUsageType;
   if ( szSelectedUsageType == null )
      sb_szSelectedUsageType = new StringBuilder( 32 );
   else
      sb_szSelectedUsageType = new StringBuilder( szSelectedUsageType );
       GetVariableFromAttribute( sb_szSelectedUsageType, mi_lTempInteger_2, 'S', 21, mMasLC, "UsageSelection", "UsageType", "", 0 );
   lTempInteger_2 = mi_lTempInteger_2.intValue( );
   szSelectedUsageType = sb_szSelectedUsageType.toString( );}
   //:szSelectedClaimsClassification = mMasLC.UsageSelection.ClaimsClassification
   {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
   StringBuilder sb_szSelectedClaimsClassification;
   if ( szSelectedClaimsClassification == null )
      sb_szSelectedClaimsClassification = new StringBuilder( 32 );
   else
      sb_szSelectedClaimsClassification = new StringBuilder( szSelectedClaimsClassification );
       GetVariableFromAttribute( sb_szSelectedClaimsClassification, mi_lTempInteger_3, 'S', 21, mMasLC, "UsageSelection", "ClaimsClassification", "", 0 );
   lTempInteger_3 = mi_lTempInteger_3.intValue( );
   szSelectedClaimsClassification = sb_szSelectedClaimsClassification.toString( );}

   //:// First build the target entries from the current Target Ordering and Usage Entity Names.
   //:// This is of the form "FOR EACH mMasLC.M_MarketingUsageOrdering "
   //:nRC = SetCursorFirstEntity( mMasLC, szOrderingEntityName, "" )
   nRC = SetCursorFirstEntity( mMasLC, szOrderingEntityName, "" );
   //:LOOP WHILE nRC >= zCURSOR_SET
   while ( nRC >= zCURSOR_SET )
   { 
      //:GetStringFromAttribute( szUsageType, mMasLC, szUsageEntityName, "UsageType" )
      {StringBuilder sb_szUsageType;
      if ( szUsageType == null )
         sb_szUsageType = new StringBuilder( 32 );
      else
         sb_szUsageType = new StringBuilder( szUsageType );
             GetStringFromAttribute( sb_szUsageType, mMasLC, szUsageEntityName, "UsageType" );
      szUsageType = sb_szUsageType.toString( );}
      //:GetStringFromAttribute( szClaimsClassification, mMasLC, szUsageEntityName, "ClaimsClassification" )
      {StringBuilder sb_szClaimsClassification;
      if ( szClaimsClassification == null )
         sb_szClaimsClassification = new StringBuilder( 32 );
      else
         sb_szClaimsClassification = new StringBuilder( szClaimsClassification );
             GetStringFromAttribute( sb_szClaimsClassification, mMasLC, szUsageEntityName, "ClaimsClassification" );
      szClaimsClassification = sb_szClaimsClassification.toString( );}
      //:IF szUsageType = szSelectedUsageType AND szClaimsClassification = szSelectedClaimsClassification
      if ( ZeidonStringCompare( szUsageType, 1, 0, szSelectedUsageType, 1, 0, 21 ) == 0 && ZeidonStringCompare( szClaimsClassification, 1, 0, szSelectedClaimsClassification, 1, 0, 21 ) == 0 )
      { 
         //:IncludeSubobjectFromSubobject( mMasLC, "M_UsageSelectTarget", mMasLC, szUsageEntityName, zPOS_AFTER )
         IncludeSubobjectFromSubobject( mMasLC, "M_UsageSelectTarget", mMasLC, szUsageEntityName, zPOS_AFTER );
      } 

      //:END

      //:nRC = SetCursorNextEntity( mMasLC, szOrderingEntityName, "" )
      nRC = SetCursorNextEntity( mMasLC, szOrderingEntityName, "" );
   } 

   //:END

   //:// Next build the Source entries from each M_Usage entry of the requested type.
   //:FOR EACH mMasLC.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.M_Usage.UsageType = szSelectedUsageType AND mMasLC.M_Usage.ClaimsClassification = szSelectedClaimsClassification
      if ( CompareAttributeToString( mMasLC, "M_Usage", "UsageType", szSelectedUsageType ) == 0 && CompareAttributeToString( mMasLC, "M_Usage", "ClaimsClassification", szSelectedClaimsClassification ) == 0 )
      { 
         //:INCLUDE mMasLC.M_UsageSelectSource FROM mMasLC.M_Usage
         RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_UsageSelectSource", mMasLC, "M_Usage", zPOS_AFTER );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:BuildUsageWorkEnts( VIEW mMasLC BASED ON LOD mMasLC,
//:                    STRING ( 1 ) szDirUseOrMarketingType )

//:   STRING ( 32 )  szWorkEntityName
public int 
omMasLC_BuildUsageWorkEnts( View     mMasLC,
                            String   szDirUseOrMarketingType )
{
   String   szWorkEntityName = null;
   //:STRING ( 1 )   szUsageType
   String   szUsageType = null;
   //:STRING ( 10 )  szClaimsClassification
   String   szClaimsClassification = null;

   return( 0 );
//    // Build the work entities of the form, "DirectionsAppType" for each M_DirectionsUsage or M_MarketingUsage,
//    // depending on whether the szDirUseOrMarketingType value is "D" or "M".
//    /*IF szDirUseOrMarketingType = "D"
//       // Directions For Use work entities.
//       FOR EACH mMasLC.M_DirectionsUsageOrdering
//          szUsageType = mMasLC.M_DirectionsUsage.UsageType
//          IF szUsageType = "C"
//             // For Claim type, we need to determine ClaimsClassification.
//             szClaimsClassification = mMasLC.M_DirectionsUsage.ClaimsClassification
//             IF szClaimsClassification = "Fungi"
//                IF mMasLC.DirectionsFungi DOES NOT EXIST
//                   CREATE ENTITY mMasLC.DirectionsFungi
//                END
//             ELSE
//                IF szClaimsClassification = "Bacteria"
//                   IF mMasLC.DirectionsBacteria DOES NOT EXIST
//                      CREATE ENTITY mMasLC.DirectionsBacteria
//                   END
//                ELSE
//                   IF szClaimsClassification = "Viruses"
//                      IF mMasLC.DirectionsViruses DOES NOT EXIST
//                         CREATE ENTITY mMasLC.DirectionsViruses
//                      END
//                   ELSE
//                      // Protazoa (nothing is currently done for this.
//                   END
//                END
//             END
//          ELSE
//             IF szUsageType = "S"
//                // Surface
//                IF mMasLC.DirectionsSurface DOES NOT EXIST
//                   CREATE ENTITY mMasLC.DirectionsSurface
//                END
//             ELSE
//                IF szUsageType = "L"
//                   // Location
//                   IF mMasLC.DirectionsLocations DOES NOT EXIST
//                      CREATE ENTITY mMasLC.DirectionsLocations
//                   END
//                ELSE
//                   // Application Type
//                   IF mMasLC.DirectionsAppType DOES NOT EXIST
//                      CREATE ENTITY mMasLC.DirectionsAppType
//                   END
//                END
//             END
//          END
//       END
//    ELSE
//       // Marketing work entities.
//       FOR EACH mMasLC.M_MarketingUsageOrdering
//          szUsageType = mMasLC.M_MarketingUsage.UsageType
//          IF szUsageType = "C"
//             // For Claim type, we need to determine ClaimsClassification.
//             szClaimsClassification = mMasLC.M_MarketingUsage.ClaimsClassification
//             IF szClaimsClassification = "Fungi"
//                IF mMasLC.MarketingFungi DOES NOT EXIST
//                   CREATE ENTITY mMasLC.MarketingFungi
//                END
//             ELSE
//                IF szClaimsClassification = "Bacteria"
//                   IF mMasLC.MarketingBacteria DOES NOT EXIST
//                      CREATE ENTITY mMasLC.MarketingBacteria
//                   END
//                ELSE
//                   IF szClaimsClassification = "Viruses"
//                      IF mMasLC.MarketingViruses DOES NOT EXIST
//                         CREATE ENTITY mMasLC.MarketingViruses
//                      END
//                   ELSE
//                      // Protazoa (nothing is currently done for this.
//                   END
//                END
//             END
//          ELSE
//             IF szUsageType = "S"
//                // Surface
//                IF mMasLC.MarketingSurface DOES NOT EXIST
//                   CREATE ENTITY mMasLC.MarketingSurface
//                END
//             ELSE
//                IF szUsageType = "L"
//                   // Location
//                   IF mMasLC.MarketingLocations DOES NOT EXIST
//                      CREATE ENTITY mMasLC.MarketingLocations
//                   END
//                ELSE
//                   // Application Type
//                   IF mMasLC.MarketingAppType DOES NOT EXIST
//                      CREATE ENTITY mMasLC.MarketingAppType
//                   END
//                END
//             END
//          END
//       END
//    END*/
// END
} 


//:TRANSFORMATION OPERATION
public int 
omMasLC_SetMLC_SelectedFlags( View     mMasLC,
                              View     mSubLC )
{
   int      RESULT = 0;

   //:SetMLC_SelectedFlags( VIEW mMasLC BASED ON LOD mMasLC,
   //:                   VIEW mSubLC BASED ON LOD mSubLC )

   //:// Select mMLC Component entries from Components currently in the mSLC.

   //:// First, initialize mMLC flags to null.
   //:FOR EACH mMasLC.CompositeComponentList
   RESULT = SetCursorFirstEntity( mMasLC, "CompositeComponentList", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mMasLC.CompositeComponentList.Selected = ""
      SetAttributeFromString( mMasLC, "CompositeComponentList", "Selected", "" );
      RESULT = SetCursorNextEntity( mMasLC, "CompositeComponentList", "" );
   } 

   //:END

   //:// Then set those from mSLC.
   //:FOR EACH mSubLC.CompositeComponentList
   RESULT = SetCursorFirstEntity( mSubLC, "CompositeComponentList", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSubLC.CompositeComponentList.OriginalTypeID != ""
      if ( CompareAttributeToString( mSubLC, "CompositeComponentList", "OriginalTypeID", "" ) != 0 )
      { 
         //:SET CURSOR FIRST mMasLC.CompositeComponentList
         //:           WHERE mMasLC.CompositeComponentList.OriginalTypeID = mSubLC.CompositeComponentList.OriginalTypeID
         //:             AND mMasLC.CompositeComponentList.DisplayType    = mSubLC.CompositeComponentList.DisplayType
         RESULT = SetCursorFirstEntity( mMasLC, "CompositeComponentList", "" );
         if ( RESULT > zCURSOR_UNCHANGED )
         { 
            while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( mMasLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "CompositeComponentList", "OriginalTypeID" ) != 0 ||
                    CompareAttributeToAttribute( mMasLC, "CompositeComponentList", "DisplayType", mSubLC, "CompositeComponentList", "DisplayType" ) != 0 ) )
            { 
               RESULT = SetCursorNextEntity( mMasLC, "CompositeComponentList", "" );
            } 

         } 

         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:mMasLC.CompositeComponentList.Selected = "Y"
            SetAttributeFromString( mMasLC, "CompositeComponentList", "Selected", "Y" );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mSubLC, "CompositeComponentList", "" );
      //:END
   } 

   //:END

   //:// Finally, set any remaining components with null Type to selected. (This only effects display and not the inclusion of
   //:// MLC components in the SLC, as components with null Type are not processed.
   //:FOR EACH mMasLC.CompositeComponentList
   RESULT = SetCursorFirstEntity( mMasLC, "CompositeComponentList", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC.CompositeComponentList.Selected = ""
      if ( CompareAttributeToString( mMasLC, "CompositeComponentList", "Selected", "" ) == 0 )
      { 
         //:IF mMasLC.CompositeComponentList.Type = ""
         if ( CompareAttributeToString( mMasLC, "CompositeComponentList", "Type", "" ) == 0 )
         { 
            //:mMasLC.CompositeComponentList.Selected = "Y"
            SetAttributeFromString( mMasLC, "CompositeComponentList", "Selected", "Y" );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mMasLC, "CompositeComponentList", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dDisplayKeywordTitle( VIEW mMasLC BASED ON LOD mMasLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szGeneratedString
public int 
omMasLC_dDisplayKeywordTitle( View     mMasLC,
                              String InternalEntityStructure,
                              String InternalAttribStructure,
                              Integer   GetOrSetFlag )
{
   String   szGeneratedString = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Expand the current Text attribute by replacing embedded Keywords with the Keyword
         //:// values in the M_InsertTextMarketing subentities.
         //:szGeneratedString = mMasLC.M_MarketingStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                   GetVariableFromAttribute( sb_szGeneratedString, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_MarketingStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szGeneratedString = sb_szGeneratedString.toString( );}
         //:GenerateKeywordTextIntoString( mMasLC,
         //:                            szGeneratedString,
         //:                            "M_InsertTextKeywordMarketing",
         //:                            "M_InsertTextMarketing",
         //:                            ", " )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
          {StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                   m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szGeneratedString, "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", ", " );
         szGeneratedString = sb_szGeneratedString.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dDisplayKeywordText( VIEW mMasLC BASED ON LOD mMasLC,
//:                     STRING ( 32 ) InternalEntityStructure,
//:                     STRING ( 32 ) InternalAttribStructure,
//:                     SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szGeneratedString
public int 
omMasLC_dDisplayKeywordText( View     mMasLC,
                             String InternalEntityStructure,
                             String InternalAttribStructure,
                             Integer   GetOrSetFlag )
{
   String   szGeneratedString = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Expand the current Text attribute by replacing embedded Keywords with the Keyword
         //:// values in the M_InsertTextMarketing subentities.
         //:szGeneratedString = mMasLC.M_MarketingStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                   GetVariableFromAttribute( sb_szGeneratedString, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_MarketingStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szGeneratedString = sb_szGeneratedString.toString( );}
         //:GenerateKeywordTextIntoString( mMasLC,
         //:                            szGeneratedString,
         //:                            "M_InsertTextKeywordMarketing",
         //:                            "M_InsertTextMarketing",
         //:                            ", " )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
          {StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                   m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szGeneratedString, "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", ", " );
         szGeneratedString = sb_szGeneratedString.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dUsageKeywordText( VIEW mMasLC BASED ON LOD mMasLC,
//:                   STRING ( 32 ) InternalEntityStructure,
//:                   STRING ( 32 ) InternalAttribStructure,
//:                   SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szGeneratedString
public int 
omMasLC_dUsageKeywordText( View     mMasLC,
                           String InternalEntityStructure,
                           String InternalAttribStructure,
                           Integer   GetOrSetFlag )
{
   String   szGeneratedString = null;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Concatenate all the Keyword values for a Marketing Keyword entry.
         //:szGeneratedString = ""
          {StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                  ZeidonStringCopy( sb_szGeneratedString, 1, 0, "", 1, 0, 2049 );
         szGeneratedString = sb_szGeneratedString.toString( );}
         //:FOR EACH mMasLC.M_InsertTextUsage
         RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextUsage", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF szGeneratedString = ""
            if ( ZeidonStringCompare( szGeneratedString, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szGeneratedString = mMasLC.M_InsertTextUsage.Text
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szGeneratedString;
               if ( szGeneratedString == null )
                  sb_szGeneratedString = new StringBuilder( 32 );
               else
                  sb_szGeneratedString = new StringBuilder( szGeneratedString );
                               GetVariableFromAttribute( sb_szGeneratedString, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_InsertTextUsage", "Text", "", 0 );
               lTempInteger_0 = mi_lTempInteger_0.intValue( );
               szGeneratedString = sb_szGeneratedString.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szGeneratedString = szGeneratedString + ", " + mMasLC.M_InsertTextUsage.Text
                {StringBuilder sb_szGeneratedString;
               if ( szGeneratedString == null )
                  sb_szGeneratedString = new StringBuilder( 32 );
               else
                  sb_szGeneratedString = new StringBuilder( szGeneratedString );
                              ZeidonStringConcat( sb_szGeneratedString, 1, 0, ", ", 1, 0, 2049 );
               szGeneratedString = sb_szGeneratedString.toString( );}
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 4097, mMasLC, "M_InsertTextUsage", "Text", "", 0 );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szGeneratedString;
               if ( szGeneratedString == null )
                  sb_szGeneratedString = new StringBuilder( 32 );
               else
                  sb_szGeneratedString = new StringBuilder( szGeneratedString );
                              ZeidonStringConcat( sb_szGeneratedString, 1, 0, szTempString_0, 1, 0, 2049 );
               szGeneratedString = sb_szGeneratedString.toString( );}
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextUsage", "" );
            //:END
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dUsageKeywordStmtText( VIEW mMasLC BASED ON LOD mMasLC,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szGeneratedString
public int 
omMasLC_dUsageKeywordStmtText( View     mMasLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   String   szGeneratedString = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Expand the current Text attribute by replacing embedded Keywords with the Keyword
         //:// values in the M_InsertText subentities.
         //:szGeneratedString = mMasLC.DisplayKeywordText.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                   GetVariableFromAttribute( sb_szGeneratedString, mi_lTempInteger_0, 'S', 2049, mMasLC, "DisplayKeywordText", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szGeneratedString = sb_szGeneratedString.toString( );}
         //:IF szGeneratedString != ""
         if ( ZeidonStringCompare( szGeneratedString, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szGeneratedString,
            //:                            "M_InsertTextKeyword", "M_InsertText", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szGeneratedString;
            if ( szGeneratedString == null )
               sb_szGeneratedString = new StringBuilder( 32 );
            else
               sb_szGeneratedString = new StringBuilder( szGeneratedString );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szGeneratedString, "M_InsertTextKeyword", "M_InsertText", ", " );
            szGeneratedString = sb_szGeneratedString.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dFullKeywordTitleText( VIEW mMasLC BASED ON LOD mMasLC,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szGeneratedString
public int 
omMasLC_dFullKeywordTitleText( View     mMasLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   String   szGeneratedString = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Expand the current Title attribute by replacing inbedded Keywords with the Keyword
         //:// values in the M_InsertText subentities.
         //:szGeneratedString = mMasLC.DisplayKeywordText.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                   GetVariableFromAttribute( sb_szGeneratedString, mi_lTempInteger_0, 'S', 2049, mMasLC, "DisplayKeywordText", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szGeneratedString = sb_szGeneratedString.toString( );}
         //:IF szGeneratedString != ""
         if ( ZeidonStringCompare( szGeneratedString, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szGeneratedString,
            //:                            "M_InsertTextKeyword", "M_InsertText", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szGeneratedString;
            if ( szGeneratedString == null )
               sb_szGeneratedString = new StringBuilder( 32 );
            else
               sb_szGeneratedString = new StringBuilder( szGeneratedString );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szGeneratedString, "M_InsertTextKeyword", "M_InsertText", ", " );
            szGeneratedString = sb_szGeneratedString.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dUsageNameFootnote( VIEW mMasLC BASED ON LOD mMasLC,
   //:                 STRING ( 32 ) InternalEntityStructure,
   //:                 STRING ( 32 ) InternalAttribStructure,
   //:                 SHORT GetOrSetFlag )

   //:VIEW mMasLC2 BASED ON LOD mMasLC
public int 
omMasLC_dUsageNameFootnote( View     mMasLC,
                            String InternalEntityStructure,
                            String InternalAttribStructure,
                            Integer   GetOrSetFlag )
{
   zVIEW    mMasLC2 = new zVIEW( );
   //:STRING ( 32 )  szEntityName
   String   szEntityName = null;
   //:STRING ( 100 ) szUsageType
   String   szUsageType = null;
   //:STRING ( 100 ) szClassification
   String   szClassification = null;
   //:STRING ( 100 ) szName
   String   szName = null;
   //:STRING ( 512 ) szCombinedName
   String   szCombinedName = null;
   //:STRING ( 32 )  szFootnoteNumber
   String   szFootnoteNumber = null;
   //:INTEGER        Count
   int      Count = 0;
   int      lTempInteger_0 = 0;
   int      RESULT = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_5 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_6 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// For a Claim Usage entity, this is the combined name of Classification and Name.
         //:// For all others, it is simply the name.
         //:GetEntityNameFromStructure( InternalEntityStructure, szEntityName )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szUsageType, mMasLC, szEntityName, "UsageType" )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttribute( sb_szUsageType, mMasLC, szEntityName, "UsageType" );
         szUsageType = sb_szUsageType.toString( );}
         //:GetStringFromAttribute( szClassification, mMasLC, szEntityName, "ClaimsClassification" )
         {StringBuilder sb_szClassification;
         if ( szClassification == null )
            sb_szClassification = new StringBuilder( 32 );
         else
            sb_szClassification = new StringBuilder( szClassification );
                   GetStringFromAttribute( sb_szClassification, mMasLC, szEntityName, "ClaimsClassification" );
         szClassification = sb_szClassification.toString( );}
         //:GetStringFromAttribute( szName, mMasLC, szEntityName, "Name" )
         {StringBuilder sb_szName;
         if ( szName == null )
            sb_szName = new StringBuilder( 32 );
         else
            sb_szName = new StringBuilder( szName );
                   GetStringFromAttribute( sb_szName, mMasLC, szEntityName, "Name" );
         szName = sb_szName.toString( );}
         //:IF szUsageType = "C"
         if ( ZeidonStringCompare( szUsageType, 1, 0, "C", 1, 0, 101 ) == 0 )
         { 
            //:szCombinedName = szClassification + " - " + szName
             {StringBuilder sb_szCombinedName;
            if ( szCombinedName == null )
               sb_szCombinedName = new StringBuilder( 32 );
            else
               sb_szCombinedName = new StringBuilder( szCombinedName );
                        ZeidonStringCopy( sb_szCombinedName, 1, 0, szClassification, 1, 0, 513 );
            szCombinedName = sb_szCombinedName.toString( );}
             {StringBuilder sb_szCombinedName;
            if ( szCombinedName == null )
               sb_szCombinedName = new StringBuilder( 32 );
            else
               sb_szCombinedName = new StringBuilder( szCombinedName );
                        ZeidonStringConcat( sb_szCombinedName, 1, 0, " - ", 1, 0, 513 );
            szCombinedName = sb_szCombinedName.toString( );}
             {StringBuilder sb_szCombinedName;
            if ( szCombinedName == null )
               sb_szCombinedName = new StringBuilder( 32 );
            else
               sb_szCombinedName = new StringBuilder( szCombinedName );
                        ZeidonStringConcat( sb_szCombinedName, 1, 0, szName, 1, 0, 513 );
            szCombinedName = sb_szCombinedName.toString( );}
            //:ELSE
         } 
         else
         { 
            //:szCombinedName = szName
             {StringBuilder sb_szCombinedName;
            if ( szCombinedName == null )
               sb_szCombinedName = new StringBuilder( 32 );
            else
               sb_szCombinedName = new StringBuilder( szCombinedName );
                        ZeidonStringCopy( sb_szCombinedName, 1, 0, szName, 1, 0, 513 );
            szCombinedName = sb_szCombinedName.toString( );}
         } 

         //:END

         //:// Set Footnote Number, if footnote exists.
         //:IF mMasLC.M_UsageFootnoteUsed EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_UsageFootnoteUsed" );
         if ( lTempInteger_0 == 0 )
         { 
            //:IF mMasLC.M_UsageFootnoteUsed.ID != ""
            if ( CompareAttributeToString( mMasLC, "M_UsageFootnoteUsed", "ID", "" ) != 0 )
            { 
               //:SET CURSOR FIRST mMasLC.M_UsageFootnote WHERE mMasLC.M_UsageFootnote.ID = mMasLC.M_UsageFootnoteUsed.ID
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, mMasLC, "M_UsageFootnoteUsed", "ID" );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_UsageFootnote", "ID", lTempInteger_1, "" );
               //:IF mMasLC.M_UsageFootnote.wFootNoteRelativeNumber = ""
               if ( CompareAttributeToString( mMasLC, "M_UsageFootnote", "wFootNoteRelativeNumber", "" ) == 0 )
               { 
                  //:// Relative numbers haven't been set, so set them here.
                  //:CreateViewFromView( mMasLC2, mMasLC )
                  CreateViewFromView( mMasLC2, mMasLC );
                  //:Count = 0
                  Count = 0;
                  //:FOR EACH mMasLC2.M_UsageFootnote
                  RESULT = SetCursorFirstEntity( mMasLC2, "M_UsageFootnote", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:Count = Count + 1
                     Count = Count + 1;
                     //:mMasLC2.M_UsageFootnote.wFootNoteRelativeNumber = Count
                     SetAttributeFromInteger( mMasLC2, "M_UsageFootnote", "wFootNoteRelativeNumber", Count );
                     RESULT = SetCursorNextEntity( mMasLC2, "M_UsageFootnote", "" );
                  } 

                  //:END
                  //:DropView( mMasLC2 )
                  DropView( mMasLC2 );
               } 

               //:END
               //:szFootnoteNumber = mMasLC.M_UsageFootnote.Symbol
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szFootnoteNumber;
               if ( szFootnoteNumber == null )
                  sb_szFootnoteNumber = new StringBuilder( 32 );
               else
                  sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                               GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_2, 'S', 33, mMasLC, "M_UsageFootnote", "Symbol", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               //:IF szFootnoteNumber = ""
               if ( ZeidonStringCompare( szFootnoteNumber, 1, 0, "", 1, 0, 33 ) == 0 )
               { 
                  //:szFootnoteNumber = mMasLC.M_UsageFootnote.wFootNoteRelativeNumber
                  {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                  StringBuilder sb_szFootnoteNumber;
                  if ( szFootnoteNumber == null )
                     sb_szFootnoteNumber = new StringBuilder( 32 );
                  else
                     sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                                     GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_3, 'S', 33, mMasLC, "M_UsageFootnote", "wFootNoteRelativeNumber", "", 0 );
                  lTempInteger_3 = mi_lTempInteger_3.intValue( );
                  szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               } 

               //:END
               //:szCombinedName = szCombinedName + "<sup> " + szFootnoteNumber + "</sup>"
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, "<sup> ", 1, 0, 513 );
               szCombinedName = sb_szCombinedName.toString( );}
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, szFootnoteNumber, 1, 0, 513 );
               szCombinedName = sb_szCombinedName.toString( );}
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, "</sup>", 1, 0, 513 );
               szCombinedName = sb_szCombinedName.toString( );}
            } 

            //:END
         } 

         //:END
         //:IF mMasLC.M_InsertTextKeywordUsage EXISTS
         lTempInteger_4 = CheckExistenceOfEntity( mMasLC, "M_InsertTextKeywordUsage" );
         if ( lTempInteger_4 == 0 )
         { 
            //:CreateViewFromView( mMasLC2, mMasLC )
            CreateViewFromView( mMasLC2, mMasLC );
            //:FOR EACH mMasLC2.M_InsertTextKeywordUsage
            RESULT = SetCursorFirstEntity( mMasLC2, "M_InsertTextKeywordUsage", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:// Reuse (borrow) szUsageType and szClassification
               //:szUsageType = "{" + mMasLC2.M_InsertTextKeywordUsage.Name + "}"
               {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_5, 'S', 255, mMasLC2, "M_InsertTextKeywordUsage", "Name", "", 0 );
               lTempInteger_5 = mi_lTempInteger_5.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szUsageType;
               if ( szUsageType == null )
                  sb_szUsageType = new StringBuilder( 32 );
               else
                  sb_szUsageType = new StringBuilder( szUsageType );
                              ZeidonStringCopy( sb_szUsageType, 1, 0, "{", 1, 0, 101 );
               szUsageType = sb_szUsageType.toString( );}
                {StringBuilder sb_szUsageType;
               if ( szUsageType == null )
                  sb_szUsageType = new StringBuilder( 32 );
               else
                  sb_szUsageType = new StringBuilder( szUsageType );
                              ZeidonStringConcat( sb_szUsageType, 1, 0, szTempString_0, 1, 0, 101 );
               szUsageType = sb_szUsageType.toString( );}
                {StringBuilder sb_szUsageType;
               if ( szUsageType == null )
                  sb_szUsageType = new StringBuilder( 32 );
               else
                  sb_szUsageType = new StringBuilder( szUsageType );
                              ZeidonStringConcat( sb_szUsageType, 1, 0, "}", 1, 0, 101 );
               szUsageType = sb_szUsageType.toString( );}
               //:szClassification = "<b>" + mMasLC2.M_InsertTextUsage.Text + "</b>"
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
               StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                               GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_6, 'S', 4097, mMasLC2, "M_InsertTextUsage", "Text", "", 0 );
               lTempInteger_6 = mi_lTempInteger_6.intValue( );
               szTempString_1 = sb_szTempString_1.toString( );}
                {StringBuilder sb_szClassification;
               if ( szClassification == null )
                  sb_szClassification = new StringBuilder( 32 );
               else
                  sb_szClassification = new StringBuilder( szClassification );
                              ZeidonStringCopy( sb_szClassification, 1, 0, "<b>", 1, 0, 101 );
               szClassification = sb_szClassification.toString( );}
                {StringBuilder sb_szClassification;
               if ( szClassification == null )
                  sb_szClassification = new StringBuilder( 32 );
               else
                  sb_szClassification = new StringBuilder( szClassification );
                              ZeidonStringConcat( sb_szClassification, 1, 0, szTempString_1, 1, 0, 101 );
               szClassification = sb_szClassification.toString( );}
                {StringBuilder sb_szClassification;
               if ( szClassification == null )
                  sb_szClassification = new StringBuilder( 32 );
               else
                  sb_szClassification = new StringBuilder( szClassification );
                              ZeidonStringConcat( sb_szClassification, 1, 0, "</b>", 1, 0, 101 );
               szClassification = sb_szClassification.toString( );}
               //:zSearchAndReplace( szCombinedName, 512, szUsageType, szClassification )
               {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                               zSearchAndReplace( sb_szCombinedName, 512, szUsageType, szClassification );
               szCombinedName = sb_szCombinedName.toString( );}
               RESULT = SetCursorNextEntity( mMasLC2, "M_InsertTextKeywordUsage", "" );
            } 

            //:END
            //:DropView( mMasLC2 )
            DropView( mMasLC2 );
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szCombinedName );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dPathogenNameKeyFoot( VIEW mMasLC BASED ON LOD mMasLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   VIEW mMasLC2 BASED ON LOD mMasLC
public int 
omMasLC_dPathogenNameKeyFoot( View     mMasLC,
                              String InternalEntityStructure,
                              String InternalAttribStructure,
                              Integer   GetOrSetFlag )
{
   zVIEW    mMasLC2 = new zVIEW( );
   //:STRING ( 32 )  szEntityName
   String   szEntityName = null;
   //:STRING ( 100 ) szUsageType
   String   szUsageType = null;
   //:STRING ( 100 ) szClassification
   String   szClassification = null;
   //:STRING ( 512 ) szCombinedName
   String   szCombinedName = null;
   //:STRING ( 32 )  szFootnoteNumber
   String   szFootnoteNumber = null;
   //:INTEGER        Count
   int      Count = 0;
   int      lTempInteger_0 = 0;
   int      RESULT = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_5 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_6 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Combine the Footnote Number as a subscript to the Claim Name, if it exists.
         //:GetEntityNameFromStructure( InternalEntityStructure, szEntityName )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szUsageType, mMasLC, szEntityName, "UsageType" )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttribute( sb_szUsageType, mMasLC, szEntityName, "UsageType" );
         szUsageType = sb_szUsageType.toString( );}
         //:GetStringFromAttribute( szClassification, mMasLC, szEntityName, "ClaimsClassification" )
         {StringBuilder sb_szClassification;
         if ( szClassification == null )
            sb_szClassification = new StringBuilder( 32 );
         else
            sb_szClassification = new StringBuilder( szClassification );
                   GetStringFromAttribute( sb_szClassification, mMasLC, szEntityName, "ClaimsClassification" );
         szClassification = sb_szClassification.toString( );}
         //:GetStringFromAttribute( szCombinedName, mMasLC, szEntityName, "Name" )
         {StringBuilder sb_szCombinedName;
         if ( szCombinedName == null )
            sb_szCombinedName = new StringBuilder( 32 );
         else
            sb_szCombinedName = new StringBuilder( szCombinedName );
                   GetStringFromAttribute( sb_szCombinedName, mMasLC, szEntityName, "Name" );
         szCombinedName = sb_szCombinedName.toString( );}

         //:// Set Footnote Number, if footnote exists.
         //:IF mMasLC.M_UsageFootnoteUsed EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_UsageFootnoteUsed" );
         if ( lTempInteger_0 == 0 )
         { 
            //:IF mMasLC.M_UsageFootnoteUsed.ID != ""
            if ( CompareAttributeToString( mMasLC, "M_UsageFootnoteUsed", "ID", "" ) != 0 )
            { 
               //:SET CURSOR FIRST mMasLC.M_UsageFootnote WHERE mMasLC.M_UsageFootnote.ID = mMasLC.M_UsageFootnoteUsed.ID
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, mMasLC, "M_UsageFootnoteUsed", "ID" );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_UsageFootnote", "ID", lTempInteger_1, "" );
               //:IF mMasLC.M_UsageFootnote.wFootNoteRelativeNumber = ""
               if ( CompareAttributeToString( mMasLC, "M_UsageFootnote", "wFootNoteRelativeNumber", "" ) == 0 )
               { 
                  //:// Relative numbers haven't been set, so set them here.
                  //:CreateViewFromView( mMasLC2, mMasLC )
                  CreateViewFromView( mMasLC2, mMasLC );
                  //:Count = 0
                  Count = 0;
                  //:FOR EACH mMasLC2.M_UsageFootnote
                  RESULT = SetCursorFirstEntity( mMasLC2, "M_UsageFootnote", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:Count = Count + 1
                     Count = Count + 1;
                     //:mMasLC2.M_UsageFootnote.wFootNoteRelativeNumber = Count
                     SetAttributeFromInteger( mMasLC2, "M_UsageFootnote", "wFootNoteRelativeNumber", Count );
                     RESULT = SetCursorNextEntity( mMasLC2, "M_UsageFootnote", "" );
                  } 

                  //:END
                  //:DropView( mMasLC2 )
                  DropView( mMasLC2 );
               } 

               //:END
               //:szFootnoteNumber = mMasLC.M_UsageFootnote.Symbol
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szFootnoteNumber;
               if ( szFootnoteNumber == null )
                  sb_szFootnoteNumber = new StringBuilder( 32 );
               else
                  sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                               GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_2, 'S', 33, mMasLC, "M_UsageFootnote", "Symbol", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               //:IF szFootnoteNumber = ""
               if ( ZeidonStringCompare( szFootnoteNumber, 1, 0, "", 1, 0, 33 ) == 0 )
               { 
                  //:szFootnoteNumber = mMasLC.M_UsageFootnote.wFootNoteRelativeNumber
                  {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                  StringBuilder sb_szFootnoteNumber;
                  if ( szFootnoteNumber == null )
                     sb_szFootnoteNumber = new StringBuilder( 32 );
                  else
                     sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                                     GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_3, 'S', 33, mMasLC, "M_UsageFootnote", "wFootNoteRelativeNumber", "", 0 );
                  lTempInteger_3 = mi_lTempInteger_3.intValue( );
                  szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               } 

               //:END
               //:szCombinedName = szCombinedName + "<sup> " + szFootnoteNumber + "</sup>"
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, "<sup> ", 1, 0, 513 );
               szCombinedName = sb_szCombinedName.toString( );}
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, szFootnoteNumber, 1, 0, 513 );
               szCombinedName = sb_szCombinedName.toString( );}
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, "</sup>", 1, 0, 513 );
               szCombinedName = sb_szCombinedName.toString( );}
            } 

            //:END
         } 

         //:END
         //:IF mMasLC.M_InsertTextKeywordUsage EXISTS
         lTempInteger_4 = CheckExistenceOfEntity( mMasLC, "M_InsertTextKeywordUsage" );
         if ( lTempInteger_4 == 0 )
         { 
            //:CreateViewFromView( mMasLC2, mMasLC )
            CreateViewFromView( mMasLC2, mMasLC );
            //:FOR EACH mMasLC2.M_InsertTextKeywordUsage
            RESULT = SetCursorFirstEntity( mMasLC2, "M_InsertTextKeywordUsage", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:// Reuse (borrow) szUsageType and szClassification
               //:szUsageType = "{" + mMasLC2.M_InsertTextKeywordUsage.Name + "}"
               {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_5, 'S', 255, mMasLC2, "M_InsertTextKeywordUsage", "Name", "", 0 );
               lTempInteger_5 = mi_lTempInteger_5.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szUsageType;
               if ( szUsageType == null )
                  sb_szUsageType = new StringBuilder( 32 );
               else
                  sb_szUsageType = new StringBuilder( szUsageType );
                              ZeidonStringCopy( sb_szUsageType, 1, 0, "{", 1, 0, 101 );
               szUsageType = sb_szUsageType.toString( );}
                {StringBuilder sb_szUsageType;
               if ( szUsageType == null )
                  sb_szUsageType = new StringBuilder( 32 );
               else
                  sb_szUsageType = new StringBuilder( szUsageType );
                              ZeidonStringConcat( sb_szUsageType, 1, 0, szTempString_0, 1, 0, 101 );
               szUsageType = sb_szUsageType.toString( );}
                {StringBuilder sb_szUsageType;
               if ( szUsageType == null )
                  sb_szUsageType = new StringBuilder( 32 );
               else
                  sb_szUsageType = new StringBuilder( szUsageType );
                              ZeidonStringConcat( sb_szUsageType, 1, 0, "}", 1, 0, 101 );
               szUsageType = sb_szUsageType.toString( );}
               //:szClassification = "<b>" + mMasLC2.M_InsertTextUsage.Text + "</b>"
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
               StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                               GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_6, 'S', 4097, mMasLC2, "M_InsertTextUsage", "Text", "", 0 );
               lTempInteger_6 = mi_lTempInteger_6.intValue( );
               szTempString_1 = sb_szTempString_1.toString( );}
                {StringBuilder sb_szClassification;
               if ( szClassification == null )
                  sb_szClassification = new StringBuilder( 32 );
               else
                  sb_szClassification = new StringBuilder( szClassification );
                              ZeidonStringCopy( sb_szClassification, 1, 0, "<b>", 1, 0, 101 );
               szClassification = sb_szClassification.toString( );}
                {StringBuilder sb_szClassification;
               if ( szClassification == null )
                  sb_szClassification = new StringBuilder( 32 );
               else
                  sb_szClassification = new StringBuilder( szClassification );
                              ZeidonStringConcat( sb_szClassification, 1, 0, szTempString_1, 1, 0, 101 );
               szClassification = sb_szClassification.toString( );}
                {StringBuilder sb_szClassification;
               if ( szClassification == null )
                  sb_szClassification = new StringBuilder( 32 );
               else
                  sb_szClassification = new StringBuilder( szClassification );
                              ZeidonStringConcat( sb_szClassification, 1, 0, "</b>", 1, 0, 101 );
               szClassification = sb_szClassification.toString( );}
               //:zSearchAndReplace( szCombinedName, 512, szUsageType, szClassification )
               {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                               zSearchAndReplace( sb_szCombinedName, 512, szUsageType, szClassification );
               szCombinedName = sb_szCombinedName.toString( );}
               RESULT = SetCursorNextEntity( mMasLC2, "M_InsertTextKeywordUsage", "" );
            } 

            //:END
            //:DropView( mMasLC2 )
            DropView( mMasLC2 );
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szCombinedName );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dMarketUsgNameFootnote( VIEW mMasLC BASED ON LOD mMasLC,
//:                        STRING ( 32 ) InternalEntityStructure,
//:                        STRING ( 32 ) InternalAttribStructure,
//:                        SHORT GetOrSetFlag )

//:   VIEW mMasLC2 BASED ON LOD mMasLC
public int 
omMasLC_dMarketUsgNameFootnote( View     mMasLC,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   zVIEW    mMasLC2 = new zVIEW( );
   //:STRING ( 32 )  szEntityName
   String   szEntityName = null;
   //:STRING ( 100 ) szUsageType
   String   szUsageType = null;
   //:STRING ( 100 ) szClassification
   String   szClassification = null;
   //:STRING ( 512 ) szCombinedName
   String   szCombinedName = null;
   //:STRING ( 32 )  szFootnoteNumber
   String   szFootnoteNumber = null;
   //:INTEGER        Count
   int      Count = 0;
   int      lTempInteger_0 = 0;
   int      RESULT = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_5 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_6 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Combine the Footnote Number as a subscript to the Claim Name, if it exists.
         //:GetEntityNameFromStructure( InternalEntityStructure, szEntityName )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szUsageType, mMasLC, szEntityName, "UsageType" )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttribute( sb_szUsageType, mMasLC, szEntityName, "UsageType" );
         szUsageType = sb_szUsageType.toString( );}
         //:GetStringFromAttribute( szClassification, mMasLC, szEntityName, "ClaimsClassification" )
         {StringBuilder sb_szClassification;
         if ( szClassification == null )
            sb_szClassification = new StringBuilder( 32 );
         else
            sb_szClassification = new StringBuilder( szClassification );
                   GetStringFromAttribute( sb_szClassification, mMasLC, szEntityName, "ClaimsClassification" );
         szClassification = sb_szClassification.toString( );}
         //:GetStringFromAttribute( szCombinedName, mMasLC, szEntityName, "Name" )
         {StringBuilder sb_szCombinedName;
         if ( szCombinedName == null )
            sb_szCombinedName = new StringBuilder( 32 );
         else
            sb_szCombinedName = new StringBuilder( szCombinedName );
                   GetStringFromAttribute( sb_szCombinedName, mMasLC, szEntityName, "Name" );
         szCombinedName = sb_szCombinedName.toString( );}

         //:// Set Footnote Number, if footnote exists.
         //:IF mMasLC.M_UsageFootnoteUsed EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_UsageFootnoteUsed" );
         if ( lTempInteger_0 == 0 )
         { 
            //:IF mMasLC.M_UsageFootnoteUsed.ID != ""
            if ( CompareAttributeToString( mMasLC, "M_UsageFootnoteUsed", "ID", "" ) != 0 )
            { 
               //:SET CURSOR FIRST mMasLC.M_UsageFootnote WHERE mMasLC.M_UsageFootnote.ID = mMasLC.M_UsageFootnoteMarketUsed.ID
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, mMasLC, "M_UsageFootnoteMarketUsed", "ID" );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_UsageFootnote", "ID", lTempInteger_1, "" );
               //:IF mMasLC.M_UsageFootnote.wFootNoteRelativeNumber = ""
               if ( CompareAttributeToString( mMasLC, "M_UsageFootnote", "wFootNoteRelativeNumber", "" ) == 0 )
               { 
                  //:// Relative numbers haven't been set, so set them here.
                  //:CreateViewFromView( mMasLC2, mMasLC )
                  CreateViewFromView( mMasLC2, mMasLC );
                  //:Count = 0
                  Count = 0;
                  //:FOR EACH mMasLC2.M_UsageFootnote
                  RESULT = SetCursorFirstEntity( mMasLC2, "M_UsageFootnote", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:Count = Count + 1
                     Count = Count + 1;
                     //:mMasLC2.M_UsageFootnote.wFootNoteRelativeNumber = Count
                     SetAttributeFromInteger( mMasLC2, "M_UsageFootnote", "wFootNoteRelativeNumber", Count );
                     RESULT = SetCursorNextEntity( mMasLC2, "M_UsageFootnote", "" );
                  } 

                  //:END
                  //:DropView( mMasLC2 )
                  DropView( mMasLC2 );
               } 

               //:END
               //:szFootnoteNumber = mMasLC.M_UsageFootnote.Symbol
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szFootnoteNumber;
               if ( szFootnoteNumber == null )
                  sb_szFootnoteNumber = new StringBuilder( 32 );
               else
                  sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                               GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_2, 'S', 33, mMasLC, "M_UsageFootnote", "Symbol", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               //:IF szFootnoteNumber = ""
               if ( ZeidonStringCompare( szFootnoteNumber, 1, 0, "", 1, 0, 33 ) == 0 )
               { 
                  //:szFootnoteNumber = mMasLC.M_UsageFootnote.wFootNoteRelativeNumber
                  {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                  StringBuilder sb_szFootnoteNumber;
                  if ( szFootnoteNumber == null )
                     sb_szFootnoteNumber = new StringBuilder( 32 );
                  else
                     sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                                     GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_3, 'S', 33, mMasLC, "M_UsageFootnote", "wFootNoteRelativeNumber", "", 0 );
                  lTempInteger_3 = mi_lTempInteger_3.intValue( );
                  szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               } 

               //:END
               //:szCombinedName = szCombinedName + "<sup> " + szFootnoteNumber + "</sup>"
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, "<sup> ", 1, 0, 513 );
               szCombinedName = sb_szCombinedName.toString( );}
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, szFootnoteNumber, 1, 0, 513 );
               szCombinedName = sb_szCombinedName.toString( );}
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, "</sup>", 1, 0, 513 );
               szCombinedName = sb_szCombinedName.toString( );}
            } 

            //:END
         } 

         //:END
         //:IF mMasLC.M_InsertTextKeywordMarketUsage EXISTS
         lTempInteger_4 = CheckExistenceOfEntity( mMasLC, "M_InsertTextKeywordMarketUsage" );
         if ( lTempInteger_4 == 0 )
         { 
            //:CreateViewFromView( mMasLC2, mMasLC )
            CreateViewFromView( mMasLC2, mMasLC );
            //:FOR EACH mMasLC2.M_InsertTextKeywordMarketUsage
            RESULT = SetCursorFirstEntity( mMasLC2, "M_InsertTextKeywordMarketUsage", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:// Reuse (borrow) szUsageType and szClassification
               //:szUsageType = "{" + mMasLC2.M_InsertTextKeywordMarketUsage.Name + "}"
               {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_5, 'S', 255, mMasLC2, "M_InsertTextKeywordMarketUsage", "Name", "", 0 );
               lTempInteger_5 = mi_lTempInteger_5.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szUsageType;
               if ( szUsageType == null )
                  sb_szUsageType = new StringBuilder( 32 );
               else
                  sb_szUsageType = new StringBuilder( szUsageType );
                              ZeidonStringCopy( sb_szUsageType, 1, 0, "{", 1, 0, 101 );
               szUsageType = sb_szUsageType.toString( );}
                {StringBuilder sb_szUsageType;
               if ( szUsageType == null )
                  sb_szUsageType = new StringBuilder( 32 );
               else
                  sb_szUsageType = new StringBuilder( szUsageType );
                              ZeidonStringConcat( sb_szUsageType, 1, 0, szTempString_0, 1, 0, 101 );
               szUsageType = sb_szUsageType.toString( );}
                {StringBuilder sb_szUsageType;
               if ( szUsageType == null )
                  sb_szUsageType = new StringBuilder( 32 );
               else
                  sb_szUsageType = new StringBuilder( szUsageType );
                              ZeidonStringConcat( sb_szUsageType, 1, 0, "}", 1, 0, 101 );
               szUsageType = sb_szUsageType.toString( );}
               //:szClassification = "<b>" + mMasLC2.M_InsertTextMarketUsage.Text + "</b>"
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
               StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                               GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_6, 'S', 4097, mMasLC2, "M_InsertTextMarketUsage", "Text", "", 0 );
               lTempInteger_6 = mi_lTempInteger_6.intValue( );
               szTempString_1 = sb_szTempString_1.toString( );}
                {StringBuilder sb_szClassification;
               if ( szClassification == null )
                  sb_szClassification = new StringBuilder( 32 );
               else
                  sb_szClassification = new StringBuilder( szClassification );
                              ZeidonStringCopy( sb_szClassification, 1, 0, "<b>", 1, 0, 101 );
               szClassification = sb_szClassification.toString( );}
                {StringBuilder sb_szClassification;
               if ( szClassification == null )
                  sb_szClassification = new StringBuilder( 32 );
               else
                  sb_szClassification = new StringBuilder( szClassification );
                              ZeidonStringConcat( sb_szClassification, 1, 0, szTempString_1, 1, 0, 101 );
               szClassification = sb_szClassification.toString( );}
                {StringBuilder sb_szClassification;
               if ( szClassification == null )
                  sb_szClassification = new StringBuilder( 32 );
               else
                  sb_szClassification = new StringBuilder( szClassification );
                              ZeidonStringConcat( sb_szClassification, 1, 0, "</b>", 1, 0, 101 );
               szClassification = sb_szClassification.toString( );}
               //:zSearchAndReplace( szCombinedName, 512, szUsageType, szClassification )
               {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                               zSearchAndReplace( sb_szCombinedName, 512, szUsageType, szClassification );
               szCombinedName = sb_szCombinedName.toString( );}
               RESULT = SetCursorNextEntity( mMasLC2, "M_InsertTextKeywordMarketUsage", "" );
            } 

            //:END
            //:DropView( mMasLC2 )
            DropView( mMasLC2 );
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szCombinedName );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dGenStmtTitleText( VIEW mMasLC BASED ON LOD mMasLC,
//:                   STRING ( 32 ) InternalEntityStructure,
//:                   STRING ( 32 ) InternalAttribStructure,
//:                   SHORT GetOrSetFlag )

//:   VIEW mMasLC2 BASED ON LOD mMasLC
public int 
omMasLC_dGenStmtTitleText( View     mMasLC,
                           String InternalEntityStructure,
                           String InternalAttribStructure,
                           Integer   GetOrSetFlag )
{
   zVIEW    mMasLC2 = new zVIEW( );
   //:STRING ( 2048 ) szCombinedText
   String   szCombinedText = null;
   String   szTempString_0 = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_2 = 0;
   String   szTempString_2 = null;
   int      lTempInteger_3 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// If Combined and a Title exists, concatenate Title and Text.  Otherwise, just show text.
         //:// Bold Title and Text as specified.
         //:IF mMasLC.M_GeneralSection.Combined = "Y" AND mMasLC.M_GeneralStatement.Title != ""
         if ( CompareAttributeToString( mMasLC, "M_GeneralSection", "Combined", "Y" ) == 0 && CompareAttributeToString( mMasLC, "M_GeneralStatement", "Title", "" ) != 0 )
         { 
            //:IF mMasLC.M_GeneralSection.BoldTitle = "Y"
            if ( CompareAttributeToString( mMasLC, "M_GeneralSection", "BoldTitle", "Y" ) == 0 )
            { 
               //:szCombinedText = "<b>" + mMasLC.M_GeneralStatement.Title + "</b>"
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_0, 'S', 4097, mMasLC, "M_GeneralStatement", "Title", "", 0 );
               lTempInteger_0 = mi_lTempInteger_0.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szCombinedText;
               if ( szCombinedText == null )
                  sb_szCombinedText = new StringBuilder( 32 );
               else
                  sb_szCombinedText = new StringBuilder( szCombinedText );
                              ZeidonStringCopy( sb_szCombinedText, 1, 0, "<b>", 1, 0, 2049 );
               szCombinedText = sb_szCombinedText.toString( );}
                {StringBuilder sb_szCombinedText;
               if ( szCombinedText == null )
                  sb_szCombinedText = new StringBuilder( 32 );
               else
                  sb_szCombinedText = new StringBuilder( szCombinedText );
                              ZeidonStringConcat( sb_szCombinedText, 1, 0, szTempString_0, 1, 0, 2049 );
               szCombinedText = sb_szCombinedText.toString( );}
                {StringBuilder sb_szCombinedText;
               if ( szCombinedText == null )
                  sb_szCombinedText = new StringBuilder( 32 );
               else
                  sb_szCombinedText = new StringBuilder( szCombinedText );
                              ZeidonStringConcat( sb_szCombinedText, 1, 0, "</b>", 1, 0, 2049 );
               szCombinedText = sb_szCombinedText.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szCombinedText = mMasLC.M_GeneralStatement.Title
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
               StringBuilder sb_szCombinedText;
               if ( szCombinedText == null )
                  sb_szCombinedText = new StringBuilder( 32 );
               else
                  sb_szCombinedText = new StringBuilder( szCombinedText );
                               GetVariableFromAttribute( sb_szCombinedText, mi_lTempInteger_1, 'S', 2049, mMasLC, "M_GeneralStatement", "Title", "", 0 );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );
               szCombinedText = sb_szCombinedText.toString( );}
            } 

            //:END
         } 

         //:END
         //:IF mMasLC.M_GeneralSection.BoldText = "Y"
         if ( CompareAttributeToString( mMasLC, "M_GeneralSection", "BoldText", "Y" ) == 0 )
         { 
            //:szCombinedText = szCombinedText + "<b> " + mMasLC.M_GeneralStatement.Text + "</b>"
             {StringBuilder sb_szCombinedText;
            if ( szCombinedText == null )
               sb_szCombinedText = new StringBuilder( 32 );
            else
               sb_szCombinedText = new StringBuilder( szCombinedText );
                        ZeidonStringConcat( sb_szCombinedText, 1, 0, "<b> ", 1, 0, 2049 );
            szCombinedText = sb_szCombinedText.toString( );}
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
            StringBuilder sb_szTempString_1;
            if ( szTempString_1 == null )
               sb_szTempString_1 = new StringBuilder( 32 );
            else
               sb_szTempString_1 = new StringBuilder( szTempString_1 );
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_2, 'S', 4097, mMasLC, "M_GeneralStatement", "Text", "", 0 );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );
            szTempString_1 = sb_szTempString_1.toString( );}
             {StringBuilder sb_szCombinedText;
            if ( szCombinedText == null )
               sb_szCombinedText = new StringBuilder( 32 );
            else
               sb_szCombinedText = new StringBuilder( szCombinedText );
                        ZeidonStringConcat( sb_szCombinedText, 1, 0, szTempString_1, 1, 0, 2049 );
            szCombinedText = sb_szCombinedText.toString( );}
             {StringBuilder sb_szCombinedText;
            if ( szCombinedText == null )
               sb_szCombinedText = new StringBuilder( 32 );
            else
               sb_szCombinedText = new StringBuilder( szCombinedText );
                        ZeidonStringConcat( sb_szCombinedText, 1, 0, "</b>", 1, 0, 2049 );
            szCombinedText = sb_szCombinedText.toString( );}
            //:ELSE
         } 
         else
         { 
            //:szCombinedText = szCombinedText + " " + mMasLC.M_GeneralStatement.Text
             {StringBuilder sb_szCombinedText;
            if ( szCombinedText == null )
               sb_szCombinedText = new StringBuilder( 32 );
            else
               sb_szCombinedText = new StringBuilder( szCombinedText );
                        ZeidonStringConcat( sb_szCombinedText, 1, 0, " ", 1, 0, 2049 );
            szCombinedText = sb_szCombinedText.toString( );}
            {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
            StringBuilder sb_szTempString_2;
            if ( szTempString_2 == null )
               sb_szTempString_2 = new StringBuilder( 32 );
            else
               sb_szTempString_2 = new StringBuilder( szTempString_2 );
                         GetVariableFromAttribute( sb_szTempString_2, mi_lTempInteger_3, 'S', 4097, mMasLC, "M_GeneralStatement", "Text", "", 0 );
            lTempInteger_3 = mi_lTempInteger_3.intValue( );
            szTempString_2 = sb_szTempString_2.toString( );}
             {StringBuilder sb_szCombinedText;
            if ( szCombinedText == null )
               sb_szCombinedText = new StringBuilder( 32 );
            else
               sb_szCombinedText = new StringBuilder( szCombinedText );
                        ZeidonStringConcat( sb_szCombinedText, 1, 0, szTempString_2, 1, 0, 2049 );
            szCombinedText = sb_szCombinedText.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szCombinedText )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szCombinedText );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dUsgPathogenOrFullName( VIEW mMasLC BASED ON LOD mMasLC,
//:                        STRING ( 32 ) InternalEntityStructure,
//:                        STRING ( 32 ) InternalAttribStructure,
//:                        SHORT GetOrSetFlag )

//:   STRING ( 32 )  szEntityName
public int 
omMasLC_dUsgPathogenOrFullName( View     mMasLC,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   String   szEntityName = null;
   //:STRING ( 100 ) szUsageType
   String   szUsageType = null;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Combine the Footnote Number as a subscript to the Claim Name, if it exists.
         //:GetEntityNameFromStructure( InternalEntityStructure, szEntityName )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szUsageType, mMasLC, szEntityName, "UsageType" )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttribute( sb_szUsageType, mMasLC, szEntityName, "UsageType" );
         szUsageType = sb_szUsageType.toString( );}
         //:IF szUsageType = "C"
         if ( ZeidonStringCompare( szUsageType, 1, 0, "C", 1, 0, 101 ) == 0 )
         { 
            //:dPathogenNameKeyFoot( mMasLC, InternalEntityStructure, InternalAttribStructure, GetOrSetFlag )
            omMasLC_dPathogenNameKeyFoot( mMasLC, InternalEntityStructure, InternalAttribStructure, GetOrSetFlag );
            //:ELSE
         } 
         else
         { 
            //:dUsgFullEmbeddedName( mMasLC, InternalEntityStructure, InternalAttribStructure, GetOrSetFlag )
            omMasLC_dUsgFullEmbeddedName( mMasLC, InternalEntityStructure, InternalAttribStructure, GetOrSetFlag );
         } 

         //:END
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dMarketingKeywordText( VIEW mMasLC BASED ON LOD mMasLC,
//:                       STRING ( 32 ) InternalEntityStructure,
//:                       STRING ( 32 ) InternalAttribStructure,
//:                       SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szKeyValue
public int 
omMasLC_dMarketingKeywordText( View     mMasLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   String   szKeyValue = null;
   int      RESULT = 0;
   String   szTempString_0 = null;
   int      lTempInteger_0 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Concatenate all the Keyword values for a Marketing Keyword entry.
         //:szKeyValue = ""
          {StringBuilder sb_szKeyValue;
         if ( szKeyValue == null )
            sb_szKeyValue = new StringBuilder( 32 );
         else
            sb_szKeyValue = new StringBuilder( szKeyValue );
                  ZeidonStringCopy( sb_szKeyValue, 1, 0, "", 1, 0, 2049 );
         szKeyValue = sb_szKeyValue.toString( );}
         //:FOR EACH mMasLC.M_InsertTextMarketing
         RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextMarketing", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF szKeyValue = ""
            if ( ZeidonStringCompare( szKeyValue, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szKeyValue = "<b>" + mMasLC.M_InsertTextMarketing.Text
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_0, 'S', 4097, mMasLC, "M_InsertTextMarketing", "Text", "", 0 );
               lTempInteger_0 = mi_lTempInteger_0.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szKeyValue;
               if ( szKeyValue == null )
                  sb_szKeyValue = new StringBuilder( 32 );
               else
                  sb_szKeyValue = new StringBuilder( szKeyValue );
                              ZeidonStringCopy( sb_szKeyValue, 1, 0, "<b>", 1, 0, 2049 );
               szKeyValue = sb_szKeyValue.toString( );}
                {StringBuilder sb_szKeyValue;
               if ( szKeyValue == null )
                  sb_szKeyValue = new StringBuilder( 32 );
               else
                  sb_szKeyValue = new StringBuilder( szKeyValue );
                              ZeidonStringConcat( sb_szKeyValue, 1, 0, szTempString_0, 1, 0, 2049 );
               szKeyValue = sb_szKeyValue.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szKeyValue = szKeyValue + ", " + mMasLC.M_InsertTextMarketing.Text
                {StringBuilder sb_szKeyValue;
               if ( szKeyValue == null )
                  sb_szKeyValue = new StringBuilder( 32 );
               else
                  sb_szKeyValue = new StringBuilder( szKeyValue );
                              ZeidonStringConcat( sb_szKeyValue, 1, 0, ", ", 1, 0, 2049 );
               szKeyValue = sb_szKeyValue.toString( );}
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
               StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                               GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_1, 'S', 4097, mMasLC, "M_InsertTextMarketing", "Text", "", 0 );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );
               szTempString_1 = sb_szTempString_1.toString( );}
                {StringBuilder sb_szKeyValue;
               if ( szKeyValue == null )
                  sb_szKeyValue = new StringBuilder( 32 );
               else
                  sb_szKeyValue = new StringBuilder( szKeyValue );
                              ZeidonStringConcat( sb_szKeyValue, 1, 0, szTempString_1, 1, 0, 2049 );
               szKeyValue = sb_szKeyValue.toString( );}
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextMarketing", "" );
            //:END
         } 

         //:END
         //:IF szKeyValue != ""
         if ( ZeidonStringCompare( szKeyValue, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:szKeyValue = szKeyValue  + "</b>"
             {StringBuilder sb_szKeyValue;
            if ( szKeyValue == null )
               sb_szKeyValue = new StringBuilder( 32 );
            else
               sb_szKeyValue = new StringBuilder( szKeyValue );
                        ZeidonStringConcat( sb_szKeyValue, 1, 0, "</b>", 1, 0, 2049 );
            szKeyValue = sb_szKeyValue.toString( );}
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szKeyValue )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szKeyValue );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dMarketingTitleKeyword( VIEW mMasLC BASED ON LOD mMasLC,
   //:                     STRING ( 32 ) InternalEntityStructure,
   //:                     STRING ( 32 ) InternalAttribStructure,
   //:                     SHORT GetOrSetFlag )

   //:STRING ( 32 )  szEntityName
public int 
omMasLC_dMarketingTitleKeyword( View     mMasLC,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   String   szEntityName = null;
   //:STRING ( 2048 ) szDisplayStatement
   String   szDisplayStatement = null;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// For a Marketing Statement entity, this is the combined name of Text and any keyword(s).
         //:GetEntityNameFromStructure( InternalEntityStructure, szEntityName )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szDisplayStatement, mMasLC, szEntityName, "Title" )
         {StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetStringFromAttribute( sb_szDisplayStatement, mMasLC, szEntityName, "Title" );
         szDisplayStatement = sb_szDisplayStatement.toString( );}

         //:IF szDisplayStatement != ""
         if ( ZeidonStringCompare( szDisplayStatement, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szDisplayStatement,
            //:                            "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szDisplayStatement, "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", ", " );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dMarketingTextKeyword( VIEW mMasLC BASED ON LOD mMasLC,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 32 )  szEntityName
public int 
omMasLC_dMarketingTextKeyword( View     mMasLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   String   szEntityName = null;
   //:STRING ( 2048 ) szDisplayStatement
   String   szDisplayStatement = null;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// For a Marketing Statement entity, this is the combined name of Text and any keyword(s).
         //:GetEntityNameFromStructure( InternalEntityStructure, szEntityName )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szDisplayStatement, mMasLC, szEntityName, "Text" )
         {StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetStringFromAttribute( sb_szDisplayStatement, mMasLC, szEntityName, "Text" );
         szDisplayStatement = sb_szDisplayStatement.toString( );}

         //:IF szDisplayStatement != ""
         if ( ZeidonStringCompare( szDisplayStatement, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szDisplayStatement,
            //:                            "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szDisplayStatement, "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", ", " );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dDU_KeywordText( VIEW mMasLC BASED ON LOD mMasLC,
   //:              STRING ( 32 ) InternalEntityStructure,
   //:              STRING ( 32 ) InternalAttribStructure,
   //:              SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szKeyValue
public int 
omMasLC_dDU_KeywordText( View     mMasLC,
                         String InternalEntityStructure,
                         String InternalAttribStructure,
                         Integer   GetOrSetFlag )
{
   String   szKeyValue = null;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Concatenate all the Keyword values for a Directions For Use Keyword entry.
         //:szKeyValue = ""
          {StringBuilder sb_szKeyValue;
         if ( szKeyValue == null )
            sb_szKeyValue = new StringBuilder( 32 );
         else
            sb_szKeyValue = new StringBuilder( szKeyValue );
                  ZeidonStringCopy( sb_szKeyValue, 1, 0, "", 1, 0, 2049 );
         szKeyValue = sb_szKeyValue.toString( );}
         //:FOR EACH mMasLC.M_InsertTextDU
         RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextDU", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF szKeyValue = ""
            if ( ZeidonStringCompare( szKeyValue, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szKeyValue = mMasLC.M_InsertTextDU.Text
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szKeyValue;
               if ( szKeyValue == null )
                  sb_szKeyValue = new StringBuilder( 32 );
               else
                  sb_szKeyValue = new StringBuilder( szKeyValue );
                               GetVariableFromAttribute( sb_szKeyValue, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_InsertTextDU", "Text", "", 0 );
               lTempInteger_0 = mi_lTempInteger_0.intValue( );
               szKeyValue = sb_szKeyValue.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szKeyValue = szKeyValue + ", " + mMasLC.M_InsertTextDU.Text
                {StringBuilder sb_szKeyValue;
               if ( szKeyValue == null )
                  sb_szKeyValue = new StringBuilder( 32 );
               else
                  sb_szKeyValue = new StringBuilder( szKeyValue );
                              ZeidonStringConcat( sb_szKeyValue, 1, 0, ", ", 1, 0, 2049 );
               szKeyValue = sb_szKeyValue.toString( );}
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 4097, mMasLC, "M_InsertTextDU", "Text", "", 0 );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szKeyValue;
               if ( szKeyValue == null )
                  sb_szKeyValue = new StringBuilder( 32 );
               else
                  sb_szKeyValue = new StringBuilder( szKeyValue );
                              ZeidonStringConcat( sb_szKeyValue, 1, 0, szTempString_0, 1, 0, 2049 );
               szKeyValue = sb_szKeyValue.toString( );}
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextDU", "" );
            //:END
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szKeyValue )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szKeyValue );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dSD_KeywordText( VIEW mMasLC BASED ON LOD mMasLC,
   //:              STRING ( 32 ) InternalEntityStructure,
   //:              STRING ( 32 ) InternalAttribStructure,
   //:              SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szGeneratedString
public int 
omMasLC_dSD_KeywordText( View     mMasLC,
                         String InternalEntityStructure,
                         String InternalAttribStructure,
                         Integer   GetOrSetFlag )
{
   String   szGeneratedString = null;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Concatenate all the Keyword values for a Storage & Disposal Keyword entry.
         //:szGeneratedString = ""
          {StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                  ZeidonStringCopy( sb_szGeneratedString, 1, 0, "", 1, 0, 2049 );
         szGeneratedString = sb_szGeneratedString.toString( );}
         //:FOR EACH mMasLC.M_InsertTextSD
         RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextSD", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF szGeneratedString = ""
            if ( ZeidonStringCompare( szGeneratedString, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szGeneratedString = mMasLC.M_InsertTextSD.Text
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szGeneratedString;
               if ( szGeneratedString == null )
                  sb_szGeneratedString = new StringBuilder( 32 );
               else
                  sb_szGeneratedString = new StringBuilder( szGeneratedString );
                               GetVariableFromAttribute( sb_szGeneratedString, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_InsertTextSD", "Text", "", 0 );
               lTempInteger_0 = mi_lTempInteger_0.intValue( );
               szGeneratedString = sb_szGeneratedString.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szGeneratedString = szGeneratedString + ", " + mMasLC.M_InsertTextSD.Text
                {StringBuilder sb_szGeneratedString;
               if ( szGeneratedString == null )
                  sb_szGeneratedString = new StringBuilder( 32 );
               else
                  sb_szGeneratedString = new StringBuilder( szGeneratedString );
                              ZeidonStringConcat( sb_szGeneratedString, 1, 0, ", ", 1, 0, 2049 );
               szGeneratedString = sb_szGeneratedString.toString( );}
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 4097, mMasLC, "M_InsertTextSD", "Text", "", 0 );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szGeneratedString;
               if ( szGeneratedString == null )
                  sb_szGeneratedString = new StringBuilder( 32 );
               else
                  sb_szGeneratedString = new StringBuilder( szGeneratedString );
                              ZeidonStringConcat( sb_szGeneratedString, 1, 0, szTempString_0, 1, 0, 2049 );
               szGeneratedString = sb_szGeneratedString.toString( );}
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextSD", "" );
            //:END
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dGeneralKeywordText( VIEW mMasLC BASED ON LOD mMasLC,
   //:                  STRING ( 32 ) InternalEntityStructure,
   //:                  STRING ( 32 ) InternalAttribStructure,
   //:                  SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szGeneratedString
public int 
omMasLC_dGeneralKeywordText( View     mMasLC,
                             String InternalEntityStructure,
                             String InternalAttribStructure,
                             Integer   GetOrSetFlag )
{
   String   szGeneratedString = null;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Concatenate all the Keyword values for a Marketing Keyword entry.
         //:szGeneratedString = ""
          {StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                  ZeidonStringCopy( sb_szGeneratedString, 1, 0, "", 1, 0, 2049 );
         szGeneratedString = sb_szGeneratedString.toString( );}
         //:FOR EACH mMasLC.M_InsertTextGeneral
         RESULT = SetCursorFirstEntity( mMasLC, "M_InsertTextGeneral", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF szGeneratedString = ""
            if ( ZeidonStringCompare( szGeneratedString, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szGeneratedString = mMasLC.M_InsertTextGeneral.Text
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szGeneratedString;
               if ( szGeneratedString == null )
                  sb_szGeneratedString = new StringBuilder( 32 );
               else
                  sb_szGeneratedString = new StringBuilder( szGeneratedString );
                               GetVariableFromAttribute( sb_szGeneratedString, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_InsertTextGeneral", "Text", "", 0 );
               lTempInteger_0 = mi_lTempInteger_0.intValue( );
               szGeneratedString = sb_szGeneratedString.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szGeneratedString = szGeneratedString + ", " + mMasLC.M_InsertTextGeneral.Text
                {StringBuilder sb_szGeneratedString;
               if ( szGeneratedString == null )
                  sb_szGeneratedString = new StringBuilder( 32 );
               else
                  sb_szGeneratedString = new StringBuilder( szGeneratedString );
                              ZeidonStringConcat( sb_szGeneratedString, 1, 0, ", ", 1, 0, 2049 );
               szGeneratedString = sb_szGeneratedString.toString( );}
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 4097, mMasLC, "M_InsertTextGeneral", "Text", "", 0 );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szGeneratedString;
               if ( szGeneratedString == null )
                  sb_szGeneratedString = new StringBuilder( 32 );
               else
                  sb_szGeneratedString = new StringBuilder( szGeneratedString );
                              ZeidonStringConcat( sb_szGeneratedString, 1, 0, szTempString_0, 1, 0, 2049 );
               szGeneratedString = sb_szGeneratedString.toString( );}
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_InsertTextGeneral", "" );
            //:END
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dMarketTitleTextKey( VIEW mMasLC BASED ON LOD mMasLC,
   //:                  STRING ( 32 ) InternalEntityStructure,
   //:                  STRING ( 32 ) InternalAttribStructure,
   //:                  SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szTitle
public int 
omMasLC_dMarketTitleTextKey( View     mMasLC,
                             String InternalEntityStructure,
                             String InternalAttribStructure,
                             Integer   GetOrSetFlag )
{
   String   szTitle = null;
   //:STRING ( 2048 ) szText
   String   szText = null;
   //:STRING ( 2048 ) szDisplayStatement
   String   szDisplayStatement = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Concatenate a string combining Title and Text, with Title made bold.
         //:// Keyword substitutions are incorporated.
         //:szTitle = mMasLC.M_MarketingStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szTitle;
         if ( szTitle == null )
            sb_szTitle = new StringBuilder( 32 );
         else
            sb_szTitle = new StringBuilder( szTitle );
                   GetVariableFromAttribute( sb_szTitle, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_MarketingStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szTitle = sb_szTitle.toString( );}
         //:szText = mMasLC.M_MarketingStatement.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szText;
         if ( szText == null )
            sb_szText = new StringBuilder( 32 );
         else
            sb_szText = new StringBuilder( szText );
                   GetVariableFromAttribute( sb_szText, mi_lTempInteger_1, 'S', 2049, mMasLC, "M_MarketingStatement", "Text", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szText = sb_szText.toString( );}

         //:IF szTitle != ""
         if ( ZeidonStringCompare( szTitle, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szTitle,
            //:                            "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szTitle;
            if ( szTitle == null )
               sb_szTitle = new StringBuilder( 32 );
            else
               sb_szTitle = new StringBuilder( szTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szTitle, "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", ", " );
            szTitle = sb_szTitle.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
            //:szDisplayStatement = "<b>" + szTitle + "</b>"
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, "<b>", 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringConcat( sb_szDisplayStatement, 1, 0, szTitle, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringConcat( sb_szDisplayStatement, 1, 0, "</b>", 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END
         //:IF szText != ""
         if ( ZeidonStringCompare( szText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szText,
            //:                            "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szText;
            if ( szText == null )
               sb_szText = new StringBuilder( 32 );
            else
               sb_szText = new StringBuilder( szText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szText, "M_InsertTextKeywordMarketing", "M_InsertTextMarketing", ", " );
            szText = sb_szText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
            //:szDisplayStatement = szDisplayStatement + "  " + szText
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringConcat( sb_szDisplayStatement, 1, 0, "  ", 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringConcat( sb_szDisplayStatement, 1, 0, szText, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dSubUsageCombinedText( VIEW mMasLC BASED ON LOD mMasLC,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szCombinedText
public int 
omMasLC_dSubUsageCombinedText( View     mMasLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   String   szCombinedText = null;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Expand the current Text attribute by replacing embedded Keywords with the Keyword
         //:// values in the M_InsertTextMarketing subentities.
         //:szCombinedText = ""
          {StringBuilder sb_szCombinedText;
         if ( szCombinedText == null )
            sb_szCombinedText = new StringBuilder( 32 );
         else
            sb_szCombinedText = new StringBuilder( szCombinedText );
                  ZeidonStringCopy( sb_szCombinedText, 1, 0, "", 1, 0, 2049 );
         szCombinedText = sb_szCombinedText.toString( );}
         //:FOR EACH mMasLC.M_UsageGroupUsage
         RESULT = SetCursorFirstEntity( mMasLC, "M_UsageGroupUsage", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF szCombinedText = ""
            if ( ZeidonStringCompare( szCombinedText, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szCombinedText = mMasLC.M_UsageGroupUsage.Name
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szCombinedText;
               if ( szCombinedText == null )
                  sb_szCombinedText = new StringBuilder( 32 );
               else
                  sb_szCombinedText = new StringBuilder( szCombinedText );
                               GetVariableFromAttribute( sb_szCombinedText, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_UsageGroupUsage", "Name", "", 0 );
               lTempInteger_0 = mi_lTempInteger_0.intValue( );
               szCombinedText = sb_szCombinedText.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szCombinedText = szCombinedText + ", " + mMasLC.M_UsageGroupUsage.Name
                {StringBuilder sb_szCombinedText;
               if ( szCombinedText == null )
                  sb_szCombinedText = new StringBuilder( 32 );
               else
                  sb_szCombinedText = new StringBuilder( szCombinedText );
                              ZeidonStringConcat( sb_szCombinedText, 1, 0, ", ", 1, 0, 2049 );
               szCombinedText = sb_szCombinedText.toString( );}
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 4097, mMasLC, "M_UsageGroupUsage", "Name", "", 0 );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szCombinedText;
               if ( szCombinedText == null )
                  sb_szCombinedText = new StringBuilder( 32 );
               else
                  sb_szCombinedText = new StringBuilder( szCombinedText );
                              ZeidonStringConcat( sb_szCombinedText, 1, 0, szTempString_0, 1, 0, 2049 );
               szCombinedText = sb_szCombinedText.toString( );}
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_UsageGroupUsage", "" );
            //:END
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szCombinedText )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szCombinedText );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:TRANSFORMATION OPERATION
public int 
omMasLC_BuildUsageGroupEntries( View     mMasLC )
{
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   //:BuildUsageGroupEntries( VIEW mMasLC BASED ON LOD mMasLC )

   //:// Build Usage Group Usages.
   //:// We treat M_UsageGroupUsage as a derived relationship, because we had JOE problems when we
   //:// updated the same entity down two separate paths.
   //:FOR EACH mMasLC.M_UsageType
   RESULT = SetCursorFirstEntity( mMasLC, "M_UsageType", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:FOR EACH mMasLC.M_UsageGroup
      RESULT = SetCursorFirstEntity( mMasLC, "M_UsageGroup", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:FOR EACH mMasLC.M_UsageGroupUsage
         RESULT = SetCursorFirstEntity( mMasLC, "M_UsageGroupUsage", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:EXCLUDE mMasLC.M_UsageGroupUsage NONE
            RESULT = ExcludeEntity( mMasLC, "M_UsageGroupUsage", zREPOS_NONE );
            RESULT = SetCursorNextEntity( mMasLC, "M_UsageGroupUsage", "" );
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_UsageGroup", "" );
         //:END
      } 

      //:END
      //:FOR EACH mMasLC.M_Usage
      RESULT = SetCursorFirstEntity( mMasLC, "M_Usage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mMasLC.M_UsageUsageGroup EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_UsageUsageGroup" );
         if ( lTempInteger_0 == 0 )
         { 
            //:SET CURSOR FIRST mMasLC.M_UsageGroup
            //:           WHERE mMasLC.M_UsageGroup.ID = mMasLC.M_UsageUsageGroup.ID
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                         GetIntegerFromAttribute( mi_lTempInteger_1, mMasLC, "M_UsageUsageGroup", "ID" );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_UsageGroup", "ID", lTempInteger_1, "" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:INCLUDE mMasLC.M_UsageGroupUsage FROM mMasLC.M_Usage
               RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_UsageGroupUsage", mMasLC, "M_Usage", zPOS_AFTER );
            } 

            //:END
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_Usage", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_UsageType", "" );
      //:END
   } 

   //:END

   //:// Sort everything by Name.
   //:FOR EACH mMasLC.M_UsageType
   RESULT = SetCursorFirstEntity( mMasLC, "M_UsageType", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:FOR EACH mMasLC.M_UsageGroup
      RESULT = SetCursorFirstEntity( mMasLC, "M_UsageGroup", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:OrderEntityForView( mMasLC, "M_UsageGroupUsage", "Name A" )
         OrderEntityForView( mMasLC, "M_UsageGroupUsage", "Name A" );
         RESULT = SetCursorNextEntity( mMasLC, "M_UsageGroup", "" );
      } 

      //:END
      //:OrderEntityForView( mMasLC, "M_Usage", "Name A" )
      OrderEntityForView( mMasLC, "M_Usage", "Name A" );
      RESULT = SetCursorNextEntity( mMasLC, "M_UsageType", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:BuildUsageKeyEntries( VIEW mMasLC BASED ON LOD mMasLC,
//:                      STRING ( 32 ) SourceKeywordEntityName,
//:                      STRING ( 32 ) SourceTextEntityName,
//:                      STRING ( 2048 ) TextValue,
//:                      STRING ( 2048 ) TitleValue )

//:   VIEW mMasLC_Root REGISTERED AS mMasLC_Root
public int 
omMasLC_BuildUsageKeyEntries( View     mMasLC,
                              String   SourceKeywordEntityName,
                              String   SourceTextEntityName,
                              String   TextValue,
                              String   TitleValue )
{
   zVIEW    mMasLC_Root = new zVIEW( );
   int      RESULT = 0;
   //:SHORT nRC1
   int      nRC1 = 0;
   //:SHORT nRC2
   int      nRC2 = 0;
   int      lTempInteger_0 = 0;

   RESULT = GetViewByName( mMasLC_Root, "mMasLC_Root", mMasLC, zLEVEL_TASK );

   //:// Build the M_InsertTextKeywordBase subobject based on the entity names passed in.
   //:// If the keyword Type allows only a single keyword value, set the selected flag for the first one.
   //:// Otherwise, set the selected flag for all text entries.

   //:// Then build the actual M_InsertTextKeyword subobject from the selected entries from M_InsertTextKeywordBase.

   //:// Delete any current entries.
   //:IF mMasLC_Root.DisplayKeywordText EXISTS
   lTempInteger_0 = CheckExistenceOfEntity( mMasLC_Root, "DisplayKeywordText" );
   if ( lTempInteger_0 == 0 )
   { 
      //:DELETE ENTITY mMasLC_Root.DisplayKeywordText
      RESULT = DeleteEntity( mMasLC_Root, "DisplayKeywordText", zPOS_NEXT );
   } 

   //:END

   //:// Create Display entity containing Text and optionally Title.
   //:CREATE ENTITY mMasLC_Root.DisplayKeywordText
   RESULT = CreateEntity( mMasLC_Root, "DisplayKeywordText", zPOS_AFTER );
   //:mMasLC_Root.DisplayKeywordText.Text  = TextValue
   SetAttributeFromString( mMasLC_Root, "DisplayKeywordText", "Text", TextValue );
   //:mMasLC_Root.DisplayKeywordText.Title = TitleValue
   SetAttributeFromString( mMasLC_Root, "DisplayKeywordText", "Title", TitleValue );

   //:// Copy over the basic entities.
   //:nRC1 = SetCursorFirstEntity( mMasLC, SourceKeywordEntityName, "" )
   nRC1 = SetCursorFirstEntity( mMasLC, SourceKeywordEntityName, "" );
   //:LOOP WHILE nRC1 >= zCURSOR_SET
   while ( nRC1 >= zCURSOR_SET )
   { 
      //:CREATE ENTITY mMasLC_Root.M_InsertTextKeywordBase
      RESULT = CreateEntity( mMasLC_Root, "M_InsertTextKeywordBase", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC_Root, "M_InsertTextKeywordBase", mMasLC, SourceKeywordEntityName, zSET_ALL )
      SetMatchingAttributesByName( mMasLC_Root, "M_InsertTextKeywordBase", mMasLC, SourceKeywordEntityName, zSET_ALL );

      //:nRC2 = SetCursorFirstEntity( mMasLC, SourceTextEntityName, "" )
      nRC2 = SetCursorFirstEntity( mMasLC, SourceTextEntityName, "" );
      //:LOOP WHILE nRC2 >= zCURSOR_SET
      while ( nRC2 >= zCURSOR_SET )
      { 
         //:CREATE ENTITY mMasLC_Root.M_InsertTextBase
         RESULT = CreateEntity( mMasLC_Root, "M_InsertTextBase", zPOS_AFTER );
         //:SetMatchingAttributesByName( mMasLC_Root, "M_InsertTextBase", mMasLC, SourceTextEntityName, zSET_ALL )
         SetMatchingAttributesByName( mMasLC_Root, "M_InsertTextBase", mMasLC, SourceTextEntityName, zSET_ALL );

         //:nRC2 = SetCursorNextEntity( mMasLC, SourceTextEntityName, "" )
         nRC2 = SetCursorNextEntity( mMasLC, SourceTextEntityName, "" );
      } 

      //:END
      //:nRC1 = SetCursorNextEntity( mMasLC, SourceKeywordEntityName, "" )
      nRC1 = SetCursorNextEntity( mMasLC, SourceKeywordEntityName, "" );
   } 

   //:END

   //:// Initialize the selected flags as indicated above.
   //:FOR EACH mMasLC_Root.M_InsertTextKeywordBase
   RESULT = SetCursorFirstEntity( mMasLC_Root, "M_InsertTextKeywordBase", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mMasLC_Root.M_InsertTextKeywordBase.Type = "O"
      if ( CompareAttributeToString( mMasLC_Root, "M_InsertTextKeywordBase", "Type", "O" ) == 0 )
      { 
         //:// Set the flag for the first entry.
         //:mMasLC_Root.M_InsertTextBase.wSelected = "Y"
         SetAttributeFromString( mMasLC_Root, "M_InsertTextBase", "wSelected", "Y" );
         //:ELSE
      } 
      else
      { 
         //:// Set the flag for all entries.
         //:FOR EACH mMasLC_Root.M_InsertTextBase
         RESULT = SetCursorFirstEntity( mMasLC_Root, "M_InsertTextBase", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:mMasLC_Root.M_InsertTextBase.wSelected = "Y"
            SetAttributeFromString( mMasLC_Root, "M_InsertTextBase", "wSelected", "Y" );
            RESULT = SetCursorNextEntity( mMasLC_Root, "M_InsertTextBase", "" );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mMasLC_Root, "M_InsertTextKeywordBase", "" );
      //:END
   } 

   //:END

   //:// Build the M_InsertTextKeyword subobject as described above.
   //:FOR EACH mMasLC_Root.M_InsertTextKeywordBase
   RESULT = SetCursorFirstEntity( mMasLC_Root, "M_InsertTextKeywordBase", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mMasLC_Root.M_InsertTextKeyword
      RESULT = CreateEntity( mMasLC_Root, "M_InsertTextKeyword", zPOS_AFTER );
      //:SetMatchingAttributesByName( mMasLC_Root, "M_InsertTextKeyword", mMasLC_Root, "M_InsertTextKeywordBase", zSET_ALL )
      SetMatchingAttributesByName( mMasLC_Root, "M_InsertTextKeyword", mMasLC_Root, "M_InsertTextKeywordBase", zSET_ALL );
      //:FOR EACH mMasLC_Root.M_InsertTextBase
      RESULT = SetCursorFirstEntity( mMasLC_Root, "M_InsertTextBase", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mMasLC_Root.M_InsertTextBase.wSelected = "Y"
         if ( CompareAttributeToString( mMasLC_Root, "M_InsertTextBase", "wSelected", "Y" ) == 0 )
         { 
            //:CREATE ENTITY mMasLC_Root.M_InsertText
            RESULT = CreateEntity( mMasLC_Root, "M_InsertText", zPOS_AFTER );
            //:SetMatchingAttributesByName( mMasLC_Root, "M_InsertText", mMasLC_Root, "M_InsertTextBase", zSET_ALL )
            SetMatchingAttributesByName( mMasLC_Root, "M_InsertText", mMasLC_Root, "M_InsertTextBase", zSET_ALL );
         } 

         RESULT = SetCursorNextEntity( mMasLC_Root, "M_InsertTextBase", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mMasLC_Root, "M_InsertTextKeywordBase", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:BuildNonGroupEntries( VIEW mMasLC BASED ON LOD mMasLC )

//:   VIEW mMasLC2 BASED ON LOD mMasLC
public int 
omMasLC_BuildNonGroupEntries( View     mMasLC )
{
   zVIEW    mMasLC2 = new zVIEW( );
   //:INTEGER UsageGroupID
   int      UsageGroupID = 0;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;


   //:// Build the M_UsageNonGroupUsage derived entries from any M_Usage entries that aren't tied to a M_UsageGroup.

   //:// Because of a JOE error on reincluding excluded entities from a different view, we're saving position by saving
   //:// the ID of the M_UsageGroup entity and using it to reposition.
   //:UsageGroupID = mMasLC.M_UsageGroup.ID
   {MutableInt mi_UsageGroupID = new MutableInt( UsageGroupID );
       GetIntegerFromAttribute( mi_UsageGroupID, mMasLC, "M_UsageGroup", "ID" );
   UsageGroupID = mi_UsageGroupID.intValue( );}

   //:// First remove existing entries.
   //:FOR EACH mMasLC.M_UsageNonGroupUsage
   RESULT = SetCursorFirstEntity( mMasLC, "M_UsageNonGroupUsage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:EXCLUDE mMasLC.M_UsageNonGroupUsage NONE
      RESULT = ExcludeEntity( mMasLC, "M_UsageNonGroupUsage", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mMasLC, "M_UsageNonGroupUsage", "" );
   } 

   //:END

   //:// Add any Usage entry that's not tied to a Group.
   //:CreateViewFromView( mMasLC2, mMasLC )
   CreateViewFromView( mMasLC2, mMasLC );
   //:FOR EACH mMasLC2.M_Usage
   RESULT = SetCursorFirstEntity( mMasLC2, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST mMasLC.M_UsageGroupUsage WITHIN mMasLC2.M_UsageType
      //:           WHERE mMasLC.M_UsageGroupUsage.ID = mMasLC2.M_Usage.ID
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
             GetIntegerFromAttribute( mi_lTempInteger_0, mMasLC2, "M_Usage", "ID" );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_UsageGroupUsage", "ID", lTempInteger_0, "M_UsageType" );
      //:IF RESULT < zCURSOR_SET
      if ( RESULT < zCURSOR_SET )
      { 
         //:INCLUDE mMasLC.M_UsageNonGroupUsage FROM mMasLC2.M_Usage
         RESULT = IncludeSubobjectFromSubobject( mMasLC, "M_UsageNonGroupUsage", mMasLC2, "M_Usage", zPOS_AFTER );
      } 

      RESULT = SetCursorNextEntity( mMasLC2, "M_Usage", "" );
      //:END
   } 

   //:END
   //:OrderEntityForView( mMasLC2, "M_UsageNonGroupUsage", "Name A" )
   OrderEntityForView( mMasLC2, "M_UsageNonGroupUsage", "Name A" );
   //:SET CURSOR FIRST mMasLC.M_UsageGroup WHERE mMasLC.M_UsageGroup.ID = UsageGroupID
   RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_UsageGroup", "ID", UsageGroupID, "" );
   //:DropView( mMasLC2 )
   DropView( mMasLC2 );
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dUsageClaimClass( VIEW mMasLC BASED ON LOD mMasLC,
//:                  STRING ( 32 ) InternalEntityStructure,
//:                  STRING ( 32 ) InternalAttribStructure,
//:                  SHORT GetOrSetFlag )

//:   STRING ( 32 )  szEntityName
public int 
omMasLC_dUsageClaimClass( View     mMasLC,
                          String InternalEntityStructure,
                          String InternalAttribStructure,
                          Integer   GetOrSetFlag )
{
   String   szEntityName = null;
   //:STRING ( 64  ) szUsageType
   String   szUsageType = null;
   //:STRING ( 32 )  szClassification
   String   szClassification = null;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Combine the UsageType and the ClaimsClassification.
         //:GetEntityNameFromStructure( InternalEntityStructure, szEntityName )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttributeByContext( szUsageType, mMasLC, szEntityName, "UsageType", "FullUsageType", 32 )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttributeByContext( sb_szUsageType, mMasLC, szEntityName, "UsageType", "FullUsageType", 32 );
         szUsageType = sb_szUsageType.toString( );}
         //:GetStringFromAttribute( szClassification, mMasLC, szEntityName, "ClaimsClassification" )
         {StringBuilder sb_szClassification;
         if ( szClassification == null )
            sb_szClassification = new StringBuilder( 32 );
         else
            sb_szClassification = new StringBuilder( szClassification );
                   GetStringFromAttribute( sb_szClassification, mMasLC, szEntityName, "ClaimsClassification" );
         szClassification = sb_szClassification.toString( );}
         //:IF szClassification != ""
         if ( ZeidonStringCompare( szClassification, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szUsageType = szUsageType + "/" + szClassification
             {StringBuilder sb_szUsageType;
            if ( szUsageType == null )
               sb_szUsageType = new StringBuilder( 32 );
            else
               sb_szUsageType = new StringBuilder( szUsageType );
                        ZeidonStringConcat( sb_szUsageType, 1, 0, "/", 1, 0, 65 );
            szUsageType = sb_szUsageType.toString( );}
             {StringBuilder sb_szUsageType;
            if ( szUsageType == null )
               sb_szUsageType = new StringBuilder( 32 );
            else
               sb_szUsageType = new StringBuilder( szUsageType );
                        ZeidonStringConcat( sb_szUsageType, 1, 0, szClassification, 1, 0, 65 );
            szUsageType = sb_szUsageType.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szUsageType )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szUsageType );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dUsgFullEmbeddedName( VIEW mMasLC BASED ON LOD mMasLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dUsgFullEmbeddedName( View     mMasLC,
                              String InternalEntityStructure,
                              String InternalAttribStructure,
                              Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Display required text combined with optional usage(s).
         //:szDisplayStatement = mMasLC.M_Usage.Name
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_Usage", "Name", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
         //:InsertOptionalSubUsages( mMasLC, szDisplayStatement, "M_SubUsage", 0 )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
           {StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                  m_ZGlobal1_Operation.InsertOptionalSubUsages( mMasLC, sb_szDisplayStatement, "M_SubUsage", 0 );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:SetFirstCharacterCase( szDisplayStatement, 1 )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
           {StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                  m_ZGlobal1_Operation.SetFirstCharacterCase( sb_szDisplayStatement, 1 );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dUsgListFullEmbedName( VIEW mMasLC BASED ON LOD mMasLC,
//:                       STRING ( 32 ) InternalEntityStructure,
//:                       STRING ( 32 ) InternalAttribStructure,
//:                       SHORT GetOrSetFlag )

//:   VIEW mMasLC2 BASED ON LOD mMasLC
public int 
omMasLC_dUsgListFullEmbedName( View     mMasLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   zVIEW    mMasLC2 = new zVIEW( );
   //:STRING ( 2048 ) szDisplayStatement
   String   szDisplayStatement = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:CreateViewFromView( mMasLC2, mMasLC )
         CreateViewFromView( mMasLC2, mMasLC );
         //:SetCursorFirstEntityByEntityCsr( mMasLC2, "M_Usage", mMasLC, "MI_UsageList", "" )
         SetCursorFirstEntityByEntityCsr( mMasLC2, "M_Usage", mMasLC, "MI_UsageList", "" );
         //:szDisplayStatement = mMasLC2.M_Usage.Name
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mMasLC2, "M_Usage", "Name", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}

         //:// Display required text combined with optional usage(s).
         //:InsertOptionalSubUsages( mMasLC2, szDisplayStatement, "M_SubUsage", 0 )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC2 );
           {StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                  m_ZGlobal1_Operation.InsertOptionalSubUsages( mMasLC2, sb_szDisplayStatement, "M_SubUsage", 0 );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:SetFirstCharacterCase( szDisplayStatement, 1 )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
           {StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                  m_ZGlobal1_Operation.SetFirstCharacterCase( sb_szDisplayStatement, 1 );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dUsgNonGroupSubUsages( VIEW mMasLC BASED ON LOD mMasLC,
//:                       STRING ( 32 ) InternalEntityStructure,
//:                       STRING ( 32 ) InternalAttribStructure,
//:                       SHORT GetOrSetFlag )

//:   VIEW mMasLC2 BASED ON LOD mMasLC
public int 
omMasLC_dUsgNonGroupSubUsages( View     mMasLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   zVIEW    mMasLC2 = new zVIEW( );
   //:STRING ( 2048 ) szDisplayStatement
   String   szDisplayStatement = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:CreateViewFromView( mMasLC2, mMasLC )
         CreateViewFromView( mMasLC2, mMasLC );
         //:SetCursorFirstEntityByEntityCsr( mMasLC2, "M_Usage", mMasLC, "M_UsageNonGroupUsage", "" )
         SetCursorFirstEntityByEntityCsr( mMasLC2, "M_Usage", mMasLC, "M_UsageNonGroupUsage", "" );
         //:szDisplayStatement = mMasLC2.M_Usage.Name
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mMasLC2, "M_Usage", "Name", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}

         //:// Display required text combined with optional usage(s).
         //:InsertOptionalSubUsages( mMasLC2, szDisplayStatement, "M_SubUsage", 0 )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC2 );
           {StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                  m_ZGlobal1_Operation.InsertOptionalSubUsages( mMasLC2, sb_szDisplayStatement, "M_SubUsage", 0 );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:SetFirstCharacterCase( szDisplayStatement, 1 )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
           {StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                  m_ZGlobal1_Operation.SetFirstCharacterCase( sb_szDisplayStatement, 1 );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dDU_SectionTitleKeyword( VIEW mMasLC BASED ON LOD mMasLC,
//:                         STRING ( 32 ) InternalEntityStructure,
//:                         STRING ( 32 ) InternalAttribStructure,
//:                         SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dDU_SectionTitleKeyword( View     mMasLC,
                                 String InternalEntityStructure,
                                 String InternalAttribStructure,
                                 Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Directions For Use Display Section Title embeds keywords into the Title.
         //:szDisplayStatement = mMasLC.M_DirectionsForUseSection.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_DirectionsForUseSection", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}

         //:IF szDisplayStatement != ""
         if ( ZeidonStringCompare( szDisplayStatement, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szDisplayStatement,
            //:                            "M_InsertTextKeywordSectionDU", "M_InsertTextSectionDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szDisplayStatement, "M_InsertTextKeywordSectionDU", "M_InsertTextSectionDU", ", " );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dDU_SectionTextKeyword( VIEW mMasLC BASED ON LOD mMasLC,
   //:                     STRING ( 32 ) InternalEntityStructure,
   //:                     STRING ( 32 ) InternalAttribStructure,
   //:                     SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dDU_SectionTextKeyword( View     mMasLC,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   //:STRING ( 2048 ) szStatementText
   String   szStatementText = null;
   //:STRING ( 256 )  szTitle
   String   szTitle = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Directions For Use Display Section Text embeds keywords into the Text.
         //:szDisplayStatement = mMasLC.M_DirectionsForUseSection.Subtitle
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_DirectionsForUseSection", "Subtitle", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}

         //:IF szDisplayStatement != ""
         if ( ZeidonStringCompare( szDisplayStatement, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szDisplayStatement,
            //:                            "M_InsertTextKeywordSectionDU", "M_InsertTextSectionDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szDisplayStatement, "M_InsertTextKeywordSectionDU", "M_InsertTextSectionDU", ", " );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dDU_SectTitleOrTxtKey( VIEW mMasLC BASED ON LOD mMasLC,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dDU_SectTitleOrTxtKey( View     mMasLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Directions For Use Display Section Title embeds keywords into the Title.
         //:szDisplayStatement = mMasLC.M_DirectionsForUseSection.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_DirectionsForUseSection", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
         //:IF szDisplayStatement = ""
         if ( ZeidonStringCompare( szDisplayStatement, 1, 0, "", 1, 0, 2049 ) == 0 )
         { 
            //:szDisplayStatement = mMasLC.M_DirectionsForUseSection.Subtitle
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_1, 'S', 2049, mMasLC, "M_DirectionsForUseSection", "Subtitle", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END

         //:IF szDisplayStatement != ""
         if ( ZeidonStringCompare( szDisplayStatement, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szDisplayStatement,
            //:                            "M_InsertTextKeywordSectionDU", "M_InsertTextSectionDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szDisplayStatement, "M_InsertTextKeywordSectionDU", "M_InsertTextSectionDU", ", " );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dMarkUsgTxtSubUsgNames( VIEW mMasLC BASED ON LOD mMasLC,
   //:                     STRING ( 32 ) InternalEntityStructure,
   //:                     STRING ( 32 ) InternalAttribStructure,
   //:                     SHORT GetOrSetFlag )

   //:VIEW mMasLC2 BASED ON LOD mMasLC
public int 
omMasLC_dMarkUsgTxtSubUsgNames( View     mMasLC,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   zVIEW    mMasLC2 = new zVIEW( );
   //:STRING ( 2048 ) szDisplayStatement
   String   szDisplayStatement = null;
   //:STRING ( 100 ) szUsageName
   String   szUsageName = null;
   //:STRING ( 100 ) szUsageText
   String   szUsageText = null;
   //:STRING ( 1 ) szUsageType
   String   szUsageType = null;
   //:SHORT bFirst
   int      bFirst = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      RESULT = 0;
   int      lTempInteger_3 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_4 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_5 = 0;
   String   szTempString_2 = null;
   int      lTempInteger_6 = 0;
   String   szTempString_3 = null;
   int      lTempInteger_7 = 0;
   String   szTempString_4 = null;
   int      lTempInteger_8 = 0;
   String   szTempString_5 = null;
   int      lTempInteger_9 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:IF mMasLC.M_MarketingUsage EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mMasLC, "M_MarketingUsage" );
         if ( lTempInteger_0 == 0 )
         { 
            //:// Display required text combined with optional usage(s).
            //:szDisplayStatement = mMasLC.M_MarketingUsage.Name
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_1, 'S', 2049, mMasLC, "M_MarketingUsage", "Name", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
            //:InsertOptionalSubUsages( mMasLC, szDisplayStatement, "M_MarketingSubUsage", 1 )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
              {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        m_ZGlobal1_Operation.InsertOptionalSubUsages( mMasLC, sb_szDisplayStatement, "M_MarketingSubUsage", 1 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }

            //:IF mMasLC.M_InsertTextKeywordMarketUsage EXISTS
            lTempInteger_2 = CheckExistenceOfEntity( mMasLC, "M_InsertTextKeywordMarketUsage" );
            if ( lTempInteger_2 == 0 )
            { 
               //:CreateViewFromView( mMasLC2, mMasLC )
               CreateViewFromView( mMasLC2, mMasLC );
               //:FOR EACH mMasLC2.M_InsertTextKeywordMarketUsage
               RESULT = SetCursorFirstEntity( mMasLC2, "M_InsertTextKeywordMarketUsage", "" );
               while ( RESULT > zCURSOR_UNCHANGED )
               { 
                  //:szUsageType = mMasLC2.M_InsertTextKeywordMarketUsage.Type // A - all optional; O - Zero or one allowed; R - at least one required; X - exactly one required
                  {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                  StringBuilder sb_szUsageType;
                  if ( szUsageType == null )
                     sb_szUsageType = new StringBuilder( 32 );
                  else
                     sb_szUsageType = new StringBuilder( szUsageType );
                                     GetVariableFromAttribute( sb_szUsageType, mi_lTempInteger_3, 'S', 2, mMasLC2, "M_InsertTextKeywordMarketUsage", "Type", "", 0 );
                  lTempInteger_3 = mi_lTempInteger_3.intValue( );
                  szUsageType = sb_szUsageType.toString( );}
                  //:szUsageName = "{" + mMasLC2.M_InsertTextKeywordMarketUsage.Name + "}"
                  {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
                  StringBuilder sb_szTempString_0;
                  if ( szTempString_0 == null )
                     sb_szTempString_0 = new StringBuilder( 32 );
                  else
                     sb_szTempString_0 = new StringBuilder( szTempString_0 );
                                     GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_4, 'S', 255, mMasLC2, "M_InsertTextKeywordMarketUsage", "Name", "", 0 );
                  lTempInteger_4 = mi_lTempInteger_4.intValue( );
                  szTempString_0 = sb_szTempString_0.toString( );}
                   {StringBuilder sb_szUsageName;
                  if ( szUsageName == null )
                     sb_szUsageName = new StringBuilder( 32 );
                  else
                     sb_szUsageName = new StringBuilder( szUsageName );
                                    ZeidonStringCopy( sb_szUsageName, 1, 0, "{", 1, 0, 101 );
                  szUsageName = sb_szUsageName.toString( );}
                   {StringBuilder sb_szUsageName;
                  if ( szUsageName == null )
                     sb_szUsageName = new StringBuilder( 32 );
                  else
                     sb_szUsageName = new StringBuilder( szUsageName );
                                    ZeidonStringConcat( sb_szUsageName, 1, 0, szTempString_0, 1, 0, 101 );
                  szUsageName = sb_szUsageName.toString( );}
                   {StringBuilder sb_szUsageName;
                  if ( szUsageName == null )
                     sb_szUsageName = new StringBuilder( 32 );
                  else
                     sb_szUsageName = new StringBuilder( szUsageName );
                                    ZeidonStringConcat( sb_szUsageName, 1, 0, "}", 1, 0, 101 );
                  szUsageName = sb_szUsageName.toString( );}
                  //:bFirst = 1
                  bFirst = 1;
                  //:IF szUsageType = "A"
                  if ( ZeidonStringCompare( szUsageType, 1, 0, "A", 1, 0, 2 ) == 0 )
                  { 
                     //:szUsageText = ""
                      {StringBuilder sb_szUsageText;
                     if ( szUsageText == null )
                        sb_szUsageText = new StringBuilder( 32 );
                     else
                        sb_szUsageText = new StringBuilder( szUsageText );
                                          ZeidonStringCopy( sb_szUsageText, 1, 0, "", 1, 0, 101 );
                     szUsageText = sb_szUsageText.toString( );}
                     //:ELSE
                  } 
                  else
                  { 
                     //:szUsageText = "["
                      {StringBuilder sb_szUsageText;
                     if ( szUsageText == null )
                        sb_szUsageText = new StringBuilder( 32 );
                     else
                        sb_szUsageText = new StringBuilder( szUsageText );
                                          ZeidonStringCopy( sb_szUsageText, 1, 0, "[", 1, 0, 101 );
                     szUsageText = sb_szUsageText.toString( );}
                  } 

                  //:END
                  //:FOR EACH mMasLC2.M_InsertTextMarketUsage
                  RESULT = SetCursorFirstEntity( mMasLC2, "M_InsertTextMarketUsage", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:IF bFirst = 1
                     if ( bFirst == 1 )
                     { 
                        //:bFirst = 0
                        bFirst = 0;
                        //:szUsageText = szUsageText + "<b>" + mMasLC2.M_InsertTextMarketUsage.Text + "</b>"
                         {StringBuilder sb_szUsageText;
                        if ( szUsageText == null )
                           sb_szUsageText = new StringBuilder( 32 );
                        else
                           sb_szUsageText = new StringBuilder( szUsageText );
                                                ZeidonStringConcat( sb_szUsageText, 1, 0, "<b>", 1, 0, 101 );
                        szUsageText = sb_szUsageText.toString( );}
                        {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
                        StringBuilder sb_szTempString_1;
                        if ( szTempString_1 == null )
                           sb_szTempString_1 = new StringBuilder( 32 );
                        else
                           sb_szTempString_1 = new StringBuilder( szTempString_1 );
                                                 GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_5, 'S', 4097, mMasLC2, "M_InsertTextMarketUsage", "Text", "", 0 );
                        lTempInteger_5 = mi_lTempInteger_5.intValue( );
                        szTempString_1 = sb_szTempString_1.toString( );}
                         {StringBuilder sb_szUsageText;
                        if ( szUsageText == null )
                           sb_szUsageText = new StringBuilder( 32 );
                        else
                           sb_szUsageText = new StringBuilder( szUsageText );
                                                ZeidonStringConcat( sb_szUsageText, 1, 0, szTempString_1, 1, 0, 101 );
                        szUsageText = sb_szUsageText.toString( );}
                         {StringBuilder sb_szUsageText;
                        if ( szUsageText == null )
                           sb_szUsageText = new StringBuilder( 32 );
                        else
                           sb_szUsageText = new StringBuilder( szUsageText );
                                                ZeidonStringConcat( sb_szUsageText, 1, 0, "</b>", 1, 0, 101 );
                        szUsageText = sb_szUsageText.toString( );}
                        //:ELSE
                     } 
                     else
                     { 
                        //:IF szUsageType = "A"
                        if ( ZeidonStringCompare( szUsageType, 1, 0, "A", 1, 0, 2 ) == 0 )
                        { 
                           //:szUsageText = szUsageText + ", <b>" + mMasLC2.M_InsertTextMarketUsage.Text + "</b>"
                            {StringBuilder sb_szUsageText;
                           if ( szUsageText == null )
                              sb_szUsageText = new StringBuilder( 32 );
                           else
                              sb_szUsageText = new StringBuilder( szUsageText );
                                                      ZeidonStringConcat( sb_szUsageText, 1, 0, ", <b>", 1, 0, 101 );
                           szUsageText = sb_szUsageText.toString( );}
                           {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
                           StringBuilder sb_szTempString_2;
                           if ( szTempString_2 == null )
                              sb_szTempString_2 = new StringBuilder( 32 );
                           else
                              sb_szTempString_2 = new StringBuilder( szTempString_2 );
                                                       GetVariableFromAttribute( sb_szTempString_2, mi_lTempInteger_6, 'S', 4097, mMasLC2, "M_InsertTextMarketUsage", "Text", "", 0 );
                           lTempInteger_6 = mi_lTempInteger_6.intValue( );
                           szTempString_2 = sb_szTempString_2.toString( );}
                            {StringBuilder sb_szUsageText;
                           if ( szUsageText == null )
                              sb_szUsageText = new StringBuilder( 32 );
                           else
                              sb_szUsageText = new StringBuilder( szUsageText );
                                                      ZeidonStringConcat( sb_szUsageText, 1, 0, szTempString_2, 1, 0, 101 );
                           szUsageText = sb_szUsageText.toString( );}
                            {StringBuilder sb_szUsageText;
                           if ( szUsageText == null )
                              sb_szUsageText = new StringBuilder( 32 );
                           else
                              sb_szUsageText = new StringBuilder( szUsageText );
                                                      ZeidonStringConcat( sb_szUsageText, 1, 0, "</b>", 1, 0, 101 );
                           szUsageText = sb_szUsageText.toString( );}
                           //:ELSE
                        } 
                        else
                        { 
                           //:IF szUsageType = "O"
                           if ( ZeidonStringCompare( szUsageType, 1, 0, "O", 1, 0, 2 ) == 0 )
                           { 
                              //:szUsageText = szUsageText + " || <b>" + mMasLC2.M_InsertTextMarketUsage.Text + "</b>"
                               {StringBuilder sb_szUsageText;
                              if ( szUsageText == null )
                                 sb_szUsageText = new StringBuilder( 32 );
                              else
                                 sb_szUsageText = new StringBuilder( szUsageText );
                                                            ZeidonStringConcat( sb_szUsageText, 1, 0, " | <b>", 1, 0, 101 );
                              szUsageText = sb_szUsageText.toString( );}
                              {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
                              StringBuilder sb_szTempString_3;
                              if ( szTempString_3 == null )
                                 sb_szTempString_3 = new StringBuilder( 32 );
                              else
                                 sb_szTempString_3 = new StringBuilder( szTempString_3 );
                                                             GetVariableFromAttribute( sb_szTempString_3, mi_lTempInteger_7, 'S', 4097, mMasLC2, "M_InsertTextMarketUsage", "Text", "", 0 );
                              lTempInteger_7 = mi_lTempInteger_7.intValue( );
                              szTempString_3 = sb_szTempString_3.toString( );}
                               {StringBuilder sb_szUsageText;
                              if ( szUsageText == null )
                                 sb_szUsageText = new StringBuilder( 32 );
                              else
                                 sb_szUsageText = new StringBuilder( szUsageText );
                                                            ZeidonStringConcat( sb_szUsageText, 1, 0, szTempString_3, 1, 0, 101 );
                              szUsageText = sb_szUsageText.toString( );}
                               {StringBuilder sb_szUsageText;
                              if ( szUsageText == null )
                                 sb_szUsageText = new StringBuilder( 32 );
                              else
                                 sb_szUsageText = new StringBuilder( szUsageText );
                                                            ZeidonStringConcat( sb_szUsageText, 1, 0, "</b>", 1, 0, 101 );
                              szUsageText = sb_szUsageText.toString( );}
                              //:ELSE
                           } 
                           else
                           { 
                              //:IF szUsageType = "R"
                              if ( ZeidonStringCompare( szUsageType, 1, 0, "R", 1, 0, 2 ) == 0 )
                              { 
                                 //:szUsageText = szUsageText + " or <b>" + mMasLC2.M_InsertTextMarketUsage.Text + "</b>"
                                  {StringBuilder sb_szUsageText;
                                 if ( szUsageText == null )
                                    sb_szUsageText = new StringBuilder( 32 );
                                 else
                                    sb_szUsageText = new StringBuilder( szUsageText );
                                                                  ZeidonStringConcat( sb_szUsageText, 1, 0, " or <b>", 1, 0, 101 );
                                 szUsageText = sb_szUsageText.toString( );}
                                 {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
                                 StringBuilder sb_szTempString_4;
                                 if ( szTempString_4 == null )
                                    sb_szTempString_4 = new StringBuilder( 32 );
                                 else
                                    sb_szTempString_4 = new StringBuilder( szTempString_4 );
                                                                   GetVariableFromAttribute( sb_szTempString_4, mi_lTempInteger_8, 'S', 4097, mMasLC2, "M_InsertTextMarketUsage", "Text", "", 0 );
                                 lTempInteger_8 = mi_lTempInteger_8.intValue( );
                                 szTempString_4 = sb_szTempString_4.toString( );}
                                  {StringBuilder sb_szUsageText;
                                 if ( szUsageText == null )
                                    sb_szUsageText = new StringBuilder( 32 );
                                 else
                                    sb_szUsageText = new StringBuilder( szUsageText );
                                                                  ZeidonStringConcat( sb_szUsageText, 1, 0, szTempString_4, 1, 0, 101 );
                                 szUsageText = sb_szUsageText.toString( );}
                                  {StringBuilder sb_szUsageText;
                                 if ( szUsageText == null )
                                    sb_szUsageText = new StringBuilder( 32 );
                                 else
                                    sb_szUsageText = new StringBuilder( szUsageText );
                                                                  ZeidonStringConcat( sb_szUsageText, 1, 0, "</b>", 1, 0, 101 );
                                 szUsageText = sb_szUsageText.toString( );}
                                 //:ELSE
                              } 
                              else
                              { 
                                 //:// IF szUsageType = "X"
                                 //:szUsageText = szUsageText + " / <b>" + mMasLC2.M_InsertTextMarketUsage.Text + "</b>"
                                  {StringBuilder sb_szUsageText;
                                 if ( szUsageText == null )
                                    sb_szUsageText = new StringBuilder( 32 );
                                 else
                                    sb_szUsageText = new StringBuilder( szUsageText );
                                                                  ZeidonStringConcat( sb_szUsageText, 1, 0, " / <b>", 1, 0, 101 );
                                 szUsageText = sb_szUsageText.toString( );}
                                 {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
                                 StringBuilder sb_szTempString_5;
                                 if ( szTempString_5 == null )
                                    sb_szTempString_5 = new StringBuilder( 32 );
                                 else
                                    sb_szTempString_5 = new StringBuilder( szTempString_5 );
                                                                   GetVariableFromAttribute( sb_szTempString_5, mi_lTempInteger_9, 'S', 4097, mMasLC2, "M_InsertTextMarketUsage", "Text", "", 0 );
                                 lTempInteger_9 = mi_lTempInteger_9.intValue( );
                                 szTempString_5 = sb_szTempString_5.toString( );}
                                  {StringBuilder sb_szUsageText;
                                 if ( szUsageText == null )
                                    sb_szUsageText = new StringBuilder( 32 );
                                 else
                                    sb_szUsageText = new StringBuilder( szUsageText );
                                                                  ZeidonStringConcat( sb_szUsageText, 1, 0, szTempString_5, 1, 0, 101 );
                                 szUsageText = sb_szUsageText.toString( );}
                                  {StringBuilder sb_szUsageText;
                                 if ( szUsageText == null )
                                    sb_szUsageText = new StringBuilder( 32 );
                                 else
                                    sb_szUsageText = new StringBuilder( szUsageText );
                                                                  ZeidonStringConcat( sb_szUsageText, 1, 0, "</b>", 1, 0, 101 );
                                 szUsageText = sb_szUsageText.toString( );}
                              } 

                              //:// END
                              //:END
                           } 

                           //:END
                        } 

                        //:END
                     } 

                     RESULT = SetCursorNextEntity( mMasLC2, "M_InsertTextMarketUsage", "" );
                     //:END
                  } 

                  //:END
                  //:IF szUsageType != "A"
                  if ( ZeidonStringCompare( szUsageType, 1, 0, "A", 1, 0, 2 ) != 0 )
                  { 
                     //:szUsageText = szUsageText + "]"
                      {StringBuilder sb_szUsageText;
                     if ( szUsageText == null )
                        sb_szUsageText = new StringBuilder( 32 );
                     else
                        sb_szUsageText = new StringBuilder( szUsageText );
                                          ZeidonStringConcat( sb_szUsageText, 1, 0, "]", 1, 0, 101 );
                     szUsageText = sb_szUsageText.toString( );}
                  } 

                  //:END
                  //:zSearchAndReplace( szDisplayStatement, 2048, szUsageName, szUsageText )
                  {StringBuilder sb_szDisplayStatement;
                  if ( szDisplayStatement == null )
                     sb_szDisplayStatement = new StringBuilder( 32 );
                  else
                     sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                                     zSearchAndReplace( sb_szDisplayStatement, 2048, szUsageName, szUsageText );
                  szDisplayStatement = sb_szDisplayStatement.toString( );}
                  RESULT = SetCursorNextEntity( mMasLC2, "M_InsertTextKeywordMarketUsage", "" );
               } 

               //:END
               //:DropView( mMasLC2 )
               DropView( mMasLC2 );
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szDisplayStatement = ""
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, "", 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dDU_SubStmtTitleTxtKey( VIEW mMasLC BASED ON LOD mMasLC,
//:                        STRING ( 32 ) InternalEntityStructure,
//:                        STRING ( 32 ) InternalAttribStructure,
//:                        SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omMasLC_dDU_SubStmtTitleTxtKey( View     mMasLC,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   String   szDisplayStatement = null;
   //:STRING ( 256 )  szStatementTitle
   String   szStatementTitle = null;
   //:STRING ( 2048 ) szStatementText
   String   szStatementText = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Directions For Use Display Statement Text is a combination of Title/Text/Keywords.
         //:SetViewToSubobject( mMasLC, "M_DirectionsForUseSubStatement" )
         SetViewToSubobject( mMasLC, "M_DirectionsForUseSubStatement" );

         //:szStatementText = mMasLC.M_DirectionsForUseStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mMasLC, "M_DirectionsForUseStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szStatementText,
            //:                            "M_InsertTextKeywordDU", "M_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szStatementText, "M_InsertTextKeywordDU", "M_InsertTextDU", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:szStatementTitle = mMasLC.M_DirectionsForUseStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_1, 'S', 257, mMasLC, "M_DirectionsForUseStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mMasLC, szStatementTitle,
            //:                            "M_InsertTextKeywordDU", "M_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mMasLC, sb_szStatementTitle, "M_InsertTextKeywordDU", "M_InsertTextDU", ", " );
            szStatementTitle = sb_szStatementTitle.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:szDisplayStatement = szStatementTitle
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szStatementTitle, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
            //:IF szStatementText != ""
            if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
            { 
               //:szDisplayStatement = szDisplayStatement + " --- " + szStatementText
                {StringBuilder sb_szDisplayStatement;
               if ( szDisplayStatement == null )
                  sb_szDisplayStatement = new StringBuilder( 32 );
               else
                  sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                              ZeidonStringConcat( sb_szDisplayStatement, 1, 0, " --- ", 1, 0, 2049 );
               szDisplayStatement = sb_szDisplayStatement.toString( );}
                {StringBuilder sb_szDisplayStatement;
               if ( szDisplayStatement == null )
                  sb_szDisplayStatement = new StringBuilder( 32 );
               else
                  sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                              ZeidonStringConcat( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
               szDisplayStatement = sb_szDisplayStatement.toString( );}
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szDisplayStatement = szStatementText
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        ZeidonStringCopy( sb_szDisplayStatement, 1, 0, szStatementText, 1, 0, 2049 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END

         //:ResetViewFromSubobject( mMasLC )
         ResetViewFromSubobject( mMasLC );

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
         break ;

      //:  // end zDERIVED_GET
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     // end zDERIVED_SET
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dSpecifiedActiveIngred( VIEW mMasLC BASED ON LOD mMasLC,
//:                        STRING ( 32 ) InternalEntityStructure,
//:                        STRING ( 32 ) InternalAttribStructure,
//:                        SHORT GetOrSetFlag )

//:   STRING ( 32 ) Active
public int 
omMasLC_dSpecifiedActiveIngred( View     mMasLC,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   String   Active = null;
   //:DECIMAL dTotalActiveIngredients
   double  dTotalActiveIngredients = 0.0;
   //:DECIMAL dActiveIngredients
   double  dActiveIngredients = 0.0;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:dTotalActiveIngredients = 0
         dTotalActiveIngredients = 0;
         //:FOR EACH mMasLC.M_IngredientsStatement
         RESULT = SetCursorFirstEntity( mMasLC, "M_IngredientsStatement", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:Active = mMasLC.M_IngredientsStatement.Active
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
            StringBuilder sb_Active;
            if ( Active == null )
               sb_Active = new StringBuilder( 32 );
            else
               sb_Active = new StringBuilder( Active );
                         GetVariableFromAttribute( sb_Active, mi_lTempInteger_0, 'S', 33, mMasLC, "M_IngredientsStatement", "Active", "", 0 );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );
            Active = sb_Active.toString( );}
            //:IF Active = "A"
            if ( ZeidonStringCompare( Active, 1, 0, "A", 1, 0, 33 ) == 0 )
            { 
               //:dActiveIngredients = mMasLC.M_IngredientsStatement.Percent
               {MutableDouble md_dActiveIngredients = new MutableDouble( dActiveIngredients );
                               GetDecimalFromAttribute( md_dActiveIngredients, mMasLC, "M_IngredientsStatement", "Percent" );
               dActiveIngredients = md_dActiveIngredients.doubleValue( );}
               //:dTotalActiveIngredients = dTotalActiveIngredients + dActiveIngredients
               dTotalActiveIngredients = dTotalActiveIngredients + dActiveIngredients;
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_IngredientsStatement", "" );
            //:END
         } 

         //:END

         //:// Store the resulting value in the object.
         //:Active = dTotalActiveIngredients
          {StringBuilder sb_Active;
         if ( Active == null )
            sb_Active = new StringBuilder( 32 );
         else
            sb_Active = new StringBuilder( Active );
                  ZeidonStringConvertFromNumber( sb_Active, 1, 0, 32, 0, dTotalActiveIngredients, "D" );
         Active = sb_Active.toString( );}
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, Active )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, Active );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dSpecifiedInertIngred( VIEW mMasLC BASED ON LOD mMasLC,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 32 ) Active
public int 
omMasLC_dSpecifiedInertIngred( View     mMasLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   String   Active = null;
   //:DECIMAL dTotalInertIngredients
   double  dTotalInertIngredients = 0.0;
   //:DECIMAL dInertIngredients
   double  dInertIngredients = 0.0;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:dTotalInertIngredients = 0
         dTotalInertIngredients = 0;
         //:FOR EACH mMasLC.M_IngredientsStatement
         RESULT = SetCursorFirstEntity( mMasLC, "M_IngredientsStatement", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:Active = mMasLC.M_IngredientsStatement.Active
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
            StringBuilder sb_Active;
            if ( Active == null )
               sb_Active = new StringBuilder( 32 );
            else
               sb_Active = new StringBuilder( Active );
                         GetVariableFromAttribute( sb_Active, mi_lTempInteger_0, 'S', 33, mMasLC, "M_IngredientsStatement", "Active", "", 0 );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );
            Active = sb_Active.toString( );}
            //:IF Active != "A"
            if ( ZeidonStringCompare( Active, 1, 0, "A", 1, 0, 33 ) != 0 )
            { 
               //:dInertIngredients = mMasLC.M_IngredientsStatement.Percent
               {MutableDouble md_dInertIngredients = new MutableDouble( dInertIngredients );
                               GetDecimalFromAttribute( md_dInertIngredients, mMasLC, "M_IngredientsStatement", "Percent" );
               dInertIngredients = md_dInertIngredients.doubleValue( );}
               //:dTotalInertIngredients = dTotalInertIngredients + dInertIngredients
               dTotalInertIngredients = dTotalInertIngredients + dInertIngredients;
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_IngredientsStatement", "" );
            //:END
         } 

         //:END

         //:// Store the resulting value in the object.
         //:Active = dTotalInertIngredients
          {StringBuilder sb_Active;
         if ( Active == null )
            sb_Active = new StringBuilder( 32 );
         else
            sb_Active = new StringBuilder( Active );
                  ZeidonStringConvertFromNumber( sb_Active, 1, 0, 32, 0, dTotalInertIngredients, "D" );
         Active = sb_Active.toString( );}
         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, Active )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, Active );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dSymbolText( VIEW mMasLC BASED ON LOD mMasLC,
   //:          STRING ( 32 ) InternalEntityStructure,
   //:          STRING ( 32 ) InternalAttribStructure,
   //:          SHORT GetOrSetFlag )

   //:STRING ( 32 )  szEntityName
public int 
omMasLC_dSymbolText( View     mMasLC,
                     String InternalEntityStructure,
                     String InternalAttribStructure,
                     Integer   GetOrSetFlag )
{
   String   szEntityName = null;
   //:STRING ( 3000 ) Text
   String   Text = null;
   //:STRING ( 2048 ) Footnote
   String   Footnote = null;
   //:STRING ( 32 ) Symbol
   String   Symbol = null;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:GetEntityNameFromStructure( InternalEntityStructure, szEntityName )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mMasLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( Symbol, mMasLC, szEntityName, "Symbol" )
         {StringBuilder sb_Symbol;
         if ( Symbol == null )
            sb_Symbol = new StringBuilder( 32 );
         else
            sb_Symbol = new StringBuilder( Symbol );
                   GetStringFromAttribute( sb_Symbol, mMasLC, szEntityName, "Symbol" );
         Symbol = sb_Symbol.toString( );}
         //:GetStringFromAttribute( Footnote, mMasLC, szEntityName, "Text" )
         {StringBuilder sb_Footnote;
         if ( Footnote == null )
            sb_Footnote = new StringBuilder( 32 );
         else
            sb_Footnote = new StringBuilder( Footnote );
                   GetStringFromAttribute( sb_Footnote, mMasLC, szEntityName, "Text" );
         Footnote = sb_Footnote.toString( );}
         //:IF Symbol = ""
         if ( ZeidonStringCompare( Symbol, 1, 0, "", 1, 0, 33 ) == 0 )
         { 
            //:Text = Footnote
             {StringBuilder sb_Text;
            if ( Text == null )
               sb_Text = new StringBuilder( 32 );
            else
               sb_Text = new StringBuilder( Text );
                        ZeidonStringCopy( sb_Text, 1, 0, Footnote, 1, 0, 3001 );
            Text = sb_Text.toString( );}
            //:ELSE
         } 
         else
         { 
            //:Text = Symbol + " - " + Footnote
             {StringBuilder sb_Text;
            if ( Text == null )
               sb_Text = new StringBuilder( 32 );
            else
               sb_Text = new StringBuilder( Text );
                        ZeidonStringCopy( sb_Text, 1, 0, Symbol, 1, 0, 3001 );
            Text = sb_Text.toString( );}
             {StringBuilder sb_Text;
            if ( Text == null )
               sb_Text = new StringBuilder( 32 );
            else
               sb_Text = new StringBuilder( Text );
                        ZeidonStringConcat( sb_Text, 1, 0, " - ", 1, 0, 3001 );
            Text = sb_Text.toString( );}
             {StringBuilder sb_Text;
            if ( Text == null )
               sb_Text = new StringBuilder( 32 );
            else
               sb_Text = new StringBuilder( Text );
                        ZeidonStringConcat( sb_Text, 1, 0, Footnote, 1, 0, 3001 );
            Text = sb_Text.toString( );}
         } 

         //:END

         //:StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, Text )
         StoreStringInRecord( mMasLC, InternalEntityStructure, InternalAttribStructure, Text );
         //:RETURN 0
         if(8==8)return( 0 );

         //:// end zDERIVED_GET
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  // end zDERIVED_SET
      //:END  // case
      return( 0 );
   } 



}
