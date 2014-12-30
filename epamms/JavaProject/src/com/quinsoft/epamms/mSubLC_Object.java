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
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_2, 'S', 129, mSubLC, "PrimaryRegistrant", "EPA_CompanyNumber", "", 0 );
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
         //:/* end zDERIVED_GET */
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  /* end zDERIVED_SET */
      //:END  /* case */
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

         //:/* end zDERIVED_GET */
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  /* end zDERIVED_SET */
      //:END  /* case */
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

      //:  /* end zDERIVED_GET */
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     /* end zDERIVED_SET */
   //:END  /* case */
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
      //:  /* end zDERIVED_GET */
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     /* end zDERIVED_SET */
   //:END  /* case */
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
                         GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 129, mSubLC, "PrimaryRegistrant", "EPA_CompanyNumber", "", 0 );
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
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_2, 'S', 129, mSubLC, "MasterProduct", "Number", "", 0 );
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

         //:/* end zDERIVED_GET */
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  /* end zDERIVED_SET */
      //:END  /* case */
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
                         GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 129, mSubLC, "SubregProduct", "Number", "", 0 );
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
         //:/* end zDERIVED_GET */
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  /* end zDERIVED_SET */
      //:END  /* case */
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dDisplayUsageName( VIEW mSubLC BASED ON LOD mSubLC,
   //:                STRING ( 32 ) InternalEntityStructure,
   //:                STRING ( 32 ) InternalAttribStructure,
   //:                SHORT GetOrSetFlag )

   //:VIEW mSubLC2 BASED ON LOD mSubLC
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
         //:IF mSubLC.M_UsageFootnoteUsed EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "M_UsageFootnoteUsed" );
         if ( lTempInteger_0 == 0 )
         { 
            //:IF mSubLC.M_UsageFootnoteUsed.ID != ""
            if ( CompareAttributeToString( mSubLC, "M_UsageFootnoteUsed", "ID", "" ) != 0 )
            { 
               //:SET CURSOR FIRST mSubLC.MLC_UsageFootnote WHERE mSubLC.MLC_UsageFootnote.ID = mSubLC.M_UsageFootnoteUsed.ID 
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, mSubLC, "M_UsageFootnoteUsed", "ID" );
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
               //:szCombinedName = szCombinedName + "<sub> (" + szFootnoteNumber + ")</sub>"
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, "<sub> (", 1, 0, 101 );
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
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, ")</sub>", 1, 0, 101 );
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

      //:  /* end zDERIVED_GET */
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     /* end zDERIVED_SET */
   //:END  /* case */
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:BuildNewSLC_Version( VIEW NewSLC      BASED ON LOD mSubLC,
//:                     VIEW PreviousSLC BASED ON LOD mSubLC,
//:                     VIEW SourceMLC   BASED ON LOD mMasLC,
//:                     VIEW PreviousMLC BASED ON LOD lMLCASrc )

//:// STRING ( 10 ) szVersion
//:   STRING ( 1 )  szEntityFoundFlag
public int 
omSubLC_BuildNewSLC_Version( View     NewSLC,
                             View     PreviousSLC,
                             View     SourceMLC,
                             View     PreviousMLC )
{
   String   szEntityFoundFlag = null;
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


   //:// Create a new SLC from a previous SLC, tying the new back to the original.

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
   //:// szVersion = NewSLC.SubregLabelContent.RevisionDate
   //:// NewSLC.SubregLabelContent.Version = szVersion  already done in calling routine
   //:INCLUDE NewSLC.SubregProduct FROM PreviousSLC.SubregProduct
   RESULT = IncludeSubobjectFromSubobject( NewSLC, "SubregProduct", PreviousSLC, "SubregProduct", zPOS_AFTER );
   //:INCLUDE NewSLC.SP_SubregLabelContent FROM PreviousSLC.SubregLabelContent
   RESULT = IncludeSubobjectFromSubobject( NewSLC, "SP_SubregLabelContent", PreviousSLC, "SubregLabelContent", zPOS_AFTER );
   //:INCLUDE NewSLC.MasterLabelContent FROM SourceMLC.MasterLabelContent
   RESULT = IncludeSubobjectFromSubobject( NewSLC, "MasterLabelContent", SourceMLC, "MasterLabelContent", zPOS_AFTER );

   //:// S_Usage
   //:// Usages come from the MLC.
   //:FOR EACH SourceMLC.M_Usage
   RESULT = SetCursorFirstEntity( SourceMLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_Usage
      RESULT = CreateEntity( NewSLC, "S_Usage", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_Usage", SourceMLC, "M_Usage", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_Usage", SourceMLC, "M_Usage", zSET_NULL );
      //:INCLUDE NewSLC.M_Usage FROM SourceMLC.M_Usage
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_Usage", SourceMLC, "M_Usage", zPOS_AFTER );
      RESULT = SetCursorNextEntity( SourceMLC, "M_Usage", "" );
   } 

   //:END

   //:// S_GeneralSection
   //:// General Sections must come entirely from the source MLC.
   //:FOR EACH SourceMLC.M_GeneralSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_GeneralSection
      RESULT = CreateEntity( NewSLC, "S_GeneralSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_GeneralSection", SourceMLC, "M_GeneralSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_GeneralSection", SourceMLC, "M_GeneralSection", zSET_NULL );
      //:INCLUDE NewSLC.M_GeneralSection FROM SourceMLC.M_GeneralSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_GeneralSection", SourceMLC, "M_GeneralSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_GeneralStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_GeneralStatement
         RESULT = CreateEntity( NewSLC, "S_GeneralStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_GeneralStatement", SourceMLC, "M_GeneralStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_GeneralStatement", SourceMLC, "M_GeneralStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_GeneralStatement FROM SourceMLC.M_GeneralStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_GeneralStatement", SourceMLC, "M_GeneralStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceMLC, "M_GeneralStatement", "" );
      } 

      RESULT = SetCursorNextEntity( SourceMLC, "M_GeneralSection", "" );
      //:END
   } 

   //:END

   //:// S_IngredientsSection
   //:// The Ingredients Sections must come entirely from the source MLC.
   //:FOR EACH SourceMLC.M_IngredientsSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_IngredientsSection
      RESULT = CreateEntity( NewSLC, "S_IngredientsSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_IngredientsSection", SourceMLC, "M_IngredientsSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_IngredientsSection", SourceMLC, "M_IngredientsSection", zSET_NULL );
      //:INCLUDE NewSLC.M_IngredientsSection FROM SourceMLC.M_IngredientsSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_IngredientsSection", SourceMLC, "M_IngredientsSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_IngredientsStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_IngredientsStatement
         RESULT = CreateEntity( NewSLC, "S_IngredientsStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_IngredientsStatement", SourceMLC, "M_IngredientsStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_IngredientsStatement", SourceMLC, "M_IngredientsStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_IngredientsStatement FROM SourceMLC.M_IngredientsStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_IngredientsStatement", SourceMLC, "M_IngredientsStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceMLC, "M_IngredientsStatement", "" );
      } 

      RESULT = SetCursorNextEntity( SourceMLC, "M_IngredientsSection", "" );
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
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
             GetIntegerFromAttribute( mi_lTempInteger_0, PreviousSLC, "M_StorageDisposalSection", "ID" );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( PreviousMLC, "M_StorageDisposalSection", "ID", lTempInteger_0, "" );
      //:IF PreviousMLC.MN_StorageDisposalSection EXISTS
      lTempInteger_1 = CheckExistenceOfEntity( PreviousMLC, "MN_StorageDisposalSection" );
      if ( lTempInteger_1 == 0 )
      { 
         //:SET CURSOR FIRST SourceMLC.M_StorageDisposalSection WHERE SourceMLC.M_StorageDisposalSection.ID = PreviousMLC.MN_StorageDisposalSection.ID
         {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                   GetIntegerFromAttribute( mi_lTempInteger_2, PreviousMLC, "MN_StorageDisposalSection", "ID" );
         lTempInteger_2 = mi_lTempInteger_2.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( SourceMLC, "M_StorageDisposalSection", "ID", lTempInteger_2, "" );
         //:// Now just copy the entries from the MLC StorageDisposal Section.
         //:CREATE ENTITY NewSLC.S_StorageDisposalSection
         RESULT = CreateEntity( NewSLC, "S_StorageDisposalSection", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_StorageDisposalSection", SourceMLC, "M_StorageDisposalSection", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_StorageDisposalSection", SourceMLC, "M_StorageDisposalSection", zSET_NULL );
         //:INCLUDE NewSLC.M_StorageDisposalSection FROM SourceMLC.M_StorageDisposalSection
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_StorageDisposalSection", SourceMLC, "M_StorageDisposalSection", zPOS_AFTER );
         //:FOR EACH SourceMLC.M_StorageDisposalStatement
         RESULT = SetCursorFirstEntity( SourceMLC, "M_StorageDisposalStatement", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY NewSLC.S_StorageDisposalStatement
            RESULT = CreateEntity( NewSLC, "S_StorageDisposalStatement", zPOS_AFTER );
            //:SetMatchingAttributesByName( NewSLC, "S_StorageDisposalStatement", SourceMLC, "M_StorageDisposalStatement", zSET_NULL )
            SetMatchingAttributesByName( NewSLC, "S_StorageDisposalStatement", SourceMLC, "M_StorageDisposalStatement", zSET_NULL );
            //:INCLUDE NewSLC.M_StorageDisposalStatement FROM SourceMLC.M_StorageDisposalStatement
            RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_StorageDisposalStatement", SourceMLC, "M_StorageDisposalStatement", zPOS_AFTER );
            RESULT = SetCursorNextEntity( SourceMLC, "M_StorageDisposalStatement", "" );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( PreviousSLC, "S_StorageDisposalSection", "" );
      //:END
   } 

   //:END

   //:// S_DirectionsForUseSection
   //:// DirectionsForUse Sections must come from the source MLC, except for the Usages, which come from the previous SLC.
   //:FOR EACH SourceMLC.M_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_DirectionsForUseSection
      RESULT = CreateEntity( NewSLC, "S_DirectionsForUseSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseSection", SourceMLC, "M_DirectionsForUseSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseSection", SourceMLC, "M_DirectionsForUseSection", zSET_NULL );
      //:INCLUDE NewSLC.M_DirectionsForUseSection FROM SourceMLC.M_DirectionsForUseSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_DirectionsForUseSection", SourceMLC, "M_DirectionsForUseSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_DirectionsForUseStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_DirectionsForUseStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_DirectionsForUseStatement
         RESULT = CreateEntity( NewSLC, "S_DirectionsForUseStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseStatement", SourceMLC, "M_DirectionsForUseStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseStatement", SourceMLC, "M_DirectionsForUseStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_DirectionsForUseStatement FROM SourceMLC.M_DirectionsForUseStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_DirectionsForUseStatement", SourceMLC, "M_DirectionsForUseStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceMLC, "M_DirectionsForUseStatement", "" );
      } 

      //:END

      //:// Proceed back to PreviousMLC and then to previous SLC to get DirectionsUsages.
      //:// If a DirectionsForUse section is not in either the previous MLC or the SLC, we'll use the intersection of Usages from the
      //:// source MLC DirectionsForUse and the SLC.
      //:szEntityFoundFlag = ""
       {StringBuilder sb_szEntityFoundFlag;
      if ( szEntityFoundFlag == null )
         sb_szEntityFoundFlag = new StringBuilder( 32 );
      else
         sb_szEntityFoundFlag = new StringBuilder( szEntityFoundFlag );
            ZeidonStringCopy( sb_szEntityFoundFlag, 1, 0, "", 1, 0, 2 );
      szEntityFoundFlag = sb_szEntityFoundFlag.toString( );}
      //:IF SourceMLC.MP_DirectionsForUseSection EXISTS
      lTempInteger_3 = CheckExistenceOfEntity( SourceMLC, "MP_DirectionsForUseSection" );
      if ( lTempInteger_3 == 0 )
      { 
         //:SET CURSOR FIRST PreviousSLC.M_DirectionsForUseStatement WITHIN PreviousSLC.SubregLabelContent
         //:           WHERE PreviousSLC.M_DirectionsForUseSection.ID = SourceMLC.MP_DirectionsForUseSection.ID
         RESULT = SetCursorFirstEntity( PreviousSLC, "M_DirectionsForUseStatement", "SubregLabelContent" );
         if ( RESULT > zCURSOR_UNCHANGED )
         { 
            while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( PreviousSLC, "M_DirectionsForUseSection", "ID", SourceMLC, "MP_DirectionsForUseSection", "ID" ) != 0 ) )
            { 
               RESULT = SetCursorNextEntity( PreviousSLC, "M_DirectionsForUseStatement", "SubregLabelContent" );
            } 

         } 

         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:szEntityFoundFlag = "Y"
             {StringBuilder sb_szEntityFoundFlag;
            if ( szEntityFoundFlag == null )
               sb_szEntityFoundFlag = new StringBuilder( 32 );
            else
               sb_szEntityFoundFlag = new StringBuilder( szEntityFoundFlag );
                        ZeidonStringCopy( sb_szEntityFoundFlag, 1, 0, "Y", 1, 0, 2 );
            szEntityFoundFlag = sb_szEntityFoundFlag.toString( );}
         } 

         //:END
      } 

      //:END
      //:IF szEntityFoundFlag = "Y"
      if ( ZeidonStringCompare( szEntityFoundFlag, 1, 0, "Y", 1, 0, 2 ) == 0 )
      { 
         //:// The previous DirectionsForUse section exists, so get the Usages from the corresponding SLC DirectionsForUse entry that are
         //:// also in the NewSLC and thereby also in the Source MLC. .
         //:// The OriginalDirectionsUsage entries, however, will just come directly from the MLC.
         //:FOR EACH PreviousSLC.S_DirectionsUsage WITHIN PreviousSLC.S_DirectionsForUseSection
         RESULT = SetCursorFirstEntity( PreviousSLC, "S_DirectionsUsage", "S_DirectionsForUseSection" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST NewSLC.S_Usage WHERE NewSLC.S_Usage.UsageType = PreviousSLC.S_DirectionsUsage.UsageType
            //:                                  AND NewSLC.S_Usage.Name = PreviousSLC.S_DirectionsUsage.Name
            RESULT = SetCursorFirstEntity( NewSLC, "S_Usage", "" );
            if ( RESULT > zCURSOR_UNCHANGED )
            { 
               while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( NewSLC, "S_Usage", "UsageType", PreviousSLC, "S_DirectionsUsage", "UsageType" ) != 0 ||
                       CompareAttributeToAttribute( NewSLC, "S_Usage", "Name", PreviousSLC, "S_DirectionsUsage", "Name" ) != 0 ) )
               { 
                  RESULT = SetCursorNextEntity( NewSLC, "S_Usage", "" );
               } 

            } 

            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:CREATE ENTITY NewSLC.S_DirectionsUsageOrdering
               RESULT = CreateEntity( NewSLC, "S_DirectionsUsageOrdering", zPOS_AFTER );
               //:INCLUDE NewSLC.S_DirectionsUsage FROM NewSLC.S_Usage
               RESULT = IncludeSubobjectFromSubobject( NewSLC, "S_DirectionsUsage", NewSLC, "S_Usage", zPOS_AFTER );
            } 

            RESULT = SetCursorNextEntity( PreviousSLC, "S_DirectionsUsage", "S_DirectionsForUseSection" );
            //:END
         } 

         //:END
         //:/*FOR EACH SourceMLC.M_DirectionsUsage WITHIN SourceMLC.M_DirectionsForUseSection
         //:   SET CURSOR FIRST NewSLC.S_Usage WHERE NewSLC.S_Usage.UsageType = SourceMLC.M_DirectionsUsage.UsageType
         //:                                     AND NewSLC.S_Usage.Name = SourceMLC.M_DirectionsUsage.Name
         //:   IF RESULT >= zCURSOR_SET
         //:      CREATE ENTITY NewSLC.S_OriginalDirectionUsageOrdering
         //:      INCLUDE NewSLC.S_OriginalDirectionsUsage FROM NewSLC.S_Usage
         //:   END
         //:END*/
         //:ELSE
      } 
      else
      { 
         //:// The previous DirectionsForUse section does not exist, so use the DirectionsUsages that are defined to the MLC for both the new
         //:// DirectionsForUse entries and the OriginalDirectionsUsage entries.
         //:FOR EACH SourceMLC.M_DirectionsUsage WITHIN SourceMLC.M_DirectionsForUseSection
         RESULT = SetCursorFirstEntity( SourceMLC, "M_DirectionsUsage", "M_DirectionsForUseSection" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST NewSLC.S_Usage WHERE NewSLC.S_Usage.UsageType = SourceMLC.M_DirectionsUsage.UsageType
            //:                                  AND NewSLC.S_Usage.Name = SourceMLC.M_DirectionsUsage.Name
            RESULT = SetCursorFirstEntity( NewSLC, "S_Usage", "" );
            if ( RESULT > zCURSOR_UNCHANGED )
            { 
               while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( NewSLC, "S_Usage", "UsageType", SourceMLC, "M_DirectionsUsage", "UsageType" ) != 0 ||
                       CompareAttributeToAttribute( NewSLC, "S_Usage", "Name", SourceMLC, "M_DirectionsUsage", "Name" ) != 0 ) )
               { 
                  RESULT = SetCursorNextEntity( NewSLC, "S_Usage", "" );
               } 

            } 

            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:CREATE ENTITY NewSLC.S_DirectionsUsageOrdering
               RESULT = CreateEntity( NewSLC, "S_DirectionsUsageOrdering", zPOS_AFTER );
               //:INCLUDE NewSLC.S_DirectionsUsage         FROM NewSLC.S_Usage
               RESULT = IncludeSubobjectFromSubobject( NewSLC, "S_DirectionsUsage", NewSLC, "S_Usage", zPOS_AFTER );
            } 

            RESULT = SetCursorNextEntity( SourceMLC, "M_DirectionsUsage", "M_DirectionsForUseSection" );
            //:   //CREATE ENTITY NewSLC.S_OriginalDirectionUsageOrdering
            //:   //INCLUDE NewSLC.S_OriginalDirectionsUsage FROM NewSLC.S_Usage
            //:END
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( SourceMLC, "M_DirectionsForUseSection", "" );
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
      {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
             GetIntegerFromAttribute( mi_lTempInteger_4, PreviousSLC, "M_MarketingSection", "ID" );
      lTempInteger_4 = mi_lTempInteger_4.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( PreviousMLC, "M_MarketingSection", "ID", lTempInteger_4, "" );
      //:IF PreviousMLC.MN_MarketingSection EXISTS
      lTempInteger_5 = CheckExistenceOfEntity( PreviousMLC, "MN_MarketingSection" );
      if ( lTempInteger_5 == 0 )
      { 
         //:SET CURSOR FIRST SourceMLC.M_MarketingSection WHERE SourceMLC.M_MarketingSection.ID = PreviousMLC.MN_MarketingSection.ID
         {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
                   GetIntegerFromAttribute( mi_lTempInteger_6, PreviousMLC, "MN_MarketingSection", "ID" );
         lTempInteger_6 = mi_lTempInteger_6.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( SourceMLC, "M_MarketingSection", "ID", lTempInteger_6, "" );
         //:CREATE ENTITY NewSLC.S_MarketingSection
         RESULT = CreateEntity( NewSLC, "S_MarketingSection", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_MarketingSection", SourceMLC, "M_MarketingSection", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_MarketingSection", SourceMLC, "M_MarketingSection", zSET_NULL );
         //:INCLUDE NewSLC.M_MarketingSection FROM SourceMLC.M_MarketingSection
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_MarketingSection", SourceMLC, "M_MarketingSection", zPOS_AFTER );
         //:INCLUDE NewSLC.SP_MarketingSection FROM PreviousSLC.S_MarketingSection
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "SP_MarketingSection", PreviousSLC, "S_MarketingSection", zPOS_AFTER );

         //:// Statements
         //:FOR EACH PreviousSLC.S_MarketingStatement
         RESULT = SetCursorFirstEntity( PreviousSLC, "S_MarketingStatement", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST PreviousMLC.M_MarketingStatement WHERE PreviousMLC.M_MarketingStatement.ID = PreviousSLC.M_MarketingStatement.ID
            {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
                         GetIntegerFromAttribute( mi_lTempInteger_7, PreviousSLC, "M_MarketingStatement", "ID" );
            lTempInteger_7 = mi_lTempInteger_7.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( PreviousMLC, "M_MarketingStatement", "ID", lTempInteger_7, "" );
            //:IF PreviousMLC.MN_MarketingStatement EXISTS
            lTempInteger_8 = CheckExistenceOfEntity( PreviousMLC, "MN_MarketingStatement" );
            if ( lTempInteger_8 == 0 )
            { 
               //:SET CURSOR FIRST SourceMLC.M_MarketingStatement WHERE SourceMLC.M_MarketingStatement.ID = PreviousMLC.MN_MarketingStatement.ID
               {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
                               GetIntegerFromAttribute( mi_lTempInteger_9, PreviousMLC, "MN_MarketingStatement", "ID" );
               lTempInteger_9 = mi_lTempInteger_9.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( SourceMLC, "M_MarketingStatement", "ID", lTempInteger_9, "" );
               //:CREATE ENTITY NewSLC.S_MarketingStatement
               RESULT = CreateEntity( NewSLC, "S_MarketingStatement", zPOS_AFTER );
               //:SetMatchingAttributesByName( NewSLC, "S_MarketingStatement", SourceMLC, "M_MarketingStatement", zSET_NULL )
               SetMatchingAttributesByName( NewSLC, "S_MarketingStatement", SourceMLC, "M_MarketingStatement", zSET_NULL );
               //:INCLUDE NewSLC.M_MarketingStatement FROM SourceMLC.M_MarketingStatement
               RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_MarketingStatement", SourceMLC, "M_MarketingStatement", zPOS_AFTER );
               //:INCLUDE NewSLC.SP_MarketingStatement FROM PreviousSLC.S_MarketingStatement
               RESULT = IncludeSubobjectFromSubobject( NewSLC, "SP_MarketingStatement", PreviousSLC, "S_MarketingStatement", zPOS_AFTER );
            } 

            RESULT = SetCursorNextEntity( PreviousSLC, "S_MarketingStatement", "" );
            //:END
         } 

         //:END

         //:// Usages
         //:// Recreate only MarketingUsages that are in the NewSLC and thereby also in the Source MLC.
         //:// The OriginalMarketingUsage entries, however, will just come directly from the MLC.
         //:FOR EACH PreviousSLC.S_MarketingUsage WITHIN PreviousSLC.S_MarketingSection
         RESULT = SetCursorFirstEntity( PreviousSLC, "S_MarketingUsage", "S_MarketingSection" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST NewSLC.S_Usage WHERE NewSLC.S_Usage.UsageType = PreviousSLC.S_MarketingUsage.UsageType
            //:                                  AND NewSLC.S_Usage.Name = PreviousSLC.S_MarketingUsage.Name
            RESULT = SetCursorFirstEntity( NewSLC, "S_Usage", "" );
            if ( RESULT > zCURSOR_UNCHANGED )
            { 
               while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( NewSLC, "S_Usage", "UsageType", PreviousSLC, "S_MarketingUsage", "UsageType" ) != 0 ||
                       CompareAttributeToAttribute( NewSLC, "S_Usage", "Name", PreviousSLC, "S_MarketingUsage", "Name" ) != 0 ) )
               { 
                  RESULT = SetCursorNextEntity( NewSLC, "S_Usage", "" );
               } 

            } 

            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:CREATE ENTITY NewSLC.S_MarketingUsageOrdering
               RESULT = CreateEntity( NewSLC, "S_MarketingUsageOrdering", zPOS_AFTER );
               //:INCLUDE NewSLC.S_MarketingUsage FROM NewSLC.S_Usage
               RESULT = IncludeSubobjectFromSubobject( NewSLC, "S_MarketingUsage", NewSLC, "S_Usage", zPOS_AFTER );
            } 

            RESULT = SetCursorNextEntity( PreviousSLC, "S_MarketingUsage", "S_MarketingSection" );
            //:END
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( PreviousSLC, "S_MarketingSection", "" );
      //:   /*FOR EACH SourceMLC.M_MarketingUsage WITHIN SourceMLC.M_MarketingSection
      //:      SET CURSOR FIRST NewSLC.S_Usage WHERE NewSLC.S_Usage.UsageType = SourceMLC.M_MarketingUsage.UsageType
      //:                                        AND NewSLC.S_Usage.Name = SourceMLC.M_MarketingUsage.Name
      //:      IF RESULT >= zCURSOR_SET
      //:         CREATE ENTITY NewSLC.S_OriginalMarketingUsageOrdering
      //:         INCLUDE NewSLC.S_OriginalMarketingUsage FROM NewSLC.S_Usage
      //:      END
      //:   END*/
      //:END
   } 

   //:END

   //:// S_HumanHazardSection
   //:// The HumanHazard Sections must come entirely from the source MLC.
   //:FOR EACH SourceMLC.M_HumanHazardSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_HumanHazardSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_HumanHazardSection
      RESULT = CreateEntity( NewSLC, "S_HumanHazardSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_HumanHazardSection", SourceMLC, "M_HumanHazardSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_HumanHazardSection", SourceMLC, "M_HumanHazardSection", zSET_NULL );
      //:INCLUDE NewSLC.M_HumanHazardSection FROM SourceMLC.M_HumanHazardSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_HumanHazardSection", SourceMLC, "M_HumanHazardSection", zPOS_AFTER );
      RESULT = SetCursorNextEntity( SourceMLC, "M_HumanHazardSection", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:BuildSLC_FromMLC( VIEW NewSLC    BASED ON LOD mSubLC,
//:                  VIEW SourceMLC BASED ON LOD mMasLC )

//:   STRING ( 32 ) szVersion
public int 
omSubLC_BuildSLC_FromMLC( View     NewSLC,
                          View     SourceMLC )
{
   String   szVersion = null;
   int      lTempInteger_0 = 0;
   int      RESULT = 0;
   int      lTempInteger_1 = 0;


   //:// IssueError( NewSLC, 0, 0, "Start of Build SLC" )

   //:// Create a new SLC from an MLC and tie it back to the MLC.

   //:// It is assumed that the root entity (SubregLabelContent) and that Subreg Product
   //:// includes have been set up prior to execution of this operation.
   //:IF NewSLC.MasterLabelContent DOES NOT EXIST
   lTempInteger_0 = CheckExistenceOfEntity( NewSLC, "MasterLabelContent" );
   if ( lTempInteger_0 != 0 )
   { 
      //:INCLUDE NewSLC.MasterLabelContent FROM SourceMLC.MasterLabelContent
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "MasterLabelContent", SourceMLC, "MasterLabelContent", zPOS_AFTER );
   } 

   //:END

   //:// Usage Entries ... Surface, Application Type, Area of Use, Organism Claim
   //:FOR EACH SourceMLC.M_Usage
   RESULT = SetCursorFirstEntity( SourceMLC, "M_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_Usage
      RESULT = CreateEntity( NewSLC, "S_Usage", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_Usage", SourceMLC, "M_Usage", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_Usage", SourceMLC, "M_Usage", zSET_NULL );
      //:INCLUDE NewSLC.M_Usage FROM SourceMLC.M_Usage
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_Usage", SourceMLC, "M_Usage", zPOS_AFTER );
      //:TraceLineI( "#### Build S_Usage: ", NewSLC.M_Usage.ID )
      {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
             GetIntegerFromAttribute( mi_lTempInteger_1, NewSLC, "M_Usage", "ID" );
      lTempInteger_1 = mi_lTempInteger_1.intValue( );}
      TraceLineI( "#### Build S_Usage: ", lTempInteger_1 );
      RESULT = SetCursorNextEntity( SourceMLC, "M_Usage", "" );
   } 

   //:END

   //:// General Section ... Precautionary, First Aid, Other Hazard
   //:FOR EACH SourceMLC.M_GeneralSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_GeneralSection
      RESULT = CreateEntity( NewSLC, "S_GeneralSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_GeneralSection", SourceMLC, "M_GeneralSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_GeneralSection", SourceMLC, "M_GeneralSection", zSET_NULL );
      //:INCLUDE NewSLC.M_GeneralSection FROM SourceMLC.M_GeneralSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_GeneralSection", SourceMLC, "M_GeneralSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_GeneralStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_GeneralStatement
         RESULT = CreateEntity( NewSLC, "S_GeneralStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_GeneralStatement", SourceMLC, "M_GeneralStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_GeneralStatement", SourceMLC, "M_GeneralStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_GeneralStatement FROM SourceMLC.M_GeneralStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_GeneralStatement", SourceMLC, "M_GeneralStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceMLC, "M_GeneralStatement", "" );
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
      //:CREATE ENTITY NewSLC.S_IngredientsSection
      RESULT = CreateEntity( NewSLC, "S_IngredientsSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_IngredientsSection", SourceMLC, "M_IngredientsSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_IngredientsSection", SourceMLC, "M_IngredientsSection", zSET_NULL );
      //:INCLUDE NewSLC.M_IngredientsSection FROM SourceMLC.M_IngredientsSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_IngredientsSection", SourceMLC, "M_IngredientsSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_IngredientsStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_IngredientsStatement
         RESULT = CreateEntity( NewSLC, "S_IngredientsStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_IngredientsStatement", SourceMLC, "M_IngredientsStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_IngredientsStatement", SourceMLC, "M_IngredientsStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_IngredientsStatement FROM SourceMLC.M_IngredientsStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_IngredientsStatement", SourceMLC, "M_IngredientsStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceMLC, "M_IngredientsStatement", "" );
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
      //:CREATE ENTITY NewSLC.S_StorageDisposalSection
      RESULT = CreateEntity( NewSLC, "S_StorageDisposalSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_StorageDisposalSection", SourceMLC, "M_StorageDisposalSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_StorageDisposalSection", SourceMLC, "M_StorageDisposalSection", zSET_NULL );
      //:INCLUDE NewSLC.M_StorageDisposalSection FROM SourceMLC.M_StorageDisposalSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_StorageDisposalSection", SourceMLC, "M_StorageDisposalSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_StorageDisposalStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_StorageDisposalStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_StorageDisposalStatement
         RESULT = CreateEntity( NewSLC, "S_StorageDisposalStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_StorageDisposalStatement", SourceMLC, "M_StorageDisposalStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_StorageDisposalStatement", SourceMLC, "M_StorageDisposalStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_StorageDisposalStatement FROM SourceMLC.M_StorageDisposalStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_StorageDisposalStatement", SourceMLC, "M_StorageDisposalStatement", zPOS_AFTER );
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
      //:CREATE ENTITY NewSLC.S_DirectionsForUseSection
      RESULT = CreateEntity( NewSLC, "S_DirectionsForUseSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseSection", SourceMLC, "M_DirectionsForUseSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseSection", SourceMLC, "M_DirectionsForUseSection", zSET_NULL );
      //:INCLUDE NewSLC.M_DirectionsForUseSection FROM SourceMLC.M_DirectionsForUseSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_DirectionsForUseSection", SourceMLC, "M_DirectionsForUseSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_DirectionsForUseStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_DirectionsForUseStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_DirectionsForUseStatement
         RESULT = CreateEntity( NewSLC, "S_DirectionsForUseStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseStatement", SourceMLC, "M_DirectionsForUseStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_DirectionsForUseStatement", SourceMLC, "M_DirectionsForUseStatement", zSET_NULL );
         //:IF NewSLC.S_DirectionsForUseStatement.NotForUseType = ""
         if ( CompareAttributeToString( NewSLC, "S_DirectionsForUseStatement", "NotForUseType", "" ) == 0 )
         { 
            //:NewSLC.S_DirectionsForUseStatement.NotForUseType = "NA"    // This attribute is currently required in the ER.         
            SetAttributeFromString( NewSLC, "S_DirectionsForUseStatement", "NotForUseType", "NA" );
         } 

         //:END
         //:INCLUDE NewSLC.M_DirectionsForUseStatement FROM SourceMLC.M_DirectionsForUseStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_DirectionsForUseStatement", SourceMLC, "M_DirectionsForUseStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceMLC, "M_DirectionsForUseStatement", "" );
      } 

      //:END

      //:FOR EACH SourceMLC.M_DirectionsUsageOrdering 
      RESULT = SetCursorFirstEntity( SourceMLC, "M_DirectionsUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST NewSLC.S_Usage WHERE NewSLC.S_Usage.UsageType            = SourceMLC.M_DirectionsUsage.UsageType
         //:                                  AND NewSLC.S_Usage.ClaimsClassification = SourceMLC.M_DirectionsUsage.ClaimsClassification 
         //:                                  AND NewSLC.S_Usage.Name                 = SourceMLC.M_DirectionsUsage.Name
         RESULT = SetCursorFirstEntity( NewSLC, "S_Usage", "" );
         if ( RESULT > zCURSOR_UNCHANGED )
         { 
            while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( NewSLC, "S_Usage", "UsageType", SourceMLC, "M_DirectionsUsage", "UsageType" ) != 0 ||
                    CompareAttributeToAttribute( NewSLC, "S_Usage", "ClaimsClassification", SourceMLC, "M_DirectionsUsage", "ClaimsClassification" ) != 0 ||
                    CompareAttributeToAttribute( NewSLC, "S_Usage", "Name", SourceMLC, "M_DirectionsUsage", "Name" ) != 0 ) )
            { 
               RESULT = SetCursorNextEntity( NewSLC, "S_Usage", "" );
            } 

         } 

         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:CREATE ENTITY NewSLC.S_DirectionsUsageOrdering
            RESULT = CreateEntity( NewSLC, "S_DirectionsUsageOrdering", zPOS_AFTER );
            //:INCLUDE NewSLC.S_DirectionsUsage         FROM NewSLC.S_Usage
            RESULT = IncludeSubobjectFromSubobject( NewSLC, "S_DirectionsUsage", NewSLC, "S_Usage", zPOS_AFTER );
         } 

         RESULT = SetCursorNextEntity( SourceMLC, "M_DirectionsUsageOrdering", "" );
         //:   //CREATE ENTITY NewSLC.S_OriginalDirectionUsageOrdering
         //:   //INCLUDE NewSLC.S_OriginalDirectionsUsage FROM NewSLC.S_Usage
         //:END
      } 

      //:END
      //:BuildUsageWorkEnts( NewSLC, "D" )
      omSubLC_BuildUsageWorkEnts( NewSLC, "D" );
      RESULT = SetCursorNextEntity( SourceMLC, "M_DirectionsForUseSection", "" );
   } 

   //:END

   //:// Marketing Section
   //:FOR EACH SourceMLC.M_MarketingSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_MarketingSection
      RESULT = CreateEntity( NewSLC, "S_MarketingSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_MarketingSection", SourceMLC, "M_MarketingSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_MarketingSection", SourceMLC, "M_MarketingSection", zSET_NULL );
      //:INCLUDE NewSLC.M_MarketingSection FROM SourceMLC.M_MarketingSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_MarketingSection", SourceMLC, "M_MarketingSection", zPOS_AFTER );
      //:FOR EACH SourceMLC.M_MarketingStatement
      RESULT = SetCursorFirstEntity( SourceMLC, "M_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSLC.S_MarketingStatement
         RESULT = CreateEntity( NewSLC, "S_MarketingStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSLC, "S_MarketingStatement", SourceMLC, "M_MarketingStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSLC, "S_MarketingStatement", SourceMLC, "M_MarketingStatement", zSET_NULL );
         //:INCLUDE NewSLC.M_MarketingStatement FROM SourceMLC.M_MarketingStatement
         RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_MarketingStatement", SourceMLC, "M_MarketingStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceMLC, "M_MarketingStatement", "" );
      } 

      //:END

      //:FOR EACH SourceMLC.M_MarketingUsage WITHIN SourceMLC.M_MarketingSection
      RESULT = SetCursorFirstEntity( SourceMLC, "M_MarketingUsage", "M_MarketingSection" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST NewSLC.S_Usage WHERE NewSLC.S_Usage.UsageType            = SourceMLC.M_MarketingUsage.UsageType
         //:                                  AND NewSLC.S_Usage.ClaimsClassification = SourceMLC.M_MarketingUsage.ClaimsClassification
         //:                                  AND NewSLC.S_Usage.Name                 = SourceMLC.M_MarketingUsage.Name
         RESULT = SetCursorFirstEntity( NewSLC, "S_Usage", "" );
         if ( RESULT > zCURSOR_UNCHANGED )
         { 
            while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( NewSLC, "S_Usage", "UsageType", SourceMLC, "M_MarketingUsage", "UsageType" ) != 0 ||
                    CompareAttributeToAttribute( NewSLC, "S_Usage", "ClaimsClassification", SourceMLC, "M_MarketingUsage", "ClaimsClassification" ) != 0 ||
                    CompareAttributeToAttribute( NewSLC, "S_Usage", "Name", SourceMLC, "M_MarketingUsage", "Name" ) != 0 ) )
            { 
               RESULT = SetCursorNextEntity( NewSLC, "S_Usage", "" );
            } 

         } 

         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:CREATE ENTITY NewSLC.S_MarketingUsageOrdering
            RESULT = CreateEntity( NewSLC, "S_MarketingUsageOrdering", zPOS_AFTER );
            //:INCLUDE NewSLC.S_MarketingUsage         FROM NewSLC.S_Usage
            RESULT = IncludeSubobjectFromSubobject( NewSLC, "S_MarketingUsage", NewSLC, "S_Usage", zPOS_AFTER );
         } 

         RESULT = SetCursorNextEntity( SourceMLC, "M_MarketingUsage", "M_MarketingSection" );
         //:   //CREATE ENTITY NewSLC.S_OriginalMarketingUsageOrdering
         //:   //INCLUDE NewSLC.S_OriginalMarketingUsage FROM NewSLC.S_Usage
         //:END
      } 

      //:END
      //:BuildUsageWorkEnts( NewSLC, "M" )
      omSubLC_BuildUsageWorkEnts( NewSLC, "M" );
      RESULT = SetCursorNextEntity( SourceMLC, "M_MarketingSection", "" );
   } 

   //:END

   //:// HumanHazard Section
   //:FOR EACH SourceMLC.M_HumanHazardSection
   RESULT = SetCursorFirstEntity( SourceMLC, "M_HumanHazardSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSLC.S_HumanHazardSection
      RESULT = CreateEntity( NewSLC, "S_HumanHazardSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSLC, "S_HumanHazardSection", SourceMLC, "M_HumanHazardSection", zSET_NULL )
      SetMatchingAttributesByName( NewSLC, "S_HumanHazardSection", SourceMLC, "M_HumanHazardSection", zSET_NULL );
      //:INCLUDE NewSLC.M_HumanHazardSection FROM SourceMLC.M_HumanHazardSection
      RESULT = IncludeSubobjectFromSubobject( NewSLC, "M_HumanHazardSection", SourceMLC, "M_HumanHazardSection", zPOS_AFTER );
      RESULT = SetCursorNextEntity( SourceMLC, "M_HumanHazardSection", "" );
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
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_2, 'S', 129, mSubLC, "Subregistrant", "EPA_CompanyNumber", "", 0 );
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
         //:/* end zDERIVED_GET */
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  /* end zDERIVED_SET */
      //:END  /* case */
      return( 0 );
   } 


   //:DERIVED ATTRIBUTE OPERATION
   //:dFullHazardStatement( VIEW mSubLC BASED ON LOD mSubLC,
   //:                   STRING ( 32 ) InternalEntityStructure,
   //:                   STRING ( 32 ) InternalAttribStructure,
   //:                   SHORT GetOrSetFlag )

   //:STRING ( 256 ) szString
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


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:IF mSubLC.S_HumanHazardSection  EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "S_HumanHazardSection" );
         if ( lTempInteger_0 == 0 )
         { 

            //:szString = mSubLC.S_HumanHazardSection.PrecautionaryStatement
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_1, 'S', 257, mSubLC, "S_HumanHazardSection", "PrecautionaryStatement", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szString = sb_szString.toString( );}
            //:nPosStart  = zSearchSubString( szString, "{{Precautionary Position}}", "f", 0 )
            nPosStart = zSearchSubString( szString, "{{Precautionary Position}}", "f", 0 );
            //:IF nPosStart >= 0
            if ( nPosStart >= 0 )
            { 

               //:nPosEnd = nPosStart + 26 // length of "{{Precautionary Position}}"
               nPosEnd = nPosStart + 26;
               //:szReplaceString = ""
                {StringBuilder sb_szReplaceString;
               if ( szReplaceString == null )
                  sb_szReplaceString = new StringBuilder( 32 );
               else
                  sb_szReplaceString = new StringBuilder( szReplaceString );
                              ZeidonStringCopy( sb_szReplaceString, 1, 0, "", 1, 0, 257 );
               szReplaceString = sb_szReplaceString.toString( );}
               //:szLocation = mSubLC.S_HumanHazardSection.Location1
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_2, 'S', 257, mSubLC, "S_HumanHazardSection", "Location1", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + "[" + szLocation + "]"
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, "[", 1, 0, 257 );
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
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, "]", 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mSubLC.S_HumanHazardSection.Location2
               {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_3, 'S', 257, mSubLC, "S_HumanHazardSection", "Location2", "", 0 );
               lTempInteger_3 = mi_lTempInteger_3.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + "[" + szLocation + "]"
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, "[", 1, 0, 257 );
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
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, "]", 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mSubLC.S_HumanHazardSection.Location3
               {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_4, 'S', 257, mSubLC, "S_HumanHazardSection", "Location3", "", 0 );
               lTempInteger_4 = mi_lTempInteger_4.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + "[" + szLocation + "]"
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, "[", 1, 0, 257 );
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
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, "]", 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mSubLC.S_HumanHazardSection.Location4
               {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_5, 'S', 257, mSubLC, "S_HumanHazardSection", "Location4", "", 0 );
               lTempInteger_5 = mi_lTempInteger_5.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + "[" + szLocation + "]"
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, "[", 1, 0, 257 );
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
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, "]", 1, 0, 257 );
                  szReplaceString = sb_szReplaceString.toString( );}
               } 

               //:END

               //:szLocation = mSubLC.S_HumanHazardSection.Location5
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_6, 'S', 257, mSubLC, "S_HumanHazardSection", "Location5", "", 0 );
               lTempInteger_6 = mi_lTempInteger_6.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:IF szLocation != ""
               if ( ZeidonStringCompare( szLocation, 1, 0, "", 1, 0, 257 ) != 0 )
               { 
                  //:szReplaceString = szReplaceString + "[" + szLocation + "]"
                   {StringBuilder sb_szReplaceString;
                  if ( szReplaceString == null )
                     sb_szReplaceString = new StringBuilder( 32 );
                  else
                     sb_szReplaceString = new StringBuilder( szReplaceString );
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, "[", 1, 0, 257 );
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
                                    ZeidonStringConcat( sb_szReplaceString, 1, 0, "]", 1, 0, 257 );
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
         //:StoreStringInRecord( mSubLC,
         //:                   InternalEntityStructure,
         //:                   InternalAttribStructure, szString )
         StoreStringInRecord( mSubLC, InternalEntityStructure, InternalAttribStructure, szString );
         //:RETURN 0
         if(8==8)return( 0 );

         //:/* end zDERIVED_GET */
         //:OF   zDERIVED_SET:
         case zDERIVED_SET :
            break ;
      } 


      //:  /* end zDERIVED_SET */
      //:END  /* case */
      return( 0 );
   } 


   //:TRANSFORMATION OPERATION
   //:BuildCompositeEntries( VIEW mSubLC BASED ON LOD mSubLC )

   //://STRING ( 100 )   szCompositeLocation
   //:STRING ( 4000 )  szDisplayValue
public int 
omSubLC_BuildCompositeEntries( View     mSubLC )
{
   String   szDisplayValue = null;
   //:STRING ( 4000 )  szOriginalDisplayValue
   String   szOriginalDisplayValue = null;
   //:INTEGER          MaxDisplayLength
   int      MaxDisplayLength = 0;
   //:INTEGER          OriginalStringLength
   int      OriginalStringLength = 0;
   int      RESULT = 0;
   String   szTempString_0 = null;
   String   szTempString_1 = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:// Build the flat display of all components subobject.
   //:MaxDisplayLength = 100
   MaxDisplayLength = 100;

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

   //:// Marketing Section and Statements.
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
      //:mSubLC.CompositeComponentList.DisplayType        = "Section"
      SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "Section" );
      //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_MarketingSection.ID 
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_MarketingSection", "ID" );
      //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_MarketingSection.ID
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_MarketingSection", "ID" );
      //:IF mSubLC.S_MarketingSection.Title != ""
      if ( CompareAttributeToString( mSubLC, "S_MarketingSection", "Title", "" ) != 0 )
      { 
         //:IF mSubLC.S_MarketingSection.Name = ""
         if ( CompareAttributeToString( mSubLC, "S_MarketingSection", "Name", "" ) == 0 )
         { 
            //:mSubLC.CompositeComponentList.DisplayValue = mSubLC.S_MarketingSection.Title
            SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_MarketingSection", "Title" );
            //:ELSE
         } 
         else
         { 
            //:mSubLC.CompositeComponentList.DisplayValue = mSubLC.S_MarketingSection.Name + " - " +
            //:                                             mSubLC.S_MarketingSection.Title 
            {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetStringFromAttribute( sb_szTempString_0, mSubLC, "S_MarketingSection", "Name" );
            szTempString_0 = sb_szTempString_0.toString( );}
             {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                        ZeidonStringConcat( sb_szTempString_0, 1, 0, " - ", 1, 0, 32001 );
            szTempString_0 = sb_szTempString_0.toString( );}
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
            StringBuilder sb_szTempString_1;
            if ( szTempString_1 == null )
               sb_szTempString_1 = new StringBuilder( 32 );
            else
               sb_szTempString_1 = new StringBuilder( szTempString_1 );
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_0, 'S', 255, mSubLC, "S_MarketingSection", "Title", "", 0 );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );
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
         //:mSubLC.CompositeComponentList.DisplayValue = mSubLC.S_MarketingSection.Name 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_MarketingSection", "Name" );
      } 

      //:END
      //:mSubLC.CompositeComponentList.Value              = mSubLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "CompositeComponentList", "DisplayValue" );
      //:mSubLC.CompositeComponentList.DisplayTypeIndent  = mSubLC.CompositeComponentList.DisplayType
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayTypeIndent", mSubLC, "CompositeComponentList", "DisplayType" );

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
         //:mSubLC.CompositeComponentList.Value              = mSubLC.S_MarketingStatement.Text
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "S_MarketingStatement", "Text" );

         //:szOriginalDisplayValue = mSubLC.S_MarketingStatement.Text 
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_1, 'S', 4001, mSubLC, "S_MarketingStatement", "Text", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:GetAttributeLength( OriginalStringLength, mSubLC, "S_MarketingStatement", "Text" )
         {MutableInt mi_OriginalStringLength = new MutableInt( OriginalStringLength );
                   GetAttributeLength( mi_OriginalStringLength, mSubLC, "S_MarketingStatement", "Text" );
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
//:BuildCompositeEntriesOld( VIEW mSubLC BASED ON LOD mSubLC )

//:   STRING ( 100 )   szCompositeLocation
public int 
omSubLC_BuildCompositeEntriesOld( View     mSubLC )
{
   String   szCompositeLocation = null;
   //:STRING ( 4000 )  szDisplayValue
   String   szDisplayValue = null;
   //:STRING ( 4000 )  szOriginalDisplayValue
   String   szOriginalDisplayValue = null;
   //:STRING ( 20 )    szUsageType
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
   //:MaxDisplayLength = 100
   MaxDisplayLength = 100;

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

   //:// General Section and Statements.
   //:FOR EACH mSubLC.S_GeneralSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSubLC.CompositeComponentList 
      RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
      //:mSubLC.CompositeComponentList.Type               = "M_GeneralSection"
      SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_GeneralSection" );
      //:mSubLC.CompositeComponentList.SelectLevel        = 1
      SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 1 );
      //:mSubLC.CompositeComponentList.DisplayType        = "General"
      SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "General" );
      //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_GeneralSection.ID 
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_GeneralSection", "ID" );
      //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_GeneralSection.ID 
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_GeneralSection", "ID" );
      //:mSubLC.CompositeComponentList.DisplayValue       = mSubLC.S_GeneralSection.Title
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_GeneralSection", "Title" );
      //:mSubLC.CompositeComponentList.Value              = mSubLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "CompositeComponentList", "DisplayValue" );
      //:mSubLC.CompositeComponentList.DisplayTypeIndent  = mSubLC.CompositeComponentList.DisplayType
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayTypeIndent", mSubLC, "CompositeComponentList", "DisplayType" );

      //:FOR EACH mSubLC.S_GeneralStatement 
      RESULT = SetCursorFirstEntity( mSubLC, "S_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSubLC.CompositeComponentList 
         RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
         //:mSubLC.CompositeComponentList.Type               = "M_GeneralStatement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_GeneralStatement" );
         //:mSubLC.CompositeComponentList.SelectLevel        = 2
         SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 2 );
         //:mSubLC.CompositeComponentList.DisplayType        = "Statement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "Statement" );
         //:mSubLC.CompositeComponentList.DisplayTypeIndent  = "...Statement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_GeneralStatement.ID 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_GeneralStatement", "ID" );
         //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_GeneralStatement.ID 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_GeneralStatement", "ID" );
         //:mSubLC.CompositeComponentList.Value              = mSubLC.S_GeneralStatement.Text
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "S_GeneralStatement", "Text" );

         //:szOriginalDisplayValue = mSubLC.S_GeneralStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_0, 'S', 4001, mSubLC, "S_GeneralStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:GetAttributeLength( OriginalStringLength, mSubLC, "S_GeneralStatement", "Text" )
         {MutableInt mi_OriginalStringLength = new MutableInt( OriginalStringLength );
                   GetAttributeLength( mi_OriginalStringLength, mSubLC, "S_GeneralStatement", "Text" );
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
         //:mSubLC.CompositeComponentList.DisplayValue   = szDisplayValue
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayValue", szDisplayValue );
         RESULT = SetCursorNextEntity( mSubLC, "S_GeneralStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_GeneralSection", "" );
      //:END
   } 

   //:END

   //:// Ingredients Section and Statements.
   //:FOR EACH mSubLC.S_IngredientsSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSubLC.CompositeComponentList 
      RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
      //:mSubLC.CompositeComponentList.Type               = "M_IngredientsSection"
      SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_IngredientsSection" );
      //:mSubLC.CompositeComponentList.SelectLevel        = 1
      SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 1 );
      //:mSubLC.CompositeComponentList.DisplayType        = "Ingredients"
      SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "Ingredients" );
      //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_IngredientsSection.ID 
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_IngredientsSection", "ID" );
      //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_IngredientsSection.ID 
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_IngredientsSection", "ID" );
      //:mSubLC.CompositeComponentList.DisplayValue       = mSubLC.S_IngredientsSection.ActiveTitle 
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_IngredientsSection", "ActiveTitle" );
      //:mSubLC.CompositeComponentList.Value              = mSubLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "CompositeComponentList", "DisplayValue" );
      //:mSubLC.CompositeComponentList.DisplayTypeIndent  = mSubLC.CompositeComponentList.DisplayType
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayTypeIndent", mSubLC, "CompositeComponentList", "DisplayType" );

      //:FOR EACH mSubLC.S_IngredientsStatement 
      RESULT = SetCursorFirstEntity( mSubLC, "S_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSubLC.CompositeComponentList 
         RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
         //:mSubLC.CompositeComponentList.Type               = "M_IngredientsStatement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_IngredientsStatement" );
         //:mSubLC.CompositeComponentList.SelectLevel        = 2
         SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 2 );
         //:mSubLC.CompositeComponentList.DisplayType        = "Statement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "Statement" );
         //:mSubLC.CompositeComponentList.DisplayTypeIndent  = "...Statement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_IngredientsStatement.ID 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_IngredientsStatement", "ID" );
         //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_IngredientsStatement.ID 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_IngredientsStatement", "ID" );
         //:mSubLC.CompositeComponentList.DisplayValue       = mSubLC.S_IngredientsStatement.ChemicalName 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_IngredientsStatement", "ChemicalName" );
         //:mSubLC.CompositeComponentList.Value              = mSubLC.S_IngredientsStatement.ChemicalName
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "S_IngredientsStatement", "ChemicalName" );
         RESULT = SetCursorNextEntity( mSubLC, "S_IngredientsStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_IngredientsSection", "" );
      //:END
   } 

   //:END

   //:// StorageDisposal Section and Statements.
   //:FOR EACH mSubLC.S_StorageDisposalSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSubLC.CompositeComponentList 
      RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
      //:mSubLC.CompositeComponentList.Type               = "M_StorageDisposalSection"
      SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_StorageDisposalSection" );
      //:mSubLC.CompositeComponentList.SelectLevel        = 1
      SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 1 );
      //:mSubLC.CompositeComponentList.DisplayType        = "StorageDisposal"
      SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "StorageDisposal" );
      //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_StorageDisposalSection.ID 
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_StorageDisposalSection", "ID" );
      //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_StorageDisposalSection.ID 
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_StorageDisposalSection", "ID" );
      //:mSubLC.CompositeComponentList.DisplayValue       = mSubLC.S_StorageDisposalSection.Title 
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_StorageDisposalSection", "Title" );
      //:mSubLC.CompositeComponentList.Value              = mSubLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "CompositeComponentList", "DisplayValue" );
      //:mSubLC.CompositeComponentList.DisplayTypeIndent  = mSubLC.CompositeComponentList.DisplayType
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayTypeIndent", mSubLC, "CompositeComponentList", "DisplayType" );

      //:FOR EACH mSubLC.S_StorageDisposalStatement 
      RESULT = SetCursorFirstEntity( mSubLC, "S_StorageDisposalStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSubLC.CompositeComponentList 
         RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
         //:mSubLC.CompositeComponentList.Type               = "M_StorageDisposalStatement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_StorageDisposalStatement" );
         //:mSubLC.CompositeComponentList.SelectLevel        = 2
         SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 2 );
         //:mSubLC.CompositeComponentList.DisplayType        = "Statement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "Statement" );
         //:mSubLC.CompositeComponentList.DisplayTypeIndent  = "...Statement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_StorageDisposalStatement.ID 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_StorageDisposalStatement", "ID" );
         //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_StorageDisposalStatement.ID 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_StorageDisposalStatement", "ID" );
         //:mSubLC.CompositeComponentList.Value              = mSubLC.S_StorageDisposalStatement.Text
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "S_StorageDisposalStatement", "Text" );

         //:szOriginalDisplayValue = mSubLC.S_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_1, 'S', 4001, mSubLC, "S_StorageDisposalStatement", "Text", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:GetAttributeLength( OriginalStringLength, mSubLC, "S_StorageDisposalStatement", "Text" )
         {MutableInt mi_OriginalStringLength = new MutableInt( OriginalStringLength );
                   GetAttributeLength( mi_OriginalStringLength, mSubLC, "S_StorageDisposalStatement", "Text" );
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
         //:mSubLC.CompositeComponentList.DisplayValue   = szDisplayValue
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayValue", szDisplayValue );
         RESULT = SetCursorNextEntity( mSubLC, "S_StorageDisposalStatement", "" );
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_StorageDisposalSection", "" );
      //:END
   } 

   //:END

   //:// DirectionsForUse Section and Statements.
   //:FOR EACH mSubLC.S_DirectionsForUseSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSubLC.CompositeComponentList 
      RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
      //:mSubLC.CompositeComponentList.Type               = "M_DirectionsForUseSection"
      SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_DirectionsForUseSection" );
      //:mSubLC.CompositeComponentList.SelectLevel        = 1
      SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 1 );
      //:mSubLC.CompositeComponentList.DisplayType        = "DirectionsForUse"
      SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "DirectionsForUse" );
      //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_DirectionsForUseSection.ID
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_DirectionsForUseSection", "ID" );
      //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_DirectionsForUseSection.ID 
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_DirectionsForUseSection", "ID" );
      //:IF mSubLC.S_DirectionsForUseSection.Title != ""
      if ( CompareAttributeToString( mSubLC, "S_DirectionsForUseSection", "Title", "" ) != 0 )
      { 
         //:IF mSubLC.S_DirectionsForUseSection.Name = ""
         if ( CompareAttributeToString( mSubLC, "S_DirectionsForUseSection", "Name", "" ) == 0 )
         { 
            //:mSubLC.CompositeComponentList.DisplayValue = mSubLC.S_DirectionsForUseSection.Title
            SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_DirectionsForUseSection", "Title" );
            //:ELSE
         } 
         else
         { 
            //:mSubLC.CompositeComponentList.DisplayValue = mSubLC.S_DirectionsForUseSection.Name + " - " +
            //:                                             mSubLC.S_DirectionsForUseSection.Title 
            {StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetStringFromAttribute( sb_szTempString_0, mSubLC, "S_DirectionsForUseSection", "Name" );
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
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_2, 'S', 255, mSubLC, "S_DirectionsForUseSection", "Title", "", 0 );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );
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
         //:mSubLC.CompositeComponentList.DisplayValue = mSubLC.S_DirectionsForUseSection.Name 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_DirectionsForUseSection", "Name" );
      } 

      //:END
      //:mSubLC.CompositeComponentList.Value              = mSubLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "CompositeComponentList", "DisplayValue" );
      //:mSubLC.CompositeComponentList.DisplayTypeIndent  = mSubLC.CompositeComponentList.DisplayType
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayTypeIndent", mSubLC, "CompositeComponentList", "DisplayType" );

      //:FOR EACH mSubLC.S_DirectionsForUseStatement 
      RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSubLC.CompositeComponentList 
         RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
         //:mSubLC.CompositeComponentList.Type               = "M_DirectionsForUseStatement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_DirectionsForUseStatement" );
         //:mSubLC.CompositeComponentList.SelectLevel        = 2
         SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 2 );
         //:mSubLC.CompositeComponentList.DisplayType        = "Statement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "Statement" );
         //:mSubLC.CompositeComponentList.DisplayTypeIndent  = "...Statement"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", "...Statement" );
         //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_DirectionsForUseStatement.ID 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_DirectionsForUseStatement", "ID" );
         //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_DirectionsForUseStatement.ID 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_DirectionsForUseStatement", "ID" );
         //:mSubLC.CompositeComponentList.Value              = mSubLC.S_DirectionsForUseStatement.Text
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "S_DirectionsForUseStatement", "Text" );

         //:szOriginalDisplayValue = mSubLC.S_DirectionsForUseStatement.Text
         {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_3, 'S', 4001, mSubLC, "S_DirectionsForUseStatement", "Text", "", 0 );
         lTempInteger_3 = mi_lTempInteger_3.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:GetAttributeLength( OriginalStringLength, mSubLC, "S_DirectionsForUseStatement", "Text" )
         {MutableInt mi_OriginalStringLength = new MutableInt( OriginalStringLength );
                   GetAttributeLength( mi_OriginalStringLength, mSubLC, "S_DirectionsForUseStatement", "Text" );
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
         //:mSubLC.CompositeComponentList.DisplayValue   = szDisplayValue
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayValue", szDisplayValue );
         RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseStatement", "" );
      } 

      //:END

      //:// Add any Usage entries.
      //:// First sort by Usage Type, but keeping the entries in their original order otherwise.
      //:Count = 0
      Count = 0;
      //:FOR EACH mSubLC.S_DirectionsUsageOrdering 
      RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:Count = Count + 1
         Count = Count + 1;
         //:mSubLC.S_DirectionsUsageOrdering.wSortOrder = Count
         SetAttributeFromInteger( mSubLC, "S_DirectionsUsageOrdering", "wSortOrder", Count );
         RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsUsageOrdering", "" );
      } 

      //:END
      //:OrderEntityForView( mSubLC, "S_DirectionsUsageOrdering", "S_DirectionsUsage.UsageType A wSortOrder A" )
      OrderEntityForView( mSubLC, "S_DirectionsUsageOrdering", "S_DirectionsUsage.UsageType A wSortOrder A" );
      //:FOR EACH mSubLC.S_DirectionsUsageOrdering 
      RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSubLC.CompositeComponentList 
         RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
         //:GetStringFromAttributeByContext( szUsageType, mSubLC, "S_DirectionsUsage", "UsageType", "FullUsageType", 20 )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttributeByContext( sb_szUsageType, mSubLC, "S_DirectionsUsage", "UsageType", "FullUsageType", 20 );
         szUsageType = sb_szUsageType.toString( );}
         //:mSubLC.CompositeComponentList.Type              = "M_DirectionsUsageOrdering"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_DirectionsUsageOrdering" );
         //:mSubLC.CompositeComponentList.SelectLevel       = 3
         SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 3 );
         //:mSubLC.CompositeComponentList.DisplayType       = "DirUseUsage"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "DirUseUsage" );
         //:mSubLC.CompositeComponentList.DisplayTypeIndent = "...DU " + szUsageType
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
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", szTempString_2 );
         //:mSubLC.CompositeComponentList.Value             = mSubLC.S_DirectionsUsage.Name 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "S_DirectionsUsage", "Name" );
         //:mSubLC.CompositeComponentList.DisplayValue      = mSubLC.S_DirectionsUsage.Name 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_DirectionsUsage", "Name" );
         //:SET CURSOR FIRST mSubLC.S_Usage WHERE mSubLC.S_Usage.UsageType            = mSubLC.S_DirectionsUsage.UsageType 
         //:                                  AND mSubLC.S_Usage.ClaimsClassification = mSubLC.S_DirectionsUsage.ClaimsClassification 
         //:                                  AND mSubLC.S_Usage.Name                 = mSubLC.S_DirectionsUsage.Name 
         RESULT = SetCursorFirstEntity( mSubLC, "S_Usage", "" );
         if ( RESULT > zCURSOR_UNCHANGED )
         { 
            while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( mSubLC, "S_Usage", "UsageType", mSubLC, "S_DirectionsUsage", "UsageType" ) != 0 ||
                    CompareAttributeToAttribute( mSubLC, "S_Usage", "ClaimsClassification", mSubLC, "S_DirectionsUsage", "ClaimsClassification" ) != 0 ||
                    CompareAttributeToAttribute( mSubLC, "S_Usage", "Name", mSubLC, "S_DirectionsUsage", "Name" ) != 0 ) )
            { 
               RESULT = SetCursorNextEntity( mSubLC, "S_Usage", "" );
            } 

         } 

         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_Usage.ID 
            SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_Usage", "ID" );
            //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_Usage.ID 
            SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_Usage", "ID" );
            //://TraceLineI( "#### Valid Usage ID ", mSubLC.M_Usage.ID )
            //:ELSE
         } 
         else
         { 
         } 

         RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsUsageOrdering", "" );
         //:   //TraceLineS( "#### Invalid Usage ID ", mSubLC.S_DirectionsUsage.Name )
         //:END
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// Marketing Section and Statements.
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
      //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_MarketingSection.ID 
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_MarketingSection", "ID" );
      //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_MarketingSection.ID
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_MarketingSection", "ID" );
      //:IF mSubLC.S_MarketingSection.Title != ""
      if ( CompareAttributeToString( mSubLC, "S_MarketingSection", "Title", "" ) != 0 )
      { 
         //:IF mSubLC.S_MarketingSection.Name = ""
         if ( CompareAttributeToString( mSubLC, "S_MarketingSection", "Name", "" ) == 0 )
         { 
            //:mSubLC.CompositeComponentList.DisplayValue = mSubLC.S_MarketingSection.Title
            SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_MarketingSection", "Title" );
            //:ELSE
         } 
         else
         { 
            //:mSubLC.CompositeComponentList.DisplayValue = mSubLC.S_MarketingSection.Name + " - " +
            //:                                             mSubLC.S_MarketingSection.Title 
            {StringBuilder sb_szTempString_3;
            if ( szTempString_3 == null )
               sb_szTempString_3 = new StringBuilder( 32 );
            else
               sb_szTempString_3 = new StringBuilder( szTempString_3 );
                         GetStringFromAttribute( sb_szTempString_3, mSubLC, "S_MarketingSection", "Name" );
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
                         GetVariableFromAttribute( sb_szTempString_4, mi_lTempInteger_4, 'S', 255, mSubLC, "S_MarketingSection", "Title", "", 0 );
            lTempInteger_4 = mi_lTempInteger_4.intValue( );
            szTempString_4 = sb_szTempString_4.toString( );}
             {StringBuilder sb_szTempString_3;
            if ( szTempString_3 == null )
               sb_szTempString_3 = new StringBuilder( 32 );
            else
               sb_szTempString_3 = new StringBuilder( szTempString_3 );
                        ZeidonStringConcat( sb_szTempString_3, 1, 0, szTempString_4, 1, 0, 32001 );
            szTempString_3 = sb_szTempString_3.toString( );}
            SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayValue", szTempString_3 );
         } 

         //:END
         //:ELSE
      } 
      else
      { 
         //:mSubLC.CompositeComponentList.DisplayValue = mSubLC.S_MarketingSection.Name 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_MarketingSection", "Name" );
      } 

      //:END
      //:mSubLC.CompositeComponentList.Value              = mSubLC.CompositeComponentList.DisplayValue
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "CompositeComponentList", "DisplayValue" );
      //:mSubLC.CompositeComponentList.DisplayTypeIndent  = mSubLC.CompositeComponentList.DisplayType
      SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayTypeIndent", mSubLC, "CompositeComponentList", "DisplayType" );

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
         //:mSubLC.CompositeComponentList.Value              = mSubLC.S_MarketingStatement.Text
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "S_MarketingStatement", "Text" );

         //:szOriginalDisplayValue = mSubLC.S_MarketingStatement.Text 
         {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
         StringBuilder sb_szOriginalDisplayValue;
         if ( szOriginalDisplayValue == null )
            sb_szOriginalDisplayValue = new StringBuilder( 32 );
         else
            sb_szOriginalDisplayValue = new StringBuilder( szOriginalDisplayValue );
                   GetVariableFromAttribute( sb_szOriginalDisplayValue, mi_lTempInteger_5, 'S', 4001, mSubLC, "S_MarketingStatement", "Text", "", 0 );
         lTempInteger_5 = mi_lTempInteger_5.intValue( );
         szOriginalDisplayValue = sb_szOriginalDisplayValue.toString( );}
         //:GetAttributeLength( OriginalStringLength, mSubLC, "S_MarketingStatement", "Text" )
         {MutableInt mi_OriginalStringLength = new MutableInt( OriginalStringLength );
                   GetAttributeLength( mi_OriginalStringLength, mSubLC, "S_MarketingStatement", "Text" );
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
         //:mSubLC.CompositeComponentList.DisplayValue = szDisplayValue
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayValue", szDisplayValue );
         RESULT = SetCursorNextEntity( mSubLC, "S_MarketingStatement", "" );
      } 

      //:END

      //:// Add any Usage entries.
      //:// First sort by Usage Type, but keeping the entries in their original order otherwise.
      //:Count = 0
      Count = 0;
      //:FOR EACH mSubLC.S_MarketingUsageOrdering 
      RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:Count = Count + 1
         Count = Count + 1;
         //:mSubLC.S_MarketingUsageOrdering.wSortOrder = Count
         SetAttributeFromInteger( mSubLC, "S_MarketingUsageOrdering", "wSortOrder", Count );
         RESULT = SetCursorNextEntity( mSubLC, "S_MarketingUsageOrdering", "" );
      } 

      //:END
      //:OrderEntityForView( mSubLC, "S_MarketingUsageOrdering", "S_MarketingUsage.UsageType A wSortOrder A" )
      OrderEntityForView( mSubLC, "S_MarketingUsageOrdering", "S_MarketingUsage.UsageType A wSortOrder A" );
      //:FOR EACH mSubLC.S_MarketingUsageOrdering 
      RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSubLC.CompositeComponentList 
         RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
         //:GetStringFromAttributeByContext( szUsageType, mSubLC, "S_MarketingUsage", "UsageType", "FullUsageType", 20 )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttributeByContext( sb_szUsageType, mSubLC, "S_MarketingUsage", "UsageType", "FullUsageType", 20 );
         szUsageType = sb_szUsageType.toString( );}
         //:mSubLC.CompositeComponentList.Type              = "M_MarketingUsageOrdering"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_MarketingUsageOrdering" );
         //:mSubLC.CompositeComponentList.SelectLevel       = 3
         SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 3 );
         //:mSubLC.CompositeComponentList.DisplayType       = "MarketingUsage"
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayType", "MarketingUsage" );
         //:mSubLC.CompositeComponentList.DisplayTypeIndent = "...Mktg " + szUsageType
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
         SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", szTempString_5 );
         //:mSubLC.CompositeComponentList.Value             = mSubLC.S_MarketingUsage.Name 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "Value", mSubLC, "S_MarketingUsage", "Name" );
         //:mSubLC.CompositeComponentList.DisplayValue      = mSubLC.S_MarketingUsage.Name 
         SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_MarketingUsage", "Name" );
         //:SET CURSOR FIRST mSubLC.S_Usage WHERE mSubLC.S_Usage.UsageType            = mSubLC.S_MarketingUsage.UsageType 
         //:                                  AND mSubLC.S_Usage.ClaimsClassification = mSubLC.S_MarketingUsage.ClaimsClassification 
         //:                                  AND mSubLC.S_Usage.Name                 = mSubLC.S_MarketingUsage.Name 
         RESULT = SetCursorFirstEntity( mSubLC, "S_Usage", "" );
         if ( RESULT > zCURSOR_UNCHANGED )
         { 
            while ( RESULT > zCURSOR_UNCHANGED && ( CompareAttributeToAttribute( mSubLC, "S_Usage", "UsageType", mSubLC, "S_MarketingUsage", "UsageType" ) != 0 ||
                    CompareAttributeToAttribute( mSubLC, "S_Usage", "ClaimsClassification", mSubLC, "S_MarketingUsage", "ClaimsClassification" ) != 0 || CompareAttributeToAttribute( mSubLC, "S_Usage", "Name", mSubLC, "S_MarketingUsage", "Name" ) != 0 ) )
            { 
               RESULT = SetCursorNextEntity( mSubLC, "S_Usage", "" );
            } 

         } 

         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_Usage.ID
            SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_Usage", "ID" );
            //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_Usage.ID 
            SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_Usage", "ID" );
            //:ELSE
         } 
         else
         { 
            //:TraceLineS( "#### Invalid Usage ID ", mSubLC.S_MarketingUsage.Name )
            {StringBuilder sb_szTempString_6;
            if ( szTempString_6 == null )
               sb_szTempString_6 = new StringBuilder( 32 );
            else
               sb_szTempString_6 = new StringBuilder( szTempString_6 );
                         GetStringFromAttribute( sb_szTempString_6, mSubLC, "S_MarketingUsage", "Name" );
            szTempString_6 = sb_szTempString_6.toString( );}
            TraceLineS( "#### Invalid Usage ID ", szTempString_6 );
         } 

         RESULT = SetCursorNextEntity( mSubLC, "S_MarketingUsageOrdering", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_MarketingSection", "" );
      //:END
   } 

   //:END

   //:// Hazards Section
   //:CREATE ENTITY mSubLC.CompositeComponentList 
   RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
   //:mSubLC.CompositeComponentList.Type               = "M_HumanHazardSection"
   SetAttributeFromString( mSubLC, "CompositeComponentList", "Type", "M_HumanHazardSection" );
   //:mSubLC.CompositeComponentList.SelectLevel        = 1
   SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 1 );
   //:mSubLC.CompositeComponentList.DisplayTypeIndent  = "Hazards"
   SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", "Hazards" );
   //:mSubLC.CompositeComponentList.OriginalTypeID     = mSubLC.M_HumanHazardSection.ID 
   SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "OriginalTypeID", mSubLC, "M_HumanHazardSection", "ID" );
   //:mSubLC.CompositeComponentList.SLC_OriginalTypeID = mSubLC.S_HumanHazardSection.ID
   SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "SLC_OriginalTypeID", mSubLC, "S_HumanHazardSection", "ID" );
   //:mSubLC.CompositeComponentList.DisplayValue       = ""
   SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayValue", "" );

   //:CREATE ENTITY mSubLC.CompositeComponentList 
   RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
   //:mSubLC.CompositeComponentList.SelectLevel       = 2
   SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 2 );
   //:mSubLC.CompositeComponentList.DisplayTypeIndent = "...Signal Word"
   SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", "...Signal Word" );
   //:mSubLC.CompositeComponentList.DisplayValue      = mSubLC.S_HumanHazardSection.EPA_SignalWord 
   SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_HumanHazardSection", "EPA_SignalWord" );

   //:CREATE ENTITY mSubLC.CompositeComponentList 
   RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
   //:mSubLC.CompositeComponentList.SelectLevel       = 2
   SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 2 );
   //:mSubLC.CompositeComponentList.DisplayTypeIndent = "...Child Warning"
   SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", "...Child Warning" );
   //:mSubLC.CompositeComponentList.DisplayValue      = mSubLC.S_HumanHazardSection.EPA_ChildHazardWarning 
   SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_HumanHazardSection", "EPA_ChildHazardWarning" );

   //:CREATE ENTITY mSubLC.CompositeComponentList 
   RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
   //:mSubLC.CompositeComponentList.SelectLevel       = 2
   SetAttributeFromInteger( mSubLC, "CompositeComponentList", "SelectLevel", 2 );
   //:mSubLC.CompositeComponentList.DisplayTypeIndent = "...Precautionary Stmt"
   SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", "...Precautionary Stmt" );
   //:mSubLC.CompositeComponentList.DisplayValue      = mSubLC.S_HumanHazardSection.PrecautionaryStatement 
   SetAttributeFromAttribute( mSubLC, "CompositeComponentList", "DisplayValue", mSubLC, "S_HumanHazardSection", "PrecautionaryStatement" );

   //:CREATE ENTITY mSubLC.CompositeComponentList 
   RESULT = CreateEntity( mSubLC, "CompositeComponentList", zPOS_AFTER );
   //:mSubLC.CompositeComponentList.DisplayTypeIndent = "Location"
   SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayTypeIndent", "Location" );
   //:szCompositeLocation = "..." + mSubLC.S_HumanHazardSection.Location1 
   {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
   StringBuilder sb_szTempString_7;
   if ( szTempString_7 == null )
      sb_szTempString_7 = new StringBuilder( 32 );
   else
      sb_szTempString_7 = new StringBuilder( szTempString_7 );
       GetVariableFromAttribute( sb_szTempString_7, mi_lTempInteger_6, 'S', 255, mSubLC, "S_HumanHazardSection", "Location1", "", 0 );
   lTempInteger_6 = mi_lTempInteger_6.intValue( );
   szTempString_7 = sb_szTempString_7.toString( );}
    {StringBuilder sb_szCompositeLocation;
   if ( szCompositeLocation == null )
      sb_szCompositeLocation = new StringBuilder( 32 );
   else
      sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
      ZeidonStringCopy( sb_szCompositeLocation, 1, 0, "...", 1, 0, 101 );
   szCompositeLocation = sb_szCompositeLocation.toString( );}
    {StringBuilder sb_szCompositeLocation;
   if ( szCompositeLocation == null )
      sb_szCompositeLocation = new StringBuilder( 32 );
   else
      sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
      ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_7, 1, 0, 101 );
   szCompositeLocation = sb_szCompositeLocation.toString( );}
   //:IF mSubLC.S_HumanHazardSection.Location2 != ""
   if ( CompareAttributeToString( mSubLC, "S_HumanHazardSection", "Location2", "" ) != 0 )
   { 
      //:szCompositeLocation = szCompositeLocation + " / " + mSubLC.S_HumanHazardSection.Location2 
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, " / ", 1, 0, 101 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
      {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
      StringBuilder sb_szTempString_8;
      if ( szTempString_8 == null )
         sb_szTempString_8 = new StringBuilder( 32 );
      else
         sb_szTempString_8 = new StringBuilder( szTempString_8 );
             GetVariableFromAttribute( sb_szTempString_8, mi_lTempInteger_7, 'S', 255, mSubLC, "S_HumanHazardSection", "Location2", "", 0 );
      lTempInteger_7 = mi_lTempInteger_7.intValue( );
      szTempString_8 = sb_szTempString_8.toString( );}
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_8, 1, 0, 101 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
   } 

   //:END
   //:IF mSubLC.S_HumanHazardSection.Location3 != ""
   if ( CompareAttributeToString( mSubLC, "S_HumanHazardSection", "Location3", "" ) != 0 )
   { 
      //:szCompositeLocation = szCompositeLocation + " / " + mSubLC.S_HumanHazardSection.Location3
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, " / ", 1, 0, 101 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
      {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
      StringBuilder sb_szTempString_9;
      if ( szTempString_9 == null )
         sb_szTempString_9 = new StringBuilder( 32 );
      else
         sb_szTempString_9 = new StringBuilder( szTempString_9 );
             GetVariableFromAttribute( sb_szTempString_9, mi_lTempInteger_8, 'S', 255, mSubLC, "S_HumanHazardSection", "Location3", "", 0 );
      lTempInteger_8 = mi_lTempInteger_8.intValue( );
      szTempString_9 = sb_szTempString_9.toString( );}
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_9, 1, 0, 101 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
   } 

   //:END
   //:IF mSubLC.S_HumanHazardSection.Location4 != ""
   if ( CompareAttributeToString( mSubLC, "S_HumanHazardSection", "Location4", "" ) != 0 )
   { 
      //:szCompositeLocation = szCompositeLocation + " / " + mSubLC.S_HumanHazardSection.Location4 
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, " / ", 1, 0, 101 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
      {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
      StringBuilder sb_szTempString_10;
      if ( szTempString_10 == null )
         sb_szTempString_10 = new StringBuilder( 32 );
      else
         sb_szTempString_10 = new StringBuilder( szTempString_10 );
             GetVariableFromAttribute( sb_szTempString_10, mi_lTempInteger_9, 'S', 255, mSubLC, "S_HumanHazardSection", "Location4", "", 0 );
      lTempInteger_9 = mi_lTempInteger_9.intValue( );
      szTempString_10 = sb_szTempString_10.toString( );}
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_10, 1, 0, 101 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
   } 

   //:END
   //:IF mSubLC.S_HumanHazardSection.Location5 != ""
   if ( CompareAttributeToString( mSubLC, "S_HumanHazardSection", "Location5", "" ) != 0 )
   { 
      //:szCompositeLocation = szCompositeLocation + " / " + mSubLC.S_HumanHazardSection.Location5 
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, " / ", 1, 0, 101 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
      {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
      StringBuilder sb_szTempString_11;
      if ( szTempString_11 == null )
         sb_szTempString_11 = new StringBuilder( 32 );
      else
         sb_szTempString_11 = new StringBuilder( szTempString_11 );
             GetVariableFromAttribute( sb_szTempString_11, mi_lTempInteger_10, 'S', 255, mSubLC, "S_HumanHazardSection", "Location5", "", 0 );
      lTempInteger_10 = mi_lTempInteger_10.intValue( );
      szTempString_11 = sb_szTempString_11.toString( );}
       {StringBuilder sb_szCompositeLocation;
      if ( szCompositeLocation == null )
         sb_szCompositeLocation = new StringBuilder( 32 );
      else
         sb_szCompositeLocation = new StringBuilder( szCompositeLocation );
            ZeidonStringConcat( sb_szCompositeLocation, 1, 0, szTempString_11, 1, 0, 101 );
      szCompositeLocation = sb_szCompositeLocation.toString( );}
   } 

   //:END
   //:mSubLC.CompositeComponentList.DisplayValue   = szCompositeLocation
   SetAttributeFromString( mSubLC, "CompositeComponentList", "DisplayValue", szCompositeLocation );
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:BuildUsageWorkEnts( VIEW mSubLC BASED ON LOD mSubLC,
//:                    STRING ( 1 ) szDirUseOrMarketingType )

//:   STRING ( 32 ) szMarketingUsageName
public int 
omSubLC_BuildUsageWorkEnts( View     mSubLC,
                            String   szDirUseOrMarketingType )
{
   String   szMarketingUsageName = null;
   //:STRING ( 32 ) szDirectionsUsageName
   String   szDirectionsUsageName = null;
   //:SHORT         nRC
   int      nRC = 0;
   int      RESULT = 0;


   //:// Build the work entities of the form, "DirectionsAppType" for each M_DirectionsUsage or M_MarketingUsage,
   //:// depending on whether the szDirUseOrMarketingType value is "D" or "M".

   //:IF szDirUseOrMarketingType = "D"
   if ( ZeidonStringCompare( szDirUseOrMarketingType, 1, 0, "D", 1, 0, 2 ) == 0 )
   { 
      //:// Directions for Use work entities.
      //:FOR EACH mSubLC.S_DirectionsUsageOrdering 
      RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:szDirectionsUsageName = ""
          {StringBuilder sb_szDirectionsUsageName;
         if ( szDirectionsUsageName == null )
            sb_szDirectionsUsageName = new StringBuilder( 32 );
         else
            sb_szDirectionsUsageName = new StringBuilder( szDirectionsUsageName );
                  ZeidonStringCopy( sb_szDirectionsUsageName, 1, 0, "", 1, 0, 33 );
         szDirectionsUsageName = sb_szDirectionsUsageName.toString( );}
         //:IF mSubLC.S_DirectionsUsage.UsageType = "C"
         if ( CompareAttributeToString( mSubLC, "S_DirectionsUsage", "UsageType", "C" ) == 0 )
         { 
            //:IF mSubLC.S_DirectionsUsage.ClaimsClassification = "Bacteria"
            if ( CompareAttributeToString( mSubLC, "S_DirectionsUsage", "ClaimsClassification", "Bacteria" ) == 0 )
            { 
               //:szDirectionsUsageName = "DirectionsBacteria"
                {StringBuilder sb_szDirectionsUsageName;
               if ( szDirectionsUsageName == null )
                  sb_szDirectionsUsageName = new StringBuilder( 32 );
               else
                  sb_szDirectionsUsageName = new StringBuilder( szDirectionsUsageName );
                              ZeidonStringCopy( sb_szDirectionsUsageName, 1, 0, "DirectionsBacteria", 1, 0, 33 );
               szDirectionsUsageName = sb_szDirectionsUsageName.toString( );}
               //:ELSE
            } 
            else
            { 
               //:IF mSubLC.S_DirectionsUsage.ClaimsClassification = "Fungi"
               if ( CompareAttributeToString( mSubLC, "S_DirectionsUsage", "ClaimsClassification", "Fungi" ) == 0 )
               { 
                  //:szDirectionsUsageName = "DirectionsFungi" 
                   {StringBuilder sb_szDirectionsUsageName;
                  if ( szDirectionsUsageName == null )
                     sb_szDirectionsUsageName = new StringBuilder( 32 );
                  else
                     sb_szDirectionsUsageName = new StringBuilder( szDirectionsUsageName );
                                    ZeidonStringCopy( sb_szDirectionsUsageName, 1, 0, "DirectionsFungi", 1, 0, 33 );
                  szDirectionsUsageName = sb_szDirectionsUsageName.toString( );}
                  //:ELSE
               } 
               else
               { 
                  //:IF mSubLC.S_DirectionsUsage.ClaimsClassification = "Viruses"
                  if ( CompareAttributeToString( mSubLC, "S_DirectionsUsage", "ClaimsClassification", "Viruses" ) == 0 )
                  { 
                     //:szDirectionsUsageName = "DirectionsViruses"
                      {StringBuilder sb_szDirectionsUsageName;
                     if ( szDirectionsUsageName == null )
                        sb_szDirectionsUsageName = new StringBuilder( 32 );
                     else
                        sb_szDirectionsUsageName = new StringBuilder( szDirectionsUsageName );
                                          ZeidonStringCopy( sb_szDirectionsUsageName, 1, 0, "DirectionsViruses", 1, 0, 33 );
                     szDirectionsUsageName = sb_szDirectionsUsageName.toString( );}
                  } 

                  //:END
               } 

               //:END
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:IF mSubLC.S_DirectionsUsage.UsageType = "S"
            if ( CompareAttributeToString( mSubLC, "S_DirectionsUsage", "UsageType", "S" ) == 0 )
            { 
               //:szDirectionsUsageName = "DirectionsSurface"
                {StringBuilder sb_szDirectionsUsageName;
               if ( szDirectionsUsageName == null )
                  sb_szDirectionsUsageName = new StringBuilder( 32 );
               else
                  sb_szDirectionsUsageName = new StringBuilder( szDirectionsUsageName );
                              ZeidonStringCopy( sb_szDirectionsUsageName, 1, 0, "DirectionsSurface", 1, 0, 33 );
               szDirectionsUsageName = sb_szDirectionsUsageName.toString( );}
               //:ELSE
            } 
            else
            { 
               //:IF mSubLC.S_DirectionsUsage.UsageType = "T"
               if ( CompareAttributeToString( mSubLC, "S_DirectionsUsage", "UsageType", "T" ) == 0 )
               { 
                  //:szDirectionsUsageName = "DirectionsAppType" 
                   {StringBuilder sb_szDirectionsUsageName;
                  if ( szDirectionsUsageName == null )
                     sb_szDirectionsUsageName = new StringBuilder( 32 );
                  else
                     sb_szDirectionsUsageName = new StringBuilder( szDirectionsUsageName );
                                    ZeidonStringCopy( sb_szDirectionsUsageName, 1, 0, "DirectionsAppType", 1, 0, 33 );
                  szDirectionsUsageName = sb_szDirectionsUsageName.toString( );}
                  //:ELSE
               } 
               else
               { 
                  //:IF mSubLC.S_DirectionsUsage.UsageType = "U"
                  if ( CompareAttributeToString( mSubLC, "S_DirectionsUsage", "UsageType", "U" ) == 0 )
                  { 
                     //:szDirectionsUsageName = "DirectionsAreasOfUse"
                      {StringBuilder sb_szDirectionsUsageName;
                     if ( szDirectionsUsageName == null )
                        sb_szDirectionsUsageName = new StringBuilder( 32 );
                     else
                        sb_szDirectionsUsageName = new StringBuilder( szDirectionsUsageName );
                                          ZeidonStringCopy( sb_szDirectionsUsageName, 1, 0, "DirectionsAreasOfUse", 1, 0, 33 );
                     szDirectionsUsageName = sb_szDirectionsUsageName.toString( );}
                  } 

                  //:END
               } 

               //:END
            } 

            //:END
         } 

         //:END
         //:IF szDirectionsUsageName != ""
         if ( ZeidonStringCompare( szDirectionsUsageName, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:nRC = CheckExistenceOfEntity( mSubLC, szDirectionsUsageName )
            nRC = CheckExistenceOfEntity( mSubLC, szDirectionsUsageName );
            //:IF nRC < 0
            if ( nRC < 0 )
            { 
               //:CreateEntity( mSubLC, szDirectionsUsageName, zPOS_AFTER )
               CreateEntity( mSubLC, szDirectionsUsageName, zPOS_AFTER );
            } 

            //:END
         } 

         RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsUsageOrdering", "" );
         //:END
      } 

      //:END
      //:ELSE
   } 
   else
   { 
      //:// Marketing work entities.
      //:FOR EACH mSubLC.S_MarketingUsageOrdering 
      RESULT = SetCursorFirstEntity( mSubLC, "S_MarketingUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:szMarketingUsageName = ""
          {StringBuilder sb_szMarketingUsageName;
         if ( szMarketingUsageName == null )
            sb_szMarketingUsageName = new StringBuilder( 32 );
         else
            sb_szMarketingUsageName = new StringBuilder( szMarketingUsageName );
                  ZeidonStringCopy( sb_szMarketingUsageName, 1, 0, "", 1, 0, 33 );
         szMarketingUsageName = sb_szMarketingUsageName.toString( );}
         //:IF mSubLC.S_MarketingUsage.UsageType = "C"
         if ( CompareAttributeToString( mSubLC, "S_MarketingUsage", "UsageType", "C" ) == 0 )
         { 
            //:IF mSubLC.S_MarketingUsage.ClaimsClassification = "Bacteria"
            if ( CompareAttributeToString( mSubLC, "S_MarketingUsage", "ClaimsClassification", "Bacteria" ) == 0 )
            { 
               //:szMarketingUsageName = "MarketingBacteria"
                {StringBuilder sb_szMarketingUsageName;
               if ( szMarketingUsageName == null )
                  sb_szMarketingUsageName = new StringBuilder( 32 );
               else
                  sb_szMarketingUsageName = new StringBuilder( szMarketingUsageName );
                              ZeidonStringCopy( sb_szMarketingUsageName, 1, 0, "MarketingBacteria", 1, 0, 33 );
               szMarketingUsageName = sb_szMarketingUsageName.toString( );}
               //:ELSE
            } 
            else
            { 
               //:IF mSubLC.S_MarketingUsage.ClaimsClassification = "Fungi"
               if ( CompareAttributeToString( mSubLC, "S_MarketingUsage", "ClaimsClassification", "Fungi" ) == 0 )
               { 
                  //:szMarketingUsageName = "MarketingFungi" 
                   {StringBuilder sb_szMarketingUsageName;
                  if ( szMarketingUsageName == null )
                     sb_szMarketingUsageName = new StringBuilder( 32 );
                  else
                     sb_szMarketingUsageName = new StringBuilder( szMarketingUsageName );
                                    ZeidonStringCopy( sb_szMarketingUsageName, 1, 0, "MarketingFungi", 1, 0, 33 );
                  szMarketingUsageName = sb_szMarketingUsageName.toString( );}
                  //:ELSE
               } 
               else
               { 
                  //:IF mSubLC.S_MarketingUsage.ClaimsClassification = "Viruses"
                  if ( CompareAttributeToString( mSubLC, "S_MarketingUsage", "ClaimsClassification", "Viruses" ) == 0 )
                  { 
                     //:szMarketingUsageName = "MarketingViruses"
                      {StringBuilder sb_szMarketingUsageName;
                     if ( szMarketingUsageName == null )
                        sb_szMarketingUsageName = new StringBuilder( 32 );
                     else
                        sb_szMarketingUsageName = new StringBuilder( szMarketingUsageName );
                                          ZeidonStringCopy( sb_szMarketingUsageName, 1, 0, "MarketingViruses", 1, 0, 33 );
                     szMarketingUsageName = sb_szMarketingUsageName.toString( );}
                  } 

                  //:END
               } 

               //:END
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:IF mSubLC.S_MarketingUsage.UsageType = "S"
            if ( CompareAttributeToString( mSubLC, "S_MarketingUsage", "UsageType", "S" ) == 0 )
            { 
               //:szMarketingUsageName = "MarketingSurface"
                {StringBuilder sb_szMarketingUsageName;
               if ( szMarketingUsageName == null )
                  sb_szMarketingUsageName = new StringBuilder( 32 );
               else
                  sb_szMarketingUsageName = new StringBuilder( szMarketingUsageName );
                              ZeidonStringCopy( sb_szMarketingUsageName, 1, 0, "MarketingSurface", 1, 0, 33 );
               szMarketingUsageName = sb_szMarketingUsageName.toString( );}
               //:ELSE
            } 
            else
            { 
               //:IF mSubLC.S_MarketingUsage.UsageType = "T"
               if ( CompareAttributeToString( mSubLC, "S_MarketingUsage", "UsageType", "T" ) == 0 )
               { 
                  //:szMarketingUsageName = "MarketingAppType" 
                   {StringBuilder sb_szMarketingUsageName;
                  if ( szMarketingUsageName == null )
                     sb_szMarketingUsageName = new StringBuilder( 32 );
                  else
                     sb_szMarketingUsageName = new StringBuilder( szMarketingUsageName );
                                    ZeidonStringCopy( sb_szMarketingUsageName, 1, 0, "MarketingAppType", 1, 0, 33 );
                  szMarketingUsageName = sb_szMarketingUsageName.toString( );}
                  //:ELSE
               } 
               else
               { 
                  //:IF mSubLC.S_MarketingUsage.UsageType = "U"
                  if ( CompareAttributeToString( mSubLC, "S_MarketingUsage", "UsageType", "U" ) == 0 )
                  { 
                     //:szMarketingUsageName = "MarketingAreasOfUse"
                      {StringBuilder sb_szMarketingUsageName;
                     if ( szMarketingUsageName == null )
                        sb_szMarketingUsageName = new StringBuilder( 32 );
                     else
                        sb_szMarketingUsageName = new StringBuilder( szMarketingUsageName );
                                          ZeidonStringCopy( sb_szMarketingUsageName, 1, 0, "MarketingAreasOfUse", 1, 0, 33 );
                     szMarketingUsageName = sb_szMarketingUsageName.toString( );}
                  } 

                  //:END
               } 

               //:END
            } 

            //:END
         } 

         //:END
         //:IF szMarketingUsageName != ""
         if ( ZeidonStringCompare( szMarketingUsageName, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:nRC = CheckExistenceOfEntity( mSubLC, szMarketingUsageName )
            nRC = CheckExistenceOfEntity( mSubLC, szMarketingUsageName );
            //:IF nRC < 0
            if ( nRC < 0 )
            { 
               //:CreateEntity( mSubLC, szMarketingUsageName, zPOS_AFTER )
               CreateEntity( mSubLC, szMarketingUsageName, zPOS_AFTER );
            } 

            //:END
         } 

         RESULT = SetCursorNextEntity( mSubLC, "S_MarketingUsageOrdering", "" );
         //:END
      } 

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

   //:// Delete any Directions for Use Sections in SLC not in MLC.
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

   //:// Add/Refresh SLC Directions for Use Sections.
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
public int 
omSubLC_BuildWorkVariables( View     mSubLC,
                            View     mMasLC )
{
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   int      lTempInteger_5 = 0;

   //:BuildWorkVariables( VIEW mSubLC BASED ON LOD mSubLC,
   //:                 VIEW mMasLC BASED ON LOD mMasLC )

   //:// Build any work variable for the mSubLC.

   //:// Build list of Directions for Use Section Driving Usage entries by selecting the Driving Usage entries
   //:// from the MLC that have been selected for the SLC.
   //:FOR EACH mSubLC.S_DirectionsForUseSection 
   RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST mMasLC.M_DirectionsForUseSection WHERE mMasLC.M_DirectionsForUseSection.ID = mSubLC.M_DirectionsForUseSection.ID 
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
             GetIntegerFromAttribute( mi_lTempInteger_0, mSubLC, "M_DirectionsForUseSection", "ID" );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_DirectionsForUseSection", "ID", lTempInteger_0, "" );
      //:IF RESULT < zCURSOR_SET
      if ( RESULT < zCURSOR_SET )
      { 
         //:IssueError( mSubLC,0,0,"Programming Error in BuildWorkVariables" )
         IssueError( mSubLC, 0, 0, "Programming Error in BuildWorkVariables" );
      } 

      //:END 
      //:FOR EACH mMasLC.M_DrivingUsage 
      RESULT = SetCursorFirstEntity( mMasLC, "M_DrivingUsage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST mSubLC.M_Usage WITHIN mSubLC.SubregLabelContent 
         //:           WHERE mSubLC.M_Usage.ID = mMasLC.M_DrivingUsage.ID 
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                   GetIntegerFromAttribute( mi_lTempInteger_1, mMasLC, "M_DrivingUsage", "ID" );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "M_Usage", "ID", lTempInteger_1, "SubregLabelContent" );
         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:INCLUDE mSubLC.S_ClaimsDrivingUsage FROM mSubLC.S_Usage
            RESULT = IncludeSubobjectFromSubobject( mSubLC, "S_ClaimsDrivingUsage", mSubLC, "S_Usage", zPOS_AFTER );
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_DrivingUsage", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mSubLC, "S_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// Build list of Directions for Use Statement Usage entries by selecting the Statement Usage entries
   //:// from the MLC that have been selected for the SLC.
   //:FOR EACH mSubLC.S_DirectionsForUseStatement WITHIN mSubLC.SubregLabelContent 
   RESULT = SetCursorFirstEntity( mSubLC, "S_DirectionsForUseStatement", "SubregLabelContent" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST mMasLC.M_DirectionsForUseStatement WITHIN mMasLC.MasterLabelContent 
      //:           WHERE mMasLC.M_DirectionsForUseStatement.ID = mSubLC.M_DirectionsForUseStatement.ID 
      {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
             GetIntegerFromAttribute( mi_lTempInteger_2, mSubLC, "M_DirectionsForUseStatement", "ID" );
      lTempInteger_2 = mi_lTempInteger_2.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_DirectionsForUseStatement", "ID", lTempInteger_2, "MasterLabelContent" );
      //:IF RESULT < zCURSOR_SET
      if ( RESULT < zCURSOR_SET )
      { 
         //:IssueError( mSubLC,0,0,"Programming Error 2 in BuildWorkVariables" )
         IssueError( mSubLC, 0, 0, "Programming Error 2 in BuildWorkVariables" );
      } 

      //:END 
      //:FOR EACH mMasLC.M_DirectionsUsageOrdering 
      RESULT = SetCursorFirstEntity( mMasLC, "M_DirectionsUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST mSubLC.M_Usage WITHIN mSubLC.SubregLabelContent 
         //:           WHERE mSubLC.M_Usage.ID = mMasLC.M_DirectionsUsage.ID 
         {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
                   GetIntegerFromAttribute( mi_lTempInteger_3, mMasLC, "M_DirectionsUsage", "ID" );
         lTempInteger_3 = mi_lTempInteger_3.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "M_Usage", "ID", lTempInteger_3, "SubregLabelContent" );
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
      //:SET CURSOR FIRST mMasLC.M_MarketingStatement WITHIN mMasLC.MasterLabelContent 
      //:           WHERE mMasLC.M_MarketingStatement.ID = mSubLC.M_MarketingStatement.ID 
      {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
             GetIntegerFromAttribute( mi_lTempInteger_4, mSubLC, "M_MarketingStatement", "ID" );
      lTempInteger_4 = mi_lTempInteger_4.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( mMasLC, "M_MarketingStatement", "ID", lTempInteger_4, "MasterLabelContent" );
      //:IF RESULT < zCURSOR_SET
      if ( RESULT < zCURSOR_SET )
      { 
         //:IssueError( mSubLC,0,0,"Programming Error 3 in BuildWorkVariables" )
         IssueError( mSubLC, 0, 0, "Programming Error 3 in BuildWorkVariables" );
      } 

      //:END 
      //:FOR EACH mMasLC.M_MarketingUsageOrdering 
      RESULT = SetCursorFirstEntity( mMasLC, "M_MarketingUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST mSubLC.M_Usage WITHIN mSubLC.SubregLabelContent 
         //:           WHERE mSubLC.M_Usage.ID = mMasLC.M_MarketingUsage.ID 
         {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
                   GetIntegerFromAttribute( mi_lTempInteger_5, mMasLC, "M_MarketingUsage", "ID" );
         lTempInteger_5 = mi_lTempInteger_5.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSubLC, "M_Usage", "ID", lTempInteger_5, "SubregLabelContent" );
         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:INCLUDE mSubLC.S_SelectableMarketingUsage FROM mSubLC.S_Usage
            RESULT = IncludeSubobjectFromSubobject( mSubLC, "S_SelectableMarketingUsage", mSubLC, "S_Usage", zPOS_AFTER );
         } 

         RESULT = SetCursorNextEntity( mMasLC, "M_MarketingUsageOrdering", "" );
         //:END
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
         //:IF mSubLC.M_UsageFootnoteUsed EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSubLC, "M_UsageFootnoteUsed" );
         if ( lTempInteger_0 == 0 )
         { 
            //:IF mSubLC.M_UsageFootnoteUsed.ID != ""
            if ( CompareAttributeToString( mSubLC, "M_UsageFootnoteUsed", "ID", "" ) != 0 )
            { 
               //:SET CURSOR FIRST mSubLC.MLC_UsageFootnote WHERE mSubLC.MLC_UsageFootnote.ID = mSubLC.M_UsageFootnoteUsed.ID 
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, mSubLC, "M_UsageFootnoteUsed", "ID" );
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
               //:szCombinedName = szCombinedName + "<sub> (" + szFootnoteNumber + ")</sub>"
                {StringBuilder sb_szCombinedName;
               if ( szCombinedName == null )
                  sb_szCombinedName = new StringBuilder( 32 );
               else
                  sb_szCombinedName = new StringBuilder( szCombinedName );
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, "<sub> (", 1, 0, 101 );
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
                              ZeidonStringConcat( sb_szCombinedName, 1, 0, ")</sub>", 1, 0, 101 );
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

      //:  /* end zDERIVED_GET */
      //:OF   zDERIVED_SET:
      case zDERIVED_SET :
         break ;
   } 


   //:     /* end zDERIVED_SET */
   //:END  /* case */
   return( 0 );
// END
} 



}
