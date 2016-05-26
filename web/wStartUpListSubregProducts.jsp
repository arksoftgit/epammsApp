<!DOCTYPE HTML>

<%-- wStartUpListSubregProducts --%>

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

   View mSubreg2 = null;
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

   mSubreg2 = task.getViewByName( "mSubreg2" );
   if ( VmlOperation.isValid( mSubreg2 ) )
   {
      // Grid: GridSubregProducts
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSubreg2.newView( );
      csrRC = vGridTmp.cursor( "SubregLabelContent" ).setFirst( "Subregistrant" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "SubregLabelContent" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "SubregLabelContent" ).setNextContinue( );
      }

      vGridTmp.drop( );
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

if ( strLastWindow.equals("wStartUpListSubregProducts") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wStartUpListSubregProducts strActionToProcess *** " + strActionToProcess );
task.log().info("*** wStartUpListSubregProducts LastWindow *** " + strLastWindow );
task.log().info("*** wStartUpListSubregProducts LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DeleteSLC_Entry" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpListSubregProducts", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSubreg2;
      mSubreg2 = task.getViewByName( "mSubreg2" );
      if ( VmlOperation.isValid( mSubreg2 ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSubreg2.cursor( "SubregLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubreg2.cursor( "SubregLabelContent" ).setFirst("Subregistrant" );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubreg2.cursor( "SubregLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubreg2.cursor( "SubregLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpListSubregProducts", "wStartUp.DeleteSLC_Entry" );
         nOptRC = wStartUp.DeleteSLC_Entry( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_SLC_Update" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpListSubregProducts", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSubreg2;
      mSubreg2 = task.getViewByName( "mSubreg2" );
      if ( VmlOperation.isValid( mSubreg2 ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSubreg2.cursor( "SubregLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubreg2.cursor( "SubregLabelContent" ).setFirst("Subregistrant" );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubreg2.cursor( "SubregLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubreg2.cursor( "SubregLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpListSubregProducts", "wStartUp.GOTO_SLC_Update" );
         nOptRC = wStartUp.GOTO_SLC_Update( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartModalSubwindow, "wMLC", "CompositeComponentList" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_UpdateSPLDef" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpListSubregProducts", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSubreg2;
      mSubreg2 = task.getViewByName( "mSubreg2" );
      if ( VmlOperation.isValid( mSubreg2 ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSubreg2.cursor( "SubregLabelContent" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubreg2.cursor( "SubregLabelContent" ).setFirst("Subregistrant" );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubreg2.cursor( "SubregLabelContent" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubreg2.cursor( "SubregLabelContent" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpListSubregProducts", "wStartUp.GOTO_UpdateSPLDef" );
         nOptRC = wStartUp.GOTO_UpdateSPLDef( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_ReplaceWindowWithModalWindow, "wStartUp", "ListSubregProducts" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "NewSLC_Entry" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpListSubregProducts", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpListSubregProducts", "wStartUp.NewSLC_Entry" );
         nOptRC = wStartUp.NewSLC_Entry( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartModalSubwindow, "wSPLD", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ReturnSubregUserDetail" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpListSubregProducts", strActionToProcess );

      // Next Window
      strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_ReturnToParent, "", "" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wStartUpListSubregProducts" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wStartUpListSubregProducts" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpListSubregProducts", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wStartUpListSubregProducts.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wStartUpListSubregProducts.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wStartUpListSubregProducts.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wStartUpListSubregProducts.jsp" );
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
   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wStartUp", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getStringFromAttribute( "BannerName" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).setAttribute( "CurrentDialog", "wStartUp" );
      wWebXA.cursor( "Root" ).setAttribute( "CurrentWindow", "ListSubregProducts" );
   }

%>

<html>
<head>

<title>SPLD List Subregistrant Products</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/md5.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wStartUpListSubregProducts.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Return" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="ReturnSubregUserDetail( )">Return</a></li>
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


<form name="wStartUpListSubregProducts" id="wStartUpListSubregProducts" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lPrimReg = null;
   View lSubreg = null;
   View mCurrentUser = null;
   View mMasLC = null;
   View mPerson = null;
   View mPrimReg = null;
   View mSubreg = null;
   View mSubreg2 = null;
   View mUser = null;
   View qOrganiz = null;
   View qOrganizLogin = null;
   View qPrimReg = null;
   View qSubreg = null;
   View wWebXfer = null;
   View mMasProd = null;
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

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getStringFromAttribute( "SolicitSaveFlag" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wStartUp", "ListSubregProducts" );
   strOpenFile = VmlOperation.FindOpenFile( task );
   strDateFormat = "YYYY.MM.DD";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      nRC = wWebXA.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strKeyRole = wWebXA.cursor( "Root" ).getStringFromAttribute( "KeyRole", "KeyRole" );
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
<div style="height:32px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* Registrants:GroupBox */ %>

<div id="Registrants" name="Registrants" style="width:866px;height:94px;float:left;">  <!-- Registrants --> 


 <!-- This is added as a line spacer -->
<div style="height:26px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>
<div id="GroupBox1" name="GroupBox1" style="float:left;width:830px;" >

<table cols=2 style="width:830px;"  class="grouptable">

<tr>
<td valign="top" style="width:140px;">
<% /* PrimaryRegistrantName::Text */ %>

<span  id="PrimaryRegistrantName:" name="PrimaryRegistrantName:" style="width:130px;height:16px;">Primary Registrant:</span>

</td>
<td valign="top"  class="text14bold" style="width:690px;">
<% /* TXName:Text */ %>
<% strTextDisplayValue = "";
   mSubreg2 = task.getViewByName( "mSubreg2" );
   if ( VmlOperation.isValid( mSubreg2 ) == false )
      task.log( ).debug( "Invalid View: " + "TXName" );
   else
   {
      nRC = mSubreg2.cursor( "SubregOrganization" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubreg2.cursor( "SubregOrganization" ).getStringFromAttribute( "Name", "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on TXName: " + e.getMessage());
         task.log().info( "*** Error on ctrl TXName" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text14bold"  id="TXName" name="TXName" style="width:690px;height:16px;"><%=strTextDisplayValue%></span>

</td>
</tr>
<tr>
<td valign="top" style="width:140px;">
<% /* Subregistrant::Text */ %>

<span  id="Subregistrant:" name="Subregistrant:" style="width:130px;height:16px;">Subregistrant:</span>

</td>
<td valign="top" style="width:690px;">
<% /* Subregistrant:Text */ %>
<% strTextDisplayValue = "";
   mSubreg2 = task.getViewByName( "mSubreg2" );
   if ( VmlOperation.isValid( mSubreg2 ) == false )
      task.log( ).debug( "Invalid View: " + "Subregistrant" );
   else
   {
      nRC = mSubreg2.cursor( "Subregistrant" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubreg2.cursor( "Subregistrant" ).getStringFromAttribute( "ID", "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on Subregistrant: " + e.getMessage());
         task.log().info( "*** Error on ctrl Subregistrant" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span  id="Subregistrant" name="Subregistrant" style="width:690px;height:16px;"><%=strTextDisplayValue%></span>

</td>
</tr>
</table>

</div>  <!-- GroupBox1 --> 

</div>  <!-- End of a new line -->


</div>  <!--  Registrants --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* SubregProducts:GroupBox */ %>

<div id="SubregProducts" name="SubregProducts" style="width:866px;height:46px;float:left;">  <!-- SubregProducts --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" style="width:634px;height:34px;float:left;">  <!-- GroupBox2 --> 


</div>  <!--  GroupBox2 --> 
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:134px;height:34px;float:left;">  <!-- GroupBox3 --> 


<div>  <!-- Beginning of a new line -->
<span style="height:28px;">&nbsp&nbsp&nbsp&nbsp</span>
<% /* PBNewSubregProduct:PushBtn */ %>
<button type="button" class="formStylebutton" name="PBNewSubregProduct" id="PBNewSubregProduct" value="" onclick="NewSLC_Entry( )" style="width:80px;height:28px;">New</button>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox3 --> 
</div>  <!-- End of a new line -->


</div>  <!--  SubregProducts --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:16px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:30px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridSubregProducts:Grid */ %>
<table  cols=4 style=""  name="GridSubregProducts" id="GridSubregProducts">

<thead><tr>

   <th>Subregistrant Product</th>
   <th>SPL Def</th>
   <th>Update</th>
   <th>Delete</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mSubreg2 = task.getViewByName( "mSubreg2" );
   if ( VmlOperation.isValid( mSubreg2 ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strGESubregProductName;
      String strGEPrimRegProductName;
      String strBMBUpdateSubregProduct;
      String strBMBDeleteSubregProduct;
      
      View vGridSubregProducts;
      vGridSubregProducts = mSubreg2.newView( );
      csrRC2 = vGridSubregProducts.cursor( "SubregLabelContent" ).setFirst( "Subregistrant" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridSubregProducts.cursor( "SubregLabelContent" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGESubregProductName = "";
         nRC = vGridSubregProducts.cursor( "ProductAndSPLDef" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGESubregProductName = vGridSubregProducts.cursor( "ProductAndSPLDef" ).getStringFromAttribute( "ProductName", "" );

            if ( strGESubregProductName == null )
               strGESubregProductName = "";
         }

         if ( StringUtils.isBlank( strGESubregProductName ) )
            strGESubregProductName = "&nbsp";

         strGEPrimRegProductName = "";
         nRC = vGridSubregProducts.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGEPrimRegProductName = vGridSubregProducts.cursor( "MasterProduct" ).getStringFromAttribute( "Name", "" );

            if ( strGEPrimRegProductName == null )
               strGEPrimRegProductName = "";
         }

         if ( StringUtils.isBlank( strGEPrimRegProductName ) )
            strGEPrimRegProductName = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="GOTO_SLC_Update( this.id )" id="GESubregProductName::<%=strEntityKey%>"><%=strGESubregProductName%></a></td>
   <td><a href="#" onclick="GOTO_UpdateSPLDef( this.id )" id="GEPrimRegProductName::<%=strEntityKey%>"><%=strGEPrimRegProductName%></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdateSubregProduct" onclick="GOTO_SLC_Update( this.id )" id="BMBUpdateSubregProduct::<%=strEntityKey%>"><img src="./images/ePammsUpdate.jpg" alt="Update"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBDeleteSubregProduct" onclick="DeleteSLC_Entry( this.id )" id="BMBDeleteSubregProduct::<%=strEntityKey%>"><img src="./images/ePammsDelete.jpg" alt="Delete"></a></td>

</tr>

<%
         csrRC2 = vGridSubregProducts.cursor( "SubregLabelContent" ).setNextContinue( );
      }
      vGridSubregProducts.drop( );
   }
}
catch (Exception e)
{
out.println("There is an error in grid: " + e.getMessage());
task.log().info( "*** Error in grid" + e.getMessage() );
}
%>
</tbody>
</table>

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
   session.setAttribute( "ZeidonWindow", "wStartUpListSubregProducts" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
