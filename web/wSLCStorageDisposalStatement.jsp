<!DOCTYPE HTML>

<%-- wSLCStorageDisposalStatement   Generate Timestamp: 20161019144229460 --%>

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

   View mMasLC = null;
   View mSubLC = null;
   View mSubLC_Root = null;
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

   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
   }

   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) )
   {
      // Grid: Grid5
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSubLC.newView( );
      csrRC = vGridTmp.cursor( "S_InsertTextKeywordSD" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "S_InsertTextKeywordSD" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "S_InsertTextKeywordSD" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: GridStorDisp
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSubLC.newView( );
      csrRC = vGridTmp.cursor( "S_StorageDisposalSubStatement" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "S_StorageDisposalSubStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "S_StorageDisposalSubStatement" ).setNextContinue( );
      }

      vGridTmp.drop( );
   }

   mSubLC_Root = task.getViewByName( "mSubLC_Root" );
   if ( VmlOperation.isValid( mSubLC_Root ) )
   {
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

if ( strLastWindow.equals("wSLCStorageDisposalStatement") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wSLCStorageDisposalStatement strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSLCStorageDisposalStatement LastWindow *** " + strLastWindow );
task.log().info("*** wSLCStorageDisposalStatement LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_StorageDisposaSublStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCStorageDisposalStatement", strActionToProcess );

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
         csrRC = mSubLC.cursor( "S_StorageDisposalSubStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSubLC.cursor( "S_StorageDisposalSubStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSubLC.cursor( "S_StorageDisposalSubStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSubLC.cursor( "S_StorageDisposalSubStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCStorageDisposalStatement", "wSLC.GOTO_StorageDisposalSubStatement" );
      nOptRC = wSLC.GOTO_StorageDisposalSubStatement( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StartModalSubwindow, "wSLC", "StorageDisposalSubStatement" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "Return" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCStorageDisposalStatement", strActionToProcess );

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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wSLCStorageDisposalStatement" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wSLCStorageDisposalStatement" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCStorageDisposalStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSLCStorageDisposalStatement.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSLCStorageDisposalStatement.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSLCStorageDisposalStatement.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSLCStorageDisposalStatement.jsp" );
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
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "StorageDisposalStatement", "" );
   }

%>

<html>
<head>

<title>Storage and Disposal Statement</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/css.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/sts.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSLCStorageDisposalStatement.js"></script>

</head>

<!-- 
// If we have table sorting on this page, the table sorting does not work in Firefox 
// (seems to work in IE and Opera).  The solution is to not call _AfterPageLoaded in OnLoad event. 
// In the Standardista code (sts.js) there is an addEvent that will call _AfterPageLoaded. 
--> 
<body onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

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


<form name="wSLCStorageDisposalStatement" id="wSLCStorageDisposalStatement" method="post">
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSLC", "StorageDisposalStatement" );
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
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBStorDispStatement:GroupBox */ %>

<div id="GBStorDispStatement" name="GBStorDispStatement" class="listgroup"   style="float:left;position:relative; width:794px; height:36px;">  <!-- GBStorDispStatement --> 

<% /* StorageDisposalStatement::Text */ %>

<label class="groupbox"  id="StorageDisposalStatement:" name="StorageDisposalStatement:" style="width:202px;height:16px;position:absolute;left:6px;top:12px;">Storage Disposal Statement</label>

<% /* Section::Text */ %>

<label class="groupbox"  id="Section:" name="Section:" style="width:66px;height:16px;position:absolute;left:244px;top:12px;">Section:</label>

<% /* SectionName:Text */ %>
<% strTextDisplayValue = "";
   mSubLC_Root = task.getViewByName( "mSubLC_Root" );
   if ( VmlOperation.isValid( mSubLC_Root ) == false )
      task.log( ).debug( "Invalid View: " + "SectionName" );
   else
   {
      nRC = mSubLC_Root.cursor( "S_StorageDisposalSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC_Root.cursor( "S_StorageDisposalSection" ).getAttribute( "Name" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on SectionName: " + e.getMessage());
         task.log().info( "*** Error on ctrl SectionName" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label class="groupbox"  id="SectionName" name="SectionName" style="width:454px;height:16px;position:absolute;left:316px;top:12px;"><%=strTextDisplayValue%></label>


</div>  <!--  GBStorDispStatement --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox5:GroupBox */ %>
<div id="GroupBox5" name="GroupBox5" style="float:left;width:832px;" >

<table cols=2 style="width:832px;"  class="grouptable">

<tr>
<td valign="top" style="width:54px;">
<% /* Text5:Text */ %>

<span  id="Text5" name="Text5" style="width:46px;height:18px;">Title:</span>

</td>
<td valign="top" style="width:738px;">
<% /* MLEdit4:MLEdit */ %>
<%
   // MLEdit: MLEdit4
   strErrorMapValue = VmlOperation.CheckError( "MLEdit4", strError );
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
         task.log( ).debug( "Invalid View: " + "MLEdit4" );
      else
      {
         nRC = mSubLC.cursor( "S_StorageDisposalStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mSubLC.cursor( "S_StorageDisposalStatement" ).getAttribute( "dSD_TitleKey" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "S_StorageDisposalStatement.dSD_TitleKey: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for MLEdit4: " + "mSubLC.S_StorageDisposalStatement" );
      }
   }
%>

<div id="MLEdit4" name="MLEdit4" class="" style="width:738px;height:30px;border:solid;border-width:4px;border-style:groove;text-overflow:hidden;background-color:lightgray;" wrap="wrap"><%=strErrorMapValue%></div>

</td>
</tr>
<tr>
<td valign="top" style="width:54px;">
<% /* Text3:Text */ %>

<span  id="Text3" name="Text3" style="width:38px;height:18px;">Text:</span>

</td>
<td valign="top" style="width:754px;">
<% /* MLEdit3:MLEdit */ %>
<%
   // MLEdit: MLEdit3
   strErrorMapValue = VmlOperation.CheckError( "MLEdit3", strError );
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
         task.log( ).debug( "Invalid View: " + "MLEdit3" );
      else
      {
         nRC = mSubLC.cursor( "S_StorageDisposalStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mSubLC.cursor( "S_StorageDisposalStatement" ).getAttribute( "dSD_TextKey" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "S_StorageDisposalStatement.dSD_TextKey: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for MLEdit3: " + "mSubLC.S_StorageDisposalStatement" );
      }
   }
%>

<div id="MLEdit3" name="MLEdit3" class="" style="width:754px;height:76px;border:solid;border-width:4px;border-style:groove;text-overflow:hidden;background-color:lightgray;" wrap="wrap"><%=strErrorMapValue%></div>

</td>
</tr>
</table>

</div>  <!-- GroupBox5 --> 

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox6:GroupBox */ %>

<div id="GroupBox6" name="GroupBox6" class="listgroup"   style="float:left;position:relative; width:780px; height:30px;">  <!-- GroupBox6 --> 

<% /* Text10:Text */ %>

<label class="groupbox"  id="Text10" name="Text10" style="width:364px;height:16px;position:absolute;left:6px;top:12px;">Container Volume and Size Driving this Statement</label>


</div>  <!--  GroupBox6 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox7:GroupBox */ %>

<div id="GroupBox7" name="GroupBox7" class="withborder" style="width:780px;height:66px;float:left;">  <!-- GroupBox7 --> 


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox8:GroupBox */ %>
<div id="GroupBox8" name="GroupBox8" style="float:left;width:754px;" >

<table cols=2 style="width:754px;"  class="grouptable">

<tr>
<td valign="top" style="width:64px;">
<% /* Size:1:Text */ %>

<span  id="Size:1" name="Size:1" style="width:56px;height:16px;">Size:</span>

</td>
<td valign="top" style="width:592px;">
<% /* CBSize1:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="CBSize1" id="CBSize1" size="1" style="width:592px;"  disabled onchange="CBSize1OnChange( )">

<%
   boolean inListCBSize1 = false;

   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSubLC , "S_StorageDisposalStatement", "ContainerVolume", "" );

      nRC = mSubLC.cursor( "S_StorageDisposalStatement" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSubLC.cursor( "S_StorageDisposalStatement" ).getAttribute( "ContainerVolume" ).getString( "" );
         if ( strComboCurrentValue == null )
            strComboCurrentValue = "";
      }
      else
      {
         strComboCurrentValue = "";
      }

      // Code for NOT required attribute, which makes sure a blank entry exists.
      if ( strComboCurrentValue == "" )
      {
         inListCBSize1 = true;
%>
         <option selected="selected" value=""></option>
<%
      }
      else
      {
%>
         <option value=""></option>
<%
      }
      for ( TableEntry entry : list )
      {
         String internalValue = entry.getInternalValue( );
         String externalValue = entry.getExternalValue( );
         // Perhaps getInternalValue and getExternalValue should return an empty string, 
         // but currently it returns null.  Set to empty string. 
         if ( externalValue == null )
         {
            internalValue = "";
            externalValue = "";
         }

         if ( !StringUtils.isBlank( externalValue ) )
         {
            if ( StringUtils.equals( strComboCurrentValue, externalValue ) )
            {
               inListCBSize1 = true;
%>
               <option selected="selected" value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
            else
            {
%>
               <option value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
         }
      }  // for ( TableEntry entry
      // The value from the database isn't in the domain, add it to the list as disabled.
      if ( !inListCBSize1 )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hCBSize1" id="hCBSize1" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
</tr>
<tr>
<td valign="top" style="width:64px;">
<% /* Type:1:Text */ %>

<span  id="Type:1" name="Type:1" style="width:56px;height:16px;">Type:</span>

</td>
<td valign="top" style="width:592px;">
<% /* CBType1:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="CBType1" id="CBType1" size="1" style="width:592px;"  disabled onchange="CBType1OnChange( )">

<%
   boolean inListCBType1 = false;

   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSubLC , "S_StorageDisposalStatement", "ContainerType", "" );

      nRC = mSubLC.cursor( "S_StorageDisposalStatement" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSubLC.cursor( "S_StorageDisposalStatement" ).getAttribute( "ContainerType" ).getString( "" );
         if ( strComboCurrentValue == null )
            strComboCurrentValue = "";
      }
      else
      {
         strComboCurrentValue = "";
      }

      // Code for NOT required attribute, which makes sure a blank entry exists.
      if ( strComboCurrentValue == "" )
      {
         inListCBType1 = true;
%>
         <option selected="selected" value=""></option>
<%
      }
      else
      {
%>
         <option value=""></option>
<%
      }
      for ( TableEntry entry : list )
      {
         String internalValue = entry.getInternalValue( );
         String externalValue = entry.getExternalValue( );
         // Perhaps getInternalValue and getExternalValue should return an empty string, 
         // but currently it returns null.  Set to empty string. 
         if ( externalValue == null )
         {
            internalValue = "";
            externalValue = "";
         }

         if ( !StringUtils.isBlank( externalValue ) )
         {
            if ( StringUtils.equals( strComboCurrentValue, externalValue ) )
            {
               inListCBType1 = true;
%>
               <option selected="selected" value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
            else
            {
%>
               <option value="<%=externalValue%>"><%=externalValue%></option>
<%
            }
         }
      }  // for ( TableEntry entry
      // The value from the database isn't in the domain, add it to the list as disabled.
      if ( !inListCBType1 )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hCBType1" id="hCBType1" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
</tr>
</table>

</div>  <!-- GroupBox8 --> 

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox7 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox9:GroupBox */ %>

<div id="GroupBox9" name="GroupBox9" style="width:832px;float:left;">  <!-- GroupBox9 --> 


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4"   style="float:left;position:relative; width:756px; height:30px;">  <!-- GroupBox4 --> 

<% /* Text6:Text */ %>

<label class="listheader"  id="Text6" name="Text6" style="width:324px;height:16px;position:absolute;left:10px;top:8px;">Keyword text for Embedding in Statement Text</label>


</div>  <!--  GroupBox4 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Grid5:Grid */ %>
<table class="sortable"  cols=2 style=""  name="Grid5" id="Grid5">

<thead bgcolor=green><tr>

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
      String strGridEditCtl5;
      String strGridEditCtl6;
      
      View vGrid5;
      vGrid5 = mSubLC.newView( );
      csrRC2 = vGrid5.cursor( "S_InsertTextKeywordSD" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid5.cursor( "S_InsertTextKeywordSD" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditCtl5 = "";
         nRC = vGrid5.cursor( "S_InsertTextKeywordSD" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl5 = vGrid5.cursor( "S_InsertTextKeywordSD" ).getAttribute( "Name" ).getString( "" );

            if ( strGridEditCtl5 == null )
               strGridEditCtl5 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl5 ) )
            strGridEditCtl5 = "&nbsp";

         strGridEditCtl6 = "";
         nRC = vGrid5.cursor( "S_InsertTextKeywordSD" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl6 = vGrid5.cursor( "S_InsertTextKeywordSD" ).getAttribute( "dSD_KeywordText" ).getString( "" );

            if ( strGridEditCtl6 == null )
               strGridEditCtl6 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl6 ) )
            strGridEditCtl6 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGridEditCtl5%></td>
   <td><%=strGridEditCtl6%></td>

</tr>

<%
         csrRC2 = vGrid5.cursor( "S_InsertTextKeywordSD" ).setNextContinue( );
      }
      vGrid5.drop( );
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


</div>  <!--  GroupBox9 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox10:GroupBox */ %>

<div id="GroupBox10" name="GroupBox10"   style="float:left;position:relative; width:830px; height:30px;">  <!-- GroupBox10 --> 

<% /* SD_SubStatements:Text */ %>

<label class="listheader"  id="SD_SubStatements" name="SD_SubStatements" style="width:434px;height:16px;position:absolute;left:6px;top:4px;">Storage and Disposal Sub-Statements</label>

<% /* ExclusiveStatements:CheckBox */ %>
<%
   strErrorMapValue = "";
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) == false )
      task.log( ).debug( "Invalid View: " + "ExclusiveStatements" );
   else
   {
      nRC = mMasLC.cursor( "M_StorageDisposalStatement" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
         strRadioGroupValue = mMasLC.cursor( "M_StorageDisposalStatement" ).getAttribute( "ExclusiveStatements" ).getString( );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="ExclusiveStatements" id="ExclusiveStatements"  disabled  value="Y" <%=strErrorMapValue%> style="position:absolute;left:474px;top:4px;">
<span style="width:172px;height:26px;position:absolute;left:504px;top:4px;">Exclusive Statements</span>


</div>  <!--  GroupBox10 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridStorDisp:Grid */ %>
<table  cols=2 style="width:792px;"  name="GridStorDisp" id="GridStorDisp">

<thead><tr>

   <th>Statement Title/Text</th>
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
      String strGridEditStorDispText;
      String strBMBDisplaySD_Statement;
      
      View vGridStorDisp;
      vGridStorDisp = mSubLC.newView( );
      csrRC2 = vGridStorDisp.cursor( "S_StorageDisposalSubStatement" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridStorDisp.cursor( "S_StorageDisposalSubStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditStorDispText = "";
         nRC = vGridStorDisp.cursor( "S_StorageDisposalSubStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditStorDispText = vGridStorDisp.cursor( "S_StorageDisposalSubStatement" ).getAttribute( "dSD_SubTitleText" ).getString( "" );

            if ( strGridEditStorDispText == null )
               strGridEditStorDispText = "";
         }

         if ( StringUtils.isBlank( strGridEditStorDispText ) )
            strGridEditStorDispText = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="GOTO_StorageDisposaSublStatement( this.id )" id="GridEditStorDispText::<%=strEntityKey%>"><%=strGridEditStorDispText%></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBDisplaySD_Statement" onclick="GOTO_StorageDisposaSublStatement( this.id )" id="BMBDisplaySD_Statement::<%=strEntityKey%>"><img src="./images/ePammsDisplay.png" alt="Display"></a></td>

</tr>

<%
         csrRC2 = vGridStorDisp.cursor( "S_StorageDisposalSubStatement" ).setNextContinue( );
      }
      vGridStorDisp.drop( );
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
<script type="text/javascript">animatedcollapse.init();</script>
</html>
<%
   session.setAttribute( "ZeidonWindow", "wSLCStorageDisposalStatement" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
