<!DOCTYPE HTML>

<%-- wStartSecurityQuestionsUpdate   Generate Timestamp: 20160427103753760 --%>

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

if ( strLastWindow.equals("wStartSecurityQuestionsUpdate") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wStartSecurityQuestionsUpdate strActionToProcess *** " + strActionToProcess );
task.log().info("*** wStartSecurityQuestionsUpdate LastWindow *** " + strLastWindow );
task.log().info("*** wStartSecurityQuestionsUpdate LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SET_Question1" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartSecurityQuestionsUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartSecurityQuestionsUpdate", "wStartUp.SET_Question1" );
      nOptRC = wStartUp.SET_Question1( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStart.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStart.SetWebRedirection( vKZXMLPGO, wStart.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SET_Question2" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartSecurityQuestionsUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartSecurityQuestionsUpdate", "wStartUp.SET_Question2" );
      nOptRC = wStartUp.SET_Question2( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStart.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStart.SetWebRedirection( vKZXMLPGO, wStart.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SET_Question3" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartSecurityQuestionsUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartSecurityQuestionsUpdate", "wStartUp.SET_Question3" );
      nOptRC = wStartUp.SET_Question3( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStart.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStart.SetWebRedirection( vKZXMLPGO, wStart.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "UPDATE_SecurityQuestions" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartSecurityQuestionsUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartSecurityQuestionsUpdate", "wStartUp.UPDATE_SecurityQuestions" );
      nOptRC = wStartUp.UPDATE_SecurityQuestions( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStart.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStart.SetWebRedirection( vKZXMLPGO, wStart.zWAB_StayOnWindowWithRefresh, "", "" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wStartSecurityQuestionsUpdate" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wStartSecurityQuestionsUpdate" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartSecurityQuestionsUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wStartSecurityQuestionsUpdate.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wStartSecurityQuestionsUpdate.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wStartSecurityQuestionsUpdate.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wStartSecurityQuestionsUpdate.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wStartSecurityQuestionsUpdate", "wStart.CREATE_SecurityQuestionList" );
   nOptRC = wStart.CREATE_SecurityQuestionList( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getAttribute( "WebReturnMessage" ).getString( "" );
      strURLParameters = "?CallingPage=wStartSecurityQuestionsUpdate.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wStart" +
                         "&OperationName=" + "CREATE_SecurityQuestionList";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wStart", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "welcome_banner.gif";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wStart", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "SecurityQuestionsUpdate", "" );
   }

%>

<html>
<head>

<title>Update Security Questions</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wStartSecurityQuestionsUpdate.js"></script>

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


<form name="wStartSecurityQuestionsUpdate" id="wStartSecurityQuestionsUpdate" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
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

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getAttribute( "SolicitSaveFlag" ).getString( "" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wStart", "SecurityQuestionsUpdate" );
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
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox7:GroupBox */ %>

<div id="GroupBox7" name="GroupBox7" style="width:24px;height:116px;float:left;">  <!-- GroupBox7 --> 


</div>  <!--  GroupBox7 --> 
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox6:GroupBox */ %>
<div id="GroupBox6" name="GroupBox6" style="float:left;width:860px;" >

<table cols=1 style="width:860px;"  class="grouptable">

<tr>
<td valign="top"  class="contentdescription" style="width:834px;">
<% /* Text10:Text */ %>

<span class="contentdescription"  id="Text10" name="Text10" style="width:834px;height:46px;">In order to better assist you, we have implemented a challenge question section. The question/answer will help us validate your identity so you can immediately reset your password in the event you forget your password.</span>

</td>
</tr>
<tr>
<td valign="top"  class="contentdescription" style="width:832px;">
<% /* Text14:Text */ %>

<span class="contentdescription"  id="Text14" name="Text14" style="width:832px;height:42px;">Please note that this is a one-time set up process and you are required to complete this section before you continue. The questions should be easily answered by you but difficult for others to guess.</span>

</td>
</tr>
<tr>
<td valign="top"  class="contentdescription" style="width:832px;">
<% /* Text15:Text */ %>

<span class="contentdescription"  id="Text15" name="Text15" style="width:832px;height:36px;">Your Challenge Question and Answer should be treated like any other confidential information.  If you have any questions/concerns, please e-mail us at myenchelp@enc.edu</span>

</td>
</tr>
</table>

</div>  <!-- GroupBox6 --> 

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:24px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* Text7:Text */ %>

<span class="contentdescription"  id="Text7" name="Text7" style="width:592px;height:24px;">Use the predefined questions displayed on the right.</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox10:GroupBox */ %>

<div id="GroupBox10" name="GroupBox10" style="width:24px;height:116px;float:left;">  <!-- GroupBox10 --> 


</div>  <!--  GroupBox10 --> 
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox3:GroupBox */ %>
<div id="GroupBox3" name="GroupBox3" style="float:left;width:474px;" >

<table cols=3 style="width:474px;"  class="grouptable">

<tr>
<td valign="top" style="width:92px;">
<% /* Text16:Text */ %>

<span  id="Text16" name="Text16" style="width:88px;height:24px;">&nbsp</span>

</td>
<td valign="top" style="width:340px;">
<% /* Text1:Text */ %>

<span  id="Text1" name="Text1" style="width:298px;height:24px;">&nbsp</span>

</td>
<td valign="top" style="width:36px;">
<% /* Text2:Text */ %>

<span  id="Text2" name="Text2" style="width:36px;height:24px;">&nbsp</span>

</td>
</tr>
<tr>
<td valign="top"  class="text10bold" style="width:92px;">
<% /* Text4:Text */ %>

<span class="text10bold"  id="Text4" name="Text4" style="width:88px;height:22px;">Question 1:</span>

</td>
<td valign="top"  class="securityquestionborder" style="width:340px;">
<% /* GroupBox12:GroupBox */ %>
<div id="GroupBox12" name="GroupBox12" class="securityquestionborder" style="width:322px;height:20px;float:left;">


<div>  <!-- Beginning of a new line -->
<% /* Text13:Text */ %>

<span  id="Text13" name="Text13" style="width:320px;height:20px;">Text11</span>

</div>  <!-- End of a new line -->

</div>  <!-- GroupBox12 --> 
</td>
<td valign="top"  class="formStylebutton" style="width:36px;">
<% /* PushBtn5:PushBtn */ %>
<button type="button" class="formStylebutton"  id="PushBtn5" name="PushBtn5" value="<-" onclick="SET_Question1( )"  style="width:36px;height:22px;"><-</button>

</td>
</tr>
<tr>
<td valign="top"  class="text10bold" style="width:92px;">
<% /* Text8:Text */ %>

<span class="text10bold"  id="Text8" name="Text8" style="width:88px;height:24px;">Answer:</span>

</td>
<td valign="top"  class="text10" style="width:320px;">
<% /* EditBox5:EditBox */ %>
<input class="text10" name="EditBox5" id="EditBox5" maxlength="0" style="width:320px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:36px;">
<% /* Text23:Text */ %>

<span  id="Text23" name="Text23" style="width:36px;height:24px;">&nbsp</span>

</td>
<td>&nbsp</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:92px;">
<% /* Text3:Text */ %>

<span  id="Text3" name="Text3" style="width:88px;height:24px;">&nbsp</span>

</td>
<td valign="top" style="width:340px;">
<% /* Text18:Text */ %>

<span  id="Text18" name="Text18" style="width:298px;height:24px;">&nbsp</span>

</td>
<td valign="top" style="width:36px;">
<% /* Text19:Text */ %>

<span  id="Text19" name="Text19" style="width:36px;height:24px;">&nbsp</span>

</td>
</tr>
<tr>
<td valign="top"  class="text10bold" style="width:96px;">
<% /* Text5:Text */ %>

<span class="text10bold"  id="Text5" name="Text5" style="width:88px;height:22px;">Question 2:</span>

</td>
<td valign="top"  class="securityquestionborder" style="width:336px;">
<% /* GroupBox14:GroupBox */ %>
<div id="GroupBox14" name="GroupBox14" class="securityquestionborder" style="width:322px;height:20px;float:left;">


<div>  <!-- Beginning of a new line -->
<% /* Text27:Text */ %>

<span  id="Text27" name="Text27" style="width:320px;height:20px;">Text11</span>

</div>  <!-- End of a new line -->

</div>  <!-- GroupBox14 --> 
</td>
<td valign="top"  class="formStylebutton" style="width:36px;">
<% /* PushBtn6:PushBtn */ %>
<button type="button" class="formStylebutton"  id="PushBtn6" name="PushBtn6" value="<-" onclick="SET_Question2( )"  style="width:36px;height:22px;"><-</button>

</td>
</tr>
<tr>
<td valign="top"  class="text10bold" style="width:92px;">
<% /* Text9:Text */ %>

<span class="text10bold"  id="Text9" name="Text9" style="width:88px;height:24px;">Answer:</span>

</td>
<td valign="top"  class="text10" style="width:320px;">
<% /* EditBox6:EditBox */ %>
<input class="text10" name="EditBox6" id="EditBox6" maxlength="0" style="width:320px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:36px;">
<% /* Text25:Text */ %>

<span  id="Text25" name="Text25" style="width:36px;height:24px;">&nbsp</span>

</td>
<td>&nbsp</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:92px;">
<% /* Text20:Text */ %>

<span  id="Text20" name="Text20" style="width:88px;height:24px;">&nbsp</span>

</td>
<td valign="top" style="width:340px;">
<% /* Text21:Text */ %>

<span  id="Text21" name="Text21" style="width:298px;height:24px;">&nbsp</span>

</td>
<td valign="top" style="width:36px;">
<% /* Text22:Text */ %>

<span  id="Text22" name="Text22" style="width:36px;height:24px;">&nbsp</span>

</td>
</tr>
<tr>
<td valign="top"  class="text10bold" style="width:94px;">
<% /* Text6:Text */ %>

<span class="text10bold"  id="Text6" name="Text6" style="width:88px;height:22px;">Question 3:</span>

</td>
<td valign="top"  class="securityquestionborder" style="width:338px;">
<% /* GroupBox13:GroupBox */ %>
<div id="GroupBox13" name="GroupBox13" class="securityquestionborder" style="width:322px;height:20px;float:left;">


<div>  <!-- Beginning of a new line -->
<% /* Text26:Text */ %>

<span  id="Text26" name="Text26" style="width:320px;height:20px;">Text11</span>

</div>  <!-- End of a new line -->

</div>  <!-- GroupBox13 --> 
</td>
<td valign="top"  class="formStylebutton" style="width:36px;">
<% /* PushBtn7:PushBtn */ %>
<button type="button" class="formStylebutton"  id="PushBtn7" name="PushBtn7" value="<-" onclick="SET_Question3( )"  style="width:36px;height:22px;"><-</button>

</td>
</tr>
<tr>
<td valign="top"  class="text10bold" style="width:92px;">
<% /* Text11:Text */ %>

<span class="text10bold"  id="Text11" name="Text11" style="width:88px;height:24px;">Answer:</span>

</td>
<td valign="top"  class="text10" style="width:320px;">
<% /* EditBox9:EditBox */ %>
<input class="text10" name="EditBox9" id="EditBox9" maxlength="0" style="width:320px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
<td>&nbsp</td>
</tr>
<tr>
<td valign="top" style="width:36px;">
<% /* Text24:Text */ %>

<span  id="Text24" name="Text24" style="width:36px;height:24px;">&nbsp</span>

</td>
<td>&nbsp</td>
<td>&nbsp</td>
</tr>
</table>

</div>  <!-- GroupBox3 --> 

<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox8:GroupBox */ %>

<div id="GroupBox8" name="GroupBox8" style="width:16px;height:116px;float:left;">  <!-- GroupBox8 --> 


</div>  <!--  GroupBox8 --> 
<% /* GroupBox11:GroupBox */ %>

<div id="GroupBox11" name="GroupBox11" style="width:354px;height:304px;float:left;">  <!-- GroupBox11 --> 


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Text12:Text */ %>

<span class="text10bold"  id="Text12" name="Text12" style="width:156px;height:22px;">Predefined Questions:</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<% /* ListBox4:ListBox */ %>
<% strErrorMapValue = "";  %>

<select name="ListBox4" id="ListBox4" size="4" style="width:346px;height:270px;"  onclick="ListBox4OnClick( )">

<%
      }

      vListBox4.drop( );

   }
%>
<input name="hListBox4" id="hListBox4" type="hidden" value="<%=strComboSelectedValue%>" >
</select>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox11 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4" style="width:252px;height:36px;float:left;">  <!-- GroupBox4 --> 


</div>  <!--  GroupBox4 --> 
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox5:GroupBox */ %>

<div id="GroupBox5" name="GroupBox5" style="width:364px;height:44px;float:left;">  <!-- GroupBox5 --> 


<div>  <!-- Beginning of a new line -->
<% /* PushBtn2:PushBtn */ %>
<button type="button" class="formStylebutton" name="PushBtn2" id="PushBtn2" value="" onclick="UPDATE_SecurityQuestions( )" style="width:136px;height:30px;">Continue-></button>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox5 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:4px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox9:GroupBox */ %>

<div id="GroupBox9" name="GroupBox9" style="width:842px;height:24px;float:left;">  <!-- GroupBox9 --> 


</div>  <!--  GroupBox9 --> 
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
   session.setAttribute( "ZeidonWindow", "wStartSecurityQuestionsUpdate" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
