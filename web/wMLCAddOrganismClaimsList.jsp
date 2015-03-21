<!DOCTYPE HTML>

<%-- wMLCAddOrganismClaimsList --%>

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

   View mEPA = null;
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

   mEPA = task.getViewByName( "mEPA" );
   if ( VmlOperation.isValid( mEPA ) )
   {
      // Grid: GridBacteria
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mEPA.newView( );
      csrRC = vGridTmp.cursor( "Bacteria" ).setFirst( "EPA_ChemicalFamily" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "Bacteria" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GS_SelectBacteria" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_SelectBacteria", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "EPA_Claim" ).getAttribute( "wkSelected" ).setValue( strMapValue, "" );
               else
                  vGridTmp.cursor( "EPA_Claim" ).getAttribute( "wkSelected" ).setValue( "", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "Bacteria" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: GridViruses
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mEPA.newView( );
      csrRC = vGridTmp.cursor( "Viruses" ).setFirst( "EPA_ChemicalFamily" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "Viruses" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GS_SelectViruses" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_SelectViruses", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "EPA_Claim" ).getAttribute( "wkSelected" ).setValue( strMapValue, "" );
               else
                  vGridTmp.cursor( "EPA_Claim" ).getAttribute( "wkSelected" ).setValue( "", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "Viruses" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: GridFungi
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mEPA.newView( );
      csrRC = vGridTmp.cursor( "Fungi" ).setFirst( "EPA_ChemicalFamily" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "Fungi" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GS_SelectFungi" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_SelectFungi", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "EPA_Claim" ).getAttribute( "wkSelected" ).setValue( strMapValue, "" );
               else
                  vGridTmp.cursor( "EPA_Claim" ).getAttribute( "wkSelected" ).setValue( "", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "Fungi" ).setNextContinue( );
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

if ( strLastWindow.equals("wMLCAddOrganismClaimsList") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wMLCAddOrganismClaimsList strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLCAddOrganismClaimsList LastWindow *** " + strLastWindow );
task.log().info("*** wMLCAddOrganismClaimsList LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelAddClaimsStmts" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCAddOrganismClaimsList", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCAddOrganismClaimsList.jsp", "wMLC.CancelAddClaimsStmts" );
         nOptRC = wMLC.CancelAddClaimsStmts( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ClearSelectedClaims" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCAddOrganismClaimsList", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ConfirmAddClaimsStmtsAndReturn" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCAddOrganismClaimsList", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCAddOrganismClaimsList.jsp", "wMLC.ConfirmAddClaimsStmts" );
         nOptRC = wMLC.ConfirmAddClaimsStmts( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ConfirmAddSelectedClaimsStmts" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCAddOrganismClaimsList", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCAddOrganismClaimsList.jsp", "wMLC.ConfirmAddClaimsStmts" );
         nOptRC = wMLC.ConfirmAddClaimsStmts( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectAllClaims" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCAddOrganismClaimsList", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wMLCAddOrganismClaimsList" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wMLCAddOrganismClaimsList" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCAddOrganismClaimsList", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLCAddOrganismClaimsList.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLCAddOrganismClaimsList.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLCAddOrganismClaimsList.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLCAddOrganismClaimsList.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCAddOrganismClaimsList.jsp", "wMLC.InitClaimsStmtsForInsert" );
         nOptRC = wMLC.InitClaimsStmtsForInsert( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getAttribute( "WebReturnMessage" ).getString( "" );
      strURLParameters = "?CallingPage=wMLCAddOrganismClaimsList.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wMLC" +
                         "&OperationName=" + "InitClaimsStmtsForInsert";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
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
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "AddOrganismClaimsList", "" );
   }

%>

<html>
<head>

<title>Add Organism Claims List</title>

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
<script language="JavaScript" type="text/javascript" src="./js/tabpane.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wMLCAddOrganismClaimsList.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AddSelectedClaims" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="ConfirmAddSelectedClaimsStmts( )">Add Selected Claims</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AddAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="ConfirmAddClaimsStmtsAndReturn( )">Add and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="CancelAddClaimsStmts( )">Cancel and Return</a></li>
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


<form name="wMLCAddOrganismClaimsList" id="wMLCAddOrganismClaimsList" method="post">
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "AddOrganismClaimsList" );
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
<% /* BreadCrumb: */ %>
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:34px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:18px;float:left;"></div>   <!-- Width Spacer -->
<% /* OrganismClaims:Tab */ %>

<div id="OrganismClaims" class="tab-pane" style="width:734px;"> <!-- Beginning of Tab Control OrganismClaims -->
<script type="text/javascript">OrganismClaims = new WebFXTabPane( document.getElementById( "OrganismClaims" ) );</script>

<div id="Bacteria" class="tab-page " > <!-- Tab item Bacteria -->
<h2 class="tab"><span>Bacteria</span></h2>
<script type="text/javascript">OrganismClaims.addTabPage( document.getElementById( "Bacteria" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:18px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* AddBacteriaList:GroupBox */ %>

<div id="AddBacteriaList" name="AddBacteriaList" style="width:706px;height:338px;float:left;">  <!-- AddBacteriaList --> 

<div  id="AddBacteriaList" name="AddBacteriaList" >Add Bacteria List</div>

 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* HTSelectAllBacteria:Text */ %>

<a href="#" id="HTSelectAllBacteria" name="HTSelectAllBacteria"  onclick="SelectAllClaims( );" style="width:80px;height:16px;" tabindex=-1 >Select All</a>

<% /* HTClearSelectedBacteria:Text */ %>

<a href="#" id="HTClearSelectedBacteria" name="HTClearSelectedBacteria"  onclick="ClearSelectedClaims( );" style="width:100px;height:16px;" tabindex=-1 >Clear Selected</a>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:16px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridBacteria:Grid */ %>
<table  cols=2 style=""  name="GridBacteria" id="GridBacteria">

<thead><tr>

   <th>Select</th>
   <th>Bacteria</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mEPA = task.getViewByName( "mEPA" );
   if ( VmlOperation.isValid( mEPA ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strGS_SelectBacteria;
      String strGS_SelectBacteriaValue;
      String strGE_Bacteria;
      
      View vGridBacteria;
      vGridBacteria = mEPA.newView( );
      csrRC2 = vGridBacteria.cursor( "Bacteria" ).setFirst( "EPA_ChemicalFamily" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridBacteria.cursor( "Bacteria" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGS_SelectBacteria = "";
         nRC = vGridBacteria.cursor( "EPA_Claim" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_SelectBacteria = vGridBacteria.cursor( "EPA_Claim" ).getAttribute( "wkSelected" ).getString( "" );

            if ( strGS_SelectBacteria == null )
               strGS_SelectBacteria = "";
         }

         if ( StringUtils.equals( strGS_SelectBacteria, "Y" ) )
         {
            strGS_SelectBacteriaValue = "GS_SelectBacteria" + strEntityKey;
            strGS_SelectBacteria = "<input name='" + strGS_SelectBacteriaValue + "' id='" + strGS_SelectBacteriaValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_SelectBacteriaValue = "GS_SelectBacteria" + strEntityKey;
            strGS_SelectBacteria = "<input name='" + strGS_SelectBacteriaValue + "' id='" + strGS_SelectBacteriaValue + "' value='Y' type='checkbox' > ";
         }

         strGE_Bacteria = "";
         nRC = vGridBacteria.cursor( "EPA_Claim" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGE_Bacteria = vGridBacteria.cursor( "EPA_Claim" ).getAttribute( "Name" ).getString( "" );

            if ( strGE_Bacteria == null )
               strGE_Bacteria = "";
         }

         if ( StringUtils.isBlank( strGE_Bacteria ) )
            strGE_Bacteria = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_SelectBacteria%></td>
   <td nowrap><%=strGE_Bacteria%></td>

</tr>

<%
         csrRC2 = vGridBacteria.cursor( "Bacteria" ).setNextContinue( );
      }
      vGridBacteria.drop( );
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


</div>  <!--  AddBacteriaList --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item Bacteria -->

<div id="Fungi" class="tab-page " > <!-- Tab item Fungi -->
<h2 class="tab"><span>Fungi</span></h2>
<script type="text/javascript">OrganismClaims.addTabPage( document.getElementById( "Fungi" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:18px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* AddFungiList:GroupBox */ %>

<div id="AddFungiList" name="AddFungiList" style="width:706px;height:338px;float:left;">  <!-- AddFungiList --> 

<div  id="AddFungiList" name="AddFungiList" >Add Fungi List</div>

 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* HTSelectAllFungi:Text */ %>

<a href="#" id="HTSelectAllFungi" name="HTSelectAllFungi"  onclick="SelectAllClaims( );" style="width:80px;height:16px;" tabindex=-1 >Select All</a>

<% /* HTClearSelectedFungi:Text */ %>

<a href="#" id="HTClearSelectedFungi" name="HTClearSelectedFungi"  onclick="ClearSelectedClaims( );" style="width:100px;height:16px;" tabindex=-1 >Clear Selected</a>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:16px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridFungi:Grid */ %>
<table  cols=2 style="width:678px;"  name="GridFungi" id="GridFungi">

<thead><tr>

   <th>Select</th>
   <th>Fungi</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mEPA = task.getViewByName( "mEPA" );
   if ( VmlOperation.isValid( mEPA ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strGS_SelectFungi;
      String strGS_SelectFungiValue;
      String strGE_Fungi;
      
      View vGridFungi;
      vGridFungi = mEPA.newView( );
      csrRC2 = vGridFungi.cursor( "Fungi" ).setFirst( "EPA_ChemicalFamily" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridFungi.cursor( "Fungi" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGS_SelectFungi = "";
         nRC = vGridFungi.cursor( "EPA_Claim" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_SelectFungi = vGridFungi.cursor( "EPA_Claim" ).getAttribute( "wkSelected" ).getString( "" );

            if ( strGS_SelectFungi == null )
               strGS_SelectFungi = "";
         }

         if ( StringUtils.equals( strGS_SelectFungi, "Y" ) )
         {
            strGS_SelectFungiValue = "GS_SelectFungi" + strEntityKey;
            strGS_SelectFungi = "<input name='" + strGS_SelectFungiValue + "' id='" + strGS_SelectFungiValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_SelectFungiValue = "GS_SelectFungi" + strEntityKey;
            strGS_SelectFungi = "<input name='" + strGS_SelectFungiValue + "' id='" + strGS_SelectFungiValue + "' value='Y' type='checkbox' > ";
         }

         strGE_Fungi = "";
         nRC = vGridFungi.cursor( "EPA_Claim" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGE_Fungi = vGridFungi.cursor( "EPA_Claim" ).getAttribute( "Name" ).getString( "" );

            if ( strGE_Fungi == null )
               strGE_Fungi = "";
         }

         if ( StringUtils.isBlank( strGE_Fungi ) )
            strGE_Fungi = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_SelectFungi%></td>
   <td nowrap><%=strGE_Fungi%></td>

</tr>

<%
         csrRC2 = vGridFungi.cursor( "Fungi" ).setNextContinue( );
      }
      vGridFungi.drop( );
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


</div>  <!--  AddFungiList --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item Fungi -->

<div id="Viruses" class="tab-page " > <!-- Tab item Viruses -->
<h2 class="tab"><span>Viruses</span></h2>
<script type="text/javascript">OrganismClaims.addTabPage( document.getElementById( "Viruses" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:18px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* AddVirusesList:GroupBox */ %>

<div id="AddVirusesList" name="AddVirusesList" style="width:706px;height:338px;float:left;">  <!-- AddVirusesList --> 

<div  id="AddVirusesList" name="AddVirusesList" >Add Viruses List</div>

 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* HTSelectAllViruses:Text */ %>

<a href="#" id="HTSelectAllViruses" name="HTSelectAllViruses"  onclick="SelectAllClaims( );" style="width:80px;height:16px;" tabindex=-1 >Select All</a>

<% /* HTClearSelectedViruses:Text */ %>

<a href="#" id="HTClearSelectedViruses" name="HTClearSelectedViruses"  onclick="ClearSelectedClaims( );" style="width:100px;height:16px;" tabindex=-1 >Clear Selected</a>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:16px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridViruses:Grid */ %>
<table  cols=2 style=""  name="GridViruses" id="GridViruses">

<thead><tr>

   <th>Select</th>
   <th>Viruses</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mEPA = task.getViewByName( "mEPA" );
   if ( VmlOperation.isValid( mEPA ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strGS_SelectViruses;
      String strGS_SelectVirusesValue;
      String strGE_Viruses;
      
      View vGridViruses;
      vGridViruses = mEPA.newView( );
      csrRC2 = vGridViruses.cursor( "Viruses" ).setFirst( "EPA_ChemicalFamily" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridViruses.cursor( "Viruses" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGS_SelectViruses = "";
         nRC = vGridViruses.cursor( "EPA_Claim" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_SelectViruses = vGridViruses.cursor( "EPA_Claim" ).getAttribute( "wkSelected" ).getString( "" );

            if ( strGS_SelectViruses == null )
               strGS_SelectViruses = "";
         }

         if ( StringUtils.equals( strGS_SelectViruses, "Y" ) )
         {
            strGS_SelectVirusesValue = "GS_SelectViruses" + strEntityKey;
            strGS_SelectViruses = "<input name='" + strGS_SelectVirusesValue + "' id='" + strGS_SelectVirusesValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_SelectVirusesValue = "GS_SelectViruses" + strEntityKey;
            strGS_SelectViruses = "<input name='" + strGS_SelectVirusesValue + "' id='" + strGS_SelectVirusesValue + "' value='Y' type='checkbox' > ";
         }

         strGE_Viruses = "";
         nRC = vGridViruses.cursor( "EPA_Claim" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGE_Viruses = vGridViruses.cursor( "EPA_Claim" ).getAttribute( "Name" ).getString( "" );

            if ( strGE_Viruses == null )
               strGE_Viruses = "";
         }

         if ( StringUtils.isBlank( strGE_Viruses ) )
            strGE_Viruses = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_SelectViruses%></td>
   <td nowrap><%=strGE_Viruses%></td>

</tr>

<%
         csrRC2 = vGridViruses.cursor( "Viruses" ).setNextContinue( );
      }
      vGridViruses.drop( );
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


</div>  <!--  AddVirusesList --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item Viruses -->

</div> <!-- End of Tab Control OrganismClaims -->

<script type="text/javascript">setupAllTabs( );</script>

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
   session.setAttribute( "ZeidonWindow", "wMLCAddOrganismClaimsList" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
