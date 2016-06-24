<!DOCTYPE HTML>

<%-- wMLCDirectionsForUseStatement   Generate Timestamp: 20160623085855069 --%>

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
      // MLEdit: MLETitle
      nRC = mMasLC.cursor( "M_DirectionsForUseStatement" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "MLETitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "MLETitle", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseStatement" ).getAttribute( "Title" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "MLETitle", e.getReason( ), strMapValue );
         }
      }

      // MLEdit: MLEText
      nRC = mMasLC.cursor( "M_DirectionsForUseStatement" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "MLEText" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "MLEText", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseStatement" ).getAttribute( "Text" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "MLEText", e.getReason( ), strMapValue );
         }
      }

      // Grid: GridKeywords
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_InsertTextKeywordDU" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_InsertTextKeywordDU" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_InsertTextKeywordDU" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: Grid4
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_DirectionsUsageOrdering" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_DirectionsUsageOrdering" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_DirectionsUsageOrdering" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // CheckBox: ExclusiveStatements
      nRC = mMasLC.cursor( "M_DirectionsForUseStatement" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "ExclusiveStatements" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ExclusiveStatements", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseStatement" ).getAttribute( "ExclusiveStatements" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ExclusiveStatements", e.getReason( ), strMapValue );
         }
      }

      // Grid: GridDirectionsUse
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_DirectionsForUseSubStatement" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_DirectionsForUseSubStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_DirectionsForUseSubStatement" ).setNextContinue( );
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

if ( strLastWindow.equals("wMLCDirectionsForUseStatement") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wMLCDirectionsForUseStatement strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLCDirectionsForUseStatement LastWindow *** " + strLastWindow );
task.log().info("*** wMLCDirectionsForUseStatement LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptDirectionsStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Auto Object Function
      nRC = 0;
      try
      {
         View mMasLCAuto = task.getViewByName( "mMasLC" );
         EntityCursor cursor = mMasLCAuto.cursor( "M_DirectionsForUseStatement" );
            if ( cursor.isNull() )
               nRC = 0;
            else
            {
               if ( cursor.isVersioned( ) )
               {
                  cursor.acceptSubobject( );
               }
            nRC = 0;
         }

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "AcceptDirectionsStatement", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptNext" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseStatement", "wMLC.AcceptDFU_StatementGoNext" );
      nOptRC = wMLC.AcceptDFU_StatementGoNext( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptPrevious" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseStatement", "wMLC.AcceptDFU_StatementGoPrev" );
      nOptRC = wMLC.AcceptDFU_StatementGoPrev( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AddNewStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseStatement", "wMLC.AcceptAddNewDU_Stmt" );
      nOptRC = wMLC.AcceptAddNewDU_Stmt( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ADD_DFU_StatementKeyword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Auto Object Function
      nRC = 0;
      try
      {
         View mMasLCAuto = task.getViewByName( "mMasLC" );
         EntityCursor cursor = mMasLCAuto.cursor( "M_InsertTextKeywordDU" );
         cursor.createTemporalEntity( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "ADD_DFU_StatementKeyword", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "AddUpdateKeywordDU" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelDirectionsStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Action Auto Object Function
      nRC = 0;
      try
      {
         View mMasLCAuto = task.getViewByName( "mMasLC" );
         EntityCursor cursor = mMasLCAuto.cursor( "M_DirectionsForUseStatement" );
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
         VmlOperation.CreateMessage( task, "CancelDirectionsStatement", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "COPY_InsertKeywordDU" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_InsertTextKeywordDU" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_InsertTextKeywordDU" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_InsertTextKeywordDU" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_InsertTextKeywordDU" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseStatement", "wMLC.COPY_InsertKeywordDU" );
      nOptRC = wMLC.COPY_InsertKeywordDU( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_DirectionsForUseStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseStatement", "wMLC.DELETE_DirectionsForUseStatement" );
      nOptRC = wMLC.DELETE_DirectionsForUseStatement( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_DirectionsForUseSubStmt" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_DirectionsForUseSubStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_DirectionsForUseSubStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_DirectionsForUseSubStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_DirectionsForUseSubStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
         EntityCursor cursor = mMasLC.cursor( "M_DirectionsForUseSubStatement" );
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
         VmlOperation.CreateMessage( task, "DELETE_DirectionsForUseSubStmt", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_DU_StatementKeyword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_InsertTextKeywordDU" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_InsertTextKeywordDU" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_InsertTextKeywordDU" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_InsertTextKeywordDU" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
         EntityCursor cursor = mMasLC.cursor( "M_InsertTextKeywordDU" );
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
         VmlOperation.CreateMessage( task, "DELETE_DU_StatementKeyword", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DirsForUseStatementAdd" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseStatement", "wMLC.GOTO_DirsForUseStatementAdd" );
      nOptRC = wMLC.GOTO_DirsForUseStatementAdd( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "DirectionsForUseStatement" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DirsForUseStatementUpdate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Auto Object Function
      nRC = 0;
      try
      {
         View mMasLCAuto = task.getViewByName( "mMasLC" );
         EntityCursor cursor = mMasLCAuto.cursor( "M_DirectionsForUseStatement" );
         cursor.createTemporalSubobjectVersion( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "GOTO_DirsForUseStatementUpdate", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "DirectionsForUseStatement" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DirsForUseSubStatementAdd" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseStatement", "wMLC.GOTO_DirsForUseSubStatementAdd" );
      nOptRC = wMLC.GOTO_DirsForUseSubStatementAdd( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "DirectionsForUseSubStatement" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DirsForUseSubStmtUpdate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_DirectionsForUseSubStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_DirectionsForUseSubStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_DirectionsForUseSubStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_DirectionsForUseSubStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseStatement", "wMLC.GOTO_DirsForUseSubStmtUpdate" );
      nOptRC = wMLC.GOTO_DirsForUseSubStmtUpdate( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "DirectionsForUseSubStatement" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DisplayGeneratedTextDU" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_MarketingKeywordUpdate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_InsertTextKeywordDU" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_InsertTextKeywordDU" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_InsertTextKeywordDU" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_InsertTextKeywordDU" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
         EntityCursor cursor = mMasLC.cursor( "M_InsertTextKeywordDU" );
         cursor.createTemporalSubobjectVersion( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "GOTO_MarketingKeywordUpdate", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "AddUpdateKeywordDU" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_SelectRemoveDUEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseStatement", "wMLC.GOTO_SelectRemoveDUEntries" );
      nOptRC = wMLC.GOTO_SelectRemoveDUEntries( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "DirsForUseSelectByType" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ParseStatementText" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseStatement", "wMLC.ParseDFU_StatementText" );
      nOptRC = wMLC.ParseDFU_StatementText( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "PASTE_InsertKeywordDU" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseStatement", "wMLC.PASTE_InsertKeywordDU" );
      nOptRC = wMLC.PASTE_InsertKeywordDU( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "Sort" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      // We are borrowing zTableRowSelect and this code is hardwired for the moment.  javascript code similar to the following must be added to the action:
      // document.wSLCMarketingStatement.zTableRowSelect.value = buildSortTableHtml( "mSubLC", "S_MarketingUsageOrdering", "GridMarketingUsage", ["Usage Type","Usage Name"] );
      wWebXA = task.getViewByName( "wWebXfer" );
      String strHtml = (String) request.getParameter( "zTableRowSelect" );
      wWebXA.cursor( "Root" ).getAttribute( "HTML" ).setValue( strHtml, "" );
      // We are borrowing zTableRowSelect and the code above is hardwired for the moment

      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wSystem", "DragDropSort" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wMLCDirectionsForUseStatement" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wMLCDirectionsForUseStatement" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLCDirectionsForUseStatement.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLCDirectionsForUseStatement.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLCDirectionsForUseStatement.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLCDirectionsForUseStatement.jsp" );
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
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "DirectionsForUseStatement", "" );
   }

%>

<html>
<head>

<title>Directions For Use Statement</title>

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
<script language="JavaScript" type="text/javascript" src="./genjs/wMLCDirectionsForUseStatement.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AcceptAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="AcceptAndReturn" name="AcceptAndReturn"><a href="#"  onclick="AcceptDirectionsStatement()">Accept & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AcceptAddNew" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="AcceptAddNew" name="AcceptAddNew"><a href="#"  onclick="AddNewStatement()">Add New</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "NextStatement" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="NextStatement" name="NextStatement"><a href="#"  onclick="AcceptNext()">Next Statement</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "PrevStatement" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="PrevStatement" name="PrevStatement"><a href="#"  onclick="AcceptPrevious()">Previous Statement</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="CancelAndReturn" name="CancelAndReturn"><a href="#"  onclick="CancelDirectionsStatement()">Cancel & Return</a></li>
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


<form name="wMLCDirectionsForUseStatement" id="wMLCDirectionsForUseStatement" method="post">
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "DirectionsForUseStatement" );
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
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBDirectionsForUseStatement:GroupBox */ %>

<div id="GBDirectionsForUseStatement" name="GBDirectionsForUseStatement" class="listgroup"   style="float:left;position:relative; width:780px; height:36px;">  <!-- GBDirectionsForUseStatement --> 

<% /* StatementText:Text */ %>

<label class="groupbox"  id="StatementText" name="StatementText" style="width:238px;height:16px;position:absolute;left:6px;top:12px;">Directions for Use Statement</label>


</div>  <!--  GBDirectionsForUseStatement --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox3:GroupBox */ %>
<div id="GroupBox3" name="GroupBox3" style="float:left;width:846px;" >

<table cols=2 style="width:846px;"  class="grouptable">

<tr>
<td valign="top" style="width:54px;">
<% /* Title::Text */ %>

<span  id="Title:" name="Title:" style="width:46px;height:18px;">Title:</span>

</td>
<td valign="top" style="width:762px;">
<% /* MLETitle:MLEdit */ %>
<%
   // MLEdit: MLETitle
   strErrorMapValue = VmlOperation.CheckError( "MLETitle", strError );
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
         task.log( ).debug( "Invalid View: " + "MLETitle" );
      else
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasLC.cursor( "M_DirectionsForUseStatement" ).getAttribute( "Title" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_DirectionsForUseStatement.Title: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for MLETitle: " + "mMasLC.M_DirectionsForUseStatement" );
      }
   }
%>

<textarea id="MLETitle" name="MLETitle" class="" style="width:762px;height:34px;border:solid;border-width:4px;border-style:groove;" wrap="wrap"><%=strErrorMapValue%></textarea>

</td>
</tr>
<tr>
<td valign="top" style="width:54px;">
<% /* Text::Text */ %>

<span  id="Text:" name="Text:" style="width:46px;height:18px;">Text:</span>

</td>
<td valign="top" style="width:762px;">
<% /* MLEText:MLEdit */ %>
<%
   // MLEdit: MLEText
   strErrorMapValue = VmlOperation.CheckError( "MLEText", strError );
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
         task.log( ).debug( "Invalid View: " + "MLEText" );
      else
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasLC.cursor( "M_DirectionsForUseStatement" ).getAttribute( "Text" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_DirectionsForUseStatement.Text: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for MLEText: " + "mMasLC.M_DirectionsForUseStatement" );
      }
   }
%>

<textarea id="MLEText" name="MLEText" class="" style="width:762px;height:128px;border:solid;border-width:4px;border-style:groove;" wrap="wrap"><%=strErrorMapValue%></textarea>

</td>
</tr>
</table>

</div>  <!-- GroupBox3 --> 

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox9:GroupBox */ %>

<div id="GroupBox9" name="GroupBox9" style="width:846px;float:left;">  <!-- GroupBox9 --> 


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* DirectionsForUseTitle::Text */ %>

<span  id="DirectionsForUseTitle:" name="DirectionsForUseTitle:" style="width:70px;height:16px;">Title:</span>

<span style="height:16px;">&nbsp</span>
<% /* DirectionsForUseTitle:Text */ %>
<% strTextDisplayValue = "";
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) == false )
      task.log( ).debug( "Invalid View: " + "DirectionsForUseTitle" );
   else
   {
      nRC = mMasLC.cursor( "M_DirectionsForUseStatement" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mMasLC.cursor( "M_DirectionsForUseStatement" ).getAttribute( "dDU_StatementTitleKeyword" ).getString( "" );
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

<span class="text12"  id="DirectionsForUseTitle" name="DirectionsForUseTitle"  title="Optional Title to appear with text on generated label" style="width:730px;height:16px;"><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* DirectionsForUseText::Text */ %>

<span  id="DirectionsForUseText:" name="DirectionsForUseText:" style="width:70px;height:16px;">Text:</span>

<span style="height:16px;">&nbsp</span>
<% /* DirectionsForUseText:Text */ %>
<% strTextDisplayValue = "";
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) == false )
      task.log( ).debug( "Invalid View: " + "DirectionsForUseText" );
   else
   {
      nRC = mMasLC.cursor( "M_DirectionsForUseStatement" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mMasLC.cursor( "M_DirectionsForUseStatement" ).getAttribute( "dDU_StatementTextKeyword" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on DirectionsForUseText: " + e.getMessage());
         task.log().info( "*** Error on ctrl DirectionsForUseText" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text12"  id="DirectionsForUseText" name="DirectionsForUseText"  title="Optional Title to appear with text on generated label" style="width:730px;height:16px;"><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox5:GroupBox */ %>

<div id="GroupBox5" name="GroupBox5"   style="float:left;position:relative; width:832px; height:30px;">  <!-- GroupBox5 --> 

<% /* Show:PushBtn */ %>
<button type="button" class="newbutton" name="Show" id="Show" value="" onclick="GOTO_DisplayGeneratedTextDU( )" style="width:74px;height:26px;position:absolute;left:354px;top:4px;">Refresh</button>

<% /* Paste:PushBtn */ %>
<button type="button" class="newbutton" name="Paste" id="Paste" value="" onclick="PASTE_InsertKeywordDU( )" style="width:74px;height:26px;position:absolute;left:438px;top:4px;">Paste</button>

<% /* ParseText:PushBtn */ %>
<button type="button" class="newbutton" name="ParseText" id="ParseText" value="" onclick="ParseStatementText( )" style="width:94px;height:26px;position:absolute;left:524px;top:4px;">Parse Text</button>

<% /* NewKeyword:PushBtn */ %>
<button type="button" class="newbutton" name="NewKeyword" id="NewKeyword" value="" onclick="ADD_DFU_StatementKeyword( )" style="width:66px;height:26px;position:absolute;left:630px;top:4px;">New</button>

<% /* PBSort:PushBtn */ %>
<button type="button" class="newbutton" name="PBSort" id="PBSort" value="" onclick="Sort( )" style="width:66px;height:26px;position:absolute;left:710px;top:4px;">Sort</button>

<% /* Text5:Text */ %>

<label class="listheader"  id="Text5" name="Text5" style="width:324px;height:16px;position:absolute;left:10px;top:8px;">Keyword text for Embedding in Statement Text</label>


</div>  <!--  GroupBox5 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridKeywords:Grid */ %>
<table  cols=5 style=""  name="GridKeywords" id="GridKeywords">

<thead><tr>

   <th>Keyword</th>
   <th>Keyword Text</th>
   <th>Update</th>
   <th>Copy</th>
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
      String strKeyword;
      String strKeywordText;
      String strUpdateKeyword;
      String strBMBCopyDirectionsUseKeyword;
      String strDeleteKeyword;
      
      View vGridKeywords;
      vGridKeywords = mMasLC.newView( );
      csrRC2 = vGridKeywords.cursor( "M_InsertTextKeywordDU" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridKeywords.cursor( "M_InsertTextKeywordDU" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strKeyword = "";
         nRC = vGridKeywords.cursor( "M_InsertTextKeywordDU" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strKeyword = vGridKeywords.cursor( "M_InsertTextKeywordDU" ).getAttribute( "Name" ).getString( "" );

            if ( strKeyword == null )
               strKeyword = "";
         }

         if ( StringUtils.isBlank( strKeyword ) )
            strKeyword = "&nbsp";

         strKeywordText = "";
         nRC = vGridKeywords.cursor( "M_InsertTextKeywordDU" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strKeywordText = vGridKeywords.cursor( "M_InsertTextKeywordDU" ).getAttribute( "dDU_KeywordText" ).getString( "" );

            if ( strKeywordText == null )
               strKeywordText = "";
         }

         if ( StringUtils.isBlank( strKeywordText ) )
            strKeywordText = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="GOTO_MarketingKeywordUpdate( this.id )" id="Keyword::<%=strEntityKey%>"><%=strKeyword%></a></td>
   <td><%=strKeywordText%></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="UpdateKeyword" onclick="GOTO_MarketingKeywordUpdate( this.id )" id="UpdateKeyword::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png" alt="Update"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBCopyDirectionsUseKeyword" onclick="COPY_InsertKeywordDU( this.id )" id="BMBCopyDirectionsUseKeyword::<%=strEntityKey%>"><img src="./images/ePammsCopy.png" alt="Copy"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="DeleteKeyword" onclick="DELETE_DU_StatementKeyword( this.id )" id="DeleteKeyword::<%=strEntityKey%>"><img src="./images/ePammsDelete.png" alt="Delete"></a></td>

</tr>

<%
         csrRC2 = vGridKeywords.cursor( "M_InsertTextKeywordDU" ).setNextContinue( );
      }
      vGridKeywords.drop( );
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


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox8:GroupBox */ %>

<div id="GroupBox8" name="GroupBox8" style="width:846px;float:left;">  <!-- GroupBox8 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4"   style="float:left;position:relative; width:686px; height:30px;">  <!-- GroupBox4 --> 

<% /* Text4:Text */ %>

<label class="listheader"  id="Text4" name="Text4" style="width:434px;height:16px;position:absolute;left:12px;top:4px;">Usage Entries for Embedding in Statement Text</label>

<% /* PushBtn3:PushBtn */ %>
<button type="button" class="newbutton" name="PushBtn3" id="PushBtn3" value="" onclick="GOTO_SelectRemoveDUEntries( )" style="width:118px;height:26px;position:absolute;left:560px;top:4px;">Select/Remove</button>


</div>  <!--  GroupBox4 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Grid4:Grid */ %>
<table  cols=2 style=""  name="Grid4" id="Grid4">

<thead><tr>

   <th>Usage Type</th>
   <th>Usage Name</th>

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
      String strGridEditCtl4;
      String strGridEditCtl5;
      
      View vGrid4;
      vGrid4 = mMasLC.newView( );
      csrRC2 = vGrid4.cursor( "M_DirectionsUsageOrdering" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid4.cursor( "M_DirectionsUsageOrdering" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditCtl4 = "";
         nRC = vGrid4.cursor( "M_DirectionsUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl4 = vGrid4.cursor( "M_DirectionsUsage" ).getAttribute( "UsageType" ).getString( "FullUsageType" );

            if ( strGridEditCtl4 == null )
               strGridEditCtl4 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl4 ) )
            strGridEditCtl4 = "&nbsp";

         strGridEditCtl5 = "";
         nRC = vGrid4.cursor( "M_DirectionsUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl5 = vGrid4.cursor( "M_DirectionsUsage" ).getAttribute( "dUsageNameFootnote" ).getString( "" );

            if ( strGridEditCtl5 == null )
               strGridEditCtl5 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl5 ) )
            strGridEditCtl5 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGridEditCtl4%></td>
   <td><%=strGridEditCtl5%></td>

</tr>

<%
         csrRC2 = vGrid4.cursor( "M_DirectionsUsageOrdering" ).setNextContinue( );
      }
      vGrid4.drop( );
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


</div>  <!--  GroupBox8 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBDirectionsUseStatements:GroupBox */ %>

<div id="GBDirectionsUseStatements" name="GBDirectionsUseStatements" style="width:846px;float:left;">  <!-- GBDirectionsUseStatements --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox10:GroupBox */ %>

<div id="GroupBox10" name="GroupBox10"   style="float:left;position:relative; width:716px; height:30px;">  <!-- GroupBox10 --> 

<% /* Text6:Text */ %>

<label class="listheader"  id="Text6" name="Text6" style="width:360px;height:16px;position:absolute;left:4px;top:4px;">Directions for Use Sub-Statements</label>

<% /* ExclusiveStatements:CheckBox */ %>
<%
   strErrorMapValue = "";
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) == false )
      task.log( ).debug( "Invalid View: " + "ExclusiveStatements" );
   else
   {
      nRC = mMasLC.cursor( "M_DirectionsForUseStatement" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
         strRadioGroupValue = mMasLC.cursor( "M_DirectionsForUseStatement" ).getAttribute( "ExclusiveStatements" ).getString( );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="ExclusiveStatements" id="ExclusiveStatements"  value="Y" <%=strErrorMapValue%> style="position:absolute;left:402px;top:4px;">
<span style="width:172px;height:26px;position:absolute;left:432px;top:4px;">Exclusive Statements</span>

<% /* NewSubStatement:PushBtn */ %>
<button type="button" class="newbutton"  title="Go to add one orNewSubStatement" id="NewSubStatement" value="" onclick="GOTO_DirsForUseSubStatementAdd( )" style="width:78px;height:26px;position:absolute;left:614px;top:4px;">New</button>


</div>  <!--  GroupBox10 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridDirectionsUse:Grid */ %>
<table  cols=3 style=""  name="GridDirectionsUse" id="GridDirectionsUse">

<thead><tr>

   <th>Statement Text</th>
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
      String strGridEditDirectionsUse;
      String strBMBUpdateDirectionsUseSubStmt;
      String strBMBDeleteDirectionsUseSubStmt;
      
      View vGridDirectionsUse;
      vGridDirectionsUse = mMasLC.newView( );
      csrRC2 = vGridDirectionsUse.cursor( "M_DirectionsForUseSubStatement" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridDirectionsUse.cursor( "M_DirectionsForUseSubStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditDirectionsUse = "";
         nRC = vGridDirectionsUse.cursor( "M_DirectionsForUseSubStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditDirectionsUse = vGridDirectionsUse.cursor( "M_DirectionsForUseSubStatement" ).getAttribute( "dDU_SubStmtTitleTextKeyword" ).getString( "" );

            if ( strGridEditDirectionsUse == null )
               strGridEditDirectionsUse = "";
         }

         if ( StringUtils.isBlank( strGridEditDirectionsUse ) )
            strGridEditDirectionsUse = "&nbsp";

%>

<tr<%=strOdd%>>

   <td title="Text for the Directions for Use Statement identified on this row" ><a href="#" onclick="GOTO_DirsForUseSubStmtUpdate( this.id )" id="GridEditDirectionsUse::<%=strEntityKey%>" title="Text for the Directions for Use Statement identified on this row" ><%=strGridEditDirectionsUse%></a></td>
   <td nowrap title="Go to update the the Directions for Use Statement text identified on this row" ><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdateDirectionsUseSubStmt" onclick="GOTO_DirsForUseSubStmtUpdate( this.id )" id="BMBUpdateDirectionsUseSubStmt::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png"  title="Go to update the the Directions for Use Statement text identified on this row" alt="Update"></a></td>
   <td nowrap title="Delete the Directions for Use Statement entry identified on this row" ><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBDeleteDirectionsUseSubStmt" onclick="DELETE_DirectionsForUseSubStmt( this.id )" id="BMBDeleteDirectionsUseSubStmt::<%=strEntityKey%>"><img src="./images/ePammsDelete.png"  title="Delete the Directions for Use Statement entry identified on this row" alt="Delete"></a></td>

</tr>

<%
         csrRC2 = vGridDirectionsUse.cursor( "M_DirectionsForUseSubStatement" ).setNextContinue( );
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
   session.setAttribute( "ZeidonWindow", "wMLCDirectionsForUseStatement" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
