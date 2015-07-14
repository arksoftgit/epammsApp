<!DOCTYPE HTML>

<%-- wMLCAddItemsMultipleKeyword --%>

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

   View mMasLC = null;
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

   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      // EditBox: DirectionsUseName1
      nRC = mMasLC.cursor( "MasterLabelContent" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "DirectionsUseName1" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "DirectionsUseName1", "", strMapValue );
            else
               mMasLC.cursor( "MasterLabelContent" ).getAttribute( "wAddStatementsPageTitle" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "DirectionsUseName1", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ComboBox1
      nRC = mMasLC.cursor( "MasterLabelContent" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hComboBox1" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ComboBox1", "", strMapValue );
            else
               mMasLC.cursor( "MasterLabelContent" ).getAttribute( "wAddStatementsPageTitle" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ComboBox1", e.getReason( ), strMapValue );
         }
      }

      // MLEdit: MLEdit2
      nRC = mMasLC.cursor( "MasterLabelContent" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "MLEdit2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "MLEdit2", "", strMapValue );
            else
               mMasLC.cursor( "MasterLabelContent" ).getAttribute( "wAddStatementsWorkText" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "MLEdit2", e.getReason( ), strMapValue );
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

if ( strLastWindow.equals("wMLCAddItemsMultipleKeyword") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wMLC_Dialog wMLC = new wMLC_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wMLCAddItemsMultipleKeyword strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLCAddItemsMultipleKeyword LastWindow *** " + strLastWindow );
task.log().info("*** wMLCAddItemsMultipleKeyword LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelAddItems" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCAddItemsMultipleKeyword", strActionToProcess );

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ConfirmAddItemsMultiple" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCAddItemsMultipleKeyword", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCAddItemsMultipleKeyword", "wMLC.ConfirmAddItemsMultiple" );
      nOptRC = wMLC.ConfirmAddItemsMultiple( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ConfirmAddItemsMultipleReturn" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCAddItemsMultipleKeyword", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCAddItemsMultipleKeyword", "wMLC.ConfirmAddItemsMultiple" );
      nOptRC = wMLC.ConfirmAddItemsMultiple( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wMLCAddItemsMultipleKeyword" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wMLCAddItemsMultipleKeyword" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCAddItemsMultipleKeyword", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLCAddItemsMultipleKeyword.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLCAddItemsMultipleKeyword.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLCAddItemsMultipleKeyword.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLCAddItemsMultipleKeyword.jsp" );
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
}
   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wMLC", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wMLC", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "AddItemsMultipleKeyword", "" );
   }

%>

<html>
<head>

<title>Add Items Single or Multiple</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wMLCAddItemsMultipleKeyword.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AddItems" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="AddItems" name="AddItems"><a href="#"  onclick="ConfirmAddItemsMultiple()">Add Items</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AddAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="AddAndReturn" name="AddAndReturn"><a href="#"  onclick="ConfirmAddItemsMultipleReturn()">Add and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="CancelAndReturn" name="CancelAndReturn"><a href="#"  onclick="CancelAddItems()">Cancel and Return</a></li>
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


<form name="wMLCAddItemsMultipleKeyword" id="wMLCAddItemsMultipleKeyword" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View mMasLC = null;
   View mEPA = null;
   View mMasProd = null;
   View mMasProdLST = null;
   View mPrimReg = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "AddItemsMultipleKeyword" );
   strOpenFile = VmlOperation.FindOpenFile( task );
   strDateFormat = "YYYY.MM.DD";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      nRC = wWebXA.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strKeyRole = wWebXA.cursor( "Root" ).getAttribute( "KeyRole" ).getString( "KeyRole" );
         if ( strKeyRole == null )
            strKeyRole = "";

         task.log().info( "Root.KeyRole: " + strKeyRole );
      }
   }
%>

   <input name="zFocusCtrl" id="zFocusCtrl" type="hidden" value="<%=strFocusCtrl%>">
   <input name="zOpenFile" id="zOpenFile" type="hidden" value="<%=strOpenFile%>">
   <input name="zDateFormat" id="zDateFormat" type="hidden" value="<%=strDateFormat%>">
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
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBStorDispSections3:GroupBox */ %>

<div id="GBStorDispSections3" name="GBStorDispSections3" class="listgroup"   style="float:left;position:relative; width:780px; height:36px;">  <!-- GBStorDispSections3 --> 

<% /* EnvironmentalHazardsSection1:Text */ %>

<label class="groupbox"  id="EnvironmentalHazardsSection1" name="EnvironmentalHazardsSection1" style="width:746px;height:16px;position:absolute;left:6px;top:12px;">Add One to Multiple Text Items by Keyword</label>


</div>  <!--  GBStorDispSections3 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBAddSurfacesList:GroupBox */ %>

<div id="GBAddSurfacesList" name="GBAddSurfacesList"   style="float:left;position:relative; width:778px; height:370px;">  <!-- GBAddSurfacesList --> 

<% /* DirectionsUseTitle:1:Text */ %>

<label  id="DirectionsUseTitle:1" name="DirectionsUseTitle:1" style="width:104px;height:16px;position:absolute;left:6px;top:12px;">Keyword:</label>

<% /* DirectionsUseName1:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "DirectionsUseName1", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "DirectionsUseName1" );
      else
      {
         nRC = mMasLC.cursor( "MasterLabelContent" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "MasterLabelContent" ).getAttribute( "wAddStatementsPageTitle" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on DirectionsUseName1: " + e.getMessage());
               task.log().error( "*** Error on ctrl DirectionsUseName1", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MasterLabelContent.wAddStatementsPageTitle: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for DirectionsUseName1: " + "mMasLC.MasterLabelContent" );
      }
   }
%>

<input class="text12" name="DirectionsUseName1" id="DirectionsUseName1"  title="Required Name to differentiate Directions for Use Sections within a list" style="width:184px;position:absolute;left:110px;top:12px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* Text1:Text */ %>

<label  id="Text1" name="Text1" style="width:104px;height:16px;position:absolute;left:6px;top:34px;">Keyword Type:</label>

<% /* ComboBox1:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox1" id="ComboBox1" size="1" style="width:184px;position:absolute;left:110px;top:34px;" onchange="ComboBox1OnChange( )">

<%
   boolean inListComboBox1 = false;

   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mMasLC , "MasterLabelContent", "wAddStatementsPageTitle", "" );

      nRC = mMasLC.cursor( "MasterLabelContent" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mMasLC.cursor( "MasterLabelContent" ).getAttribute( "wAddStatementsPageTitle" ).getString( "" );
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
         inListComboBox1 = true;
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
               inListComboBox1 = true;
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
      if ( !inListComboBox1 )
      { 
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }  
   }  // if view != null
%>
</select>

<input name="hComboBox1" id="hComboBox1" type="hidden" value="<%=strComboCurrentValue%>" >
<% /* AddSurfacesList:Text */ %>

<label class="groupbox"  id="AddSurfacesList" name="AddSurfacesList" style="width:374px;height:16px;position:absolute;left:6px;top:60px;">Add One or Multiple Items Separated by Line Feeds</label>

<% /* MLEdit2:MLEdit */ %>
<%
   // : MLEdit2
   strErrorMapValue = VmlOperation.CheckError( "MLEdit2", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).info( "Invalid View: " + "MLEdit2" );
      else
      {
         nRC = mMasLC.cursor( "MasterLabelContent" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasLC.cursor( "MasterLabelContent" ).getAttribute( "wAddStatementsWorkText" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "MasterLabelContent.wAddStatementsWorkText: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist for MLEdit2: " + "mMasLC.MasterLabelContent" );
      }
   }
%>

<textarea name="MLEdit2" id="MLEdit2" style="width:754px;height:264px;position:absolute;left:6px;top:82px;border:solid;border-width:4px;border-style:groove;" wrap="wrap"><%=strErrorMapValue%></textarea>


</div>  <!--  GBAddSurfacesList --> 
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
</html>
<%
   session.setAttribute( "ZeidonWindow", "wMLCAddItemsMultipleKeyword" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
