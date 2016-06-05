<!DOCTYPE HTML>

<%-- wSystemPersonDetail   Generate Timestamp: 20160531205258256 --%>

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

if ( strLastWindow.equals("wSystemPersonDetail") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wSystemPersonDetail strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSystemPersonDetail LastWindow *** " + strLastWindow );
task.log().info("*** wSystemPersonDetail LastAction *** " + strLastAction );

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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemPersonDetail", strActionToProcess );

      // Next Window
      strNextJSP_Name = wSystem.SetWebRedirection( vKZXMLPGO, wSystem.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SavePerson" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemPersonDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSystemPersonDetail", "wSystem.SavePerson" );
      nOptRC = wSystem.SavePerson( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smReturnAction" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemPersonDetail", strActionToProcess );

      // Next Window
      strNextJSP_Name = wSystem.SetWebRedirection( vKZXMLPGO, wSystem.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mReturnToHomePage" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemPersonDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSystem.SetWebRedirection( vKZXMLPGO, wSystem.zWAB_StayOnWindowWithRefresh, "wStartUp", "UserLogin" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mChangePassword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemPersonDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSystem.SetWebRedirection( vKZXMLPGO, wSystem.zWAB_StartModalSubwindow, "wStartUp", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mLINK_ToHelp" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemPersonDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window unknown

      break;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wSystemPersonDetail" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wSystemPersonDetail" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSystemPersonDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSystemPersonDetail.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSystemPersonDetail.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSystemPersonDetail.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSystemPersonDetail.jsp" );
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
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wSystem", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "PersonDetail", "" );
   }

%>

<html>
<head>

<title>Person Detail</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSystemPersonDetail.js"></script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<%@ include file="./include/pagebackground.inc" %>  <!-- just temporary until we get the painter dialog updates from Kelly ... 2011.10.08 dks -->

<div id="wrapper">

<jsp:include page='<%=strBannerName %>' />

<!-- Main Navigation *********************** -->
<div id="mainnavigation">
   <ul id="TopMenu" name="TopMenu" >
       <li id="lmReturnToHomePage" name="lmReturnToHomePage" ><a href="#" onclick="mReturnToHomePage()">Home</a></li>
       <li id="lmChangePassword" name="lmChangePassword" ><a href="#" onclick="mChangePassword()">Password</a></li>
       <li id="lmLINK_ToHelp" name="lmLINK_ToHelp" ><a href="help\ePammsWeb.htm" target="_blank">Help</a></li>
       <li id="lmLOGOFF_Dialog" name="lmLOGOFF_Dialog" ><a href="#" onclick="mLOGOFF_Dialog()">Logout</a></li>
   </ul>
</div>  <!-- end Navigation Bar -->

<%@include file="./include/topmenuend.inc" %>
<div id="maincontent">

<div id="leftcontent">

<!-- Side Navigation *********************** -->
<div id="sidenavigation">
   <ul id="ShortMenu" name="ShortMenu">
<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Return" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smReturn" name="smReturn"><a href="#"  onclick="smReturnAction()">Return</a></li>
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


<form name="wSystemPersonDetail" id="wSystemPersonDetail" method="post">
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
   View sHelp = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSystem", "PersonDetail" );
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
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Text26:Text */ %>

<span class="text14"  id="Text26" name="Text26" style="width:356px;height:16px;" tabindex=-1 >System > Person > Detail</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" class="noborder" style="width:538px;height:122px;float:left;">  <!-- GroupBox1 --> 


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Text28:Text */ %>

<span class="mylegend"  id="Text28" name="Text28" style="width:526px;height:16px;" tabindex=-1 >Details</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp</span>
<% /* Text2:Text */ %>

<span class="text10"  id="Text2" name="Text2" style="width:84px;height:16px;" tabindex=-1 >Last Name:</span>

<% /* EditBox1:EditBox */ %>
<input class="text10" name="EditBox1" id="EditBox1" maxlength="0" style="width:88px;<%=strErrorColor%>" tabindex=1  type="text" value="<%=strErrorMapValue%>" >

<% /* Text6:Text */ %>

<span class="text10"  id="Text6" name="Text6" style="width:76px;height:16px;" tabindex=-1 >First Name:</span>

<% /* EditBox5:EditBox */ %>
<input class="text10" name="EditBox5" id="EditBox5" maxlength="0" style="width:88px;<%=strErrorColor%>" tabindex=2  type="text" value="<%=strErrorMapValue%>" >

<% /* Text8:Text */ %>

<span class="text10"  id="Text8" name="Text8" style="width:90px;height:16px;" tabindex=-1 >Middle Name:</span>

<% /* EditBox2:EditBox */ %>
<input class="text10" name="EditBox2" id="EditBox2" maxlength="0" style="width:88px;<%=strErrorColor%>" tabindex=3  type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp</span>
<% /* Text1:Text */ %>

<span class="text10"  id="Text1" name="Text1" style="width:84px;height:16px;" tabindex=-1 >Prefix:</span>

<% /* EditBox3:EditBox */ %>
<input class="text10" name="EditBox3" id="EditBox3" maxlength="0" style="width:88px;<%=strErrorColor%>" tabindex=4  type="text" value="<%=strErrorMapValue%>" >

<% /* Text5:Text */ %>

<span class="text10"  id="Text5" name="Text5" style="width:76px;height:16px;" tabindex=-1 >EMail:</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* EditBox4:EditBox */ %>
<input class="text10" name="EditBox4" id="EditBox4" maxlength="0" style="width:182px;<%=strErrorColor%>" tabindex=5  type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:30px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp</span>
<% /* Text3:Text */ %>

<span class="text10"  id="Text3" name="Text3" style="width:84px;height:16px;" tabindex=-1 >Is User:</span>

<% /* Text7:Text */ %>

<span class="text10bold"  id="Text7" name="Text7" style="width:88px;height:16px;" tabindex=-1 >Text7</span>

<% /* Text16:Text */ %>

<span class="text10"  id="Text16" name="Text16" style="width:90px;height:16px;" tabindex=-1 >Is Employee:</span>

<% /* Text17:Text */ %>

<span class="text10bold"  id="Text17" name="Text17" style="width:48px;height:16px;" tabindex=-1 >Text7</span>

<% /* Text18:Text */ %>

<span class="text10bold"  id="Text18" name="Text18" style="width:200px;height:16px;" tabindex=-1 >Text7</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox1 --> 
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" class="noborder" style="width:106px;height:124px;float:left;">  <!-- GroupBox2 --> 


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Text20:Text */ %>

<span class="mylegend"  id="Text20" name="Text20" style="width:94px;height:16px;" tabindex=-1 >Actions</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:28px;">&nbsp&nbsp</span>
<% /* PushBtn1:PushBtn */ %>
<button type="button" class="formStylebutton" name="PushBtn1" id="PushBtn1" value="" onclick="SavePerson( )" style="width:82px;height:28px;" tabindex=19 >Save</button>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:28px;">&nbsp&nbsp</span>
<% /* PushBtn2:PushBtn */ %>
<button type="button" class="formStylebutton" name="PushBtn2" id="PushBtn2" value="" onclick="ESC( )" style="width:82px;height:28px;" tabindex=-1 >Cancel</button>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox2 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:538px;height:108px;float:left;">  <!-- GroupBox3 --> 


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Text29:Text */ %>

<span class="mylegend"  id="Text29" name="Text29" style="width:526px;height:16px;" tabindex=-1 >Address</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp</span>
<% /* Text9:Text */ %>

<span class="text10"  id="Text9" name="Text9" style="width:84px;height:16px;" tabindex=-1 >Line 1:</span>

<% /* EditBox7:EditBox */ %>
<input class="text10" name="EditBox7" id="EditBox7" maxlength="0" style="width:136px;<%=strErrorColor%>" tabindex=7  type="text" value="<%=strErrorMapValue%>" >

<span style="height:16px;">&nbsp</span>
<% /* Text12:Text */ %>

<span class="text10"  id="Text12" name="Text12" style="width:102px;height:16px;" tabindex=-1 >City:</span>

<% /* EditBox10:EditBox */ %>
<input class="text10" name="EditBox10" id="EditBox10" maxlength="0" style="width:136px;<%=strErrorColor%>" tabindex=10  type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp</span>
<% /* Text10:Text */ %>

<span class="text10"  id="Text10" name="Text10" style="width:84px;height:16px;" tabindex=-1 >Line 2:</span>

<% /* EditBox8:EditBox */ %>
<input class="text10" name="EditBox8" id="EditBox8" maxlength="0" style="width:136px;<%=strErrorColor%>" tabindex=8  type="text" value="<%=strErrorMapValue%>" >

<span style="height:16px;">&nbsp</span>
<% /* Text13:Text */ %>

<span class="text10"  id="Text13" name="Text13" style="width:102px;height:16px;" tabindex=-1 >State Province:</span>

<% /* EditBox11:EditBox */ %>
<input class="text10" name="EditBox11" id="EditBox11" maxlength="0" style="width:136px;<%=strErrorColor%>" tabindex=13  type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp</span>
<% /* Text11:Text */ %>

<span class="text10"  id="Text11" name="Text11" style="width:84px;height:16px;" tabindex=-1 >Line 3:</span>

<% /* EditBox9:EditBox */ %>
<input class="text10" name="EditBox9" id="EditBox9" maxlength="0" style="width:136px;<%=strErrorColor%>" tabindex=9  type="text" value="<%=strErrorMapValue%>" >

<span style="height:16px;">&nbsp</span>
<% /* Text14:Text */ %>

<span class="text10"  id="Text14" name="Text14" style="width:102px;height:16px;" tabindex=-1 >Country:</span>

<% /* EditBox12:EditBox */ %>
<input class="text10" name="EditBox12" id="EditBox12" maxlength="0" style="width:136px;<%=strErrorColor%>" tabindex=14  type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* Text15:Text */ %>

<span class="text10"  id="Text15" name="Text15" style="width:102px;height:16px;" tabindex=-1 >Postal Code:</span>

<% /* EditBox13:EditBox */ %>
<input class="text10" name="EditBox13" id="EditBox13" maxlength="0" style="width:136px;<%=strErrorColor%>" tabindex=15  type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox3 --> 
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
   session.setAttribute( "ZeidonWindow", "wSystemPersonDetail" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
