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

public class mSubLC_Object extends VmlObjectOperations
{
   public mSubLC_Object( View view )
   {
      super( view );
   }


//:DERIVED ATTRIBUTE OPERATION
//:dRegistrantNameID( VIEW mSubLC BASED ON LOD mSubLC,
//:                   STRING ( 32 ) InternalEntityStructure,
//:                   STRING ( 32 ) InternalAttribStructure,
//:                   SHORT GetOrSetFlag )

//:   STRING ( 1000 ) szString
public int 
omSubLC_dRegistrantNameID( View     mSubLC,
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

         //:IF mSubLC.Organization EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "Organization" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = mSubLC.Organization.Name
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_1, 'S', 1001, mSubLC, "Organization", "Name", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szString = sb_szString.toString( );}
            //:IF mSubLC.PrimaryRegistrant.EPA_CompanyNumber = ""
            if ( CompareAttributeToString( mSubLC, "PrimaryRegistrant", "EPA_CompanyNumber", "" ) == 0 )
            { 
               //:szString = szString + " (Non EPA)"
                {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                              ZeidonStringConcat( sb_szString, 1, 0, " (Non EPA)", 1, 0, 1001 );
               szString = sb_szString.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szString = szString + " (" +
               //:     mSubLC.PrimaryRegistrant.EPA_CompanyNumber + ")"
                {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                              ZeidonStringConcat( sb_szString, 1, 0, " (", 1, 0, 1001 );
               szString = sb_szString.toString( );}
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_2, 'S', 7, mSubLC, "PrimaryRegistrant", "EPA_CompanyNumber", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                              ZeidonStringConcat( sb_szString, 1, 0, szTempString_0, 1, 0, 1001 );
               szString = sb_szString.toString( );}
                {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                              ZeidonStringConcat( sb_szString, 1, 0, ")", 1, 0, 1001 );
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
                        ZeidonStringCopy( sb_szString, 1, 0, "", 1, 0, 1001 );
            szString = sb_szString.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC,
         //:                   InternalEntityStructure,
         //:                   InternalAttribStructure, szString )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szString );
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
   //:dIngredientName( VIEW mSubLC BASED ON LOD mSubLC,
   //:              STRING ( 32 ) InternalEntityStructure,
   //:              STRING ( 32 ) InternalAttribStructure,
   //:              SHORT GetOrSetFlag )

   //:STRING ( 1000 ) szString
public int 
omSubLC_dIngredientName( View     mSubLC,
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

         //:IF mSubLC.S_IngredientsStatement EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "S_IngredientsStatement" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = mSubLC.S_IngredientsStatement.CommonName
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_1, 'S', 1001, mSubLC, "S_IngredientsStatement", "CommonName", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szString = sb_szString.toString( );}
            //:IF szString = ""
            if ( ZeidonStringCompare( szString, 1, 0, "", 1, 0, 1001 ) == 0 )
            { 
               //:szString = mSubLC.S_IngredientsStatement.ChemicalName
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                               GetVariableFromAttribute( sb_szString, mi_lTempInteger_2, 'S', 1001, mSubLC, "S_IngredientsStatement", "ChemicalName", "", 0 );
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
                        ZeidonStringCopy( sb_szString, 1, 0, "", 1, 0, 1001 );
            szString = sb_szString.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC,
         //:                   InternalEntityStructure,
         //:                   InternalAttribStructure, szString )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szString );
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
public int 
omSubLC_dFullNameLFM( View     mSubLC,
                      String InternalEntityStructure,
                      String InternalAttribStructure,
                      Integer   GetOrSetFlag )
{

   //:dFullNameLFM( VIEW mSubLC BASED ON LOD mSubLC,
   //:           STRING ( 32 ) InternalEntityStructure,
   //:           STRING ( 32 ) InternalAttribStructure,
   //:           SHORT GetOrSetFlag )

   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :
         //:PersonName_LastFirstMiddle( mSubLC, InternalEntityStructure,
         //:                           InternalAttribStructure, GetOrSetFlag )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
          m_ZGlobal1_Operation.PersonName_LastFirstMiddle( mSubLC, InternalEntityStructure, InternalAttribStructure, GetOrSetFlag );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
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
public int 
omSubLC_dFullNameFML( View     mSubLC,
                      String InternalEntityStructure,
                      String InternalAttribStructure,
                      Integer   GetOrSetFlag )
{

   //:dFullNameFML( VIEW mSubLC BASED ON LOD mSubLC,
   //:           STRING ( 32 ) InternalEntityStructure,
   //:           STRING ( 32 ) InternalAttribStructure,
   //:           SHORT GetOrSetFlag )

   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :
         //:PersonName_FirstMiddleLast( mSubLC, InternalEntityStructure,
         //:                           InternalAttribStructure, GetOrSetFlag )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
          m_ZGlobal1_Operation.PersonName_FirstMiddleLast( mSubLC, InternalEntityStructure, InternalAttribStructure, GetOrSetFlag );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
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
//:dMasterProductNameNbr( VIEW mSubLC BASED ON LOD mSubLC,
//:                       STRING ( 32 ) InternalEntityStructure,
//:                       STRING ( 32 ) InternalAttribStructure,
//:                       SHORT GetOrSetFlag )

//:   STRING ( 1000 ) szString
public int 
omSubLC_dMasterProductNameNbr( View     mSubLC,
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

         //:IF mSubLC.MasterProduct  EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "MasterProduct" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = mSubLC.MasterProduct.Name + " (" +
            //:        mSubLC.PrimaryRegistrant.EPA_CompanyNumber + "-" +
            //:        mSubLC.MasterProduct.Number + ")"
            {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetStringFromAttribute( sb_szString, mSubLC, "MasterProduct", "Name" );
            szString = sb_szString.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, " (", 1, 0, 1001 );
            szString = sb_szString.toString( );}
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 7, mSubLC, "PrimaryRegistrant", "EPA_CompanyNumber", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szTempString_0 = sb_szTempString_0.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, szTempString_0, 1, 0, 1001 );
            szString = sb_szString.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, "-", 1, 0, 1001 );
            szString = sb_szString.toString( );}
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
            StringBuilder sb_szTempString_1;
            if ( szTempString_1 == null )
               sb_szTempString_1 = new StringBuilder( 32 );
            else
               sb_szTempString_1 = new StringBuilder( szTempString_1 );
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_2, 'S', 6, mSubLC, "MasterProduct", "Number", "", 0 );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );
            szTempString_1 = sb_szTempString_1.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, szTempString_1, 1, 0, 1001 );
            szString = sb_szString.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, ")", 1, 0, 1001 );
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
                        ZeidonStringCopy( sb_szString, 1, 0, "", 1, 0, 1001 );
            szString = sb_szString.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC,
         //:                   InternalEntityStructure,
         //:                   InternalAttribStructure, szString )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szString );
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
   //:dSubregProductNameNbr( VIEW mSubLC BASED ON LOD mSubLC,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 1000 ) szString
public int 
omSubLC_dSubregProductNameNbr( View     mSubLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   String   szString = null;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:szString = mSubLC.SubregProduct.Name
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szString;
         if ( szString == null )
            sb_szString = new StringBuilder( 32 );
         else
            sb_szString = new StringBuilder( szString );
                   GetVariableFromAttribute( sb_szString, mi_lTempInteger_0, 'S', 1001, mSubLC, "SubregProduct", "Name", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szString = sb_szString.toString( );}
         //:IF mSubLC.SubregProduct.Number != 0
         if ( CompareAttributeToInteger( mSubLC, "SubregProduct", "Number", 0 ) != 0 )
         { 
            //:szString = szString + " (" + mSubLC.SubregProduct.Number + ")"
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, " (", 1, 0, 1001 );
            szString = sb_szString.toString( );}
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 6, mSubLC, "SubregProduct", "Number", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szTempString_0 = sb_szTempString_0.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, szTempString_0, 1, 0, 1001 );
            szString = sb_szString.toString( );}
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                        ZeidonStringConcat( sb_szString, 1, 0, ")", 1, 0, 1001 );
            szString = sb_szString.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC,
         //:                   InternalEntityStructure,
         //:                   InternalAttribStructure, szString )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szString );
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
   //:dMarkUsgTxtSubUsgNames( VIEW mSubLC BASED ON LOD mSubLC,
   //:                     STRING ( 32 ) InternalEntityStructure,
   //:                     STRING ( 32 ) InternalAttribStructure,
   //:                     SHORT GetOrSetFlag )

   //:VIEW mSubLC2 BASED ON LOD mSubLC
public int 
omSubLC_dMarkUsgTxtSubUsgNames( View     mSubLC,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   zVIEW    mSubLC2 = new zVIEW( );
   //:STRING ( 2048 ) szDisplayStatement
   String   szDisplayStatement = null;
   //:STRING ( 100 ) szUsageName
   String   szUsageName = null;
   //:STRING ( 100 ) szUsageText
   String   szUsageText = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      RESULT = 0;
   String   szTempString_0 = null;
   int      lTempInteger_2 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_3 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Display required text combined with optional usage(s).
         //:szDisplayStatement = mSubLC.S_MarketingUsage.Name
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_MarketingUsage", "Name", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
         //:InsertOptionalSubUsages( mSubLC, szDisplayStatement, "S_MarketingSubUsage", 1 )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
           {StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                  m_ZGlobal1_Operation.InsertOptionalSubUsages( mSubLC, sb_szDisplayStatement, "S_MarketingSubUsage", 1 );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }

         //:IF mSubLC.S_InsertTextKeywordMarketUsage EXISTS
         lTempInteger_1 = CheckExistenceOfEntity( mSubLC, "S_InsertTextKeywordMarketUsage" );
         if ( lTempInteger_1 == 0 )
         { 
            //:CreateViewFromView( mSubLC2, mSubLC )
            CreateViewFromView( mSubLC2, mSubLC );
            //:FOR EACH mSubLC2.S_InsertTextKeywordMarketUsage
            RESULT = SetCursorFirstEntity( mSubLC2, "S_InsertTextKeywordMarketUsage", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:szUsageName = "{" + mSubLC2.S_InsertTextKeywordMarketUsage.Name + "}"
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_2, 'S', 255, mSubLC2, "S_InsertTextKeywordMarketUsage", "Name", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
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
               //:szUsageText = "<b>" + mSubLC2.S_InsertTextMarketUsage.Text + "</b>"
               {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
               StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                               GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_3, 'S', 4097, mSubLC2, "S_InsertTextMarketUsage", "Text", "", 0 );
               lTempInteger_3 = mi_lTempInteger_3.intValue( );
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
               RESULT = SetCursorNextEntity( mSubLC2, "S_InsertTextKeywordMarketUsage", "" );
            } 

            //:END
            //:DropView( mSubLC2 )
            DropView( mSubLC2 );
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
//:dUsgFullEmbeddedName( VIEW mSubLC BASED ON LOD mSubLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omSubLC_dUsgFullEmbeddedName( View     mSubLC,
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
         //:szDisplayStatement = mSubLC.S_Usage.Name
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_Usage", "Name", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
         //:InsertOptionalSubUsages( mSubLC, szDisplayStatement, "S_SubUsage", 0 )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
           {StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                  m_ZGlobal1_Operation.InsertOptionalSubUsages( mSubLC, sb_szDisplayStatement, "S_SubUsage", 0 );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:SetFirstCharacterCase( szDisplayStatement, 1 )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
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
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
//:dDisplayUsageName( VIEW mSubLC BASED ON LOD mSubLC,
//:                   STRING ( 32 ) InternalEntityStructure,
//:                   STRING ( 32 ) InternalAttribStructure,
//:                   SHORT GetOrSetFlag )

//:   VIEW mSubLC2 BASED ON LOD mSubLC
public int 
omSubLC_dDisplayUsageName( View     mSubLC,
                           String InternalEntityStructure,
                           String InternalAttribStructure,
                           Integer   GetOrSetFlag )
{
   zVIEW    mSubLC2 = new zVIEW( );
   //:STRING ( 32 )  szEntityName
   String   szEntityName = null;
   //:STRING ( 100 ) szUsageType
   String   szUsageType = null;
   //:STRING ( 100 ) szClassification
   String   szClassification = null;
   //:STRING ( 100 ) szName
   String   szName = null;
   //:STRING ( 100 ) szCombinedName
   String   szCombinedName = null;
   //:STRING ( 3 )   szFootnoteNumber
   String   szFootnoteNumber = null;
   //:INTEGER        Count
   int      Count = 0;
   int      lTempInteger_0 = 0;
   int      RESULT = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// For a Claim Usage entity, this is the combined name of Classification and Name.
         //:// For all others, it is simply the name.
         //:GetEntityNameFromStructure( InternalEntityStructure, szEntityName )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szUsageType, mSubLC, szEntityName, "UsageType" )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttribute( sb_szUsageType, mSubLC, szEntityName, "UsageType" );
         szUsageType = sb_szUsageType.toString( );}
         //:GetStringFromAttribute( szClassification, mSubLC, szEntityName, "ClaimsClassification" )
         {StringBuilder sb_szClassification;
         if ( szClassification == null )
            sb_szClassification = new StringBuilder( 32 );
         else
            sb_szClassification = new StringBuilder( szClassification );
                   GetStringFromAttribute( sb_szClassification, mSubLC, szEntityName, "ClaimsClassification" );
         szClassification = sb_szClassification.toString( );}
         //:GetStringFromAttribute( szName, mSubLC, szEntityName, "Name" )
         {StringBuilder sb_szName;
         if ( szName == null )
            sb_szName = new StringBuilder( 32 );
         else
            sb_szName = new StringBuilder( szName );
                   GetStringFromAttribute( sb_szName, mSubLC, szEntityName, "Name" );
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
                        ZeidonStringCopy( sb_szCombinedName, 1, 0, szClassification, 1, 0, 101 );
            szCombinedName = sb_szCombinedName.toString( );}
             {StringBuilder sb_szCombinedName;
            if ( szCombinedName == null )
               sb_szCombinedName = new StringBuilder( 32 );
            else
               sb_szCombinedName = new StringBuilder( szCombinedName );
                        ZeidonStringConcat( sb_szCombinedName, 1, 0, " - ", 1, 0, 101 );
            szCombinedName = sb_szCombinedName.toString( );}
             {StringBuilder sb_szCombinedName;
            if ( szCombinedName == null )
               sb_szCombinedName = new StringBuilder( 32 );
            else
               sb_szCombinedName = new StringBuilder( szCombinedName );
                        ZeidonStringConcat( sb_szCombinedName, 1, 0, szName, 1, 0, 101 );
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
                        ZeidonStringCopy( sb_szCombinedName, 1, 0, szName, 1, 0, 101 );
            szCombinedName = sb_szCombinedName.toString( );}
         } 

         //:END

         //:// Set Footnote Number, if footnote exists.
         //:IF mSubLC.S_UsageFootnoteUsed EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "S_UsageFootnoteUsed" );
         if ( lTempInteger_0 == 0 )
         { 
            //:IF mSubLC.S_UsageFootnoteUsed.ID != ""
            if ( CompareAttributeToString( mSubLC, "S_UsageFootnoteUsed", "ID", "" ) != 0 )
            { 
               //:SET CURSOR FIRST mSubLC.MLC_UsageFootnote WHERE mSubLC.MLC_UsageFootnote.ID = mSubLC.S_UsageFootnoteUsed.ID
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, mSubLC, "S_UsageFootnoteUsed", "ID" );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mSubLC, "MLC_UsageFootnote", "ID", lTempInteger_1, "" );
               //:IF mSubLC.MLC_UsageFootnote.wFootNoteRelativeNumber = ""
               if ( CompareAttributeToString( mSubLC, "MLC_UsageFootnote", "wFootNoteRelativeNumber", "" ) == 0 )
               { 
                  //:// Relative numbers haven't be set, so set them here.
                  //:CreateViewFromView( mSubLC2, mSubLC )
                  CreateViewFromView( mSubLC2, mSubLC );
                  //:Count = 0
                  Count = 0;
                  //:FOR EACH mSubLC2.MLC_UsageFootnote
                  RESULT = SetCursorFirstEntity( mSubLC2, "MLC_UsageFootnote", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:Count = Count + 1
                     Count = Count + 1;
                     //:mSubLC2.MLC_UsageFootnote.wFootNoteRelativeNumber = Count
                     SetAttributeFromInteger( mSubLC2, "MLC_UsageFootnote", "wFootNoteRelativeNumber", Count );
                     RESULT = SetCursorNextEntity( mSubLC2, "MLC_UsageFootnote", "" );
                  } 

                  //:END
                  //:DropView( mSubLC2 )
                  DropView( mSubLC2 );
               } 

               //:END
               //:szFootnoteNumber = mSubLC.MLC_UsageFootnote.wFootNoteRelativeNumber
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szFootnoteNumber;
               if ( szFootnoteNumber == null )
                  sb_szFootnoteNumber = new StringBuilder( 32 );
               else
                  sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                               GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_2, 'S', 4, mSubLC, "MLC_UsageFootnote", "wFootNoteRelativeNumber", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               //:szCombinedName = szCombinedName + "<sup> " + szFootnoteNumber + "</sup>"
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, "<sup> ", 1, 0, 101 );
               szCombinedName = sb_szCombinedName.toString( );}
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, szFootnoteNumber, 1, 0, 101 );
               szCombinedName = sb_szCombinedName.toString( );}
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, "</sup>", 1, 0, 101 );
               szCombinedName = sb_szCombinedName.toString( );}
            } 

            //:END
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC,
         //:                  InternalEntityStructure,
         //:                  InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szCombinedName );
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
//:dUsageClaimClass( VIEW mSubLC BASED ON LOD mSubLC,
//:                  STRING ( 32 ) InternalEntityStructure,
//:                  STRING ( 32 ) InternalAttribStructure,
//:                  SHORT GetOrSetFlag )

//:   STRING ( 32 )  szEntityName
public int 
omSubLC_dUsageClaimClass( View     mSubLC,
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
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttributeByContext( szUsageType, mSubLC, szEntityName, "UsageType", "FullUsageType", 32 )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttributeByContext( sb_szUsageType, mSubLC, szEntityName, "UsageType", "FullUsageType", 32 );
         szUsageType = sb_szUsageType.toString( );}
         //:GetStringFromAttribute( szClassification, mSubLC, szEntityName, "ClaimsClassification" )
         {StringBuilder sb_szClassification;
         if ( szClassification == null )
            sb_szClassification = new StringBuilder( 32 );
         else
            sb_szClassification = new StringBuilder( szClassification );
                   GetStringFromAttribute( sb_szClassification, mSubLC, szEntityName, "ClaimsClassification" );
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
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szUsageType )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szUsageType );
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
//:dMarketUsgNameFootnote( VIEW mSubLC BASED ON LOD mSubLC,
//:                        STRING ( 32 ) InternalEntityStructure,
//:                        STRING ( 32 ) InternalAttribStructure,
//:                        SHORT GetOrSetFlag )

//:   VIEW mSubLC2 BASED ON LOD mSubLC
public int 
omSubLC_dMarketUsgNameFootnote( View     mSubLC,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   zVIEW    mSubLC2 = new zVIEW( );
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
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szUsageType, mSubLC, szEntityName, "UsageType" )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttribute( sb_szUsageType, mSubLC, szEntityName, "UsageType" );
         szUsageType = sb_szUsageType.toString( );}
         //:GetStringFromAttribute( szClassification, mSubLC, szEntityName, "ClaimsClassification" )
         {StringBuilder sb_szClassification;
         if ( szClassification == null )
            sb_szClassification = new StringBuilder( 32 );
         else
            sb_szClassification = new StringBuilder( szClassification );
                   GetStringFromAttribute( sb_szClassification, mSubLC, szEntityName, "ClaimsClassification" );
         szClassification = sb_szClassification.toString( );}
         //:GetStringFromAttribute( szCombinedName, mSubLC, szEntityName, "Name" )
         {StringBuilder sb_szCombinedName;
         if ( szCombinedName == null )
            sb_szCombinedName = new StringBuilder( 32 );
         else
            sb_szCombinedName = new StringBuilder( szCombinedName );
                   GetStringFromAttribute( sb_szCombinedName, mSubLC, szEntityName, "Name" );
         szCombinedName = sb_szCombinedName.toString( );}

         //:// Set Footnote Number, if footnote exists.
         //:IF mSubLC.S_UsageFootnoteUsed EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "S_UsageFootnoteUsed" );
         if ( lTempInteger_0 == 0 )
         { 
            //:IF mSubLC.S_UsageFootnoteUsed.ID != ""
            if ( CompareAttributeToString( mSubLC, "S_UsageFootnoteUsed", "ID", "" ) != 0 )
            { 
               //:SET CURSOR FIRST mSubLC.S_UsageFootnote WHERE mSubLC.S_UsageFootnote.ID = mSubLC.S_UsageFootnoteMarketUsed.ID
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, mSubLC, "S_UsageFootnoteMarketUsed", "ID" );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_UsageFootnote", "ID", lTempInteger_1, "" );
               //:IF mSubLC.S_UsageFootnote.wFootNoteRelativeNumber = ""
               if ( CompareAttributeToString( mSubLC, "S_UsageFootnote", "wFootNoteRelativeNumber", "" ) == 0 )
               { 
                  //:// Relative numbers haven't been set, so set them here.
                  //:CreateViewFromView( mSubLC2, mSubLC )
                  CreateViewFromView( mSubLC2, mSubLC );
                  //:Count = 0
                  Count = 0;
                  //:FOR EACH mSubLC2.S_UsageFootnote
                  RESULT = SetCursorFirstEntity( mSubLC2, "S_UsageFootnote", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:Count = Count + 1
                     Count = Count + 1;
                     //:mSubLC2.S_UsageFootnote.wFootNoteRelativeNumber = Count
                     SetAttributeFromInteger( mSubLC2, "S_UsageFootnote", "wFootNoteRelativeNumber", Count );
                     RESULT = SetCursorNextEntity( mSubLC2, "S_UsageFootnote", "" );
                  } 

                  //:END
                  //:DropView( mSubLC2 )
                  DropView( mSubLC2 );
               } 

               //:END
               //:szFootnoteNumber = mSubLC.S_UsageFootnote.Symbol
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szFootnoteNumber;
               if ( szFootnoteNumber == null )
                  sb_szFootnoteNumber = new StringBuilder( 32 );
               else
                  sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                               GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_2, 'S', 33, mSubLC, "S_UsageFootnote", "Symbol", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               //:IF szFootnoteNumber = ""
               if ( ZeidonStringCompare( szFootnoteNumber, 1, 0, "", 1, 0, 33 ) == 0 )
               { 
                  //:szFootnoteNumber = mSubLC.S_UsageFootnote.wFootNoteRelativeNumber
                  {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                  StringBuilder sb_szFootnoteNumber;
                  if ( szFootnoteNumber == null )
                     sb_szFootnoteNumber = new StringBuilder( 32 );
                  else
                     sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                                     GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_3, 'S', 33, mSubLC, "S_UsageFootnote", "wFootNoteRelativeNumber", "", 0 );
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
         //:IF mSubLC.S_InsertTextKeywordMarketUsage EXISTS
         lTempInteger_4 = CheckExistenceOfEntity( mSubLC, "S_InsertTextKeywordMarketUsage" );
         if ( lTempInteger_4 == 0 )
         { 
            //:CreateViewFromView( mSubLC2, mSubLC )
            CreateViewFromView( mSubLC2, mSubLC );
            //:FOR EACH mSubLC2.S_InsertTextKeywordMarketUsage
            RESULT = SetCursorFirstEntity( mSubLC2, "S_InsertTextKeywordMarketUsage", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:// Reuse (borrow) szUsageType and szClassification
               //:szUsageType = "{" + mSubLC2.S_InsertTextKeywordMarketUsage.Name + "}"
               {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_5, 'S', 255, mSubLC2, "S_InsertTextKeywordMarketUsage", "Name", "", 0 );
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
               //:szClassification = "<b>" + mSubLC2.S_InsertTextMarketUsage.Text + "</b>"
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
               StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                               GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_6, 'S', 4097, mSubLC2, "S_InsertTextMarketUsage", "Text", "", 0 );
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
               RESULT = SetCursorNextEntity( mSubLC2, "S_InsertTextKeywordMarketUsage", "" );
            } 

            //:END
            //:DropView( mSubLC2 )
            DropView( mSubLC2 );
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szCombinedName );
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
//:dUsageNameFootnote( VIEW mSubLC BASED ON LOD mSubLC,
//:                    STRING ( 32 ) InternalEntityStructure,
//:                    STRING ( 32 ) InternalAttribStructure,
//:                    SHORT GetOrSetFlag )

//:   VIEW mSubLC2 BASED ON LOD mSubLC
public int 
omSubLC_dUsageNameFootnote( View     mSubLC,
                            String InternalEntityStructure,
                            String InternalAttribStructure,
                            Integer   GetOrSetFlag )
{
   zVIEW    mSubLC2 = new zVIEW( );
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
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szUsageType, mSubLC, szEntityName, "UsageType" )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttribute( sb_szUsageType, mSubLC, szEntityName, "UsageType" );
         szUsageType = sb_szUsageType.toString( );}
         //:GetStringFromAttribute( szClassification, mSubLC, szEntityName, "ClaimsClassification" )
         {StringBuilder sb_szClassification;
         if ( szClassification == null )
            sb_szClassification = new StringBuilder( 32 );
         else
            sb_szClassification = new StringBuilder( szClassification );
                   GetStringFromAttribute( sb_szClassification, mSubLC, szEntityName, "ClaimsClassification" );
         szClassification = sb_szClassification.toString( );}
         //:GetStringFromAttribute( szName, mSubLC, szEntityName, "Name" )
         {StringBuilder sb_szName;
         if ( szName == null )
            sb_szName = new StringBuilder( 32 );
         else
            sb_szName = new StringBuilder( szName );
                   GetStringFromAttribute( sb_szName, mSubLC, szEntityName, "Name" );
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
         //:IF mSubLC.S_UsageFootnoteUsed EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "S_UsageFootnoteUsed" );
         if ( lTempInteger_0 == 0 )
         { 
            //:IF mSubLC.S_UsageFootnoteUsed.ID != ""
            if ( CompareAttributeToString( mSubLC, "S_UsageFootnoteUsed", "ID", "" ) != 0 )
            { 
               //:SET CURSOR FIRST mSubLC.S_UsageFootnote WHERE mSubLC.S_UsageFootnote.ID = mSubLC.S_UsageFootnoteUsed.ID
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, mSubLC, "S_UsageFootnoteUsed", "ID" );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_UsageFootnote", "ID", lTempInteger_1, "" );
               //:IF mSubLC.S_UsageFootnote.wFootNoteRelativeNumber = ""
               if ( CompareAttributeToString( mSubLC, "S_UsageFootnote", "wFootNoteRelativeNumber", "" ) == 0 )
               { 
                  //:// Relative numbers haven't been set, so set them here.
                  //:CreateViewFromView( mSubLC2, mSubLC )
                  CreateViewFromView( mSubLC2, mSubLC );
                  //:Count = 0
                  Count = 0;
                  //:FOR EACH mSubLC2.S_UsageFootnote
                  RESULT = SetCursorFirstEntity( mSubLC2, "S_UsageFootnote", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:Count = Count + 1
                     Count = Count + 1;
                     //:mSubLC2.S_UsageFootnote.wFootNoteRelativeNumber = Count
                     SetAttributeFromInteger( mSubLC2, "S_UsageFootnote", "wFootNoteRelativeNumber", Count );
                     RESULT = SetCursorNextEntity( mSubLC2, "S_UsageFootnote", "" );
                  } 

                  //:END
                  //:DropView( mSubLC2 )
                  DropView( mSubLC2 );
               } 

               //:END
               //:szFootnoteNumber = mSubLC.S_UsageFootnote.Symbol
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szFootnoteNumber;
               if ( szFootnoteNumber == null )
                  sb_szFootnoteNumber = new StringBuilder( 32 );
               else
                  sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                               GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_2, 'S', 33, mSubLC, "S_UsageFootnote", "Symbol", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               //:IF szFootnoteNumber = ""
               if ( ZeidonStringCompare( szFootnoteNumber, 1, 0, "", 1, 0, 33 ) == 0 )
               { 
                  //:szFootnoteNumber = mSubLC.S_UsageFootnote.wFootNoteRelativeNumber
                  {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                  StringBuilder sb_szFootnoteNumber;
                  if ( szFootnoteNumber == null )
                     sb_szFootnoteNumber = new StringBuilder( 32 );
                  else
                     sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                                     GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_3, 'S', 33, mSubLC, "S_UsageFootnote", "wFootNoteRelativeNumber", "", 0 );
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
         //:IF mSubLC.S_InsertTextKeywordUsage EXISTS
         lTempInteger_4 = CheckExistenceOfEntity( mSubLC, "S_InsertTextKeywordUsage" );
         if ( lTempInteger_4 == 0 )
         { 
            //:CreateViewFromView( mSubLC2, mSubLC )
            CreateViewFromView( mSubLC2, mSubLC );
            //:FOR EACH mSubLC2.S_InsertTextKeywordUsage
            RESULT = SetCursorFirstEntity( mSubLC2, "S_InsertTextKeywordUsage", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:// Reuse (borrow) szUsageType and szClassification
               //:szUsageType = "{" + mSubLC2.S_InsertTextKeywordUsage.Name + "}"
               {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_5, 'S', 255, mSubLC2, "S_InsertTextKeywordUsage", "Name", "", 0 );
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
               //:szClassification = "<b>" + mSubLC2.S_InsertTextUsage.Text + "</b>"
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
               StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                               GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_6, 'S', 4097, mSubLC2, "S_InsertTextUsage", "Text", "", 0 );
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
               RESULT = SetCursorNextEntity( mSubLC2, "S_InsertTextKeywordUsage", "" );
            } 

            //:END
            //:DropView( mSubLC2 )
            DropView( mSubLC2 );
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szCombinedName );
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
//:dUsageKeywordText( VIEW mSubLC BASED ON LOD mSubLC,
//:                   STRING ( 32 ) InternalEntityStructure,
//:                   STRING ( 32 ) InternalAttribStructure,
//:                   SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szGeneratedString
public int 
omSubLC_dUsageKeywordText( View     mSubLC,
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
         //:FOR EACH mSubLC.S_InsertTextUsage
         RESULT = SetCursorFirstEntity( mSubLC, "S_InsertTextUsage", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF szGeneratedString = ""
            if ( ZeidonStringCompare( szGeneratedString, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szGeneratedString = mSubLC.S_InsertTextUsage.Text
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szGeneratedString;
               if ( szGeneratedString == null )
                  sb_szGeneratedString = new StringBuilder( 32 );
               else
                  sb_szGeneratedString = new StringBuilder( szGeneratedString );
                               GetVariableFromAttribute( sb_szGeneratedString, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_InsertTextUsage", "Text", "", 0 );
               lTempInteger_0 = mi_lTempInteger_0.intValue( );
               szGeneratedString = sb_szGeneratedString.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szGeneratedString = szGeneratedString + ", " + mSubLC.S_InsertTextUsage.Text
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
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 4097, mSubLC, "S_InsertTextUsage", "Text", "", 0 );
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

            RESULT = SetCursorNextEntity( mSubLC, "S_InsertTextUsage", "" );
            //:END
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
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
   //:dUsageKeywordStmtText( VIEW mSubLC BASED ON LOD mSubLC,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szGeneratedString
public int 
omSubLC_dUsageKeywordStmtText( View     mSubLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   String   szGeneratedString = null;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Expand the current Text attribute by replacing embedded Keywords with the Keyword
         //:// values in the S_InsertText subentities.
         //://?  szGeneratedString = mSubLC.DisplayKeywordText.Text
         //:IF szGeneratedString != ""
         if ( ZeidonStringCompare( szGeneratedString, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSubLC, szGeneratedString,
            //:                            "S_InsertTextKeyword", "S_InsertText", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
             {StringBuilder sb_szGeneratedString;
            if ( szGeneratedString == null )
               sb_szGeneratedString = new StringBuilder( 32 );
            else
               sb_szGeneratedString = new StringBuilder( szGeneratedString );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szGeneratedString, "S_InsertTextKeyword", "S_InsertText", ", " );
            szGeneratedString = sb_szGeneratedString.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
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
   //:dUsgPathogenOrFullName( VIEW mSubLC BASED ON LOD mSubLC,
   //:                     STRING ( 32 ) InternalEntityStructure,
   //:                     STRING ( 32 ) InternalAttribStructure,
   //:                     SHORT GetOrSetFlag )

   //:STRING ( 32 )  szEntityName
public int 
omSubLC_dUsgPathogenOrFullName( View     mSubLC,
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
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szUsageType, mSubLC, szEntityName, "UsageType" )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttribute( sb_szUsageType, mSubLC, szEntityName, "UsageType" );
         szUsageType = sb_szUsageType.toString( );}
         //:IF szUsageType = "C"
         if ( ZeidonStringCompare( szUsageType, 1, 0, "C", 1, 0, 101 ) == 0 )
         { 
            //:dPathogenNameKeyFoot( mSubLC, InternalEntityStructure, InternalAttribStructure, GetOrSetFlag )
            omSubLC_dPathogenNameKeyFoot( mSubLC, InternalEntityStructure, InternalAttribStructure, GetOrSetFlag );
            //:ELSE
         } 
         else
         { 
            //:dUsgFullEmbeddedName( mSubLC, InternalEntityStructure, InternalAttribStructure, GetOrSetFlag )
            omSubLC_dUsgFullEmbeddedName( mSubLC, InternalEntityStructure, InternalAttribStructure, GetOrSetFlag );
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


//:TRANSFORMATION OPERATION
//:BuildNewSLC_Version( VIEW NewSLC BASED ON LOD mSubLC,
//:                     VIEW PreviousSLC BASED ON LOD mSubLC,
//:                     VIEW SrcMLC BASED ON LOD mMasLC,
//:                     VIEW PreviousMLC BASED ON LOD mMasLC )

//:// STRING ( 10 ) szVersion
//:   STRING ( 1 )  szEntityFoundFlag
public int 
omSubLC_BuildNewSLC_Version( View     NewSLC,
                             View     PreviousSLC,
                             View     SrcMLC,
                             View     PreviousMLC )
{
   String   szEntityFoundFlag = null;
   //:STRING ( 50 ) szMessageComponent
   String   szMessageComponent = null;
   //:STRING ( 50 ) szMessageSubComponent
   String   szMessageSubComponent = null;
   int      RESULT = 0;
   String   szTempString_0 = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   String   szTempString_2 = null;
   int      lTempInteger_5 = 0;
   int      lTempInteger_6 = 0;
   String   szTempString_3 = null;
   int      lTempInteger_7 = 0;
   int      lTempInteger_8 = 0;
   int      lTempInteger_9 = 0;
   String   szTempString_4 = null;
   String   szTempString_5 = null;
   int      lTempInteger_10 = 0;
   int      lTempInteger_11 = 0;
   String   szTempString_6 = null;
   String   szTempString_7 = null;
   String   szTempString_8 = null;



   //:// Create a new SLC from a previous SLC, tying the new back to the original.
   //:// Note that the data content must come from the next MLC for the MLC tied to the original SLC.

   //:// Root and single includes
   //:SetMatchingAttributesByName( NewSLC, "SubregLabelContent", PreviousSLC, "SubregLabelContent", zSET_NULL )
   SetMatchingAttributesByName( NewSLC, "SubregLabelContent", PreviousSLC, "SubregLabelContent", zSET_NULL );
   //:SetAttributeFromCurrentDateTime( NewSLC, "SubregLabelContent", "RevisionDate" )
   {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( NewSLC );
    m_ZGlobal1_Operation.SetAttributeFromCurrentDateTime( NewSLC, "SubregLabelContent", "RevisionDate" );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   }
   //:NewSLC.SubregLabelContent.CreatedDateTime  = NewSLC.SubregLabelContent.RevisionDate
   SetAttributeFromAttribute( NewSLC, "SubregLabelContent", "CreatedDateTime", NewSLC, "SubregLabelContent", "RevisionDate" );
   //:NewSLC.SubregLabelContent.ModifiedDateTime = NewSLC.SubregLabelContent.RevisionDate
   SetAttributeFromAttribute( NewSLC, "SubregLabelContent", "ModifiedDateTime", NewSLC, "SubregLabelContent", "RevisionDate" );

   //:// S_Usage
   //:// Usages come from the MLC.
   //:FOR EACH PreviousSLC.S_UsageType
   RESULT = SetCursorFirstEntity( PreviousSLC, "S_UsageType", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_UsageType
      RESULT = CreateEntity( NewSLC, "S_UsageType", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_UsageType", PreviousSLC, "S_UsageType", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_UsageType", PreviousSLC, "S_UsageType", zSET_NULL );
      //:SET CURSOR FIRST PreviousMLC.M_UsageType WHERE PreviousMLC.M_UsageType.UsageType = PreviousSLC.S_UsageType.UsageType
      {StringBuilder sb_szTempString_0;
      if ( szTempString_0 == null )
         sb_szTempString_0 = new StringBuilder( 32 );
      else
         sb_szTempString_0 = new StringBuilder( szTempString_0 );
             GetStringFromAttribute( sb_szTempString_0, PreviousSLC, "S_UsageType", "UsageType" );
      szTempString_0 = sb_szTempString_0.toString( );}
      RESULT = SetCursorFirstEntityByString( PreviousMLC, "M_UsageType", "UsageType", szTempString_0, "" );
      //:SET CURSOR FIRST SrcMLC.M_UsageType WHERE SrcMLC.M_UsageType.UsageType = PreviousSLC.S_UsageType.UsageType
      {StringBuilder sb_szTempString_0;
      if ( szTempString_0 == null )
         sb_szTempString_0 = new StringBuilder( 32 );
      else
         sb_szTempString_0 = new StringBuilder( szTempString_0 );
             GetStringFromAttribute( sb_szTempString_0, PreviousSLC, "S_UsageType", "UsageType" );
      szTempString_0 = sb_szTempString_0.toString( );}
      RESULT = SetCursorFirstEntityByString( SrcMLC, "M_UsageType", "UsageType", szTempString_0, "" );
      //:FOR EACH PreviousSLC.S_Usage
      RESULT = SetCursorFirstEntity( PreviousSLC, "S_Usage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:// Check if the original S_Usage entry is tied to a new MLC M_Usage entry. (In other words, was the M_Usage entry
         //:// kept when the original usage entry was copied from MLC to MLC.) Use the data from the newer MLC if it exists.
         //:IF PreviousSLC.M_Usage EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( PreviousSLC, "M_Usage" );
         if ( lTempInteger_0 == 0 )
         { 
            //:SET CURSOR FIRST PreviousMLC.M_Usage WHERE PreviousMLC.M_Usage.ID = PreviousSLC.M_Usage.ID
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                         GetIntegerFromAttribute( mi_lTempInteger_1, PreviousSLC, "M_Usage", "ID" );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( PreviousMLC, "M_Usage", "ID", lTempInteger_1, "" );
            //:IF RESULT < zCURSOR_SET
            if ( RESULT < zCURSOR_SET )
            { 
               //:TraceLineS( "Programming Error 1", "" )
               TraceLineS( "Programming Error 1", "" );
               //:IssueError( NewSLC,0,0, "Programming Error 1" )
               IssueError( NewSLC, 0, 0, "Programming Error 1" );
            } 

            //:END
            //:SET CURSOR FIRST SrcMLC.MP_Usage WITHIN SrcMLC.M_UsageType
            //:           WHERE SrcMLC.MP_Usage.ID = PreviousMLC.M_Usage.ID
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                         GetIntegerFromAttribute( mi_lTempInteger_2, PreviousMLC, "M_Usage", "ID" );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( SrcMLC, "MP_Usage", "ID", lTempInteger_2, "M_UsageType" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:// The Usage entry does exist in the new
               //:CREATE ENTITY NewSLC.S_Usage
               RESULT = CreateEntity( NewSLC, "S_Usage", zPOS_AFTER );
               //:SetMatchingAttributesByName( NewSLC, "S_Usage", SrcMLC, "M_Usage", zSET_NULL )
               SetMatchingAttributesByName( NewSLC, "S_Usage", SrcMLC, "M_Usage", zSET_NULL );
               //:INCLUDE NewSLC.M_Usage FROM SrcMLC.M_Usage
               RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_Usage", SrcMLC, "M_Usage", zPOS_AFTER );
               //:ELSE
            } 
            else
            { 
               //:// The Usage entry doesn't exist, so create a change message notifying the operator.
               //:CREATE ENTITY NewSLC.S_VersionChangeMessage
               RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
               //:GetStringFromAttributeByContext( szMessageSubComponent, PreviousSLC, "S_UsageType", "UsageType", "FullUsageType", 50 )
               {StringBuilder sb_szMessageSubComponent;
               if ( szMessageSubComponent == null )
                  sb_szMessageSubComponent = new StringBuilder( 32 );
               else
                  sb_szMessageSubComponent = new StringBuilder( szMessageSubComponent );
                               GetStringFromAttributeByContext( sb_szMessageSubComponent, PreviousSLC, "S_UsageType", "UsageType", "FullUsageType", 50 );
               szMessageSubComponent = sb_szMessageSubComponent.toString( );}
               //:GetStringFromAttributeByContext( szMessageComponent, PreviousSLC, "S_Usage", "Name", "", 50 )
               {StringBuilder sb_szMessageComponent;
               if ( szMessageComponent == null )
                  sb_szMessageComponent = new StringBuilder( 32 );
               else
                  sb_szMessageComponent = new StringBuilder( szMessageComponent );
                               GetStringFromAttributeByContext( sb_szMessageComponent, PreviousSLC, "S_Usage", "Name", "", 50 );
               szMessageComponent = sb_szMessageComponent.toString( );}
               //:NewSLC.S_VersionChangeMessage.ChangeNote = "Deleted " + szMessageSubComponent + " Usage: " + szMessageComponent
                {StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                              ZeidonStringCopy( sb_szTempString_1, 1, 0, "Deleted ", 1, 0, 32001 );
               szTempString_1 = sb_szTempString_1.toString( );}
                {StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                              ZeidonStringConcat( sb_szTempString_1, 1, 0, szMessageSubComponent, 1, 0, 32001 );
               szTempString_1 = sb_szTempString_1.toString( );}
                {StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                              ZeidonStringConcat( sb_szTempString_1, 1, 0, " Usage: ", 1, 0, 32001 );
               szTempString_1 = sb_szTempString_1.toString( );}
                {StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                              ZeidonStringConcat( sb_szTempString_1, 1, 0, szMessageComponent, 1, 0, 32001 );
               szTempString_1 = sb_szTempString_1.toString( );}
               SetAttributeFromString( NewSLC, "S_VersionChangeMessage", "ChangeNote", szTempString_1 );
               //:CREATE ENTITY NewSLC.S_VersionChangeMessage   // Skip a line
               RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
            } 

            //:END
         } 

         RESULT = SetCursorNextEntity( PreviousSLC, "S_Usage", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( PreviousSLC, "S_UsageType", "" );
      //:END
   } 

   //:END

   //:// S_GeneralSection
   //:// General Sections must come entirely from the source MLC.
   //:FOR EACH SrcMLC.M_GeneralSection
   RESULT = SetCursorFirstEntity( SrcMLC, "M_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_GeneralSection
      RESULT = CreateEntity( NewSLC, "S_GeneralSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_GeneralSection", SrcMLC, "M_GeneralSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_GeneralSection", SrcMLC, "M_GeneralSection", zSET_NULL );
      //:INCLUDE NewSLC.M_GeneralSection FROM SrcMLC.M_GeneralSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_GeneralSection", SrcMLC, "M_GeneralSection", zPOS_AFTER );
      //:FOR EACH SrcMLC.M_GeneralStatement
      RESULT = SetCursorFirstEntity( SrcMLC, "M_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_GeneralStatement
         RESULT = CreateEntity( NewSLC, "S_GeneralStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_GeneralStatement", SrcMLC, "M_GeneralStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_GeneralStatement", SrcMLC, "M_GeneralStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_GeneralStatement FROM SrcMLC.M_GeneralStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_GeneralStatement", SrcMLC, "M_GeneralStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SrcMLC, "M_GeneralStatement", "" );
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_GeneralSection", "" );
      //:END
   } 

   //:END

   //:// S_IngredientsSection
   //:// The Ingredients Sections must come entirely from the source MLC.
   //:FOR EACH SrcMLC.M_IngredientsSection
   RESULT = SetCursorFirstEntity( SrcMLC, "M_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_IngredientsSection
      RESULT = CreateEntity( NewSLC, "S_IngredientsSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_IngredientsSection", SrcMLC, "M_IngredientsSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_IngredientsSection", SrcMLC, "M_IngredientsSection", zSET_NULL );
      //:INCLUDE NewSLC.M_IngredientsSection FROM SrcMLC.M_IngredientsSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_IngredientsSection", SrcMLC, "M_IngredientsSection", zPOS_AFTER );
      //:FOR EACH SrcMLC.M_IngredientsStatement
      RESULT = SetCursorFirstEntity( SrcMLC, "M_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_IngredientsStatement
         RESULT = CreateEntity( NewSLC, "S_IngredientsStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_IngredientsStatement", SrcMLC, "M_IngredientsStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_IngredientsStatement", SrcMLC, "M_IngredientsStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_IngredientsStatement FROM SrcMLC.M_IngredientsStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_IngredientsStatement", SrcMLC, "M_IngredientsStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SrcMLC, "M_IngredientsStatement", "" );
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_IngredientsSection", "" );
      //:END
   } 

   //:END

   //:// S_StorageDisposalSection
   //:// StorageDisposal Sections must come from the source MLC, except that, which Sections to use come from the previous SLC.
   //:FOR EACH PreviousSLC.S_StorageDisposalSection
   RESULT = SetCursorFirstEntity( PreviousSLC, "S_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST PreviousMLC.M_StorageDisposalSection WHERE PreviousMLC.M_StorageDisposalSection.ID = PreviousSLC.M_StorageDisposalSection.ID
      {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
             GetIntegerFromAttribute( mi_lTempInteger_3, PreviousSLC, "M_StorageDisposalSection", "ID" );
      lTempInteger_3 = mi_lTempInteger_3.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( PreviousMLC, "M_StorageDisposalSection", "ID", lTempInteger_3, "" );
      //:SET CURSOR FIRST SrcMLC.MP_StorageDisposalSection WITHIN SrcMLC.MasterLabelContent
      //:           WHERE SrcMLC.MP_StorageDisposalSection.ID = PreviousMLC.M_StorageDisposalSection.ID
      {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
             GetIntegerFromAttribute( mi_lTempInteger_4, PreviousMLC, "M_StorageDisposalSection", "ID" );
      lTempInteger_4 = mi_lTempInteger_4.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( SrcMLC, "MP_StorageDisposalSection", "ID", lTempInteger_4, "MasterLabelContent" );
      //:IF RESULT >= zCURSOR_SET
      if ( RESULT >= zCURSOR_SET )
      { 
         //:// Now just copy the entries from the MLC StorageDisposal Section.
         //:CREATE ENTITY NewSLC.S_StorageDisposalSection
         RESULT = CreateEntity( NewSLC, "S_StorageDisposalSection", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_StorageDisposalSection", SrcMLC, "M_StorageDisposalSection", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_StorageDisposalSection", SrcMLC, "M_StorageDisposalSection", zSET_NULL );
         //:INCLUDE NewSLC.M_StorageDisposalSection FROM SrcMLC.M_StorageDisposalSection
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_StorageDisposalSection", SrcMLC, "M_StorageDisposalSection", zPOS_AFTER );
         //:FOR EACH SrcMLC.M_StorageDisposalStatement
         RESULT = SetCursorFirstEntity( SrcMLC, "M_StorageDisposalStatement", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY NewSLC.S_StorageDisposalStatement
            RESULT = CreateEntity( NewSLC, "S_StorageDisposalStatement", zPOS_AFTER );
            //:SetMatchingAttributesByName( NewSLC, "S_StorageDisposalStatement", SrcMLC, "M_StorageDisposalStatement", zSET_NULL )
            SetMatchingAttributesByName( NewSLC, "S_StorageDisposalStatement", SrcMLC, "M_StorageDisposalStatement", zSET_NULL );
            //:INCLUDE NewSLC.M_StorageDisposalStatement FROM SrcMLC.M_StorageDisposalStatement
            RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_StorageDisposalStatement", SrcMLC, "M_StorageDisposalStatement", zPOS_AFTER );
            RESULT = SetCursorNextEntity( SrcMLC, "M_StorageDisposalStatement", "" );
         } 

         //:END
         //:ELSE
      } 
      else
      { 
         //:// Create error message that Storage and Disposal Section does not exist in new MLC.
         //:CREATE ENTITY NewSLC.S_VersionChangeMessage
         RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
         //:GetStringFromAttributeByContext( szMessageComponent, PreviousSLC, "S_StorageDisposalSection", "ContainerVolume", "", 50 )
         {StringBuilder sb_szMessageComponent;
         if ( szMessageComponent == null )
            sb_szMessageComponent = new StringBuilder( 32 );
         else
            sb_szMessageComponent = new StringBuilder( szMessageComponent );
                   GetStringFromAttributeByContext( sb_szMessageComponent, PreviousSLC, "S_StorageDisposalSection", "ContainerVolume", "", 50 );
         szMessageComponent = sb_szMessageComponent.toString( );}
         //:NewSLC.S_VersionChangeMessage.ChangeNote = "Deleted Storage and Disposal Section, " + szMessageComponent
          {StringBuilder sb_szTempString_2;
         if ( szTempString_2 == null )
            sb_szTempString_2 = new StringBuilder( 32 );
         else
            sb_szTempString_2 = new StringBuilder( szTempString_2 );
                  ZeidonStringCopy( sb_szTempString_2, 1, 0, "Deleted Storage and Disposal Section, ", 1, 0, 32001 );
         szTempString_2 = sb_szTempString_2.toString( );}
          {StringBuilder sb_szTempString_2;
         if ( szTempString_2 == null )
            sb_szTempString_2 = new StringBuilder( 32 );
         else
            sb_szTempString_2 = new StringBuilder( szTempString_2 );
                  ZeidonStringConcat( sb_szTempString_2, 1, 0, szMessageComponent, 1, 0, 32001 );
         szTempString_2 = sb_szTempString_2.toString( );}
         SetAttributeFromString( NewSLC, "S_VersionChangeMessage", "ChangeNote", szTempString_2 );
         //:CREATE ENTITY NewSLC.S_VersionChangeMessage   // Skip a line
         RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
      } 

      RESULT = SetCursorNextEntity( PreviousSLC, "S_StorageDisposalSection", "" );
      //:END
   } 

   //:END

   //:// S_DirectionsForUseSection
   //:// Until we understand better the rules that drive Directions For Use Sections, we will just use the same sections as those
   //:// in use by the source SLC.
   //:FOR EACH PreviousSLC.S_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( PreviousSLC, "S_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST PreviousMLC.M_DirectionsForUseSection
      //:           WHERE PreviousMLC.M_DirectionsForUseSection.ID = PreviousSLC.M_DirectionsForUseSection.ID
      {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
             GetIntegerFromAttribute( mi_lTempInteger_5, PreviousSLC, "M_DirectionsForUseSection", "ID" );
      lTempInteger_5 = mi_lTempInteger_5.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( PreviousMLC, "M_DirectionsForUseSection", "ID", lTempInteger_5, "" );
      //:SET CURSOR FIRST SrcMLC.MP_DirectionsForUseSection WITHIN PreviousMLC.MasterLabelContent
      //:           WHERE SrcMLC.MP_DirectionsForUseSection.ID = PreviousMLC.M_DirectionsForUseSection.ID
      {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
             GetIntegerFromAttribute( mi_lTempInteger_6, PreviousMLC, "M_DirectionsForUseSection", "ID" );
      lTempInteger_6 = mi_lTempInteger_6.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( SrcMLC, "MP_DirectionsForUseSection", "ID", lTempInteger_6, "MasterLabelContent" );
      //:IF RESULT < zCURSOR_SET
      if ( RESULT < zCURSOR_SET )
      { 
         //:// Create message that the Directions For Use Section has been deleted.
         //:CREATE ENTITY NewSLC.S_VersionChangeMessage
         RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
         //:GetStringFromAttributeByContext( szMessageComponent, PreviousSLC, "S_DirectionsForUseSection", "Name", "", 50 )
         {StringBuilder sb_szMessageComponent;
         if ( szMessageComponent == null )
            sb_szMessageComponent = new StringBuilder( 32 );
         else
            sb_szMessageComponent = new StringBuilder( szMessageComponent );
                   GetStringFromAttributeByContext( sb_szMessageComponent, PreviousSLC, "S_DirectionsForUseSection", "Name", "", 50 );
         szMessageComponent = sb_szMessageComponent.toString( );}
         //:NewSLC.S_VersionChangeMessage.ChangeNote = "Deleted Directions For Use Section, " + szMessageComponent
          {StringBuilder sb_szTempString_3;
         if ( szTempString_3 == null )
            sb_szTempString_3 = new StringBuilder( 32 );
         else
            sb_szTempString_3 = new StringBuilder( szTempString_3 );
                  ZeidonStringCopy( sb_szTempString_3, 1, 0, "Deleted Directions For Use Section, ", 1, 0, 32001 );
         szTempString_3 = sb_szTempString_3.toString( );}
          {StringBuilder sb_szTempString_3;
         if ( szTempString_3 == null )
            sb_szTempString_3 = new StringBuilder( 32 );
         else
            sb_szTempString_3 = new StringBuilder( szTempString_3 );
                  ZeidonStringConcat( sb_szTempString_3, 1, 0, szMessageComponent, 1, 0, 32001 );
         szTempString_3 = sb_szTempString_3.toString( );}
         SetAttributeFromString( NewSLC, "S_VersionChangeMessage", "ChangeNote", szTempString_3 );
         //:CREATE ENTITY NewSLC.S_VersionChangeMessage   // Skip a line
         RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
         //:ELSE
      } 
      else
      { 
         //:// Copy the MLC Section to the SLC.
         //:CREATE ENTITY NewSLC.S_DirectionsForUseSection
         RESULT = CreateEntity( NewSLC, "S_DirectionsForUseSection", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseSection", SrcMLC, "M_DirectionsForUseSection", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseSection", SrcMLC, "M_DirectionsForUseSection", zSET_NULL );
         //:INCLUDE NewSLC.M_DirectionsForUseSection FROM SrcMLC.M_DirectionsForUseSection
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_DirectionsForUseSection", SrcMLC, "M_DirectionsForUseSection", zPOS_AFTER );

         //:// Copy each MLC Directions For Use Statement to SLC.
         //:FOR EACH SrcMLC.M_DirectionsForUseStatement
         RESULT = SetCursorFirstEntity( SrcMLC, "M_DirectionsForUseStatement", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY NewSLC.S_DirectionsForUseStatement
            RESULT = CreateEntity( NewSLC, "S_DirectionsForUseStatement", zPOS_AFTER );
            //:SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseStatement", SrcMLC, "M_DirectionsForUseStatement", zSET_NULL )
            SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseStatement", SrcMLC, "M_DirectionsForUseStatement", zSET_NULL );
            //:// IF NewSLC.S_DirectionsForUseStatement.NotForUseType = ""
            //://    NewSLC.S_DirectionsForUseStatement.NotForUseType = "NA"
            //:// END
            //:INCLUDE NewSLC.M_DirectionsForUseStatement FROM SrcMLC.M_DirectionsForUseStatement
            RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_DirectionsForUseStatement", SrcMLC, "M_DirectionsForUseStatement", zPOS_AFTER );

            //:// Copy each MLC Statement Usage entry that has been copied to the SLC.
            //:FOR EACH SrcMLC.M_DirectionsUsageOrdering
            RESULT = SetCursorFirstEntity( SrcMLC, "M_DirectionsUsageOrdering", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:SET CURSOR FIRST NewSLC.M_Usage WITHIN NewSLC.SubregLabelContent
               //:           WHERE NewSLC.M_Usage.ID = SrcMLC.M_DirectionsUsage.ID
               {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
                               GetIntegerFromAttribute( mi_lTempInteger_7, SrcMLC, "M_DirectionsUsage", "ID" );
               lTempInteger_7 = mi_lTempInteger_7.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( NewSLC, "M_Usage", "ID", lTempInteger_7, "SubregLabelContent" );
               //:IF RESULT < zCURSOR_SET
               if ( RESULT < zCURSOR_SET )
               { 
                  //:CREATE ENTITY NewSLC.S_DirectionsUsageOrdering
                  RESULT = CreateEntity( NewSLC, "S_DirectionsUsageOrdering", zPOS_AFTER );
                  //:NewSLC.S_DirectionsUsageOrdering.PrimaryMLC_ID = SrcMLC.M_DirectionsUsage.ID
                  SetAttributeFromAttribute( NewSLC, "S_DirectionsUsageOrdering", "PrimaryMLC_ID", SrcMLC, "M_DirectionsUsage", "ID" );
                  //:INCLUDE NewSLC.S_DirectionsUsage FROM SrcMLC.M_DirectionsUsage
                  RESULT = IncludeSubobjectFromSubobject( NewSLC, "S_DirectionsUsage", SrcMLC, "M_DirectionsUsage", zPOS_AFTER );
               } 

               RESULT = SetCursorNextEntity( SrcMLC, "M_DirectionsUsageOrdering", "" );
               //:END
            } 

            RESULT = SetCursorNextEntity( SrcMLC, "M_DirectionsForUseStatement", "" );
            //:END
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( PreviousSLC, "S_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// S_MarketingSection
   //:// Marketing Sections come from the previous SLC.
   //:// However, we only build sections and statements that are also in the source MLC.
   //:FOR EACH PreviousSLC.S_MarketingSection
   RESULT = SetCursorFirstEntity( PreviousSLC, "S_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST PreviousMLC.M_MarketingSection WHERE PreviousMLC.M_MarketingSection.ID = PreviousSLC.M_MarketingSection.ID
      {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
             GetIntegerFromAttribute( mi_lTempInteger_8, PreviousSLC, "M_MarketingSection", "ID" );
      lTempInteger_8 = mi_lTempInteger_8.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( PreviousMLC, "M_MarketingSection", "ID", lTempInteger_8, "" );
      //:IF RESULT < zCURSOR_SET
      if ( RESULT < zCURSOR_SET )
      { 
         //:IssueError( NewSLC,0,0, "Programming Error 2" )
         IssueError( NewSLC, 0, 0, "Programming Error 2" );
      } 

      //:END
      //:SET CURSOR FIRST SrcMLC.MP_MarketingSection WITHIN SrcMLC.MasterLabelContent
      //:           WHERE SrcMLC.MP_MarketingSection.ID = PreviousMLC.M_MarketingSection.ID
      {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
             GetIntegerFromAttribute( mi_lTempInteger_9, PreviousMLC, "M_MarketingSection", "ID" );
      lTempInteger_9 = mi_lTempInteger_9.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( SrcMLC, "MP_MarketingSection", "ID", lTempInteger_9, "MasterLabelContent" );
      //:IF RESULT < zCURSOR_SET
      if ( RESULT < zCURSOR_SET )
      { 
         //:// The Marketing Section from the original MLC was not included in the new MLC, so create change message.
         //:CREATE ENTITY NewSLC.S_VersionChangeMessage
         RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
         //:GetStringFromAttributeByContext( szMessageComponent, PreviousSLC, "S_MarketingSection", "Name", "", 50 )
         {StringBuilder sb_szMessageComponent;
         if ( szMessageComponent == null )
            sb_szMessageComponent = new StringBuilder( 32 );
         else
            sb_szMessageComponent = new StringBuilder( szMessageComponent );
                   GetStringFromAttributeByContext( sb_szMessageComponent, PreviousSLC, "S_MarketingSection", "Name", "", 50 );
         szMessageComponent = sb_szMessageComponent.toString( );}
         //:NewSLC.S_VersionChangeMessage.ChangeNote = "Deleted Marketing Section, " + szMessageComponent
          {StringBuilder sb_szTempString_4;
         if ( szTempString_4 == null )
            sb_szTempString_4 = new StringBuilder( 32 );
         else
            sb_szTempString_4 = new StringBuilder( szTempString_4 );
                  ZeidonStringCopy( sb_szTempString_4, 1, 0, "Deleted Marketing Section, ", 1, 0, 32001 );
         szTempString_4 = sb_szTempString_4.toString( );}
          {StringBuilder sb_szTempString_4;
         if ( szTempString_4 == null )
            sb_szTempString_4 = new StringBuilder( 32 );
         else
            sb_szTempString_4 = new StringBuilder( szTempString_4 );
                  ZeidonStringConcat( sb_szTempString_4, 1, 0, szMessageComponent, 1, 0, 32001 );
         szTempString_4 = sb_szTempString_4.toString( );}
         SetAttributeFromString( NewSLC, "S_VersionChangeMessage", "ChangeNote", szTempString_4 );
         //:CREATE ENTITY NewSLC.S_VersionChangeMessage   // Skip a line
         RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
         //:ELSE
      } 
      else
      { 
         //:// The MLC Marketing Section has been copied, so bring it over.
         //:CREATE ENTITY NewSLC.S_MarketingSection
         RESULT = CreateEntity( NewSLC, "S_MarketingSection", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_MarketingSection", SrcMLC, "M_MarketingSection", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_MarketingSection", SrcMLC, "M_MarketingSection", zSET_NULL );
         //:INCLUDE NewSLC.M_MarketingSection FROM SrcMLC.M_MarketingSection
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_MarketingSection", SrcMLC, "M_MarketingSection", zPOS_AFTER );
         //:INCLUDE NewSLC.SP_MarketingSection FROM PreviousSLC.S_MarketingSection
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "SP_MarketingSection", PreviousSLC, "S_MarketingSection", zPOS_AFTER );

         //:// Create Title has changed message.
         //:IF PreviousSLC.S_MarketingSection.Title != NewSLC.S_MarketingSection.Title
         if ( CompareAttributeToAttribute( PreviousSLC, "S_MarketingSection", "Title", NewSLC, "S_MarketingSection", "Title" ) != 0 )
         { 
            //:CREATE ENTITY NewSLC.S_VersionChangeMessage
            RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
            //:GetStringFromAttributeByContext( szMessageComponent, NewSLC, "S_MarketingSection", "Title", "", 50 )
            {StringBuilder sb_szMessageComponent;
            if ( szMessageComponent == null )
               sb_szMessageComponent = new StringBuilder( 32 );
            else
               sb_szMessageComponent = new StringBuilder( szMessageComponent );
                         GetStringFromAttributeByContext( sb_szMessageComponent, NewSLC, "S_MarketingSection", "Title", "", 50 );
            szMessageComponent = sb_szMessageComponent.toString( );}
            //:GetStringFromAttributeByContext( szMessageSubComponent, PreviousSLC, "S_MarketingSection", "Title", "", 50 )
            {StringBuilder sb_szMessageSubComponent;
            if ( szMessageSubComponent == null )
               sb_szMessageSubComponent = new StringBuilder( 32 );
            else
               sb_szMessageSubComponent = new StringBuilder( szMessageSubComponent );
                         GetStringFromAttributeByContext( sb_szMessageSubComponent, PreviousSLC, "S_MarketingSection", "Title", "", 50 );
            szMessageSubComponent = sb_szMessageSubComponent.toString( );}
            //:NewSLC.S_VersionChangeMessage.ChangeNote = "Marketing Section Title has changed from '" + szMessageSubComponent +
            //:                                           "' to: '" + szMessageComponent + "'"
             {StringBuilder sb_szTempString_5;
            if ( szTempString_5 == null )
               sb_szTempString_5 = new StringBuilder( 32 );
            else
               sb_szTempString_5 = new StringBuilder( szTempString_5 );
                        ZeidonStringCopy( sb_szTempString_5, 1, 0, "Marketing Section Title has changed from '", 1, 0, 32001 );
            szTempString_5 = sb_szTempString_5.toString( );}
             {StringBuilder sb_szTempString_5;
            if ( szTempString_5 == null )
               sb_szTempString_5 = new StringBuilder( 32 );
            else
               sb_szTempString_5 = new StringBuilder( szTempString_5 );
                        ZeidonStringConcat( sb_szTempString_5, 1, 0, szMessageSubComponent, 1, 0, 32001 );
            szTempString_5 = sb_szTempString_5.toString( );}
             {StringBuilder sb_szTempString_5;
            if ( szTempString_5 == null )
               sb_szTempString_5 = new StringBuilder( 32 );
            else
               sb_szTempString_5 = new StringBuilder( szTempString_5 );
                        ZeidonStringConcat( sb_szTempString_5, 1, 0, "' to: '", 1, 0, 32001 );
            szTempString_5 = sb_szTempString_5.toString( );}
             {StringBuilder sb_szTempString_5;
            if ( szTempString_5 == null )
               sb_szTempString_5 = new StringBuilder( 32 );
            else
               sb_szTempString_5 = new StringBuilder( szTempString_5 );
                        ZeidonStringConcat( sb_szTempString_5, 1, 0, szMessageComponent, 1, 0, 32001 );
            szTempString_5 = sb_szTempString_5.toString( );}
             {StringBuilder sb_szTempString_5;
            if ( szTempString_5 == null )
               sb_szTempString_5 = new StringBuilder( 32 );
            else
               sb_szTempString_5 = new StringBuilder( szTempString_5 );
                        ZeidonStringConcat( sb_szTempString_5, 1, 0, "'", 1, 0, 32001 );
            szTempString_5 = sb_szTempString_5.toString( );}
            SetAttributeFromString( NewSLC, "S_VersionChangeMessage", "ChangeNote", szTempString_5 );
            //:CREATE ENTITY NewSLC.S_VersionChangeMessage   // Skip a line
            RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
         } 

         //:END

         //:// Statements
         //:FOR EACH PreviousSLC.S_MarketingStatement
         RESULT = SetCursorFirstEntity( PreviousSLC, "S_MarketingStatement", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST PreviousMLC.M_MarketingStatement WHERE PreviousMLC.M_MarketingStatement.ID = PreviousSLC.M_MarketingStatement.ID
            {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
                         GetIntegerFromAttribute( mi_lTempInteger_10, PreviousSLC, "M_MarketingStatement", "ID" );
            lTempInteger_10 = mi_lTempInteger_10.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( PreviousMLC, "M_MarketingStatement", "ID", lTempInteger_10, "" );
            //:IF RESULT < zCURSOR_SET
            if ( RESULT < zCURSOR_SET )
            { 
               //:IssueError( NewSLC,0,0, "Programming Error 3" )
               IssueError( NewSLC, 0, 0, "Programming Error 3" );
            } 

            //:END
            //:SET CURSOR FIRST SrcMLC.MP_MarketingStatement WITHIN SrcMLC.M_MarketingSection
            //:           WHERE SrcMLC.MP_MarketingStatement.ID = PreviousMLC.M_MarketingStatement.ID
            {MutableInt mi_lTempInteger_11 = new MutableInt( lTempInteger_11 );
                         GetIntegerFromAttribute( mi_lTempInteger_11, PreviousMLC, "M_MarketingStatement", "ID" );
            lTempInteger_11 = mi_lTempInteger_11.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( SrcMLC, "MP_MarketingStatement", "ID", lTempInteger_11, "M_MarketingSection" );
            //:IF RESULT < zCURSOR_SET
            if ( RESULT < zCURSOR_SET )
            { 
               //:// The Marketing Statement from the original MLC was not included in the new MLC, so create change message.
               //:CREATE ENTITY NewSLC.S_VersionChangeMessage
               RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
               //:GetStringFromAttributeByContext( szMessageComponent, PreviousSLC, "S_MarketingStatement", "Text", "", 50 )
               {StringBuilder sb_szMessageComponent;
               if ( szMessageComponent == null )
                  sb_szMessageComponent = new StringBuilder( 32 );
               else
                  sb_szMessageComponent = new StringBuilder( szMessageComponent );
                               GetStringFromAttributeByContext( sb_szMessageComponent, PreviousSLC, "S_MarketingStatement", "Text", "", 50 );
               szMessageComponent = sb_szMessageComponent.toString( );}
               //:NewSLC.S_VersionChangeMessage.ChangeNote = "Deleted Marketing Statement, " + NEW_LINE + NEW_LINE + szMessageComponent
                {StringBuilder sb_szTempString_6;
               if ( szTempString_6 == null )
                  sb_szTempString_6 = new StringBuilder( 32 );
               else
                  sb_szTempString_6 = new StringBuilder( szTempString_6 );
                              ZeidonStringCopy( sb_szTempString_6, 1, 0, "Deleted Marketing Statement, ", 1, 0, 32001 );
               szTempString_6 = sb_szTempString_6.toString( );}
                {StringBuilder sb_szTempString_6;
               if ( szTempString_6 == null )
                  sb_szTempString_6 = new StringBuilder( 32 );
               else
                  sb_szTempString_6 = new StringBuilder( szTempString_6 );
                              ZeidonStringConcat( sb_szTempString_6, 1, 0, NEW_LINE, 1, 0, 32001 );
               szTempString_6 = sb_szTempString_6.toString( );}
                {StringBuilder sb_szTempString_6;
               if ( szTempString_6 == null )
                  sb_szTempString_6 = new StringBuilder( 32 );
               else
                  sb_szTempString_6 = new StringBuilder( szTempString_6 );
                              ZeidonStringConcat( sb_szTempString_6, 1, 0, NEW_LINE, 1, 0, 32001 );
               szTempString_6 = sb_szTempString_6.toString( );}
                {StringBuilder sb_szTempString_6;
               if ( szTempString_6 == null )
                  sb_szTempString_6 = new StringBuilder( 32 );
               else
                  sb_szTempString_6 = new StringBuilder( szTempString_6 );
                              ZeidonStringConcat( sb_szTempString_6, 1, 0, szMessageComponent, 1, 0, 32001 );
               szTempString_6 = sb_szTempString_6.toString( );}
               SetAttributeFromString( NewSLC, "S_VersionChangeMessage", "ChangeNote", szTempString_6 );
               //:CREATE ENTITY NewSLC.S_VersionChangeMessage   // Skip a line
               RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
               //:ELSE
            } 
            else
            { 
               //:CREATE ENTITY NewSLC.S_MarketingStatement
               RESULT = CreateEntity( NewSLC, "S_MarketingStatement", zPOS_AFTER );
               //:SetMatchingAttributesByName( NewSLC, "S_MarketingStatement", SrcMLC, "M_MarketingStatement", zSET_NULL )
               SetMatchingAttributesByName( NewSLC, "S_MarketingStatement", SrcMLC, "M_MarketingStatement", zSET_NULL );
               //:INCLUDE NewSLC.M_MarketingStatement FROM SrcMLC.M_MarketingStatement
               RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_MarketingStatement", SrcMLC, "M_MarketingStatement", zPOS_AFTER );
               //:INCLUDE NewSLC.SP_MarketingStatement FROM PreviousSLC.S_MarketingStatement
               RESULT = IncludeSubobjectFromSubobject( NewSLC, "SP_MarketingStatement", PreviousSLC, "S_MarketingStatement", zPOS_AFTER );

               //:// If the Marketing Title or Text have changed, create a change message.
               //:IF PreviousSLC.S_MarketingStatement.Title != NewSLC.S_MarketingStatement.Title
               if ( CompareAttributeToAttribute( PreviousSLC, "S_MarketingStatement", "Title", NewSLC, "S_MarketingStatement", "Title" ) != 0 )
               { 
                  //:CREATE ENTITY NewSLC.S_VersionChangeMessage
                  RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
                  //:GetStringFromAttributeByContext( szMessageComponent, NewSLC, "S_MarketingStatement", "Title", "", 50 )
                  {StringBuilder sb_szMessageComponent;
                  if ( szMessageComponent == null )
                     sb_szMessageComponent = new StringBuilder( 32 );
                  else
                     sb_szMessageComponent = new StringBuilder( szMessageComponent );
                                     GetStringFromAttributeByContext( sb_szMessageComponent, NewSLC, "S_MarketingStatement", "Title", "", 50 );
                  szMessageComponent = sb_szMessageComponent.toString( );}
                  //:NewSLC.S_VersionChangeMessage.ChangeNote = "Marketing Statement Title has changed to: " + szMessageComponent
                   {StringBuilder sb_szTempString_7;
                  if ( szTempString_7 == null )
                     sb_szTempString_7 = new StringBuilder( 32 );
                  else
                     sb_szTempString_7 = new StringBuilder( szTempString_7 );
                                    ZeidonStringCopy( sb_szTempString_7, 1, 0, "Marketing Statement Title has changed to: ", 1, 0, 32001 );
                  szTempString_7 = sb_szTempString_7.toString( );}
                   {StringBuilder sb_szTempString_7;
                  if ( szTempString_7 == null )
                     sb_szTempString_7 = new StringBuilder( 32 );
                  else
                     sb_szTempString_7 = new StringBuilder( szTempString_7 );
                                    ZeidonStringConcat( sb_szTempString_7, 1, 0, szMessageComponent, 1, 0, 32001 );
                  szTempString_7 = sb_szTempString_7.toString( );}
                  SetAttributeFromString( NewSLC, "S_VersionChangeMessage", "ChangeNote", szTempString_7 );
                  //:CREATE ENTITY NewSLC.S_VersionChangeMessage   // Skip a line
                  RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
               } 

               //:END
               //:IF PreviousSLC.S_MarketingStatement.Text != NewSLC.S_MarketingStatement.Text
               if ( CompareAttributeToAttribute( PreviousSLC, "S_MarketingStatement", "Text", NewSLC, "S_MarketingStatement", "Text" ) != 0 )
               { 
                  //:CREATE ENTITY NewSLC.S_VersionChangeMessage
                  RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
                  //:NewSLC.S_VersionChangeMessage.ChangeNote = "Marketing Statement Text has changed from the first statement to the second: "
                  SetAttributeFromString( NewSLC, "S_VersionChangeMessage", "ChangeNote", "Marketing Statement Text has changed from the first statement to the second: " );
                  //:GetStringFromAttributeByContext( szMessageComponent, PreviousSLC, "S_MarketingStatement", "Text", "", 50 )
                  {StringBuilder sb_szMessageComponent;
                  if ( szMessageComponent == null )
                     sb_szMessageComponent = new StringBuilder( 32 );
                  else
                     sb_szMessageComponent = new StringBuilder( szMessageComponent );
                                     GetStringFromAttributeByContext( sb_szMessageComponent, PreviousSLC, "S_MarketingStatement", "Text", "", 50 );
                  szMessageComponent = sb_szMessageComponent.toString( );}
                  //:CREATE ENTITY NewSLC.S_VersionChangeMessage
                  RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
                  //:NewSLC.S_VersionChangeMessage.ChangeNote = szMessageComponent
                  SetAttributeFromString( NewSLC, "S_VersionChangeMessage", "ChangeNote", szMessageComponent );
                  //:GetStringFromAttributeByContext( szMessageComponent, NewSLC, "S_MarketingStatement", "Text", "", 50 )
                  {StringBuilder sb_szMessageComponent;
                  if ( szMessageComponent == null )
                     sb_szMessageComponent = new StringBuilder( 32 );
                  else
                     sb_szMessageComponent = new StringBuilder( szMessageComponent );
                                     GetStringFromAttributeByContext( sb_szMessageComponent, NewSLC, "S_MarketingStatement", "Text", "", 50 );
                  szMessageComponent = sb_szMessageComponent.toString( );}
                  //:CREATE ENTITY NewSLC.S_VersionChangeMessage
                  RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
                  //:NewSLC.S_VersionChangeMessage.ChangeNote = szMessageComponent
                  SetAttributeFromString( NewSLC, "S_VersionChangeMessage", "ChangeNote", szMessageComponent );
                  //:CREATE ENTITY NewSLC.S_VersionChangeMessage   // Skip a line
                  RESULT = CreateEntity( NewSLC, "S_VersionChangeMessage", zPOS_AFTER );
               } 

               //:END
            } 

            //:END

            //:// Usages
            //:// Create only MarketingUsages from the original SLC under the statement that are among the Usage entries included in the NewSLC.
            //:FOR EACH PreviousSLC.S_MarketingUsageOrdering
            RESULT = SetCursorFirstEntity( PreviousSLC, "S_MarketingUsageOrdering", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:SET CURSOR FIRST NewSLC.S_UsageType WHERE NewSLC.S_UsageType.UsageType = PreviousSLC.S_MarketingUsage.UsageType
               {StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetStringFromAttribute( sb_szTempString_0, PreviousSLC, "S_MarketingUsage", "UsageType" );
               szTempString_0 = sb_szTempString_0.toString( );}
               RESULT = SetCursorFirstEntityByString( NewSLC, "S_UsageType", "UsageType", szTempString_0, "" );
               //:SET CURSOR FIRST NewSLC.S_Usage WHERE NewSLC.S_Usage.Name = PreviousSLC.S_MarketingUsage.Name
               {StringBuilder sb_szTempString_8;
               if ( szTempString_8 == null )
                  sb_szTempString_8 = new StringBuilder( 32 );
               else
                  sb_szTempString_8 = new StringBuilder( szTempString_8 );
                               GetStringFromAttribute( sb_szTempString_8, PreviousSLC, "S_MarketingUsage", "Name" );
               szTempString_8 = sb_szTempString_8.toString( );}
               RESULT = SetCursorFirstEntityByString( NewSLC, "S_Usage", "Name", szTempString_8, "" );
               //:IF RESULT >= zCURSOR_SET
               if ( RESULT >= zCURSOR_SET )
               { 
                  //:CREATE ENTITY NewSLC.S_MarketingUsageOrdering
                  RESULT = CreateEntity( NewSLC, "S_MarketingUsageOrdering", zPOS_AFTER );
                  //:INCLUDE NewSLC.S_MarketingUsage FROM NewSLC.S_Usage
                  RESULT = IncludeSubobjectFromSubobject( NewSLC, "S_MarketingUsage", NewSLC, "S_Usage", zPOS_AFTER );
               } 

               RESULT = SetCursorNextEntity( PreviousSLC, "S_MarketingUsageOrdering", "" );
               //:END
            } 

            RESULT = SetCursorNextEntity( PreviousSLC, "S_MarketingStatement", "" );
            //:END
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( PreviousSLC, "S_MarketingSection", "" );
      //:END
   } 

   //:END

   //:// S_HumanHazardSection
   //:// The HumanHazard Sections must come entirely from the source MLC.
   //:FOR EACH SrcMLC.M_HumanHazardSection
   RESULT = SetCursorFirstEntity( SrcMLC, "M_HumanHazardSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_HumanHazardSection
      RESULT = CreateEntity( NewSLC, "S_HumanHazardSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_HumanHazardSection", SrcMLC, "M_HumanHazardSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_HumanHazardSection", SrcMLC, "M_HumanHazardSection", zSET_NULL );
      //:INCLUDE NewSLC.M_HumanHazardSection FROM SrcMLC.M_HumanHazardSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_HumanHazardSection", SrcMLC, "M_HumanHazardSection", zPOS_AFTER );
      RESULT = SetCursorNextEntity( SrcMLC, "M_HumanHazardSection", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:DuplicateSLC( VIEW NewSLC BASED ON LOD mSubLC,
//:              VIEW PreviousSLC BASED ON LOD mSubLC )

//:// STRING ( 10 ) szVersion
//:   STRING ( 1 )  szEntityFoundFlag
public int 
omSubLC_DuplicateSLC( View     NewSLC,
                      View     PreviousSLC )
{
   String   szEntityFoundFlag = null;
   int      RESULT = 0;
   String   szTempString_0 = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   String   szTempString_1 = null;
   String   szTempString_2 = null;


   //:// Create a new SLC from a previous SLC, tying the new back to the original.
   //:// This differs from BuildNewSLC_Version in that the new SLC created here is tied back to the
   //:// same MLC as the source SLC.

   //:// Root and single includes
   //:CREATE ENTITY NewSLC.SubregLabelContent
   RESULT = CreateEntity( NewSLC, "SubregLabelContent", zPOS_AFTER );
   //:SetMatchingAttributesByName( NewSLC, "SubregLabelContent", PreviousSLC, "SubregLabelContent", zSET_NULL )
   SetMatchingAttributesByName( NewSLC, "SubregLabelContent", PreviousSLC, "SubregLabelContent", zSET_NULL );
   //:SetAttributeFromCurrentDateTime( NewSLC, "SubregLabelContent", "RevisionDate" )
   {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( NewSLC );
    m_ZGlobal1_Operation.SetAttributeFromCurrentDateTime( NewSLC, "SubregLabelContent", "RevisionDate" );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   }
   //:NewSLC.SubregLabelContent.Description = PreviousSLC.SubregLabelContent.Description + " (Duplicate)"
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, PreviousSLC, "SubregLabelContent", "Description" );
   szTempString_0 = sb_szTempString_0.toString( );}
    {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
      ZeidonStringConcat( sb_szTempString_0, 1, 0, " (Duplicate)", 1, 0, 4097 );
   szTempString_0 = sb_szTempString_0.toString( );}
   SetAttributeFromString( NewSLC, "SubregLabelContent", "Description", szTempString_0 );
   //:INCLUDE NewSLC.SubregProduct FROM PreviousSLC.SubregProduct
   RESULT = IncludeSubobjectFromSubobject( NewSLC, "SubregProduct", PreviousSLC, "SubregProduct", zPOS_AFTER );
   //:INCLUDE NewSLC.MasterLabelContent FROM PreviousSLC.MasterLabelContent
   RESULT = IncludeSubobjectFromSubobject( NewSLC, "MasterLabelContent", PreviousSLC, "MasterLabelContent", zPOS_AFTER );

   //:// S_Usage
   //:FOR EACH PreviousSLC.S_UsageType
   RESULT = SetCursorFirstEntity( PreviousSLC, "S_UsageType", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_UsageType
      RESULT = CreateEntity( NewSLC, "S_UsageType", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_UsageType", PreviousSLC, "S_UsageType", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_UsageType", PreviousSLC, "S_UsageType", zSET_NULL );
      //:FOR EACH PreviousSLC.S_Usage
      RESULT = SetCursorFirstEntity( PreviousSLC, "S_Usage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_Usage
         RESULT = CreateEntity( NewSLC, "S_Usage", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_Usage", PreviousSLC, "S_Usage", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_Usage", PreviousSLC, "S_Usage", zSET_NULL );
         //:INCLUDE NewSLC.M_Usage FROM PreviousSLC.M_Usage
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_Usage", PreviousSLC, "M_Usage", zPOS_AFTER );
         RESULT = SetCursorNextEntity( PreviousSLC, "S_Usage", "" );
      } 

      RESULT = SetCursorNextEntity( PreviousSLC, "S_UsageType", "" );
      //:END
   } 

   //:END

   //:// S_GeneralSection
   //:FOR EACH PreviousSLC.S_GeneralSection
   RESULT = SetCursorFirstEntity( PreviousSLC, "S_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_GeneralSection
      RESULT = CreateEntity( NewSLC, "S_GeneralSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_GeneralSection", PreviousSLC, "S_GeneralSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_GeneralSection", PreviousSLC, "S_GeneralSection", zSET_NULL );
      //:INCLUDE NewSLC.M_GeneralSection FROM PreviousSLC.M_GeneralSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_GeneralSection", PreviousSLC, "M_GeneralSection", zPOS_AFTER );
      //:FOR EACH PreviousSLC.S_GeneralStatement
      RESULT = SetCursorFirstEntity( PreviousSLC, "S_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_GeneralStatement
         RESULT = CreateEntity( NewSLC, "S_GeneralStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_GeneralStatement", PreviousSLC, "S_GeneralStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_GeneralStatement", PreviousSLC, "S_GeneralStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_GeneralStatement FROM PreviousSLC.M_GeneralStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_GeneralStatement", PreviousSLC, "M_GeneralStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( PreviousSLC, "S_GeneralStatement", "" );
      } 

      RESULT = SetCursorNextEntity( PreviousSLC, "S_GeneralSection", "" );
      //:END
   } 

   //:END

   //:// S_IngredientsSection
   //:FOR EACH PreviousSLC.S_IngredientsSection
   RESULT = SetCursorFirstEntity( PreviousSLC, "S_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_IngredientsSection
      RESULT = CreateEntity( NewSLC, "S_IngredientsSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_IngredientsSection", PreviousSLC, "S_IngredientsSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_IngredientsSection", PreviousSLC, "S_IngredientsSection", zSET_NULL );
      //:INCLUDE NewSLC.M_IngredientsSection FROM PreviousSLC.M_IngredientsSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_IngredientsSection", PreviousSLC, "M_IngredientsSection", zPOS_AFTER );
      //:FOR EACH PreviousSLC.S_IngredientsStatement
      RESULT = SetCursorFirstEntity( PreviousSLC, "S_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_IngredientsStatement
         RESULT = CreateEntity( NewSLC, "S_IngredientsStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_IngredientsStatement", PreviousSLC, "S_IngredientsStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_IngredientsStatement", PreviousSLC, "S_IngredientsStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_IngredientsStatement FROM PreviousSLC.M_IngredientsStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_IngredientsStatement", PreviousSLC, "M_IngredientsStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( PreviousSLC, "S_IngredientsStatement", "" );
      } 

      RESULT = SetCursorNextEntity( PreviousSLC, "S_IngredientsSection", "" );
      //:END
   } 

   //:END

   //:// S_StorageDisposalSection
   //:FOR EACH PreviousSLC.S_StorageDisposalSection
   RESULT = SetCursorFirstEntity( PreviousSLC, "S_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_StorageDisposalSection
      RESULT = CreateEntity( NewSLC, "S_StorageDisposalSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_StorageDisposalSection", PreviousSLC, "S_StorageDisposalSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_StorageDisposalSection", PreviousSLC, "S_StorageDisposalSection", zSET_NULL );
      //:INCLUDE NewSLC.M_StorageDisposalSection FROM PreviousSLC.M_StorageDisposalSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_StorageDisposalSection", PreviousSLC, "M_StorageDisposalSection", zPOS_AFTER );
      //:FOR EACH PreviousSLC.S_StorageDisposalStatement
      RESULT = SetCursorFirstEntity( PreviousSLC, "S_StorageDisposalStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_StorageDisposalStatement
         RESULT = CreateEntity( NewSLC, "S_StorageDisposalStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_StorageDisposalStatement", PreviousSLC, "S_StorageDisposalStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_StorageDisposalStatement", PreviousSLC, "S_StorageDisposalStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_StorageDisposalStatement FROM PreviousSLC.M_StorageDisposalStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_StorageDisposalStatement", PreviousSLC, "M_StorageDisposalStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( PreviousSLC, "S_StorageDisposalStatement", "" );
      } 

      RESULT = SetCursorNextEntity( PreviousSLC, "S_StorageDisposalSection", "" );
      //:END
   } 

   //:END

   //:// S_DirectionsForUseSection
   //:FOR EACH PreviousSLC.S_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( PreviousSLC, "S_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_DirectionsForUseSection
      RESULT = CreateEntity( NewSLC, "S_DirectionsForUseSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseSection", PreviousSLC, "S_DirectionsForUseSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseSection", PreviousSLC, "S_DirectionsForUseSection", zSET_NULL );
      //:INCLUDE NewSLC.M_DirectionsForUseSection FROM PreviousSLC.M_DirectionsForUseSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_DirectionsForUseSection", PreviousSLC, "M_DirectionsForUseSection", zPOS_AFTER );
      //:FOR EACH PreviousSLC.S_DirectionsForUseStatement
      RESULT = SetCursorFirstEntity( PreviousSLC, "S_DirectionsForUseStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_DirectionsForUseStatement
         RESULT = CreateEntity( NewSLC, "S_DirectionsForUseStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseStatement", PreviousSLC, "S_DirectionsForUseStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseStatement", PreviousSLC, "S_DirectionsForUseStatement", zSET_NULL );
         //:// IF NewSLC.S_DirectionsForUseStatement.NotForUseType = ""
         //://    NewSLC.S_DirectionsForUseStatement.NotForUseType = "NA"
         //:// END
         //:INCLUDE NewSLC.M_DirectionsForUseStatement FROM PreviousSLC.M_DirectionsForUseStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_DirectionsForUseStatement", PreviousSLC, "M_DirectionsForUseStatement", zPOS_AFTER );

         //:// UsageOrder entries
         //:FOR EACH PreviousSLC.S_DirectionsUsageOrdering
         RESULT = SetCursorFirstEntity( PreviousSLC, "S_DirectionsUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY NewSLC.S_DirectionsUsageOrdering
            RESULT = CreateEntity( NewSLC, "S_DirectionsUsageOrdering", zPOS_AFTER );
            //:SetMatchingAttributesByName( NewSLC, "S_DirectionsUsageOrdering", PreviousSLC, "S_DirectionsUsageOrdering", zSET_NULL )
            SetMatchingAttributesByName( NewSLC, "S_DirectionsUsageOrdering", PreviousSLC, "S_DirectionsUsageOrdering", zSET_NULL );

            //:// We need to include the new S_Usage entry created in the NewSLC.
            //:SET CURSOR FIRST PreviousSLC.S_Usage WITHIN NewSLC.SubregLabelContent
            //:           WHERE PreviousSLC.S_Usage.ID = PreviousSLC.S_DirectionsUsage.ID
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                         GetIntegerFromAttribute( mi_lTempInteger_0, PreviousSLC, "S_DirectionsUsage", "ID" );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( PreviousSLC, "S_Usage", "ID", lTempInteger_0, "SubregLabelContent" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:SET CURSOR FIRST NewSLC.M_Usage WITHIN NewSLC.SubregLabelContent
               //:           WHERE NewSLC.M_Usage.ID = PreviousSLC.M_Usage.ID
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, PreviousSLC, "M_Usage", "ID" );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( NewSLC, "M_Usage", "ID", lTempInteger_1, "SubregLabelContent" );
               //:IF RESULT >= zCURSOR_SET
               if ( RESULT >= zCURSOR_SET )
               { 
                  //:INCLUDE NewSLC.S_DirectionsUsage FROM NewSLC.S_Usage
                  RESULT = IncludeSubobjectFromSubobject( NewSLC, "S_DirectionsUsage", NewSLC, "S_Usage", zPOS_AFTER );
               } 

               //:END
            } 

            RESULT = SetCursorNextEntity( PreviousSLC, "S_DirectionsUsageOrdering", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( PreviousSLC, "S_DirectionsForUseStatement", "" );
         //:END
      } 

      //:END

      //:// We need to include any NewSLC.S_ClaimsDrivingUsage from the S_Usage entry created in the NewSLC.
      //:FOR EACH PreviousSLC.S_ClaimsDrivingUsage
      RESULT = SetCursorFirstEntity( PreviousSLC, "S_ClaimsDrivingUsage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST PreviousSLC.S_Usage WITHIN PreviousSLC.SubregLabelContent
         //:           WHERE PreviousSLC.S_Usage.ID = PreviousSLC.S_ClaimsDrivingUsage.ID
         {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                   GetIntegerFromAttribute( mi_lTempInteger_2, PreviousSLC, "S_ClaimsDrivingUsage", "ID" );
         lTempInteger_2 = mi_lTempInteger_2.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( PreviousSLC, "S_Usage", "ID", lTempInteger_2, "SubregLabelContent" );
         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:SET CURSOR FIRST NewSLC.M_Usage WITHIN NewSLC.SubregLabelContent
            //:           WHERE NewSLC.M_Usage.ID = PreviousSLC.M_Usage.ID
            {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                         GetIntegerFromAttribute( mi_lTempInteger_3, PreviousSLC, "M_Usage", "ID" );
            lTempInteger_3 = mi_lTempInteger_3.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( NewSLC, "M_Usage", "ID", lTempInteger_3, "SubregLabelContent" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:INCLUDE NewSLC.S_ClaimsDrivingUsage FROM NewSLC.S_Usage
               RESULT = IncludeSubobjectFromSubobject( NewSLC, "S_ClaimsDrivingUsage", NewSLC, "S_Usage", zPOS_AFTER );
            } 

            //:END
         } 

         RESULT = SetCursorNextEntity( PreviousSLC, "S_ClaimsDrivingUsage", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( PreviousSLC, "S_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// S_MarketingSection
   //:FOR EACH PreviousSLC.S_MarketingSection
   RESULT = SetCursorFirstEntity( PreviousSLC, "S_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_MarketingSection
      RESULT = CreateEntity( NewSLC, "S_MarketingSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_MarketingSection", PreviousSLC, "S_MarketingSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_MarketingSection", PreviousSLC, "S_MarketingSection", zSET_NULL );
      //:INCLUDE NewSLC.M_MarketingSection FROM PreviousSLC.M_MarketingSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_MarketingSection", PreviousSLC, "M_MarketingSection", zPOS_AFTER );
      //:FOR EACH PreviousSLC.S_MarketingStatement
      RESULT = SetCursorFirstEntity( PreviousSLC, "S_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_MarketingStatement
         RESULT = CreateEntity( NewSLC, "S_MarketingStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_MarketingStatement", PreviousSLC, "S_MarketingStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_MarketingStatement", PreviousSLC, "S_MarketingStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_MarketingStatement FROM PreviousSLC.M_MarketingStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_MarketingStatement", PreviousSLC, "M_MarketingStatement", zPOS_AFTER );

         //:// UsageOrder entries
         //:FOR EACH PreviousSLC.S_MarketingUsageOrdering
         RESULT = SetCursorFirstEntity( PreviousSLC, "S_MarketingUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF PreviousSLC.S_MarketingUsage EXISTS
            lTempInteger_4 = CheckExistenceOfEntity( PreviousSLC, "S_MarketingUsage" );
            if ( lTempInteger_4 == 0 )
            { 
               //:// Position on equivalent S_Usage entry in new SLC. If it's not there, don't create the S_MarketingUsageOrdering entry.
               //:SET CURSOR FIRST NewSLC.S_UsageType WHERE NewSLC.S_UsageType.UsageType = PreviousSLC.S_MarketingUsage.UsageType
               {StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                               GetStringFromAttribute( sb_szTempString_1, PreviousSLC, "S_MarketingUsage", "UsageType" );
               szTempString_1 = sb_szTempString_1.toString( );}
               RESULT = SetCursorFirstEntityByString( NewSLC, "S_UsageType", "UsageType", szTempString_1, "" );
               //:IF RESULT < zCURSOR_SET
               if ( RESULT < zCURSOR_SET )
               { 
                  //:IssueError( PreviousSLC,0,0, "Programming Error UsageType" )
                  IssueError( PreviousSLC, 0, 0, "Programming Error UsageType" );
               } 

               //:END
               //:SET CURSOR FIRST NewSLC.S_Usage WHERE NewSLC.S_Usage.Name = PreviousSLC.S_Usage.Name
               {StringBuilder sb_szTempString_2;
               if ( szTempString_2 == null )
                  sb_szTempString_2 = new StringBuilder( 32 );
               else
                  sb_szTempString_2 = new StringBuilder( szTempString_2 );
                               GetStringFromAttribute( sb_szTempString_2, PreviousSLC, "S_Usage", "Name" );
               szTempString_2 = sb_szTempString_2.toString( );}
               RESULT = SetCursorFirstEntityByString( NewSLC, "S_Usage", "Name", szTempString_2, "" );
               //:IF RESULT >= zCURSOR_SET
               if ( RESULT >= zCURSOR_SET )
               { 
                  //:// It exists, so create entity and include S_Usage.
                  //:CREATE ENTITY NewSLC.S_MarketingUsageOrdering
                  RESULT = CreateEntity( NewSLC, "S_MarketingUsageOrdering", zPOS_AFTER );
                  //:SetMatchingAttributesByName( NewSLC, "S_MarketingUsageOrdering", PreviousSLC, "S_MarketingUsageOrdering", zSET_NULL )
                  SetMatchingAttributesByName( NewSLC, "S_MarketingUsageOrdering", PreviousSLC, "S_MarketingUsageOrdering", zSET_NULL );
                  //:INCLUDE NewSLC.S_MarketingUsage FROM NewSLC.S_Usage
                  RESULT = IncludeSubobjectFromSubobject( NewSLC, "S_MarketingUsage", NewSLC, "S_Usage", zPOS_AFTER );
               } 

               //:END
            } 

            RESULT = SetCursorNextEntity( PreviousSLC, "S_MarketingUsageOrdering", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( PreviousSLC, "S_MarketingStatement", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( PreviousSLC, "S_MarketingSection", "" );
      //:END
   } 

   //:END


   //:// S_HumanHazardSection
   //:FOR EACH PreviousSLC.S_HumanHazardSection
   RESULT = SetCursorFirstEntity( PreviousSLC, "S_HumanHazardSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_HumanHazardSection
      RESULT = CreateEntity( NewSLC, "S_HumanHazardSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_HumanHazardSection", PreviousSLC, "S_HumanHazardSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_HumanHazardSection", PreviousSLC, "S_HumanHazardSection", zSET_NULL );
      //:INCLUDE NewSLC.M_HumanHazardSection FROM PreviousSLC.M_HumanHazardSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_HumanHazardSection", PreviousSLC, "M_HumanHazardSection", zPOS_AFTER );
      RESULT = SetCursorNextEntity( PreviousSLC, "S_HumanHazardSection", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:LOCAL OPERATION
private int 
omSubLC_CopyStorageDisposalStmts( View     NewSLC,
                                  View     SrcMLC )
{
   int      RESULT = 0;
   int      lTempInteger_0 = 0;

   //:CopyStorageDisposalStmts( VIEW NewSLC, VIEW SrcMLC )

   //:FOR EACH SrcMLC.M_StorageDisposalStatement
   RESULT = SetCursorFirstEntity( SrcMLC, "M_StorageDisposalStatement", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_StorageDisposalStatement
      RESULT = CreateEntity( NewSLC, "S_StorageDisposalStatement", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_StorageDisposalStatement", SrcMLC, "M_StorageDisposalStatement", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_StorageDisposalStatement", SrcMLC, "M_StorageDisposalStatement", zSET_NULL );
      //:FOR EACH SrcMLC.M_InsertTextKeywordSD
      RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextKeywordSD", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_InsertTextKeywordSD
         RESULT = CreateEntity( NewSLC, "S_InsertTextKeywordSD", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_InsertTextKeywordSD", SrcMLC, "M_InsertTextKeywordSD", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_InsertTextKeywordSD", SrcMLC, "M_InsertTextKeywordSD", zSET_NULL );
         //:FOR EACH SrcMLC.M_InsertTextSD
         RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextSD", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY NewSLC.S_InsertTextSD
            RESULT = CreateEntity( NewSLC, "S_InsertTextSD", zPOS_AFTER );
            //:SetMatchingAttributesByName( NewSLC, "S_InsertTextSD", SrcMLC, "M_InsertTextSD", zSET_NULL )
            SetMatchingAttributesByName( NewSLC, "S_InsertTextSD", SrcMLC, "M_InsertTextSD", zSET_NULL );
            RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextSD", "" );
         } 

         RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextKeywordSD", "" );
         //:END
      } 

      //:END
      //:IF SrcMLC.M_StorageDisposalSubStatement EXISTS
      lTempInteger_0 = CheckExistenceOfEntity( SrcMLC, "M_StorageDisposalSubStatement" );
      if ( lTempInteger_0 == 0 )
      { 
         //:SetViewToSubobject( SrcMLC, "M_StorageDisposalSubStatement" )
         SetViewToSubobject( SrcMLC, "M_StorageDisposalSubStatement" );
         //:SetViewToSubobject( NewSLC, "S_StorageDisposalSubStatement" )
         SetViewToSubobject( NewSLC, "S_StorageDisposalSubStatement" );
         //:FOR EACH SrcMLC.M_StorageDisposalStatement
         RESULT = SetCursorFirstEntity( SrcMLC, "M_StorageDisposalStatement", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CopyStorageDisposalStmts( NewSLC, SrcMLC )
            omSubLC_CopyStorageDisposalStmts( NewSLC, SrcMLC );
            RESULT = SetCursorNextEntity( SrcMLC, "M_StorageDisposalStatement", "" );
         } 

         //:END
         //:ResetViewFromSubobject( NewSLC )
         ResetViewFromSubobject( NewSLC );
         //:ResetViewFromSubobject( SrcMLC )
         ResetViewFromSubobject( SrcMLC );
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_StorageDisposalStatement", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:LOCAL OPERATION
//:CopyUsagesRecursive( VIEW NewSLC, VIEW SrcMLC )

//:   STRING ( 256 ) szText
private int 
omSubLC_CopyUsagesRecursive( View     NewSLC,
                             View     SrcMLC )
{
   String   szText = null;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;


   //:FOR EACH SrcMLC.M_Usage
   RESULT = SetCursorFirstEntity( SrcMLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_Usage
      RESULT = CreateEntity( NewSLC, "S_Usage", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_Usage", SrcMLC, "M_Usage", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_Usage", SrcMLC, "M_Usage", zSET_NULL );
      //:NewSLC.S_Usage.PrimaryMLC_ID = SrcMLC.M_Usage.ID
      SetAttributeFromAttribute( NewSLC, "S_Usage", "PrimaryMLC_ID", SrcMLC, "M_Usage", "ID" );
      //:INCLUDE NewSLC.M_Usage FROM SrcMLC.M_Usage
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_Usage", SrcMLC, "M_Usage", zPOS_AFTER );
      //:FOR EACH SrcMLC.M_InsertTextKeywordUsage
      RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextKeywordUsage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_InsertTextKeywordUsage
         RESULT = CreateEntity( NewSLC, "S_InsertTextKeywordUsage", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_InsertTextKeywordUsage", SrcMLC, "M_InsertTextKeywordUsage", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_InsertTextKeywordUsage", SrcMLC, "M_InsertTextKeywordUsage", zSET_NULL );
         //:FOR EACH SrcMLC.M_InsertTextUsage
         RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextUsage", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY NewSLC.S_InsertTextUsage
            RESULT = CreateEntity( NewSLC, "S_InsertTextUsage", zPOS_AFTER );
            //:SetMatchingAttributesByName( NewSLC, "S_InsertTextUsage", SrcMLC, "M_InsertTextUsage", zSET_NULL )
            SetMatchingAttributesByName( NewSLC, "S_InsertTextUsage", SrcMLC, "M_InsertTextUsage", zSET_NULL );
            RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextUsage", "" );
         } 

         RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextKeywordUsage", "" );
         //:END
      } 

      //:END
      //:IF SrcMLC.M_UsageFootnoteUsed EXISTS
      lTempInteger_0 = CheckExistenceOfEntity( SrcMLC, "M_UsageFootnoteUsed" );
      if ( lTempInteger_0 == 0 )
      { 
         //:szText = SrcMLC.M_UsageFootnoteUsed.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szText;
         if ( szText == null )
            sb_szText = new StringBuilder( 32 );
         else
            sb_szText = new StringBuilder( szText );
                   GetVariableFromAttribute( sb_szText, mi_lTempInteger_1, 'S', 257, SrcMLC, "M_UsageFootnoteUsed", "Text", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szText = sb_szText.toString( );}
         //:SET CURSOR FIRST NewSLC.S_UsageFootnote WHERE NewSLC.S_UsageFootnote.Text = szText
         RESULT = SetCursorFirstEntityByString( NewSLC, "S_UsageFootnote", "Text", szText, "" );
         //:INCLUDE NewSLC.S_UsageFootnoteUsed FROM NewSLC.S_UsageFootnote
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "S_UsageFootnoteUsed", NewSLC, "S_UsageFootnote", zPOS_AFTER );
      } 

      //:END
      //:IF SrcMLC.M_SubUsage EXISTS
      lTempInteger_2 = CheckExistenceOfEntity( SrcMLC, "M_SubUsage" );
      if ( lTempInteger_2 == 0 )
      { 
         //:SetViewToSubobject( SrcMLC, "M_SubUsage" )
         SetViewToSubobject( SrcMLC, "M_SubUsage" );
         //:SetViewToSubobject( NewSLC, "S_SubUsage" )
         SetViewToSubobject( NewSLC, "S_SubUsage" );
         //:FOR EACH SrcMLC.M_Usage
         RESULT = SetCursorFirstEntity( SrcMLC, "M_Usage", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CopyUsagesRecursive( NewSLC, SrcMLC )
            omSubLC_CopyUsagesRecursive( NewSLC, SrcMLC );
            RESULT = SetCursorNextEntity( SrcMLC, "M_Usage", "" );
         } 

         //:END
         //:ResetViewFromSubobject( NewSLC )
         ResetViewFromSubobject( NewSLC );
         //:ResetViewFromSubobject( SrcMLC )
         ResetViewFromSubobject( SrcMLC );
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_Usage", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:BuildSLC_FromMLC( VIEW NewSLC BASED ON LOD mSubLC,
//:                  VIEW SrcMLC BASED ON LOD mMasLC )

//:   STRING ( 32 ) szVersion
public int 
omSubLC_BuildSLC_FromMLC( View     NewSLC,
                          View     SrcMLC )
{
   String   szVersion = null;
   int      lTempInteger_0 = 0;
   int      RESULT = 0;
   int      lTempInteger_1 = 0;


   //:// TraceLineS( "BuildSLC_FromMLC MLC", "=====================>>>>>>>>" )
   //:// DisplayObjectInstance( SrcMLC, "", "" )

   //:// Create a new SLC from an MLC and tie it back to the MLC.

   //:// It is assumed that the root entity (SubregLabelContent) and that Subreg Product
   //:// includes have been set up prior to execution of this operation.
   //:IF NewSLC.MasterLabelContent DOES NOT EXIST
   lTempInteger_0 = CheckExistenceOfEntity( NewSLC, "MasterLabelContent" );
   if ( lTempInteger_0 != 0 )
   { 
      //:INCLUDE NewSLC.MasterLabelContent FROM SrcMLC.MasterLabelContent
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "MasterLabelContent", SrcMLC, "MasterLabelContent", zPOS_AFTER );
   } 

   //:END

   //:// General Section ... Precautionary, First Aid, Other Hazard
   //:FOR EACH SrcMLC.M_GeneralSection
   RESULT = SetCursorFirstEntity( SrcMLC, "M_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_GeneralSection
      RESULT = CreateEntity( NewSLC, "S_GeneralSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_GeneralSection", SrcMLC, "M_GeneralSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_GeneralSection", SrcMLC, "M_GeneralSection", zSET_NULL );
      //:NewSLC.S_GeneralSection.PrimaryMLC_ID = SrcMLC.M_GeneralSection.ID
      SetAttributeFromAttribute( NewSLC, "S_GeneralSection", "PrimaryMLC_ID", SrcMLC, "M_GeneralSection", "ID" );
      //:INCLUDE NewSLC.M_GeneralSection FROM SrcMLC.M_GeneralSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_GeneralSection", SrcMLC, "M_GeneralSection", zPOS_AFTER );
      //:FOR EACH SrcMLC.M_GeneralStatement
      RESULT = SetCursorFirstEntity( SrcMLC, "M_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_GeneralStatement
         RESULT = CreateEntity( NewSLC, "S_GeneralStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_GeneralStatement", SrcMLC, "M_GeneralStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_GeneralStatement", SrcMLC, "M_GeneralStatement", zSET_NULL );
         //:NewSLC.S_GeneralStatement.PrimaryMLC_ID = SrcMLC.M_GeneralStatement.ID
         SetAttributeFromAttribute( NewSLC, "S_GeneralStatement", "PrimaryMLC_ID", SrcMLC, "M_GeneralStatement", "ID" );
         //:FOR EACH SrcMLC.M_InsertTextKeyword
         RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextKeyword", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY NewSLC.S_InsertTextKeyword
            RESULT = CreateEntity( NewSLC, "S_InsertTextKeyword", zPOS_AFTER );
            //:SetMatchingAttributesByName( NewSLC, "S_InsertTextKeyword", SrcMLC, "M_InsertTextKeyword", zSET_NULL )
            SetMatchingAttributesByName( NewSLC, "S_InsertTextKeyword", SrcMLC, "M_InsertTextKeyword", zSET_NULL );
            //:FOR EACH SrcMLC.M_InsertText
            RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertText", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:CREATE ENTITY NewSLC.S_InsertText
               RESULT = CreateEntity( NewSLC, "S_InsertText", zPOS_AFTER );
               //:SetMatchingAttributesByName( NewSLC, "S_InsertText", SrcMLC, "M_InsertText", zSET_NULL )
               SetMatchingAttributesByName( NewSLC, "S_InsertText", SrcMLC, "M_InsertText", zSET_NULL );
               RESULT = SetCursorNextEntity( SrcMLC, "M_InsertText", "" );
            } 

            RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextKeyword", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( SrcMLC, "M_GeneralStatement", "" );
         //:END
      } 

      //:END
      //:FOR EACH SrcMLC.M_GeneralSubSection
      RESULT = SetCursorFirstEntity( SrcMLC, "M_GeneralSubSection", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_GeneralSubSection
         RESULT = CreateEntity( NewSLC, "S_GeneralSubSection", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_GeneralSubSection", SrcMLC, "M_GeneralSubSection", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_GeneralSubSection", SrcMLC, "M_GeneralSubSection", zSET_NULL );
         //:NewSLC.S_GeneralSubSection.PrimaryMLC_ID = SrcMLC.M_GeneralSubSection.ID
         SetAttributeFromAttribute( NewSLC, "S_GeneralSubSection", "PrimaryMLC_ID", SrcMLC, "M_GeneralSubSection", "ID" );
         //:FOR EACH SrcMLC.M_GeneralSubStatement
         RESULT = SetCursorFirstEntity( SrcMLC, "M_GeneralSubStatement", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY NewSLC.S_GeneralSubStatement
            RESULT = CreateEntity( NewSLC, "S_GeneralSubStatement", zPOS_AFTER );
            //:SetMatchingAttributesByName( NewSLC, "S_GeneralSubStatement", SrcMLC, "M_GeneralSubStatement", zSET_NULL )
            SetMatchingAttributesByName( NewSLC, "S_GeneralSubStatement", SrcMLC, "M_GeneralSubStatement", zSET_NULL );
            //:NewSLC.S_GeneralSubStatement.PrimaryMLC_ID = SrcMLC.M_GeneralSubStatement.ID
            SetAttributeFromAttribute( NewSLC, "S_GeneralSubStatement", "PrimaryMLC_ID", SrcMLC, "M_GeneralSubStatement", "ID" );
            //:FOR EACH SrcMLC.M_InsertTextKeywordGeneral
            RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextKeywordGeneral", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:CREATE ENTITY NewSLC.S_InsertTextKeywordGeneral
               RESULT = CreateEntity( NewSLC, "S_InsertTextKeywordGeneral", zPOS_AFTER );
               //:SetMatchingAttributesByName( NewSLC, "S_InsertTextKeywordGeneral", SrcMLC, "M_InsertTextKeywordGeneral", zSET_NULL )
               SetMatchingAttributesByName( NewSLC, "S_InsertTextKeywordGeneral", SrcMLC, "M_InsertTextKeywordGeneral", zSET_NULL );
               //:FOR EACH SrcMLC.M_InsertTextGeneral
               RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextGeneral", "" );
               while ( RESULT > zCURSOR_UNCHANGED )
               { 
                  //:CREATE ENTITY NewSLC.S_InsertTextGeneral
                  RESULT = CreateEntity( NewSLC, "S_InsertTextGeneral", zPOS_AFTER );
                  //:SetMatchingAttributesByName( NewSLC, "S_InsertTextGeneral", SrcMLC, "M_InsertTextGeneral", zSET_NULL )
                  SetMatchingAttributesByName( NewSLC, "S_InsertTextGeneral", SrcMLC, "M_InsertTextGeneral", zSET_NULL );
                  RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextGeneral", "" );
               } 

               RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextKeywordGeneral", "" );
               //:END
            } 

            RESULT = SetCursorNextEntity( SrcMLC, "M_GeneralSubStatement", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( SrcMLC, "M_GeneralSubSection", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_GeneralSection", "" );
      //:END
   } 

   //:END

   //:// Footnotes
   //:FOR EACH SrcMLC.M_UsageFootnote
   RESULT = SetCursorFirstEntity( SrcMLC, "M_UsageFootnote", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_UsageFootnote
      RESULT = CreateEntity( NewSLC, "S_UsageFootnote", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_UsageFootnote", SrcMLC, "M_UsageFootnote", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_UsageFootnote", SrcMLC, "M_UsageFootnote", zSET_NULL );
      //:NewSLC.S_UsageFootnote.PrimaryMLC_ID = SrcMLC.M_UsageFootnote.ID
      SetAttributeFromAttribute( NewSLC, "S_UsageFootnote", "PrimaryMLC_ID", SrcMLC, "M_UsageFootnote", "ID" );
      RESULT = SetCursorNextEntity( SrcMLC, "M_UsageFootnote", "" );
   } 

   //:END

   //:// Usages ... Claim, Surface, Application Type, Location 
   //:FOR EACH SrcMLC.M_UsageType
   RESULT = SetCursorFirstEntity( SrcMLC, "M_UsageType", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_UsageType
      RESULT = CreateEntity( NewSLC, "S_UsageType", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_UsageType", SrcMLC, "M_UsageType", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_UsageType", SrcMLC, "M_UsageType", zSET_NULL );
      //:NewSLC.S_UsageType.PrimaryMLC_ID = SrcMLC.M_UsageType.ID
      SetAttributeFromAttribute( NewSLC, "S_UsageType", "PrimaryMLC_ID", SrcMLC, "M_UsageType", "ID" );
      //:INCLUDE NewSLC.M_UsageType FROM SrcMLC.M_UsageType
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_UsageType", SrcMLC, "M_UsageType", zPOS_AFTER );
      //:CopyUsagesRecursive( NewSLC, SrcMLC )
      omSubLC_CopyUsagesRecursive( NewSLC, SrcMLC );
      RESULT = SetCursorNextEntity( SrcMLC, "M_UsageType", "" );
   } 

   //:END

   //:// Ingredients Section
   //:FOR EACH SrcMLC.M_IngredientsSection
   RESULT = SetCursorFirstEntity( SrcMLC, "M_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_IngredientsSection
      RESULT = CreateEntity( NewSLC, "S_IngredientsSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_IngredientsSection", SrcMLC, "M_IngredientsSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_IngredientsSection", SrcMLC, "M_IngredientsSection", zSET_NULL );
      //:NewSLC.S_IngredientsSection.PrimaryMLC_ID = SrcMLC.M_IngredientsSection.ID
      SetAttributeFromAttribute( NewSLC, "S_IngredientsSection", "PrimaryMLC_ID", SrcMLC, "M_IngredientsSection", "ID" );
      //:FOR EACH SrcMLC.M_IngredientsStatement
      RESULT = SetCursorFirstEntity( SrcMLC, "M_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_IngredientsStatement
         RESULT = CreateEntity( NewSLC, "S_IngredientsStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_IngredientsStatement", SrcMLC, "M_IngredientsStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_IngredientsStatement", SrcMLC, "M_IngredientsStatement", zSET_NULL );
         //:NewSLC.S_IngredientsStatement.PrimaryMLC_ID = SrcMLC.M_IngredientsStatement.ID
         SetAttributeFromAttribute( NewSLC, "S_IngredientsStatement", "PrimaryMLC_ID", SrcMLC, "M_IngredientsStatement", "ID" );
         RESULT = SetCursorNextEntity( SrcMLC, "M_IngredientsStatement", "" );
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_IngredientsSection", "" );
      //:END
   } 

   //:END

   //:// StorageDisposal Section
   //:// For the moment, copy all Storage & Disposal Sections with child entities.
   //:FOR EACH SrcMLC.M_StorageDisposalSection
   RESULT = SetCursorFirstEntity( SrcMLC, "M_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_StorageDisposalSection
      RESULT = CreateEntity( NewSLC, "S_StorageDisposalSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_StorageDisposalSection", SrcMLC, "M_StorageDisposalSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_StorageDisposalSection", SrcMLC, "M_StorageDisposalSection", zSET_NULL );
      //:CopyStorageDisposalStmts( NewSLC, SrcMLC )
      omSubLC_CopyStorageDisposalStmts( NewSLC, SrcMLC );
      RESULT = SetCursorNextEntity( SrcMLC, "M_StorageDisposalSection", "" );
   } 

   //:END
   //:/*
   //:// Select the Storage & Disposal Section based on Container Size, which is stored as a work attribute in NewSLC.
   //:IF NewSLC.SubregLabelContent.wContainerSize > 5
   //:   SET CURSOR FIRST SrcMLC.M_StorageDisposalSection WHERE SrcMLC.M_StorageDisposalSection.ContainerVolume = ">5"
   //:ELSE
   //:   SET CURSOR FIRST SrcMLC.M_StorageDisposalSection WHERE SrcMLC.M_StorageDisposalSection.ContainerVolume = "<=5"
   //:END
   //:CREATE ENTITY NewSLC.S_StorageDisposalSection
   //:SetMatchingAttributesByName( NewSLC, "S_StorageDisposalSection", SrcMLC, "M_StorageDisposalSection", zSET_NULL )
   //:NewSLC.S_StorageDisposalSection.PrimaryMLC_ID = SrcMLC.M_StorageDisposalSection.ID
   //:FOR EACH SrcMLC.M_StorageDisposalStatement
   //:   CREATE ENTITY NewSLC.S_StorageDisposalStatement
   //:   SetMatchingAttributesByName( NewSLC, "S_StorageDisposalStatement", SrcMLC, "M_StorageDisposalStatement", zSET_NULL )
   //:   NewSLC.S_StorageDisposalStatement.PrimaryMLC_ID = SrcMLC.M_StorageDisposalStatement.ID
   //:END
   //:*/

   //:// Tables
   //:FOR EACH SrcMLC.M_MetaTable
   RESULT = SetCursorFirstEntity( SrcMLC, "M_MetaTable", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_MetaTable
      RESULT = CreateEntity( NewSLC, "S_MetaTable", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_MetaTable", SrcMLC, "M_MetaTable", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_MetaTable", SrcMLC, "M_MetaTable", zSET_NULL );
      //:NewSLC.S_MetaTable.PrimaryMLC_ID = SrcMLC.M_MetaTable.ID
      SetAttributeFromAttribute( NewSLC, "S_MetaTable", "PrimaryMLC_ID", SrcMLC, "M_MetaTable", "ID" );
      //:FOR EACH SrcMLC.M_Rows
      RESULT = SetCursorFirstEntity( SrcMLC, "M_Rows", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_Rows
         RESULT = CreateEntity( NewSLC, "S_Rows", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_Rows", SrcMLC, "M_Rows", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_Rows", SrcMLC, "M_Rows", zSET_NULL );
         //:NewSLC.S_Rows.PrimaryMLC_ID = SrcMLC.M_Rows.ID
         SetAttributeFromAttribute( NewSLC, "S_Rows", "PrimaryMLC_ID", SrcMLC, "M_Rows", "ID" );
         RESULT = SetCursorNextEntity( SrcMLC, "M_Rows", "" );
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_MetaTable", "" );
      //:END
   } 

   //:END

   //:// Dilutions
   //:FOR EACH SrcMLC.M_DilutionGroup
   RESULT = SetCursorFirstEntity( SrcMLC, "M_DilutionGroup", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_DilutionGroup
      RESULT = CreateEntity( NewSLC, "S_DilutionGroup", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_DilutionGroup", SrcMLC, "M_DilutionGroup", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_DilutionGroup", SrcMLC, "M_DilutionGroup", zSET_NULL );
      //:NewSLC.S_DilutionGroup.PrimaryMLC_ID = SrcMLC.M_DilutionGroup.ID
      SetAttributeFromAttribute( NewSLC, "S_DilutionGroup", "PrimaryMLC_ID", SrcMLC, "M_DilutionGroup", "ID" );
      //:FOR EACH SrcMLC.M_DilutionChartEntry
      RESULT = SetCursorFirstEntity( SrcMLC, "M_DilutionChartEntry", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_DilutionChartEntry
         RESULT = CreateEntity( NewSLC, "S_DilutionChartEntry", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_DilutionChartEntry", SrcMLC, "M_DilutionChartEntry", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_DilutionChartEntry", SrcMLC, "M_DilutionChartEntry", zSET_NULL );
         RESULT = SetCursorNextEntity( SrcMLC, "M_DilutionChartEntry", "" );
      } 

      //:// NewSLC.S_DilutionChartEntry.PrimaryMLC_ID = SrcMLC.M_DilutionChartEntry.ID
      //:END
      //:FOR EACH SrcMLC.M_DilutionGroupItem
      RESULT = SetCursorFirstEntity( SrcMLC, "M_DilutionGroupItem", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_DilutionGroupItem
         RESULT = CreateEntity( NewSLC, "S_DilutionGroupItem", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_DilutionGroupItem", SrcMLC, "M_DilutionGroupItem", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_DilutionGroupItem", SrcMLC, "M_DilutionGroupItem", zSET_NULL );
         RESULT = SetCursorNextEntity( SrcMLC, "M_DilutionGroupItem", "" );
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_DilutionGroup", "" );
      //:// NewSLC.S_DilutionGroupItem.PrimaryMLC_ID = SrcMLC.M_DilutionGroupItem.ID
      //:END
   } 

   //:END

   //:// HumanHazard Section
   //:FOR EACH SrcMLC.M_HumanHazardSection
   RESULT = SetCursorFirstEntity( SrcMLC, "M_HumanHazardSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_HumanHazardSection
      RESULT = CreateEntity( NewSLC, "S_HumanHazardSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_HumanHazardSection", SrcMLC, "M_HumanHazardSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_HumanHazardSection", SrcMLC, "M_HumanHazardSection", zSET_NULL );
      //:NewSLC.S_HumanHazardSection.PrimaryMLC_ID = SrcMLC.M_HumanHazardSection.ID
      SetAttributeFromAttribute( NewSLC, "S_HumanHazardSection", "PrimaryMLC_ID", SrcMLC, "M_HumanHazardSection", "ID" );
      RESULT = SetCursorNextEntity( SrcMLC, "M_HumanHazardSection", "" );
   } 

   //:END

   //:// Add any Directions For Use Sections that aren't driven by Usage entries.
   //:FOR EACH SrcMLC.M_DirectionsForUseCategory
   RESULT = SetCursorFirstEntity( SrcMLC, "M_DirectionsForUseCategory", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_DirectionsForUseCategory
      RESULT = CreateEntity( NewSLC, "S_DirectionsForUseCategory", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseCategory", SrcMLC, "M_DirectionsForUseCategory", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseCategory", SrcMLC, "M_DirectionsForUseCategory", zSET_NULL );
      //:FOR EACH SrcMLC.M_DirectionsForUseSection
      RESULT = SetCursorFirstEntity( SrcMLC, "M_DirectionsForUseSection", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF SrcMLC.M_ClaimsDrivingUsage DOES NOT EXIST
         lTempInteger_1 = CheckExistenceOfEntity( SrcMLC, "M_ClaimsDrivingUsage" );
         if ( lTempInteger_1 != 0 )
         { 
            //:// No Driving Usage entry exists, so always copy the section.
            //:CopyDirsForUseSection( NewSLC, SrcMLC )
            omSubLC_CopyDirsForUseSection( NewSLC, SrcMLC );
         } 

         RESULT = SetCursorNextEntity( SrcMLC, "M_DirectionsForUseSection", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_DirectionsForUseCategory", "" );
      //:END
   } 

   //:END

   //:// Marketing Section
   //:FOR EACH SrcMLC.M_MarketingSection
   RESULT = SetCursorFirstEntity( SrcMLC, "M_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_MarketingSection
      RESULT = CreateEntity( NewSLC, "S_MarketingSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_MarketingSection", SrcMLC, "M_MarketingSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_MarketingSection", SrcMLC, "M_MarketingSection", zSET_NULL );
      //:NewSLC.S_MarketingSection.PrimaryMLC_ID = SrcMLC.M_MarketingSection.ID
      SetAttributeFromAttribute( NewSLC, "S_MarketingSection", "PrimaryMLC_ID", SrcMLC, "M_MarketingSection", "ID" );
      //:FOR EACH SrcMLC.M_MarketingStatement
      RESULT = SetCursorFirstEntity( SrcMLC, "M_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_MarketingStatement
         RESULT = CreateEntity( NewSLC, "S_MarketingStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_MarketingStatement", SrcMLC, "M_MarketingStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_MarketingStatement", SrcMLC, "M_MarketingStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_MarketingStatement FROM SrcMLC.M_MarketingStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_MarketingStatement", SrcMLC, "M_MarketingStatement", zPOS_AFTER );
         //:NewSLC.S_MarketingStatement.PrimaryMLC_ID = SrcMLC.M_MarketingStatement.ID
         SetAttributeFromAttribute( NewSLC, "S_MarketingStatement", "PrimaryMLC_ID", SrcMLC, "M_MarketingStatement", "ID" );
         //:FOR EACH SrcMLC.M_InsertTextKeywordMarketing
         RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextKeywordMarketing", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY NewSLC.S_InsertTextKeywordMarketing
            RESULT = CreateEntity( NewSLC, "S_InsertTextKeywordMarketing", zPOS_AFTER );
            //:SetMatchingAttributesByName( NewSLC, "S_InsertTextKeywordMarketing", SrcMLC, "M_InsertTextKeywordMarketing", zSET_NULL )
            SetMatchingAttributesByName( NewSLC, "S_InsertTextKeywordMarketing", SrcMLC, "M_InsertTextKeywordMarketing", zSET_NULL );
            //:FOR EACH SrcMLC.M_InsertTextMarketing
            RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextMarketing", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:CREATE ENTITY NewSLC.S_InsertTextMarketing
               RESULT = CreateEntity( NewSLC, "S_InsertTextMarketing", zPOS_AFTER );
               //:SetMatchingAttributesByName( NewSLC, "S_InsertTextMarketing", SrcMLC, "M_InsertTextMarketing", zSET_NULL )
               SetMatchingAttributesByName( NewSLC, "S_InsertTextMarketing", SrcMLC, "M_InsertTextMarketing", zSET_NULL );
               RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextMarketing", "" );
            } 

            RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextKeywordMarketing", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( SrcMLC, "M_MarketingStatement", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_MarketingSection", "" );
      //:END
   } 

   //:END
   return( 0 );
// // TraceLineS( "BuildSLC_FromMLC SLC", "=====================>>>>>>>>" )
// // DisplayObjectInstance( NewSLC, "", "" )
// END
} 


//:TRANSFORMATION OPERATION
//:BuildDirsForUseSects( VIEW NewSLC BASED ON LOD mSubLC,
//:                      VIEW SrcMLC BASED ON LOD mMasLC )

//:   STRING ( 1 ) szFoundFlag
public int 
omSubLC_BuildDirsForUseSects( View     NewSLC,
                              View     SrcMLC )
{
   String   szFoundFlag = null;
   //:SHORT        nRC
   int      nRC = 0;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:// Build Directions For Use Sections based on Driving Usage entries.

   //:// First remove existing entries.
   //:FOR EACH NewSLC.S_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( NewSLC, "S_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY NewSLC.S_DirectionsForUseSection NONE
      RESULT = DeleteEntity( NewSLC, "S_DirectionsForUseSection", zREPOS_NONE );
      RESULT = SetCursorNextEntity( NewSLC, "S_DirectionsForUseSection", "" );
   } 

   //:END

   //:// Loop through each MLC Directions For Use Section and see if it should be copied to the SLC.
   //:// Sections are copied under two conditions.
   //:// 1. There are no driving Usage entries for the section in the MLC, meaning that the section is always
   //://    to be included in the SLC.
   //:// 2. A Driving Usage entry for a Section has been included in the SLC.
   //:FOR EACH SrcMLC.M_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( SrcMLC, "M_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF SrcMLC.M_ClaimsDrivingUsage DOES NOT EXIST
      lTempInteger_0 = CheckExistenceOfEntity( SrcMLC, "M_ClaimsDrivingUsage" );
      if ( lTempInteger_0 != 0 )
      { 
         //:// No Driving Usage entry exists, so always copy the section.
         //:CopyDirsForUseSection( NewSLC, SrcMLC )
         omSubLC_CopyDirsForUseSection( NewSLC, SrcMLC );
         //:ELSE
      } 
      else
      { 
         //:// The Section is Driven by Usage entries.
         //:szFoundFlag = ""
          {StringBuilder sb_szFoundFlag;
         if ( szFoundFlag == null )
            sb_szFoundFlag = new StringBuilder( 32 );
         else
            sb_szFoundFlag = new StringBuilder( szFoundFlag );
                  ZeidonStringCopy( sb_szFoundFlag, 1, 0, "", 1, 0, 2 );
         szFoundFlag = sb_szFoundFlag.toString( );}
         //:nRC = SetCursorFirstEntity( SrcMLC, "M_ClaimsDrivingUsage", "" )
         nRC = SetCursorFirstEntity( SrcMLC, "M_ClaimsDrivingUsage", "" );
         //:LOOP WHILE nRC >= zCURSOR_SET AND szFoundFlag = ""
         while ( nRC >= zCURSOR_SET && ZeidonStringCompare( szFoundFlag, 1, 0, "", 1, 0, 2 ) == 0 )
         { 
            //:SET CURSOR FIRST NewSLC.S_Usage WITHIN NewSLC.SubregLabelContent
            //:           WHERE NewSLC.S_Usage.PrimaryMLC_ID = SrcMLC.M_ClaimsDrivingUsage.ID
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                         GetIntegerFromAttribute( mi_lTempInteger_1, SrcMLC, "M_ClaimsDrivingUsage", "ID" );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( NewSLC, "S_Usage", "PrimaryMLC_ID", lTempInteger_1, "SubregLabelContent" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:szFoundFlag = "Y"
                {StringBuilder sb_szFoundFlag;
               if ( szFoundFlag == null )
                  sb_szFoundFlag = new StringBuilder( 32 );
               else
                  sb_szFoundFlag = new StringBuilder( szFoundFlag );
                              ZeidonStringCopy( sb_szFoundFlag, 1, 0, "Y", 1, 0, 2 );
               szFoundFlag = sb_szFoundFlag.toString( );}
            } 

            //:END
            //:nRC = SetCursorNextEntity( SrcMLC, "M_ClaimsDrivingUsage", "" )
            nRC = SetCursorNextEntity( SrcMLC, "M_ClaimsDrivingUsage", "" );
         } 

         //:END
         //:IF szFoundFlag = "Y"
         if ( ZeidonStringCompare( szFoundFlag, 1, 0, "Y", 1, 0, 2 ) == 0 )
         { 
            //:CopyDirsForUseSection( NewSLC, SrcMLC )
            omSubLC_CopyDirsForUseSection( NewSLC, SrcMLC );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_DirectionsForUseSection", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:LOCAL OPERATION
private int 
omSubLC_CopyDirsForUseStatements( View     NewSLC,
                                  View     SrcMLC )
{
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   //:CopyDirsForUseStatements( VIEW NewSLC BASED ON LOD mSubLC,
   //:                       VIEW SrcMLC BASED ON LOD mMasLC )

   //:FOR EACH SrcMLC.M_DirectionsForUseStatement
   RESULT = SetCursorFirstEntity( SrcMLC, "M_DirectionsForUseStatement", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_DirectionsForUseStatement
      RESULT = CreateEntity( NewSLC, "S_DirectionsForUseStatement", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseStatement",
      //:                             SrcMLC, "M_DirectionsForUseStatement", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseStatement", SrcMLC, "M_DirectionsForUseStatement", zSET_NULL );
      //:NewSLC.S_DirectionsForUseStatement.PrimaryMLC_ID = SrcMLC.M_DirectionsForUseStatement.ID
      SetAttributeFromAttribute( NewSLC, "S_DirectionsForUseStatement", "PrimaryMLC_ID", SrcMLC, "M_DirectionsForUseStatement", "ID" );
      //:// IF NewSLC.S_DirectionsForUseStatement.NotForUseType = ""
      //://    NewSLC.S_DirectionsForUseStatement.NotForUseType = "NA"
      //:// END
      //:FOR EACH SrcMLC.M_InsertTextKeywordDU
      RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextKeywordDU", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_InsertTextKeywordDU
         RESULT = CreateEntity( NewSLC, "S_InsertTextKeywordDU", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_InsertTextKeywordDU", SrcMLC, "M_InsertTextKeywordDU", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_InsertTextKeywordDU", SrcMLC, "M_InsertTextKeywordDU", zSET_NULL );
         //:FOR EACH SrcMLC.M_InsertTextDU
         RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextDU", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY NewSLC.S_InsertTextDU
            RESULT = CreateEntity( NewSLC, "S_InsertTextDU", zPOS_AFTER );
            //:SetMatchingAttributesByName( NewSLC, "S_InsertTextDU", SrcMLC, "M_InsertTextDU", zSET_NULL )
            SetMatchingAttributesByName( NewSLC, "S_InsertTextDU", SrcMLC, "M_InsertTextDU", zSET_NULL );
            RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextDU", "" );
         } 

         RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextKeywordDU", "" );
         //:END
      } 

      //:END
      //:FOR EACH SrcMLC.M_DirectionsUsageOrdering
      RESULT = SetCursorFirstEntity( SrcMLC, "M_DirectionsUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST NewSLC.S_Usage WITHIN NewSLC.SubregLabelContent
         //:           WHERE NewSLC.S_Usage.PrimaryMLC_ID = SrcMLC.M_DirectionsUsage.ID
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                   GetIntegerFromAttribute( mi_lTempInteger_0, SrcMLC, "M_DirectionsUsage", "ID" );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( NewSLC, "S_Usage", "PrimaryMLC_ID", lTempInteger_0, "SubregLabelContent" );
         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:CREATE ENTITY NewSLC.S_DirectionsUsageOrdering
            RESULT = CreateEntity( NewSLC, "S_DirectionsUsageOrdering", zPOS_AFTER );
            //:NewSLC.S_DirectionsUsageOrdering.PrimaryMLC_ID = SrcMLC.M_DirectionsUsageOrdering.ID
            SetAttributeFromAttribute( NewSLC, "S_DirectionsUsageOrdering", "PrimaryMLC_ID", SrcMLC, "M_DirectionsUsageOrdering", "ID" );
            //:INCLUDE NewSLC.S_DirectionsUsage FROM NewSLC.S_Usage
            RESULT = IncludeSubobjectFromSubobject( NewSLC, "S_DirectionsUsage", NewSLC, "S_Usage", zPOS_AFTER );
         } 

         RESULT = SetCursorNextEntity( SrcMLC, "M_DirectionsUsageOrdering", "" );
         //:END
      } 

      //:END
      //:IF SrcMLC.M_DirectionsForUseSubStatement EXISTS
      lTempInteger_1 = CheckExistenceOfEntity( SrcMLC, "M_DirectionsForUseSubStatement" );
      if ( lTempInteger_1 == 0 )
      { 
         //:SetViewToSubobject( SrcMLC, "M_DirectionsForUseSubStatement" )
         SetViewToSubobject( SrcMLC, "M_DirectionsForUseSubStatement" );
         //:SetViewToSubobject( NewSLC, "S_DirectionsForUseSubStatement" )
         SetViewToSubobject( NewSLC, "S_DirectionsForUseSubStatement" );
         //:CopyDirsForUseStatements( NewSLC, SrcMLC )
         omSubLC_CopyDirsForUseStatements( NewSLC, SrcMLC );
         //:ResetViewFromSubobject( NewSLC )
         ResetViewFromSubobject( NewSLC );
         //:ResetViewFromSubobject( SrcMLC )
         ResetViewFromSubobject( SrcMLC );
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_DirectionsForUseStatement", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dSubregNameID( VIEW mSubLC BASED ON LOD mSubLC,
//:               STRING ( 32 ) InternalEntityStructure,
//:               STRING ( 32 ) InternalAttribStructure,
//:               SHORT GetOrSetFlag )

//:   STRING ( 1000 ) szString
public int 
omSubLC_dSubregNameID( View     mSubLC,
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

         //:IF mSubLC.SubregOrganization EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "SubregOrganization" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = mSubLC.SubregOrganization.Name
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_1, 'S', 1001, mSubLC, "SubregOrganization", "Name", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szString = sb_szString.toString( );}
            //:IF mSubLC.Subregistrant.EPA_CompanyNumber = ""
            if ( CompareAttributeToString( mSubLC, "Subregistrant", "EPA_CompanyNumber", "" ) == 0 )
            { 
               //:szString = szString + " (Non EPA)"
                {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                              ZeidonStringConcat( sb_szString, 1, 0, " (Non EPA)", 1, 0, 1001 );
               szString = sb_szString.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szString = szString + " (" + mSubLC.Subregistrant.EPA_CompanyNumber + ")"
                {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                              ZeidonStringConcat( sb_szString, 1, 0, " (", 1, 0, 1001 );
               szString = sb_szString.toString( );}
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_2, 'S', 7, mSubLC, "Subregistrant", "EPA_CompanyNumber", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                              ZeidonStringConcat( sb_szString, 1, 0, szTempString_0, 1, 0, 1001 );
               szString = sb_szString.toString( );}
                {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                              ZeidonStringConcat( sb_szString, 1, 0, ")", 1, 0, 1001 );
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
                        ZeidonStringCopy( sb_szString, 1, 0, "", 1, 0, 1001 );
            szString = sb_szString.toString( );}
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC,
         //:                   InternalEntityStructure,
         //:                   InternalAttribStructure, szString )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szString );
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
   //:dSD_TitleText( VIEW mSubLC BASED ON LOD mSubLC,
   //:            STRING ( 32 ) InternalEntityStructure,
   //:            STRING ( 32 ) InternalAttribStructure,
   //:            SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omSubLC_dSD_TitleText( View     mSubLC,
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
         //:szTitle = mSubLC.S_StorageDisposalStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szTitle;
         if ( szTitle == null )
            sb_szTitle = new StringBuilder( 32 );
         else
            sb_szTitle = new StringBuilder( szTitle );
                   GetVariableFromAttribute( sb_szTitle, mi_lTempInteger_0, 'S', 257, mSubLC, "S_StorageDisposalStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szTitle = sb_szTitle.toString( );}
         //:szStatementText = mSubLC.S_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_1, 'S', 2049, mSubLC, "S_StorageDisposalStatement", "Text", "", 0 );
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
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
   //:dSD_SubTitleText( VIEW mSubLC BASED ON LOD mSubLC,
   //:               STRING ( 32 ) InternalEntityStructure,
   //:               STRING ( 32 ) InternalAttribStructure,
   //:               SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omSubLC_dSD_SubTitleText( View     mSubLC,
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
         //:szTitle = mSubLC.S_StorageDisposalSubStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szTitle;
         if ( szTitle == null )
            sb_szTitle = new StringBuilder( 32 );
         else
            sb_szTitle = new StringBuilder( szTitle );
                   GetVariableFromAttribute( sb_szTitle, mi_lTempInteger_0, 'S', 257, mSubLC, "S_StorageDisposalSubStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szTitle = sb_szTitle.toString( );}
         //:szStatementText = mSubLC.S_StorageDisposalSubStatement.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_1, 'S', 2049, mSubLC, "S_StorageDisposalSubStatement", "Text", "", 0 );
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
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
   //:dSD_StmtTitleKey( VIEW mSubLC BASED ON LOD mSubLC,
   //:               STRING ( 32 ) InternalEntityStructure,
   //:               STRING ( 32 ) InternalAttribStructure,
   //:               SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szStatementTitle
public int 
omSubLC_dSD_StmtTitleKey( View     mSubLC,
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
         //:szStatementTitle = mSubLC.S_StorageDisposalStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_StorageDisposalStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSubLC, szStatementTitle,
            //:                            "S_InsertTextKeywordSD", "S_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szStatementTitle, "S_InsertTextKeywordSD", "S_InsertTextSD", ", " );
            szStatementTitle = sb_szStatementTitle.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szStatementTitle )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szStatementTitle );
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
//:dSD_StmtTextKey( VIEW mSubLC BASED ON LOD mSubLC,
//:                 STRING ( 32 ) InternalEntityStructure,
//:                 STRING ( 32 ) InternalAttribStructure,
//:                 SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szStatementText
public int 
omSubLC_dSD_StmtTextKey( View     mSubLC,
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
         //:szStatementText = mSubLC.S_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_StorageDisposalStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSubLC, szStatementText,
            //:                            "S_InsertTextKeywordSD", "S_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szStatementText, "S_InsertTextKeywordSD", "S_InsertTextSD", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szStatementText )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szStatementText );
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
//:dSD_StmtTitleTxtKey( VIEW mSubLC BASED ON LOD mSubLC,
//:                     STRING ( 32 ) InternalEntityStructure,
//:                     STRING ( 32 ) InternalAttribStructure,
//:                     SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omSubLC_dSD_StmtTitleTxtKey( View     mSubLC,
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
         //:szStatementText = mSubLC.S_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_StorageDisposalStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSubLC, szStatementText,
            //:                            "S_InsertTextKeywordSD", "S_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szStatementText, "S_InsertTextKeywordSD", "S_InsertTextSD", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:szStatementTitle = mSubLC.S_StorageDisposalStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_1, 'S', 257, mSubLC, "S_StorageDisposalStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSubLC, szStatementTitle,
            //:                            "S_InsertTextKeywordSD", "S_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szStatementTitle, "S_InsertTextKeywordSD", "S_InsertTextSD", ", " );
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
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
//:dSD_SubStmtTitleTxtKey( VIEW mSubLC BASED ON LOD mSubLC,
//:                        STRING ( 32 ) InternalEntityStructure,
//:                        STRING ( 32 ) InternalAttribStructure,
//:                        SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omSubLC_dSD_SubStmtTitleTxtKey( View     mSubLC,
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
         //:SetViewToSubobject( mSubLC, "S_StorageDisposalSubStatement" )
         SetViewToSubobject( mSubLC, "S_StorageDisposalSubStatement" );
         //:szStatementText = mSubLC.S_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_StorageDisposalStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSubLC, szStatementText,
            //:                            "S_InsertTextKeywordSD", "S_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szStatementText, "S_InsertTextKeywordSD", "S_InsertTextSD", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:szStatementTitle = mSubLC.S_StorageDisposalStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_1, 'S', 257, mSubLC, "S_StorageDisposalStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSubLC, szStatementTitle,
            //:                            "S_InsertTextKeywordSD", "S_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szStatementTitle, "S_InsertTextKeywordSD", "S_InsertTextSD", ", " );
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

         //:ResetViewFromSubobject( mSubLC )
         ResetViewFromSubobject( mSubLC );

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
//:dSD_KeywordText( VIEW mSubLC BASED ON LOD mSubLC,
//:                 STRING ( 32 ) InternalEntityStructure,
//:                 STRING ( 32 ) InternalAttribStructure,
//:                 SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szGeneratedString
public int 
omSubLC_dSD_KeywordText( View     mSubLC,
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
         //:FOR EACH mSubLC.S_InsertTextSD
         RESULT = SetCursorFirstEntity( mSubLC, "S_InsertTextSD", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF szGeneratedString = ""
            if ( ZeidonStringCompare( szGeneratedString, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szGeneratedString = mSubLC.S_InsertTextSD.Text
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szGeneratedString;
               if ( szGeneratedString == null )
                  sb_szGeneratedString = new StringBuilder( 32 );
               else
                  sb_szGeneratedString = new StringBuilder( szGeneratedString );
                               GetVariableFromAttribute( sb_szGeneratedString, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_InsertTextSD", "Text", "", 0 );
               lTempInteger_0 = mi_lTempInteger_0.intValue( );
               szGeneratedString = sb_szGeneratedString.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szGeneratedString = szGeneratedString + ", " + mSubLC.S_InsertTextSD.Text
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
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 4097, mSubLC, "S_InsertTextSD", "Text", "", 0 );
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

            RESULT = SetCursorNextEntity( mSubLC, "S_InsertTextSD", "" );
            //:END
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
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
   //:dDU_StmtTitleTxtKey( VIEW mSubLC BASED ON LOD mSubLC,
   //:                  STRING ( 32 ) InternalEntityStructure,
   //:                  STRING ( 32 ) InternalAttribStructure,
   //:                  SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omSubLC_dDU_StmtTitleTxtKey( View     mSubLC,
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
         //:szStatementText = mSubLC.S_DirectionsForUseStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_DirectionsForUseStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSubLC, szStatementText,
            //:                            "S_InsertTextKeywordDU", "S_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szStatementText, "S_InsertTextKeywordDU", "S_InsertTextDU", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:szStatementTitle = mSubLC.S_DirectionsForUseStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_1, 'S', 257, mSubLC, "S_DirectionsForUseStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSubLC, szStatementTitle,
            //:                            "S_InsertTextKeywordDU", "S_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szStatementTitle, "S_InsertTextKeywordDU", "S_InsertTextDU", ", " );
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
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
//:dDU_SubStmtTitleText( VIEW mSubLC BASED ON LOD mSubLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omSubLC_dDU_SubStmtTitleText( View     mSubLC,
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
         //:szTitle = mSubLC.S_DirectionsForUseSubStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szTitle;
         if ( szTitle == null )
            sb_szTitle = new StringBuilder( 32 );
         else
            sb_szTitle = new StringBuilder( szTitle );
                   GetVariableFromAttribute( sb_szTitle, mi_lTempInteger_0, 'S', 257, mSubLC, "S_DirectionsForUseSubStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szTitle = sb_szTitle.toString( );}
         //:szStatementText = mSubLC.S_DirectionsForUseSubStatement.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_1, 'S', 2049, mSubLC, "S_DirectionsForUseSubStatement", "Text", "", 0 );
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
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
   //:dDU_SubStmtTitleTxtKey( VIEW mSubLC BASED ON LOD mSubLC,
   //:                     STRING ( 32 ) InternalEntityStructure,
   //:                     STRING ( 32 ) InternalAttribStructure,
   //:                     SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omSubLC_dDU_SubStmtTitleTxtKey( View     mSubLC,
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
         //:SetViewToSubobject( mSubLC, "S_DirectionsForUseSubStatement" )
         SetViewToSubobject( mSubLC, "S_DirectionsForUseSubStatement" );

         //:szStatementText = mSubLC.S_DirectionsForUseStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_DirectionsForUseStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSubLC, szStatementText,
            //:                            "S_InsertTextKeywordDU", "S_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szStatementText, "S_InsertTextKeywordDU", "S_InsertTextDU", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:szStatementTitle = mSubLC.S_DirectionsForUseStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_1, 'S', 257, mSubLC, "S_DirectionsForUseStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSubLC, szStatementTitle,
            //:                            "S_InsertTextKeywordDU", "S_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szStatementTitle, "S_InsertTextKeywordDU", "S_InsertTextDU", ", " );
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

         //:ResetViewFromSubobject( mSubLC )
         ResetViewFromSubobject( mSubLC );

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
//:dDU_KeywordText( VIEW mSubLC BASED ON LOD mSubLC,
//:                 STRING ( 32 ) InternalEntityStructure,
//:                 STRING ( 32 ) InternalAttribStructure,
//:                 SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szKeyValue
public int 
omSubLC_dDU_KeywordText( View     mSubLC,
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
         //:FOR EACH mSubLC.S_InsertTextDU
         RESULT = SetCursorFirstEntity( mSubLC, "S_InsertTextDU", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF szKeyValue = ""
            if ( ZeidonStringCompare( szKeyValue, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szKeyValue = mSubLC.S_InsertTextDU.Text
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szKeyValue;
               if ( szKeyValue == null )
                  sb_szKeyValue = new StringBuilder( 32 );
               else
                  sb_szKeyValue = new StringBuilder( szKeyValue );
                               GetVariableFromAttribute( sb_szKeyValue, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_InsertTextDU", "Text", "", 0 );
               lTempInteger_0 = mi_lTempInteger_0.intValue( );
               szKeyValue = sb_szKeyValue.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szKeyValue = szKeyValue + ", " + mSubLC.S_InsertTextDU.Text
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
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 4097, mSubLC, "S_InsertTextDU", "Text", "", 0 );
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

            RESULT = SetCursorNextEntity( mSubLC, "S_InsertTextDU", "" );
            //:END
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szKeyValue )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szKeyValue );
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
   //:dGenStmtTitleText( VIEW mSubLC BASED ON LOD mSubLC,
   //:                STRING ( 32 ) InternalEntityStructure,
   //:                STRING ( 32 ) InternalAttribStructure,
   //:                SHORT GetOrSetFlag )

   //:VIEW mSubLC2 BASED ON LOD mSubLC
public int 
omSubLC_dGenStmtTitleText( View     mSubLC,
                           String InternalEntityStructure,
                           String InternalAttribStructure,
                           Integer   GetOrSetFlag )
{
   zVIEW    mSubLC2 = new zVIEW( );
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
         //:IF mSubLC.S_GeneralSection.Combined = "Y" AND mSubLC.S_GeneralStatement.Title != ""
         if ( CompareAttributeToString( mSubLC, "S_GeneralSection", "Combined", "Y" ) == 0 && CompareAttributeToString( mSubLC, "S_GeneralStatement", "Title", "" ) != 0 )
         { 
            //:IF mSubLC.S_GeneralSection.BoldTitle = "Y"
            if ( CompareAttributeToString( mSubLC, "S_GeneralSection", "BoldTitle", "Y" ) == 0 )
            { 
               //:szCombinedText = "<b>" + mSubLC.S_GeneralStatement.Title + "</b>"
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_0, 'S', 4097, mSubLC, "S_GeneralStatement", "Title", "", 0 );
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
               //:szCombinedText = mSubLC.S_GeneralStatement.Title
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
               StringBuilder sb_szCombinedText;
               if ( szCombinedText == null )
                  sb_szCombinedText = new StringBuilder( 32 );
               else
                  sb_szCombinedText = new StringBuilder( szCombinedText );
                               GetVariableFromAttribute( sb_szCombinedText, mi_lTempInteger_1, 'S', 2049, mSubLC, "S_GeneralStatement", "Title", "", 0 );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );
               szCombinedText = sb_szCombinedText.toString( );}
            } 

            //:END
         } 

         //:END
         //:IF mSubLC.S_GeneralSection.BoldText = "Y"
         if ( CompareAttributeToString( mSubLC, "S_GeneralSection", "BoldText", "Y" ) == 0 )
         { 
            //:szCombinedText = szCombinedText + "<b> " + mSubLC.S_GeneralStatement.Text + "</b>"
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
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_2, 'S', 4097, mSubLC, "S_GeneralStatement", "Text", "", 0 );
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
            //:szCombinedText = szCombinedText + " " + mSubLC.S_GeneralStatement.Text
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
                         GetVariableFromAttribute( sb_szTempString_2, mi_lTempInteger_3, 'S', 4097, mSubLC, "S_GeneralStatement", "Text", "", 0 );
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
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szCombinedText )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szCombinedText );
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
//:dFullHazardStatement( VIEW mSubLC BASED ON LOD mSubLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   STRING ( 256 ) szString
public int 
omSubLC_dFullHazardStatement( View     mSubLC,
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

         //:IF mSubLC.S_HumanHazardSection  EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "S_HumanHazardSection" );
         if ( lTempInteger_0 == 0 )
         { 

            //:szSeparator = mSubLC.S_HumanHazardSection.LocationSeparator
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szSeparator;
            if ( szSeparator == null )
               sb_szSeparator = new StringBuilder( 32 );
            else
               sb_szSeparator = new StringBuilder( szSeparator );
                         GetVariableFromAttribute( sb_szSeparator, mi_lTempInteger_1, 'S', 3, mSubLC, "S_HumanHazardSection", "LocationSeparator", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szSeparator = sb_szSeparator.toString( );}
            //:IF szSeparator = ""
            if ( ZeidonStringCompare( szSeparator, 1, 0, "", 1, 0, 3 ) == 0 )
            { 
               //:szSeparator = "[]"
                {StringBuilder sb_szSeparator;
               if ( szSeparator == null )
                  sb_szSeparator = new StringBuilder( 32 );
               else
                  sb_szSeparator = new StringBuilder( szSeparator );
                              ZeidonStringCopy( sb_szSeparator, 1, 0, "[]", 1, 0, 3 );
               szSeparator = sb_szSeparator.toString( );}
            } 

            //:END
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

            //:szEncloseFirst = mSubLC.S_HumanHazardSection.EncloseFirstLocation
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
            StringBuilder sb_szEncloseFirst;
            if ( szEncloseFirst == null )
               sb_szEncloseFirst = new StringBuilder( 32 );
            else
               sb_szEncloseFirst = new StringBuilder( szEncloseFirst );
                         GetVariableFromAttribute( sb_szEncloseFirst, mi_lTempInteger_2, 'S', 2, mSubLC, "S_HumanHazardSection", "EncloseFirstLocation", "", 0 );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );
            szEncloseFirst = sb_szEncloseFirst.toString( );}
            //:szString = mSubLC.S_HumanHazardSection.PrecautionaryStatement
            {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_3, 'S', 257, mSubLC, "S_HumanHazardSection", "PrecautionaryStatement", "", 0 );
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
               //:szLocation = mSubLC.S_HumanHazardSection.PanelLoc1
               {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_4, 'S', 257, mSubLC, "S_HumanHazardSection", "PanelLoc1", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.PanelLoc2
               {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_5, 'S', 257, mSubLC, "S_HumanHazardSection", "PanelLoc2", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.PanelLoc3
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_6, 'S', 257, mSubLC, "S_HumanHazardSection", "PanelLoc3", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.PanelLoc4
               {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_7, 'S', 257, mSubLC, "S_HumanHazardSection", "PanelLoc4", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.PanelLoc5
               {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_8, 'S', 257, mSubLC, "S_HumanHazardSection", "PanelLoc5", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.PanelLoc6
               {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_9, 'S', 257, mSubLC, "S_HumanHazardSection", "PanelLoc6", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.PanelLoc7
               {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_10, 'S', 257, mSubLC, "S_HumanHazardSection", "PanelLoc7", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.PanelLoc8
               {MutableInt mi_lTempInteger_11 = new MutableInt( lTempInteger_11 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_11, 'S', 257, mSubLC, "S_HumanHazardSection", "PanelLoc8", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.PanelLoc9
               {MutableInt mi_lTempInteger_12 = new MutableInt( lTempInteger_12 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_12, 'S', 257, mSubLC, "S_HumanHazardSection", "PanelLoc9", "", 0 );
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
               //:szLocation = mSubLC.S_HumanHazardSection.LabelLoc1
               {MutableInt mi_lTempInteger_13 = new MutableInt( lTempInteger_13 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_13, 'S', 257, mSubLC, "S_HumanHazardSection", "LabelLoc1", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.LabelLoc2
               {MutableInt mi_lTempInteger_14 = new MutableInt( lTempInteger_14 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_14, 'S', 257, mSubLC, "S_HumanHazardSection", "LabelLoc2", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.LabelLoc3
               {MutableInt mi_lTempInteger_15 = new MutableInt( lTempInteger_15 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_15, 'S', 257, mSubLC, "S_HumanHazardSection", "LabelLoc3", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.LabelLoc4
               {MutableInt mi_lTempInteger_16 = new MutableInt( lTempInteger_16 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_16, 'S', 257, mSubLC, "S_HumanHazardSection", "LabelLoc4", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.LabelLoc5
               {MutableInt mi_lTempInteger_17 = new MutableInt( lTempInteger_17 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_17, 'S', 257, mSubLC, "S_HumanHazardSection", "LabelLoc5", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.LabelLoc6
               {MutableInt mi_lTempInteger_18 = new MutableInt( lTempInteger_18 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_18, 'S', 257, mSubLC, "S_HumanHazardSection", "LabelLoc6", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.LabelLoc7
               {MutableInt mi_lTempInteger_19 = new MutableInt( lTempInteger_19 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_19, 'S', 257, mSubLC, "S_HumanHazardSection", "LabelLoc7", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.LabelLoc8
               {MutableInt mi_lTempInteger_20 = new MutableInt( lTempInteger_20 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_20, 'S', 257, mSubLC, "S_HumanHazardSection", "LabelLoc8", "", 0 );
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

               //:szLocation = mSubLC.S_HumanHazardSection.LabelLoc9
               {MutableInt mi_lTempInteger_21 = new MutableInt( lTempInteger_21 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_21, 'S', 257, mSubLC, "S_HumanHazardSection", "LabelLoc9", "", 0 );
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
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szString );
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


   //:TRANSFORMATION OPERATION
   //:BuildCompEntriesForSLC( VIEW mSubLC BASED ON LOD mSubLC )

   //:STRING ( 2052 ) szDisplayValue
public int 
omSubLC_BuildCompEntriesForSLC( View     mSubLC )
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
   //:FOR EACH mSubLC.CompositeComponentList
   RESULT = SetCursorFirstEntity( mSubLC, "CompositeComponentList", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mSubLC.CompositeComponentList NONE
      RESULT = DeleteEntity( mSubLC, "CompositeComponentList", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mSubLC, "CompositeComponentList", "" );
   } 

   //:END

   //:// Build Marketing Section and Statement components.
   //:FOR EACH mSubLC.S_MarketingSection
   RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSubLC.CompositeComponentList
      RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
      //:mSubLC.CompositeComponentList.Type               = "M_MarketingSection"
      SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_MarketingSection" );
      //:mSubLC.CompositeComponentList.SelectLevel        = 1
      SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 1 );
      //:mSubLC.CompositeComponentList.DisplayType        = "Marketing"
      SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "Marketing" );
      //:mSubLC.CompositeComponentList.DisplayTypeIndent  = "Marketing Section"
      SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", "Marketing Section" );
      //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_MarketingSection.ID
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_MarketingSection", "ID" );
      //:szName                                           = mSubLC.S_MarketingSection.Name
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
      StringBuilder sb_szName;
      if ( szName == null )
         sb_szName = new StringBuilder( 32 );
      else
         sb_szName = new StringBuilder( szName );
             GetVariableFromAttribute( sb_szName, mi_lTempInteger_0, 'S', 257, mSubLC, "S_MarketingSection", "Name", "", 0 );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );
      szName = sb_szName.toString( );}
      //:mSubLC.CompositeComponentList.Name               = szName
      SetAttributeFromString( mSubLC, "CompositeComponentList", "Name", szName );
      //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_MarketingSection.ID
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_MarketingSection", "ID" );
      //:TraceLineS( "BuildComposite Name: ", szName )
      TraceLineS( "BuildComposite Name: ", szName );
      //:IF mSubLC.S_MarketingSection.Title != ""
      if ( CompareAttributeToString( mSubLC, "S_MarketingSection", "Title", "" ) != 0 )
      { 
         //:IF szName = ""
         if ( ZeidonStringCompare( szName, 1, 0, "", 1, 0, 257 ) == 0 )
         { 
            //:mSubLC.CompositeComponentList.DisplayValue = mSubLC.S_MarketingSection.Title
            SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_MarketingSection", "Title" );
            //:ELSE
         } 
         else
         { 
            //:mSubLC.CompositeComponentList.DisplayValue = szName + " - " + mSubLC.S_MarketingSection.Title
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
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_1, 'S', 4097, mSubLC, "S_MarketingSection", "Title", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szTempString_1 = sb_szTempString_1.toString( );}
             {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                        ZeidonStringConcat( sb_szTempString_0, 1, 0, szTempString_1, 1, 0, 32001 );
            szTempString_0 = sb_szTempString_0.toString( );}
            SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayValue", szTempString_0 );
         } 

         //:END
         //:ELSE
      } 
      else
      { 
         //:mSubLC.CompositeComponentList.DisplayValue = szName
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayValue", szName );
      } 

      //:END
      //:mSubLC.CompositeComponentList.Title              = mSubLC.M_MarketingSection.Title
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Title", mSubLC, "M_MarketingSection", "Title" );
      //:mSubLC.CompositeComponentList.Value              = mSubLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "CompositeComponentList", "DisplayValue" );

      //:FOR EACH mSubLC.S_MarketingStatement
      RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSubLC.CompositeComponentList
         RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
         //:mSubLC.CompositeComponentList.Type               = "M_MarketingStatement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_MarketingStatement" );
         //:mSubLC.CompositeComponentList.SelectLevel        = 2
         SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 2 );
         //:mSubLC.CompositeComponentList.DisplayType        = "Statement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "Statement" );
         //:mSubLC.CompositeComponentList.DisplayTypeIndent  = "...Statement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_MarketingStatement.ID
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_MarketingStatement", "ID" );
         //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_MarketingStatement.ID
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_MarketingStatement", "ID" );
         //:mSubLC.CompositeComponentList.Title              = mSubLC.S_MarketingStatement.Title
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Title", mSubLC, "S_MarketingStatement", "Title" );
         //:szOriginalDisplayValue = mSubLC.S_MarketingStatement.Text
         {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_2, 'S', 2049, mSubLC, "S_MarketingStatement", "Text", "", 0 );
         lTempInteger_2 = mi_lTempInteger_2.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:mSubLC.CompositeComponentList.Value              = szOriginalDisplayValue
         SetAttributeFromString( mSubLC, "CompositeComponentList", "Value", szOriginalDisplayValue );
         //:szOriginalDisplayValue = mSubLC.S_MarketingStatement.dDisplayKeywordText
         {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_3, 'S', 2049, mSubLC, "S_MarketingStatement", "dDisplayKeywordText", "", 0 );
         lTempInteger_3 = mi_lTempInteger_3.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:GetAttributeLength( OriginalStringLength, mSubLC, "S_MarketingStatement", "Text" )
         {MutableInt mi_OriginalStringLength = new MutableInt( OriginalStringLength );
                   GetAttributeLength( mi_OriginalStringLength, mSubLC, "S_MarketingStatement", "Text" );
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
         //:mSubLC.CompositeComponentList.DisplayValue = szDisplayValue
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayValue", szDisplayValue );
         RESULT = SetCursorNextEntity( mSubLC, "S_MarketingStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_MarketingSection", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
public int 
omSubLC_RefreshSLC_FromMLC( View     mSubLC,
                            View     mMasLC )
{
   int      RESULT = 0;
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

   //:RefreshSLC_FromMLC( VIEW mSubLC BASED ON LOD mSubLC,
   //:                 VIEW mMasLC BASED ON LOD mMasLC )

   //:// ******** NOTE THAT THIS WAS TEMPORARY AND SHOULD NO LONGER BE USED. *******

   //:// Refresh SLC component values from the values in the corresponding MLC.
   //:FOR EACH mSubLC.S_Usage
   RESULT = SetCursorFirstEntity( mSubLC, "S_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST mMasLC.M_Usage WHERE mMasLC.M_Usage.ID = mSubLC.M_Usage.ID
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
             GetIntegerFromAttribute( mi_lTempInteger_0, mSubLC, "M_Usage", "ID" );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_Usage", "ID", lTempInteger_0, "" );
      //:IF RESULT >= zCURSOR_SET
      if ( RESULT >= zCURSOR_SET )
      { 
         //:mSubLC.S_Usage.Name = mMasLC.M_Usage.Name
         SetAttributeFromAttribute( mSubLC, "S_Usage", "Name", mMasLC, "M_Usage", "Name" );
         //:ELSE
      } 
      else
      { 
         //:TraceLineS( "#### No Match on Usage", "" )
         TraceLineS( "#### No Match on Usage", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_Usage", "" );
      //:END
   } 

   //:END

   //:// Rebuild General Section entries.
   //:FOR EACH mSubLC.S_GeneralSection
   RESULT = SetCursorFirstEntity( mSubLC, "S_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mSubLC.S_GeneralSection NONE
      RESULT = DeleteEntity( mSubLC, "S_GeneralSection", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mSubLC, "S_GeneralSection", "" );
   } 

   //:END
   //:FOR EACH mMasLC.M_GeneralSection
   RESULT = SetCursorFirstEntity( mMasLC, "M_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSubLC.S_GeneralSection
      RESULT = CreateEntity( mSubLC, "S_GeneralSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( mSubLC, "S_GeneralSection", mMasLC, "M_GeneralSection", zSET_NULL )
      SetMatchingAttributesByName( mSubLC, "S_GeneralSection", mMasLC, "M_GeneralSection", zSET_NULL );
      //:INCLUDE mSubLC.M_GeneralSection FROM mMasLC.M_GeneralSection
      RESULT = IncludeSubobjectFromSubobject( mSubLC, "M_GeneralSection", mMasLC, "M_GeneralSection", zPOS_AFTER );
      //:FOR EACH mMasLC.M_GeneralStatement
      RESULT = SetCursorFirstEntity( mMasLC, "M_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSubLC.S_GeneralStatement
         RESULT = CreateEntity( mSubLC, "S_GeneralStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( mSubLC, "S_GeneralStatement", mMasLC, "M_GeneralStatement", zSET_NULL )
         SetMatchingAttributesByName( mSubLC, "S_GeneralStatement", mMasLC, "M_GeneralStatement", zSET_NULL );
         //:INCLUDE mSubLC.M_GeneralStatement FROM mMasLC.M_GeneralStatement
         RESULT = IncludeSubobjectFromSubobject( mSubLC, "M_GeneralStatement", mMasLC, "M_GeneralStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( mMasLC, "M_GeneralStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_GeneralSection", "" );
      //:END
   } 

   //:END

   //:// Rebuild Ingredients Section entries.
   //:FOR EACH mSubLC.S_IngredientsSection
   RESULT = SetCursorFirstEntity( mSubLC, "S_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mSubLC.S_IngredientsSection NONE
      RESULT = DeleteEntity( mSubLC, "S_IngredientsSection", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mSubLC, "S_IngredientsSection", "" );
   } 

   //:END
   //:FOR EACH mMasLC.M_IngredientsSection
   RESULT = SetCursorFirstEntity( mMasLC, "M_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSubLC.S_IngredientsSection
      RESULT = CreateEntity( mSubLC, "S_IngredientsSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( mSubLC, "S_IngredientsSection", mMasLC, "M_IngredientsSection", zSET_NULL )
      SetMatchingAttributesByName( mSubLC, "S_IngredientsSection", mMasLC, "M_IngredientsSection", zSET_NULL );
      //:INCLUDE mSubLC.M_IngredientsSection FROM mMasLC.M_IngredientsSection
      RESULT = IncludeSubobjectFromSubobject( mSubLC, "M_IngredientsSection", mMasLC, "M_IngredientsSection", zPOS_AFTER );
      //:FOR EACH mMasLC.M_IngredientsStatement
      RESULT = SetCursorFirstEntity( mMasLC, "M_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSubLC.S_IngredientsStatement
         RESULT = CreateEntity( mSubLC, "S_IngredientsStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( mSubLC, "S_IngredientsStatement", mMasLC, "M_IngredientsStatement", zSET_NULL )
         SetMatchingAttributesByName( mSubLC, "S_IngredientsStatement", mMasLC, "M_IngredientsStatement", zSET_NULL );
         //:INCLUDE mSubLC.M_IngredientsStatement FROM mMasLC.M_IngredientsStatement
         RESULT = IncludeSubobjectFromSubobject( mSubLC, "M_IngredientsStatement", mMasLC, "M_IngredientsStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( mMasLC, "M_IngredientsStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_IngredientsSection", "" );
      //:END
   } 

   //:END

   //:// Rebuild Storage and Disposal entries.
   //:FOR EACH mSubLC.S_StorageDisposalSection
   RESULT = SetCursorFirstEntity( mSubLC, "S_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mSubLC.S_StorageDisposalSection NONE
      RESULT = DeleteEntity( mSubLC, "S_StorageDisposalSection", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mSubLC, "S_StorageDisposalSection", "" );
   } 

   //:END
   //:FOR EACH mMasLC.M_StorageDisposalSection
   RESULT = SetCursorFirstEntity( mMasLC, "M_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSubLC.S_StorageDisposalSection
      RESULT = CreateEntity( mSubLC, "S_StorageDisposalSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( mSubLC, "S_StorageDisposalSection", mMasLC, "M_StorageDisposalSection", zSET_NULL )
      SetMatchingAttributesByName( mSubLC, "S_StorageDisposalSection", mMasLC, "M_StorageDisposalSection", zSET_NULL );
      //:INCLUDE mSubLC.M_StorageDisposalSection FROM mMasLC.M_StorageDisposalSection
      RESULT = IncludeSubobjectFromSubobject( mSubLC, "M_StorageDisposalSection", mMasLC, "M_StorageDisposalSection", zPOS_AFTER );
      //:FOR EACH mMasLC.M_StorageDisposalStatement
      RESULT = SetCursorFirstEntity( mMasLC, "M_StorageDisposalStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSubLC.S_StorageDisposalStatement
         RESULT = CreateEntity( mSubLC, "S_StorageDisposalStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( mSubLC, "S_StorageDisposalStatement", mMasLC, "M_StorageDisposalStatement", zSET_NULL )
         SetMatchingAttributesByName( mSubLC, "S_StorageDisposalStatement", mMasLC, "M_StorageDisposalStatement", zSET_NULL );
         //:INCLUDE mSubLC.M_StorageDisposalStatement FROM mMasLC.M_StorageDisposalStatement
         RESULT = IncludeSubobjectFromSubobject( mSubLC, "M_StorageDisposalStatement", mMasLC, "M_StorageDisposalStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( mMasLC, "M_StorageDisposalStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mMasLC, "M_StorageDisposalSection", "" );
      //:END
   } 

   //:END

   //:// Delete any Directions For Use Sections in SLC not in MLC.
   //:FOR EACH mSubLC.S_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSubLC.M_DirectionsForUseSection DOES NOT EXIST
      lTempInteger_1 = CheckExistenceOfEntity( mSubLC, "M_DirectionsForUseSection" );
      if ( lTempInteger_1 != 0 )
      { 
         //:DELETE ENTITY mSubLC.S_DirectionsForUseSection NONE
         RESULT = DeleteEntity( mSubLC, "S_DirectionsForUseSection", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// Add/Refresh SLC Directions For Use Sections.
   //:FOR EACH mSubLC.S_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST mMasLC.M_DirectionsForUseSection WHERE mMasLC.M_DirectionsForUseSection.ID = mSubLC.M_DirectionsForUseSection.ID
      {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
             GetIntegerFromAttribute( mi_lTempInteger_2, mSubLC, "M_DirectionsForUseSection", "ID" );
      lTempInteger_2 = mi_lTempInteger_2.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_DirectionsForUseSection", "ID", lTempInteger_2, "" );
      //:IF RESULT >= zCURSOR_SET
      if ( RESULT >= zCURSOR_SET )
      { 
         //:FOR EACH mSubLC.S_DirectionsForUseStatement
         RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseStatement", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST mMasLC.M_DirectionsForUseStatement WHERE mMasLC.M_DirectionsForUseStatement.ID = mSubLC.M_DirectionsForUseStatement.ID
            {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                         GetIntegerFromAttribute( mi_lTempInteger_3, mSubLC, "M_DirectionsForUseStatement", "ID" );
            lTempInteger_3 = mi_lTempInteger_3.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_DirectionsForUseStatement", "ID", lTempInteger_3, "" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:mSubLC.S_DirectionsForUseStatement.Text = mMasLC.M_DirectionsForUseStatement.Text
               SetAttributeFromAttribute( mSubLC, "S_DirectionsForUseStatement", "Text", mMasLC, "M_DirectionsForUseStatement", "Text" );
            } 

            RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseStatement", "" );
            //:END
         } 

         //:END

         //:// Add Usage Entries, if they don't already exist.
         //:IF mMasLC.M_DirectionsUsageOrdering EXISTS AND mSubLC.S_DirectionsUsageOrdering DOES NOT EXIST
         lTempInteger_4 = CheckExistenceOfEntity( mMasLC, "M_DirectionsUsageOrdering" );
         lTempInteger_5 = CheckExistenceOfEntity( mSubLC, "S_DirectionsUsageOrdering" );
         if ( lTempInteger_4 == 0 && lTempInteger_5 != 0 )
         { 
            //:FOR EACH mMasLC.M_DirectionsUsageOrdering
            RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:CREATE ENTITY mSubLC.S_DirectionsUsageOrdering
               RESULT = CreateEntity( mSubLC, "S_DirectionsUsageOrdering", zPOS_AFTER );
               //:SET CURSOR FIRST mSubLC.M_Usage WITHIN mSubLC.SubregLabelContent
               //:           WHERE mSubLC.M_Usage.ID = mMasLC.M_DirectionsUsage.ID
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
                               GetIntegerFromAttribute( mi_lTempInteger_6, mMasLC, "M_DirectionsUsage", "ID" );
               lTempInteger_6 = mi_lTempInteger_6.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mSubLC, "M_Usage", "ID", lTempInteger_6, "SubregLabelContent" );
               //:IF RESULT < zCURSOR_SET
               if ( RESULT < zCURSOR_SET )
               { 
                  //:CREATE ENTITY mSubLC.S_Usage
                  RESULT = CreateEntity( mSubLC, "S_Usage", zPOS_AFTER );
                  //:SetMatchingAttributesByName( mSubLC, "S_Usage", mMasLC, "M_DirectionsUsage", zSET_NULL )
                  SetMatchingAttributesByName( mSubLC, "S_Usage", mMasLC, "M_DirectionsUsage", zSET_NULL );
               } 

               //:END
               //:INCLUDE mSubLC.S_DirectionsUsage FROM mSubLC.S_Usage
               RESULT = IncludeSubobjectFromSubobject( mSubLC, "S_DirectionsUsage", mSubLC, "S_Usage", zPOS_AFTER );
               RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
            } 

            //:END
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// Delete any Marketing Sections in SLC not in MLC.
   //:FOR EACH mSubLC.S_MarketingSection
   RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSubLC.M_MarketingSection DOES NOT EXIST
      lTempInteger_7 = CheckExistenceOfEntity( mSubLC, "M_MarketingSection" );
      if ( lTempInteger_7 != 0 )
      { 
         //:DELETE ENTITY mSubLC.S_MarketingSection NONE
         RESULT = DeleteEntity( mSubLC, "S_MarketingSection", zREPOS_NONE );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_MarketingSection", "" );
      //:END
   } 

   //:END

   //:// Add/Refresh SLC Marketing Sections.
   //:FOR EACH mSubLC.S_MarketingSection
   RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST mMasLC.M_MarketingSection WHERE mMasLC.M_MarketingSection.ID = mSubLC.M_MarketingSection.ID
      {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
             GetIntegerFromAttribute( mi_lTempInteger_8, mSubLC, "M_MarketingSection", "ID" );
      lTempInteger_8 = mi_lTempInteger_8.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_MarketingSection", "ID", lTempInteger_8, "" );
      //:IF RESULT >= zCURSOR_SET
      if ( RESULT >= zCURSOR_SET )
      { 
         //:FOR EACH mSubLC.S_MarketingStatement
         RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingStatement", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST mMasLC.M_MarketingStatement WHERE mMasLC.M_MarketingStatement.ID = mSubLC.M_MarketingStatement.ID
            {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
                         GetIntegerFromAttribute( mi_lTempInteger_9, mSubLC, "M_MarketingStatement", "ID" );
            lTempInteger_9 = mi_lTempInteger_9.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_MarketingStatement", "ID", lTempInteger_9, "" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:mSubLC.S_MarketingStatement.Text = mMasLC.M_MarketingStatement.Text
               SetAttributeFromAttribute( mSubLC, "S_MarketingStatement", "Text", mMasLC, "M_MarketingStatement", "Text" );
            } 

            RESULT = SetCursorNextEntity( mSubLC, "S_MarketingStatement", "" );
            //:END
         } 

         //:END

         //:// Add Usage Entries, if they don't already exist.
         //:IF mMasLC.M_MarketingUsageOrdering EXISTS AND mSubLC.S_MarketingUsageOrdering DOES NOT EXIST
         lTempInteger_10 = CheckExistenceOfEntity( mMasLC, "M_MarketingUsageOrdering" );
         lTempInteger_11 = CheckExistenceOfEntity( mSubLC, "S_MarketingUsageOrdering" );
         if ( lTempInteger_10 == 0 && lTempInteger_11 != 0 )
         { 
            //:FOR EACH mMasLC.M_MarketingUsageOrdering
            RESULT = SetCursorFirstEntity( mMasLC, "M_MarketingUsageOrdering", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:CREATE ENTITY mSubLC.S_MarketingUsageOrdering
               RESULT = CreateEntity( mSubLC, "S_MarketingUsageOrdering", zPOS_AFTER );
               //:SET CURSOR FIRST mSubLC.M_Usage WITHIN mSubLC.SubregLabelContent
               //:           WHERE mSubLC.M_Usage.ID = mMasLC.M_MarketingUsage.ID
               {MutableInt mi_lTempInteger_12 = new MutableInt( lTempInteger_12 );
                               GetIntegerFromAttribute( mi_lTempInteger_12, mMasLC, "M_MarketingUsage", "ID" );
               lTempInteger_12 = mi_lTempInteger_12.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mSubLC, "M_Usage", "ID", lTempInteger_12, "SubregLabelContent" );
               //:IF RESULT < zCURSOR_SET
               if ( RESULT < zCURSOR_SET )
               { 
                  //:CREATE ENTITY mSubLC.S_Usage
                  RESULT = CreateEntity( mSubLC, "S_Usage", zPOS_AFTER );
                  //:SetMatchingAttributesByName( mSubLC, "S_Usage", mMasLC, "M_MarketingUsage", zSET_NULL )
                  SetMatchingAttributesByName( mSubLC, "S_Usage", mMasLC, "M_MarketingUsage", zSET_NULL );
               } 

               //:END
               //:INCLUDE mSubLC.S_MarketingUsage FROM mSubLC.S_Usage
               RESULT = IncludeSubobjectFromSubobject( mSubLC, "S_MarketingUsage", mSubLC, "S_Usage", zPOS_AFTER );
               RESULT = SetCursorNextEntity( mMasLC, "M_MarketingUsageOrdering", "" );
            } 

            //:END
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_MarketingSection", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:BuildWorkVariables( VIEW mSubLC BASED ON LOD mSubLC,
//:                    VIEW mMasLC BASED ON LOD mMasLC )

//:   INTEGER ID
public int 
omSubLC_BuildWorkVariables( View     mSubLC,
                            View     mMasLC )
{
   int      ID = 0;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;


   //:// Build any work variable for the mSubLC.

   //:// Build list of Directions For Use Section Driving Usage entries by selecting the Driving Usage entries
   //:// from the MLC that have been selected for the SLC.
   //:FOR EACH mSubLC.S_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:ID = mSubLC.S_DirectionsForUseSection.PrimaryMLC_ID
      {MutableInt mi_ID = new MutableInt( ID );
             GetIntegerFromAttribute( mi_ID, mSubLC, "S_DirectionsForUseSection", "PrimaryMLC_ID" );
      ID = mi_ID.intValue( );}
      //:SET CURSOR FIRST mMasLC.M_DirectionsForUseSection
      //:           WHERE mMasLC.M_DirectionsForUseSection.ID = ID
      RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_DirectionsForUseSection", "ID", ID, "" );
      //:IF RESULT < zCURSOR_SET
      if ( RESULT < zCURSOR_SET )
      { 
         //:TraceLineI( "Error in BuildWorkVariables locating S_DirectionsForUseSection PrimaryMLC_ID: ", ID )
         TraceLineI( "Error in BuildWorkVariables locating S_DirectionsForUseSection PrimaryMLC_ID: ", ID );
         //:// IssueError( mSubLC,0,0,"Programming Error in BuildWorkVariables" )
         //:ELSE
      } 
      else
      { 
         //:FOR EACH mMasLC.M_ClaimsDrivingUsage
         RESULT = SetCursorFirstEntity( mMasLC, "M_ClaimsDrivingUsage", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST mSubLC.S_Usage WITHIN mSubLC.SubregLabelContent
            //:           WHERE mSubLC.S_Usage.PrimaryMLC_ID = mMasLC.M_ClaimsDrivingUsage.ID
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                         GetIntegerFromAttribute( mi_lTempInteger_0, mMasLC, "M_ClaimsDrivingUsage", "ID" );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_Usage", "PrimaryMLC_ID", lTempInteger_0, "SubregLabelContent" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:INCLUDE mSubLC.S_ClaimsDrivingUsage FROM mSubLC.S_Usage
               RESULT = IncludeSubobjectFromSubobject( mSubLC, "S_ClaimsDrivingUsage", mSubLC, "S_Usage", zPOS_AFTER );
            } 

            RESULT = SetCursorNextEntity( mMasLC, "M_ClaimsDrivingUsage", "" );
            //:END
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// Build list of Directions For Use Statement Usage entries by selecting the Statement Usage entries
   //:// from the MLC that have been selected for the SLC.
   //:FOR EACH mSubLC.S_DirectionsForUseStatement WITHIN mSubLC.SubregLabelContent
   RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseStatement", "SubregLabelContent" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:ID = mSubLC.S_DirectionsForUseStatement.PrimaryMLC_ID
      {MutableInt mi_ID = new MutableInt( ID );
             GetIntegerFromAttribute( mi_ID, mSubLC, "S_DirectionsForUseStatement", "PrimaryMLC_ID" );
      ID = mi_ID.intValue( );}
      //:IF RESULT < zCURSOR_SET
      if ( RESULT < zCURSOR_SET )
      { 
         //:SET CURSOR FIRST mMasLC.M_DirectionsForUseStatement WITHIN mMasLC.MasterLabelContent
         //:        WHERE mMasLC.M_DirectionsForUseStatement.ID = ID
         RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_DirectionsForUseStatement", "ID", ID, "MasterLabelContent" );
         //:TraceLineI( "Error in BuildWorkVariables locating S_DirectionsForUseStatement PrimaryMLC_ID: ", ID )
         TraceLineI( "Error in BuildWorkVariables locating S_DirectionsForUseStatement PrimaryMLC_ID: ", ID );
      } 

      //:// IssueError( mSubLC, 0, 0, "Programming Error 2 in BuildWorkVariables" )
      //:END
      //:FOR EACH mMasLC.M_DirectionsUsageOrdering
      RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST mSubLC.S_Usage WITHIN mSubLC.SubregLabelContent
         //:           WHERE mSubLC.S_Usage.PrimaryMLC_ID = mMasLC.M_DirectionsUsage.ID
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                   GetIntegerFromAttribute( mi_lTempInteger_1, mMasLC, "M_DirectionsUsage", "ID" );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_Usage", "PrimaryMLC_ID", lTempInteger_1, "SubregLabelContent" );
         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:INCLUDE mSubLC.S_SelectableDirsForUseUsage FROM mSubLC.S_Usage
            RESULT = IncludeSubobjectFromSubobject( mSubLC, "S_SelectableDirsForUseUsage", mSubLC, "S_Usage", zPOS_AFTER );
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseStatement", "SubregLabelContent" );
      //:END
   } 

   //:END

   //:// Build list of Marketing Statement Usage entries by selecting the Statement Usage entries
   //:// from the MLC that have been selected for the SLC.
   //:FOR EACH mSubLC.S_MarketingStatement WITHIN mSubLC.SubregLabelContent
   RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingStatement", "SubregLabelContent" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:ID = mSubLC.S_MarketingStatement.PrimaryMLC_ID
      {MutableInt mi_ID = new MutableInt( ID );
             GetIntegerFromAttribute( mi_ID, mSubLC, "S_MarketingStatement", "PrimaryMLC_ID" );
      ID = mi_ID.intValue( );}
      //:SET CURSOR FIRST mMasLC.M_MarketingStatement WITHIN mMasLC.MasterLabelContent
      //:           WHERE mMasLC.M_MarketingStatement.ID = ID
      RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_MarketingStatement", "ID", ID, "MasterLabelContent" );
      //:IF RESULT < zCURSOR_SET
      if ( RESULT < zCURSOR_SET )
      { 
         //:TraceLineI( "Error in BuildWorkVariables locating S_MarketingStatement PrimaryMLC_ID: ", ID )
         TraceLineI( "Error in BuildWorkVariables locating S_MarketingStatement PrimaryMLC_ID: ", ID );
      } 

      //:// IssueError( mSubLC, 0, 0, "Programming Error 3 in BuildWorkVariables" )
      //:END
      //:TraceLineS( "############ Marketing Section: ", mMasLC.M_MarketingSection.Name )
      {StringBuilder sb_szTempString_0;
      if ( szTempString_0 == null )
         sb_szTempString_0 = new StringBuilder( 32 );
      else
         sb_szTempString_0 = new StringBuilder( szTempString_0 );
             GetStringFromAttribute( sb_szTempString_0, mMasLC, "M_MarketingSection", "Name" );
      szTempString_0 = sb_szTempString_0.toString( );}
      TraceLineS( "############ Marketing Section: ", szTempString_0 );
      //:FOR EACH mMasLC.M_MarketingUsageOrdering
      RESULT = SetCursorFirstEntity( mMasLC, "M_MarketingUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST mSubLC.S_Usage WITHIN mSubLC.SubregLabelContent
         //:           WHERE mSubLC.S_Usage.PrimaryMLC_ID = mMasLC.M_MarketingUsage.ID
         {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                   GetIntegerFromAttribute( mi_lTempInteger_2, mMasLC, "M_MarketingUsage", "ID" );
         lTempInteger_2 = mi_lTempInteger_2.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_Usage", "PrimaryMLC_ID", lTempInteger_2, "SubregLabelContent" );
         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:INCLUDE mSubLC.S_SelectableMarketingUsage FROM mSubLC.S_Usage
            RESULT = IncludeSubobjectFromSubobject( mSubLC, "S_SelectableMarketingUsage", mSubLC, "S_Usage", zPOS_AFTER );
            //:TraceLineS( "############ INCLUDE ", "" )
            TraceLineS( "############ INCLUDE ", "" );
         } 

         //:END
         //:TraceLineI( "############ Marketing PrimaryMLC_ID: ", mSubLC.S_Usage.PrimaryMLC_ID )
         {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                   GetIntegerFromAttribute( mi_lTempInteger_3, mSubLC, "S_Usage", "PrimaryMLC_ID" );
         lTempInteger_3 = mi_lTempInteger_3.intValue( );}
         TraceLineI( "############ Marketing PrimaryMLC_ID: ", lTempInteger_3 );
         RESULT = SetCursorNextEntity( mMasLC, "M_MarketingUsageOrdering", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_MarketingStatement", "SubregLabelContent" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dDisplayPathogenName( VIEW mSubLC BASED ON LOD mSubLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   VIEW mSubLC2 BASED ON LOD mSubLC
public int 
omSubLC_dDisplayPathogenName( View     mSubLC,
                              String InternalEntityStructure,
                              String InternalAttribStructure,
                              Integer   GetOrSetFlag )
{
   zVIEW    mSubLC2 = new zVIEW( );
   //:STRING ( 32 )  szEntityName
   String   szEntityName = null;
   //:STRING ( 100 ) szUsageType
   String   szUsageType = null;
   //:STRING ( 100 ) szClassification
   String   szClassification = null;
   //:STRING ( 100 ) szCombinedName
   String   szCombinedName = null;
   //:STRING ( 3 )   szFootnoteNumber
   String   szFootnoteNumber = null;
   //:INTEGER        Count
   int      Count = 0;
   int      lTempInteger_0 = 0;
   int      RESULT = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Combine the Footnote Number as a subscript to the Claim Name, if it exists.
         //:GetEntityNameFromStructure( InternalEntityStructure, szEntityName )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szUsageType, mSubLC, szEntityName, "UsageType" )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttribute( sb_szUsageType, mSubLC, szEntityName, "UsageType" );
         szUsageType = sb_szUsageType.toString( );}
         //:GetStringFromAttribute( szClassification, mSubLC, szEntityName, "ClaimsClassification" )
         {StringBuilder sb_szClassification;
         if ( szClassification == null )
            sb_szClassification = new StringBuilder( 32 );
         else
            sb_szClassification = new StringBuilder( szClassification );
                   GetStringFromAttribute( sb_szClassification, mSubLC, szEntityName, "ClaimsClassification" );
         szClassification = sb_szClassification.toString( );}
         //:GetStringFromAttribute( szCombinedName, mSubLC, szEntityName, "Name" )
         {StringBuilder sb_szCombinedName;
         if ( szCombinedName == null )
            sb_szCombinedName = new StringBuilder( 32 );
         else
            sb_szCombinedName = new StringBuilder( szCombinedName );
                   GetStringFromAttribute( sb_szCombinedName, mSubLC, szEntityName, "Name" );
         szCombinedName = sb_szCombinedName.toString( );}

         //:// Set Footnote Number, if footnote exists.
         //:IF mSubLC.S_UsageFootnoteUsed EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "S_UsageFootnoteUsed" );
         if ( lTempInteger_0 == 0 )
         { 
            //:IF mSubLC.S_UsageFootnoteUsed.ID != ""
            if ( CompareAttributeToString( mSubLC, "S_UsageFootnoteUsed", "ID", "" ) != 0 )
            { 
               //:SET CURSOR FIRST mSubLC.MLC_UsageFootnote WHERE mSubLC.MLC_UsageFootnote.ID = mSubLC.S_UsageFootnoteUsed.ID
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, mSubLC, "S_UsageFootnoteUsed", "ID" );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mSubLC, "MLC_UsageFootnote", "ID", lTempInteger_1, "" );
               //:IF mSubLC.MLC_UsageFootnote.wFootNoteRelativeNumber = ""
               if ( CompareAttributeToString( mSubLC, "MLC_UsageFootnote", "wFootNoteRelativeNumber", "" ) == 0 )
               { 
                  //:// Relative numbers haven't be set, so set them here.
                  //:CreateViewFromView( mSubLC2, mSubLC )
                  CreateViewFromView( mSubLC2, mSubLC );
                  //:Count = 0
                  Count = 0;
                  //:FOR EACH mSubLC2.MLC_UsageFootnote
                  RESULT = SetCursorFirstEntity( mSubLC2, "MLC_UsageFootnote", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:Count = Count + 1
                     Count = Count + 1;
                     //:mSubLC2.MLC_UsageFootnote.wFootNoteRelativeNumber = Count
                     SetAttributeFromInteger( mSubLC2, "MLC_UsageFootnote", "wFootNoteRelativeNumber", Count );
                     RESULT = SetCursorNextEntity( mSubLC2, "MLC_UsageFootnote", "" );
                  } 

                  //:END
                  //:DropView( mSubLC2 )
                  DropView( mSubLC2 );
               } 

               //:END
               //:szFootnoteNumber = mSubLC.MLC_UsageFootnote.wFootNoteRelativeNumber
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szFootnoteNumber;
               if ( szFootnoteNumber == null )
                  sb_szFootnoteNumber = new StringBuilder( 32 );
               else
                  sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                               GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_2, 'S', 4, mSubLC, "MLC_UsageFootnote", "wFootNoteRelativeNumber", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               //:szCombinedName = szCombinedName + "<sup> " + szFootnoteNumber + "</sup>"
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, "<sup> ", 1, 0, 101 );
               szCombinedName = sb_szCombinedName.toString( );}
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, szFootnoteNumber, 1, 0, 101 );
               szCombinedName = sb_szCombinedName.toString( );}
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, "</sup>", 1, 0, 101 );
               szCombinedName = sb_szCombinedName.toString( );}
            } 

            //:END
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC,
         //:                  InternalEntityStructure,
         //:                  InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szCombinedName );
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
//:dPathogenNameKeyFoot( VIEW mSubLC BASED ON LOD mSubLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   VIEW mSubLC2 BASED ON LOD mSubLC
public int 
omSubLC_dPathogenNameKeyFoot( View     mSubLC,
                              String InternalEntityStructure,
                              String InternalAttribStructure,
                              Integer   GetOrSetFlag )
{
   zVIEW    mSubLC2 = new zVIEW( );
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
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szUsageType, mSubLC, szEntityName, "UsageType" )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttribute( sb_szUsageType, mSubLC, szEntityName, "UsageType" );
         szUsageType = sb_szUsageType.toString( );}
         //:GetStringFromAttribute( szClassification, mSubLC, szEntityName, "ClaimsClassification" )
         {StringBuilder sb_szClassification;
         if ( szClassification == null )
            sb_szClassification = new StringBuilder( 32 );
         else
            sb_szClassification = new StringBuilder( szClassification );
                   GetStringFromAttribute( sb_szClassification, mSubLC, szEntityName, "ClaimsClassification" );
         szClassification = sb_szClassification.toString( );}
         //:GetStringFromAttribute( szCombinedName, mSubLC, szEntityName, "Name" )
         {StringBuilder sb_szCombinedName;
         if ( szCombinedName == null )
            sb_szCombinedName = new StringBuilder( 32 );
         else
            sb_szCombinedName = new StringBuilder( szCombinedName );
                   GetStringFromAttribute( sb_szCombinedName, mSubLC, szEntityName, "Name" );
         szCombinedName = sb_szCombinedName.toString( );}

         //:// Set Footnote Number, if footnote exists.
         //:IF mSubLC.S_UsageFootnoteUsed EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "S_UsageFootnoteUsed" );
         if ( lTempInteger_0 == 0 )
         { 
            //:IF mSubLC.S_UsageFootnoteUsed.ID != ""
            if ( CompareAttributeToString( mSubLC, "S_UsageFootnoteUsed", "ID", "" ) != 0 )
            { 
               //:SET CURSOR FIRST mSubLC.S_UsageFootnote WHERE mSubLC.S_UsageFootnote.ID = mSubLC.S_UsageFootnoteUsed.ID
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, mSubLC, "S_UsageFootnoteUsed", "ID" );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mSubLC, "S_UsageFootnote", "ID", lTempInteger_1, "" );
               //:IF mSubLC.S_UsageFootnote.wFootNoteRelativeNumber = ""
               if ( CompareAttributeToString( mSubLC, "S_UsageFootnote", "wFootNoteRelativeNumber", "" ) == 0 )
               { 
                  //:// Relative numbers haven't been set, so set them here.
                  //:CreateViewFromView( mSubLC2, mSubLC )
                  CreateViewFromView( mSubLC2, mSubLC );
                  //:Count = 0
                  Count = 0;
                  //:FOR EACH mSubLC2.S_UsageFootnote
                  RESULT = SetCursorFirstEntity( mSubLC2, "S_UsageFootnote", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:Count = Count + 1
                     Count = Count + 1;
                     //:mSubLC2.S_UsageFootnote.wFootNoteRelativeNumber = Count
                     SetAttributeFromInteger( mSubLC2, "S_UsageFootnote", "wFootNoteRelativeNumber", Count );
                     RESULT = SetCursorNextEntity( mSubLC2, "S_UsageFootnote", "" );
                  } 

                  //:END
                  //:DropView( mSubLC2 )
                  DropView( mSubLC2 );
               } 

               //:END
               //:szFootnoteNumber = mSubLC.S_UsageFootnote.Symbol
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szFootnoteNumber;
               if ( szFootnoteNumber == null )
                  sb_szFootnoteNumber = new StringBuilder( 32 );
               else
                  sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                               GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_2, 'S', 33, mSubLC, "S_UsageFootnote", "Symbol", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               //:IF szFootnoteNumber = ""
               if ( ZeidonStringCompare( szFootnoteNumber, 1, 0, "", 1, 0, 33 ) == 0 )
               { 
                  //:szFootnoteNumber = mSubLC.S_UsageFootnote.wFootNoteRelativeNumber
                  {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                  StringBuilder sb_szFootnoteNumber;
                  if ( szFootnoteNumber == null )
                     sb_szFootnoteNumber = new StringBuilder( 32 );
                  else
                     sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                                     GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_3, 'S', 33, mSubLC, "S_UsageFootnote", "wFootNoteRelativeNumber", "", 0 );
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
         //:IF mSubLC.S_InsertTextKeywordUsage EXISTS
         lTempInteger_4 = CheckExistenceOfEntity( mSubLC, "S_InsertTextKeywordUsage" );
         if ( lTempInteger_4 == 0 )
         { 
            //:CreateViewFromView( mSubLC2, mSubLC )
            CreateViewFromView( mSubLC2, mSubLC );
            //:FOR EACH mSubLC2.S_InsertTextKeywordUsage
            RESULT = SetCursorFirstEntity( mSubLC2, "S_InsertTextKeywordUsage", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:// Reuse (borrow) szUsageType and szClassification
               //:szUsageType = "{" + mSubLC2.S_InsertTextKeywordUsage.Name + "}"
               {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_5, 'S', 255, mSubLC2, "S_InsertTextKeywordUsage", "Name", "", 0 );
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
               //:szClassification = "<b>" + mSubLC2.S_InsertTextUsage.Text + "</b>"
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
               StringBuilder sb_szTempString_1;
               if ( szTempString_1 == null )
                  sb_szTempString_1 = new StringBuilder( 32 );
               else
                  sb_szTempString_1 = new StringBuilder( szTempString_1 );
                               GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_6, 'S', 4097, mSubLC2, "S_InsertTextUsage", "Text", "", 0 );
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
               RESULT = SetCursorNextEntity( mSubLC2, "S_InsertTextKeywordUsage", "" );
            } 

            //:END
            //:DropView( mSubLC2 )
            DropView( mSubLC2 );
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szCombinedName );
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
//:dUsgTextSubUsageNames( VIEW mSubLC BASED ON LOD mSubLC,
//:                       STRING ( 32 ) InternalEntityStructure,
//:                       STRING ( 32 ) InternalAttribStructure,
//:                       SHORT GetOrSetFlag )

//:   VIEW mSubLC2 BASED ON LOD mSubLC
public int 
omSubLC_dUsgTextSubUsageNames( View     mSubLC,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   zVIEW    mSubLC2 = new zVIEW( );
   //:STRING ( 2048 ) szDisplayStatement
   String   szDisplayStatement = null;
   //:STRING ( 100 ) szUsageName
   String   szUsageName = null;
   //:STRING ( 100 ) szUsageText
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

         //:IF mSubLC.S_Usage EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "S_Usage" );
         if ( lTempInteger_0 == 0 )
         { 
            //:// Display required text combined with optional usage(s).
            //:szDisplayStatement = mSubLC.S_Usage.Name
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_1, 'S', 2049, mSubLC, "S_Usage", "Name", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
            //:InsertOptionalSubUsages( mSubLC, szDisplayStatement, "S_SubUsage", 1 )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
              {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                        m_ZGlobal1_Operation.InsertOptionalSubUsages( mSubLC, sb_szDisplayStatement, "S_SubUsage", 1 );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }

            //:IF mSubLC.S_InsertTextKeywordUsage EXISTS
            lTempInteger_2 = CheckExistenceOfEntity( mSubLC, "S_InsertTextKeywordUsage" );
            if ( lTempInteger_2 == 0 )
            { 
               //:CreateViewFromView( mSubLC2, mSubLC )
               CreateViewFromView( mSubLC2, mSubLC );
               //:FOR EACH mSubLC2.S_InsertTextKeywordUsage
               RESULT = SetCursorFirstEntity( mSubLC2, "S_InsertTextKeywordUsage", "" );
               while ( RESULT > zCURSOR_UNCHANGED )
               { 
                  //:szUsageName = "{" + mSubLC2.S_InsertTextKeywordUsage.Name + "}"
                  {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                  StringBuilder sb_szTempString_0;
                  if ( szTempString_0 == null )
                     sb_szTempString_0 = new StringBuilder( 32 );
                  else
                     sb_szTempString_0 = new StringBuilder( szTempString_0 );
                                     GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_3, 'S', 255, mSubLC2, "S_InsertTextKeywordUsage", "Name", "", 0 );
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
                  //:szUsageText = "<b>" + mSubLC2.S_InsertTextUsage.Text + "</b>"
                  {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
                  StringBuilder sb_szTempString_1;
                  if ( szTempString_1 == null )
                     sb_szTempString_1 = new StringBuilder( 32 );
                  else
                     sb_szTempString_1 = new StringBuilder( szTempString_1 );
                                     GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_4, 'S', 4097, mSubLC2, "S_InsertTextUsage", "Text", "", 0 );
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
                  RESULT = SetCursorNextEntity( mSubLC2, "S_InsertTextKeywordUsage", "" );
               } 

               //:END
               //:DropView( mSubLC2 )
               DropView( mSubLC2 );
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
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
//:dDisplayKeywordTitle( VIEW mSubLC BASED ON LOD mSubLC,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szGeneratedString
public int 
omSubLC_dDisplayKeywordTitle( View     mSubLC,
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
         //:// values in the S_InsertTextMarketing subentities.
         //:szGeneratedString = mSubLC.S_MarketingStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                   GetVariableFromAttribute( sb_szGeneratedString, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_MarketingStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szGeneratedString = sb_szGeneratedString.toString( );}
         //:GenerateKeywordTextIntoString( mSubLC,
         //:                            szGeneratedString,
         //:                            "S_InsertTextKeywordMarketing",
         //:                            "S_InsertTextMarketing",
         //:                            ", " )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
          {StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                   m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szGeneratedString, "S_InsertTextKeywordMarketing", "S_InsertTextMarketing", ", " );
         szGeneratedString = sb_szGeneratedString.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
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
//:dDisplayKeywordText( VIEW mSubLC BASED ON LOD mSubLC,
//:                     STRING ( 32 ) InternalEntityStructure,
//:                     STRING ( 32 ) InternalAttribStructure,
//:                     SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szGeneratedString
public int 
omSubLC_dDisplayKeywordText( View     mSubLC,
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
         //:// values in the S_InsertTextMarketing subentities.
         //:szGeneratedString = mSubLC.S_MarketingStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                   GetVariableFromAttribute( sb_szGeneratedString, mi_lTempInteger_0, 'S', 2049, mSubLC, "S_MarketingStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szGeneratedString = sb_szGeneratedString.toString( );}
         //:GenerateKeywordTextIntoString( mSubLC,
         //:                            szGeneratedString,
         //:                            "S_InsertTextKeywordMarketing",
         //:                            "S_InsertTextMarketing",
         //:                            ", " )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
          {StringBuilder sb_szGeneratedString;
         if ( szGeneratedString == null )
            sb_szGeneratedString = new StringBuilder( 32 );
         else
            sb_szGeneratedString = new StringBuilder( szGeneratedString );
                   m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSubLC, sb_szGeneratedString, "S_InsertTextKeywordMarketing", "S_InsertTextMarketing", ", " );
         szGeneratedString = sb_szGeneratedString.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
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
//:dMarketingKeywordText( VIEW mSubLC BASED ON LOD mSubLC,
//:                       STRING ( 32 ) InternalEntityStructure,
//:                       STRING ( 32 ) InternalAttribStructure,
//:                       SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szKeyValue
public int 
omSubLC_dMarketingKeywordText( View     mSubLC,
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
         //:FOR EACH mSubLC.S_InsertTextMarketing
         RESULT = SetCursorFirstEntity( mSubLC, "S_InsertTextMarketing", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF szKeyValue = ""
            if ( ZeidonStringCompare( szKeyValue, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szKeyValue = "<b>" + mSubLC.S_InsertTextMarketing.Text
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_0, 'S', 4097, mSubLC, "S_InsertTextMarketing", "Text", "", 0 );
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
               //:szKeyValue = szKeyValue + ", " + mSubLC.S_InsertTextMarketing.Text
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
                               GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_1, 'S', 4097, mSubLC, "S_InsertTextMarketing", "Text", "", 0 );
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

            RESULT = SetCursorNextEntity( mSubLC, "S_InsertTextMarketing", "" );
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
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szKeyValue )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szKeyValue );
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
omSubLC_CopyDirsForUseSection( View     NewSLC,
                               View     SrcMLC )
{
   int      RESULT = 0;

   //:CopyDirsForUseSection( VIEW NewSLC BASED ON LOD mSubLC,
   //:                    VIEW SrcMLC BASED ON LOD mMasLC )

   //:// Copy a Directions For Use Section from the MLC to the SLC
   //:// No Driving Usage entry exists, so always copy the section.
   //:CREATE ENTITY NewSLC.S_DirectionsForUseSection
   RESULT = CreateEntity( NewSLC, "S_DirectionsForUseSection", zPOS_AFTER );
   //:SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseSection",
   //:                             SrcMLC, "M_DirectionsForUseSection", zSET_NULL )
   SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseSection", SrcMLC, "M_DirectionsForUseSection", zSET_NULL );
   //:NewSLC.S_DirectionsForUseSection.PrimaryMLC_ID = SrcMLC.M_DirectionsForUseSection.ID
   SetAttributeFromAttribute( NewSLC, "S_DirectionsForUseSection", "PrimaryMLC_ID", SrcMLC, "M_DirectionsForUseSection", "ID" );
   //:FOR EACH SrcMLC.M_InsertTextKeywordSectionDU
   RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextKeywordSectionDU", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_InsertTextKeywordSectionDU
      RESULT = CreateEntity( NewSLC, "S_InsertTextKeywordSectionDU", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_InsertTextKeywordSectionDU", SrcMLC, "M_InsertTextKeywordSectionDU", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_InsertTextKeywordSectionDU", SrcMLC, "M_InsertTextKeywordSectionDU", zSET_NULL );
      //:FOR EACH SrcMLC.M_InsertTextSectionDU
      RESULT = SetCursorFirstEntity( SrcMLC, "M_InsertTextSectionDU", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_InsertTextSectionDU
         RESULT = CreateEntity( NewSLC, "S_InsertTextSectionDU", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_InsertTextSectionDU", SrcMLC, "M_InsertTextSectionDU", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_InsertTextSectionDU", SrcMLC, "M_InsertTextSectionDU", zSET_NULL );
         RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextSectionDU", "" );
      } 

      RESULT = SetCursorNextEntity( SrcMLC, "M_InsertTextKeywordSectionDU", "" );
      //:END
   } 

   //:END
   //:CopyDirsForUseStatements( NewSLC, SrcMLC )
   omSubLC_CopyDirsForUseStatements( NewSLC, SrcMLC );
   return( 0 );
// END
} 


//:OBJECT CONSTRAINT OPERATION
public int 
omSubLC_ObjectConstraints( View     mSubLC,
                           Integer   Event,
                           Integer   State )
{
   int      RESULT = 0;

   //:ObjectConstraints( VIEW mSubLC BASED ON LOD mSubLC,
   //:                SHORT Event,
   //:                SHORT State )

   //:CASE Event
   switch( Event )
   { 
      //:OF   zOCE_ACTIVATE:
      case zOCE_ACTIVATE :

         //:// Build the PrimaryMLC_ID  values from MLC subentities, if the ID values are null.
         //:FOR EACH mSubLC.S_GeneralSection
         RESULT = SetCursorFirstEntity( mSubLC, "S_GeneralSection", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF mSubLC.S_GeneralSection.PrimaryMLC_ID = ""
            if ( CompareAttributeToString( mSubLC, "S_GeneralSection", "PrimaryMLC_ID", "" ) == 0 )
            { 
               //:mSubLC.S_GeneralSection.PrimaryMLC_ID = mSubLC.M_GeneralSection.ID
               SetAttributeFromAttribute( mSubLC, "S_GeneralSection", "PrimaryMLC_ID", mSubLC, "M_GeneralSection", "ID" );
            } 

            //:END
            //:FOR EACH mSubLC.S_GeneralStatement
            RESULT = SetCursorFirstEntity( mSubLC, "S_GeneralStatement", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:IF mSubLC.S_GeneralStatement.PrimaryMLC_ID = ""
               if ( CompareAttributeToString( mSubLC, "S_GeneralStatement", "PrimaryMLC_ID", "" ) == 0 )
               { 
                  //:mSubLC.S_GeneralStatement.PrimaryMLC_ID = mSubLC.M_GeneralStatement.ID
                  SetAttributeFromAttribute( mSubLC, "S_GeneralStatement", "PrimaryMLC_ID", mSubLC, "M_GeneralStatement", "ID" );
               } 

               RESULT = SetCursorNextEntity( mSubLC, "S_GeneralStatement", "" );
               //:END
            } 

            RESULT = SetCursorNextEntity( mSubLC, "S_GeneralSection", "" );
            //:END
         } 

         //:END
         //:FOR EACH mSubLC.S_IngredientsSection
         RESULT = SetCursorFirstEntity( mSubLC, "S_IngredientsSection", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF mSubLC.S_IngredientsSection.PrimaryMLC_ID = ""
            if ( CompareAttributeToString( mSubLC, "S_IngredientsSection", "PrimaryMLC_ID", "" ) == 0 )
            { 
               //:mSubLC.S_IngredientsSection.PrimaryMLC_ID = mSubLC.M_IngredientsSection.ID
               SetAttributeFromAttribute( mSubLC, "S_IngredientsSection", "PrimaryMLC_ID", mSubLC, "M_IngredientsSection", "ID" );
            } 

            //:END
            //:FOR EACH mSubLC.S_IngredientsStatement
            RESULT = SetCursorFirstEntity( mSubLC, "S_IngredientsStatement", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:IF mSubLC.S_IngredientsStatement.PrimaryMLC_ID = ""
               if ( CompareAttributeToString( mSubLC, "S_IngredientsStatement", "PrimaryMLC_ID", "" ) == 0 )
               { 
                  //:mSubLC.S_IngredientsStatement.PrimaryMLC_ID = mSubLC.M_IngredientsStatement.ID
                  SetAttributeFromAttribute( mSubLC, "S_IngredientsStatement", "PrimaryMLC_ID", mSubLC, "M_IngredientsStatement", "ID" );
               } 

               RESULT = SetCursorNextEntity( mSubLC, "S_IngredientsStatement", "" );
               //:END
            } 

            RESULT = SetCursorNextEntity( mSubLC, "S_IngredientsSection", "" );
            //:END
         } 

         //:END
         //:FOR EACH mSubLC.S_StorageDisposalSection
         RESULT = SetCursorFirstEntity( mSubLC, "S_StorageDisposalSection", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF mSubLC.S_StorageDisposalSection.PrimaryMLC_ID = ""
            if ( CompareAttributeToString( mSubLC, "S_StorageDisposalSection", "PrimaryMLC_ID", "" ) == 0 )
            { 
               //:mSubLC.S_StorageDisposalSection.PrimaryMLC_ID = mSubLC.M_StorageDisposalSection.ID
               SetAttributeFromAttribute( mSubLC, "S_StorageDisposalSection", "PrimaryMLC_ID", mSubLC, "M_StorageDisposalSection", "ID" );
            } 

            //:END
            //:FOR EACH mSubLC.S_StorageDisposalStatement
            RESULT = SetCursorFirstEntity( mSubLC, "S_StorageDisposalStatement", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:IF mSubLC.S_StorageDisposalStatement.PrimaryMLC_ID = ""
               if ( CompareAttributeToString( mSubLC, "S_StorageDisposalStatement", "PrimaryMLC_ID", "" ) == 0 )
               { 
                  //:mSubLC.S_StorageDisposalStatement.PrimaryMLC_ID = mSubLC.M_StorageDisposalStatement.ID
                  SetAttributeFromAttribute( mSubLC, "S_StorageDisposalStatement", "PrimaryMLC_ID", mSubLC, "M_StorageDisposalStatement", "ID" );
               } 

               RESULT = SetCursorNextEntity( mSubLC, "S_StorageDisposalStatement", "" );
               //:END
            } 

            RESULT = SetCursorNextEntity( mSubLC, "S_StorageDisposalSection", "" );
            //:END
         } 

         //:END
         //:FOR EACH mSubLC.S_DirectionsForUseSection
         RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseSection", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF mSubLC.S_DirectionsForUseSection.PrimaryMLC_ID = ""
            if ( CompareAttributeToString( mSubLC, "S_DirectionsForUseSection", "PrimaryMLC_ID", "" ) == 0 )
            { 
               //:mSubLC.S_DirectionsForUseSection.PrimaryMLC_ID = mSubLC.M_DirectionsForUseSection.ID
               SetAttributeFromAttribute( mSubLC, "S_DirectionsForUseSection", "PrimaryMLC_ID", mSubLC, "M_DirectionsForUseSection", "ID" );
            } 

            //:END
            //:FOR EACH mSubLC.S_DirectionsForUseStatement
            RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseStatement", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:IF mSubLC.S_DirectionsForUseStatement.PrimaryMLC_ID = ""
               if ( CompareAttributeToString( mSubLC, "S_DirectionsForUseStatement", "PrimaryMLC_ID", "" ) == 0 )
               { 
                  //:mSubLC.S_DirectionsForUseStatement.PrimaryMLC_ID = mSubLC.M_DirectionsForUseStatement.ID
                  SetAttributeFromAttribute( mSubLC, "S_DirectionsForUseStatement", "PrimaryMLC_ID", mSubLC, "M_DirectionsForUseStatement", "ID" );
               } 

               RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseStatement", "" );
               //:END
            } 

            RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseSection", "" );
            //:END
         } 

         //:END
         //:FOR EACH mSubLC.S_MarketingSection
         RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingSection", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF mSubLC.S_MarketingSection.PrimaryMLC_ID = ""
            if ( CompareAttributeToString( mSubLC, "S_MarketingSection", "PrimaryMLC_ID", "" ) == 0 )
            { 
               //:mSubLC.S_MarketingSection.PrimaryMLC_ID = mSubLC.M_MarketingSection.ID
               SetAttributeFromAttribute( mSubLC, "S_MarketingSection", "PrimaryMLC_ID", mSubLC, "M_MarketingSection", "ID" );
            } 

            //:END
            //:FOR EACH mSubLC.S_MarketingStatement
            RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingStatement", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:IF mSubLC.S_MarketingStatement.PrimaryMLC_ID = ""
               if ( CompareAttributeToString( mSubLC, "S_MarketingStatement", "PrimaryMLC_ID", "" ) == 0 )
               { 
                  //:mSubLC.S_MarketingStatement.PrimaryMLC_ID = mSubLC.M_MarketingStatement.ID
                  SetAttributeFromAttribute( mSubLC, "S_MarketingStatement", "PrimaryMLC_ID", mSubLC, "M_MarketingStatement", "ID" );
               } 

               RESULT = SetCursorNextEntity( mSubLC, "S_MarketingStatement", "" );
               //:END
            } 

            RESULT = SetCursorNextEntity( mSubLC, "S_MarketingSection", "" );
            //:END
         } 

         //:END
         //:FOR EACH mSubLC.S_HumanHazardSection
         RESULT = SetCursorFirstEntity( mSubLC, "S_HumanHazardSection", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF mSubLC.S_HumanHazardSection.PrimaryMLC_ID = ""
            if ( CompareAttributeToString( mSubLC, "S_HumanHazardSection", "PrimaryMLC_ID", "" ) == 0 )
            { 
               //:mSubLC.S_HumanHazardSection.PrimaryMLC_ID = mSubLC.M_HumanHazardSection.ID
               SetAttributeFromAttribute( mSubLC, "S_HumanHazardSection", "PrimaryMLC_ID", mSubLC, "M_HumanHazardSection", "ID" );
            } 

            RESULT = SetCursorNextEntity( mSubLC, "S_HumanHazardSection", "" );
            //:END
         } 

         //:END
         //:FOR EACH mSubLC.S_DilutionGroup
         RESULT = SetCursorFirstEntity( mSubLC, "S_DilutionGroup", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF mSubLC.S_DilutionGroup.PrimaryMLC_ID = ""
            if ( CompareAttributeToString( mSubLC, "S_DilutionGroup", "PrimaryMLC_ID", "" ) == 0 )
            { 
               //:mSubLC.S_DilutionGroup.PrimaryMLC_ID = mSubLC.M_DilutionGroup.ID
               SetAttributeFromAttribute( mSubLC, "S_DilutionGroup", "PrimaryMLC_ID", mSubLC, "M_DilutionGroup", "ID" );
            } 

            RESULT = SetCursorNextEntity( mSubLC, "S_DilutionGroup", "" );
            //:END
         } 

         //:END
         //:FOR EACH mSubLC.S_UsageType
         RESULT = SetCursorFirstEntity( mSubLC, "S_UsageType", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:FOR EACH mSubLC.S_Usage
            RESULT = SetCursorFirstEntity( mSubLC, "S_Usage", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:IF mSubLC.S_Usage.PrimaryMLC_ID = ""
               if ( CompareAttributeToString( mSubLC, "S_Usage", "PrimaryMLC_ID", "" ) == 0 )
               { 
                  //:mSubLC.S_Usage.PrimaryMLC_ID = mSubLC.M_Usage.ID
                  SetAttributeFromAttribute( mSubLC, "S_Usage", "PrimaryMLC_ID", mSubLC, "M_Usage", "ID" );
               } 

               RESULT = SetCursorNextEntity( mSubLC, "S_Usage", "" );
               //:END
            } 

            RESULT = SetCursorNextEntity( mSubLC, "S_UsageType", "" );
            //:END
         } 

         //:END
         break ;

      //:  // end zOCE_ACTIVATE
      //:OF   zOCE_ACTIVATE_EMPTY:
      case zOCE_ACTIVATE_EMPTY :
         break ;

      //:  // end zOCE_ACTIVATE_EMPTY
      //:OF   zOCE_COMMIT:
      case zOCE_COMMIT :
         break ;

      //:  // end zOCE_COMMIT
      //:OF   zOCE_DROPOI:
      case zOCE_DROPOI :
         break ;
   } 


   //:     // end zOCE_DROPOI
   //:END  // case
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dSymbolText( VIEW mSubLC BASED ON LOD mSubLC,
//:             STRING ( 32 ) InternalEntityStructure,
//:             STRING ( 32 ) InternalAttribStructure,
//:             SHORT GetOrSetFlag )

//:   STRING ( 32 )  szEntityName
public int 
omSubLC_dSymbolText( View     mSubLC,
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
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSubLC );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( Symbol, mSubLC, szEntityName, "Symbol" )
         {StringBuilder sb_Symbol;
         if ( Symbol == null )
            sb_Symbol = new StringBuilder( 32 );
         else
            sb_Symbol = new StringBuilder( Symbol );
                   GetStringFromAttribute( sb_Symbol, mSubLC, szEntityName, "Symbol" );
         Symbol = sb_Symbol.toString( );}
         //:GetStringFromAttribute( Footnote, mSubLC, szEntityName, "Text" )
         {StringBuilder sb_Footnote;
         if ( Footnote == null )
            sb_Footnote = new StringBuilder( 32 );
         else
            sb_Footnote = new StringBuilder( Footnote );
                   GetStringFromAttribute( sb_Footnote, mSubLC, szEntityName, "Text" );
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

         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, Text )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, Text );
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
   //:dCombinedContainerVol( VIEW mSubLC BASED ON LOD mSubLC,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 256 ) szCombinedName
public int 
omSubLC_dCombinedContainerVol( View     mSubLC,
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
         //:/*    FOR EACH mSubLC.M_StorageDisposalDrivingConVol
         //:???         GetStringFromAttributeByContext( szContainerVolume, mSubLC, "M_StorageDisposalDrivingConVol", "ContainerVolume", "", 20 )
         //:IF szCombinedName = ""
         //:   szCombinedName = szContainerVolume
         //:ELSE
         //:   szCombinedName = szCombinedName + ", " + szContainerVolume
         //:END
         //:END
         //:*/

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szCombinedName );
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
