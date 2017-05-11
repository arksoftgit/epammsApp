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

import com.quinsoft.zeidon.zeidonoperations.KZOEP1AA;
import com.quinsoft.zeidon.zeidonoperations.ZDRVROPR;

/**
   @author QuinSoft
**/

public class mSPLDef_Object extends VmlObjectOperations
{
   private final KZOEP1AA m_KZOEP1AA;
   private final ZDRVROPR m_ZDRVROPR;
   public mSPLDef_Object( View view )
   {
      super( view );
      m_KZOEP1AA = new KZOEP1AA( view );
      m_ZDRVROPR = new ZDRVROPR( view );
   }


//:TRANSFORMATION OPERATION
//:GeneratePDF_Label( VIEW mSPLDef BASED ON LOD mSPLDef )

//:   VIEW wWebXfer REGISTERED AS wWebXfer
public int 
omSPLDef_GeneratePDF_Label( View     mSPLDef )
{
   zVIEW    wWebXfer = new zVIEW( );
   int      RESULT = 0;
   //:VIEW mSPLDefPDF BASED ON LOD mSPLDef
   zVIEW    mSPLDefPDF = new zVIEW( );
   //:VIEW mSPLDefContinue BASED ON LOD mSPLDef
   zVIEW    mSPLDefContinue = new zVIEW( );
   //:STRING ( 32000 ) szWriteBuffer
   String   szWriteBuffer = null;
   //:INTEGER lFile
   int      lFile = 0;
   //:INTEGER lControl
   int      lControl = 0;
   //:STRING ( 50 ) szLeadingBlanks
   String   szLeadingBlanks = null;
   //:STRING ( 32 ) szSize
   String   szSize = null;
   //:STRING ( 32 ) szTop
   String   szTop = null;
   //:STRING ( 32 ) szHeight
   String   szHeight = null;
   //:STRING ( 32 ) szWidth
   String   szWidth = null;
   //:STRING ( 32 ) szPageHeight
   String   szPageHeight = null;
   //:STRING ( 32 ) szPageWidth
   String   szPageWidth = null;
   //:STRING ( 32 ) szLeft
   String   szLeft = null;
   //:STRING ( 32 ) szLastSectionType
   String   szLastSectionType = null;
   //:STRING ( 32 ) szVoid
   String   szVoid = null;
   //:STRING ( 2 )  szCount
   String   szCount = null;
   //:STRING ( 40 ) szPanelDottedBorder
   String   szPanelDottedBorder = null;
   //:STRING ( 2 )  szSequenceNumber
   String   szSequenceNumber = null;
   //:STRING ( 50 ) szSectionName
   String   szSectionName = null;
   //:INTEGER       lCount
   int      lCount = 0;
   //:SHORT         nRC
   int      nRC = 0;
   //:DECIMAL       InterPanelSpace
   double  InterPanelSpace = 0.0;
   //:DECIMAL       Left
   double  Left = 0.0;
   //:DECIMAL       Temp
   double  Temp = 0.0;
   //:STRING ( 32 ) szLPLR_Name
   String   szLPLR_Name = null;
   //:STRING ( 64 ) szSystemIniApplName
   String   szSystemIniApplName = null;
   //:STRING ( 64 ) szLabelName
   String   szLabelName = null;
   //:STRING ( 256 ) szDirectory
   String   szDirectory = null;
   //:STRING ( 256 ) szApplication
   String   szApplication = null;
   //:STRING ( 256 ) szXmlName
   String   szXmlName = null;
   //:STRING ( 256 ) szXslName
   String   szXslName = null;
   //:STRING ( 30 ) szDateTime
   String   szDateTime = null;
   //:STRING ( 30 ) szDateTimeDisplay
   String   szDateTimeDisplay = null;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_1 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_2 = 0;
   String   szTempString_2 = null;
   int      lTempInteger_3 = 0;
   double  dTempDecimal_0 = 0.0;
   double  dTempDecimal_1 = 0.0;
   double  dTempDecimal_2 = 0.0;
   double  dTempDecimal_3 = 0.0;
   int      lTempInteger_4 = 0;
   int      lTempInteger_5 = 0;
   int      lTempInteger_6 = 0;
   double  dTempDecimal_4 = 0.0;

   RESULT = GetViewByName( wWebXfer, "wWebXfer", mSPLDef, zLEVEL_TASK );

   //:// Generate a PDF Label from the SPLD.
   //:SysGetDateTime( szDateTime )
    {StringBuilder sb_szDateTime;
   if ( szDateTime == null )
      sb_szDateTime = new StringBuilder( 32 );
   else
      sb_szDateTime = new StringBuilder( szDateTime );
      m_KZOEP1AA.SysGetDateTime( sb_szDateTime );
   szDateTime = sb_szDateTime.toString( );}
   //:mSPLDef.SubregPhysicalLabelDef.wDateTime = szDateTime
   SetAttributeFromString( mSPLDef, "SubregPhysicalLabelDef", "wDateTime", szDateTime );

   //:// Delete any existing DisplaySection entries.
   //:FOR EACH mSPLDef.DisplaySection
   RESULT = SetCursorFirstEntity( mSPLDef, "DisplaySection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mSPLDef.DisplaySection NONE
      RESULT = DeleteEntity( mSPLDef, "DisplaySection", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mSPLDef, "DisplaySection", "" );
   } 

   //:END

   //:// Open the File
   //:// SfGetApplicationForSubtask( szLPLR_Name, mSPLDef )
   //:// szSystemIniApplName = "[App." + szLPLR_Name + "]"
   //:// SysReadZeidonIni( -1, szSystemIniApplName, "WebDirectory", szDirectory )
   //:// SysConvertEnvironmentString( szDirectory, szDirectory )
   //:// szDirectory = "C:/Program Files/Apache Group/tomcat 7.0/webapps/ROOT/epamms/"

   //:SysGetEnvVar( szDirectory, "CATALINA_HOME", 256 )
   {StringBuilder sb_szDirectory;
   if ( szDirectory == null )
      sb_szDirectory = new StringBuilder( 32 );
   else
      sb_szDirectory = new StringBuilder( szDirectory );
       m_KZOEP1AA.SysGetEnvVar( sb_szDirectory, "CATALINA_HOME", 256 );
   szDirectory = sb_szDirectory.toString( );}
   //:// SysAppendcDirSep( szDirectory )
   //:SysConvertEnvironmentString( szDirectory, szDirectory )
   {StringBuilder sb_szDirectory;
   if ( szDirectory == null )
      sb_szDirectory = new StringBuilder( 32 );
   else
      sb_szDirectory = new StringBuilder( szDirectory );
       m_KZOEP1AA.SysConvertEnvironmentString( sb_szDirectory, szDirectory );
   szDirectory = sb_szDirectory.toString( );}
   //:szDirectory = szDirectory + "/webapps/ROOT/"
    {StringBuilder sb_szDirectory;
   if ( szDirectory == null )
      sb_szDirectory = new StringBuilder( 32 );
   else
      sb_szDirectory = new StringBuilder( szDirectory );
      ZeidonStringConcat( sb_szDirectory, 1, 0, "/webapps/ROOT/", 1, 0, 257 );
   szDirectory = sb_szDirectory.toString( );}
   //:szApplication = mSPLDef.SubregOrganization.LoginName
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szApplication;
   if ( szApplication == null )
      sb_szApplication = new StringBuilder( 32 );
   else
      sb_szApplication = new StringBuilder( szApplication );
       GetVariableFromAttribute( sb_szApplication, mi_lTempInteger_0, 'S', 257, mSPLDef, "SubregOrganization", "LoginName", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szApplication = sb_szApplication.toString( );}
   //:RemoveInvalidCharsFromFilename( szApplication )
   try
   {
       {StringBuilder sb_szApplication;
   if ( szApplication == null )
      sb_szApplication = new StringBuilder( 32 );
   else
      sb_szApplication = new StringBuilder( szApplication );
       RemoveInvalidCharsFromFilename( sb_szApplication );
   szApplication = sb_szApplication.toString( );}
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szLabelName = mSPLDef.SubregProduct.Name + "." + mSPLDef.SubregLabelContent.Version + "." + mSPLDef.SubregPhysicalLabelDef.Name + "." + wWebXfer.Root.LoginName
   {StringBuilder sb_szLabelName;
   if ( szLabelName == null )
      sb_szLabelName = new StringBuilder( 32 );
   else
      sb_szLabelName = new StringBuilder( szLabelName );
       GetStringFromAttribute( sb_szLabelName, mSPLDef, "SubregProduct", "Name" );
   szLabelName = sb_szLabelName.toString( );}
    {StringBuilder sb_szLabelName;
   if ( szLabelName == null )
      sb_szLabelName = new StringBuilder( 32 );
   else
      sb_szLabelName = new StringBuilder( szLabelName );
      ZeidonStringConcat( sb_szLabelName, 1, 0, ".", 1, 0, 65 );
   szLabelName = sb_szLabelName.toString( );}
   {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
   StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 255, mSPLDef, "SubregLabelContent", "Version", "", 0 );
   lTempInteger_1 = mi_lTempInteger_1.intValue( );
   szTempString_0 = sb_szTempString_0.toString( );}
    {StringBuilder sb_szLabelName;
   if ( szLabelName == null )
      sb_szLabelName = new StringBuilder( 32 );
   else
      sb_szLabelName = new StringBuilder( szLabelName );
      ZeidonStringConcat( sb_szLabelName, 1, 0, szTempString_0, 1, 0, 65 );
   szLabelName = sb_szLabelName.toString( );}
    {StringBuilder sb_szLabelName;
   if ( szLabelName == null )
      sb_szLabelName = new StringBuilder( 32 );
   else
      sb_szLabelName = new StringBuilder( szLabelName );
      ZeidonStringConcat( sb_szLabelName, 1, 0, ".", 1, 0, 65 );
   szLabelName = sb_szLabelName.toString( );}
   {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
   StringBuilder sb_szTempString_1;
   if ( szTempString_1 == null )
      sb_szTempString_1 = new StringBuilder( 32 );
   else
      sb_szTempString_1 = new StringBuilder( szTempString_1 );
       GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_2, 'S', 255, mSPLDef, "SubregPhysicalLabelDef", "Name", "", 0 );
   lTempInteger_2 = mi_lTempInteger_2.intValue( );
   szTempString_1 = sb_szTempString_1.toString( );}
    {StringBuilder sb_szLabelName;
   if ( szLabelName == null )
      sb_szLabelName = new StringBuilder( 32 );
   else
      sb_szLabelName = new StringBuilder( szLabelName );
      ZeidonStringConcat( sb_szLabelName, 1, 0, szTempString_1, 1, 0, 65 );
   szLabelName = sb_szLabelName.toString( );}
    {StringBuilder sb_szLabelName;
   if ( szLabelName == null )
      sb_szLabelName = new StringBuilder( 32 );
   else
      sb_szLabelName = new StringBuilder( szLabelName );
      ZeidonStringConcat( sb_szLabelName, 1, 0, ".", 1, 0, 65 );
   szLabelName = sb_szLabelName.toString( );}
   {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
   StringBuilder sb_szTempString_2;
   if ( szTempString_2 == null )
      sb_szTempString_2 = new StringBuilder( 32 );
   else
      sb_szTempString_2 = new StringBuilder( szTempString_2 );
       GetVariableFromAttribute( sb_szTempString_2, mi_lTempInteger_3, 'S', 129, wWebXfer, "Root", "LoginName", "", 0 );
   lTempInteger_3 = mi_lTempInteger_3.intValue( );
   szTempString_2 = sb_szTempString_2.toString( );}
    {StringBuilder sb_szLabelName;
   if ( szLabelName == null )
      sb_szLabelName = new StringBuilder( 32 );
   else
      sb_szLabelName = new StringBuilder( szLabelName );
      ZeidonStringConcat( sb_szLabelName, 1, 0, szTempString_2, 1, 0, 65 );
   szLabelName = sb_szLabelName.toString( );}
   //:RemoveInvalidCharsFromFilename( szLabelName )
   try
   {
       {StringBuilder sb_szLabelName;
   if ( szLabelName == null )
      sb_szLabelName = new StringBuilder( 32 );
   else
      sb_szLabelName = new StringBuilder( szLabelName );
       RemoveInvalidCharsFromFilename( sb_szLabelName );
   szLabelName = sb_szLabelName.toString( );}
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szXmlName = szDirectory + szApplication + "/xml/"
    {StringBuilder sb_szXmlName;
   if ( szXmlName == null )
      sb_szXmlName = new StringBuilder( 32 );
   else
      sb_szXmlName = new StringBuilder( szXmlName );
      ZeidonStringCopy( sb_szXmlName, 1, 0, szDirectory, 1, 0, 257 );
   szXmlName = sb_szXmlName.toString( );}
    {StringBuilder sb_szXmlName;
   if ( szXmlName == null )
      sb_szXmlName = new StringBuilder( 32 );
   else
      sb_szXmlName = new StringBuilder( szXmlName );
      ZeidonStringConcat( sb_szXmlName, 1, 0, szApplication, 1, 0, 257 );
   szXmlName = sb_szXmlName.toString( );}
    {StringBuilder sb_szXmlName;
   if ( szXmlName == null )
      sb_szXmlName = new StringBuilder( 32 );
   else
      sb_szXmlName = new StringBuilder( szXmlName );
      ZeidonStringConcat( sb_szXmlName, 1, 0, "/xml/", 1, 0, 257 );
   szXmlName = sb_szXmlName.toString( );}
   //:szXslName = szDirectory + szApplication + "/xsl/"
    {StringBuilder sb_szXslName;
   if ( szXslName == null )
      sb_szXslName = new StringBuilder( 32 );
   else
      sb_szXslName = new StringBuilder( szXslName );
      ZeidonStringCopy( sb_szXslName, 1, 0, szDirectory, 1, 0, 257 );
   szXslName = sb_szXslName.toString( );}
    {StringBuilder sb_szXslName;
   if ( szXslName == null )
      sb_szXslName = new StringBuilder( 32 );
   else
      sb_szXslName = new StringBuilder( szXslName );
      ZeidonStringConcat( sb_szXslName, 1, 0, szApplication, 1, 0, 257 );
   szXslName = sb_szXslName.toString( );}
    {StringBuilder sb_szXslName;
   if ( szXslName == null )
      sb_szXslName = new StringBuilder( 32 );
   else
      sb_szXslName = new StringBuilder( szXslName );
      ZeidonStringConcat( sb_szXslName, 1, 0, "/xsl/", 1, 0, 257 );
   szXslName = sb_szXslName.toString( );}
   //:SysValidDirOrFile( szXmlName, 1, 1, 256 )
   SysValidDirOrFile( szXmlName, 1, 1, 256 );
   //:SysValidDirOrFile( szXslName, 1, 1, 256 )
   SysValidDirOrFile( szXslName, 1, 1, 256 );
   //:szXmlName = szXmlName + szLabelName + ".xml"
    {StringBuilder sb_szXmlName;
   if ( szXmlName == null )
      sb_szXmlName = new StringBuilder( 32 );
   else
      sb_szXmlName = new StringBuilder( szXmlName );
      ZeidonStringConcat( sb_szXmlName, 1, 0, szLabelName, 1, 0, 257 );
   szXmlName = sb_szXmlName.toString( );}
    {StringBuilder sb_szXmlName;
   if ( szXmlName == null )
      sb_szXmlName = new StringBuilder( 32 );
   else
      sb_szXmlName = new StringBuilder( szXmlName );
      ZeidonStringConcat( sb_szXmlName, 1, 0, ".xml", 1, 0, 257 );
   szXmlName = sb_szXmlName.toString( );}
   //:szXslName = szXslName + szLabelName + ".xsl"
    {StringBuilder sb_szXslName;
   if ( szXslName == null )
      sb_szXslName = new StringBuilder( 32 );
   else
      sb_szXslName = new StringBuilder( szXslName );
      ZeidonStringConcat( sb_szXslName, 1, 0, szLabelName, 1, 0, 257 );
   szXslName = sb_szXslName.toString( );}
    {StringBuilder sb_szXslName;
   if ( szXslName == null )
      sb_szXslName = new StringBuilder( 32 );
   else
      sb_szXslName = new StringBuilder( szXslName );
      ZeidonStringConcat( sb_szXslName, 1, 0, ".xsl", 1, 0, 257 );
   szXslName = sb_szXslName.toString( );}
   //:TraceLineS( "mSPLDef Output Xml Filename: ", szXmlName )
   TraceLineS( "mSPLDef Output Xml Filename: ", szXmlName );
   //:TraceLineS( "mSPLDef Output Xsl Filename: ", szXslName )
   TraceLineS( "mSPLDef Output Xsl Filename: ", szXslName );
   //:lFile = SysOpenFile( mSPLDef, szXslName, COREFILE_WRITE )
   try
   {
       lFile = m_KZOEP1AA.SysOpenFile( mSPLDef, szXslName, COREFILE_WRITE );
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:IF lFile < 0
   if ( lFile < 0 )
   { 
      //:MessageSend( mSPLDef, "", "Generate Label",
      //:             "Error opening output file.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( mSPLDef, "", "Generate Label", "Error opening output file.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END
   //:// TraceLineS( "##### After open: ", szXslName )

   //:// Put out XSL header data.
   //:szWriteBuffer = "<?xml version=@1.0@ encoding='iso-8859-1'?>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "<?xml version=@1.0@ encoding='iso-8859-1'?>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "@", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "@", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:GetStringFromAttributeByContext( szDateTimeDisplay, mSPLDef, "SubregPhysicalLabelDef", "wDateTime", "YYYY/MM/DD HH:MM:SS.S AM", 30 )
   {StringBuilder sb_szDateTimeDisplay;
   if ( szDateTimeDisplay == null )
      sb_szDateTimeDisplay = new StringBuilder( 32 );
   else
      sb_szDateTimeDisplay = new StringBuilder( szDateTimeDisplay );
       GetStringFromAttributeByContext( sb_szDateTimeDisplay, mSPLDef, "SubregPhysicalLabelDef", "wDateTime", "YYYY/MM/DD HH:MM:SS.S AM", 30 );
   szDateTimeDisplay = sb_szDateTimeDisplay.toString( );}
   //:szWriteBuffer = "<!-- Output created by ePamms   " + szDateTimeDisplay + " -->"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "<!-- Output created by ePamms   ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDateTimeDisplay, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " -->", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = "<xsl:stylesheet version=^1.0^"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "<xsl:stylesheet version=^1.0^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "   xmlns:xsl=^http://www.w3.org/1999/XSL/Transform^"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   xmlns:xsl=^http://www.w3.org/1999/XSL/Transform^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "   xmlns:fo=^http://www.w3.org/1999/XSL/Format^"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   xmlns:fo=^http://www.w3.org/1999/XSL/Format^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "   xmlns:fox=^http://xml.apache.org/fop/extensions^"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   xmlns:fox=^http://xml.apache.org/fop/extensions^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "   xmlns:exslt=^http://exslt.org/common^"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   xmlns:exslt=^http://exslt.org/common^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "   xmlns:exsl=^http://exslt.org/common^"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   xmlns:exsl=^http://exslt.org/common^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "   extension-element-prefixes=^exsl^"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   extension-element-prefixes=^exsl^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "   xmlns:msxsl=^urn:schemas-microsoft-com:xslt^"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   xmlns:msxsl=^urn:schemas-microsoft-com:xslt^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "   exclude-result-prefixes=^msxsl^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   exclude-result-prefixes=^msxsl^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = ""
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "   <xsl:output method=^xml^ indent=^yes^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   <xsl:output method=^xml^ indent=^yes^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Beginning of XSL Label Definition
   //:szWriteBuffer = "   <xsl:template match=^/zOI^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   <xsl:template match=^/zOI^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "      <fo:root>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "      <fo:root>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "         <fo:layout-master-set>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "         <fo:layout-master-set>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Page
   //:Temp = mSPLDef.LLD_Page.Height + 2.0  // add 1-inch border
   {MutableDouble md_dTempDecimal_0 = new MutableDouble( dTempDecimal_0 );
       GetDecimalFromAttribute( md_dTempDecimal_0, mSPLDef, "LLD_Page", "Height" );
   dTempDecimal_0 = md_dTempDecimal_0.doubleValue( );}
   Temp = dTempDecimal_0 + 2.0;
   //:szPageHeight = Temp
    {StringBuilder sb_szPageHeight;
   if ( szPageHeight == null )
      sb_szPageHeight = new StringBuilder( 32 );
   else
      sb_szPageHeight = new StringBuilder( szPageHeight );
      ZeidonStringConvertFromNumber( sb_szPageHeight, 1, 0, 32, 0, Temp, "D" );
   szPageHeight = sb_szPageHeight.toString( );}
   //:Temp = mSPLDef.LLD_Page.Width + 2.0 // add 1-inch border
   {MutableDouble md_dTempDecimal_1 = new MutableDouble( dTempDecimal_1 );
       GetDecimalFromAttribute( md_dTempDecimal_1, mSPLDef, "LLD_Page", "Width" );
   dTempDecimal_1 = md_dTempDecimal_1.doubleValue( );}
   Temp = dTempDecimal_1 + 2.0;
   //:szPageWidth  = Temp
    {StringBuilder sb_szPageWidth;
   if ( szPageWidth == null )
      sb_szPageWidth = new StringBuilder( 32 );
   else
      sb_szPageWidth = new StringBuilder( szPageWidth );
      ZeidonStringConvertFromNumber( sb_szPageWidth, 1, 0, 32, 0, Temp, "D" );
   szPageWidth = sb_szPageWidth.toString( );}
   //:szWriteBuffer = "            <fo:simple-page-master master-name=^p1^ page-width=^" + szPageWidth + "in^ page-height=^" + szPageHeight + "in^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "            <fo:simple-page-master master-name=^p1^ page-width=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szPageWidth, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ page-height=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szPageHeight, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = "               <fo:region-body region-name=^xsl-region-body^ margin=^0.2in^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               <fo:region-body region-name=^xsl-region-body^ margin=^0.2in^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "            </fo:simple-page-master>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "            </fo:simple-page-master>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "         </fo:layout-master-set>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "         </fo:layout-master-set>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "         <fo:page-sequence master-reference=^p1^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "         <fo:page-sequence master-reference=^p1^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "            <fo:flow flow-name=^xsl-region-body^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "            <fo:flow flow-name=^xsl-region-body^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Generate unique XML name for each Marketing Section, which contains a sequence number suffix.
   //:lCount = 0
   lCount = 0;
   //:FOR EACH mSPLDef.SPLD_MarketingSection
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:lCount = lCount + 1
      lCount = lCount + 1;
      //:szSequenceNumber = lCount
       {StringBuilder sb_szSequenceNumber;
      if ( szSequenceNumber == null )
         sb_szSequenceNumber = new StringBuilder( 32 );
      else
         sb_szSequenceNumber = new StringBuilder( szSequenceNumber );
            ZeidonStringConvertFromNumber( sb_szSequenceNumber, 1, 0, 2, lCount, (double) 0.0, "I" );
      szSequenceNumber = sb_szSequenceNumber.toString( );}
      //:szSectionName = "SPLD_MarketingSection" + szSequenceNumber
       {StringBuilder sb_szSectionName;
      if ( szSectionName == null )
         sb_szSectionName = new StringBuilder( 32 );
      else
         sb_szSectionName = new StringBuilder( szSectionName );
            ZeidonStringCopy( sb_szSectionName, 1, 0, "SPLD_MarketingSection", 1, 0, 51 );
      szSectionName = sb_szSectionName.toString( );}
       {StringBuilder sb_szSectionName;
      if ( szSectionName == null )
         sb_szSectionName = new StringBuilder( 32 );
      else
         sb_szSectionName = new StringBuilder( szSectionName );
            ZeidonStringConcat( sb_szSectionName, 1, 0, szSequenceNumber, 1, 0, 51 );
      szSectionName = sb_szSectionName.toString( );}
      //:mSPLDef.SPLD_MarketingSection.wXML_MarketingName = szSectionName
      SetAttributeFromString( mSPLDef, "SPLD_MarketingSection", "wXML_MarketingName", szSectionName );
      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingSection", "" );
   } 

   //:END
   //:mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount = 0
   SetAttributeFromInteger( mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount", 0 );

   //:// Generate printer location icons.
   //:FormatPrintIcons( mSPLDef, lFile, szWriteBuffer )
   omSPLDef_FormatPrintIcons( mSPLDef, lFile, szWriteBuffer );

   //:// Compute the Top Position values for each Block and SubBlock.
   //:ComputeTopPositions( mSPLDef )
   omSPLDef_ComputeTopPositions( mSPLDef );

   //:// Reset the wContinuedFromTag for each Block and SubBlock.
   //:// TraverseBlocks( mSPLDef )  May use when we include "continuation" blocks

   //:// Loop through each PANEL, creating a Panel with Block containers.
   //:lCount          = 0
   lCount = 0;
   //:Left            = 1.0
   Left = 1.0;
   //:InterPanelSpace = 0.75
   InterPanelSpace = 0.75;
   //:IF mSPLDef.SubregPhysicalLabelDef.wFormatWithDottedBorders = "Y"
   if ( CompareAttributeToString( mSPLDef, "SubregPhysicalLabelDef", "wFormatWithDottedBorders", "Y" ) == 0 )
   { 
      //:// TraceLineS( "Generate PDF Label with borders", "" )
      //:szPanelDottedBorder = " border=^1.0pt dotted green^"
       {StringBuilder sb_szPanelDottedBorder;
      if ( szPanelDottedBorder == null )
         sb_szPanelDottedBorder = new StringBuilder( 32 );
      else
         sb_szPanelDottedBorder = new StringBuilder( szPanelDottedBorder );
            ZeidonStringCopy( sb_szPanelDottedBorder, 1, 0, " border=^1.0pt dotted green^", 1, 0, 41 );
      szPanelDottedBorder = sb_szPanelDottedBorder.toString( );}
      //:ELSE
   } 
   else
   { 
      //:// TraceLineS( "Generate PDF Label without borders", "" )
      //:szPanelDottedBorder = ""
       {StringBuilder sb_szPanelDottedBorder;
      if ( szPanelDottedBorder == null )
         sb_szPanelDottedBorder = new StringBuilder( 32 );
      else
         sb_szPanelDottedBorder = new StringBuilder( szPanelDottedBorder );
            ZeidonStringCopy( sb_szPanelDottedBorder, 1, 0, "", 1, 0, 41 );
      szPanelDottedBorder = sb_szPanelDottedBorder.toString( );}
   } 

   //:END
   //:FOR EACH mSPLDef.LLD_Panel
   RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Panel", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 

      //:lCount = lCount + 1
      lCount = lCount + 1;
      //:szCount = lCount
       {StringBuilder sb_szCount;
      if ( szCount == null )
         sb_szCount = new StringBuilder( 32 );
      else
         sb_szCount = new StringBuilder( szCount );
            ZeidonStringConvertFromNumber( sb_szCount, 1, 0, 2, lCount, (double) 0.0, "I" );
      szCount = sb_szCount.toString( );}
      //:szLeft = Left
       {StringBuilder sb_szLeft;
      if ( szLeft == null )
         sb_szLeft = new StringBuilder( 32 );
      else
         sb_szLeft = new StringBuilder( szLeft );
            ZeidonStringConvertFromNumber( sb_szLeft, 1, 0, 32, 0, Left, "D" );
      szLeft = sb_szLeft.toString( );}

      //:// Panel Container
      //://szTop        = "1.0"
      //:Temp = mSPLDef.LLD_Panel.Top + 1.0
      {MutableDouble md_dTempDecimal_2 = new MutableDouble( dTempDecimal_2 );
             GetDecimalFromAttribute( md_dTempDecimal_2, mSPLDef, "LLD_Panel", "Top" );
      dTempDecimal_2 = md_dTempDecimal_2.doubleValue( );}
      Temp = dTempDecimal_2 + 1.0;
      //:szTop = Temp
       {StringBuilder sb_szTop;
      if ( szTop == null )
         sb_szTop = new StringBuilder( 32 );
      else
         sb_szTop = new StringBuilder( szTop );
            ZeidonStringConvertFromNumber( sb_szTop, 1, 0, 32, 0, Temp, "D" );
      szTop = sb_szTop.toString( );}
      //:Temp = mSPLDef.LLD_Panel.Left + 1.0
      {MutableDouble md_dTempDecimal_3 = new MutableDouble( dTempDecimal_3 );
             GetDecimalFromAttribute( md_dTempDecimal_3, mSPLDef, "LLD_Panel", "Left" );
      dTempDecimal_3 = md_dTempDecimal_3.doubleValue( );}
      Temp = dTempDecimal_3 + 1.0;
      //:szLeft = Temp
       {StringBuilder sb_szLeft;
      if ( szLeft == null )
         sb_szLeft = new StringBuilder( 32 );
      else
         sb_szLeft = new StringBuilder( szLeft );
            ZeidonStringConvertFromNumber( sb_szLeft, 1, 0, 32, 0, Temp, "D" );
      szLeft = sb_szLeft.toString( );}
      //:szHeight     = mSPLDef.LLD_Panel.Height
      {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
      StringBuilder sb_szHeight;
      if ( szHeight == null )
         sb_szHeight = new StringBuilder( 32 );
      else
         sb_szHeight = new StringBuilder( szHeight );
             GetVariableFromAttribute( sb_szHeight, mi_lTempInteger_4, 'S', 33, mSPLDef, "LLD_Panel", "Height", "", 0 );
      lTempInteger_4 = mi_lTempInteger_4.intValue( );
      szHeight = sb_szHeight.toString( );}
      //:szWidth      = mSPLDef.LLD_Panel.Width
      {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
      StringBuilder sb_szWidth;
      if ( szWidth == null )
         sb_szWidth = new StringBuilder( 32 );
      else
         sb_szWidth = new StringBuilder( szWidth );
             GetVariableFromAttribute( sb_szWidth, mi_lTempInteger_5, 'S', 33, mSPLDef, "LLD_Panel", "Width", "", 0 );
      lTempInteger_5 = mi_lTempInteger_5.intValue( );
      szWidth = sb_szWidth.toString( );}
      //:szWriteBuffer = "               <fo:block-container position=^absolute^ top=^" + szTop + "in^ left=^" + szLeft +
      //:                "in^ height=^" + szHeight + "in^ width=^" + szWidth + "in^" + szPanelDottedBorder + ">"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               <fo:block-container position=^absolute^ top=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTop, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ left=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeft, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ height=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szHeight, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ width=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szWidth, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szPanelDottedBorder, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, ">", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
      //:szWriteBuffer = ""
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:// Panel Number
      //:szWriteBuffer = "                  <!-- Panel Number " + szCount
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  <!-- Panel Number ", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szCount, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
      //:szWriteBuffer = "                  <fo:block-container position=^absolute^ top=^-0.2in^ left=^-0.2in^>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  <fo:block-container position=^absolute^ top=^-0.2in^ left=^-0.2in^>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
      //:szWriteBuffer = "                     <fo:block text-align=^left^>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     <fo:block text-align=^left^>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
      //:szWriteBuffer = "                        " + szCount
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                        ", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szCount, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
      //:szWriteBuffer = "                     </fo:block>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     </fo:block>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
      //:szWriteBuffer = "                  </fo:block-container>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  </fo:block-container>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
      //:szWriteBuffer = "                  -->"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  -->", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
      //:szWriteBuffer = ""
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:IF mSPLDef.LLD_Block EXISTS
      lTempInteger_6 = CheckExistenceOfEntity( mSPLDef, "LLD_Block" );
      if ( lTempInteger_6 == 0 )
      { 

         //:// Process each Block within the Panel.
         //:CreateViewFromView( mSPLDefPDF, mSPLDef )
         CreateViewFromView( mSPLDefPDF, mSPLDef );
         //:CreateViewFromView( mSPLDefContinue, mSPLDef )
         CreateViewFromView( mSPLDefContinue, mSPLDef );
         //:NAME VIEW mSPLDefPDF "mSPLDefPDF"
         SetNameForView( mSPLDefPDF, "mSPLDefPDF", null, zLEVEL_TASK );
         //://NAME VIEW mSPLDefContinue "mSPLDefContinue"
         //://NAME VIEW mSPLDef "mSPLDef"

         //:// Top call to ProcessPDF_Blocks <<=====================
         //:szLeadingBlanks = "               "
          {StringBuilder sb_szLeadingBlanks;
         if ( szLeadingBlanks == null )
            sb_szLeadingBlanks = new StringBuilder( 32 );
         else
            sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
                  ZeidonStringCopy( sb_szLeadingBlanks, 1, 0, "               ", 1, 0, 51 );
         szLeadingBlanks = sb_szLeadingBlanks.toString( );}
         //:nRC = ProcessPDF_Blocks( mSPLDef, mSPLDefPDF, mSPLDefContinue, lFile, szLeadingBlanks, szWriteBuffer )
         nRC = omSPLDef_ProcessPDF_Blocks( mSPLDef, mSPLDefPDF, mSPLDefContinue, lFile, szLeadingBlanks, szWriteBuffer );
         //:DropView( mSPLDefContinue )
         DropView( mSPLDefContinue );
         //:DropView( mSPLDefPDF )
         DropView( mSPLDefPDF );
         //:IF nRC = 2
         if ( nRC == 2 )
         { 
            //:RETURN 2
            if(8==8)return( 2 );
         } 

         //:END
         //:ELSE
      } 
      else
      { 
         //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
         try
         {
             {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         };
         }
         catch ( Exception e )
         {
            throw ZeidonException.wrapException( e );
         }
         //:szWriteBuffer = "                  <fo:block-container position=^absolute^ top=^-0.2in^ left=^-0.2in^>"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  <fo:block-container position=^absolute^ top=^-0.2in^ left=^-0.2in^>", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
         try
         {
             {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         };
         }
         catch ( Exception e )
         {
            throw ZeidonException.wrapException( e );
         }
         //:szWriteBuffer = "                     <fo:block text-align=^left^>"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     <fo:block text-align=^left^>", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
         try
         {
             {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         };
         }
         catch ( Exception e )
         {
            throw ZeidonException.wrapException( e );
         }
         //:szWriteBuffer = "      Empty Panel"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "      Empty Panel", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
         try
         {
             {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         };
         }
         catch ( Exception e )
         {
            throw ZeidonException.wrapException( e );
         }
         //:szWriteBuffer = "                     </fo:block>"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     </fo:block>", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
         try
         {
             {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         };
         }
         catch ( Exception e )
         {
            throw ZeidonException.wrapException( e );
         }
         //:szWriteBuffer = "                  </fo:block-container>"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  </fo:block-container>", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
         try
         {
             {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         };
         }
         catch ( Exception e )
         {
            throw ZeidonException.wrapException( e );
         }
         //:szWriteBuffer = ""
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
         try
         {
             {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         };
         }
         catch ( Exception e )
         {
            throw ZeidonException.wrapException( e );
         }
      } 

      //:END

      //:// Close Panel Container.
      //:szWriteBuffer = "               </fo:block-container>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               </fo:block-container>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:// Increment Left position for next Panel.
      //:Left = Left + InterPanelSpace + mSPLDef.LLD_Panel.Width
      {MutableDouble md_dTempDecimal_4 = new MutableDouble( dTempDecimal_4 );
             GetDecimalFromAttribute( md_dTempDecimal_4, mSPLDef, "LLD_Panel", "Width" );
      dTempDecimal_4 = md_dTempDecimal_4.doubleValue( );}
      Left = Left + InterPanelSpace + dTempDecimal_4;
      RESULT = SetCursorNextEntity( mSPLDef, "LLD_Panel", "" );
   } 


   //:END

   //:// Close XSL body.
   //:szWriteBuffer = "            </fo:flow>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "            </fo:flow>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "         </fo:page-sequence>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "         </fo:page-sequence>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "      </fo:root>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "      </fo:root>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "   </xsl:template>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   </xsl:template>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = ""
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Sub Template.
   //:szWriteBuffer = "   <xsl:template match=^sub^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   <xsl:template match=^sub^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "      <fo:inline vertical-align=^sub^ font-size=^75%^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "      <fo:inline vertical-align=^sub^ font-size=^75%^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "         <xsl:apply-templates select=^*||text()^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "         <xsl:apply-templates select=^*|text()^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "      </fo:inline>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "      </fo:inline>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "   </xsl:template>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   </xsl:template>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Bold Template.
   //:szWriteBuffer = "   <xsl:template match=^bold^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   <xsl:template match=^bold^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "      <fo:inline font-weight=^bold^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "      <fo:inline font-weight=^bold^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "         <xsl:apply-templates select=^*||text()^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "         <xsl:apply-templates select=^*|text()^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "      </fo:inline>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "      </fo:inline>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "   </xsl:template>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "   </xsl:template>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Conclude XSL.
   //:szWriteBuffer = ""
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "</xsl:stylesheet>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "</xsl:stylesheet>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }


   //:// Close the XSL file.
   //:SysCloseFile( mSPLDef, lFile, 0 )
   try
   {
       m_KZOEP1AA.SysCloseFile( mSPLDef, lFile, null );
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Generate XML. We do this at the end because the process above built data (e.g.  wkDisplayText attributes) in the mSPLDef object instance.
   //:// szWriteBuffer = "c:\lplr\epamms\xsl\TestLabel.xml"
   //:// CommitOI_ToXML_File( mSPLDef, szWriteBuffer, 0 )
   //:TraceLineS( "Output Xml Directory/File Name: ", szXmlName )
   TraceLineS( "Output Xml Directory/File Name: ", szXmlName );
   //:GenerateXML_File( mSPLDef, "SubregPhysicalLabelDef", szXmlName )
   omSPLDef_GenerateXML_File( mSPLDef, "SubregPhysicalLabelDef", szXmlName );
   return( 0 );
// END
} 


//:LOCAL OPERATION
//:AddBlockAttribute( VIEW mSPLDefBlock BASED ON LOD mSPLDef, STRING (33) strAttribute, STRING (4096) szDisplayMsg )
//:   STRING ( 256 ) szAttributeValue
private int 
omSPLDef_AddBlockAttribute( View     mSPLDefBlock,
                            String   strAttribute,
                            StringBuilder   szDisplayMsg )
{
   String   szAttributeValue = null;


   //:GetStringFromAttribute( szAttributeValue, mSPLDefBlock, "LLD_Block", strAttribute )
   {StringBuilder sb_szAttributeValue;
   if ( szAttributeValue == null )
      sb_szAttributeValue = new StringBuilder( 32 );
   else
      sb_szAttributeValue = new StringBuilder( szAttributeValue );
       GetStringFromAttribute( sb_szAttributeValue, mSPLDefBlock, "LLD_Block", strAttribute );
   szAttributeValue = sb_szAttributeValue.toString( );}
   //:// TraceLineS( "AddBlockAttribute: ", szAttributeValue )
   //:IF szAttributeValue != ""
   if ( ZeidonStringCompare( szAttributeValue, 1, 0, "", 1, 0, 257 ) != 0 )
   { 
      //:szDisplayMsg = szDisplayMsg + "  " + strAttribute + ": " + szAttributeValue
      ZeidonStringConcat( szDisplayMsg, 1, 0, "  ", 1, 0, 4097 );
      ZeidonStringConcat( szDisplayMsg, 1, 0, strAttribute, 1, 0, 4097 );
      ZeidonStringConcat( szDisplayMsg, 1, 0, ": ", 1, 0, 4097 );
      ZeidonStringConcat( szDisplayMsg, 1, 0, szAttributeValue, 1, 0, 4097 );
   } 

   //:END
   return( 0 );
// END
} 


//:LOCAL OPERATION
//:DisplayBlockAttributes( VIEW mSPLDefBlock BASED ON LOD mSPLDef, INTEGER bAll )

//:   STRING ( 4096 ) szDisplayMsg
private int 
omSPLDef_DisplayBlockAttributes( View     mSPLDefBlock,
                                 int      bAll )
{
   String   szDisplayMsg = null;
   //:INTEGER lMinLth
   int      lMinLth = 0;
   //:INTEGER lLth
   int      lLth = 0;


   //:szDisplayMsg = " --- Block"
    {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
      ZeidonStringCopy( sb_szDisplayMsg, 1, 0, " --- Block", 1, 0, 4097 );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "ID", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "ID", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "Top", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "Top", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "Left", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "Left", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "Height", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "Height", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "Width", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "Width", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}

   //:lMinLth = zstrlen( szDisplayMsg )
   lMinLth = zstrlen( szDisplayMsg );

   //:AddBlockAttribute( mSPLDefBlock, "Tag", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "Tag", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "Name", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "Name", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "BlockTitle", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "BlockTitle", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "LLD_SectionType", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "LLD_SectionType", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "LLD_ColumnListType", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "LLD_ColumnListType", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "ContinuationBlockFlag", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "ContinuationBlockFlag", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "ImageName", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "ImageName", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "TextColor", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "TextColor", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "TextColorOverride", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "TextColorOverride", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "BackgroundColor", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "BackgroundColor", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "BackgroundColorOverride", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "BackgroundColorOverride", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "BorderColor", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "BorderColor", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "BorderColorOverride", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "BorderColorOverride", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "BorderStyle", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "BorderStyle", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "BorderWidth", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "BorderWidth", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "FontFamily", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "FontFamily", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "FontSize", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "FontSize", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "FontWeight", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "FontWeight", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "Margin", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "Margin", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "MarginTop", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "MarginTop", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "MarginLeft", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "MarginLeft", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "MarginBottom", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "MarginBottom", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "MarginRight", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "MarginRight", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "MarginOverride", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "MarginOverride", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "Border", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "Border", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "BorderTop", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "BorderTop", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "BorderBottom", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "BorderBottom", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "BorderLeft", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "BorderLeft", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "BorderRight", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "BorderRight", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "BorderOverride", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "BorderOverride", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "Padding", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "Padding", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "PaddingTop", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "PaddingTop", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "PaddingBottom", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "PaddingBottom", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "PaddingLeft", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "PaddingLeft", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "PaddingRight", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "PaddingRight", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "PaddingOverride", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "PaddingOverride", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "TitlePosition", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "TitlePosition", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "CapitalizeTitleTextFlag", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "CapitalizeTitleTextFlag", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "TextAlign", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "TextAlign", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "TextLineHeight", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "TextLineHeight", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "TextLetterSpace", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "TextLetterSpace", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:// AddBlockAttribute( mSPLDefBlock, "Depth", szDisplayMsg )
   //:AddBlockAttribute( mSPLDefBlock, "UsageColumn1BreakName", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "UsageColumn1BreakName", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:AddBlockAttribute( mSPLDefBlock, "UsageColumn2BreakName", szDisplayMsg )
   {StringBuilder sb_szDisplayMsg;
   if ( szDisplayMsg == null )
      sb_szDisplayMsg = new StringBuilder( 32 );
   else
      sb_szDisplayMsg = new StringBuilder( szDisplayMsg );
       omSPLDef_AddBlockAttribute( mSPLDefBlock, "UsageColumn2BreakName", sb_szDisplayMsg );
   szDisplayMsg = sb_szDisplayMsg.toString( );}
   //:// AddBlockAttribute( mSPLDefBlock, "wRelativeBlockNumber", szDisplayMsg )
   //:// AddBlockAttribute( mSPLDefBlock, "wComputedTopPosition", szDisplayMsg )
   //:lLth = zstrlen( szDisplayMsg )
   lLth = zstrlen( szDisplayMsg );
   //:IF lLth > lMinLth
   if ( lLth > lMinLth )
   { 
      //:TraceLineS( "Has data ", szDisplayMsg )
      TraceLineS( "Has data ", szDisplayMsg );
      //:ELSE
   } 
   else
   { 
      //:IF bAll != 0
      if ( bAll != 0 )
      { 
         //:TraceLineS( "~No data ", szDisplayMsg )
         TraceLineS( "~No data ", szDisplayMsg );
      } 

      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:FormatPrintIcons( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                  INTEGER lFile,
//:                  STRING ( 32000 ) szWriteBuffer )

//:   DECIMAL PageHeight
public int 
omSPLDef_FormatPrintIcons( View     mSPLDef,
                           int      lFile,
                           String   szWriteBuffer )
{
   double  PageHeight = 0.0;
   //:DECIMAL PageWidth
   double  PageWidth = 0.0;
   //:DECIMAL TopMargin
   double  TopMargin = 0.0;
   //:DECIMAL LeftMargin
   double  LeftMargin = 0.0;

   //:DECIMAL IconTopLeftTop
   double  IconTopLeftTop = 0.0;
   //:DECIMAL IconBottomLeftTop
   double  IconBottomLeftTop = 0.0;
   //:DECIMAL IconTopRightTop
   double  IconTopRightTop = 0.0;
   //:DECIMAL IconBottomRightTop
   double  IconBottomRightTop = 0.0;
   //:DECIMAL IconCenterTopTop
   double  IconCenterTopTop = 0.0;
   //:DECIMAL IconCenterLeftTop
   double  IconCenterLeftTop = 0.0;
   //:DECIMAL IconCenterRightTop
   double  IconCenterRightTop = 0.0;
   //:DECIMAL IconCenterBottomTop
   double  IconCenterBottomTop = 0.0;

   //:DECIMAL IconTopLeftLeft
   double  IconTopLeftLeft = 0.0;
   //:DECIMAL IconBottomLeftLeft
   double  IconBottomLeftLeft = 0.0;
   //:DECIMAL IconTopRightLeft
   double  IconTopRightLeft = 0.0;
   //:DECIMAL IconBottomRightLeft
   double  IconBottomRightLeft = 0.0;
   //:DECIMAL IconCenterTopLeft
   double  IconCenterTopLeft = 0.0;
   //:DECIMAL IconCenterLeftLeft
   double  IconCenterLeftLeft = 0.0;
   //:DECIMAL IconCenterRightLeft
   double  IconCenterRightLeft = 0.0;
   //:DECIMAL IconCenterBottomLeft
   double  IconCenterBottomLeft = 0.0;

   //:STRING ( 32 ) szTop
   String   szTop = null;
   //:STRING ( 32 ) szLeft
   String   szLeft = null;
   //:STRING ( 30 ) szDateTime
   String   szDateTime = null;
   //:STRING ( 30 ) szDateTimeDisplay
   String   szDateTimeDisplay = null;
   //:STRING ( 90 ) szProductIdentifier
   String   szProductIdentifier = null;
   //:STRING ( 32 ) szLPLR_Name
   String   szLPLR_Name = null;
   //:STRING ( 64 ) szSystemIniApplName
   String   szSystemIniApplName = null;
   //:STRING ( 256 ) szImageDirectory
   String   szImageDirectory = null;
   int      RESULT = 0;
   double  dTempDecimal_0 = 0.0;
   double  dTempDecimal_1 = 0.0;
   String   szTempString_0 = null;
   int      lTempInteger_0 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_1 = 0;


   //:// Get the fop images directory
   //:SfGetApplicationForSubtask( szLPLR_Name, mSPLDef )
   {StringBuilder sb_szLPLR_Name;
   if ( szLPLR_Name == null )
      sb_szLPLR_Name = new StringBuilder( 32 );
   else
      sb_szLPLR_Name = new StringBuilder( szLPLR_Name );
       SfGetApplicationForSubtask( sb_szLPLR_Name, mSPLDef );
   szLPLR_Name = sb_szLPLR_Name.toString( );}
   //:szSystemIniApplName = "[App." + szLPLR_Name + "]"
    {StringBuilder sb_szSystemIniApplName;
   if ( szSystemIniApplName == null )
      sb_szSystemIniApplName = new StringBuilder( 32 );
   else
      sb_szSystemIniApplName = new StringBuilder( szSystemIniApplName );
      ZeidonStringCopy( sb_szSystemIniApplName, 1, 0, "[App.", 1, 0, 65 );
   szSystemIniApplName = sb_szSystemIniApplName.toString( );}
    {StringBuilder sb_szSystemIniApplName;
   if ( szSystemIniApplName == null )
      sb_szSystemIniApplName = new StringBuilder( 32 );
   else
      sb_szSystemIniApplName = new StringBuilder( szSystemIniApplName );
      ZeidonStringConcat( sb_szSystemIniApplName, 1, 0, szLPLR_Name, 1, 0, 65 );
   szSystemIniApplName = sb_szSystemIniApplName.toString( );}
    {StringBuilder sb_szSystemIniApplName;
   if ( szSystemIniApplName == null )
      sb_szSystemIniApplName = new StringBuilder( 32 );
   else
      sb_szSystemIniApplName = new StringBuilder( szSystemIniApplName );
      ZeidonStringConcat( sb_szSystemIniApplName, 1, 0, "]", 1, 0, 65 );
   szSystemIniApplName = sb_szSystemIniApplName.toString( );}
   //:SysReadZeidonIni( -1, szSystemIniApplName, "FopImageDirectory", szImageDirectory )
   {StringBuilder sb_szImageDirectory;
   if ( szImageDirectory == null )
      sb_szImageDirectory = new StringBuilder( 32 );
   else
      sb_szImageDirectory = new StringBuilder( szImageDirectory );
       m_KZOEP1AA.SysReadZeidonIni( -1, szSystemIniApplName, "FopImageDirectory", sb_szImageDirectory );
   szImageDirectory = sb_szImageDirectory.toString( );}
   //:SysConvertEnvironmentString( szImageDirectory, szImageDirectory )
   {StringBuilder sb_szImageDirectory;
   if ( szImageDirectory == null )
      sb_szImageDirectory = new StringBuilder( 32 );
   else
      sb_szImageDirectory = new StringBuilder( szImageDirectory );
       m_KZOEP1AA.SysConvertEnvironmentString( sb_szImageDirectory, szImageDirectory );
   szImageDirectory = sb_szImageDirectory.toString( );}
   //:SysAppendcDirSep( szImageDirectory )
   {StringBuilder sb_szImageDirectory;
   if ( szImageDirectory == null )
      sb_szImageDirectory = new StringBuilder( 32 );
   else
      sb_szImageDirectory = new StringBuilder( szImageDirectory );
       m_KZOEP1AA.SysAppendcDirSep( sb_szImageDirectory );
   szImageDirectory = sb_szImageDirectory.toString( );}

   //:// Format the printer icons based on the Page Height and Width.

   //:// There are 4 corner icons and 4 Center line icons, all of which identify the boundaries of the panel images for the page.
   //:// The Panel area will be positioned 1 inch from the top and 1 inch from the left and 1 inch from the right and one inch from
   //:// the bottom. The 4 center line icons will be in the middle of those corner icons.
   //://
   //:// The 4 corner icons will be positioned:
   //://       TopLeft     Top:  0.2
   //://                   Left: 0.2
   //://       BottomLeft  Top:  PageHeight - 1.2
   //://                   Left: 0.2
   //://       TopRight    Top:  0.2
   //://                   Left: PageWidth - 1.2
   //://       BottomRight Top:  PageHeight - 1.2
   //://                   Left: PageWidth - 1.2
   //://
   //:// The 4 mid-point icons will be positioned:
   //://       CenterTop    Top:  0.2
   //://                    Left: (PageWidth - 2) / 2 + 0.2
   //://       CenterLeft   Top:  (PageHeight - 2) / 2 + 0.2
   //://                    Left: 0.2
   //://       CenterRight  Top:  (PageHeight - 2) / 2 + 0.2
   //://                    Left: PageWidth - 1.2
   //://       CenterBottom Top:  PageHeight - 1.2
   //://                    Left: (PageWidth - 2) / 2 + 0.2
   //://
   //:// In addition, a PDF identifier showing company and date/time is displayed in upper left.

   //:SET CURSOR FIRST mSPLDef.LLD_Panel
   RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Panel", "" );

   //:// Compute Top and Left icon margin values.

   //:TopMargin       = 1
   TopMargin = 1;
   //:LeftMargin      = 1
   LeftMargin = 1;
   //:PageWidth      = mSPLDef.LLD_Page.Width + 2
   {MutableDouble md_dTempDecimal_0 = new MutableDouble( dTempDecimal_0 );
       GetDecimalFromAttribute( md_dTempDecimal_0, mSPLDef, "LLD_Page", "Width" );
   dTempDecimal_0 = md_dTempDecimal_0.doubleValue( );}
   PageWidth = dTempDecimal_0 + 2;
   //:PageHeight     = mSPLDef.LLD_Page.Height + 2
   {MutableDouble md_dTempDecimal_1 = new MutableDouble( dTempDecimal_1 );
       GetDecimalFromAttribute( md_dTempDecimal_1, mSPLDef, "LLD_Page", "Height" );
   dTempDecimal_1 = md_dTempDecimal_1.doubleValue( );}
   PageHeight = dTempDecimal_1 + 2;

   //:IconTopLeftTop         = 0.2
   IconTopLeftTop = 0.2;
   //:IconTopLeftLeft        = 0.2
   IconTopLeftLeft = 0.2;

   //:IconBottomLeftTop      = PageHeight - 0.8
   IconBottomLeftTop = PageHeight - 0.8;
   //:IconBottomLeftLeft     = 0.2
   IconBottomLeftLeft = 0.2;

   //:IconTopRightTop        = 0.2
   IconTopRightTop = 0.2;
   //:IconTopRightLeft       = PageWidth - 0.8
   IconTopRightLeft = PageWidth - 0.8;

   //:IconBottomRightTop     = PageHeight - 0.8
   IconBottomRightTop = PageHeight - 0.8;
   //:IconBottomRightLeft    = PageWidth - 0.8
   IconBottomRightLeft = PageWidth - 0.8;

   //:IconCenterTopTop       = 0.2
   IconCenterTopTop = 0.2;
   //:IconCenterTopLeft      = (PageWidth - 2) / 2 + 0.2
   IconCenterTopLeft = ( PageWidth - 2 ) / 2 + 0.2;

   //:IconCenterLeftTop      = (PageHeight - 2) / 2 + 0.2
   IconCenterLeftTop = ( PageHeight - 2 ) / 2 + 0.2;
   //:IconCenterLeftLeft     = 0.2
   IconCenterLeftLeft = 0.2;

   //:IconCenterRightTop     = (PageHeight - 2) / 2 + 0.2
   IconCenterRightTop = ( PageHeight - 2 ) / 2 + 0.2;
   //:IconCenterRightLeft    = PageWidth - 0.8
   IconCenterRightLeft = PageWidth - 0.8;

   //:IconCenterBottomTop    = PageHeight - 0.8
   IconCenterBottomTop = PageHeight - 0.8;
   //:IconCenterBottomLeft   = (PageWidth - 2) / 2 + 0.2
   IconCenterBottomLeft = ( PageWidth - 2 ) / 2 + 0.2;

   //:// Generate Icons

   //:szWriteBuffer = "               <!-- Printer Location Icon Generation -->"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               <!-- Printer Location Icon Generation -->", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Icon Top Left
   //:szTop  = IconTopLeftTop
    {StringBuilder sb_szTop;
   if ( szTop == null )
      sb_szTop = new StringBuilder( 32 );
   else
      sb_szTop = new StringBuilder( szTop );
      ZeidonStringConvertFromNumber( sb_szTop, 1, 0, 32, 0, IconTopLeftTop, "D" );
   szTop = sb_szTop.toString( );}
   //:szLeft = IconTopLeftLeft
    {StringBuilder sb_szLeft;
   if ( szLeft == null )
      sb_szLeft = new StringBuilder( 32 );
   else
      sb_szLeft = new StringBuilder( szLeft );
      ZeidonStringConvertFromNumber( sb_szLeft, 1, 0, 32, 0, IconTopLeftLeft, "D" );
   szLeft = sb_szLeft.toString( );}
   //:szWriteBuffer = "               <fo:block-container position=^absolute^ top=^" + szTop + "in^ left=^" + szLeft + "in^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               <fo:block-container position=^absolute^ top=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTop, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ left=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeft, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  <fo:block text-align=^left^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  <fo:block text-align=^left^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                     <fo:external-graphic src=^" + szImageDirectory + "/TopLeft.png^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     <fo:external-graphic src=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szImageDirectory, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/TopLeft.png^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  </fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  </fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "               </fo:block-container>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               </fo:block-container>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Icon Top Right
   //:szTop  = IconTopRightTop
    {StringBuilder sb_szTop;
   if ( szTop == null )
      sb_szTop = new StringBuilder( 32 );
   else
      sb_szTop = new StringBuilder( szTop );
      ZeidonStringConvertFromNumber( sb_szTop, 1, 0, 32, 0, IconTopRightTop, "D" );
   szTop = sb_szTop.toString( );}
   //:szLeft = IconTopRightLeft
    {StringBuilder sb_szLeft;
   if ( szLeft == null )
      sb_szLeft = new StringBuilder( 32 );
   else
      sb_szLeft = new StringBuilder( szLeft );
      ZeidonStringConvertFromNumber( sb_szLeft, 1, 0, 32, 0, IconTopRightLeft, "D" );
   szLeft = sb_szLeft.toString( );}
   //:szWriteBuffer = "               <fo:block-container position=^absolute^ top=^" + szTop + "in^ left=^" + szLeft + "in^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               <fo:block-container position=^absolute^ top=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTop, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ left=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeft, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  <fo:block text-align=^left^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  <fo:block text-align=^left^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                     <fo:external-graphic src=^" + szImageDirectory + "/TopRight.png^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     <fo:external-graphic src=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szImageDirectory, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/TopRight.png^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  </fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  </fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "               </fo:block-container>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               </fo:block-container>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Icon Bottom Left
   //:szTop  = IconBottomLeftTop
    {StringBuilder sb_szTop;
   if ( szTop == null )
      sb_szTop = new StringBuilder( 32 );
   else
      sb_szTop = new StringBuilder( szTop );
      ZeidonStringConvertFromNumber( sb_szTop, 1, 0, 32, 0, IconBottomLeftTop, "D" );
   szTop = sb_szTop.toString( );}
   //:szLeft = IconBottomLeftLeft
    {StringBuilder sb_szLeft;
   if ( szLeft == null )
      sb_szLeft = new StringBuilder( 32 );
   else
      sb_szLeft = new StringBuilder( szLeft );
      ZeidonStringConvertFromNumber( sb_szLeft, 1, 0, 32, 0, IconBottomLeftLeft, "D" );
   szLeft = sb_szLeft.toString( );}
   //:szWriteBuffer = "               <fo:block-container position=^absolute^ top=^" + szTop + "in^ left=^" + szLeft + "in^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               <fo:block-container position=^absolute^ top=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTop, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ left=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeft, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  <fo:block text-align=^left^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  <fo:block text-align=^left^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                     <fo:external-graphic src=^" + szImageDirectory + "/BottomLeft.png^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     <fo:external-graphic src=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szImageDirectory, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/BottomLeft.png^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  </fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  </fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "               </fo:block-container>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               </fo:block-container>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Icon Bottom Right
   //:szTop  = IconBottomRightTop
    {StringBuilder sb_szTop;
   if ( szTop == null )
      sb_szTop = new StringBuilder( 32 );
   else
      sb_szTop = new StringBuilder( szTop );
      ZeidonStringConvertFromNumber( sb_szTop, 1, 0, 32, 0, IconBottomRightTop, "D" );
   szTop = sb_szTop.toString( );}
   //:szLeft = IconBottomRightLeft
    {StringBuilder sb_szLeft;
   if ( szLeft == null )
      sb_szLeft = new StringBuilder( 32 );
   else
      sb_szLeft = new StringBuilder( szLeft );
      ZeidonStringConvertFromNumber( sb_szLeft, 1, 0, 32, 0, IconBottomRightLeft, "D" );
   szLeft = sb_szLeft.toString( );}
   //:szWriteBuffer = "               <fo:block-container position=^absolute^ top=^" + szTop + "in^ left=^" + szLeft + "in^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               <fo:block-container position=^absolute^ top=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTop, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ left=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeft, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  <fo:block text-align=^left^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  <fo:block text-align=^left^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                     <fo:external-graphic src=^" + szImageDirectory + "/BottomRight.png^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     <fo:external-graphic src=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szImageDirectory, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/BottomRight.png^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  </fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  </fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "               </fo:block-container>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               </fo:block-container>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Icon Top Center
   //:szTop  = IconCenterTopTop
    {StringBuilder sb_szTop;
   if ( szTop == null )
      sb_szTop = new StringBuilder( 32 );
   else
      sb_szTop = new StringBuilder( szTop );
      ZeidonStringConvertFromNumber( sb_szTop, 1, 0, 32, 0, IconCenterTopTop, "D" );
   szTop = sb_szTop.toString( );}
   //:szLeft = IconCenterTopLeft
    {StringBuilder sb_szLeft;
   if ( szLeft == null )
      sb_szLeft = new StringBuilder( 32 );
   else
      sb_szLeft = new StringBuilder( szLeft );
      ZeidonStringConvertFromNumber( sb_szLeft, 1, 0, 32, 0, IconCenterTopLeft, "D" );
   szLeft = sb_szLeft.toString( );}
   //:szWriteBuffer = "               <fo:block-container position=^absolute^ top=^" + szTop + "in^ left=^" + szLeft + "in^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               <fo:block-container position=^absolute^ top=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTop, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ left=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeft, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  <fo:block text-align=^left^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  <fo:block text-align=^left^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                     <fo:external-graphic src=^" + szImageDirectory + "/CenterH.png^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     <fo:external-graphic src=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szImageDirectory, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/CenterH.png^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  </fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  </fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "               </fo:block-container>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               </fo:block-container>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Icon Bottom Center
   //:szTop  = IconCenterBottomTop
    {StringBuilder sb_szTop;
   if ( szTop == null )
      sb_szTop = new StringBuilder( 32 );
   else
      sb_szTop = new StringBuilder( szTop );
      ZeidonStringConvertFromNumber( sb_szTop, 1, 0, 32, 0, IconCenterBottomTop, "D" );
   szTop = sb_szTop.toString( );}
   //:szLeft = IconCenterBottomLeft
    {StringBuilder sb_szLeft;
   if ( szLeft == null )
      sb_szLeft = new StringBuilder( 32 );
   else
      sb_szLeft = new StringBuilder( szLeft );
      ZeidonStringConvertFromNumber( sb_szLeft, 1, 0, 32, 0, IconCenterBottomLeft, "D" );
   szLeft = sb_szLeft.toString( );}
   //:szWriteBuffer = "               <fo:block-container position=^absolute^ top=^" + szTop + "in^ left=^" + szLeft + "in^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               <fo:block-container position=^absolute^ top=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTop, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ left=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeft, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  <fo:block text-align=^left^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  <fo:block text-align=^left^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                     <fo:external-graphic src=^" + szImageDirectory + "/CenterH.png^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     <fo:external-graphic src=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szImageDirectory, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/CenterH.png^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  </fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  </fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "               </fo:block-container>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               </fo:block-container>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Icon Left Center
   //:szTop  = IconCenterLeftTop
    {StringBuilder sb_szTop;
   if ( szTop == null )
      sb_szTop = new StringBuilder( 32 );
   else
      sb_szTop = new StringBuilder( szTop );
      ZeidonStringConvertFromNumber( sb_szTop, 1, 0, 32, 0, IconCenterLeftTop, "D" );
   szTop = sb_szTop.toString( );}
   //:szLeft = IconCenterLeftLeft
    {StringBuilder sb_szLeft;
   if ( szLeft == null )
      sb_szLeft = new StringBuilder( 32 );
   else
      sb_szLeft = new StringBuilder( szLeft );
      ZeidonStringConvertFromNumber( sb_szLeft, 1, 0, 32, 0, IconCenterLeftLeft, "D" );
   szLeft = sb_szLeft.toString( );}
   //:szWriteBuffer = "               <fo:block-container position=^absolute^ top=^" + szTop + "in^ left=^" + szLeft + "in^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               <fo:block-container position=^absolute^ top=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTop, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ left=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeft, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  <fo:block text-align=^left^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  <fo:block text-align=^left^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                     <fo:external-graphic src=^" + szImageDirectory + "/CenterV.png^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     <fo:external-graphic src=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szImageDirectory, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/CenterV.png^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  </fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  </fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "               </fo:block-container>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               </fo:block-container>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Icon Right Center
   //:szTop  = IconCenterRightTop
    {StringBuilder sb_szTop;
   if ( szTop == null )
      sb_szTop = new StringBuilder( 32 );
   else
      sb_szTop = new StringBuilder( szTop );
      ZeidonStringConvertFromNumber( sb_szTop, 1, 0, 32, 0, IconCenterRightTop, "D" );
   szTop = sb_szTop.toString( );}
   //:szLeft = IconCenterRightLeft
    {StringBuilder sb_szLeft;
   if ( szLeft == null )
      sb_szLeft = new StringBuilder( 32 );
   else
      sb_szLeft = new StringBuilder( szLeft );
      ZeidonStringConvertFromNumber( sb_szLeft, 1, 0, 32, 0, IconCenterRightLeft, "D" );
   szLeft = sb_szLeft.toString( );}
   //:szWriteBuffer = "               <fo:block-container position=^absolute^ top=^" + szTop + "in^ left=^" + szLeft + "in^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               <fo:block-container position=^absolute^ top=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTop, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ left=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeft, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  <fo:block text-align=^left^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  <fo:block text-align=^left^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                     <fo:external-graphic src=^" + szImageDirectory + "/CenterV.png^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     <fo:external-graphic src=^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szImageDirectory, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/CenterV.png^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  </fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  </fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "               </fo:block-container>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               </fo:block-container>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Company and Date/Time Identifier

   //:GetStringFromAttributeByContext( szDateTimeDisplay, mSPLDef, "SubregPhysicalLabelDef", "wDateTime", "YYYY/MM/DD HH:MM:SS.S AM", 30 )
   {StringBuilder sb_szDateTimeDisplay;
   if ( szDateTimeDisplay == null )
      sb_szDateTimeDisplay = new StringBuilder( 32 );
   else
      sb_szDateTimeDisplay = new StringBuilder( szDateTimeDisplay );
       GetStringFromAttributeByContext( sb_szDateTimeDisplay, mSPLDef, "SubregPhysicalLabelDef", "wDateTime", "YYYY/MM/DD HH:MM:SS.S AM", 30 );
   szDateTimeDisplay = sb_szDateTimeDisplay.toString( );}
   //://szDateTimeDisplay = "01/01/2000 00:00:00.0 AM"
   //:szProductIdentifier = mSPLDef.SubregOrganization.Name + "   " + mSPLDef.MasterLabelContent.Version + ":" + mSPLDef.SubregLabelContent.Version + "   " + szDateTimeDisplay
   {StringBuilder sb_szProductIdentifier;
   if ( szProductIdentifier == null )
      sb_szProductIdentifier = new StringBuilder( 32 );
   else
      sb_szProductIdentifier = new StringBuilder( szProductIdentifier );
       GetStringFromAttribute( sb_szProductIdentifier, mSPLDef, "SubregOrganization", "Name" );
   szProductIdentifier = sb_szProductIdentifier.toString( );}
    {StringBuilder sb_szProductIdentifier;
   if ( szProductIdentifier == null )
      sb_szProductIdentifier = new StringBuilder( 32 );
   else
      sb_szProductIdentifier = new StringBuilder( szProductIdentifier );
      ZeidonStringConcat( sb_szProductIdentifier, 1, 0, "   ", 1, 0, 91 );
   szProductIdentifier = sb_szProductIdentifier.toString( );}
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_0, 'S', 255, mSPLDef, "MasterLabelContent", "Version", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szTempString_0 = sb_szTempString_0.toString( );}
    {StringBuilder sb_szProductIdentifier;
   if ( szProductIdentifier == null )
      sb_szProductIdentifier = new StringBuilder( 32 );
   else
      sb_szProductIdentifier = new StringBuilder( szProductIdentifier );
      ZeidonStringConcat( sb_szProductIdentifier, 1, 0, szTempString_0, 1, 0, 91 );
   szProductIdentifier = sb_szProductIdentifier.toString( );}
    {StringBuilder sb_szProductIdentifier;
   if ( szProductIdentifier == null )
      sb_szProductIdentifier = new StringBuilder( 32 );
   else
      sb_szProductIdentifier = new StringBuilder( szProductIdentifier );
      ZeidonStringConcat( sb_szProductIdentifier, 1, 0, ":", 1, 0, 91 );
   szProductIdentifier = sb_szProductIdentifier.toString( );}
   {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
   StringBuilder sb_szTempString_1;
   if ( szTempString_1 == null )
      sb_szTempString_1 = new StringBuilder( 32 );
   else
      sb_szTempString_1 = new StringBuilder( szTempString_1 );
       GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_1, 'S', 255, mSPLDef, "SubregLabelContent", "Version", "", 0 );
   lTempInteger_1 = mi_lTempInteger_1.intValue( );
   szTempString_1 = sb_szTempString_1.toString( );}
    {StringBuilder sb_szProductIdentifier;
   if ( szProductIdentifier == null )
      sb_szProductIdentifier = new StringBuilder( 32 );
   else
      sb_szProductIdentifier = new StringBuilder( szProductIdentifier );
      ZeidonStringConcat( sb_szProductIdentifier, 1, 0, szTempString_1, 1, 0, 91 );
   szProductIdentifier = sb_szProductIdentifier.toString( );}
    {StringBuilder sb_szProductIdentifier;
   if ( szProductIdentifier == null )
      sb_szProductIdentifier = new StringBuilder( 32 );
   else
      sb_szProductIdentifier = new StringBuilder( szProductIdentifier );
      ZeidonStringConcat( sb_szProductIdentifier, 1, 0, "   ", 1, 0, 91 );
   szProductIdentifier = sb_szProductIdentifier.toString( );}
    {StringBuilder sb_szProductIdentifier;
   if ( szProductIdentifier == null )
      sb_szProductIdentifier = new StringBuilder( 32 );
   else
      sb_szProductIdentifier = new StringBuilder( szProductIdentifier );
      ZeidonStringConcat( sb_szProductIdentifier, 1, 0, szDateTimeDisplay, 1, 0, 91 );
   szProductIdentifier = sb_szProductIdentifier.toString( );}
   //:szWriteBuffer = "               <fo:block-container position=^absolute^ top=^0.4in^ left=^1.0in^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               <fo:block-container position=^absolute^ top=^0.4in^ left=^1.0in^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  <fo:block font-size=^7pt^ letter-spacing=^.2em^ text-align=^left^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  <fo:block font-size=^7pt^ letter-spacing=^.2em^ text-align=^left^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                     " + szProductIdentifier
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szProductIdentifier, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "                  </fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                  </fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = "               </fo:block-container>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "               </fo:block-container>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:FormatContinueBlock( VIEW mSPLDefPDF BASED ON LOD mSPLDef,
//:                     VIEW mSPLDef    BASED ON LOD mSPLDef,
//:                     INTEGER lFile,
//:                     STRING ( 50 )    szPassedBlanks,
//:                     STRING ( 32000 ) szWriteBuffer,
//:                     STRING ( 1 )     szContinueType )

//:   //VIEW mSPLDefPDFPrev BASED ON LOD mSPLDef
//:   STRING ( 32000 )  szStatementText
public int 
omSPLDef_FormatContinueBlock( View     mSPLDefPDF,
                              View     mSPLDef,
                              int      lFile,
                              String   szPassedBlanks,
                              String   szWriteBuffer,
                              String   szContinueType )
{
   String   szStatementText = null;
   //:STRING ( 32000 )  szTemporaryText
   String   szTemporaryText = null;
   //:STRING ( 256 )    szStatementTitle
   String   szStatementTitle = null;
   //:STRING ( 32 )     szSeparatorCharacters
   String   szSeparatorCharacters = null;
   //:STRING ( 2 )      szTitleFormat
   String   szTitleFormat = null;
   //:STRING ( 2 )      szStatementFormat
   String   szStatementFormat = null;
   //:STRING ( 50 )     szSectionType
   String   szSectionType = null;
   //:STRING ( 50 )     szLeadingBlanks
   String   szLeadingBlanks = null;
   //:STRING ( 50 )     szDisplayStatementName
   String   szDisplayStatementName = null;
   //:STRING ( 50 )     szDisplaySectionName
   String   szDisplaySectionName = null;
   //:STRING ( 3 )      szDisplaySectionSuffix
   String   szDisplaySectionSuffix = null;
   //:SHORT             nRC
   int      nRC = 0;
   String   szTempString_0 = null;
   int      lTempInteger_0 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   int      RESULT = 0;
   int      lTempInteger_5 = 0;
   int      lTempInteger_6 = 0;
   int      lTempInteger_7 = 0;
   int      lTempInteger_8 = 0;
   int      lTempInteger_9 = 0;
   int      lTempInteger_10 = 0;


   //:// Process Storage & Disposal, Directions For Use or Marketing Continuation Statements from previous Panel.

   //:szLeadingBlanks = szPassedBlanks
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringCopy( sb_szLeadingBlanks, 1, 0, szPassedBlanks, 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}

   //:// Create Block Container. Top is overridden to top of Panel.
   //:// TraceLineS( "$$$$ Begin of FormatContinueBlock", "" )
   //://IF mSPLDef.ContinuationStatement DOES NOT EXIST
   //://   IssueError( mSPLDef,0,0, "stop" )
   //://END
   //://TraceLineS( "##########********** Continue Block: ", mSPLDefPDF.LLD_Block.LLD_SectionType )
   //://TraceLineS( "##########********** Format Continue: ", mSPLDef.ContinuationStatement.Text )

   //:FormatBlockContainer( mSPLDefPDF, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, "" )
   omSPLDef_FormatBlockContainer( mSPLDefPDF, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, "" );

   //:// If the continuation is to another Panel, put out Continuation text.
   //:IF szContinueType = "P"  // continuation is to another Panel
   if ( ZeidonStringCompare( szContinueType, 1, 0, "P", 1, 0, 2 ) == 0 )
   { 
      //:// Add the Continuation verbage to the current Panel.
      //:szWriteBuffer = szLeadingBlanks + "   <fo:block margin-bottom=^.05in^>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <fo:block margin-bottom=^.05in^>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:IF mSPLDefPDF.LLD_Block.LLD_SectionType = "DirectionsForUse"
      if ( CompareAttributeToString( mSPLDefPDF, "LLD_Block", "LLD_SectionType", "DirectionsForUse" ) == 0 )
      { 
         //:szWriteBuffer = szLeadingBlanks + "      " + mSPLDefPDF.SPLD_LLD.ContNextPageTextDirForUse
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      ", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szTempString_0;
         if ( szTempString_0 == null )
            sb_szTempString_0 = new StringBuilder( 32 );
         else
            sb_szTempString_0 = new StringBuilder( szTempString_0 );
                   GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_0, 'S', 4097, mSPLDefPDF, "SPLD_LLD", "ContNextPageTextDirForUse", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szTempString_0 = sb_szTempString_0.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTempString_0, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         //:ELSE
      } 
      else
      { 
         //:szWriteBuffer = szLeadingBlanks + "      " + mSPLDefPDF.SPLD_LLD.ContNextPageTextMarketing
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      ", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szTempString_1;
         if ( szTempString_1 == null )
            sb_szTempString_1 = new StringBuilder( 32 );
         else
            sb_szTempString_1 = new StringBuilder( szTempString_1 );
                   GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_1, 'S', 4097, mSPLDefPDF, "SPLD_LLD", "ContNextPageTextMarketing", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szTempString_1 = sb_szTempString_1.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTempString_1, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
      } 

      //:END
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:szWriteBuffer = szLeadingBlanks + "   </fo:block>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   </fo:block>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
   } 

   //:END

   //:szStatementFormat     = "SP"
    {StringBuilder sb_szStatementFormat;
   if ( szStatementFormat == null )
      sb_szStatementFormat = new StringBuilder( 32 );
   else
      sb_szStatementFormat = new StringBuilder( szStatementFormat );
      ZeidonStringCopy( sb_szStatementFormat, 1, 0, "SP", 1, 0, 3 );
   szStatementFormat = sb_szStatementFormat.toString( );}
   //:szSeparatorCharacters = ", "
    {StringBuilder sb_szSeparatorCharacters;
   if ( szSeparatorCharacters == null )
      sb_szSeparatorCharacters = new StringBuilder( 32 );
   else
      sb_szSeparatorCharacters = new StringBuilder( szSeparatorCharacters );
      ZeidonStringCopy( sb_szSeparatorCharacters, 1, 0, ", ", 1, 0, 33 );
   szSeparatorCharacters = sb_szSeparatorCharacters.toString( );}

   //:// Increment Display Section Suffix and Initialize DisplaySection entry.
   //:mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount = mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount + 1
   {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
       GetIntegerFromAttribute( mi_lTempInteger_2, mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount" );
   lTempInteger_2 = mi_lTempInteger_2.intValue( );}
   lTempInteger_3 = lTempInteger_2 + 1;
   SetAttributeFromInteger( mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount", lTempInteger_3 );
   //:szDisplaySectionSuffix = mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount
   {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
   StringBuilder sb_szDisplaySectionSuffix;
   if ( szDisplaySectionSuffix == null )
      sb_szDisplaySectionSuffix = new StringBuilder( 32 );
   else
      sb_szDisplaySectionSuffix = new StringBuilder( szDisplaySectionSuffix );
       GetVariableFromAttribute( sb_szDisplaySectionSuffix, mi_lTempInteger_4, 'S', 4, mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount", "", 0 );
   lTempInteger_4 = mi_lTempInteger_4.intValue( );
   szDisplaySectionSuffix = sb_szDisplaySectionSuffix.toString( );}
   //:szDisplaySectionName = "DisplaySection" + szDisplaySectionSuffix
    {StringBuilder sb_szDisplaySectionName;
   if ( szDisplaySectionName == null )
      sb_szDisplaySectionName = new StringBuilder( 32 );
   else
      sb_szDisplaySectionName = new StringBuilder( szDisplaySectionName );
      ZeidonStringCopy( sb_szDisplaySectionName, 1, 0, "DisplaySection", 1, 0, 51 );
   szDisplaySectionName = sb_szDisplaySectionName.toString( );}
    {StringBuilder sb_szDisplaySectionName;
   if ( szDisplaySectionName == null )
      sb_szDisplaySectionName = new StringBuilder( 32 );
   else
      sb_szDisplaySectionName = new StringBuilder( szDisplaySectionName );
      ZeidonStringConcat( sb_szDisplaySectionName, 1, 0, szDisplaySectionSuffix, 1, 0, 51 );
   szDisplaySectionName = sb_szDisplaySectionName.toString( );}
   //:CREATE ENTITY mSPLDef.DisplaySection
   RESULT = CreateEntity( mSPLDef, "DisplaySection", zPOS_AFTER );
   //:mSPLDef.DisplaySection.Type = "SPLD_ContinuationSection"
   SetAttributeFromString( mSPLDef, "DisplaySection", "Type", "SPLD_ContinuationSection" );
   //:mSPLDef.DisplaySection.XML_SectionName = szDisplaySectionName
   SetAttributeFromString( mSPLDef, "DisplaySection", "XML_SectionName", szDisplaySectionName );

   //:// If this is a continuation to the next Panel, we need to use the last block on the previous Panel for formatting, so create that view.
   //:/*CreateViewFromView( mSPLDefPDFPrev, mSPLDefPDF )
   //:NAME VIEW mSPLDefPDFPrev "mSPLDefPDFPrev"
   //:IF szContinueType = "P"
   //:   SET CURSOR PREVIOUS mSPLDefPDFPrev.LLD_Panel
   //:   SET CURSOR LAST mSPLDefPDFPrev.LLD_Block
   //:END*/

   //:// Format each Statement, with Title, if requested.
   //:FOR EACH mSPLDef.ContinuationStatement
   RESULT = SetCursorFirstEntity( mSPLDef, "ContinuationStatement", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 

      //:// Create the Display Statement entry, unless this Statement is a full continuation on next page.
      //:mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount = mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount + 1
      {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
             GetIntegerFromAttribute( mi_lTempInteger_5, mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount" );
      lTempInteger_5 = mi_lTempInteger_5.intValue( );}
      lTempInteger_6 = lTempInteger_5 + 1;
      SetAttributeFromInteger( mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount", lTempInteger_6 );
      //:szDisplaySectionSuffix = mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount
      {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
      StringBuilder sb_szDisplaySectionSuffix;
      if ( szDisplaySectionSuffix == null )
         sb_szDisplaySectionSuffix = new StringBuilder( 32 );
      else
         sb_szDisplaySectionSuffix = new StringBuilder( szDisplaySectionSuffix );
             GetVariableFromAttribute( sb_szDisplaySectionSuffix, mi_lTempInteger_7, 'S', 4, mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount", "", 0 );
      lTempInteger_7 = mi_lTempInteger_7.intValue( );
      szDisplaySectionSuffix = sb_szDisplaySectionSuffix.toString( );}
      //:szDisplayStatementName = "DisplayStatement" + szDisplaySectionSuffix
       {StringBuilder sb_szDisplayStatementName;
      if ( szDisplayStatementName == null )
         sb_szDisplayStatementName = new StringBuilder( 32 );
      else
         sb_szDisplayStatementName = new StringBuilder( szDisplayStatementName );
            ZeidonStringCopy( sb_szDisplayStatementName, 1, 0, "DisplayStatement", 1, 0, 51 );
      szDisplayStatementName = sb_szDisplayStatementName.toString( );}
       {StringBuilder sb_szDisplayStatementName;
      if ( szDisplayStatementName == null )
         sb_szDisplayStatementName = new StringBuilder( 32 );
      else
         sb_szDisplayStatementName = new StringBuilder( szDisplayStatementName );
            ZeidonStringConcat( sb_szDisplayStatementName, 1, 0, szDisplaySectionSuffix, 1, 0, 51 );
      szDisplayStatementName = sb_szDisplayStatementName.toString( );}
      //:CREATE ENTITY mSPLDef.DisplayStatement
      RESULT = CreateEntity( mSPLDef, "DisplayStatement", zPOS_AFTER );
      //:mSPLDef.DisplayStatement.XML_StatementName = szDisplayStatementName
      SetAttributeFromString( mSPLDef, "DisplayStatement", "XML_StatementName", szDisplayStatementName );

      //:szStatementText  = mSPLDef.ContinuationStatement.Text
      {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
      StringBuilder sb_szStatementText;
      if ( szStatementText == null )
         sb_szStatementText = new StringBuilder( 32 );
      else
         sb_szStatementText = new StringBuilder( szStatementText );
             GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_8, 'S', 32001, mSPLDef, "ContinuationStatement", "Text", "", 0 );
      lTempInteger_8 = mi_lTempInteger_8.intValue( );
      szStatementText = sb_szStatementText.toString( );}
      //:szStatementTitle = mSPLDef.ContinuationStatement.Title
      {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
      StringBuilder sb_szStatementTitle;
      if ( szStatementTitle == null )
         sb_szStatementTitle = new StringBuilder( 32 );
      else
         sb_szStatementTitle = new StringBuilder( szStatementTitle );
             GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_9, 'S', 257, mSPLDef, "ContinuationStatement", "Title", "", 0 );
      lTempInteger_9 = mi_lTempInteger_9.intValue( );
      szStatementTitle = sb_szStatementTitle.toString( );}
      //:IF szTitleFormat = "PU"
      if ( ZeidonStringCompare( szTitleFormat, 1, 0, "PU", 1, 0, 3 ) == 0 )
      { 

         //:ELSE
      } 
      else
      { 

         //:IF szStatementFormat = "SN"   // SN - Separate Numbered Paragraph
         if ( ZeidonStringCompare( szStatementFormat, 1, 0, "SN", 1, 0, 3 ) == 0 )
         { 
         } 


         //:   // This will be skipped for now.

         //:   // Process each Statement within the Section, indenting any text that follows a number.
         //:   // We will do this by determining if the first character in the text is a number.
         //:   // If it is not, we'll simply format as for SP above.
         //:   // If it is, we'll find the first character after any spaces following the number and indent that text, after the number.

         //:END
      } 

      //:END

      //:szSectionType = mSPLDefPDF.LLD_Block.LLD_SectionType
      {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
      StringBuilder sb_szSectionType;
      if ( szSectionType == null )
         sb_szSectionType = new StringBuilder( 32 );
      else
         sb_szSectionType = new StringBuilder( szSectionType );
             GetVariableFromAttribute( sb_szSectionType, mi_lTempInteger_10, 'S', 51, mSPLDefPDF, "LLD_Block", "LLD_SectionType", "", 0 );
      lTempInteger_10 = mi_lTempInteger_10.intValue( );
      szSectionType = sb_szSectionType.toString( );}

      //:// Combine Title in text if specified.
      //:IF szStatementTitle != "" AND szTitleFormat = "CT"
      if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 && ZeidonStringCompare( szTitleFormat, 1, 0, "CT", 1, 0, 3 ) == 0 )
      { 
         //:// Title is combined with Text.
         //:szTemporaryText = szStatementText
          {StringBuilder sb_szTemporaryText;
         if ( szTemporaryText == null )
            sb_szTemporaryText = new StringBuilder( 32 );
         else
            sb_szTemporaryText = new StringBuilder( szTemporaryText );
                  ZeidonStringCopy( sb_szTemporaryText, 1, 0, szStatementText, 1, 0, 32001 );
         szTemporaryText = sb_szTemporaryText.toString( );}
         //:szStatementText = szStatementTitle + " " + szTemporaryText
          {StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                  ZeidonStringCopy( sb_szStatementText, 1, 0, szStatementTitle, 1, 0, 32001 );
         szStatementText = sb_szStatementText.toString( );}
          {StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                  ZeidonStringConcat( sb_szStatementText, 1, 0, " ", 1, 0, 32001 );
         szStatementText = sb_szStatementText.toString( );}
          {StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                  ZeidonStringConcat( sb_szStatementText, 1, 0, szTemporaryText, 1, 0, 32001 );
         szStatementText = sb_szStatementText.toString( );}
         //:ELSE
      } 
      else
      { 
         //:// Format Title, if it exists.
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:szWriteBuffer = szLeadingBlanks + "   <fo:block "
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <fo:block ", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
            //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Title", szWriteBuffer )
            {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                         omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Title", sb_szWriteBuffer );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
            //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
            try
            {
                {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            };
            }
            catch ( Exception e )
            {
               throw ZeidonException.wrapException( e );
            }

            //://szWriteBuffer = szLeadingBlanks + "      " + szStatementTitle
            //:szWriteBuffer = szLeadingBlanks + "      <xsl:apply-templates select=^SubregPhysicalLabelDef/"
            //:                                + szDisplaySectionName + "/" + szDisplayStatementName + "/Title^/>"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      <xsl:apply-templates select=^SubregPhysicalLabelDef/", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDisplaySectionName, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDisplayStatementName, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/Title^/>", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
            //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
            try
            {
                {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            };
            }
            catch ( Exception e )
            {
               throw ZeidonException.wrapException( e );
            }

            //:szWriteBuffer = szLeadingBlanks + "   </fo:block>"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   </fo:block>", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
            //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
            try
            {
                {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            };
            }
            catch ( Exception e )
            {
               throw ZeidonException.wrapException( e );
            }

            //:mSPLDef.DisplayStatement.Title = szStatementTitle
            SetAttributeFromString( mSPLDef, "DisplayStatement", "Title", szStatementTitle );
         } 

         //:END
      } 

      //:END

      //:// Format Statement Text
      //:szWriteBuffer = szLeadingBlanks + "   <fo:block "
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <fo:block ", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Text", szWriteBuffer )
      {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
             omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Text", sb_szWriteBuffer );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //://szWriteBuffer = szLeadingBlanks + "      " + szStatementText
      //:szWriteBuffer = szLeadingBlanks + "      <xsl:apply-templates select=^SubregPhysicalLabelDef/"
      //:                                      + szDisplaySectionName + "/" + szDisplayStatementName + "/Text^/>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      <xsl:apply-templates select=^SubregPhysicalLabelDef/", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDisplaySectionName, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDisplayStatementName, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/Text^/>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:szWriteBuffer = szLeadingBlanks + "   </fo:block>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   </fo:block>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:mSPLDef.DisplayStatement.Text = szStatementText
      SetAttributeFromString( mSPLDef, "DisplayStatement", "Text", szStatementText );
      RESULT = SetCursorNextEntity( mSPLDef, "ContinuationStatement", "" );
   } 


   //:END
   //://DropView( mSPLDefPDFPrev )

   //:// Process Termination.
   //:szWriteBuffer = szLeadingBlanks + "</fo:block-container>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block-container>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Remove any existing Continuation Statements.
   //:FOR EACH mSPLDef.ContinuationStatement
   RESULT = SetCursorFirstEntity( mSPLDef, "ContinuationStatement", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mSPLDef.ContinuationStatement NONE
      RESULT = DeleteEntity( mSPLDef, "ContinuationStatement", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mSPLDef, "ContinuationStatement", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:ProcessPDF_Blocks( VIEW mSPLDef    BASED ON LOD mSPLDef,
//:                   VIEW mSPLDefPDF BASED ON LOD mSPLDef,
//:                   VIEW mSPLDefContinue BASED ON LOD mSPLDef,
//:                   INTEGER lFile,
//:                   STRING ( 50 )    szPassedBlanks,
//:                   STRING ( 32000 ) szWriteBuffer )

//:   VIEW mSPLDefTopBlock BASED ON LOD mSPLDef
public int 
omSPLDef_ProcessPDF_Blocks( View     mSPLDef,
                            View     mSPLDefPDF,
                            View     mSPLDefContinue,
                            int      lFile,
                            String   szPassedBlanks,
                            String   szWriteBuffer )
{
   zVIEW    mSPLDefTopBlock = new zVIEW( );
   //:STRING ( 64 ) szTag
   String   szTag = null;
   //:STRING ( 50 ) szLeadingBlanks
   String   szLeadingBlanks = null;
   //:STRING ( 50 ) szBlockBlanks
   String   szBlockBlanks = null;
   //:STRING ( 32 ) szHeight
   String   szHeight = null;
   //:STRING ( 32 ) szWidth
   String   szWidth = null;
   //:STRING ( 32 ) szTop
   String   szTop = null;
   //:STRING ( 50 ) szSectionType
   String   szSectionType = null;
   //:STRING ( 50 ) szLeft
   String   szLeft = null;
   //:STRING ( 90 ) szTitle
   String   szTitle = null;
   //:STRING ( 90 ) szMsg
   String   szMsg = null;
   //:STRING ( 32 ) szLPLR_Name
   String   szLPLR_Name = null;
   //:STRING ( 64 ) szSystemIniApplName
   String   szSystemIniApplName = null;
   //:STRING ( 256 ) szImageDirectory
   String   szImageDirectory = null;
   //:INTEGER       lControl
   int      lControl = 0;
   //:SHORT         nRC
   int      nRC = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      RESULT = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   int      lTempInteger_5 = 0;
   int      lTempInteger_6 = 0;
   int      lTempInteger_7 = 0;
   int      lTempInteger_8 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_9 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_10 = 0;
   String   szTempString_2 = null;
   int      lTempInteger_11 = 0;
   String   szTempString_3 = null;
   int      lTempInteger_12 = 0;


   //:szTag = mSPLDefPDF.LLD_Block.Tag
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szTag;
   if ( szTag == null )
      sb_szTag = new StringBuilder( 32 );
   else
      sb_szTag = new StringBuilder( szTag );
       GetVariableFromAttribute( sb_szTag, mi_lTempInteger_0, 'S', 65, mSPLDefPDF, "LLD_Block", "Tag", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szTag = sb_szTag.toString( );}
   //:// TraceLineS( "Processing Block: ", szTag )
   //:// Process each LLD_Block Container and subobject data.

   //:szLeadingBlanks = szPassedBlanks + "   "
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringCopy( sb_szLeadingBlanks, 1, 0, szPassedBlanks, 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringConcat( sb_szLeadingBlanks, 1, 0, "   ", 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}

   //:// If the first LLD_Block is a Continuation LLD_Block from the previous Panel, process it first.
   //:IF mSPLDefPDF.LLD_Block.ContinuationBlockFlag = "Y" AND mSPLDefPDF.ContinuationStatement EXISTS
   lTempInteger_1 = CheckExistenceOfEntity( mSPLDefPDF, "ContinuationStatement" );
   if ( CompareAttributeToString( mSPLDefPDF, "LLD_Block", "ContinuationBlockFlag", "Y" ) == 0 && lTempInteger_1 == 0 )
   { 
      //:// continuation is to another Panel ... put out Continuation text "ContNextPageText..."
      //:FormatContinueBlock( mSPLDefPDF, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, "P" )
      omSPLDef_FormatContinueBlock( mSPLDefPDF, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, "P" );
   } 

   //:END

   //:FOR EACH mSPLDefPDF.LLD_Block
   RESULT = SetCursorFirstEntity( mSPLDefPDF, "LLD_Block", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //://TraceLineS( "##########********** Block: ", mSPLDefPDF.LLD_Block.LLD_SectionType )
      //://TraceLineS( "##########********** ContinuationBlockFlag: ", mSPLDefPDF.LLD_Block.ContinuationBlockFlag )

      //:szTag = mSPLDefPDF.LLD_Block.Tag
      {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
      StringBuilder sb_szTag;
      if ( szTag == null )
         sb_szTag = new StringBuilder( 32 );
      else
         sb_szTag = new StringBuilder( szTag );
             GetVariableFromAttribute( sb_szTag, mi_lTempInteger_2, 'S', 65, mSPLDefPDF, "LLD_Block", "Tag", "", 0 );
      lTempInteger_2 = mi_lTempInteger_2.intValue( );
      szTag = sb_szTag.toString( );}
      //:IF mSPLDefPDF.LLD_Block.ContinuationBlockFlag = "Y"
      if ( CompareAttributeToString( mSPLDefPDF, "LLD_Block", "ContinuationBlockFlag", "Y" ) == 0 )
      { 
         //:// TraceLineS( "Processing Continued Block: ", szTag )
         //:// IF szTag = "Tag666"
         //://    TraceLineS( "Processing skip tag: ", szTag )
         //:// END
         //:// This is a continuation from the last Block, so format if there is continuation data.
         //:// Note that mSPLDef is pointing to the Panel entity that holds the continuation statements.
         //:SET CURSOR FIRST mSPLDef.ContinuationStatement
         RESULT = SetCursorFirstEntity( mSPLDef, "ContinuationStatement", "" );
         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:FormatContinueBlock( mSPLDefPDF, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, "B" )  // continuation from the last Block
            omSPLDef_FormatContinueBlock( mSPLDefPDF, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, "B" );
            //://TraceLineS( "##########********** FormatContinueBlock ", mSPLDefPDF.LLD_Block.ContinuationBlockFlag )

            //:// Remove continuation entries.
            //:FOR EACH mSPLDef.ContinuationStatement
            RESULT = SetCursorFirstEntity( mSPLDef, "ContinuationStatement", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:DELETE ENTITY mSPLDef.ContinuationStatement NONE
               RESULT = DeleteEntity( mSPLDef, "ContinuationStatement", zREPOS_NONE );
               RESULT = SetCursorNextEntity( mSPLDef, "ContinuationStatement", "" );
            } 

            //:END
         } 

         //://         ELSE
         //://  IssueError( mSPLDef,0,0, "stop" )
         //:END

         //:ELSE
      } 
      else
      { 
         //:// TraceLineS( "Processing Normal Block: ", szTag )

         //:// Create LLD_Block Container.
         //:FormatBlockContainer( mSPLDefPDF, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, "" )
         omSPLDef_FormatBlockContainer( mSPLDefPDF, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, "" );

         //:// Processing depends on which kind of LLD_Block this is.
         //:// If it is just a Container, then format the LLD_Block and process each LLD_SubBlock.
         //:// Otherwise, go to the proper suboperation for processing the type of LLD_Block.
         //:IF mSPLDefPDF.LLD_SubBlock EXISTS
         lTempInteger_3 = CheckExistenceOfEntity( mSPLDefPDF, "LLD_SubBlock" );
         if ( lTempInteger_3 == 0 )
         { 
            //:// Process each LLD_SubBlock as regular Block, after stepping into subobject.

            //:// Create a view to the top Block for debug purposes.
            //:CreateViewFromView( mSPLDefTopBlock, mSPLDefPDF )
            CreateViewFromView( mSPLDefTopBlock, mSPLDefPDF );
            //:SetViewToSubobject( mSPLDefPDF, "LLD_SubBlock" )
            SetViewToSubobject( mSPLDefPDF, "LLD_SubBlock" );

            //:// Recursive call to ProcessPDF_Blocks
            //:nRC = ProcessPDF_Blocks( mSPLDef, mSPLDefPDF, mSPLDefContinue, lFile, szLeadingBlanks, szWriteBuffer )
            nRC = omSPLDef_ProcessPDF_Blocks( mSPLDef, mSPLDefPDF, mSPLDefContinue, lFile, szLeadingBlanks, szWriteBuffer );
            //:IF nRC = 2
            if ( nRC == 2 )
            { 
               //:RETURN 2
               if(8==8)return( 2 );
            } 

            //:END
            //:ResetViewFromSubobject( mSPLDefPDF )
            ResetViewFromSubobject( mSPLDefPDF );

            //:GET VIEW mSPLDefTopBlock NAMED "mSPLDefTopBlock"
            RESULT = GetViewByName( mSPLDefTopBlock, "mSPLDefTopBlock", mSPLDef, zLEVEL_TASK );
            //:IF RESULT >= 0
            if ( RESULT >= 0 )
            { 
               //:DropView( mSPLDefTopBlock )
               DropView( mSPLDefTopBlock );
            } 

            //:END

            //:ELSE
         } 
         else
         { 
            //:// Determine what kind of LLD_Block it is and go to process accordingly.
            //:szSectionType = mSPLDefPDF.LLD_Block.LLD_SectionType
            {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
            StringBuilder sb_szSectionType;
            if ( szSectionType == null )
               sb_szSectionType = new StringBuilder( 32 );
            else
               sb_szSectionType = new StringBuilder( szSectionType );
                         GetVariableFromAttribute( sb_szSectionType, mi_lTempInteger_4, 'S', 51, mSPLDefPDF, "LLD_Block", "LLD_SectionType", "", 0 );
            lTempInteger_4 = mi_lTempInteger_4.intValue( );
            szSectionType = sb_szSectionType.toString( );}

            //:// IMAGE
            //:IF szSectionType = "Graphic"
            if ( ZeidonStringCompare( szSectionType, 1, 0, "Graphic", 1, 0, 51 ) == 0 )
            { 

               //:// Get the fop images directory
               //:SfGetApplicationForSubtask( szLPLR_Name, mSPLDef )
               {StringBuilder sb_szLPLR_Name;
               if ( szLPLR_Name == null )
                  sb_szLPLR_Name = new StringBuilder( 32 );
               else
                  sb_szLPLR_Name = new StringBuilder( szLPLR_Name );
                               SfGetApplicationForSubtask( sb_szLPLR_Name, mSPLDef );
               szLPLR_Name = sb_szLPLR_Name.toString( );}
               //:szSystemIniApplName = "[App." + szLPLR_Name + "]"
                {StringBuilder sb_szSystemIniApplName;
               if ( szSystemIniApplName == null )
                  sb_szSystemIniApplName = new StringBuilder( 32 );
               else
                  sb_szSystemIniApplName = new StringBuilder( szSystemIniApplName );
                              ZeidonStringCopy( sb_szSystemIniApplName, 1, 0, "[App.", 1, 0, 65 );
               szSystemIniApplName = sb_szSystemIniApplName.toString( );}
                {StringBuilder sb_szSystemIniApplName;
               if ( szSystemIniApplName == null )
                  sb_szSystemIniApplName = new StringBuilder( 32 );
               else
                  sb_szSystemIniApplName = new StringBuilder( szSystemIniApplName );
                              ZeidonStringConcat( sb_szSystemIniApplName, 1, 0, szLPLR_Name, 1, 0, 65 );
               szSystemIniApplName = sb_szSystemIniApplName.toString( );}
                {StringBuilder sb_szSystemIniApplName;
               if ( szSystemIniApplName == null )
                  sb_szSystemIniApplName = new StringBuilder( 32 );
               else
                  sb_szSystemIniApplName = new StringBuilder( szSystemIniApplName );
                              ZeidonStringConcat( sb_szSystemIniApplName, 1, 0, "]", 1, 0, 65 );
               szSystemIniApplName = sb_szSystemIniApplName.toString( );}
               //:SysReadZeidonIni( -1, szSystemIniApplName, "FopImageDirectory", szImageDirectory )
               {StringBuilder sb_szImageDirectory;
               if ( szImageDirectory == null )
                  sb_szImageDirectory = new StringBuilder( 32 );
               else
                  sb_szImageDirectory = new StringBuilder( szImageDirectory );
                               m_KZOEP1AA.SysReadZeidonIni( -1, szSystemIniApplName, "FopImageDirectory", sb_szImageDirectory );
               szImageDirectory = sb_szImageDirectory.toString( );}
               //:SysConvertEnvironmentString( szImageDirectory, szImageDirectory )
               {StringBuilder sb_szImageDirectory;
               if ( szImageDirectory == null )
                  sb_szImageDirectory = new StringBuilder( 32 );
               else
                  sb_szImageDirectory = new StringBuilder( szImageDirectory );
                               m_KZOEP1AA.SysConvertEnvironmentString( sb_szImageDirectory, szImageDirectory );
               szImageDirectory = sb_szImageDirectory.toString( );}
               //:SysAppendcDirSep( szImageDirectory )
               {StringBuilder sb_szImageDirectory;
               if ( szImageDirectory == null )
                  sb_szImageDirectory = new StringBuilder( 32 );
               else
                  sb_szImageDirectory = new StringBuilder( szImageDirectory );
                               m_KZOEP1AA.SysAppendcDirSep( sb_szImageDirectory );
               szImageDirectory = sb_szImageDirectory.toString( );}

               //:szHeight = mSPLDefPDF.LLD_Block.Height
               {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
               StringBuilder sb_szHeight;
               if ( szHeight == null )
                  sb_szHeight = new StringBuilder( 32 );
               else
                  sb_szHeight = new StringBuilder( szHeight );
                               GetVariableFromAttribute( sb_szHeight, mi_lTempInteger_5, 'S', 33, mSPLDefPDF, "LLD_Block", "Height", "", 0 );
               lTempInteger_5 = mi_lTempInteger_5.intValue( );
               szHeight = sb_szHeight.toString( );}
               //:szWidth  = mSPLDefPDF.LLD_Block.Width
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
               StringBuilder sb_szWidth;
               if ( szWidth == null )
                  sb_szWidth = new StringBuilder( 32 );
               else
                  sb_szWidth = new StringBuilder( szWidth );
                               GetVariableFromAttribute( sb_szWidth, mi_lTempInteger_6, 'S', 33, mSPLDefPDF, "LLD_Block", "Width", "", 0 );
               lTempInteger_6 = mi_lTempInteger_6.intValue( );
               szWidth = sb_szWidth.toString( );}
               //:szTop    = mSPLDefPDF.LLD_Block.Top
               {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
               StringBuilder sb_szTop;
               if ( szTop == null )
                  sb_szTop = new StringBuilder( 32 );
               else
                  sb_szTop = new StringBuilder( szTop );
                               GetVariableFromAttribute( sb_szTop, mi_lTempInteger_7, 'S', 33, mSPLDefPDF, "LLD_Block", "Top", "", 0 );
               lTempInteger_7 = mi_lTempInteger_7.intValue( );
               szTop = sb_szTop.toString( );}
               //:szLeft   = mSPLDefPDF.LLD_Block.Left
               {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
               StringBuilder sb_szLeft;
               if ( szLeft == null )
                  sb_szLeft = new StringBuilder( 32 );
               else
                  sb_szLeft = new StringBuilder( szLeft );
                               GetVariableFromAttribute( sb_szLeft, mi_lTempInteger_8, 'S', 51, mSPLDefPDF, "LLD_Block", "Left", "", 0 );
               lTempInteger_8 = mi_lTempInteger_8.intValue( );
               szLeft = sb_szLeft.toString( );}

               //:szWriteBuffer = "                     <fo:block text-align=^left^>"
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     <fo:block text-align=^left^>", 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
               //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
               try
               {
                   {
                ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
               };
               }
               catch ( Exception e )
               {
                  throw ZeidonException.wrapException( e );
               }
               //:szWriteBuffer = "                        <fo:external-graphic src=^" + szImageDirectory + mSPLDefPDF.LLD_Block.ImageName +
               //:                "^ height=^" + szHeight + "in^ width=^" + szWidth + "in^ content-height=^scale-to-fit^ content-width=^scale-to-fit^/>"
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                        <fo:external-graphic src=^", 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szImageDirectory, 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
               {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_9, 'S', 255, mSPLDefPDF, "LLD_Block", "ImageName", "", 0 );
               lTempInteger_9 = mi_lTempInteger_9.intValue( );
               szTempString_0 = sb_szTempString_0.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTempString_0, 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "^ height=^", 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szHeight, 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ width=^", 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szWidth, 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^ content-height=^scale-to-fit^ content-width=^scale-to-fit^/>", 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
               //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
               try
               {
                   {
                ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
               };
               }
               catch ( Exception e )
               {
                  throw ZeidonException.wrapException( e );
               }

               //:szWriteBuffer = "                     </fo:block>"
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringCopy( sb_szWriteBuffer, 1, 0, "                     </fo:block>", 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
               //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
               try
               {
                   {
                ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
               };
               }
               catch ( Exception e )
               {
                  throw ZeidonException.wrapException( e );
               }

               //:ELSE
            } 
            else
            { 

               //:// DIRECTIONS FOR USE
               //:IF szSectionType = "DirectionsForUse"
               if ( ZeidonStringCompare( szSectionType, 1, 0, "DirectionsForUse", 1, 0, 51 ) == 0 )
               { 
                  //:// TraceLineS( "Major Block: ", szSectionType )

                  //:// Check if Title should be converted to upper case.
                  //:szTitle = "Directions For Use"
                   {StringBuilder sb_szTitle;
                  if ( szTitle == null )
                     sb_szTitle = new StringBuilder( 32 );
                  else
                     sb_szTitle = new StringBuilder( szTitle );
                                    ZeidonStringCopy( sb_szTitle, 1, 0, "Directions For Use", 1, 0, 91 );
                  szTitle = sb_szTitle.toString( );}
                  //:SET CURSOR FIRST mSPLDefPDF.LLD_SpecialSectionAttribute WHERE mSPLDefPDF.LLD_SpecialSectionAttribute.Name = "Header"
                  RESULT = SetCursorFirstEntityByString( mSPLDefPDF, "LLD_SpecialSectionAttribute", "Name", "Header", "" );
                  //:IF RESULT >= zCURSOR_SET
                  if ( RESULT >= zCURSOR_SET )
                  { 
                     //:szTitle = "DIRECTIONS FOR USE"
                      {StringBuilder sb_szTitle;
                     if ( szTitle == null )
                        sb_szTitle = new StringBuilder( 32 );
                     else
                        sb_szTitle = new StringBuilder( szTitle );
                                          ZeidonStringCopy( sb_szTitle, 1, 0, "DIRECTIONS FOR USE", 1, 0, 91 );
                     szTitle = sb_szTitle.toString( );}
                  } 

                  //:END

                  //:// Set up Directions For Use Title.
                  //:szWriteBuffer = szLeadingBlanks + "   <fo:block "
                   {StringBuilder sb_szWriteBuffer;
                  if ( szWriteBuffer == null )
                     sb_szWriteBuffer = new StringBuilder( 32 );
                  else
                     sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                    ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
                  szWriteBuffer = sb_szWriteBuffer.toString( );}
                   {StringBuilder sb_szWriteBuffer;
                  if ( szWriteBuffer == null )
                     sb_szWriteBuffer = new StringBuilder( 32 );
                  else
                     sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                    ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <fo:block ", 1, 0, 32001 );
                  szWriteBuffer = sb_szWriteBuffer.toString( );}
                  //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Header", szWriteBuffer )
                  {StringBuilder sb_szWriteBuffer;
                  if ( szWriteBuffer == null )
                     sb_szWriteBuffer = new StringBuilder( 32 );
                  else
                     sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                     omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Header", sb_szWriteBuffer );
                  szWriteBuffer = sb_szWriteBuffer.toString( );}
                  //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                  try
                  {
                      {
                   ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                   m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                   // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                  };
                  }
                  catch ( Exception e )
                  {
                     throw ZeidonException.wrapException( e );
                  }

                  //:szWriteBuffer = szLeadingBlanks + "      " + szTitle
                   {StringBuilder sb_szWriteBuffer;
                  if ( szWriteBuffer == null )
                     sb_szWriteBuffer = new StringBuilder( 32 );
                  else
                     sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                    ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
                  szWriteBuffer = sb_szWriteBuffer.toString( );}
                   {StringBuilder sb_szWriteBuffer;
                  if ( szWriteBuffer == null )
                     sb_szWriteBuffer = new StringBuilder( 32 );
                  else
                     sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                    ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      ", 1, 0, 32001 );
                  szWriteBuffer = sb_szWriteBuffer.toString( );}
                   {StringBuilder sb_szWriteBuffer;
                  if ( szWriteBuffer == null )
                     sb_szWriteBuffer = new StringBuilder( 32 );
                  else
                     sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                    ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTitle, 1, 0, 32001 );
                  szWriteBuffer = sb_szWriteBuffer.toString( );}
                  //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                  try
                  {
                      {
                   ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                   m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                   // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                  };
                  }
                  catch ( Exception e )
                  {
                     throw ZeidonException.wrapException( e );
                  }

                  //:szWriteBuffer = szLeadingBlanks + "   </fo:block>"
                   {StringBuilder sb_szWriteBuffer;
                  if ( szWriteBuffer == null )
                     sb_szWriteBuffer = new StringBuilder( 32 );
                  else
                     sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                    ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
                  szWriteBuffer = sb_szWriteBuffer.toString( );}
                   {StringBuilder sb_szWriteBuffer;
                  if ( szWriteBuffer == null )
                     sb_szWriteBuffer = new StringBuilder( 32 );
                  else
                     sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                    ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   </fo:block>", 1, 0, 32001 );
                  szWriteBuffer = sb_szWriteBuffer.toString( );}
                  //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                  try
                  {
                      {
                   ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                   m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                   // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                  };
                  }
                  catch ( Exception e )
                  {
                     throw ZeidonException.wrapException( e );
                  }

                  //:// For Directions For Use, we will process all Sections.
                  //:FOR EACH mSPLDef.SPLD_DirectionsForUseCategory
                  RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_DirectionsForUseCategory", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:FOR EACH mSPLDef.SPLD_DirectionsForUseSection
                     RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_DirectionsForUseSection", "" );
                     while ( RESULT > zCURSOR_UNCHANGED )
                     { 
                        //:GeneratePDF_DFU( mSPLDef, mSPLDefPDF, lFile,
                        //:              szSectionType,
                        //:              "SPLD_DirectionsForUseSection",
                        //:              "SPLD_DirectionsForUseStatement",
                        //:              "SPLD_DirectionsUsage",
                        //:              "SPLD_DirectionsUsageOrdering",
                        //:              szLeadingBlanks,
                        //:              szWriteBuffer )
                        omSPLDef_GeneratePDF_DFU( mSPLDef, mSPLDefPDF, lFile, szSectionType, "SPLD_DirectionsForUseSection", "SPLD_DirectionsForUseStatement", "SPLD_DirectionsUsage", "SPLD_DirectionsUsageOrdering", szLeadingBlanks,
                        szWriteBuffer );
                        RESULT = SetCursorNextEntity( mSPLDef, "SPLD_DirectionsForUseSection", "" );
                     } 

                     RESULT = SetCursorNextEntity( mSPLDef, "SPLD_DirectionsForUseCategory", "" );
                     //:END
                  } 

                  //:END
                  //:ELSE
               } 
               else
               { 

                  //:// MARKETING
                  //:IF szSectionType = "Marketing"
                  if ( ZeidonStringCompare( szSectionType, 1, 0, "Marketing", 1, 0, 51 ) == 0 )
                  { 
                     //:// TraceLineS( "Major Block: ", szSectionType )

                     //:// For Marketing, we will process a Section if its Name matches the name in the Block.
                     //:SET CURSOR FIRST mSPLDef.SPLD_MarketingSection WHERE mSPLDef.SPLD_MarketingSection.Name = mSPLDefPDF.LLD_Block.Name
                     {StringBuilder sb_szTempString_1;
                     if ( szTempString_1 == null )
                        sb_szTempString_1 = new StringBuilder( 32 );
                     else
                        sb_szTempString_1 = new StringBuilder( szTempString_1 );
                                           GetStringFromAttribute( sb_szTempString_1, mSPLDefPDF, "LLD_Block", "Name" );
                     szTempString_1 = sb_szTempString_1.toString( );}
                     RESULT = SetCursorFirstEntityByString( mSPLDef, "SPLD_MarketingSection", "Name", szTempString_1, "" );
                     //:IF RESULT >= zCURSOR_SET
                     if ( RESULT >= zCURSOR_SET )
                     { 
                        //:// There are no Marketing headers ... Don - 2015.05.12
                        //:// // If there is a Marketing "Header" entry, add it.
                        //:// SET CURSOR FIRST mSPLDefPDF.LLD_SpecialSectionAttribute WHERE mSPLDefPDF.LLD_SpecialSectionAttribute.Name = "Header"
                        //:// IF RESULT >= zCURSOR_SET
                        //://    szWriteBuffer = szLeadingBlanks + "   <fo:block "
                        //://    AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Header", szWriteBuffer )
                        //://    WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                        //://    szWriteBuffer = szLeadingBlanks + "      Marketing"
                        //://    WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                        //://    szWriteBuffer = szLeadingBlanks + "   </fo:block>"
                        //://    WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                        //:// END
                        //://
                        //:// Don't execute if the only Statement is null. This could occur if the block contains a Claims List, without
                        //:// any marketing statement preceding it.
                        //:IF mSPLDef.SPLD_MarketingStatement.Text != ""
                        if ( CompareAttributeToString( mSPLDef, "SPLD_MarketingStatement", "Text", "" ) != 0 )
                        { 
                           //:GeneratePDF_DFU( mSPLDef, mSPLDefPDF, lFile,
                           //:           szSectionType,
                           //:           "SPLD_MarketingSection",
                           //:           "SPLD_MarketingStatement",
                           //:           "SPLD_MarketingUsage",
                           //:           "SPLD_MarketingUsageOrdering",
                           //:           szLeadingBlanks,
                           //:           szWriteBuffer )
                           omSPLDef_GeneratePDF_DFU( mSPLDef, mSPLDefPDF, lFile, szSectionType, "SPLD_MarketingSection", "SPLD_MarketingStatement", "SPLD_MarketingUsage", "SPLD_MarketingUsageOrdering", szLeadingBlanks, szWriteBuffer );
                        } 

                        //:END
                        //:ELSE
                     } 
                     else
                     { 
                        //:IF mSPLDefPDF.LLD_Block.Name = ""
                        if ( CompareAttributeToString( mSPLDefPDF, "LLD_Block", "Name", "" ) == 0 )
                        { 
                           //:szMsg = "Marketing Section Name for Block is null."
                            {StringBuilder sb_szMsg;
                           if ( szMsg == null )
                              sb_szMsg = new StringBuilder( 32 );
                           else
                              sb_szMsg = new StringBuilder( szMsg );
                                                      ZeidonStringCopy( sb_szMsg, 1, 0, "Marketing Section Name for Block is null.", 1, 0, 91 );
                           szMsg = sb_szMsg.toString( );}
                           //:ELSE
                        } 
                        else
                        { 
                           //:szMsg = "No match on Marketing Section Name: " + mSPLDefPDF.LLD_Block.Name
                           {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
                           StringBuilder sb_szTempString_1;
                           if ( szTempString_1 == null )
                              sb_szTempString_1 = new StringBuilder( 32 );
                           else
                              sb_szTempString_1 = new StringBuilder( szTempString_1 );
                                                       GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_10, 'S', 129, mSPLDefPDF, "LLD_Block", "Name", "", 0 );
                           lTempInteger_10 = mi_lTempInteger_10.intValue( );
                           szTempString_1 = sb_szTempString_1.toString( );}
                            {StringBuilder sb_szMsg;
                           if ( szMsg == null )
                              sb_szMsg = new StringBuilder( 32 );
                           else
                              sb_szMsg = new StringBuilder( szMsg );
                                                      ZeidonStringCopy( sb_szMsg, 1, 0, "No match on Marketing Section Name: ", 1, 0, 91 );
                           szMsg = sb_szMsg.toString( );}
                            {StringBuilder sb_szMsg;
                           if ( szMsg == null )
                              sb_szMsg = new StringBuilder( 32 );
                           else
                              sb_szMsg = new StringBuilder( szMsg );
                                                      ZeidonStringConcat( sb_szMsg, 1, 0, szTempString_1, 1, 0, 91 );
                           szMsg = sb_szMsg.toString( );}
                        } 

                        //:END
                        //://CreateViewFromView( mSPLDefPDF2, mSPLDefPDF )
                        //://NAME VIEW mSPLDefPDF2 "mSPLDefPDFBlock"
                        //:MessageSend( mSPLDef, "", "Generate Label", szMsg, zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
                        MessageSend( mSPLDef, "", "Generate Label", szMsg, zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
                        //://DropView( mSPLDefPDF2 )
                        //:RETURN 2
                        if(8==8)return( 2 );
                     } 

                     //:END
                     //:ELSE
                  } 
                  else
                  { 

                     //:// GENERAL (ENVIRONMENTAL/PHYSICAL HAZARD, FIRST AID or PRECAUTIONARY)
                     //:// IF szSectionType = "OtherHazard" OR
                     //://    szSectionType = "FirstAid" OR
                     //://    szSectionType = "Precautionary"
                     //://  // We can get by using the same operation because all 3 Section Types are handled the same way and the child entity,
                     //://  // SPLDT_GeneralSection, is pointing to the instance of the correct Type.
                     //://    TraceLineS( "Major Block: ", szSectionType )
                     //://    FOR EACH mSPLDef.SPLDT_GeneralSection
                     //://       GeneratePDF_General( mSPLDef, mSPLDefPDF, lFile, szLeadingBlanks, szWriteBuffer )
                     //://    END
                     //:// ELSE

                     //:// STORAGE AND DISPOSAL
                     //:IF szSectionType = "StorageDisposal"
                     if ( ZeidonStringCompare( szSectionType, 1, 0, "StorageDisposal", 1, 0, 51 ) == 0 )
                     { 

                        //:// TraceLineS( "Major Block: ", szSectionType )
                        //:GeneratePDF_DFU( mSPLDef, mSPLDefPDF, lFile,
                        //:        szSectionType,
                        //:        "SPLD_StorageDisposalSection",
                        //:        "SPLD_StorageDisposalStatement",
                        //:        "",
                        //:        "",
                        //:        szLeadingBlanks,
                        //:        szWriteBuffer )
                        omSPLDef_GeneratePDF_DFU( mSPLDef, mSPLDefPDF, lFile, szSectionType, "SPLD_StorageDisposalSection", "SPLD_StorageDisposalStatement", "", "", szLeadingBlanks, szWriteBuffer );

                        //:ELSE
                     } 
                     else
                     { 

                        //:// PRECAUTIONARY
                        //:IF szSectionType = "Precautionary"
                        if ( ZeidonStringCompare( szSectionType, 1, 0, "Precautionary", 1, 0, 51 ) == 0 )
                        { 

                           //:// TraceLineS( "Major Block: ", szSectionType )
                           //:SET CURSOR FIRST mSPLDef.SPLD_GeneralSection WHERE mSPLDef.SPLD_GeneralSection.SectionType = "P"  // SectionType of P is Precautionary
                           RESULT = SetCursorFirstEntityByString( mSPLDef, "SPLD_GeneralSection", "SectionType", "P", "" );
                           //:GeneratePDF_DFU( mSPLDef, mSPLDefPDF, lFile,
                           //:     szSectionType,
                           //:     "SPLD_GeneralSection",
                           //:     "SPLD_GeneralStatement",
                           //:     "",
                           //:     "",
                           //:     szLeadingBlanks,
                           //:     szWriteBuffer )
                           omSPLDef_GeneratePDF_DFU( mSPLDef, mSPLDefPDF, lFile, szSectionType, "SPLD_GeneralSection", "SPLD_GeneralStatement", "", "", szLeadingBlanks, szWriteBuffer );

                           //:ELSE
                        } 
                        else
                        { 

                           //:// FIRST AID
                           //:IF szSectionType = "FirstAid"
                           if ( ZeidonStringCompare( szSectionType, 1, 0, "FirstAid", 1, 0, 51 ) == 0 )
                           { 

                              //:// TraceLineS( "Major Block: ", szSectionType )

                              //:// Check if Title should be converted to upper case.
                              //:szTitle = "First Aid"
                               {StringBuilder sb_szTitle;
                              if ( szTitle == null )
                                 sb_szTitle = new StringBuilder( 32 );
                              else
                                 sb_szTitle = new StringBuilder( szTitle );
                                                            ZeidonStringCopy( sb_szTitle, 1, 0, "First Aid", 1, 0, 91 );
                              szTitle = sb_szTitle.toString( );}
                              //:SET CURSOR FIRST mSPLDefPDF.LLD_SpecialSectionAttribute WHERE mSPLDefPDF.LLD_SpecialSectionAttribute.Name = "Header"
                              RESULT = SetCursorFirstEntityByString( mSPLDefPDF, "LLD_SpecialSectionAttribute", "Name", "Header", "" );
                              //:IF RESULT >= zCURSOR_SET
                              if ( RESULT >= zCURSOR_SET )
                              { 
                                 //:szTitle = "FIRST AID"
                                  {StringBuilder sb_szTitle;
                                 if ( szTitle == null )
                                    sb_szTitle = new StringBuilder( 32 );
                                 else
                                    sb_szTitle = new StringBuilder( szTitle );
                                                                  ZeidonStringCopy( sb_szTitle, 1, 0, "FIRST AID", 1, 0, 91 );
                                 szTitle = sb_szTitle.toString( );}
                              } 

                              //:END

                              //:// Set up First Aid Title.
                              //:szWriteBuffer = szLeadingBlanks + "   <fo:block "
                               {StringBuilder sb_szWriteBuffer;
                              if ( szWriteBuffer == null )
                                 sb_szWriteBuffer = new StringBuilder( 32 );
                              else
                                 sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
                              szWriteBuffer = sb_szWriteBuffer.toString( );}
                               {StringBuilder sb_szWriteBuffer;
                              if ( szWriteBuffer == null )
                                 sb_szWriteBuffer = new StringBuilder( 32 );
                              else
                                 sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <fo:block ", 1, 0, 32001 );
                              szWriteBuffer = sb_szWriteBuffer.toString( );}
                              //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Header", szWriteBuffer )
                              {StringBuilder sb_szWriteBuffer;
                              if ( szWriteBuffer == null )
                                 sb_szWriteBuffer = new StringBuilder( 32 );
                              else
                                 sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                             omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Header", sb_szWriteBuffer );
                              szWriteBuffer = sb_szWriteBuffer.toString( );}
                              //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                              try
                              {
                                  {
                               ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                               m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                               // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                              };
                              }
                              catch ( Exception e )
                              {
                                 throw ZeidonException.wrapException( e );
                              }

                              //:szWriteBuffer = szLeadingBlanks + "      " + szTitle
                               {StringBuilder sb_szWriteBuffer;
                              if ( szWriteBuffer == null )
                                 sb_szWriteBuffer = new StringBuilder( 32 );
                              else
                                 sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
                              szWriteBuffer = sb_szWriteBuffer.toString( );}
                               {StringBuilder sb_szWriteBuffer;
                              if ( szWriteBuffer == null )
                                 sb_szWriteBuffer = new StringBuilder( 32 );
                              else
                                 sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      ", 1, 0, 32001 );
                              szWriteBuffer = sb_szWriteBuffer.toString( );}
                               {StringBuilder sb_szWriteBuffer;
                              if ( szWriteBuffer == null )
                                 sb_szWriteBuffer = new StringBuilder( 32 );
                              else
                                 sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTitle, 1, 0, 32001 );
                              szWriteBuffer = sb_szWriteBuffer.toString( );}
                              //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                              try
                              {
                                  {
                               ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                               m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                               // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                              };
                              }
                              catch ( Exception e )
                              {
                                 throw ZeidonException.wrapException( e );
                              }

                              //:szWriteBuffer = szLeadingBlanks + "   </fo:block>"
                               {StringBuilder sb_szWriteBuffer;
                              if ( szWriteBuffer == null )
                                 sb_szWriteBuffer = new StringBuilder( 32 );
                              else
                                 sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
                              szWriteBuffer = sb_szWriteBuffer.toString( );}
                               {StringBuilder sb_szWriteBuffer;
                              if ( szWriteBuffer == null )
                                 sb_szWriteBuffer = new StringBuilder( 32 );
                              else
                                 sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   </fo:block>", 1, 0, 32001 );
                              szWriteBuffer = sb_szWriteBuffer.toString( );}
                              //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                              try
                              {
                                  {
                               ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                               m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                               // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                              };
                              }
                              catch ( Exception e )
                              {
                                 throw ZeidonException.wrapException( e );
                              }

                              //:SET CURSOR FIRST mSPLDef.SPLD_GeneralSection WHERE mSPLDef.SPLD_GeneralSection.SectionType = "F"  // SectionType of F is First Aid
                              RESULT = SetCursorFirstEntityByString( mSPLDef, "SPLD_GeneralSection", "SectionType", "F", "" );
                              //:GeneratePDF_DFU( mSPLDef, mSPLDefPDF, lFile,
                              //:  szSectionType,
                              //:  "SPLD_GeneralSection",
                              //:  "SPLD_GeneralStatement",
                              //:  "",
                              //:  "",
                              //:  szLeadingBlanks,
                              //:  szWriteBuffer )
                              omSPLDef_GeneratePDF_DFU( mSPLDef, mSPLDefPDF, lFile, szSectionType, "SPLD_GeneralSection", "SPLD_GeneralStatement", "", "", szLeadingBlanks, szWriteBuffer );

                              //:ELSE
                           } 
                           else
                           { 

                              //:// ENVIRONMENTAL/PHYSICAL HAZARD
                              //:IF szSectionType = "EnvironmentalHazard"
                              if ( ZeidonStringCompare( szSectionType, 1, 0, "EnvironmentalHazard", 1, 0, 51 ) == 0 )
                              { 

                                 //:// TraceLineS( "Major Block: ", szSectionType )
                                 //:SET CURSOR FIRST mSPLDef.SPLD_GeneralSection WHERE mSPLDef.SPLD_GeneralSection.SectionType = "E"  // SectionType of E is Environmental Hazard
                                 RESULT = SetCursorFirstEntityByString( mSPLDef, "SPLD_GeneralSection", "SectionType", "E", "" );
                                 //:GeneratePDF_DFU( mSPLDef, mSPLDefPDF, lFile,
                                 //:szSectionType,
                                 //:"SPLD_GeneralSection",
                                 //:"SPLD_GeneralStatement",
                                 //:"",
                                 //:"",
                                 //:szLeadingBlanks,
                                 //:szWriteBuffer )
                                 omSPLDef_GeneratePDF_DFU( mSPLDef, mSPLDefPDF, lFile, szSectionType, "SPLD_GeneralSection", "SPLD_GeneralStatement", "", "", szLeadingBlanks, szWriteBuffer );

                                 //:ELSE
                              } 
                              else
                              { 

                                 //:// HUMAN HAZARD
                                 //:IF szSectionType = "HumanHazard"
                                 if ( ZeidonStringCompare( szSectionType, 1, 0, "HumanHazard", 1, 0, 51 ) == 0 )
                                 { 

                                    //:// Generate the single Hazards entry.
                                    //:// TraceLineS( "Major Block: ", szSectionType )
                                    //:GeneratePDF_Hazards( mSPLDef, mSPLDefPDF, lFile, szSectionType, szLeadingBlanks, szWriteBuffer )
                                    omSPLDef_GeneratePDF_Hazards( mSPLDef, mSPLDefPDF, lFile, szSectionType, szLeadingBlanks, szWriteBuffer );

                                    //:ELSE
                                 } 
                                 else
                                 { 

                                    //:// INGREDIENTS
                                    //:IF szSectionType = "Ingredients"
                                    if ( ZeidonStringCompare( szSectionType, 1, 0, "Ingredients", 1, 0, 51 ) == 0 )
                                    { 

                                       //:// Go to generate Active Ingredients.
                                       //:// TraceLineS( "Major Block: ", szSectionType )
                                       //:GeneratePDF_Ingred( mSPLDef, mSPLDefPDF, lFile, szSectionType, szLeadingBlanks, szWriteBuffer )
                                       omSPLDef_GeneratePDF_Ingred( mSPLDef, mSPLDefPDF, lFile, szSectionType, szLeadingBlanks, szWriteBuffer );

                                       //:ELSE
                                    } 
                                    else
                                    { 

                                       //:// NET CONTENTS
                                       //:IF szSectionType = "NetContents"
                                       if ( ZeidonStringCompare( szSectionType, 1, 0, "NetContents", 1, 0, 51 ) == 0 )
                                       { 

                                          //:// Go to generate Net Contents.
                                          //:// TraceLineS( "Major Block: ", szSectionType )
                                          //:GeneratePDF_Content( mSPLDef, mSPLDefPDF, lFile, szSectionType, szLeadingBlanks, szWriteBuffer )
                                          omSPLDef_GeneratePDF_Content( mSPLDef, mSPLDefPDF, lFile, szSectionType, szLeadingBlanks, szWriteBuffer );

                                          //:ELSE
                                       } 
                                       else
                                       { 

                                          //:// EPA REGISTRATION AND ESTABLISHMENT NUMBERS
                                          //:IF szSectionType = "EPA_RegAndEstNbr"
                                          if ( ZeidonStringCompare( szSectionType, 1, 0, "EPA_RegAndEstNbr", 1, 0, 51 ) == 0 )
                                          { 

                                             //:// Go to generate EPA Reg and Est Numbers.
                                             //:// TraceLineS( "Major Block: ", szSectionType )
                                             //:GeneratePDF_EPA_Reg( mSPLDef, mSPLDefPDF, lFile, szSectionType, szLeadingBlanks, szWriteBuffer )
                                             omSPLDef_GeneratePDF_EPA_Reg( mSPLDef, mSPLDefPDF, lFile, szSectionType, szLeadingBlanks, szWriteBuffer );

                                             //:ELSE
                                          } 
                                          else
                                          { 

                                             //:// PRODUCT NAME
                                             //:IF szSectionType = "ProductName"
                                             if ( ZeidonStringCompare( szSectionType, 1, 0, "ProductName", 1, 0, 51 ) == 0 )
                                             { 

                                                //:// TraceLineS( "Major Block: ", szSectionType )
                                                //:szBlockBlanks = szLeadingBlanks + "   "
                                                 {StringBuilder sb_szBlockBlanks;
                                                if ( szBlockBlanks == null )
                                                   sb_szBlockBlanks = new StringBuilder( 32 );
                                                else
                                                   sb_szBlockBlanks = new StringBuilder( szBlockBlanks );
                                                                                                ZeidonStringCopy( sb_szBlockBlanks, 1, 0, szLeadingBlanks, 1, 0, 51 );
                                                szBlockBlanks = sb_szBlockBlanks.toString( );}
                                                 {StringBuilder sb_szBlockBlanks;
                                                if ( szBlockBlanks == null )
                                                   sb_szBlockBlanks = new StringBuilder( 32 );
                                                else
                                                   sb_szBlockBlanks = new StringBuilder( szBlockBlanks );
                                                                                                ZeidonStringConcat( sb_szBlockBlanks, 1, 0, "   ", 1, 0, 51 );
                                                szBlockBlanks = sb_szBlockBlanks.toString( );}
                                                //:szWriteBuffer = szBlockBlanks + "<fo:block "
                                                 {StringBuilder sb_szWriteBuffer;
                                                if ( szWriteBuffer == null )
                                                   sb_szWriteBuffer = new StringBuilder( 32 );
                                                else
                                                   sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szBlockBlanks, 1, 0, 32001 );
                                                szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                 {StringBuilder sb_szWriteBuffer;
                                                if ( szWriteBuffer == null )
                                                   sb_szWriteBuffer = new StringBuilder( 32 );
                                                else
                                                   sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block ", 1, 0, 32001 );
                                                szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Text", szWriteBuffer )
                                                {StringBuilder sb_szWriteBuffer;
                                                if ( szWriteBuffer == null )
                                                   sb_szWriteBuffer = new StringBuilder( 32 );
                                                else
                                                   sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                 omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Text", sb_szWriteBuffer );
                                                szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                                                try
                                                {
                                                    {
                                                 ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                                                 m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                                                 // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                                                };
                                                }
                                                catch ( Exception e )
                                                {
                                                   throw ZeidonException.wrapException( e );
                                                }

                                                //:szWriteBuffer = szBlockBlanks + "   <xsl:apply-templates select=^SubregPhysicalLabelDef/ProductName^/>"
                                                 {StringBuilder sb_szWriteBuffer;
                                                if ( szWriteBuffer == null )
                                                   sb_szWriteBuffer = new StringBuilder( 32 );
                                                else
                                                   sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szBlockBlanks, 1, 0, 32001 );
                                                szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                 {StringBuilder sb_szWriteBuffer;
                                                if ( szWriteBuffer == null )
                                                   sb_szWriteBuffer = new StringBuilder( 32 );
                                                else
                                                   sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <xsl:apply-templates select=^SubregPhysicalLabelDef/ProductName^/>", 1, 0, 32001 );
                                                szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                                                try
                                                {
                                                    {
                                                 ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                                                 m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                                                 // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                                                };
                                                }
                                                catch ( Exception e )
                                                {
                                                   throw ZeidonException.wrapException( e );
                                                }

                                                //:szWriteBuffer = szBlockBlanks + "</fo:block>"
                                                 {StringBuilder sb_szWriteBuffer;
                                                if ( szWriteBuffer == null )
                                                   sb_szWriteBuffer = new StringBuilder( 32 );
                                                else
                                                   sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szBlockBlanks, 1, 0, 32001 );
                                                szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                 {StringBuilder sb_szWriteBuffer;
                                                if ( szWriteBuffer == null )
                                                   sb_szWriteBuffer = new StringBuilder( 32 );
                                                else
                                                   sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block>", 1, 0, 32001 );
                                                szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                                                try
                                                {
                                                    {
                                                 ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                                                 m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                                                 // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                                                };
                                                }
                                                catch ( Exception e )
                                                {
                                                   throw ZeidonException.wrapException( e );
                                                }

                                                //:ELSE
                                             } 
                                             else
                                             { 

                                                //:// PRODUCT DESCRIPTION
                                                //:IF szSectionType = "Product Description"
                                                if ( ZeidonStringCompare( szSectionType, 1, 0, "Product Description", 1, 0, 51 ) == 0 )
                                                { 

                                                   //:// TraceLineS( "Major Block: ", szSectionType )
                                                   //:szBlockBlanks = szLeadingBlanks + "   "
                                                    {StringBuilder sb_szBlockBlanks;
                                                   if ( szBlockBlanks == null )
                                                      sb_szBlockBlanks = new StringBuilder( 32 );
                                                   else
                                                      sb_szBlockBlanks = new StringBuilder( szBlockBlanks );
                                                                                                      ZeidonStringCopy( sb_szBlockBlanks, 1, 0, szLeadingBlanks, 1, 0, 51 );
                                                   szBlockBlanks = sb_szBlockBlanks.toString( );}
                                                    {StringBuilder sb_szBlockBlanks;
                                                   if ( szBlockBlanks == null )
                                                      sb_szBlockBlanks = new StringBuilder( 32 );
                                                   else
                                                      sb_szBlockBlanks = new StringBuilder( szBlockBlanks );
                                                                                                      ZeidonStringConcat( sb_szBlockBlanks, 1, 0, "   ", 1, 0, 51 );
                                                   szBlockBlanks = sb_szBlockBlanks.toString( );}
                                                   //:szWriteBuffer = szBlockBlanks + "<fo:block>"
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szBlockBlanks, 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block>", 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                                                   try
                                                   {
                                                       {
                                                    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                                                    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                                                    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                                                   };
                                                   }
                                                   catch ( Exception e )
                                                   {
                                                      throw ZeidonException.wrapException( e );
                                                   }

                                                   //:szWriteBuffer = szBlockBlanks + "   <xsl:apply-templates select=^SubregPhysicalLabelDef/SubregLabelContent/SubregProduct/Description^/>"
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szBlockBlanks, 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <xsl:apply-templates select=^SubregPhysicalLabelDef/SubregLabelContent/SubregProduct/Description^/>", 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                                                   try
                                                   {
                                                       {
                                                    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                                                    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                                                    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                                                   };
                                                   }
                                                   catch ( Exception e )
                                                   {
                                                      throw ZeidonException.wrapException( e );
                                                   }

                                                   //:szWriteBuffer = szBlockBlanks + "</fo:block>"
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szBlockBlanks, 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block>", 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                                                   try
                                                   {
                                                       {
                                                    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                                                    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                                                    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                                                   };
                                                   }
                                                   catch ( Exception e )
                                                   {
                                                      throw ZeidonException.wrapException( e );
                                                   }
                                                   //:ELSE
                                                } 
                                                else
                                                { 
                                                   //:// It is an error because there is no processing for the Block.

                                                   //:szMsg = "The Block is empty for Panel: " + mSPLDef.LLD_Panel.Tag + ", Block: " + mSPLDefPDF.LLD_Block.Tag + "."
                                                   {MutableInt mi_lTempInteger_11 = new MutableInt( lTempInteger_11 );
                                                   StringBuilder sb_szTempString_2;
                                                   if ( szTempString_2 == null )
                                                      sb_szTempString_2 = new StringBuilder( 32 );
                                                   else
                                                      sb_szTempString_2 = new StringBuilder( szTempString_2 );
                                                                                                       GetVariableFromAttribute( sb_szTempString_2, mi_lTempInteger_11, 'S', 65, mSPLDef, "LLD_Panel", "Tag", "", 0 );
                                                   lTempInteger_11 = mi_lTempInteger_11.intValue( );
                                                   szTempString_2 = sb_szTempString_2.toString( );}
                                                    {StringBuilder sb_szMsg;
                                                   if ( szMsg == null )
                                                      sb_szMsg = new StringBuilder( 32 );
                                                   else
                                                      sb_szMsg = new StringBuilder( szMsg );
                                                                                                      ZeidonStringCopy( sb_szMsg, 1, 0, "The Block is empty for Panel: ", 1, 0, 91 );
                                                   szMsg = sb_szMsg.toString( );}
                                                    {StringBuilder sb_szMsg;
                                                   if ( szMsg == null )
                                                      sb_szMsg = new StringBuilder( 32 );
                                                   else
                                                      sb_szMsg = new StringBuilder( szMsg );
                                                                                                      ZeidonStringConcat( sb_szMsg, 1, 0, szTempString_2, 1, 0, 91 );
                                                   szMsg = sb_szMsg.toString( );}
                                                    {StringBuilder sb_szMsg;
                                                   if ( szMsg == null )
                                                      sb_szMsg = new StringBuilder( 32 );
                                                   else
                                                      sb_szMsg = new StringBuilder( szMsg );
                                                                                                      ZeidonStringConcat( sb_szMsg, 1, 0, ", Block: ", 1, 0, 91 );
                                                   szMsg = sb_szMsg.toString( );}
                                                   {MutableInt mi_lTempInteger_12 = new MutableInt( lTempInteger_12 );
                                                   StringBuilder sb_szTempString_3;
                                                   if ( szTempString_3 == null )
                                                      sb_szTempString_3 = new StringBuilder( 32 );
                                                   else
                                                      sb_szTempString_3 = new StringBuilder( szTempString_3 );
                                                                                                       GetVariableFromAttribute( sb_szTempString_3, mi_lTempInteger_12, 'S', 65, mSPLDefPDF, "LLD_Block", "Tag", "", 0 );
                                                   lTempInteger_12 = mi_lTempInteger_12.intValue( );
                                                   szTempString_3 = sb_szTempString_3.toString( );}
                                                    {StringBuilder sb_szMsg;
                                                   if ( szMsg == null )
                                                      sb_szMsg = new StringBuilder( 32 );
                                                   else
                                                      sb_szMsg = new StringBuilder( szMsg );
                                                                                                      ZeidonStringConcat( sb_szMsg, 1, 0, szTempString_3, 1, 0, 91 );
                                                   szMsg = sb_szMsg.toString( );}
                                                    {StringBuilder sb_szMsg;
                                                   if ( szMsg == null )
                                                      sb_szMsg = new StringBuilder( 32 );
                                                   else
                                                      sb_szMsg = new StringBuilder( szMsg );
                                                                                                      ZeidonStringConcat( sb_szMsg, 1, 0, ".", 1, 0, 91 );
                                                   szMsg = sb_szMsg.toString( );}
                                                   //:TraceLineS( szMsg, "" )
                                                   TraceLineS( szMsg, "" );

                                                   //:szTitle = "Error:"
                                                    {StringBuilder sb_szTitle;
                                                   if ( szTitle == null )
                                                      sb_szTitle = new StringBuilder( 32 );
                                                   else
                                                      sb_szTitle = new StringBuilder( szTitle );
                                                                                                      ZeidonStringCopy( sb_szTitle, 1, 0, "Error:", 1, 0, 91 );
                                                   szTitle = sb_szTitle.toString( );}

                                                   //:// Set up Error Title.
                                                   //:szWriteBuffer = szLeadingBlanks + "   <fo:block>"
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <fo:block>", 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                                                   try
                                                   {
                                                       {
                                                    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                                                    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                                                    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                                                   };
                                                   }
                                                   catch ( Exception e )
                                                   {
                                                      throw ZeidonException.wrapException( e );
                                                   }

                                                   //:szWriteBuffer = szLeadingBlanks + "      " + szTitle + "   " + szMsg
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      ", 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTitle, 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   ", 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szMsg, 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                                                   try
                                                   {
                                                       {
                                                    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                                                    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                                                    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                                                   };
                                                   }
                                                   catch ( Exception e )
                                                   {
                                                      throw ZeidonException.wrapException( e );
                                                   }

                                                   //:szWriteBuffer = szLeadingBlanks + "   </fo:block>"
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                    {StringBuilder sb_szWriteBuffer;
                                                   if ( szWriteBuffer == null )
                                                      sb_szWriteBuffer = new StringBuilder( 32 );
                                                   else
                                                      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                                                                                                      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   </fo:block>", 1, 0, 32001 );
                                                   szWriteBuffer = sb_szWriteBuffer.toString( );}
                                                   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
                                                   try
                                                   {
                                                       {
                                                    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                                                    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                                                    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
                                                   };
                                                   }
                                                   catch ( Exception e )
                                                   {
                                                      throw ZeidonException.wrapException( e );
                                                   }
                                                } 


                                                //:// MessageSend( mSPLDef, "", "Generate Label", szMsg, zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
                                                //:// RETURN 2
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
                     } 

                     //:END
                  } 

                  //:END
               } 

               //:END
            } 

            //:END

            //:// Add Column list for Marketing Section, if requested.
            //:IF szSectionType = "Marketing" AND mSPLDefPDF.LLD_Block.LLD_ColumnListType != ""
            if ( ZeidonStringCompare( szSectionType, 1, 0, "Marketing", 1, 0, 51 ) == 0 && CompareAttributeToString( mSPLDefPDF, "LLD_Block", "LLD_ColumnListType", "" ) != 0 )
            { 
               //:IF mSPLDefPDF.LLD_Block.LLD_ColumnListType = "C3"
               if ( CompareAttributeToString( mSPLDefPDF, "LLD_Block", "LLD_ColumnListType", "C3" ) == 0 )
               { 
                  //:// Request is 3 Column Claim List.
                  //:// TraceLineS( "Marketing 3-Column List ", "" )
                  //:GeneratePDF_ClmList( mSPLDef, mSPLDefPDF, lFile, szSectionType, szLeadingBlanks, szWriteBuffer, 3 )
                  omSPLDef_GeneratePDF_ClmList( mSPLDef, mSPLDefPDF, lFile, szSectionType, szLeadingBlanks, szWriteBuffer, 3 );
                  //:ELSE
               } 
               else
               { 
                  //:// Default is 2 Column Claim List.
                  //:// TraceLineS( "Marketing 2-Column List ", "" )
                  //:GeneratePDF_ClmList( mSPLDef, mSPLDefPDF, lFile, szSectionType, szLeadingBlanks, szWriteBuffer, 2 )
                  omSPLDef_GeneratePDF_ClmList( mSPLDef, mSPLDefPDF, lFile, szSectionType, szLeadingBlanks, szWriteBuffer, 2 );
               } 

               //:END
            } 

            //:END
         } 

         //:END

         //:// Process Termination.
         //:szWriteBuffer = szLeadingBlanks + "</fo:block-container>"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block-container>", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
         try
         {
             {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         };
         }
         catch ( Exception e )
         {
            throw ZeidonException.wrapException( e );
         }
      } 

      RESULT = SetCursorNextEntity( mSPLDefPDF, "LLD_Block", "" );
      //://?
      //://       szTag = mSPLDefPDF.LLD_Block.ContinuationBlockTag
      //://       IF szTag != ""
      //://          lControl = zQUAL_STRING + zPOS_FIRST + zQUAL_SCOPE_OI
      //://          IF SetEntityCursor( mSPLDefContinue, "LLD_Block", "Tag", lControl, szTag, "", "", 0, "", "" ) >= zCURSOR_SET
      //://
      //://             IF mSPLDefContinue.LLD_Block.ContinuationBlockFlag = "Y" AND mSPLDefContinue.ContinuationStatement EXISTS
      //://                FormatContinueBlock( mSPLDefContinue, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, "B" )
      //://             END
      //://          END
      //://      END
      //://?
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:GeneratePDF_DFU( VIEW mSPLDef    BASED ON LOD mSPLDef,
//:                 VIEW mSPLDefPDF BASED ON LOD mSPLDef,
//:                 INTEGER lFile,
//:                 STRING ( 50 ) szSectionType,
//:                 STRING ( 32 ) szSPLD_SectionName,
//:                 STRING ( 32 ) szStatementName,
//:                 STRING ( 32 ) szUsageTypeEntity,
//:                 STRING ( 32 ) szLoopingEntity,
//:                 STRING ( 50 ) szPassedBlanks,
//:                 STRING ( 32000 ) szWriteBuffer )

//:   SHORT  nRC
public int 
omSPLDef_GeneratePDF_DFU( View     mSPLDef,
                          View     mSPLDefPDF,
                          int      lFile,
                          String   szSectionType,
                          String   szSPLD_SectionName,
                          String   szStatementName,
                          String   szUsageTypeEntity,
                          String   szLoopingEntity,
                          String   szPassedBlanks,
                          String   szWriteBuffer )
{
   int      nRC = 0;


   //:IF szStatementName = "SPLD_DirectionsForUseSection"
   if ( ZeidonStringCompare( szStatementName, 1, 0, "SPLD_DirectionsForUseSection", 1, 0, 33 ) == 0 )
   { 
      //:nRC = SetCursorFirstEntity( mSPLDef, "SPLD_DirectionsForUseCategory", "" )
      nRC = SetCursorFirstEntity( mSPLDef, "SPLD_DirectionsForUseCategory", "" );
      //:LOOP WHILE nRC >= zCURSOR_SET
      while ( nRC >= zCURSOR_SET )
      { 
         //:GeneratePDF_DFU_Section( mSPLDef, mSPLDefPDF, lFile, szSectionType, szSPLD_SectionName, szStatementName,
         //:                         szUsageTypeEntity, szLoopingEntity, szPassedBlanks, szWriteBuffer )
         omSPLDef_GeneratePDF_DFU_Section( mSPLDef, mSPLDefPDF, lFile, szSectionType, szSPLD_SectionName, szStatementName, szUsageTypeEntity, szLoopingEntity, szPassedBlanks, szWriteBuffer );
         //:nRC = SetCursorFirstEntity( mSPLDef, "SPLD_DirectionsForUseCategory", "" )
         nRC = SetCursorFirstEntity( mSPLDef, "SPLD_DirectionsForUseCategory", "" );
      } 

      //:END
      //:ELSE
   } 
   else
   { 
      //:GeneratePDF_DFU_Section( mSPLDef, mSPLDefPDF, lFile, szSectionType, szSPLD_SectionName, szStatementName,
      //:                         szUsageTypeEntity, szLoopingEntity, szPassedBlanks, szWriteBuffer )
      omSPLDef_GeneratePDF_DFU_Section( mSPLDef, mSPLDefPDF, lFile, szSectionType, szSPLD_SectionName, szStatementName, szUsageTypeEntity, szLoopingEntity, szPassedBlanks, szWriteBuffer );
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:GeneratePDF_ClmList( VIEW mSPLDef    BASED ON LOD mSPLDef,
//:                     VIEW mSPLDefPDF BASED ON LOD mSPLDef,
//:                     INTEGER lFile,
//:                     STRING ( 50 )    szSectionType,
//:                     STRING ( 256 )   szPassedBlanks,
//:                     STRING ( 32000 ) szWriteBuffer,
//:                     INTEGER NumberColumns )

//:   VIEW mSPLDef2 BASED ON LOD mSPLDef
public int 
omSPLDef_GeneratePDF_ClmList( View     mSPLDef,
                              View     mSPLDefPDF,
                              int      lFile,
                              String   szSectionType,
                              String   szPassedBlanks,
                              String   szWriteBuffer,
                              int      NumberColumns )
{
   zVIEW    mSPLDef2 = new zVIEW( );
   //:STRING ( 32000 )  szStatementText
   String   szStatementText = null;
   //:STRING ( 32000 )  szTemporaryText
   String   szTemporaryText = null;
   //:STRING ( 50 )     szLeadingBlanks
   String   szLeadingBlanks = null;
   //:STRING ( 50 )     szBreakName1
   String   szBreakName1 = null;
   //:STRING ( 50 )     szBreakName2
   String   szBreakName2 = null;
   //:STRING ( 32 )     szMarginRight
   String   szMarginRight = null;
   //:STRING ( 32 )     szMarginLeft
   String   szMarginLeft = null;
   //:STRING ( 100 )    szSectionTitle
   String   szSectionTitle = null;
   //:STRING ( 100 )    szStatementTitle
   String   szStatementTitle = null;
   //:STRING ( 32 )     szTitleFormat
   String   szTitleFormat = null;
   //:STRING ( 50 )     szSectionName
   String   szSectionName = null;
   //:STRING ( 32 )     szColumnTop
   String   szColumnTop = null;
   //:STRING ( 100 )    szCombinedName
   String   szCombinedName = null;
   //:STRING ( 100 )    szFootnoteText
   String   szFootnoteText = null;
   //:STRING ( 3 )      szFootnoteNumber
   String   szFootnoteNumber = null;
   //:SHORT             nRC
   int      nRC = 0;
   //:INTEGER           CurrentColumnNumber
   int      CurrentColumnNumber = 0;
   //:INTEGER           ItemCount
   int      ItemCount = 0;
   //:INTEGER           FootnoteCount
   int      FootnoteCount = 0;
   //:INTEGER           Column1Count
   int      Column1Count = 0;
   //:INTEGER           Column2Count
   int      Column2Count = 0;
   //:INTEGER           ColumnTotal
   int      ColumnTotal = 0;
   //:DECIMAL           ContainingBlockWidth
   double  ContainingBlockWidth = 0.0;
   //:DECIMAL           ColumnWidth
   double  ColumnWidth = 0.0;
   //:DECIMAL           ColumnHeight
   double  ColumnHeight = 0.0;
   //:DECIMAL           OriginalTopMargin
   double  OriginalTopMargin = 0.0;
   int      RESULT = 0;
   String   szTempString_0 = null;
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
   String   szTempString_1 = null;
   int      lTempInteger_13 = 0;
   int      lTempInteger_14 = 0;
   int      lTempInteger_15 = 0;
   int      lTempInteger_16 = 0;
   double  dTempDecimal_0 = 0.0;
   double  dTempDecimal_1 = 0.0;
   int      lTempInteger_17 = 0;
   double  dTempDecimal_2 = 0.0;
   double  dTempDecimal_3 = 0.0;
   double  dTempDecimal_4 = 0.0;
   double  dTempDecimal_5 = 0.0;
   int      lTempInteger_18 = 0;


   //:// Generate PDF for a "Directory of Use" or "Marketing" Section.

   //:szLeadingBlanks = szPassedBlanks + "   "
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringCopy( sb_szLeadingBlanks, 1, 0, szPassedBlanks, 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringConcat( sb_szLeadingBlanks, 1, 0, "   ", 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}

   //:// Column List of Claim Usage Statements
   //:// The dependent Claim Usage statements are to be listed in 2 or 3 columns, after any regular Statements
   //:// and organized by Claims Classifications.

   //:// Position on the correct Marketing Section.
   //:SET CURSOR FIRST mSPLDef.SPLD_MarketingSection WHERE mSPLDef.SPLD_MarketingSection.Name = mSPLDefPDF.LLD_Block.Name
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, mSPLDefPDF, "LLD_Block", "Name" );
   szTempString_0 = sb_szTempString_0.toString( );}
   RESULT = SetCursorFirstEntityByString( mSPLDef, "SPLD_MarketingSection", "Name", szTempString_0, "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:IssueError( mSPLDef,0,0, "No match on MarketingSection for Column" )
      IssueError( mSPLDef, 0, 0, "No match on MarketingSection for Column" );
   } 

   //:END

   //:// Build the list of unique footnotes.
   //:FOR EACH mSPLDef.SPLD_UsageFootnote
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_UsageFootnote", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:EXCLUDE mSPLDef.SPLD_UsageFootnote NONE
      RESULT = ExcludeEntity( mSPLDef, "SPLD_UsageFootnote", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_UsageFootnote", "" );
   } 

   //:END
   //:ItemCount = 0
   ItemCount = 0;
   //:FOR EACH mSPLDef.SPLD_MarketingStatement
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingStatement", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:FOR EACH mSPLDef.SPLD_MarketingUsageOrdering WITHIN mSPLDef.SPLD_MarketingSection
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "SPLD_MarketingSection" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mSPLDef.SPLD_MarketingUsage.UsageType = "C"
         if ( CompareAttributeToString( mSPLDef, "SPLD_MarketingUsage", "UsageType", "C" ) == 0 )
         { 
            //:ItemCount = ItemCount + 1
            ItemCount = ItemCount + 1;
            //:SET CURSOR FIRST mSPLDef.SPLD_Usage
            //:           WHERE mSPLDef.SPLD_Usage.ID = mSPLDef.SPLD_MarketingUsage.ID
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                         GetIntegerFromAttribute( mi_lTempInteger_0, mSPLDef, "SPLD_MarketingUsage", "ID" );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mSPLDef, "SPLD_Usage", "ID", lTempInteger_0, "" );
            //:IF RESULT >=zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:IF mSPLDef.SPLD_UsageFootnoteUsed EXISTS
               lTempInteger_1 = CheckExistenceOfEntity( mSPLDef, "SPLD_UsageFootnoteUsed" );
               if ( lTempInteger_1 == 0 )
               { 
                  //:SET CURSOR FIRST mSPLDef.SPLD_UsageFootnote
                  //:           WHERE mSPLDef.SPLD_UsageFootnote.ID = mSPLDef.SPLD_UsageFootnoteUsed.ID
                  {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                                     GetIntegerFromAttribute( mi_lTempInteger_2, mSPLDef, "SPLD_UsageFootnoteUsed", "ID" );
                  lTempInteger_2 = mi_lTempInteger_2.intValue( );}
                  RESULT = SetCursorFirstEntityByInteger( mSPLDef, "SPLD_UsageFootnote", "ID", lTempInteger_2, "" );
                  //:IF RESULT < zCURSOR_SET
                  if ( RESULT < zCURSOR_SET )
                  { 
                     //:CREATE ENTITY mSPLDef.SPLD_UsageFootnote
                     RESULT = CreateEntity( mSPLDef, "SPLD_UsageFootnote", zPOS_AFTER );
                     //:mSPLDef.SPLD_UsageFootnote.ID   = mSPLDef.SPLD_UsageFootnoteUsed.ID
                     SetAttributeFromAttribute( mSPLDef, "SPLD_UsageFootnote", "ID", mSPLDef, "SPLD_UsageFootnoteUsed", "ID" );
                     //:mSPLDef.SPLD_UsageFootnote.Text = mSPLDef.SPLD_UsageFootnoteUsed.Text
                     SetAttributeFromAttribute( mSPLDef, "SPLD_UsageFootnote", "Text", mSPLDef, "SPLD_UsageFootnoteUsed", "Text" );
                  } 

                  //:END
               } 

               //:END
            } 

            //:END
         } 

         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "SPLD_MarketingSection" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingStatement", "" );
      //:END
   } 

   //:END
   //:IF ItemCount = 0
   if ( ItemCount == 0 )
   { 
      //:// There are no Claims entries, so give error and exit.
      //:MessageSend( mSPLDef, "", "Generate Label",
      //:             "The Marketing Section for Column list has no Claim entries.",
      //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
      MessageSend( mSPLDef, "", "Generate Label", "The Marketing Section for Column list has no Claim entries.", zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
      //:RETURN 2
      if(8==8)return( 2 );
   } 

   //:END

   //:FootnoteCount = 0
   FootnoteCount = 0;
   //:FOR EACH mSPLDef.SPLD_UsageFootnote
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_UsageFootnote", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:FootnoteCount = FootnoteCount + 1
      FootnoteCount = FootnoteCount + 1;
      //:ItemCount     = ItemCount + 1  // Also add to total item count.
      ItemCount = ItemCount + 1;
      //:mSPLDef.SPLD_UsageFootnote.wFootNoteRelativeNumber = FootnoteCount
      SetAttributeFromInteger( mSPLDef, "SPLD_UsageFootnote", "wFootNoteRelativeNumber", FootnoteCount );
      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_UsageFootnote", "" );
   } 

   //:END

   //:// Set the work attribute with combination Usage Name and Footnote designator.
   //:FOR EACH mSPLDef.SPLD_MarketingStatement
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingStatement", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:FOR EACH mSPLDef.SPLD_MarketingUsageOrdering WITHIN mSPLDef.SPLD_MarketingSection
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "SPLD_MarketingSection" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:szCombinedName = mSPLDef.SPLD_MarketingUsage.Name
         {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
         StringBuilder sb_szCombinedName;
         if ( szCombinedName == null )
            sb_szCombinedName = new StringBuilder( 32 );
         else
            sb_szCombinedName = new StringBuilder( szCombinedName );
                   GetVariableFromAttribute( sb_szCombinedName, mi_lTempInteger_3, 'S', 101, mSPLDef, "SPLD_MarketingUsage", "Name", "", 0 );
         lTempInteger_3 = mi_lTempInteger_3.intValue( );
         szCombinedName = sb_szCombinedName.toString( );}
         //:SET CURSOR FIRST mSPLDef.SPLD_Usage
         //:           WHERE mSPLDef.SPLD_Usage.ID = mSPLDef.SPLD_MarketingUsage.ID
         {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
                   GetIntegerFromAttribute( mi_lTempInteger_4, mSPLDef, "SPLD_MarketingUsage", "ID" );
         lTempInteger_4 = mi_lTempInteger_4.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSPLDef, "SPLD_Usage", "ID", lTempInteger_4, "" );
         //:IF RESULT >=zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:IF mSPLDef.SPLD_UsageFootnoteUsed EXISTS
            lTempInteger_5 = CheckExistenceOfEntity( mSPLDef, "SPLD_UsageFootnoteUsed" );
            if ( lTempInteger_5 == 0 )
            { 
               //:SET CURSOR FIRST mSPLDef.SPLD_UsageFootnote
               //:           WHERE mSPLDef.SPLD_UsageFootnote.ID = mSPLDef.SPLD_UsageFootnoteUsed.ID
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
                               GetIntegerFromAttribute( mi_lTempInteger_6, mSPLDef, "SPLD_UsageFootnoteUsed", "ID" );
               lTempInteger_6 = mi_lTempInteger_6.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mSPLDef, "SPLD_UsageFootnote", "ID", lTempInteger_6, "" );
               //:szFootnoteNumber = mSPLDef.SPLD_UsageFootnote.Symbol
               {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
               StringBuilder sb_szFootnoteNumber;
               if ( szFootnoteNumber == null )
                  sb_szFootnoteNumber = new StringBuilder( 32 );
               else
                  sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                               GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_7, 'S', 4, mSPLDef, "SPLD_UsageFootnote", "Symbol", "", 0 );
               lTempInteger_7 = mi_lTempInteger_7.intValue( );
               szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               //:IF szFootnoteNumber = ""
               if ( ZeidonStringCompare( szFootnoteNumber, 1, 0, "", 1, 0, 4 ) == 0 )
               { 
                  //:szFootnoteNumber = mSPLDef.SPLD_UsageFootnote.wFootNoteRelativeNumber
                  {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
                  StringBuilder sb_szFootnoteNumber;
                  if ( szFootnoteNumber == null )
                     sb_szFootnoteNumber = new StringBuilder( 32 );
                  else
                     sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                                     GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_8, 'S', 4, mSPLDef, "SPLD_UsageFootnote", "wFootNoteRelativeNumber", "", 0 );
                  lTempInteger_8 = mi_lTempInteger_8.intValue( );
                  szFootnoteNumber = sb_szFootnoteNumber.toString( );}
               } 

               //:END
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
            //:mSPLDef.SPLD_MarketingUsage.wNameWithFootnoteDesignator = szCombinedName
            SetAttributeFromString( mSPLDef, "SPLD_MarketingUsage", "wNameWithFootnoteDesignator", szCombinedName );
         } 

         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "SPLD_MarketingSection" );
         //:END
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingStatement", "" );
      //:END
   } 

   //:END

   //:// Build the two or three columns subobjects from the SPLD_MarketingUsageOrdering entities.
   //:// If specific breaks have been specified, break there. If not, put the same number of entries in each column.
   //:IF mSPLDefPDF.LLD_Block.UsageColumn1BreakName = ""
   if ( CompareAttributeToString( mSPLDefPDF, "LLD_Block", "UsageColumn1BreakName", "" ) == 0 )
   { 
      //:Column1Count = ItemCount / NumberColumns
      Column1Count = ItemCount / NumberColumns;
      //:ColumnTotal = Column1Count * NumberColumns
      ColumnTotal = Column1Count * NumberColumns;
      //:IF ColumnTotal < ItemCount
      if ( ColumnTotal < ItemCount )
      { 
         //:// Since column aren't going to be equal, add one to first and second columns.
         //:Column1Count = Column1Count + 1
         Column1Count = Column1Count + 1;
      } 

      //:END
      //:Column2Count = Column1Count * 2    // The last count of the second column is twice the last count of the first.
      Column2Count = Column1Count * 2;
      //:ItemCount = 0
      ItemCount = 0;
      //:FOR EACH mSPLDef.SPLD_MarketingUsageOrdering WITHIN mSPLDef.SPLD_MarketingSection
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "SPLD_MarketingSection" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mSPLDef.SPLD_MarketingUsage.UsageType = "C"
         if ( CompareAttributeToString( mSPLDef, "SPLD_MarketingUsage", "UsageType", "C" ) == 0 )
         { 
            //:ItemCount = ItemCount + 1
            ItemCount = ItemCount + 1;
            //:IF ItemCount <= Column1Count
            if ( ItemCount <= Column1Count )
            { 
               //:CREATE ENTITY mSPLDef.DisplayUsageColumn1
               RESULT = CreateEntity( mSPLDef, "DisplayUsageColumn1", zPOS_AFTER );
               //:mSPLDef.DisplayUsageColumn1.Name = mSPLDef.SPLD_MarketingUsage.wNameWithFootnoteDesignator
               SetAttributeFromAttribute( mSPLDef, "DisplayUsageColumn1", "Name", mSPLDef, "SPLD_MarketingUsage", "wNameWithFootnoteDesignator" );
               //:ELSE
            } 
            else
            { 
               //:IF ItemCount > Column1Count AND ItemCount <= Column2Count
               if ( ItemCount > Column1Count && ItemCount <= Column2Count )
               { 
                  //:CREATE ENTITY mSPLDef.DisplayUsageColumn2
                  RESULT = CreateEntity( mSPLDef, "DisplayUsageColumn2", zPOS_AFTER );
                  //:mSPLDef.DisplayUsageColumn2.Name = mSPLDef.SPLD_MarketingUsage.wNameWithFootnoteDesignator
                  SetAttributeFromAttribute( mSPLDef, "DisplayUsageColumn2", "Name", mSPLDef, "SPLD_MarketingUsage", "wNameWithFootnoteDesignator" );
                  //:ELSE
               } 
               else
               { 
                  //:CREATE ENTITY mSPLDef.DisplayUsageColumn3
                  RESULT = CreateEntity( mSPLDef, "DisplayUsageColumn3", zPOS_AFTER );
                  //:mSPLDef.DisplayUsageColumn3.Name = mSPLDef.SPLD_MarketingUsage.wNameWithFootnoteDesignator
                  SetAttributeFromAttribute( mSPLDef, "DisplayUsageColumn3", "Name", mSPLDef, "SPLD_MarketingUsage", "wNameWithFootnoteDesignator" );
               } 

               //:END
            } 

            //:END
         } 

         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "SPLD_MarketingSection" );
         //:END
      } 

      //:END

      //:// Set CurrentColumnNumber for any footnote processing below.
      //:IF ItemCount <= Column1Count
      if ( ItemCount <= Column1Count )
      { 
         //:CurrentColumnNumber = 1
         CurrentColumnNumber = 1;
         //:ELSE
      } 
      else
      { 
         //:IF ItemCount <= Column2Count
         if ( ItemCount <= Column2Count )
         { 
            //:CurrentColumnNumber = 2
            CurrentColumnNumber = 2;
            //:ELSE
         } 
         else
         { 
            //:CurrentColumnNumber = 3
            CurrentColumnNumber = 3;
         } 

         //:END
      } 

      //:END

      //:ELSE
   } 
   else
   { 
      //:// Specific Breaks have been specified.
      //:szBreakName1 = mSPLDefPDF.LLD_Block.UsageColumn1BreakName
      {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
      StringBuilder sb_szBreakName1;
      if ( szBreakName1 == null )
         sb_szBreakName1 = new StringBuilder( 32 );
      else
         sb_szBreakName1 = new StringBuilder( szBreakName1 );
             GetVariableFromAttribute( sb_szBreakName1, mi_lTempInteger_9, 'S', 51, mSPLDefPDF, "LLD_Block", "UsageColumn1BreakName", "", 0 );
      lTempInteger_9 = mi_lTempInteger_9.intValue( );
      szBreakName1 = sb_szBreakName1.toString( );}
      //:szBreakName2 = mSPLDefPDF.LLD_Block.UsageColumn2BreakName
      {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
      StringBuilder sb_szBreakName2;
      if ( szBreakName2 == null )
         sb_szBreakName2 = new StringBuilder( 32 );
      else
         sb_szBreakName2 = new StringBuilder( szBreakName2 );
             GetVariableFromAttribute( sb_szBreakName2, mi_lTempInteger_10, 'S', 51, mSPLDefPDF, "LLD_Block", "UsageColumn2BreakName", "", 0 );
      lTempInteger_10 = mi_lTempInteger_10.intValue( );
      szBreakName2 = sb_szBreakName2.toString( );}
      //:CurrentColumnNumber = 1
      CurrentColumnNumber = 1;
      //:FOR EACH mSPLDef.SPLD_MarketingUsageOrdering WITHIN mSPLDef.SPLD_MarketingSection
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "SPLD_MarketingSection" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF mSPLDef.SPLD_MarketingUsage.UsageType = "C"
         if ( CompareAttributeToString( mSPLDef, "SPLD_MarketingUsage", "UsageType", "C" ) == 0 )
         { 
            //:IF mSPLDef.SPLD_MarketingUsage.Name = szBreakName1
            if ( CompareAttributeToString( mSPLDef, "SPLD_MarketingUsage", "Name", szBreakName1 ) == 0 )
            { 
               //:CurrentColumnNumber = 2
               CurrentColumnNumber = 2;
               //:ELSE
            } 
            else
            { 
               //:IF mSPLDef.SPLD_MarketingUsage.Name = szBreakName2
               if ( CompareAttributeToString( mSPLDef, "SPLD_MarketingUsage", "Name", szBreakName2 ) == 0 )
               { 
                  //:CurrentColumnNumber = 3
                  CurrentColumnNumber = 3;
               } 

               //:END
            } 

            //:END
            //:IF CurrentColumnNumber = 1
            if ( CurrentColumnNumber == 1 )
            { 
               //:CREATE ENTITY mSPLDef.DisplayUsageColumn1
               RESULT = CreateEntity( mSPLDef, "DisplayUsageColumn1", zPOS_AFTER );
               //:mSPLDef.DisplayUsageColumn1.Name = mSPLDef.SPLD_MarketingUsage.wNameWithFootnoteDesignator
               SetAttributeFromAttribute( mSPLDef, "DisplayUsageColumn1", "Name", mSPLDef, "SPLD_MarketingUsage", "wNameWithFootnoteDesignator" );
               //:ELSE
            } 
            else
            { 
               //:IF CurrentColumnNumber = 2
               if ( CurrentColumnNumber == 2 )
               { 
                  //:CREATE ENTITY mSPLDef.DisplayUsageColumn2
                  RESULT = CreateEntity( mSPLDef, "DisplayUsageColumn2", zPOS_AFTER );
                  //:mSPLDef.DisplayUsageColumn2.Name = mSPLDef.SPLD_MarketingUsage.wNameWithFootnoteDesignator
                  SetAttributeFromAttribute( mSPLDef, "DisplayUsageColumn2", "Name", mSPLDef, "SPLD_MarketingUsage", "wNameWithFootnoteDesignator" );
                  //:ELSE
               } 
               else
               { 
                  //:CREATE ENTITY mSPLDef.DisplayUsageColumn3
                  RESULT = CreateEntity( mSPLDef, "DisplayUsageColumn3", zPOS_AFTER );
                  //:mSPLDef.DisplayUsageColumn3.Name = mSPLDef.SPLD_MarketingUsage.wNameWithFootnoteDesignator
                  SetAttributeFromAttribute( mSPLDef, "DisplayUsageColumn3", "Name", mSPLDef, "SPLD_MarketingUsage", "wNameWithFootnoteDesignator" );
               } 

               //:END
            } 

            //:END
         } 

         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "SPLD_MarketingSection" );
         //:END
      } 

      //:END
   } 

   //:END

   //:// Add any Footnote entries to the last Column.
   //:FOR EACH mSPLDef.SPLD_UsageFootnote
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_UsageFootnote", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:szFootnoteNumber = mSPLDef.SPLD_UsageFootnote.Symbol
      {MutableInt mi_lTempInteger_11 = new MutableInt( lTempInteger_11 );
      StringBuilder sb_szFootnoteNumber;
      if ( szFootnoteNumber == null )
         sb_szFootnoteNumber = new StringBuilder( 32 );
      else
         sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
             GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_11, 'S', 4, mSPLDef, "SPLD_UsageFootnote", "Symbol", "", 0 );
      lTempInteger_11 = mi_lTempInteger_11.intValue( );
      szFootnoteNumber = sb_szFootnoteNumber.toString( );}
      //:IF szFootnoteNumber = ""
      if ( ZeidonStringCompare( szFootnoteNumber, 1, 0, "", 1, 0, 4 ) == 0 )
      { 
         //:szFootnoteNumber = mSPLDef.SPLD_UsageFootnote.wFootNoteRelativeNumber
         {MutableInt mi_lTempInteger_12 = new MutableInt( lTempInteger_12 );
         StringBuilder sb_szFootnoteNumber;
         if ( szFootnoteNumber == null )
            sb_szFootnoteNumber = new StringBuilder( 32 );
         else
            sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                   GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_12, 'S', 4, mSPLDef, "SPLD_UsageFootnote", "wFootNoteRelativeNumber", "", 0 );
         lTempInteger_12 = mi_lTempInteger_12.intValue( );
         szFootnoteNumber = sb_szFootnoteNumber.toString( );}
      } 

      //:END
      //:szFootnoteText = "<sup> " + szFootnoteNumber + "</sup>" + mSPLDef.SPLD_UsageFootnote.Text
       {StringBuilder sb_szFootnoteText;
      if ( szFootnoteText == null )
         sb_szFootnoteText = new StringBuilder( 32 );
      else
         sb_szFootnoteText = new StringBuilder( szFootnoteText );
            ZeidonStringCopy( sb_szFootnoteText, 1, 0, "<sup> ", 1, 0, 101 );
      szFootnoteText = sb_szFootnoteText.toString( );}
       {StringBuilder sb_szFootnoteText;
      if ( szFootnoteText == null )
         sb_szFootnoteText = new StringBuilder( 32 );
      else
         sb_szFootnoteText = new StringBuilder( szFootnoteText );
            ZeidonStringConcat( sb_szFootnoteText, 1, 0, szFootnoteNumber, 1, 0, 101 );
      szFootnoteText = sb_szFootnoteText.toString( );}
       {StringBuilder sb_szFootnoteText;
      if ( szFootnoteText == null )
         sb_szFootnoteText = new StringBuilder( 32 );
      else
         sb_szFootnoteText = new StringBuilder( szFootnoteText );
            ZeidonStringConcat( sb_szFootnoteText, 1, 0, "</sup>", 1, 0, 101 );
      szFootnoteText = sb_szFootnoteText.toString( );}
      {MutableInt mi_lTempInteger_13 = new MutableInt( lTempInteger_13 );
      StringBuilder sb_szTempString_1;
      if ( szTempString_1 == null )
         sb_szTempString_1 = new StringBuilder( 32 );
      else
         sb_szTempString_1 = new StringBuilder( szTempString_1 );
             GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_13, 'S', 4097, mSPLDef, "SPLD_UsageFootnote", "Text", "", 0 );
      lTempInteger_13 = mi_lTempInteger_13.intValue( );
      szTempString_1 = sb_szTempString_1.toString( );}
       {StringBuilder sb_szFootnoteText;
      if ( szFootnoteText == null )
         sb_szFootnoteText = new StringBuilder( 32 );
      else
         sb_szFootnoteText = new StringBuilder( szFootnoteText );
            ZeidonStringConcat( sb_szFootnoteText, 1, 0, szTempString_1, 1, 0, 101 );
      szFootnoteText = sb_szFootnoteText.toString( );}
      //:IF CurrentColumnNumber = 1
      if ( CurrentColumnNumber == 1 )
      { 
         //:CREATE ENTITY mSPLDef.DisplayUsageColumn1
         RESULT = CreateEntity( mSPLDef, "DisplayUsageColumn1", zPOS_AFTER );
         //:mSPLDef.DisplayUsageColumn1.Name = szFootnoteText
         SetAttributeFromString( mSPLDef, "DisplayUsageColumn1", "Name", szFootnoteText );
         //:ELSE
      } 
      else
      { 
         //:IF CurrentColumnNumber = 2
         if ( CurrentColumnNumber == 2 )
         { 
            //:CREATE ENTITY mSPLDef.DisplayUsageColumn2
            RESULT = CreateEntity( mSPLDef, "DisplayUsageColumn2", zPOS_AFTER );
            //:mSPLDef.DisplayUsageColumn2.Name = szFootnoteText
            SetAttributeFromString( mSPLDef, "DisplayUsageColumn2", "Name", szFootnoteText );
            //:ELSE
         } 
         else
         { 
            //:CREATE ENTITY mSPLDef.DisplayUsageColumn3
            RESULT = CreateEntity( mSPLDef, "DisplayUsageColumn3", zPOS_AFTER );
            //:mSPLDef.DisplayUsageColumn3.Name = szFootnoteText
            SetAttributeFromString( mSPLDef, "DisplayUsageColumn3", "Name", szFootnoteText );
         } 

         //:END
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_UsageFootnote", "" );
      //:END
   } 

   //:END

   //:// Build the two or three Blocks listing the entries in each of the three work subobjects.
   //:// If there is a Column definition entry, we will get the Top, Width and LeftMargin values from there.
   //:// If not, the width of each Block (column) will be 1/2 or 1/3 of the width of the source Block, minus the left margin,
   //:// which is from the main block.
   //:// We will create a temporary Block, initialized from the source Block, with the modified values for
   //:// each of the three columns.

   //:ACTIVATE mSPLDef2 EMPTY
   RESULT = ActivateEmptyObjectInstance( mSPLDef2, "mSPLDef", mSPLDef, zSINGLE );
   //:NAME VIEW mSPLDef2 "mSPLDef2"
   SetNameForView( mSPLDef2, "mSPLDef2", null, zLEVEL_TASK );
   //:CREATE ENTITY mSPLDef2.SubregPhysicalLabelDef
   RESULT = CreateEntity( mSPLDef2, "SubregPhysicalLabelDef", zPOS_AFTER );
   //:CREATE ENTITY mSPLDef2.SPLD_LLD
   RESULT = CreateEntity( mSPLDef2, "SPLD_LLD", zPOS_AFTER );
   //:CREATE ENTITY mSPLDef2.LLD_Page
   RESULT = CreateEntity( mSPLDef2, "LLD_Page", zPOS_AFTER );
   //:CREATE ENTITY mSPLDef2.LLD_Panel
   RESULT = CreateEntity( mSPLDef2, "LLD_Panel", zPOS_AFTER );
   //:CREATE ENTITY mSPLDef2.LLD_Block
   RESULT = CreateEntity( mSPLDef2, "LLD_Block", zPOS_AFTER );
   //:SetMatchingAttributesByName( mSPLDef2, "LLD_Block", mSPLDefPDF, "LLD_Block", zSET_ALL )
   SetMatchingAttributesByName( mSPLDef2, "LLD_Block", mSPLDefPDF, "LLD_Block", zSET_ALL );

   //:ContainingBlockWidth = mSPLDefPDF.LLD_Block.Width
   {MutableDouble md_ContainingBlockWidth = new MutableDouble( ContainingBlockWidth );
       GetDecimalFromAttribute( md_ContainingBlockWidth, mSPLDefPDF, "LLD_Block", "Width" );
   ContainingBlockWidth = md_ContainingBlockWidth.doubleValue( );}
   //:ColumnWidth = ContainingBlockWidth / NumberColumns
   ColumnWidth = ContainingBlockWidth / NumberColumns;
   //:mSPLDef2.LLD_Block.Width = ColumnWidth
   SetAttributeFromDecimal( mSPLDef2, "LLD_Block", "Width", ColumnWidth );
   //:mSPLDef2.LLD_Block.Left  = 0
   SetAttributeFromInteger( mSPLDef2, "LLD_Block", "Left", 0 );

   //:// The top will be whatever is in the Block, plus any top margin for the Column List LLD_SpecialSectionAttribute.

   //:SET CURSOR FIRST mSPLDefPDF.LLD_SpecialSectionAttribute WHERE mSPLDefPDF.LLD_SpecialSectionAttribute.Name = "Column List"
   RESULT = SetCursorFirstEntityByString( mSPLDefPDF, "LLD_SpecialSectionAttribute", "Name", "Column List", "" );
   //:IF RESULT >= zCURSOR_SET
   if ( RESULT >= zCURSOR_SET )
   { 
      //:mSPLDef2.LLD_Block.Top = mSPLDefPDF.LLD_SpecialSectionAttrBlock.MarginTop
      SetAttributeFromAttribute( mSPLDef2, "LLD_Block", "Top", mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "MarginTop" );
      //:szColumnTop = mSPLDef2.LLD_Block.Top
      {MutableInt mi_lTempInteger_14 = new MutableInt( lTempInteger_14 );
      StringBuilder sb_szColumnTop;
      if ( szColumnTop == null )
         sb_szColumnTop = new StringBuilder( 32 );
      else
         sb_szColumnTop = new StringBuilder( szColumnTop );
             GetVariableFromAttribute( sb_szColumnTop, mi_lTempInteger_14, 'S', 33, mSPLDef2, "LLD_Block", "Top", "", 0 );
      lTempInteger_14 = mi_lTempInteger_14.intValue( );
      szColumnTop = sb_szColumnTop.toString( );}
      //:// The MarginTop of LLD_SpecialSectionAttrBlock is used only for specifying the BlockContainer holding the individual entries
      //:// within a column, but not for each entry within a column. Thus we need set two different values, the Original TopMargin
      //:// value for the BlockContainer and null for each row. Because we're modifying the TopMargin value in the object, we need
      //:// to reset it in the end.
      //:// We will create mSPLDef2 for generating the BlockContainer for the column and use mSPLDefPDF for each row.
      //:OriginalTopMargin = mSPLDefPDF.LLD_SpecialSectionAttrBlock.MarginTop
      {MutableDouble md_OriginalTopMargin = new MutableDouble( OriginalTopMargin );
             GetDecimalFromAttribute( md_OriginalTopMargin, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "MarginTop" );
      OriginalTopMargin = md_OriginalTopMargin.doubleValue( );}
      //:szMarginLeft       = mSPLDefPDF.LLD_SpecialSectionAttrBlock.MarginLeft
      {MutableInt mi_lTempInteger_15 = new MutableInt( lTempInteger_15 );
      StringBuilder sb_szMarginLeft;
      if ( szMarginLeft == null )
         sb_szMarginLeft = new StringBuilder( 32 );
      else
         sb_szMarginLeft = new StringBuilder( szMarginLeft );
             GetVariableFromAttribute( sb_szMarginLeft, mi_lTempInteger_15, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "MarginLeft", "", 0 );
      lTempInteger_15 = mi_lTempInteger_15.intValue( );
      szMarginLeft = sb_szMarginLeft.toString( );}
      //:szMarginRight      = mSPLDefPDF.LLD_SpecialSectionAttrBlock.MarginRight
      {MutableInt mi_lTempInteger_16 = new MutableInt( lTempInteger_16 );
      StringBuilder sb_szMarginRight;
      if ( szMarginRight == null )
         sb_szMarginRight = new StringBuilder( 32 );
      else
         sb_szMarginRight = new StringBuilder( szMarginRight );
             GetVariableFromAttribute( sb_szMarginRight, mi_lTempInteger_16, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "MarginRight", "", 0 );
      lTempInteger_16 = mi_lTempInteger_16.intValue( );
      szMarginRight = sb_szMarginRight.toString( );}

      //:// Create a Block LLD_SpecialSectionAttribute entry containing the characteristics of the Column List entry, except for dropping
      //:// the top margin.
      //:CREATE ENTITY mSPLDef2.LLD_SpecialSectionAttribute
      RESULT = CreateEntity( mSPLDef2, "LLD_SpecialSectionAttribute", zPOS_AFTER );
      //:mSPLDef2.LLD_SpecialSectionAttribute.Name = "Block"
      SetAttributeFromString( mSPLDef2, "LLD_SpecialSectionAttribute", "Name", "Block" );
      //:CREATE ENTITY mSPLDef2.LLD_SpecialSectionAttrBlock
      RESULT = CreateEntity( mSPLDef2, "LLD_SpecialSectionAttrBlock", zPOS_AFTER );
      //:SetMatchingAttributesByName( mSPLDef2, "LLD_SpecialSectionAttrBlock", mSPLDefPDF, "LLD_SpecialSectionAttrBlock", zSET_ALL )
      SetMatchingAttributesByName( mSPLDef2, "LLD_SpecialSectionAttrBlock", mSPLDefPDF, "LLD_SpecialSectionAttrBlock", zSET_ALL );
      //:mSPLDefPDF.LLD_SpecialSectionAttrBlock.MarginTop = ""     // Now set MarginTop for each row.
      SetAttributeFromString( mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "MarginTop", "" );
      //:ELSE
   } 
   else
   { 

      //:mSPLDef2.LLD_Block.Top = mSPLDef2.LLD_Block.Top
      SetAttributeFromAttribute( mSPLDef2, "LLD_Block", "Top", mSPLDef2, "LLD_Block", "Top" );
      //:szMarginLeft  = ".01"
       {StringBuilder sb_szMarginLeft;
      if ( szMarginLeft == null )
         sb_szMarginLeft = new StringBuilder( 32 );
      else
         sb_szMarginLeft = new StringBuilder( szMarginLeft );
            ZeidonStringCopy( sb_szMarginLeft, 1, 0, ".01", 1, 0, 33 );
      szMarginLeft = sb_szMarginLeft.toString( );}
      //:szMarginRight = ".01"
       {StringBuilder sb_szMarginRight;
      if ( szMarginRight == null )
         sb_szMarginRight = new StringBuilder( 32 );
      else
         sb_szMarginRight = new StringBuilder( szMarginRight );
            ZeidonStringCopy( sb_szMarginRight, 1, 0, ".01", 1, 0, 33 );
      szMarginRight = sb_szMarginRight.toString( );}
   } 

   //:END
   //:ColumnHeight = mSPLDefPDF.LLD_Block.Height - mSPLDef2.LLD_Block.Top
   {MutableDouble md_dTempDecimal_0 = new MutableDouble( dTempDecimal_0 );
       GetDecimalFromAttribute( md_dTempDecimal_0, mSPLDefPDF, "LLD_Block", "Height" );
   dTempDecimal_0 = md_dTempDecimal_0.doubleValue( );}
   {MutableDouble md_dTempDecimal_1 = new MutableDouble( dTempDecimal_1 );
       GetDecimalFromAttribute( md_dTempDecimal_1, mSPLDef2, "LLD_Block", "Top" );
   dTempDecimal_1 = md_dTempDecimal_1.doubleValue( );}
   ColumnHeight = dTempDecimal_0 - dTempDecimal_1;
   //:mSPLDef2.LLD_Block.Height = ColumnHeight
   SetAttributeFromDecimal( mSPLDef2, "LLD_Block", "Height", ColumnHeight );

   //:szSectionName = mSPLDef.DisplaySection.XML_SectionName
   {MutableInt mi_lTempInteger_17 = new MutableInt( lTempInteger_17 );
   StringBuilder sb_szSectionName;
   if ( szSectionName == null )
      sb_szSectionName = new StringBuilder( 32 );
   else
      sb_szSectionName = new StringBuilder( szSectionName );
       GetVariableFromAttribute( sb_szSectionName, mi_lTempInteger_17, 'S', 51, mSPLDef, "DisplaySection", "XML_SectionName", "", 0 );
   lTempInteger_17 = mi_lTempInteger_17.intValue( );
   szSectionName = sb_szSectionName.toString( );}

   //:// Generate column 1 Block.
   //:FormatBlockContainer( mSPLDef2, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, szColumnTop )
   omSPLDef_FormatBlockContainer( mSPLDef2, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, szColumnTop );

   //:szWriteBuffer = szLeadingBlanks + "   <xsl:for-each select=^SubregPhysicalLabelDef/" + szSectionName + "/DisplayUsageColumn1^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <xsl:for-each select=^SubregPhysicalLabelDef/", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szSectionName, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/DisplayUsageColumn1^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "      <fo:block "
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      <fo:block ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Column List", szWriteBuffer )
   {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
       omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Column List", sb_szWriteBuffer );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "         <xsl:apply-templates select=^Name^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "         <xsl:apply-templates select=^Name^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = szLeadingBlanks + "      </fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      </fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "   </xsl:for-each>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   </xsl:for-each>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "</fo:block-container>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block-container>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Generate column 2 Block.
   //:mSPLDef2.LLD_Block.Left = mSPLDef2.LLD_Block.Left + ColumnWidth
   {MutableDouble md_dTempDecimal_2 = new MutableDouble( dTempDecimal_2 );
       GetDecimalFromAttribute( md_dTempDecimal_2, mSPLDef2, "LLD_Block", "Left" );
   dTempDecimal_2 = md_dTempDecimal_2.doubleValue( );}
   dTempDecimal_3 = dTempDecimal_2 + ColumnWidth;
   SetAttributeFromDecimal( mSPLDef2, "LLD_Block", "Left", dTempDecimal_3 );
   //:FormatBlockContainer( mSPLDef2, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, szColumnTop )
   omSPLDef_FormatBlockContainer( mSPLDef2, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, szColumnTop );

   //:szWriteBuffer = szLeadingBlanks + "   <xsl:for-each select=^SubregPhysicalLabelDef/" + szSectionName + "/DisplayUsageColumn2^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <xsl:for-each select=^SubregPhysicalLabelDef/", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szSectionName, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/DisplayUsageColumn2^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "      <fo:block "
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      <fo:block ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Column List", szWriteBuffer )
   {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
       omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Column List", sb_szWriteBuffer );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "         <xsl:apply-templates select=^Name^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "         <xsl:apply-templates select=^Name^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:szWriteBuffer = szLeadingBlanks + "      </fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      </fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "   </xsl:for-each>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   </xsl:for-each>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "</fo:block-container>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block-container>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Generate column 3 Block.
   //:IF NumberColumns = 3
   if ( NumberColumns == 3 )
   { 
      //:mSPLDef2.LLD_Block.Left = mSPLDef2.LLD_Block.Left + ColumnWidth
      {MutableDouble md_dTempDecimal_4 = new MutableDouble( dTempDecimal_4 );
             GetDecimalFromAttribute( md_dTempDecimal_4, mSPLDef2, "LLD_Block", "Left" );
      dTempDecimal_4 = md_dTempDecimal_4.doubleValue( );}
      dTempDecimal_5 = dTempDecimal_4 + ColumnWidth;
      SetAttributeFromDecimal( mSPLDef2, "LLD_Block", "Left", dTempDecimal_5 );
      //:FormatBlockContainer( mSPLDef2, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, szColumnTop )
      omSPLDef_FormatBlockContainer( mSPLDef2, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, szColumnTop );

      //:szWriteBuffer = szLeadingBlanks + "   <xsl:for-each select=^SubregPhysicalLabelDef/" + szSectionName + "/DisplayUsageColumn3^>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <xsl:for-each select=^SubregPhysicalLabelDef/", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szSectionName, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/DisplayUsageColumn3^>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:szWriteBuffer = szLeadingBlanks + "      <fo:block "
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      <fo:block ", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Column List", szWriteBuffer )
      {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
             omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Column List", sb_szWriteBuffer );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:szWriteBuffer = szLeadingBlanks + "         <xsl:apply-templates select=^Name^/>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "         <xsl:apply-templates select=^Name^/>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
      //:szWriteBuffer = szLeadingBlanks + "      </fo:block>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      </fo:block>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:szWriteBuffer = szLeadingBlanks + "   </xsl:for-each>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   </xsl:for-each>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:szWriteBuffer = szLeadingBlanks + "</fo:block-container>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block-container>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
   } 

   //:END

   //://DELETE ENTITY mSPLDef2.LLD_Block NONE
   //:DropObjectInstance( mSPLDef2 )
   DropObjectInstance( mSPLDef2 );

   //:// Build the work object containing each Claim under the appropriate Classification.
   //:// Type: C - Claim;  S - Surface;  T - Application Type;  U - Location (Area of Use).
   //:// ClaimsClassification: Bacteria; Protozoa; Viruses; Fungi.
   //:// First delete any existing entries.
   //:FOR EACH mSPLDef.SPLDI_ClaimsClassification
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLDI_ClaimsClassification", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mSPLDef.SPLDI_ClaimsClassification NONE
      RESULT = DeleteEntity( mSPLDef, "SPLDI_ClaimsClassification", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mSPLDef, "SPLDI_ClaimsClassification", "" );
   } 

   //:END
   //:FOR EACH mSPLDef.SPLD_MarketingUsageOrdering WITHIN mSPLDef.SPLD_MarketingSection
   //:          WHERE mSPLDef.SPLD_MarketingUsage.UsageType = "C" // just looking for Type=Claim
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "SPLD_MarketingSection" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      if ( CompareAttributeToString( mSPLDef, "SPLD_MarketingUsage", "UsageType", "C" ) == 0 )
      { 
         //:SET CURSOR FIRST mSPLDef.SPLDI_ClaimsClassification
         //:        WHERE mSPLDef.SPLDI_ClaimsClassification.ClaimsClassification = mSPLDef.SPLD_MarketingUsage.ClaimsClassification
         {StringBuilder sb_szTempString_0;
         if ( szTempString_0 == null )
            sb_szTempString_0 = new StringBuilder( 32 );
         else
            sb_szTempString_0 = new StringBuilder( szTempString_0 );
                   GetStringFromAttribute( sb_szTempString_0, mSPLDef, "SPLD_MarketingUsage", "ClaimsClassification" );
         szTempString_0 = sb_szTempString_0.toString( );}
         RESULT = SetCursorFirstEntityByString( mSPLDef, "SPLDI_ClaimsClassification", "ClaimsClassification", szTempString_0, "" );
         //:IF RESULT < zCURSOR_SET
         if ( RESULT < zCURSOR_SET )
         { 
            //:// Did not find the entity of the proper ClaimsClassification, so create one.
            //:CREATE ENTITY mSPLDef.SPLDI_ClaimsClassification
            RESULT = CreateEntity( mSPLDef, "SPLDI_ClaimsClassification", zPOS_AFTER );
            //:mSPLDef.SPLDI_ClaimsClassification.ClaimsClassification = mSPLDef.SPLD_MarketingUsage.ClaimsClassification
            SetAttributeFromAttribute( mSPLDef, "SPLDI_ClaimsClassification", "ClaimsClassification", mSPLDef, "SPLD_MarketingUsage", "ClaimsClassification" );
            //:INCLUDE mSPLDef.SPLDI_ClaimsUsage FROM mSPLDef.SPLD_MarketingUsage
            RESULT = IncludeSubobjectFromSubobject( mSPLDef, "SPLDI_ClaimsUsage", mSPLDef, "SPLD_MarketingUsage", zPOS_AFTER );
            //:IF RESULT < 0
            if ( RESULT < 0 )
            { 
               //:TraceLineS( "GeneratePDF_ClmList Include SPLDI_ClaimsUsage FROM SPLD_MarketingUsage", " ======== CAN'T HAPPEN ===========================" )
               TraceLineS( "GeneratePDF_ClmList Include SPLDI_ClaimsUsage FROM SPLD_MarketingUsage", " ======== CAN'T HAPPEN ===========================" );
               //:DisplayEntityInstance( mSPLDef, "SPLDI_ClaimsUsage" )
               DisplayEntityInstance( mSPLDef, "SPLDI_ClaimsUsage" );
               //:DisplayEntityInstance( mSPLDef, "SPLD_MarketingUsage" )
               DisplayEntityInstance( mSPLDef, "SPLD_MarketingUsage" );
               //:IssueError( mSPLDef, 0, 0, "Include Error" )
               IssueError( mSPLDef, 0, 0, "Include Error" );
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:// Check to see if the SPLD_MarketingUsage has already been included under the current ClaimsClassification.
            //:SET CURSOR FIRST mSPLDef.SPLDI_ClaimsUsage WHERE mSPLDef.SPLDI_ClaimsUsage.ID = mSPLDef.SPLD_MarketingUsage.ID
            {MutableInt mi_lTempInteger_18 = new MutableInt( lTempInteger_18 );
                         GetIntegerFromAttribute( mi_lTempInteger_18, mSPLDef, "SPLD_MarketingUsage", "ID" );
            lTempInteger_18 = mi_lTempInteger_18.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mSPLDef, "SPLDI_ClaimsUsage", "ID", lTempInteger_18, "" );
            //:IF RESULT < zCURSOR_SET
            if ( RESULT < zCURSOR_SET )
            { 
               //:// Not already included so set cursor to the last included to include the entity at the end.
               //:SET CURSOR LAST mSPLDef.SPLDI_ClaimsUsage
               RESULT = SetCursorLastEntity( mSPLDef, "SPLDI_ClaimsUsage", "" );
               //:INCLUDE mSPLDef.SPLDI_ClaimsUsage FROM mSPLDef.SPLD_MarketingUsage
               RESULT = IncludeSubobjectFromSubobject( mSPLDef, "SPLDI_ClaimsUsage", mSPLDef, "SPLD_MarketingUsage", zPOS_AFTER );
               //:IF RESULT < 0
               if ( RESULT < 0 )
               { 
                  //:TraceLineS( "GeneratePDF_ClmList Include SPLDI_ClaimsUsage FROM SPLD_MarketingUsage", " =========== CAN'T HAPPEN EITHER ========================" )
                  TraceLineS( "GeneratePDF_ClmList Include SPLDI_ClaimsUsage FROM SPLD_MarketingUsage", " =========== CAN'T HAPPEN EITHER ========================" );
                  //:DisplayEntityInstance( mSPLDef, "SPLDI_ClaimsUsage" )
                  DisplayEntityInstance( mSPLDef, "SPLDI_ClaimsUsage" );
                  //:DisplayEntityInstance( mSPLDef, "SPLD_MarketingUsage" )
                  DisplayEntityInstance( mSPLDef, "SPLD_MarketingUsage" );
                  //:IssueError( mSPLDef, 0, 0, "Include Error" )
                  IssueError( mSPLDef, 0, 0, "Include Error" );
               } 

               //:END
               //:ELSE
            } 
            else
            { 
               //:TraceLineS( "GeneratePDF_ClmList Include SPLDI_ClaimsUsage FROM SPLD_MarketingUsage", " ====== ALREADY INCLUDED ... COULD HAPPEN =============================" )
               TraceLineS( "GeneratePDF_ClmList Include SPLDI_ClaimsUsage FROM SPLD_MarketingUsage", " ====== ALREADY INCLUDED ... COULD HAPPEN =============================" );
               //:// DisplayEntityInstance( mSPLDef, "SPLDI_ClaimsUsage" )
               //:DisplayEntityInstance( mSPLDef, "SPLD_MarketingUsage" )
               DisplayEntityInstance( mSPLDef, "SPLD_MarketingUsage" );
            } 

            //:END
         } 

      } 

      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "SPLD_MarketingSection" );
      //:END
   } 

   //:END

   //:// Reset LLD_SpecialSectionAttrBlock.MarginTop back to its original value.
   //:mSPLDefPDF.LLD_SpecialSectionAttrBlock.MarginTop = OriginalTopMargin
   SetAttributeFromDecimal( mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "MarginTop", OriginalTopMargin );
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:GeneratePDF_Ingred( VIEW mSPLDef    BASED ON LOD mSPLDef,
//:                    VIEW mSPLDefPDF BASED ON LOD mSPLDef,
//:                    INTEGER lFile,
//:                    STRING ( 50 )    szSectionType,
//:                    STRING ( 50 )    szPassedBlanks,
//:                    STRING ( 32000 ) szWriteBuffer )

//:   STRING ( 50 )    szLeadingBlanks
public int 
omSPLDef_GeneratePDF_Ingred( View     mSPLDef,
                             View     mSPLDefPDF,
                             int      lFile,
                             String   szSectionType,
                             String   szPassedBlanks,
                             String   szWriteBuffer )
{
   String   szLeadingBlanks = null;
   //:STRING ( 512 )   szIngredientsText
   String   szIngredientsText = null;
   //:STRING ( 256 )   szPeriodFiller
   String   szPeriodFiller = null;
   //:STRING ( 16 )    szPercent
   String   szPercent = null;
   int      RESULT = 0;

   //:// Generate XSL Statements for a "Active Ingredients" Section.

   //:szLeadingBlanks = szPassedBlanks + "   "
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringCopy( sb_szLeadingBlanks, 1, 0, szPassedBlanks, 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringConcat( sb_szLeadingBlanks, 1, 0, "   ", 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}
   //:SET CURSOR FIRST mSPLDef.SPLD_IngredientsSection
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_IngredientsSection", "" );
   //:szWriteBuffer = szLeadingBlanks + "<!-- Ingredients Section using Leader -->"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<!-- Ingredients Section using Leader -->", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //://FormatBlockContainer( mSPLDef, mSPLDef, lFile, szLeadingBlanks, szWriteBuffer, "" )

   //:// Ingredients Title
   //:szWriteBuffer = szLeadingBlanks + "<fo:block "
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Ingredients Title", szWriteBuffer )
   {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
       omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Ingredients Title", sb_szWriteBuffer );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "   <xsl:apply-templates select=^SubregPhysicalLabelDef/SPLD_IngredientsSection/ActiveTitle^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <xsl:apply-templates select=^SubregPhysicalLabelDef/SPLD_IngredientsSection/ActiveTitle^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "</fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Ingredients Percent
   //:// Use XSL Leader for formatting.
   //:szWriteBuffer = szLeadingBlanks + "<xsl:for-each select=^SubregPhysicalLabelDef/SPLD_IngredientsSection/SPLD_IngredientsStatement^>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<xsl:for-each select=^SubregPhysicalLabelDef/SPLD_IngredientsSection/SPLD_IngredientsStatement^>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "   <fo:block text-align-last=^justify^ "
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <fo:block text-align-last=^justify^ ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Ingredients Items", szWriteBuffer )
   {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
       omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Ingredients Items", sb_szWriteBuffer );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "      <xsl:apply-templates select=^ChemicalName^/>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      <xsl:apply-templates select=^ChemicalName^/>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "      <fo:leader leader-pattern=^dots^ />"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      <fo:leader leader-pattern=^dots^ />", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "      <xsl:apply-templates select=^Percent^/>%"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      <xsl:apply-templates select=^Percent^/>%", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "   </fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   </fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "</xsl:for-each>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</xsl:for-each>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Inert Percent
   //:IF mSPLDef.SPLD_IngredientsSection.GeneralInactivePercent > 0
   if ( CompareAttributeToInteger( mSPLDef, "SPLD_IngredientsSection", "GeneralInactivePercent", 0 ) > 0 )
   { 
      //:szWriteBuffer = szLeadingBlanks + "<fo:block text-align-last=^justify^ "
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block text-align-last=^justify^ ", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Ingredients Inert", szWriteBuffer )
      {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
             omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Ingredients Inert", sb_szWriteBuffer );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:szWriteBuffer = szLeadingBlanks + "   <xsl:apply-templates select=^SubregPhysicalLabelDef/SPLD_IngredientsSection/InertTitle^/>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <xsl:apply-templates select=^SubregPhysicalLabelDef/SPLD_IngredientsSection/InertTitle^/>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:szWriteBuffer = szLeadingBlanks + "   <fo:leader leader-pattern=^dots^ />"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <fo:leader leader-pattern=^dots^ />", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:szWriteBuffer = szLeadingBlanks + "   <xsl:apply-templates select=^SubregPhysicalLabelDef/SPLD_IngredientsSection/GeneralInactivePercent^/>%"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <xsl:apply-templates select=^SubregPhysicalLabelDef/SPLD_IngredientsSection/GeneralInactivePercent^/>%", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:szWriteBuffer = szLeadingBlanks + "</fo:block>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
   } 

   //:END

   //:// Total
   //:szWriteBuffer = szLeadingBlanks + "<fo:block text-align-last=^justify^ "
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block text-align-last=^justify^ ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Ingredients Total", szWriteBuffer )
   {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
       omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Ingredients Total", sb_szWriteBuffer );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "   TOTAL"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   TOTAL", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "   <fo:leader leader-pattern=^dots^ />100%"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <fo:leader leader-pattern=^dots^ />100%", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "</fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   return( 0 );
//    // Close opening Block.
//    //szWriteBuffer = szLeadingBlanks + "</fo:block-container>"
//    //WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
// END
} 


//:TRANSFORMATION OPERATION
//:GeneratePDF_Content( VIEW mSPLDef    BASED ON LOD mSPLDef,
//:                     VIEW mSPLDefPDF BASED ON LOD mSPLDef,
//:                     INTEGER lFile,
//:                     STRING ( 50 )    szSectionType,
//:                     STRING ( 50 )    szPassedBlanks,
//:                     STRING ( 32000 ) szWriteBuffer )

//:   STRING ( 50 )    szLeadingBlanks
public int 
omSPLDef_GeneratePDF_Content( View     mSPLDef,
                              View     mSPLDefPDF,
                              int      lFile,
                              String   szSectionType,
                              String   szPassedBlanks,
                              String   szWriteBuffer )
{
   String   szLeadingBlanks = null;
   //:STRING ( 512 )   szNetContentsText
   String   szNetContentsText = null;

   //:// Generate PDF for "NetContents".

   //:szLeadingBlanks = szPassedBlanks + "   "
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringCopy( sb_szLeadingBlanks, 1, 0, szPassedBlanks, 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringConcat( sb_szLeadingBlanks, 1, 0, "   ", 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}

   //://szNetContentsText = mSPLDef.SPLD_TemplateSection.TitleOverride
   //:IF szNetContentsText = ""
   if ( ZeidonStringCompare( szNetContentsText, 1, 0, "", 1, 0, 513 ) == 0 )
   { 
      //:szNetContentsText = "Net Contents: One Gallon (3.784 litres)"
       {StringBuilder sb_szNetContentsText;
      if ( szNetContentsText == null )
         sb_szNetContentsText = new StringBuilder( 32 );
      else
         sb_szNetContentsText = new StringBuilder( szNetContentsText );
            ZeidonStringCopy( sb_szNetContentsText, 1, 0, "Net Contents: One Gallon (3.784 litres)", 1, 0, 513 );
      szNetContentsText = sb_szNetContentsText.toString( );}
   } 

   //:END

   //:szWriteBuffer = szLeadingBlanks + "<fo:block "
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Text", szWriteBuffer )
   {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
       omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Text", sb_szWriteBuffer );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "   " + szNetContentsText
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szNetContentsText, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "</fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:GeneratePDF_Hazards( VIEW mSPLDef    BASED ON LOD mSPLDef,
//:                     VIEW mSPLDefPDF BASED ON LOD mSPLDef,
//:                     INTEGER lFile,
//:                     STRING ( 50 )    szSectionType,
//:                     STRING ( 50 )    szPassedBlanks,
//:                     STRING ( 32000 ) szWriteBuffer )

//:   STRING ( 50 )   szLeadingBlanks
public int 
omSPLDef_GeneratePDF_Hazards( View     mSPLDef,
                              View     mSPLDefPDF,
                              int      lFile,
                              String   szSectionType,
                              String   szPassedBlanks,
                              String   szWriteBuffer )
{
   String   szLeadingBlanks = null;
   //:STRING ( 90 )   szChildHazardWarning
   String   szChildHazardWarning = null;
   //:STRING ( 90 )   szEPA_SignalWord
   String   szEPA_SignalWord = null;
   //:STRING ( 1000 ) szStatementText
   String   szStatementText = null;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:// Generate PDF for each Hazards key word.

   //:szLeadingBlanks = szPassedBlanks + "   "
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringCopy( sb_szLeadingBlanks, 1, 0, szPassedBlanks, 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringConcat( sb_szLeadingBlanks, 1, 0, "   ", 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}
   //:SET CURSOR FIRST mSPLDef.SPLD_HumanHazardSection
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_HumanHazardSection", "" );
   //:GetStringFromAttributeByContext( szChildHazardWarning, mSPLDef, "SPLD_HumanHazardSection", "EPA_ChildHazardWarning", "", 90 )
   {StringBuilder sb_szChildHazardWarning;
   if ( szChildHazardWarning == null )
      sb_szChildHazardWarning = new StringBuilder( 32 );
   else
      sb_szChildHazardWarning = new StringBuilder( szChildHazardWarning );
       GetStringFromAttributeByContext( sb_szChildHazardWarning, mSPLDef, "SPLD_HumanHazardSection", "EPA_ChildHazardWarning", "", 90 );
   szChildHazardWarning = sb_szChildHazardWarning.toString( );}
   //:szEPA_SignalWord     = mSPLDef.SPLD_HumanHazardSection.EPA_SignalWord
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szEPA_SignalWord;
   if ( szEPA_SignalWord == null )
      sb_szEPA_SignalWord = new StringBuilder( 32 );
   else
      sb_szEPA_SignalWord = new StringBuilder( szEPA_SignalWord );
       GetVariableFromAttribute( sb_szEPA_SignalWord, mi_lTempInteger_0, 'S', 91, mSPLDef, "SPLD_HumanHazardSection", "EPA_SignalWord", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szEPA_SignalWord = sb_szEPA_SignalWord.toString( );}
   //:szStatementText      = mSPLDef.SPLD_HumanHazardSection.dSelectedStatement
   {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
   StringBuilder sb_szStatementText;
   if ( szStatementText == null )
      sb_szStatementText = new StringBuilder( 32 );
   else
      sb_szStatementText = new StringBuilder( szStatementText );
       GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_1, 'S', 1001, mSPLDef, "SPLD_HumanHazardSection", "dSelectedStatement", "", 0 );
   lTempInteger_1 = mi_lTempInteger_1.intValue( );
   szStatementText = sb_szStatementText.toString( );}

   //:// Child Hazard Warning
   //:szWriteBuffer = szLeadingBlanks + "<fo:block "
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Hazards Warning", szWriteBuffer )
   {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
       omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Hazards Warning", sb_szWriteBuffer );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "   " + szChildHazardWarning
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szChildHazardWarning, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "</fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// EPA Signal Word
   //:szWriteBuffer = szLeadingBlanks + "<fo:block "
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Hazards Signal Word", szWriteBuffer )
   {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
       omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Hazards Signal Word", sb_szWriteBuffer );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "   " + szEPA_SignalWord
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szEPA_SignalWord, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "</fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:// Precautionary Statement
   //:szWriteBuffer = szLeadingBlanks + "<fo:block "
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Hazards Precautionary", szWriteBuffer )
   {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
       omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Hazards Precautionary", sb_szWriteBuffer );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "   " + szStatementText
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szStatementText, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "</fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:GeneratePDF_General( VIEW mSPLDef    BASED ON LOD mSPLDef,
//:                     VIEW mSPLDefPDF BASED ON LOD mSPLDef,
//:                     INTEGER lFile,
//:                     STRING ( 50 )    szPassedBlanks,
//:                     STRING ( 32000 ) szWriteBuffer )

//:   STRING ( 50 )     szLeadingBlanks
public int 
omSPLDef_GeneratePDF_General( View     mSPLDef,
                              View     mSPLDefPDF,
                              int      lFile,
                              String   szPassedBlanks,
                              String   szWriteBuffer )
{
   String   szLeadingBlanks = null;
   //:STRING ( 32000 )  szStatementText
   String   szStatementText = null;
   //:STRING ( 256 )    szCombinedTitle
   String   szCombinedTitle = null;
   //:STRING ( 32 )     szLineHeight
   String   szLineHeight = null;
   //:STRING ( 32 )     szStatementLeading
   String   szStatementLeading = null;


   //:// Generate PDF for a "General" Section, which can be Precautionary, Environmental/Physical Hazard or First Aid.

   //:szLeadingBlanks = szPassedBlanks + "   "
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringCopy( sb_szLeadingBlanks, 1, 0, szPassedBlanks, 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringConcat( sb_szLeadingBlanks, 1, 0, "   ", 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}
   //:szLineHeight = ""
    {StringBuilder sb_szLineHeight;
   if ( szLineHeight == null )
      sb_szLineHeight = new StringBuilder( 32 );
   else
      sb_szLineHeight = new StringBuilder( szLineHeight );
      ZeidonStringCopy( sb_szLineHeight, 1, 0, "", 1, 0, 33 );
   szLineHeight = sb_szLineHeight.toString( );}
   return( 0 );
//    /*szStatementLeading = mSPLDef.SPLD_TemplateSection.dStatementLeading
//    IF szStatementLeading != ""
//       szLineHeight = "line-height:" + szStatementLeading +";"
//    ELSE
//       szStatementLeading = mSPLDef.SPLD_TemplatePanel.dStatementLeadingDefault
//       IF szStatementLeading != ""
//          szLineHeight = "line-height:" + szStatementLeading +";"
//       END
//    END
//    //SET CURSOR FIRST mSPLDef.SPLD_GeneralSection WHERE mSPLDef.SPLD_GeneralSection.ID = mSPLDef.SPLDT_GeneralSection.ID
// // DisplayEntityInstance( mSPLDef, "SPLD_GeneralSection" )
//    GeneratePDF_Title( mSPLDef, lFile, "SPLD_GeneralSection", szCombinedTitle, szWriteBuffer )
//    FOR EACH mSPLDef.SPLD_GeneralStatement
//       szStatementText = szCombinedTitle + mSPLDef.SPLD_GeneralStatement.Text
//       szWriteBuffer = szCombinedTitle + szStatementText
//       IF szLineHeight != ""
//          AddHTML_TagAttribute( mSPLDef, szWriteBuffer, 32000, "p", "style", szLineHeight, zQUOTES, 2 )
//       ELSE
//          AddHTML_TagAttribute( mSPLDef, szWriteBuffer, 32000, "p", "", "", "", 0 )
//       END
//       WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
//       szCombinedTitle = ""    // null out any combined Title that was to be included on the first statement
//    END*/
// END
} 


//:TRANSFORMATION OPERATION
//:GeneratePDF_StorDisp( VIEW mSPLDef    BASED ON LOD mSPLDef,
//:                      VIEW mSPLDefPDF BASED ON LOD mSPLDef,
//:                      INTEGER lFile,
//:                      STRING ( 32 )    szSectionType,
//:                      STRING ( 50 )    szPassedBlanks,
//:                      STRING ( 32000 ) szWriteBuffer )
public int 
omSPLDef_GeneratePDF_StorDisp( View     mSPLDef,
                               View     mSPLDefPDF,
                               int      lFile,
                               String   szSectionType,
                               String   szPassedBlanks,
                               String   szWriteBuffer )
{

   return( 0 );
//    // Right now there appears to be no reason why the Storage and Disposal section can't reuse the same code
//    // as the Directions For Use and Marketing sections.
// END
} 


//:LOCAL OPERATION
private int 
omSPLDef_CopyDirsForUseStmts( View     NewSPLD,
                              View     SrcSLC )
{
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   //:CopyDirsForUseStmts( VIEW NewSPLD BASED ON LOD mSPLDef,
   //:                  VIEW SrcSLC  BASED ON LOD mSubLC )

   //:// SHORT nAllChanges
   //:// SHORT nChanges
   //:// SHORT nSubChanges
   //:// SHORT nTemp

   //:// nAllChanges = 0
   //:FOR EACH SrcSLC.S_DirectionsForUseStatement
   RESULT = SetCursorFirstEntity( SrcSLC, "S_DirectionsForUseStatement", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //://    nChanges = 0
      //://    nSubChanges = 0
      //:CREATE ENTITY NewSPLD.SPLD_DirectionsForUseStatement
      RESULT = CreateEntity( NewSPLD, "SPLD_DirectionsForUseStatement", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsForUseStatement",
      //:                             SrcSLC, "S_DirectionsForUseStatement", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsForUseStatement", SrcSLC, "S_DirectionsForUseStatement", zSET_NULL );
      //:INCLUDE NewSPLD.S_DirectionsForUseStatement FROM SrcSLC.S_DirectionsForUseStatement
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_DirectionsForUseStatement", SrcSLC, "S_DirectionsForUseStatement", zPOS_AFTER );

      //:FOR EACH SrcSLC.S_InsertTextKeywordDU
      RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextKeywordDU", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:// IF SrcSLC.S_InsertTextKeywordDU.Selected = "Y"
         //:// nChanges = nChanges + 1
         //:   CREATE ENTITY NewSPLD.SPLD_InsertTextKeywordDU
         RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextKeywordDU", zPOS_AFTER );
         //:   SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeywordDU", SrcSLC, "S_InsertTextKeywordDU", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeywordDU", SrcSLC, "S_InsertTextKeywordDU", zSET_NULL );
         //:   FOR EACH SrcSLC.S_InsertTextDU
         RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextDU", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:// IF SrcSLC.S_InsertTextDU.Selected = "Y"
            //:      CREATE ENTITY NewSPLD.SPLD_InsertTextDU
            RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextDU", zPOS_AFTER );
            //:      SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextDU", SrcSLC, "S_InsertTextDU", zSET_NULL )
            SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextDU", SrcSLC, "S_InsertTextDU", zSET_NULL );
            RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextDU", "" );
         } 

         RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextKeywordDU", "" );
         //:   // END
         //:   END
      } 

      //:// END
      //:END
      //:FOR EACH SrcSLC.S_DirectionsUsageOrdering
      RESULT = SetCursorFirstEntity( SrcSLC, "S_DirectionsUsageOrdering", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST NewSPLD.SPLD_Usage WITHIN NewSPLD.SubregLabelContent
         //:           WHERE NewSPLD.SPLD_Usage.PrimarySLC_ID = SrcSLC.S_DirectionsUsage.ID
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                   GetIntegerFromAttribute( mi_lTempInteger_0, SrcSLC, "S_DirectionsUsage", "ID" );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( NewSPLD, "SPLD_Usage", "PrimarySLC_ID", lTempInteger_0, "SubregLabelContent" );
         //:IF RESULT >= zCURSOR_SET
         if ( RESULT >= zCURSOR_SET )
         { 
            //:CREATE ENTITY NewSPLD.SPLD_DirectionsUsageOrdering
            RESULT = CreateEntity( NewSPLD, "SPLD_DirectionsUsageOrdering", zPOS_AFTER );
            //:NewSPLD.SPLD_DirectionsUsageOrdering.PrimarySLC_ID = SrcSLC.S_DirectionsUsageOrdering.ID
            SetAttributeFromAttribute( NewSPLD, "SPLD_DirectionsUsageOrdering", "PrimarySLC_ID", SrcSLC, "S_DirectionsUsageOrdering", "ID" );
            //:INCLUDE NewSPLD.SPLD_DirectionsUsage FROM NewSPLD.SPLD_Usage
            RESULT = IncludeSubobjectFromSubobject( NewSPLD, "SPLD_DirectionsUsage", NewSPLD, "SPLD_Usage", zPOS_AFTER );
         } 

         RESULT = SetCursorNextEntity( SrcSLC, "S_DirectionsUsageOrdering", "" );
         //:END
      } 

      //:END
      //:IF SrcSLC.S_DirectionsForUseSubStatement EXISTS
      lTempInteger_1 = CheckExistenceOfEntity( SrcSLC, "S_DirectionsForUseSubStatement" );
      if ( lTempInteger_1 == 0 )
      { 
         //:SetViewToSubobject( SrcSLC, "S_DirectionsForUseSubStatement" )
         SetViewToSubobject( SrcSLC, "S_DirectionsForUseSubStatement" );
         //:SetViewToSubobject( NewSPLD, "SPLD_DirectionsForUseSubStmt" )
         SetViewToSubobject( NewSPLD, "SPLD_DirectionsForUseSubStmt" );
         //:CopyDirsForUseStmts( NewSPLD, SrcSLC )
         omSPLDef_CopyDirsForUseStmts( NewSPLD, SrcSLC );
         //:// nTemp = CopyDirsForUseStmts( NewSPLD, SrcSLC )
         //:// nSubChanges = nSubChanges + nTemp
         //:ResetViewFromSubobject( NewSPLD )
         ResetViewFromSubobject( NewSPLD );
         //:ResetViewFromSubobject( SrcSLC )
         ResetViewFromSubobject( SrcSLC );
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_DirectionsForUseStatement", "" );
      //:END
   } 

   //:// nChanges = nChanges + nSubChanges
   //:// IF nChanges = 0
   //://    DELETE ENTITY NewSPLD.SPLD_DirectionsForUseStatement LAST
   //:// ELSE
   //://    nAllChanges = nAllChanges + nChanges
   //:// END
   //:END
   return( 0 );
// // RETURN nAllChanges
// END
} 


//:LOCAL OPERATION
//:CopyUsagesRecursive( VIEW NewSPLD BASED ON LOD mSPLDef,
//:                     VIEW SrcSLC  BASED ON LOD mSubLC )

//:   STRING ( 256 ) szText
private int 
omSPLDef_CopyUsagesRecursive( View     NewSPLD,
                              View     SrcSLC )
{
   String   szText = null;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;

   //:// SHORT nAllChanges
   //:// SHORT nChanges
   //:// SHORT nSubChanges
   //:// SHORT nTemp

   //:// nAllChanges = 0
   //:FOR EACH SrcSLC.S_Usage
   RESULT = SetCursorFirstEntity( SrcSLC, "S_Usage", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:// nChanges = 0
      //:// nSubChanges = 0
      //:CREATE ENTITY NewSPLD.SPLD_Usage
      RESULT = CreateEntity( NewSPLD, "SPLD_Usage", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_Usage", SrcSLC, "S_Usage", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_Usage", SrcSLC, "S_Usage", zSET_NULL );
      //:NewSPLD.SPLD_Usage.PrimarySLC_ID = SrcSLC.S_Usage.ID
      SetAttributeFromAttribute( NewSPLD, "SPLD_Usage", "PrimarySLC_ID", SrcSLC, "S_Usage", "ID" );
      //:INCLUDE NewSPLD.S_Usage FROM SrcSLC.S_Usage
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_Usage", SrcSLC, "S_Usage", zPOS_AFTER );
      //:FOR EACH SrcSLC.S_InsertTextKeywordUsage
      RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextKeywordUsage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:// IF SrcSLC.S_InsertTextKeywordUsage.Selected = "Y"
         //:// nChanges = nChanges + 1
         //:   CREATE ENTITY NewSPLD.SPLD_InsertTextKeywordUsage
         RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextKeywordUsage", zPOS_AFTER );
         //:   SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeywordUsage", SrcSLC, "S_InsertTextKeywordUsage", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeywordUsage", SrcSLC, "S_InsertTextKeywordUsage", zSET_NULL );
         //:   FOR EACH SrcSLC.S_InsertTextUsage
         RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextUsage", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:// IF SrcSLC.S_InsertTextUsage.Selected = "Y"
            //:      CREATE ENTITY NewSPLD.SPLD_InsertTextUsage
            RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextUsage", zPOS_AFTER );
            //:      SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextUsage", SrcSLC, "S_InsertTextUsage", zSET_NULL )
            SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextUsage", SrcSLC, "S_InsertTextUsage", zSET_NULL );
            RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextUsage", "" );
         } 

         RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextKeywordUsage", "" );
         //:   // END
         //:   END
      } 

      //:// END
      //:END
      //:IF SrcSLC.S_UsageFootnoteUsed EXISTS
      lTempInteger_0 = CheckExistenceOfEntity( SrcSLC, "S_UsageFootnoteUsed" );
      if ( lTempInteger_0 == 0 )
      { 
         //:szText = SrcSLC.S_UsageFootnoteUsed.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szText;
         if ( szText == null )
            sb_szText = new StringBuilder( 32 );
         else
            sb_szText = new StringBuilder( szText );
                   GetVariableFromAttribute( sb_szText, mi_lTempInteger_1, 'S', 257, SrcSLC, "S_UsageFootnoteUsed", "Text", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szText = sb_szText.toString( );}
         //:SET CURSOR FIRST NewSPLD.SPLD_UsageFootnote WHERE NewSPLD.SPLD_UsageFootnote.Text = szText
         RESULT = SetCursorFirstEntityByString( NewSPLD, "SPLD_UsageFootnote", "Text", szText, "" );
         //:INCLUDE NewSPLD.SPLD_UsageFootnoteUsed FROM NewSPLD.SPLD_UsageFootnote
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "SPLD_UsageFootnoteUsed", NewSPLD, "SPLD_UsageFootnote", zPOS_AFTER );
      } 

      //:END
      //:IF SrcSLC.S_SubUsage EXISTS
      lTempInteger_2 = CheckExistenceOfEntity( SrcSLC, "S_SubUsage" );
      if ( lTempInteger_2 == 0 )
      { 
         //:SetViewToSubobject( SrcSLC, "S_SubUsage" )
         SetViewToSubobject( SrcSLC, "S_SubUsage" );
         //:SetViewToSubobject( NewSPLD, "SPLD_SubUsage" )
         SetViewToSubobject( NewSPLD, "SPLD_SubUsage" );
         //:FOR EACH SrcSLC.S_Usage
         RESULT = SetCursorFirstEntity( SrcSLC, "S_Usage", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CopyUsagesRecursive( NewSPLD, SrcSLC )
            omSPLDef_CopyUsagesRecursive( NewSPLD, SrcSLC );
            RESULT = SetCursorNextEntity( SrcSLC, "S_Usage", "" );
         } 

         //:// nTemp = CopyUsagesRecursive( NewSPLD, SrcSLC )
         //:// nSubChanges = nSubChanges + nTemp
         //:END
         //:ResetViewFromSubobject( NewSPLD )
         ResetViewFromSubobject( NewSPLD );
         //:ResetViewFromSubobject( SrcSLC )
         ResetViewFromSubobject( SrcSLC );
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_Usage", "" );
      //:END
   } 

   //:// nChanges = nChanges + nSubChanges
   //:// IF nChanges = 0
   //://    DELETE ENTITY NewSPLD.SPLD_Usage LAST
   //:// ELSE
   //://    nAllChanges = nAllChanges + nChanges
   //:// END
   //:END
   return( 0 );
//    
// // return nAllChanges
// END
} 


//:LOCAL OPERATION
private int 
omSPLDef_CopyDirsForUseSection( View     NewSPLD,
                                View     SrcSLC )
{
   int      RESULT = 0;

   //:CopyDirsForUseSection( VIEW NewSPLD BASED ON LOD mSPLDef,
   //:                    VIEW SrcSLC  BASED ON LOD mSubLC )

   //:CREATE ENTITY NewSPLD.SPLD_DirectionsForUseSection
   RESULT = CreateEntity( NewSPLD, "SPLD_DirectionsForUseSection", zPOS_AFTER );
   //:SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsForUseSection", SrcSLC, "S_DirectionsForUseSection", zSET_NULL )
   SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsForUseSection", SrcSLC, "S_DirectionsForUseSection", zSET_NULL );
   //:INCLUDE NewSPLD.S_DirectionsForUseSection FROM SrcSLC.S_DirectionsForUseSection
   RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_DirectionsForUseSection", SrcSLC, "S_DirectionsForUseSection", zPOS_AFTER );
   //:FOR EACH SrcSLC.S_InsertTextKeywordSectionDU
   RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextKeywordSectionDU", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:// IF SrcSLC.S_InsertTextKeywordSectionDU.Selected = "Y"
      //:   CREATE ENTITY NewSPLD.SPLD_InsertTextKeywordSectionDU
      RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextKeywordSectionDU", zPOS_AFTER );
      //:   SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeywordSectionDU", SrcSLC, "S_InsertTextKeywordSectionDU", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeywordSectionDU", SrcSLC, "S_InsertTextKeywordSectionDU", zSET_NULL );
      //:   FOR EACH SrcSLC.S_InsertTextSectionDU
      RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextSectionDU", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:// IF SrcSLC.S_InsertTextSectionDU.Selected = "Y"
         //:      CREATE ENTITY NewSPLD.SPLD_InsertTextSectionDU
         RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextSectionDU", zPOS_AFTER );
         //:      SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextSectionDU", SrcSLC, "S_InsertTextSectionDU", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextSectionDU", SrcSLC, "S_InsertTextSectionDU", zSET_NULL );
         RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextSectionDU", "" );
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextKeywordSectionDU", "" );
      //:   // END
      //:   END
   } 

   //:// END
   //:END
   //:CopyDirsForUseStmts( NewSPLD, SrcSLC )
   omSPLDef_CopyDirsForUseStmts( NewSPLD, SrcSLC );
   //:RETURN 0
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:GeneratePDF_EPA_Reg( VIEW mSPLDef    BASED ON LOD mSPLDef,
//:                     VIEW mSPLDefPDF BASED ON LOD mSPLDef,
//:                     INTEGER lFile,
//:                     STRING ( 50 )    szSectionType,
//:                     STRING ( 50 )    szPassedBlanks,
//:                     STRING ( 32000 ) szWriteBuffer )

//:   STRING ( 50 )    szLeadingBlanks
public int 
omSPLDef_GeneratePDF_EPA_Reg( View     mSPLDef,
                              View     mSPLDefPDF,
                              int      lFile,
                              String   szSectionType,
                              String   szPassedBlanks,
                              String   szWriteBuffer )
{
   String   szLeadingBlanks = null;
   //:STRING ( 32000 ) szStatementText
   String   szStatementText = null;
   //:STRING ( 32 )    szEPA_RegNbr
   String   szEPA_RegNbr = null;
   //:STRING ( 32 )    szEPA_EstNbr
   String   szEPA_EstNbr = null;
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;

   //:// Generate PDF for EPA Reg. No. and EPA Est. No..

   //:szLeadingBlanks = szPassedBlanks + "   "
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringCopy( sb_szLeadingBlanks, 1, 0, szPassedBlanks, 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringConcat( sb_szLeadingBlanks, 1, 0, "   ", 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}
   //:SET CURSOR FIRST mSPLDef.SPLD_HumanHazardSection
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_HumanHazardSection", "" );
   //:szEPA_RegNbr = mSPLDef.SubregProduct.EPA_RegistrationNumber
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szEPA_RegNbr;
   if ( szEPA_RegNbr == null )
      sb_szEPA_RegNbr = new StringBuilder( 32 );
   else
      sb_szEPA_RegNbr = new StringBuilder( szEPA_RegNbr );
       GetVariableFromAttribute( sb_szEPA_RegNbr, mi_lTempInteger_0, 'S', 33, mSPLDef, "SubregProduct", "EPA_RegistrationNumber", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szEPA_RegNbr = sb_szEPA_RegNbr.toString( );}
   //:IF szEPA_RegNbr = ""
   if ( ZeidonStringCompare( szEPA_RegNbr, 1, 0, "", 1, 0, 33 ) == 0 )
   { 
      //:szEPA_RegNbr = "*****"
       {StringBuilder sb_szEPA_RegNbr;
      if ( szEPA_RegNbr == null )
         sb_szEPA_RegNbr = new StringBuilder( 32 );
      else
         sb_szEPA_RegNbr = new StringBuilder( szEPA_RegNbr );
            ZeidonStringCopy( sb_szEPA_RegNbr, 1, 0, "*****", 1, 0, 33 );
      szEPA_RegNbr = sb_szEPA_RegNbr.toString( );}
   } 

   //:END
   //:szEPA_EstNbr = mSPLDef.SubregProduct.EPA_EstablishmentNumber
   {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
   StringBuilder sb_szEPA_EstNbr;
   if ( szEPA_EstNbr == null )
      sb_szEPA_EstNbr = new StringBuilder( 32 );
   else
      sb_szEPA_EstNbr = new StringBuilder( szEPA_EstNbr );
       GetVariableFromAttribute( sb_szEPA_EstNbr, mi_lTempInteger_1, 'S', 33, mSPLDef, "SubregProduct", "EPA_EstablishmentNumber", "", 0 );
   lTempInteger_1 = mi_lTempInteger_1.intValue( );
   szEPA_EstNbr = sb_szEPA_EstNbr.toString( );}
   //:IF szEPA_EstNbr = ""
   if ( ZeidonStringCompare( szEPA_EstNbr, 1, 0, "", 1, 0, 33 ) == 0 )
   { 
      //:szEPA_EstNbr = "*****"
       {StringBuilder sb_szEPA_EstNbr;
      if ( szEPA_EstNbr == null )
         sb_szEPA_EstNbr = new StringBuilder( 32 );
      else
         sb_szEPA_EstNbr = new StringBuilder( szEPA_EstNbr );
            ZeidonStringCopy( sb_szEPA_EstNbr, 1, 0, "*****", 1, 0, 33 );
      szEPA_EstNbr = sb_szEPA_EstNbr.toString( );}
   } 

   //:END
   //:szStatementText = "EPA Reg. No. " + szEPA_RegNbr + "   EPA Est. No. " + szEPA_EstNbr
    {StringBuilder sb_szStatementText;
   if ( szStatementText == null )
      sb_szStatementText = new StringBuilder( 32 );
   else
      sb_szStatementText = new StringBuilder( szStatementText );
      ZeidonStringCopy( sb_szStatementText, 1, 0, "EPA Reg. No. ", 1, 0, 32001 );
   szStatementText = sb_szStatementText.toString( );}
    {StringBuilder sb_szStatementText;
   if ( szStatementText == null )
      sb_szStatementText = new StringBuilder( 32 );
   else
      sb_szStatementText = new StringBuilder( szStatementText );
      ZeidonStringConcat( sb_szStatementText, 1, 0, szEPA_RegNbr, 1, 0, 32001 );
   szStatementText = sb_szStatementText.toString( );}
    {StringBuilder sb_szStatementText;
   if ( szStatementText == null )
      sb_szStatementText = new StringBuilder( 32 );
   else
      sb_szStatementText = new StringBuilder( szStatementText );
      ZeidonStringConcat( sb_szStatementText, 1, 0, "   EPA Est. No. ", 1, 0, 32001 );
   szStatementText = sb_szStatementText.toString( );}
    {StringBuilder sb_szStatementText;
   if ( szStatementText == null )
      sb_szStatementText = new StringBuilder( 32 );
   else
      sb_szStatementText = new StringBuilder( szStatementText );
      ZeidonStringConcat( sb_szStatementText, 1, 0, szEPA_EstNbr, 1, 0, 32001 );
   szStatementText = sb_szStatementText.toString( );}

   //:szWriteBuffer = szLeadingBlanks + "<fo:block "
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Text", szWriteBuffer )
   {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
       omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Text", sb_szWriteBuffer );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "   " + szStatementText
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   ", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szStatementText, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }

   //:szWriteBuffer = szLeadingBlanks + "</fo:block>"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block>", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dFullNameLFM( VIEW mSPLDef BASED ON LOD mSPLDef,
//:              STRING ( 32 ) InternalEntityStructure,
//:              STRING ( 32 ) InternalAttribStructure,
//:              SHORT GetOrSetFlag )
public int 
omSPLDef_dFullNameLFM( View     mSPLDef,
                       String InternalEntityStructure,
                       String InternalAttribStructure,
                       Integer   GetOrSetFlag )
{


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :
         break ;
      //:  //PersonName_LastFirstMiddle( mSPLDef, InternalEntityStructure,
      //:  //                            InternalAttribStructure, GetOrSetFlag )

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
omSPLDef_dFullNameFML( View     mSPLDef,
                       String InternalEntityStructure,
                       String InternalAttribStructure,
                       Integer   GetOrSetFlag )
{

   //:dFullNameFML( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:           STRING ( 32 ) InternalEntityStructure,
   //:           STRING ( 32 ) InternalAttribStructure,
   //:           SHORT GetOrSetFlag )

   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:PersonName_FirstMiddleLast( mSPLDef, InternalEntityStructure,
         //:                           InternalAttribStructure, GetOrSetFlag )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          m_ZGlobal1_Operation.PersonName_FirstMiddleLast( mSPLDef, InternalEntityStructure, InternalAttribStructure, GetOrSetFlag );
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
//:dPrimRegNameID( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                STRING ( 32 ) InternalEntityStructure,
//:                STRING ( 32 ) InternalAttribStructure,
//:                SHORT GetOrSetFlag )

//:   STRING ( 1000 ) szString
public int 
omSPLDef_dPrimRegNameID( View     mSPLDef,
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

         //:IF mSPLDef.Organization EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSPLDef, "Organization" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = mSPLDef.Organization.Name
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_1, 'S', 1001, mSPLDef, "Organization", "Name", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szString = sb_szString.toString( );}
            //:IF mSPLDef.PrimaryRegistrant.EPA_CompanyNumber != ""
            if ( CompareAttributeToString( mSPLDef, "PrimaryRegistrant", "EPA_CompanyNumber", "" ) != 0 )
            { 
               //:szString = szString + " (" +
               //:        mSPLDef.PrimaryRegistrant.EPA_CompanyNumber + ")"
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
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_2, 'S', 7, mSPLDef, "PrimaryRegistrant", "EPA_CompanyNumber", "", 0 );
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
         //:StoreStringInRecord( mSPLDef,
         //:                   InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szString );
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
   //:dSubregNameID( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:            STRING ( 32 ) InternalEntityStructure,
   //:            STRING ( 32 ) InternalAttribStructure,
   //:            SHORT GetOrSetFlag )

   //:STRING ( 1000 ) szString
public int 
omSPLDef_dSubregNameID( View     mSPLDef,
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

         //:IF mSPLDef.SubregOrganization EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSPLDef, "SubregOrganization" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = mSPLDef.SubregOrganization.Name
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_1, 'S', 1001, mSPLDef, "SubregOrganization", "Name", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szString = sb_szString.toString( );}
            //:IF mSPLDef.Subregistrant.EPA_CompanyNumber != ""
            if ( CompareAttributeToString( mSPLDef, "Subregistrant", "EPA_CompanyNumber", "" ) != 0 )
            { 
               //:szString = szString + " (" +
               //:        mSPLDef.Subregistrant.EPA_CompanyNumber + ")"
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
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_2, 'S', 7, mSPLDef, "Subregistrant", "EPA_CompanyNumber", "", 0 );
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
         //:StoreStringInRecord( mSPLDef,
         //:                   InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szString );
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
   //:dIngredientName( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:              STRING ( 32 ) InternalEntityStructure,
   //:              STRING ( 32 ) InternalAttribStructure,
   //:              SHORT GetOrSetFlag )

   //:STRING ( 1000 ) szString
public int 
omSPLDef_dIngredientName( View     mSPLDef,
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

         //:IF mSPLDef.S_IngredientsStatement EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSPLDef, "S_IngredientsStatement" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = mSPLDef.SPLD_IngredientsStatement.CommonName
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_1, 'S', 1001, mSPLDef, "SPLD_IngredientsStatement", "CommonName", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szString = sb_szString.toString( );}
            //:IF szString = ""
            if ( ZeidonStringCompare( szString, 1, 0, "", 1, 0, 1001 ) == 0 )
            { 
               //:szString = mSPLDef.SPLD_IngredientsStatement.ChemicalName
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                               GetVariableFromAttribute( sb_szString, mi_lTempInteger_2, 'S', 1001, mSPLDef, "SPLD_IngredientsStatement", "ChemicalName", "", 0 );
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
         //:StoreStringInRecord( mSPLDef,
         //:                   InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szString );
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
   //:dGenStmtTitleText( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:                STRING ( 32 ) InternalEntityStructure,
   //:                STRING ( 32 ) InternalAttribStructure,
   //:                SHORT GetOrSetFlag )

   //:// VIEW mSPLDef2 BASED ON LOD mSPLDef
   //:STRING ( 2048 ) szCombinedText
public int 
omSPLDef_dGenStmtTitleText( View     mSPLDef,
                            String InternalEntityStructure,
                            String InternalAttribStructure,
                            Integer   GetOrSetFlag )
{
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
         //:IF mSPLDef.SPLD_GeneralSection.Combined = "Y" AND mSPLDef.SPLD_GeneralStatement.Title != ""
         if ( CompareAttributeToString( mSPLDef, "SPLD_GeneralSection", "Combined", "Y" ) == 0 && CompareAttributeToString( mSPLDef, "SPLD_GeneralStatement", "Title", "" ) != 0 )
         { 
            //:IF mSPLDef.SPLD_GeneralSection.BoldTitle = "Y"
            if ( CompareAttributeToString( mSPLDef, "SPLD_GeneralSection", "BoldTitle", "Y" ) == 0 )
            { 
               //:szCombinedText = "<b>" + mSPLDef.SPLD_GeneralStatement.Title + "</b>"
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_0, 'S', 4097, mSPLDef, "SPLD_GeneralStatement", "Title", "", 0 );
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
               //:szCombinedText = mSPLDef.SPLD_GeneralStatement.Title
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
               StringBuilder sb_szCombinedText;
               if ( szCombinedText == null )
                  sb_szCombinedText = new StringBuilder( 32 );
               else
                  sb_szCombinedText = new StringBuilder( szCombinedText );
                               GetVariableFromAttribute( sb_szCombinedText, mi_lTempInteger_1, 'S', 2049, mSPLDef, "SPLD_GeneralStatement", "Title", "", 0 );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );
               szCombinedText = sb_szCombinedText.toString( );}
            } 

            //:END
         } 

         //:END
         //:IF mSPLDef.SPLD_GeneralSection.BoldText = "Y"
         if ( CompareAttributeToString( mSPLDef, "SPLD_GeneralSection", "BoldText", "Y" ) == 0 )
         { 
            //:szCombinedText = szCombinedText + "<b> " + mSPLDef.SPLD_GeneralStatement.Text + "</b>"
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
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_2, 'S', 4097, mSPLDef, "SPLD_GeneralStatement", "Text", "", 0 );
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
            //:szCombinedText = szCombinedText + " " + mSPLDef.SPLD_GeneralStatement.Text
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
                         GetVariableFromAttribute( sb_szTempString_2, mi_lTempInteger_3, 'S', 4097, mSPLDef, "SPLD_GeneralStatement", "Text", "", 0 );
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
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szCombinedText )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szCombinedText );
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
//:BuildSPLD_FromSLC( VIEW NewSPLD  BASED ON LOD mSPLDef,
//:                   VIEW SrcSLC   BASED ON LOD mSubLC )

//:   VIEW mSPLDef2 BASED ON LOD mSPLDef
public int 
omSPLDef_BuildSPLD_FromSLC( View     NewSPLD,
                            View     SrcSLC )
{
   zVIEW    mSPLDef2 = new zVIEW( );
   //:STRING ( 256 ) szName
   String   szName = null;
   int      lTempInteger_0 = 0;
   int      RESULT = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;


   //:// Build a new SPLD from the selected Subregistrant Label Content entry.
   //:// TraceLineS( "BuildSPLD_FromSLC SLC", "=====================>>>>>>>>" )
   //:// DisplayObjectInstance( SrcSLC, "", "" )

   //:// Tie back to SLC, if necessary.
   //:IF NewSPLD.SubregLabelContent DOES NOT EXIST
   lTempInteger_0 = CheckExistenceOfEntity( NewSPLD, "SubregLabelContent" );
   if ( lTempInteger_0 != 0 )
   { 
      //:INCLUDE NewSPLD.SubregLabelContent FROM SrcSLC.SubregLabelContent
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "SubregLabelContent", SrcSLC, "SubregLabelContent", zPOS_AFTER );
   } 

   //:END

   //:// Delete any current component entries.
   //:FOR EACH NewSPLD.SPLD_GeneralSection
   RESULT = SetCursorFirstEntity( NewSPLD, "SPLD_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY NewSPLD.SPLD_GeneralSection NONE
      RESULT = DeleteEntity( NewSPLD, "SPLD_GeneralSection", zREPOS_NONE );
      RESULT = SetCursorNextEntity( NewSPLD, "SPLD_GeneralSection", "" );
   } 

   //:END
   //:FOR EACH NewSPLD.SPLD_IngredientsSection
   RESULT = SetCursorFirstEntity( NewSPLD, "SPLD_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY NewSPLD.SPLD_IngredientsSection NONE
      RESULT = DeleteEntity( NewSPLD, "SPLD_IngredientsSection", zREPOS_NONE );
      RESULT = SetCursorNextEntity( NewSPLD, "SPLD_IngredientsSection", "" );
   } 

   //:END
   //:FOR EACH NewSPLD.SPLD_StorageDisposalSection
   RESULT = SetCursorFirstEntity( NewSPLD, "SPLD_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY NewSPLD.SPLD_StorageDisposalSection NONE
      RESULT = DeleteEntity( NewSPLD, "SPLD_StorageDisposalSection", zREPOS_NONE );
      RESULT = SetCursorNextEntity( NewSPLD, "SPLD_StorageDisposalSection", "" );
   } 

   //:END
   //:FOR EACH NewSPLD.SPLD_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( NewSPLD, "SPLD_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY NewSPLD.SPLD_DirectionsForUseSection NONE
      RESULT = DeleteEntity( NewSPLD, "SPLD_DirectionsForUseSection", zREPOS_NONE );
      RESULT = SetCursorNextEntity( NewSPLD, "SPLD_DirectionsForUseSection", "" );
   } 

   //:END
   //:FOR EACH NewSPLD.SPLD_MarketingSection
   RESULT = SetCursorFirstEntity( NewSPLD, "SPLD_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY NewSPLD.SPLD_MarketingSection NONE
      RESULT = DeleteEntity( NewSPLD, "SPLD_MarketingSection", zREPOS_NONE );
      RESULT = SetCursorNextEntity( NewSPLD, "SPLD_MarketingSection", "" );
   } 

   //:END
   //:FOR EACH NewSPLD.SPLD_HumanHazardSection
   RESULT = SetCursorFirstEntity( NewSPLD, "SPLD_HumanHazardSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY NewSPLD.SPLD_HumanHazardSection NONE
      RESULT = DeleteEntity( NewSPLD, "SPLD_HumanHazardSection", zREPOS_NONE );
      RESULT = SetCursorNextEntity( NewSPLD, "SPLD_HumanHazardSection", "" );
   } 

   //:END
   //:FOR EACH NewSPLD.SPLD_UsageType
   RESULT = SetCursorFirstEntity( NewSPLD, "SPLD_UsageType", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY NewSPLD.SPLD_UsageType NONE
      RESULT = DeleteEntity( NewSPLD, "SPLD_UsageType", zREPOS_NONE );
      RESULT = SetCursorNextEntity( NewSPLD, "SPLD_UsageType", "" );
   } 

   //:END

   //:// General Section ... Precautionary, First Aid, Other Hazard
   //:FOR EACH SrcSLC.S_GeneralSection
   RESULT = SetCursorFirstEntity( SrcSLC, "S_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_GeneralSection
      RESULT = CreateEntity( NewSPLD, "SPLD_GeneralSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_GeneralSection", SrcSLC, "S_GeneralSection", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_GeneralSection", SrcSLC, "S_GeneralSection", zSET_NULL );
      //:INCLUDE NewSPLD.S_GeneralSection FROM SrcSLC.S_GeneralSection
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_GeneralSection", SrcSLC, "S_GeneralSection", zPOS_AFTER );
      //:FOR EACH SrcSLC.S_GeneralStatement
      RESULT = SetCursorFirstEntity( SrcSLC, "S_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_GeneralStatement
         RESULT = CreateEntity( NewSPLD, "SPLD_GeneralStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_GeneralStatement", SrcSLC, "S_GeneralStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_GeneralStatement", SrcSLC, "S_GeneralStatement", zSET_NULL );
         //:INCLUDE NewSPLD.S_GeneralStatement FROM SrcSLC.S_GeneralStatement
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_GeneralStatement", SrcSLC, "S_GeneralStatement", zPOS_AFTER );
         //:FOR EACH SrcSLC.S_InsertTextKeyword
         RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextKeyword", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF SrcSLC.S_InsertTextKeyword.Selected = "Y"
            if ( CompareAttributeToString( SrcSLC, "S_InsertTextKeyword", "Selected", "Y" ) == 0 )
            { 
               //:CREATE ENTITY NewSPLD.SPLD_InsertTextKeyword
               RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextKeyword", zPOS_AFTER );
               //:SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeyword", SrcSLC, "S_InsertTextKeyword", zSET_NULL )
               SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeyword", SrcSLC, "S_InsertTextKeyword", zSET_NULL );
               //:FOR EACH SrcSLC.S_InsertText
               RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertText", "" );
               while ( RESULT > zCURSOR_UNCHANGED )
               { 
                  //:IF SrcSLC.S_InsertText.Selected = "Y"
                  if ( CompareAttributeToString( SrcSLC, "S_InsertText", "Selected", "Y" ) == 0 )
                  { 
                     //:CREATE ENTITY NewSPLD.SPLD_InsertText
                     RESULT = CreateEntity( NewSPLD, "SPLD_InsertText", zPOS_AFTER );
                     //:SetMatchingAttributesByName( NewSPLD, "SPLD_InsertText", SrcSLC, "S_InsertText", zSET_NULL )
                     SetMatchingAttributesByName( NewSPLD, "SPLD_InsertText", SrcSLC, "S_InsertText", zSET_NULL );
                  } 

                  RESULT = SetCursorNextEntity( SrcSLC, "S_InsertText", "" );
                  //:END
               } 

               //:END
            } 

            RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextKeyword", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( SrcSLC, "S_GeneralStatement", "" );
         //:END
      } 

      //:END
      //:FOR EACH SrcSLC.S_GeneralSubSection
      RESULT = SetCursorFirstEntity( SrcSLC, "S_GeneralSubSection", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_GeneralSubSection
         RESULT = CreateEntity( NewSPLD, "SPLD_GeneralSubSection", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_GeneralSubSection", SrcSLC, "S_GeneralSubSection", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_GeneralSubSection", SrcSLC, "S_GeneralSubSection", zSET_NULL );
         //:INCLUDE NewSPLD.S_GeneralSubSection FROM SrcSLC.S_GeneralSubSection
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_GeneralSubSection", SrcSLC, "S_GeneralSubSection", zPOS_AFTER );
         //:FOR EACH SrcSLC.S_GeneralSubStatement
         RESULT = SetCursorFirstEntity( SrcSLC, "S_GeneralSubStatement", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:CREATE ENTITY NewSPLD.SPLD_GeneralSubStatement
            RESULT = CreateEntity( NewSPLD, "SPLD_GeneralSubStatement", zPOS_AFTER );
            //:SetMatchingAttributesByName( NewSPLD, "SPLD_GeneralSubStatement", SrcSLC, "S_GeneralSubStatement", zSET_NULL )
            SetMatchingAttributesByName( NewSPLD, "SPLD_GeneralSubStatement", SrcSLC, "S_GeneralSubStatement", zSET_NULL );
            //:INCLUDE NewSPLD.S_GeneralSubStatement FROM SrcSLC.S_GeneralSubStatement
            RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_GeneralSubStatement", SrcSLC, "S_GeneralSubStatement", zPOS_AFTER );
            //:FOR EACH SrcSLC.S_InsertTextKeywordGeneral
            RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextKeywordGeneral", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:IF SrcSLC.S_InsertTextKeywordGeneral.Selected = "Y"
               if ( CompareAttributeToString( SrcSLC, "S_InsertTextKeywordGeneral", "Selected", "Y" ) == 0 )
               { 
                  //:CREATE ENTITY NewSPLD.SPLD_InsertTextKeywordGeneral
                  RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextKeywordGeneral", zPOS_AFTER );
                  //:SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeywordGeneral", SrcSLC, "S_InsertTextKeywordGeneral", zSET_NULL )
                  SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeywordGeneral", SrcSLC, "S_InsertTextKeywordGeneral", zSET_NULL );
                  //:FOR EACH SrcSLC.S_InsertTextGeneral
                  RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextGeneral", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:IF SrcSLC.S_InsertTextGeneral.Selected = "Y"
                     if ( CompareAttributeToString( SrcSLC, "S_InsertTextGeneral", "Selected", "Y" ) == 0 )
                     { 
                        //:CREATE ENTITY NewSPLD.SPLD_InsertTextGeneral
                        RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextGeneral", zPOS_AFTER );
                        //:SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextGeneral", SrcSLC, "S_InsertTextGeneral", zSET_NULL )
                        SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextGeneral", SrcSLC, "S_InsertTextGeneral", zSET_NULL );
                     } 

                     RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextGeneral", "" );
                     //:END
                  } 

                  //:END
               } 

               RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextKeywordGeneral", "" );
               //:END
            } 

            RESULT = SetCursorNextEntity( SrcSLC, "S_GeneralSubStatement", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( SrcSLC, "S_GeneralSubSection", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_GeneralSection", "" );
      //:END
   } 

   //:END

   //:// Footnotes
   //:FOR EACH SrcSLC.S_UsageFootnote
   RESULT = SetCursorFirstEntity( SrcSLC, "S_UsageFootnote", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_UsageFootnote
      RESULT = CreateEntity( NewSPLD, "SPLD_UsageFootnote", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_UsageFootnote", SrcSLC, "S_UsageFootnote", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_UsageFootnote", SrcSLC, "S_UsageFootnote", zSET_NULL );
      RESULT = SetCursorNextEntity( SrcSLC, "S_UsageFootnote", "" );
   } 

   //:END

   //:// Usages ... Claim, Surface, Application Type, Location 
   //:FOR EACH SrcSLC.S_UsageType
   RESULT = SetCursorFirstEntity( SrcSLC, "S_UsageType", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_UsageType
      RESULT = CreateEntity( NewSPLD, "SPLD_UsageType", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_UsageType", SrcSLC, "S_UsageType", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_UsageType", SrcSLC, "S_UsageType", zSET_NULL );
      //:INCLUDE NewSPLD.S_UsageType FROM SrcSLC.S_UsageType
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_UsageType", SrcSLC, "S_UsageType", zPOS_AFTER );
      //:CopyUsagesRecursive( NewSPLD, SrcSLC )
      omSPLDef_CopyUsagesRecursive( NewSPLD, SrcSLC );
      RESULT = SetCursorNextEntity( SrcSLC, "S_UsageType", "" );
   } 

   //:END

   //:// Ingredients Section
   //:FOR EACH SrcSLC.S_IngredientsSection
   RESULT = SetCursorFirstEntity( SrcSLC, "S_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_IngredientsSection
      RESULT = CreateEntity( NewSPLD, "SPLD_IngredientsSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_IngredientsSection", SrcSLC, "S_IngredientsSection", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_IngredientsSection", SrcSLC, "S_IngredientsSection", zSET_NULL );
      //:INCLUDE NewSPLD.S_IngredientsSection FROM SrcSLC.S_IngredientsSection
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_IngredientsSection", SrcSLC, "S_IngredientsSection", zPOS_AFTER );
      //:FOR EACH SrcSLC.S_IngredientsStatement
      RESULT = SetCursorFirstEntity( SrcSLC, "S_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_IngredientsStatement
         RESULT = CreateEntity( NewSPLD, "SPLD_IngredientsStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_IngredientsStatement", SrcSLC, "S_IngredientsStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_IngredientsStatement", SrcSLC, "S_IngredientsStatement", zSET_NULL );
         //:INCLUDE NewSPLD.S_IngredientsStatement FROM SrcSLC.S_IngredientsStatement
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_IngredientsStatement", SrcSLC, "S_IngredientsStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SrcSLC, "S_IngredientsStatement", "" );
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_IngredientsSection", "" );
      //:END
   } 

   //:END

   //:// StorageDisposal Section
   //:FOR EACH SrcSLC.S_StorageDisposalSection
   RESULT = SetCursorFirstEntity( SrcSLC, "S_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF SrcSLC.S_StorageDisposalSection.Selected = "Y"
      if ( CompareAttributeToString( SrcSLC, "S_StorageDisposalSection", "Selected", "Y" ) == 0 )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_StorageDisposalSection
         RESULT = CreateEntity( NewSPLD, "SPLD_StorageDisposalSection", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_StorageDisposalSection", SrcSLC, "S_StorageDisposalSection", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_StorageDisposalSection", SrcSLC, "S_StorageDisposalSection", zSET_NULL );
         //:szName = SrcSLC.S_StorageDisposalSection.Name
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szName;
         if ( szName == null )
            sb_szName = new StringBuilder( 32 );
         else
            sb_szName = new StringBuilder( szName );
                   GetVariableFromAttribute( sb_szName, mi_lTempInteger_1, 'S', 257, SrcSLC, "S_StorageDisposalSection", "Name", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szName = sb_szName.toString( );}
         //:TraceLineS( "BuildSPLD Storage/Disposal Section SLC: ", szName )
         TraceLineS( "BuildSPLD Storage/Disposal Section SLC: ", szName );
         //:DisplayEntityInstance( SrcSLC, "S_StorageDisposalSection" )
         DisplayEntityInstance( SrcSLC, "S_StorageDisposalSection" );
         //:INCLUDE NewSPLD.S_StorageDisposalSection FROM SrcSLC.S_StorageDisposalSection
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_StorageDisposalSection", SrcSLC, "S_StorageDisposalSection", zPOS_AFTER );
         //:CopyStorDispStmts( NewSPLD, SrcSLC )
         omSPLDef_CopyStorDispStmts( NewSPLD, SrcSLC );
         //:szName = NewSPLD.SPLD_StorageDisposalSection.Name
         {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
         StringBuilder sb_szName;
         if ( szName == null )
            sb_szName = new StringBuilder( 32 );
         else
            sb_szName = new StringBuilder( szName );
                   GetVariableFromAttribute( sb_szName, mi_lTempInteger_2, 'S', 257, NewSPLD, "SPLD_StorageDisposalSection", "Name", "", 0 );
         lTempInteger_2 = mi_lTempInteger_2.intValue( );
         szName = sb_szName.toString( );}
         //:TraceLineS( "BuildSPLD Storage/Disposal Section SPLD: ", szName )
         TraceLineS( "BuildSPLD Storage/Disposal Section SPLD: ", szName );
         //:DisplayEntityInstance( NewSPLD, "SPLD_StorageDisposalSection" )
         DisplayEntityInstance( NewSPLD, "SPLD_StorageDisposalSection" );
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_StorageDisposalSection", "" );
      //:END
   } 

   //:END

   //:// Tables
   //:FOR EACH SrcSLC.S_MetaTable
   RESULT = SetCursorFirstEntity( SrcSLC, "S_MetaTable", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_MetaTable
      RESULT = CreateEntity( NewSPLD, "SPLD_MetaTable", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_MetaTable", SrcSLC, "S_MetaTable", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_MetaTable", SrcSLC, "S_MetaTable", zSET_NULL );
      //:FOR EACH SrcSLC.S_Rows
      RESULT = SetCursorFirstEntity( SrcSLC, "S_Rows", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_Rows
         RESULT = CreateEntity( NewSPLD, "SPLD_Rows", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_Rows", SrcSLC, "S_Rows", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_Rows", SrcSLC, "S_Rows", zSET_NULL );
         RESULT = SetCursorNextEntity( SrcSLC, "S_Rows", "" );
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_MetaTable", "" );
      //:END
   } 

   //:END

   //:// Dilutions
   //:FOR EACH SrcSLC.S_DilutionGroup
   RESULT = SetCursorFirstEntity( SrcSLC, "S_DilutionGroup", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_DilutionGroup
      RESULT = CreateEntity( NewSPLD, "SPLD_DilutionGroup", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_DilutionGroup", SrcSLC, "S_DilutionGroup", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_DilutionGroup", SrcSLC, "S_DilutionGroup", zSET_NULL );
      //:// TraceLineS( "SPLD_FromSLC SPLD_DilutionGroup ", "=====================>>>>>>>>" )
      //:// DisplayEntityInstance( NewSPLD, "SPLD_DilutionGroup" )
      //:// NewSPLD.SPLD_DilutionGroup.PrimarySLC_ID = SrcSLC.S_DilutionGroup.ID
      //:// INCLUDE NewSPLD.SPLD_DilutionGroup FROM SrcSLC.M_DilutionGroup
      //:// Dilution Chart Entries
      //:FOR EACH SrcSLC.S_DilutionChartEntry
      RESULT = SetCursorFirstEntity( SrcSLC, "S_DilutionChartEntry", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_DilutionChartEntry
         RESULT = CreateEntity( NewSPLD, "SPLD_DilutionChartEntry", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_DilutionChartEntry", SrcSLC, "S_DilutionChartEntry", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_DilutionChartEntry", SrcSLC, "S_DilutionChartEntry", zSET_NULL );
         RESULT = SetCursorNextEntity( SrcSLC, "S_DilutionChartEntry", "" );
      } 

      //:// TraceLineS( "SPLD_FromSLC SPLD_DilutionChartEntry ", "=====================>>>>>>>>" )
      //:// DisplayEntityInstance( NewSPLD, "SPLD_DilutionChartEntry" )
      //:// NewSPLD.SPLD_DilutionChartEntry.PrimarySLC_ID = SrcSLC.SLC_DilutionChartEntry.ID
      //:END
      //:// Dilution Group Items
      //:FOR EACH SrcSLC.S_DilutionGroupItem
      RESULT = SetCursorFirstEntity( SrcSLC, "S_DilutionGroupItem", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_DilutionGroupItem
         RESULT = CreateEntity( NewSPLD, "SPLD_DilutionGroupItem", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_DilutionGroupItem", SrcSLC, "S_DilutionGroupItem", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_DilutionGroupItem", SrcSLC, "S_DilutionGroupItem", zSET_NULL );
         RESULT = SetCursorNextEntity( SrcSLC, "S_DilutionGroupItem", "" );
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_DilutionGroup", "" );
      //:// TraceLineS( "SPLD_FromMLC SPLD_DilutionGroupItem ", "=====================>>>>>>>>" )
      //:// DisplayEntityInstance( NewSPLD, "SPLD_DilutionGroupItem" )
      //:// NewSPLD.SPLD_DilutionGroupItem.PrimarySLC_ID = SrcSLC.SLC_DilutionGroupItem.ID
      //:END
   } 

   //:END

   //:// HumanHazard Section
   //:FOR EACH SrcSLC.S_HumanHazardSection
   RESULT = SetCursorFirstEntity( SrcSLC, "S_HumanHazardSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_HumanHazardSection
      RESULT = CreateEntity( NewSPLD, "SPLD_HumanHazardSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_HumanHazardSection", SrcSLC, "S_HumanHazardSection", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_HumanHazardSection", SrcSLC, "S_HumanHazardSection", zSET_NULL );
      //:INCLUDE NewSPLD.S_HumanHazardSection FROM SrcSLC.S_HumanHazardSection
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_HumanHazardSection", SrcSLC, "S_HumanHazardSection", zPOS_AFTER );
      RESULT = SetCursorNextEntity( SrcSLC, "S_HumanHazardSection", "" );
   } 

   //:END

   //:// Add any Directions For Use Sections that aren't driven by Usage entries.
   //:FOR EACH SrcSLC.S_DirectionsForUseCategory
   RESULT = SetCursorFirstEntity( SrcSLC, "S_DirectionsForUseCategory", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_DirectionsForUseCategory
      RESULT = CreateEntity( NewSPLD, "SPLD_DirectionsForUseCategory", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsForUseCategory", SrcSLC, "S_DirectionsForUseCategory", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsForUseCategory", SrcSLC, "S_DirectionsForUseCategory", zSET_NULL );
      //:szName = SrcSLC.S_DirectionsForUseCategory.Name
      {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
      StringBuilder sb_szName;
      if ( szName == null )
         sb_szName = new StringBuilder( 32 );
      else
         sb_szName = new StringBuilder( szName );
             GetVariableFromAttribute( sb_szName, mi_lTempInteger_3, 'S', 257, SrcSLC, "S_DirectionsForUseCategory", "Name", "", 0 );
      lTempInteger_3 = mi_lTempInteger_3.intValue( );
      szName = sb_szName.toString( );}
      //:TraceLineS( "BuildSPLD DirectionsForUse Category SLC: ", szName )
      TraceLineS( "BuildSPLD DirectionsForUse Category SLC: ", szName );
      //:DisplayEntityInstance( SrcSLC, "S_DirectionsForUseCategory" )
      DisplayEntityInstance( SrcSLC, "S_DirectionsForUseCategory" );
      //:INCLUDE NewSPLD.S_DirectionsForUseCategory FROM SrcSLC.S_DirectionsForUseCategory
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_DirectionsForUseCategory", SrcSLC, "S_DirectionsForUseCategory", zPOS_AFTER );
      //:FOR EACH SrcSLC.S_DirectionsForUseSection
      RESULT = SetCursorFirstEntity( SrcSLC, "S_DirectionsForUseSection", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF SrcSLC.S_ClaimsDrivingUsage DOES NOT EXIST
         lTempInteger_4 = CheckExistenceOfEntity( SrcSLC, "S_ClaimsDrivingUsage" );
         if ( lTempInteger_4 != 0 )
         { 
            //:// No Driving Usage entry exists, so always copy the section.
            //:CopyDirsForUseSection( NewSPLD, SrcSLC )
            omSPLDef_CopyDirsForUseSection( NewSPLD, SrcSLC );
         } 

         RESULT = SetCursorNextEntity( SrcSLC, "S_DirectionsForUseSection", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_DirectionsForUseCategory", "" );
      //:END
   } 

   //:END

   //:// Build Marketing Entries (without Usage entries).
   //:FOR EACH SrcSLC.S_MarketingSection
   RESULT = SetCursorFirstEntity( SrcSLC, "S_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_MarketingSection
      RESULT = CreateEntity( NewSPLD, "SPLD_MarketingSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_MarketingSection", SrcSLC, "S_MarketingSection", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_MarketingSection", SrcSLC, "S_MarketingSection", zSET_NULL );
      //:INCLUDE NewSPLD.S_MarketingSection FROM SrcSLC.S_MarketingSection
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_MarketingSection", SrcSLC, "S_MarketingSection", zPOS_AFTER );
      //:FOR EACH SrcSLC.S_MarketingStatement
      RESULT = SetCursorFirstEntity( SrcSLC, "S_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_MarketingStatement
         RESULT = CreateEntity( NewSPLD, "SPLD_MarketingStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_MarketingStatement", SrcSLC, "S_MarketingStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_MarketingStatement", SrcSLC, "S_MarketingStatement", zSET_NULL );
         //:INCLUDE NewSPLD.S_MarketingStatement FROM SrcSLC.S_MarketingStatement
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_MarketingStatement", SrcSLC, "S_MarketingStatement", zPOS_AFTER );
         //:FOR EACH SrcSLC.S_InsertTextKeywordMarketing
         RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextKeywordMarketing", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF SrcSLC.S_InsertTextKeywordMarketing.Selected = "Y"
            if ( CompareAttributeToString( SrcSLC, "S_InsertTextKeywordMarketing", "Selected", "Y" ) == 0 )
            { 
               //:CREATE ENTITY NewSPLD.SPLD_InsertTextKeywordMarketing
               RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextKeywordMarketing", zPOS_AFTER );
               //:SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeywordMarketing", SrcSLC, "S_InsertTextKeywordMarketing", zSET_NULL )
               SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeywordMarketing", SrcSLC, "S_InsertTextKeywordMarketing", zSET_NULL );
               //:FOR EACH SrcSLC.S_InsertTextMarketing
               RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextMarketing", "" );
               while ( RESULT > zCURSOR_UNCHANGED )
               { 
                  //:IF SrcSLC.S_InsertTextMarketing.Selected = "Y"
                  if ( CompareAttributeToString( SrcSLC, "S_InsertTextMarketing", "Selected", "Y" ) == 0 )
                  { 
                     //:CREATE ENTITY NewSPLD.SPLD_InsertTextMarketing
                     RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextMarketing", zPOS_AFTER );
                     //:SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextMarketing", SrcSLC, "S_InsertTextMarketing", zSET_NULL )
                     SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextMarketing", SrcSLC, "S_InsertTextMarketing", zSET_NULL );
                  } 

                  RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextMarketing", "" );
                  //:END
               } 

               //:END
            } 

            RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextKeywordMarketing", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( SrcSLC, "S_MarketingStatement", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_MarketingSection", "" );
      //:END
   } 

   //:END

   //:// Go to build Directions For Use and Marketing Usage entries.
   //:BuildUsageEntriesFrSLC( NewSPLD, SrcSLC )
   omSPLDef_BuildUsageEntriesFrSLC( NewSPLD, SrcSLC );
   return( 0 );
// // TraceLineS( "BuildSPLD_FromSLC NewSPLD", "=====================>>>>>>>>" )
// // DisplayObjectInstance( NewSPLD, "", "" )
// END
} 


//:TRANSFORMATION OPERATION
//:RebuildSPLD_FromSLC( VIEW NewSPLD BASED ON LOD mSPLDef,
//:                     VIEW SrcSLC  BASED ON LOD mSubLC )
public int 
omSPLDef_RebuildSPLD_FromSLC( View     NewSPLD,
                              View     SrcSLC )
{

   return( 0 );
//    // DonC 1/11/206 - I don't think we are using this code.
//    /*VIEW mSPLDef2 BASED ON LOD mSPLDef
//    // Correct Directions and Marketing entries by rebuilding them.
//    FOR EACH NewSPLD.SPLD_DirectionsForUseSection
//       DELETE ENTITY NewSPLD.SPLD_DirectionsForUseSection NONE
//    END
//    FOR EACH NewSPLD.SPLD_MarketingSection
//       DELETE ENTITY NewSPLD.SPLD_MarketingSection NONE
//    END
//    // Build Directions For Use Entries (without Usage entries).
//    FOR EACH SrcSLC.S_DirectionsForUseSection
//       CREATE ENTITY NewSPLD.SPLD_DirectionsForUseSection
//       SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsForUseSection", SrcSLC, "S_DirectionsForUseSection", zSET_NULL )
//       INCLUDE NewSPLD.S_DirectionsForUseSection FROM SrcSLC.S_DirectionsForUseSection
//       FOR EACH SrcSLC.S_DirectionsForUseStatement
//          CREATE ENTITY NewSPLD.SPLD_DirectionsForUseStatement
//          SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsForUseStatement", SrcSLC, "S_DirectionsForUseStatement", zSET_NULL )
//       END
//    END
//    // Build Marketing Entries (without Usage entries).
//    FOR EACH SrcSLC.S_MarketingSection
//       CREATE ENTITY NewSPLD.SPLD_MarketingSection
//       SetMatchingAttributesByName( NewSPLD, "SPLD_MarketingSection", SrcSLC, "S_MarketingSection", zSET_NULL )
//       INCLUDE NewSPLD.S_MarketingSection FROM SrcSLC.S_MarketingSection
//       FOR EACH SrcSLC.S_MarketingStatement
//          CREATE ENTITY NewSPLD.SPLD_MarketingStatement
//          SetMatchingAttributesByName( NewSPLD, "SPLD_MarketingStatement", SrcSLC, "S_MarketingStatement", zSET_NULL )
//       END
//    END
//    // Go to build Directions For Use and Marketing entries.
//    BuildUsageEntriesFrSLC( NewSPLD, SrcSLC )*/
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dPanelName( VIEW mSPLDef BASED ON LOD mSPLDef,
//:            STRING ( 32 ) InternalEntityStructure,
//:            STRING ( 32 ) InternalAttribStructure,
//:            SHORT GetOrSetFlag )

//:   STRING ( 16 ) szPanelName
public int 
omSPLDef_dPanelName( View     mSPLDef,
                     String InternalEntityStructure,
                     String InternalAttribStructure,
                     Integer   GetOrSetFlag )
{
   String   szPanelName = null;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :
         break ;

      //:// Currently the Panel Name is just the "panel" + Panel Number.
      //:/*szPanelName = "Panel"
      //://szPanelName = szPanelName + mSPLDef.SPLD_TemplatePanel.wSequentialPanelNumber
      //:// Store the calculated value in the object.
      //:StoreStringInRecord( mSPLDef,
      //:                  InternalEntityStructure, InternalAttribStructure, szPanelName )*/

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
//:dSectionIdentifier( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                    STRING ( 32 ) InternalEntityStructure,
//:                    STRING ( 32 ) InternalAttribStructure,
//:                    SHORT GetOrSetFlag )

//:   STRING ( 16 ) szSectionIdentifier
public int 
omSPLDef_dSectionIdentifier( View     mSPLDef,
                             String InternalEntityStructure,
                             String InternalAttribStructure,
                             Integer   GetOrSetFlag )
{
   String   szSectionIdentifier = null;
   String   szTempString_0 = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// This is the Section Type, unless the Section Type is Marketing, in which case the Section Name is added on.
         //:IF mSPLDef.LLD_Block.LLD_SectionType = "Marketing"
         if ( CompareAttributeToString( mSPLDef, "LLD_Block", "LLD_SectionType", "Marketing" ) == 0 )
         { 
            //:szSectionIdentifier = "Marketing - " + mSPLDef.LLD_Block.Name
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
            StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_0, 'S', 129, mSPLDef, "LLD_Block", "Name", "", 0 );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );
            szTempString_0 = sb_szTempString_0.toString( );}
             {StringBuilder sb_szSectionIdentifier;
            if ( szSectionIdentifier == null )
               sb_szSectionIdentifier = new StringBuilder( 32 );
            else
               sb_szSectionIdentifier = new StringBuilder( szSectionIdentifier );
                        ZeidonStringCopy( sb_szSectionIdentifier, 1, 0, "Marketing - ", 1, 0, 17 );
            szSectionIdentifier = sb_szSectionIdentifier.toString( );}
             {StringBuilder sb_szSectionIdentifier;
            if ( szSectionIdentifier == null )
               sb_szSectionIdentifier = new StringBuilder( 32 );
            else
               sb_szSectionIdentifier = new StringBuilder( szSectionIdentifier );
                        ZeidonStringConcat( sb_szSectionIdentifier, 1, 0, szTempString_0, 1, 0, 17 );
            szSectionIdentifier = sb_szSectionIdentifier.toString( );}
            //:ELSE
         } 
         else
         { 
            //:szSectionIdentifier = mSPLDef.LLD_Block.LLD_SectionType
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szSectionIdentifier;
            if ( szSectionIdentifier == null )
               sb_szSectionIdentifier = new StringBuilder( 32 );
            else
               sb_szSectionIdentifier = new StringBuilder( szSectionIdentifier );
                         GetVariableFromAttribute( sb_szSectionIdentifier, mi_lTempInteger_1, 'S', 17, mSPLDef, "LLD_Block", "LLD_SectionType", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szSectionIdentifier = sb_szSectionIdentifier.toString( );}
         } 

         //:END
         //:StoreStringInRecord( mSPLDef,
         //:               InternalEntityStructure, InternalAttribStructure, szSectionIdentifier )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szSectionIdentifier );
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
//:dMasterProductNameNbr( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                       STRING ( 32 ) InternalEntityStructure,
//:                       STRING ( 32 ) InternalAttribStructure,
//:                       SHORT GetOrSetFlag )

//:   STRING ( 1000 ) szString
public int 
omSPLDef_dMasterProductNameNbr( View     mSPLDef,
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

         //:IF mSPLDef.MasterProduct  EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSPLDef, "MasterProduct" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = mSPLDef.MasterProduct.Name + " (" +
            //:        mSPLDef.PrimaryRegistrant.EPA_CompanyNumber + "-" +
            //:        mSPLDef.MasterProduct.Number + ")"
            {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetStringFromAttribute( sb_szString, mSPLDef, "MasterProduct", "Name" );
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
                         GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 7, mSPLDef, "PrimaryRegistrant", "EPA_CompanyNumber", "", 0 );
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
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_2, 'S', 6, mSPLDef, "MasterProduct", "Number", "", 0 );
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
         //:StoreStringInRecord( mSPLDef,
         //:                   InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szString );
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
   //:dSubregProductNameNbr( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 1000 ) szString
public int 
omSPLDef_dSubregProductNameNbr( View     mSPLDef,
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

         //:szString = mSPLDef.SubregProduct.Name
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szString;
         if ( szString == null )
            sb_szString = new StringBuilder( 32 );
         else
            sb_szString = new StringBuilder( szString );
                   GetVariableFromAttribute( sb_szString, mi_lTempInteger_0, 'S', 1001, mSPLDef, "SubregProduct", "Name", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szString = sb_szString.toString( );}
         //:IF mSPLDef.SubregProduct.Number != 0
         if ( CompareAttributeToInteger( mSPLDef, "SubregProduct", "Number", 0 ) != 0 )
         { 
            //:szString = szString + " (" + mSPLDef.SubregProduct.Number + ")"
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
                         GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 6, mSPLDef, "SubregProduct", "Number", "", 0 );
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
         //:StoreStringInRecord( mSPLDef,
         //:                   InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szString );
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
   //:dDisplayPathogenName( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:                   STRING ( 32 ) InternalEntityStructure,
   //:                   STRING ( 32 ) InternalAttribStructure,
   //:                   SHORT GetOrSetFlag )

   //:VIEW mSPLDef2 BASED ON LOD mSPLDef
public int 
omSPLDef_dDisplayPathogenName( View     mSPLDef,
                               String InternalEntityStructure,
                               String InternalAttribStructure,
                               Integer   GetOrSetFlag )
{
   zVIEW    mSPLDef2 = new zVIEW( );
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
   int      lTempInteger_1 = 0;
   int      RESULT = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:// Combine the Footnote Number as a subscript to the Claim Name, if it exists.
         //:szCombinedName = mSPLDef.SPLD_Usage.Name
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szCombinedName;
         if ( szCombinedName == null )
            sb_szCombinedName = new StringBuilder( 32 );
         else
            sb_szCombinedName = new StringBuilder( szCombinedName );
                   GetVariableFromAttribute( sb_szCombinedName, mi_lTempInteger_0, 'S', 101, mSPLDef, "SPLD_Usage", "Name", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szCombinedName = sb_szCombinedName.toString( );}

         //:// Set Footnote Number, if footnote exists.
         //:IF mSPLDef.SPLD_UsageFootnoteUsed EXISTS
         lTempInteger_1 = CheckExistenceOfEntity( mSPLDef, "SPLD_UsageFootnoteUsed" );
         if ( lTempInteger_1 == 0 )
         { 
            //:SET CURSOR FIRST mSPLDef.SPLD_UsageFootnote WHERE mSPLDef.SPLD_UsageFootnote.ID = mSPLDef.SPLD_UsageFootnoteUsed.ID
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                         GetIntegerFromAttribute( mi_lTempInteger_2, mSPLDef, "SPLD_UsageFootnoteUsed", "ID" );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mSPLDef, "SPLD_UsageFootnote", "ID", lTempInteger_2, "" );
            //:IF mSPLDef.SPLD_UsageFootnote.wFootNoteRelativeNumber = ""
            if ( CompareAttributeToString( mSPLDef, "SPLD_UsageFootnote", "wFootNoteRelativeNumber", "" ) == 0 )
            { 
               //:// Relative numbers haven't be set, so set them here.
               //:CreateViewFromView( mSPLDef2, mSPLDef )
               CreateViewFromView( mSPLDef2, mSPLDef );
               //:Count = 0
               Count = 0;
               //:FOR EACH mSPLDef2.SPLD_UsageFootnote
               RESULT = SetCursorFirstEntity( mSPLDef2, "SPLD_UsageFootnote", "" );
               while ( RESULT > zCURSOR_UNCHANGED )
               { 
                  //:Count = Count + 1
                  Count = Count + 1;
                  //:mSPLDef2.SPLD_UsageFootnote.wFootNoteRelativeNumber = Count
                  SetAttributeFromInteger( mSPLDef2, "SPLD_UsageFootnote", "wFootNoteRelativeNumber", Count );
                  RESULT = SetCursorNextEntity( mSPLDef2, "SPLD_UsageFootnote", "" );
               } 

               //:END
               //:DropView( mSPLDef2 )
               DropView( mSPLDef2 );
            } 

            //:END
            //:szFootnoteNumber = mSPLDef.SPLD_UsageFootnote.wFootNoteRelativeNumber
            {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
            StringBuilder sb_szFootnoteNumber;
            if ( szFootnoteNumber == null )
               sb_szFootnoteNumber = new StringBuilder( 32 );
            else
               sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                         GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_3, 'S', 4, mSPLDef, "SPLD_UsageFootnote", "wFootNoteRelativeNumber", "", 0 );
            lTempInteger_3 = mi_lTempInteger_3.intValue( );
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

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSPLDef,
         //:                  InternalEntityStructure,
         //:                  InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szCombinedName );
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
//:dDisplayUsageName( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                   STRING ( 32 ) InternalEntityStructure,
//:                   STRING ( 32 ) InternalAttribStructure,
//:                   SHORT GetOrSetFlag )

//:   VIEW mSPLDef2 BASED ON LOD mSPLDef
public int 
omSPLDef_dDisplayUsageName( View     mSPLDef,
                            String InternalEntityStructure,
                            String InternalAttribStructure,
                            Integer   GetOrSetFlag )
{
   zVIEW    mSPLDef2 = new zVIEW( );
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
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          {StringBuilder sb_szEntityName;
         if ( szEntityName == null )
            sb_szEntityName = new StringBuilder( 32 );
         else
            sb_szEntityName = new StringBuilder( szEntityName );
                   m_ZGlobal1_Operation.GetEntityNameFromStructure( InternalEntityStructure, sb_szEntityName );
         szEntityName = sb_szEntityName.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:GetStringFromAttribute( szUsageType, mSPLDef, szEntityName, "UsageType" )
         {StringBuilder sb_szUsageType;
         if ( szUsageType == null )
            sb_szUsageType = new StringBuilder( 32 );
         else
            sb_szUsageType = new StringBuilder( szUsageType );
                   GetStringFromAttribute( sb_szUsageType, mSPLDef, szEntityName, "UsageType" );
         szUsageType = sb_szUsageType.toString( );}
         //:GetStringFromAttribute( szClassification, mSPLDef, szEntityName, "ClaimsClassification" )
         {StringBuilder sb_szClassification;
         if ( szClassification == null )
            sb_szClassification = new StringBuilder( 32 );
         else
            sb_szClassification = new StringBuilder( szClassification );
                   GetStringFromAttribute( sb_szClassification, mSPLDef, szEntityName, "ClaimsClassification" );
         szClassification = sb_szClassification.toString( );}
         //:GetStringFromAttribute( szName, mSPLDef, szEntityName, "Name" )
         {StringBuilder sb_szName;
         if ( szName == null )
            sb_szName = new StringBuilder( 32 );
         else
            sb_szName = new StringBuilder( szName );
                   GetStringFromAttribute( sb_szName, mSPLDef, szEntityName, "Name" );
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
         //:IF mSPLDef.S_UsageFootnoteUsed EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSPLDef, "S_UsageFootnoteUsed" );
         if ( lTempInteger_0 == 0 )
         { 
            //:IF mSPLDef.S_UsageFootnoteUsed.ID != ""
            if ( CompareAttributeToString( mSPLDef, "S_UsageFootnoteUsed", "ID", "" ) != 0 )
            { 
               //:SET CURSOR FIRST mSPLDef.SPLD_UsageFootnote WHERE mSPLDef.SPLD_UsageFootnote.ID = mSPLDef.SPLD_UsageFootnoteUsed.ID
               {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                               GetIntegerFromAttribute( mi_lTempInteger_1, mSPLDef, "SPLD_UsageFootnoteUsed", "ID" );
               lTempInteger_1 = mi_lTempInteger_1.intValue( );}
               RESULT = SetCursorFirstEntityByInteger( mSPLDef, "SPLD_UsageFootnote", "ID", lTempInteger_1, "" );
               //:IF mSPLDef.SPLD_UsageFootnote.wFootNoteRelativeNumber = ""
               if ( CompareAttributeToString( mSPLDef, "SPLD_UsageFootnote", "wFootNoteRelativeNumber", "" ) == 0 )
               { 
                  //:// Relative numbers haven't be set, so set them here.
                  //:CreateViewFromView( mSPLDef2, mSPLDef )
                  CreateViewFromView( mSPLDef2, mSPLDef );
                  //:Count = 0
                  Count = 0;
                  //:FOR EACH mSPLDef2.SPLD_UsageFootnote
                  RESULT = SetCursorFirstEntity( mSPLDef2, "SPLD_UsageFootnote", "" );
                  while ( RESULT > zCURSOR_UNCHANGED )
                  { 
                     //:Count = Count + 1
                     Count = Count + 1;
                     //:mSPLDef2.SPLD_UsageFootnote.wFootNoteRelativeNumber = Count
                     SetAttributeFromInteger( mSPLDef2, "SPLD_UsageFootnote", "wFootNoteRelativeNumber", Count );
                     RESULT = SetCursorNextEntity( mSPLDef2, "SPLD_UsageFootnote", "" );
                  } 

                  //:END
                  //:DropView( mSPLDef2 )
                  DropView( mSPLDef2 );
               } 

               //:END
               //:szFootnoteNumber = mSPLDef.SPLD_UsageFootnote.wFootNoteRelativeNumber
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szFootnoteNumber;
               if ( szFootnoteNumber == null )
                  sb_szFootnoteNumber = new StringBuilder( 32 );
               else
                  sb_szFootnoteNumber = new StringBuilder( szFootnoteNumber );
                               GetVariableFromAttribute( sb_szFootnoteNumber, mi_lTempInteger_2, 'S', 4, mSPLDef, "SPLD_UsageFootnote", "wFootNoteRelativeNumber", "", 0 );
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
         //:StoreStringInRecord( mSPLDef,
         //:                  InternalEntityStructure,
         //:                  InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szCombinedName );
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
public int 
omSPLDef_DuplicateSPLD( View     NewSPLD,
                        View     SourceSPLD )
{
   int      RESULT = 0;
   String   szTempString_0 = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   int      lTempInteger_5 = 0;

   //:DuplicateSPLD( VIEW NewSPLD    BASED ON LOD mSPLDef,
   //:            VIEW SourceSPLD BASED ON LOD mSPLDef )

   //:// Build a new SPLD from an existing SPLD.
   //:CREATE ENTITY NewSPLD.SubregPhysicalLabelDef
   RESULT = CreateEntity( NewSPLD, "SubregPhysicalLabelDef", zPOS_AFTER );
   //:SetMatchingAttributesByName( NewSPLD, "SubregPhysicalLabelDef", SourceSPLD, "SubregPhysicalLabelDef", zSET_NULL )
   SetMatchingAttributesByName( NewSPLD, "SubregPhysicalLabelDef", SourceSPLD, "SubregPhysicalLabelDef", zSET_NULL );
   //:NewSPLD.SubregPhysicalLabelDef.Name = SourceSPLD.SubregPhysicalLabelDef.Name + " (Duplicate)"
   {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
       GetStringFromAttribute( sb_szTempString_0, SourceSPLD, "SubregPhysicalLabelDef", "Name" );
   szTempString_0 = sb_szTempString_0.toString( );}
    {StringBuilder sb_szTempString_0;
   if ( szTempString_0 == null )
      sb_szTempString_0 = new StringBuilder( 32 );
   else
      sb_szTempString_0 = new StringBuilder( szTempString_0 );
      ZeidonStringConcat( sb_szTempString_0, 1, 0, " (Duplicate)", 1, 0, 255 );
   szTempString_0 = sb_szTempString_0.toString( );}
   SetAttributeFromString( NewSPLD, "SubregPhysicalLabelDef", "Name", szTempString_0 );
   //:INCLUDE NewSPLD.SubregLabelContent FROM SourceSPLD.SubregLabelContent
   RESULT = IncludeSubobjectFromSubobject( NewSPLD, "SubregLabelContent", SourceSPLD, "SubregLabelContent", zPOS_AFTER );

   //:// SPLD_UsageType Entries
   //:FOR EACH SourceSPLD.SPLD_UsageType
   RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_UsageType", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_UsageType
      RESULT = CreateEntity( NewSPLD, "SPLD_UsageType", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_UsageType", SourceSPLD, "SPLD_UsageType", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_UsageType", SourceSPLD, "SPLD_UsageType", zSET_NULL );
      //:FOR EACH SourceSPLD.SPLD_Usage
      RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_Usage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_Usage
         RESULT = CreateEntity( NewSPLD, "SPLD_Usage", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_Usage", SourceSPLD, "SPLD_Usage", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_Usage", SourceSPLD, "SPLD_Usage", zSET_NULL );
         //:INCLUDE NewSPLD.S_Usage FROM SourceSPLD.S_Usage
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_Usage", SourceSPLD, "S_Usage", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_Usage", "" );
      } 

      RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_UsageType", "" );
      //:END
   } 

   //:END

   //:// SPLD_GeneralSection
   //:FOR EACH SourceSPLD.SPLD_GeneralSection
   RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_GeneralSection
      RESULT = CreateEntity( NewSPLD, "SPLD_GeneralSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_GeneralSection", SourceSPLD, "SPLD_GeneralSection", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_GeneralSection", SourceSPLD, "SPLD_GeneralSection", zSET_NULL );
      //:INCLUDE NewSPLD.S_GeneralSection FROM SourceSPLD.S_GeneralSection
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_GeneralSection", SourceSPLD, "S_GeneralSection", zPOS_AFTER );
      //:FOR EACH SourceSPLD.SPLD_GeneralStatement
      RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_GeneralStatement
         RESULT = CreateEntity( NewSPLD, "SPLD_GeneralStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_GeneralStatement", SourceSPLD, "SPLD_GeneralStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_GeneralStatement", SourceSPLD, "SPLD_GeneralStatement", zSET_NULL );
         //:INCLUDE NewSPLD.S_GeneralStatement FROM SourceSPLD.S_GeneralStatement
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_GeneralStatement", SourceSPLD, "S_GeneralStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_GeneralStatement", "" );
      } 

      RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_GeneralSection", "" );
      //:END
   } 

   //:END

   //:// Ingredients
   //:FOR EACH SourceSPLD.SPLD_IngredientsSection
   RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_IngredientsSection
      RESULT = CreateEntity( NewSPLD, "SPLD_IngredientsSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_IngredientsSection", SourceSPLD, "SPLD_IngredientsSection", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_IngredientsSection", SourceSPLD, "SPLD_IngredientsSection", zSET_NULL );
      //:INCLUDE NewSPLD.S_IngredientsSection FROM SourceSPLD.S_IngredientsSection
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_IngredientsSection", SourceSPLD, "S_IngredientsSection", zPOS_AFTER );
      //:FOR EACH SourceSPLD.SPLD_IngredientsStatement
      RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_IngredientsStatement
         RESULT = CreateEntity( NewSPLD, "SPLD_IngredientsStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_IngredientsStatement", SourceSPLD, "SPLD_IngredientsStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_IngredientsStatement", SourceSPLD, "SPLD_IngredientsStatement", zSET_NULL );
         //:INCLUDE NewSPLD.S_IngredientsStatement FROM SourceSPLD.S_IngredientsStatement
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_IngredientsStatement", SourceSPLD, "S_IngredientsStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_IngredientsStatement", "" );
      } 

      RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_IngredientsSection", "" );
      //:END
   } 

   //:END

   //:// SPLD_StorageDisposalSection
   //:FOR EACH SourceSPLD.SPLD_StorageDisposalSection
   RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_StorageDisposalSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_StorageDisposalSection
      RESULT = CreateEntity( NewSPLD, "SPLD_StorageDisposalSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_StorageDisposalSection", SourceSPLD, "SPLD_StorageDisposalSection", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_StorageDisposalSection", SourceSPLD, "SPLD_StorageDisposalSection", zSET_NULL );
      //:INCLUDE NewSPLD.S_StorageDisposalSection FROM SourceSPLD.S_StorageDisposalSection
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_StorageDisposalSection", SourceSPLD, "S_StorageDisposalSection", zPOS_AFTER );
      //:FOR EACH SourceSPLD.SPLD_StorageDisposalStatement
      RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_StorageDisposalStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_StorageDisposalStatement
         RESULT = CreateEntity( NewSPLD, "SPLD_StorageDisposalStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_StorageDisposalStatement", SourceSPLD, "SPLD_StorageDisposalStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_StorageDisposalStatement", SourceSPLD, "SPLD_StorageDisposalStatement", zSET_NULL );
         //:INCLUDE NewSPLD.S_StorageDisposalStatement FROM SourceSPLD.S_StorageDisposalStatement
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_StorageDisposalStatement", SourceSPLD, "S_StorageDisposalStatement", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_StorageDisposalStatement", "" );
      } 

      RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_StorageDisposalSection", "" );
      //:END
   } 

   //:END

   //:// SPLD_DirectionsForUseSection
   //:FOR EACH SourceSPLD.SPLD_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_DirectionsForUseSection
      RESULT = CreateEntity( NewSPLD, "SPLD_DirectionsForUseSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsForUseSection", SourceSPLD, "SPLD_DirectionsForUseSection", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsForUseSection", SourceSPLD, "SPLD_DirectionsForUseSection", zSET_NULL );
      //:INCLUDE NewSPLD.S_DirectionsForUseSection FROM SourceSPLD.S_DirectionsForUseSection
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_DirectionsForUseSection", SourceSPLD, "S_DirectionsForUseSection", zPOS_AFTER );
      //:FOR EACH SourceSPLD.SPLD_DirectionsForUseStatement
      RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_DirectionsForUseStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_DirectionsForUseStatement
         RESULT = CreateEntity( NewSPLD, "SPLD_DirectionsForUseStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsForUseStatement", SourceSPLD, "SPLD_DirectionsForUseStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsForUseStatement", SourceSPLD, "SPLD_DirectionsForUseStatement", zSET_NULL );
         //:INCLUDE NewSPLD.S_DirectionsForUseStatement FROM SourceSPLD.S_DirectionsForUseStatement
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_DirectionsForUseStatement", SourceSPLD, "S_DirectionsForUseStatement", zPOS_AFTER );

         //:// UsageOrder entries
         //:FOR EACH SourceSPLD.SPLD_DirectionsUsageOrdering
         RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_DirectionsUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST NewSPLD.S_Usage WITHIN NewSPLD.SubregPhysicalLabelDef
            //:           WHERE NewSPLD.S_Usage.ID = SourceSPLD.S_Usage.ID
            {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
                         GetIntegerFromAttribute( mi_lTempInteger_0, SourceSPLD, "S_Usage", "ID" );
            lTempInteger_0 = mi_lTempInteger_0.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( NewSPLD, "S_Usage", "ID", lTempInteger_0, "SubregPhysicalLabelDef" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:CREATE ENTITY NewSPLD.SPLD_DirectionsUsageOrdering
               RESULT = CreateEntity( NewSPLD, "SPLD_DirectionsUsageOrdering", zPOS_AFTER );
               //:SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsUsageOrdering", SourceSPLD, "SPLD_DirectionsUsageOrdering", zSET_NULL )
               SetMatchingAttributesByName( NewSPLD, "SPLD_DirectionsUsageOrdering", SourceSPLD, "SPLD_DirectionsUsageOrdering", zSET_NULL );
               //:// We need to include the new SPLD_Usage entry created in the NewSPLD.
               //:INCLUDE NewSPLD.SPLD_DirectionsUsage FROM NewSPLD.SPLD_Usage
               RESULT = IncludeSubobjectFromSubobject( NewSPLD, "SPLD_DirectionsUsage", NewSPLD, "SPLD_Usage", zPOS_AFTER );
            } 

            RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_DirectionsUsageOrdering", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_DirectionsForUseStatement", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// SPLD_MarketingSection
   //:FOR EACH SourceSPLD.SPLD_MarketingSection
   RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_MarketingSection
      RESULT = CreateEntity( NewSPLD, "SPLD_MarketingSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_MarketingSection", SourceSPLD, "SPLD_MarketingSection", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_MarketingSection", SourceSPLD, "SPLD_MarketingSection", zSET_NULL );
      //:INCLUDE NewSPLD.S_MarketingSection FROM SourceSPLD.S_MarketingSection
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_MarketingSection", SourceSPLD, "S_MarketingSection", zPOS_AFTER );
      //:FOR EACH SourceSPLD.SPLD_MarketingStatement
      RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.SPLD_MarketingStatement
         RESULT = CreateEntity( NewSPLD, "SPLD_MarketingStatement", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "SPLD_MarketingStatement", SourceSPLD, "SPLD_MarketingStatement", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "SPLD_MarketingStatement", SourceSPLD, "SPLD_MarketingStatement", zSET_NULL );
         //:INCLUDE NewSPLD.S_MarketingStatement FROM SourceSPLD.S_MarketingStatement
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_MarketingStatement", SourceSPLD, "S_MarketingStatement", zPOS_AFTER );

         //:// UsageOrder entries
         //:FOR EACH SourceSPLD.SPLD_MarketingUsageOrdering
         RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_MarketingUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST NewSPLD.S_Usage WITHIN NewSPLD.SubregPhysicalLabelDef
            //:           WHERE NewSPLD.S_Usage.ID = SourceSPLD.S_Usage.ID
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                         GetIntegerFromAttribute( mi_lTempInteger_1, SourceSPLD, "S_Usage", "ID" );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( NewSPLD, "S_Usage", "ID", lTempInteger_1, "SubregPhysicalLabelDef" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:CREATE ENTITY NewSPLD.SPLD_MarketingUsageOrdering
               RESULT = CreateEntity( NewSPLD, "SPLD_MarketingUsageOrdering", zPOS_AFTER );
               //:SetMatchingAttributesByName( NewSPLD, "SPLD_MarketingUsageOrdering", SourceSPLD, "SPLD_MarketingUsageOrdering", zSET_NULL )
               SetMatchingAttributesByName( NewSPLD, "SPLD_MarketingUsageOrdering", SourceSPLD, "SPLD_MarketingUsageOrdering", zSET_NULL );
               //:// We need to include the new SPLD_Usage entry created in the NewSPLD.
               //:INCLUDE NewSPLD.SPLD_MarketingUsage FROM NewSPLD.SPLD_Usage
               RESULT = IncludeSubobjectFromSubobject( NewSPLD, "SPLD_MarketingUsage", NewSPLD, "SPLD_Usage", zPOS_AFTER );
            } 

            RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_MarketingUsageOrdering", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_MarketingStatement", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_MarketingSection", "" );
      //:END
   } 

   //:END

   //:// SPLD_HumanHazardSection
   //:FOR EACH SourceSPLD.SPLD_HumanHazardSection
   RESULT = SetCursorFirstEntity( SourceSPLD, "SPLD_HumanHazardSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.SPLD_HumanHazardSection
      RESULT = CreateEntity( NewSPLD, "SPLD_HumanHazardSection", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_HumanHazardSection", SourceSPLD, "SPLD_HumanHazardSection", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_HumanHazardSection", SourceSPLD, "SPLD_HumanHazardSection", zSET_NULL );
      //:IF SourceSPLD.S_HumanHazardSection EXISTS
      lTempInteger_2 = CheckExistenceOfEntity( SourceSPLD, "S_HumanHazardSection" );
      if ( lTempInteger_2 == 0 )
      { 
         //:INCLUDE NewSPLD.S_HumanHazardSection FROM SourceSPLD.S_HumanHazardSection
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_HumanHazardSection", SourceSPLD, "S_HumanHazardSection", zPOS_AFTER );
      } 

      RESULT = SetCursorNextEntity( SourceSPLD, "SPLD_HumanHazardSection", "" );
      //:END
   } 

   //:END

   //:// SPLD_LLD
   //:CREATE ENTITY NewSPLD.SPLD_LLD
   RESULT = CreateEntity( NewSPLD, "SPLD_LLD", zPOS_AFTER );
   //:SetMatchingAttributesByName( NewSPLD, "S_HumanHazardSection", SourceSPLD, "S_HumanHazardSection", zSET_NULL )
   SetMatchingAttributesByName( NewSPLD, "S_HumanHazardSection", SourceSPLD, "S_HumanHazardSection", zSET_NULL );
   //:FOR EACH SourceSPLD.LLD_Page
   RESULT = SetCursorFirstEntity( SourceSPLD, "LLD_Page", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.LLD_Page
      RESULT = CreateEntity( NewSPLD, "LLD_Page", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "LLD_Page", SourceSPLD, "LLD_Page", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "LLD_Page", SourceSPLD, "LLD_Page", zSET_NULL );
      //:IF SourceSPLD.PageBackgroundColor EXISTS
      lTempInteger_3 = CheckExistenceOfEntity( SourceSPLD, "PageBackgroundColor" );
      if ( lTempInteger_3 == 0 )
      { 
         //:INCLUDE NewSPLD.PageBackgroundColor FROM SourceSPLD.PageBackgroundColor
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "PageBackgroundColor", SourceSPLD, "PageBackgroundColor", zPOS_AFTER );
      } 

      //:END
      //:FOR EACH SourceSPLD.LLD_Panel
      RESULT = SetCursorFirstEntity( SourceSPLD, "LLD_Panel", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.LLD_Panel
         RESULT = CreateEntity( NewSPLD, "LLD_Panel", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "LLD_Panel", SourceSPLD, "LLD_Panel", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "LLD_Panel", SourceSPLD, "LLD_Panel", zSET_NULL );
         //:IF SourceSPLD.PanelBackgroundColor EXISTS
         lTempInteger_4 = CheckExistenceOfEntity( SourceSPLD, "PanelBackgroundColor" );
         if ( lTempInteger_4 == 0 )
         { 
            //:INCLUDE NewSPLD.PanelBackgroundColor FROM SourceSPLD.PanelBackgroundColor
            RESULT = IncludeSubobjectFromSubobject( NewSPLD, "PanelBackgroundColor", SourceSPLD, "PanelBackgroundColor", zPOS_AFTER );
         } 

         //:END
         //:IF SourceSPLD.PanelBorderColor EXISTS
         lTempInteger_5 = CheckExistenceOfEntity( SourceSPLD, "PanelBorderColor" );
         if ( lTempInteger_5 == 0 )
         { 
            //:INCLUDE NewSPLD.PanelBorderColor FROM SourceSPLD.PanelBorderColor
            RESULT = IncludeSubobjectFromSubobject( NewSPLD, "PanelBorderColor", SourceSPLD, "PanelBorderColor", zPOS_AFTER );
         } 

         //:END
         //:FOR EACH SourceSPLD.LLD_Block
         RESULT = SetCursorFirstEntity( SourceSPLD, "LLD_Block", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:// Use recursive routine to duplicate Block.
            //:DuplicateSPLD_Block( NewSPLD, SourceSPLD )
            omSPLDef_DuplicateSPLD_Block( NewSPLD, SourceSPLD );
            RESULT = SetCursorNextEntity( SourceSPLD, "LLD_Block", "" );
         } 

         RESULT = SetCursorNextEntity( SourceSPLD, "LLD_Panel", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SourceSPLD, "LLD_Page", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
public int 
omSPLDef_DuplicateSPLD_Block( View     NewSPLD,
                              View     SourceSPLD )
{
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;

   //:DuplicateSPLD_Block( VIEW NewSPLD    BASED ON LOD mSPLDef,
   //:                  VIEW SourceSPLD BASED ON LOD mSPLDef )

   //:// This is a recursive routine to duplicate an LLD_Block / LLD_SubBlock.
   //:CREATE ENTITY NewSPLD.LLD_Block
   RESULT = CreateEntity( NewSPLD, "LLD_Block", zPOS_AFTER );
   //:SetMatchingAttributesByName( NewSPLD, "LLD_Block", SourceSPLD, "LLD_Block", zSET_NULL )
   SetMatchingAttributesByName( NewSPLD, "LLD_Block", SourceSPLD, "LLD_Block", zSET_NULL );
   //:IF SourceSPLD.BlockBackgroundColor EXISTS
   lTempInteger_0 = CheckExistenceOfEntity( SourceSPLD, "BlockBackgroundColor" );
   if ( lTempInteger_0 == 0 )
   { 
      //:INCLUDE NewSPLD.BlockBackgroundColor FROM SourceSPLD.BlockBackgroundColor
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "BlockBackgroundColor", SourceSPLD, "BlockBackgroundColor", zPOS_AFTER );
   } 

   //:END
   //:IF SourceSPLD.BlockBorderColor EXISTS
   lTempInteger_1 = CheckExistenceOfEntity( SourceSPLD, "BlockBorderColor" );
   if ( lTempInteger_1 == 0 )
   { 
      //:INCLUDE NewSPLD.BlockBorderColor FROM SourceSPLD.BlockBorderColor
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "BlockBorderColor", SourceSPLD, "BlockBorderColor", zPOS_AFTER );
   } 

   //:END
   //:FOR EACH SourceSPLD.LLD_SpecialSectionAttribute
   RESULT = SetCursorFirstEntity( SourceSPLD, "LLD_SpecialSectionAttribute", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.LLD_SpecialSectionAttribute
      RESULT = CreateEntity( NewSPLD, "LLD_SpecialSectionAttribute", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "LLD_SpecialSectionAttribute", SourceSPLD, "LLD_SpecialSectionAttribute", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "LLD_SpecialSectionAttribute", SourceSPLD, "LLD_SpecialSectionAttribute", zSET_NULL );
      //:CREATE ENTITY NewSPLD.LLD_SpecialSectionAttrBlock
      RESULT = CreateEntity( NewSPLD, "LLD_SpecialSectionAttrBlock", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "LLD_SpecialSectionAttrBlock", SourceSPLD, "LLD_SpecialSectionAttrBlock", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "LLD_SpecialSectionAttrBlock", SourceSPLD, "LLD_SpecialSectionAttrBlock", zSET_NULL );
      //:IF SourceSPLD.SpecialAttributeTextColor EXISTS
      lTempInteger_2 = CheckExistenceOfEntity( SourceSPLD, "SpecialAttributeTextColor" );
      if ( lTempInteger_2 == 0 )
      { 
         //:INCLUDE NewSPLD.SpecialAttributeTextColor FROM SourceSPLD.SpecialAttributeTextColor
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "SpecialAttributeTextColor", SourceSPLD, "SpecialAttributeTextColor", zPOS_AFTER );
      } 

      RESULT = SetCursorNextEntity( SourceSPLD, "LLD_SpecialSectionAttribute", "" );
      //:END
   } 

   //:END
   //:FOR EACH SourceSPLD.LLD_SubBlock
   RESULT = SetCursorFirstEntity( SourceSPLD, "LLD_SubBlock", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SetViewToSubobject( SourceSPLD, "LLD_SubBlock" )
      SetViewToSubobject( SourceSPLD, "LLD_SubBlock" );
      //:SetViewToSubobject( NewSPLD, "LLD_SubBlock" )
      SetViewToSubobject( NewSPLD, "LLD_SubBlock" );

      //:DuplicateSPLD_Block( NewSPLD, SourceSPLD )
      omSPLDef_DuplicateSPLD_Block( NewSPLD, SourceSPLD );

      //:ResetViewFromSubobject( SourceSPLD )
      ResetViewFromSubobject( SourceSPLD );
      //:ResetViewFromSubobject( NewSPLD )
      ResetViewFromSubobject( NewSPLD );
      RESULT = SetCursorNextEntity( SourceSPLD, "LLD_SubBlock", "" );
   } 

   //:END
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dFullHazardStatement( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   STRING ( 256 ) szString
public int 
omSPLDef_dFullHazardStatement( View     mSPLDef,
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

         //:IF mSPLDef.SPLD_HumanHazardSection  EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSPLDef, "SPLD_HumanHazardSection" );
         if ( lTempInteger_0 == 0 )
         { 

            //:szSeparator = mSPLDef.SPLD_HumanHazardSection.LocationSeparator
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szSeparator;
            if ( szSeparator == null )
               sb_szSeparator = new StringBuilder( 32 );
            else
               sb_szSeparator = new StringBuilder( szSeparator );
                         GetVariableFromAttribute( sb_szSeparator, mi_lTempInteger_1, 'S', 3, mSPLDef, "SPLD_HumanHazardSection", "LocationSeparator", "", 0 );
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

            //:szEncloseFirst = mSPLDef.SPLD_HumanHazardSection.EncloseFirstLocation
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
            StringBuilder sb_szEncloseFirst;
            if ( szEncloseFirst == null )
               sb_szEncloseFirst = new StringBuilder( 32 );
            else
               sb_szEncloseFirst = new StringBuilder( szEncloseFirst );
                         GetVariableFromAttribute( sb_szEncloseFirst, mi_lTempInteger_2, 'S', 2, mSPLDef, "SPLD_HumanHazardSection", "EncloseFirstLocation", "", 0 );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );
            szEncloseFirst = sb_szEncloseFirst.toString( );}
            //:szString = mSPLDef.SPLD_HumanHazardSection.PrecautionaryStatement
            {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_3, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "PrecautionaryStatement", "", 0 );
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
               //:szLocation = mSPLDef.SPLD_HumanHazardSection.PanelLoc1
               {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_4, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc1", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.PanelLoc2
               {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_5, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc2", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.PanelLoc3
               {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_6, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc3", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.PanelLoc4
               {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_7, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc4", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.PanelLoc5
               {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_8, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc5", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.PanelLoc6
               {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_9, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc6", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.PanelLoc7
               {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_10, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc7", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.PanelLoc8
               {MutableInt mi_lTempInteger_11 = new MutableInt( lTempInteger_11 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_11, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc8", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.PanelLoc9
               {MutableInt mi_lTempInteger_12 = new MutableInt( lTempInteger_12 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_12, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc9", "", 0 );
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
               //:szLocation = mSPLDef.SPLD_HumanHazardSection.LabelLoc1
               {MutableInt mi_lTempInteger_13 = new MutableInt( lTempInteger_13 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_13, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "LabelLoc1", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.LabelLoc2
               {MutableInt mi_lTempInteger_14 = new MutableInt( lTempInteger_14 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_14, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "LabelLoc2", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.LabelLoc3
               {MutableInt mi_lTempInteger_15 = new MutableInt( lTempInteger_15 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_15, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "LabelLoc3", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.LabelLoc4
               {MutableInt mi_lTempInteger_16 = new MutableInt( lTempInteger_16 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_16, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "LabelLoc4", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.LabelLoc5
               {MutableInt mi_lTempInteger_17 = new MutableInt( lTempInteger_17 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_17, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "LabelLoc5", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.LabelLoc6
               {MutableInt mi_lTempInteger_18 = new MutableInt( lTempInteger_18 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_18, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "LabelLoc6", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.LabelLoc7
               {MutableInt mi_lTempInteger_19 = new MutableInt( lTempInteger_19 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_19, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "LabelLoc7", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.LabelLoc8
               {MutableInt mi_lTempInteger_20 = new MutableInt( lTempInteger_20 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_20, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "LabelLoc8", "", 0 );
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

               //:szLocation = mSPLDef.SPLD_HumanHazardSection.LabelLoc9
               {MutableInt mi_lTempInteger_21 = new MutableInt( lTempInteger_21 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_21, 'S', 257, mSPLDef, "SPLD_HumanHazardSection", "LabelLoc9", "", 0 );
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
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szString );
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
   //:dSelectedHazardStmt( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:                  STRING ( 32 ) InternalEntityStructure,
   //:                  STRING ( 32 ) InternalAttribStructure,
   //:                  SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szString
public int 
omSPLDef_dSelectedHazardStmt( View     mSPLDef,
                              String InternalEntityStructure,
                              String InternalAttribStructure,
                              Integer   GetOrSetFlag )
{
   String   szString = null;
   //:STRING ( 2048 ) szReplaceString
   String   szReplaceString = null;
   //:STRING ( 2048 ) szLocation
   String   szLocation = null;
   //:SHORT nPosStart
   int      nPosStart = 0;
   //:SHORT nPosEnd
   int      nPosEnd = 0;
   //:SHORT nLth
   int      nLth = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:szString = ""
          {StringBuilder sb_szString;
         if ( szString == null )
            sb_szString = new StringBuilder( 32 );
         else
            sb_szString = new StringBuilder( szString );
                  ZeidonStringCopy( sb_szString, 1, 0, "", 1, 0, 2049 );
         szString = sb_szString.toString( );}

         //:// Build Precautionary Statement by inserting correct Location within general statement, so that a
         //:// statement such as, "See {{Precautionary Panel Location}}" for Precautionary Statements and First Aid." becomes
         //:// "See side panel for Precautionary Statements and First Aid."
         //:IF mSPLDef.SPLD_HumanHazardSection EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSPLDef, "SPLD_HumanHazardSection" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szString = mSPLDef.SPLD_HumanHazardSection.PrecautionaryStatement
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         GetVariableFromAttribute( sb_szString, mi_lTempInteger_1, 'S', 2049, mSPLDef, "SPLD_HumanHazardSection", "PrecautionaryStatement", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szString = sb_szString.toString( );}
            //:nPosStart = zSearchSubString( szString, "[{{Precautionary Panel Location}}]", "f", 0 )
            nPosStart = zSearchSubString( szString, "[{{Precautionary Panel Location}}]", "f", 0 );
            //:IF nPosStart >= 0
            if ( nPosStart >= 0 )
            { 
               //:nPosEnd = nPosStart + 34 // length of "[{{Precautionary Panel Location}}]"
               nPosEnd = nPosStart + 34;
               //:ELSE
            } 
            else
            { 
               //:nPosStart = zSearchSubString( szString, "{{Precautionary Panel Location}}", "f", 0 )
               nPosStart = zSearchSubString( szString, "{{Precautionary Panel Location}}", "f", 0 );
               //:IF nPosStart >= 0
               if ( nPosStart >= 0 )
               { 
                  //:nPosEnd = nPosStart + 32 // length of "{{Precautionary Panel Location}}"
                  nPosEnd = nPosStart + 32;
               } 

               //:END
            } 

            //:END
            //:IF nPosStart >= 0
            if ( nPosStart >= 0 )
            { 
               //:szLocation = mSPLDef.SPLD_HumanHazardSection.PanelLoc
               {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_2, 'S', 2049, mSPLDef, "SPLD_HumanHazardSection", "PanelLoc", "", 0 );
               lTempInteger_2 = mi_lTempInteger_2.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:zSearchAndReplace( szLocation, 2048, ",", " ")
               {StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               zSearchAndReplace( sb_szLocation, 2048, ",", " " );
               szLocation = sb_szLocation.toString( );}
               //:zReplaceSubString( szString, nPosStart, nPosEnd, szLocation )
               {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                               zReplaceSubString( sb_szString, nPosStart, nPosEnd, szLocation );
               szString = sb_szString.toString( );}
            } 

            //:END

            //:nPosStart = zSearchSubString( szString, "[{{Precautionary Label Location}}]", "f", 0 )
            nPosStart = zSearchSubString( szString, "[{{Precautionary Label Location}}]", "f", 0 );
            //:IF nPosStart >= 0
            if ( nPosStart >= 0 )
            { 
               //:nPosEnd = nPosStart + 34 // length of "[{{Precautionary Label Location}}]"
               nPosEnd = nPosStart + 34;
               //:ELSE
            } 
            else
            { 
               //:nPosStart = zSearchSubString( szString, "{{Precautionary Label Location}}", "f", 0 )
               nPosStart = zSearchSubString( szString, "{{Precautionary Label Location}}", "f", 0 );
               //:IF nPosStart >= 0
               if ( nPosStart >= 0 )
               { 
                  //:nPosEnd = nPosStart + 32 // length of "{{Precautionary Label Location}}"
                  nPosEnd = nPosStart + 32;
               } 

               //:END
            } 

            //:END
            //:IF nPosStart >= 0
            if ( nPosStart >= 0 )
            { 
               //:szLocation = mSPLDef.SPLD_HumanHazardSection.LabelLoc
               {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
               StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               GetVariableFromAttribute( sb_szLocation, mi_lTempInteger_3, 'S', 2049, mSPLDef, "SPLD_HumanHazardSection", "LabelLoc", "", 0 );
               lTempInteger_3 = mi_lTempInteger_3.intValue( );
               szLocation = sb_szLocation.toString( );}
               //:zSearchAndReplace( szLocation, 2048, ",", " ")
               {StringBuilder sb_szLocation;
               if ( szLocation == null )
                  sb_szLocation = new StringBuilder( 32 );
               else
                  sb_szLocation = new StringBuilder( szLocation );
                               zSearchAndReplace( sb_szLocation, 2048, ",", " " );
               szLocation = sb_szLocation.toString( );}
               //:zReplaceSubString( szString, nPosStart, nPosEnd, szLocation )
               {StringBuilder sb_szString;
               if ( szString == null )
                  sb_szString = new StringBuilder( 32 );
               else
                  sb_szString = new StringBuilder( szString );
                               zReplaceSubString( sb_szString, nPosStart, nPosEnd, szLocation );
               szString = sb_szString.toString( );}
            } 

            //:END

            //:RemovePairedCharactersFromString( szString, "{", "}", "" )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szString;
            if ( szString == null )
               sb_szString = new StringBuilder( 32 );
            else
               sb_szString = new StringBuilder( szString );
                         m_ZGlobal1_Operation.RemovePairedCharactersFromString( sb_szString, "{", "}", "" );
            szString = sb_szString.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END
         //:// TraceLineS( "Hazard Statement: ", szString )
         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szString )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szString );
         break ;

      //:// end zDERIVED_GET
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
//:FormatBlockContainer( VIEW mSPLDefPDF BASED ON LOD mSPLDef,
//:                      VIEW mSPLDef    BASED ON LOD mSPLDef,
//:                      INTEGER lFile,
//:                      STRING ( 50 )    szLeadingBlanks,
//:                      STRING ( 32000 ) szWriteBuffer,
//:                      STRING ( 32 )    szTopPosition )

//:   STRING ( 32 )  szTop
public int 
omSPLDef_FormatBlockContainer( View     mSPLDefPDF,
                               View     mSPLDef,
                               int      lFile,
                               String   szLeadingBlanks,
                               String   szWriteBuffer,
                               String   szTopPosition )
{
   String   szTop = null;
   //:STRING ( 32 )  szHeight
   String   szHeight = null;
   //:STRING ( 32 )  szWidth
   String   szWidth = null;
   //:STRING ( 32 )  szLeft
   String   szLeft = null;
   //:STRING ( 32 )  szBorderStyle
   String   szBorderStyle = null;
   //:STRING ( 32 )  szColor
   String   szColor = null;
   //:STRING ( 32 )  szFontFamily
   String   szFontFamily = null;
   //:STRING ( 32 )  szFontSize
   String   szFontSize = null;
   //:STRING ( 32 )  szDefaultFontSize
   String   szDefaultFontSize = null;
   //:STRING ( 32 )  szFontWeight
   String   szFontWeight = null;
   //:STRING ( 32 )  szMBP
   String   szMBP = null;
   //:STRING ( 32 )  szTopMBP
   String   szTopMBP = null;
   //:STRING ( 32 )  szBottomMBP
   String   szBottomMBP = null;
   //:STRING ( 32 )  szLeftMBP
   String   szLeftMBP = null;
   //:STRING ( 32 )  szRightMBP
   String   szRightMBP = null;
   //:STRING ( 32 )  szTextAlign
   String   szTextAlign = null;
   //:STRING ( 256 ) szImg
   String   szImg = null;

   //:STRING ( 512 ) szDebugMsg
   String   szDebugMsg = null;
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
   int      RESULT = 0;
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
   int      lTempInteger_22 = 0;
   int      lTempInteger_23 = 0;
   int      lTempInteger_24 = 0;
   int      lTempInteger_25 = 0;
   int      lTempInteger_26 = 0;
   int      lTempInteger_27 = 0;
   int      lTempInteger_28 = 0;


   //:// szDebugMsg = mSPLDefPDF.LLD_Block.ID
   //:// szDebugMsg = szDebugMsg + "   Tag: " + mSPLDefPDF.LLD_Block.Tag
   //:// szDebugMsg = szDebugMsg + "   Name: " + mSPLDefPDF.LLD_Block.Name
   //:// szDebugMsg = szDebugMsg + "   Title: " + mSPLDefPDF.LLD_Block.BlockTitle
   //:// szDebugMsg = szDebugMsg + "   Section Type: " + mSPLDefPDF.LLD_Block.LLD_SectionType
   //:// TraceLineS( "FormatBlockContainer ID: ",  szDebugMsg )
   //:// DisplayBlockAttributes( mSPLDefPDF, 1 )

   //:// Default font size will be set to 8pt for now.
   //:szDefaultFontSize = "8"
    {StringBuilder sb_szDefaultFontSize;
   if ( szDefaultFontSize == null )
      sb_szDefaultFontSize = new StringBuilder( 32 );
   else
      sb_szDefaultFontSize = new StringBuilder( szDefaultFontSize );
      ZeidonStringCopy( sb_szDefaultFontSize, 1, 0, "8", 1, 0, 33 );
   szDefaultFontSize = sb_szDefaultFontSize.toString( );}

   //:// Process a Block and its subcomponents, which builds the XSL statement for the Container.
   //:// Note that mSPLDefPDF is addressing ONLY the LLD subobject and that this subobject could be in a temporary
   //:// object where that LLD subobject is the only thing valid in that object.

   //:szWriteBuffer = szLeadingBlanks + "<fo:block-container position=^absolute^"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block-container position=^absolute^", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}

   //:IF mSPLDefPDF.BlockBackgroundColor EXISTS
   lTempInteger_0 = CheckExistenceOfEntity( mSPLDefPDF, "BlockBackgroundColor" );
   if ( lTempInteger_0 == 0 )
   { 
      //:szColor = mSPLDefPDF.BlockBackgroundColor.RGB
      {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
      StringBuilder sb_szColor;
      if ( szColor == null )
         sb_szColor = new StringBuilder( 32 );
      else
         sb_szColor = new StringBuilder( szColor );
             GetVariableFromAttribute( sb_szColor, mi_lTempInteger_1, 'S', 33, mSPLDefPDF, "BlockBackgroundColor", "RGB", "", 0 );
      lTempInteger_1 = mi_lTempInteger_1.intValue( );
      szColor = sb_szColor.toString( );}
      //:IF szColor != ""
      if ( ZeidonStringCompare( szColor, 1, 0, "", 1, 0, 33 ) != 0 )
      { 
         //:szWriteBuffer = szWriteBuffer + " background-color=^#" + szColor + "^"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " background-color=^#", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szColor, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
      } 

      //:END
   } 

   //:END

   //:IF mSPLDefPDF.BlockBorderColor EXISTS
   lTempInteger_2 = CheckExistenceOfEntity( mSPLDefPDF, "BlockBorderColor" );
   if ( lTempInteger_2 == 0 )
   { 
      //:szColor = mSPLDefPDF.BlockBorderColor.RGB
      {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
      StringBuilder sb_szColor;
      if ( szColor == null )
         sb_szColor = new StringBuilder( 32 );
      else
         sb_szColor = new StringBuilder( szColor );
             GetVariableFromAttribute( sb_szColor, mi_lTempInteger_3, 'S', 33, mSPLDefPDF, "BlockBorderColor", "RGB", "", 0 );
      lTempInteger_3 = mi_lTempInteger_3.intValue( );
      szColor = sb_szColor.toString( );}
      //:IF szColor != ""
      if ( ZeidonStringCompare( szColor, 1, 0, "", 1, 0, 33 ) != 0 )
      { 
         //:szWriteBuffer = szWriteBuffer + " border-color=^#" + szColor + "^"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " border-color=^#", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szColor, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
      } 

      //:END
   } 

   //:END

   //:szBorderStyle = mSPLDefPDF.LLD_Block.BorderStyle
   {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
   StringBuilder sb_szBorderStyle;
   if ( szBorderStyle == null )
      sb_szBorderStyle = new StringBuilder( 32 );
   else
      sb_szBorderStyle = new StringBuilder( szBorderStyle );
       GetVariableFromAttribute( sb_szBorderStyle, mi_lTempInteger_4, 'S', 33, mSPLDefPDF, "LLD_Block", "BorderStyle", "", 0 );
   lTempInteger_4 = mi_lTempInteger_4.intValue( );
   szBorderStyle = sb_szBorderStyle.toString( );}
   //:IF szBorderStyle != ""
   if ( ZeidonStringCompare( szBorderStyle, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " border-style=^" + szBorderStyle + "^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " border-style=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szBorderStyle, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:szWidth = mSPLDefPDF.LLD_Block.BorderWidth
   {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
   StringBuilder sb_szWidth;
   if ( szWidth == null )
      sb_szWidth = new StringBuilder( 32 );
   else
      sb_szWidth = new StringBuilder( szWidth );
       GetVariableFromAttribute( sb_szWidth, mi_lTempInteger_5, 'S', 33, mSPLDefPDF, "LLD_Block", "BorderWidth", "", 0 );
   lTempInteger_5 = mi_lTempInteger_5.intValue( );
   szWidth = sb_szWidth.toString( );}
   //:IF szWidth != ""
   if ( ZeidonStringCompare( szWidth, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " border-width=^" + szWidth + "px^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " border-width=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szWidth, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "px^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:// Block Container Start, which is either passed in or specified in Block.
   //:// 1. It is passed in as last parameter.
   //:// 2. It is specified in Computed Top attribute.
   //:IF szTopPosition != ""
   if ( ZeidonStringCompare( szTopPosition, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szTop = szTopPosition
       {StringBuilder sb_szTop;
      if ( szTop == null )
         sb_szTop = new StringBuilder( 32 );
      else
         sb_szTop = new StringBuilder( szTop );
            ZeidonStringCopy( sb_szTop, 1, 0, szTopPosition, 1, 0, 33 );
      szTop = sb_szTop.toString( );}
      //:ELSE
   } 
   else
   { 
      //:szTop = mSPLDefPDF.LLD_Block.wComputedTopPosition
      {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
      StringBuilder sb_szTop;
      if ( szTop == null )
         sb_szTop = new StringBuilder( 32 );
      else
         sb_szTop = new StringBuilder( szTop );
             GetVariableFromAttribute( sb_szTop, mi_lTempInteger_6, 'S', 33, mSPLDefPDF, "LLD_Block", "wComputedTopPosition", "", 0 );
      lTempInteger_6 = mi_lTempInteger_6.intValue( );
      szTop = sb_szTop.toString( );}
   } 

   //:END
   //://szTop = mSPLDefPDF.LLD_Block.Top ... commented out because it is either passed in or calculated
   //:IF szTop != ""
   if ( ZeidonStringCompare( szTop, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " top=^" + szTop + "in^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " top=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTop, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:szHeight = mSPLDefPDF.LLD_Block.Height
   {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
   StringBuilder sb_szHeight;
   if ( szHeight == null )
      sb_szHeight = new StringBuilder( 32 );
   else
      sb_szHeight = new StringBuilder( szHeight );
       GetVariableFromAttribute( sb_szHeight, mi_lTempInteger_7, 'S', 33, mSPLDefPDF, "LLD_Block", "Height", "", 0 );
   lTempInteger_7 = mi_lTempInteger_7.intValue( );
   szHeight = sb_szHeight.toString( );}
   //:IF szHeight != ""
   if ( ZeidonStringCompare( szHeight, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " height=^" + szHeight + "in^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " height=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szHeight, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:szWidth = mSPLDefPDF.LLD_Block.Width
   {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
   StringBuilder sb_szWidth;
   if ( szWidth == null )
      sb_szWidth = new StringBuilder( 32 );
   else
      sb_szWidth = new StringBuilder( szWidth );
       GetVariableFromAttribute( sb_szWidth, mi_lTempInteger_8, 'S', 33, mSPLDefPDF, "LLD_Block", "Width", "", 0 );
   lTempInteger_8 = mi_lTempInteger_8.intValue( );
   szWidth = sb_szWidth.toString( );}
   //:IF szWidth != ""
   if ( ZeidonStringCompare( szWidth, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " width=^" + szWidth + "in^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " width=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szWidth, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:szLeft = mSPLDefPDF.LLD_Block.Left
   {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
   StringBuilder sb_szLeft;
   if ( szLeft == null )
      sb_szLeft = new StringBuilder( 32 );
   else
      sb_szLeft = new StringBuilder( szLeft );
       GetVariableFromAttribute( sb_szLeft, mi_lTempInteger_9, 'S', 33, mSPLDefPDF, "LLD_Block", "Left", "", 0 );
   lTempInteger_9 = mi_lTempInteger_9.intValue( );
   szLeft = sb_szLeft.toString( );}
   //:IF szLeft != ""
   if ( ZeidonStringCompare( szLeft, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " left=^" + szLeft + "in^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " left=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeft, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:// Other Block parameters come from the "Block" LLD_SpecialSectionAttrBlock entry, if there is one.
   //:SET CURSOR FIRST mSPLDefPDF.LLD_SpecialSectionAttribute WHERE mSPLDefPDF.LLD_SpecialSectionAttribute.Name = "Block"
   RESULT = SetCursorFirstEntityByString( mSPLDefPDF, "LLD_SpecialSectionAttribute", "Name", "Block", "" );
   //:IF RESULT >= zCURSOR_SET
   if ( RESULT >= zCURSOR_SET )
   { 
      //:szFontFamily = mSPLDefPDF.LLD_SpecialSectionAttrBlock.FontFamily
      {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
      StringBuilder sb_szFontFamily;
      if ( szFontFamily == null )
         sb_szFontFamily = new StringBuilder( 32 );
      else
         sb_szFontFamily = new StringBuilder( szFontFamily );
             GetVariableFromAttribute( sb_szFontFamily, mi_lTempInteger_10, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "FontFamily", "", 0 );
      lTempInteger_10 = mi_lTempInteger_10.intValue( );
      szFontFamily = sb_szFontFamily.toString( );}
      //:// TraceLineS( "1Font Family set to: ", szFontFamily )
      //:IF szFontFamily != ""
      if ( ZeidonStringCompare( szFontFamily, 1, 0, "", 1, 0, 33 ) != 0 )
      { 
         //:szWriteBuffer = szWriteBuffer + " font-family=^" + szFontFamily + "^"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " font-family=^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szFontFamily, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
      } 

      //:END
      //:szFontSize = mSPLDefPDF.LLD_SpecialSectionAttrBlock.FontSize
      {MutableInt mi_lTempInteger_11 = new MutableInt( lTempInteger_11 );
      StringBuilder sb_szFontSize;
      if ( szFontSize == null )
         sb_szFontSize = new StringBuilder( 32 );
      else
         sb_szFontSize = new StringBuilder( szFontSize );
             GetVariableFromAttribute( sb_szFontSize, mi_lTempInteger_11, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "FontSize", "", 0 );
      lTempInteger_11 = mi_lTempInteger_11.intValue( );
      szFontSize = sb_szFontSize.toString( );}
      //:IF szFontSize != ""
      if ( ZeidonStringCompare( szFontSize, 1, 0, "", 1, 0, 33 ) != 0 )
      { 
         //:// TraceLineS( "1Font Size set to: ", szFontSize )
         //:szWriteBuffer = szWriteBuffer + " font-size=^" + szFontSize + "pt^"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " font-size=^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szFontSize, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "pt^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
      } 

      //:END
      //:szFontWeight = mSPLDefPDF.LLD_SpecialSectionAttrBlock.FontWeight
      {MutableInt mi_lTempInteger_12 = new MutableInt( lTempInteger_12 );
      StringBuilder sb_szFontWeight;
      if ( szFontWeight == null )
         sb_szFontWeight = new StringBuilder( 32 );
      else
         sb_szFontWeight = new StringBuilder( szFontWeight );
             GetVariableFromAttribute( sb_szFontWeight, mi_lTempInteger_12, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "FontWeight", "", 0 );
      lTempInteger_12 = mi_lTempInteger_12.intValue( );
      szFontWeight = sb_szFontWeight.toString( );}
      //:IF szFontWeight != ""
      if ( ZeidonStringCompare( szFontWeight, 1, 0, "", 1, 0, 33 ) != 0 )
      { 
         //:szWriteBuffer = szWriteBuffer + " font-weight=^" + szFontWeight + "^"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " font-weight=^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szFontWeight, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
      } 

      //:END

      //:szMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.Margin
      {MutableInt mi_lTempInteger_13 = new MutableInt( lTempInteger_13 );
      StringBuilder sb_szMBP;
      if ( szMBP == null )
         sb_szMBP = new StringBuilder( 32 );
      else
         sb_szMBP = new StringBuilder( szMBP );
             GetVariableFromAttribute( sb_szMBP, mi_lTempInteger_13, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "Margin", "", 0 );
      lTempInteger_13 = mi_lTempInteger_13.intValue( );
      szMBP = sb_szMBP.toString( );}
      //:IF szMBP = ""
      if ( ZeidonStringCompare( szMBP, 1, 0, "", 1, 0, 33 ) == 0 )
      { 
         //:szTopMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.MarginTop
         {MutableInt mi_lTempInteger_14 = new MutableInt( lTempInteger_14 );
         StringBuilder sb_szTopMBP;
         if ( szTopMBP == null )
            sb_szTopMBP = new StringBuilder( 32 );
         else
            sb_szTopMBP = new StringBuilder( szTopMBP );
                   GetVariableFromAttribute( sb_szTopMBP, mi_lTempInteger_14, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "MarginTop", "", 0 );
         lTempInteger_14 = mi_lTempInteger_14.intValue( );
         szTopMBP = sb_szTopMBP.toString( );}
         //:IF szTopMBP != ""
         if ( ZeidonStringCompare( szTopMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " margin-top=^" + szTopMBP + "in^"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " margin-top=^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTopMBP, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
         } 

         //:END
         //:szBottomMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.MarginBottom
         {MutableInt mi_lTempInteger_15 = new MutableInt( lTempInteger_15 );
         StringBuilder sb_szBottomMBP;
         if ( szBottomMBP == null )
            sb_szBottomMBP = new StringBuilder( 32 );
         else
            sb_szBottomMBP = new StringBuilder( szBottomMBP );
                   GetVariableFromAttribute( sb_szBottomMBP, mi_lTempInteger_15, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "MarginBottom", "", 0 );
         lTempInteger_15 = mi_lTempInteger_15.intValue( );
         szBottomMBP = sb_szBottomMBP.toString( );}
         //:IF szBottomMBP != ""
         if ( ZeidonStringCompare( szBottomMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " margin-bottom=^" + szBottomMBP + "in^"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " margin-bottom=^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szBottomMBP, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
         } 

         //:END
         //:szLeftMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.MarginLeft
         {MutableInt mi_lTempInteger_16 = new MutableInt( lTempInteger_16 );
         StringBuilder sb_szLeftMBP;
         if ( szLeftMBP == null )
            sb_szLeftMBP = new StringBuilder( 32 );
         else
            sb_szLeftMBP = new StringBuilder( szLeftMBP );
                   GetVariableFromAttribute( sb_szLeftMBP, mi_lTempInteger_16, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "MarginLeft", "", 0 );
         lTempInteger_16 = mi_lTempInteger_16.intValue( );
         szLeftMBP = sb_szLeftMBP.toString( );}
         //:IF szLeftMBP != ""
         if ( ZeidonStringCompare( szLeftMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " margin-left=^" + szLeftMBP + "in^"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " margin-left=^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeftMBP, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
         } 

         //:END
         //:szRightMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.MarginRight
         {MutableInt mi_lTempInteger_17 = new MutableInt( lTempInteger_17 );
         StringBuilder sb_szRightMBP;
         if ( szRightMBP == null )
            sb_szRightMBP = new StringBuilder( 32 );
         else
            sb_szRightMBP = new StringBuilder( szRightMBP );
                   GetVariableFromAttribute( sb_szRightMBP, mi_lTempInteger_17, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "MarginRight", "", 0 );
         lTempInteger_17 = mi_lTempInteger_17.intValue( );
         szRightMBP = sb_szRightMBP.toString( );}
         //:IF szRightMBP != ""
         if ( ZeidonStringCompare( szRightMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " margin-right=^" + szRightMBP + "in^"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " margin-right=^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szRightMBP, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
         } 

         //:END
         //:ELSE
      } 
      else
      { 
         //:szWriteBuffer = szWriteBuffer + " margin=^" + szMBP + "in^"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " margin=^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szMBP, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
      } 

      //:END

      //:szMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.Border
      {MutableInt mi_lTempInteger_18 = new MutableInt( lTempInteger_18 );
      StringBuilder sb_szMBP;
      if ( szMBP == null )
         sb_szMBP = new StringBuilder( 32 );
      else
         sb_szMBP = new StringBuilder( szMBP );
             GetVariableFromAttribute( sb_szMBP, mi_lTempInteger_18, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "Border", "", 0 );
      lTempInteger_18 = mi_lTempInteger_18.intValue( );
      szMBP = sb_szMBP.toString( );}
      //:IF szMBP = ""
      if ( ZeidonStringCompare( szMBP, 1, 0, "", 1, 0, 33 ) == 0 )
      { 
         //:szTopMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.BorderTop
         {MutableInt mi_lTempInteger_19 = new MutableInt( lTempInteger_19 );
         StringBuilder sb_szTopMBP;
         if ( szTopMBP == null )
            sb_szTopMBP = new StringBuilder( 32 );
         else
            sb_szTopMBP = new StringBuilder( szTopMBP );
                   GetVariableFromAttribute( sb_szTopMBP, mi_lTempInteger_19, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "BorderTop", "", 0 );
         lTempInteger_19 = mi_lTempInteger_19.intValue( );
         szTopMBP = sb_szTopMBP.toString( );}
         //:IF szTopMBP != ""
         if ( ZeidonStringCompare( szTopMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " border-top=^" + szTopMBP + "in^"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " border-top=^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTopMBP, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
         } 

         //:END
         //:szBottomMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.BorderBottom
         {MutableInt mi_lTempInteger_20 = new MutableInt( lTempInteger_20 );
         StringBuilder sb_szBottomMBP;
         if ( szBottomMBP == null )
            sb_szBottomMBP = new StringBuilder( 32 );
         else
            sb_szBottomMBP = new StringBuilder( szBottomMBP );
                   GetVariableFromAttribute( sb_szBottomMBP, mi_lTempInteger_20, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "BorderBottom", "", 0 );
         lTempInteger_20 = mi_lTempInteger_20.intValue( );
         szBottomMBP = sb_szBottomMBP.toString( );}
         //:IF szBottomMBP != ""
         if ( ZeidonStringCompare( szBottomMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " border-bottom=^" + szBottomMBP + "in^"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " border-bottom=^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szBottomMBP, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
         } 

         //:END
         //:szLeftMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.BorderLeft
         {MutableInt mi_lTempInteger_21 = new MutableInt( lTempInteger_21 );
         StringBuilder sb_szLeftMBP;
         if ( szLeftMBP == null )
            sb_szLeftMBP = new StringBuilder( 32 );
         else
            sb_szLeftMBP = new StringBuilder( szLeftMBP );
                   GetVariableFromAttribute( sb_szLeftMBP, mi_lTempInteger_21, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "BorderLeft", "", 0 );
         lTempInteger_21 = mi_lTempInteger_21.intValue( );
         szLeftMBP = sb_szLeftMBP.toString( );}
         //:IF szLeftMBP != ""
         if ( ZeidonStringCompare( szLeftMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " border-left=^" + szLeftMBP + "in^"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " border-left=^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeftMBP, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
         } 

         //:END
         //:szRightMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.BorderRight
         {MutableInt mi_lTempInteger_22 = new MutableInt( lTempInteger_22 );
         StringBuilder sb_szRightMBP;
         if ( szRightMBP == null )
            sb_szRightMBP = new StringBuilder( 32 );
         else
            sb_szRightMBP = new StringBuilder( szRightMBP );
                   GetVariableFromAttribute( sb_szRightMBP, mi_lTempInteger_22, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "BorderRight", "", 0 );
         lTempInteger_22 = mi_lTempInteger_22.intValue( );
         szRightMBP = sb_szRightMBP.toString( );}
         //:IF szRightMBP != ""
         if ( ZeidonStringCompare( szRightMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " border-right=^" + szRightMBP + "in^"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " border-right=^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szRightMBP, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
         } 

         //:END
         //:ELSE
      } 
      else
      { 
         //:szWriteBuffer = szWriteBuffer + " border=^" + szMBP + "in^"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " border=^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szMBP, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
      } 

      //:END

      //:szMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.Padding
      {MutableInt mi_lTempInteger_23 = new MutableInt( lTempInteger_23 );
      StringBuilder sb_szMBP;
      if ( szMBP == null )
         sb_szMBP = new StringBuilder( 32 );
      else
         sb_szMBP = new StringBuilder( szMBP );
             GetVariableFromAttribute( sb_szMBP, mi_lTempInteger_23, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "Padding", "", 0 );
      lTempInteger_23 = mi_lTempInteger_23.intValue( );
      szMBP = sb_szMBP.toString( );}
      //:IF szMBP = ""
      if ( ZeidonStringCompare( szMBP, 1, 0, "", 1, 0, 33 ) == 0 )
      { 
         //:szTopMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.PaddingTop
         {MutableInt mi_lTempInteger_24 = new MutableInt( lTempInteger_24 );
         StringBuilder sb_szTopMBP;
         if ( szTopMBP == null )
            sb_szTopMBP = new StringBuilder( 32 );
         else
            sb_szTopMBP = new StringBuilder( szTopMBP );
                   GetVariableFromAttribute( sb_szTopMBP, mi_lTempInteger_24, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "PaddingTop", "", 0 );
         lTempInteger_24 = mi_lTempInteger_24.intValue( );
         szTopMBP = sb_szTopMBP.toString( );}
         //:IF szTopMBP != ""
         if ( ZeidonStringCompare( szTopMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " padding-top=^" + szTopMBP + "in^"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " padding-top=^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTopMBP, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
         } 

         //:END
         //:szBottomMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.PaddingBottom
         {MutableInt mi_lTempInteger_25 = new MutableInt( lTempInteger_25 );
         StringBuilder sb_szBottomMBP;
         if ( szBottomMBP == null )
            sb_szBottomMBP = new StringBuilder( 32 );
         else
            sb_szBottomMBP = new StringBuilder( szBottomMBP );
                   GetVariableFromAttribute( sb_szBottomMBP, mi_lTempInteger_25, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "PaddingBottom", "", 0 );
         lTempInteger_25 = mi_lTempInteger_25.intValue( );
         szBottomMBP = sb_szBottomMBP.toString( );}
         //:IF szBottomMBP != ""
         if ( ZeidonStringCompare( szBottomMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " padding-bottom=^" + szBottomMBP + "in^"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " padding-bottom=^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szBottomMBP, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
         } 

         //:END
         //:szLeftMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.PaddingLeft
         {MutableInt mi_lTempInteger_26 = new MutableInt( lTempInteger_26 );
         StringBuilder sb_szLeftMBP;
         if ( szLeftMBP == null )
            sb_szLeftMBP = new StringBuilder( 32 );
         else
            sb_szLeftMBP = new StringBuilder( szLeftMBP );
                   GetVariableFromAttribute( sb_szLeftMBP, mi_lTempInteger_26, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "PaddingLeft", "", 0 );
         lTempInteger_26 = mi_lTempInteger_26.intValue( );
         szLeftMBP = sb_szLeftMBP.toString( );}
         //:IF szLeftMBP != ""
         if ( ZeidonStringCompare( szLeftMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " padding-left=^" + szLeftMBP + "in^"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " padding-left=^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeftMBP, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
         } 

         //:END
         //:szRightMBP = mSPLDefPDF.LLD_SpecialSectionAttrBlock.PaddingRight
         {MutableInt mi_lTempInteger_27 = new MutableInt( lTempInteger_27 );
         StringBuilder sb_szRightMBP;
         if ( szRightMBP == null )
            sb_szRightMBP = new StringBuilder( 32 );
         else
            sb_szRightMBP = new StringBuilder( szRightMBP );
                   GetVariableFromAttribute( sb_szRightMBP, mi_lTempInteger_27, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "PaddingRight", "", 0 );
         lTempInteger_27 = mi_lTempInteger_27.intValue( );
         szRightMBP = sb_szRightMBP.toString( );}
         //:IF szRightMBP != ""
         if ( ZeidonStringCompare( szRightMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " padding-right=^" + szRightMBP + "in^"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " padding-right=^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szRightMBP, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
         } 

         //:END
         //:ELSE
      } 
      else
      { 
         //:szWriteBuffer = szWriteBuffer + " padding=^" + szMBP + "in^"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " padding=^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szMBP, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
      } 

      //:END

      //:szTextAlign = mSPLDefPDF.LLD_SpecialSectionAttrBlock.TextAlign
      {MutableInt mi_lTempInteger_28 = new MutableInt( lTempInteger_28 );
      StringBuilder sb_szTextAlign;
      if ( szTextAlign == null )
         sb_szTextAlign = new StringBuilder( 32 );
      else
         sb_szTextAlign = new StringBuilder( szTextAlign );
             GetVariableFromAttribute( sb_szTextAlign, mi_lTempInteger_28, 'S', 33, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "TextAlign", "", 0 );
      lTempInteger_28 = mi_lTempInteger_28.intValue( );
      szTextAlign = sb_szTextAlign.toString( );}
      //:IF szTextAlign != ""
      if ( ZeidonStringCompare( szTextAlign, 1, 0, "", 1, 0, 33 ) != 0 )
      { 
         //:szWriteBuffer = szWriteBuffer + " text-align=^" + szTextAlign + "^"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " text-align=^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTextAlign, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
      } 

      //:END
   } 

   //:END

   //:// Add dotted border if requested, unless regular border is specified.
   //:IF szBorderStyle = "" AND mSPLDef.SubregPhysicalLabelDef.wFormatWithDottedBorders = "Y"
   if ( ZeidonStringCompare( szBorderStyle, 1, 0, "", 1, 0, 33 ) == 0 && CompareAttributeToString( mSPLDef, "SubregPhysicalLabelDef", "wFormatWithDottedBorders", "Y" ) == 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " border=^1.0pt dotted red^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " border=^1.0pt dotted red^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:// Add default font size of 8pt, if font wasn't specified above.
   //:IF szFontSize = ""
   if ( ZeidonStringCompare( szFontSize, 1, 0, "", 1, 0, 33 ) == 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " font-size=^" + szDefaultFontSize + "pt^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " font-size=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDefaultFontSize, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "pt^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:// Close the entry.
   //:szWriteBuffer = szWriteBuffer + ">"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, ">", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}

   //:// Write out the combined Block value.
   //:WL_QC( mSPLDefPDF, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDefPDF );
    m_ZGlobal1_Operation.WL_QC( mSPLDefPDF, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:FormatBlock( VIEW mSPLDef BASED ON LOD mSPLDef,
//:             INTEGER lFile,
//:             STRING ( 50 )    szLeadingBlanks,
//:             STRING ( 32000 ) szWriteBuffer )

//:   STRING ( 32 )  szTop
public int 
omSPLDef_FormatBlock( View     mSPLDef,
                      int      lFile,
                      String   szLeadingBlanks,
                      String   szWriteBuffer )
{
   String   szTop = null;
   //:STRING ( 32 )  szHeight
   String   szHeight = null;
   //:STRING ( 32 )  szWidth
   String   szWidth = null;
   //:STRING ( 32 )  szLeft
   String   szLeft = null;
   //:STRING ( 32 )  szBorderStyle
   String   szBorderStyle = null;
   //:STRING ( 32 )  szColor
   String   szColor = null;
   //:STRING ( 32 )  szFontFamily
   String   szFontFamily = null;
   //:STRING ( 32 )  szFontSize
   String   szFontSize = null;
   //:STRING ( 32 )  szFontWeight
   String   szFontWeight = null;
   //:STRING ( 32 )  szMarginTop
   String   szMarginTop = null;
   //:STRING ( 32 )  szMarginBottom
   String   szMarginBottom = null;
   //:STRING ( 32 )  szMarginLeft
   String   szMarginLeft = null;
   //:STRING ( 32 )  szMarginRight
   String   szMarginRight = null;
   //:STRING ( 32 )  szTextAlign
   String   szTextAlign = null;
   //:STRING ( 256 ) szImg
   String   szImg = null;
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

   //:// Process a Block and its subcomponents.
   //:// Block Container Start
   //:szWriteBuffer = szLeadingBlanks + "<fo:block"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}

   //:IF mSPLDef.BlockBackgroundColor EXISTS
   lTempInteger_0 = CheckExistenceOfEntity( mSPLDef, "BlockBackgroundColor" );
   if ( lTempInteger_0 == 0 )
   { 
      //:szColor = mSPLDef.BlockBackgroundColor.RGB
      {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
      StringBuilder sb_szColor;
      if ( szColor == null )
         sb_szColor = new StringBuilder( 32 );
      else
         sb_szColor = new StringBuilder( szColor );
             GetVariableFromAttribute( sb_szColor, mi_lTempInteger_1, 'S', 33, mSPLDef, "BlockBackgroundColor", "RGB", "", 0 );
      lTempInteger_1 = mi_lTempInteger_1.intValue( );
      szColor = sb_szColor.toString( );}
      //:IF szColor != ""
      if ( ZeidonStringCompare( szColor, 1, 0, "", 1, 0, 33 ) != 0 )
      { 
         //:szWriteBuffer = szWriteBuffer + " background-color=^#" + szColor + "^"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " background-color=^#", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szColor, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
      } 

      //:END
   } 

   //:END

   //:IF mSPLDef.BlockBorderColor EXISTS
   lTempInteger_2 = CheckExistenceOfEntity( mSPLDef, "BlockBorderColor" );
   if ( lTempInteger_2 == 0 )
   { 
      //:szColor = mSPLDef.BlockBorderColor.RGB
      {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
      StringBuilder sb_szColor;
      if ( szColor == null )
         sb_szColor = new StringBuilder( 32 );
      else
         sb_szColor = new StringBuilder( szColor );
             GetVariableFromAttribute( sb_szColor, mi_lTempInteger_3, 'S', 33, mSPLDef, "BlockBorderColor", "RGB", "", 0 );
      lTempInteger_3 = mi_lTempInteger_3.intValue( );
      szColor = sb_szColor.toString( );}
      //:IF szColor != ""
      if ( ZeidonStringCompare( szColor, 1, 0, "", 1, 0, 33 ) != 0 )
      { 
         //:szWriteBuffer = szWriteBuffer + " border-color=^#" + szColor + "^"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " border-color=^#", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szColor, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
      } 

      //:END
   } 

   //:END

   //:szBorderStyle = mSPLDef.LLD_Block.BorderStyle
   {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
   StringBuilder sb_szBorderStyle;
   if ( szBorderStyle == null )
      sb_szBorderStyle = new StringBuilder( 32 );
   else
      sb_szBorderStyle = new StringBuilder( szBorderStyle );
       GetVariableFromAttribute( sb_szBorderStyle, mi_lTempInteger_4, 'S', 33, mSPLDef, "LLD_Block", "BorderStyle", "", 0 );
   lTempInteger_4 = mi_lTempInteger_4.intValue( );
   szBorderStyle = sb_szBorderStyle.toString( );}
   //:IF szBorderStyle != ""
   if ( ZeidonStringCompare( szBorderStyle, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " border-style=^" + szBorderStyle + "^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " border-style=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szBorderStyle, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:szWidth = mSPLDef.LLD_Block.BorderWidth
   {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
   StringBuilder sb_szWidth;
   if ( szWidth == null )
      sb_szWidth = new StringBuilder( 32 );
   else
      sb_szWidth = new StringBuilder( szWidth );
       GetVariableFromAttribute( sb_szWidth, mi_lTempInteger_5, 'S', 33, mSPLDef, "LLD_Block", "BorderWidth", "", 0 );
   lTempInteger_5 = mi_lTempInteger_5.intValue( );
   szWidth = sb_szWidth.toString( );}
   //:IF szWidth != ""
   if ( ZeidonStringCompare( szWidth, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " border-width=^" + szWidth + "px^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " border-width=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szWidth, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "px^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:szTop = mSPLDef.LLD_Block.Top
   {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
   StringBuilder sb_szTop;
   if ( szTop == null )
      sb_szTop = new StringBuilder( 32 );
   else
      sb_szTop = new StringBuilder( szTop );
       GetVariableFromAttribute( sb_szTop, mi_lTempInteger_6, 'S', 33, mSPLDef, "LLD_Block", "Top", "", 0 );
   lTempInteger_6 = mi_lTempInteger_6.intValue( );
   szTop = sb_szTop.toString( );}
   //:IF szTop != ""
   if ( ZeidonStringCompare( szTop, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " top=^" + szTop + "in^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " top=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szTop, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:szHeight = mSPLDef.LLD_Block.Height
   {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
   StringBuilder sb_szHeight;
   if ( szHeight == null )
      sb_szHeight = new StringBuilder( 32 );
   else
      sb_szHeight = new StringBuilder( szHeight );
       GetVariableFromAttribute( sb_szHeight, mi_lTempInteger_7, 'S', 33, mSPLDef, "LLD_Block", "Height", "", 0 );
   lTempInteger_7 = mi_lTempInteger_7.intValue( );
   szHeight = sb_szHeight.toString( );}
   //:IF szHeight != ""
   if ( ZeidonStringCompare( szHeight, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " height=^" + szHeight + "in^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " height=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szHeight, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:szWidth = mSPLDef.LLD_Block.Width
   {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
   StringBuilder sb_szWidth;
   if ( szWidth == null )
      sb_szWidth = new StringBuilder( 32 );
   else
      sb_szWidth = new StringBuilder( szWidth );
       GetVariableFromAttribute( sb_szWidth, mi_lTempInteger_8, 'S', 33, mSPLDef, "LLD_Block", "Width", "", 0 );
   lTempInteger_8 = mi_lTempInteger_8.intValue( );
   szWidth = sb_szWidth.toString( );}
   //:IF szWidth != ""
   if ( ZeidonStringCompare( szWidth, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " width=^" + szWidth + "in^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " width=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szWidth, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END

   //:szLeft = mSPLDef.LLD_Block.Left
   {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
   StringBuilder sb_szLeft;
   if ( szLeft == null )
      sb_szLeft = new StringBuilder( 32 );
   else
      sb_szLeft = new StringBuilder( szLeft );
       GetVariableFromAttribute( sb_szLeft, mi_lTempInteger_9, 'S', 33, mSPLDef, "LLD_Block", "Left", "", 0 );
   lTempInteger_9 = mi_lTempInteger_9.intValue( );
   szLeft = sb_szLeft.toString( );}
   //:IF szLeft != ""
   if ( ZeidonStringCompare( szLeft, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
      //:szWriteBuffer = szWriteBuffer + " left=^" + szLeft + "in^"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, " left=^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szLeft, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
   } 

   //:END


   //:szFontFamily = mSPLDef.LLD_Block.FontFamily
   {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
   StringBuilder sb_szFontFamily;
   if ( szFontFamily == null )
      sb_szFontFamily = new StringBuilder( 32 );
   else
      sb_szFontFamily = new StringBuilder( szFontFamily );
       GetVariableFromAttribute( sb_szFontFamily, mi_lTempInteger_10, 'S', 33, mSPLDef, "LLD_Block", "FontFamily", "", 0 );
   lTempInteger_10 = mi_lTempInteger_10.intValue( );
   szFontFamily = sb_szFontFamily.toString( );}
   //:IF szFontFamily != ""
   if ( ZeidonStringCompare( szFontFamily, 1, 0, "", 1, 0, 33 ) != 0 )
   { 
   } 

   //:// TraceLineS( "2Font Family skipped: ", szFontFamily )
   //:// szWriteBuffer = szWriteBuffer + " font-family=^" + szFontFamily + "^"
   //:END
   //://
   //:// szFontSize = mSPLDef.LLD_Block.FontSize
   //:// IF szFontSize != ""
   //://    TraceLineS( "2Font Size set to: ", szFontSize )
   //://    szWriteBuffer = szWriteBuffer + " font-size=^" + szFontSize + "pt^"
   //:// END
   //:// szFontWeight = mSPLDef.LLD_Block.FontWeight
   //:// IF szFontWeight != ""
   //://    szWriteBuffer = szWriteBuffer + " font-weight=^" + szFontWeight + "^"
   //:// END
   //:// szMarginTop = mSPLDef.LLD_Block.MarginTop
   //:// IF szMarginTop != ""
   //://    szWriteBuffer = szWriteBuffer + " margin-top=^" + szMarginTop + "in^"
   //:// END
   //:// szMarginBottom = mSPLDef.LLD_Block.MarginBottom
   //:// IF szMarginBottom != ""
   //://    szWriteBuffer = szWriteBuffer + " margin-bottom=^" + szMarginBottom + "in^"
   //:// END
   //:// szMarginLeft = mSPLDef.LLD_Block.MarginLeft
   //:// IF szMarginLeft != ""
   //://    szWriteBuffer = szWriteBuffer + " margin-left=^" + szMarginLeft + "in^"
   //:// END
   //:// szMarginRight = mSPLDef.LLD_Block.MarginRight
   //:// IF szMarginRight != ""
   //://    szWriteBuffer = szWriteBuffer + " margin-right=^" + szMarginRight + "in^"
   //:// END
   //:// szTextAlign = mSPLDef.LLD_Block.TextAlign
   //:// IF szTextAlign != ""
   //://    szWriteBuffer = szWriteBuffer + " text-align=^" + szTextAlign + "^"
   //:// END
   //://

   //:// Close the entry.
   //:szWriteBuffer = szWriteBuffer + ">"
    {StringBuilder sb_szWriteBuffer;
   if ( szWriteBuffer == null )
      sb_szWriteBuffer = new StringBuilder( 32 );
   else
      sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
      ZeidonStringConcat( sb_szWriteBuffer, 1, 0, ">", 1, 0, 32001 );
   szWriteBuffer = sb_szWriteBuffer.toString( );}

   //:// Write out the combined Block value.
   //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
   try
   {
       {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   };
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:AddFormatToSpecialText( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                        STRING ( 50 )    szSectionType,
//:                        STRING ( 32 )    SpecialTextTitle,
//:                        STRING ( 32000 ) szWriteBuffer )

//:   STRING ( 32 )  szTop
public int 
omSPLDef_AddFormatToSpecialText( View     mSPLDef,
                                 String   szSectionType,
                                 String   SpecialTextTitle,
                                 StringBuilder   szWriteBuffer )
{
   String   szTop = null;
   //:STRING ( 32 )  szHeight
   String   szHeight = null;
   //:STRING ( 32 )  szWidth
   String   szWidth = null;
   //:STRING ( 32 )  szLeft
   String   szLeft = null;
   //:STRING ( 32 )  szBorderStyle
   String   szBorderStyle = null;
   //:STRING ( 32 )  szColor
   String   szColor = null;
   //:STRING ( 32 )  szFontFamily
   String   szFontFamily = null;
   //:STRING ( 32 )  szFontSize
   String   szFontSize = null;
   //:STRING ( 32 )  szFontWeight
   String   szFontWeight = null;
   //:STRING ( 32 )  szMBP
   String   szMBP = null;
   //:STRING ( 32 )  szTopMBP
   String   szTopMBP = null;
   //:STRING ( 32 )  szBottomMBP
   String   szBottomMBP = null;
   //:STRING ( 32 )  szLeftMBP
   String   szLeftMBP = null;
   //:STRING ( 32 )  szRightMBP
   String   szRightMBP = null;
   //:STRING ( 32 )  szTextAlign
   String   szTextAlign = null;
   //:STRING ( 32 )  szLineHeight
   String   szLineHeight = null;
   //:STRING ( 32 )  szLetterSpace
   String   szLetterSpace = null;
   //:STRING ( 200 ) szMsg
   String   szMsg = null;
   //:STRING ( 256 ) szImg
   String   szImg = null;
   //:SHORT nRC
   int      nRC = 0;
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
   int      lTempInteger_13 = 0;
   int      lTempInteger_14 = 0;
   int      lTempInteger_15 = 0;
   int      lTempInteger_16 = 0;
   int      lTempInteger_17 = 0;
   int      lTempInteger_18 = 0;
   int      lTempInteger_19 = 0;
   int      lTempInteger_20 = 0;
   int      lTempInteger_21 = 0;
   int      lTempInteger_22 = 0;
   int      lTempInteger_23 = 0;
   int      lTempInteger_24 = 0;


   //:// Add any Special Attribute Block formatting variables to the text statement passed in szWriteBuffer.
   //:// Skip if the Special Text Attribute hasn't been defined.

   //:NAME VIEW mSPLDef "mSPLDefHazards"
   SetNameForView( mSPLDef, "mSPLDefHazards", null, zLEVEL_TASK );
   //:// TraceLineS( "$$$$ Special Text for: ", SpecialTextTitle )
   //:SET CURSOR FIRST mSPLDef.LLD_SpecialSectionAttribute WHERE mSPLDef.LLD_SpecialSectionAttribute.Name = szSectionType
   RESULT = SetCursorFirstEntityByString( mSPLDef, "LLD_SpecialSectionAttribute", "Name", szSectionType, "" );
   //:IF RESULT >= zCURSOR_SET
   if ( RESULT >= zCURSOR_SET )
   { 
      //:SET CURSOR FIRST mSPLDef.LLD_SpecialSectionAttrBlock WHERE mSPLDef.LLD_SpecialSectionAttrBlock.Name = SpecialTextTitle
      RESULT = SetCursorFirstEntityByString( mSPLDef, "LLD_SpecialSectionAttrBlock", "Name", SpecialTextTitle, "" );
      //:IF RESULT >= zCURSOR_SET
      if ( RESULT >= zCURSOR_SET )
      { 

         //:IF mSPLDef.SpecialAttributeTextColor EXISTS
         lTempInteger_0 = CheckExistenceOfEntity( mSPLDef, "SpecialAttributeTextColor" );
         if ( lTempInteger_0 == 0 )
         { 
            //:szColor = mSPLDef.SpecialAttributeTextColor.RGB
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szColor;
            if ( szColor == null )
               sb_szColor = new StringBuilder( 32 );
            else
               sb_szColor = new StringBuilder( szColor );
                         GetVariableFromAttribute( sb_szColor, mi_lTempInteger_1, 'S', 33, mSPLDef, "SpecialAttributeTextColor", "RGB", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szColor = sb_szColor.toString( );}
            //:IF szColor != ""
            if ( ZeidonStringCompare( szColor, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " color=^#" + szColor + "^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " color=^#", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szColor, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
            } 

            //:END
         } 

         //:END

         //:szFontFamily = mSPLDef.LLD_SpecialSectionAttrBlock.FontFamily
         {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
         StringBuilder sb_szFontFamily;
         if ( szFontFamily == null )
            sb_szFontFamily = new StringBuilder( 32 );
         else
            sb_szFontFamily = new StringBuilder( szFontFamily );
                   GetVariableFromAttribute( sb_szFontFamily, mi_lTempInteger_2, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "FontFamily", "", 0 );
         lTempInteger_2 = mi_lTempInteger_2.intValue( );
         szFontFamily = sb_szFontFamily.toString( );}
         //:// TraceLineS( "3Font Family set to: ", szFontFamily )
         //:IF szFontFamily != ""
         if ( ZeidonStringCompare( szFontFamily, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " font-family=^" + szFontFamily + "^"
            ZeidonStringConcat( szWriteBuffer, 1, 0, " font-family=^", 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, szFontFamily, 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
         } 

         //:END

         //:szFontSize = mSPLDef.LLD_SpecialSectionAttrBlock.FontSize
         {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
         StringBuilder sb_szFontSize;
         if ( szFontSize == null )
            sb_szFontSize = new StringBuilder( 32 );
         else
            sb_szFontSize = new StringBuilder( szFontSize );
                   GetVariableFromAttribute( sb_szFontSize, mi_lTempInteger_3, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "FontSize", "", 0 );
         lTempInteger_3 = mi_lTempInteger_3.intValue( );
         szFontSize = sb_szFontSize.toString( );}
         //:IF szFontSize != ""
         if ( ZeidonStringCompare( szFontSize, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:// TraceLineS( "3Font Size set to: ", szFontSize )
            //:szWriteBuffer = szWriteBuffer + " font-size=^" + szFontSize + "pt^"
            ZeidonStringConcat( szWriteBuffer, 1, 0, " font-size=^", 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, szFontSize, 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, "pt^", 1, 0, 32001 );
         } 

         //:END

         //:szFontWeight = mSPLDef.LLD_SpecialSectionAttrBlock.FontWeight
         {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
         StringBuilder sb_szFontWeight;
         if ( szFontWeight == null )
            sb_szFontWeight = new StringBuilder( 32 );
         else
            sb_szFontWeight = new StringBuilder( szFontWeight );
                   GetVariableFromAttribute( sb_szFontWeight, mi_lTempInteger_4, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "FontWeight", "", 0 );
         lTempInteger_4 = mi_lTempInteger_4.intValue( );
         szFontWeight = sb_szFontWeight.toString( );}
         //:IF szFontWeight != ""
         if ( ZeidonStringCompare( szFontWeight, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " font-weight=^" + szFontWeight + "^"
            ZeidonStringConcat( szWriteBuffer, 1, 0, " font-weight=^", 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, szFontWeight, 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
         } 

         //:END

         //:szLineHeight = mSPLDef.LLD_SpecialSectionAttrBlock.TextLineHeight
         {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
         StringBuilder sb_szLineHeight;
         if ( szLineHeight == null )
            sb_szLineHeight = new StringBuilder( 32 );
         else
            sb_szLineHeight = new StringBuilder( szLineHeight );
                   GetVariableFromAttribute( sb_szLineHeight, mi_lTempInteger_5, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "TextLineHeight", "", 0 );
         lTempInteger_5 = mi_lTempInteger_5.intValue( );
         szLineHeight = sb_szLineHeight.toString( );}
         //:IF szLineHeight != ""
         if ( ZeidonStringCompare( szLineHeight, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " line-height=^" + szLineHeight + "^"
            ZeidonStringConcat( szWriteBuffer, 1, 0, " line-height=^", 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, szLineHeight, 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
         } 

         //:END

         //:szLetterSpace = mSPLDef.LLD_SpecialSectionAttrBlock.TextLetterSpace
         {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
         StringBuilder sb_szLetterSpace;
         if ( szLetterSpace == null )
            sb_szLetterSpace = new StringBuilder( 32 );
         else
            sb_szLetterSpace = new StringBuilder( szLetterSpace );
                   GetVariableFromAttribute( sb_szLetterSpace, mi_lTempInteger_6, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "TextLetterSpace", "", 0 );
         lTempInteger_6 = mi_lTempInteger_6.intValue( );
         szLetterSpace = sb_szLetterSpace.toString( );}
         //:IF szLetterSpace != ""
         if ( ZeidonStringCompare( szLetterSpace, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " letter-spacing=^" + szLetterSpace + "px^"
            ZeidonStringConcat( szWriteBuffer, 1, 0, " letter-spacing=^", 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, szLetterSpace, 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, "px^", 1, 0, 32001 );
         } 

         //:END

         //:szMBP = mSPLDef.LLD_SpecialSectionAttrBlock.Margin
         {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
         StringBuilder sb_szMBP;
         if ( szMBP == null )
            sb_szMBP = new StringBuilder( 32 );
         else
            sb_szMBP = new StringBuilder( szMBP );
                   GetVariableFromAttribute( sb_szMBP, mi_lTempInteger_7, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "Margin", "", 0 );
         lTempInteger_7 = mi_lTempInteger_7.intValue( );
         szMBP = sb_szMBP.toString( );}
         //:IF szMBP = ""
         if ( ZeidonStringCompare( szMBP, 1, 0, "", 1, 0, 33 ) == 0 )
         { 
            //:szTopMBP = mSPLDef.LLD_SpecialSectionAttrBlock.MarginTop
            {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
            StringBuilder sb_szTopMBP;
            if ( szTopMBP == null )
               sb_szTopMBP = new StringBuilder( 32 );
            else
               sb_szTopMBP = new StringBuilder( szTopMBP );
                         GetVariableFromAttribute( sb_szTopMBP, mi_lTempInteger_8, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "MarginTop", "", 0 );
            lTempInteger_8 = mi_lTempInteger_8.intValue( );
            szTopMBP = sb_szTopMBP.toString( );}
            //:IF szTopMBP != ""
            if ( ZeidonStringCompare( szTopMBP, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " margin-top=^" + szTopMBP + "in^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " margin-top=^", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szTopMBP, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            } 

            //:END
            //:szBottomMBP = mSPLDef.LLD_SpecialSectionAttrBlock.MarginBottom
            {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
            StringBuilder sb_szBottomMBP;
            if ( szBottomMBP == null )
               sb_szBottomMBP = new StringBuilder( 32 );
            else
               sb_szBottomMBP = new StringBuilder( szBottomMBP );
                         GetVariableFromAttribute( sb_szBottomMBP, mi_lTempInteger_9, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "MarginBottom", "", 0 );
            lTempInteger_9 = mi_lTempInteger_9.intValue( );
            szBottomMBP = sb_szBottomMBP.toString( );}
            //:IF szBottomMBP != ""
            if ( ZeidonStringCompare( szBottomMBP, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " margin-bottom=^" + szBottomMBP + "in^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " margin-bottom=^", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szBottomMBP, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            } 

            //:END
            //:szLeftMBP = mSPLDef.LLD_SpecialSectionAttrBlock.MarginLeft
            {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
            StringBuilder sb_szLeftMBP;
            if ( szLeftMBP == null )
               sb_szLeftMBP = new StringBuilder( 32 );
            else
               sb_szLeftMBP = new StringBuilder( szLeftMBP );
                         GetVariableFromAttribute( sb_szLeftMBP, mi_lTempInteger_10, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "MarginLeft", "", 0 );
            lTempInteger_10 = mi_lTempInteger_10.intValue( );
            szLeftMBP = sb_szLeftMBP.toString( );}
            //:IF szLeftMBP != ""
            if ( ZeidonStringCompare( szLeftMBP, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " margin-left=^" + szLeftMBP + "in^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " margin-left=^", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szLeftMBP, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            } 

            //:END
            //:szRightMBP = mSPLDef.LLD_SpecialSectionAttrBlock.MarginRight
            {MutableInt mi_lTempInteger_11 = new MutableInt( lTempInteger_11 );
            StringBuilder sb_szRightMBP;
            if ( szRightMBP == null )
               sb_szRightMBP = new StringBuilder( 32 );
            else
               sb_szRightMBP = new StringBuilder( szRightMBP );
                         GetVariableFromAttribute( sb_szRightMBP, mi_lTempInteger_11, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "MarginRight", "", 0 );
            lTempInteger_11 = mi_lTempInteger_11.intValue( );
            szRightMBP = sb_szRightMBP.toString( );}
            //:IF szRightMBP != ""
            if ( ZeidonStringCompare( szRightMBP, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " margin-right=^" + szRightMBP + "in^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " margin-right=^", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szRightMBP, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szWriteBuffer = szWriteBuffer + " margin=^" + szMBP + "in^"
            ZeidonStringConcat( szWriteBuffer, 1, 0, " margin=^", 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, szMBP, 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
         } 

         //:END

         //:szMBP = mSPLDef.LLD_SpecialSectionAttrBlock.Border
         {MutableInt mi_lTempInteger_12 = new MutableInt( lTempInteger_12 );
         StringBuilder sb_szMBP;
         if ( szMBP == null )
            sb_szMBP = new StringBuilder( 32 );
         else
            sb_szMBP = new StringBuilder( szMBP );
                   GetVariableFromAttribute( sb_szMBP, mi_lTempInteger_12, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "Border", "", 0 );
         lTempInteger_12 = mi_lTempInteger_12.intValue( );
         szMBP = sb_szMBP.toString( );}
         //:IF szMBP = ""
         if ( ZeidonStringCompare( szMBP, 1, 0, "", 1, 0, 33 ) == 0 )
         { 
            //:szTopMBP = mSPLDef.LLD_SpecialSectionAttrBlock.BorderTop
            {MutableInt mi_lTempInteger_13 = new MutableInt( lTempInteger_13 );
            StringBuilder sb_szTopMBP;
            if ( szTopMBP == null )
               sb_szTopMBP = new StringBuilder( 32 );
            else
               sb_szTopMBP = new StringBuilder( szTopMBP );
                         GetVariableFromAttribute( sb_szTopMBP, mi_lTempInteger_13, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "BorderTop", "", 0 );
            lTempInteger_13 = mi_lTempInteger_13.intValue( );
            szTopMBP = sb_szTopMBP.toString( );}
            //:IF szTopMBP != ""
            if ( ZeidonStringCompare( szTopMBP, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " border-top=^" + szTopMBP + "in^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " border-top=^", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szTopMBP, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            } 

            //:END
            //:szBottomMBP = mSPLDef.LLD_SpecialSectionAttrBlock.BorderBottom
            {MutableInt mi_lTempInteger_14 = new MutableInt( lTempInteger_14 );
            StringBuilder sb_szBottomMBP;
            if ( szBottomMBP == null )
               sb_szBottomMBP = new StringBuilder( 32 );
            else
               sb_szBottomMBP = new StringBuilder( szBottomMBP );
                         GetVariableFromAttribute( sb_szBottomMBP, mi_lTempInteger_14, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "BorderBottom", "", 0 );
            lTempInteger_14 = mi_lTempInteger_14.intValue( );
            szBottomMBP = sb_szBottomMBP.toString( );}
            //:IF szBottomMBP != ""
            if ( ZeidonStringCompare( szBottomMBP, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " border-bottom=^" + szBottomMBP + "in^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " border-bottom=^", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szBottomMBP, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            } 

            //:END
            //:szLeftMBP = mSPLDef.LLD_SpecialSectionAttrBlock.BorderLeft
            {MutableInt mi_lTempInteger_15 = new MutableInt( lTempInteger_15 );
            StringBuilder sb_szLeftMBP;
            if ( szLeftMBP == null )
               sb_szLeftMBP = new StringBuilder( 32 );
            else
               sb_szLeftMBP = new StringBuilder( szLeftMBP );
                         GetVariableFromAttribute( sb_szLeftMBP, mi_lTempInteger_15, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "BorderLeft", "", 0 );
            lTempInteger_15 = mi_lTempInteger_15.intValue( );
            szLeftMBP = sb_szLeftMBP.toString( );}
            //:IF szLeftMBP != ""
            if ( ZeidonStringCompare( szLeftMBP, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " border-left=^" + szLeftMBP + "in^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " border-left=^", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szLeftMBP, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            } 

            //:END
            //:szRightMBP = mSPLDef.LLD_SpecialSectionAttrBlock.BorderRight
            {MutableInt mi_lTempInteger_16 = new MutableInt( lTempInteger_16 );
            StringBuilder sb_szRightMBP;
            if ( szRightMBP == null )
               sb_szRightMBP = new StringBuilder( 32 );
            else
               sb_szRightMBP = new StringBuilder( szRightMBP );
                         GetVariableFromAttribute( sb_szRightMBP, mi_lTempInteger_16, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "BorderRight", "", 0 );
            lTempInteger_16 = mi_lTempInteger_16.intValue( );
            szRightMBP = sb_szRightMBP.toString( );}
            //:IF szRightMBP != ""
            if ( ZeidonStringCompare( szRightMBP, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " border-right=^" + szRightMBP + "in^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " border-right=^", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szRightMBP, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szWriteBuffer = szWriteBuffer + " border=^" + szMBP + "in^"
            ZeidonStringConcat( szWriteBuffer, 1, 0, " border=^", 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, szMBP, 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
         } 

         //:END

         //:szMBP = mSPLDef.LLD_SpecialSectionAttrBlock.Padding
         {MutableInt mi_lTempInteger_17 = new MutableInt( lTempInteger_17 );
         StringBuilder sb_szMBP;
         if ( szMBP == null )
            sb_szMBP = new StringBuilder( 32 );
         else
            sb_szMBP = new StringBuilder( szMBP );
                   GetVariableFromAttribute( sb_szMBP, mi_lTempInteger_17, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "Padding", "", 0 );
         lTempInteger_17 = mi_lTempInteger_17.intValue( );
         szMBP = sb_szMBP.toString( );}
         //:IF szMBP = ""
         if ( ZeidonStringCompare( szMBP, 1, 0, "", 1, 0, 33 ) == 0 )
         { 
            //:szTopMBP = mSPLDef.LLD_SpecialSectionAttrBlock.PaddingTop
            {MutableInt mi_lTempInteger_18 = new MutableInt( lTempInteger_18 );
            StringBuilder sb_szTopMBP;
            if ( szTopMBP == null )
               sb_szTopMBP = new StringBuilder( 32 );
            else
               sb_szTopMBP = new StringBuilder( szTopMBP );
                         GetVariableFromAttribute( sb_szTopMBP, mi_lTempInteger_18, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "PaddingTop", "", 0 );
            lTempInteger_18 = mi_lTempInteger_18.intValue( );
            szTopMBP = sb_szTopMBP.toString( );}
            //:IF szTopMBP != ""
            if ( ZeidonStringCompare( szTopMBP, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " padding-top=^" + szTopMBP + "in^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " padding-top=^", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szTopMBP, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            } 

            //:END
            //:szBottomMBP = mSPLDef.LLD_SpecialSectionAttrBlock.PaddingBottom
            {MutableInt mi_lTempInteger_19 = new MutableInt( lTempInteger_19 );
            StringBuilder sb_szBottomMBP;
            if ( szBottomMBP == null )
               sb_szBottomMBP = new StringBuilder( 32 );
            else
               sb_szBottomMBP = new StringBuilder( szBottomMBP );
                         GetVariableFromAttribute( sb_szBottomMBP, mi_lTempInteger_19, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "PaddingBottom", "", 0 );
            lTempInteger_19 = mi_lTempInteger_19.intValue( );
            szBottomMBP = sb_szBottomMBP.toString( );}
            //:IF szBottomMBP != ""
            if ( ZeidonStringCompare( szBottomMBP, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " padding-bottom=^" + szBottomMBP + "in^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " padding-bottom=^", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szBottomMBP, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            } 

            //:END
            //:szLeftMBP = mSPLDef.LLD_SpecialSectionAttrBlock.PaddingLeft
            {MutableInt mi_lTempInteger_20 = new MutableInt( lTempInteger_20 );
            StringBuilder sb_szLeftMBP;
            if ( szLeftMBP == null )
               sb_szLeftMBP = new StringBuilder( 32 );
            else
               sb_szLeftMBP = new StringBuilder( szLeftMBP );
                         GetVariableFromAttribute( sb_szLeftMBP, mi_lTempInteger_20, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "PaddingLeft", "", 0 );
            lTempInteger_20 = mi_lTempInteger_20.intValue( );
            szLeftMBP = sb_szLeftMBP.toString( );}
            //:IF szLeftMBP != ""
            if ( ZeidonStringCompare( szLeftMBP, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " padding-left=^" + szLeftMBP + "in^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " padding-left=^", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szLeftMBP, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            } 

            //:END
            //:szRightMBP = mSPLDef.LLD_SpecialSectionAttrBlock.PaddingRight
            {MutableInt mi_lTempInteger_21 = new MutableInt( lTempInteger_21 );
            StringBuilder sb_szRightMBP;
            if ( szRightMBP == null )
               sb_szRightMBP = new StringBuilder( 32 );
            else
               sb_szRightMBP = new StringBuilder( szRightMBP );
                         GetVariableFromAttribute( sb_szRightMBP, mi_lTempInteger_21, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "PaddingRight", "", 0 );
            lTempInteger_21 = mi_lTempInteger_21.intValue( );
            szRightMBP = sb_szRightMBP.toString( );}
            //:IF szRightMBP != ""
            if ( ZeidonStringCompare( szRightMBP, 1, 0, "", 1, 0, 33 ) != 0 )
            { 
               //:szWriteBuffer = szWriteBuffer + " padding-right=^" + szRightMBP + "in^"
               ZeidonStringConcat( szWriteBuffer, 1, 0, " padding-right=^", 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, szRightMBP, 1, 0, 32001 );
               ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
            } 

            //:END
            //:ELSE
         } 
         else
         { 
            //:szWriteBuffer = szWriteBuffer + " padding=^" + szMBP + "in^"
            ZeidonStringConcat( szWriteBuffer, 1, 0, " padding=^", 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, szMBP, 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
         } 

         //:END

         //:IF szRightMBP != ""
         if ( ZeidonStringCompare( szRightMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " padding-right=^" + szRightMBP + "in^"
            ZeidonStringConcat( szWriteBuffer, 1, 0, " padding-right=^", 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, szRightMBP, 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
         } 

         //:END

         //:szTextAlign = mSPLDef.LLD_SpecialSectionAttrBlock.TextAlign
         {MutableInt mi_lTempInteger_22 = new MutableInt( lTempInteger_22 );
         StringBuilder sb_szTextAlign;
         if ( szTextAlign == null )
            sb_szTextAlign = new StringBuilder( 32 );
         else
            sb_szTextAlign = new StringBuilder( szTextAlign );
                   GetVariableFromAttribute( sb_szTextAlign, mi_lTempInteger_22, 'S', 33, mSPLDef, "LLD_SpecialSectionAttrBlock", "TextAlign", "", 0 );
         lTempInteger_22 = mi_lTempInteger_22.intValue( );
         szTextAlign = sb_szTextAlign.toString( );}
         //:IF szTextAlign != ""
         if ( ZeidonStringCompare( szTextAlign, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " text-align=^" + szTextAlign + "^"
            ZeidonStringConcat( szWriteBuffer, 1, 0, " text-align=^", 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, szTextAlign, 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, "^", 1, 0, 32001 );
         } 

         //:END
         //:ELSE
      } 
      else
      { 
         //:// If the block has a Bottom Margin, use it for each block below.
         //:szBottomMBP = mSPLDef.LLD_Block.MarginBottom
         {MutableInt mi_lTempInteger_23 = new MutableInt( lTempInteger_23 );
         StringBuilder sb_szBottomMBP;
         if ( szBottomMBP == null )
            sb_szBottomMBP = new StringBuilder( 32 );
         else
            sb_szBottomMBP = new StringBuilder( szBottomMBP );
                   GetVariableFromAttribute( sb_szBottomMBP, mi_lTempInteger_23, 'S', 33, mSPLDef, "LLD_Block", "MarginBottom", "", 0 );
         lTempInteger_23 = mi_lTempInteger_23.intValue( );
         szBottomMBP = sb_szBottomMBP.toString( );}
         //:IF szBottomMBP != ""
         if ( ZeidonStringCompare( szBottomMBP, 1, 0, "", 1, 0, 33 ) != 0 )
         { 
            //:szWriteBuffer = szWriteBuffer + " margin-bottom=^" + szBottomMBP + "in^"
            ZeidonStringConcat( szWriteBuffer, 1, 0, " margin-bottom=^", 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, szBottomMBP, 1, 0, 32001 );
            ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
         } 

         //:END
      } 

      //:END
      //:ELSE
   } 
   else
   { 
      //:// If the block has a Bottom Margin, use it for each block below.
      //:szBottomMBP = mSPLDef.LLD_Block.MarginBottom
      {MutableInt mi_lTempInteger_24 = new MutableInt( lTempInteger_24 );
      StringBuilder sb_szBottomMBP;
      if ( szBottomMBP == null )
         sb_szBottomMBP = new StringBuilder( 32 );
      else
         sb_szBottomMBP = new StringBuilder( szBottomMBP );
             GetVariableFromAttribute( sb_szBottomMBP, mi_lTempInteger_24, 'S', 33, mSPLDef, "LLD_Block", "MarginBottom", "", 0 );
      lTempInteger_24 = mi_lTempInteger_24.intValue( );
      szBottomMBP = sb_szBottomMBP.toString( );}
      //:IF szBottomMBP != ""
      if ( ZeidonStringCompare( szBottomMBP, 1, 0, "", 1, 0, 33 ) != 0 )
      { 
         //:szWriteBuffer = szWriteBuffer + " margin-bottom=^" + szBottomMBP + "in^"
         ZeidonStringConcat( szWriteBuffer, 1, 0, " margin-bottom=^", 1, 0, 32001 );
         ZeidonStringConcat( szWriteBuffer, 1, 0, szBottomMBP, 1, 0, 32001 );
         ZeidonStringConcat( szWriteBuffer, 1, 0, "in^", 1, 0, 32001 );
      } 

      //:END
   } 

   //:END

   //:// Close the Block.
   //:szWriteBuffer = szWriteBuffer + ">"
   ZeidonStringConcat( szWriteBuffer, 1, 0, ">", 1, 0, 32001 );
   return( 0 );
// END
} 


//:LOCAL OPERATION
//:GeneratePDF_DFU_Section( VIEW mSPLDef    BASED ON LOD mSPLDef,
//:                         VIEW mSPLDefPDF BASED ON LOD mSPLDef,
//:                         INTEGER lFile,
//:                         STRING ( 50 ) szSectionType,
//:                         STRING ( 32 ) szSPLD_SectionName,
//:                         STRING ( 32 ) szStatementName,
//:                         STRING ( 32 ) szUsageTypeEntity,
//:                         STRING ( 32 ) szLoopingEntity,
//:                         STRING ( 50 ) szPassedBlanks,
//:                         STRING ( 32000 ) szWriteBuffer )

//:   VIEW mSPLDefPanelLevel BASED ON LOD mSPLDef
private int 
omSPLDef_GeneratePDF_DFU_Section( View     mSPLDef,
                                  View     mSPLDefPDF,
                                  int      lFile,
                                  String   szSectionType,
                                  String   szSPLD_SectionName,
                                  String   szStatementName,
                                  String   szUsageTypeEntity,
                                  String   szLoopingEntity,
                                  String   szPassedBlanks,
                                  String   szWriteBuffer )
{
   zVIEW    mSPLDefPanelLevel = new zVIEW( );
   //:VIEW mSPLDefContinue   BASED ON LOD mSPLDef
   zVIEW    mSPLDefContinue = new zVIEW( );
   //:STRING ( 32000 )  szStatementText
   String   szStatementText = null;
   //:STRING ( 32000 )  szTemporaryText
   String   szTemporaryText = null;
   //:STRING ( 256 )    szStatementTitle
   String   szStatementTitle = null;
   //:STRING ( 256 )    szTemporaryTitle
   String   szTemporaryTitle = null;
   //:STRING ( 50 )     szSectionTitle
   String   szSectionTitle = null;
   //:STRING ( 50 )     szSectionName
   String   szSectionName = null;
   //:// STRING ( 50 )     szSectionType
   //:STRING ( 32 )     szSeparatorCharacters
   String   szSeparatorCharacters = null;
   //:STRING ( 32 )     szNumberedText
   String   szNumberedText = null;
   //:STRING ( 32 )     szLineHeight
   String   szLineHeight = null;
   //:STRING ( 32 )     szStatementLeading
   String   szStatementLeading = null;
   //:STRING ( 2 )      szSectionTitlePosition
   String   szSectionTitlePosition = null;
   //:STRING ( 2 )      szStatementTitlePosition
   String   szStatementTitlePosition = null;
   //:STRING ( 2 )      szStatementFormat
   String   szStatementFormat = null;
   //:STRING ( 1 )      szFoundFirstNumberedEntryFlag
   String   szFoundFirstNumberedEntryFlag = null;
   //:STRING ( 50 )     szLeadingBlanks
   String   szLeadingBlanks = null;
   //:STRING ( 3 )      szDisplaySectionSuffix
   String   szDisplaySectionSuffix = null;
   //:STRING ( 50 )     szDisplaySectionName
   String   szDisplaySectionName = null;
   //:STRING ( 50 )     szDisplayStatementName
   String   szDisplayStatementName = null;
   //:STRING ( 1 )      szContinuationFlag
   String   szContinuationFlag = null;
   //:STRING ( 1 )      szBlockContinuationType
   String   szBlockContinuationType = null;
   //:STRING ( 1 )      szConvertToCapsFlag
   String   szConvertToCapsFlag = null;
   //:INTEGER           lCnt
   int      lCnt = 0;
   //:SHORT             nRC
   int      nRC = 0;

   //:STRING ( 512 ) szDebugMsg
   String   szDebugMsg = null;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      RESULT = 0;
   int      lTempInteger_4 = 0;
   int      lTempInteger_5 = 0;
   int      lTempInteger_6 = 0;
   int      lTempInteger_7 = 0;
   int      lTempInteger_8 = 0;
   int      lTempInteger_9 = 0;
   int      lTempInteger_10 = 0;
   String   szTempString_0 = null;
   int      lTempInteger_11 = 0;
   String   szTempString_1 = null;
   int      lTempInteger_12 = 0;
   String   szTempString_2 = null;
   int      lTempInteger_13 = 0;
   String   szTempString_3 = null;
   int      lTempInteger_14 = 0;
   String   szTempString_4 = null;
   int      lTempInteger_15 = 0;
   int      lTempInteger_16 = 0;
   String   szTempString_5 = null;
   int      lTempInteger_17 = 0;
   String   szTempString_6 = null;
   int      lTempInteger_18 = 0;
   String   szTempString_7 = null;
   int      lTempInteger_19 = 0;
   String   szTempString_8 = null;
   int      lTempInteger_20 = 0;
   String   szTempString_9 = null;
   int      lTempInteger_21 = 0;


   //:// Generate PDF for a "Directions of Use" or "Storage and Disposal" or "General" or "Marketing" Statement.

   //:szLeadingBlanks = szPassedBlanks + "   "
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringCopy( sb_szLeadingBlanks, 1, 0, szPassedBlanks, 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}
    {StringBuilder sb_szLeadingBlanks;
   if ( szLeadingBlanks == null )
      sb_szLeadingBlanks = new StringBuilder( 32 );
   else
      sb_szLeadingBlanks = new StringBuilder( szLeadingBlanks );
      ZeidonStringConcat( sb_szLeadingBlanks, 1, 0, "   ", 1, 0, 51 );
   szLeadingBlanks = sb_szLeadingBlanks.toString( );}

   //:// We need to decide where the Statement Format type is being specified. It was stored in the TemplateSection.StatementFormat
   //:// attribute, but the TemplateSection entity is being eliminated. Maybe it should just go with the Block.
   //:// The same is true for szSeparatorCharacters = mSPLDef.SPLD_TemplateSection.UsageSeparatorCharacters
   //:szStatementFormat     = "SP"
    {StringBuilder sb_szStatementFormat;
   if ( szStatementFormat == null )
      sb_szStatementFormat = new StringBuilder( 32 );
   else
      sb_szStatementFormat = new StringBuilder( szStatementFormat );
      ZeidonStringCopy( sb_szStatementFormat, 1, 0, "SP", 1, 0, 3 );
   szStatementFormat = sb_szStatementFormat.toString( );}
   //:szSeparatorCharacters = ", "
    {StringBuilder sb_szSeparatorCharacters;
   if ( szSeparatorCharacters == null )
      sb_szSeparatorCharacters = new StringBuilder( 32 );
   else
      sb_szSeparatorCharacters = new StringBuilder( szSeparatorCharacters );
      ZeidonStringCopy( sb_szSeparatorCharacters, 1, 0, ", ", 1, 0, 33 );
   szSeparatorCharacters = sb_szSeparatorCharacters.toString( );}

   //:// If this is block for a Marketing Section, we need to position on the corresponding Market Section by Name.
   //:// Otherwise, we are positioned on the correct Section already.
   //:// We also need to initialize the XML for the Marketing Section.
   //:// szSectionType = mSPLDefPDF.LLD_Block.LLD_SectionType ... now passed in (dks 2017.01.30)
   //:IF szSectionType = "Marketing"
   if ( ZeidonStringCompare( szSectionType, 1, 0, "Marketing", 1, 0, 51 ) == 0 )
   { 
      //:szSectionName = mSPLDefPDF.LLD_Block.Name
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
      StringBuilder sb_szSectionName;
      if ( szSectionName == null )
         sb_szSectionName = new StringBuilder( 32 );
      else
         sb_szSectionName = new StringBuilder( szSectionName );
             GetVariableFromAttribute( sb_szSectionName, mi_lTempInteger_0, 'S', 51, mSPLDefPDF, "LLD_Block", "Name", "", 0 );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );
      szSectionName = sb_szSectionName.toString( );}
      //:SetCursorFirstEntityByString( mSPLDef, szSPLD_SectionName, "Name", szSectionName, "" )
      SetCursorFirstEntityByString( mSPLDef, szSPLD_SectionName, "Name", szSectionName, "" );
      //:// TraceLineS( "Processing Marketing section name: ", szSectionName )
      //:ELSE
   } 
   else
   { 
   } 

   //:// TraceLineS( "Processing section type: ", szSectionType )
   //:END

   //:// Increment Display Section Suffix and Initialize DisplaySection entry.
   //:mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount = mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount + 1
   {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
       GetIntegerFromAttribute( mi_lTempInteger_1, mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount" );
   lTempInteger_1 = mi_lTempInteger_1.intValue( );}
   lTempInteger_2 = lTempInteger_1 + 1;
   SetAttributeFromInteger( mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount", lTempInteger_2 );
   //:szDisplaySectionSuffix = mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount
   {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
   StringBuilder sb_szDisplaySectionSuffix;
   if ( szDisplaySectionSuffix == null )
      sb_szDisplaySectionSuffix = new StringBuilder( 32 );
   else
      sb_szDisplaySectionSuffix = new StringBuilder( szDisplaySectionSuffix );
       GetVariableFromAttribute( sb_szDisplaySectionSuffix, mi_lTempInteger_3, 'S', 4, mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount", "", 0 );
   lTempInteger_3 = mi_lTempInteger_3.intValue( );
   szDisplaySectionSuffix = sb_szDisplaySectionSuffix.toString( );}
   //:szDisplaySectionName = "DisplaySection" + szDisplaySectionSuffix
    {StringBuilder sb_szDisplaySectionName;
   if ( szDisplaySectionName == null )
      sb_szDisplaySectionName = new StringBuilder( 32 );
   else
      sb_szDisplaySectionName = new StringBuilder( szDisplaySectionName );
      ZeidonStringCopy( sb_szDisplaySectionName, 1, 0, "DisplaySection", 1, 0, 51 );
   szDisplaySectionName = sb_szDisplaySectionName.toString( );}
    {StringBuilder sb_szDisplaySectionName;
   if ( szDisplaySectionName == null )
      sb_szDisplaySectionName = new StringBuilder( 32 );
   else
      sb_szDisplaySectionName = new StringBuilder( szDisplaySectionName );
      ZeidonStringConcat( sb_szDisplaySectionName, 1, 0, szDisplaySectionSuffix, 1, 0, 51 );
   szDisplaySectionName = sb_szDisplaySectionName.toString( );}
   //:CREATE ENTITY mSPLDef.DisplaySection
   RESULT = CreateEntity( mSPLDef, "DisplaySection", zPOS_AFTER );
   //:mSPLDef.DisplaySection.Type = szSPLD_SectionName
   SetAttributeFromString( mSPLDef, "DisplaySection", "Type", szSPLD_SectionName );
   //:mSPLDef.DisplaySection.XML_SectionName = szDisplaySectionName
   SetAttributeFromString( mSPLDef, "DisplaySection", "XML_SectionName", szDisplaySectionName );

   //:szSectionTitlePosition = mSPLDefPDF.LLD_Block.TitlePosition
   {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
   StringBuilder sb_szSectionTitlePosition;
   if ( szSectionTitlePosition == null )
      sb_szSectionTitlePosition = new StringBuilder( 32 );
   else
      sb_szSectionTitlePosition = new StringBuilder( szSectionTitlePosition );
       GetVariableFromAttribute( sb_szSectionTitlePosition, mi_lTempInteger_4, 'S', 3, mSPLDefPDF, "LLD_Block", "TitlePosition", "", 0 );
   lTempInteger_4 = mi_lTempInteger_4.intValue( );
   szSectionTitlePosition = sb_szSectionTitlePosition.toString( );}
   //:IF szSectionTitlePosition = ""
   if ( ZeidonStringCompare( szSectionTitlePosition, 1, 0, "", 1, 0, 3 ) == 0 )
   { 
      //:szSectionTitlePosition = "SL"    // Default will put the Title on a separate line.
       {StringBuilder sb_szSectionTitlePosition;
      if ( szSectionTitlePosition == null )
         sb_szSectionTitlePosition = new StringBuilder( 32 );
      else
         sb_szSectionTitlePosition = new StringBuilder( szSectionTitlePosition );
            ZeidonStringCopy( sb_szSectionTitlePosition, 1, 0, "SL", 1, 0, 3 );
      szSectionTitlePosition = sb_szSectionTitlePosition.toString( );}
   } 

   //:END

   //:// Format Section Title, if there is a Title.   *** We need to something different with Section Title.
   //:GetStringFromAttribute( szSectionTitle, mSPLDef, szSPLD_SectionName, "Title" )
   {StringBuilder sb_szSectionTitle;
   if ( szSectionTitle == null )
      sb_szSectionTitle = new StringBuilder( 32 );
   else
      sb_szSectionTitle = new StringBuilder( szSectionTitle );
       GetStringFromAttribute( sb_szSectionTitle, mSPLDef, szSPLD_SectionName, "Title" );
   szSectionTitle = sb_szSectionTitle.toString( );}
   //:IF szSectionTitle != ""
   if ( ZeidonStringCompare( szSectionTitle, 1, 0, "", 1, 0, 51 ) != 0 )
   { 
      //:szWriteBuffer = szLeadingBlanks + "<fo:block "
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block ", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Title", szWriteBuffer )
      {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
             omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Title", sb_szWriteBuffer );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:szWriteBuffer = szLeadingBlanks + "      <xsl:apply-templates select=^SubregPhysicalLabelDef/" + szDisplaySectionName + "/Title^/>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      <xsl:apply-templates select=^SubregPhysicalLabelDef/", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDisplaySectionName, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/Title^/>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }

      //:szWriteBuffer = szLeadingBlanks + "</fo:block>"
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
       {StringBuilder sb_szWriteBuffer;
      if ( szWriteBuffer == null )
         sb_szWriteBuffer = new StringBuilder( 32 );
      else
         sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
            ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block>", 1, 0, 32001 );
      szWriteBuffer = sb_szWriteBuffer.toString( );}
      //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
      try
      {
          {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      };
      }
      catch ( Exception e )
      {
         throw ZeidonException.wrapException( e );
      }
   } 

   //:END

   //:// Format each Statement, including Title, if requested.
   //:// Get Title option from the LLD_SpecialSectionAttrBlock entity for Title option.
   //:szStatementTitlePosition = "SL"
    {StringBuilder sb_szStatementTitlePosition;
   if ( szStatementTitlePosition == null )
      sb_szStatementTitlePosition = new StringBuilder( 32 );
   else
      sb_szStatementTitlePosition = new StringBuilder( szStatementTitlePosition );
      ZeidonStringCopy( sb_szStatementTitlePosition, 1, 0, "SL", 1, 0, 3 );
   szStatementTitlePosition = sb_szStatementTitlePosition.toString( );}
   //:szConvertToCapsFlag = ""
    {StringBuilder sb_szConvertToCapsFlag;
   if ( szConvertToCapsFlag == null )
      sb_szConvertToCapsFlag = new StringBuilder( 32 );
   else
      sb_szConvertToCapsFlag = new StringBuilder( szConvertToCapsFlag );
      ZeidonStringCopy( sb_szConvertToCapsFlag, 1, 0, "", 1, 0, 2 );
   szConvertToCapsFlag = sb_szConvertToCapsFlag.toString( );}
   //:SET CURSOR FIRST mSPLDefPDF.LLD_SpecialSectionAttribute WHERE mSPLDefPDF.LLD_SpecialSectionAttribute.Name = "Title"
   RESULT = SetCursorFirstEntityByString( mSPLDefPDF, "LLD_SpecialSectionAttribute", "Name", "Title", "" );
   //:IF RESULT >= zCURSOR_SET
   if ( RESULT >= zCURSOR_SET )
   { 
      //:szStatementTitlePosition = mSPLDefPDF.LLD_SpecialSectionAttrBlock.TitlePosition
      {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
      StringBuilder sb_szStatementTitlePosition;
      if ( szStatementTitlePosition == null )
         sb_szStatementTitlePosition = new StringBuilder( 32 );
      else
         sb_szStatementTitlePosition = new StringBuilder( szStatementTitlePosition );
             GetVariableFromAttribute( sb_szStatementTitlePosition, mi_lTempInteger_5, 'S', 3, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "TitlePosition", "", 0 );
      lTempInteger_5 = mi_lTempInteger_5.intValue( );
      szStatementTitlePosition = sb_szStatementTitlePosition.toString( );}
      //:IF szStatementTitlePosition = ""
      if ( ZeidonStringCompare( szStatementTitlePosition, 1, 0, "", 1, 0, 3 ) == 0 )
      { 
         //:szStatementTitlePosition = "SL"
          {StringBuilder sb_szStatementTitlePosition;
         if ( szStatementTitlePosition == null )
            sb_szStatementTitlePosition = new StringBuilder( 32 );
         else
            sb_szStatementTitlePosition = new StringBuilder( szStatementTitlePosition );
                  ZeidonStringCopy( sb_szStatementTitlePosition, 1, 0, "SL", 1, 0, 3 );
         szStatementTitlePosition = sb_szStatementTitlePosition.toString( );}
      } 

      //:END
      //:szConvertToCapsFlag = mSPLDefPDF.LLD_SpecialSectionAttrBlock.CapitalizeTitleTextFlag
      {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
      StringBuilder sb_szConvertToCapsFlag;
      if ( szConvertToCapsFlag == null )
         sb_szConvertToCapsFlag = new StringBuilder( 32 );
      else
         sb_szConvertToCapsFlag = new StringBuilder( szConvertToCapsFlag );
             GetVariableFromAttribute( sb_szConvertToCapsFlag, mi_lTempInteger_6, 'S', 2, mSPLDefPDF, "LLD_SpecialSectionAttrBlock", "CapitalizeTitleTextFlag", "", 0 );
      lTempInteger_6 = mi_lTempInteger_6.intValue( );
      szConvertToCapsFlag = sb_szConvertToCapsFlag.toString( );}
   } 

   //:END


   //:nRC = SetCursorFirstEntity( mSPLDef, szStatementName, "" )
   nRC = SetCursorFirstEntity( mSPLDef, szStatementName, "" );
   //:LOOP WHILE nRC >= zCURSOR_SET
   while ( nRC >= zCURSOR_SET )
   { 

      //:// Get Continuation Flag used in logic below.
      //:GetStringFromAttribute( szContinuationFlag, mSPLDef, szStatementName, "ContinuationBreakFlag" )
      {StringBuilder sb_szContinuationFlag;
      if ( szContinuationFlag == null )
         sb_szContinuationFlag = new StringBuilder( 32 );
      else
         sb_szContinuationFlag = new StringBuilder( szContinuationFlag );
             GetStringFromAttribute( sb_szContinuationFlag, mSPLDef, szStatementName, "ContinuationBreakFlag" );
      szContinuationFlag = sb_szContinuationFlag.toString( );}

      //:// Create the Display Statement entry, unless this Statement is a full continuation on next page.
      //:IF szContinuationFlag = "" OR szContinuationFlag = "M"
      if ( ZeidonStringCompare( szContinuationFlag, 1, 0, "", 1, 0, 2 ) == 0 || ZeidonStringCompare( szContinuationFlag, 1, 0, "M", 1, 0, 2 ) == 0 )
      { 
         //:mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount = mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount + 1
         {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
                   GetIntegerFromAttribute( mi_lTempInteger_7, mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount" );
         lTempInteger_7 = mi_lTempInteger_7.intValue( );}
         lTempInteger_8 = lTempInteger_7 + 1;
         SetAttributeFromInteger( mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount", lTempInteger_8 );
         //:szDisplaySectionSuffix = mSPLDef.SubregPhysicalLabelDef.wLastDisplaySuffixCount
         {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
         StringBuilder sb_szDisplaySectionSuffix;
         if ( szDisplaySectionSuffix == null )
            sb_szDisplaySectionSuffix = new StringBuilder( 32 );
         else
            sb_szDisplaySectionSuffix = new StringBuilder( szDisplaySectionSuffix );
                   GetVariableFromAttribute( sb_szDisplaySectionSuffix, mi_lTempInteger_9, 'S', 4, mSPLDef, "SubregPhysicalLabelDef", "wLastDisplaySuffixCount", "", 0 );
         lTempInteger_9 = mi_lTempInteger_9.intValue( );
         szDisplaySectionSuffix = sb_szDisplaySectionSuffix.toString( );}
         //:szDisplayStatementName = "DisplayStatement" + szDisplaySectionSuffix
          {StringBuilder sb_szDisplayStatementName;
         if ( szDisplayStatementName == null )
            sb_szDisplayStatementName = new StringBuilder( 32 );
         else
            sb_szDisplayStatementName = new StringBuilder( szDisplayStatementName );
                  ZeidonStringCopy( sb_szDisplayStatementName, 1, 0, "DisplayStatement", 1, 0, 51 );
         szDisplayStatementName = sb_szDisplayStatementName.toString( );}
          {StringBuilder sb_szDisplayStatementName;
         if ( szDisplayStatementName == null )
            sb_szDisplayStatementName = new StringBuilder( 32 );
         else
            sb_szDisplayStatementName = new StringBuilder( szDisplayStatementName );
                  ZeidonStringConcat( sb_szDisplayStatementName, 1, 0, szDisplaySectionSuffix, 1, 0, 51 );
         szDisplayStatementName = sb_szDisplayStatementName.toString( );}
         //:CREATE ENTITY mSPLDef.DisplayStatement
         RESULT = CreateEntity( mSPLDef, "DisplayStatement", zPOS_AFTER );
         //:mSPLDef.DisplayStatement.XML_StatementName = szDisplayStatementName
         SetAttributeFromString( mSPLDef, "DisplayStatement", "XML_StatementName", szDisplayStatementName );
      } 

      //:END

      //:IF szContinuationFlag = "M"     // M indicates this Statement is to be broken up into two pieces on separate panels.
      if ( ZeidonStringCompare( szContinuationFlag, 1, 0, "M", 1, 0, 2 ) == 0 )
      { 
         //:// If this statement is to be split for continuation, get text from ContinuationLeadingText.
         //:GetStringFromAttribute( szStatementText, mSPLDef, szStatementName, "ContinuationLeadingText" )
         {StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetStringFromAttribute( sb_szStatementText, mSPLDef, szStatementName, "ContinuationLeadingText" );
         szStatementText = sb_szStatementText.toString( );}
         //:ELSE
      } 
      else
      { 
         //:// It's not a continuation, so get all of the Text for the Statement.
         //:GetStringFromAttribute( szStatementText, mSPLDef, szStatementName, "Text" )
         {StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetStringFromAttribute( sb_szStatementText, mSPLDef, szStatementName, "Text" );
         szStatementText = sb_szStatementText.toString( );}
      } 

      //:END
      //:GetStringFromAttribute( szStatementTitle, mSPLDef, szStatementName, "Title" )
      {StringBuilder sb_szStatementTitle;
      if ( szStatementTitle == null )
         sb_szStatementTitle = new StringBuilder( 32 );
      else
         sb_szStatementTitle = new StringBuilder( szStatementTitle );
             GetStringFromAttribute( sb_szStatementTitle, mSPLDef, szStatementName, "Title" );
      szStatementTitle = sb_szStatementTitle.toString( );}

      //:// Convert Title to upper-case, if requested.
      //:IF szConvertToCapsFlag = "Y"
      if ( ZeidonStringCompare( szConvertToCapsFlag, 1, 0, "Y", 1, 0, 2 ) == 0 )
      { 
         //:szTemporaryTitle = szStatementTitle
          {StringBuilder sb_szTemporaryTitle;
         if ( szTemporaryTitle == null )
            sb_szTemporaryTitle = new StringBuilder( 32 );
         else
            sb_szTemporaryTitle = new StringBuilder( szTemporaryTitle );
                  ZeidonStringCopy( sb_szTemporaryTitle, 1, 0, szStatementTitle, 1, 0, 257 );
         szTemporaryTitle = sb_szTemporaryTitle.toString( );}
         //:zToUpper( szTemporaryTitle, szStatementTitle )
         {StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   zToUpper( szTemporaryTitle, sb_szStatementTitle );
         szStatementTitle = sb_szStatementTitle.toString( );}
      } 

      //:END

      //:// Combine Title in text if specified.
      //:IF szStatementTitle != "" AND szStatementTitlePosition = "CF"
      if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 && ZeidonStringCompare( szStatementTitlePosition, 1, 0, "CF", 1, 0, 3 ) == 0 )
      { 
         //:// Title is combined with Text.
         //:szTemporaryText = szStatementText
          {StringBuilder sb_szTemporaryText;
         if ( szTemporaryText == null )
            sb_szTemporaryText = new StringBuilder( 32 );
         else
            sb_szTemporaryText = new StringBuilder( szTemporaryText );
                  ZeidonStringCopy( sb_szTemporaryText, 1, 0, szStatementText, 1, 0, 32001 );
         szTemporaryText = sb_szTemporaryText.toString( );}
         //:szStatementText = szStatementTitle + " " + szTemporaryText
          {StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                  ZeidonStringCopy( sb_szStatementText, 1, 0, szStatementTitle, 1, 0, 32001 );
         szStatementText = sb_szStatementText.toString( );}
          {StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                  ZeidonStringConcat( sb_szStatementText, 1, 0, " ", 1, 0, 32001 );
         szStatementText = sb_szStatementText.toString( );}
          {StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                  ZeidonStringConcat( sb_szStatementText, 1, 0, szTemporaryText, 1, 0, 32001 );
         szStatementText = sb_szStatementText.toString( );}
         //:ELSE
      } 
      else
      { 
         //:// Format Title, if it exists and is requested.
         //:IF szStatementTitle != "" AND szStatementTitlePosition = "SL"
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 && ZeidonStringCompare( szStatementTitlePosition, 1, 0, "SL", 1, 0, 3 ) == 0 )
         { 
            //:szWriteBuffer = szLeadingBlanks + "   <fo:block "
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <fo:block ", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
            //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Title", szWriteBuffer )
            {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                         omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Title", sb_szWriteBuffer );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
            //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
            try
            {
                {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            };
            }
            catch ( Exception e )
            {
               throw ZeidonException.wrapException( e );
            }

            //://szWriteBuffer = szLeadingBlanks + "      " + szStatementTitle
            //:szWriteBuffer = szLeadingBlanks + "      <xsl:apply-templates select=^SubregPhysicalLabelDef/"
            //:                                + szDisplaySectionName + "/" + szDisplayStatementName + "/Title^/>"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      <xsl:apply-templates select=^SubregPhysicalLabelDef/", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDisplaySectionName, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDisplayStatementName, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/Title^/>", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
            //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
            try
            {
                {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            };
            }
            catch ( Exception e )
            {
               throw ZeidonException.wrapException( e );
            }

            //:szWriteBuffer = szLeadingBlanks + "   </fo:block>"
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
             {StringBuilder sb_szWriteBuffer;
            if ( szWriteBuffer == null )
               sb_szWriteBuffer = new StringBuilder( 32 );
            else
               sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                        ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   </fo:block>", 1, 0, 32001 );
            szWriteBuffer = sb_szWriteBuffer.toString( );}
            //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
            try
            {
                {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            };
            }
            catch ( Exception e )
            {
               throw ZeidonException.wrapException( e );
            }

            //:mSPLDef.DisplayStatement.Title = szStatementTitle
            SetAttributeFromString( mSPLDef, "DisplayStatement", "Title", szStatementTitle );
         } 

         //:END
      } 

      //:END

      //:// Process any mapping data for the following key words inserted in any text.
      //://    {{Usage}}
      //://    {{Claim}}
      //://    {{Surface}}
      //://    {{Location}}  {{Area Of Use}}
      //://    {{Application Type}}
      //://    {{Product Name}}
      //://    {{Master Product}}
      //://    {{Primary Registrant}}
      //://    {{Subregistrant}}
      //://
      //:IF szUsageTypeEntity != ""
      if ( ZeidonStringCompare( szUsageTypeEntity, 1, 0, "", 1, 0, 33 ) != 0 )
      { 
         //:// Storage and Disposal has no keyword mapping.
         //:InsertKeywordsIntoString( mSPLDef, szStatementText, szUsageTypeEntity, szLoopingEntity, szSeparatorCharacters )
         {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          {StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   m_ZGlobal1_Operation.InsertKeywordsIntoString( mSPLDef, sb_szStatementText, szUsageTypeEntity, szLoopingEntity, szSeparatorCharacters );
         szStatementText = sb_szStatementText.toString( );}
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         }
         //:SetAttributeFromString( mSPLDef, szStatementName, "wkDisplayText", szStatementText )
         SetAttributeFromString( mSPLDef, szStatementName, "wkDisplayText", szStatementText );
      } 

      //:END

      //:// If Statement is flagged as Continuation, process as:
      //:// If the Statement has Continuation Text, format the regular text here, and set up the Continuation subobject for continuation
      //:// on the next Panel for all remaining Statement entities.
      //:// If the Statement does NOT have Continuation Text, format this and all remaining Statement entities on next Panel.

      //:IF szContinuationFlag = ""
      if ( ZeidonStringCompare( szContinuationFlag, 1, 0, "", 1, 0, 2 ) == 0 )
      { 

         //:// Process regular Statement Text.

         //:szWriteBuffer = szLeadingBlanks + "<fo:block "
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "<fo:block ", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Text", szWriteBuffer )
         {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                   omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Text", sb_szWriteBuffer );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
         try
         {
             {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         };
         }
         catch ( Exception e )
         {
            throw ZeidonException.wrapException( e );
         }

         //://szWriteBuffer = szLeadingBlanks + "      " + szStatementText
         //:szWriteBuffer = szLeadingBlanks + "   <xsl:apply-templates select=^SubregPhysicalLabelDef/"
         //:                                   + szDisplaySectionName + "/" + szDisplayStatementName + "/Text^/>"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <xsl:apply-templates select=^SubregPhysicalLabelDef/", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDisplaySectionName, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDisplayStatementName, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/Text^/>", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
         try
         {
             {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         };
         }
         catch ( Exception e )
         {
            throw ZeidonException.wrapException( e );
         }

         //:szWriteBuffer = szLeadingBlanks + "</fo:block>"
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
          {StringBuilder sb_szWriteBuffer;
         if ( szWriteBuffer == null )
            sb_szWriteBuffer = new StringBuilder( 32 );
         else
            sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                  ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "</fo:block>", 1, 0, 32001 );
         szWriteBuffer = sb_szWriteBuffer.toString( );}
         //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
         try
         {
             {
          ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
          m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
          // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
         };
         }
         catch ( Exception e )
         {
            throw ZeidonException.wrapException( e );
         }

         //:mSPLDef.DisplayStatement.Text = szStatementText
         SetAttributeFromString( mSPLDef, "DisplayStatement", "Text", szStatementText );

         //:ELSE
      } 
      else
      { 

         //:// Process Continuation.
         //:// Skip if a prior statement was a continuation.
         //:IF szBlockContinuationType = ""
         if ( ZeidonStringCompare( szBlockContinuationType, 1, 0, "", 1, 0, 2 ) == 0 )
         { 

            //:// If this is a partial text continuation, format the first part of the text on the current Block.
            //:IF szContinuationFlag = "M"
            if ( ZeidonStringCompare( szContinuationFlag, 1, 0, "M", 1, 0, 2 ) == 0 )
            { 
               //:szWriteBuffer = szLeadingBlanks + "   <fo:block "
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   <fo:block ", 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
               //:AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Text", szWriteBuffer )
               {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                               omSPLDef_AddFormatToSpecialText( mSPLDefPDF, szSectionType, "Text", sb_szWriteBuffer );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
               //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
               try
               {
                   {
                ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
               };
               }
               catch ( Exception e )
               {
                  throw ZeidonException.wrapException( e );
               }

               //:szWriteBuffer = szLeadingBlanks + "      <xsl:apply-templates select=^SubregPhysicalLabelDef/"
               //:                                + szDisplaySectionName + "/" + szDisplayStatementName + "/Text^/>"
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "      <xsl:apply-templates select=^SubregPhysicalLabelDef/", 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDisplaySectionName, 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/", 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, szDisplayStatementName, 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "/Text^/>", 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
               //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
               try
               {
                   {
                ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
               };
               }
               catch ( Exception e )
               {
                  throw ZeidonException.wrapException( e );
               }

               //:szWriteBuffer = szLeadingBlanks + "   </fo:block>"
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringCopy( sb_szWriteBuffer, 1, 0, szLeadingBlanks, 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
                {StringBuilder sb_szWriteBuffer;
               if ( szWriteBuffer == null )
                  sb_szWriteBuffer = new StringBuilder( 32 );
               else
                  sb_szWriteBuffer = new StringBuilder( szWriteBuffer );
                              ZeidonStringConcat( sb_szWriteBuffer, 1, 0, "   </fo:block>", 1, 0, 32001 );
               szWriteBuffer = sb_szWriteBuffer.toString( );}
               //:WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
               try
               {
                   {
                ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
                m_ZGlobal1_Operation.WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 );
                // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
               };
               }
               catch ( Exception e )
               {
                  throw ZeidonException.wrapException( e );
               }

               //:mSPLDef.DisplayStatement.Text = szStatementText
               SetAttributeFromString( mSPLDef, "DisplayStatement", "Text", szStatementText );
            } 

            //:END

            //:// When this code was written there was a core error where an entity created under view mSPLDefPanelLevel couldn't
            //:// be seen under view mSPLDefPDF. Thus the reason for the somewhat awkward code below where mSPLDefPanelLevel
            //:// is the same view as mSPLDefPDF for the case where the continuation is to the next Block.

            //:szDebugMsg = mSPLDefPDF.LLD_Block.ID
            {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
            StringBuilder sb_szDebugMsg;
            if ( szDebugMsg == null )
               sb_szDebugMsg = new StringBuilder( 32 );
            else
               sb_szDebugMsg = new StringBuilder( szDebugMsg );
                         GetVariableFromAttribute( sb_szDebugMsg, mi_lTempInteger_10, 'S', 513, mSPLDefPDF, "LLD_Block", "ID", "", 0 );
            lTempInteger_10 = mi_lTempInteger_10.intValue( );
            szDebugMsg = sb_szDebugMsg.toString( );}
            //:szDebugMsg = szDebugMsg + "   Tag: " + mSPLDefPDF.LLD_Block.Tag
             {StringBuilder sb_szDebugMsg;
            if ( szDebugMsg == null )
               sb_szDebugMsg = new StringBuilder( 32 );
            else
               sb_szDebugMsg = new StringBuilder( szDebugMsg );
                        ZeidonStringConcat( sb_szDebugMsg, 1, 0, "   Tag: ", 1, 0, 513 );
            szDebugMsg = sb_szDebugMsg.toString( );}
            {MutableInt mi_lTempInteger_11 = new MutableInt( lTempInteger_11 );
            StringBuilder sb_szTempString_0;
            if ( szTempString_0 == null )
               sb_szTempString_0 = new StringBuilder( 32 );
            else
               sb_szTempString_0 = new StringBuilder( szTempString_0 );
                         GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_11, 'S', 65, mSPLDefPDF, "LLD_Block", "Tag", "", 0 );
            lTempInteger_11 = mi_lTempInteger_11.intValue( );
            szTempString_0 = sb_szTempString_0.toString( );}
             {StringBuilder sb_szDebugMsg;
            if ( szDebugMsg == null )
               sb_szDebugMsg = new StringBuilder( 32 );
            else
               sb_szDebugMsg = new StringBuilder( szDebugMsg );
                        ZeidonStringConcat( sb_szDebugMsg, 1, 0, szTempString_0, 1, 0, 513 );
            szDebugMsg = sb_szDebugMsg.toString( );}
            //:szDebugMsg = szDebugMsg + "   Name: " + mSPLDefPDF.LLD_Block.Name
             {StringBuilder sb_szDebugMsg;
            if ( szDebugMsg == null )
               sb_szDebugMsg = new StringBuilder( 32 );
            else
               sb_szDebugMsg = new StringBuilder( szDebugMsg );
                        ZeidonStringConcat( sb_szDebugMsg, 1, 0, "   Name: ", 1, 0, 513 );
            szDebugMsg = sb_szDebugMsg.toString( );}
            {MutableInt mi_lTempInteger_12 = new MutableInt( lTempInteger_12 );
            StringBuilder sb_szTempString_1;
            if ( szTempString_1 == null )
               sb_szTempString_1 = new StringBuilder( 32 );
            else
               sb_szTempString_1 = new StringBuilder( szTempString_1 );
                         GetVariableFromAttribute( sb_szTempString_1, mi_lTempInteger_12, 'S', 129, mSPLDefPDF, "LLD_Block", "Name", "", 0 );
            lTempInteger_12 = mi_lTempInteger_12.intValue( );
            szTempString_1 = sb_szTempString_1.toString( );}
             {StringBuilder sb_szDebugMsg;
            if ( szDebugMsg == null )
               sb_szDebugMsg = new StringBuilder( 32 );
            else
               sb_szDebugMsg = new StringBuilder( szDebugMsg );
                        ZeidonStringConcat( sb_szDebugMsg, 1, 0, szTempString_1, 1, 0, 513 );
            szDebugMsg = sb_szDebugMsg.toString( );}
            //:szDebugMsg = szDebugMsg + "   Title: " + mSPLDefPDF.LLD_Block.BlockTitle
             {StringBuilder sb_szDebugMsg;
            if ( szDebugMsg == null )
               sb_szDebugMsg = new StringBuilder( 32 );
            else
               sb_szDebugMsg = new StringBuilder( szDebugMsg );
                        ZeidonStringConcat( sb_szDebugMsg, 1, 0, "   Title: ", 1, 0, 513 );
            szDebugMsg = sb_szDebugMsg.toString( );}
            {MutableInt mi_lTempInteger_13 = new MutableInt( lTempInteger_13 );
            StringBuilder sb_szTempString_2;
            if ( szTempString_2 == null )
               sb_szTempString_2 = new StringBuilder( 32 );
            else
               sb_szTempString_2 = new StringBuilder( szTempString_2 );
                         GetVariableFromAttribute( sb_szTempString_2, mi_lTempInteger_13, 'S', 255, mSPLDefPDF, "LLD_Block", "BlockTitle", "", 0 );
            lTempInteger_13 = mi_lTempInteger_13.intValue( );
            szTempString_2 = sb_szTempString_2.toString( );}
             {StringBuilder sb_szDebugMsg;
            if ( szDebugMsg == null )
               sb_szDebugMsg = new StringBuilder( 32 );
            else
               sb_szDebugMsg = new StringBuilder( szDebugMsg );
                        ZeidonStringConcat( sb_szDebugMsg, 1, 0, szTempString_2, 1, 0, 513 );
            szDebugMsg = sb_szDebugMsg.toString( );}
            //:szDebugMsg = szDebugMsg + "   Section Type: " + mSPLDefPDF.LLD_Block.LLD_SectionType
             {StringBuilder sb_szDebugMsg;
            if ( szDebugMsg == null )
               sb_szDebugMsg = new StringBuilder( 32 );
            else
               sb_szDebugMsg = new StringBuilder( szDebugMsg );
                        ZeidonStringConcat( sb_szDebugMsg, 1, 0, "   Section Type: ", 1, 0, 513 );
            szDebugMsg = sb_szDebugMsg.toString( );}
            {MutableInt mi_lTempInteger_14 = new MutableInt( lTempInteger_14 );
            StringBuilder sb_szTempString_3;
            if ( szTempString_3 == null )
               sb_szTempString_3 = new StringBuilder( 32 );
            else
               sb_szTempString_3 = new StringBuilder( szTempString_3 );
                         GetVariableFromAttribute( sb_szTempString_3, mi_lTempInteger_14, 'S', 33, mSPLDefPDF, "LLD_Block", "LLD_SectionType", "", 0 );
            lTempInteger_14 = mi_lTempInteger_14.intValue( );
            szTempString_3 = sb_szTempString_3.toString( );}
             {StringBuilder sb_szDebugMsg;
            if ( szDebugMsg == null )
               sb_szDebugMsg = new StringBuilder( 32 );
            else
               sb_szDebugMsg = new StringBuilder( szDebugMsg );
                        ZeidonStringConcat( sb_szDebugMsg, 1, 0, szTempString_3, 1, 0, 513 );
            szDebugMsg = sb_szDebugMsg.toString( );}
            //:szDebugMsg = szDebugMsg + "   Continuation: " + mSPLDefPDF.LLD_Block.ContinuationBlockFlag
             {StringBuilder sb_szDebugMsg;
            if ( szDebugMsg == null )
               sb_szDebugMsg = new StringBuilder( 32 );
            else
               sb_szDebugMsg = new StringBuilder( szDebugMsg );
                        ZeidonStringConcat( sb_szDebugMsg, 1, 0, "   Continuation: ", 1, 0, 513 );
            szDebugMsg = sb_szDebugMsg.toString( );}
            {MutableInt mi_lTempInteger_15 = new MutableInt( lTempInteger_15 );
            StringBuilder sb_szTempString_4;
            if ( szTempString_4 == null )
               sb_szTempString_4 = new StringBuilder( 32 );
            else
               sb_szTempString_4 = new StringBuilder( szTempString_4 );
                         GetVariableFromAttribute( sb_szTempString_4, mi_lTempInteger_15, 'S', 2, mSPLDefPDF, "LLD_Block", "ContinuationBlockFlag", "", 0 );
            lTempInteger_15 = mi_lTempInteger_15.intValue( );
            szTempString_4 = sb_szTempString_4.toString( );}
             {StringBuilder sb_szDebugMsg;
            if ( szDebugMsg == null )
               sb_szDebugMsg = new StringBuilder( 32 );
            else
               sb_szDebugMsg = new StringBuilder( szDebugMsg );
                        ZeidonStringConcat( sb_szDebugMsg, 1, 0, szTempString_4, 1, 0, 513 );
            szDebugMsg = sb_szDebugMsg.toString( );}
            //:TraceLineS( "Checking Continuation from Block ID: ",  szDebugMsg )
            TraceLineS( "Checking Continuation from Block ID: ", szDebugMsg );


            //:// First look to see if the next Block is a Continuation Block and set flag.
            //:CreateViewFromView( mSPLDefContinue, mSPLDefPDF )
            CreateViewFromView( mSPLDefContinue, mSPLDefPDF );
            //:SET CURSOR NEXT mSPLDefContinue.LLD_Block WHERE mSPLDefContinue.LLD_Block.ContinuationBlockFlag = "Y"
            RESULT = SetCursorNextEntityByString( mSPLDefContinue, "LLD_Block", "ContinuationBlockFlag", "Y", "" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:szDebugMsg = mSPLDefPDF.LLD_Block.ID
               {MutableInt mi_lTempInteger_16 = new MutableInt( lTempInteger_16 );
               StringBuilder sb_szDebugMsg;
               if ( szDebugMsg == null )
                  sb_szDebugMsg = new StringBuilder( 32 );
               else
                  sb_szDebugMsg = new StringBuilder( szDebugMsg );
                               GetVariableFromAttribute( sb_szDebugMsg, mi_lTempInteger_16, 'S', 513, mSPLDefPDF, "LLD_Block", "ID", "", 0 );
               lTempInteger_16 = mi_lTempInteger_16.intValue( );
               szDebugMsg = sb_szDebugMsg.toString( );}
               //:szDebugMsg = szDebugMsg + "   Tag: " + mSPLDefContinue.LLD_Block.Tag
                {StringBuilder sb_szDebugMsg;
               if ( szDebugMsg == null )
                  sb_szDebugMsg = new StringBuilder( 32 );
               else
                  sb_szDebugMsg = new StringBuilder( szDebugMsg );
                              ZeidonStringConcat( sb_szDebugMsg, 1, 0, "   Tag: ", 1, 0, 513 );
               szDebugMsg = sb_szDebugMsg.toString( );}
               {MutableInt mi_lTempInteger_17 = new MutableInt( lTempInteger_17 );
               StringBuilder sb_szTempString_5;
               if ( szTempString_5 == null )
                  sb_szTempString_5 = new StringBuilder( 32 );
               else
                  sb_szTempString_5 = new StringBuilder( szTempString_5 );
                               GetVariableFromAttribute( sb_szTempString_5, mi_lTempInteger_17, 'S', 65, mSPLDefContinue, "LLD_Block", "Tag", "", 0 );
               lTempInteger_17 = mi_lTempInteger_17.intValue( );
               szTempString_5 = sb_szTempString_5.toString( );}
                {StringBuilder sb_szDebugMsg;
               if ( szDebugMsg == null )
                  sb_szDebugMsg = new StringBuilder( 32 );
               else
                  sb_szDebugMsg = new StringBuilder( szDebugMsg );
                              ZeidonStringConcat( sb_szDebugMsg, 1, 0, szTempString_5, 1, 0, 513 );
               szDebugMsg = sb_szDebugMsg.toString( );}
               //:szDebugMsg = szDebugMsg + "   Name: " + mSPLDefContinue.LLD_Block.Name
                {StringBuilder sb_szDebugMsg;
               if ( szDebugMsg == null )
                  sb_szDebugMsg = new StringBuilder( 32 );
               else
                  sb_szDebugMsg = new StringBuilder( szDebugMsg );
                              ZeidonStringConcat( sb_szDebugMsg, 1, 0, "   Name: ", 1, 0, 513 );
               szDebugMsg = sb_szDebugMsg.toString( );}
               {MutableInt mi_lTempInteger_18 = new MutableInt( lTempInteger_18 );
               StringBuilder sb_szTempString_6;
               if ( szTempString_6 == null )
                  sb_szTempString_6 = new StringBuilder( 32 );
               else
                  sb_szTempString_6 = new StringBuilder( szTempString_6 );
                               GetVariableFromAttribute( sb_szTempString_6, mi_lTempInteger_18, 'S', 129, mSPLDefContinue, "LLD_Block", "Name", "", 0 );
               lTempInteger_18 = mi_lTempInteger_18.intValue( );
               szTempString_6 = sb_szTempString_6.toString( );}
                {StringBuilder sb_szDebugMsg;
               if ( szDebugMsg == null )
                  sb_szDebugMsg = new StringBuilder( 32 );
               else
                  sb_szDebugMsg = new StringBuilder( szDebugMsg );
                              ZeidonStringConcat( sb_szDebugMsg, 1, 0, szTempString_6, 1, 0, 513 );
               szDebugMsg = sb_szDebugMsg.toString( );}
               //:szDebugMsg = szDebugMsg + "   Title: " + mSPLDefContinue.LLD_Block.BlockTitle
                {StringBuilder sb_szDebugMsg;
               if ( szDebugMsg == null )
                  sb_szDebugMsg = new StringBuilder( 32 );
               else
                  sb_szDebugMsg = new StringBuilder( szDebugMsg );
                              ZeidonStringConcat( sb_szDebugMsg, 1, 0, "   Title: ", 1, 0, 513 );
               szDebugMsg = sb_szDebugMsg.toString( );}
               {MutableInt mi_lTempInteger_19 = new MutableInt( lTempInteger_19 );
               StringBuilder sb_szTempString_7;
               if ( szTempString_7 == null )
                  sb_szTempString_7 = new StringBuilder( 32 );
               else
                  sb_szTempString_7 = new StringBuilder( szTempString_7 );
                               GetVariableFromAttribute( sb_szTempString_7, mi_lTempInteger_19, 'S', 255, mSPLDefContinue, "LLD_Block", "BlockTitle", "", 0 );
               lTempInteger_19 = mi_lTempInteger_19.intValue( );
               szTempString_7 = sb_szTempString_7.toString( );}
                {StringBuilder sb_szDebugMsg;
               if ( szDebugMsg == null )
                  sb_szDebugMsg = new StringBuilder( 32 );
               else
                  sb_szDebugMsg = new StringBuilder( szDebugMsg );
                              ZeidonStringConcat( sb_szDebugMsg, 1, 0, szTempString_7, 1, 0, 513 );
               szDebugMsg = sb_szDebugMsg.toString( );}
               //:szDebugMsg = szDebugMsg + "   Section Type: " + mSPLDefContinue.LLD_Block.LLD_SectionType
                {StringBuilder sb_szDebugMsg;
               if ( szDebugMsg == null )
                  sb_szDebugMsg = new StringBuilder( 32 );
               else
                  sb_szDebugMsg = new StringBuilder( szDebugMsg );
                              ZeidonStringConcat( sb_szDebugMsg, 1, 0, "   Section Type: ", 1, 0, 513 );
               szDebugMsg = sb_szDebugMsg.toString( );}
               {MutableInt mi_lTempInteger_20 = new MutableInt( lTempInteger_20 );
               StringBuilder sb_szTempString_8;
               if ( szTempString_8 == null )
                  sb_szTempString_8 = new StringBuilder( 32 );
               else
                  sb_szTempString_8 = new StringBuilder( szTempString_8 );
                               GetVariableFromAttribute( sb_szTempString_8, mi_lTempInteger_20, 'S', 33, mSPLDefContinue, "LLD_Block", "LLD_SectionType", "", 0 );
               lTempInteger_20 = mi_lTempInteger_20.intValue( );
               szTempString_8 = sb_szTempString_8.toString( );}
                {StringBuilder sb_szDebugMsg;
               if ( szDebugMsg == null )
                  sb_szDebugMsg = new StringBuilder( 32 );
               else
                  sb_szDebugMsg = new StringBuilder( szDebugMsg );
                              ZeidonStringConcat( sb_szDebugMsg, 1, 0, szTempString_8, 1, 0, 513 );
               szDebugMsg = sb_szDebugMsg.toString( );}
               //:szDebugMsg = szDebugMsg + "   Continuation: " + mSPLDefContinue.LLD_Block.ContinuationBlockFlag
                {StringBuilder sb_szDebugMsg;
               if ( szDebugMsg == null )
                  sb_szDebugMsg = new StringBuilder( 32 );
               else
                  sb_szDebugMsg = new StringBuilder( szDebugMsg );
                              ZeidonStringConcat( sb_szDebugMsg, 1, 0, "   Continuation: ", 1, 0, 513 );
               szDebugMsg = sb_szDebugMsg.toString( );}
               {MutableInt mi_lTempInteger_21 = new MutableInt( lTempInteger_21 );
               StringBuilder sb_szTempString_9;
               if ( szTempString_9 == null )
                  sb_szTempString_9 = new StringBuilder( 32 );
               else
                  sb_szTempString_9 = new StringBuilder( szTempString_9 );
                               GetVariableFromAttribute( sb_szTempString_9, mi_lTempInteger_21, 'S', 2, mSPLDefContinue, "LLD_Block", "ContinuationBlockFlag", "", 0 );
               lTempInteger_21 = mi_lTempInteger_21.intValue( );
               szTempString_9 = sb_szTempString_9.toString( );}
                {StringBuilder sb_szDebugMsg;
               if ( szDebugMsg == null )
                  sb_szDebugMsg = new StringBuilder( 32 );
               else
                  sb_szDebugMsg = new StringBuilder( szDebugMsg );
                              ZeidonStringConcat( sb_szDebugMsg, 1, 0, szTempString_9, 1, 0, 513 );
               szDebugMsg = sb_szDebugMsg.toString( );}
               //:TraceLineS( "Checking Continuation To Block ID: ",  szDebugMsg )
               TraceLineS( "Checking Continuation To Block ID: ", szDebugMsg );

               //:// IF mSPLDefPDF.LLD_Block.ContinuationBlockFlag = "Y"
               //:   szBlockContinuationType = "B"
                {StringBuilder sb_szBlockContinuationType;
               if ( szBlockContinuationType == null )
                  sb_szBlockContinuationType = new StringBuilder( 32 );
               else
                  sb_szBlockContinuationType = new StringBuilder( szBlockContinuationType );
                              ZeidonStringCopy( sb_szBlockContinuationType, 1, 0, "B", 1, 0, 2 );
               szBlockContinuationType = sb_szBlockContinuationType.toString( );}
               //:// ELSE
               //:// szBlockContinuationType = "P"
               //:// SET CURSOR PREVIOUS mSPLDefPDF.LLD_Block     // We need to undo the set cursor next above.
               //:// END
               //:ELSE
            } 
            else
            { 
               //:szBlockContinuationType = "P"
                {StringBuilder sb_szBlockContinuationType;
               if ( szBlockContinuationType == null )
                  sb_szBlockContinuationType = new StringBuilder( 32 );
               else
                  sb_szBlockContinuationType = new StringBuilder( szBlockContinuationType );
                              ZeidonStringCopy( sb_szBlockContinuationType, 1, 0, "P", 1, 0, 2 );
               szBlockContinuationType = sb_szBlockContinuationType.toString( );}
            } 

            //:// SET CURSOR PREVIOUS mSPLDefPDF.LLD_Block     // We need to undo the set cursor next above.
            //:END
            //:DropView( mSPLDefContinue )
            DropView( mSPLDefContinue );

            //:// Create Panel view that will hold Continuation statements and position on next Panel, if this
            //:// is a Panel continuation, rather than a Block continuation.
            //:// DonC deleted the following commented lines because of a JOE error where the ContinuationStatement created
            //:// under mSPLDefPanelLevel didn't show under mSPLDef.
            //:// Also, we won't have to check continuing to a new Panel because we'll include the continue block.
            //://        CreateViewFromView( mSPLDefPanelLevel, mSPLDef )
            //://        NAME VIEW mSPLDefPanelLevel "mSPLDefPanelLevel"
            //://        IF szBlockContinuationType = "P"
            //://           SET CURSOR NEXT mSPLDefPanelLevel.LLD_Panel
            //://        END
            //:// Remove any existing Continuation Statements.
            //://        FOR EACH mSPLDefPanelLevel.ContinuationStatement
            //://           DELETE ENTITY mSPLDefPanelLevel.ContinuationStatement NONE
            //://        END

            //:IF szBlockContinuationType = "B"
            if ( ZeidonStringCompare( szBlockContinuationType, 1, 0, "B", 1, 0, 2 ) == 0 )
            { 

               //:// Block continuation

               //:IF szContinuationFlag = "M"
               if ( ZeidonStringCompare( szContinuationFlag, 1, 0, "M", 1, 0, 2 ) == 0 )
               { 
                  //:// Continuation is in two pieces, so next text is ContinuationText.
                  //:GetStringFromAttribute( szTemporaryText, mSPLDef, szStatementName, "ContinuationText" )
                  {StringBuilder sb_szTemporaryText;
                  if ( szTemporaryText == null )
                     sb_szTemporaryText = new StringBuilder( 32 );
                  else
                     sb_szTemporaryText = new StringBuilder( szTemporaryText );
                                     GetStringFromAttribute( sb_szTemporaryText, mSPLDef, szStatementName, "ContinuationText" );
                  szTemporaryText = sb_szTemporaryText.toString( );}
                  //:CREATE ENTITY mSPLDef.ContinuationStatement
                  RESULT = CreateEntity( mSPLDef, "ContinuationStatement", zPOS_AFTER );
                  //:mSPLDef.ContinuationStatement.Text = szTemporaryText
                  SetAttributeFromString( mSPLDef, "ContinuationStatement", "Text", szTemporaryText );
                  //:ELSE
               } 
               else
               { 
                  //:// Initialize Continuation entry with Regular Text.
                  //:CREATE ENTITY mSPLDef.ContinuationStatement
                  RESULT = CreateEntity( mSPLDef, "ContinuationStatement", zPOS_AFTER );
                  //:IF szStatementTitle != "" AND szStatementTitlePosition = "SL"
                  if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 && ZeidonStringCompare( szStatementTitlePosition, 1, 0, "SL", 1, 0, 3 ) == 0 )
                  { 
                     //:mSPLDef.ContinuationStatement.Title = szStatementTitle
                     SetAttributeFromString( mSPLDef, "ContinuationStatement", "Title", szStatementTitle );
                  } 

                  //:END
                  //:mSPLDef.ContinuationStatement.Text = szStatementText
                  SetAttributeFromString( mSPLDef, "ContinuationStatement", "Text", szStatementText );
               } 

               //:END
               //://TraceLineS( "##########********** Create Continue 1: ", mSPLDefPDF.LLD_Block.LLD_SectionType )

               //:// Add any remaining Statement entries to continuation, that will be generated for the next Panel.
               //:// This will position us on the last Statement under the Section so that we will exit this operation without generating
               //:// another Statement for this Panel.
               //:nRC = SetCursorNextEntity( mSPLDef, szStatementName, "" )
               nRC = SetCursorNextEntity( mSPLDef, szStatementName, "" );
               //:LOOP WHILE nRC >= zCURSOR_SET
               while ( nRC >= zCURSOR_SET )
               { 
                  //:GetStringFromAttribute( szStatementText, mSPLDef, szStatementName, "Text" )
                  {StringBuilder sb_szStatementText;
                  if ( szStatementText == null )
                     sb_szStatementText = new StringBuilder( 32 );
                  else
                     sb_szStatementText = new StringBuilder( szStatementText );
                                     GetStringFromAttribute( sb_szStatementText, mSPLDef, szStatementName, "Text" );
                  szStatementText = sb_szStatementText.toString( );}
                  //:GetStringFromAttribute( szStatementTitle, mSPLDef, szStatementName, "Title" )
                  {StringBuilder sb_szStatementTitle;
                  if ( szStatementTitle == null )
                     sb_szStatementTitle = new StringBuilder( 32 );
                  else
                     sb_szStatementTitle = new StringBuilder( szStatementTitle );
                                     GetStringFromAttribute( sb_szStatementTitle, mSPLDef, szStatementName, "Title" );
                  szStatementTitle = sb_szStatementTitle.toString( );}
                  //:CREATE ENTITY mSPLDef.ContinuationStatement
                  RESULT = CreateEntity( mSPLDef, "ContinuationStatement", zPOS_AFTER );
                  //:IF szStatementTitle != "" AND szStatementTitlePosition = "SL"
                  if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 && ZeidonStringCompare( szStatementTitlePosition, 1, 0, "SL", 1, 0, 3 ) == 0 )
                  { 
                     //:mSPLDef.ContinuationStatement.Title = szStatementTitle
                     SetAttributeFromString( mSPLDef, "ContinuationStatement", "Title", szStatementTitle );
                  } 

                  //:END
                  //:mSPLDef.ContinuationStatement.Text = szStatementText
                  SetAttributeFromString( mSPLDef, "ContinuationStatement", "Text", szStatementText );

                  //:nRC = SetCursorNextEntity( mSPLDef, szStatementName, "" )
                  nRC = SetCursorNextEntity( mSPLDef, szStatementName, "" );
               } 

               //:END
               //://     // Debug Code
               //://     SET CURSOR FIRST mSPLDef.ContinuationStatement
               //://     IF RESULT >= zCURSOR_SET
               //://        TraceLineS( "##########********** Continue Text: ", mSPLDef.ContinuationStatement.Text )
               //://     ELSE
               //://        IssueError( mSPLDef,0,0, "stop" )
               //://     END
               //://     TraceLineS( "##########********** szStatementName: ", szStatementName )
               //:// SET CURSOR PREVIOUS mSPLDefPDF.LLD_Block     // We need to undo the set cursor next above.
               //:ELSE
            } 
            else
            { 
            } 


            //:   // Panel continuation

            //:   /*
            //:   IF szContinuationFlag = "M"
            //:      // Continuation is in two pieces, so next text is ContinuationText.
            //:      GetStringFromAttribute( szTemporaryText, mSPLDef, szStatementName, "ContinuationText" )
            //:      CREATE ENTITY mSPLDefPanelLevel.ContinuationStatement
            //:      mSPLDefPanelLevel.ContinuationStatement.Text = szTemporaryText
            //:   ELSE
            //:      // Initialize Continuation entry with Regular Text.
            //:      CREATE ENTITY mSPLDefPanelLevel.ContinuationStatement
            //:      IF szStatementTitle != "" AND szStatementTitlePosition = "SL"
            //:         mSPLDefPanelLevel.ContinuationStatement.Title = szStatementTitle
            //:      END
            //:      mSPLDefPanelLevel.ContinuationStatement.Text = szStatementText
            //:   END
            //:   */

            //:   // Copy BlockSpecialAttributeBlock entries.
            //:   // I decided not to do the following but use the formatting characteristics specified on the Continuation Block.
            //:   /*
            //:   FOR EACH mSPLDefPanelLevel.LLD_SpecialSectionAttribute
            //:      DELETE ENTITY mSPLDefPanelLevel.LLD_SpecialSectionAttribute NONE
            //:   END
            //:   FOR EACH mSPLDefPDF.LLD_SpecialSectionAttribute
            //:      CREATE ENTITY mSPLDefPanelLevel.LLD_SpecialSectionAttribute
            //:      mSPLDefPanelLevel.LLD_SpecialSectionAttribute.Name = mSPLDefPDF.LLD_SpecialSectionAttribute.Name
            //:      CREATE ENTITY mSPLDefPanelLevel.LLD_SpecialSectionAttrBlock
            //:      SetMatchingAttributesByName( mSPLDefPanelLevel, "LLD_SpecialSectionAttrBlock", mSPLDefPDF, "LLD_SpecialSectionAttrBlock", zSET_NULL )
            //:   END
            //:   */

            //:   // Add any remaining Statement entries to continuation, that will be generated for the next Panel.
            //:   // This will position us on the last Statement under the Section so that we will exit this operation without generating
            //:   // another Statement for this Panel.
            //:   /*
            //:   nRC = SetCursorNextEntity( mSPLDef, szStatementName, "" )
            //:   LOOP WHILE nRC >= zCURSOR_SET
            //:      GetStringFromAttribute( szStatementText, mSPLDef, szStatementName, "Text" )
            //:      GetStringFromAttribute( szStatementTitle, mSPLDef, szStatementName, "Title" )
            //:      CREATE ENTITY mSPLDefPanelLevel.ContinuationStatement
            //:      IF szStatementTitle != "" AND szStatementTitlePosition = "SL"
            //:         mSPLDefPanelLevel.ContinuationStatement.Title = szStatementTitle
            //:      END
            //:      mSPLDefPanelLevel.ContinuationStatement.Text = szStatementText

            //:      nRC = SetCursorNextEntity( mSPLDef, szStatementName, "" )
            //:   END

            //:   // Since this is a Panel continuation, add the Continuation verbage to the current Panel.
            //:   szWriteBuffer = szLeadingBlanks + "   <fo:block margin-top=^.05in^>"
            //:   WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )

            //:   szWriteBuffer = szLeadingBlanks + "      " + mSPLDef.SPLD_LLD.ContinuationPreviousPageText
            //:   WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )

            //:   szWriteBuffer = szLeadingBlanks + "   </fo:block>"
            //:   WL_QC( mSPLDef, lFile, szWriteBuffer, "^", 0 )
            //:   */
            //:END
         } 


         //:// DropView( mSPLDefPanelLevel )
         //:END
      } 


      //:END

      //:nRC = SetCursorNextEntity( mSPLDef, szStatementName, "" )
      nRC = SetCursorNextEntity( mSPLDef, szStatementName, "" );
   } 

   //:END
   return( 0 );
// END
} 


//:LOCAL OPERATION
//:GetLPLR_SourceDirectory( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                         STRING ( 400 ) ReturnedDirectory )

//:   VIEW vTZZOLFLO
private int 
omSPLDef_GetLPLR_SourceDirectory( View     mSPLDef,
                                  String   ReturnedDirectory )
{
   zVIEW    vTZZOLFLO = new zVIEW( );
   //:STRING ( 400 ) szFileName
   String   szFileName = null;
   //:STRING ( 32 )  szApplicationName
   String   szApplicationName = null;
   //:STRING ( 200 ) szMsg
   String   szMsg = null;
   //:SHORT          nRC
   int      nRC = 0;
   int      RESULT = 0;


   //:// Return the LPLR Source directory to the caller.
   //:// We will get it from the MetaSource directory in the XLP, which speicifies the source of the Query
   //:// View list for both read and write.

   //:// Try to use the existing view.
   //:GET VIEW vTZZOLFLO NAMED "TZZOLFLO"
   RESULT = GetViewByName( vTZZOLFLO, "TZZOLFLO", mSPLDef, zLEVEL_TASK );
   //:IF RESULT < 0
   if ( RESULT < 0 )
   { 
      //:// Get the XLP directory structure and file name.
      //:GetApplDirectoryFromView( szFileName, mSPLDef, zAPPL_DIR_OBJECT, 400 )
      {StringBuilder sb_szFileName;
      if ( szFileName == null )
         sb_szFileName = new StringBuilder( 32 );
      else
         sb_szFileName = new StringBuilder( szFileName );
             GetApplDirectoryFromView( sb_szFileName, mSPLDef, zAPPL_DIR_OBJECT, 400 );
      szFileName = sb_szFileName.toString( );}
      //:GetCurrentApplicationName( szApplicationName, 32, mSPLDef )
      {
       ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
       {StringBuilder sb_szApplicationName;
      if ( szApplicationName == null )
         sb_szApplicationName = new StringBuilder( 32 );
      else
         sb_szApplicationName = new StringBuilder( szApplicationName );
             m_ZGlobal1_Operation.GetCurrentApplicationName( sb_szApplicationName, 32, mSPLDef );
      szApplicationName = sb_szApplicationName.toString( );}
       // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
      }
      //:szFileName = szFileName + szApplicationName + ".XLP"
       {StringBuilder sb_szFileName;
      if ( szFileName == null )
         sb_szFileName = new StringBuilder( 32 );
      else
         sb_szFileName = new StringBuilder( szFileName );
            ZeidonStringConcat( sb_szFileName, 1, 0, szApplicationName, 1, 0, 401 );
      szFileName = sb_szFileName.toString( );}
       {StringBuilder sb_szFileName;
      if ( szFileName == null )
         sb_szFileName = new StringBuilder( 32 );
      else
         sb_szFileName = new StringBuilder( szFileName );
            ZeidonStringConcat( sb_szFileName, 1, 0, ".XLP", 1, 0, 401 );
      szFileName = sb_szFileName.toString( );}
      //:// Activate the XLP to the query LODs.
      //:// 536870912 is ACTIVATE_SYSTEM in the following activate statement.
      //:nRC = ActivateOI_FromFile( vTZZOLFLO, "TZCMLPLO", mSPLDef, szFileName, 536870912 )
      nRC = ActivateOI_FromFile( vTZZOLFLO, "TZCMLPLO", mSPLDef, szFileName, 536870912 );
      //:IF nRC < 0
      if ( nRC < 0 )
      { 
         //:szMsg = "Cannot activate the Query .XLP from executable directory, " + szFileName + "."
          {StringBuilder sb_szMsg;
         if ( szMsg == null )
            sb_szMsg = new StringBuilder( 32 );
         else
            sb_szMsg = new StringBuilder( szMsg );
                  ZeidonStringCopy( sb_szMsg, 1, 0, "Cannot activate the Query .XLP from executable directory, ", 1, 0, 201 );
         szMsg = sb_szMsg.toString( );}
          {StringBuilder sb_szMsg;
         if ( szMsg == null )
            sb_szMsg = new StringBuilder( 32 );
         else
            sb_szMsg = new StringBuilder( szMsg );
                  ZeidonStringConcat( sb_szMsg, 1, 0, szFileName, 1, 0, 201 );
         szMsg = sb_szMsg.toString( );}
          {StringBuilder sb_szMsg;
         if ( szMsg == null )
            sb_szMsg = new StringBuilder( 32 );
         else
            sb_szMsg = new StringBuilder( szMsg );
                  ZeidonStringConcat( sb_szMsg, 1, 0, ".", 1, 0, 201 );
         szMsg = sb_szMsg.toString( );}
         //:MessageSend( mSPLDef, "", "Open Query",
         //:             szMsg,
         //:             zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 )
         MessageSend( mSPLDef, "", "Open Query", szMsg, zMSGQ_OBJECT_CONSTRAINT_ERROR, 0 );
         //:SetWindowActionBehavior( mSPLDef, zWAB_StayOnWindow, "", "" )
         m_ZDRVROPR.SetWindowActionBehavior( mSPLDef, zWAB_StayOnWindow, "", "" );
         //:RETURN -1
         if(8==8)return( -1 );
      } 

      //:END
      //:NAME VIEW vTZZOLFLO "TZZOLFLO"
      SetNameForView( vTZZOLFLO, "TZZOLFLO", null, zLEVEL_TASK );
   } 

   //:END
   //:// Get the Meta Source name from the root.
   //:GetStringFromAttribute( ReturnedDirectory, vTZZOLFLO, "LPLR", "MetaSrcDir" )
   {StringBuilder sb_ReturnedDirectory;
   if ( ReturnedDirectory == null )
      sb_ReturnedDirectory = new StringBuilder( 32 );
   else
      sb_ReturnedDirectory = new StringBuilder( ReturnedDirectory );
       GetStringFromAttribute( sb_ReturnedDirectory, vTZZOLFLO, "LPLR", "MetaSrcDir" );
   ReturnedDirectory = sb_ReturnedDirectory.toString( );}
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:GenerateXML_File( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                  STRING ( 32 )  szTopEntityName,
//:                  STRING ( 300 ) szXmlDirectoryAndFileName )

//:   STRING ( 50 )   szIndentation
public int 
omSPLDef_GenerateXML_File( View     mSPLDef,
                           String   szTopEntityName,
                           String   szXmlDirectoryAndFileName )
{
   String   szIndentation = null;
   //:STRING ( 400 )  szMsg
   String   szMsg = null;
   //:STRING ( 400 )  szFileName
   String   szFileName = null;
   //:STRING ( 5000 ) szValue
   String   szValue = null;
   //:STRING ( 5000 ) szOutputLine
   String   szOutputLine = null;
   //:STRING ( 50 )   szSectionName
   String   szSectionName = null;
   //:STRING ( 50 )   szStatementName
   String   szStatementName = null;
   //:STRING ( 50 )   szDateTimeDisplay
   String   szDateTimeDisplay = null;
   //:INTEGER         lFileHandle
   int      lFileHandle = 0;
   //:SHORT           nRC
   int      nRC = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   int      RESULT = 0;
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
   int      lTempInteger_22 = 0;
   int      lTempInteger_23 = 0;
   int      lTempInteger_24 = 0;


   //:// Build an XML object from selected entries in the mSPLDef object instance.

   //:// Open XML output file.
   //:lFileHandle = SysOpenFile( mSPLDef, szXmlDirectoryAndFileName, COREFILE_WRITE )
   try
   {
       lFileHandle = m_KZOEP1AA.SysOpenFile( mSPLDef, szXmlDirectoryAndFileName, COREFILE_WRITE );
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   //:IF lFileHandle < 0
   if ( lFileHandle < 0 )
   { 
      //:szMsg = "Cannot open XML Output File, " + szXmlDirectoryAndFileName
       {StringBuilder sb_szMsg;
      if ( szMsg == null )
         sb_szMsg = new StringBuilder( 32 );
      else
         sb_szMsg = new StringBuilder( szMsg );
            ZeidonStringCopy( sb_szMsg, 1, 0, "Cannot open XML Output File, ", 1, 0, 401 );
      szMsg = sb_szMsg.toString( );}
       {StringBuilder sb_szMsg;
      if ( szMsg == null )
         sb_szMsg = new StringBuilder( 32 );
      else
         sb_szMsg = new StringBuilder( szMsg );
            ZeidonStringConcat( sb_szMsg, 1, 0, szXmlDirectoryAndFileName, 1, 0, 401 );
      szMsg = sb_szMsg.toString( );}
      //:MessageSend( mSPLDef, "", "Generate XSLT",
      //:             szMsg, zMSGQ_OBJECT_CONSTRAINT_WARNING, 0 )
      MessageSend( mSPLDef, "", "Generate XSLT", szMsg, zMSGQ_OBJECT_CONSTRAINT_WARNING, 0 );
      //:RETURN -1
      if(8==8)return( -1 );
   } 

   //:END

   //:// Build Header entries.
   //:szOutputLine = "<?xml version=" + QUOTES + "1.0" + QUOTES + "?>"
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringCopy( sb_szOutputLine, 1, 0, "<?xml version=", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, QUOTES, 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, "1.0", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, QUOTES, 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, "?>", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
   //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
   //:GetStringFromAttributeByContext( szDateTimeDisplay, mSPLDef, "SubregPhysicalLabelDef", "wDateTime", "YYYY/MM/DD HH:MM:SS.S AM", 30 )
   {StringBuilder sb_szDateTimeDisplay;
   if ( szDateTimeDisplay == null )
      sb_szDateTimeDisplay = new StringBuilder( 32 );
   else
      sb_szDateTimeDisplay = new StringBuilder( szDateTimeDisplay );
       GetStringFromAttributeByContext( sb_szDateTimeDisplay, mSPLDef, "SubregPhysicalLabelDef", "wDateTime", "YYYY/MM/DD HH:MM:SS.S AM", 30 );
   szDateTimeDisplay = sb_szDateTimeDisplay.toString( );}
   //:szOutputLine = "<!-- Output created by ePamms   " + szDateTimeDisplay + " -->"
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringCopy( sb_szOutputLine, 1, 0, "<!-- Output created by ePamms   ", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, szDateTimeDisplay, 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, " -->", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
   //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );

   //:szOutputLine = "   <zOI>"
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringCopy( sb_szOutputLine, 1, 0, "   <zOI>", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
   //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
   //:szOutputLine = "      <SubregPhysicalLabelDef>"
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringCopy( sb_szOutputLine, 1, 0, "      <SubregPhysicalLabelDef>", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
   //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );

   //:szIndentation = "         "
    {StringBuilder sb_szIndentation;
   if ( szIndentation == null )
      sb_szIndentation = new StringBuilder( 32 );
   else
      sb_szIndentation = new StringBuilder( szIndentation );
      ZeidonStringCopy( sb_szIndentation, 1, 0, "         ", 1, 0, 51 );
   szIndentation = sb_szIndentation.toString( );}
   //:szValue = mSPLDef.SubregPhysicalLabelDef.Name
   {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
   StringBuilder sb_szValue;
   if ( szValue == null )
      sb_szValue = new StringBuilder( 32 );
   else
      sb_szValue = new StringBuilder( szValue );
       GetVariableFromAttribute( sb_szValue, mi_lTempInteger_0, 'S', 5001, mSPLDef, "SubregPhysicalLabelDef", "Name", "", 0 );
   lTempInteger_0 = mi_lTempInteger_0.intValue( );
   szValue = sb_szValue.toString( );}
   //:GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue )
   omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue );
   //:szValue = mSPLDef.SubregPhysicalLabelDef.ProductName
   {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
   StringBuilder sb_szValue;
   if ( szValue == null )
      sb_szValue = new StringBuilder( 32 );
   else
      sb_szValue = new StringBuilder( szValue );
       GetVariableFromAttribute( sb_szValue, mi_lTempInteger_1, 'S', 5001, mSPLDef, "SubregPhysicalLabelDef", "ProductName", "", 0 );
   lTempInteger_1 = mi_lTempInteger_1.intValue( );
   szValue = sb_szValue.toString( );}
   //:GenerateAttribute( mSPLDef, lFileHandle, "ProductName", szIndentation, szValue )
   omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "ProductName", szIndentation, szValue );

   //:// <SubregLabelContent>
   //:szOutputLine = "         <SubregLabelContent>"
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringCopy( sb_szOutputLine, 1, 0, "         <SubregLabelContent>", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
   //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
   //:szIndentation = "            "
    {StringBuilder sb_szIndentation;
   if ( szIndentation == null )
      sb_szIndentation = new StringBuilder( 32 );
   else
      sb_szIndentation = new StringBuilder( szIndentation );
      ZeidonStringCopy( sb_szIndentation, 1, 0, "            ", 1, 0, 51 );
   szIndentation = sb_szIndentation.toString( );}
   //:szValue = mSPLDef.SubregLabelContent.EPA_RegistrationNumber
   {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
   StringBuilder sb_szValue;
   if ( szValue == null )
      sb_szValue = new StringBuilder( 32 );
   else
      sb_szValue = new StringBuilder( szValue );
       GetVariableFromAttribute( sb_szValue, mi_lTempInteger_2, 'S', 5001, mSPLDef, "SubregLabelContent", "EPA_RegistrationNumber", "", 0 );
   lTempInteger_2 = mi_lTempInteger_2.intValue( );
   szValue = sb_szValue.toString( );}
   //:GenerateAttribute( mSPLDef, lFileHandle, "EPA_RegistrationNumber", szIndentation, szValue )
   omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "EPA_RegistrationNumber", szIndentation, szValue );
   //:szValue = mSPLDef.SubregLabelContent.EPA_EstablishmentNumber
   {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
   StringBuilder sb_szValue;
   if ( szValue == null )
      sb_szValue = new StringBuilder( 32 );
   else
      sb_szValue = new StringBuilder( szValue );
       GetVariableFromAttribute( sb_szValue, mi_lTempInteger_3, 'S', 5001, mSPLDef, "SubregLabelContent", "EPA_EstablishmentNumber", "", 0 );
   lTempInteger_3 = mi_lTempInteger_3.intValue( );
   szValue = sb_szValue.toString( );}
   //:GenerateAttribute( mSPLDef, lFileHandle, "EPA_EstablishmentNumber", szIndentation, szValue )
   omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "EPA_EstablishmentNumber", szIndentation, szValue );
   //:szValue = mSPLDef.SubregLabelContent.ESL_Date
   {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
   StringBuilder sb_szValue;
   if ( szValue == null )
      sb_szValue = new StringBuilder( 32 );
   else
      sb_szValue = new StringBuilder( szValue );
       GetVariableFromAttribute( sb_szValue, mi_lTempInteger_4, 'S', 5001, mSPLDef, "SubregLabelContent", "ESL_Date", "", 0 );
   lTempInteger_4 = mi_lTempInteger_4.intValue( );
   szValue = sb_szValue.toString( );}
   //:GenerateAttribute( mSPLDef, lFileHandle, "ESL_Date", szIndentation, szValue )
   omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "ESL_Date", szIndentation, szValue );
   //:szOutputLine = "         </SubregLabelContent>"
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringCopy( sb_szOutputLine, 1, 0, "         </SubregLabelContent>", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
   //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );

   //:// <SPLD_GeneralSection>
   //:FOR EACH mSPLDef.SPLD_GeneralSection
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_GeneralSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:szOutputLine = "         <SPLD_GeneralSection>"
       {StringBuilder sb_szOutputLine;
      if ( szOutputLine == null )
         sb_szOutputLine = new StringBuilder( 32 );
      else
         sb_szOutputLine = new StringBuilder( szOutputLine );
            ZeidonStringCopy( sb_szOutputLine, 1, 0, "         <SPLD_GeneralSection>", 1, 0, 5001 );
      szOutputLine = sb_szOutputLine.toString( );}
      //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
      omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
      //:szIndentation = "            "
       {StringBuilder sb_szIndentation;
      if ( szIndentation == null )
         sb_szIndentation = new StringBuilder( 32 );
      else
         sb_szIndentation = new StringBuilder( szIndentation );
            ZeidonStringCopy( sb_szIndentation, 1, 0, "            ", 1, 0, 51 );
      szIndentation = sb_szIndentation.toString( );}
      //:szValue = mSPLDef.SPLD_GeneralSection.Title
      {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
      StringBuilder sb_szValue;
      if ( szValue == null )
         sb_szValue = new StringBuilder( 32 );
      else
         sb_szValue = new StringBuilder( szValue );
             GetVariableFromAttribute( sb_szValue, mi_lTempInteger_5, 'S', 5001, mSPLDef, "SPLD_GeneralSection", "Title", "", 0 );
      lTempInteger_5 = mi_lTempInteger_5.intValue( );
      szValue = sb_szValue.toString( );}
      //:GenerateAttribute( mSPLDef, lFileHandle, "Title", szIndentation, szValue )
      omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "Title", szIndentation, szValue );
      //:szValue = mSPLDef.SPLD_GeneralSection.Subtitle
      {MutableInt mi_lTempInteger_6 = new MutableInt( lTempInteger_6 );
      StringBuilder sb_szValue;
      if ( szValue == null )
         sb_szValue = new StringBuilder( 32 );
      else
         sb_szValue = new StringBuilder( szValue );
             GetVariableFromAttribute( sb_szValue, mi_lTempInteger_6, 'S', 5001, mSPLDef, "SPLD_GeneralSection", "Subtitle", "", 0 );
      lTempInteger_6 = mi_lTempInteger_6.intValue( );
      szValue = sb_szValue.toString( );}
      //:GenerateAttribute( mSPLDef, lFileHandle, "Subtitle", szIndentation, szValue )
      omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "Subtitle", szIndentation, szValue );

      //:// <SPLD_GeneralStatement>
      //:FOR EACH mSPLDef.SPLD_GeneralStatement
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_GeneralStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:szOutputLine = "            <SPLD_GeneralStatement>"
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringCopy( sb_szOutputLine, 1, 0, "            <SPLD_GeneralStatement>", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
         //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
         omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
         //:szIndentation = "               "
          {StringBuilder sb_szIndentation;
         if ( szIndentation == null )
            sb_szIndentation = new StringBuilder( 32 );
         else
            sb_szIndentation = new StringBuilder( szIndentation );
                  ZeidonStringCopy( sb_szIndentation, 1, 0, "               ", 1, 0, 51 );
         szIndentation = sb_szIndentation.toString( );}
         //:szValue = mSPLDef.SPLD_GeneralStatement.Text
         {MutableInt mi_lTempInteger_7 = new MutableInt( lTempInteger_7 );
         StringBuilder sb_szValue;
         if ( szValue == null )
            sb_szValue = new StringBuilder( 32 );
         else
            sb_szValue = new StringBuilder( szValue );
                   GetVariableFromAttribute( sb_szValue, mi_lTempInteger_7, 'S', 5001, mSPLDef, "SPLD_GeneralStatement", "Text", "", 0 );
         lTempInteger_7 = mi_lTempInteger_7.intValue( );
         szValue = sb_szValue.toString( );}
         //:GenerateAttribute( mSPLDef, lFileHandle, "Text", szIndentation, szValue )
         omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "Text", szIndentation, szValue );
         //:szOutputLine = "            </SPLD_GeneralStatement>"
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringCopy( sb_szOutputLine, 1, 0, "            </SPLD_GeneralStatement>", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
         //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
         omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_GeneralStatement", "" );
      } 

      //:END

      //:szOutputLine = "         </SPLD_GeneralSection>"
       {StringBuilder sb_szOutputLine;
      if ( szOutputLine == null )
         sb_szOutputLine = new StringBuilder( 32 );
      else
         sb_szOutputLine = new StringBuilder( szOutputLine );
            ZeidonStringCopy( sb_szOutputLine, 1, 0, "         </SPLD_GeneralSection>", 1, 0, 5001 );
      szOutputLine = sb_szOutputLine.toString( );}
      //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
      omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_GeneralSection", "" );
   } 

   //:END

   //:// <SPLD_IngredientsSection>
   //:FOR EACH mSPLDef.SPLD_IngredientsSection
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_IngredientsSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:szOutputLine = "         <SPLD_IngredientsSection>"
       {StringBuilder sb_szOutputLine;
      if ( szOutputLine == null )
         sb_szOutputLine = new StringBuilder( 32 );
      else
         sb_szOutputLine = new StringBuilder( szOutputLine );
            ZeidonStringCopy( sb_szOutputLine, 1, 0, "         <SPLD_IngredientsSection>", 1, 0, 5001 );
      szOutputLine = sb_szOutputLine.toString( );}
      //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
      omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
      //:szIndentation = "            "
       {StringBuilder sb_szIndentation;
      if ( szIndentation == null )
         sb_szIndentation = new StringBuilder( 32 );
      else
         sb_szIndentation = new StringBuilder( szIndentation );
            ZeidonStringCopy( sb_szIndentation, 1, 0, "            ", 1, 0, 51 );
      szIndentation = sb_szIndentation.toString( );}
      //:szValue = mSPLDef.SPLD_IngredientsSection.ActiveTitle
      {MutableInt mi_lTempInteger_8 = new MutableInt( lTempInteger_8 );
      StringBuilder sb_szValue;
      if ( szValue == null )
         sb_szValue = new StringBuilder( 32 );
      else
         sb_szValue = new StringBuilder( szValue );
             GetVariableFromAttribute( sb_szValue, mi_lTempInteger_8, 'S', 5001, mSPLDef, "SPLD_IngredientsSection", "ActiveTitle", "", 0 );
      lTempInteger_8 = mi_lTempInteger_8.intValue( );
      szValue = sb_szValue.toString( );}
      //:GenerateAttribute( mSPLDef, lFileHandle, "ActiveTitle", szIndentation, szValue )
      omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "ActiveTitle", szIndentation, szValue );
      //:szValue = mSPLDef.SPLD_IngredientsSection.InertTitle
      {MutableInt mi_lTempInteger_9 = new MutableInt( lTempInteger_9 );
      StringBuilder sb_szValue;
      if ( szValue == null )
         sb_szValue = new StringBuilder( 32 );
      else
         sb_szValue = new StringBuilder( szValue );
             GetVariableFromAttribute( sb_szValue, mi_lTempInteger_9, 'S', 5001, mSPLDef, "SPLD_IngredientsSection", "InertTitle", "", 0 );
      lTempInteger_9 = mi_lTempInteger_9.intValue( );
      szValue = sb_szValue.toString( );}
      //:GenerateAttribute( mSPLDef, lFileHandle, "InertTitle", szIndentation, szValue )
      omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "InertTitle", szIndentation, szValue );
      //:szValue = mSPLDef.SPLD_IngredientsSection.GeneralInactivePercent
      {MutableInt mi_lTempInteger_10 = new MutableInt( lTempInteger_10 );
      StringBuilder sb_szValue;
      if ( szValue == null )
         sb_szValue = new StringBuilder( 32 );
      else
         sb_szValue = new StringBuilder( szValue );
             GetVariableFromAttribute( sb_szValue, mi_lTempInteger_10, 'S', 5001, mSPLDef, "SPLD_IngredientsSection", "GeneralInactivePercent", "", 0 );
      lTempInteger_10 = mi_lTempInteger_10.intValue( );
      szValue = sb_szValue.toString( );}
      //:GenerateAttribute( mSPLDef, lFileHandle, "GeneralInactivePercent", szIndentation, szValue )
      omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "GeneralInactivePercent", szIndentation, szValue );

      //:// <SPLD_IngredientsStatement>
      //:FOR EACH mSPLDef.SPLD_IngredientsStatement
      RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_IngredientsStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:szOutputLine = "            <SPLD_IngredientsStatement>"
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringCopy( sb_szOutputLine, 1, 0, "            <SPLD_IngredientsStatement>", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
         //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
         omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
         //:szIndentation = "               "
          {StringBuilder sb_szIndentation;
         if ( szIndentation == null )
            sb_szIndentation = new StringBuilder( 32 );
         else
            sb_szIndentation = new StringBuilder( szIndentation );
                  ZeidonStringCopy( sb_szIndentation, 1, 0, "               ", 1, 0, 51 );
         szIndentation = sb_szIndentation.toString( );}
         //:szValue = mSPLDef.SPLD_IngredientsStatement.ChemicalName
         {MutableInt mi_lTempInteger_11 = new MutableInt( lTempInteger_11 );
         StringBuilder sb_szValue;
         if ( szValue == null )
            sb_szValue = new StringBuilder( 32 );
         else
            sb_szValue = new StringBuilder( szValue );
                   GetVariableFromAttribute( sb_szValue, mi_lTempInteger_11, 'S', 5001, mSPLDef, "SPLD_IngredientsStatement", "ChemicalName", "", 0 );
         lTempInteger_11 = mi_lTempInteger_11.intValue( );
         szValue = sb_szValue.toString( );}
         //:GenerateAttribute( mSPLDef, lFileHandle, "ChemicalName", szIndentation, szValue )
         omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "ChemicalName", szIndentation, szValue );
         //:szValue = mSPLDef.SPLD_IngredientsStatement.Percent
         {MutableInt mi_lTempInteger_12 = new MutableInt( lTempInteger_12 );
         StringBuilder sb_szValue;
         if ( szValue == null )
            sb_szValue = new StringBuilder( 32 );
         else
            sb_szValue = new StringBuilder( szValue );
                   GetVariableFromAttribute( sb_szValue, mi_lTempInteger_12, 'S', 5001, mSPLDef, "SPLD_IngredientsStatement", "Percent", "", 0 );
         lTempInteger_12 = mi_lTempInteger_12.intValue( );
         szValue = sb_szValue.toString( );}
         //:GenerateAttribute( mSPLDef, lFileHandle, "Percent", szIndentation, szValue )
         omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "Percent", szIndentation, szValue );
         //:szOutputLine = "            </SPLD_IngredientsStatement>"
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringCopy( sb_szOutputLine, 1, 0, "            </SPLD_IngredientsStatement>", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
         //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
         omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
         RESULT = SetCursorNextEntity( mSPLDef, "SPLD_IngredientsStatement", "" );
      } 

      //:END

      //:szOutputLine = "         </SPLD_IngredientsSection>"
       {StringBuilder sb_szOutputLine;
      if ( szOutputLine == null )
         sb_szOutputLine = new StringBuilder( 32 );
      else
         sb_szOutputLine = new StringBuilder( szOutputLine );
            ZeidonStringCopy( sb_szOutputLine, 1, 0, "         </SPLD_IngredientsSection>", 1, 0, 5001 );
      szOutputLine = sb_szOutputLine.toString( );}
      //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
      omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_IngredientsSection", "" );
   } 

   //:END

   //:// <SPLD_StorageDisposalSection>
   //:/*FOR EACH mSPLDef.SPLD_StorageDisposalSection
   //:   szOutputLine = "         <SPLD_StorageDisposalSection>"
   //:   GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:   szIndentation = "            "
   //:   szValue = mSPLDef.SPLD_StorageDisposalSection.Title
   //:   GenerateAttribute( mSPLDef, lFileHandle, "Title", szIndentation, szValue )
   //:   // <SPLD_StorageDisposalStatement>
   //:   FOR EACH mSPLDef.SPLD_StorageDisposalStatement
   //:      szOutputLine = "            <SPLD_StorageDisposalStatement>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:      szIndentation = "               "
   //:      szValue = mSPLDef.SPLD_StorageDisposalStatement.Title
   //:      GenerateAttribute( mSPLDef, lFileHandle, "Title", szIndentation, szValue )
   //:      szValue = mSPLDef.SPLD_StorageDisposalStatement.Text
   //:      GenerateAttribute( mSPLDef, lFileHandle, "Text", szIndentation, szValue )
   //:      szOutputLine = "            </SPLD_StorageDisposalStatement>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:   END
   //:   szOutputLine = "         </SPLD_StorageDisposalSection>"
   //:   GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:END
   //:// <SPLD_DirectionsForUseSection>
   //:FOR EACH mSPLDef.SPLD_DirectionsForUseSection
   //:   szOutputLine = "         <SPLD_DirectionsForUseSection>"
   //:   GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:   szIndentation = "            "
   //:   szValue = mSPLDef.SPLD_DirectionsForUseSection.Title
   //:   GenerateAttribute( mSPLDef, lFileHandle, "Title", szIndentation, szValue )
   //:   // <SPLD_DirectionsForUseStatement>
   //:   FOR EACH mSPLDef.SPLD_DirectionsForUseStatement
   //:      szOutputLine = "            <SPLD_DirectionsForUseStatement>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:      szIndentation = "               "
   //:      szValue = mSPLDef.SPLD_DirectionsForUseStatement.Title
   //:      GenerateAttribute( mSPLDef, lFileHandle, "Title", szIndentation, szValue )
   //:      szValue = mSPLDef.SPLD_DirectionsForUseStatement.wkDisplayText     // We'll use wkDisplayText because it includes inserted characters.
   //:      GenerateAttribute( mSPLDef, lFileHandle, "Text", szIndentation, szValue )
   //:      szOutputLine = "            </SPLD_DirectionsForUseStatement>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:   END
   //:   // <SPLD_DirectionsUsageOrdering>
   //:   FOR EACH mSPLDef.SPLD_DirectionsUsageOrdering
   //:      szOutputLine = "         <SPLD_DirectionsUsageOrdering>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:      szIndentation = "            "
   //:      szValue = mSPLDef.SPLD_DirectionsUsageOrdering.wSortOrder
   //:      GenerateAttribute( mSPLDef, lFileHandle, "wSortOrder", szIndentation, szValue )
   //:      // <SPLD_DirectionsUsageOrdering>
   //:      szOutputLine = "            <SPLD_DirectionsUsage>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:      szIndentation = "               "
   //:      szValue = mSPLDef.SPLD_DirectionsUsage.UsageType
   //:      GenerateAttribute( mSPLDef, lFileHandle, "UsageType", szIndentation, szValue )
   //:      szValue = mSPLDef.SPLD_DirectionsUsage.Name
   //:      GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue )
   //:      szOutputLine = "            </SPLD_DirectionsUsage>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:      szOutputLine = "         </SPLD_DirectionsUsageOrdering>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:   END
   //:   szOutputLine = "         </SPLD_DirectionsForUseSection>"
   //:   GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:END
   //:// <SPLD_MarketingSection>
   //:FOR EACH mSPLDef.SPLD_MarketingSection
   //:   // The Marketing Section name includes the Sequence Number to get uniqueness
   //:   szSectionName = mSPLDef.SPLD_MarketingSection.wXML_MarketingName
   //:   szOutputLine = "         <" + szSectionName + ">"
   //:   GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:   szIndentation = "            "
   //:   szValue = mSPLDef.SPLD_MarketingSection.Title
   //:   GenerateAttribute( mSPLDef, lFileHandle, "Title", szIndentation, szValue )
   //:   // <SPLD_MarketingStatement>
   //:   FOR EACH mSPLDef.SPLD_MarketingStatement
   //:      szOutputLine = "            <SPLD_MarketingStatement>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:      szIndentation = "               "
   //:      szValue = mSPLDef.SPLD_MarketingStatement.Title
   //:      GenerateAttribute( mSPLDef, lFileHandle, "Title", szIndentation, szValue )
   //:      szValue = mSPLDef.SPLD_MarketingStatement.wkDisplayText     // We'll use wkDisplayText because it includes inserted characters.
   //:      GenerateAttribute( mSPLDef, lFileHandle, "Text", szIndentation, szValue )
   //:      szOutputLine = "            </SPLD_MarketingStatement>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:   END
   //:   // <SPLD_DirectionsUsageOrdering>
   //:   FOR EACH mSPLDef.SPLD_DirectionsUsageOrdering
   //:      szOutputLine = "         <SPLD_DirectionsUsageOrdering>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:      szIndentation = "               "
   //:      szValue = mSPLDef.SPLD_DirectionsUsageOrdering.wSortOrder
   //:      GenerateAttribute( mSPLDef, lFileHandle, "wSortOrder", szIndentation, szValue )
   //:      // <SPLD_DirectionsUsageOrdering>
   //:      szOutputLine = "            <SPLD_DirectionsUsage>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:      szIndentation = "               "
   //:      szValue = mSPLDef.SPLD_DirectionsUsage.UsageType
   //:      GenerateAttribute( mSPLDef, lFileHandle, "UsageType", szIndentation, szValue )
   //:      szValue = mSPLDef.SPLD_DirectionsUsage.Name
   //:      GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue )
   //:      szOutputLine = "            </SPLD_DirectionsUsage>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:      szOutputLine = "         </SPLD_DirectionsUsageOrdering>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:   END
   //:   // <DisplayUsageColumn1>
   //:   FOR EACH mSPLDef.DisplayUsageColumn1
   //:      szOutputLine = "            <DisplayUsageColumn1>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:      szIndentation = "               "
   //:      szValue = mSPLDef.DisplayUsageColumn1.Name
   //:      GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue )
   //:      szOutputLine = "            </DisplayUsageColumn1>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:   END
   //:   // <DisplayUsageColumn2>
   //:   FOR EACH mSPLDef.DisplayUsageColumn2
   //:      szOutputLine = "            <DisplayUsageColumn2>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:      szIndentation = "               "
   //:      szValue = mSPLDef.DisplayUsageColumn2.Name
   //:      GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue )
   //:      szOutputLine = "            </DisplayUsageColumn2>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:   END
   //:   // <DisplayUsageColumn3>
   //:   FOR EACH mSPLDef.DisplayUsageColumn3
   //:      szOutputLine = "            <DisplayUsageColumn3>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:      szIndentation = "               "
   //:      szValue = mSPLDef.DisplayUsageColumn3.Name
   //:      GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue )
   //:      szOutputLine = "            </DisplayUsageColumn3>"
   //:      GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:   END
   //:   szOutputLine = "         </" + szSectionName + ">"
   //:   GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   //:END*/

   //:// <DisplaySection>
   //:FOR EACH mSPLDef.DisplaySection
   RESULT = SetCursorFirstEntity( mSPLDef, "DisplaySection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:szSectionName = mSPLDef.DisplaySection.XML_SectionName
      {MutableInt mi_lTempInteger_13 = new MutableInt( lTempInteger_13 );
      StringBuilder sb_szSectionName;
      if ( szSectionName == null )
         sb_szSectionName = new StringBuilder( 32 );
      else
         sb_szSectionName = new StringBuilder( szSectionName );
             GetVariableFromAttribute( sb_szSectionName, mi_lTempInteger_13, 'S', 51, mSPLDef, "DisplaySection", "XML_SectionName", "", 0 );
      lTempInteger_13 = mi_lTempInteger_13.intValue( );
      szSectionName = sb_szSectionName.toString( );}
      //:szOutputLine = "         <" + szSectionName + ">"
       {StringBuilder sb_szOutputLine;
      if ( szOutputLine == null )
         sb_szOutputLine = new StringBuilder( 32 );
      else
         sb_szOutputLine = new StringBuilder( szOutputLine );
            ZeidonStringCopy( sb_szOutputLine, 1, 0, "         <", 1, 0, 5001 );
      szOutputLine = sb_szOutputLine.toString( );}
       {StringBuilder sb_szOutputLine;
      if ( szOutputLine == null )
         sb_szOutputLine = new StringBuilder( 32 );
      else
         sb_szOutputLine = new StringBuilder( szOutputLine );
            ZeidonStringConcat( sb_szOutputLine, 1, 0, szSectionName, 1, 0, 5001 );
      szOutputLine = sb_szOutputLine.toString( );}
       {StringBuilder sb_szOutputLine;
      if ( szOutputLine == null )
         sb_szOutputLine = new StringBuilder( 32 );
      else
         sb_szOutputLine = new StringBuilder( szOutputLine );
            ZeidonStringConcat( sb_szOutputLine, 1, 0, ">", 1, 0, 5001 );
      szOutputLine = sb_szOutputLine.toString( );}
      //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
      omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
      //:szIndentation = "            "
       {StringBuilder sb_szIndentation;
      if ( szIndentation == null )
         sb_szIndentation = new StringBuilder( 32 );
      else
         sb_szIndentation = new StringBuilder( szIndentation );
            ZeidonStringCopy( sb_szIndentation, 1, 0, "            ", 1, 0, 51 );
      szIndentation = sb_szIndentation.toString( );}
      //:szValue = mSPLDef.DisplaySection.Title
      {MutableInt mi_lTempInteger_14 = new MutableInt( lTempInteger_14 );
      StringBuilder sb_szValue;
      if ( szValue == null )
         sb_szValue = new StringBuilder( 32 );
      else
         sb_szValue = new StringBuilder( szValue );
             GetVariableFromAttribute( sb_szValue, mi_lTempInteger_14, 'S', 5001, mSPLDef, "DisplaySection", "Title", "", 0 );
      lTempInteger_14 = mi_lTempInteger_14.intValue( );
      szValue = sb_szValue.toString( );}
      //:GenerateAttribute( mSPLDef, lFileHandle, "Title", szIndentation, szValue )
      omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "Title", szIndentation, szValue );

      //:// <DisplayStatement>
      //:FOR EACH mSPLDef.DisplayStatement
      RESULT = SetCursorFirstEntity( mSPLDef, "DisplayStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:szStatementName = mSPLDef.DisplayStatement.XML_StatementName
         {MutableInt mi_lTempInteger_15 = new MutableInt( lTempInteger_15 );
         StringBuilder sb_szStatementName;
         if ( szStatementName == null )
            sb_szStatementName = new StringBuilder( 32 );
         else
            sb_szStatementName = new StringBuilder( szStatementName );
                   GetVariableFromAttribute( sb_szStatementName, mi_lTempInteger_15, 'S', 51, mSPLDef, "DisplayStatement", "XML_StatementName", "", 0 );
         lTempInteger_15 = mi_lTempInteger_15.intValue( );
         szStatementName = sb_szStatementName.toString( );}
         //:szOutputLine = "            <" + szStatementName + ">"
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringCopy( sb_szOutputLine, 1, 0, "            <", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringConcat( sb_szOutputLine, 1, 0, szStatementName, 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringConcat( sb_szOutputLine, 1, 0, ">", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
         //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
         omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
         //:szIndentation = "               "
          {StringBuilder sb_szIndentation;
         if ( szIndentation == null )
            sb_szIndentation = new StringBuilder( 32 );
         else
            sb_szIndentation = new StringBuilder( szIndentation );
                  ZeidonStringCopy( sb_szIndentation, 1, 0, "               ", 1, 0, 51 );
         szIndentation = sb_szIndentation.toString( );}
         //:szValue = mSPLDef.DisplayStatement.Title
         {MutableInt mi_lTempInteger_16 = new MutableInt( lTempInteger_16 );
         StringBuilder sb_szValue;
         if ( szValue == null )
            sb_szValue = new StringBuilder( 32 );
         else
            sb_szValue = new StringBuilder( szValue );
                   GetVariableFromAttribute( sb_szValue, mi_lTempInteger_16, 'S', 5001, mSPLDef, "DisplayStatement", "Title", "", 0 );
         lTempInteger_16 = mi_lTempInteger_16.intValue( );
         szValue = sb_szValue.toString( );}
         //:GenerateAttribute( mSPLDef, lFileHandle, "Title", szIndentation, szValue )
         omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "Title", szIndentation, szValue );
         //:szValue = mSPLDef.DisplayStatement.Text
         {MutableInt mi_lTempInteger_17 = new MutableInt( lTempInteger_17 );
         StringBuilder sb_szValue;
         if ( szValue == null )
            sb_szValue = new StringBuilder( 32 );
         else
            sb_szValue = new StringBuilder( szValue );
                   GetVariableFromAttribute( sb_szValue, mi_lTempInteger_17, 'S', 5001, mSPLDef, "DisplayStatement", "Text", "", 0 );
         lTempInteger_17 = mi_lTempInteger_17.intValue( );
         szValue = sb_szValue.toString( );}
         //:GenerateAttribute( mSPLDef, lFileHandle, "Text", szIndentation, szValue )
         omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "Text", szIndentation, szValue );
         //:szStatementName = mSPLDef.DisplayStatement.XML_StatementName
         {MutableInt mi_lTempInteger_18 = new MutableInt( lTempInteger_18 );
         StringBuilder sb_szStatementName;
         if ( szStatementName == null )
            sb_szStatementName = new StringBuilder( 32 );
         else
            sb_szStatementName = new StringBuilder( szStatementName );
                   GetVariableFromAttribute( sb_szStatementName, mi_lTempInteger_18, 'S', 51, mSPLDef, "DisplayStatement", "XML_StatementName", "", 0 );
         lTempInteger_18 = mi_lTempInteger_18.intValue( );
         szStatementName = sb_szStatementName.toString( );}
         //:szOutputLine = "            </" + szStatementName + ">"
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringCopy( sb_szOutputLine, 1, 0, "            </", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringConcat( sb_szOutputLine, 1, 0, szStatementName, 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringConcat( sb_szOutputLine, 1, 0, ">", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
         //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
         omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
         RESULT = SetCursorNextEntity( mSPLDef, "DisplayStatement", "" );
      } 

      //:END

      //:// <DisplayUsageColumn1>
      //:FOR EACH mSPLDef.DisplayUsageColumn1
      RESULT = SetCursorFirstEntity( mSPLDef, "DisplayUsageColumn1", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:szOutputLine = "            <DisplayUsageColumn1>"
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringCopy( sb_szOutputLine, 1, 0, "            <DisplayUsageColumn1>", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
         //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
         omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
         //:szIndentation = "               "
          {StringBuilder sb_szIndentation;
         if ( szIndentation == null )
            sb_szIndentation = new StringBuilder( 32 );
         else
            sb_szIndentation = new StringBuilder( szIndentation );
                  ZeidonStringCopy( sb_szIndentation, 1, 0, "               ", 1, 0, 51 );
         szIndentation = sb_szIndentation.toString( );}
         //:szValue = mSPLDef.DisplayUsageColumn1.Name
         {MutableInt mi_lTempInteger_19 = new MutableInt( lTempInteger_19 );
         StringBuilder sb_szValue;
         if ( szValue == null )
            sb_szValue = new StringBuilder( 32 );
         else
            sb_szValue = new StringBuilder( szValue );
                   GetVariableFromAttribute( sb_szValue, mi_lTempInteger_19, 'S', 5001, mSPLDef, "DisplayUsageColumn1", "Name", "", 0 );
         lTempInteger_19 = mi_lTempInteger_19.intValue( );
         szValue = sb_szValue.toString( );}
         //:GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue )
         omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue );
         //:szOutputLine = "            </DisplayUsageColumn1>"
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringCopy( sb_szOutputLine, 1, 0, "            </DisplayUsageColumn1>", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
         //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
         omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
         RESULT = SetCursorNextEntity( mSPLDef, "DisplayUsageColumn1", "" );
      } 

      //:END

      //:// <DisplayUsageColumn2>
      //:FOR EACH mSPLDef.DisplayUsageColumn2
      RESULT = SetCursorFirstEntity( mSPLDef, "DisplayUsageColumn2", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:szOutputLine = "            <DisplayUsageColumn2>"
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringCopy( sb_szOutputLine, 1, 0, "            <DisplayUsageColumn2>", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
         //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
         omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
         //:szIndentation = "               "
          {StringBuilder sb_szIndentation;
         if ( szIndentation == null )
            sb_szIndentation = new StringBuilder( 32 );
         else
            sb_szIndentation = new StringBuilder( szIndentation );
                  ZeidonStringCopy( sb_szIndentation, 1, 0, "               ", 1, 0, 51 );
         szIndentation = sb_szIndentation.toString( );}
         //:szValue = mSPLDef.DisplayUsageColumn2.Name
         {MutableInt mi_lTempInteger_20 = new MutableInt( lTempInteger_20 );
         StringBuilder sb_szValue;
         if ( szValue == null )
            sb_szValue = new StringBuilder( 32 );
         else
            sb_szValue = new StringBuilder( szValue );
                   GetVariableFromAttribute( sb_szValue, mi_lTempInteger_20, 'S', 5001, mSPLDef, "DisplayUsageColumn2", "Name", "", 0 );
         lTempInteger_20 = mi_lTempInteger_20.intValue( );
         szValue = sb_szValue.toString( );}
         //:GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue )
         omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue );
         //:szOutputLine = "            </DisplayUsageColumn2>"
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringCopy( sb_szOutputLine, 1, 0, "            </DisplayUsageColumn2>", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
         //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
         omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
         RESULT = SetCursorNextEntity( mSPLDef, "DisplayUsageColumn2", "" );
      } 

      //:END

      //:// <DisplayUsageColumn3>
      //:FOR EACH mSPLDef.DisplayUsageColumn3
      RESULT = SetCursorFirstEntity( mSPLDef, "DisplayUsageColumn3", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:szOutputLine = "            <DisplayUsageColumn3>"
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringCopy( sb_szOutputLine, 1, 0, "            <DisplayUsageColumn3>", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
         //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
         omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
         //:szIndentation = "               "
          {StringBuilder sb_szIndentation;
         if ( szIndentation == null )
            sb_szIndentation = new StringBuilder( 32 );
         else
            sb_szIndentation = new StringBuilder( szIndentation );
                  ZeidonStringCopy( sb_szIndentation, 1, 0, "               ", 1, 0, 51 );
         szIndentation = sb_szIndentation.toString( );}
         //:szValue = mSPLDef.DisplayUsageColumn3.Name
         {MutableInt mi_lTempInteger_21 = new MutableInt( lTempInteger_21 );
         StringBuilder sb_szValue;
         if ( szValue == null )
            sb_szValue = new StringBuilder( 32 );
         else
            sb_szValue = new StringBuilder( szValue );
                   GetVariableFromAttribute( sb_szValue, mi_lTempInteger_21, 'S', 5001, mSPLDef, "DisplayUsageColumn3", "Name", "", 0 );
         lTempInteger_21 = mi_lTempInteger_21.intValue( );
         szValue = sb_szValue.toString( );}
         //:GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue )
         omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "Name", szIndentation, szValue );
         //:szOutputLine = "            </DisplayUsageColumn3>"
          {StringBuilder sb_szOutputLine;
         if ( szOutputLine == null )
            sb_szOutputLine = new StringBuilder( 32 );
         else
            sb_szOutputLine = new StringBuilder( szOutputLine );
                  ZeidonStringCopy( sb_szOutputLine, 1, 0, "            </DisplayUsageColumn3>", 1, 0, 5001 );
         szOutputLine = sb_szOutputLine.toString( );}
         //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
         omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
         RESULT = SetCursorNextEntity( mSPLDef, "DisplayUsageColumn3", "" );
      } 

      //:END

      //:szOutputLine = "         </" + szSectionName + ">"
       {StringBuilder sb_szOutputLine;
      if ( szOutputLine == null )
         sb_szOutputLine = new StringBuilder( 32 );
      else
         sb_szOutputLine = new StringBuilder( szOutputLine );
            ZeidonStringCopy( sb_szOutputLine, 1, 0, "         </", 1, 0, 5001 );
      szOutputLine = sb_szOutputLine.toString( );}
       {StringBuilder sb_szOutputLine;
      if ( szOutputLine == null )
         sb_szOutputLine = new StringBuilder( 32 );
      else
         sb_szOutputLine = new StringBuilder( szOutputLine );
            ZeidonStringConcat( sb_szOutputLine, 1, 0, szSectionName, 1, 0, 5001 );
      szOutputLine = sb_szOutputLine.toString( );}
       {StringBuilder sb_szOutputLine;
      if ( szOutputLine == null )
         sb_szOutputLine = new StringBuilder( 32 );
      else
         sb_szOutputLine = new StringBuilder( szOutputLine );
            ZeidonStringConcat( sb_szOutputLine, 1, 0, ">", 1, 0, 5001 );
      szOutputLine = sb_szOutputLine.toString( );}
      //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
      omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
      RESULT = SetCursorNextEntity( mSPLDef, "DisplaySection", "" );
   } 

   //:END

   //:// <SPLD_HumanHazardSection>
   //:FOR EACH mSPLDef.SPLD_HumanHazardSection
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_HumanHazardSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:szOutputLine = "         <SPLD_HumanHazardSection>"
       {StringBuilder sb_szOutputLine;
      if ( szOutputLine == null )
         sb_szOutputLine = new StringBuilder( 32 );
      else
         sb_szOutputLine = new StringBuilder( szOutputLine );
            ZeidonStringCopy( sb_szOutputLine, 1, 0, "         <SPLD_HumanHazardSection>", 1, 0, 5001 );
      szOutputLine = sb_szOutputLine.toString( );}
      //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
      omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
      //:szIndentation = "            "
       {StringBuilder sb_szIndentation;
      if ( szIndentation == null )
         sb_szIndentation = new StringBuilder( 32 );
      else
         sb_szIndentation = new StringBuilder( szIndentation );
            ZeidonStringCopy( sb_szIndentation, 1, 0, "            ", 1, 0, 51 );
      szIndentation = sb_szIndentation.toString( );}
      //:szValue = mSPLDef.SPLD_HumanHazardSection.EPA_SignalWord
      {MutableInt mi_lTempInteger_22 = new MutableInt( lTempInteger_22 );
      StringBuilder sb_szValue;
      if ( szValue == null )
         sb_szValue = new StringBuilder( 32 );
      else
         sb_szValue = new StringBuilder( szValue );
             GetVariableFromAttribute( sb_szValue, mi_lTempInteger_22, 'S', 5001, mSPLDef, "SPLD_HumanHazardSection", "EPA_SignalWord", "", 0 );
      lTempInteger_22 = mi_lTempInteger_22.intValue( );
      szValue = sb_szValue.toString( );}
      //:GenerateAttribute( mSPLDef, lFileHandle, "EPA_SignalWord", szIndentation, szValue )
      omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "EPA_SignalWord", szIndentation, szValue );
      //:szValue = mSPLDef.SPLD_HumanHazardSection.EPA_ChildHazardWarning
      {MutableInt mi_lTempInteger_23 = new MutableInt( lTempInteger_23 );
      StringBuilder sb_szValue;
      if ( szValue == null )
         sb_szValue = new StringBuilder( 32 );
      else
         sb_szValue = new StringBuilder( szValue );
             GetVariableFromAttribute( sb_szValue, mi_lTempInteger_23, 'S', 5001, mSPLDef, "SPLD_HumanHazardSection", "EPA_ChildHazardWarning", "", 0 );
      lTempInteger_23 = mi_lTempInteger_23.intValue( );
      szValue = sb_szValue.toString( );}
      //:GenerateAttribute( mSPLDef, lFileHandle, "EPA_ChildHazardWarning", szIndentation, szValue )
      omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "EPA_ChildHazardWarning", szIndentation, szValue );
      //:szValue = mSPLDef.SPLD_HumanHazardSection.PrecautionaryStatement
      {MutableInt mi_lTempInteger_24 = new MutableInt( lTempInteger_24 );
      StringBuilder sb_szValue;
      if ( szValue == null )
         sb_szValue = new StringBuilder( 32 );
      else
         sb_szValue = new StringBuilder( szValue );
             GetVariableFromAttribute( sb_szValue, mi_lTempInteger_24, 'S', 5001, mSPLDef, "SPLD_HumanHazardSection", "PrecautionaryStatement", "", 0 );
      lTempInteger_24 = mi_lTempInteger_24.intValue( );
      szValue = sb_szValue.toString( );}
      //:GenerateAttribute( mSPLDef, lFileHandle, "PrecautionaryStatement", szIndentation, szValue )
      omSPLDef_GenerateAttribute( mSPLDef, lFileHandle, "PrecautionaryStatement", szIndentation, szValue );
      //:szOutputLine = "         </SPLD_HumanHazardSection>"
       {StringBuilder sb_szOutputLine;
      if ( szOutputLine == null )
         sb_szOutputLine = new StringBuilder( 32 );
      else
         sb_szOutputLine = new StringBuilder( szOutputLine );
            ZeidonStringCopy( sb_szOutputLine, 1, 0, "         </SPLD_HumanHazardSection>", 1, 0, 5001 );
      szOutputLine = sb_szOutputLine.toString( );}
      //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
      omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_HumanHazardSection", "" );
   } 

   //:END

   //:// Build Footer entries.
   //:szOutputLine = "      </SubregPhysicalLabelDef>"
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringCopy( sb_szOutputLine, 1, 0, "      </SubregPhysicalLabelDef>", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
   //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
   //:szOutputLine = "   </zOI>"
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringCopy( sb_szOutputLine, 1, 0, "   </zOI>", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
   //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );

   //:// Close the XML file.
   //:SysCloseFile( mSPLDef, lFileHandle, 0 )
   try
   {
       m_KZOEP1AA.SysCloseFile( mSPLDef, lFileHandle, null );
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   return( 0 );
// END
} 


//:LOCAL OPERATION
//:GenerateLine( VIEW mSPLDef BASED ON LOD mSPLDef,
//:              INTEGER lFileHandle,
//:              STRING ( 5000 ) szOutputLine )

//:   SHORT nRC
private int 
omSPLDef_GenerateLine( View     mSPLDef,
                       int      lFileHandle,
                       String   szOutputLine )
{
   int      nRC = 0;


   //:nRC = zSearchSubString( szOutputLine, "at a temperature of", "f", 1 )
   nRC = zSearchSubString( szOutputLine, "at a temperature of", "f", 1 );
   //:IF nRC >= 0   
   if ( nRC >= 0 )
   { 
      //:TraceLineS( "*** Line Before ConvertHtmlEntities: ", szOutputLine )
      TraceLineS( "*** Line Before ConvertHtmlEntities: ", szOutputLine );
   } 

   //:END
   //:ConvertHtmlEntities( szOutputLine )
   {
    ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
       m_ZGlobal1_Operation.ConvertHtmlEntities( sb_szOutputLine );
   szOutputLine = sb_szOutputLine.toString( );}
    // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
   }
   //:IF nRC >= 0   
   if ( nRC >= 0 )
   { 
      //:TraceLineS( "*** Line After ConvertHtmlEntities: ", szOutputLine )
      TraceLineS( "*** Line After ConvertHtmlEntities: ", szOutputLine );
   } 

   //:END
   //:SysWriteLine( mSPLDef, lFileHandle, szOutputLine )
   try
   {
       m_KZOEP1AA.SysWriteLine( mSPLDef, lFileHandle, szOutputLine );
   }
   catch ( Exception e )
   {
      throw ZeidonException.wrapException( e );
   }
   return( 0 );
// END
} 


//:LOCAL OPERATION
//:GenerateAttribute( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                   INTEGER lFileHandle,
//:                   STRING ( 32 )   szAttributeName,
//:                   STRING ( 50 )   szLeadingBlanks,
//:                   STRING ( 5000 ) szValue )

//:   STRING ( 5000 ) szOutputLine
private int 
omSPLDef_GenerateAttribute( View     mSPLDef,
                            int      lFileHandle,
                            String   szAttributeName,
                            String   szLeadingBlanks,
                            String   szValue )
{
   String   szOutputLine = null;


   //:// Format an XML line for an attribute value.
   //:szOutputLine = szLeadingBlanks + "<" + szAttributeName + ">" + szValue + "</" + szAttributeName + ">"
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringCopy( sb_szOutputLine, 1, 0, szLeadingBlanks, 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, "<", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, szAttributeName, 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, ">", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, szValue, 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, "</", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, szAttributeName, 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
    {StringBuilder sb_szOutputLine;
   if ( szOutputLine == null )
      sb_szOutputLine = new StringBuilder( 32 );
   else
      sb_szOutputLine = new StringBuilder( szOutputLine );
      ZeidonStringConcat( sb_szOutputLine, 1, 0, ">", 1, 0, 5001 );
   szOutputLine = sb_szOutputLine.toString( );}
   //:GenerateLine( mSPLDef, lFileHandle, szOutputLine )
   omSPLDef_GenerateLine( mSPLDef, lFileHandle, szOutputLine );
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
public int 
omSPLDef_ComputeTopPositions( View     mSPLDef )
{
   int      RESULT = 0;

   //:ComputeTopPositions( VIEW mSPLDef BASED ON LOD mSPLDef )

   //:// Calculate the Top position for each Block and SubBlock. SubBlock positions are relative
   //:// to the parent Block.
   //:// If the Top Position is specified, we'll use it. Otherwise, we'll use the last position of the
   //:// previous Block or SubBlock entry plus its Height.
   //:// FOR EACH mSPLDef.LLD_Page WITHIN mSPLDef.SubregPhysicalLabelDef
   //:FOR EACH mSPLDef.LLD_Page  // only do it within the current SPLD_LLD
   RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Page", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:FOR EACH mSPLDef.LLD_Panel
      RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Panel", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:ComputeTopPosRecursive( mSPLDef )
         omSPLDef_ComputeTopPosRecursive( mSPLDef );
         RESULT = SetCursorNextEntity( mSPLDef, "LLD_Panel", "" );
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "LLD_Page", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:OBJECT CONSTRAINT OPERATION
public int 
omSPLDef_ObjectConstraints( View     mSPLDef,
                            Integer   Event,
                            Integer   State )
{
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   String   szTempString_0 = null;

   //:ObjectConstraints( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:                SHORT Event,
   //:                SHORT State )

   //:CASE Event
   switch( Event )
   { 
      //:OF   zOCE_ACTIVATE:
      case zOCE_ACTIVATE :

         //:// Compute work position entries for SubBlocks and put them in position order.
         //:ComputeTopPositions( mSPLDef )
         omSPLDef_ComputeTopPositions( mSPLDef );
         //:FOR EACH mSPLDef.LLD_Page
         RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Page", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:FOR EACH mSPLDef.LLD_Panel
            RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Panel", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:FOR EACH mSPLDef.LLD_Block
               RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Block", "" );
               while ( RESULT > zCURSOR_UNCHANGED )
               { 
                  //:OrderEntityForView( mSPLDef, "LLD_SubBlock", "wComputedTopPosition A" )
                  OrderEntityForView( mSPLDef, "LLD_SubBlock", "wComputedTopPosition A" );
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

         //:// Make sure the new SPLD_UsageType subobject structure is used.
         //:IF mSPLDef.SPLD_UsageType DOES NOT EXIST
         lTempInteger_0 = CheckExistenceOfEntity( mSPLDef, "SPLD_UsageType" );
         if ( lTempInteger_0 != 0 )
         { 
            //:FOR EACH mSPLDef.SPLD_UsageDelete
            RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_UsageDelete", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:SET CURSOR FIRST mSPLDef.SPLD_UsageType WHERE mSPLDef.SPLD_UsageType.UsageType = mSPLDef.SPLD_UsageDelete.UsageType
               {StringBuilder sb_szTempString_0;
               if ( szTempString_0 == null )
                  sb_szTempString_0 = new StringBuilder( 32 );
               else
                  sb_szTempString_0 = new StringBuilder( szTempString_0 );
                               GetStringFromAttribute( sb_szTempString_0, mSPLDef, "SPLD_UsageDelete", "UsageType" );
               szTempString_0 = sb_szTempString_0.toString( );}
               RESULT = SetCursorFirstEntityByString( mSPLDef, "SPLD_UsageType", "UsageType", szTempString_0, "" );
               //:IF RESULT < zCURSOR_SET
               if ( RESULT < zCURSOR_SET )
               { 
                  //:CREATE ENTITY mSPLDef.SPLD_UsageType
                  RESULT = CreateEntity( mSPLDef, "SPLD_UsageType", zPOS_AFTER );
                  //:mSPLDef.SPLD_UsageType.UsageType = mSPLDef.SPLD_UsageDelete.UsageType
                  SetAttributeFromAttribute( mSPLDef, "SPLD_UsageType", "UsageType", mSPLDef, "SPLD_UsageDelete", "UsageType" );
               } 

               //:END
               //:CREATE ENTITY mSPLDef.SPLD_Usage
               RESULT = CreateEntity( mSPLDef, "SPLD_Usage", zPOS_AFTER );
               //:SetMatchingAttributesByName( mSPLDef, "SPLD_Usage", mSPLDef, "SPLD_UsageDelete", zSET_NULL )
               SetMatchingAttributesByName( mSPLDef, "SPLD_Usage", mSPLDef, "SPLD_UsageDelete", zSET_NULL );
               //:INCLUDE mSPLDef.S_Usage FROM mSPLDef.S_UsageDelete
               RESULT = IncludeSubobjectFromSubobject( mSPLDef, "S_Usage", mSPLDef, "S_UsageDelete", zPOS_AFTER );
               RESULT = SetCursorNextEntity( mSPLDef, "SPLD_UsageDelete", "" );
            } 

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


//:TRANSFORMATION OPERATION
public int 
omSPLDef_BuildUsageEntriesFrSLC( View     mSPLDef,
                                 View     SrcSLC )
{
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;
   int      lTempInteger_3 = 0;
   int      lTempInteger_4 = 0;
   int      lTempInteger_5 = 0;

   //:BuildUsageEntriesFrSLC( VIEW mSPLDef   BASED ON LOD mSPLDef,
   //:                     VIEW SrcSLC BASED ON LOD mSubLC )

   //:// Build the Usage, Directions For Use and Marketing subobject structures from the creating SrcSLC.

   //:// Delete current entries.
   //:FOR EACH mSPLDef.SPLD_UsageType
   RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_UsageType", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:DELETE ENTITY mSPLDef.SPLD_UsageType NONE
      RESULT = DeleteEntity( mSPLDef, "SPLD_UsageType", zREPOS_NONE );
      RESULT = SetCursorNextEntity( mSPLDef, "SPLD_UsageType", "" );
   } 

   //:END

   //:// Build Usage Entries (Surface, Application Type, Location (Area of Use), Organism Claim)
   //:FOR EACH SrcSLC.S_UsageType WITHIN SrcSLC.SubregLabelContent
   RESULT = SetCursorFirstEntity( SrcSLC, "S_UsageType", "SubregLabelContent" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY mSPLDef.SPLD_UsageType
      RESULT = CreateEntity( mSPLDef, "SPLD_UsageType", zPOS_AFTER );
      //:SetMatchingAttributesByName( mSPLDef, "SPLD_UsageType", SrcSLC, "S_UsageType", zSET_NULL )
      SetMatchingAttributesByName( mSPLDef, "SPLD_UsageType", SrcSLC, "S_UsageType", zSET_NULL );
      //:FOR EACH SrcSLC.S_Usage
      RESULT = SetCursorFirstEntity( SrcSLC, "S_Usage", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY mSPLDef.SPLD_Usage
         RESULT = CreateEntity( mSPLDef, "SPLD_Usage", zPOS_AFTER );
         //:SetMatchingAttributesByName( mSPLDef, "SPLD_Usage", SrcSLC, "S_Usage", zSET_NULL )
         SetMatchingAttributesByName( mSPLDef, "SPLD_Usage", SrcSLC, "S_Usage", zSET_NULL );
         //:INCLUDE mSPLDef.S_Usage FROM SrcSLC.S_Usage
         RESULT = IncludeSubobjectFromSubobject( mSPLDef, "S_Usage", SrcSLC, "S_Usage", zPOS_AFTER );
         RESULT = SetCursorNextEntity( SrcSLC, "S_Usage", "" );
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_UsageType", "SubregLabelContent" );
      //:END
   } 

   //:END

   //:// Build Directions For Use Usage Entries.
   //:FOR EACH SrcSLC.S_DirectionsForUseSection
   RESULT = SetCursorFirstEntity( SrcSLC, "S_DirectionsForUseSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST mSPLDef.S_DirectionsForUseSection WITHIN mSPLDef.SubregPhysicalLabelDef
      //:           WHERE mSPLDef.S_DirectionsForUseSection.ID = SrcSLC.S_DirectionsForUseSection.ID
      {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
             GetIntegerFromAttribute( mi_lTempInteger_0, SrcSLC, "S_DirectionsForUseSection", "ID" );
      lTempInteger_0 = mi_lTempInteger_0.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( mSPLDef, "S_DirectionsForUseSection", "ID", lTempInteger_0, "SubregPhysicalLabelDef" );
      //:FOR EACH SrcSLC.S_DirectionsForUseStatement
      RESULT = SetCursorFirstEntity( SrcSLC, "S_DirectionsForUseStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST mSPLDef.S_DirectionsForUseStatement WITHIN mSPLDef.SPLD_DirectionsForUseSection
         //:           WHERE mSPLDef.S_DirectionsForUseStatement.ID = SrcSLC.S_DirectionsForUseStatement.ID
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
                   GetIntegerFromAttribute( mi_lTempInteger_1, SrcSLC, "S_DirectionsForUseStatement", "ID" );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSPLDef, "S_DirectionsForUseStatement", "ID", lTempInteger_1, "SPLD_DirectionsForUseSection" );

         //:// Remove current entries.
         //:FOR EACH mSPLDef.SPLD_DirectionsUsageOrdering
         RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_DirectionsUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:DELETE ENTITY mSPLDef.SPLD_DirectionsUsageOrdering NONE
            RESULT = DeleteEntity( mSPLDef, "SPLD_DirectionsUsageOrdering", zREPOS_NONE );
            RESULT = SetCursorNextEntity( mSPLDef, "SPLD_DirectionsUsageOrdering", "" );
         } 

         //:END

         //:// Add entries from SLC.
         //:FOR EACH SrcSLC.S_DirectionsUsageOrdering
         RESULT = SetCursorFirstEntity( SrcSLC, "S_DirectionsUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST mSPLDef.S_Usage WITHIN mSPLDef.SubregPhysicalLabelDef
            //:           WHERE mSPLDef.S_Usage.ID = SrcSLC.S_DirectionsUsage.ID
            {MutableInt mi_lTempInteger_2 = new MutableInt( lTempInteger_2 );
                         GetIntegerFromAttribute( mi_lTempInteger_2, SrcSLC, "S_DirectionsUsage", "ID" );
            lTempInteger_2 = mi_lTempInteger_2.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mSPLDef, "S_Usage", "ID", lTempInteger_2, "SubregPhysicalLabelDef" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:CREATE ENTITY mSPLDef.SPLD_DirectionsUsageOrdering
               RESULT = CreateEntity( mSPLDef, "SPLD_DirectionsUsageOrdering", zPOS_AFTER );
               //:INCLUDE mSPLDef.SPLD_DirectionsUsage FROM mSPLDef.SPLD_Usage
               RESULT = IncludeSubobjectFromSubobject( mSPLDef, "SPLD_DirectionsUsage", mSPLDef, "SPLD_Usage", zPOS_AFTER );
            } 

            RESULT = SetCursorNextEntity( SrcSLC, "S_DirectionsUsageOrdering", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( SrcSLC, "S_DirectionsForUseStatement", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_DirectionsForUseSection", "" );
      //:END
   } 

   //:END

   //:// Build Marketing Entries.
   //:FOR EACH SrcSLC.S_MarketingSection
   RESULT = SetCursorFirstEntity( SrcSLC, "S_MarketingSection", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:SET CURSOR FIRST mSPLDef.S_MarketingSection WITHIN mSPLDef.SubregPhysicalLabelDef
      //:           WHERE mSPLDef.S_MarketingSection.ID = SrcSLC.S_MarketingSection.ID
      {MutableInt mi_lTempInteger_3 = new MutableInt( lTempInteger_3 );
             GetIntegerFromAttribute( mi_lTempInteger_3, SrcSLC, "S_MarketingSection", "ID" );
      lTempInteger_3 = mi_lTempInteger_3.intValue( );}
      RESULT = SetCursorFirstEntityByInteger( mSPLDef, "S_MarketingSection", "ID", lTempInteger_3, "SubregPhysicalLabelDef" );
      //:FOR EACH SrcSLC.S_MarketingStatement
      RESULT = SetCursorFirstEntity( SrcSLC, "S_MarketingStatement", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SET CURSOR FIRST mSPLDef.S_MarketingStatement WITHIN mSPLDef.SPLD_MarketingSection
         //:           WHERE mSPLDef.S_MarketingStatement.ID = SrcSLC.S_MarketingStatement.ID
         {MutableInt mi_lTempInteger_4 = new MutableInt( lTempInteger_4 );
                   GetIntegerFromAttribute( mi_lTempInteger_4, SrcSLC, "S_MarketingStatement", "ID" );
         lTempInteger_4 = mi_lTempInteger_4.intValue( );}
         RESULT = SetCursorFirstEntityByInteger( mSPLDef, "S_MarketingStatement", "ID", lTempInteger_4, "SPLD_MarketingSection" );

         //:// Remove current entries.
         //:FOR EACH mSPLDef.SPLD_MarketingUsageOrdering
         RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:DELETE ENTITY mSPLDef.SPLD_MarketingUsageOrdering NONE
            RESULT = DeleteEntity( mSPLDef, "SPLD_MarketingUsageOrdering", zREPOS_NONE );
            RESULT = SetCursorNextEntity( mSPLDef, "SPLD_MarketingUsageOrdering", "" );
         } 

         //:END

         //:// Add entries from SLC.
         //:FOR EACH SrcSLC.S_MarketingUsageOrdering
         RESULT = SetCursorFirstEntity( SrcSLC, "S_MarketingUsageOrdering", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:SET CURSOR FIRST mSPLDef.S_Usage WITHIN mSPLDef.SubregPhysicalLabelDef
            //:           WHERE mSPLDef.S_Usage.ID = SrcSLC.S_MarketingUsage.ID
            {MutableInt mi_lTempInteger_5 = new MutableInt( lTempInteger_5 );
                         GetIntegerFromAttribute( mi_lTempInteger_5, SrcSLC, "S_MarketingUsage", "ID" );
            lTempInteger_5 = mi_lTempInteger_5.intValue( );}
            RESULT = SetCursorFirstEntityByInteger( mSPLDef, "S_Usage", "ID", lTempInteger_5, "SubregPhysicalLabelDef" );
            //:IF RESULT >= zCURSOR_SET
            if ( RESULT >= zCURSOR_SET )
            { 
               //:CREATE ENTITY mSPLDef.SPLD_MarketingUsageOrdering
               RESULT = CreateEntity( mSPLDef, "SPLD_MarketingUsageOrdering", zPOS_AFTER );
               //:INCLUDE mSPLDef.SPLD_MarketingUsage FROM mSPLDef.SPLD_Usage
               RESULT = IncludeSubobjectFromSubobject( mSPLDef, "SPLD_MarketingUsage", mSPLDef, "SPLD_Usage", zPOS_AFTER );
            } 

            RESULT = SetCursorNextEntity( SrcSLC, "S_MarketingUsageOrdering", "" );
            //:END
         } 

         RESULT = SetCursorNextEntity( SrcSLC, "S_MarketingStatement", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_MarketingSection", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
public int 
omSPLDef_CheckAddKeywordEntry( View     mSPLDefBlock,
                               String   szSectionType,
                               String   szKeywordName )
{
   int      RESULT = 0;

   //:CheckAddKeywordEntry( VIEW mSPLDefBlock BASED ON LOD mSPLDef,
   //:                   STRING ( 50 ) szSectionType,
   //:                   STRING ( 50 ) szKeywordName )

   //:// Make sure that the entry for the SectionType passed in exists.
   //:SET CURSOR FIRST mSPLDefBlock.LLD_SpecialSectionAttribute WHERE mSPLDefBlock.LLD_SpecialSectionAttribute.Name = szSectionType
   RESULT = SetCursorFirstEntityByString( mSPLDefBlock, "LLD_SpecialSectionAttribute", "Name", szSectionType, "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:// TraceLineS( "CheckAddKeyordEntry adding SpecialSectionAttribute: ", szSectionType )
      //:SET CURSOR LAST mSPLDefBlock.LLD_SpecialSectionAttribute
      RESULT = SetCursorLastEntity( mSPLDefBlock, "LLD_SpecialSectionAttribute", "" );
      //:CREATE ENTITY mSPLDefBlock.LLD_SpecialSectionAttribute
      RESULT = CreateEntity( mSPLDefBlock, "LLD_SpecialSectionAttribute", zPOS_AFTER );
      //:mSPLDefBlock.LLD_SpecialSectionAttribute.Name = szSectionType
      SetAttributeFromString( mSPLDefBlock, "LLD_SpecialSectionAttribute", "Name", szSectionType );
      //:ELSE
   } 
   else
   { 
   } 

   //:// TraceLineS( "CheckAddKeyordEntry located SpecialSectionAttribute: ", szSectionType )
   //:END   

   //:// Make sure that the entry for the Keyword passed in exists.
   //:SET CURSOR FIRST mSPLDefBlock.LLD_SpecialSectionAttrBlock WHERE mSPLDefBlock.LLD_SpecialSectionAttrBlock.Name = szKeywordName
   RESULT = SetCursorFirstEntityByString( mSPLDefBlock, "LLD_SpecialSectionAttrBlock", "Name", szKeywordName, "" );
   //:IF RESULT < zCURSOR_SET
   if ( RESULT < zCURSOR_SET )
   { 
      //:// TraceLineS( "CheckAddKeyordEntry adding SpecialSectionAttrBlock: ", szKeywordName )
      //:SET CURSOR LAST mSPLDefBlock.LLD_SpecialSectionAttrBlock
      RESULT = SetCursorLastEntity( mSPLDefBlock, "LLD_SpecialSectionAttrBlock", "" );
      //:CREATE ENTITY mSPLDefBlock.LLD_SpecialSectionAttrBlock
      RESULT = CreateEntity( mSPLDefBlock, "LLD_SpecialSectionAttrBlock", zPOS_AFTER );
      //:mSPLDefBlock.LLD_SpecialSectionAttrBlock.Name = szKeywordName
      SetAttributeFromString( mSPLDefBlock, "LLD_SpecialSectionAttrBlock", "Name", szKeywordName );
      //:ELSE
   } 
   else
   { 
   } 

   //:// TraceLineS( "CheckAddKeyordEntry located SpecialSectionAttrBlock: ", szKeywordName )
   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
public int 
omSPLDef_SetUpKeywordEntries( View     mSPLDefBlock,
                              String   szSectionType )
{

   //:SetUpKeywordEntries( VIEW mSPLDefBlock BASED ON LOD mSPLDef,
   //:                  STRING ( 50 ) szSectionType )

   //:// Make sure that the appropriate Keyword entries are set up for a given Section/Block Type.
   //:IF szSectionType = "Marketing"
   if ( ZeidonStringCompare( szSectionType, 1, 0, "Marketing", 1, 0, 51 ) == 0 )
   { 
      //:// Marketing
      //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Title" )
      omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Title" );
      //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Text" )
      omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Text" );
      //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Column List" )
      omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Column List" );
      //:ELSE
   } 
   else
   { 
      //:IF szSectionType = "HumanHazard"
      if ( ZeidonStringCompare( szSectionType, 1, 0, "HumanHazard", 1, 0, 51 ) == 0 )
      { 
         //:// Human Hazard
         //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Hazards Warning" )
         omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Hazards Warning" );
         //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Hazards Signal Word" )
         omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Hazards Signal Word" );
         //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Hazards Precautionary" )
         omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Hazards Precautionary" );
         //:ELSE
      } 
      else
      { 
         //:IF szSectionType = "Ingredients"
         if ( ZeidonStringCompare( szSectionType, 1, 0, "Ingredients", 1, 0, 51 ) == 0 )
         { 
            //:// Ingredients
            //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Ingredients Title" )
            omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Ingredients Title" );
            //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Ingredients Items" )
            omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Ingredients Items" );
            //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Ingredients Inert" )
            omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Ingredients Inert" );
            //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Ingredients Total" )
            omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Ingredients Total" );
            //:ELSE
         } 
         else
         { 
            //:IF szSectionType = "DirectionsForUse" OR szSectionType = "FirstAid"
            if ( ZeidonStringCompare( szSectionType, 1, 0, "DirectionsForUse", 1, 0, 51 ) == 0 || ZeidonStringCompare( szSectionType, 1, 0, "FirstAid", 1, 0, 51 ) == 0 )
            { 
               //:// Directions For Use or First Aid
               //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Header" )
               omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Header" );
               //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Title" )
               omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Title" );
               //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Text" )
               omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Text" );
               //:ELSE
            } 
            else
            { 
               //:// Default
               //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Title" )
               omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Title" );
               //:CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Text" )
               omSPLDef_CheckAddKeywordEntry( mSPLDefBlock, szSectionType, "Text" );
            } 

            //:END
         } 

         //:END
      } 

      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:DERIVED ATTRIBUTE OPERATION
//:dColorName( VIEW mSPLDef BASED ON LOD mSPLDef,
//:            STRING ( 32 ) InternalEntityStructure,
//:            STRING ( 32 ) InternalAttribStructure,
//:            SHORT GetOrSetFlag )

//:   STRING ( 32 ) szName
public int 
omSPLDef_dColorName( View     mSPLDef,
                     String InternalEntityStructure,
                     String InternalAttribStructure,
                     Integer   GetOrSetFlag )
{
   String   szName = null;


   //:CASE GetOrSetFlag
   switch( GetOrSetFlag )
   { 
      //:OF   zDERIVED_GET:
      case zDERIVED_GET :

         //:GetStringFromAttribute( szName, mSPLDef, InternalEntityStructure, "Pantone" )
         {StringBuilder sb_szName;
         if ( szName == null )
            sb_szName = new StringBuilder( 32 );
         else
            sb_szName = new StringBuilder( szName );
                   GetStringFromAttribute( sb_szName, mSPLDef, InternalEntityStructure, "Pantone" );
         szName = sb_szName.toString( );}
         //:IF szName = ""
         if ( ZeidonStringCompare( szName, 1, 0, "", 1, 0, 33 ) == 0 )
         { 
            //:GetStringFromAttribute( szName, mSPLDef, InternalEntityStructure, "Name" )
            {StringBuilder sb_szName;
            if ( szName == null )
               sb_szName = new StringBuilder( 32 );
            else
               sb_szName = new StringBuilder( szName );
                         GetStringFromAttribute( sb_szName, mSPLDef, InternalEntityStructure, "Name" );
            szName = sb_szName.toString( );}
         } 

         //:END
         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szName )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szName );
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
   //:dCombinedContainerVol( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 256 ) szCombinedName
public int 
omSPLDef_dCombinedContainerVol( View     mSPLDef,
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
         //:/*    FOR EACH mSPLDef.SPLD_StorageDisposalDrivingConVol
         //:???         GetStringFromAttributeByContext( szContainerVolume, mSPLDef, "SPLD_StorageDisposalDrivingConVol", "ContainerVolume", "", 20 )
         //:IF szCombinedName = ""
         //:   szCombinedName = szContainerVolume
         //:ELSE
         //:   szCombinedName = szCombinedName + ", " + szContainerVolume
         //:END
         //:END
         //:*/

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szCombinedName )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szCombinedName );
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
   //:dSD_TitleText( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:            STRING ( 32 ) InternalEntityStructure,
   //:            STRING ( 32 ) InternalAttribStructure,
   //:            SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omSPLDef_dSD_TitleText( View     mSPLDef,
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
         //:szTitle = mSPLDef.SPLD_StorageDisposalStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szTitle;
         if ( szTitle == null )
            sb_szTitle = new StringBuilder( 32 );
         else
            sb_szTitle = new StringBuilder( szTitle );
                   GetVariableFromAttribute( sb_szTitle, mi_lTempInteger_0, 'S', 257, mSPLDef, "SPLD_StorageDisposalStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szTitle = sb_szTitle.toString( );}
         //:szStatementText = mSPLDef.SPLD_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_1, 'S', 2049, mSPLDef, "SPLD_StorageDisposalStatement", "Text", "", 0 );
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
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
   //:dSD_SubTitleText( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:               STRING ( 32 ) InternalEntityStructure,
   //:               STRING ( 32 ) InternalAttribStructure,
   //:               SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omSPLDef_dSD_SubTitleText( View     mSPLDef,
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
         //:szTitle = mSPLDef.SPLD_StorageDisposalSubStmt.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szTitle;
         if ( szTitle == null )
            sb_szTitle = new StringBuilder( 32 );
         else
            sb_szTitle = new StringBuilder( szTitle );
                   GetVariableFromAttribute( sb_szTitle, mi_lTempInteger_0, 'S', 257, mSPLDef, "SPLD_StorageDisposalSubStmt", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szTitle = sb_szTitle.toString( );}
         //:szStatementText = mSPLDef.SPLD_StorageDisposalSubStmt.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_1, 'S', 2049, mSPLDef, "SPLD_StorageDisposalSubStmt", "Text", "", 0 );
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
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
   //:dDU_KeywordText( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:              STRING ( 32 ) InternalEntityStructure,
   //:              STRING ( 32 ) InternalAttribStructure,
   //:              SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szKeyValue
public int 
omSPLDef_dDU_KeywordText( View     mSPLDef,
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
         //:FOR EACH mSPLDef.SPLD_InsertTextDU
         RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_InsertTextDU", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF szKeyValue = ""
            if ( ZeidonStringCompare( szKeyValue, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szKeyValue = mSPLDef.SPLD_InsertTextDU.Text
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szKeyValue;
               if ( szKeyValue == null )
                  sb_szKeyValue = new StringBuilder( 32 );
               else
                  sb_szKeyValue = new StringBuilder( szKeyValue );
                               GetVariableFromAttribute( sb_szKeyValue, mi_lTempInteger_0, 'S', 2049, mSPLDef, "SPLD_InsertTextDU", "Text", "", 0 );
               lTempInteger_0 = mi_lTempInteger_0.intValue( );
               szKeyValue = sb_szKeyValue.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szKeyValue = szKeyValue + ", " + mSPLDef.SPLD_InsertTextDU.Text
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
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 4097, mSPLDef, "SPLD_InsertTextDU", "Text", "", 0 );
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

            RESULT = SetCursorNextEntity( mSPLDef, "SPLD_InsertTextDU", "" );
            //:END
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szKeyValue )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szKeyValue );
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
   //:dDU_StmtTitleTxtKey( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:                  STRING ( 32 ) InternalEntityStructure,
   //:                  STRING ( 32 ) InternalAttribStructure,
   //:                  SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omSPLDef_dDU_StmtTitleTxtKey( View     mSPLDef,
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
         //:szStatementText = mSPLDef.SPLD_DirectionsForUseStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mSPLDef, "SPLD_DirectionsForUseStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szStatementText,
            //:                            "SPLD_InsertTextKeywordDU", "SPLD_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szStatementText, "SPLD_InsertTextKeywordDU", "SPLD_InsertTextDU", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:szStatementTitle = mSPLDef.SPLD_DirectionsForUseStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_1, 'S', 257, mSPLDef, "SPLD_DirectionsForUseStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szStatementTitle,
            //:                            "SPLD_InsertTextKeywordDU", "SPLD_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szStatementTitle, "SPLD_InsertTextKeywordDU", "SPLD_InsertTextDU", ", " );
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
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
//:dDU_SubStmtTitleText( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                      STRING ( 32 ) InternalEntityStructure,
//:                      STRING ( 32 ) InternalAttribStructure,
//:                      SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omSPLDef_dDU_SubStmtTitleText( View     mSPLDef,
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
         //:szTitle = mSPLDef.SPLD_DirectionsForUseSubStmt.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szTitle;
         if ( szTitle == null )
            sb_szTitle = new StringBuilder( 32 );
         else
            sb_szTitle = new StringBuilder( szTitle );
                   GetVariableFromAttribute( sb_szTitle, mi_lTempInteger_0, 'S', 257, mSPLDef, "SPLD_DirectionsForUseSubStmt", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szTitle = sb_szTitle.toString( );}
         //:szStatementText = mSPLDef.SPLD_DirectionsForUseSubStmt.Text
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_1, 'S', 2049, mSPLDef, "SPLD_DirectionsForUseSubStmt", "Text", "", 0 );
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
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
   //:dDU_SubStmtTitleTxtKey( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:                     STRING ( 32 ) InternalEntityStructure,
   //:                     STRING ( 32 ) InternalAttribStructure,
   //:                     SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omSPLDef_dDU_SubStmtTitleTxtKey( View     mSPLDef,
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
         //:SetViewToSubobject( mSPLDef, "SPLD_DirectionsForUseSubStmt" )
         SetViewToSubobject( mSPLDef, "SPLD_DirectionsForUseSubStmt" );

         //:szStatementText = mSPLDef.SPLD_DirectionsForUseStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mSPLDef, "SPLD_DirectionsForUseStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szStatementText,
            //:                            "SPLD_InsertTextKeywordDU", "SPLD_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szStatementText, "SPLD_InsertTextKeywordDU", "SPLD_InsertTextDU", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:szStatementTitle = mSPLDef.SPLD_DirectionsForUseStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_1, 'S', 257, mSPLDef, "SPLD_DirectionsForUseStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szStatementTitle,
            //:                            "SPLD_InsertTextKeywordDU", "SPLD_InsertTextDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szStatementTitle, "SPLD_InsertTextKeywordDU", "SPLD_InsertTextDU", ", " );
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

         //:ResetViewFromSubobject( mSPLDef )
         ResetViewFromSubobject( mSPLDef );

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
//:dDU_SectionTitleKeyword( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                         STRING ( 32 ) InternalEntityStructure,
//:                         STRING ( 32 ) InternalAttribStructure,
//:                         SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omSPLDef_dDU_SectionTitleKeyword( View     mSPLDef,
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
         //:szDisplayStatement = mSPLDef.SPLD_DirectionsForUseSection.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mSPLDef, "SPLD_DirectionsForUseSection", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}

         //:IF szDisplayStatement != ""
         if ( ZeidonStringCompare( szDisplayStatement, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szDisplayStatement,
            //:                            "SPLD_InsertTextKeywordSectionDU", "SPLD_InsertTextSectionDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szDisplayStatement, "SPLD_InsertTextKeywordSectionDU", "SPLD_InsertTextSectionDU", ", " );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
   //:dDU_SectionTextKeyword( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:                     STRING ( 32 ) InternalEntityStructure,
   //:                     STRING ( 32 ) InternalAttribStructure,
   //:                     SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omSPLDef_dDU_SectionTextKeyword( View     mSPLDef,
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
         //:szDisplayStatement = mSPLDef.SPLD_DirectionsForUseSection.Subtitle
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mSPLDef, "SPLD_DirectionsForUseSection", "Subtitle", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}

         //:IF szDisplayStatement != ""
         if ( ZeidonStringCompare( szDisplayStatement, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szDisplayStatement,
            //:                            "SPLD_InsertTextKeywordSectionDU", "SPLD_InsertTextSectionDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szDisplayStatement, "SPLD_InsertTextKeywordSectionDU", "SPLD_InsertTextSectionDU", ", " );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
   //:dDU_SectTitleOrTxtKey( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:                    STRING ( 32 ) InternalEntityStructure,
   //:                    STRING ( 32 ) InternalAttribStructure,
   //:                    SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szDisplayStatement
public int 
omSPLDef_dDU_SectTitleOrTxtKey( View     mSPLDef,
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
         //:szDisplayStatement = mSPLDef.SPLD_DirectionsForUseSection.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szDisplayStatement;
         if ( szDisplayStatement == null )
            sb_szDisplayStatement = new StringBuilder( 32 );
         else
            sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                   GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_0, 'S', 2049, mSPLDef, "SPLD_DirectionsForUseSection", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szDisplayStatement = sb_szDisplayStatement.toString( );}
         //:IF szDisplayStatement = ""
         if ( ZeidonStringCompare( szDisplayStatement, 1, 0, "", 1, 0, 2049 ) == 0 )
         { 
            //:szDisplayStatement = mSPLDef.SPLD_DirectionsForUseSection.Subtitle
            {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
            StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         GetVariableFromAttribute( sb_szDisplayStatement, mi_lTempInteger_1, 'S', 2049, mSPLDef, "SPLD_DirectionsForUseSection", "Subtitle", "", 0 );
            lTempInteger_1 = mi_lTempInteger_1.intValue( );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
         } 

         //:END

         //:IF szDisplayStatement != ""
         if ( ZeidonStringCompare( szDisplayStatement, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szDisplayStatement,
            //:                            "SPLD_InsertTextKeywordSectionDU", "SPLD_InsertTextSectionDU", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szDisplayStatement;
            if ( szDisplayStatement == null )
               sb_szDisplayStatement = new StringBuilder( 32 );
            else
               sb_szDisplayStatement = new StringBuilder( szDisplayStatement );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szDisplayStatement, "SPLD_InsertTextKeywordSectionDU", "SPLD_InsertTextSectionDU", ", " );
            szDisplayStatement = sb_szDisplayStatement.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
   //:dSD_StmtTitleKey( VIEW mSPLDef BASED ON LOD mSPLDef,
   //:               STRING ( 32 ) InternalEntityStructure,
   //:               STRING ( 32 ) InternalAttribStructure,
   //:               SHORT GetOrSetFlag )

   //:STRING ( 2048 ) szStatementTitle
public int 
omSPLDef_dSD_StmtTitleKey( View     mSPLDef,
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
         //:szStatementTitle = mSPLDef.SPLD_StorageDisposalStatement.Title
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_0, 'S', 2049, mSPLDef, "SPLD_StorageDisposalStatement", "Title", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szStatementTitle,
            //:                            "SPLD_InsertTextKeywordSD", "SPLD_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szStatementTitle, "SPLD_InsertTextKeywordSD", "SPLD_InsertTextSD", ", " );
            szStatementTitle = sb_szStatementTitle.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szStatementTitle )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szStatementTitle );
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
//:dSD_StmtTextKey( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                 STRING ( 32 ) InternalEntityStructure,
//:                 STRING ( 32 ) InternalAttribStructure,
//:                 SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szStatementText
public int 
omSPLDef_dSD_StmtTextKey( View     mSPLDef,
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
         //:szStatementText = mSPLDef.SPLD_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mSPLDef, "SPLD_StorageDisposalStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szStatementText,
            //:                            "SPLD_InsertTextKeywordSD", "SPLD_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szStatementText, "SPLD_InsertTextKeywordSD", "SPLD_InsertTextSD", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szStatementText )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szStatementText );
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
//:dSD_StmtTitleTxtKey( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                     STRING ( 32 ) InternalEntityStructure,
//:                     STRING ( 32 ) InternalAttribStructure,
//:                     SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omSPLDef_dSD_StmtTitleTxtKey( View     mSPLDef,
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
         //:szStatementText = mSPLDef.SPLD_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mSPLDef, "SPLD_StorageDisposalStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szStatementText,
            //:                            "SPLD_InsertTextKeywordSD", "SPLD_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szStatementText, "SPLD_InsertTextKeywordSD", "SPLD_InsertTextSD", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:szStatementTitle = mSPLDef.SPLD_StorageDisposalStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_1, 'S', 257, mSPLDef, "SPLD_StorageDisposalStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szStatementTitle,
            //:                            "SPLD_InsertTextKeywordSD", "SPLD_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szStatementTitle, "SPLD_InsertTextKeywordSD", "SPLD_InsertTextSD", ", " );
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
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
//:dSD_SubStmtTitleTxtKey( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                        STRING ( 32 ) InternalEntityStructure,
//:                        STRING ( 32 ) InternalAttribStructure,
//:                        SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szDisplayStatement
public int 
omSPLDef_dSD_SubStmtTitleTxtKey( View     mSPLDef,
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
         //:SetViewToSubobject( mSPLDef, "SPLD_StorageDisposalSubStmt" )
         SetViewToSubobject( mSPLDef, "SPLD_StorageDisposalSubStmt" );
         //:szStatementText = mSPLDef.SPLD_StorageDisposalStatement.Text
         {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
         StringBuilder sb_szStatementText;
         if ( szStatementText == null )
            sb_szStatementText = new StringBuilder( 32 );
         else
            sb_szStatementText = new StringBuilder( szStatementText );
                   GetVariableFromAttribute( sb_szStatementText, mi_lTempInteger_0, 'S', 2049, mSPLDef, "SPLD_StorageDisposalStatement", "Text", "", 0 );
         lTempInteger_0 = mi_lTempInteger_0.intValue( );
         szStatementText = sb_szStatementText.toString( );}
         //:IF szStatementText != ""
         if ( ZeidonStringCompare( szStatementText, 1, 0, "", 1, 0, 2049 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szStatementText,
            //:                            "SPLD_InsertTextKeywordSD", "SPLD_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szStatementText;
            if ( szStatementText == null )
               sb_szStatementText = new StringBuilder( 32 );
            else
               sb_szStatementText = new StringBuilder( szStatementText );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szStatementText, "SPLD_InsertTextKeywordSD", "SPLD_InsertTextSD", ", " );
            szStatementText = sb_szStatementText.toString( );}
             // m_ZGlobal1_Operation = null;  // permit gc  (unnecessary)
            }
         } 

         //:END

         //:szStatementTitle = mSPLDef.SPLD_StorageDisposalStatement.Title
         {MutableInt mi_lTempInteger_1 = new MutableInt( lTempInteger_1 );
         StringBuilder sb_szStatementTitle;
         if ( szStatementTitle == null )
            sb_szStatementTitle = new StringBuilder( 32 );
         else
            sb_szStatementTitle = new StringBuilder( szStatementTitle );
                   GetVariableFromAttribute( sb_szStatementTitle, mi_lTempInteger_1, 'S', 257, mSPLDef, "SPLD_StorageDisposalStatement", "Title", "", 0 );
         lTempInteger_1 = mi_lTempInteger_1.intValue( );
         szStatementTitle = sb_szStatementTitle.toString( );}
         //:IF szStatementTitle != ""
         if ( ZeidonStringCompare( szStatementTitle, 1, 0, "", 1, 0, 257 ) != 0 )
         { 
            //:GenerateKeywordTextIntoString( mSPLDef, szStatementTitle,
            //:                            "SPLD_InsertTextKeywordSD", "SPLD_InsertTextSD", ", " )
            {
             ZGlobal1_Operation m_ZGlobal1_Operation = new ZGlobal1_Operation( mSPLDef );
             {StringBuilder sb_szStatementTitle;
            if ( szStatementTitle == null )
               sb_szStatementTitle = new StringBuilder( 32 );
            else
               sb_szStatementTitle = new StringBuilder( szStatementTitle );
                         m_ZGlobal1_Operation.GenerateKeywordTextIntoString( mSPLDef, sb_szStatementTitle, "SPLD_InsertTextKeywordSD", "SPLD_InsertTextSD", ", " );
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

         //:ResetViewFromSubobject( mSPLDef )
         ResetViewFromSubobject( mSPLDef );

         //:// Store the calculated value in the object.
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szDisplayStatement );
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
//:dSD_KeywordText( VIEW mSPLDef BASED ON LOD mSPLDef,
//:                 STRING ( 32 ) InternalEntityStructure,
//:                 STRING ( 32 ) InternalAttribStructure,
//:                 SHORT GetOrSetFlag )

//:   STRING ( 2048 ) szGeneratedString
public int 
omSPLDef_dSD_KeywordText( View     mSPLDef,
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
         //:FOR EACH mSPLDef.SPLD_InsertTextSD
         RESULT = SetCursorFirstEntity( mSPLDef, "SPLD_InsertTextSD", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:IF szGeneratedString = ""
            if ( ZeidonStringCompare( szGeneratedString, 1, 0, "", 1, 0, 2049 ) == 0 )
            { 
               //:szGeneratedString = mSPLDef.SPLD_InsertTextSD.Text
               {MutableInt mi_lTempInteger_0 = new MutableInt( lTempInteger_0 );
               StringBuilder sb_szGeneratedString;
               if ( szGeneratedString == null )
                  sb_szGeneratedString = new StringBuilder( 32 );
               else
                  sb_szGeneratedString = new StringBuilder( szGeneratedString );
                               GetVariableFromAttribute( sb_szGeneratedString, mi_lTempInteger_0, 'S', 2049, mSPLDef, "SPLD_InsertTextSD", "Text", "", 0 );
               lTempInteger_0 = mi_lTempInteger_0.intValue( );
               szGeneratedString = sb_szGeneratedString.toString( );}
               //:ELSE
            } 
            else
            { 
               //:szGeneratedString = szGeneratedString + ", " + mSPLDef.SPLD_InsertTextSD.Text
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
                               GetVariableFromAttribute( sb_szTempString_0, mi_lTempInteger_1, 'S', 4097, mSPLDef, "SPLD_InsertTextSD", "Text", "", 0 );
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

            RESULT = SetCursorNextEntity( mSPLDef, "SPLD_InsertTextSD", "" );
            //:END
         } 

         //:END

         //:// Store the resulting value in the object.
         //:StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szGeneratedString )
         StoreStringInRecord( mSPLDef, InternalEntityStructure, InternalAttribStructure, szGeneratedString );
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
omSPLDef_BuildSPLD_FromSPLD( View     NewSPLD,
                             View     SourceSPLD,
                             View     ParentSLC )
{
   int      RESULT = 0;
   int      lTempInteger_0 = 0;
   int      lTempInteger_1 = 0;
   int      lTempInteger_2 = 0;

   //:BuildSPLD_FromSPLD( VIEW NewSPLD    BASED ON LOD mSPLDef,
   //:                 VIEW SourceSPLD BASED ON LOD mSPLDef,
   //:                 VIEW ParentSLC  BASED ON LOD mSubLC )

   //:// Build a new SPLD from a previous SPLD.
   //:// Most of the component construction is the same as that in BuildSPLD_FromSLC. Only the LLD subobject is different.
   //:// So, reuse the BuildSPLD_FromSLC operation, then reuse the code for building an LLD section.

   //:BuildSPLD_FromSLC( NewSPLD, ParentSLC )
   omSPLDef_BuildSPLD_FromSLC( NewSPLD, ParentSLC );

   //:// Copy the SPLD_LLD subobject.
   //:CREATE ENTITY NewSPLD.SPLD_LLD
   RESULT = CreateEntity( NewSPLD, "SPLD_LLD", zPOS_AFTER );
   //:SetMatchingAttributesByName( NewSPLD, "S_HumanHazardSection", SourceSPLD, "S_HumanHazardSection", zSET_NULL )
   SetMatchingAttributesByName( NewSPLD, "S_HumanHazardSection", SourceSPLD, "S_HumanHazardSection", zSET_NULL );
   //:FOR EACH SourceSPLD.LLD_Page
   RESULT = SetCursorFirstEntity( SourceSPLD, "LLD_Page", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:CREATE ENTITY NewSPLD.LLD_Page
      RESULT = CreateEntity( NewSPLD, "LLD_Page", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "LLD_Page", SourceSPLD, "LLD_Page", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "LLD_Page", SourceSPLD, "LLD_Page", zSET_NULL );
      //:IF SourceSPLD.PageBackgroundColor EXISTS
      lTempInteger_0 = CheckExistenceOfEntity( SourceSPLD, "PageBackgroundColor" );
      if ( lTempInteger_0 == 0 )
      { 
         //:INCLUDE NewSPLD.PageBackgroundColor FROM SourceSPLD.PageBackgroundColor
         RESULT = IncludeSubobjectFromSubobject( NewSPLD, "PageBackgroundColor", SourceSPLD, "PageBackgroundColor", zPOS_AFTER );
      } 

      //:END
      //:FOR EACH SourceSPLD.LLD_Panel
      RESULT = SetCursorFirstEntity( SourceSPLD, "LLD_Panel", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:CREATE ENTITY NewSPLD.LLD_Panel
         RESULT = CreateEntity( NewSPLD, "LLD_Panel", zPOS_AFTER );
         //:SetMatchingAttributesByName( NewSPLD, "LLD_Panel", SourceSPLD, "LLD_Panel", zSET_NULL )
         SetMatchingAttributesByName( NewSPLD, "LLD_Panel", SourceSPLD, "LLD_Panel", zSET_NULL );
         //:IF SourceSPLD.PanelBackgroundColor EXISTS
         lTempInteger_1 = CheckExistenceOfEntity( SourceSPLD, "PanelBackgroundColor" );
         if ( lTempInteger_1 == 0 )
         { 
            //:INCLUDE NewSPLD.PanelBackgroundColor FROM SourceSPLD.PanelBackgroundColor
            RESULT = IncludeSubobjectFromSubobject( NewSPLD, "PanelBackgroundColor", SourceSPLD, "PanelBackgroundColor", zPOS_AFTER );
         } 

         //:END
         //:IF SourceSPLD.PanelBorderColor EXISTS
         lTempInteger_2 = CheckExistenceOfEntity( SourceSPLD, "PanelBorderColor" );
         if ( lTempInteger_2 == 0 )
         { 
            //:INCLUDE NewSPLD.PanelBorderColor FROM SourceSPLD.PanelBorderColor
            RESULT = IncludeSubobjectFromSubobject( NewSPLD, "PanelBorderColor", SourceSPLD, "PanelBorderColor", zPOS_AFTER );
         } 

         //:END
         //:FOR EACH SourceSPLD.LLD_Block
         RESULT = SetCursorFirstEntity( SourceSPLD, "LLD_Block", "" );
         while ( RESULT > zCURSOR_UNCHANGED )
         { 
            //:// Use recursive routine to duplicate Block.
            //:DuplicateSPLD_Block( NewSPLD, SourceSPLD )
            omSPLDef_DuplicateSPLD_Block( NewSPLD, SourceSPLD );
            RESULT = SetCursorNextEntity( SourceSPLD, "LLD_Block", "" );
         } 

         RESULT = SetCursorNextEntity( SourceSPLD, "LLD_Panel", "" );
         //:END
      } 

      RESULT = SetCursorNextEntity( SourceSPLD, "LLD_Page", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
//:ComputeTopPosRecursive( VIEW mSPLDef BASED ON LOD mSPLDef )

//:   DECIMAL LastBlockTopPosition
public int 
omSPLDef_ComputeTopPosRecursive( View     mSPLDef )
{
   double  LastBlockTopPosition = 0.0;
   int      RESULT = 0;
   double  dTempDecimal_0 = 0.0;
   double  dTempDecimal_1 = 0.0;
   double  dTempDecimal_2 = 0.0;


   //:LastBlockTopPosition = 0
   LastBlockTopPosition = 0;
   //:FOR EACH mSPLDef.LLD_Block
   RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Block", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:IF mSPLDef.LLD_Block.Top != ""
      if ( CompareAttributeToString( mSPLDef, "LLD_Block", "Top", "" ) != 0 )
      { 
         //:mSPLDef.LLD_Block.wComputedTopPosition = mSPLDef.LLD_Block.Top
         SetAttributeFromAttribute( mSPLDef, "LLD_Block", "wComputedTopPosition", mSPLDef, "LLD_Block", "Top" );
         //:LastBlockTopPosition = mSPLDef.LLD_Block.Top + mSPLDef.LLD_Block.Height
         {MutableDouble md_dTempDecimal_0 = new MutableDouble( dTempDecimal_0 );
                   GetDecimalFromAttribute( md_dTempDecimal_0, mSPLDef, "LLD_Block", "Top" );
         dTempDecimal_0 = md_dTempDecimal_0.doubleValue( );}
         {MutableDouble md_dTempDecimal_1 = new MutableDouble( dTempDecimal_1 );
                   GetDecimalFromAttribute( md_dTempDecimal_1, mSPLDef, "LLD_Block", "Height" );
         dTempDecimal_1 = md_dTempDecimal_1.doubleValue( );}
         LastBlockTopPosition = dTempDecimal_0 + dTempDecimal_1;
         //:ELSE
      } 
      else
      { 
         //:mSPLDef.LLD_Block.wComputedTopPosition = LastBlockTopPosition
         SetAttributeFromDecimal( mSPLDef, "LLD_Block", "wComputedTopPosition", LastBlockTopPosition );
         //:LastBlockTopPosition = LastBlockTopPosition + mSPLDef.LLD_Block.Height
         {MutableDouble md_dTempDecimal_2 = new MutableDouble( dTempDecimal_2 );
                   GetDecimalFromAttribute( md_dTempDecimal_2, mSPLDef, "LLD_Block", "Height" );
         dTempDecimal_2 = md_dTempDecimal_2.doubleValue( );}
         LastBlockTopPosition = LastBlockTopPosition + dTempDecimal_2;
      } 

      //:END
      //:FOR EACH mSPLDef.LLD_SubBlock
      RESULT = SetCursorFirstEntity( mSPLDef, "LLD_SubBlock", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SetViewToSubobject( mSPLDef, "LLD_SubBlock" )
         SetViewToSubobject( mSPLDef, "LLD_SubBlock" );
         //:ComputeTopPosRecursive( mSPLDef )
         omSPLDef_ComputeTopPosRecursive( mSPLDef );
         //:ResetViewFromSubobject( mSPLDef )
         ResetViewFromSubobject( mSPLDef );
         RESULT = SetCursorNextEntity( mSPLDef, "LLD_SubBlock", "" );
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "LLD_Block", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
public int 
omSPLDef_TraverseBlockRecursive( View     mSPLDef )
{
   int      RESULT = 0;

   //:TraverseBlockRecursive( VIEW mSPLDef BASED ON LOD mSPLDef )

   //:FOR EACH mSPLDef.LLD_Block
   RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Block", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:mSPLDef.LLD_Block.wContinuedFromTag = ""
      SetAttributeFromString( mSPLDef, "LLD_Block", "wContinuedFromTag", "" );
      //:FOR EACH mSPLDef.LLD_SubBlock
      RESULT = SetCursorFirstEntity( mSPLDef, "LLD_SubBlock", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:SetViewToSubobject( mSPLDef, "LLD_SubBlock" )
         SetViewToSubobject( mSPLDef, "LLD_SubBlock" );
         //:TraverseBlockRecursive( mSPLDef )
         omSPLDef_TraverseBlockRecursive( mSPLDef );
         //:ResetViewFromSubobject( mSPLDef )
         ResetViewFromSubobject( mSPLDef );
         RESULT = SetCursorNextEntity( mSPLDef, "LLD_SubBlock", "" );
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "LLD_Block", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:TRANSFORMATION OPERATION
public int 
omSPLDef_TraverseBlocks( View     mSPLDef )
{
   int      RESULT = 0;

   //:TraverseBlocks( VIEW mSPLDef BASED ON LOD mSPLDef )

   //:// FOR EACH mSPLDef.LLD_Page WITHIN mSPLDef.SubregPhysicalLabelDef
   //:FOR EACH mSPLDef.LLD_Page  // only do it within the current SPLD_LLD
   RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Page", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:FOR EACH mSPLDef.LLD_Panel
      RESULT = SetCursorFirstEntity( mSPLDef, "LLD_Panel", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:TraverseBlockRecursive( mSPLDef )
         omSPLDef_TraverseBlockRecursive( mSPLDef );
         //:OrderEntityForView( mSPLDef, "LLD_Block", "Left A wComputedTopPosition A" )  // ContinuationBlockFlag D
         OrderEntityForView( mSPLDef, "LLD_Block", "Left A wComputedTopPosition A" );
         RESULT = SetCursorNextEntity( mSPLDef, "LLD_Panel", "" );
      } 

      RESULT = SetCursorNextEntity( mSPLDef, "LLD_Page", "" );
      //:END
   } 

   //:END
   return( 0 );
// END
} 


//:LOCAL OPERATION
//:CopyStorDispStmts( VIEW NewSPLD BASED ON LOD mSPLDef,
//:                   VIEW SrcSLC  BASED ON LOD mSubLC )
//:   SHORT nAllChanges
private int 
omSPLDef_CopyStorDispStmts( View     NewSPLD,
                            View     SrcSLC )
{
   int      nAllChanges = 0;
   //:SHORT nChanges
   int      nChanges = 0;
   //:SHORT nSubChanges
   int      nSubChanges = 0;
   //:SHORT nTemp
   int      nTemp = 0;
   int      RESULT = 0;
   String   szTempString_0 = null;
   int      lTempInteger_0 = 0;
   String   szTempString_1 = null;


   //:nAllChanges = 0
   nAllChanges = 0;
   //:FOR EACH SrcSLC.S_StorageDisposalStatement
   RESULT = SetCursorFirstEntity( SrcSLC, "S_StorageDisposalStatement", "" );
   while ( RESULT > zCURSOR_UNCHANGED )
   { 
      //:nChanges = 0
      nChanges = 0;
      //:nSubChanges = 0
      nSubChanges = 0;
      //:CREATE ENTITY NewSPLD.SPLD_StorageDisposalStatement
      RESULT = CreateEntity( NewSPLD, "SPLD_StorageDisposalStatement", zPOS_AFTER );
      //:SetMatchingAttributesByName( NewSPLD, "SPLD_StorageDisposalStatement", SrcSLC, "S_StorageDisposalStatement", zSET_NULL )
      SetMatchingAttributesByName( NewSPLD, "SPLD_StorageDisposalStatement", SrcSLC, "S_StorageDisposalStatement", zSET_NULL );
      //:INCLUDE NewSPLD.S_StorageDisposalStatement FROM SrcSLC.S_StorageDisposalStatement
      RESULT = IncludeSubobjectFromSubobject( NewSPLD, "S_StorageDisposalStatement", SrcSLC, "S_StorageDisposalStatement", zPOS_AFTER );
      //:TraceLineS( "Copy Storage/Disposal Statement: ", SrcSLC.S_StorageDisposalStatement.dSD_TitleText )
      {StringBuilder sb_szTempString_0;
      if ( szTempString_0 == null )
         sb_szTempString_0 = new StringBuilder( 32 );
      else
         sb_szTempString_0 = new StringBuilder( szTempString_0 );
             GetStringFromAttribute( sb_szTempString_0, SrcSLC, "S_StorageDisposalStatement", "dSD_TitleText" );
      szTempString_0 = sb_szTempString_0.toString( );}
      TraceLineS( "Copy Storage/Disposal Statement: ", szTempString_0 );
      //:FOR EACH SrcSLC.S_InsertTextKeywordSD
      RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextKeywordSD", "" );
      while ( RESULT > zCURSOR_UNCHANGED )
      { 
         //:IF SrcSLC.S_InsertTextKeywordSD.Selected = "Y"
         if ( CompareAttributeToString( SrcSLC, "S_InsertTextKeywordSD", "Selected", "Y" ) == 0 )
         { 
            //:nChanges = nChanges + 1
            nChanges = nChanges + 1;
            //:CREATE ENTITY NewSPLD.SPLD_InsertTextKeywordSD
            RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextKeywordSD", zPOS_AFTER );
            //:SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeywordSD", SrcSLC, "S_InsertTextKeywordSD", zSET_NULL )
            SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextKeywordSD", SrcSLC, "S_InsertTextKeywordSD", zSET_NULL );
            //:FOR EACH SrcSLC.S_InsertTextSD
            RESULT = SetCursorFirstEntity( SrcSLC, "S_InsertTextSD", "" );
            while ( RESULT > zCURSOR_UNCHANGED )
            { 
               //:// IF SrcSLC.S_InsertTextSD.Selected = "Y"
               //:   CREATE ENTITY NewSPLD.SPLD_InsertTextSD
               RESULT = CreateEntity( NewSPLD, "SPLD_InsertTextSD", zPOS_AFTER );
               //:   SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextSD", SrcSLC, "S_InsertTextSD", zSET_NULL )
               SetMatchingAttributesByName( NewSPLD, "SPLD_InsertTextSD", SrcSLC, "S_InsertTextSD", zSET_NULL );
               RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextSD", "" );
            } 

            //:// END
            //:END
         } 

         RESULT = SetCursorNextEntity( SrcSLC, "S_InsertTextKeywordSD", "" );
         //:END
      } 

      //:END
      //:IF SrcSLC.S_StorageDisposalSubStatement EXISTS
      lTempInteger_0 = CheckExistenceOfEntity( SrcSLC, "S_StorageDisposalSubStatement" );
      if ( lTempInteger_0 == 0 )
      { 
         //:TraceLineS( "Copy Storage/Disposal SubStatement: ", SrcSLC.S_StorageDisposalSubStatement.dSD_SubTitleText )
         {StringBuilder sb_szTempString_1;
         if ( szTempString_1 == null )
            sb_szTempString_1 = new StringBuilder( 32 );
         else
            sb_szTempString_1 = new StringBuilder( szTempString_1 );
                   GetStringFromAttribute( sb_szTempString_1, SrcSLC, "S_StorageDisposalSubStatement", "dSD_SubTitleText" );
         szTempString_1 = sb_szTempString_1.toString( );}
         TraceLineS( "Copy Storage/Disposal SubStatement: ", szTempString_1 );
         //:DisplayEntityInstance( SrcSLC, "S_StorageDisposalSubStatement" )
         DisplayEntityInstance( SrcSLC, "S_StorageDisposalSubStatement" );
         //:SetViewToSubobject( SrcSLC, "S_StorageDisposalSubStatement" )
         SetViewToSubobject( SrcSLC, "S_StorageDisposalSubStatement" );
         //:SetViewToSubobject( NewSPLD, "SPLD_StorageDisposalSubStmt" )
         SetViewToSubobject( NewSPLD, "SPLD_StorageDisposalSubStmt" );
         //:nTemp = CopyStorDispStmts( NewSPLD, SrcSLC )
         nTemp = omSPLDef_CopyStorDispStmts( NewSPLD, SrcSLC );
         //:nSubChanges = nSubChanges + nTemp
         nSubChanges = nSubChanges + nTemp;
         //:ResetViewFromSubobject( NewSPLD )
         ResetViewFromSubobject( NewSPLD );
         //:ResetViewFromSubobject( SrcSLC )
         ResetViewFromSubobject( SrcSLC );
      } 

      //:END
      //:nChanges = nChanges + nSubChanges
      nChanges = nChanges + nSubChanges;
      //:IF nChanges = 0
      if ( nChanges == 0 )
      { 
         //:DELETE ENTITY NewSPLD.SPLD_StorageDisposalStatement LAST
         RESULT = DeleteEntity( NewSPLD, "SPLD_StorageDisposalStatement", zREPOS_LAST );
         //:ELSE
      } 
      else
      { 
         //:nAllChanges = nAllChanges + nChanges
         nAllChanges = nAllChanges + nChanges;
      } 

      RESULT = SetCursorNextEntity( SrcSLC, "S_StorageDisposalStatement", "" );
      //:END
   } 

   //:END
   //:RETURN nAllChanges
   return( nAllChanges );
// END
} 



}
