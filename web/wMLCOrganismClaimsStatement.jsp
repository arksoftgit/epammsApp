<!DOCTYPE HTML>

<%-- wMLCOrganismClaimsStatement   Generate Timestamp: 20160405132208745 --%>

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
      // ComboBox: Usage
      nRC = mMasLC.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hUsage" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Usage", "", strMapValue );
            else
               mMasLC.cursor( "M_Usage" ).getAttribute( "ClaimsClassification" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Usage", e.getReason( ), strMapValue );
         }
      }

      // EditBox: PrecautionarySubtitle
      nRC = mMasLC.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PrecautionarySubtitle" );
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

      // ComboBox: UsageFootnote
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) )
      {
         nRC = mMasLC.cursor( "M_UsageFootnote" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strMapValue = request.getParameter( "hUsageFootnote" );
            if ( strMapValue != null )
            {
               nRelPos = java.lang.Integer.parseInt( strMapValue );
               nRelPos--;    // For Auto Include combos, we need to decrement for the blank entry.
               mMasLC.cursor( "M_UsageFootnote" ).setPosition( nRelPos, "" );
            }
 
            // Auto Include Code 
            // If the value is "0" then the user has selected the null entry, we do not want to do an include.
            // If there is an entity, we want to exclude it. 
            if ( !StringUtils.equals( strMapValue, "0" ) )
            {
               nRC = mMasLC.cursor( "M_UsageFootnoteUsed" ).checkExistenceOfEntity( ).toInt();
               if ( nRC >= 0 )
               {
                  // Only do the automatic include if this is a different entity
                  strTemp = mMasLC.cursor( "M_UsageFootnoteUsed" ).getAttribute( "Text" ).getString( "" );
                  if ( !StringUtils.equals( strTemp, mMasLC.cursor( "M_UsageFootnote" ).getAttribute( "Text" ).getString( "" ) ) )
                  {
                     mMasLC.cursor( "M_UsageFootnoteUsed" ).excludeEntity( CursorPosition.NONE );
                     mMasLC.cursor( "M_UsageFootnoteUsed" ).includeSubobject( mMasLC.cursor( "M_UsageFootnote" ), CursorPosition.NEXT );
                  }
               }
               else
                     mMasLC.cursor( "M_UsageFootnoteUsed" ).includeSubobject( mMasLC.cursor( "M_UsageFootnote" ), CursorPosition.NEXT );
            }
            else
            {
               nRC = mMasLC.cursor( "M_UsageFootnoteUsed" ).checkExistenceOfEntity( ).toInt();
               if ( nRC >= 0 )
               {
                     mMasLC.cursor( "M_UsageFootnoteUsed" ).excludeEntity( CursorPosition.NONE );
               }
            }
         }

         }  // checkExistenceofEntity
      // Grid: Grid4
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

         strTag = "Keyword3::" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         if ( strMapValue != null ) 
         {
            try
            {
               if ( webMapping )
                  VmlOperation.CreateMessage( task, "Keyword3", "", strMapValue );
               else
                  vGridTmp.cursor( "M_InsertTextKeywordUsage" ).getAttribute( "Name" ).setValue( strMapValue, "" );
            }
            catch ( InvalidAttributeValueException e )
            {
               nMapError = -16;
               VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }
      }

         strTag = "KeywordText3::" + strEntityKey;
         strMapValue = request.getParameter( strTag );
         if ( strMapValue != null ) 
         {
            try
            {
               if ( webMapping )
                  VmlOperation.CreateMessage( task, "KeywordText3", "", strMapValue );
               else
                  vGridTmp.cursor( "M_InsertTextUsage" ).getAttribute( "Text" ).setValue( strMapValue, "" );
            }
            catch ( InvalidAttributeValueException e )
            {
               nMapError = -16;
               VmlOperation.CreateMessage( task, strTag, e.getReason( ), strMapValue );
         }
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

if ( strLastWindow.equals("wMLCOrganismClaimsStatement") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wMLCOrganismClaimsStatement strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLCOrganismClaimsStatement LastWindow *** " + strLastWindow );
task.log().info("*** wMLCOrganismClaimsStatement LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptAndNextUsage" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCOrganismClaimsStatement", "wMLC.AcceptAndNextUsage" );
      nOptRC = wMLC.AcceptAndNextUsage( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptAndPreviousUsage" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCOrganismClaimsStatement", "wMLC.AcceptAndPreviousUsage" );
      nOptRC = wMLC.AcceptAndPreviousUsage( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptAndReturnClaimsStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

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
            cursor.acceptSubobject( );
         }
         nRC = 0;
      }

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "AcceptAndReturnClaimsStatement", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ADD_BlankClaimsKeywordAndText" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCOrganismClaimsStatement", "wMLC.ADD_BlankClaimsKeywordAndText" );
      nOptRC = wMLC.ADD_BlankClaimsKeywordAndText( new zVIEW( vKZXMLPGO ) );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AttemptDecipheredEntry" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCOrganismClaimsStatement", "wMLC.AttemptDecipheredEntry" );
      nOptRC = wMLC.AttemptDecipheredEntry( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelClaimsStmt" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

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
         VmlOperation.CreateMessage( task, "CancelClaimsStmt", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "COPY_UsageKeywordAndText" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

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

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCOrganismClaimsStatement", "wMLC.COPY_UsageKeywordAndText" );
      nOptRC = wMLC.COPY_UsageKeywordAndText( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_UsageKeyword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCOrganismClaimsStatement", "wMLC.GOTO_DisplayGeneratedTextUsage" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_UsageUpdate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "PASTE_UsageKeywordAndText" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCOrganismClaimsStatement", "wMLC.PASTE_UsageKeywordAndText" );
      nOptRC = wMLC.PASTE_UsageKeywordAndText( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SaveAddNewUsage" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCOrganismClaimsStatement", "wMLC.SaveAddNewUsage" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wMLCOrganismClaimsStatement" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wMLCOrganismClaimsStatement" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCOrganismClaimsStatement", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLCOrganismClaimsStatement.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLCOrganismClaimsStatement.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLCOrganismClaimsStatement.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLCOrganismClaimsStatement.jsp" );
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
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "OrganismClaimsStatement", "" );
   }

%>

<html>
<head>

<title>Organism Claims Statement</title>

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
<script language="JavaScript" type="text/javascript" src="./genjs/wMLCOrganismClaimsStatement.js"></script>

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
       <li id="AcceptAndReturn" name="AcceptAndReturn"><a href="#"  onclick="AcceptAndReturnClaimsStatement()">Accept & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="CancelAndReturn" name="CancelAndReturn"><a href="#"  onclick="CancelClaimsStmt()">Cancel & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New1" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="New1" name="New1"><a href="#"  onclick="SaveAddNewUsage()">Accept & Add</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Next" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="Next" name="Next"><a href="#"  onclick="AcceptAndNextUsage()">Next</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Prev" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="Prev" name="Prev"><a href="#"  onclick="AcceptAndPreviousUsage()">Previous</a></li>
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


<form name="wMLCOrganismClaimsStatement" id="wMLCOrganismClaimsStatement" method="post">
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "OrganismClaimsStatement" );
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

<div id="GroupBox4" name="GroupBox4" style="width:472px;height:28px;float:left;">  <!-- GroupBox4 --> 


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp</span>
<% /* PrecautionarySection:Text */ %>

<span class="groupbox"  id="PrecautionarySection" name="PrecautionarySection" style="width:338px;height:16px;">Claims Statement</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox4 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:18px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBPrecautionarySection:GroupBox */ %>

<div id="GBPrecautionarySection" name="GBPrecautionarySection" class="withborder" style="width:810px;height:96px;float:left;">  <!-- GBPrecautionarySection --> 


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>
<div id="GroupBox2" name="GroupBox2" style="float:left;width:782px;" >

<table cols=2 style="width:782px;"  class="grouptable">

<tr>
<td valign="top" style="width:96px;">
<% /* Classification::Text */ %>

<span  id="Classification:" name="Classification:" style="width:90px;height:16px;">Classification:</span>

</td>
<td valign="top" style="width:606px;">
<% /* Usage:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="Usage" id="Usage" size="1" style="width:606px;" onchange="UsageOnChange( )">

<%
   boolean inListUsage = false;

   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mMasLC , "M_Usage", "ClaimsClassification", "" );

      nRC = mMasLC.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mMasLC.cursor( "M_Usage" ).getAttribute( "ClaimsClassification" ).getString( "" );
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
         inListUsage = true;
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
               inListUsage = true;
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
      if ( !inListUsage )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hUsage" id="hUsage" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
</tr>
<tr>
<td valign="top" style="width:96px;">
<% /* Pathogen::Text */ %>

<span  id="Pathogen:" name="Pathogen:" style="width:90px;height:16px;">Pathogen:</span>

</td>
<td valign="top"  class="text12" style="width:606px;">
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
         nRC = mMasLC.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_Usage" ).getAttribute( "Name" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on PrecautionarySubtitle: " + e.getMessage());
               task.log().error( "*** Error on ctrl PrecautionarySubtitle", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_Usage.Name: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for PrecautionarySubtitle: " + "mMasLC.M_Usage" );
      }
   }
%>

<input class="text12" name="PrecautionarySubtitle" id="PrecautionarySubtitle" style="width:606px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:96px;">
<% /* Footnote::Text */ %>

<span  id="Footnote:" name="Footnote:" style="width:90px;height:16px;">Footnote:</span>

</td>
<td valign="top" style="width:606px;">
<% /* UsageFootnote:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="UsageFootnote" id="UsageFootnote" size="1"style="width:606px;" onchange="UsageFootnoteOnChange( )">

<%
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
         strComboCurrentValue = "";
      View vUsageFootnote;
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) )
      {
         nRC = mMasLC.cursor( "M_UsageFootnoteUsed" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strComboCurrentValue = mMasLC.cursor( "M_UsageFootnoteUsed" ).getAttribute( "Text" ).getString( "" );
            if ( strComboCurrentValue == null )
               strComboCurrentValue = "";
         }
      }
      vUsageFootnote = mMasLC.newView( );
      ComboCount = 0;
      strComboSelectedValue = "0";

      // For Auto Include, always add a null entry to the combo box.
      ComboCount++;
      if ( StringUtils.isBlank( strComboCurrentValue ) )
      {
%>
         <option selected="selected"></option>
<%
      }
      else
      {
%>
         <option></option>
<%
      }

      csrRC = vUsageFootnote.cursor( "M_UsageFootnote" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         strErrorMapValue = vUsageFootnote.cursor( "M_UsageFootnote" ).getAttribute( "Text" ).getString( "" );
         if ( strErrorMapValue == null )
            strErrorMapValue = "";

         if ( StringUtils.equals( strComboCurrentValue, strErrorMapValue ) )
         {
%>
            <option selected="selected"><%=strErrorMapValue%></option>
<%
            strComboSelectedValue = Integer.toString( ComboCount );
         }
         else
         {
%>
            <option><%=strErrorMapValue%></option>
<%
         }

         ComboCount++;
         csrRC =  vUsageFootnote.cursor( "M_UsageFootnote" ).setNextContinue( );
      }

      vUsageFootnote.drop( );

   }
%>
</select>
<input name="hUsageFootnote" id="hUsageFootnote" type="hidden" value="<%=strComboSelectedValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox2 --> 

</div>  <!-- End of a new line -->


</div>  <!--  GBPrecautionarySection --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:18px;float:left;"></div>   <!-- Width Spacer -->
<% /* Tab:Tab */ %>

<div id="Tab" class="tab-pane" style="width:814px;"> <!-- Beginning of Tab Control Tab -->
<script type="text/javascript">Tab = new WebFXTabPane( document.getElementById( "Tab" ) );</script>

<div id="TabCtl1" class="tab-page " > <!-- Tab item TabCtl1 -->
<h2 class="tab"><span>Multiple Values / Keyword</span></h2>
<script type="text/javascript">Tab.addTabPage( document.getElementById( "TabCtl1" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox8:GroupBox */ %>

<div id="GroupBox8" name="GroupBox8" style="width:768px;float:left;">  <!-- GroupBox8 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3"   style="float:left;position:relative; width:754px; height:30px;">  <!-- GroupBox3 --> 

<% /* ShowText:PushBtn */ %>
<button type="button" class="newbutton" name="ShowText" id="ShowText" value="" onclick="GOTO_DisplayGeneratedTextUsage( )" style="width:158px;height:26px;position:absolute;left:402px;top:4px;">Show Generated Text</button>

<% /* New:PushBtn */ %>
<button type="button" class="newbutton" name="New" id="New" value="" onclick="ADD_UsageKeyword( )" style="width:66px;height:26px;position:absolute;left:582px;top:4px;">New</button>

<% /* Paste:PushBtn */ %>
<button type="button" class="newbutton" name="Paste" id="Paste" value="" onclick="PASTE_UsageKeywordAndText( )" style="width:74px;height:26px;position:absolute;left:666px;top:4px;">Paste</button>

<% /* KeywordEmbedding1:Text */ %>

<label class="listheader"  id="KeywordEmbedding1" name="KeywordEmbedding1" style="width:334px;height:16px;position:absolute;left:10px;top:8px;">Keyword text for Embedding in Statement Text</label>


</div>  <!--  GroupBox3 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Grid4:Grid */ %>
<table class="sortable"  cols=5 style="width:758px;"  name="Grid4" id="Grid4">

<thead bgcolor=green><tr>

   <th>Keyword</th>
   <th>Keyword Text</th>
   <th>Update</th>
   <th>Delete</th>
   <th>Copy</th>

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
      String strKeywordText2;
      String strUpdate;
      String strDelete2;
      String strCopy;
      
      View vGrid4;
      vGrid4 = mMasLC.newView( );
      csrRC2 = vGrid4.cursor( "M_InsertTextKeywordUsage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid4.cursor( "M_InsertTextKeywordUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strKeyword = "";
         nRC = vGrid4.cursor( "M_InsertTextKeywordUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strKeyword = vGrid4.cursor( "M_InsertTextKeywordUsage" ).getAttribute( "Name" ).getString( "" );

            if ( strKeyword == null )
               strKeyword = "";
         }

         if ( StringUtils.isBlank( strKeyword ) )
            strKeyword = "&nbsp";

         strKeywordText2 = "";
         nRC = vGrid4.cursor( "M_Usage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strKeywordText2 = vGrid4.cursor( "M_Usage" ).getAttribute( "dUsageKeywordText" ).getString( "" );

            if ( strKeywordText2 == null )
               strKeywordText2 = "";
         }

         if ( StringUtils.isBlank( strKeywordText2 ) )
            strKeywordText2 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="GOTO_UsageUpdate( this.id )" id="Keyword::<%=strEntityKey%>"><%=strKeyword%></a></td>
   <td><%=strKeywordText2%></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="Update" onclick="GOTO_UsageUpdate( this.id )" id="Update::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png" alt="Update"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="Delete2" onclick="DELETE_UsageKeyword( this.id )" id="Delete2::<%=strEntityKey%>"><img src="./images/ePammsDelete.png" alt="Delete"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="Copy" onclick="COPY_UsageKeywordAndText( this.id )" id="Copy::<%=strEntityKey%>"><img src="./images/ePammsCopy.png" alt="Copy"></a></td>

</tr>

<%
         csrRC2 = vGrid4.cursor( "M_InsertTextKeywordUsage" ).setNextContinue( );
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

</div> <!-- End of Tab item TabCtl1 -->

<div id="TabCtl2" class="tab-page " > <!-- Tab item TabCtl2 -->
<h2 class="tab"><span>Single Value / Keyword</span></h2>
<script type="text/javascript">Tab.addTabPage( document.getElementById( "TabCtl2" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:22px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:758px;height:144px;float:left;">  <!-- GroupBox1 --> 


<div>  <!-- Beginning of a new line -->
<% /* GroupBox5:GroupBox */ %>

<div id="GroupBox5" name="GroupBox5"   style="float:left;position:relative; width:756px; height:30px;">  <!-- GroupBox5 --> 

<% /* ShowText2:PushBtn */ %>
<button type="button" class="newbutton" name="ShowText2" id="ShowText2" value="" onclick="GOTO_DisplayGeneratedTextUsage( )" style="width:154px;height:26px;position:absolute;left:310px;top:4px;">Show Generated Text</button>

<% /* AddBlank:PushBtn */ %>
<button type="button" class="newbutton" name="AddBlank" id="AddBlank" value="" onclick="ADD_BlankClaimsKeywordAndText( )" style="width:122px;height:26px;position:absolute;left:474px;top:4px;">Add Blank Entry</button>

<% /* AttemptKeyword:PushBtn */ %>
<button type="button" class="newbutton" name="AttemptKeyword" id="AttemptKeyword" value="" onclick="AttemptDecipheredEntry( )" style="width:122px;height:26px;position:absolute;left:606px;top:4px;">Attempt Keyword</button>

<% /* KeywordEmbedding2:Text */ %>

<label class="listheader"  id="KeywordEmbedding2" name="KeywordEmbedding2" style="width:290px;height:16px;position:absolute;left:2px;top:8px;">Keyword text for Embedding in Statement</label>


</div>  <!--  GroupBox5 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Grid5:Grid */ %>
<table class="sortable"  cols=3 style="width:756px;"  name="Grid5" id="Grid5">

<thead bgcolor=green><tr>

   <th>Keyword</th>
   <th>Keyword Text</th>
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
      String strKeyword3;
      String strKeyword3ErrorColor;
      String strKeywordText3;
      String strKeywordText3ErrorColor;
      String strDelete;
      
      View vGrid5;
      vGrid5 = mMasLC.newView( );
      csrRC2 = vGrid5.cursor( "M_InsertTextKeywordUsage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid5.cursor( "M_InsertTextKeywordUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strKeyword3 = "";
         strKeyword3ErrorColor = "";
         nRC = vGrid5.cursor( "M_InsertTextKeywordUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strTag = "Keyword3::" + strEntityKey;
            strErrorMapValue = VmlOperation.CheckError( strTag, strError );
            if ( !StringUtils.isBlank( strErrorMapValue ) )
            {
               if ( StringUtils.equals( strErrorFlag, "Y" ) )
                  strKeyword3ErrorColor = " style='color:red'";
                  strKeyword3 = strErrorMapValue;
            }
            else
            {
               strKeyword3 = vGrid5.cursor( "M_InsertTextKeywordUsage" ).getAttribute( "Name" ).getString( "" );
               if ( strKeyword3 == null )
                  strKeyword3 = "";
            }
         }

         if ( StringUtils.isBlank( strKeyword3 ) )
            strKeyword3 = "";

         strKeywordText3 = "";
         strKeywordText3ErrorColor = "";
         nRC = vGrid5.cursor( "M_InsertTextUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strTag = "KeywordText3::" + strEntityKey;
            strErrorMapValue = VmlOperation.CheckError( strTag, strError );
            if ( !StringUtils.isBlank( strErrorMapValue ) )
            {
               if ( StringUtils.equals( strErrorFlag, "Y" ) )
                  strKeywordText3ErrorColor = " style='color:red'";
                  strKeywordText3 = strErrorMapValue;
            }
            else
            {
               strKeywordText3 = vGrid5.cursor( "M_InsertTextUsage" ).getAttribute( "Text" ).getString( "" );
               if ( strKeywordText3 == null )
                  strKeywordText3 = "";
            }
         }

         if ( StringUtils.isBlank( strKeywordText3 ) )
            strKeywordText3 = "";

%>

<tr<%=strOdd%>>

   <td><input size="30" value="<%=strKeyword3%>"<%=strKeyword3ErrorColor%> name="Keyword3::<%=strEntityKey%>" id="Keyword3::<%=strEntityKey%>" ></td>
   <td><input size="78" value="<%=strKeywordText3%>"<%=strKeywordText3ErrorColor%> name="KeywordText3::<%=strEntityKey%>" id="KeywordText3::<%=strEntityKey%>" ></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="Delete" onclick="DELETE_UsageKeyword( this.id )" id="Delete::<%=strEntityKey%>"><img src="./images/ePammsDelete.png" alt="Delete"></a></td>

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


</div>  <!--  GroupBox1 --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item TabCtl2 -->

</div> <!-- End of Tab Control Tab -->

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
   session.setAttribute( "ZeidonWindow", "wMLCOrganismClaimsStatement" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
