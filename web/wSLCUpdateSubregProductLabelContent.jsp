<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- wSLCUpdateSubregProductLabelContent --%>

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

ObjectEngine objectEngine = JavaObjectEngine.getInstance();

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

   View mSubLC = null;
   View mSubProd = null;
   View wWebXfer = null;
   View vGridTmp = null; // temp view to grid view
   String strDateFormat = "";
   String strMapValue = "";
   int    iView = 0;
   long   lEntityKey = 0;
   String strEntityKey = "";
   String strTag = "";
   String strTemp = "";
   int    iTableRowCnt = 0;
   String strSuffix = "";
   int    nRelPos = 0;
   int    nRC = 0;
   int    nMapError = 1;

   if ( webMapping == false )
      session.setAttribute( "ZeidonError", null );

   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) )
   {
      // Calendar: ESL_Date
      nRC = mSubLC.cursor( "SubregLabelContent" ).checkExistenceOfEntity( );
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "ESL_Date" );
         strDateFormat = request.getParameter( "zDateFormat" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ESL_Date", "", strMapValue );
            else
               mSubLC.cursor( "SubregLabelContent" ).setAttribute( "ESL_Date", strMapValue, strDateFormat );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ESL_Date", e.getReason( ), strMapValue );
         }
      }


      // Calendar: DraftLabel
      nRC = mSubLC.cursor( "SubregLabelContent" ).checkExistenceOfEntity( );
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "DraftLabel" );
         strDateFormat = request.getParameter( "zDateFormat" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "DraftLabel", "", strMapValue );
            else
               mSubLC.cursor( "SubregLabelContent" ).setAttribute( "EPA_DraftLabel", strMapValue, strDateFormat );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "DraftLabel", e.getReason( ), strMapValue );
         }
      }


   }

   mSubProd = task.getViewByName( "mSubProd" );
   if ( VmlOperation.isValid( mSubProd ) )
   {
   }

   wWebXfer = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXfer ) )
   {
      // EditBox: Revision Description
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( );
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Revision Description" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Revision Description", "", strMapValue );
            else
               wWebXfer.cursor( "Root" ).setAttribute( "AttemptRevision", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Revision Description", e.getReason( ), strMapValue );
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
String strOpenFile = "";
String strOpenPopupWindow = "";
String strPopupWindowSZX = "";
String strPopupWindowSZY = "";
String strDateFormat = "";
String strKeyRole = "";
String strFeedback = "";
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

if ( strLastWindow.equals("wSLCUpdateSubregProductLabelContent") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
{
   strURL = response.encodeRedirectURL( "logout.html" );
   response.sendRedirect( strURL );
   return;
}

// Check to see if the Zeidon subtask view already exists.  If not, create
// it and copy it into the application object.
String taskId = (String) session.getAttribute( "ZeidonTaskId" );
if ( StringUtils.isBlank( taskId ) )
{
   strURL = response.encodeRedirectURL( "logout.html" );
   response.sendRedirect( strURL );
   return;
}
else
{
   task = objectEngine.getTaskById( taskId );
}

if ( task == null )
{
   // strURL = response.encodeRedirectURL( "logout.html" );
   // response.sendRedirect( strURL );
   return; // something really bad has happened!!!
}

strActionToProcess = (String) request.getParameter( "zAction" );

vKZXMLPGO = JspWebUtils.createWebSession( task, "testUserId" );
mMsgQ = new KZMSGQOO_Object( vKZXMLPGO );
mMsgQ.setView( VmlOperation.getMessageObject( task ) );
wSLC_Dialog wSLC = new wSLC_Dialog( vKZXMLPGO );

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

      strFeedback = request.getParameter( "zFeedback" );
      if ( strFeedback != "" )
      {
         wSLC.TraceLine( "DoInputMapping Feedback: " + strFeedback );
         wSLC.SaveFeedback( "mOrganiz", "wSLC", "UpdateSubregProductLabelContent", strFeedback );
      }

   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelNewProductLabelContent" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProductLabelContent", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProductLabelContent.jsp", "wSLC.CancelNewProductLabelContent" );
      nOptRC = wSLC.CancelNewProductLabelContent( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GenerateNewSLC_FromMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProductLabelContent", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProductLabelContent.jsp", "wSLC.GenerateNewSLC_FromMLC" );
      nOptRC = wSLC.GenerateNewSLC_FromMLC( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptNewProductLabelContent" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProductLabelContent", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProductLabelContent.jsp", "wSLC.AcceptNewProductLabelContent" );
      nOptRC = wSLC.AcceptNewProductLabelContent( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAcceptNewProductLabelContent" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProductLabelContent", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProductLabelContent.jsp", "wSLC.AcceptNewProductLabelContent" );
      nOptRC = wSLC.AcceptNewProductLabelContent( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelNewProductLabelContent" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProductLabelContent", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProductLabelContent.jsp", "wSLC.CancelNewProductLabelContent" );
      nOptRC = wSLC.CancelNewProductLabelContent( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().debug( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wSLCUpdateSubregProductLabelContent" );
         task.dropTask();
         task = null;
         session.setAttribute( "ZeidonTaskId", task );
      }

      // Next Window is HTML termination
      strURL = response.encodeRedirectURL( "logout.html" );
      response.sendRedirect( strURL );
      return;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnTimeout" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().debug( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wSLCUpdateSubregProductLabelContent" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCUpdateSubregProductLabelContent", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSLCUpdateSubregProductLabelContent.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSLCUpdateSubregProductLabelContent.jsp" );
            task.log().debug( "Action Error Redirect to: " + strURL );
         }

         strActionToProcess = "";
         response.sendRedirect( strURL );
      }
      else
      {
         if ( nRC > -128 )
         {
            strActionToProcess = "";
            strURL = response.encodeRedirectURL( "wSLCUpdateSubregProductLabelContent.jsp" );
            task.log().debug( "Mapping Error Redirect to: " + strURL );
            response.sendRedirect( strURL );
         }
         else
         {
            task.log().debug( "InputMapping Reentry Prevented" );
         }
      }
   }

   if ( StringUtils.isBlank( strActionToProcess ) )
   {
   // task.GarbageCollectViews( );
      return;
   }
}

if ( session.getAttribute( "ZeidonError" ) == "Y" )
   session.setAttribute( "ZeidonError", null );
else
{
   VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCUpdateSubregProductLabelContent.jsp", "wSLC.InitProductLabelContentForUpdate" );
   nOptRC = wSLC.InitProductLabelContentForUpdate( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getStringFromAttribute( "WebReturnMessage" );
      strURLParameters = "?CallingPage=wSLCUpdateSubregProductLabelContent.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wSLC" +
                         "&OperationName=" + "InitProductLabelContentForUpdate";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().debug( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

nRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSLC", "" );
if ( nRC >= 0 )
   strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getStringFromAttribute( "BannerName" );

if ( StringUtils.isBlank( strBannerName ) )
   strBannerName = "./include/banner.inc";

wWebXA = task.getViewByName( "wWebXfer" );
if ( VmlOperation.isValid( wWebXA ) )
{
   wWebXA.cursor( "Root" ).setAttribute( "CurrentDialog", "wSLC" );
   wWebXA.cursor( "Root" ).setAttribute( "CurrentWindow", "UpdateSubregProductLabelContent" );
}

%>

<html>
<head>

<title>Update Subregistrant Product Label Content</title>

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
// alert( txt );
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

      alert( "Your session will timeout in one minute.  Please click 'OK' within that time to continue and save your work if necessary." )

      var tEnd   = new Date();
      var tDiff = tEnd.getTime() - tStart.getTime();

      // If the time is less than one minute, resubmit the page.  Otherwise, go to the timeout window.
      if (tDiff < 60000)
      {
         document.wSLCUpdateSubregProductLabelContent.zAction.value = "_OnResubmitPage";
         document.wSLCUpdateSubregProductLabelContent.submit( );
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

      document.wSLCUpdateSubregProductLabelContent.zAction.value = "_OnTimeout";
      document.wSLCUpdateSubregProductLabelContent.submit( );
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
      if (isWindowClosing)
      {
         document.wSLCUpdateSubregProductLabelContent.zAction.value = "_OnUnload";
         document.wSLCUpdateSubregProductLabelContent.submit( );
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

   var szFocusCtrl = document.wSLCUpdateSubregProductLabelContent.zFocusCtrl.value;
   if ( szFocusCtrl != "" )
      eval( 'document.wSLCUpdateSubregProductLabelContent.' + szFocusCtrl + '.focus( )' );

   // This is where we put out a message from the previous iteration on this window
   var szMsg = document.wSLCUpdateSubregProductLabelContent.zError.value;
   if ( szMsg != "" )
      alert( szMsg ); // "Houston ... We have a problem"

   szMsg = document.wSLCUpdateSubregProductLabelContent.zOpenFile.value;
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

   var keyRole = document.wSLCUpdateSubregProductLabelContent.zKeyRole.value;
   // Javascript code entered by user.
   var thisLi;

// if ( keyRole == "S" ) // If we are here, we have to be a Subregistrant.
   // We knock out Login and Template as options.
   thisLi = document.getElementById( "lmLogin" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmTemplate" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   thisLi = document.getElementById( "lmSubregistrants" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmTrackingNotificationCompliance" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   // Cannot go to product management if already there.
   thisLi = document.getElementById( "lmProductManagement" );
   thisLi.disabled = true;
   // END of Javascript code entered by user.

   document.wSLCUpdateSubregProductLabelContent.zError.value = "";
   document.wSLCUpdateSubregProductLabelContent.zOpenFile.value = "";

   if ( timerID != null )
   {
      clearTimeout( timerID );
      timerID = null;
   }

   var varTimeout = document.wSLCUpdateSubregProductLabelContent.zTimeout.value;
   if ( varTimeout > 0 )
   {
      var varDelay = 60000 * varTimeout;  // Timeout value in timeout.inc
      timerID = setTimeout( "_OnAlmostTimeout( )", varDelay );
   }
   else
      timerID = null; // No timeout specified

   isWindowClosing = true;
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

function CancelNewProductLabelContent( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCUpdateSubregProductLabelContent.zAction.value = "CancelNewProductLabelContent";
      document.wSLCUpdateSubregProductLabelContent.submit( );
   }
}

function GenerateNewSLC_FromMLC( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCUpdateSubregProductLabelContent.zAction.value = "GenerateNewSLC_FromMLC";
      document.wSLCUpdateSubregProductLabelContent.submit( );
   }
}

function AcceptNewProductLabelContent( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCUpdateSubregProductLabelContent.zAction.value = "AcceptNewProductLabelContent";
      document.wSLCUpdateSubregProductLabelContent.submit( );
   }
}

function InitProductLabelContentForUpdate( )
{

   // This is for indicating whether the user hit the window close box.
   isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      // Javascript code entered by user.

   var thisLi;

// if ( keyRole == "S" ) // If we are here, we have to be a Subregistrant.
   // We knock out Login and Template as options.
   thisLi = document.getElementById( "lmLogin" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmTemplate" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   thisLi = document.getElementById( "lmSubregistrants" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmTrackingNotificationCompliance" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   // Cannot go to product management if already there.
   thisLi = document.getElementById( "lmProductManagement" );
   thisLi.disabled = true;

      // END of Javascript code entered by user.

   }
}

function smAcceptNewProductLabelContent( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCUpdateSubregProductLabelContent.zAction.value = "smAcceptNewProductLabelContent";
      document.wSLCUpdateSubregProductLabelContent.submit( );
   }
}

function smCancelNewProductLabelContent( )
{

      // This is for indicating whether the user hit the window close box.
      isWindowClosing = false;

   if ( _IsDocDisabled( ) == false )
   {
      _DisableFormElements( true );

      document.wSLCUpdateSubregProductLabelContent.zAction.value = "smCancelNewProductLabelContent";
      document.wSLCUpdateSubregProductLabelContent.submit( );
   }
}

</script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<%@ include file="./include/pagebackground.inc" %>  <!-- just temporary until we get the painter dialog updates from Kelly ... 2011.10.08 dks -->

<div id="wrapper">

<jsp:include page='<%=strBannerName %>' />

<div id="maincontent">

<div id="leftcontent">

<!-- Side Navigation *********************** -->
<div id="sidenavigation">
   <ul>
<%
   nRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SaveAndReturn" );
   if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smAcceptNewProductLabelContent( )">Save and Return</a></li>
<%
   }
%>

<%
   nRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smCancelNewProductLabelContent( )">Cancel and Return</a></li>
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


<form name="wSLCUpdateSubregProductLabelContent" id="wSLCUpdateSubregProductLabelContent" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lPrimReg = null;
   View lSPLDLST = null;
   View mMasLC = null;
   View mMasProd = null;
   View mPrimReg = null;
   View mSPLDef = null;
   View mSubLC = null;
   View mSubProd = null;
   View mSubreg = null;
   View wMLCList = null;
   View wWebXfer = null;
   String strRadioGroupValue = "";
   String strComboCurrentValue = "";
   String strAutoComboBoxExternalValue = "";
   String strComboCountCurrentValue = "0";
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

   vKZXMLPGO = JspWebUtils.createWebSession( task, "testUserId" );
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
               task.log().debug( "Error: " + strErrorTitle ); // debugging
               nPos = strError.indexOf( "\t", nPos );
            }
            else
               nPos = -1;
         }
      }
   }

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getStringFromAttribute( "SolicitSaveFlag" );

   //strFocusCtrl = task.GetFocusCtrl("wSLC", "UpdateSubregProductLabelContent" );
   strOpenFile = VmlOperation.FindOpenFile( task );
   strDateFormat = "YYYY.MM.DD";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      nRC2 = wWebXA.cursor( "Root" ).checkExistenceOfEntity( );
      if ( nRC2 >= 0 )
      {
         strKeyRole = wWebXA.cursor( "Root" ).getStringFromAttribute( "KeyRole", "KeyRole" );
         if ( strKeyRole == null )
            strKeyRole = "";

         task.log().debug( "Root.KeyRole: " + strKeyRole );
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


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* BreadCrumb: */ %>
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* SubregistrantProduct:GroupBox */ %>

<div id="SubregistrantProduct" name="SubregistrantProduct" class="withborder" style="width:730px;height:86px;float:left;">  <!-- SubregistrantProduct --> 

<div  id="SubregistrantProduct" name="SubregistrantProduct" >Subregistrant Product</div>

 <!-- This is added as a line spacer -->
<div style="height:26px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Subregistrant::Text */ %>

<span id="Subregistrant:" name="Subregistrant:" style="width:130px;height:16px;">Subregistrant:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* TXName:Text */ %>
<% strTextDisplayValue = "";
   mSubProd = task.getViewByName( "mSubProd" );
   if ( VmlOperation.isValid( mSubProd ) == false )
      task.log( ).debug( "Invalid View: " + "TXName" );
   else
   {
      nRC = mSubProd.cursor( "Subregistrant" ).checkExistenceOfEntity( );
      if ( nRC >= 0 )
         strTextDisplayValue = mSubProd.cursor( "Subregistrant" ).getStringFromAttribute( "dNameEPA_Number", "" );
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
   }
%>

<span class="text14bold" id="TXName" name="TXName" style="width:530px;height:16px;"><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* SLC_Name::Text */ %>

<span id="SLC_Name:" name="SLC_Name:" style="width:130px;height:16px;">Product:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* SLC_Name:Text */ %>
<% strTextDisplayValue = "";
   mSubProd = task.getViewByName( "mSubProd" );
   if ( VmlOperation.isValid( mSubProd ) == false )
      task.log( ).debug( "Invalid View: " + "SLC_Name" );
   else
   {
      nRC = mSubProd.cursor( "SubregProduct" ).checkExistenceOfEntity( );
      if ( nRC >= 0 )
         strTextDisplayValue = mSubProd.cursor( "SubregProduct" ).getStringFromAttribute( "dSubregProductNameNbr", "" );
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
   }
%>

<span id="SLC_Name" name="SLC_Name" style="width:530px;height:16px;"><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->


</div>  <!--  SubregistrantProduct --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* ProductLabelContent:GroupBox */ %>

<div id="ProductLabelContent" name="ProductLabelContent" class="withborder" style="width:730px;height:110px;float:left;">  <!-- ProductLabelContent --> 

<div  id="ProductLabelContent" name="ProductLabelContent" >Product Label Content</div>

 <!-- This is added as a line spacer -->
<div style="height:26px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Description::Text */ %>

<span id="Description:" name="Description:" style="width:130px;height:16px;">Description:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* Revision Description:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Revision Description", strError );
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
         task.log( ).debug( "Invalid View: " + "Revision Description" );
      else
      {
         nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( );
         if ( nRC >= 0 )
         {
            strErrorMapValue = wWebXfer.cursor( "Root" ).getStringFromAttribute( "AttemptRevision", "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Root.AttemptRevision: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "wWebXfer.Root" );
      }
   }
%>

<input class="text14bold" name="Revision Description" id="Revision Description" style="width:566px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* ESL_Date::Text */ %>

<span id="ESL_Date:" name="ESL_Date:" style="width:130px;height:16px;">ESL Date:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* ESL_Date:Calendar */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "ESL_Date", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubLC = task.getViewByName( "mSubLC" );
      if ( VmlOperation.isValid( mSubLC ) == false )
         task.log( ).debug( "Invalid View: " + "ESL_Date" );
      else
      {
         nRC = mSubLC.cursor( "SubregLabelContent" ).checkExistenceOfEntity( );
         if ( nRC >= 0 )
         {
            strErrorMapValue = mSubLC.cursor( "SubregLabelContent" ).getStringFromAttribute( "ESL_Date", strDateFormat );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SubregLabelContent.ESL_Date: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubLC.SubregLabelContent" );
      }
   }
%>

<span style="width:412px;height:32px;" >
   <input name="ESL_Date" id='ESL_Date' style="width:80px" type="text" value="<%=strErrorMapValue%>"  />
   <img src="images/scw.gif" title="Select Date" alt="Select Date"
        onclick="scwShow( document.getElementById( 'ESL_Date' ), this );"  />
</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* DraftLabel::Text */ %>

<span id="DraftLabel:" name="DraftLabel:" style="width:130px;height:16px;">Draft Label:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* DraftLabel:Calendar */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "DraftLabel", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubLC = task.getViewByName( "mSubLC" );
      if ( VmlOperation.isValid( mSubLC ) == false )
         task.log( ).debug( "Invalid View: " + "DraftLabel" );
      else
      {
         nRC = mSubLC.cursor( "SubregLabelContent" ).checkExistenceOfEntity( );
         if ( nRC >= 0 )
         {
            strErrorMapValue = mSubLC.cursor( "SubregLabelContent" ).getStringFromAttribute( "EPA_DraftLabel", strDateFormat );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SubregLabelContent.EPA_DraftLabel: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubLC.SubregLabelContent" );
      }
   }
%>

<span style="width:412px;height:32px;" >
   <input name="DraftLabel" id='DraftLabel' style="width:80px" type="text" value="<%=strErrorMapValue%>"  />
   <img src="images/scw.gif" title="Select Date" alt="Select Date"
        onclick="scwShow( document.getElementById( 'DraftLabel' ), this );"  />
</span>

</div>  <!-- End of a new line -->


</div>  <!--  ProductLabelContent --> 
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

   <div align="clear:both;center;"><table style="width:750px;background-color:black;color:white;border:none;font-size:8px;"><tr style="background-color:blue;color:white;border:none;">
   <td nowrap style="background-color:blue;color:white;border:none;padding-top:6px;padding-bottom:6px;font-size:11px;">Feedback: </td>
   <td nowrap style="background-color:blue;color:white;border:none;padding-top:6px;padding-bottom:6px;font-size:11px;"><input name="zFeedback" id="zFeedback" style="left:4px;width:700px;"></td>
   </tr></table></div>

</form>
</div>   <!-- This is the end tag for the div 'content' -->

</div>   <!-- This is the end tag for the div 'maincontent' -->

<%@ include file="./include/footer.inc" %>

</div>  <!-- This is the end tag for wrapper -->

</body>
</html>
<%
   session.setAttribute( "ZeidonWindow", "wSLCUpdateSubregProductLabelContent" );
   session.setAttribute( "ZeidonAction", null );

%>
