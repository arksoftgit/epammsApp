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

   View mSPLDefBlock = null;
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

   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) )
   {
      // ComboBox: ComboBox1
      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hComboBox1" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ComboBox1", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "LLD_SectionType" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ComboBox1", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox3
      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox3" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox3", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "Top" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox3", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox2
      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox2", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "Left" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox2", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox4
      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox4" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox4", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "Height" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox4", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox5
      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox5" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox5", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "Width" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox5", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EditBox1
      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EditBox1" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EditBox1", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "ImageName" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EditBox1", e.getReason( ), strMapValue );
         }
      }

      // CheckBox: CheckBox1
      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "CheckBox1" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "CheckBox1", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "ContinuationBlockFlag" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "CheckBox1", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: ComboBox3
      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hComboBox3" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ComboBox3", "", strMapValue );
            else
               mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "LLD_ColumnListType" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ComboBox3", e.getReason( ), strMapValue );
         }
      }

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
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate.jsp", "wSPLD.ACCEPT_BlockSubBlockDefinition" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CANCEL_BlockSubBlockDefinition" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_BlockDefinitionUpdate", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate.jsp", "wSPLD.CANCEL_BlockSubBlockDefinition" );
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
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate.jsp", "wSPLD.DELETE_SpecialFormatDef" );
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
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate.jsp", "wSPLD.GENERATE_SPLD_Label" );
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
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate.jsp", "wSPLD.GENERATE_SPLD_Label" );
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
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate.jsp", "wSPLD.GOTO_NewSpecialFormatDefinition" );
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
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate.jsp", "wSPLD.GOTO_UpdateSpecialFormatDef" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_BlockDefinitionUpdate.jsp", "wSPLD.PostbuildBlockDefinitionUpdate" );
         nOptRC = wSPLD.PostbuildBlockDefinitionUpdate( new zVIEW( vKZXMLPGO ) );
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
                         "&OperationName=" + "PostbuildBlockDefinitionUpdate";
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
<script language="JavaScript" type="text/javascript" src="./js/md5.js"></script>
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
   <ul>
<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AcceptAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="ACCEPT_BlockSubBlockDefinition( )">Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New1" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="GENERATE_SPLD_LabelDottedBorders( )">Generate Label with Borders</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New2" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="GENERATE_SPLD_Label( )">Generate Label</a></li>
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
         strKeyRole = wWebXA.cursor( "Root" ).getAttribute( "KeyRole" ).getString( "KeyRole" );
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
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox9:GroupBox */ %>
<div id="GroupBox9" name="GroupBox9" style="float:left;width:466px;" >

<table cols=2 style="width:466px;"  class="grouptable">

<tr>
<td valign="top" style="width:116px;">
<% /* TXBlockTag::Text */ %>

<span  id="TXBlockTag:" name="TXBlockTag:" style="width:110px;height:26px;">Block Tag:</span>

</td>
<td valign="top" style="width:224px;">
<% /* Tag:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Tag", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
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
            strErrorMapValue = mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "Tag" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Tag: " + e.getMessage());
               task.log().error( "*** Error on ctrl Tag", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_Block.Tag: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDefBlock.LLD_Block" );
      }
   }
%>

<input name="Tag" id="Tag"  disabled style="width:224px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:116px;">
<% /* BlockName::Text */ %>

<span  id="BlockName:" name="BlockName:" style="width:110px;height:26px;">Block Name:</span>

</td>
<td valign="top" style="width:224px;">
<% /* BlockName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "BlockName", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) == false )
         task.log( ).debug( "Invalid View: " + "BlockName" );
      else
      {
         nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "Name" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on BlockName: " + e.getMessage());
               task.log().error( "*** Error on ctrl BlockName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_Block.Name: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDefBlock.LLD_Block" );
      }
   }
%>

<input name="BlockName" id="BlockName"  disabled style="width:224px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:116px;">
<% /* TXDataType::Text */ %>

<span  id="TXDataType:" name="TXDataType:" style="width:110px;height:26px;">Data Type:</span>

</td>
<td valign="top" style="width:224px;">
<% /* ComboBox1:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox1" id="ComboBox1" size="1" style="width:224px;" onchange="ComboBox1OnChange( )">

<%
   boolean inListComboBox1 = false;

   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDefBlock , "LLD_Block", "LLD_SectionType", "" );

      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "LLD_SectionType" ).getString( "" );
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
         inListComboBox1 = true;
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
               inListComboBox1 = true;
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
      if ( !inListComboBox1 )
      { 
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }  
   }  // if view != null
%>
</select>

<input name="hComboBox1" id="hComboBox1" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
</tr>
<tr>
<td valign="top" style="width:116px;">
<% /* TXTop::Text */ %>

<span  id="TXTop:" name="TXTop:" style="width:110px;height:26px;">Top:</span>

</td>
<td valign="top" style="width:78px;">
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
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) == false )
         task.log( ).debug( "Invalid View: " + "EditBox3" );
      else
      {
         nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "Top" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox3: " + e.getMessage());
               task.log().error( "*** Error on ctrl EditBox3", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_Block.Top: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDefBlock.LLD_Block" );
      }
   }
%>

<input name="EditBox3" id="EditBox3" style="width:78px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:116px;">
<% /* TXLeft::Text */ %>

<span  id="TXLeft:" name="TXLeft:" style="width:110px;height:26px;">Left:</span>

</td>
<td valign="top" style="width:78px;">
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
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) == false )
         task.log( ).debug( "Invalid View: " + "EditBox2" );
      else
      {
         nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "Left" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox2: " + e.getMessage());
               task.log().error( "*** Error on ctrl EditBox2", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_Block.Left: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDefBlock.LLD_Block" );
      }
   }
%>

<input name="EditBox2" id="EditBox2" style="width:78px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:116px;">
<% /* TXHeight::Text */ %>

<span  id="TXHeight:" name="TXHeight:" style="width:110px;height:26px;">Height:</span>

</td>
<td valign="top" style="width:78px;">
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
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) == false )
         task.log( ).debug( "Invalid View: " + "EditBox4" );
      else
      {
         nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "Height" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox4: " + e.getMessage());
               task.log().error( "*** Error on ctrl EditBox4", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_Block.Height: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDefBlock.LLD_Block" );
      }
   }
%>

<input name="EditBox4" id="EditBox4" style="width:78px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:116px;">
<% /* TXWidth::Text */ %>

<span  id="TXWidth:" name="TXWidth:" style="width:110px;height:26px;">Width:</span>

</td>
<td valign="top" style="width:78px;">
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
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) == false )
         task.log( ).debug( "Invalid View: " + "EditBox5" );
      else
      {
         nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "Width" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox5: " + e.getMessage());
               task.log().error( "*** Error on ctrl EditBox5", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_Block.Width: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDefBlock.LLD_Block" );
      }
   }
%>

<input name="EditBox5" id="EditBox5" style="width:78px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:116px;">
<% /* TXGraphicName::Text */ %>

<span  id="TXGraphicName:" name="TXGraphicName:" style="width:110px;height:26px;">Graphic Name:</span>

</td>
<td valign="top" style="width:310px;">
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
      mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
      if ( VmlOperation.isValid( mSPLDefBlock ) == false )
         task.log( ).debug( "Invalid View: " + "EditBox1" );
      else
      {
         nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "ImageName" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EditBox1: " + e.getMessage());
               task.log().error( "*** Error on ctrl EditBox1", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "LLD_Block.ImageName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSPLDefBlock.LLD_Block" );
      }
   }
%>

<input name="EditBox1" id="EditBox1" style="width:310px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox9 --> 

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" style="width:466px;height:38px;float:left;">  <!-- GroupBox2 --> 


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:26px;">&nbsp</span>
<% /* CheckBox1:CheckBox */ %>
<%
   strErrorMapValue = "";
   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) == false )
      task.log( ).debug( "Invalid View: " + "CheckBox1" );
   else
   {
      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
         strRadioGroupValue = mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "ContinuationBlockFlag" ).getString( "" );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="CheckBox1" id="CheckBox1"  value="Y" <%=strErrorMapValue%> style="">
<span style="width:404px;height:26px;">&nbsp This is a Continuation from Previous Section/Statement</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox2 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox8:GroupBox */ %>

<div id="GroupBox8" name="GroupBox8" style="width:480px;float:left;">  <!-- GroupBox8 --> 


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:340px;height:30px;float:left;">  <!-- GroupBox3 --> 


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:20px;">&nbsp</span>
<% /* TXRelatedMarketingSection:Text */ %>

<span  id="TXRelatedMarketingSection" name="TXRelatedMarketingSection" style="width:286px;height:20px;">Related Marketing Section</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox3 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox10:GroupBox */ %>

<div id="GroupBox10" name="GroupBox10" style="width:114px;height:36px;float:left;">  <!-- GroupBox10 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* TXSectionName::Text */ %>

<span  id="TXSectionName:" name="TXSectionName:" style="width:98px;height:14px;">Section Name:</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox10 --> 
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox11:GroupBox */ %>

<div id="GroupBox11" name="GroupBox11" style="width:222px;height:36px;float:left;">  <!-- GroupBox11 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* TXName:Text */ %>
<% strTextDisplayValue = "";
   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) == false )
      task.log( ).debug( "Invalid View: " + "TXName" );
   else
   {
      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "Name" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on TXName: " + e.getMessage());
         task.log().info( "*** Error on ctrl TXName" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<span  id="TXName" name="TXName" style="width:158px;height:14px;"><%=strTextDisplayValue%></span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox11 --> 
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4" style="width:130px;height:36px;float:left;">  <!-- GroupBox4 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* PushBtn3:PushBtn */ %>
<button type="button" name="PushBtn3" id="PushBtn3" value="" onclick="GOTO_SelectMarketingSection( )" style="width:68px;height:24px;">Select</button>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox4 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:6px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox12:GroupBox */ %>

<div id="GroupBox12" name="GroupBox12" style="width:114px;height:36px;float:left;">  <!-- GroupBox12 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* TXClaimListType::Text */ %>

<span  id="TXClaimListType:" name="TXClaimListType:" style="width:106px;height:14px;">Claim List Type:</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox12 --> 
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox13:GroupBox */ %>

<div id="GroupBox13" name="GroupBox13" style="width:222px;height:36px;float:left;">  <!-- GroupBox13 --> 


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* ComboBox3:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ComboBox3" id="ComboBox3" size="1" style="width:188px;" onchange="ComboBox3OnChange( )">

<%
   boolean inListComboBox3 = false;

   mSPLDefBlock = task.getViewByName( "mSPLDefBlock" );
   if ( VmlOperation.isValid( mSPLDefBlock ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSPLDefBlock , "LLD_Block", "LLD_ColumnListType", "" );

      nRC = mSPLDefBlock.cursor( "LLD_Block" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSPLDefBlock.cursor( "LLD_Block" ).getAttribute( "LLD_ColumnListType" ).getString( "" );
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
         inListComboBox3 = true;
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
               inListComboBox3 = true;
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
      if ( !inListComboBox3 )
      { 
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }  
   }  // if view != null
%>
</select>

<input name="hComboBox3" id="hComboBox3" type="hidden" value="<%=strComboCurrentValue%>" >
</div>  <!-- End of a new line -->


</div>  <!--  GroupBox13 --> 
</div>  <!-- End of a new line -->


</div>  <!--  GroupBox8 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


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
         strButtonName = "SelectButton" + strEntityKey;

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
         nRC = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttrBlock" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strColor = vSpecialSectionAttributes.cursor( "LLD_SpecialSectionAttrBlock" ).getAttribute( "TextColor" ).getString( "" );

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
