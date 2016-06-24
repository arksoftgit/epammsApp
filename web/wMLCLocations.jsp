<!DOCTYPE HTML>

<%-- wMLCLocations   Generate Timestamp: 20160623085855735 --%>

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
      // Grid: GridLocations
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_Usage" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_Usage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GS_SelectLocation" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_SelectLocation", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "M_Usage" ).getAttribute( "wSelected" ).setValue( strMapValue, "" );
               else
                  vGridTmp.cursor( "M_Usage" ).getAttribute( "wSelected" ).setValue( "", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "M_Usage" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: GridNonGroupLocations
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_UsageNonGroupUsage" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_UsageNonGroupUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_UsageNonGroupUsage" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // EditBox: Title
      nRC = mMasLC.cursor( "M_UsageType" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Title" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Title", "", strMapValue );
            else
               mMasLC.cursor( "M_UsageType" ).getAttribute( "Title" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Title", e.getReason( ), strMapValue );
         }
      }

      // EditBox: ReviewerNote
      nRC = mMasLC.cursor( "M_UsageType" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "ReviewerNote" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ReviewerNote", "", strMapValue );
            else
               mMasLC.cursor( "M_UsageType" ).getAttribute( "ReviewerNote" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ReviewerNote", e.getReason( ), strMapValue );
         }
      }

      // Grid: GridLocationGroup
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_UsageGroup" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_UsageGroup" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         strTag = "GS_SelectLocationGroup" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         // If the checkbox is not checked, then set to the unchecked value.
         if (strMapValue == null || strMapValue.isEmpty() )
            strMapValue = "N";

         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "GS_SelectLocationGroup", "", strMapValue );
            else
               if ( strMapValue != null )
                  vGridTmp.cursor( "M_UsageGroup" ).getAttribute( "wSelected" ).setValue( strMapValue, "" );
               else
                  vGridTmp.cursor( "M_UsageGroup" ).getAttribute( "wSelected" ).setValue( "", "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }

         csrRC = vGridTmp.cursor( "M_UsageGroup" ).setNextContinue( );
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

if ( strLastWindow.equals("wMLCLocations") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wMLCLocations strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLCLocations LastWindow *** " + strLastWindow );
task.log().info("*** wMLCLocations LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ADD_LocationStatements" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.GOTO_LocationStatementAdd" );
      nOptRC = wMLC.GOTO_LocationStatementAdd( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "AddItemsMultiple" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DeleteSelectedEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "DeleteUsageStatements" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_SelectedUsageEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.DELETE_SelectedUsageEntries" );
      nOptRC = wMLC.DELETE_SelectedUsageEntries( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_UsageGroupEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.DELETE_UsageGroupEntries" );
      nOptRC = wMLC.DELETE_UsageGroupEntries( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_UsageGroupEntriesOnly" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.DELETE_UsageGroupEntriesOnly" );
      nOptRC = wMLC.DELETE_UsageGroupEntriesOnly( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_AddUsageGroup" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.GOTO_AddUsageGroup" );
      nOptRC = wMLC.GOTO_AddUsageGroup( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "LocationsGroup" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_UpdateLocationsStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_Usage" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_Usage" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_Usage" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_Usage" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
         EntityCursor cursor = mMasLC.cursor( "M_Usage" );
         cursor.createTemporalSubobjectVersion( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "GOTO_UpdateLocationsStatement", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "LocationsStatement" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_UpdateUsageGroup" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_UsageGroup" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_UsageGroup" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_UsageGroup" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_UsageGroup" ).setNextContinue( );
            } // Grid
         }
      }

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "LocationsGroup" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.SaveMLC" );
      nOptRC = wMLC.SaveMLC( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveAndReturnMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.SaveAndReturnMLC" );
      nOptRC = wMLC.SaveAndReturnMLC( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelAndReturnMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.CancelAndReturnMLC" );
      nOptRC = wMLC.CancelAndReturnMLC( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditMasterLabelVersionData" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "VersionData" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditIngredientsSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "Ingredients" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditHumanHazardSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "HumanHazard" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditFirstAidSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.EditFirstAidSection" );
      nOptRC = wMLC.EditFirstAidSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "FirstAidSection" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditStorDispSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "StorageDisposal" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditDirectionsUseSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "DirectionsForUse" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditPrecautionarySection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.EditPrecautionarySection" );
      nOptRC = wMLC.EditPrecautionarySection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "PrecautionarySection" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEnvironmentalHazards" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.EditEnvironmentalHazardsSection" );
      nOptRC = wMLC.EditEnvironmentalHazardsSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "EnvironmentalHazards" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGOTO_DilutionEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "Dilution" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditSurfacesSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.EditSurfacesSection" );
      nOptRC = wMLC.EditSurfacesSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "Surfaces" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditLocationsSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.EditLocationsSection" );
      nOptRC = wMLC.EditLocationsSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "Locations" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditApplicationTypesSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.EditApplicationTypesSection" );
      nOptRC = wMLC.EditApplicationTypesSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "ApplicationTypes" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditClaimsSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCLocations", "wMLC.EditClaimsSection" );
      nOptRC = wMLC.EditClaimsSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "OrganismClaims" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGOTO_ClaimsFootnote" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "ClaimsFootnoteSection" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "Marketing" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wMLCLocations" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wMLCLocations" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCLocations", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLCLocations.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLCLocations.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLCLocations.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLCLocations.jsp" );
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
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "Locations", "" );
   }

%>

<html>
<head>

<title>Locations</title>

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
<script language="JavaScript" type="text/javascript" src="./js/tabpane.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wMLCLocations.js"></script>

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
   <ul id="MLC_SideBar" name="MLC_SideBar">
<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New6" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew6" name="smNew6"><a href="#"  onclick="smSaveMLC()">Save</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New4" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew4" name="smNew4"><a href="#"  onclick="smSaveAndReturnMLC()">Save & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New5" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew5" name="smNew5"><a href="#"  onclick="smCancelAndReturnMLC()">Cancel & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "VersionData" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smVersionData" name="smVersionData"><a href="#"  onclick="smEditMasterLabelVersionData()">Version Data</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Ingredients" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smIngredients" name="smIngredients"><a href="#"  onclick="smEditIngredientsSect()">Ingredients</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "HumanHazard" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smHumanHazard" name="smHumanHazard"><a href="#"  onclick="smEditHumanHazardSect()">Human Hazard</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "FirstAid" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smFirstAid" name="smFirstAid"><a href="#"  onclick="smEditFirstAidSect()">First Aid</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "StorDisp" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smStorDisp" name="smStorDisp"><a href="#"  onclick="smEditStorDispSect()">Storage & Disposal</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "DirectionsForUse" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smDirectionsForUse" name="smDirectionsForUse"><a href="#"  onclick="smEditDirectionsUseSect()">Directions For Use</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Precautionary" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smPrecautionary" name="smPrecautionary"><a href="#"  onclick="smEditPrecautionarySection()">Precautionary</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "EnvironmentalHazards" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smEnvironmentalHazards" name="smEnvironmentalHazards"><a href="#"  onclick="smEnvironmentalHazards()">Environmental Hazards</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New2" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew2" name="smNew2"><a href="#"  onclick="smGOTO_DilutionEntries()">Dilution Entries</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "TypesOfSurfaces" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smTypesOfSurfaces" name="smTypesOfSurfaces"><a href="#"  onclick="smEditSurfacesSection()">Surfaces</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Locations" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smLocations" name="smLocations"><a href="#"  class="sideselected"  onclick="smEditLocationsSection()">Locations</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AppTypes" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smAppTypes" name="smAppTypes"><a href="#"  onclick="smEditApplicationTypesSection()">Application Types</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "OrganismClaims" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smOrganismClaims" name="smOrganismClaims"><a href="#"  onclick="smEditClaimsSection()">Organism Claims</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New1" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew1" name="smNew1"><a href="#"  onclick="smGOTO_ClaimsFootnote()">Claims Footnotes</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Marketing" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smMarketing" name="smMarketing"><a href="#"  onclick="smEditMarketingSect()">Marketing</a></li>
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


<form name="wMLCLocations" id="wMLCLocations" method="post">
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "Locations" );
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
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Tab1:Tab */ %>

<div id="Tab1" class="tab-pane" style="width:660px;"> <!-- Beginning of Tab Control Tab1 -->
<script type="text/javascript">Tab1 = new WebFXTabPane( document.getElementById( "Tab1" ) );</script>

<div id="IndividualLocations" class="tab-page " > <!-- Tab item IndividualLocations -->
<h2 class="tab"><span>Individual Locations</span></h2>
<script type="text/javascript">Tab1.addTabPage( document.getElementById( "IndividualLocations" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBLocationStatements:GroupBox */ %>

<div id="GBLocationStatements" name="GBLocationStatements" class="withborder"   style="float:left;position:relative; width:616px; height:36px;">  <!-- GBLocationStatements --> 

<% /* LocationsStatements:Text */ %>

<label class="groupbox"  id="LocationsStatements" name="LocationsStatements" style="width:238px;height:16px;position:absolute;left:6px;top:12px;">Locations Statements</label>

<% /* PBDelete1:PushBtn */ %>
<button type="button" name="PBDelete1" id="PBDelete1" value="" onclick="GOTO_DeleteSelectedEntries( )" style="width:210px;height:26px;position:absolute;left:264px;top:12px;">Delete Selected Locations</button>

<% /* PBNew1:PushBtn */ %>
<button type="button" name="PBNew1" id="PBNew1" value="" onclick="ADD_LocationStatements( )" style="width:78px;height:26px;position:absolute;left:482px;top:12px;">New</button>


</div>  <!--  GBLocationStatements --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridLocations:Grid */ %>
<table class="sortable"  cols=3 style="width:616px;"  name="GridLocations" id="GridLocations">

<thead bgcolor=green><tr>

   <th class="gridheading"><input type="checkbox" onclick="CheckAllInGrid(this,'GS_SelectLocation')"></th>
   <th>Locations</th>
   <th>Update</th>

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
      String strGS_SelectLocation;
      String strGS_SelectLocationValue;
      String strLocations;
      String strBMBUpdateLocationsStatement;
      
      View vGridLocations;
      vGridLocations = mMasLC.newView( );
      csrRC2 = vGridLocations.cursor( "M_Usage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridLocations.cursor( "M_Usage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGS_SelectLocation = "";
         nRC = vGridLocations.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_SelectLocation = vGridLocations.cursor( "M_Usage" ).getAttribute( "wSelected" ).getString( "" );

            if ( strGS_SelectLocation == null )
               strGS_SelectLocation = "";
         }

         if ( StringUtils.equals( strGS_SelectLocation, "Y" ) )
         {
            strGS_SelectLocationValue = "GS_SelectLocation" + strEntityKey;
            strGS_SelectLocation = "<input name='" + strGS_SelectLocationValue + "' id='" + strGS_SelectLocationValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_SelectLocationValue = "GS_SelectLocation" + strEntityKey;
            strGS_SelectLocation = "<input name='" + strGS_SelectLocationValue + "' id='" + strGS_SelectLocationValue + "' value='Y' type='checkbox' > ";
         }

         strLocations = "";
         nRC = vGridLocations.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strLocations = vGridLocations.cursor( "M_Usage" ).getAttribute( "dUsageFullEmbeddedName" ).getString( "" );

            if ( strLocations == null )
               strLocations = "";
         }

         if ( StringUtils.isBlank( strLocations ) )
            strLocations = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_SelectLocation%></td>
   <td><a href="#" onclick="GOTO_UpdateLocationsStatement( this.id )" id="Locations::<%=strEntityKey%>"><%=strLocations%></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdateLocationsStatement" onclick="GOTO_UpdateLocationsStatement( this.id )" id="BMBUpdateLocationsStatement::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png" alt="Update"></a></td>

</tr>

<%
         csrRC2 = vGridLocations.cursor( "M_Usage" ).setNextContinue( );
      }
      vGridLocations.drop( );
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

</div> <!-- End of Tab item IndividualLocations -->

<div id="GroupLocations" class="tab-page " > <!-- Tab item GroupLocations -->
<h2 class="tab"><span>Group Locations</span></h2>
<script type="text/javascript">Tab1.addTabPage( document.getElementById( "GroupLocations" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBLocationGroups:GroupBox */ %>

<div id="GBLocationGroups" name="GBLocationGroups" class="withborder"   style="float:left;position:relative; width:616px; height:68px;">  <!-- GBLocationGroups --> 

<% /* LocationsGroupsStatements:Text */ %>

<label class="groupbox"  id="LocationsGroupsStatements" name="LocationsGroupsStatements" style="width:166px;height:16px;position:absolute;left:6px;top:12px;">Locations Groups</label>

<% /* PBDelete2:PushBtn */ %>
<button type="button" name="PBDelete2" id="PBDelete2" value="" onclick="DELETE_UsageGroupEntriesOnly( )" style="width:258px;height:26px;position:absolute;left:194px;top:12px;">Delete Selected Groups Only</button>

<% /* PBNew2:PushBtn */ %>
<button type="button" name="PBNew2" id="PBNew2" value="" onclick="GOTO_AddUsageGroup( )" style="width:78px;height:26px;position:absolute;left:482px;top:12px;">New</button>

<% /* DeleteLocationGroups:PushBtn */ %>
<button type="button" name="DeleteLocationGroups" id="DeleteLocationGroups" value="" onclick="DELETE_UsageGroupEntries( )" style="width:258px;height:26px;position:absolute;left:194px;top:38px;">Delete Selected Groups & Locations</button>


</div>  <!--  GBLocationGroups --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridLocationGroup:Grid */ %>
<table class="sortable"  cols=3 style="width:616px;"  name="GridLocationGroup" id="GridLocationGroup">

<thead bgcolor=green><tr>

   <th class="gridheading"><input type="checkbox" onclick="CheckAllInGrid(this,'GS_SelectLocationGroup')"></th>
   <th>Location Groups</th>
   <th>Update</th>

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
      String strGS_SelectLocationGroup;
      String strGS_SelectLocationGroupValue;
      String strLocationGroups;
      String strBMBUpdateLocationGroupsStatement;
      
      View vGridLocationGroup;
      vGridLocationGroup = mMasLC.newView( );
      csrRC2 = vGridLocationGroup.cursor( "M_UsageGroup" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridLocationGroup.cursor( "M_UsageGroup" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGS_SelectLocationGroup = "";
         nRC = vGridLocationGroup.cursor( "M_UsageGroup" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGS_SelectLocationGroup = vGridLocationGroup.cursor( "M_UsageGroup" ).getAttribute( "wSelected" ).getString( "" );

            if ( strGS_SelectLocationGroup == null )
               strGS_SelectLocationGroup = "";
         }

         if ( StringUtils.equals( strGS_SelectLocationGroup, "Y" ) )
         {
            strGS_SelectLocationGroupValue = "GS_SelectLocationGroup" + strEntityKey;
            strGS_SelectLocationGroup = "<input name='" + strGS_SelectLocationGroupValue + "' id='" + strGS_SelectLocationGroupValue + "' value='Y' type='checkbox'  CHECKED > ";
         }
         else
         {
            strGS_SelectLocationGroupValue = "GS_SelectLocationGroup" + strEntityKey;
            strGS_SelectLocationGroup = "<input name='" + strGS_SelectLocationGroupValue + "' id='" + strGS_SelectLocationGroupValue + "' value='Y' type='checkbox' > ";
         }

         strLocationGroups = "";
         nRC = vGridLocationGroup.cursor( "M_UsageGroup" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strLocationGroups = vGridLocationGroup.cursor( "M_UsageGroup" ).getAttribute( "dSubUsageCombinedText" ).getString( "" );

            if ( strLocationGroups == null )
               strLocationGroups = "";
         }

         if ( StringUtils.isBlank( strLocationGroups ) )
            strLocationGroups = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap><%=strGS_SelectLocationGroup%></td>
   <td><a href="#" onclick="GOTO_UpdateUsageGroup( this.id )" id="LocationGroups::<%=strEntityKey%>"><%=strLocationGroups%></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdateLocationGroupsStatement" onclick="GOTO_UpdateUsageGroup( this.id )" id="BMBUpdateLocationGroupsStatement::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png" alt="Update"></a></td>

</tr>

<%
         csrRC2 = vGridLocationGroup.cursor( "M_UsageGroup" ).setNextContinue( );
      }
      vGridLocationGroup.drop( );
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

</div> <!-- End of Tab item GroupLocations -->

<div id="NonGroupLocations" class="tab-page " > <!-- Tab item NonGroupLocations -->
<h2 class="tab"><span>Nongroup Locations</span></h2>
<script type="text/javascript">Tab1.addTabPage( document.getElementById( "NonGroupLocations" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridNonGroupLocations:Grid */ %>
<table class="sortable"  cols=1 style="width:594px;"  name="GridNonGroupLocations" id="GridNonGroupLocations">

<thead bgcolor=green><tr>

   <th>Locations</th>

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
      String strGE_NonGroupLocations;
      
      View vGridNonGroupLocations;
      vGridNonGroupLocations = mMasLC.newView( );
      csrRC2 = vGridNonGroupLocations.cursor( "M_UsageNonGroupUsage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridNonGroupLocations.cursor( "M_UsageNonGroupUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGE_NonGroupLocations = "";
         nRC = vGridNonGroupLocations.cursor( "M_UsageNonGroupUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGE_NonGroupLocations = vGridNonGroupLocations.cursor( "M_UsageNonGroupUsage" ).getAttribute( "dUsageNonGroupSubUsages" ).getString( "" );

            if ( strGE_NonGroupLocations == null )
               strGE_NonGroupLocations = "";
         }

         if ( StringUtils.isBlank( strGE_NonGroupLocations ) )
            strGE_NonGroupLocations = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGE_NonGroupLocations%></td>

</tr>

<%
         csrRC2 = vGridNonGroupLocations.cursor( "M_UsageNonGroupUsage" ).setNextContinue( );
      }
      vGridNonGroupLocations.drop( );
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

</div> <!-- End of Tab item NonGroupLocations -->

<div id="General" class="tab-page " > <!-- Tab item General -->
<h2 class="tab"><span>General</span></h2>
<script type="text/javascript">Tab1.addTabPage( document.getElementById( "General" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>
<div id="GroupBox2" name="GroupBox2" style="float:left;width:620px;" >

<table cols=2 style="width:620px;"  class="grouptable">

<tr>
<td valign="top" style="width:136px;">
<% /* Title::Text */ %>

<span  id="Title:" name="Title:" style="width:132px;height:20px;">Title:</span>

</td>
<td valign="top" style="width:466px;">
<% /* Title:EditBox */ %>
<%
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
         task.log( ).debug( "Invalid View: " + "Title" );
      else
      {
         nRC = mMasLC.cursor( "M_UsageType" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_UsageType" ).getAttribute( "Title" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Title: " + e.getMessage());
               task.log().error( "*** Error on ctrl Title", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_UsageType.Title: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for Title: " + "mMasLC.M_UsageType" );
      }
   }
%>

<input name="Title" id="Title" maxlength="254" style="width:466px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* ReviewerNote::Text */ %>

<span  id="ReviewerNote:" name="ReviewerNote:" style="width:132px;height:20px;">Note to Reviewer:</span>

</td>
<td valign="top" style="width:466px;">
<% /* ReviewerNote:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "ReviewerNote", strError );
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
         task.log( ).debug( "Invalid View: " + "ReviewerNote" );
      else
      {
         nRC = mMasLC.cursor( "M_UsageType" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_UsageType" ).getAttribute( "ReviewerNote" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on ReviewerNote: " + e.getMessage());
               task.log().error( "*** Error on ctrl ReviewerNote", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_UsageType.ReviewerNote: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for ReviewerNote: " + "mMasLC.M_UsageType" );
      }
   }
%>

<input name="ReviewerNote" id="ReviewerNote" maxlength="1024" style="width:466px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox2 --> 

</div>  <!-- End of a new line -->

</div> <!-- End of Tab item General -->

</div> <!-- End of Tab Control Tab1 -->

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
<script type="text/javascript">animatedcollapse.init();</script>
</html>
<%
   session.setAttribute( "ZeidonWindow", "wMLCLocations" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
