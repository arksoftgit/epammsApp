<!DOCTYPE HTML>

<%-- wMLCSurfacesStatementMaintenance   Generate Timestamp: 20170622133106220 --%>

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
      // MLEdit: Title
      nRC = mMasLC.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Title" );
         task.log().debug( "Title prior to TrimTinyHtml: " + strMapValue );
         strMapValue = VmlOperation.TrimTinyHtml( strMapValue );
         task.log().debug( "Title after TrimTinyHtml: '" + strMapValue + "'" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Title", "", strMapValue );
            else
               mMasLC.cursor( "M_Usage" ).getAttribute( "Name" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Title", e.getReason( ), strMapValue );
         }
      }

      // Grid: Grid2
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

         strTag = "GS_SelectSurface" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_SelectSurface", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "M_SubUsage" ).getAttribute( "wSelected" ).setValue( strMapValue, "" );
               else
                  vGridTmp.cursor( "M_SubUsage" ).getAttribute( "wSelected" ).setValue( "", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "M_SubUsage" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: Grid3
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

         strTag = "GS_SelectKeyword" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_SelectKeyword", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "M_InsertTextKeywordUsage" ).getAttribute( "wSelected" ).setValue( strMapValue, "" );
               else
                  vGridTmp.cursor( "M_InsertTextKeywordUsage" ).getAttribute( "wSelected" ).setValue( "", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

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

if ( strLastWindow.equals("wMLCSurfacesStatementMaintenance") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wMLCSurfacesStatementMaintenance strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLCSurfacesStatementMaintenance LastWindow *** " + strLastWindow );
task.log().info("*** wMLCSurfacesStatementMaintenance LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptAndReturn" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "MoveSelectedSurfaces" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCSurfacesStatementMaintenance", "wMLC.MoveSelectedSurfacesToKeyword" );
      nOptRC = wMLC.MoveSelectedSurfacesToKeyword( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "MoveSelectedKeywords" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCSurfacesStatementMaintenance", "wMLC.MoveSelectedKeywordToSurfaces" );
      nOptRC = wMLC.MoveSelectedKeywordToSurfaces( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ADD_UsageKeyword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelAndReturn" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_Keyword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

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
         VmlOperation.CreateMessage( task, "DELETE_Keyword", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_SubUsage" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

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
         VmlOperation.CreateMessage( task, "DELETE_SubUsage", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DeleteSurface" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

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
         VmlOperation.CreateMessage( task, "DeleteSurface", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_AddSurfaceSubstatements" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCSurfacesStatementMaintenance", "wMLC.GOTO_AddSubUsageStatements" );
      nOptRC = wMLC.GOTO_AddSubUsageStatements( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "AddSubitems" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_KeywordUpdate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

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
         VmlOperation.CreateMessage( task, "GOTO_KeywordUpdate", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "AddUpdateKeywordUsage" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_SubUsageUpdate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

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

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCSurfacesStatementMaintenance", "wMLC.PositionOnSubUsage" );
      nOptRC = wMLC.PositionOnSubUsage( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "SubsurfacesStatement" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "UpdateSubsurfaceText" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCSurfacesStatementMaintenance", "wMLC.PositionOnSubUsage" );
      nOptRC = wMLC.PositionOnSubUsage( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "SurfaceText" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAcceptAndReturn" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelAndReturn" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wMLCSurfacesStatementMaintenance" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wMLCSurfacesStatementMaintenance" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCSurfacesStatementMaintenance", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLCSurfacesStatementMaintenance.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLCSurfacesStatementMaintenance.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLCSurfacesStatementMaintenance.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLCSurfacesStatementMaintenance.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCSurfacesStatementMaintenance", "wMLC.PrebuildKeywordSelection" );
   nOptRC = wMLC.PrebuildKeywordSelection( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getAttribute( "WebReturnMessage" ).getString( "" );
      strURLParameters = "?CallingPage=wMLCSurfacesStatementMaintenance.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wMLC" +
                         "&OperationName=" + "PrebuildKeywordSelection";
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
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "SurfacesStatementMaintenance", "" );
   }

%>

<html>
<head>

<title>Surface Statement Content</title>

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

<script language="JavaScript" type="text/javascript" src="./genjs/wMLCSurfacesStatementMaintenance.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AcceptReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smAcceptReturn" name="smAcceptReturn"><a href="#"  onclick="smAcceptAndReturn()">Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smCancelReturn" name="smCancelReturn"><a href="#"  onclick="smCancelAndReturn()">Cancel</a></li>
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


<form name="wMLCSurfacesStatementMaintenance" id="wMLCSurfacesStatementMaintenance" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View mEPA = null;
   View mMasLC_Root = null;
   View mMasLC = null;
   View mMasLCIncludeExclude = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "SurfacesStatementMaintenance" );
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
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2"   style="float:left;position:relative; width:808px; height:50px;">  <!-- GroupBox2 --> 

<% /* Statement::Text */ %>

<label  id="Statement:" name="Statement:" style="width:76px;height:20px;position:absolute;left:0px;top:0px;">Statement:</label>

<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4" style="width:722px;height:42px;position:absolute;left:80px;top:0px;">  <!-- GroupBox4 --> 

<div  id="GroupBox4" name="GroupBox4" >GroupBox4</div>
<% /* Title:MLEdit */ %>
<%
   // : Title
   strErrorMapValue = VmlOperation.CheckError( "Title", strError );
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
         task.log( ).info( "Invalid View: " + "Title" );
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
            task.log( ).info( "Entity does not exist for Title: " + "mMasLC.M_Usage" );
      }
   }
%>

<div style="background-color:#eee;border:1px solid #042;width:722px;height:42px;position:absolute;left:0px;top:0px;overflow:auto;">
<div class="mceSimpleZeidonSpecialCharacters" name="Title" id="Title" style="width:722px;height:42px;position:absolute;left:0px;top:0px;"><%=strErrorMapValue%></div></div>


</div>  <!--  GroupBox4 --> 

</div>  <!--  GroupBox2 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:808px;float:left;">  <!-- GroupBox3 --> 


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBSurfaceSections:GroupBox */ %>

<div id="GBSurfaceSections" name="GBSurfaceSections" class="listgroup"   style="float:left;position:relative; width:786px; height:40px;">  <!-- GBSurfaceSections --> 

<% /* Subsurfaces:Text */ %>

<label class="listheader"  id="Subsurfaces" name="Subsurfaces" style="width:398px;height:16px;position:absolute;left:10px;top:8px;">Subsurfaces</label>


</div>  <!--  GBSurfaceSections --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Grid2:Grid */ %>
<table class="sortable"  cols=2 style=""  name="Grid2" id="Grid2">

<thead bgcolor=green><tr>

   <th class="gridheading"><input type="checkbox" onclick="CheckAllInGrid(this,'GS_SelectSurface')"></th>
   <th>Text</th>

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
      String strGS_SelectSurface;
      String strGS_SelectSurfaceValue;
      String strSurfaceText;
      
      View vGrid2;
      vGrid2 = mMasLC.newView( );
      csrRC2 = vGrid2.cursor( "M_SubUsage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid2.cursor( "M_SubUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGS_SelectSurface = "";
         nRC = vGrid2.cursor( "M_SubUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_SelectSurface = vGrid2.cursor( "M_SubUsage" ).getAttribute( "wSelected" ).getString( "" );

            if ( strGS_SelectSurface == null )
               strGS_SelectSurface = "";
         }

         if ( StringUtils.equals( strGS_SelectSurface, "Y" ) )
         {
            strGS_SelectSurfaceValue = "GS_SelectSurface" + strEntityKey;
            strGS_SelectSurface = "<input name='" + strGS_SelectSurfaceValue + "' id='" + strGS_SelectSurfaceValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_SelectSurfaceValue = "GS_SelectSurface" + strEntityKey;
            strGS_SelectSurface = "<input name='" + strGS_SelectSurfaceValue + "' id='" + strGS_SelectSurfaceValue + "' value='Y' type='checkbox' > ";
         }

         strSurfaceText = "";
         nRC = vGrid2.cursor( "M_SubUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strSurfaceText = vGrid2.cursor( "M_SubUsage" ).getAttribute( "Name" ).getString( "" );

            if ( strSurfaceText == null )
               strSurfaceText = "";
         }

         if ( StringUtils.isBlank( strSurfaceText ) )
            strSurfaceText = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_SelectSurface%></td>
   <td><a href="#" onclick="GOTO_SubUsageUpdate( this.id )" id="SurfaceText::<%=strEntityKey%>"><%=strSurfaceText%></a></td>

</tr>

<%
         csrRC2 = vGrid2.cursor( "M_SubUsage" ).setNextContinue( );
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


</div>  <!--  GroupBox3 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>
<div id="GroupBox1" name="GroupBox1" style="float:left;width:808px;" >

<table cols=0 style="width:808px;"  class="grouptable">

<tr>
<td valign="top" style="width:380px;">
<% /* PB_MoveSelectedSurfaces:PushBtn */ %>
<button type="button"  id="PB_MoveSelectedSurfaces" name="PB_MoveSelectedSurfaces" value="Move Selected Surfaces To Selected Keyword" onclick="MoveSelectedSurfaces( )"  style="width:320px;height:24px;">Move Selected Surfaces To Selected Keyword</button>

</td>
<td valign="top" style="width:320px;">
<% /* PB_MoveSelectedKeywords:PushBtn */ %>
<button type="button"  id="PB_MoveSelectedKeywords" name="PB_MoveSelectedKeywords" value="Move Selected Keyword To Surfaces" onclick="MoveSelectedKeywords( )"  style="width:320px;height:24px;">Move Selected Keyword To Surfaces</button>

</td>
</tr>
</table>

</div>  <!-- GroupBox1 --> 

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox11:GroupBox */ %>

<div id="GroupBox11" name="GroupBox11" style="width:808px;float:left;">  <!-- GroupBox11 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox7:GroupBox */ %>

<div id="GroupBox7" name="GroupBox7"   style="float:left;position:relative; width:746px; height:30px;">  <!-- GroupBox7 --> 

<% /* Keyword:Text */ %>

<label class="listheader"  id="Keyword" name="Keyword" style="width:398px;height:16px;position:absolute;left:10px;top:8px;">Keyword text for Embedding in Statement Text</label>


</div>  <!--  GroupBox7 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Grid3:Grid */ %>
<table class="sortable"  cols=3 style=""  name="Grid3" id="Grid3">

<thead bgcolor=green><tr>

   <th class="gridheading"><input type="checkbox" onclick="CheckAllInGrid(this,'GS_SelectKeyword')"></th>
   <th>Keyword</th>
   <th>Keyword Text</th>

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
      String strGS_SelectKeyword;
      String strGS_SelectKeywordValue;
      String strKeywordName;
      String strKeywordText;
      
      View vGrid3;
      vGrid3 = mMasLC.newView( );
      csrRC2 = vGrid3.cursor( "M_InsertTextKeywordUsage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid3.cursor( "M_InsertTextKeywordUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGS_SelectKeyword = "";
         nRC = vGrid3.cursor( "M_InsertTextKeywordUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_SelectKeyword = vGrid3.cursor( "M_InsertTextKeywordUsage" ).getAttribute( "wSelected" ).getString( "" );

            if ( strGS_SelectKeyword == null )
               strGS_SelectKeyword = "";
         }

         if ( StringUtils.equals( strGS_SelectKeyword, "Y" ) )
         {
            strGS_SelectKeywordValue = "GS_SelectKeyword" + strEntityKey;
            strGS_SelectKeyword = "<input name='" + strGS_SelectKeywordValue + "' id='" + strGS_SelectKeywordValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_SelectKeywordValue = "GS_SelectKeyword" + strEntityKey;
            strGS_SelectKeyword = "<input name='" + strGS_SelectKeywordValue + "' id='" + strGS_SelectKeywordValue + "' value='Y' type='checkbox' > ";
         }

         strKeywordName = "";
         nRC = vGrid3.cursor( "M_InsertTextKeywordUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strKeywordName = vGrid3.cursor( "M_InsertTextKeywordUsage" ).getAttribute( "Name" ).getString( "" );

            if ( strKeywordName == null )
               strKeywordName = "";
         }

         if ( StringUtils.isBlank( strKeywordName ) )
            strKeywordName = "&nbsp";

         strKeywordText = "";
         nRC = vGrid3.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strKeywordText = vGrid3.cursor( "M_Usage" ).getAttribute( "dUsageKeywordText" ).getString( "" );

            if ( strKeywordText == null )
               strKeywordText = "";
         }

         if ( StringUtils.isBlank( strKeywordText ) )
            strKeywordText = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_SelectKeyword%></td>
   <td><a href="#" onclick="GOTO_KeywordUpdate( this.id )" id="KeywordName::<%=strEntityKey%>"><%=strKeywordName%></a></td>
   <td><a href="#" onclick="GOTO_KeywordUpdate( this.id )" id="KeywordText::<%=strEntityKey%>"><%=strKeywordText%></a></td>

</tr>

<%
         csrRC2 = vGrid3.cursor( "M_InsertTextKeywordUsage" ).setNextContinue( );
      }
      vGrid3.drop( );
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
   session.setAttribute( "ZeidonWindow", "wMLCSurfacesStatementMaintenance" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
