<!DOCTYPE HTML>

<%-- wSPLDSPLD_BlockSpecialFormatDef   Generate Timestamp: 20160620105929547 --%>

<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.lang3.*" %>
<%@ page import="com.quinsoft.zeidon.*" %>
<%@ page import="com.quinsoft.zeidon.standardoe.*" %>
<%@ page import="com.quinsoft.zeidon.utils.*" %>
<%@ page import="com.quinsoft.zeidon.vml.*" %>
<%@ page import="com.quinsoft.zeidon.domains.*" %>
<%@ page import="com.quinsoft.epamms.*" %>

<%! 

ObjectEngine objectEngine = com.quinsoft.epamms.ZeidonObjectEngineConfiguration.getObjectEngine();

public String ReplaceXSSValues( String szFieldValue )
{
   String szOutput;
   szOutput = szFieldValue.replace( "<","&lt;" );
   szOutput = szOutput.replace( ">", "&gt;" );
   szOutput = szOutput.replace( "\"", "&quot;" );
   szOutput = szOutput.replace( "\'", "&apos;" );
   return( szOutput );
}

public int DoInputMapping( HttpServletRequest request,
                           HttpSession session,
                           ServletContext application,
                           boolean webMapping )
{
   String taskId = (String) session.getAttribute( "ZeidonTaskId" );
   Task task = objectEngine.getTaskById( taskId );

   View mSPLDef = null;
   View mSPLDefBlock = null;
   View vGridTmp = null; // temp view to grid view
   View vRepeatingGrp = null; // temp view to repeating group view
   String strDateFormat = "";
   String strMapValue = "";
   int    iView = 0;
   long   lEntityKey = 0;
   String strEntityKey = "";
   long   lEntityKeyRG = 0;
   String strEntityKeyRG = "";
   String strTag = "";
   String strTemp = "";
   int    iTableRowCnt = 0;
   String strSuffix = "";
   int    nRelPos = 0;
   int    nRC = 0;
   CursorResult csrRC = null;
   int    nMapError = 1;

   if ( webMapping == false )
      session.setAttribute( "ZeidonError", null );

   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
   }

   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) )
   {
      // EditBox: MarginTop
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "MarginTop" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "MarginTop", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "MarginTop" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "MarginTop", e.getReason( ), strMapValue );
         }
      }

      // EditBox: MarginBottom
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "MarginBottom" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "MarginBottom", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "MarginBottom" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "MarginBottom", e.getReason( ), strMapValue );
         }
      }

      // EditBox: MarginLeft
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "MarginLeft" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "MarginLeft", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "MarginLeft" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "MarginLeft", e.getReason( ), strMapValue );
         }
      }

      // EditBox: MarginRight
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "MarginRight" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "MarginRight", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "MarginRight" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "MarginRight", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: TextAlign
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hTextAlign" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "TextAlign", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "TextAlign" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "TextAlign", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: FontFamily
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hFontFamily" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "FontFamily", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "FontFamily" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "FontFamily", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: FontSize
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hFontSize" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "FontSize", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "FontSize" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "FontSize", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: FontWeight
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hFontWeight" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "FontWeight", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "FontWeight" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "FontWeight", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: TextColor
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) )
      {
         nRC = mSPLDef.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strMapValue = request.getParameter( "hTextColor" );
            if ( strMapValue != null )
            {
               nRelPos = java.lang.Integer.parseInt( strMapValue );
               nRelPos--;    // For Auto Include combos, we need to decrement for the blank entry.
               mSPLDef.cursor( "Color" ).setPosition( nRelPos, "" );
            }
 
            // Auto Include Code 
            // If the value is "0" then the user has selected the null entry, we do not want to do an include.
            // If there is an entity, we want to exclude it. 
            if ( !StringUtils.equals( strMapValue, "0" ) )
            {
               nRC = mSPLDefBlock.cursor( "SpecialAttributeTextColor" ).checkExistenceOfEntity( ).toInt();
               if ( nRC >= 0 )
               {
                  // Only do the automatic include if this is a different entity
                  strTemp = mSPLDefBlock.cursor( "SpecialAttributeTextColor" ).getAttribute( "dColorName" ).getString( "" );
                  if ( !StringUtils.equals( strTemp, mSPLDef.cursor( "Color" ).getAttribute( "dColorName" ).getString( "" ) ) )
                  {
                     mSPLDefBlock.cursor( "SpecialAttributeTextColor" ).excludeEntity( CursorPosition.NONE );
                     mSPLDefBlock.cursor( "SpecialAttributeTextColor" ).includeSubobject( mSPLDef.cursor( "Color" ), CursorPosition.NEXT );
                  }
               }
               else
                     mSPLDefBlock.cursor( "SpecialAttributeTextColor" ).includeSubobject( mSPLDef.cursor( "Color" ), CursorPosition.NEXT );
            }
            else
            {
               nRC = mSPLDefBlock.cursor( "SpecialAttributeTextColor" ).checkExistenceOfEntity( ).toInt();
               if ( nRC >= 0 )
               {
                     mSPLDefBlock.cursor( "SpecialAttributeTextColor" ).excludeEntity( CursorPosition.NONE );
               }
            }
         }

         }  // checkExistenceofEntity
      // EditBox: TextLineHeight
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "TextLineHeight" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "TextLineHeight", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "TextLineHeight" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "TextLineHeight", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: TitlePosition
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hTitlePosition" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "TitlePosition", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "TitlePosition" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "TitlePosition", e.getReason( ), strMapValue );
         }
      }

      // CheckBox: CheckBox2
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "CheckBox2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "CheckBox2", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "CapitalizeTitleTextFlag" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "CheckBox2", e.getReason( ), strMapValue );
         }
      }

   }

   if ( webMapping == true )
      return 2;

   if ( nMapError < 0 )
      session.setAttribute( "ZeidonError", "Y" );

   return nMapError;
}

%>

<%

session = request.getSession( );
Task task = null;
View wWebXA = null;
KZMSGQOO_Object mMsgQ = null; // view to Message Queue
View vKZXMLPGO = null;
String strLastPage = "";
short  nRepos = 0;
boolean bDone = false;
int nOptRC = 0;
int nRC = 0;
CursorResult csrRC = null;
CursorResult csrRCk = null;

int nRCk = 0;  // temp fix for SetCursorEntityKey

long lEKey = 0; // temp fix for SetCursorEntityKey

String strKey = "";
String strActionToProcess = "";
String strURL = "";
String strError = "";
String strErrorFlag = "";
String strErrorTitle = "";
String strErrorMsg = "";
String strFocusCtrl = "";
String strBannerName = "";
String strVMLError = "";
String strOpenFile = "";
String strOpenPopupWindow = "";
String strPopupWindowSZX = "";
String strPopupWindowSZY = "";
String strDateFormat = "";
String strLoginName = "";
String strKeyRole = "";
String strDialogName = "";
String strWindowName = "";
String strLastWindow;
String strLastAction;
String strFunctionCall = "";
String strNextJSP_Name = "";
String strInputFileName = "";

strActionToProcess = (String) request.getParameter( "zAction" );

strLastWindow = (String) session.getAttribute( "ZeidonWindow" );
if ( StringUtils.isBlank( strLastWindow ) ) 
   strLastWindow = "NoLastWindow";

strLastAction = (String) session.getAttribute( "ZeidonAction" );

if ( strLastWindow.equals("wSPLDSPLD_BlockSpecialFormatDef") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
{
   strURL = response.encodeRedirectURL( "logout.jsp" );
   response.sendRedirect( strURL );
   return;
}

// Check to see if the Zeidon subtask view already exists.  If not, create
// it and copy it into the application object.
String taskId = (String) session.getAttribute( "ZeidonTaskId" );
if ( StringUtils.isBlank( taskId ) )
{
   strURL = response.encodeRedirectURL( "logout.jsp" );
   response.sendRedirect( strURL );
   return;
}
else
{
   task = objectEngine.getTaskById( taskId );
}

if ( task == null )
{
   session.setAttribute( "ZeidonTaskId", null );
   strURL = response.encodeRedirectURL( "logout.jsp" );
   response.sendRedirect( strURL );
   return; // something really bad has happened!!!
}

vKZXMLPGO = JspWebUtils.createWebSession( null, task, "" );
mMsgQ = new KZMSGQOO_Object( vKZXMLPGO );
mMsgQ.setView( VmlOperation.getMessageObject( task ) );
wSPLD_Dialog wSPLD = new wSPLD_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wSPLDSPLD_BlockSpecialFormatDef strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSPLDSPLD_BlockSpecialFormatDef LastWindow *** " + strLastWindow );
task.log().info("*** wSPLDSPLD_BlockSpecialFormatDef LastAction *** " + strLastAction );

if ( strActionToProcess != null )
{
   if ( task != null )
   {
      // Delete the message object if error on last interation.
      View vMsgQ = task.getViewByName( "__MSGQ" );
      if ( VmlOperation.isValid( vMsgQ ) )
      {
         mMsgQ.setView( null );
         vMsgQ.drop( );
      }

   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ACCEPT_BlockSpecialFormat" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockSpecialFormatDef", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockSpecialFormatDef", "wSPLD.ACCEPT_BlockSpecialFormat" );
      nOptRC = wSPLD.ACCEPT_BlockSpecialFormat( new zVIEW( vKZXMLPGO ) );
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }
      else
      if ( nOptRC == 1 )
      {
         // Dynamic Next Window
         strNextJSP_Name = wSPLD.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CANCEL_BlockComponent" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockSpecialFormatDef", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockSpecialFormatDef", "wSPLD.CANCEL_BlockSpecialFormat" );
      nOptRC = wSPLD.CANCEL_BlockSpecialFormat( new zVIEW( vKZXMLPGO ) );
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }
      else
      if ( nOptRC == 1 )
      {
         // Dynamic Next Window
         strNextJSP_Name = wSPLD.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && strActionToProcess.equals( "ZEIDON_ComboBoxSubmit" ) )
   {
      bDone = true;

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // No redirection, we are staying on this page.
      nRC = 0;
      break;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wSPLDSPLD_BlockSpecialFormatDef" );
         task.dropTask();
         task = null;
         session.setAttribute( "ZeidonTaskId", task );
      }

      // Next Window is HTML termination
      strURL = response.encodeRedirectURL( "logout.jsp" );
      response.sendRedirect( strURL );
      return;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnTimeout" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wSPLDSPLD_BlockSpecialFormatDef" );
         task.dropTask();
         task = null;
         session.setAttribute( "ZeidonTaskId", task );
      }

      // Next Window is HTML termination
      strURL = response.encodeRedirectURL( "TimeOut.html" );
      response.sendRedirect( strURL );
      return;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnResubmitPage" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockSpecialFormatDef", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSPLDSPLD_BlockSpecialFormatDef.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSPLDSPLD_BlockSpecialFormatDef.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSPLDSPLD_BlockSpecialFormatDef.jsp") ) 
         {
            response.sendRedirect( strURL );
            // If we are redirecting to a new page, then we need this return so that the rest of this page doesn't get built.
            return;
         }
      }
      else
      {
         if ( nRC > -128 )
         {
            strURL = response.encodeRedirectURL( "wSPLDSPLD_BlockSpecialFormatDef.jsp" );
            task.log().info( "Mapping Error Redirect to: " + strURL );
         }
         else
         {
            task.log().info( "InputMapping Reentry Prevented" );
         }
      }
   }

}

if ( session.getAttribute( "ZeidonError" ) == "Y" )
   session.setAttribute( "ZeidonError", null );
else
{
   VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockSpecialFormatDef", "wSPLD.PrebuildBlockSpecialFormatDef" );
   nOptRC = wSPLD.PrebuildBlockSpecialFormatDef( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getAttribute( "WebReturnMessage" ).getString( "" );
      strURLParameters = "?CallingPage=wSPLDSPLD_BlockSpecialFormatDef.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wSPLD" +
                         "&OperationName=" + "PrebuildBlockSpecialFormatDef";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSPLD", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wSPLD", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "SPLD_BlockSpecialFormatDef", "" );
   }

%>

<html>
<head>

<title>Update SPLD Block Special Format Definition</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSPLDSPLD_BlockSpecialFormatDef.js"></script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<%@ include file="./include/pagebackground.inc" %>  <!-- just temporary until we get the painter dialog updates from Kelly ... 2011.10.08 dks -->

<div id="wrapper">

<jsp:include page='<%=strBannerName %>' />

<div id="maincontent">

<div id="leftcontent">

<!-- Side Navigation *********************** -->
<div id="sidenavigation">
   <ul id="Return" name="Return">
<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AcceptAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="AcceptAndReturn" name="AcceptAndReturn"><a href="#"  onclick="ACCEPT_BlockSpecialFormat()">Accept and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="CancelAndReturn" name="CancelAndReturn"><a href="#"  onclick="CANCEL_BlockComponent()">Cancel and Return</a></li>
<%
   }
%>

   </ul>
</div> <!-- sidenavigation -->

</div>  <!-- leftcontent -->

<div id="content">

<!--System Maintenance-->

<%@ include file="./include/systemmaintenance.inc" %>

<!-- END System Maintenance-->


<form name="wSPLDSPLD_BlockSpecialFormatDef" id="wSPLDSPLD_BlockSpecialFormatDef" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lMLC = null;
   View lSPLDLST = null;
   View mLLD_LST = null;
   View mMasLC = null;
   View mPrimReg = null;
   View ReusableBlock = null;
   View mSPLDef = null;
   View mSPLDefBlock = null;
   View mSPLDefPanel = null;
   View mSubLC = null;
   View mSubProd = null;
   View mSubreg = null;
   View wWebXfer = null;
   String strRadioGroupValue = "";
   String strComboCurrentValue = "";
   String strAutoComboBoxExternalValue = "";
   String strComboSelectedValue = "0";
   String strErrorColor = "";
   String strErrorMapValue = "";
   String strTextDisplayValue = "";
   String strTextURL_Value = "";
   String strSolicitSave = "";
   String strTblOutput = "";
   int    ComboCount = 0;
   int    iTableRowCnt = 0;
   CursorResult csrRC2 = null;
   nRC = 0;

   // FindErrorFields Processing
   mMsgQ = new KZMSGQOO_Object( vKZXMLPGO );
   mMsgQ.setView( VmlOperation.getMessageObject( task ) );
   strError = mMsgQ.FindErrorFields( );

   // strError is of the form: "Y\tChemicalName\tMax length exceeded\t\nMapping value in error\t\nY\tPercent\tInvalid numeric\t\n6.84%\t\n ..."
   // We want to find the first "Y" error flag if it exists.
   int nLth = strError.length( );
   int nPos = strError.indexOf( "\t" );
   while ( nPos > 0 && nPos < nLth )
   {
      strErrorFlag = strError.substring( nPos - 1, nPos );
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
      {
         int nPos2 = strError.indexOf( "\t\n" );
         if ( nPos2 >= 0 )
         {
            strErrorMapValue = strError.substring( nPos + 1, nPos2 );
            nPos = strErrorMapValue.indexOf( "\t" );
            if ( nPos >= 0 )
            {
               strErrorTitle = strErrorMapValue.substring( 0, nPos );
               strErrorMsg = strErrorMapValue.substring( nPos + 1 );
            }
         }

         break;
      }
      else
      {
         nPos = strError.indexOf( "\t\n", nPos + 1 );
         if ( nPos > 0 )
         {
            strErrorTitle = strError.substring( nPos + 2 ); // debugging
            int nPos2 = strError.indexOf( "\t\n", nPos + 2 );
            if ( nPos2 >= 0 )
            {
               nPos = nPos2 + 2;
               strErrorTitle = strError.substring( nPos ); // debugging
               task.log().info( "Error: " + strErrorTitle ); // debugging
               nPos = strError.indexOf( "\t", nPos );
            }
            else
               nPos = -1;
         }
      }
   }

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getAttribute( "SolicitSaveFlag" ).getString( "" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSPLD", "SPLD_BlockSpecialFormatDef" );
   strOpenFile = VmlOperation.FindOpenFile( task );
   strDateFormat = "YYYY.MM.DD";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      nRC = wWebXA.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strLoginName = wWebXA.cursor( "Root" ).getAttribute( "LoginName" ).getString( "LoginName" );
         if ( strLoginName == null )
            strLoginName = "";
         strKeyRole = wWebXA.cursor( "Root" ).getAttribute( "KeyRole" ).getString( "KeyRole" );
         if ( strKeyRole == null )
            strKeyRole = "";
      }
   }
%>

   <input name="zFocusCtrl" id="zFocusCtrl" type="hidden" value="<%=strFocusCtrl%>">
   <input name="zOpenFile" id="zOpenFile" type="hidden" value="<%=strOpenFile%>">
   <input name="zDateFormat" id="zDateFormat" type="hidden" value="<%=strDateFormat%>">
   <input name="zLoginName" id="zLoginName" type="hidden" value="<%=strLoginName%>">
   <input name="zKeyRole" id="zKeyRole" type="hidden" value="<%=strKeyRole%>">
   <input name="zOpenPopupWindow" id="zOpenPopupWindow" type="hidden" value="<%=strOpenPopupWindow%>">
   <input name="zPopupWindowSZX" id="zPopupWindowSZX" type="hidden" value="<%=strPopupWindowSZX%>">
   <input name="zPopupWindowSZY" id="zPopupWindowSZY" type="hidden" value="<%=strPopupWindowSZY%>">
   <input name="zErrorFlag" id="zErrorFlag" type="hidden" value="<%=strErrorFlag%>">
   <input name="zTimeout" id="zTimeout" type="hidden" value="<%=nTimeout%>">
   <input name="zSolicitSave" id="zSolicitSave" type="hidden" value="<%=strSolicitSave%>">

   <div name="ShowVMLError" id="ShowVMLError" class="ShowVMLError">
      <%=strVMLError%>
   </div>


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>
<div id="GroupBox1" name="GroupBox1" style="float:left;width:592px;" >

<table cols=3 style="width:592px;"  class="grouptable">

<tr>
<td valign="top" style="width:158px;">
<% /* TXFormattingType::Text */ %>

<span  id="TXFormattingType:" name="TXFormattingType:" style="width:146px;height:26px;">Formatting Type:</span>

</td>
<td valign="top" style="width:192px;">
<% /* Type:Text */ %>
<% strTextDisplayValue = "";
   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) == false )
      task.log( ).debug( "Invalid View: " + "Type" );
   else
   {
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttribute" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSPLDefBlock.cursor( "LLD_SpecialSectionAttribute" ).getAttribute( "Name" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on Type: " + e.getMessage());
         task.log().info( "*** Error on ctrl Type" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="Type" name="Type" style="width:192px;height:24px;"><%=strTextDisplayValue%></label>

</td>
</tr>
<tr>
<td valign="top" style="width:158px;">
<% /* TXTopMargin::Text */ %>

<span  id="TXTopMargin:" name="TXTopMargin:" style="width:146px;height:26px;">Top Margin:</span>

</td>
<td valign="top" style="width:184px;">
<% /* MarginTop:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "MarginTop", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) == false )
         task.log( ).debug( "Invalid View: " + "MarginTop" );
      else
      {
         nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "MarginTop" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on MarginTop: " + e.getMessage());
               task.log().error( "*** Error on ctrl MarginTop", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_SpecialSectionAttrBlock.MarginTop: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for MarginTop: " + "mSPLDefBlock.LLD_SpecialSectionAttrBlock" );
      }
   }
%>

<input name="MarginTop" id="MarginTop" maxlength="20" style="width:98px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td valign="top" style="width:128px;">
<% /* TX1:Text */ %>

<span  id="TX1" name="TX1" style="width:128px;height:26px;">  (Ex. .05)</span>

</td>
</tr>
<tr>
<td valign="top" style="width:158px;">
<% /* TXBottomMargin::Text */ %>

<span  id="TXBottomMargin:" name="TXBottomMargin:" style="width:146px;height:26px;">Bottom Margin:</span>

</td>
<td valign="top" style="width:184px;">
<% /* MarginBottom:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "MarginBottom", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) == false )
         task.log( ).debug( "Invalid View: " + "MarginBottom" );
      else
      {
         nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "MarginBottom" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on MarginBottom: " + e.getMessage());
               task.log().error( "*** Error on ctrl MarginBottom", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_SpecialSectionAttrBlock.MarginBottom: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for MarginBottom: " + "mSPLDefBlock.LLD_SpecialSectionAttrBlock" );
      }
   }
%>

<input name="MarginBottom" id="MarginBottom" maxlength="20" style="width:98px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td valign="top" style="width:128px;">
<% /* TX2:Text */ %>

<span  id="TX2" name="TX2" style="width:128px;height:26px;">  (Ex. .05)</span>

</td>
</tr>
<tr>
<td valign="top" style="width:158px;">
<% /* TXLeftMargin::Text */ %>

<span  id="TXLeftMargin:" name="TXLeftMargin:" style="width:146px;height:26px;">Left Margin:</span>

</td>
<td valign="top" style="width:184px;">
<% /* MarginLeft:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "MarginLeft", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) == false )
         task.log( ).debug( "Invalid View: " + "MarginLeft" );
      else
      {
         nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "MarginLeft" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on MarginLeft: " + e.getMessage());
               task.log().error( "*** Error on ctrl MarginLeft", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_SpecialSectionAttrBlock.MarginLeft: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for MarginLeft: " + "mSPLDefBlock.LLD_SpecialSectionAttrBlock" );
      }
   }
%>

<input name="MarginLeft" id="MarginLeft" maxlength="20" style="width:98px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td valign="top" style="width:128px;">
<% /* TX3:Text */ %>

<span  id="TX3" name="TX3" style="width:128px;height:26px;">  (Ex. .05)</span>

</td>
</tr>
<tr>
<td valign="top" style="width:158px;">
<% /* TXRightMargin::Text */ %>

<span  id="TXRightMargin:" name="TXRightMargin:" style="width:146px;height:26px;">Right Margin:</span>

</td>
<td valign="top" style="width:184px;">
<% /* MarginRight:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "MarginRight", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) == false )
         task.log( ).debug( "Invalid View: " + "MarginRight" );
      else
      {
         nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "MarginRight" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on MarginRight: " + e.getMessage());
               task.log().error( "*** Error on ctrl MarginRight", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_SpecialSectionAttrBlock.MarginRight: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for MarginRight: " + "mSPLDefBlock.LLD_SpecialSectionAttrBlock" );
      }
   }
%>

<input name="MarginRight" id="MarginRight" maxlength="20" style="width:98px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td valign="top" style="width:128px;">
<% /* TX4:Text */ %>

<span  id="TX4" name="TX4" style="width:128px;height:26px;">  (Ex. .05)</span>

</td>
</tr>
<tr>
<td valign="top" style="width:158px;">
<% /* TXTextAlignment::Text */ %>

<span  id="TXTextAlignment:" name="TXTextAlignment:" style="width:146px;height:28px;">Text Alignment:</span>

</td>
<td valign="top" style="width:98px;">
<% /* TextAlign:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="TextAlign" id="TextAlign" size="1" style="width:98px;" onchange="TextAlignOnChange( )">

<%
   boolean inListTextAlign = false;

   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDefBlock , "LLD_SpecialSectionAttrBlock", "TextAlign", "" );

      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "TextAlign" ).getString( "" );
         if ( strComboCurrentValue == null )
            strComboCurrentValue = "";
      }
      else
      {
         strComboCurrentValue = "";
      }

      // Code for NOT required attribute, which makes sure a blank entry exists.
      if ( strComboCurrentValue == "" )
      {
         inListTextAlign = true;
%>
         <option selected="selected" value=""></option>
<%
      }
      else
      {
%>
         <option value=""></option>
<%
      }
      for ( TableEntry entry : list )
      {
         String internalValue = entry.getInternalValue( );
         String externalValue = entry.getExternalValue( );
         // Perhaps getInternalValue and getExternalValue should return an empty string, 
         // but currently it returns null.  Set to empty string. 
         if ( externalValue == null )
         {
            internalValue = "";
            externalValue = "";
         }

         if ( !StringUtils.isBlank( externalValue ) )
         {
            if ( StringUtils.equals( strComboCurrentValue, externalValue ) )
            {
               inListTextAlign = true;
%>
               <option selected="selected" value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
            else
            {
%>
               <option value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
         }
      }  // for ( TableEntry entry
      // The value from the database isn't in the domain, add it to the list as disabled.
      if ( !inListTextAlign )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hTextAlign" id="hTextAlign" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:158px;">
<% /* TXFontFamily::Text */ %>

<span  id="TXFontFamily:" name="TXFontFamily:" style="width:146px;height:30px;">Font Family:</span>

</td>
<td valign="top" style="width:98px;">
<% /* FontFamily:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="FontFamily" id="FontFamily" size="1" style="width:98px;" onchange="FontFamilyOnChange( )">

<%
   boolean inListFontFamily = false;

   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDefBlock , "LLD_SpecialSectionAttrBlock", "FontFamily", "" );

      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "FontFamily" ).getString( "" );
         if ( strComboCurrentValue == null )
            strComboCurrentValue = "";
      }
      else
      {
         strComboCurrentValue = "";
      }

      // Code for NOT required attribute, which makes sure a blank entry exists.
      if ( strComboCurrentValue == "" )
      {
         inListFontFamily = true;
%>
         <option selected="selected" value=""></option>
<%
      }
      else
      {
%>
         <option value=""></option>
<%
      }
      for ( TableEntry entry : list )
      {
         String internalValue = entry.getInternalValue( );
         String externalValue = entry.getExternalValue( );
         // Perhaps getInternalValue and getExternalValue should return an empty string, 
         // but currently it returns null.  Set to empty string. 
         if ( externalValue == null )
         {
            internalValue = "";
            externalValue = "";
         }

         if ( !StringUtils.isBlank( externalValue ) )
         {
            if ( StringUtils.equals( strComboCurrentValue, externalValue ) )
            {
               inListFontFamily = true;
%>
               <option selected="selected" value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
            else
            {
%>
               <option value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
         }
      }  // for ( TableEntry entry
      // The value from the database isn't in the domain, add it to the list as disabled.
      if ( !inListFontFamily )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hFontFamily" id="hFontFamily" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:158px;">
<% /* TXFontSize::Text */ %>

<span  id="TXFontSize:" name="TXFontSize:" style="width:146px;height:30px;">Font Size:</span>

</td>
<td valign="top" style="width:98px;">
<% /* FontSize:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="FontSize" id="FontSize" size="1" style="width:98px;" onchange="FontSizeOnChange( )">

<%
   boolean inListFontSize = false;

   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDefBlock , "LLD_SpecialSectionAttrBlock", "FontSize", "" );

      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "FontSize" ).getString( "" );
         if ( strComboCurrentValue == null )
            strComboCurrentValue = "";
      }
      else
      {
         strComboCurrentValue = "";
      }

      // Code for NOT required attribute, which makes sure a blank entry exists.
      if ( strComboCurrentValue == "" )
      {
         inListFontSize = true;
%>
         <option selected="selected" value=""></option>
<%
      }
      else
      {
%>
         <option value=""></option>
<%
      }
      for ( TableEntry entry : list )
      {
         String internalValue = entry.getInternalValue( );
         String externalValue = entry.getExternalValue( );
         // Perhaps getInternalValue and getExternalValue should return an empty string, 
         // but currently it returns null.  Set to empty string. 
         if ( externalValue == null )
         {
            internalValue = "";
            externalValue = "";
         }

         if ( !StringUtils.isBlank( externalValue ) )
         {
            if ( StringUtils.equals( strComboCurrentValue, externalValue ) )
            {
               inListFontSize = true;
%>
               <option selected="selected" value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
            else
            {
%>
               <option value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
         }
      }  // for ( TableEntry entry
      // The value from the database isn't in the domain, add it to the list as disabled.
      if ( !inListFontSize )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hFontSize" id="hFontSize" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:158px;">
<% /* TXFontWeight::Text */ %>

<span  id="TXFontWeight:" name="TXFontWeight:" style="width:146px;height:30px;">Font Weight:</span>

</td>
<td valign="top" style="width:98px;">
<% /* FontWeight:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="FontWeight" id="FontWeight" size="1" style="width:98px;" onchange="FontWeightOnChange( )">

<%
   boolean inListFontWeight = false;

   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDefBlock , "LLD_SpecialSectionAttrBlock", "FontWeight", "" );

      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "FontWeight" ).getString( "" );
         if ( strComboCurrentValue == null )
            strComboCurrentValue = "";
      }
      else
      {
         strComboCurrentValue = "";
      }

      // Code for NOT required attribute, which makes sure a blank entry exists.
      if ( strComboCurrentValue == "" )
      {
         inListFontWeight = true;
%>
         <option selected="selected" value=""></option>
<%
      }
      else
      {
%>
         <option value=""></option>
<%
      }
      for ( TableEntry entry : list )
      {
         String internalValue = entry.getInternalValue( );
         String externalValue = entry.getExternalValue( );
         // Perhaps getInternalValue and getExternalValue should return an empty string, 
         // but currently it returns null.  Set to empty string. 
         if ( externalValue == null )
         {
            internalValue = "";
            externalValue = "";
         }

         if ( !StringUtils.isBlank( externalValue ) )
         {
            if ( StringUtils.equals( strComboCurrentValue, externalValue ) )
            {
               inListFontWeight = true;
%>
               <option selected="selected" value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
            else
            {
%>
               <option value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
         }
      }  // for ( TableEntry entry
      // The value from the database isn't in the domain, add it to the list as disabled.
      if ( !inListFontWeight )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hFontWeight" id="hFontWeight" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:158px;">
<% /* TXFontColor::Text */ %>

<span  id="TXFontColor:" name="TXFontColor:" style="width:146px;height:30px;">Font Color:</span>

</td>
<td valign="top" style="width:98px;">
<% /* TextColor:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="TextColor" id="TextColor" size="1"style="width:98px;" onchange="TextColorOnChange( )">

<%
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
         strComboCurrentValue = "";
      View vTextColor;
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) )
      {
         nRC = mSPLDefBlock.cursor( "SpecialAttributeTextColor" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strComboCurrentValue = mSPLDefBlock.cursor( "SpecialAttributeTextColor" ).getAttribute( "dColorName" ).getString( "" );
            if ( strComboCurrentValue == null )
               strComboCurrentValue = "";
         }
      }
      vTextColor = mSPLDef.newView( );
      ComboCount = 0;
      strComboSelectedValue = "0";

      // For Auto Include, always add a null entry to the combo box.
      ComboCount++;
      if ( StringUtils.isBlank( strComboCurrentValue ) )
      {
%>
         <option selected="selected"></option>
<%
      }
      else
      {
%>
         <option></option>
<%
      }

      csrRC = vTextColor.cursor( "Color" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         strErrorMapValue = vTextColor.cursor( "Color" ).getAttribute( "dColorName" ).getString( "" );
         if ( strErrorMapValue == null )
            strErrorMapValue = "";

         if ( StringUtils.equals( strComboCurrentValue, strErrorMapValue ) )
         {
%>
            <option selected="selected"><%=strErrorMapValue%></option>
<%
            strComboSelectedValue = Integer.toString( ComboCount );
         }
         else
         {
%>
            <option><%=strErrorMapValue%></option>
<%
         }

         ComboCount++;
         csrRC =  vTextColor.cursor( "Color" ).setNextContinue( );
      }

      vTextColor.drop( );

   }
%>
</select>
<input name="hTextColor" id="hTextColor" type="hidden" value="<%=strComboSelectedValue%>" >

</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:158px;">
<% /* TXLineHeight::Text */ %>

<span  id="TXLineHeight:" name="TXLineHeight:" style="width:146px;height:26px;">Line Height:</span>

</td>
<td valign="top" style="width:184px;">
<% /* TextLineHeight:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "TextLineHeight", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) == false )
         task.log( ).debug( "Invalid View: " + "TextLineHeight" );
      else
      {
         nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "TextLineHeight" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on TextLineHeight: " + e.getMessage());
               task.log().error( "*** Error on ctrl TextLineHeight", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_SpecialSectionAttrBlock.TextLineHeight: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for TextLineHeight: " + "mSPLDefBlock.LLD_SpecialSectionAttrBlock" );
      }
   }
%>

<input name="TextLineHeight" id="TextLineHeight" maxlength="20" style="width:98px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td valign="top" style="width:162px;">
<% /* TX(1.16isaboutnormal):Text */ %>

<span  id="TX(1.16isaboutnormal)" name="TX(1.16isaboutnormal)" style="width:162px;height:26px;">  (1.16 is about normal)</span>

</td>
</tr>
<tr>
<td valign="top" style="width:158px;">
<% /* TXTitlePosition::Text */ %>

<span  id="TXTitlePosition:" name="TXTitlePosition:" style="width:146px;height:30px;">Title Position:</span>

</td>
<td valign="top" style="width:252px;">
<% /* TitlePosition:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="TitlePosition" id="TitlePosition" size="1" style="width:252px;" onchange="TitlePositionOnChange( )">

<%
   boolean inListTitlePosition = false;

   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDefBlock , "LLD_SpecialSectionAttrBlock", "TitlePosition", "" );

      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "TitlePosition" ).getString( "" );
         if ( strComboCurrentValue == null )
            strComboCurrentValue = "";
      }
      else
      {
         strComboCurrentValue = "";
      }

      // Code for NOT required attribute, which makes sure a blank entry exists.
      if ( strComboCurrentValue == "" )
      {
         inListTitlePosition = true;
%>
         <option selected="selected" value=""></option>
<%
      }
      else
      {
%>
         <option value=""></option>
<%
      }
      for ( TableEntry entry : list )
      {
         String internalValue = entry.getInternalValue( );
         String externalValue = entry.getExternalValue( );
         // Perhaps getInternalValue and getExternalValue should return an empty string, 
         // but currently it returns null.  Set to empty string. 
         if ( externalValue == null )
         {
            internalValue = "";
            externalValue = "";
         }

         if ( !StringUtils.isBlank( externalValue ) )
         {
            if ( StringUtils.equals( strComboCurrentValue, externalValue ) )
            {
               inListTitlePosition = true;
%>
               <option selected="selected" value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
            else
            {
%>
               <option value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
         }
      }  // for ( TableEntry entry
      // The value from the database isn't in the domain, add it to the list as disabled.
      if ( !inListTitlePosition )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hTitlePosition" id="hTitlePosition" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
<td>&nbsp</td>
</tr>
</table>

</div>  <!-- GroupBox1 --> 

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:16px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:24px;">&nbsp&nbsp</span>
<% /* CheckBox2:CheckBox */ %>
<%
   strErrorMapValue = "";
   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) == false )
      task.log( ).debug( "Invalid View: " + "CheckBox2" );
   else
   {
      nRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
         strRadioGroupValue = mSPLDefBlock.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "CapitalizeTitleTextFlag" ).getString( );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="CheckBox2" id="CheckBox2"  value="Y" <%=strErrorMapValue%> style="">
<span style="width:230px;height:24px;">&nbsp Convert Text to All Capitals</span>

</div>  <!-- End of a new line -->


<%
   if ( StringUtils.equals( strErrorFlag, "X" ) )
   {
      nPos = strError.indexOf( "\t", 2 );
      if ( nPos >= 0 )
      {
         strErrorTitle = strError.substring( 2, nPos );
         int nPos2 = strError.indexOf( "\t\n" );
         strErrorMsg = strError.substring( nPos + 1, nPos2 );
      }
   }

%>

   <input name="zError" id="zError" type="hidden" value="<%=strErrorMsg%>">

</form>
</div>   <!-- This is the end tag for the div 'content' -->

</div>   <!-- This is the end tag for the div 'maincontent' -->

<%@ include file="./include/footer.inc" %>

</div>  <!-- This is the end tag for wrapper -->

</body>
<script type="text/javascript">animatedcollapse.init();</script>
</html>
<%
   session.setAttribute( "ZeidonWindow", "wSPLDSPLD_BlockSpecialFormatDef" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
