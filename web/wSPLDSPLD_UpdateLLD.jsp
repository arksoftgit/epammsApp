<!DOCTYPE HTML>

<%-- wSPLDSPLD_UpdateLLD --%>

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
      // EditBox: EditBox1
      nRC = mSPLDef.cursor( "SubregPhysicalLabelDef" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox1" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox1", "", strMapValue );
            else
               mSPLDef.cursor( "SubregPhysicalLabelDef" ).setAttribute( "Name", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox1", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox5
      nRC = mSPLDef.cursor( "SubregPhysicalLabelDef" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox5" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox5", "", strMapValue );
            else
               mSPLDef.cursor( "SubregPhysicalLabelDef" ).setAttribute( "ProductName", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox5", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox6
      nRC = mSPLDef.cursor( "LLD_Page" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox6" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox6", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_Page" ).setAttribute( "Height", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox6", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox7
      nRC = mSPLDef.cursor( "LLD_Page" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox7" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox7", "", strMapValue );
            else
               mSPLDef.cursor( "LLD_Page" ).setAttribute( "Width", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox7", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox4
      nRC = mSPLDef.cursor( "SPLD_LLD" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox4" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox4", "", strMapValue );
            else
               mSPLDef.cursor( "SPLD_LLD" ).setAttribute( "ContinuationPreviousPageText", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox4", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox3
      nRC = mSPLDef.cursor( "SPLD_LLD" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox3" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox3", "", strMapValue );
            else
               mSPLDef.cursor( "SPLD_LLD" ).setAttribute( "ContNextPageTextDirForUse", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox3", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox2
      nRC = mSPLDef.cursor( "SPLD_LLD" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox2", "", strMapValue );
            else
               mSPLDef.cursor( "SPLD_LLD" ).setAttribute( "ContNextPageTextMarketing", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox2", e.getReason( ), strMapValue );
         }
      }

      // Grid: GridPrimaryRegistrant1
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSPLDef.newView( );
      csrRC = vGridTmp.cursor( "LLD_Panel" ).setFirst( "SubregPhysicalLabelDef" );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "LLD_Panel" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "LLD_Panel" ).setNextContinue( );
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

if ( strLastWindow.equals("wSPLDSPLD_UpdateLLD") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wSPLDSPLD_UpdateLLD strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSPLDSPLD_UpdateLLD LastWindow *** " + strLastWindow );
task.log().info("*** wSPLDSPLD_UpdateLLD LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelAndReturn" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_UpdateLLD.jsp", "wSPLD.CancelSPLD" );
         nOptRC = wSPLD.CancelSPLD( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GraphicalView" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "GraphicalView" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CLEAN_SPLD_Data" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_UpdateLLD.jsp", "wSPLD.CLEAN_SPLD_Data" );
         nOptRC = wSPLD.CLEAN_SPLD_Data( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "DeletePanelEntry" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

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
         csrRC = mSPLDef.cursor( "LLD_Panel" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSPLDef.cursor( "LLD_Panel" ).setFirst("SubregPhysicalLabelDef" );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSPLDef.cursor( "LLD_Panel" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSPLDef.cursor( "LLD_Panel" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_UpdateLLD.jsp", "wSPLD.DeletePanelEntry" );
         nOptRC = wSPLD.DeletePanelEntry( new zVIEW( vKZXMLPGO ) );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_UpdateLLD.jsp", "wSPLD.GENERATE_SPLD_Label" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_UpdateLLD.jsp", "wSPLD.GENERATE_SPLD_LabelDottedBorders" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_AddPanelEntry" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

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
         csrRC = mSPLDef.cursor( "LLD_Panel" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSPLDef.cursor( "LLD_Panel" ).setFirst("SubregPhysicalLabelDef" );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSPLDef.cursor( "LLD_Panel" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSPLDef.cursor( "LLD_Panel" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_UpdateLLD.jsp", "wSPLD.GOTO_AddPanelEntry" );
         nOptRC = wSPLD.GOTO_AddPanelEntry( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "SPLD_PanelUpdate" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DeleteSPLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "DeleteSubregProductSPLD" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_DisplaySPLD_Components" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReplaceWindowWithModalWindow, "wSPLD", "SPLD_Components" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_GenerateLLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "LLD_GenerateFromSPLD" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_SelectLLD_ForSPLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "SelectLLD_ForSPLD" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "GOTO_UpdatePanelEntry" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

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
         csrRC = mSPLDef.cursor( "LLD_Panel" ).setByEntityKey( lEKey );
         if ( !csrRC.isSet() )
         {
            boolean bFound = false;
            csrRCk = mSPLDef.cursor( "LLD_Panel" ).setFirst("SubregPhysicalLabelDef" );
            while ( csrRCk.isSet() && !bFound )
            {
               lEKey = mSPLDef.cursor( "LLD_Panel" ).getEntityKey( );
               strKey = Long.toString( lEKey );
               if ( StringUtils.equals( strKey, strEntityKey ) )
               {
                  // Stop while loop because we have positioned on the correct entity.
                  bFound = true;
               }
               else
                  csrRCk = mSPLDef.cursor( "LLD_Panel" ).setNextContinue( );
            } // Grid
         }
      }

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_UpdateLLD.jsp", "wSPLD.GOTO_UpdatePanelEntry" );
         nOptRC = wSPLD.GOTO_UpdatePanelEntry( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "SPLD_PanelUpdate" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SaveAndReturn" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_UpdateLLD.jsp", "wSPLD.SaveSPLD_AndReturn" );
         nOptRC = wSPLD.SaveSPLD_AndReturn( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SaveSPLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_UpdateLLD.jsp", "wSPLD.SaveSPLD" );
         nOptRC = wSPLD.SaveSPLD( new zVIEW( vKZXMLPGO ) );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wSPLDSPLD_UpdateLLD" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wSPLDSPLD_UpdateLLD" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_UpdateLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSPLDSPLD_UpdateLLD.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSPLDSPLD_UpdateLLD.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSPLDSPLD_UpdateLLD.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSPLDSPLD_UpdateLLD.jsp" );
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
   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSPLD", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getStringFromAttribute( "BannerName" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).setAttribute( "CurrentDialog", "wSPLD" );
      wWebXA.cursor( "Root" ).setAttribute( "CurrentWindow", "SPLD_UpdateLLD" );
   }

%>

<html>
<head>

<title>SPLD_UpdateLLD</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/md5.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSPLDSPLD_UpdateLLD.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SaveAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="SaveAndReturn( )">Save and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="CancelAndReturn( )">Cancel and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New6" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="SaveSPLD( )">Save</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New2" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="GOTO_DisplaySPLD_Components( )">Components</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "GraphicalView" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="GraphicalView( )">Graphical View</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New1" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="GENERATE_SPLD_Label( )">Generate Label</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New7" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="GENERATE_SPLD_LabelDottedBorders( )">Generate Label with Borders</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New4" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="GOTO_SelectLLD_ForSPLD( )">Select LLD</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New3" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="GOTO_GenerateLLD( )">Generate LLD</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New5" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="CLEAN_SPLD_Data( )">Clean Data</a></li>
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


<form name="wSPLDSPLD_UpdateLLD" id="wSPLDSPLD_UpdateLLD" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lMLC = null;
   View lSPLDLST = null;
   View mSPLDefBlock = null;
   View mLLD_LST = null;
   View mMasLC = null;
   View mPrimReg = null;
   View mSPLDef = null;
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

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getStringFromAttribute( "SolicitSaveFlag" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSPLD", "SPLD_UpdateLLD" );
   strOpenFile = VmlOperation.FindOpenFile( task );
   strDateFormat = "YYYY.MM.DD";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      nRC = wWebXA.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strKeyRole = wWebXA.cursor( "Root" ).getStringFromAttribute( "KeyRole", "KeyRole" );
         if ( strKeyRole == null )
            strKeyRole = "";

         task.log().info( "Root.KeyRole: " + strKeyRole );
      }
   }
%>

   <input name="zFocusCtrl" id="zFocusCtrl" type="hidden" value="<%=strFocusCtrl%>">
   <input name="zOpenFile" id="zOpenFile" type="hidden" value="<%=strOpenFile%>">
   <input name="zDateFormat" id="zDateFormat" type="hidden" value="<%=strDateFormat%>">
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
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Registrants:GroupBox */ %>

<div id="Registrants" name="Registrants" style="width:658px;height:254px;float:left;">  <!-- Registrants --> 


 <!-- This is added as a line spacer -->
<div style="height:18px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox6:GroupBox */ %>
<div id="GroupBox6" name="GroupBox6" style="float:left;width:534px;" >

<table cols=2 style="width:534px;"  class="grouptable">

<tr>
<td valign="top" style="width:140px;">
<% /* PrimaryRegistrantName:2:Text */ %>

<span  id="PrimaryRegistrantName:2" name="PrimaryRegistrantName:2" style="width:130px;height:16px;">Registrant Product:</span>

</td>
<td valign="top"  class="text14bold" style="width:366px;">
<% /* TXName2:Text */ %>
<% strTextDisplayValue = "";
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) == false )
      task.log( ).debug( "Invalid View: " + "TXName2" );
   else
   {
      nRC = mSPLDef.cursor( "MasterProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSPLDef.cursor( "MasterProduct" ).getStringFromAttribute( "Name", "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on TXName2: " + e.getMessage());
         task.log().info( "*** Error on ctrl TXName2" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span class="text14bold"  id="TXName2" name="TXName2" style="width:366px;height:16px;"><%=strTextDisplayValue%></span>

</td>
</tr>
<tr>
<td valign="top" style="width:140px;">
<% /* Subregistrant:2:Text */ %>

<span  id="Subregistrant:2" name="Subregistrant:2" style="width:130px;height:16px;">Subreg Product:</span>

</td>
<td valign="top" style="width:366px;">
<% /* Text3:Text */ %>
<% strTextDisplayValue = "";
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) == false )
      task.log( ).debug( "Invalid View: " + "Text3" );
   else
   {
      nRC = mSPLDef.cursor( "SubregProduct" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSPLDef.cursor( "SubregProduct" ).getStringFromAttribute( "Name", "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on Text3: " + e.getMessage());
         task.log().info( "*** Error on ctrl Text3" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span  id="Text3" name="Text3" style="width:366px;height:16px;"><%=strTextDisplayValue%></span>

</td>
</tr>
<tr>
<td valign="top" style="width:140px;">
<% /* Text4:Text */ %>

<span  id="Text4" name="Text4" style="width:130px;height:18px;">SLC Name:</span>

</td>
<td valign="top" style="width:366px;">
<% /* Subregistrant2:Text */ %>
<% strTextDisplayValue = "";
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) == false )
      task.log( ).debug( "Invalid View: " + "Subregistrant2" );
   else
   {
      nRC = mSPLDef.cursor( "SubregLabelContent" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSPLDef.cursor( "SubregLabelContent" ).getStringFromAttribute( "Description", "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on Subregistrant2: " + e.getMessage());
         task.log().info( "*** Error on ctrl Subregistrant2" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span  id="Subregistrant2" name="Subregistrant2" style="width:366px;height:16px;"><%=strTextDisplayValue%></span>

</td>
</tr>
<tr>
<td valign="top" style="width:140px;">
<% /* Text5:Text */ %>

<span  id="Text5" name="Text5" style="width:130px;height:18px;">SLC Version:</span>

</td>
<td valign="top" style="width:366px;">
<% /* Text6:Text */ %>
<% strTextDisplayValue = "";
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) == false )
      task.log( ).debug( "Invalid View: " + "Text6" );
   else
   {
      nRC = mSPLDef.cursor( "SubregLabelContent" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSPLDef.cursor( "SubregLabelContent" ).getStringFromAttribute( "Version", "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on Text6: " + e.getMessage());
         task.log().info( "*** Error on ctrl Text6" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span  id="Text6" name="Text6" style="width:366px;height:18px;"><%=strTextDisplayValue%></span>

</td>
</tr>
</table>

</div>  <!-- GroupBox6 --> 

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox7:GroupBox */ %>
<div id="GroupBox7" name="GroupBox7" style="float:left;width:534px;" >

<table cols=2 style="width:534px;"  class="grouptable">

<tr>
<td valign="top" style="width:188px;">
<% /* Text7:Text */ %>

<span  id="Text7" name="Text7" style="width:186px;height:18px;">SPLD Name:</span>

</td>
<td valign="top" style="width:338px;">
<% /* EditBox1:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EditBox1", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) == false )
         task.log( ).debug( "Invalid View: " + "EditBox1" );
      else
      {
         nRC = mSPLDef.cursor( "SubregPhysicalLabelDef" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "SubregPhysicalLabelDef" ).getStringFromAttribute( "Name", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox1: " + e.getMessage());
               task.log().error( "*** Error on ctrl EditBox1", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SubregPhysicalLabelDef.Name: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.SubregPhysicalLabelDef" );
      }
   }
%>

<input name="EditBox1" id="EditBox1" style="width:338px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:188px;">
<% /* Text10:Text */ %>

<span  id="Text10" name="Text10" style="width:186px;height:18px;">Display Product Name:</span>

</td>
<td valign="top" style="width:338px;">
<% /* EditBox5:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EditBox5", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) == false )
         task.log( ).debug( "Invalid View: " + "EditBox5" );
      else
      {
         nRC = mSPLDef.cursor( "SubregPhysicalLabelDef" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "SubregPhysicalLabelDef" ).getStringFromAttribute( "ProductName", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox5: " + e.getMessage());
               task.log().error( "*** Error on ctrl EditBox5", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SubregPhysicalLabelDef.ProductName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.SubregPhysicalLabelDef" );
      }
   }
%>

<input name="EditBox5" id="EditBox5" style="width:338px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:188px;">
<% /* Text12:Text */ %>

<span  id="Text12" name="Text12" style="width:186px;height:18px;">Page Height:</span>

</td>
<td valign="top" style="width:94px;">
<% /* EditBox6:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EditBox6", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) == false )
         task.log( ).debug( "Invalid View: " + "EditBox6" );
      else
      {
         nRC = mSPLDef.cursor( "LLD_Page" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "LLD_Page" ).getStringFromAttribute( "Height", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox6: " + e.getMessage());
               task.log().error( "*** Error on ctrl EditBox6", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_Page.Height: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.LLD_Page" );
      }
   }
%>

<input name="EditBox6" id="EditBox6" style="width:94px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:188px;">
<% /* Text11:Text */ %>

<span  id="Text11" name="Text11" style="width:186px;height:18px;">Page Width:</span>

</td>
<td valign="top" style="width:94px;">
<% /* EditBox7:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EditBox7", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) == false )
         task.log( ).debug( "Invalid View: " + "EditBox7" );
      else
      {
         nRC = mSPLDef.cursor( "LLD_Page" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "LLD_Page" ).getStringFromAttribute( "Width", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox7: " + e.getMessage());
               task.log().error( "*** Error on ctrl EditBox7", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_Page.Width: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.LLD_Page" );
      }
   }
%>

<input name="EditBox7" id="EditBox7" style="width:94px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:188px;">
<% /* Text1:Text */ %>

<span  id="Text1" name="Text1" style="width:186px;height:18px;">Cont Prev Page Text:</span>

</td>
<td valign="top" style="width:338px;">
<% /* EditBox4:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EditBox4", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) == false )
         task.log( ).debug( "Invalid View: " + "EditBox4" );
      else
      {
         nRC = mSPLDef.cursor( "SPLD_LLD" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "SPLD_LLD" ).getStringFromAttribute( "ContinuationPreviousPageText", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox4: " + e.getMessage());
               task.log().error( "*** Error on ctrl EditBox4", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SPLD_LLD.ContinuationPreviousPageText: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.SPLD_LLD" );
      }
   }
%>

<input name="EditBox4" id="EditBox4" style="width:338px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:188px;">
<% /* Text8:Text */ %>

<span  id="Text8" name="Text8" style="width:186px;height:18px;">Cont Next Page DU Text:</span>

</td>
<td valign="top" style="width:338px;">
<% /* EditBox3:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EditBox3", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) == false )
         task.log( ).debug( "Invalid View: " + "EditBox3" );
      else
      {
         nRC = mSPLDef.cursor( "SPLD_LLD" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "SPLD_LLD" ).getStringFromAttribute( "ContNextPageTextDirForUse", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox3: " + e.getMessage());
               task.log().error( "*** Error on ctrl EditBox3", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SPLD_LLD.ContNextPageTextDirForUse: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.SPLD_LLD" );
      }
   }
%>

<input name="EditBox3" id="EditBox3" style="width:338px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:188px;">
<% /* Text2:Text */ %>

<span  id="Text2" name="Text2" style="width:186px;height:18px;">Cont Next Page Mrktg Text:</span>

</td>
<td valign="top" style="width:338px;">
<% /* EditBox2:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EditBox2", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) == false )
         task.log( ).debug( "Invalid View: " + "EditBox2" );
      else
      {
         nRC = mSPLDef.cursor( "SPLD_LLD" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDef.cursor( "SPLD_LLD" ).getStringFromAttribute( "ContNextPageTextMarketing", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox2: " + e.getMessage());
               task.log().error( "*** Error on ctrl EditBox2", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SPLD_LLD.ContNextPageTextMarketing: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDef.SPLD_LLD" );
      }
   }
%>

<input name="EditBox2" id="EditBox2" style="width:338px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox7 --> 

</div>  <!-- End of a new line -->


</div>  <!--  Registrants --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:22px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp</span>
<% /* Text9:Text */ %>

<span  id="Text9" name="Text9" style="width:202px;height:16px;">LLD Panels</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridPrimaryRegistrant1:Grid */ %>
<table  cols=7 style=""  name="GridPrimaryRegistrant1" id="GridPrimaryRegistrant1">

<thead><tr>

   <th>X Pos</th>
   <th>Y Pos</th>
   <th>Height</th>
   <th>Width</th>
   <th>Add Panel</th>
   <th>Update</th>
   <th>Delete</th>

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
      String strGEProductName1;
      String strGridEditCtl5;
      String strGridEditCtl6;
      String strGridEditCtl7;
      String strBMBAddPanel;
      String strBMBUpdatePanel;
      String strBMBMoveMasterProductUp1;
      
      View vGridPrimaryRegistrant1;
      vGridPrimaryRegistrant1 = mSPLDef.newView( );
      csrRC2 = vGridPrimaryRegistrant1.cursor( "LLD_Panel" ).setFirst( "SubregPhysicalLabelDef" );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridPrimaryRegistrant1.cursor( "LLD_Panel" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strButtonName = "SelectButton" + strEntityKey;

         strGEProductName1 = "";
         nRC = vGridPrimaryRegistrant1.cursor( "LLD_Panel" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGEProductName1 = vGridPrimaryRegistrant1.cursor( "LLD_Panel" ).getStringFromAttribute( "Left", "" );

            if ( strGEProductName1 == null )
               strGEProductName1 = "";
         }

         if ( StringUtils.isBlank( strGEProductName1 ) )
            strGEProductName1 = "&nbsp";

         strGridEditCtl5 = "";
         nRC = vGridPrimaryRegistrant1.cursor( "LLD_Panel" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl5 = vGridPrimaryRegistrant1.cursor( "LLD_Panel" ).getStringFromAttribute( "Top", "" );

            if ( strGridEditCtl5 == null )
               strGridEditCtl5 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl5 ) )
            strGridEditCtl5 = "&nbsp";

         strGridEditCtl6 = "";
         nRC = vGridPrimaryRegistrant1.cursor( "LLD_Panel" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl6 = vGridPrimaryRegistrant1.cursor( "LLD_Panel" ).getStringFromAttribute( "Height", "" );

            if ( strGridEditCtl6 == null )
               strGridEditCtl6 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl6 ) )
            strGridEditCtl6 = "&nbsp";

         strGridEditCtl7 = "";
         nRC = vGridPrimaryRegistrant1.cursor( "LLD_Panel" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditCtl7 = vGridPrimaryRegistrant1.cursor( "LLD_Panel" ).getStringFromAttribute( "Width", "" );

            if ( strGridEditCtl7 == null )
               strGridEditCtl7 = "";
         }

         if ( StringUtils.isBlank( strGridEditCtl7 ) )
            strGridEditCtl7 = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGEProductName1%></td>
   <td><%=strGridEditCtl5%></td>
   <td><%=strGridEditCtl6%></td>
   <td><%=strGridEditCtl7%></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBAddPanel" onclick="GOTO_AddPanelEntry( this.id )" id="BMBAddPanel::<%=strEntityKey%>"><img src="./images/ePammsUpdate.jpg" alt="Add Panel"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBUpdatePanel" onclick="GOTO_UpdatePanelEntry( this.id )" id="BMBUpdatePanel::<%=strEntityKey%>"><img src="./images/ePammsDelete.jpg" alt="Update"></a></td>
   <td nowrap><a href="#" style="display:block;width:100%;height:100%;text-decoration:none;" name="BMBMoveMasterProductUp1" onclick="DeletePanelEntry( this.id )" id="BMBMoveMasterProductUp1::<%=strEntityKey%>"><img src="./images/ePammsUpdate.jpg" alt="Delete"></a></td>

</tr>

<%
         csrRC2 = vGridPrimaryRegistrant1.cursor( "LLD_Panel" ).setNextContinue( );
      }
      vGridPrimaryRegistrant1.drop( );
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
   session.setAttribute( "ZeidonWindow", "wSPLDSPLD_UpdateLLD" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
