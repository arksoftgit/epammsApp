<!DOCTYPE HTML>

<%-- wSLCDirectionsForUseSection   Generate Timestamp: 20170511111646712 --%>

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

   View mSubLC = null;
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

   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) )
   {
      // Grid: GridDirectionsUse
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSubLC.newView( );
      csrRC = vGridTmp.cursor( "S_DirectionsForUseStatement" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "S_DirectionsForUseStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "S_DirectionsForUseStatement" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: Grid2
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSubLC.newView( );
      csrRC = vGridTmp.cursor( "S_ClaimsDrivingUsage" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "S_ClaimsDrivingUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "S_ClaimsDrivingUsage" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: GridDFU_SectionKeywords
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSubLC.newView( );
      csrRC = vGridTmp.cursor( "S_InsertTextKeywordSectionDU" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "S_InsertTextKeywordSectionDU" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "S_InsertTextKeywordSectionDU" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: Grid1
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSubLC.newView( );
      csrRC = vGridTmp.cursor( "S_ClaimsDrivingUsage" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "S_ClaimsDrivingUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "S_ClaimsDrivingUsage" ).setNextContinue( );
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

if ( strLastWindow.equals("wSLCDirectionsForUseSection") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wSLC_Dialog wSLC = new wSLC_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wSLCDirectionsForUseSection strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSLCDirectionsForUseSection LastWindow *** " + strLastWindow );
task.log().info("*** wSLCDirectionsForUseSection LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelDirectionsUseSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCDirectionsForUseSection", strActionToProcess );

      // Next Window
      strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DirectionsForUseStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSubLC;
      mSubLC = task.getViewByName( "mSubLC" );
      if ( VmlOperation.isValid( mSubLC ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSubLC.cursor( "S_DirectionsForUseStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubLC.cursor( "S_DirectionsForUseStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubLC.cursor( "S_DirectionsForUseStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubLC.cursor( "S_DirectionsForUseStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Next Window
      strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartModalSubwindow, "wSLC", "DirectionsForUseStatement" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wSLCDirectionsForUseSection" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wSLCDirectionsForUseSection" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSLCDirectionsForUseSection.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSLCDirectionsForUseSection.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSLCDirectionsForUseSection.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSLCDirectionsForUseSection.jsp" );
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
   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSLC", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wSLC", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "DirectionsForUseSection", "" );
   }

%>

<html>
<head>

<title>SLC Directions For Use Section</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/tabpane.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSLCDirectionsForUseSection.js"></script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<%@ include file="./include/pagebackground.inc" %>  <!-- just temporary until we get the painter dialog updates from Kelly ... 2011.10.08 dks -->

<div id="wrapper">

<jsp:include page='<%=strBannerName %>' />

<div id="maincontent">

<div id="leftcontent">

<!-- Side Navigation *********************** -->
<div id="sidenavigation">
   <ul id="Return" name="Return">
<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="CancelAndReturn" name="CancelAndReturn"><a href="#"  onclick="CancelDirectionsUseSect()">Return</a></li>
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


<form name="wSLCDirectionsForUseSection" id="wSLCDirectionsForUseSection" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lMLC = null;
   View lSPLDLST = null;
   View mLLD_LST = null;
   View mMasLC = null;
   View mMasLC_Root = null;
   View mMasProd = null;
   View mSPLDef = null;
   View mSubLC = null;
   View mSubLC_Root = null;
   View mSubProd = null;
   View mSubreg = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSLC", "DirectionsForUseSection" );
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
   <input name="zDateSequence" id="zDateSequence" type="hidden" value="MDY">
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
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBDirectionsForUseSection:GroupBox */ %>

<div id="GBDirectionsForUseSection" name="GBDirectionsForUseSection" class="withborder" style="width:814px;float:left;">  <!-- GBDirectionsForUseSection --> 


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp</span>
<% /* DirectionsForUseSection:Text */ %>

<span class="listheader"  id="DirectionsForUseSection" name="DirectionsForUseSection" style="width:238px;height:16px;" tabindex=-1 >Directions for Use Section</span>

<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* Category::Text */ %>

<span class="text12lightright"  id="Category:" name="Category:" style="width:90px;height:16px;" tabindex=-1 >  ... Category:</span>

<span style="height:16px;">&nbsp</span>
<% /* DFU_CategoryName:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "DFU_CategoryName" );
   else
   {
      nRC = mSubLC.cursor( "S_DirectionsForUseCategory" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_DirectionsForUseCategory" ).getAttribute( "Name" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on DFU_CategoryName: " + e.getMessage());
         task.log().info( "*** Error on ctrl DFU_CategoryName" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text12light"  id="DFU_CategoryName" name="DFU_CategoryName" style="width:430px;height:16px;" tabindex=-1 ><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:16px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* DirectionsUseName::Text */ %>

<span  id="DirectionsUseName:" name="DirectionsUseName:" style="width:130px;height:16px;" tabindex=-1 >Name:</span>

<% /* DirectionsUseName:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "DirectionsUseName" );
   else
   {
      nRC = mSubLC.cursor( "S_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_DirectionsForUseSection" ).getAttribute( "Name" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on DirectionsUseName: " + e.getMessage());
         task.log().info( "*** Error on ctrl DirectionsUseName" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text12"  id="DirectionsUseName" name="DirectionsUseName"  title="Required Name to differentiate Directions for Use Sections within a list" style="width:618px;height:16px;" tabindex=-1 ><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* DirectionsForUseTitle::Text */ %>

<span  id="DirectionsForUseTitle:" name="DirectionsForUseTitle:" style="width:130px;height:16px;" tabindex=-1 >Title:</span>

<% /* DirectionsForUseTitle:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "DirectionsForUseTitle" );
   else
   {
      nRC = mSubLC.cursor( "S_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_DirectionsForUseSection" ).getAttribute( "Title" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on DirectionsForUseTitle: " + e.getMessage());
         task.log().info( "*** Error on ctrl DirectionsForUseTitle" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text12"  id="DirectionsForUseTitle" name="DirectionsForUseTitle"  title="Optional Title to appear with text on generated label" style="width:618px;height:32px;" tabindex=-1 ><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* TitleNote::Text */ %>

<span  id="TitleNote:" name="TitleNote:" style="width:130px;height:16px;" tabindex=-1 >Title Note:</span>

<% /* TitleNote:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "TitleNote" );
   else
   {
      nRC = mSubLC.cursor( "S_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_DirectionsForUseSection" ).getAttribute( "HeadNote" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on TitleNote: " + e.getMessage());
         task.log().info( "*** Error on ctrl TitleNote" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text12"  id="TitleNote" name="TitleNote"  title="Optional Title to appear with text on generated label" style="width:618px;height:16px;" tabindex=-1 ><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* Subtitle::Text */ %>

<span  id="Subtitle:" name="Subtitle:" style="width:130px;height:16px;" tabindex=-1 >Subtitle:</span>

<% /* Subtitle:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "Subtitle" );
   else
   {
      nRC = mSubLC.cursor( "S_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_DirectionsForUseSection" ).getAttribute( "Subtitle" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on Subtitle: " + e.getMessage());
         task.log().info( "*** Error on ctrl Subtitle" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text12"  id="Subtitle" name="Subtitle"  title="Optional Title to appear with text on generated label" style="width:618px;height:32px;" tabindex=-1 ><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* SectionEndNote::Text */ %>

<span  id="SectionEndNote:" name="SectionEndNote:" style="width:130px;height:16px;" tabindex=-1 >End Note:</span>

<% /* SectionNote:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "SectionNote" );
   else
   {
      nRC = mSubLC.cursor( "S_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_DirectionsForUseSection" ).getAttribute( "TailNote" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on SectionNote: " + e.getMessage());
         task.log().info( "*** Error on ctrl SectionNote" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text12"  id="SectionNote" name="SectionNote"  title="Optional Title to appear with text on generated label" style="width:618px;height:16px;" tabindex=-1 ><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* ExclusiveXOR::Text */ %>

<span  id="ExclusiveXOR:" name="ExclusiveXOR:" style="width:130px;height:16px;" tabindex=-1 >Exclusive To:</span>

<% /* NameXOR:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "NameXOR" );
   else
   {
      nRC = mSubLC.cursor( "S_DirectionsForUseXORSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_DirectionsForUseXORSection" ).getAttribute( "Name" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on NameXOR: " + e.getMessage());
         task.log().info( "*** Error on ctrl NameXOR" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span  id="NameXOR" name="NameXOR" style="width:218px;height:16px;" tabindex=-1 ><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->


</div>  <!--  GBDirectionsForUseSection --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:18px;float:left;"></div>   <!-- Width Spacer -->
<% /* Tab1:Tab */ %>

<div id="Tab1" class="tab-pane" style="width:798px;"> <!-- Beginning of Tab Control Tab1 -->
<script type="text/javascript">Tab1 = new WebFXTabPane( document.getElementById( "Tab1" ) );</script>

<div id="TabCtl1" class="tab-page " > <!-- Tab item TabCtl1 -->
<h2 class="tab"><span>Statements</span></h2>
<script type="text/javascript">Tab1.addTabPage( document.getElementById( "TabCtl1" ) );</script>


<div>  <!-- Beginning of a new line -->
<% /* GBDirectionsUseStatements:GroupBox */ %>

<div id="GBDirectionsUseStatements" name="GBDirectionsUseStatements" style="width:818px;float:left;">  <!-- GBDirectionsUseStatements --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox9:GroupBox */ %>

<div id="GroupBox9" name="GroupBox9"   style="float:left;position:relative; width:686px; height:30px;">  <!-- GroupBox9 --> 

<% /* Text5:Text */ %>

<label class="listheader"  id="Text5" name="Text5" style="">Directions for Use Statements</label>


</div>  <!--  GroupBox9 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridDirectionsUse:Grid */ %>
<table  cols=2 style=""  name="GridDirectionsUse" id="GridDirectionsUse">

<thead><tr>

   <th>Statement Text</th>
   <th>Display</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strGridEditDirectionsUse;
      String strBMBUpdateDFU_Statement;
      
      View vGridDirectionsUse;
      vGridDirectionsUse = mSubLC.newView( );
      csrRC2 = vGridDirectionsUse.cursor( "S_DirectionsForUseStatement" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridDirectionsUse.cursor( "S_DirectionsForUseStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditDirectionsUse = "";
         nRC = vGridDirectionsUse.cursor( "S_DirectionsForUseStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditDirectionsUse = vGridDirectionsUse.cursor( "S_DirectionsForUseStatement" ).getAttribute( "dDU_StatementTitleTextKeyword" ).getString( "" );

            if ( strGridEditDirectionsUse == null )
               strGridEditDirectionsUse = "";
         }

         if ( StringUtils.isBlank( strGridEditDirectionsUse ) )
            strGridEditDirectionsUse = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="GOTO_DirectionsForUseStatement( this.id )" id="GridEditDirectionsUse::<%=strEntityKey%>"><%=strGridEditDirectionsUse%></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdateDFU_Statement" onclick="GOTO_DirectionsForUseStatement( this.id )" id="BMBUpdateDFU_Statement::<%=strEntityKey%>"><img src="./images/ePammsDisplay.png" alt="Display"></a></td>

</tr>

<%
         csrRC2 = vGridDirectionsUse.cursor( "S_DirectionsForUseStatement" ).setNextContinue( );
      }
      vGridDirectionsUse.drop( );
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


</div>  <!--  GBDirectionsUseStatements --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabCtl1 -->

<div id="Keywords" class="tab-page " > <!-- Tab item Keywords -->
<h2 class="tab"><span>Keywords</span></h2>
<script type="text/javascript">Tab1.addTabPage( document.getElementById( "Keywords" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* DirectionsForUseTitleKey::Text */ %>

<span  id="DirectionsForUseTitleKey:" name="DirectionsForUseTitleKey:" style="width:70px;height:16px;" tabindex=-1 >Title:</span>

<span style="height:16px;">&nbsp</span>
<% /* DirectionsForUseTitleKey:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "DirectionsForUseTitleKey" );
   else
   {
      nRC = mSubLC.cursor( "S_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_DirectionsForUseSection" ).getAttribute( "dDU_SectionTitleKeyword" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on DirectionsForUseTitleKey: " + e.getMessage());
         task.log().info( "*** Error on ctrl DirectionsForUseTitleKey" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text12"  id="DirectionsForUseTitleKey" name="DirectionsForUseTitleKey"  title="Optional Title to appear with text on generated label" style="width:698px;height:16px;" tabindex=-1 ><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* SubtitleKey::Text */ %>

<span  id="SubtitleKey:" name="SubtitleKey:" style="width:70px;height:16px;" tabindex=-1 >Subtitle:</span>

<span style="height:16px;">&nbsp</span>
<% /* SubtitleKey:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "SubtitleKey" );
   else
   {
      nRC = mSubLC.cursor( "S_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_DirectionsForUseSection" ).getAttribute( "dDU_SectionTextKeyword" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on SubtitleKey: " + e.getMessage());
         task.log().info( "*** Error on ctrl SubtitleKey" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text12"  id="SubtitleKey" name="SubtitleKey"  title="Optional Title to appear with text on generated label" style="width:698px;height:16px;" tabindex=-1 ><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox11:GroupBox */ %>

<div id="GroupBox11" name="GroupBox11" style="width:778px;float:left;">  <!-- GroupBox11 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox7:GroupBox */ %>

<div id="GroupBox7" name="GroupBox7"   style="float:left;position:relative; width:756px; height:30px;">  <!-- GroupBox7 --> 

<% /* KeywordTextEmbedding:Text */ %>

<label class="listheader"  id="KeywordTextEmbedding" name="KeywordTextEmbedding" style="">Keyword text for Embedding in Section Title/Subtitle</label>


</div>  <!--  GroupBox7 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridDFU_SectionKeywords:Grid */ %>
<table  cols=2 style=""  name="GridDFU_SectionKeywords" id="GridDFU_SectionKeywords">

<thead><tr>

   <th>Keyword</th>
   <th>Keyword Text</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strKeywordName;
      String strKeywordText;
      
      View vGridDFU_SectionKeywords;
      vGridDFU_SectionKeywords = mSubLC.newView( );
      csrRC2 = vGridDFU_SectionKeywords.cursor( "S_InsertTextKeywordSectionDU" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridDFU_SectionKeywords.cursor( "S_InsertTextKeywordSectionDU" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strKeywordName = "";
         nRC = vGridDFU_SectionKeywords.cursor( "S_InsertTextKeywordSectionDU" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strKeywordName = vGridDFU_SectionKeywords.cursor( "S_InsertTextKeywordSectionDU" ).getAttribute( "Name" ).getString( "" );

            if ( strKeywordName == null )
               strKeywordName = "";
         }

         if ( StringUtils.isBlank( strKeywordName ) )
            strKeywordName = "&nbsp";

         strKeywordText = "";
         nRC = vGridDFU_SectionKeywords.cursor( "S_InsertTextSectionDU" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strKeywordText = vGridDFU_SectionKeywords.cursor( "S_InsertTextSectionDU" ).getAttribute( "Text" ).getString( "" );

            if ( strKeywordText == null )
               strKeywordText = "";
         }

         if ( StringUtils.isBlank( strKeywordText ) )
            strKeywordText = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strKeywordName%></td>
   <td><%=strKeywordText%></td>

</tr>

<%
         csrRC2 = vGridDFU_SectionKeywords.cursor( "S_InsertTextKeywordSectionDU" ).setNextContinue( );
      }
      vGridDFU_SectionKeywords.drop( );
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


</div>  <!--  GroupBox11 --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item Keywords -->

<div id="TabCtl2" class="tab-page " > <!-- Tab item TabCtl2 -->
<h2 class="tab"><span>SLC Claims Driving Section</span></h2>
<script type="text/javascript">Tab1.addTabPage( document.getElementById( "TabCtl2" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox5:GroupBox */ %>

<div id="GroupBox5" name="GroupBox5" style="width:780px;float:left;">  <!-- GroupBox5 --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox8:GroupBox */ %>

<div id="GroupBox8" name="GroupBox8"   style="float:left;position:relative; width:686px; height:30px;">  <!-- GroupBox8 --> 

<% /* Text4:Text */ %>

<label class="listheader"  id="Text4" name="Text4" style="">Claims that Drive the current Section to be included in the SLC</label>


</div>  <!--  GroupBox8 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Grid1:Grid */ %>
<table  cols=2 style=""  name="Grid1" id="Grid1">

<thead><tr>

   <th>Claim Classification</th>
   <th>Usage Name</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strGridEditCtl1;
      String strGridEditCtl2;
      
      View vGrid1;
      vGrid1 = mSubLC.newView( );
      csrRC2 = vGrid1.cursor( "S_ClaimsDrivingUsage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid1.cursor( "S_ClaimsDrivingUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditCtl1 = "";
         nRC = vGrid1.cursor( "S_ClaimsDrivingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl1 = vGrid1.cursor( "S_ClaimsDrivingUsage" ).getAttribute( "ClaimsClassification" ).getString( "" );

            if ( strGridEditCtl1 == null )
               strGridEditCtl1 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl1 ) )
            strGridEditCtl1 = "&nbsp";

         strGridEditCtl2 = "";
         nRC = vGrid1.cursor( "S_ClaimsDrivingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl2 = vGrid1.cursor( "S_ClaimsDrivingUsage" ).getAttribute( "dDisplayUsageName" ).getString( "" );

            if ( strGridEditCtl2 == null )
               strGridEditCtl2 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl2 ) )
            strGridEditCtl2 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGridEditCtl1%></td>
   <td><%=strGridEditCtl2%></td>

</tr>

<%
         csrRC2 = vGrid1.cursor( "S_ClaimsDrivingUsage" ).setNextContinue( );
      }
      vGrid1.drop( );
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


</div>  <!--  GroupBox5 --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabCtl2 -->

<div id="TabCtl3" class="tab-page " > <!-- Tab item TabCtl3 -->
<h2 class="tab"><span>MLC Claims Driving Section</span></h2>
<script type="text/javascript">Tab1.addTabPage( document.getElementById( "TabCtl3" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox6:GroupBox */ %>

<div id="GroupBox6" name="GroupBox6" style="width:780px;float:left;">  <!-- GroupBox6 --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox10:GroupBox */ %>

<div id="GroupBox10" name="GroupBox10"   style="float:left;position:relative; width:686px; height:30px;">  <!-- GroupBox10 --> 

<% /* Text7:Text */ %>

<label class="listheader"  id="Text7" name="Text7" style="">Claims that Drive the current Section to be included in the SLC</label>


</div>  <!--  GroupBox10 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Grid2:Grid */ %>
<table  cols=2 style=""  name="Grid2" id="Grid2">

<thead><tr>

   <th>Claim Classification</th>
   <th>Usage Name</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strGridEditCtl3;
      String strGridEditCtl4;
      
      View vGrid2;
      vGrid2 = mSubLC.newView( );
      csrRC2 = vGrid2.cursor( "S_ClaimsDrivingUsage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid2.cursor( "S_ClaimsDrivingUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditCtl3 = "";
         nRC = vGrid2.cursor( "S_ClaimsDrivingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl3 = vGrid2.cursor( "S_ClaimsDrivingUsage" ).getAttribute( "ClaimsClassification" ).getString( "" );

            if ( strGridEditCtl3 == null )
               strGridEditCtl3 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl3 ) )
            strGridEditCtl3 = "&nbsp";

         strGridEditCtl4 = "";
         nRC = vGrid2.cursor( "S_ClaimsDrivingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl4 = vGrid2.cursor( "S_ClaimsDrivingUsage" ).getAttribute( "dDisplayUsageName" ).getString( "" );

            if ( strGridEditCtl4 == null )
               strGridEditCtl4 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl4 ) )
            strGridEditCtl4 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGridEditCtl3%></td>
   <td><%=strGridEditCtl4%></td>

</tr>

<%
         csrRC2 = vGrid2.cursor( "S_ClaimsDrivingUsage" ).setNextContinue( );
      }
      vGrid2.drop( );
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


</div>  <!--  GroupBox6 --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabCtl3 -->

</div> <!-- End of Tab Control Tab1 -->

<script type="text/javascript">setupAllTabs( );</script>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:448px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:32px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:40px;height:24px;float:left;">  <!-- GroupBox1 --> 


</div>  <!--  GroupBox1 --> 
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
   session.setAttribute( "ZeidonWindow", "wSLCDirectionsForUseSection" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
