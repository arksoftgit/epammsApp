<!DOCTYPE HTML>

<%-- wStartUpUserLogin --%>

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

   View pePamms = null;
   View wWebXfer = null;
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

   pePamms = task.getViewByName( "pePamms" );
   if ( VmlOperation.isValid( pePamms ) )
   {
      // ComboBox: PrimaryRegistrants
      pePamms = task.getViewByName( "pePamms" );
      if ( VmlOperation.isValid( pePamms ) )
      {
         nRC = pePamms.cursor( "PrimaryRegistrant" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strMapValue = request.getParameter( "hPrimaryRegistrants" );
            if ( strMapValue != null )
            {
               nRelPos = java.lang.Integer.parseInt( strMapValue );
               pePamms.cursor( "PrimaryRegistrant" ).setPosition( nRelPos, "" );
            }
         }

         }  // checkExistenceofEntity
   }

   wWebXfer = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXfer ) )
   {
      // EditBox: EBRegistrantName
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBRegistrantName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBRegistrantName", "", strMapValue );
            else
               wWebXfer.cursor( "Root" ).getAttribute( "AttemptLoginRegistrant" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBRegistrantName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBUserName
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBUserName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBUserName", "", strMapValue );
            else
               wWebXfer.cursor( "Root" ).getAttribute( "AttemptLoginName" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBUserName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPassword
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPassword" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPassword", "", strMapValue );
            else
               wWebXfer.cursor( "Root" ).getAttribute( "AttemptPassword" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPassword", e.getReason( ), strMapValue );
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

// Check to see if the Zeidon subtask view already exists.  If not, create
// it and copy it into the application object.
String taskId = (String) session.getAttribute( "ZeidonTaskId" );
if ( StringUtils.isBlank( taskId ) )
{
   task = objectEngine.createTask( "epamms", session.getId() );
   session.setAttribute( "ZeidonTaskId", task.getTaskId() );
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
wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wStartUpUserLogin strActionToProcess *** " + strActionToProcess );
task.log().info("*** wStartUpUserLogin LastWindow *** " + strLastWindow );
task.log().info("*** wStartUpUserLogin LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AutoLogin" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpUserLogin", strActionToProcess );

      // Prebuild/Postbuild Operations.
      // These are called because we Unregister Zeidon when this page is finished loading, so
      // these operations need to be called before any action code (for recreating objects etc).
      nOptRC = wStartUp.InitLoginWindow( new zVIEW( vKZXMLPGO ) );
      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpUserLogin", "wStartUp.AutoLoginSubregistrant" );
      nOptRC = wStartUp.AutoLoginSubregistrant( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "FORGOT_Password" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpUserLogin", strActionToProcess );

      // Prebuild/Postbuild Operations.
      // These are called because we Unregister Zeidon when this page is finished loading, so
      // these operations need to be called before any action code (for recreating objects etc).
      nOptRC = wStartUp.InitLoginWindow( new zVIEW( vKZXMLPGO ) );
      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartTopWindow, "wStartUp", "SecurityValidations" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ProcessUserLogin" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpUserLogin", strActionToProcess );

      // Prebuild/Postbuild Operations.
      // These are called because we Unregister Zeidon when this page is finished loading, so
      // these operations need to be called before any action code (for recreating objects etc).
      nOptRC = wStartUp.InitLoginWindow( new zVIEW( vKZXMLPGO ) );
      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpUserLogin", "wStartUp.ProcessUserLogin" );
      nOptRC = wStartUp.ProcessUserLogin( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      JspWebUtils.createWebSession( session, task, VmlOperation.SfGetUserIdForTask( task ) );  // Post Operation

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartTopWindow, "wStartUp", "ePammsPortal" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wStartUpUserLogin" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wStartUpUserLogin" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpUserLogin", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wStartUpUserLogin.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wStartUpUserLogin.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wStartUpUserLogin.jsp") )
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
            strURL = response.encodeRedirectURL( "wStartUpUserLogin.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpUserLogin", "wStartUp.InitLoginWindow" );
   nOptRC = wStartUp.InitLoginWindow( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getAttribute( "WebReturnMessage" ).getString( "" );
      strURLParameters = "?CallingPage=wStartUpUserLogin.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wStartUp" +
                         "&OperationName=" + "InitLoginWindow";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wStartUp", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wStartUp", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "UserLogin", "" );
   }

%>

<html>
<head>

<title>User Login</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wStartUpUserLogin.js"></script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<%@ include file="./include/pagebackground.inc" %>  <!-- just temporary until we get the painter dialog updates from Kelly ... 2011.10.08 dks -->

<div id="wrapper">

<jsp:include page='<%=strBannerName %>' />

<!-- Main Navigation *********************** -->
<div id="mainnavigation">
   <ul id="Exit" name="Exit" >
       <li id="lmLogout" name="lmLogout" ><a href="#" onclick="mLogout()">Exit</a></li>
   </ul>
</div>  <!-- end Navigation Bar -->

<%@include file="./include/topmenuend.inc" %>
<div id="maincontent">
<div id="contentnosidemenu">
<!--System Maintenance-->

<%@ include file="./include/systemmaintenance.inc" %>

<!-- END System Maintenance-->


<form name="wStartUpUserLogin" id="wStartUpUserLogin" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View iePamms = null;
   View lPrimReg = null;
   View lSubreg = null;
   View mCurrentUser = null;
   View mePamms = null;
   View mMasLC = null;
   View mPerson = null;
   View mPrimReg = null;
   View mSubreg = null;
   View mUser = null;
   View pePamms = null;
   View qOrganiz = null;
   View qOrganizLogin = null;
   View qPrimReg = null;
   View qSubreg = null;
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
      // Setting strActionToProcess = null because this is an "Unregister App" page, if an error occurs on the page, we still unregister.
      strActionToProcess = null;
   }

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getAttribute( "SolicitSaveFlag" ).getString( "" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wStartUp", "UserLogin" );
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
   <input name="zTimeout" id="zTimeout" type="hidden" value="20">
   <input name="zSolicitSave" id="zSolicitSave" type="hidden" value="<%=strSolicitSave%>">

   <div name="ShowVMLError" id="ShowVMLError" class="ShowVMLError">
      <%=strVMLError%>
   </div>


 <!-- This is added as a line spacer -->
<div style="height:36px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:46px;height:166px;float:left;">  <!-- GroupBox1 -->


</div>  <!--  GroupBox1 -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* WelcomeContainer:GroupBox */ %>

<div id="WelcomeContainer" name="WelcomeContainer" class="divborder"   style="float:left;position:relative; width:470px; height:220px;">  <!-- WelcomeContainer -->

<div  id="WelcomeContainer" name="WelcomeContainer" >Welcome To ePamms</div>
<% /* RegistrantName::Text */ %>

<label class="text14bold"  id="RegistrantName:" name="RegistrantName:" style="width:118px;height:16px;position:absolute;left:16px;top:54px;">Registrant Name:</label>

<% /* EBRegistrantName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBRegistrantName", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      wWebXfer = task.getViewByName( "wWebXfer" );
      if ( VmlOperation.isValid( wWebXfer ) == false )
         task.log( ).debug( "Invalid View: " + "EBRegistrantName" );
      else
      {
         nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = wWebXfer.cursor( "Root" ).getAttribute( "AttemptLoginRegistrant" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBRegistrantName: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBRegistrantName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Root.AttemptLoginRegistrant: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBRegistrantName: " + "wWebXfer.Root" );
      }
   }
%>

<input class="text14" name="EBRegistrantName" id="EBRegistrantName" style="width:256px;position:absolute;left:146px;top:54px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" onKeyPress="return _OnEnter( event )" >

<% /* PBLogin:PushBtn */ %>
<span style="text-align: center"></span>
<button type="button" class="formStylebutton" name="PBLogin" id="PBLogin" value="" onclick="ProcessUserLogin( )" style="width: 140px; height: 32px; position: absolute; left: 146px; top: 172px;">Login</button>

<% /* UserName::Text */ %>

<label class="text14bold"  id="UserName:" name="UserName:" style="width:118px;height:16px;position:absolute;left:16px;top:80px;">User Name:</label>

<% /* EBUserName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBUserName", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      wWebXfer = task.getViewByName( "wWebXfer" );
      if ( VmlOperation.isValid( wWebXfer ) == false )
         task.log( ).debug( "Invalid View: " + "EBUserName" );
      else
      {
         nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = wWebXfer.cursor( "Root" ).getAttribute( "AttemptLoginName" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBUserName: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBUserName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Root.AttemptLoginName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBUserName: " + "wWebXfer.Root" );
      }
   }
%>

<input class="text14" name="EBUserName" id="EBUserName" style="width:256px;position:absolute;left:146px;top:80px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" onKeyPress="return _OnEnter( event )" >

<% /* Forgot:Text */ %>

<a href="#" id="Forgot" name="Forgot"  onclick="FORGOT_Password( );" class="text10" style="width: 208px; height: 22px; position: absolute; left: 146px; top: 211px;">Forgot Username/Password?</a>

<% /* Password::Text */ %>

<label class="text14bold"  id="Password:" name="Password:" style="width:118px;height:16px;position:absolute;left:16px;top:108px;">Password:</label>

<% /* EBPassword:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBPassword", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      wWebXfer = task.getViewByName( "wWebXfer" );
      if ( VmlOperation.isValid( wWebXfer ) == false )
         task.log( ).debug( "Invalid View: " + "EBPassword" );
      else
      {
         nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = wWebXfer.cursor( "Root" ).getAttribute( "AttemptPassword" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPassword: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBPassword", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Root.AttemptPassword: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBPassword: " + "wWebXfer.Root" );
      }
   }
%>

<input class="text14" name="EBPassword" id="EBPassword" style="width:256px;position:absolute;left:146px;top:108px;<%=strErrorColor%>" type="password" value="<%=strErrorMapValue%>" onKeyPress="return _OnEnter( event )" >

<% /* PrimaryRegistrants:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="PrimaryRegistrants" id="PrimaryRegistrants" size="1"style="width:194px;position:absolute;left:146px;top:132px;" onchange="PrimaryRegistrantsOnChange( )">

<%
   pePamms = task.getViewByName( "pePamms" );
   if ( VmlOperation.isValid( pePamms ) )
   {
         strComboCurrentValue = "";
      View vPrimaryRegistrants;
      pePamms = task.getViewByName( "pePamms" );
      if ( VmlOperation.isValid( pePamms ) )
      {
         nRC = pePamms.cursor( "Organization" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strComboCurrentValue = pePamms.cursor( "Organization" ).getAttribute( "Name" ).getString( "" );
            if ( strComboCurrentValue == null )
               strComboCurrentValue = "";
         }
      }
      vPrimaryRegistrants = pePamms.newView( );
      ComboCount = 0;
      strComboSelectedValue = "0";
      csrRC = vPrimaryRegistrants.cursor( "PrimaryRegistrant" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         strErrorMapValue = vPrimaryRegistrants.cursor( "Organization" ).getAttribute( "Name" ).getString( "" );
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
         csrRC =  vPrimaryRegistrants.cursor( "PrimaryRegistrant" ).setNextContinue( );
      }

      vPrimaryRegistrants.drop( );

   }
%>
</select>
<input name="hPrimaryRegistrants" id="hPrimaryRegistrants" type="hidden" value="<%=strComboSelectedValue%>" >


</div>  <!--  WelcomeContainer -->
</div>  
<p>
  <!-- End of a new line -->
  
  
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
  
</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>
  <%@ include file="./include/footer.inc" %>
  </div>
</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</form>
</div>   
<!-- This is the end tag for the div 'contentnosidemenu' -->

</div>   <!-- This is the end tag for the div 'maincontent' -->  <!-- This is the end tag for wrapper -->

</body>
</html>
<%
   session.setAttribute( "ZeidonWindow", "wStartUpUserLogin" );
   session.setAttribute( "ZeidonAction", null );

   if ( task != null && strActionToProcess == null  )
   {
      task.log().info( "After building the page UnregisterZeidonApplication: ------>>> " + "wStartUpUserLogin" );
   // task.dropTask();
   // task = null;
   // session.setAttribute( "ZeidonTaskId", task );
   }

   strActionToProcess = "";

%>
