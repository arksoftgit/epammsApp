<!DOCTYPE HTML>

<%-- wSPLDSPLD_BlockDefinitionUpdate --%>

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

   View mSPLDef = null;
   View mSPLDefBlock = null;
   View wWebXfer = null;
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

   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
      // Grid: GridComponentList
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSPLDef.newView( );
      csrRC = vGridTmp.cursor( "Display" ).setFirst( "SubregPhysicalLabelDef" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "Display" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "Display" ).setNextContinue( );
      }

      vGridTmp.drop( );
   }

   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) )
   {
      // Grid: SpecialSectionAttributes
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSPLDefBlock.newView( );
      csrRC = vGridTmp.cursor( "LLD_SpecialSectionAttribute" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "LLD_SpecialSectionAttribute" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "LLD_SpecialSectionAttribute" ).setNextContinue( );
      }

      vGridTmp.drop( );
   }

   wWebXfer = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXfer ) )
   {
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

if ( strLastWindow.equals("wSPLDSPLD_BlockDefinitionUpdate") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wSPLD_Dialog wSPLD = new wSPLD_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wSPLDSPLD_BlockDefinitionUpdate strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSPLDSPLD_BlockDefinitionUpdate LastWindow *** " + strLastWindow );
task.log().info("*** wSPLDSPLD_BlockDefinitionUpdate LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ACCEPT_BlockSubBlockDefinition" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate", "wSPLD.ACCEPT_BlockSubBlockDefinition" );
      nOptRC = wSPLD.ACCEPT_BlockSubBlockDefinition( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SaveAsReusableBlock" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate", "wSPLD.InitializeNewReusableBlock" );
      nOptRC = wSPLD.InitializeNewReusableBlock( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "NewReusableBlock" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CANCEL_BlockSubBlockDefinition" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate", "wSPLD.CANCEL_BlockSubBlockDefinition" );
      nOptRC = wSPLD.CANCEL_BlockSubBlockDefinition( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DELETE_SpecialFormatDef" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate", "wSPLD.DELETE_SpecialFormatDef" );
      nOptRC = wSPLD.DELETE_SpecialFormatDef( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GENERATE_SPLD_Label" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate", "wSPLD.GENERATE_SPLD_Label" );
      nOptRC = wSPLD.GENERATE_SPLD_Label( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GENERATE_SPLD_LabelDottedBorders" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate", "wSPLD.GENERATE_SPLD_LabelDottedBorders" );
      nOptRC = wSPLD.GENERATE_SPLD_LabelDottedBorders( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_NewSpecialFormatDefinition" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate", "wSPLD.GOTO_NewSpecialFormatDefinition" );
      nOptRC = wSPLD.GOTO_NewSpecialFormatDefinition( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "SPLD_BlockSpecialFormatDef" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_SelectMarketingSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "SPLD_BlockMarketingSectionSelect" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_UpdateSpecialFormatDef" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSPLDefBlock;
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSPLDefBlock.cursor( "LLD_SpecialSectionAttribute" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSPLDefBlock.cursor( "LLD_SpecialSectionAttribute" ).setFirst( );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSPLDefBlock.cursor( "LLD_SpecialSectionAttribute" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSPLDefBlock.cursor( "LLD_SpecialSectionAttribute" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate", "wSPLD.GOTO_UpdateSpecialFormatDef" );
      nOptRC = wSPLD.GOTO_UpdateSpecialFormatDef( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "SPLD_BlockSpecialFormatDef" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_UpdateSPLD_Statement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Position on the entity that was selected in the grid.
      String strEntityKey = (String) request.getParameter( "zTableRowSelect" );
      View mSPLDef;
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) )
      {
         lEKey = java.lang.Long.parseLong( strEntityKey );
         csrRC = mSPLDef.cursor( "Display" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSPLDef.cursor( "Display" ).setFirst("SubregPhysicalLabelDef" );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSPLDef.cursor( "Display" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSPLDef.cursor( "Display" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate", "wSPLD.GOTO_UpdateSPLD_Statement" );
      nOptRC = wSPLD.GOTO_UpdateSPLD_Statement( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "SPLD_StatementUpdate" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SelectReusableBlock" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "SPLD_SelectReusableBlock" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wSPLDSPLD_BlockDefinitionUpdate" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wSPLDSPLD_BlockDefinitionUpdate" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSPLDSPLD_BlockDefinitionUpdate.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSPLDSPLD_BlockDefinitionUpdate.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSPLDSPLD_BlockDefinitionUpdate.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSPLDSPLD_BlockDefinitionUpdate.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate", "wSPLD.PrebuildBlockDefinitionUpdate" );
   nOptRC = wSPLD.PrebuildBlockDefinitionUpdate( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getAttribute( "WebReturnMessage" ).getString( "" );
      strURLParameters = "?CallingPage=wSPLDSPLD_BlockDefinitionUpdate.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wSPLD" +
                         "&OperationName=" + "PrebuildBlockDefinitionUpdate";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSPLD", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wSPLD", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "SPLD_BlockDefinitionUpdate", "" );
   }

%>

<html>
<head>

<title>Update SPLD Block Definition</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSPLDSPLD_BlockDefinitionUpdate.js"></script>

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
       <li id="AcceptAndReturn" name="AcceptAndReturn"><a href="#"  onclick="ACCEPT_BlockSubBlockDefinition()">Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "GenerateLabel" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="GenerateLabel" name="GenerateLabel"><a href="#"  onclick="GENERATE_SPLD_Label()">Generate Label</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SelectReusableBlock" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="SelectReusableBlock" name="SelectReusableBlock"><a href="#"  onclick="SelectReusableBlock()">Select Reusable Block</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SaveAsReusableBlock" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="SaveAsReusableBlock" name="SaveAsReusableBlock"><a href="#"  onclick="SaveAsReusableBlock()">Save as Reusable Block</a></li>
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


<form name="wSPLDSPLD_BlockDefinitionUpdate" id="wSPLDSPLD_BlockDefinitionUpdate" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lMLC = null;
   View lSPLDLST = null;
   View mLLD_LST = null;
   View mMasLC = null;
   View mPrimReg = null;
   View ReusableBlock = null;
   View mSPLDef = null;
   View mSPLDefBlock = null;
   View mSPLDefPanel = null;
   View mSubLC = null;
   View mSubProd = null;
   View mSubreg = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSPLD", "SPLD_BlockDefinitionUpdate" );
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
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:140px;height:30px;float:left;">  <!-- GroupBox3 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:20px;">&nbsp</span>
<% /* TXRelatedSection:Text */ %>

<label  id="TXRelatedSection" name="TXRelatedSection" style="width:118px;height:20px;">Related Section</label>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox3 --> 
<div style="height:1px;width:24px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:500px;height:30px;float:left;">  <!-- GroupBox1 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:20px;">&nbsp&nbsp</span>
<% /* SectionType:Text */ %>
<% strTextDisplayValue = "";
   wWebXfer = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXfer ) == false )
      task.log( ).debug( "Invalid View: " + "SectionType" );
   else
   {
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = wWebXfer.cursor( "Root" ).getAttribute( "CurrentSectionTitle" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on SectionType: " + e.getMessage());
         task.log().info( "*** Error on ctrl SectionType" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="SectionType" name="SectionType" style="width:468px;height:20px;"><%=strTextDisplayValue%></label>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox1 --> 
<span style="height:20px;">&nbsp&nbsp&nbsp&nbsp</span>
<% /* Tag:Text */ %>
<% strTextDisplayValue = "";
   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) == false )
      task.log( ).debug( "Invalid View: " + "Tag" );
   else
   {
      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "Tag" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on Tag: " + e.getMessage());
         task.log().info( "*** Error on ctrl Tag" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text9light"  id="Tag" name="Tag" style="width:178px;height:20px;text-align:right;"><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox5:GroupBox */ %>

<div id="GroupBox5" name="GroupBox5" style="width:866px;height:50px;float:left;">  <!-- GroupBox5 --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox6:GroupBox */ %>

<div id="GroupBox6" name="GroupBox6" style="width:532px;height:34px;float:left;">  <!-- GroupBox6 --> 


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* TXBlockFormattingDefinitions:Text */ %>

<span  id="TXBlockFormattingDefinitions" name="TXBlockFormattingDefinitions" style="width:250px;height:20px;">Block Formatting Definitions</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox6 --> 
</div>  <!-- End of a new line -->


</div>  <!--  GroupBox5 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* SpecialSectionAttributes:Grid */ %>
<table  cols=5 style=""  name="SpecialSectionAttributes" id="SpecialSectionAttributes">

<thead><tr>

   <th>Formatting Keyword</th>
   <th>Font Size</th>
   <th>Bottom Margin</th>
   <th>Weight</th>
   <th>Color</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strFormattingKeyword;
      String strFontSize;
      String strBottomMargin;
      String strWeight;
      String strColor;
      
      View vSpecialSectionAttributes;
      vSpecialSectionAttributes = mSPLDefBlock.newView( );
      csrRC2 = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttribute" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttribute" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strFormattingKeyword = "";
         nRC = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttribute" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strFormattingKeyword = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttribute" ).getAttribute( "Name" ).getString( "" );

            if ( strFormattingKeyword == null )
               strFormattingKeyword = "";
         }

         if ( StringUtils.isBlank( strFormattingKeyword ) )
            strFormattingKeyword = "&nbsp";

         strFontSize = "";
         nRC = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strFontSize = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "FontSize" ).getString( "" );

            if ( strFontSize == null )
               strFontSize = "";
         }

         if ( StringUtils.isBlank( strFontSize ) )
            strFontSize = "&nbsp";

         strBottomMargin = "";
         nRC = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strBottomMargin = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "MarginBottom" ).getString( "" );

            if ( strBottomMargin == null )
               strBottomMargin = "";
         }

         if ( StringUtils.isBlank( strBottomMargin ) )
            strBottomMargin = "&nbsp";

         strWeight = "";
         nRC = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strWeight = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "FontWeight" ).getString( "" );

            if ( strWeight == null )
               strWeight = "";
         }

         if ( StringUtils.isBlank( strWeight ) )
            strWeight = "&nbsp";

         strColor = "";
         nRC = vSpecialSectionAttributes.cursor( "SpecialAttributeTextColor" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strColor = vSpecialSectionAttributes.cursor( "SpecialAttributeTextColor" ).getAttribute( "dColorName" ).getString( "" );

            if ( strColor == null )
               strColor = "";
         }

         if ( StringUtils.isBlank( strColor ) )
            strColor = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><a href="#" onclick="GOTO_UpdateSpecialFormatDef( this.id )" id="FormattingKeyword::<%=strEntityKey%>"><%=strFormattingKeyword%></a></td>
   <td><a href="#" onclick="GOTO_UpdateSpecialFormatDef( this.id )" id="FontSize::<%=strEntityKey%>"><%=strFontSize%></a></td>
   <td><a href="#" onclick="GOTO_UpdateSpecialFormatDef( this.id )" id="BottomMargin::<%=strEntityKey%>"><%=strBottomMargin%></a></td>
   <td><a href="#" onclick="GOTO_UpdateSpecialFormatDef( this.id )" id="Weight::<%=strEntityKey%>"><%=strWeight%></a></td>
   <td><a href="#" onclick="GOTO_UpdateSpecialFormatDef( this.id )" id="Color::<%=strEntityKey%>"><%=strColor%></a></td>

</tr>

<%
         csrRC2 = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttribute" ).setNextContinue( );
      }
      vSpecialSectionAttributes.drop( );
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

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:22px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* HideBox:GroupBox */ %>

<div id="HideBox" name="HideBox" style="width:866px;height:50px;float:left;">  <!-- HideBox --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* HideInnerBox:GroupBox */ %>

<div id="HideInnerBox" name="HideInnerBox" style="width:532px;float:left;">  <!-- HideInnerBox --> 


<div>  <!-- Beginning of a new line -->
<% /* HideText:Text */ %>

<span  id="HideText" name="HideText" style="width:250px;height:22px;">SPLD Components</span>

</div>  <!-- End of a new line -->


</div>  <!--  HideInnerBox --> 
</div>  <!-- End of a new line -->


</div>  <!--  HideBox --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridComponentList:Grid */ %>
<table  cols=3 style=""  name="GridComponentList" id="GridComponentList">

<thead><tr>

   <th style="width:126px;">Name</th>
   <th style="width:50px;">Cont</th>
   <th>Type/Content</th>

</tr></thead>

<tbody>

<%
try
{
   iTableRowCnt = 0;
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) )
   {
      long   lEntityKey;
      String strEntityKey;
      String strButtonName;
      String strOdd;
      String strTag;
      String strComponentName;
      String strComponentBreak;
      String strComponentValue;
      
      View vGridComponentList;
      vGridComponentList = mSPLDef.newView( );
      csrRC2 = vGridComponentList.cursor( "Display" ).setFirst( "SubregPhysicalLabelDef" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridComponentList.cursor( "Display" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strComponentName = "";
         nRC = vGridComponentList.cursor( "CompositeComponentList" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strComponentName = vGridComponentList.cursor( "CompositeComponentList" ).getAttribute( "DisplayTypeIndent" ).getString( "" );

            if ( strComponentName == null )
               strComponentName = "";
         }

         if ( StringUtils.isBlank( strComponentName ) )
            strComponentName = "&nbsp";

         strComponentBreak = "";
         nRC = vGridComponentList.cursor( "CompositeComponentList" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strComponentBreak = vGridComponentList.cursor( "CompositeComponentList" ).getAttribute( "ContinuationBreakFlag" ).getString( "ShortName" );

            if ( strComponentBreak == null )
               strComponentBreak = "";
         }

         if ( StringUtils.isBlank( strComponentBreak ) )
            strComponentBreak = "&nbsp";

         strComponentValue = "";
         nRC = vGridComponentList.cursor( "CompositeComponentList" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strComponentValue = vGridComponentList.cursor( "CompositeComponentList" ).getAttribute( "Value" ).getString( "" );

            if ( strComponentValue == null )
               strComponentValue = "";
         }

         if ( StringUtils.isBlank( strComponentValue ) )
            strComponentValue = "&nbsp";

%>

<tr<%=strOdd%>>

   <td nowrap style="width:126px;"><a href="#" onclick="GOTO_UpdateSPLD_Statement( this.id )" id="ComponentName::<%=strEntityKey%>"><%=strComponentName%></a></td>
   <td nowrap style="width:50px;"><%=strComponentBreak%></td>
   <td><%=strComponentValue%></td>

</tr>

<%
         csrRC2 = vGridComponentList.cursor( "Display" ).setNextContinue( );
      }
      vGridComponentList.drop( );
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
   session.setAttribute( "ZeidonWindow", "wSPLDSPLD_BlockDefinitionUpdate" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
