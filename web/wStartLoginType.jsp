<!DOCTYPE HTML>

<%-- wStartLoginType --%>

<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="zeidon.zView" %>
<%@ page import="com.quinsoft.epamms.*" %>

<%@ page import="com.quinsoft.epamms.*" %>

<%! 

public String ReplaceXSSValues( String szFieldValue )
{
   String szOutput;
   szOutput = szFieldValue.replace("<","&lt;");
   szOutput = szOutput.replace(">","&gt;");
   szOutput = szOutput.replace("\"","&quot;");
   szOutput = szOutput.replace("\'","&apos;");
   return( szOutput );
}

public int DoInputMapping( HttpServletRequest request,
                           HttpSession session,
                           ServletContext application )
{
   String strSID = session.getId( );
   zeidon.zView vAS = (zeidon.zView) session.getAttribute( "ZeidonSubtask" );

   zeidon.zView vGridTmp = new zeidon.zView( strSID ); // temp view to grid view
   zeidon.zView vMsgQ = new zeidon.zView( strSID ); // view to Message Queue
   zeidon.zView v = new zeidon.zView( strSID );     // view to Message Queue

   String strError = "";
   String strDateFormat = "";
   String strMapValue = "";
   int    iView = 0;
   int    lEntityKey = 0;
   String strEntityKey = "";
   String strTag = "";
   String strTemp = "";
   int    iTableRowCnt = 0;
   String strSuffix = "";
   int    nRelPos = 0;
   int    nRC = 0;
   int    nMapError = 0;

   if ( nMapError < 0 )
   {
      iView = vAS.GetIntegerFromView( strSID );
      vAS.TraceLine( "DoInputMapping ERROR =======>> ", strError );
      nRC = vMsgQ.GetView( strSID, "__MSGQ", vAS );
      if ( nRC > 0 )
      {
         v.CreateViewFromView( strSID, vMsgQ );
         vAS.TraceLine( "DoInputMapping found __MSGQ", "" );
         v.DisplayObjectInstance( strSID );
         vAS.TraceLine( "DoInputMapping __MSGQ View: ", iView );
         nRC = v.SetCursorFirst( strSID, "Task", "Id", iView, "" );
         vAS.TraceLine( "DoInputMapping SetCursorFirst RC: ", nRC );
         if ( nRC == 0 )
         {
            nRC = v.SetCursorFirst( strSID, "QMsg" );
            if ( nRC == 0 )
            {
               vAS.TraceLine( "DoInputMapping found QMsg Entity", "" );
               v.SetAttributeFromVariable( strSID, "QMsg", "Title", strError, 'S',
                                           strError.length( ) + 1, "", 8 );
            }

            while ( nRC == 0 )
            {
               v.DisplayEntityInstance( strSID, "QMsg" );
               nRC = v.SetCursorNext( strSID, "QMsg" );
               vAS.TraceLine( "DoInputMapping SetCursorNext RC: ", nRC );
            }

            vAS.TraceLine( "DoInputMapping after __MSGQ", "" );
            nRC = 0;
         }

         v.DisplayObjectInstance( strSID );
         v.DropView( strSID );
         nRC = -1;
      }

      return( nRC );
   }

   return( 1 );
}

%>

<%

session = request.getSession( );
String strSessionId = session.getId( );
zeidon.zView vAppSubtask; // view to this subtask
zeidon.zView vMsgQ = new zeidon.zView( strSessionId ); // view to Message Queue
zView vKZXMLPGO = null;
String strLastPage;
short  nRepos = 0;
int bDone = 0;
int nPos = 0;
int nOptRC = 0;
int nRC = 0;

int nRCk = 0;  // temp fix for SetCursorEntityKey

int lEKey = 0; // temp fix for SetCursorEntityKey

String strKey = "";
String strActionToProcess = "";
String strURL = "";
String strError = "";
String strErrorFlag = "";
String strErrorTitle = "";
String strErrorMsg = "";
String strFocusCtrl = "";
String strBannerName = "";
String strOpenFile = "";
String strOpenPopupWindow = "";
String strPopupWindowSZX = "";
String strPopupWindowSZY = "";
String strDateFormat = "";
String strKeyRole = "";
String strDialogName = "";
String strWindowName = "";
String strLastWindow = "";
String strLastAction = "";
String strFunctionCall = "";
String strNextJSP_Name = "";
String strInputFileName = "";
int iFileLth = 0;

   strActionToProcess = (String) request.getParameter( "zAction" );

strLastWindow = (String) session.getAttribute( "ZeidonWindow" );
if ( strLastWindow == null ) 
strLastWindow = "NoLastWindow";
strLastAction = (String) session.getAttribute( "ZeidonAction" );

if ( strLastWindow.equals("wStartLoginType") && strActionToProcess == null && strLastAction == null )
{
   strURL = response.encodeRedirectURL( "logout.jsp" );
   response.sendRedirect( strURL );
   return;
}

// Check to see if the Zeidon subtask view already exists.  If not, create
// it and copy it into the application object.
vAppSubtask = (zeidon.zView) session.getAttribute( "ZeidonSubtask" );
if ( vAppSubtask == null )
{
   vAppSubtask = new zeidon.zView( strSessionId );
   vAppSubtask.RegisterZeidonApplication( strSessionId, "//epamms" );
   session.setAttribute( "ZeidonSubtask", vAppSubtask );
}

if ( vAppSubtask == null )
{
   return; // something really bad has happened!!!
}
else
{
   if ( vKZXMLPGO == null )
      vKZXMLPGO = new zeidon.zView( strSessionId );

   nRC = vKZXMLPGO.GetView( strSessionId, "KZXMLPGO", vAppSubtask );
   if ( nRC <= 0 )
   {
      vKZXMLPGO.InitWebSessionObject( strSessionId, vAppSubtask, "TestUserID" );
      vKZXMLPGO.SetName( strSessionId, "KZXMLPGO" );
   }

   nRC = vMsgQ.GetView( strSessionId, "__MSGQ", vAppSubtask );
   vAppSubtask.SetDefaultViewForActiveTask( strSessionId, 2 );

   strURL = "";
   bDone = 0;
   nRC = 0;
}

vAppSubtask.TraceLine("*** wStartLoginType strActionToProcess *** ", strActionToProcess );

vAppSubtask.TraceLine("*** wStartLoginType LastWindow *** ", strLastWindow );
strLastAction = (String) session.getAttribute( "ZeidonAction" );
vAppSubtask.TraceLine("*** wStartLoginType LastAction *** ", strLastAction );

if ( strActionToProcess != null )
{
   if ( vAppSubtask != null )
   {
      // Delete the message object if error on last interation.
      nRC = vMsgQ.GetView( strSessionId, "__MSGQ", vAppSubtask );
      if ( nRC > 0 )
         vMsgQ.DropObjectInstance( strSessionId );
   }

   while ( bDone == 0 && strActionToProcess.equals( "GOTO_SelectedRole" ) )
   {
      bDone = 1;

      session.setAttribute( "ZeidonAction", "GOTO_SelectedRole" );

      // Input Mapping
      nRC = DoInputMapping( request, session, application );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      nOptRC = vAppSubtask.CallDialogOperation( strSessionId, "wStart", "GOTO_SelectedRole", 0 );
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.CheckExistenceOfEntity( strSessionId, "NextDialogWindow" );
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.GetString( strSessionId, "NextDialogWindow", "DialogName" );
         strWindowName = vKZXMLPGO.GetString( strSessionId, "NextDialogWindow", "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.DeleteEntity( strSessionId, "NextDialogWindow", nRepos );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.CheckExistenceOfEntity( strSessionId, "NextDialogWindow" );
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.GetString( strSessionId, "NextDialogWindow", "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall.equals( "StartSubwindow" ) )
         {
            vKZXMLPGO.CreateEntity( strSessionId, "PagePath", vKZXMLPGO.zPOS_AFTER );
            vKZXMLPGO.SetAttribute( strSessionId, "PagePath", "LastPageName", "wStartLoginType" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      break;
   }

   while ( bDone == 0 && strActionToProcess.equals( "ZEIDON_ComboBoxSubmit" ) )
   {
      bDone = 1;

      // Input Mapping
      nRC = DoInputMapping( request, session, application );
      if ( nRC < 0 )
         break;

      // No redirection, we are staying on this page.
      nRC = 0;
      break;
   }

   while ( bDone == 0 && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = 1;
      if ( vAppSubtask != null )
      {
         nOptRC = vAppSubtask.CallDialogOperation( strSessionId, "zGLOBALW", "CleanupObjects", 0 );
         vAppSubtask.TraceLine( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> ", "wStartLoginType" );
         vAppSubtask.UnregisterZeidonApplication( strSessionId );
         vAppSubtask = null;
         session.setAttribute( "ZeidonSubtask", vAppSubtask );
      }

      // Next Window is HTML termination
      strURL = response.encodeRedirectURL( "logout.jsp" );
      response.sendRedirect( strURL );
      return;
   }

   while ( bDone == 0 && strActionToProcess.equals( "_OnTimeout" ) )
   {
      bDone = 1;
      if ( vAppSubtask != null )
      {
         nOptRC = vAppSubtask.CallDialogOperation( strSessionId, "zGLOBALW", "CleanupObjects", 0 );
         vAppSubtask.TraceLine( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> ", "wStartLoginType" );
         vAppSubtask.UnregisterZeidonApplication( strSessionId );
         vAppSubtask = null;
         session.setAttribute( "ZeidonSubtask", vAppSubtask );
      }

      // Next Window is HTML termination
      strURL = response.encodeRedirectURL( "TimeOut.html" );
      response.sendRedirect( strURL );
      return;
   }

   while ( bDone == 0 && strActionToProcess.equals( "_OnResubmitPage" ) )
   {
      bDone = 1;
      session.setAttribute( "ZeidonAction", "_OnResubmitPage" );

      // Input Mapping
      nRC = DoInputMapping( request, session, application );
      if ( nRC < 0 )
         break;
      strURL = response.encodeRedirectURL( "wStartLoginType.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wStartLoginType.jsp" );
            vAppSubtask.TraceLine( "Action Error Redirect to: ", strURL );
         }

         strActionToProcess = "";
         response.sendRedirect( strURL );
      }
      else
      {
         if ( nRC > -128 )
         {
            strActionToProcess = "";
            strURL = response.encodeRedirectURL( "wStartLoginType.jsp" );
            vAppSubtask.TraceLine( "Mapping Error Redirect to: %s", strURL );
            response.sendRedirect( strURL );
         }
         else
         {
            vAppSubtask.TraceLine( "InputMapping Reentry Prevented", "" );
         }
      }
   }

   if ( strActionToProcess.length( ) == 0 )
   {
   // vAppSubtask.GarbageCollectViews( strSessionId );
      return;
   }
}

if ( strErrorFlag != "Y" && vAppSubtask != null )
{
   nRC = vKZXMLPGO.SetCursorFirst( strSessionId, "DynamicBannerName", "DialogName", "wStart", "" );
   if ( nRC >= 0 )
      strBannerName = vKZXMLPGO.GetString( strSessionId, "DynamicBannerName", "BannerName" );

   if ( strBannerName == null || strBannerName.isEmpty( ) )
      strBannerName = "welcome_banner.gif";
}

%>

<html>

<head>

<title>Login Type</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/validations.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/md5.js"></script>
<script language="JavaScript" type="text/javascript">

var isWindowClosing = true;
var timerID = null;
onerror = handleErr;
window.history.forward( 1 );

function handleErr( msg, url, l )
{
   var txt = "There was an error on this page.\n\n";
   txt += "Error: " + msg + "\n";
   txt += "URL: " + url + "\n";
   txt += "Line: " + l + "\n\n";
   txt += "Click OK to continue.\n\n";
   alert( txt );
   return true;
}

// This function returns Internet Explorer's major version number,
// or 0 for others. It works by finding the "MSIE " string and
// extracting the version number following the space, up to the decimal
// point, ignoring the minor version number.
function msieversion( )
{
   var ua = window.navigator.userAgent;
   var msie = ua.indexOf( "MSIE " );

   if ( msie > 0 )      // if Internet Explorer, return version number
      return parseInt( ua.substring( msie + 5, ua.indexOf( ".", msie ) ) );
   else                 // if another browser, return 0
      return 0;
}

function _OnAlmostTimeout()
{
   if ( _IsDocDisabled( ) == false )
   {
      var tStart   = new Date();

      alert("Your session will timeout in one minute.  Please click 'OK' within that time to continue and save your work if necessary.")

      var tEnd   = new Date();
      var tDiff = tEnd.getTime() - tStart.getTime();

      // If the time is less than one minute, resubmit the page.  Otherwise, go to the timeout window.
      if ( tDiff < 60000 )
      {
         document.wStartLoginType.zAction.value = "_OnResubmitPage";
         document.wStartLoginType.submit( );
      }
      else
      {
         _OnTimeout( );
      }
   }
}

function _OnTimeout( )
{
   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wStartLoginType.zAction.value = "_OnTimeout";
      document.wStartLoginType.submit( );
   }
}

function _BeforePageUnload( )
{
   if ( _IsDocDisabled( ) == false )
   {
      // If the user clicked on the window close box, then
      // isWindowClosing will be true.  Otherwise if the user
      // clicked on something else in the page, isWindowClosing will be false.
      // If the user clicked the window close box, unregister zeidon.
      if ( isWindowClosing )
      {
         document.wStartLoginType.zAction.value = "_OnUnload";
         document.wStartLoginType.submit( );
      }
   }
}

function _IsDocDisabled( )
{
   var theForm;
   var j;
   var k;

   for ( j = 0; j < document.forms.length; j++ )
   {
      theForm = document.forms[ j ];
      for ( k = 0; k < theForm.length; k++ )
      {
         if ( theForm.elements[ k ].name == "zDisable" )
            return theForm.elements[ k ].disabled;
      }
   }

   return false;
}

function _DisableFormElements( bDisabled )
{
   var theForm;
   var type;
   var lis;
   var thisLi;
   var j;
   var k;
   var bRC = false;

   if ( bDisabled && timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   // Controls on the window may have been set as disabled through javascript but
   // when we try to get the values for these controls in jsp (response.getParameter)
   // they will always be null.  Set any disabled fields to enabled for this reason.
   for ( j = 0; j < document.forms.length; j++ )
   {
      theForm = document.forms[ j ];
      for ( k = 0; k < theForm.length; k++ )
      {
         if (theForm.elements[ k ].disabled == true)
             theForm.elements[ k ].disabled = false;
      }
   }

   // We want to set some fields as disabled (like buttons and comboboxes) so that
   // while the jsp code is processing, users can not select these controls.
   for ( j = 0; j < document.forms.length; j++ )
   {
      theForm = document.forms[ j ];
      for ( k = 0; k < theForm.length; k++ )
      {
         type = theForm.elements[ k ].type;

         if ( type == "button" || type == "submit" || (type != null && type.indexOf( "select" ) == 0) )
         {
            theForm.elements[ k ].disabled = bDisabled;
         }
         else
         if ( theForm.elements[ k ].name == "zDisable" )
         {
            theForm.elements[ k ].disabled = bDisabled;
            bRC = true;
         }
      }
   }

   lis = document.getElementsByTagName( "li" );
   for ( k = 0; k < lis.length; k++ )
   {
      thisLi = lis[ k ];
      thisLi.disabled = bDisabled;
   }

   return bRC;
}

function _AfterPageLoaded( )
{
// _DisableFormElements( false );

   var szFocusCtrl = document.wStartLoginType.zFocusCtrl.value;
   if ( szFocusCtrl != "" )
      eval( 'document.wStartLoginType.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wStartLoginType.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wStartLoginType.zOpenFile.value;
   if ( szMsg != "" )
   {
      var NewWin = window.open( szMsg );
      if ( NewWin )
         NewWin.focus( );
      else
      {
         alert( "Pop-up windows are being blocked.  You need to set your browser to allow pop-ups from this site for this action to work." );
      }
   }

   var keyRole = document.wStartLoginType.zKeyRole.value;
   document.wStartLoginType.zError.value = "";
   document.wStartLoginType.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wStartLoginType.zTimeout.value;
   if (varTimeout > 0)
   {
      var delay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", delay );
   }
   else
      timerID = null; // No timeout specified

   isWindowClosing = true;

   document.body.style.cursor = "default";

}

function CheckAllInGrid(id, CheckBoxName)
{
   var wcontrols = id.form.elements;
   var check = id.checked;
   var wcontrol, i = 0;

   while ( (wcontrol = wcontrols[ i++ ]) != null )
   {
      //Check to see if the checkbox belongs to this table then check it.
      if ( wcontrol.name.indexOf( CheckBoxName ) != -1 && wcontrol.type == 'checkbox' )
      {
         wcontrol.checked = check;
      }
   }
}

function GOTO_SelectedRole( strTagEntityKey )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      var nIdx = strTagEntityKey.lastIndexOf( '::' );
      var strEntityKey = strTagEntityKey.substring( nIdx + 2 );

      document.body.style.cursor = "wait";

      _DisableFormElements( true );

      document.wStartLoginType.zTableRowSelect.value = strEntityKey;
      document.wStartLoginType.zAction.value = "GOTO_SelectedRole";
      document.wStartLoginType.submit( );
   }
}

</script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<div id="wrapper">

<jsp:include page='<%=strBannerName %>' />

<div id="maincontent">
<div id="contentnosidemenu">

<!--System Maintenance-->

<%@ include file="./include/systemmaintenance.inc" %>

<!-- END System Maintenance-->


<form name="wStartLoginType" id="wStartLoginType" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   strSessionId = session.getId( );
   zeidon.zView mUser = new zeidon.zView( strSessionId );
   zeidon.zView wWebXfer = new zeidon.zView( strSessionId );
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
   int    nRC2 = 0;
   nRC = 0;

   nRC2 = vKZXMLPGO.GetView( strSessionId, "KZXMLPGO", vAppSubtask );
   if ( nRC2 <= 0 )
   {
      vKZXMLPGO.InitWebSessionObject( strSessionId, vAppSubtask, "TestUserID" );
      vKZXMLPGO.SetName( strSessionId, "KZXMLPGO" );
   }

   nRC2 = vKZXMLPGO.InitWebPage( strSessionId, "wStart", "LoginType" );

   // FindErrorFields Processing
   strError = vAppSubtask.FindErrorFields( strSessionId );
   nPos = strError.indexOf( "\t" );
   if ( nPos > 0 )
   {
      strErrorFlag = strError.substring( 0, 1 );
      strError = strError.substring( nPos + 1 );
   }

   if ( nPos >= 0 && strErrorFlag.equals( "Y" ) )
   {
      nPos = strError.indexOf( "\t\t" );
      if ( nPos >= 0 )
      {
         strErrorTitle = strError.substring( 0, nPos );
         strErrorMsg = strError.substring( nPos + 2 );
      }
   }

   strSolicitSave = vKZXMLPGO.GetString( strSessionId, "Session", "SolicitSaveFlag" );

   strFocusCtrl = vAppSubtask.GetFocusCtrl( strSessionId, "wStart", "LoginType" );
   strOpenFile = vAppSubtask.FindOpenFile( strSessionId );
   strDateFormat = vAppSubtask.GetDateDefaultContextFormat( strSessionId );
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


 <!-- This is added as a line spacer -->
<div style="height:66px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" style="width:256px;height:104px;float:left;">  <!-- GroupBox2 --> 


</div>  <!--  GroupBox2 --> 
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" class="divborder" style="width:512px;float:left;">  <!-- GroupBox3 --> 


 <!-- This is added as a line spacer -->
<div style="height:28px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox6:GroupBox */ %>

<div id="GroupBox6" name="GroupBox6" style="width:26px;height:36px;float:left;">  <!-- GroupBox6 --> 


</div>  <!--  GroupBox6 --> 
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox5:GroupBox */ %>

<div id="GroupBox5" name="GroupBox5" style="width:412px;height:32px;float:left;">  <!-- GroupBox5 --> 


<div>  <!-- Beginning of a new line -->
<% /* Text1:Text */ %>

<span  id="Text1" name="Text1" style="width:378px;height:32px;text-align:center;">You have  multiple roles in the system. Please select a role from the following list and click on &quot;Login.&quot;</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox5 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:26px;height:60px;float:left;">  <!-- GroupBox1 --> 


</div>  <!--  GroupBox1 --> 
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* SS1:Grid */ %>
<% /* SS1:Grid */ %>

<table  cols=3 style=""  name="SS1" id="SS1">

<thead><tr>

   <th>System Role</th>
   <th>Admin Div</th>
   <th>Login</th>

</tr></thead>

<tbody>

<%
%>
</tbody>
</table>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox7:GroupBox */ %>

<div id="GroupBox7" name="GroupBox7" style="width:334px;height:16px;float:left;">  <!-- GroupBox7 --> 


</div>  <!--  GroupBox7 --> 
</div>  <!-- End of a new line -->


</div>  <!--  GroupBox3 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:4px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4" style="width:890px;height:112px;float:left;">  <!-- GroupBox4 --> 


</div>  <!--  GroupBox4 --> 
</div>  <!-- End of a new line -->


<%
   if ( strErrorFlag.equals( "D" ) )
   {
      nPos = strError.indexOf( "\t" );
      if ( nPos >= 0 )
      {
         strErrorTitle = strError.substring( 0, nPos );
         nPos = strError.indexOf( "\t\t" );
         strErrorMsg = strError.substring( nPos + 2 );
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
   session.setAttribute( "ZeidonWindow", "wStartLoginType" );
   session.setAttribute( "ZeidonAction", null );

%>
