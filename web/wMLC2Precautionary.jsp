<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- wMLC2Precautionary --%>

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
      // EditBox: PrecautionaryTitle
      nRC = mMasLC.cursor( "M_GeneralSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PrecautionaryTitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "PrecautionaryTitle", "", strMapValue );
            else
               mMasLC.cursor( "M_GeneralSection" ).setAttribute( "Title", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "PrecautionaryTitle", e.getReason( ), strMapValue );
         }
      }

      // EditBox: PrecautionarySubtitle
      nRC = mMasLC.cursor( "M_GeneralSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PrecautionarySubtitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "PrecautionarySubtitle", "", strMapValue );
            else
               mMasLC.cursor( "M_GeneralSection" ).setAttribute( "Subtitle", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "PrecautionarySubtitle", e.getReason( ), strMapValue );
         }
      }

      // Grid: GridPrecautionary
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_GeneralStatement" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_GeneralStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_GeneralStatement" ).setNextContinue( );
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

if ( strLastWindow.equals("wMLC2Precautionary") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wMLC2_Dialog wMLC2 = new wMLC2_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wMLC2Precautionary strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLC2Precautionary LastWindow *** " + strLastWindow );
task.log().info("*** wMLC2Precautionary LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_AddPrecautionaryStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Auto Object Function
      nRC = 0;
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_PrecautionaryStatement" );
      cursor.createTemporalEntity( );

      // Next Window
      strURL = response.encodeRedirectURL( "wMLC2PrecautionaryStatement.jsp" );
      vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
      vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLC2Precautionary" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_UpdatePrecautionaryStmt" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_GeneralStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_GeneralStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_GeneralStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_GeneralStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      EntityCursor cursor = mMasLC.cursor( "M_PrecautionaryStatement" );
      cursor.createTemporalSubobjectVersion( );

      // Next Window
      strURL = response.encodeRedirectURL( "wMLC2PrecautionaryStatement.jsp" );
      vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
      vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLC2Precautionary" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_PrecautionaryStmtDelete" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_GeneralStatement" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_GeneralStatement" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_GeneralStatement" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_GeneralStatement" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2Precautionary.jsp", "wMLC2.GOTO_PrecautionaryStmtDelete" );
      try
      {
         nOptRC = wMLC2.GOTO_PrecautionaryStmtDelete( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation GOTO_PrecautionaryStmtDelete: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLC2Precautionary" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wMLC2DeleteComponent.jsp" );
      vKZXMLPGO.cursor( "PagePath" ).createEntity( CursorPosition.NEXT );
      vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLC2Precautionary" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveAndReturnMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2Precautionary.jsp", "wMLC2.SaveAndReturnMLC" );
      try
      {
         nOptRC = wMLC2.SaveAndReturnMLC( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SaveAndReturnMLC: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLC2Precautionary" );
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
         strLastPage = "wMLC2Precautionary.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2Precautionary.jsp", "wMLC2.SaveMLC" );
      try
      {
         nOptRC = wMLC2.SaveMLC( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SaveMLC: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLC2Precautionary" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Stay on Window with Refresh
      strURL = response.encodeRedirectURL( "wMLC2Precautionary.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelAndReturnMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2Precautionary.jsp", "wMLC2.CancelAndReturnMLC" );
      try
      {
         nOptRC = wMLC2.CancelAndReturnMLC( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CancelAndReturnMLC: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLC2Precautionary" );
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
         strLastPage = "wMLC2Precautionary.jsp";

      strURL = response.encodeRedirectURL( strLastPage );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditMasterLabelVersionData" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLC2VersionData.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditIngredientsSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLC2Ingredients.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditStorDispSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLC2StorageDisposal.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditHumanHazardSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLC2HumanHazard.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditPrecautionarySect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLC2Precautionary.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditFirstAidSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCFirstAid.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditHazardSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCHazard.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditClaimsSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCOrganismClaims.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditSurfacesSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCSurfaces.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditAreasOfUseSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCAreasOfUse.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditAppTypesSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCAppTypes.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditDirectionsUseSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCDirectionsForUse.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCMarketing.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGOTO_ListUsageEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strURL = response.encodeRedirectURL( "wMLCUsageList.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGOTO_CompositeEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2Precautionary.jsp", "wMLC2.GOTO_CompositeEntries" );
      try
      {
         nOptRC = wMLC2.GOTO_CompositeEntries( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation GOTO_CompositeEntries: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLC2Precautionary" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wSPLD2MLC_CompositeComponentList.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGOTO_CompositeWO_Usage" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2Precautionary.jsp", "wMLC2.GOTO_CompositeWO_Usage" );
      try
      {
         nOptRC = wMLC2.GOTO_CompositeWO_Usage( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation GOTO_CompositeWO_Usage: " + e.getMessage();
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
            vKZXMLPGO.cursor( "PagePath" ).setAttribute( "LastPageName", "wMLC2Precautionary" );
         }

         nRC = 1;  // do the redirection
         break;
      }

      // Next Window
      strURL = response.encodeRedirectURL( "wSPLD2MLC_CompositeComponentListWO.jsp" );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wMLC2Precautionary" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wMLC2Precautionary" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2Precautionary", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLC2Precautionary.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLC2Precautionary.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLC2Precautionary.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLC2Precautionary.jsp" );
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
   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wMLC2", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getStringFromAttribute( "BannerName" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

%>

<html>
<head>

<title>Precautionary Content</title>

<%@ include file="./include/myheader.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/validations.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/md5.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wMLC2Precautionary.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New4" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smSaveAndReturnMLC( )">Save & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New6" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smSaveMLC( )">Save</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New5" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smCancelAndReturnMLC( )">Cancel & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "VersionData" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditMasterLabelVersionData( )">Version Data</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Ingredients" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditIngredientsSect( )">Ingredients</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "StorDisp" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditStorDispSect( )">Storage and Disposal</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "HumanHazard" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditHumanHazardSect( )">Human Hazard</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Precautionary" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#" class="sideselected"  onclick="smEditPrecautionarySect( )">Precautionary</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "FirstAid" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditFirstAidSect( )">First Aid</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "OtherHazard" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditHazardSect( )">Other Hazard</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "OrganismClaims" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditClaimsSect( )">Organism Claims</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "TypesOfSurfaces" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditSurfacesSect( )">Types of Surfaces</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AreasOfUse" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditAreasOfUseSect( )">Areas of Use</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AppTypes" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditAppTypesSect( )">Application Types</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "DirectionsForUse" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditDirectionsUseSect( )">Directions for Use</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Marketing" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditMarketingSect( )">Marketing</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New1" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smGOTO_ListUsageEntries( )">Usage Entries</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New2" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smGOTO_CompositeEntries( )">Composite Entries</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New3" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smGOTO_CompositeWO_Usage( )">Composites w/o Usage</a></li>
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


<form name="wMLC2Precautionary" id="wMLC2Precautionary" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View mMasLC = null;
   View mMasProd = null;
   View mMasProdLST = null;
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

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getStringFromAttribute( "SolicitSaveFlag" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC2", "Precautionary" );
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

<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:730px;height:28px;position:absolute;left:12px;top:2px;">  <!-- GroupBox3 --> 

<% /* PrecautionarySection:Text */ %>

<label class="groupbox"  id="PrecautionarySection" name="PrecautionarySection" style="width:338px;height:16px;position:absolute;left:6px;top:6px;">Precautionary Section</label>


</div>  <!--  GroupBox3 --> 
<% /* GBPrecautionarySection:GroupBox */ %>

<div id="GBPrecautionarySection" name="GBPrecautionarySection" class="withborder" style="width:730px;height:62px;position:absolute;left:12px;top:30px;">  <!-- GBPrecautionarySection --> 

<% /* GroupBox1:GroupBox */ %>
<div id="GroupBox1" name="GroupBox1" style="float:left;width:640px;" >

<table cols=2 style="width:640px;"  class="grouptable">

<tr>
<td valign="top" style="width:66px;">
<% /* PrecautionaryTitle::Text */ %>

<label  id="PrecautionaryTitle:" name="PrecautionaryTitle:" style="width:66px;height:16px;position:absolute;left:6px;top:14px;">Title:</label>

</td>
<td valign="top"  class="text12" style="width:550px;">
<% /* PrecautionaryTitle:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "PrecautionaryTitle", strError );
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
         task.log( ).debug( "Invalid View: " + "PrecautionaryTitle" );
      else
      {
         nRC = mMasLC.cursor( "M_GeneralSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mMasLC.cursor( "M_GeneralSection" ).getStringFromAttribute( "Title", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on PrecautionaryTitle: " + e.getMessage());
               task.log().info( "*** Error on ctrl PrecautionaryTitle" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_GeneralSection.Title: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mMasLC.M_GeneralSection" );
      }
   }
%>

<input class="text12" name="PrecautionaryTitle" id="PrecautionaryTitle" style="width:550px;position:absolute;left:72px;top:14px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:66px;">
<% /* PrecautionarySubtitle::Text */ %>

<label  id="PrecautionarySubtitle:" name="PrecautionarySubtitle:" style="width:66px;height:16px;position:absolute;left:6px;top:36px;">Subtitle:</label>

</td>
<td valign="top"  class="text12" style="width:550px;">
<% /* PrecautionarySubtitle:EditBox */ %>
<%
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
         task.log( ).debug( "Invalid View: " + "PrecautionarySubtitle" );
      else
      {
         nRC = mMasLC.cursor( "M_GeneralSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mMasLC.cursor( "M_GeneralSection" ).getStringFromAttribute( "Subtitle", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on PrecautionarySubtitle: " + e.getMessage());
               task.log().info( "*** Error on ctrl PrecautionarySubtitle" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_GeneralSection.Subtitle: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mMasLC.M_GeneralSection" );
      }
   }
%>

<input class="text12" name="PrecautionarySubtitle" id="PrecautionarySubtitle" style="width:550px;position:absolute;left:72px;top:36px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox1 --> 


</div>  <!--  GBPrecautionarySection --> 
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" style="width:730px;height:34px;position:absolute;left:12px;top:94px;">  <!-- GroupBox2 --> 

<% /* GBPrecautionaryStatements:GroupBox */ %>
<div id="GBPrecautionaryStatements" name="GBPrecautionaryStatements" style="float:left;width:486px;"  class="listgroup">

<table cols=0 style="width:486px;"  class="grouptable">

<tr>
<td valign="top"  class="listheader" style="width:332px;">
<% /* PrecautionaryStatements:Text */ %>

<label class="listheader"  id="PrecautionaryStatements" name="PrecautionaryStatements" style="width:238px;height:16px;position:absolute;left:10px;top:2px;">Precautionary Statements</label>

</td>
<td valign="top"  class="newbutton" style="width:78px;">
<% /* New:PushBtn */ %>
<button type="button" class="newbutton"  id="New" name="New" value="New" onclick="GOTO_AddPrecautionaryStatement( )"  style="width:78px;height:26px;">New</button>

</td>
</tr>
</table>

</div>  <!-- GBPrecautionaryStatements --> 


</div>  <!--  GroupBox2 --> 
<% /* GridPrecautionary:Grid */ %>
<table  cols=3 style="position:absolute;top:138px;left:10px;width:710px;"  name="GridPrecautionary" id="GridPrecautionary">

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
      String strGridEditPrecautionary;
      String strBMBUpdatePrecautionaryStatement;
      String strBMBDeletePrecautionaryStatement;
      
      View vGridPrecautionary;
      vGridPrecautionary = mMasLC.newView( );
      csrRC2 = vGridPrecautionary.cursor( "M_GeneralStatement" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridPrecautionary.cursor( "M_GeneralStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGridEditPrecautionary = "";
         nRC = vGridPrecautionary.cursor( "M_GeneralStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditPrecautionary = vGridPrecautionary.cursor( "M_GeneralStatement" ).getStringFromAttribute( "Text", "" );

            if ( strGridEditPrecautionary == null )
               strGridEditPrecautionary = "";
         }

         if ( StringUtils.isBlank( strGridEditPrecautionary ) )
            strGridEditPrecautionary = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="GOTO_UpdatePrecautionaryStmt( this.id )" id="GridEditPrecautionary::<%=strEntityKey%>"><%=strGridEditPrecautionary%></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdatePrecautionaryStatement" onclick="GOTO_UpdatePrecautionaryStmt( this.id )" id="BMBUpdatePrecautionaryStatement::<%=strEntityKey%>"><img src="./images/ePammsUpdate.jpg" alt="Update"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBDeletePrecautionaryStatement" onclick="GOTO_PrecautionaryStmtDelete( this.id )" id="BMBDeletePrecautionaryStatement::<%=strEntityKey%>"><img src="./images/ePammsDelete.jpg" alt="Delete"></a></td>

</tr>

<%
         csrRC2 = vGridPrecautionary.cursor( "M_GeneralStatement" ).setNextContinue( );
      }
      vGridPrecautionary.drop( );
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

</div>  <!-- This is the end tag for wrapper -->

</body>
</html>
<%
   session.setAttribute( "ZeidonWindow", "wMLC2Precautionary" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
