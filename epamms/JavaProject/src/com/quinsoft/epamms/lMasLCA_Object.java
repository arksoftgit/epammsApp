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

    Copyright (c) 2009 - 2017 QuinSoft, Inc.
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

/**
   @author QuinSoft
**/

public class lMasLCA_Object extends VmlObjectOperations
{
   public lMasLCA_Object( View view )
   {
      super( view );
   }


//:DERIVED ATTRIBUTE OPERATION
//:dMasterProductNameNbr( VIEW lMasLCA BASED ON LOD lMasLCA,
//:                       STRING ( 32 ) InternalEntityStructure,
//:                       STRING ( 32 ) InternalAttribStructure,
//:                       SHORT GetOrSetFlag )

//:   STRING ( 1000 ) szString
public int 
olMasLCA_dMasterProductNameNbr( View     lMasLCA,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   String   szString = null;
   int      lTempInteger_0 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:IF lMasLCA.MasterProduct  EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( lMasLCA, "MasterProduct" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = lMasLCA.MasterProduct.Name + " (" +
            //:        lMasLCA.PrimaryRegistrant.EPA_CompanyNumber + "-" +
            //:        lMasLCA.MasterProduct.Number + ")"
            //:ELSE
         } 
         else
         { 
            //:szString = ""
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( lMasLCA,
         //:                   InternalEntityStructure,
         //:                   InternalAttribStructure, szString )
         StoreStringInRecord( lMasLCA, InternalEntityStructure, InternalAttribStructure, szString );
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
   //:dSubregProductNameNbr( VIEW lMasLCA BASED ON LOD lMasLCA,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 1000 ) szString
public int 
olMasLCA_dSubregProductNameNbr( View     lMasLCA,
                                String InternalEntityStructure,
                                String InternalAttribStructure,
                                Integer   GetOrSetFlag )
{
   String   szString = null;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:szString = lMasLCA.SubregProduct.Name
         //:IF lMasLCA.SubregProduct.Number != 0
         if ( CompareAttributeToInteger( lMasLCA, "SubregProduct", "Number", 0 ) != 0 )
         { 
            //:szString = szString + " (" + lMasLCA.SubregProduct.Number + ")"
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( lMasLCA,
         //:                   InternalEntityStructure,
         //:                   InternalAttribStructure, szString )
         StoreStringInRecord( lMasLCA, InternalEntityStructure, InternalAttribStructure, szString );
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



}
