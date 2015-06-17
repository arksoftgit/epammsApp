<!DOCTYPE HTML>

<%-- wStartUpSubregColorUpdate --%>

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

   View mSubreg = null;
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

   mSubreg = task.getViewByName( "mSubreg" );
   if ( VmlOperation.isValid( mSubreg ) )
   {
      // EditBox: ColorName
      nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "ColorName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ColorName", "", strMapValue );
            else
               mSubreg.cursor( "Color" ).getAttribute( "Name" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ColorName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: RGB
      nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "RGB" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "RGB", "", strMapValue );
            else
               mSubreg.cursor( "Color" ).getAttribute( "RGB" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "RGB", e.getReason( ), strMapValue );
         }
      }

      // EditBox: C
      nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "C" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "C", "", strMapValue );
            else
               mSubreg.cursor( "Color" ).getAttribute( "C" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "C", e.getReason( ), strMapValue );
         }
      }

      // EditBox: M
      nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "M" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "M", "", strMapValue );
            else
               mSubreg.cursor( "Color" ).getAttribute( "M" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "M", e.getReason( ), strMapValue );
         }
      }

      // EditBox: Y
      nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Y" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Y", "", strMapValue );
            else
               mSubreg.cursor( "Color" ).getAttribute( "Y" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Y", e.getReason( ), strMapValue );
         }
      }

      // EditBox: K
      nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "K" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "K", "", strMapValue );
            else
               mSubreg.cursor( "Color" ).getAttribute( "K" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "K", e.getReason( ), strMapValue );
         }
      }

      // EditBox: Pantone
      nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Pantone" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Pantone", "", strMapValue );
            else
               mSubreg.cursor( "Color" ).getAttribute( "Pantone" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Pantone", e.getReason( ), strMapValue );
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

if ( strLastWindow.equals("wStartUpSubregColorUpdate") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wStartUpSubregColorUpdate strActionToProcess *** " + strActionToProcess );
task.log().info("*** wStartUpSubregColorUpdate LastWindow *** " + strLastWindow );
task.log().info("*** wStartUpSubregColorUpdate LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "Cancel" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpSubregColorUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpSubregColorUpdate.jsp", "wStartUp.CancelColor" );
      nOptRC = wStartUp.CancelColor( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SaveReturn" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpSubregColorUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpSubregColorUpdate.jsp", "wStartUp.SaveColor" );
      nOptRC = wStartUp.SaveColor( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_ReturnToParent, "", "" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveReturn" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpSubregColorUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpSubregColorUpdate.jsp", "wStartUp.SaveColor" );
      nOptRC = wStartUp.SaveColor( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancel" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpSubregColorUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpSubregColorUpdate.jsp", "wStartUp.CancelColor" );
      nOptRC = wStartUp.CancelColor( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_ReturnToParent, "", "" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wStartUpSubregColorUpdate" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wStartUpSubregColorUpdate" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpSubregColorUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wStartUpSubregColorUpdate.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wStartUpSubregColorUpdate.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wStartUpSubregColorUpdate.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wStartUpSubregColorUpdate.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpSubregColorUpdate.jsp", "wStartUp.InitColorForUpdate" );
   nOptRC = wStartUp.InitColorForUpdate( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getAttribute( "WebReturnMessage" ).getString( "" );
      strURLParameters = "?CallingPage=wStartUpSubregColorUpdate.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wStartUp" +
                         "&OperationName=" + "InitColorForUpdate";
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
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "SubregColorUpdate", "" );
   }

%>

<html>
<head>

<title>Update Subregistrant Color</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wStartUpSubregColorUpdate.js"></script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<%@ include file="./include/pagebackground.inc" %>  <!-- just temporary until we get the painter dialog updates from Kelly ... 2011.10.08 dks -->

<div id="wrapper">

<div id="maincontent">

<div id="leftcontent">

<!-- Side Navigation *********************** -->
<div id="sidenavigation">
   <ul id="Return" name="Return">
<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SaveReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smSaveReturn" name="smSaveReturn"><a href="#"  onclick="smSaveReturn()">Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Cancel" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smCancel" name="smCancel"><a href="#"  onclick="smCancel()">Cancel and Return</a></li>
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


<form name="wStartUpSubregColorUpdate" id="wStartUpSubregColorUpdate" method="post">
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
   }

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getAttribute( "SolicitSaveFlag" ).getString( "" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wStartUp", "SubregColorUpdate" );
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
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* Color:GroupBox */ %>

<div id="Color" name="Color"   style="float:left;position:relative; width:616px; height:238px;">  <!-- Color --> 

<div  id="Color" name="Color" >Subregistrant Color</div>
<% /* Name::Text */ %>

<label  id="Name:" name="Name:" style="width:70px;height:20px;position:absolute;left:12px;top:24px;">Name:</label>

<% /* ColorName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "ColorName", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "ColorName" );
      else
      {
         nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "Color" ).getAttribute( "Name" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on ColorName: " + e.getMessage());
               task.log().error( "*** Error on ctrl ColorName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Color.Name: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for ColorName: " + "mSubreg.Color" );
      }
   }
%>

<input name="ColorName" id="ColorName" style="width:300px;position:absolute;left:92px;top:24px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* RGB::Text */ %>

<label  id="RGB:" name="RGB:" style="width:70px;height:20px;position:absolute;left:12px;top:54px;">RGB:</label>

<% /* RGB:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "RGB", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "RGB" );
      else
      {
         nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "Color" ).getAttribute( "RGB" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on RGB: " + e.getMessage());
               task.log().error( "*** Error on ctrl RGB", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Color.RGB: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for RGB: " + "mSubreg.Color" );
      }
   }
%>

<input name="RGB" id="RGB" style="width:110px;position:absolute;left:92px;top:54px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* C::Text */ %>

<label  id="C:" name="C:" style="width:70px;height:20px;position:absolute;left:12px;top:84px;">C:</label>

<% /* C:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "C", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "C" );
      else
      {
         nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "Color" ).getAttribute( "C" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on C: " + e.getMessage());
               task.log().error( "*** Error on ctrl C", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Color.C: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for C: " + "mSubreg.Color" );
      }
   }
%>

<input name="C" id="C" style="width:110px;position:absolute;left:92px;top:84px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* M::Text */ %>

<label  id="M:" name="M:" style="width:70px;height:20px;position:absolute;left:12px;top:114px;">M:</label>

<% /* M:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "M", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "M" );
      else
      {
         nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "Color" ).getAttribute( "M" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on M: " + e.getMessage());
               task.log().error( "*** Error on ctrl M", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Color.M: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for M: " + "mSubreg.Color" );
      }
   }
%>

<input name="M" id="M" style="width:110px;position:absolute;left:92px;top:114px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* Y::Text */ %>

<label  id="Y:" name="Y:" style="width:70px;height:20px;position:absolute;left:12px;top:144px;">Y:</label>

<% /* Y:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Y", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "Y" );
      else
      {
         nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "Color" ).getAttribute( "Y" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Y: " + e.getMessage());
               task.log().error( "*** Error on ctrl Y", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Color.Y: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for Y: " + "mSubreg.Color" );
      }
   }
%>

<input name="Y" id="Y" style="width:110px;position:absolute;left:92px;top:144px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* K::Text */ %>

<label  id="K:" name="K:" style="width:70px;height:20px;position:absolute;left:12px;top:174px;">K:</label>

<% /* K:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "K", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "K" );
      else
      {
         nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "Color" ).getAttribute( "K" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on K: " + e.getMessage());
               task.log().error( "*** Error on ctrl K", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Color.K: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for K: " + "mSubreg.Color" );
      }
   }
%>

<input name="K" id="K" style="width:110px;position:absolute;left:92px;top:174px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* Pantone::Text */ %>

<label  id="Pantone:" name="Pantone:" style="width:70px;height:20px;position:absolute;left:12px;top:204px;">Pantone:</label>

<% /* Pantone:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Pantone", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "Pantone" );
      else
      {
         nRC = mSubreg.cursor( "Color" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "Color" ).getAttribute( "Pantone" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Pantone: " + e.getMessage());
               task.log().error( "*** Error on ctrl Pantone", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Color.Pantone: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for Pantone: " + "mSubreg.Color" );
      }
   }
%>

<input name="Pantone" id="Pantone" style="width:300px;position:absolute;left:92px;top:204px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >


</div>  <!--  Color --> 
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
   session.setAttribute( "ZeidonWindow", "wStartUpSubregColorUpdate" );
   task.log().info( "After building the page setting ZeidonWindow: ------>>> " + "wStartUpSubregColorUpdate" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
