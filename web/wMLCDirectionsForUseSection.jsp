<!DOCTYPE HTML>

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
      // EditBox: DirectionsUseName
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "DirectionsUseName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "DirectionsUseName", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "Name" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "DirectionsUseName", e.getReason( ), strMapValue );
         }
      }

      // MLEdit: DirectionsForUseTitle
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "DirectionsForUseTitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "DirectionsForUseTitle", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "Title" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "DirectionsForUseTitle", e.getReason( ), strMapValue );
         }
      }

      // EditBox: TitleNote
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "TitleNote" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "TitleNote", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "HeadNote" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "TitleNote", e.getReason( ), strMapValue );
         }
      }

      // MLEdit: Subtitle
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Subtitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Subtitle", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "Subtitle" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Subtitle", e.getReason( ), strMapValue );
         }
      }

      // EditBox: DirectionsForUseReviewerNote
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "DirectionsForUseReviewerNote" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "DirectionsForUseReviewerNote", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "ReviewerNote" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "DirectionsForUseReviewerNote", e.getReason( ), strMapValue );
         }
      }

      // EditBox: SectionNote
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "SectionNote" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "SectionNote", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "TailNote" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "SectionNote", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ComboBoxXOR
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) )
      {
         nRC = mMasLC.cursor( "DFU_SectionNames" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strMapValue = request.getParameter( "hComboBoxXOR" );
            if ( strMapValue != null )
            {
               nRelPos = java.lang.Integer.parseInt( strMapValue );
               mMasLC.cursor( "DFU_SectionNames" ).setPosition( nRelPos, "" );
            }
         }

         }  // checkExistenceofEntity
      // ComboBox: CMB_Categories
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) )
      {
         nRC = mMasLC.cursor( "DFU_CategoryNames" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strMapValue = request.getParameter( "hCMB_Categories" );
            if ( strMapValue != null )
            {
               nRelPos = java.lang.Integer.parseInt( strMapValue );
               mMasLC.cursor( "DFU_CategoryNames" ).setPosition( nRelPos, "" );
            }
         }

         }  // checkExistenceofEntity
      // CheckBox: ExclusiveStatements
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "ExclusiveStatements" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ExclusiveStatements", "", strMapValue );
            else
               mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "ExclusiveStatements" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ExclusiveStatements", e.getReason( ), strMapValue );
         }
      }

      // Grid: GridDirectionsUseStatements
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
      // Grid: Grid2
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_DirectionsForUseReviewerNote" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_DirectionsForUseReviewerNote" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_DirectionsForUseReviewerNote" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: Grid1
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_ClaimsDrivingUsage" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_ClaimsDrivingUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_ClaimsDrivingUsage" ).setNextContinue( );
      }

      vGridTmp.drop( );
      // Grid: GridDFU_SectionKeywords
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mMasLC.newView( );
      csrRC = vGridTmp.cursor( "M_InsertTextKeywordSectionDU" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "M_InsertTextKeywordSectionDU" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "M_InsertTextKeywordSectionDU" ).setNextContinue( );
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

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.AcceptDirectionsForUseSection" );
      nOptRC = wMLC.AcceptDirectionsForUseSection( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CopyAndAddSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.CopyAndAddSectionDU" );
      nOptRC = wMLC.CopyAndAddSectionDU( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ParseSectionText" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.ParseDFU_SectionText" );
      nOptRC = wMLC.ParseDFU_SectionText( new zVIEW( vKZXMLPGO ) );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AddNewDFU_Section" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.AddNewDFU_Section" );
      nOptRC = wMLC.AddNewDFU_Section( new zVIEW( vKZXMLPGO ) );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.PASTE_InsertKeywordDU" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "COPY_InsertKeywordTitleDU" ) )
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
         csrRC = mMasLC.cursor( "M_InsertTextKeywordSectionDU" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_InsertTextKeywordSectionDU" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_InsertTextKeywordSectionDU" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_InsertTextKeywordSectionDU" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.COPY_InsertKeywordTitleDU" );
      nOptRC = wMLC.COPY_InsertKeywordTitleDU( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ADD_SectionKeywordDU" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Auto Object Function
      nRC = 0;
      try
      {
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_InsertTextKeywordSectionDU" );
      cursor.createTemporalEntity( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "ADD_SectionKeywordDU", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "AddUpdateSectionKeywordDU" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_TextKeywordTitleDU" ) )
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
         csrRC = mMasLC.cursor( "M_InsertTextKeywordSectionDU" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_InsertTextKeywordSectionDU" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_InsertTextKeywordSectionDU" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_InsertTextKeywordSectionDU" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
      EntityCursor cursor = mMasLC.cursor( "M_InsertTextKeywordSectionDU" );
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
         VmlOperation.CreateMessage( task, "DELETE_TextKeywordTitleDU", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DisplayGeneratedTextDU" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

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
         csrRC = mMasLC.cursor( "M_InsertTextKeywordSectionDU" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_InsertTextKeywordSectionDU" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_InsertTextKeywordSectionDU" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_InsertTextKeywordSectionDU" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
      EntityCursor cursor = mMasLC.cursor( "M_InsertTextKeywordSectionDU" );
      cursor.createTemporalSubobjectVersion( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "GOTO_MarketingKeywordUpdate", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "AddUpdateSectionKeywordDU" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ChangeSectionCategory" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.ChangeSectionCategory" );
      nOptRC = wMLC.ChangeSectionCategory( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectExclusiveOrSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.IncludeExclusiveOrDU_Section" );
      nOptRC = wMLC.IncludeExclusiveOrDU_Section( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptNext" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.AcceptDFU_SectionGoNext" );
      nOptRC = wMLC.AcceptDFU_SectionGoNext( new zVIEW( vKZXMLPGO ) );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.AcceptDFU_SectionGoPrev" );
      nOptRC = wMLC.AcceptDFU_SectionGoPrev( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelDirectionsUseSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Action Auto Object Function
      nRC = 0;
      try
      {
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_DirectionsForUseSection" );
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
         VmlOperation.CreateMessage( task, "CancelDirectionsUseSect", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_DirectionsForUseStatement" ) )
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
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.DeleteDirectionsForUseStatement" );
      nOptRC = wMLC.DeleteDirectionsForUseStatement( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_ReviewerNote" ) )
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
         csrRC = mMasLC.cursor( "M_DirectionsForUseReviewerNote" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_DirectionsForUseReviewerNote" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_DirectionsForUseReviewerNote" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_DirectionsForUseReviewerNote" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
      EntityCursor cursor = mMasLC.cursor( "M_DirectionsForUseReviewerNote" );
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
         VmlOperation.CreateMessage( task, "DELETE_ReviewerNote", e.getMessage( ), "" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.GOTO_DirsForUseStatementAdd" );
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
      try
      {
      EntityCursor cursor = mMasLC.cursor( "M_DirectionsForUseStatement" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_ReviewerNoteAdd" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Auto Object Function
      nRC = 0;
      try
      {
      View mMasLC = task.getViewByName( "mMasLC" );
      EntityCursor cursor = mMasLC.cursor( "M_DirectionsForUseReviewerNote" );
      cursor.createTemporalEntity( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "GOTO_ReviewerNoteAdd", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "DirectionsForUseReviewerNote" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_ReviewerNoteUpdate" ) )
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
         csrRC = mMasLC.cursor( "M_DirectionsForUseReviewerNote" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mMasLC.cursor( "M_DirectionsForUseReviewerNote" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mMasLC.cursor( "M_DirectionsForUseReviewerNote" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mMasLC.cursor( "M_DirectionsForUseReviewerNote" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Auto Object Function
      nRC = 0;
      try
      {
      EntityCursor cursor = mMasLC.cursor( "M_DirectionsForUseReviewerNote" );
      cursor.createTemporalSubobjectVersion( );

      }
      catch ( Exception e )
      {
         nRC = 2;
         VmlOperation.CreateMessage( task, "GOTO_ReviewerNoteUpdate", e.getMessage( ), "" );
         break;
      }
      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "DirectionsForUseReviewerNote" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_SelectRemoveDrivingDU" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCDirectionsForUseSection", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCDirectionsForUseSection", "wMLC.GOTO_SelectRemoveDrivingDU" );
      nOptRC = wMLC.GOTO_SelectRemoveDrivingDU( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StartModalSubwindow, "wMLC", "DirsForUseDrivingUsageSelect" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wMLCDirectionsForUseSection" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wMLCDirectionsForUseSection" );
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
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "DirectionsForUseSection", "" );
   }

%>

<html>
<head>

<title>Directions for Use Section</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<script language="JavaScript" type="text/javascript" src="./js/common.js?v=20170721190144829"></script>
<script language="JavaScript" type="text/javascript" src="./js/jsoeUtils.js?v=20170721190144829"></script>
<script language="JavaScript" type="text/javascript" src="./js/jsoe.js?v=20170721190144829"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js?v=20170721190144829"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js?v=20170721190144829"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js?v=20170721190144829"></script>
<script language="JavaScript" type="text/javascript" src="./js/tabpane.js?v=20170721190144829"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wMLCDirectionsForUseSection.js?v=20170721190144829"></script>

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
       <li id="AcceptAndReturn" name="AcceptAndReturn"><a href="#"  onclick="AcceptDirectionsUseSect()">Accept & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AddNew" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="AddNew" name="AddNew"><a href="#"  onclick="AddNewDFU_Section()">Add New</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AddCopy" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="AddCopy" name="AddCopy"><a href="#"  onclick="CopyAndAddSection()">Add Copy</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AcceptNext" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="AcceptNext" name="AcceptNext"><a href="#"  onclick="AcceptNext()">Next Section</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AcceptPrev" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="AcceptPrev" name="AcceptPrev"><a href="#"  onclick="AcceptPrevious()">Previous Section</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="CancelAndReturn" name="CancelAndReturn"><a href="#"  onclick="CancelDirectionsUseSect()">Cancel & Return</a></li>
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "DirectionsForUseSection" );
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
   <input name="zLanguage" id="zLanguage" type="hidden" value="">
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
<% /* GBDirectionsForUse:GroupBox */ %>

<div id="GBDirectionsForUse" name="GBDirectionsForUse" class="listgroup"   style="float:left;position:relative; width:822px; height:36px;">  <!-- GBDirectionsForUse --> 

<% /* DirectionsForUseSection:Text */ %>

<label class="groupbox"  id="DirectionsForUseSection" name="DirectionsForUseSection" style="">Directions for Use Section</label>

<% /* Category::Text */ %>

<label class="text12lightright"  id="Category:" name="Category:" style="">  ... Category:</label>

<% /* DFU_CategoryName:Text */ %>
<% strTextDisplayValue = "";
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) == false )
      task.log( ).debug( "Invalid View: " + "DFU_CategoryName" );
   else
   {
      nRC = mMasLC.cursor( "M_DirectionsForUseCategory" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mMasLC.cursor( "M_DirectionsForUseCategory" ).getAttribute( "Name" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on DFU_CategoryName: " + e.getMessage());
         task.log().info( "*** Error on ctrl DFU_CategoryName" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label class="text12light"  id="DFU_CategoryName" name="DFU_CategoryName" style=""><%=strTextDisplayValue%></label>


</div>  <!--  GBDirectionsForUse --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>
<div id="GroupBox2" name="GroupBox2" style="float:left;width:820px;" >

<table cols=1 style="width:820px;"  class="grouptable">

<tr>
<td style="width:800px;">
<% /* GroupBox7:GroupBox */ %>
<div id="GroupBox7" name="GroupBox7" style="float:left;width:800px;" >

<table cols=2 style="width:800px;"  class="grouptable">

<tr>
<td style="width:150px;">
<% /* DirectionsUseName::Text */ %>

<span  id="DirectionsUseName:" name="DirectionsUseName:" style="width:150px;height:16px;" tabindex=-1 >Name:</span>

</td>
<td  class="text12" style="width:650px;">
<% /* DirectionsUseName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "DirectionsUseName", strError );
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
         task.log( ).debug( "Invalid View: " + "DirectionsUseName" );
      else
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "Name" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on DirectionsUseName: " + e.getMessage());
               task.log().error( "*** Error on ctrl DirectionsUseName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_DirectionsForUseSection.Name: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for DirectionsUseName: " + "mMasLC.M_DirectionsForUseSection" );
      }
   }
%>

<input class="text12"  name="DirectionsUseName" id="DirectionsUseName"  title="Required Name to differentiate Directions for Use Sections within a list" style="width:650px;<%=strErrorColor%>" tabindex=-1  type="text"  value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td style="width:150px;">
<% /* DirectionsForUseTitle::Text */ %>

<span  id="DirectionsForUseTitle:" name="DirectionsForUseTitle:" style="width:150px;height:16px;" tabindex=-1 >Title:</span>

</td>
<td  class="text12" style="width:650px;">
<% /* DirectionsForUseTitle:MLEdit */ %>
<%
   // : DirectionsForUseTitle
   strErrorMapValue = VmlOperation.CheckError( "DirectionsForUseTitle", strError );
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
         task.log( ).info( "Invalid View: " + "DirectionsForUseTitle" );
      else
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "Title" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "M_DirectionsForUseSection.Title: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist for DirectionsForUseTitle: " + "mMasLC.M_DirectionsForUseSection" );
      }
   }
%>

<textarea name="DirectionsForUseTitle" id="DirectionsForUseTitle"  title="Optional Title to appear with text on generated label"style="width:650px;height:32px;border:solid;border-width:4px;border-style:groove;" tabindex=-1  class="text12" wrap="wrap"><%=strErrorMapValue%></textarea>

</td>
</tr>
<tr>
<td style="width:150px;">
<% /* TitleNote::Text */ %>

<span  id="TitleNote:" name="TitleNote:" style="width:150px;height:16px;" tabindex=-1 >Title Note:</span>

</td>
<td  class="text12" style="width:650px;">
<% /* TitleNote:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "TitleNote", strError );
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
         task.log( ).debug( "Invalid View: " + "TitleNote" );
      else
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "HeadNote" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on TitleNote: " + e.getMessage());
               task.log().error( "*** Error on ctrl TitleNote", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_DirectionsForUseSection.HeadNote: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for TitleNote: " + "mMasLC.M_DirectionsForUseSection" );
      }
   }
%>

<input class="text12"  name="TitleNote" id="TitleNote"  title="Optional Title to appear with text on generated label" style="width:650px;<%=strErrorColor%>" tabindex=-1  type="text"  value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td style="width:150px;">
<% /* Subtitle::Text */ %>

<span  id="Subtitle:" name="Subtitle:" style="width:150px;height:16px;" tabindex=-1 >Subtitle:</span>

</td>
<td  class="text12" style="width:650px;">
<% /* Subtitle:MLEdit */ %>
<%
   // : Subtitle
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
         task.log( ).info( "Invalid View: " + "Subtitle" );
      else
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "Subtitle" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "M_DirectionsForUseSection.Subtitle: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist for Subtitle: " + "mMasLC.M_DirectionsForUseSection" );
      }
   }
%>

<textarea name="Subtitle" id="Subtitle"  title="Optional Title to appear with text on generated label"style="width:650px;height:96px;border:solid;border-width:4px;border-style:groove;" tabindex=-1  class="text12" wrap="wrap"><%=strErrorMapValue%></textarea>

</td>
</tr>
<tr>
<td style="width:150px;">
<% /* DirectionsForUseReviewerNote::Text */ %>

<span  id="DirectionsForUseReviewerNote:" name="DirectionsForUseReviewerNote:" style="width:150px;height:16px;" tabindex=-1 >Reviewer Note:</span>

</td>
<td  class="text12" style="width:650px;">
<% /* DirectionsForUseReviewerNote:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "DirectionsForUseReviewerNote", strError );
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
         task.log( ).debug( "Invalid View: " + "DirectionsForUseReviewerNote" );
      else
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "ReviewerNote" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on DirectionsForUseReviewerNote: " + e.getMessage());
               task.log().error( "*** Error on ctrl DirectionsForUseReviewerNote", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_DirectionsForUseSection.ReviewerNote: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for DirectionsForUseReviewerNote: " + "mMasLC.M_DirectionsForUseSection" );
      }
   }
%>

<input class="text12"  name="DirectionsForUseReviewerNote" id="DirectionsForUseReviewerNote"  title="Optional Title to appear with text on generated label" style="width:650px;<%=strErrorColor%>" tabindex=-1  type="text"  value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td style="width:150px;">
<% /* SectionEndNote::Text */ %>

<span  id="SectionEndNote:" name="SectionEndNote:" style="width:150px;height:16px;" tabindex=-1 >End Note:</span>

</td>
<td  class="text12" style="width:650px;">
<% /* SectionNote:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "SectionNote", strError );
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
         task.log( ).debug( "Invalid View: " + "SectionNote" );
      else
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "TailNote" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on SectionNote: " + e.getMessage());
               task.log().error( "*** Error on ctrl SectionNote", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_DirectionsForUseSection.TailNote: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for SectionNote: " + "mMasLC.M_DirectionsForUseSection" );
      }
   }
%>

<input class="text12"  name="SectionNote" id="SectionNote"  title="Optional Title to appear with text on generated label" style="width:650px;<%=strErrorColor%>" tabindex=-1  type="text"  value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox7 --> 

</td>
</tr>
<tr>
<td style="width:782px;">
<% /* GroupBox1:GroupBox */ %>
<div id="GroupBox1" name="GroupBox1" style="float:left;width:782px;" >

<table cols=0 style="width:782px;"  class="grouptable">

<tr>
<td style="width:150px;">
<% /* ExclusiveXOR::Text */ %>

<span  id="ExclusiveXOR:" name="ExclusiveXOR:" style="width:140px;height:16px;" tabindex=-1 >Exclusive To:</span>

</td>
<td style="width:256px;">
<% /* ComboBoxXOR:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBoxXOR" id="ComboBoxXOR" size="1"style="width:218px;"  tabindex=-1 onchange="ComboBoxXOROnChange( )">

<%
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
         strComboCurrentValue = "";
      View vComboBoxXOR;
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) )
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseXORSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strComboCurrentValue = mMasLC.cursor( "M_DirectionsForUseXORSection" ).getAttribute( "Name" ).getString( "" );
            if ( strComboCurrentValue == null )
               strComboCurrentValue = "";
         }
      }
      vComboBoxXOR = mMasLC.newView( );
      ComboCount = 0;
      strComboSelectedValue = "0";
      csrRC = vComboBoxXOR.cursor( "DFU_SectionNames" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         strErrorMapValue = vComboBoxXOR.cursor( "DFU_SectionNames" ).getAttribute( "Name" ).getString( "" );
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
         csrRC =  vComboBoxXOR.cursor( "DFU_SectionNames" ).setNextContinue( );
      }

      vComboBoxXOR.drop( );

   }
%>
</select>
<input name="hComboBoxXOR" id="hComboBoxXOR" type="hidden" value="<%=strComboSelectedValue%>" >

</td>
<td style="width:132px;">
<% /* ChangeCategory:Text */ %>

<span  id="ChangeCategory" name="ChangeCategory" style="width:122px;height:16px;" tabindex=-1 >Change Category:</span>

</td>
<td style="width:256px;">
<% /* CMB_Categories:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="CMB_Categories" id="CMB_Categories" size="1"style="width:256px;"  tabindex=-1 onchange="CMB_CategoriesOnChange( )">

<%
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
         strComboCurrentValue = "";
      View vCMB_Categories;
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) )
      {
         nRC = mMasLC.cursor( "M_DirectionsForUseCategory" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strComboCurrentValue = mMasLC.cursor( "M_DirectionsForUseCategory" ).getAttribute( "Name" ).getString( "" );
            if ( strComboCurrentValue == null )
               strComboCurrentValue = "";
         }
      }
      vCMB_Categories = mMasLC.newView( );
      ComboCount = 0;
      strComboSelectedValue = "0";
      csrRC = vCMB_Categories.cursor( "DFU_CategoryNames" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         strErrorMapValue = vCMB_Categories.cursor( "DFU_CategoryNames" ).getAttribute( "Name" ).getString( "" );
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
         csrRC =  vCMB_Categories.cursor( "DFU_CategoryNames" ).setNextContinue( );
      }

      vCMB_Categories.drop( );

   }
%>
</select>
<input name="hCMB_Categories" id="hCMB_Categories" type="hidden" value="<%=strComboSelectedValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox1 --> 

</td>
</tr>
</table>

</div>  <!-- GroupBox2 --> 

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Tab1:Tab */ %>

<div id="Tab1" class="tab-pane" style="width:814px;"> <!-- Beginning of Tab Control Tab1 -->
<script type="text/javascript">Tab1 = new WebFXTabPane( document.getElementById( "Tab1" ) );</script>

<div id="Statements" class="tab-page " > <!-- Tab item Statements -->
<h2 class="tab"><span>Statements</span></h2>
<script type="text/javascript">Tab1.addTabPage( document.getElementById( "Statements" ) );</script>


<div>  <!-- Beginning of a new line -->
<% /* GBDirectionsUseStatements:GroupBox */ %>

<div id="GBDirectionsUseStatements" name="GBDirectionsUseStatements" style="width:810px;float:left;">  <!-- GBDirectionsUseStatements --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox9:GroupBox */ %>

<div id="GroupBox9" name="GroupBox9"   style="float:left;position:relative; width:782px; height:30px;">  <!-- GroupBox9 --> 

<% /* DFU_Statements:Text */ %>

<label class="listheader"  id="DFU_Statements" name="DFU_Statements" style="">Directions for Use Statements</label>

<% /* ExclusiveStatements:CheckBox */ %>
<%
   strErrorMapValue = "";
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) == false )
      task.log( ).debug( "Invalid View: " + "ExclusiveStatements" );
   else
   {
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
         strRadioGroupValue = mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "ExclusiveStatements" ).getString( );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="ExclusiveStatements" id="ExclusiveStatements"  value="Y" <%=strErrorMapValue%> style="position:absolute;left:402px;top:4px;" tabindex=-1 >
<span style="width:172px;height:26px;position:absolute;left:432px;top:4px;">Exclusive Statements</span>

<% /* NewStatement:PushBtn */ %>
<button type="button" class="newbutton"  title="Go to add one or more lines of Directions for Use Statement text" name="NewStatement" id="NewStatement" value="" onclick="GOTO_DirsForUseStatementAdd( )" style="width:78px;height:26px;position:absolute;left:598px;top:4px;" tabindex=-1 >New</button>

<% /* PBSortStatements:PushBtn */ %>
<button type="button" class="newbutton" name="PBSortStatements" id="PBSortStatements" value="" onclick="Sort( )" style="width:78px;height:26px;position:absolute;left:694px;top:4px;" tabindex=-1 >Sort</button>


</div>  <!--  GroupBox9 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridDirectionsUseStatements:Grid */ %>
<table  cols=3 style=""  name="GridDirectionsUseStatements" id="GridDirectionsUseStatements">

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
      String strBMBUpdateDirectionsUseStatement;
      String strBMBDeleteDirectionsUseStatement;
      
      View vGridDirectionsUseStatements;
      vGridDirectionsUseStatements = mMasLC.newView( );
      csrRC2 = vGridDirectionsUseStatements.cursor( "M_DirectionsForUseStatement" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridDirectionsUseStatements.cursor( "M_DirectionsForUseStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditDirectionsUse = "";
         nRC = vGridDirectionsUseStatements.cursor( "M_DirectionsForUseStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditDirectionsUse = vGridDirectionsUseStatements.cursor( "M_DirectionsForUseStatement" ).getAttribute( "dDU_StatementTitleTextKeyword" ).getString( "" );

            if ( strGridEditDirectionsUse == null )
               strGridEditDirectionsUse = "";
         }

         if ( StringUtils.isBlank( strGridEditDirectionsUse ) )
            strGridEditDirectionsUse = "&nbsp";

%>

<tr<%=strOdd%>>

   <td title="Text for the Directions for Use Statement identified on this row" ><a href="#" onclick="GOTO_DirsForUseStatementUpdate( this.id )" id="GridEditDirectionsUse::<%=strEntityKey%>" title="Text for the Directions for Use Statement identified on this row" ><%=strGridEditDirectionsUse%></a></td>
   <td title="Go to update the the Directions for Use Statement text identified on this row" ><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdateDirectionsUseStatement" onclick="GOTO_DirsForUseStatementUpdate( this.id )" id="BMBUpdateDirectionsUseStatement::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png"  title="Go to update the the Directions for Use Statement text identified on this row" alt="Update"></a></td>
   <td title="Delete the Directions for Use Statement entry identified on this row" ><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBDeleteDirectionsUseStatement" onclick="DELETE_DirectionsForUseStatement( this.id )" id="BMBDeleteDirectionsUseStatement::<%=strEntityKey%>"><img src="./images/ePammsDelete.png"  title="Delete the Directions for Use Statement entry identified on this row" alt="Delete"></a></td>

</tr>

<%
         csrRC2 = vGridDirectionsUseStatements.cursor( "M_DirectionsForUseStatement" ).setNextContinue( );
      }
      vGridDirectionsUseStatements.drop( );
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

</div> <!-- End of Tab item Statements -->

<div id="ItemsDrivingSection" class="tab-page " > <!-- Tab item ItemsDrivingSection -->
<h2 class="tab"><span>Items Driving this Section</span></h2>
<script type="text/javascript">Tab1.addTabPage( document.getElementById( "ItemsDrivingSection" ) );</script>


<div>  <!-- Beginning of a new line -->
<% /* GroupBox5:GroupBox */ %>

<div id="GroupBox5" name="GroupBox5" style="width:802px;float:left;">  <!-- GroupBox5 --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox8:GroupBox */ %>

<div id="GroupBox8" name="GroupBox8"   style="float:left;position:relative; width:782px; height:30px;">  <!-- GroupBox8 --> 

<% /* Text4:Text */ %>

<label class="listheader"  id="Text4" name="Text4" style="">Claims/Applications/Locations that Drive this Section to be Included in the SLC based on this MLC</label>

<% /* PushBtn3:PushBtn */ %>
<button type="button" class="newbutton"  title="Go to add or remove Usage entries to be tied to this Statement" name="PushBtn3" id="PushBtn3" value="" onclick="GOTO_SelectRemoveDrivingDU( )" style="width:130px;height:26px;position:absolute;left:642px;top:4px;" tabindex=-1 >Select/Remove</button>


</div>  <!--  GroupBox8 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Grid1:Grid */ %>
<table  cols=2 style=""  name="Grid1" id="Grid1">

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
      String strGridEditCtl1;
      String strGridEditCtl2;
      
      View vGrid1;
      vGrid1 = mMasLC.newView( );
      csrRC2 = vGrid1.cursor( "M_ClaimsDrivingUsage" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid1.cursor( "M_ClaimsDrivingUsage" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditCtl1 = "";
         nRC = vGrid1.cursor( "M_ClaimsDrivingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl1 = vGrid1.cursor( "M_ClaimsDrivingUsage" ).getAttribute( "dUsageClaimClassification" ).getString( "" );

            if ( strGridEditCtl1 == null )
               strGridEditCtl1 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl1 ) )
            strGridEditCtl1 = "&nbsp";

         strGridEditCtl2 = "";
         nRC = vGrid1.cursor( "M_ClaimsDrivingUsage" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl2 = vGrid1.cursor( "M_ClaimsDrivingUsage" ).getAttribute( "dUsageTextSubUsageNames" ).getString( "" );

            if ( strGridEditCtl2 == null )
               strGridEditCtl2 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl2 ) )
            strGridEditCtl2 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td title="The Type of Usage Entry (Claim, Surface, Location, Application)" ><%=strGridEditCtl1%></td>
   <td title="The particular Name/text for the selected Usage entry" ><%=strGridEditCtl2%></td>

</tr>

<%
         csrRC2 = vGrid1.cursor( "M_ClaimsDrivingUsage" ).setNextContinue( );
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


</div>  <!--  GroupBox5 --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item ItemsDrivingSection -->

<div id="Keywords" class="tab-page " > <!-- Tab item Keywords -->
<h2 class="tab"><span>Keywords</span></h2>
<script type="text/javascript">Tab1.addTabPage( document.getElementById( "Keywords" ) );</script>


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* DirectionsForUseTitleKey::Text */ %>

<span  id="DirectionsForUseTitleKey:" name="DirectionsForUseTitleKey:" style="width:70px;height:16px;" tabindex=-1 >Title:</span>

<span style="height:16px;">&nbsp</span>
<% /* DirectionsForUseTitleKey:Text */ %>
<% strTextDisplayValue = "";
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) == false )
      task.log( ).debug( "Invalid View: " + "DirectionsForUseTitleKey" );
   else
   {
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "dDU_SectionTitleKeyword" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on DirectionsForUseTitleKey: " + e.getMessage());
         task.log().info( "*** Error on ctrl DirectionsForUseTitleKey" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text12"  id="DirectionsForUseTitleKey" name="DirectionsForUseTitleKey"  title="Optional Title to appear with text on generated label" style="width:698px;height:16px;" tabindex=-1 ><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* SubtitleKey::Text */ %>

<span  id="SubtitleKey:" name="SubtitleKey:" style="width:70px;height:16px;" tabindex=-1 >Subtitle:</span>

<span style="height:16px;">&nbsp</span>
<% /* SubtitleKey:Text */ %>
<% strTextDisplayValue = "";
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) == false )
      task.log( ).debug( "Invalid View: " + "SubtitleKey" );
   else
   {
      nRC = mMasLC.cursor( "M_DirectionsForUseSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mMasLC.cursor( "M_DirectionsForUseSection" ).getAttribute( "dDU_SectionTextKeyword" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on SubtitleKey: " + e.getMessage());
         task.log().info( "*** Error on ctrl SubtitleKey" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text12"  id="SubtitleKey" name="SubtitleKey"  title="Optional Title to appear with text on generated label" style="width:698px;height:16px;" tabindex=-1 ><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox10:GroupBox */ %>

<div id="GroupBox10" name="GroupBox10" style="width:778px;float:left;">  <!-- GroupBox10 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* GroupBox6:GroupBox */ %>

<div id="GroupBox6" name="GroupBox6"   style="float:left;position:relative; width:756px; height:30px;">  <!-- GroupBox6 --> 

<% /* Refrest:PushBtn */ %>
<button type="button" class="newbutton" name="Refrest" id="Refrest" value="" onclick="DisplayGeneratedTextDU( )" style="width:76px;height:26px;position:absolute;left:386px;top:4px;" tabindex=-1 >Refresh</button>

<% /* ParseText:PushBtn */ %>
<button type="button" class="newbutton" name="ParseText" id="ParseText" value="" onclick="ParseSectionText( )" style="width:94px;height:26px;position:absolute;left:474px;top:4px;" tabindex=-1 >Parse Text</button>

<% /* NewKeyword:PushBtn */ %>
<button type="button" class="newbutton" name="NewKeyword" id="NewKeyword" value="" onclick="ADD_SectionKeywordDU( )" style="width:66px;height:26px;position:absolute;left:582px;top:4px;" tabindex=-1 >New</button>

<% /* PBSort:PushBtn */ %>
<button type="button" class="newbutton" name="PBSort" id="PBSort" value="" onclick="Sort( )" style="width:66px;height:26px;position:absolute;left:660px;top:4px;" tabindex=-1 >Sort</button>

<% /* KeywordTextEmbedding:Text */ %>

<label class="listheader"  id="KeywordTextEmbedding" name="KeywordTextEmbedding" style="">Keyword text for Embedding in Section Title/Subtitle</label>


</div>  <!--  GroupBox6 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridDFU_SectionKeywords:Grid */ %>
<table  cols=5 style=""  name="GridDFU_SectionKeywords" id="GridDFU_SectionKeywords">

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
      String strKeywordName;
      String strKeywordText;
      String strBMBUpdate;
      String strBMBCopy;
      String strBMBDelete;
      
      View vGridDFU_SectionKeywords;
      vGridDFU_SectionKeywords = mMasLC.newView( );
      csrRC2 = vGridDFU_SectionKeywords.cursor( "M_InsertTextKeywordSectionDU" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridDFU_SectionKeywords.cursor( "M_InsertTextKeywordSectionDU" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strKeywordName = "";
         nRC = vGridDFU_SectionKeywords.cursor( "M_InsertTextKeywordSectionDU" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strKeywordName = vGridDFU_SectionKeywords.cursor( "M_InsertTextKeywordSectionDU" ).getAttribute( "Name" ).getString( "" );

            if ( strKeywordName == null )
               strKeywordName = "";
         }

         if ( StringUtils.isBlank( strKeywordName ) )
            strKeywordName = "&nbsp";

         strKeywordText = "";
         nRC = vGridDFU_SectionKeywords.cursor( "M_InsertTextSectionDU" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strKeywordText = vGridDFU_SectionKeywords.cursor( "M_InsertTextSectionDU" ).getAttribute( "Text" ).getString( "" );

            if ( strKeywordText == null )
               strKeywordText = "";
         }

         if ( StringUtils.isBlank( strKeywordText ) )
            strKeywordText = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="GOTO_MarketingKeywordUpdate( this.id )" id="KeywordName::<%=strEntityKey%>"><%=strKeywordName%></a></td>
   <td><%=strKeywordText%></td>
   <td><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdate" onclick="GOTO_MarketingKeywordUpdate( this.id )" id="BMBUpdate::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png" alt="Update"></a></td>
   <td><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBCopy" onclick="COPY_InsertKeywordTitleDU( this.id )" id="BMBCopy::<%=strEntityKey%>"><img src="./images/ePammsCopy.png" alt="Copy"></a></td>
   <td><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBDelete" onclick="DELETE_TextKeywordTitleDU( this.id )" id="BMBDelete::<%=strEntityKey%>"><img src="./images/ePammsDelete.png" alt="Delete"></a></td>

</tr>

<%
         csrRC2 = vGridDFU_SectionKeywords.cursor( "M_InsertTextKeywordSectionDU" ).setNextContinue( );
      }
      vGridDFU_SectionKeywords.drop( );
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


</div>  <!--  GroupBox10 --> 
</div>  <!-- End of a new line -->

</div> <!-- End of Tab item Keywords -->

<div id="ReviewerNotes" class="tab-page " > <!-- Tab item ReviewerNotes -->
<h2 class="tab"><span>Reviewer Notes</span></h2>
<script type="text/javascript">Tab1.addTabPage( document.getElementById( "ReviewerNotes" ) );</script>


<div>  <!-- Beginning of a new line -->
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:806px;float:left;">  <!-- GroupBox3 --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4"   style="float:left;position:relative; width:716px; height:30px;">  <!-- GroupBox4 --> 

<% /* Note:Text */ %>

<label class="listheader"  id="Note" name="Note" style="">Notes to Reviewer</label>

<% /* NewNote:PushBtn */ %>
<button type="button" class="newbutton"  title="Go to add one or more lines of Directions for Use Statement text" name="NewNote" id="NewNote" value="" onclick="GOTO_ReviewerNoteAdd( )" style="width:78px;height:26px;position:absolute;left:578px;top:4px;" tabindex=-1 >New</button>


</div>  <!--  GroupBox4 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* Grid2:Grid */ %>
<table  cols=3 style=""  name="Grid2" id="Grid2">

<thead><tr>

   <th>Reviewer Note</th>
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
      String strGridEditCtl3;
      String strBitmapBtn1;
      String strBitmapBtn2;
      
      View vGrid2;
      vGrid2 = mMasLC.newView( );
      csrRC2 = vGrid2.cursor( "M_DirectionsForUseReviewerNote" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGrid2.cursor( "M_DirectionsForUseReviewerNote" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditCtl3 = "";
         nRC = vGrid2.cursor( "M_DirectionsForUseReviewerNote" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl3 = vGrid2.cursor( "M_DirectionsForUseReviewerNote" ).getAttribute( "Text" ).getString( "" );

            if ( strGridEditCtl3 == null )
               strGridEditCtl3 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl3 ) )
            strGridEditCtl3 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td title="Text for the Directions for Use Statement identified on this row" ><a href="#" onclick="GOTO_ReviewerNoteUpdate( this.id )" id="GridEditCtl3::<%=strEntityKey%>" title="Text for the Directions for Use Statement identified on this row" ><%=strGridEditCtl3%></a></td>
   <td title="Go to update the the Directions for Use Statement text identified on this row" ><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BitmapBtn1" onclick="GOTO_ReviewerNoteUpdate( this.id )" id="BitmapBtn1::<%=strEntityKey%>"><img src="./images/ePammsUpdate.png"  title="Go to update the the Directions for Use Statement text identified on this row" alt="Update"></a></td>
   <td title="Delete the Directions for Use Statement entry identified on this row" ><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BitmapBtn2" onclick="DELETE_ReviewerNote( this.id )" id="BitmapBtn2::<%=strEntityKey%>"><img src="./images/ePammsDelete.png"  title="Delete the Directions for Use Statement entry identified on this row" alt="Delete"></a></td>

</tr>

<%
         csrRC2 = vGrid2.cursor( "M_DirectionsForUseReviewerNote" ).setNextContinue( );
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

</div> <!-- End of Tab item ReviewerNotes -->

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
   session.setAttribute( "ZeidonWindow", "wMLCDirectionsForUseSection" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
