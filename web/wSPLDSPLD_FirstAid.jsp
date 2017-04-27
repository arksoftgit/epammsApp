<!DOCTYPE HTML>

<%-- wSPLDSPLD_FirstAid   Generate Timestamp: 20170427124550956 --%>

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
      // EditBox: PrecautionaryTitle
      nRC = mSPLDef.cursor( "SPLD_GeneralSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PrecautionaryTitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "PrecautionaryTitle", "", strMapValue );
            else
               mSPLDef.cursor( "SPLD_GeneralSection" ).getAttribute( "Title" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "PrecautionaryTitle", e.getReason( ), strMapValue );
         }
      }

      // CheckBox: Combine
      nRC = mSPLDef.cursor( "SPLD_GeneralSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Combine" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Combine", "", strMapValue );
            else
               mSPLDef.cursor( "SPLD_GeneralSection" ).getAttribute( "Combined" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Combine", e.getReason( ), strMapValue );
         }
      }

      // CheckBox: BoldTitle
      nRC = mSPLDef.cursor( "SPLD_GeneralSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "BoldTitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "BoldTitle", "", strMapValue );
            else
               mSPLDef.cursor( "SPLD_GeneralSection" ).getAttribute( "BoldTitle" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "BoldTitle", e.getReason( ), strMapValue );
         }
      }

      // CheckBox: BoldText
      nRC = mSPLDef.cursor( "SPLD_GeneralSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "BoldText" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "BoldText", "", strMapValue );
            else
               mSPLDef.cursor( "SPLD_GeneralSection" ).getAttribute( "BoldText" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "BoldText", e.getReason( ), strMapValue );
         }
      }

      // Grid: GridPrecautionary
      iTableRowCnt = 0;

      // We are creating a temp view to the grid view so that if there are 
      // grids on the same window with the same view we do not mess up the 
      // entity positions. 
      vGridTmp = mSPLDef.newView( );
      csrRC = vGridTmp.cursor( "SPLD_GeneralStatement" ).setFirst(  );
      while ( csrRC.isSet() )
      {
         lEntityKey = vGridTmp.cursor( "SPLD_GeneralStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         iTableRowCnt++;

         csrRC = vGridTmp.cursor( "SPLD_GeneralStatement" ).setNextContinue( );
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

if ( strLastWindow.equals("wSPLDSPLD_FirstAid") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wSPLDSPLD_FirstAid strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSPLDSPLD_FirstAid LastWindow *** " + strLastWindow );
task.log().info("*** wSPLDSPLD_FirstAid LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "Refresh" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StayOnWindowWithRefresh, "", "" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveAndReturn" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_FirstAid", "wSPLD.SaveSPLD_AndReturn" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelAndReturn" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_FirstAid", "wSPLD.CancelSPLD" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveSPLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_FirstAid", "wSPLD.SaveSPLD" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGraphicalView" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_FirstAid", "wSPLD.SetSPLD_Resume" );
      nOptRC = wSPLD.SetSPLD_Resume( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "GraphicalView" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGENERATE_SPLD_Label" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_FirstAid", "wSPLD.GENERATE_SPLD_Label" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGenerateLabelDottedBorders" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_FirstAid", "wSPLD.GENERATE_SPLD_LabelDottedBorders" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGOTO_UpdateSPLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReplaceWindowWithModalWindow, "wSPLD", "SPLD_UpdateLLD" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGOTO_DisplaySPLD_Components" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smIngredients" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReplaceWindowWithModalWindow, "wSPLD", "SPLD_Ingredients" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smHumanHazard" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_FirstAid", "wSPLD.DisplayHazardsSection" );
      nOptRC = wSPLD.DisplayHazardsSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReplaceWindowWithModalWindow, "wSPLD", "SPLD_HumanHazard" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smFirstAid" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_FirstAid", "wSPLD.DisplayFirstAidSection" );
      nOptRC = wSPLD.DisplayFirstAidSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReplaceWindowWithModalWindow, "wSPLD", "SPLD_FirstAid" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smStorageDisposal" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_FirstAid", "wSPLD.ExecuteJOE_Test1" );
      nOptRC = wSPLD.ExecuteJOE_Test1( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReplaceWindowWithModalWindow, "wSPLD", "SPLD_StorageDisposal" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDirectionsForUse" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReplaceWindowWithModalWindow, "wSPLD", "SPLD_DirectionsForUse" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smPrecautionary" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_FirstAid", "wSPLD.DisplayPrecautionarySection" );
      nOptRC = wSPLD.DisplayPrecautionarySection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReplaceWindowWithModalWindow, "wSPLD", "SPLD_Precautionary" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEnvironmentalHazard" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_FirstAid", "wSPLD.DisplayPhysicalChemicalHazards" );
      nOptRC = wSPLD.DisplayPhysicalChemicalHazards( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReplaceWindowWithModalWindow, "wSPLD", "SPLD_EnvironmentalHazards" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDilution" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReplaceWindowWithModalWindow, "wSPLD", "SPLD_Dilution" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smTables" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_ReplaceWindowWithModalWindow, "wSPLD", "SPLD_TableMaintenance" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCopySPLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSPLD.SetWebRedirection( vKZXMLPGO, wSPLD.zWAB_StartModalSubwindow, "wSPLD", "CopySPLD" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGOTO_SelectLLD_ForSPLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGOTO_GenerateLLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCLEAN_SPLD_Data" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSPLDSPLD_FirstAid", "wSPLD.CLEAN_SPLD_Data" );
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

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wSPLDSPLD_FirstAid" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wSPLDSPLD_FirstAid" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSPLDSPLD_FirstAid", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSPLDSPLD_FirstAid.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSPLDSPLD_FirstAid.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSPLDSPLD_FirstAid.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSPLDSPLD_FirstAid.jsp" );
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
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wSPLD", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "SPLD_FirstAid", "" );
   }

%>

<html>
<head>

<title>SPLD First Aid</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSPLDSPLD_FirstAid.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SaveAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smSaveAndReturn" name="smSaveAndReturn"><a href="#"  onclick="smSaveAndReturn()">Save and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smCancelAndReturn" name="smCancelAndReturn"><a href="#"  onclick="smCancelAndReturn()">Cancel and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New6" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew6" name="smNew6"><a href="#"  onclick="smSaveSPLD()">Save</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "GraphicalView" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smGraphicalView" name="smGraphicalView"><a href="#"  onclick="smGraphicalView()">Graphical View</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "GenerateLabel" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smGenerateLabel" name="smGenerateLabel"><a href="#"  onclick="smGENERATE_SPLD_Label()">Generate Label</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "GenerateLabelDottedBorders" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smGenerateLabelDottedBorders" name="smGenerateLabelDottedBorders"><a href="#"  onclick="smGenerateLabelDottedBorders()">Generate Label/Borders</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "UpdateSPLD" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smUpdateSPLD" name="smUpdateSPLD"><a href="#"  onclick="smGOTO_UpdateSPLD()">Update SPLD</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Components" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smComponents" name="smComponents"><a href="#"  onclick="smGOTO_DisplaySPLD_Components()">Components</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Ingredients" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smIngredients" name="smIngredients"><a href="#"  onclick="smIngredients()">Ingredients</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "HumanHazard" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smHumanHazard" name="smHumanHazard"><a href="#"  onclick="smHumanHazard()">Human Hazard</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "FirstAid" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smFirstAid" name="smFirstAid"><a href="#"  class="sideselected"  onclick="smFirstAid()">First Aid</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "StorageDisposal" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smStorageDisposal" name="smStorageDisposal"><a href="#"  onclick="smStorageDisposal()">Storage & Disposal</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "DirectionsForUse" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smDirectionsForUse" name="smDirectionsForUse"><a href="#"  onclick="smDirectionsForUse()">Directions For Use</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Precautionary" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smPrecautionary" name="smPrecautionary"><a href="#"  onclick="smPrecautionary()">Precautionary</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "EnvironmentalHazard" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smEnvironmentalHazard" name="smEnvironmentalHazard"><a href="#"  onclick="smEnvironmentalHazard()">Environmental Hazard</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Dilution" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smDilution" name="smDilution"><a href="#"  onclick="smDilution()">Dilution</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Tables" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smTables" name="smTables"><a href="#"  onclick="smTables()">Tables</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CopySPLD" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smCopySPLD" name="smCopySPLD"><a href="#"  onclick="smCopySPLD()">Copy Label</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New4" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew4" name="smNew4"><a href="#"  onclick="smGOTO_SelectLLD_ForSPLD()">Select LLD</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New3" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew3" name="smNew3"><a href="#"  onclick="smGOTO_GenerateLLD()">Generate LLD</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New5" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew5" name="smNew5"><a href="#"  onclick="smCLEAN_SPLD_Data()">Clean Data</a></li>
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


<form name="wSPLDSPLD_FirstAid" id="wSPLDSPLD_FirstAid" method="post">
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
   View mMasProd = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSPLD", "SPLD_FirstAid" );
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
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:730px;height:28px;float:left;">  <!-- GroupBox3 --> 


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp</span>
<% /* PrecautionarySection:Text */ %>

<span class="groupbox"  id="PrecautionarySection" name="PrecautionarySection" style="width:338px;height:16px;">First Aid Section</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox3 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBPrecautionarySection:GroupBox */ %>

<div id="GBPrecautionarySection" name="GBPrecautionarySection" class="withborder" style="width:730px;height:62px;float:left;">  <!-- GBPrecautionarySection --> 


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:8px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>
<div id="GroupBox1" name="GroupBox1" style="float:left;width:640px;" >

<table cols=0 style="width:640px;"  class="grouptable">

<tr>
<td valign="top" style="width:66px;">
<% /* PrecautionaryTitle::Text */ %>

<span  id="PrecautionaryTitle:" name="PrecautionaryTitle:" style="width:66px;height:16px;">Title:</span>

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
      mSPLDef = task.getViewByName( "mSPLDef" );
      if ( VmlOperation.isValid( mSPLDef ) == false )
         task.log( ).debug( "Invalid View: " + "PrecautionaryTitle" );
      else
      {
         nRC = mSPLDef.cursor( "SPLD_GeneralSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSPLDef.cursor( "SPLD_GeneralSection" ).getAttribute( "Title" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on PrecautionaryTitle: " + e.getMessage());
               task.log().error( "*** Error on ctrl PrecautionaryTitle", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SPLD_GeneralSection.Title: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for PrecautionaryTitle: " + "mSPLDef.SPLD_GeneralSection" );
      }
   }
%>

<input class="text12"  name="PrecautionaryTitle" id="PrecautionaryTitle" maxlength="4096" style="width:550px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox1 --> 

</div>  <!-- End of a new line -->


</div>  <!--  GBPrecautionarySection --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" style="width:730px;height:34px;float:left;">  <!-- GroupBox2 --> 


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBPrecautionaryStatements:GroupBox */ %>
<div id="GBPrecautionaryStatements" name="GBPrecautionaryStatements" style="float:left;width:684px;"  class="listgroup">

<table cols=0 style="width:684px;"  class="grouptable">

<tr>
<td valign="top"  class="listheader" style="width:202px;">
<% /* FirstAidStatements:Text */ %>

<span class="listheader"  id="FirstAidStatements" name="FirstAidStatements" style="width:194px;height:16px;">First Aid Statements</span>

</td>
<td valign="top" style="width:336px;">
<% /* GroupBox5:GroupBox */ %>
<div id="GroupBox5" name="GroupBox5" style="width:314px;height:18px;float:left;">

<div>  <!-- Beginning of a new line -->
<% /* Combine:CheckBox */ %>
<%
   strErrorMapValue = "";
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) == false )
      task.log( ).debug( "Invalid View: " + "Combine" );
   else
   {
      nRC = mSPLDef.cursor( "SPLD_GeneralSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
         strRadioGroupValue = mSPLDef.cursor( "SPLD_GeneralSection" ).getAttribute( "Combined" ).getString( );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="Combine" id="Combine"  value="Y" <%=strErrorMapValue%> style="">
<span style="width:102px;height:18px;">&nbsp Combine</span>

<% /* BoldTitle:CheckBox */ %>
<%
   strErrorMapValue = "";
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) == false )
      task.log( ).debug( "Invalid View: " + "BoldTitle" );
   else
   {
      nRC = mSPLDef.cursor( "SPLD_GeneralSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
         strRadioGroupValue = mSPLDef.cursor( "SPLD_GeneralSection" ).getAttribute( "BoldTitle" ).getString( );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="BoldTitle" id="BoldTitle"  value="Y" <%=strErrorMapValue%> style="">
<span style="width:102px;height:18px;">&nbsp Bold Title</span>

<% /* BoldText:CheckBox */ %>
<%
   strErrorMapValue = "";
   mSPLDef = task.getViewByName( "mSPLDef" );
   if ( VmlOperation.isValid( mSPLDef ) == false )
      task.log( ).debug( "Invalid View: " + "BoldText" );
   else
   {
      nRC = mSPLDef.cursor( "SPLD_GeneralSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
         strRadioGroupValue = mSPLDef.cursor( "SPLD_GeneralSection" ).getAttribute( "BoldText" ).getString( );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="BoldText" id="BoldText"  value="Y" <%=strErrorMapValue%> style="">
<span style="width:102px;height:18px;">&nbsp Bold Text</span>

</div>  <!-- End of a new line -->

</div>  <!-- GroupBox5 --> 
</td>
<td valign="top"  class="newbutton" style="width:78px;">
<% /* RefreshStatements:PushBtn */ %>
<button type="button" class="newbutton"  id="RefreshStatements" name="RefreshStatements" value="Refresh" onclick="Refresh( )"  style="width:78px;height:26px;">Refresh</button>

</td>
</tr>
</table>

</div>  <!-- GBPrecautionaryStatements --> 

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox2 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GridPrecautionary:Grid */ %>
<table  cols=1 style="width:710px;"  name="GridPrecautionary" id="GridPrecautionary">

<thead><tr>

   <th>Statement Text</th>

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
      String strGridEditPrecautionary;
      
      View vGridPrecautionary;
      vGridPrecautionary = mSPLDef.newView( );
      csrRC2 = vGridPrecautionary.cursor( "SPLD_GeneralStatement" ).setFirst(  );
      while ( csrRC2.isSet() )
      {
         strOdd = (iTableRowCnt % 2) != 0 ? " class='odd'" : "";
         iTableRowCnt++;

         lEntityKey = vGridPrecautionary.cursor( "SPLD_GeneralStatement" ).getEntityKey( );
         strEntityKey = Long.toString( lEntityKey );
         strGridEditPrecautionary = "";
         nRC = vGridPrecautionary.cursor( "SPLD_GeneralStatement" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strGridEditPrecautionary = vGridPrecautionary.cursor( "SPLD_GeneralStatement" ).getAttribute( "dGenStmtCombinedTitleText" ).getString( "" );

            if ( strGridEditPrecautionary == null )
               strGridEditPrecautionary = "";
         }

         if ( StringUtils.isBlank( strGridEditPrecautionary ) )
            strGridEditPrecautionary = "&nbsp";

%>

<tr<%=strOdd%>>

   <td><%=strGridEditPrecautionary%></td>

</tr>

<%
         csrRC2 = vGridPrecautionary.cursor( "SPLD_GeneralStatement" ).setNextContinue( );
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
   session.setAttribute( "ZeidonWindow", "wSPLDSPLD_FirstAid" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
