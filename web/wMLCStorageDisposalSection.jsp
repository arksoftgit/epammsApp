<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- wMLCStorageDisposalSection --%>

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
      // EditBox: Title
      nRC = mMasLC.cursor( "M_StorageDisposalSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Title" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Title", "", strMapValue );
            else
               mMasLC.cursor( "M_StorageDisposalSection" ).setAttribute( "Title", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Title", e.getReason( ), strMapValue );
         }
      }

      // EditBox: Subtitle
      nRC = mMasLC.cursor( "M_StorageDisposalSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Subtitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Subtitle", "", strMapValue );
            else
               mMasLC.cursor( "M_StorageDisposalSection" ).setAttribute( "Subtitle", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Subtitle", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ContainerVolume
      nRC = mMasLC.cursor( "M_StorageDisposalSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hContainerVolume" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ContainerVolume", "", strMapValue );
            else
               mMasLC.cursor( "M_StorageDisposalSection" ).setAttribute( "ContainerVolume", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ContainerVolume", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: SectionType
      nRC = mMasLC.cursor( "M_StorageDisposalSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hSectionType" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "SectionType", "", strMapValue );
            else
               mMasLC.cursor( "M_StorageDisposalSection" ).setAttribute( "SDSectionType", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "SectionType", e.getReason( ), strMapValue );
         }
      }

      // MLEdit: NoteToReviewer
      nRC = mMasLC.cursor( "M_StorageDisposalSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "NoteToReviewer" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "NoteToReviewer", "", strMapValue );
            else
               mMasLC.cursor( "M_StorageDisposalSection" ).setAttribute( "ReviewerNote", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "NoteToReviewer", e.getReason( ), strMapValue );
         }
      }

      // Grid: GridStorDisp
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_StorageDisposalStatement" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_StorageDisposalStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_StorageDisposalStatement" ).setNextContinue( );
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

if ( strLastWindow.equals("wMLCStorageDisposalSection") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wMLCStorageDisposalSection strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLCStorageDisposalSection LastWindow *** " + strLastWindow );
task.log().info("*** wMLCStorageDisposalSection LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptStorDispSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.AcceptStorDispSect" );
      try
      {
         nOptRC = wMLC.AcceptStorDispSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation AcceptStorDispSect: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
         }

         nRC = 1;  // do the redirection
         break;
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
         strLastPage = "wMLCStorageDisposalSection.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CleanStorDispStmtHTML" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

   // Javascript code entered by user.
      nRC = DoInputMapping( request, session, application, true );
      String str = request.getParameter( "NoteToReviewer" );
      str = wMLC.SanitizeHTML( str, "", "" );
      VmlOperation.ReplaceMessage( task, "NoteToReviewer", "", str, false );
      str = request.getParameter( "MandatoryExclusiveStmt1" );
      str = wMLC.SanitizeHTML( str, "", "" );
      VmlOperation.ReplaceMessage( task, "MandatoryExclusiveStmt1", "", str, false );
      str = request.getParameter( "MandatoryExclusiveStmt2" );
      str = wMLC.SanitizeHTML( str, "", "" );
      VmlOperation.ReplaceMessage( task, "MandatoryExclusiveStmt2", "", str, false );
      if ( nRC != 0 )
         break;

   // END of Javascript code entered by user.

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.CleanStorDispStmtHTML" );
      try
      {
         nOptRC = wMLC.CleanStorDispStmtHTML( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CleanStorDispStmtHTML: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelStorDispSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.CancelStorDispSect" );
      try
      {
         nOptRC = wMLC.CancelStorDispSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CancelStorDispSect: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
         }

         nRC = 1;  // do the redirection
         break;
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
         strLastPage = "wMLCStorageDisposalSection.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectStorDispStmtForDelete" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_StorageDisposalStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_StorageDisposalStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_StorageDisposalStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_StorageDisposalStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.SelectStorDispStmtForDelete" );
      try
      {
         nOptRC = wMLC.SelectStorDispStmtForDelete( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SelectStorDispStmtForDelete: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCDeleteStorageDisposalStatement.jsp" );
      vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
      vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ShowHideEditorNoteToReviewer" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ShowHideEditorMandatory1" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ShowHideEditorMandatory2" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "MoveStorDispStmtDown" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_StorageDisposalStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_StorageDisposalStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_StorageDisposalStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_StorageDisposalStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.MoveStorDispStmtDown" );
      try
      {
         nOptRC = wMLC.MoveStorDispStmtDown( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation MoveStorDispStmtDown: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wMLCStorageDisposalSection.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "MoveStorDispStmtUp" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_StorageDisposalStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_StorageDisposalStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_StorageDisposalStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_StorageDisposalStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.MoveStorDispStmtUp" );
      try
      {
         nOptRC = wMLC.MoveStorDispStmtUp( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation MoveStorDispStmtUp: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wMLCStorageDisposalSection.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "InitStorDispStmtForInsert" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.InitStorDispStmtForInsert" );
      try
      {
         nOptRC = wMLC.InitStorDispStmtForInsert( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation InitStorDispStmtForInsert: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCStorageDisposalStatement.jsp" );
      vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
      vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SaveAddNewStorDispSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.SaveAddNewStorDispSect" );
      try
      {
         nOptRC = wMLC.SaveAddNewStorDispSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SaveAddNewStorDispSect: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wMLCStorageDisposalSection.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectStorDispStmtForUpdate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_StorageDisposalStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_StorageDisposalStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_StorageDisposalStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_StorageDisposalStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.SelectStorDispStmtForUpdate" );
      try
      {
         nOptRC = wMLC.SelectStorDispStmtForUpdate( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SelectStorDispStmtForUpdate: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCStorageDisposalStatement.jsp" );
      vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
      vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAcceptStorDispSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.AcceptStorDispSect" );
      try
      {
         nOptRC = wMLC.AcceptStorDispSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation AcceptStorDispSect: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
         }

         nRC = 1;  // do the redirection
         break;
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
         strLastPage = "wMLCStorageDisposalSection.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveAddNewStorDispSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.SaveAddNewStorDispSect" );
      try
      {
         nOptRC = wMLC.SaveAddNewStorDispSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SaveAddNewStorDispSect: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wMLCStorageDisposalSection.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelStorDispSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.CancelStorDispSect" );
      try
      {
         nOptRC = wMLC.CancelStorDispSect( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CancelStorDispSect: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
         }

         nRC = 1;  // do the redirection
         break;
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
         strLastPage = "wMLCStorageDisposalSection.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mProductManagement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wStartUp.ProductManagement" );
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wStartUp.SubregistrantManagement" );
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wStartUp.TrackingNotificationCompliance" );
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wStartUp.StateRegistrations" );
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wStartUp.MarketingFulfillment" );
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wStartUp.WebDevelopment" );
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wStartUp.PrimaryRegistrantCompanySetup" );
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wStartUp.ProcessLogin" );
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLCStorageDisposalSection" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wMLCStorageDisposalSection" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wMLCStorageDisposalSection" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCStorageDisposalSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLCStorageDisposalSection.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLCStorageDisposalSection.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLCStorageDisposalSection.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLCStorageDisposalSection.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCStorageDisposalSection.jsp", "wMLC.InitStorDispSectForDelete" );
   nOptRC = wMLC.InitStorDispSectForDelete( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getStringFromAttribute( "WebReturnMessage" );
      strURLParameters = "?CallingPage=wMLCStorageDisposalSection.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wMLC" +
                         "&OperationName=" + "InitStorDispSectForDelete";
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

<title>Storage and Disposal Section</title>

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

<!-- TinyMCE -->
<script language="JavaScript" type="text/javascript" src="./js/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/TinyMCE.js"></script>
<!-- /TinyMCE -->

<script language="JavaScript" type="text/javascript" src="./genjs/wMLCStorageDisposalSection.js"></script>

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
       <li><a href="#"  onclick="smAcceptStorDispSect( )">Save and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SaveAddNew" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smSaveAddNewStorDispSect( )">Save and Add New</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smCancelStorDispSect( )">Cancel and Return</a></li>
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


<form name="wMLCStorageDisposalSection" id="wMLCStorageDisposalSection" method="post">
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "StorageDisposalSection" );
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
<div style="height:26px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* StorDispSection:GroupBox */ %>

<div id="StorDispSection" name="StorDispSection" class="withborder" style="width:750px;height:254px;float:left;">  <!-- StorDispSection --> 

<div  id="StorDispSection" name="StorDispSection" >Storage and Disposal Section</div>

 <!-- This is added as a line spacer -->
<div style="height:28px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Title::Text */ %>

<span  id="Title:" name="Title:" style="width:130px;height:16px;">Title:</span>

<span style="height:16px;">&nbsp&nbsp</span>
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
         nRC = mMasLC.cursor( "M_StorageDisposalSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mMasLC.cursor( "M_StorageDisposalSection" ).getStringFromAttribute( "Title", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Title: " + e.getMessage());
               task.log().info( "*** Error on ctrl Title" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_StorageDisposalSection.Title: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mMasLC.M_StorageDisposalSection" );
      }
   }
%>

<input class="text12" name="Title" id="Title" style="width:560px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Subtitle::Text */ %>

<span  id="Subtitle:" name="Subtitle:" style="width:130px;height:16px;">Subtitle:</span>

<span style="height:16px;">&nbsp&nbsp</span>
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
         nRC = mMasLC.cursor( "M_StorageDisposalSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mMasLC.cursor( "M_StorageDisposalSection" ).getStringFromAttribute( "Subtitle", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Subtitle: " + e.getMessage());
               task.log().info( "*** Error on ctrl Subtitle" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_StorageDisposalSection.Subtitle: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mMasLC.M_StorageDisposalSection" );
      }
   }
%>

<input class="text12" name="Subtitle" id="Subtitle" style="width:560px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* ContainerVolume::Text */ %>

<span  id="ContainerVolume:" name="ContainerVolume:" style="width:130px;height:16px;">Container Volume:</span>

<span style="height:78px;">&nbsp&nbsp</span>
<% /* ContainerVolume:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select class="text12" name="ContainerVolume" id="ContainerVolume" size="1" style="width:162px;" onchange="ContainerVolumeOnChange( )">

<%
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mMasLC , "M_StorageDisposalSection", "ContainerVolume", "" );

      nRC = mMasLC.cursor( "M_StorageDisposalSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mMasLC.cursor( "M_StorageDisposalSection" ).getStringFromAttribute( "ContainerVolume", "" );
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
   }  // if view != null
%>
</select>

<input name="hContainerVolume" id="hContainerVolume" type="hidden" value="<%=strComboCurrentValue%>" >
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* SectionType::Text */ %>

<span  id="SectionType:" name="SectionType:" style="width:130px;height:16px;">SectionType:</span>

<span style="height:78px;">&nbsp&nbsp</span>
<% /* SectionType:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select class="text12" name="SectionType" id="SectionType" size="1" style="width:162px;" onchange="SectionTypeOnChange( )">

<%
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mMasLC , "M_StorageDisposalSection", "SDSectionType", "" );

      nRC = mMasLC.cursor( "M_StorageDisposalSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mMasLC.cursor( "M_StorageDisposalSection" ).getStringFromAttribute( "SDSectionType", "" );
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
   }  // if view != null
%>
</select>

<input name="hSectionType" id="hSectionType" type="hidden" value="<%=strComboCurrentValue%>" >
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* NoteToReviewer::Text */ %>

<span  id="NoteToReviewer:" name="NoteToReviewer:" style="width:130px;height:16px;">Note to Reviewer:</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:152px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" style="width:584px;height:86px;float:left;">  <!-- GroupBox2 --> 


<div>  <!-- Beginning of a new line -->
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
         task.log( ).info( "Invalid View: " + "NoteToReviewer" );
      else
      {
         nRC = mMasLC.cursor( "M_StorageDisposalSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasLC.cursor( "M_StorageDisposalSection" ).getStringFromAttribute( "ReviewerNote", "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "M_StorageDisposalSection.ReviewerNote: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist: " + "mMasLC.M_StorageDisposalSection" );
      }
   }
%>

<textarea name="NoteToReviewer" id="NoteToReviewer" class="mceSimple" style="width:576px;height:86px;border:solid;border-width:4px;border-style:groove;"><%=strErrorMapValue%></textarea>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox2 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<span style="height:22px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* BtnNote:BitmapBtn */ %>
<img src=".\images\tinymce.png" name="BtnNote" id="BtnNote" onclick="ShowHideEditorNoteToReviewer( )" style="width:22px;height:22px;" title="Note to Reviewer Show/Hide Editor"  alt="Note to Reviewer Show/Hide Editor" >

</div>  <!-- End of a new line -->


</div>  <!--  StorDispSection --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBStorageAndDisposalStatements:GroupBox */ %>

<div id="GBStorageAndDisposalStatements" name="GBStorageAndDisposalStatements" class="listgroup" style="width:732px;height:270px;float:left;">  <!-- GBStorageAndDisposalStatements --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* StorageAndDisposalStatements:Text */ %>

<span class="listheader"  id="StorageAndDisposalStatements" name="StorageAndDisposalStatements" style="width:250px;height:16px;">Storage and Disposal Statements</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<span style="height:26px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* New:PushBtn */ %>
<button type="button" class="newbutton" name="New" id="New" value="" onclick="InitStorDispStmtForInsert( )" style="width:78px;height:26px;">New</button>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridStorDisp:Grid */ %>
<div class="tableScroll"  style="height:220px;">

<table name="GridStorDisp" id="GridStorDisp" cellspacing=0  cols=5  >

<thead><tr>

   <th>Statement Title/Text</th>
   <th>Update</th>
   <th>Delete</th>
   <th>Move Up</th>
   <th>Move Down</th>

</tr></thead>

<tbody height="170px;">

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
      String strGridEditStorDisp;
      String strBMBUpdateStorDispStmt;
      String strBMBDeleteStorDispStmt;
      String strBMBMoveStorDispStmtUp;
      String strBMBMoveStorDispStateDown;
      
      View vGridStorDisp;
      vGridStorDisp = mMasLC.newView( );
      csrRC2 = vGridStorDisp.cursor( "M_StorageDisposalStatement" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridStorDisp.cursor( "M_StorageDisposalStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridEditStorDisp = "";
         nRC = vGridStorDisp.cursor( "M_StorageDisposalStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditStorDisp = vGridStorDisp.cursor( "M_StorageDisposalStatement" ).getStringFromAttribute( "TitleText", "" );

            if ( strGridEditStorDisp == null )
               strGridEditStorDisp = "";
         }

         if ( StringUtils.isBlank( strGridEditStorDisp ) )
            strGridEditStorDisp = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="SelectStorDispStmtForUpdate( this.id )" id="GridEditStorDisp::<%=strEntityKey%>"><%=strGridEditStorDisp%></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdateStorDispStmt" onclick="SelectStorDispStmtForUpdate( this.id )" id="BMBUpdateStorDispStmt::<%=strEntityKey%>"><img src="./images/ePammsUpdate.jpg" alt="Update"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBDeleteStorDispStmt" onclick="SelectStorDispStmtForDelete( this.id )" id="BMBDeleteStorDispStmt::<%=strEntityKey%>"><img src="./images/ePammsDelete.jpg" alt="Delete"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBMoveStorDispStmtUp" onclick="MoveStorDispStmtUp( this.id )" id="BMBMoveStorDispStmtUp::<%=strEntityKey%>"><img src="./images/ePammsUp.jpg" alt="Move Up"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBMoveStorDispStateDown" onclick="MoveStorDispStmtDown( this.id )" id="BMBMoveStorDispStateDown::<%=strEntityKey%>"><img src="./images/ePammsDown.jpg" alt="Move Down"></a></td>

</tr>

<%
         csrRC2 = vGridStorDisp.cursor( "M_StorageDisposalStatement" ).setNextContinue( );
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

</div>

</div>  <!-- End of a new line -->


</div>  <!--  GBStorageAndDisposalStatements --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:38px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4" style="width:40px;height:24px;float:left;">  <!-- GroupBox4 --> 


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
   session.setAttribute( "ZeidonWindow", "wMLCStorageDisposalSection" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
