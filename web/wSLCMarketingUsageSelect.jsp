<!DOCTYPE HTML>

<%-- wSLCMarketingUsageSelect --%>

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
      // Grid: Grid1
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSubLC.newView( );
      csrRC = vGridTmp.cursor( "S_MarketingUsageOrdering" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "S_MarketingUsageOrdering" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GridCheckCtl2" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GridCheckCtl2", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "S_MarketingUsageOrdering" ).getAttribute( "wSelected" ).setValue( strMapValue );
               else
                  vGridTmp.cursor( "S_MarketingUsageOrdering" ).getAttribute( "wSelected" ).setValue( "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "S_MarketingUsageOrdering" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: Grid2
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSubLC.newView( );
      csrRC = vGridTmp.cursor( "S_SelectableMarketingUsage" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "S_SelectableMarketingUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GridCheckCtl1" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GridCheckCtl1", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "S_SelectableMarketingUsage" ).getAttribute( "wSelected" ).setValue( strMapValue );
               else
                  vGridTmp.cursor( "S_SelectableMarketingUsage" ).getAttribute( "wSelected" ).setValue( "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "S_SelectableMarketingUsage" ).setNextContinue( );
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

if ( strLastWindow.equals("wSLCMarketingUsageSelect") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wSLCMarketingUsageSelect strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSLCMarketingUsageSelect LastWindow *** " + strLastWindow );
task.log().info("*** wSLCMarketingUsageSelect LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "RemoveMarketingUsageEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCMarketingUsageSelect", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCMarketingUsageSelect.jsp", "wSLC.RemoveMarketingUsageEntries" );
         nOptRC = wSLC.RemoveMarketingUsageEntries( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "Return" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCMarketingUsageSelect", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectMarketingUsageEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCMarketingUsageSelect", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCMarketingUsageSelect.jsp", "wSLC.SelectMarketingUsageEntries" );
         nOptRC = wSLC.SelectMarketingUsageEntries( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StayOnWindowWithRefresh, "", "" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wSLCMarketingUsageSelect" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wSLCMarketingUsageSelect" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCMarketingUsageSelect", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSLCMarketingUsageSelect.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSLCMarketingUsageSelect.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSLCMarketingUsageSelect.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSLCMarketingUsageSelect.jsp" );
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
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString();

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wSLC" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "MarketingUsageSelect" );
   }

%>

<html>
<head>

<title>Marketing Usage Select</title>

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
<script language="JavaScript" type="text/javascript" src="./genjs/wSLCMarketingUsageSelect.js"></script>

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
       <li><a href="#"  onclick="Return( )">Return</a></li>
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


<form name="wSLCMarketingUsageSelect" id="wSLCMarketingUsageSelect" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View mMasLC = null;
   View mSubLC = null;
   View mSubreg = null;
   View mSubProd = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSLC", "MarketingUsageSelect" );
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
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:4px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4" style="width:866px;float:left;">  <!-- GroupBox4 --> 


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:404px;float:left;">  <!-- GroupBox1 --> 


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:22px;">&nbsp</span>
<% /* Text1:Text */ %>

<span  id="Text1" name="Text1" style="width:382px;height:22px;">Currently Selected SLC  Marketing Entries</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Grid1:Grid */ %>
<table  cols=2 style="width:402px;"  name="Grid1" id="Grid1">

<thead><tr>

   <th class="gridheading"><input type="checkbox" onclick="CheckAllInGrid(this,'GridCheckCtl2')"></th>
   <th style="width:358px;">Name</th>

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
      String strGridCheckCtl2;
      String strGridCheckCtl2Value;
      String strGridEditCtl2;
      
      View vGrid1;
      vGrid1 = mSubLC.newView( );
      csrRC2 = vGrid1.cursor( "S_MarketingUsageOrdering" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid1.cursor( "S_MarketingUsageOrdering" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridCheckCtl2 = "";
         nRC = vGrid1.cursor( "S_MarketingUsageOrdering" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridCheckCtl2 = vGrid1.cursor( "S_MarketingUsageOrdering" ).getAttribute( "wSelected" ).getString( "" );

            if ( strGridCheckCtl2 == null )
               strGridCheckCtl2 = "";
         }

         if ( StringUtils.equals( strGridCheckCtl2, "Y" ) )
         {
            strGridCheckCtl2Value = "GridCheckCtl2" + strEntityKey;
            strGridCheckCtl2 = "<input name='" + strGridCheckCtl2Value + "' id='" + strGridCheckCtl2Value + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGridCheckCtl2Value = "GridCheckCtl2" + strEntityKey;
            strGridCheckCtl2 = "<input name='" + strGridCheckCtl2Value + "' id='" + strGridCheckCtl2Value + "' value='Y' type='checkbox' > ";
         }

         strGridEditCtl2 = "";
         nRC = vGrid1.cursor( "S_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl2 = vGrid1.cursor( "S_MarketingUsage" ).getAttribute( "dDisplayUsageName" ).getString( "" );

            if ( strGridEditCtl2 == null )
               strGridEditCtl2 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl2 ) )
            strGridEditCtl2 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGridCheckCtl2%></td>
   <td nowrap style="width:358px;"><%=strGridEditCtl2%></td>

</tr>

<%
         csrRC2 = vGrid1.cursor( "S_MarketingUsageOrdering" ).setNextContinue( );
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


</div>  <!--  GroupBox1 --> 
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:28px;height:224px;float:left;">  <!-- GroupBox3 --> 


<div>  <!-- Beginning of a new line -->
<% /* GroupBox5:GroupBox */ %>

<div id="GroupBox5" name="GroupBox5" style="width:22px;height:76px;float:left;">  <!-- GroupBox5 --> 


</div>  <!--  GroupBox5 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* PushBtn1:PushBtn */ %>
<button type="button" name="PushBtn1" id="PushBtn1" value="" onclick="SelectMarketingUsageEntries( )" style="width:26px;height:32px;"><-</button>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* PushBtn2:PushBtn */ %>
<button type="button" name="PushBtn2" id="PushBtn2" value="" onclick="RemoveMarketingUsageEntries( )" style="width:26px;height:32px;">-></button>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox3 --> 
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" style="width:412px;float:left;">  <!-- GroupBox2 --> 


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:24px;">&nbsp</span>
<% /* Text2:Text */ %>

<span  id="Text2" name="Text2" style="width:306px;height:24px;">Potential SLC Components from MLC</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Grid2:Grid */ %>
<table  cols=2 style="width:410px;"  name="Grid2" id="Grid2">

<thead><tr>

   <th class="gridheading"><input type="checkbox" onclick="CheckAllInGrid(this,'GridCheckCtl1')"></th>
   <th style="width:374px;">Name</th>

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
      String strGridCheckCtl1;
      String strGridCheckCtl1Value;
      String strGridEditCtl1;
      
      View vGrid2;
      vGrid2 = mSubLC.newView( );
      csrRC2 = vGrid2.cursor( "S_SelectableMarketingUsage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid2.cursor( "S_SelectableMarketingUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridCheckCtl1 = "";
         nRC = vGrid2.cursor( "S_SelectableMarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridCheckCtl1 = vGrid2.cursor( "S_SelectableMarketingUsage" ).getAttribute( "wSelected" ).getString( "" );

            if ( strGridCheckCtl1 == null )
               strGridCheckCtl1 = "";
         }

         if ( StringUtils.equals( strGridCheckCtl1, "Y" ) )
         {
            strGridCheckCtl1Value = "GridCheckCtl1" + strEntityKey;
            strGridCheckCtl1 = "<input name='" + strGridCheckCtl1Value + "' id='" + strGridCheckCtl1Value + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGridCheckCtl1Value = "GridCheckCtl1" + strEntityKey;
            strGridCheckCtl1 = "<input name='" + strGridCheckCtl1Value + "' id='" + strGridCheckCtl1Value + "' value='Y' type='checkbox' > ";
         }

         strGridEditCtl1 = "";
         nRC = vGrid2.cursor( "S_SelectableMarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl1 = vGrid2.cursor( "S_SelectableMarketingUsage" ).getAttribute( "dDisplayUsageName" ).getString( "" );

            if ( strGridEditCtl1 == null )
               strGridEditCtl1 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl1 ) )
            strGridEditCtl1 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGridCheckCtl1%></td>
   <td nowrap style="width:374px;"><%=strGridEditCtl1%></td>

</tr>

<%
         csrRC2 = vGrid2.cursor( "S_SelectableMarketingUsage" ).setNextContinue( );
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


</div>  <!--  GroupBox2 --> 
</div>  <!-- End of a new line -->


</div>  <!--  GroupBox4 --> 
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
   session.setAttribute( "ZeidonWindow", "wSLCMarketingUsageSelect" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
