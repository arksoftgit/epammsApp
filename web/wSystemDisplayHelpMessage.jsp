<!DOCTYPE HTML>

<%-- wSystemDisplayHelpMessage   Generate Timestamp: 20160426145257472 --%>

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

public int DoInputMapping( HttpServletRequest request,
                           HttpSession session,
                           ServletContext application,
                           boolean webMapping )
{
   int    nMapError = 1;

   if ( webMapping == false )
      session.setAttribute( "ZeidonError", null );

   return nMapError;
}

%>

<%

session = request.getSession( );
Task task = null;
View wWebXA = null;
KZMSGQOO_Object mMsgQ = null; // view to Message Queue
View vKZXMLPGO = null;
boolean bDone = false;
int nRC = 0;

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
String strDateFormat = "";
String strLoginName = "";
String strKeyRole = "";
String strHelpDialogWindow = "";
String strLastWindow;
String strLastAction;
String strNextJSP_Name = "";

// hand coded
String taskId = (String) session.getAttribute( "ZeidonTaskId" );
if ( StringUtils.isBlank( taskId ) )
{
   strURL = response.encodeRedirectURL( "logout.jsp" );
   response.sendRedirect( strURL );
   return;
}

   task = objectEngine.getTaskById( taskId );
if ( task == null )
{
   session.removeAttribute( "ZeidonTaskId" );
   strURL = response.encodeRedirectURL( "logout.jsp" );
   response.sendRedirect( strURL );
   return; // something really bad has happened!!!
}

strActionToProcess = (String) request.getParameter( "zAction" );
strLastAction = (String) session.getAttribute( "ZeidonAction" );
strLastWindow = (String) session.getAttribute( "ZeidonWindow" );
task.log().info( "session: " + session );
task.log().info("*** wSystemDisplayHelpMessage strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSystemDisplayHelpMessage LastWindow *** " + strLastWindow );
task.log().info("*** wSystemDisplayHelpMessage LastAction *** " + strLastAction );

if ( strLastWindow.equals("wSystemDisplayHelpMessage") ) {
   if ( StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) ) {
      strURL = response.encodeRedirectURL( "logout.jsp" );
      response.sendRedirect( strURL );
      return;
   }
   strHelpDialogWindow = (String) session.getAttribute( "HelpDialogWindow" );
} else if ( strLastWindow.equals("wSystemUpdateHelpMessage") ) {
   strHelpDialogWindow = (String) session.getAttribute( "HelpDialogWindow" );
} else {
   session.setAttribute( "HelpDialogWindow", strLastWindow );
   strHelpDialogWindow = strLastWindow;
}

task.log().info("*** wSystemDisplayHelpMessage HelpDialogWindow *** " + strHelpDialogWindow );

vKZXMLPGO = JspWebUtils.createWebSession( null, task, "" );
mMsgQ = new KZMSGQOO_Object( vKZXMLPGO );
mMsgQ.setView( VmlOperation.getMessageObject( task ) );
wSystem_Dialog wSystem = new wSystem_Dialog( vKZXMLPGO );

task.log().info("*** wSystemDisplayHelpMessage Last Window: " + strLastWindow + "************************************************************************************" );
task.log().info("*** wSystemDisplayHelpMessage Help Window: " + strHelpDialogWindow + "#####################################################################################" );
/*
View mHelp = new QualificationBuilder( task )
                 .setLodDef( "mHelp" )
                 .addAttribQual( "ePamms", "ID", "=", "1" )
                 .activate();
EntityCursor ect = mHelp.cursor( "Help" );
CursorResult r = ect.setFirst();
while ( r.isSet() ) {
   ect.deleteEntity( CursorPosition.NONE );
   r = ect.setNext();
}
mHelp.commit();
*/
View sHelp = task.getViewByName( "sHelp" );
if ( VmlOperation.isValid( sHelp ) ) {
   sHelp.drop();
}
sHelp = new QualificationBuilder( task )
                    .setLodDef( "sHelp" )
                    .addAttribQual( "Help", "DialogWindow", "=", strHelpDialogWindow )
                    .activate();
sHelp.setName( "sHelp" );
task.log().info("*** wSystemDisplayHelpMessage OI 111 - HelpDialogWindow: " + strHelpDialogWindow );
sHelp.logObjectInstance();
EntityCursor ec = sHelp.cursor( "Help" );
CursorResult cr = ec.setFirst();
if ( cr.isSet() == false ) {
   View rePamms = new QualificationBuilder( task )
                 .setLodDef( "rePamms" )
                 .addAttribQual( "ePamms", "ID", "=", "1" )
                 .activate();
   rePamms.logObjectInstance();
   ec.createEntity();
   ec.getAttribute( "DialogWindow" ).setValue( strHelpDialogWindow );
   ec.getAttribute( "Message" ).setValue( "No help available for: " + strHelpDialogWindow );
   ec = sHelp.cursor( "ePamms" );
   ec.includeSubobject( rePamms.cursor( "ePamms" ) );
   sHelp.commit();
}
   task.log().info("*** wSystemDisplayHelpMessage OI *** HelpDialogWindow: " + strHelpDialogWindow );
   sHelp.logObjectInstance();
// end of: hand coded

strURL = "";
bDone = false;
nRC = 0;

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "EditHelpMessage" ) )
   {
      bDone = true;
   // VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemDisplayHelpMessage", strActionToProcess );
      session.setAttribute( "ZeidonAction", strActionToProcess );

      // Next Window
      strNextJSP_Name = "wSystemUpdateHelpMessage.jsp";
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ExitHelp" ) )
   {
      bDone = true;
   // VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemDisplayHelpMessage", strActionToProcess );
      session.setAttribute( "ZeidonAction", strActionToProcess );

      // Action Operation
   // VmlOperation.SetZeidonSessionAttribute( null, task, "wSystemDisplayHelpMessage", "wSystem.ExitHelp" );
      wSystem.ExitHelp( new zVIEW( vKZXMLPGO ) );
   // session.removeAttribute( "ZeidonTaskId" );
      String s = (String) session.getAttribute( "HelpDialogWindow" );
      session.setAttribute( "ZeidonWindow", s );
      session.removeAttribute( "HelpDialogWindow" );
      task.log().info( "ExitHelp: ----->>> " + s );
      strNextJSP_Name = "wSystemExitHelpMessage.jsp";
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
   // session.removeAttribute( "ZeidonTaskId" );
      String s = (String) session.getAttribute( "HelpDialogWindow" );
      session.setAttribute( "ZeidonWindow", s );
      session.removeAttribute( "HelpDialogWindow" );
      task.log().info( "_OnUnload: ----->>> " + s );
      if ( task != null )
      {
         task = null;
      }
      return;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnTimeout" ) )
   {
      bDone = true;
   // session.removeAttribute( "ZeidonTaskId" );
      String s = (String) session.getAttribute( "HelpDialogWindow" );
      session.setAttribute( "ZeidonWindow", s );
      session.removeAttribute( "HelpDialogWindow" );
      task.log().info( "_OnTimeout: ------->>> " + s );
      if ( task != null )
      {
         task = null;
      }
      return;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnResubmitPage" ) )
   {
      bDone = true;
   // VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemDisplayHelpMessage", strActionToProcess );
      session.setAttribute( "ZeidonAction", strActionToProcess );
      task.log().info( "_OnResubmitPage ------->>> " + "wSystemDisplayHelpMessage" );
      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSystemDisplayHelpMessage.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSystemDisplayHelpMessage.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSystemDisplayHelpMessage.jsp") )
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
            strURL = response.encodeRedirectURL( "wSystemDisplayHelpMessage.jsp" );
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
// hand coded
   strBannerName = "./include/ePammsBannerDisplayHelp.inc";
   if ( task != null ) {
   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wSystem", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "DisplayHelpMessage", "" );
   }
   }
// end of: hand coded

%>

<html>
<head>

<title>ePamms Help</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSystemDisplayHelpMessage.js"></script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<%@ include file="./include/pagebackground.inc" %>  <!-- just temporary until we get the painter dialog updates from Kelly ... 2011.10.08 dks -->

<div id="wrapper">

<jsp:include page='<%=strBannerName %>' />

<!-- Main Navigation *********************** -->
<div id="mainnavigation">
   <ul id="ExitHelp" name="ExitHelp" >
       <li id="lmEditHelpMessage" name="lmEditHelpMessage" ><a href="#" onclick="mEditHelpMessage()">Edit Help Message</a></li>
       <li id="lmExitHelp" name="lmExitHelp" ><a href="#" onclick="mExitHelp()">Exit Help</a></li>
   </ul>
</div>  <!-- end Navigation Bar -->

<%@include file="./include/topmenuend.inc" %>
<div id="maincontent">
<div id="contentnosidemenu">
<!--System Maintenance-->

<%@ include file="./include/systemmaintenance.inc" %>

<!-- END System Maintenance-->


<form name="wSystemDisplayHelpMessage" id="wSystemDisplayHelpMessage" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   String strErrorMapValue = "";
   String strTextDisplayValue = "";
   String strSolicitSave = "";
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSystem", "DisplayHelpMessage" );
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
   <input name="zErrorFlag" id="zErrorFlag" type="hidden" value="<%=strErrorFlag%>">
   <input name="zTimeout" id="zTimeout" type="hidden" value="300">
   <input name="zSolicitSave" id="zSolicitSave" type="hidden" value="<%=strSolicitSave%>">

   <div name="ShowVMLError" id="ShowVMLError" class="ShowVMLError">
      <%=strVMLError%>
   </div>


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:636px;">&nbsp&nbsp</span>
<% /* HelpMsg:Text */ %>
<% strTextDisplayValue = "";
   sHelp = task.getViewByName( "sHelp" );
   if ( VmlOperation.isValid( sHelp ) == false )
      task.log( ).debug( "Invalid View: " + "HelpMsg" );
   else
   {
      nRC = sHelp.cursor( "Help" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = sHelp.cursor( "Help" ).getAttribute( "Message" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on HelpMsg: " + e.getMessage());
         task.log().info( "*** Error on ctrl HelpMsg" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span id="HelpMsg" name="HelpMsg" style="width:100%;height:636px;"><%=strTextDisplayValue%></span>

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
<script type="text/javascript">animatedcollapse.init();</script>
</html>
<%
   session.setAttribute( "ZeidonWindow", "wSystemDisplayHelpMessage" );
   task.log().info( "After building the page setting ZeidonWindow: ------>>> " + "wSystemDisplayHelpMessage" );
   session.setAttribute( "ZeidonAction", null );

// task.dropTask();
// task = null;
// session.removeAttribute( "ZeidonTaskId" );

   strActionToProcess = "";

%>
