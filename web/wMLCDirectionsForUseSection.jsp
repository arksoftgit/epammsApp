<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- wMLCDirectionsForUseSection --%>

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

ObjectEngine objectEngine = JavaObjectEngine.getInstance();

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
      // EditBox: DirectionsUseTitle
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "DirectionsUseTitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "DirectionsUseTitle", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseSection" ).setAttribute( "Title", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "DirectionsUseTitle", e.getReason( ), strMapValue );
         }
      }

      // EditBox: Subtitle
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Subtitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Subtitle", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseSection" ).setAttribute( "Subtitle", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Subtitle", e.getReason( ), strMapValue );
         }
      }

      // MLEdit: NoteToReviewer
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "NoteToReviewer" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "NoteToReviewer", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseSection" ).setAttribute( "ReviewerNote", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "NoteToReviewer", e.getReason( ), strMapValue );
         }
      }

      // Grid: GridDirectionsUse
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_DirectionsForUseStatement" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_DirectionsForUseStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_DirectionsForUseStatement" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: GridAreasOfUse
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "DirectionsAreasOfUse" ).setFirst( "M_DirectionsForUseSection" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "DirectionsAreasOfUse" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "DirectionsAreasOfUse" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: GridAppTypes
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "DirectionsAppType" ).setFirst( "M_DirectionsForUseSection" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "DirectionsAppType" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "DirectionsAppType" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: GridFungi
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "DirectionsFungi" ).setFirst( "M_DirectionsForUseSection" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "DirectionsFungi" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "DirectionsFungi" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: GridViruses
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "DirectionsViruses" ).setFirst( "M_DirectionsForUseSection" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "DirectionsViruses" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "DirectionsViruses" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: GridSurfaces
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "DirectionsSurface" ).setFirst( "M_DirectionsForUseSection" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "DirectionsSurface" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "DirectionsSurface" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: GridBacteria
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "DirectionsBacteria" ).setFirst( "M_DirectionsForUseSection" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "DirectionsBacteria" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "DirectionsBacteria" ).setNextContinue( );
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

if ( strLastWindow.equals("wMLCDirectionsForUseSection") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wMLCDirectionsForUseSection strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLCDirectionsForUseSection LastWindow *** " + strLastWindow );
task.log().info("*** wMLCDirectionsForUseSection LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptDirectionsUseSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Auto Object Function
      nRC = 0;
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_DirectionsForUseSection" );
      if ( cursor.isNull() )
         nRC = 0;
      else
      {
         if ( cursor.isVersioned( ) )
         {
           cursor.acceptSubobject( );
           nRC = 0;
         }
      }

      // Return to Last Window
      nRC = vKZXMLPGO.cursor( "PagePath" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strLastPage = vKZXMLPGO.cursor( "PagePath" ).getStringFromAttribute( "LastPageName" );
         vKZXMLPGO.cursor( "PagePath" ).deleteEntity( CursorPosition.PREV );
         strLastPage = strLastPage + ".jsp";
      }
      else
         strLastPage = "wMLCDirectionsForUseSection.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelDirectionsUseSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Action Auto Object Function
      nRC = 0;
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_DirectionsForUseSection" );
      if ( cursor.isNull() )
         nRC = 0;
      else
      {
         if ( cursor.isVersioned( ) )
         {
           cursor.cancelSubobject( );
           nRC = 0;
         }
      }

      // Return to Last Window
      nRC = vKZXMLPGO.cursor( "PagePath" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strLastPage = vKZXMLPGO.cursor( "PagePath" ).getStringFromAttribute( "LastPageName" );
         vKZXMLPGO.cursor( "PagePath" ).deleteEntity( CursorPosition.PREV );
         strLastPage = strLastPage + ".jsp";
      }
      else
         strLastPage = "wMLCDirectionsForUseSection.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DirsForUseStatementAdd" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wMLC.GOTO_DirsForUseStatementAdd" );
      try
      {
         nOptRC = wMLC.GOTO_DirsForUseStatementAdd( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation GOTO_DirsForUseStatementAdd: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCDirectionsForUseStatement.jsp" );
      vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
      vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DirsForUseStatementUpdate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_DirectionsForUseStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_DirectionsForUseStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_DirectionsForUseStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_DirectionsForUseStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      EntityCursor cursor = mMasLC.cursor( "M_DirectionsForUseStatement" );
      cursor.createTemporalSubobjectVersion( );

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCDirectionsForUseStatement.jsp" );
      vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
      vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_SelectRemoveAreasOfUse" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "MoveDirectionsUseStmtDown" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_DirectionsForUseStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_DirectionsForUseStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_DirectionsForUseStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_DirectionsForUseStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wMLC.MoveDirectionsUseStmtDown" );
      try
      {
         nOptRC = wMLC.MoveDirectionsUseStmtDown( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation MoveDirectionsUseStmtDown: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wMLCDirectionsForUseSection.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "MoveDirectionsUseStmtUp" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_DirectionsForUseStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_DirectionsForUseStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_DirectionsForUseStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_DirectionsForUseStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wMLC.MoveDirectionsUseStmtUp" );
      try
      {
         nOptRC = wMLC.MoveDirectionsUseStmtUp( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation MoveDirectionsUseStmtUp: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wMLCDirectionsForUseSection.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectDirectionsUseStmtForDelete" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_DirectionsForUseStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_DirectionsForUseStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_DirectionsForUseStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_DirectionsForUseStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wMLC.SelectDirectionsUseStmtForDelete" );
      try
      {
         nOptRC = wMLC.SelectDirectionsUseStmtForDelete( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SelectDirectionsUseStmtForDelete: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCDeleteDirectionsForUseStatement.jsp" );
      vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
      vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAcceptDirectionsUseSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Auto Object Function
      nRC = 0;
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_DirectionsForUseSection" );
      if ( cursor.isNull() )
         nRC = 0;
      else
      {
         if ( cursor.isVersioned( ) )
         {
           cursor.acceptSubobject( );
           nRC = 0;
         }
      }

      // Return to Last Window
      nRC = vKZXMLPGO.cursor( "PagePath" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strLastPage = vKZXMLPGO.cursor( "PagePath" ).getStringFromAttribute( "LastPageName" );
         vKZXMLPGO.cursor( "PagePath" ).deleteEntity( CursorPosition.PREV );
         strLastPage = strLastPage + ".jsp";
      }
      else
         strLastPage = "wMLCDirectionsForUseSection.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelDirectionsUseSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Action Auto Object Function
      nRC = 0;
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_DirectionsForUseSection" );
      if ( cursor.isNull() )
         nRC = 0;
      else
      {
         if ( cursor.isVersioned( ) )
         {
           cursor.cancelSubobject( );
           nRC = 0;
         }
      }

      // Return to Last Window
      nRC = vKZXMLPGO.cursor( "PagePath" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strLastPage = vKZXMLPGO.cursor( "PagePath" ).getStringFromAttribute( "LastPageName" );
         vKZXMLPGO.cursor( "PagePath" ).deleteEntity( CursorPosition.PREV );
         strLastPage = strLastPage + ".jsp";
      }
      else
         strLastPage = "wMLCDirectionsForUseSection.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mProductManagement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wStartUp.ProductManagement" );
      try
      {
         nOptRC = wStartUp.ProductManagement( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation ProductManagement: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wStartUpAdminListPrimaryRegistrants.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mSubregistrants" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wStartUp.SubregistrantManagement" );
      try
      {
         nOptRC = wStartUp.SubregistrantManagement( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SubregistrantManagement: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wStartUpAdminListSubregistrants.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mTrackingNotificationCompliance" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wStartUp.TrackingNotificationCompliance" );
      try
      {
         nOptRC = wStartUp.TrackingNotificationCompliance( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation TrackingNotificationCompliance: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( ".jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mStateRegistrations" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wStartUp.StateRegistrations" );
      try
      {
         nOptRC = wStartUp.StateRegistrations( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation StateRegistrations: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( ".jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mMarketingFulfillment" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wStartUp.MarketingFulfillment" );
      try
      {
         nOptRC = wStartUp.MarketingFulfillment( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation MarketingFulfillment: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( ".jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mWebDevelopment" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wStartUp.WebDevelopment" );
      try
      {
         nOptRC = wStartUp.WebDevelopment( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation WebDevelopment: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( ".jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mAdministration" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wStartUp.PrimaryRegistrantCompanySetup" );
      try
      {
         nOptRC = wStartUp.PrimaryRegistrantCompanySetup( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation PrimaryRegistrantCompanySetup: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wStartUpAdminUpdatePrimaryRegistrant.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mLogin" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wStartUp.ProcessLogin" );
      try
      {
         nOptRC = wStartUp.ProcessLogin( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation ProcessLogin: " + e.getMessage();
         task.log().info( strVMLError );
      }
      if ( nOptRC == 2 )
      {
         nRC = 2;  // do the "error" redirection
         session.setAttribute( "ZeidonError", "Y" );
         break;
      }

      // Dynamic Next Window
      nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strDialogName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "DialogName" );
         strWindowName = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "WindowName" );
         strNextJSP_Name = strDialogName + strWindowName + ".jsp";
         vKZXMLPGO.cursor( "NextDialogWindow" ).deleteEntity( CursorPosition.NEXT );
         strURL = response.encodeRedirectURL( strNextJSP_Name );
         nRC = vKZXMLPGO.cursor( "NextDialogWindow" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
            strFunctionCall = vKZXMLPGO.cursor( "NextDialogWindow" ).getStringFromAttribute( "FunctionCall" );
         else
            strFunctionCall = "";

         if ( strFunctionCall != null && StringUtils.equals( strFunctionCall, "StartSubwindow" ) )
         {
            vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCDirectionsForUseSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wStartUpUserLogin.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wMLCDirectionsForUseSection" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wMLCDirectionsForUseSection" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLCDirectionsForUseSection.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLCDirectionsForUseSection.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLCDirectionsForUseSection.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLCDirectionsForUseSection.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection.jsp", "wMLC.InitDirectionsUseSect" );
   nOptRC = wMLC.InitDirectionsUseSect( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getStringFromAttribute( "WebReturnMessage" );
      strURLParameters = "?CallingPage=wMLCDirectionsForUseSection.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wMLC" +
                         "&OperationName=" + "InitDirectionsUseSect";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wMLC", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getStringFromAttribute( "BannerName" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

%>

<html>
<head>

<title>Directions for Use Section</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/validations.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/md5.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/tabpane.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wMLCDirectionsForUseSection.js"></script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<%@ include file="./include/pagebackground.inc" %>  <!-- just temporary until we get the painter dialog updates from Kelly ... 2011.10.08 dks -->

<div id="wrapper">

<jsp:include page='<%=strBannerName %>' />

<!-- Main Navigation *********************** -->
<div id="mainnavigation">
   <ul>
       <li id="lmProductManagement" name="lmProductManagement"><a href="#" onclick="mProductManagement()">Products</a></li>
       <li id="lmSubregistrants" name="lmSubregistrants"><a href="#" onclick="mSubregistrants()">Subregistrants</a></li>
       <li id="lmTrackingNotificationCompliance" name="lmTrackingNotificationCompliance"><a href="#" onclick="mTrackingNotificationCompliance()">Tracking/Notification/Compliance</a></li>
       <li id="lmStateRegistrations" name="lmStateRegistrations"><a href="#" onclick="mStateRegistrations()">State Registrations</a></li>
       <li id="lmMarketingFulfillment" name="lmMarketingFulfillment"><a href="#" onclick="mMarketingFulfillment()">Marketing/Fulfillment</a></li>
       <li id="lmWebDevelopment" name="lmWebDevelopment"><a href="#" onclick="mWebDevelopment()">Web Development</a></li>
       <li id="lmAdministration" name="lmAdministration"><a href="#" onclick="mAdministration()">Company Profile</a></li>
       <li id="lmLogin" name="lmLogin"><a href="#" onclick="mLogin()">Login</a></li>
       <li id="lmLogout" name="lmLogout"><a href="#" onclick="mLogout()">Logout</a></li>
   </ul>
</div>  <!-- end Navigation Bar -->

<%@include file="./include/topmenuend.inc" %>
<div id="maincontent">

<div id="leftcontent">

<!-- Side Navigation *********************** -->
<div id="sidenavigation">
   <ul>
<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SaveAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smAcceptDirectionsUseSect( )">Save and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smCancelDirectionsUseSect( )">Cancel and Return</a></li>
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


<form name="wMLCDirectionsForUseSection" id="wMLCDirectionsForUseSection" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View mEPA = null;
   View mMasLC = null;
   View mMasProd = null;
   View mPrimReg = null;
   View mSubLC = null;
   View mSubProd = null;
   View wMLCList = null;
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

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getStringFromAttribute( "SolicitSaveFlag" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "DirectionsForUseSection" );
   strOpenFile = VmlOperation.FindOpenFile( task );
   strDateFormat = "MM/DD/YYYY";

%>

   <input name="zFocusCtrl" id="zFocusCtrl" type="hidden" value="<%=strFocusCtrl%>">
   <input name="zOpenFile" id="zOpenFile" type="hidden" value="<%=strOpenFile%>">
   <input name="zDateFormat" id="zDateFormat" type="hidden" value="<%=strDateFormat%>">
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
<% /* DirectionsForUseSection:GroupBox */ %>

<div id="DirectionsForUseSection" name="DirectionsForUseSection" class="withborder" style="width:780px;height:194px;float:left;">  <!-- DirectionsForUseSection --> 

<div  id="DirectionsForUseSection" name="DirectionsForUseSection" >Directions for Use Section</div>

 <!-- This is added as a line spacer -->
<div style="height:18px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>
<div id="GroupBox2" name="GroupBox2" style="float:left;width:754px;" >

<table cols=2 style="width:754px;"  class="grouptable">

<tr>
<td valign="top" style="width:136px;">
<% /* DirectionsUseTitle::Text */ %>

<span  id="DirectionsUseTitle:" name="DirectionsUseTitle:" style="width:130px;height:16px;">Title:</span>

</td>
<td valign="top"  class="text12" style="width:584px;">
<% /* DirectionsUseTitle:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "DirectionsUseTitle", strError );
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
         task.log( ).debug( "Invalid View: " + "DirectionsUseTitle" );
      else
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mMasLC.cursor( "M_DirectionsForUseSection" ).getStringFromAttribute( "Title", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on DirectionsUseTitle: " + e.getMessage());
               task.log().info( "*** Error on ctrl DirectionsUseTitle" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_DirectionsForUseSection.Title: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mMasLC.M_DirectionsForUseSection" );
      }
   }
%>

<input class="text12" name="DirectionsUseTitle" id="DirectionsUseTitle" style="width:584px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* Subtitle::Text */ %>

<span  id="Subtitle:" name="Subtitle:" style="width:130px;height:16px;">Subtitle:</span>

</td>
<td valign="top"  class="text12" style="width:584px;">
<% /* Subtitle:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Subtitle", strError );
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
         task.log( ).debug( "Invalid View: " + "Subtitle" );
      else
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mMasLC.cursor( "M_DirectionsForUseSection" ).getStringFromAttribute( "Subtitle", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Subtitle: " + e.getMessage());
               task.log().info( "*** Error on ctrl Subtitle" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_DirectionsForUseSection.Subtitle: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mMasLC.M_DirectionsForUseSection" );
      }
   }
%>

<input class="text12" name="Subtitle" id="Subtitle" style="width:584px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:136px;">
<% /* NoteToReviewer::Text */ %>

<span  id="NoteToReviewer:" name="NoteToReviewer:" style="width:130px;height:16px;">Note to Reviewer:</span>

</td>
<td valign="top" style="width:584px;">
<% /* NoteToReviewer:MLEdit */ %>
<%
   // MLEdit: NoteToReviewer
   strErrorMapValue = VmlOperation.CheckError( "NoteToReviewer", strError );
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
         task.log( ).debug( "Invalid View: " + "NoteToReviewer" );
      else
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasLC.cursor( "M_DirectionsForUseSection" ).getStringFromAttribute( "ReviewerNote", "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_DirectionsForUseSection.ReviewerNote: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mMasLC.M_DirectionsForUseSection" );
      }
   }
%>

<textarea id="NoteToReviewer" name="NoteToReviewer" class="" style="width:584px;height:86px;border:solid;border-width:4px;border-style:groove;" wrap="wrap"><%=strErrorMapValue%></textarea>

</td>
</tr>
</table>

</div>  <!-- GroupBox2 --> 

</div>  <!-- End of a new line -->


</div>  <!--  DirectionsForUseSection --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBDirectionsUseStatements:GroupBox */ %>

<div id="GBDirectionsUseStatements" name="GBDirectionsUseStatements" style="width:780px;float:left;">  <!-- GBDirectionsUseStatements --> 


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:624px;height:30px;float:left;">  <!-- GroupBox3 --> 


</div>  <!--  GroupBox3 --> 
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4" style="width:112px;height:30px;float:left;">  <!-- GroupBox4 --> 


<div>  <!-- Beginning of a new line -->
<span style="height:26px;">&nbsp&nbsp</span>
<% /* New:PushBtn */ %>
<button type="button" class="formStylebutton" name="New" id="New" value="" onclick="GOTO_DirsForUseStatementAdd( )" style="width:78px;height:26px;">New</button>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox4 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridDirectionsUse:Grid */ %>
<div class="tableScroll"  style="width:730px;height:104px;">

<table name="GridDirectionsUse" id="GridDirectionsUse" cellspacing=0  cols=5  >

<thead><tr>

   <th>Statement Text</th>
   <th>Update</th>
   <th>Delete</th>
   <th>Move Up</th>
   <th>Move Down</th>

</tr></thead>

<tbody height="54px;">

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
      String strBMBUpdateDirectionsUseStatement;
      String strBMBDeleteDirectionsUseStatement;
      String strBMBMoveDirectionsUseStatementUp;
      String strBMBMoveDirectionsUseStateDown;
      
      View vGridDirectionsUse;
      vGridDirectionsUse = mMasLC.newView( );
      csrRC2 = vGridDirectionsUse.cursor( "M_DirectionsForUseStatement" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridDirectionsUse.cursor( "M_DirectionsForUseStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridEditDirectionsUse = "";
         nRC = vGridDirectionsUse.cursor( "M_DirectionsForUseStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditDirectionsUse = vGridDirectionsUse.cursor( "M_DirectionsForUseStatement" ).getStringFromAttribute( "Text", "" );

            if ( strGridEditDirectionsUse == null )
               strGridEditDirectionsUse = "";
         }

         if ( StringUtils.isBlank( strGridEditDirectionsUse ) )
            strGridEditDirectionsUse = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="GOTO_DirsForUseStatementUpdate( this.id )" id="GridEditDirectionsUse::<%=strEntityKey%>"><%=strGridEditDirectionsUse%></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdateDirectionsUseStatement" onclick="GOTO_DirsForUseStatementUpdate( this.id )" id="BMBUpdateDirectionsUseStatement::<%=strEntityKey%>"><img src="./images/ePammsUpdate.jpg" alt="Update"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBDeleteDirectionsUseStatement" onclick="SelectDirectionsUseStmtForDelete( this.id )" id="BMBDeleteDirectionsUseStatement::<%=strEntityKey%>"><img src="./images/ePammsDelete.jpg" alt="Delete"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBMoveDirectionsUseStatementUp" onclick="MoveDirectionsUseStmtUp( this.id )" id="BMBMoveDirectionsUseStatementUp::<%=strEntityKey%>"><img src="./images/ePammsUp.jpg" alt="Move Up"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBMoveDirectionsUseStateDown" onclick="MoveDirectionsUseStmtDown( this.id )" id="BMBMoveDirectionsUseStateDown::<%=strEntityKey%>"><img src="./images/ePammsDown.jpg" alt="Move Down"></a></td>

</tr>

<%
         csrRC2 = vGridDirectionsUse.cursor( "M_DirectionsForUseStatement" ).setNextContinue( );
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

</div>

</div>  <!-- End of a new line -->


</div>  <!--  GBDirectionsUseStatements --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:20px;float:left;"></div>   <!-- Width Spacer -->
<% /* TabACS:Tab */ %>

<div id="TabACS" class="tab-pane withborder" style="width:752px;"> <!-- Beginning of Tab Control TabACS -->
<script type="text/javascript">TabACS = new WebFXTabPane( document.getElementById( "TabACS" ) );</script>

<div id="TabAreasOfUse" class="tab-page " > <!-- Tab item TabAreasOfUse -->
<h2 class="tab"><span>Areas Of Use</span></h2>
<script type="text/javascript">TabACS.addTabPage( document.getElementById( "TabAreasOfUse" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* DirectionsAreasOfUseStatements:GroupBox */ %>

<div id="DirectionsAreasOfUseStatements" name="DirectionsAreasOfUseStatements" style="width:710px;height:308px;float:left;">  <!-- DirectionsAreasOfUseStatements --> 

<div  id="DirectionsAreasOfUseStatements" name="DirectionsAreasOfUseStatements" >Directions for Use:  Areas of Use Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* HTSelectAllAreasOfUse:Text */ %>

<a href="#" id="HTSelectAllAreasOfUse" name="HTSelectAllAreasOfUse"  onclick="GOTO_SelectRemoveAreasOfUse( );" style="width:162px;height:16px;">Select/Remove Entries</a>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridAreasOfUse:Grid */ %>
<div class="tableScroll"  style="height:262px;">

<table name="GridAreasOfUse" id="GridAreasOfUse" cellspacing=0  cols=1  >

<thead><tr>

   <th>Area</th>

</tr></thead>

<tbody height="212px;">

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
      String strGridEditAreasOfUse;
      
      View vGridAreasOfUse;
      vGridAreasOfUse = mMasLC.newView( );
      csrRC2 = vGridAreasOfUse.cursor( "DirectionsAreasOfUse" ).setFirst( "M_DirectionsForUseSection" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridAreasOfUse.cursor( "DirectionsAreasOfUse" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridEditAreasOfUse = "";
         nRC = vGridAreasOfUse.cursor( "M_DirectionsUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditAreasOfUse = vGridAreasOfUse.cursor( "M_DirectionsUsage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditAreasOfUse == null )
               strGridEditAreasOfUse = "";
         }

         if ( StringUtils.isBlank( strGridEditAreasOfUse ) )
            strGridEditAreasOfUse = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGridEditAreasOfUse%></td>

</tr>

<%
         csrRC2 = vGridAreasOfUse.cursor( "DirectionsAreasOfUse" ).setNextContinue( );
      }
      vGridAreasOfUse.drop( );
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

</div>  <!-- End of a new line -->


</div>  <!--  DirectionsAreasOfUseStatements --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabAreasOfUse -->

<div id="TabTypesSurfaces" class="tab-page " > <!-- Tab item TabTypesSurfaces -->
<h2 class="tab"><span>Types of Surfaces</span></h2>
<script type="text/javascript">TabACS.addTabPage( document.getElementById( "TabTypesSurfaces" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* DirectionsTypesSurfaces:GroupBox */ %>

<div id="DirectionsTypesSurfaces" name="DirectionsTypesSurfaces" style="width:710px;height:308px;float:left;">  <!-- DirectionsTypesSurfaces --> 

<div  id="DirectionsTypesSurfaces" name="DirectionsTypesSurfaces" >Directions for Use:  Types of Surfaces Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:34px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridSurfaces:Grid */ %>
<div class="tableScroll"  style="height:262px;">

<table name="GridSurfaces" id="GridSurfaces" cellspacing=0  cols=1  >

<thead><tr>

   <th>Surface</th>

</tr></thead>

<tbody height="212px;">

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
      String strGridEditSurface;
      
      View vGridSurfaces;
      vGridSurfaces = mMasLC.newView( );
      csrRC2 = vGridSurfaces.cursor( "DirectionsSurface" ).setFirst( "M_DirectionsForUseSection" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridSurfaces.cursor( "DirectionsSurface" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridEditSurface = "";
         nRC = vGridSurfaces.cursor( "M_DirectionsUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditSurface = vGridSurfaces.cursor( "M_DirectionsUsage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditSurface == null )
               strGridEditSurface = "";
         }

         if ( StringUtils.isBlank( strGridEditSurface ) )
            strGridEditSurface = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGridEditSurface%></td>

</tr>

<%
         csrRC2 = vGridSurfaces.cursor( "DirectionsSurface" ).setNextContinue( );
      }
      vGridSurfaces.drop( );
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

</div>  <!-- End of a new line -->


</div>  <!--  DirectionsTypesSurfaces --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabTypesSurfaces -->

<div id="TabAppTypes" class="tab-page " > <!-- Tab item TabAppTypes -->
<h2 class="tab"><span>Application Types</span></h2>
<script type="text/javascript">TabACS.addTabPage( document.getElementById( "TabAppTypes" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* DirectionsAppTypes:GroupBox */ %>

<div id="DirectionsAppTypes" name="DirectionsAppTypes" style="width:710px;height:308px;float:left;">  <!-- DirectionsAppTypes --> 

<div  id="DirectionsAppTypes" name="DirectionsAppTypes" >Directions for Use:  Application Types Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:34px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridAppTypes:Grid */ %>
<div class="tableScroll"  style="height:262px;">

<table name="GridAppTypes" id="GridAppTypes" cellspacing=0  cols=1  >

<thead><tr>

   <th>Application Types</th>

</tr></thead>

<tbody height="212px;">

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
      String strGridEditAppType;
      
      View vGridAppTypes;
      vGridAppTypes = mMasLC.newView( );
      csrRC2 = vGridAppTypes.cursor( "DirectionsAppType" ).setFirst( "M_DirectionsForUseSection" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridAppTypes.cursor( "DirectionsAppType" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridEditAppType = "";
         nRC = vGridAppTypes.cursor( "M_DirectionsUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditAppType = vGridAppTypes.cursor( "M_DirectionsUsage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditAppType == null )
               strGridEditAppType = "";
         }

         if ( StringUtils.isBlank( strGridEditAppType ) )
            strGridEditAppType = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGridEditAppType%></td>

</tr>

<%
         csrRC2 = vGridAppTypes.cursor( "DirectionsAppType" ).setNextContinue( );
      }
      vGridAppTypes.drop( );
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

</div>  <!-- End of a new line -->


</div>  <!--  DirectionsAppTypes --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabAppTypes -->

<div id="TabBacteria" class="tab-page " > <!-- Tab item TabBacteria -->
<h2 class="tab"><span>Bacteria</span></h2>
<script type="text/javascript">TabACS.addTabPage( document.getElementById( "TabBacteria" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* DirectionsBacteriaStatements:GroupBox */ %>

<div id="DirectionsBacteriaStatements" name="DirectionsBacteriaStatements" style="width:710px;height:308px;float:left;">  <!-- DirectionsBacteriaStatements --> 

<div  id="DirectionsBacteriaStatements" name="DirectionsBacteriaStatements" >Directions for Use:  Bacteria Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:34px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridBacteria:Grid */ %>
<div class="tableScroll"  style="height:262px;">

<table name="GridBacteria" id="GridBacteria" cellspacing=0  cols=1  >

<thead><tr>

   <th>Bacteria</th>

</tr></thead>

<tbody height="212px;">

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
      String strGridEditBacteria;
      
      View vGridBacteria;
      vGridBacteria = mMasLC.newView( );
      csrRC2 = vGridBacteria.cursor( "DirectionsBacteria" ).setFirst( "M_DirectionsForUseSection" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridBacteria.cursor( "DirectionsBacteria" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridEditBacteria = "";
         nRC = vGridBacteria.cursor( "M_DirectionsUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditBacteria = vGridBacteria.cursor( "M_DirectionsUsage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditBacteria == null )
               strGridEditBacteria = "";
         }

         if ( StringUtils.isBlank( strGridEditBacteria ) )
            strGridEditBacteria = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGridEditBacteria%></td>

</tr>

<%
         csrRC2 = vGridBacteria.cursor( "DirectionsBacteria" ).setNextContinue( );
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

</div>

</div>  <!-- End of a new line -->


</div>  <!--  DirectionsBacteriaStatements --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabBacteria -->

<div id="TabFungi" class="tab-page " > <!-- Tab item TabFungi -->
<h2 class="tab"><span>Fungi</span></h2>
<script type="text/javascript">TabACS.addTabPage( document.getElementById( "TabFungi" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* DirectionsFungiStatements:GroupBox */ %>

<div id="DirectionsFungiStatements" name="DirectionsFungiStatements" style="width:710px;height:308px;float:left;">  <!-- DirectionsFungiStatements --> 

<div  id="DirectionsFungiStatements" name="DirectionsFungiStatements" >Directions for Use:  Fungi Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:34px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridFungi:Grid */ %>
<div class="tableScroll"  style="height:262px;">

<table name="GridFungi" id="GridFungi" cellspacing=0  cols=1  >

<thead><tr>

   <th>Fungi</th>

</tr></thead>

<tbody height="212px;">

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
      String strGridEditFungi;
      
      View vGridFungi;
      vGridFungi = mMasLC.newView( );
      csrRC2 = vGridFungi.cursor( "DirectionsFungi" ).setFirst( "M_DirectionsForUseSection" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridFungi.cursor( "DirectionsFungi" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridEditFungi = "";
         nRC = vGridFungi.cursor( "M_DirectionsUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditFungi = vGridFungi.cursor( "M_DirectionsUsage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditFungi == null )
               strGridEditFungi = "";
         }

         if ( StringUtils.isBlank( strGridEditFungi ) )
            strGridEditFungi = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGridEditFungi%></td>

</tr>

<%
         csrRC2 = vGridFungi.cursor( "DirectionsFungi" ).setNextContinue( );
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

</div>

</div>  <!-- End of a new line -->


</div>  <!--  DirectionsFungiStatements --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabFungi -->

<div id="TabViruses" class="tab-page " > <!-- Tab item TabViruses -->
<h2 class="tab"><span>Viruses</span></h2>
<script type="text/javascript">TabACS.addTabPage( document.getElementById( "TabViruses" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* DirectionsVirusesStatements:GroupBox */ %>

<div id="DirectionsVirusesStatements" name="DirectionsVirusesStatements" style="width:710px;height:308px;float:left;">  <!-- DirectionsVirusesStatements --> 

<div  id="DirectionsVirusesStatements" name="DirectionsVirusesStatements" >Directions for Use:  Viruses Statements</div>

 <!-- This is added as a line spacer -->
<div style="height:36px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridViruses:Grid */ %>
<div class="tableScroll"  style="height:262px;">

<table name="GridViruses" id="GridViruses" cellspacing=0  cols=1  >

<thead><tr>

   <th>Virus</th>

</tr></thead>

<tbody height="212px;">

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
      String strGridEditVirus;
      
      View vGridViruses;
      vGridViruses = mMasLC.newView( );
      csrRC2 = vGridViruses.cursor( "DirectionsViruses" ).setFirst( "M_DirectionsForUseSection" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridViruses.cursor( "DirectionsViruses" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridEditVirus = "";
         nRC = vGridViruses.cursor( "M_DirectionsUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditVirus = vGridViruses.cursor( "M_DirectionsUsage" ).getStringFromAttribute( "Name", "" );

            if ( strGridEditVirus == null )
               strGridEditVirus = "";
         }

         if ( StringUtils.isBlank( strGridEditVirus ) )
            strGridEditVirus = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGridEditVirus%></td>

</tr>

<%
         csrRC2 = vGridViruses.cursor( "DirectionsViruses" ).setNextContinue( );
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

</div>

</div>  <!-- End of a new line -->


</div>  <!--  DirectionsVirusesStatements --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabViruses -->

</div> <!-- End of Tab Control TabACS -->

<script type="text/javascript">setupAllTabs( );</script>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:230px;width:100px;"></div>

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
</html>
<%
   session.setAttribute( "ZeidonWindow", "wMLCDirectionsForUseSection" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
