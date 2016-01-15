<!DOCTYPE HTML>

<%-- wMLCMarketingStatement --%>

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
      // MLEdit: MLEdit2
      nRC = mMasLC.cursor( "M_MarketingStatement" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "MLEdit2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "MLEdit2", "", strMapValue );
            else
               mMasLC.cursor( "M_MarketingStatement" ).getAttribute( "Title" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "MLEdit2", e.getReason( ), strMapValue );
         }
      }

      // MLEdit: MLEdit1
      nRC = mMasLC.cursor( "M_MarketingStatement" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "MLEdit1" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "MLEdit1", "", strMapValue );
            else
               mMasLC.cursor( "M_MarketingStatement" ).getAttribute( "Text" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "MLEdit1", e.getReason( ), strMapValue );
         }
      }

      // Grid: Grid3
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are
      // grids on the same window with the same view we do not mess up the
      // entity positions.
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_InsertTextKeywordMarketing" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_InsertTextKeywordMarketing" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_InsertTextKeywordMarketing" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: Grid1
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are
      // grids on the same window with the same view we do not mess up the
      // entity positions.
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_MarketingUsageOrdering" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_MarketingUsageOrdering" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_MarketingUsageOrdering" ).setNextContinue( );
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

if ( strLastWindow.equals("wMLCMarketingStatement") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wMLCMarketingStatement strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLCMarketingStatement LastWindow *** " + strLastWindow );
task.log().info("*** wMLCMarketingStatement LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptMarketingStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCMarketingStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Auto Object Function
      nRC = 0;
      try
      {
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_MarketingStatement" );
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
         VmlOperation.CreateMessage( task, "AcceptMarketingStatement", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "PASTE_InsertKeyword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCMarketingStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCMarketingStatement", "wMLC.PASTE_InsertKeywordMarketing" );
      nOptRC = wMLC.PASTE_InsertKeywordMarketing( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "COPY_InsertKeyword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCMarketingStatement", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_InsertTextKeywordMarketing" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_InsertTextKeywordMarketing" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_InsertTextKeywordMarketing" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_InsertTextKeywordMarketing" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCMarketingStatement", "wMLC.COPY_InsertKeywordMarketing" );
      nOptRC = wMLC.COPY_InsertKeywordMarketing( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ADD_MarketingStatementKeyword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCMarketingStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Auto Object Function
      nRC = 0;
      try
      {
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_InsertTextKeywordMarketing" );
      cursor.createTemporalEntity( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "ADD_MarketingStatementKeyword", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "AddUpdateKeywordMarketing" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelMarketingStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCMarketingStatement", strActionToProcess );

      // Action Auto Object Function
      nRC = 0;
      try
      {
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_MarketingStatement" );
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
         VmlOperation.CreateMessage( task, "CancelMarketingStatement", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_MarketingStatementKeyword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCMarketingStatement", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_InsertTextKeywordMarketing" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_InsertTextKeywordMarketing" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_InsertTextKeywordMarketing" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_InsertTextKeywordMarketing" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
      EntityCursor cursor = mMasLC.cursor( "M_InsertTextKeywordMarketing" );
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
         VmlOperation.CreateMessage( task, "DELETE_MarketingStatementKeyword", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DisplayGeneratedTextMktg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCMarketingStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCMarketingStatement", "wMLC.GOTO_DisplayGeneratedTextMktg" );
      nOptRC = wMLC.GOTO_DisplayGeneratedTextMktg( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "GeneratedTitleTextDisplay" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_MarketingKeywordUpdate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCMarketingStatement", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_InsertTextKeywordMarketing" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_InsertTextKeywordMarketing" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_InsertTextKeywordMarketing" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_InsertTextKeywordMarketing" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
      EntityCursor cursor = mMasLC.cursor( "M_InsertTextKeywordMarketing" );
      cursor.createTemporalSubobjectVersion( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "GOTO_MarketingKeywordUpdate", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "AddUpdateKeywordMarketing" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_SelectRemoveMktgEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCMarketingStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCMarketingStatement", "wMLC.GOTO_SelectRemoveMktgEntries" );
      nOptRC = wMLC.GOTO_SelectRemoveMktgEntries( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "MarketingSelectByType" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wMLCMarketingStatement" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wMLCMarketingStatement" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCMarketingStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLCMarketingStatement.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLCMarketingStatement.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLCMarketingStatement.jsp") )
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
            strURL = response.encodeRedirectURL( "wMLCMarketingStatement.jsp" );
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
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "MarketingStatement", "" );
   }

%>

<html>
<head>

<title>Marketing Statement</title>

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
<script language="JavaScript" type="text/javascript" src="./genjs/wMLCMarketingStatement.js"></script>

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
       <li id="AcceptAndReturn" name="AcceptAndReturn"><a href="#"  onclick="AcceptMarketingStatement()">Accept & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="CancelAndReturn" name="CancelAndReturn"><a href="#"  onclick="CancelMarketingStatement()">Cancel & Return</a></li>
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


<form name="wMLCMarketingStatement" id="wMLCMarketingStatement" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View mMasLC = null;
   View mEPA = null;
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

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getAttribute( "SolicitSaveFlag" ).getString( "" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "MarketingStatement" );
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
<% /* GBStorDispSections2:GroupBox */ %>

<div id="GBStorDispSections2" name="GBStorDispSections2" class="listgroup"   style="float:left;position:relative; width:780px; height:36px;">  <!-- GBStorDispSections2 -->

<% /* OrganismClaimsStatements3:Text */ %>

<label class="groupbox"  id="OrganismClaimsStatements3" name="OrganismClaimsStatements3" style="width:238px;height:16px;position:absolute;left:6px;top:12px;">Marketing Statement</label>


</div>  <!--  GBStorDispSections2 -->
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox3:GroupBox */ %>
<div id="GroupBox3" name="GroupBox3" style="float:left;width:832px;" >

<table cols=2 style="width:832px;"  class="grouptable">

<tr>
<td valign="top" style="width:54px;">
<% /* Text3:Text */ %>

<span  id="Text3" name="Text3" style="width:46px;height:18px;">Title:</span>

</td>
<td valign="top" style="width:738px;">
<% /* MLEdit2:MLEdit */ %>
<%
   // MLEdit: MLEdit2
   strErrorMapValue = VmlOperation.CheckError( "MLEdit2", strError );
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
         task.log( ).debug( "Invalid View: " + "MLEdit2" );
      else
      {
         nRC = mMasLC.cursor( "M_MarketingStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasLC.cursor( "M_MarketingStatement" ).getAttribute( "Title" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_MarketingStatement.Title: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for MLEdit2: " + "mMasLC.M_MarketingStatement" );
      }
   }
%>

<textarea id="MLEdit2" name="MLEdit2" class="" style="width:738px;height:30px;border:solid;border-width:4px;border-style:groove;" wrap="wrap"><%=strErrorMapValue%></textarea>

</td>
</tr>
<tr>
<td valign="top" style="width:54px;">
<% /* Text1:Text */ %>

<span  id="Text1" name="Text1" style="width:38px;height:18px;">Text:</span>

</td>
<td valign="top" style="width:754px;">
<% /* MLEdit1:MLEdit */ %>
<%
   // MLEdit: MLEdit1
   strErrorMapValue = VmlOperation.CheckError( "MLEdit1", strError );
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
         task.log( ).debug( "Invalid View: " + "MLEdit1" );
      else
      {
         nRC = mMasLC.cursor( "M_MarketingStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasLC.cursor( "M_MarketingStatement" ).getAttribute( "Text" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_MarketingStatement.Text: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for MLEdit1: " + "mMasLC.M_MarketingStatement" );
      }
   }
%>

<textarea id="MLEdit1" name="MLEdit1" class="" style="width:754px;height:76px;border:solid;border-width:4px;border-style:groove;" wrap="wrap"><%=strErrorMapValue%></textarea>

</td>
</tr>
</table>

</div>  <!-- GroupBox3 -->

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox7:GroupBox */ %>

<div id="GroupBox7" name="GroupBox7" style="width:832px;float:left;">  <!-- GroupBox7 -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2"   style="float:left;position:relative; width:756px; height:30px;">  <!-- GroupBox2 -->

<% /* PushBtn3:PushBtn */ %>
<button type="button" class="newbutton" name="PushBtn3" id="PushBtn3" value="" onclick="GOTO_DisplayGeneratedTextMktg( )" style="width:158px;height:26px;position:absolute;left:354px;top:4px;">Show Generated Text</button>

<% /* PushBtn4:PushBtn */ %>
<button type="button" class="newbutton" name="PushBtn4" id="PushBtn4" value="" onclick="PASTE_InsertKeyword( )" style="width:74px;height:26px;position:absolute;left:530px;top:4px;">Paste</button>

<% /* PushBtn2:PushBtn */ %>
<button type="button" class="newbutton" name="PushBtn2" id="PushBtn2" value="" onclick="ADD_MarketingStatementKeyword( )" style="width:66px;height:26px;position:absolute;left:618px;top:4px;">New</button>

<% /* Text4:Text */ %>

<label class="listheader"  id="Text4" name="Text4" style="width:324px;height:16px;position:absolute;left:10px;top:8px;">Keyword text for Embedding in Statement Text</label>


</div>  <!--  GroupBox2 -->
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Grid3:Grid */ %>
<table class="sortable"  cols=5 style=""  name="Grid3" id="Grid3">

<thead bgcolor=green><tr>

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
      String strGridEditCtl3;
      String strGridEditCtl4;
      String strBitmapBtn2;
      String strBMBDeleteDirectionsUseStatement1;
      String strBitmapBtn1;

      View vGrid3;
      vGrid3 = mMasLC.newView( );
      csrRC2 = vGrid3.cursor( "M_InsertTextKeywordMarketing" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid3.cursor( "M_InsertTextKeywordMarketing" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditCtl3 = "";
         nRC = vGrid3.cursor( "M_InsertTextKeywordMarketing" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl3 = vGrid3.cursor( "M_InsertTextKeywordMarketing" ).getAttribute( "Name" ).getString( "" );

            if ( strGridEditCtl3 == null )
               strGridEditCtl3 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl3 ) )
            strGridEditCtl3 = "&nbsp";

         strGridEditCtl4 = "";
         nRC = vGrid3.cursor( "M_InsertTextKeywordMarketing" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl4 = vGrid3.cursor( "M_InsertTextKeywordMarketing" ).getAttribute( "dMarketingKeywordText" ).getString( "" );

            if ( strGridEditCtl4 == null )
               strGridEditCtl4 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl4 ) )
            strGridEditCtl4 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="GOTO_MarketingKeywordUpdate( this.id )" id="GridEditCtl3::<%=strEntityKey%>"><%=strGridEditCtl3%></a></td>
   <td><%=strGridEditCtl4%></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BitmapBtn2" onclick="GOTO_MarketingKeywordUpdate( this.id )" id="BitmapBtn2::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png" alt="Update"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBDeleteDirectionsUseStatement1" onclick="COPY_InsertKeyword( this.id )" id="BMBDeleteDirectionsUseStatement1::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png" alt="Copy"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BitmapBtn1" onclick="DELETE_MarketingStatementKeyword( this.id )" id="BitmapBtn1::<%=strEntityKey%>"><img src="./images/ePammsDelete.png" alt="Delete"></a></td>

</tr>

<%
         csrRC2 = vGrid3.cursor( "M_InsertTextKeywordMarketing" ).setNextContinue( );
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


</div>  <!--  GroupBox7 -->
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:832px;float:left;">  <!-- GroupBox1 -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4"   style="float:left;position:relative; width:686px; height:30px;">  <!-- GroupBox4 -->

<% /* Text2:Text */ %>

<label class="listheader"  id="Text2" name="Text2" style="width:434px;height:16px;position:absolute;left:10px;top:4px;">Usage Entries for Embedding in Statement Text</label>

<% /* PushBtn1:PushBtn */ %>
<button type="button" class="newbutton" name="PushBtn1" id="PushBtn1" value="" onclick="GOTO_SelectRemoveMktgEntries( )" style="width:118px;height:26px;position:absolute;left:560px;top:4px;">Select/Remove</button>


</div>  <!--  GroupBox4 -->
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Grid1:Grid */ %>
<table class="sortable"  cols=2 style=""  name="Grid1" id="Grid1">

<thead bgcolor=green><tr>

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
      String strGridEditCtl1;
      String strGridEditCtl2;

      View vGrid1;
      vGrid1 = mMasLC.newView( );
      csrRC2 = vGrid1.cursor( "M_MarketingUsageOrdering" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid1.cursor( "M_MarketingUsageOrdering" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditCtl1 = "";
         nRC = vGrid1.cursor( "M_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl1 = vGrid1.cursor( "M_MarketingUsage" ).getAttribute( "UsageType" ).getString( "FullUsageType" );

            if ( strGridEditCtl1 == null )
               strGridEditCtl1 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl1 ) )
            strGridEditCtl1 = "&nbsp";

         strGridEditCtl2 = "";
         nRC = vGrid1.cursor( "M_MarketingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl2 = vGrid1.cursor( "M_MarketingUsage" ).getAttribute( "dDisplayUsageName" ).getString( "" );

            if ( strGridEditCtl2 == null )
               strGridEditCtl2 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl2 ) )
            strGridEditCtl2 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGridEditCtl1%></td>
   <td><%=strGridEditCtl2%></td>

</tr>

<%
         csrRC2 = vGrid1.cursor( "M_MarketingUsageOrdering" ).setNextContinue( );
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
   session.setAttribute( "ZeidonWindow", "wMLCMarketingStatement" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
