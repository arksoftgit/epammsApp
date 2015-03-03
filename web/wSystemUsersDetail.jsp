<!DOCTYPE HTML>

<%-- wSystemUsersDetail --%>

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

   View mUser = null;
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

   mUser = task.getViewByName( "mUser" );
   if ( VmlOperation.isValid( mUser ) )
   {
      // EditBox: UserName
      nRC = mUser.cursor( "User" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "UserName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "UserName", "", strMapValue );
            else
               mUser.cursor( "User" ).getAttribute( "UserName" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "UserName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: Password
      nRC = mUser.cursor( "User" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Password" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Password", "", strMapValue );
            else
               mUser.cursor( "User" ).getAttribute( "UserPassword" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Password", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ComboBox4
      mUser = task.getViewByName( "mUser" );
      if ( VmlOperation.isValid( mUser ) )
      {
         nRC = mUser.cursor( "UserGroup" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strMapValue = request.getParameter( "hComboBox4" );
            if ( strMapValue != null )
            {
               nRelPos = java.lang.Integer.parseInt( strMapValue );
               mUser.cursor( "UserGroup" ).setPosition( nRelPos, "" );
            }
         }

         }  // checkExistenceofEntity
      // ComboBox: ComboBox1
      nRC = mUser.cursor( "User" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hComboBox1" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ComboBox1", "", strMapValue );
            else
               mUser.cursor( "User" ).getAttribute( "Active" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ComboBox1", e.getReason( ), strMapValue );
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

if ( strLastWindow.equals("wSystemUsersDetail") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wSystem_Dialog wSystem = new wSystem_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wSystemUsersDetail strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSystemUsersDetail LastWindow *** " + strLastWindow );
task.log().info("*** wSystemUsersDetail LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ESC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemUsersDetail", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSystemUsersDetail.jsp", "wSystem.CancelUser" );
         nOptRC = wSystem.CancelUser( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSystem.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSystem.SetWebRedirection( vKZXMLPGO, wSystem.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "IncludeUserPerson" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemUsersDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSystemUsersDetail.jsp", "wSystem.IncludeUserPerson" );
         nOptRC = wSystem.IncludeUserPerson( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSystem.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSystem.SetWebRedirection( vKZXMLPGO, wSystem.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SaveUser" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemUsersDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSystemUsersDetail.jsp", "wSystem.SaveUser" );
         nOptRC = wSystem.SaveUser( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSystem.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSystem.SetWebRedirection( vKZXMLPGO, wSystem.zWAB_ReturnToParent, "", "" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wSystemUsersDetail" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wSystemUsersDetail" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemUsersDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSystemUsersDetail.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSystemUsersDetail.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSystemUsersDetail.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSystemUsersDetail.jsp" );
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
   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSystem", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString();

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wSystem" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "UsersDetail" );
   }

%>

<html>
<head>

<title>User Detail</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/md5.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSystemUsersDetail.js"></script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<%@ include file="./include/pagebackground.inc" %>  <!-- just temporary until we get the painter dialog updates from Kelly ... 2011.10.08 dks -->

<div id="wrapper">

<jsp:include page='<%=strBannerName %>' />

<div id="maincontent">
<div id="contentnosidemenu">

<!--System Maintenance-->

<%@ include file="./include/systemmaintenance.inc" %>

<!-- END System Maintenance-->


<form name="wSystemUsersDetail" id="wSystemUsersDetail" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View DOMAINT = null;
   View DOMAINTLST = null;
   View lMLCATgt = null;
   View lPersonLST = null;
   View lPrimReg = null;
   View lUserLST = null;
   View mCurrentUser = null;
   View mEPA = null;
   View mOrganiz = null;
   View mUser = null;
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

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getAttribute( "SolicitSaveFlag" ).getString();

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSystem", "UsersDetail" );
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
<% /* BreadCrumb:Text */ %>

<span class="text14"  id="BreadCrumb" name="BreadCrumb" style="width:356px;height:16px;">System > User > Detail</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox:GroupBox */ %>

<div id="GroupBox" name="GroupBox" class="noborder" style="width:438px;height:194px;float:left;">  <!-- GroupBox --> 


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Details:Text */ %>

<span class="mylegend"  id="Details" name="Details" style="width:462px;height:16px;">Details</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* FullName::Text */ %>

<span class="text10"  id="FullName:" name="FullName:" style="width:78px;height:16px;">Full Name:</span>

<% /* FullName:EditBox */ %>
<input class="text10" name="FullName" id="FullName" style="width:194px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* UserName::Text */ %>

<span class="text10"  id="UserName:" name="UserName:" style="width:78px;height:16px;">User Name:</span>

<% /* UserName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "UserName", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mUser = task.getViewByName( "mUser" );
      if ( VmlOperation.isValid( mUser ) == false )
         task.log( ).debug( "Invalid View: " + "UserName" );
      else
      {
         nRC = mUser.cursor( "User" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mUser.cursor( "User" ).getAttribute( "UserName" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on UserName: " + e.getMessage());
               task.log().error( "*** Error on ctrl UserName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "User.UserName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mUser.User" );
      }
   }
%>

<input class="text10" name="UserName" id="UserName" style="width:194px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Password::Text */ %>

<span class="text10"  id="Password:" name="Password:" style="width:78px;height:16px;">Password:</span>

<% /* Password:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Password", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mUser = task.getViewByName( "mUser" );
      if ( VmlOperation.isValid( mUser ) == false )
         task.log( ).debug( "Invalid View: " + "Password" );
      else
      {
         nRC = mUser.cursor( "User" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mUser.cursor( "User" ).getAttribute( "UserPassword" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Password: " + e.getMessage());
               task.log().error( "*** Error on ctrl Password", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "User.UserPassword: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mUser.User" );
      }
   }
%>

<input class="text10" name="Password" id="Password" style="width:194px;<%=strErrorColor%>" type="password" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Text5:Text */ %>

<span class="text10"  id="Text5" name="Text5" style="width:78px;height:16px;">Initials:</span>

<% /* EditBox4:EditBox */ %>
<input class="text10" name="EditBox4" id="EditBox4" style="width:194px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:22px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* ComboBox4:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select class="text10" name="ComboBox4" id="ComboBox4" size="1"style="width:194px;" onblur="ComboBox4OnBlur( )">

<%
   mUser = task.getViewByName( "mUser" );
   if ( VmlOperation.isValid( mUser ) )
   {
         strComboCurrentValue = "";
      View vComboBox4;
      mUser = task.getViewByName( "mUser" );
      if ( VmlOperation.isValid( mUser ) )
      {
         nRC = mUser.cursor( "User" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strComboCurrentValue = mUser.cursor( "User" ).getAttribute( "UserName" ).getString( "" );
            if ( strComboCurrentValue == null )
               strComboCurrentValue = "";
         }
      }
      vComboBox4 = mUser.newView( );
      ComboCount = 0;
      strComboSelectedValue = "0";
      nRC = vComboBox4.cursor( "UserGroup" ).setFirstWithinOi( );
      while ( csrRC.isSet() )
      {
         strErrorMapValue = vComboBox4.cursor( "UserGroup" ).getAttribute( "GroupName" ).getString( "" );
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
         csrRC =  vComboBox4.cursor( "UserGroup" ).setNextContinue( );
      }

      vComboBox4.drop( );

   }
%>
</select>
<input name="hComboBox4" id="hComboBox4" type="hidden" value="<%=strComboSelectedValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Text4:Text */ %>

<span class="text10"  id="Text4" name="Text4" style="width:78px;height:16px;">Person:</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Text6:Text */ %>

<span class="text10"  id="Text6" name="Text6" style="width:78px;height:16px;">Language:</span>

<% /* ComboBox1:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select class="text10" name="ComboBox1" id="ComboBox1" size="1" style="width:194px;" onchange="ComboBox1OnChange( )">

<%
   boolean inListComboBox1 = false;

   mUser = task.getViewByName( "mUser" );
   if ( VmlOperation.isValid( mUser ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mUser , "User", "Active", "" );

      nRC = mUser.cursor( "User" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mUser.cursor( "User" ).getAttribute( "Active" ).getString();
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
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:22px;">&nbsp&nbsp</span>
<% /* CheckBox2:CheckBox */ %>
<%
   strErrorMapValue = "";
   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="CheckBox2" id="CheckBox2"  value="Y" <%=strErrorMapValue%> style="">
<span class="text10" style="width:240px;height:22px;">&nbsp Report Only User</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox --> 
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" class="noborder" style="width:100px;height:120px;float:left;">  <!-- GroupBox2 --> 


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Actions::Text */ %>

<span class="mylegend"  id="Actions:" name="Actions:" style="width:94px;height:16px;">Actions:</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:28px;">&nbsp</span>
<% /* Save:PushBtn */ %>
<button type="button" class="formStylebutton" name="Save" id="Save" value="" onclick="SaveUser( )" style="width:82px;height:28px;">Save</button>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:28px;">&nbsp</span>
<% /* Cancel:PushBtn */ %>
<button type="button" class="formStylebutton" name="Cancel" id="Cancel" value="" onclick="ESC( )" style="width:82px;height:28px;">Cancel</button>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox2 --> 
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
</div>   <!-- This is the end tag for the div 'contentnosidemenu' -->

</div>   <!-- This is the end tag for the div 'maincontent' -->

<%@ include file="./include/footer.inc" %>

</div>  <!-- This is the end tag for wrapper -->

</body>
</html>
<%
   session.setAttribute( "ZeidonWindow", "wSystemUsersDetail" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
