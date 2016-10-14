<!DOCTYPE HTML>

<%-- wSLCTableData   Generate Timestamp: 20161014110809591 --%>

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
      // Grid: GridTable
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSubLC.newView( );
      csrRC = vGridTmp.cursor( "S_Rows" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "S_Rows" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "S_Rows" ).setNextContinue( );
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
String strColumnCnt = "";
String strColumnList = "";

strActionToProcess = (String) request.getParameter( "zAction" );

strLastWindow = (String) session.getAttribute( "ZeidonWindow" );
if ( StringUtils.isBlank( strLastWindow ) ) 
   strLastWindow = "NoLastWindow";

strLastAction = (String) session.getAttribute( "ZeidonAction" );

if ( strLastWindow.equals("wSLCTableData") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wSLCTableData strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSLCTableData LastWindow *** " + strLastWindow );
task.log().info("*** wSLCTableData LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "Return" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCTableData", strActionToProcess );

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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wSLCTableData" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wSLCTableData" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCTableData", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSLCTableData.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSLCTableData.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSLCTableData.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSLCTableData.jsp" );
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

   // Hand coded
   View mSubLCTable = task.getViewByName( "mSubLC" );
   EntityCursor cursor = mSubLCTable.cursor( "S_MetaTable" );
   strColumnCnt = cursor.getAttribute( "Columns" ).getString( "" );
   int nCols = cursor.getAttribute( "Columns" ).getInteger( "" );
   int k;
   strColumnList = "";
   for ( k = 1; k <= nCols; k++ )
   {
      strColumnList += cursor.getAttribute( "Title" + k ).getString( "" );
      if ( k < nCols )
         strColumnList += ",";
   }
   // End of: Hand coded

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSLC", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wSLC", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "TableData", "" );
   }

%>

<html>
<head>

<title>Table Data</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jsoeUtils.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jsoe.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSLCTableData.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Return" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="Return" name="Return"><a href="#"  onclick="Return()">Return</a></li>
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


<form name="wSLCTableData" id="wSLCTableData" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lMLC = null;
   View wWebXfer = null;
   View lSPLDLST = null;
   View mLLD_LST = null;
   View mMasLC = null;
   View mMasProd = null;
   View mSPLDef = null;
   View mSubLC = null;
   View mSubLC_Root = null;
   View mSubProd = null;
   View mSubreg = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSLC", "TableData" );
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
   <input name="zColumnCnt" id="zColumnCnt" type="hidden" value="<%=strColumnCnt%>">
   <input name="zColumnList" id="zColumnList" type="hidden" value="<%=strColumnList%>">

   <div name="ShowVMLError" id="ShowVMLError" class="ShowVMLError">
      <%=strVMLError%>
   </div>


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* TableData:GroupBox */ %>

<div id="TableData" name="TableData"   style="float:left;position:relative; width:730px; height:234px;">  <!-- TableData --> 

<% /* Table:Text */ %>

<label class="groupbox"  id="Table" name="Table" style="width:338px;height:16px;position:absolute;left:6px;top:6px;">Table</label>

<% /* Name::Text */ %>

<label  id="Name:" name="Name:" style="width:110px;height:16px;position:absolute;left:20px;top:26px;">Name:</label>

<% /* TableName:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "TableName" );
   else
   {
      nRC = mSubLC.cursor( "S_MetaTable" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_MetaTable" ).getAttribute( "Name" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on TableName: " + e.getMessage());
         task.log().info( "*** Error on ctrl TableName" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label class="text12"  id="TableName" name="TableName" style="width:590px;height:24px;position:absolute;left:130px;top:26px;"><%=strTextDisplayValue%></label>

<% /* Description::Text */ %>

<label  id="Description:" name="Description:" style="width:110px;height:16px;position:absolute;left:20px;top:52px;">Description:</label>

<% /* Description:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "Description" );
   else
   {
      nRC = mSubLC.cursor( "S_MetaTable" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_MetaTable" ).getAttribute( "Description" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on Description: " + e.getMessage());
         task.log().info( "*** Error on ctrl Description" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label class="text12"  id="Description" name="Description" style="width:590px;height:24px;position:absolute;left:130px;top:52px;"><%=strTextDisplayValue%></label>

<% /* Columns::Text */ %>

<label  id="Columns:" name="Columns:" style="width:110px;height:16px;position:absolute;left:20px;top:78px;">Columns:</label>

<% /* Columns:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "Columns" );
   else
   {
      nRC = mSubLC.cursor( "S_MetaTable" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_MetaTable" ).getAttribute( "Columns" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on Columns: " + e.getMessage());
         task.log().info( "*** Error on ctrl Columns" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label class="text12"  id="Columns" name="Columns" style="width:62px;height:24px;position:absolute;left:130px;top:78px;"><%=strTextDisplayValue%></label>

<% /* GridTable:Grid */ %>
<table  cols=10 style="position:absolute;top:112px;left:8px;"  name="GridTable" id="GridTable">

<thead><tr>

   <th>x1</th>
   <th>x2</th>
   <th>x3</th>
   <th>x4</th>
   <th>x5</th>
   <th>x6</th>
   <th>x7</th>
   <th>x8</th>
   <th>x9</th>
   <th>x10</th>

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
      String strx1;
      String strx2;
      String strx3;
      String strx4;
      String strx5;
      String strx6;
      String strx7;
      String strx8;
      String strx9;
      String strx10;
      
      View vGridTable;
      vGridTable = mSubLC.newView( );
      csrRC2 = vGridTable.cursor( "S_Rows" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridTable.cursor( "S_Rows" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strx1 = "";
         nRC = vGridTable.cursor( "S_Rows" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strx1 = vGridTable.cursor( "S_Rows" ).getAttribute( "Text1" ).getString( "" );

            if ( strx1 == null )
               strx1 = "";
         }

         if ( StringUtils.isBlank( strx1 ) )
            strx1 = "&nbsp";

         strx2 = "";
         nRC = vGridTable.cursor( "S_Rows" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strx2 = vGridTable.cursor( "S_Rows" ).getAttribute( "Text2" ).getString( "" );

            if ( strx2 == null )
               strx2 = "";
         }

         if ( StringUtils.isBlank( strx2 ) )
            strx2 = "&nbsp";

         strx3 = "";
         nRC = vGridTable.cursor( "S_Rows" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strx3 = vGridTable.cursor( "S_Rows" ).getAttribute( "Text3" ).getString( "" );

            if ( strx3 == null )
               strx3 = "";
         }

         if ( StringUtils.isBlank( strx3 ) )
            strx3 = "&nbsp";

         strx4 = "";
         nRC = vGridTable.cursor( "S_Rows" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strx4 = vGridTable.cursor( "S_Rows" ).getAttribute( "Text4" ).getString( "" );

            if ( strx4 == null )
               strx4 = "";
         }

         if ( StringUtils.isBlank( strx4 ) )
            strx4 = "&nbsp";

         strx5 = "";
         nRC = vGridTable.cursor( "S_Rows" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strx5 = vGridTable.cursor( "S_Rows" ).getAttribute( "Text5" ).getString( "" );

            if ( strx5 == null )
               strx5 = "";
         }

         if ( StringUtils.isBlank( strx5 ) )
            strx5 = "&nbsp";

         strx6 = "";
         nRC = vGridTable.cursor( "S_Rows" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strx6 = vGridTable.cursor( "S_Rows" ).getAttribute( "Text6" ).getString( "" );

            if ( strx6 == null )
               strx6 = "";
         }

         if ( StringUtils.isBlank( strx6 ) )
            strx6 = "&nbsp";

         strx7 = "";
         nRC = vGridTable.cursor( "S_Rows" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strx7 = vGridTable.cursor( "S_Rows" ).getAttribute( "Text7" ).getString( "" );

            if ( strx7 == null )
               strx7 = "";
         }

         if ( StringUtils.isBlank( strx7 ) )
            strx7 = "&nbsp";

         strx8 = "";
         nRC = vGridTable.cursor( "S_Rows" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strx8 = vGridTable.cursor( "S_Rows" ).getAttribute( "Text8" ).getString( "" );

            if ( strx8 == null )
               strx8 = "";
         }

         if ( StringUtils.isBlank( strx8 ) )
            strx8 = "&nbsp";

         strx9 = "";
         nRC = vGridTable.cursor( "S_Rows" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strx9 = vGridTable.cursor( "S_Rows" ).getAttribute( "Text9" ).getString( "" );

            if ( strx9 == null )
               strx9 = "";
         }

         if ( StringUtils.isBlank( strx9 ) )
            strx9 = "&nbsp";

         strx10 = "";
         nRC = vGridTable.cursor( "S_Rows" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strx10 = vGridTable.cursor( "S_Rows" ).getAttribute( "Text10" ).getString( "" );

            if ( strx10 == null )
               strx10 = "";
         }

         if ( StringUtils.isBlank( strx10 ) )
            strx10 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strx1%></td>
   <td><%=strx2%></td>
   <td><%=strx3%></td>
   <td><%=strx4%></td>
   <td><%=strx5%></td>
   <td><%=strx6%></td>
   <td><%=strx7%></td>
   <td><%=strx8%></td>
   <td><%=strx9%></td>
   <td><%=strx10%></td>

</tr>

<%
         csrRC2 = vGridTable.cursor( "S_Rows" ).setNextContinue( );
      }
      vGridTable.drop( );
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


</div>  <!--  TableData --> 
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
   session.setAttribute( "ZeidonWindow", "wSLCTableData" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
