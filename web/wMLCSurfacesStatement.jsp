<!DOCTYPE HTML>

<%-- wMLCSurfacesStatement   Generate Timestamp: 20160407171238234 --%>

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
      // MLEdit: PrecautionarySubtitle
      nRC = mMasLC.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PrecautionarySubtitle" );
         task.log().debug( "PrecautionarySubtitle prior to TrimTinyHtml: " + strMapValue );
         strMapValue = VmlOperation.TrimTinyHtml( strMapValue );
         task.log().debug( "PrecautionarySubtitle after TrimTinyHtml: " + strMapValue );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "PrecautionarySubtitle", "", strMapValue );
            else
               mMasLC.cursor( "M_Usage" ).getAttribute( "Name" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "PrecautionarySubtitle", e.getReason( ), strMapValue );
         }
      }

      // Grid: GridClaims
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_SubUsage" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_SubUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_SubUsage" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: Grid5
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_InsertTextKeywordUsage" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_InsertTextKeywordUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_InsertTextKeywordUsage" ).setNextContinue( );
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

if ( strLastWindow.equals("wMLCSurfacesStatement") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wMLCSurfacesStatement strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLCSurfacesStatement LastWindow *** " + strLastWindow );
task.log().info("*** wMLCSurfacesStatement LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptAndReturnUsageStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCSurfacesStatement", "wMLC.AcceptAndReturnUsageStatement" );
      nOptRC = wMLC.AcceptAndReturnUsageStatement( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ADD_UsageKeyword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Auto Object Function
      nRC = 0;
      try
      {
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_InsertTextKeywordUsage" );
      cursor.createTemporalEntity( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "ADD_UsageKeyword", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "AddUpdateKeywordUsage" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_AddSubSurface" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Auto Object Function
      nRC = 0;
      try
      {
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_SubUsage" );
      cursor.createTemporalEntity( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "GOTO_AddSubSurface", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "SurfaceText" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelLocationsStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatement", strActionToProcess );

      // Action Auto Object Function
      nRC = 0;
      try
      {
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_Usage" );
      if ( cursor.isNull() )
         nRC = 0;
      else
      {
         if ( cursor.isVersioned( ) )
         {
            cursor.cancelSubobject( );
         }
         nRC = 0;
      }

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "CancelLocationsStatement", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_UsageKeyword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mMasLC;
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mMasLC.cursor( "M_InsertTextKeywordUsage" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_InsertTextKeywordUsage" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_InsertTextKeywordUsage" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_InsertTextKeywordUsage" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
      EntityCursor cursor = mMasLC.cursor( "M_InsertTextKeywordUsage" );
      if ( cursor.isNull() )
         nRC = 0;
      else
      {
         cursor.deleteEntity( CursorPosition.NEXT );
         nRC = 0;
      }

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "DELETE_UsageKeyword", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DisplayGeneratedTextUsage" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCSurfacesStatement", "wMLC.GOTO_DisplayGeneratedTextUsage" );
      nOptRC = wMLC.GOTO_DisplayGeneratedTextUsage( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "GeneratedTextDisplay" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_UpdateSurfacesSubStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mMasLC;
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mMasLC.cursor( "M_SubUsage" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_SubUsage" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_SubUsage" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_SubUsage" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
      EntityCursor cursor = mMasLC.cursor( "M_SubUsage" );
      cursor.createTemporalSubobjectVersion( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "GOTO_UpdateSurfacesSubStatement", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "SurfaceText" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_UsageUpdate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mMasLC;
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mMasLC.cursor( "M_InsertTextKeywordUsage" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_InsertTextKeywordUsage" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_InsertTextKeywordUsage" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_InsertTextKeywordUsage" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
      EntityCursor cursor = mMasLC.cursor( "M_InsertTextKeywordUsage" );
      cursor.createTemporalSubobjectVersion( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "GOTO_UsageUpdate", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "AddUpdateKeywordUsage" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SaveAddNewUsage" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCSurfacesStatement", "wMLC.SaveAddNewUsage" );
      nOptRC = wMLC.SaveAddNewUsage( new zVIEW( vKZXMLPGO ) );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wMLCSurfacesStatement" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wMLCSurfacesStatement" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLCSurfacesStatement.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLCSurfacesStatement.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLCSurfacesStatement.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLCSurfacesStatement.jsp" );
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
   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wMLC", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wMLC", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "SurfacesStatement", "" );
   }

%>

<html>
<head>

<title>Surfaces Statement</title>

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

<!-- TinyMCE -->
<script language="JavaScript" type="text/javascript" src="./js/tinymce/js/tinymce/tinymce.min.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/TinyMCE.js"></script>
<!-- /TinyMCE -->

<script language="JavaScript" type="text/javascript" src="./genjs/wMLCSurfacesStatement.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AcceptAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="AcceptAndReturn" name="AcceptAndReturn"><a href="#"  onclick="AcceptAndReturnUsageStatement()">Accept & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="CancelAndReturn" name="CancelAndReturn"><a href="#"  onclick="CancelLocationsStatement()">Cancel & Return</a></li>
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


<form name="wMLCSurfacesStatement" id="wMLCSurfacesStatement" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View mEPA = null;
   View mMasLC = null;
   View mMasProd = null;
   View mMasProdLST = null;
   View mOrganiz = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "SurfacesStatement" );
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
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4" style="width:826px;height:28px;float:left;">  <!-- GroupBox4 --> 


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp</span>
<% /* PrecautionarySection:Text */ %>

<span class="groupbox"  id="PrecautionarySection" name="PrecautionarySection" style="width:338px;height:16px;">Surfaces Statement</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox4 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBPrecautionarySection:GroupBox */ %>

<div id="GBPrecautionarySection" name="GBPrecautionarySection" class="withborder" style="width:826px;height:126px;float:left;">  <!-- GBPrecautionarySection --> 


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2"   style="float:left;position:relative; width:800px; height:126px;">  <!-- GroupBox2 --> 

<% /* Description:Text */ %>

<label  id="Description" name="Description" style="width:128px;height:16px;position:absolute;left:6px;top:8px;">Surface Text:</label>

<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:600px;height:116px;position:absolute;left:138px;top:8px;">  <!-- GroupBox3 --> 

<% /* PrecautionarySubtitle:MLEdit */ %>
<%
   // : PrecautionarySubtitle
   strErrorMapValue = VmlOperation.CheckError( "PrecautionarySubtitle", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).info( "Invalid View: " + "PrecautionarySubtitle" );
      else
      {
         nRC = mMasLC.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasLC.cursor( "M_Usage" ).getAttribute( "Name" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "M_Usage.Name: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist for PrecautionarySubtitle: " + "mMasLC.M_Usage" );
      }
   }
%>

<div style="background-color:#eee;border:1px solid #042;width:600px;height:116px;position:absolute;left:0px;top:0px;overflow:auto;">
<div class="mceSimpleZeidon" name="PrecautionarySubtitle" id="PrecautionarySubtitle" style="width:600px;height:116px;position:absolute;left:0px;top:0px;"><%=strErrorMapValue%></div></div>


</div>  <!--  GroupBox3 --> 

</div>  <!--  GroupBox2 --> 
</div>  <!-- End of a new line -->


</div>  <!--  GBPrecautionarySection --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1"   style="float:left;position:relative; width:832px; height:198px;">  <!-- GroupBox1 --> 

<% /* GroupBox6:GroupBox */ %>

<div id="GroupBox6" name="GroupBox6" style="width:756px;height:30px;position:absolute;left:0px;top:8px;">  <!-- GroupBox6 --> 

<% /* NewSubSurface:PushBtn */ %>
<button type="button" class="newbutton" name="NewSubSurface" id="NewSubSurface" value="" onclick="GOTO_AddSubSurface( )" style="width:66px;height:26px;position:absolute;left:618px;top:4px;">New</button>

<% /* OptionalSurfaces:Text */ %>

<label class="listheader"  id="OptionalSurfaces" name="OptionalSurfaces" style="width:398px;height:16px;position:absolute;left:10px;top:8px;">Optional Surfaces</label>


</div>  <!--  GroupBox6 --> 
<% /* GridClaims:Grid */ %>
<div class="tableScroll"  style="position:absolute;top:46px;left:6px;width:616px;height:148px;">

<table name="GridClaims" id="GridClaims" cellspacing=0 class="sortable"  cols=2  >

<thead bgcolor=green><tr>

   <th>Surfaces</th>
   <th>Update</th>

</tr></thead>

<tbody height="98px;">

<%
try
{
   iTableRowCnt = 0;
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strSurfaces;
      String strBMBUpdateClaimsStatement;
      
      View vGridClaims;
      vGridClaims = mMasLC.newView( );
      csrRC2 = vGridClaims.cursor( "M_SubUsage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridClaims.cursor( "M_SubUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strSurfaces = "";
         nRC = vGridClaims.cursor( "M_SubUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strSurfaces = vGridClaims.cursor( "M_SubUsage" ).getAttribute( "Name" ).getString( "" );

            if ( strSurfaces == null )
               strSurfaces = "";
         }

         if ( StringUtils.isBlank( strSurfaces ) )
            strSurfaces = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="GOTO_UpdateSurfacesSubStatement( this.id )" id="Surfaces::<%=strEntityKey%>"><%=strSurfaces%></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdateClaimsStatement" onclick="GOTO_UpdateSurfacesSubStatement( this.id )" id="BMBUpdateClaimsStatement::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png" alt="Update"></a></td>

</tr>

<%
         csrRC2 = vGridClaims.cursor( "M_SubUsage" ).setNextContinue( );
      }
      vGridClaims.drop( );
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

</div>


</div>  <!--  GroupBox1 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:18px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox9:GroupBox */ %>

<div id="GroupBox9" name="GroupBox9" style="width:832px;float:left;">  <!-- GroupBox9 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox5:GroupBox */ %>

<div id="GroupBox5" name="GroupBox5"   style="float:left;position:relative; width:756px; height:30px;">  <!-- GroupBox5 --> 

<% /* PushBtn5:PushBtn */ %>
<button type="button" class="newbutton" name="PushBtn5" id="PushBtn5" value="" onclick="GOTO_DisplayGeneratedTextUsage( )" style="width:158px;height:26px;position:absolute;left:438px;top:4px;">Show Generated Text</button>

<% /* NewKeyword:PushBtn */ %>
<button type="button" class="newbutton" name="NewKeyword" id="NewKeyword" value="" onclick="ADD_UsageKeyword( )" style="width:66px;height:26px;position:absolute;left:618px;top:4px;">New</button>

<% /* Text6:Text */ %>

<label class="listheader"  id="Text6" name="Text6" style="width:398px;height:16px;position:absolute;left:10px;top:8px;">Keyword text for Embedding in Statement Text</label>


</div>  <!--  GroupBox5 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Grid5:Grid */ %>
<table class="sortable"  cols=4 style=""  name="Grid5" id="Grid5">

<thead bgcolor=green><tr>

   <th>Keyword</th>
   <th>Keyword Text</th>
   <th>Update</th>
   <th>Delete</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strGridEditCtl5;
      String strGridEditCtl6;
      String strBMBDeleteDirectionsUseStatement3;
      String strBitmapBtn3;
      
      View vGrid5;
      vGrid5 = mMasLC.newView( );
      csrRC2 = vGrid5.cursor( "M_InsertTextKeywordUsage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid5.cursor( "M_InsertTextKeywordUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditCtl5 = "";
         nRC = vGrid5.cursor( "M_InsertTextKeywordUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl5 = vGrid5.cursor( "M_InsertTextKeywordUsage" ).getAttribute( "Name" ).getString( "" );

            if ( strGridEditCtl5 == null )
               strGridEditCtl5 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl5 ) )
            strGridEditCtl5 = "&nbsp";

         strGridEditCtl6 = "";
         nRC = vGrid5.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl6 = vGrid5.cursor( "M_Usage" ).getAttribute( "dUsageKeywordText" ).getString( "" );

            if ( strGridEditCtl6 == null )
               strGridEditCtl6 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl6 ) )
            strGridEditCtl6 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="GOTO_UsageUpdate( this.id )" id="GridEditCtl5::<%=strEntityKey%>"><%=strGridEditCtl5%></a></td>
   <td><%=strGridEditCtl6%></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBDeleteDirectionsUseStatement3" onclick="GOTO_UsageUpdate( this.id )" id="BMBDeleteDirectionsUseStatement3::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png" alt="Update"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BitmapBtn3" onclick="DELETE_UsageKeyword( this.id )" id="BitmapBtn3::<%=strEntityKey%>"><img src="./images/ePammsDelete.png" alt="Delete"></a></td>

</tr>

<%
         csrRC2 = vGrid5.cursor( "M_InsertTextKeywordUsage" ).setNextContinue( );
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
   session.setAttribute( "ZeidonWindow", "wMLCSurfacesStatement" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
