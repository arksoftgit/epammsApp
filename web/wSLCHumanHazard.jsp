<!DOCTYPE HTML>

<%-- wSLCHumanHazard   Generate Timestamp: 20160927123859135 --%>

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

   View mSubLC = null;
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

   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) )
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

if ( strLastWindow.equals("wSLCHumanHazard") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wSLC_Dialog wSLC = new wSLC_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wSLCHumanHazard strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSLCHumanHazard LastWindow *** " + strLastWindow );
task.log().info("*** wSLCHumanHazard LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "RefreshFullStatement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StayOnWindowWithRefresh, "", "" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveAndReturnMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCHumanHazard", "wSLC.SaveSLC" );
      nOptRC = wSLC.SaveSLC( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveSLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCHumanHazard", "wSLC.SaveSLC" );
      nOptRC = wSLC.SaveSLC( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelAndReturnSLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCHumanHazard", "wSLC.CancelAndReturnSLC" );
      nOptRC = wSLC.CancelAndReturnSLC( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplayVersionData" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "VersionData" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplayIngredientsSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "Ingredients" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplayHumanHazardSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "HumanHazard" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplayFirstAidSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCHumanHazard", "wSLC.DisplayFirstAidSection" );
      nOptRC = wSLC.DisplayFirstAidSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "FirstAidSection" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplayStorDispSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "StorageDisposal" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplayDirectionsUseSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "DirectionsForUse" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplayPrecautionarySection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCHumanHazard", "wSLC.DisplayPrecautionarySection" );
      nOptRC = wSLC.DisplayPrecautionarySection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "PrecautionarySection" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplayHazardSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCHumanHazard", "wSLC.DisplayHazardsSection" );
      nOptRC = wSLC.DisplayHazardsSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "HazardsSection" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplaySurfacesSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCHumanHazard", "wSLC.DisplaySurfacesSection" );
      nOptRC = wSLC.DisplaySurfacesSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "Surfaces" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplayLocationsSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCHumanHazard", "wSLC.DisplayLocationsSection" );
      nOptRC = wSLC.DisplayLocationsSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "Locations" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplayApplicationTypesSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCHumanHazard", "wSLC.DisplayApplicationTypesSection" );
      nOptRC = wSLC.DisplayApplicationTypesSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "ApplicationTypes" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplayClaimsSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSLCHumanHazard", "wSLC.DisplayClaimsSection" );
      nOptRC = wSLC.DisplayClaimsSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "OrganismClaims" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smDisplayMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSLC.SetWebRedirection( vKZXMLPGO, wSLC.zWAB_ReplaceWindowWithModalWindow, "wSLC", "Marketing" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wSLCHumanHazard" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wSLCHumanHazard" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSLCHumanHazard.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSLCHumanHazard.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSLCHumanHazard.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSLCHumanHazard.jsp" );
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
   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSLC", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wSLC", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "HumanHazard", "" );
   }

%>

<html>
<head>

<title>Human Hazard Content</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSLCHumanHazard.js"></script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<%@ include file="./include/pagebackground.inc" %>  <!-- just temporary until we get the painter dialog updates from Kelly ... 2011.10.08 dks -->

<div id="wrapper">

<jsp:include page='<%=strBannerName %>' />

<div id="maincontent">

<div id="leftcontent">

<!-- Side Navigation *********************** -->
<div id="sidenavigation">
   <ul id="MLC_SideBar" name="MLC_SideBar">
<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New4" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew4" name="smNew4"><a href="#"  onclick="smSaveAndReturnMLC()">Save & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New6" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew6" name="smNew6"><a href="#"  onclick="smSaveSLC()">Save</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New5" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew5" name="smNew5"><a href="#"  onclick="smCancelAndReturnSLC()">Cancel & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New1" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew1" name="smNew1"><a href="#"  onclick="smDisplayVersionData()">Version Data</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Ingredients" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smIngredients" name="smIngredients"><a href="#"  onclick="smDisplayIngredientsSect()">Ingredients</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "HumanHazard" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smHumanHazard" name="smHumanHazard"><a href="#"  class="sideselected"  onclick="smDisplayHumanHazardSect()">Human Hazard</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "FirstAid" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smFirstAid" name="smFirstAid"><a href="#"  onclick="smDisplayFirstAidSection()">First Aid</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "StorDisp" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smStorDisp" name="smStorDisp"><a href="#"  onclick="smDisplayStorDispSect()">Storage and Disposal</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "DirectionsForUse" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smDirectionsForUse" name="smDirectionsForUse"><a href="#"  onclick="smDisplayDirectionsUseSect()">Directions For Use</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Precautionary" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smPrecautionary" name="smPrecautionary"><a href="#"  onclick="smDisplayPrecautionarySection()">Precautionary</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "EnvironmentalHazards" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smEnvironmentalHazards" name="smEnvironmentalHazards"><a href="#"  onclick="smDisplayHazardSection()">Environmental Hazards</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "TypesOfSurfaces" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smTypesOfSurfaces" name="smTypesOfSurfaces"><a href="#"  onclick="smDisplaySurfacesSection()">Surfaces</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Locations" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smLocations" name="smLocations"><a href="#"  onclick="smDisplayLocationsSection()">Locations</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AppTypes" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smAppTypes" name="smAppTypes"><a href="#"  onclick="smDisplayApplicationTypesSection()">Application Types</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "OrganismClaims" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smOrganismClaims" name="smOrganismClaims"><a href="#"  onclick="smDisplayClaimsSection()">Organism Claims</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Marketing" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smMarketing" name="smMarketing"><a href="#"  onclick="smDisplayMarketingSect()">Marketing</a></li>
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


<form name="wSLCHumanHazard" id="wSLCHumanHazard" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lMLC = null;
   View lSPLDLST = null;
   View mLLD_LST = null;
   View mMasLC = null;
   View mSPLDef = null;
   View mSubLC = null;
   View mSubProd = null;
   View mSubreg = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSLC", "HumanHazard" );
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
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Text2:Text */ %>

<span class="listheader"  id="Text2" name="Text2" style="width:250px;height:16px;">Hazard Attributes</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1"   style="float:left;position:relative; width:692px; height:366px;">  <!-- GroupBox1 --> 

<% /* HazardText::Text */ %>

<label  id="HazardText:" name="HazardText:" style="width:130px;height:16px;position:absolute;left:0px;top:0px;">Hazard Text:</label>

<% /* Text3:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "Text3" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "EPA_ChildHazardWarning" ).getString( "" );
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

<label  id="Text3" name="Text3" style="width:522px;height:16px;position:absolute;left:130px;top:0px;"><%=strTextDisplayValue%></label>

<% /* SignalWord::Text */ %>

<label  id="SignalWord:" name="SignalWord:" style="width:130px;height:16px;position:absolute;left:0px;top:32px;">Signal Word:</label>

<% /* Text1:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "Text1" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "EPA_SignalWord" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on Text1: " + e.getMessage());
         task.log().info( "*** Error on ctrl Text1" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="Text1" name="Text1" style="width:130px;height:16px;position:absolute;left:134px;top:32px;"><%=strTextDisplayValue%></label>

<% /* Statement::Text */ %>

<label  id="Statement:" name="Statement:" style="width:130px;height:16px;position:absolute;left:0px;top:70px;">Statement:</label>

<% /* Text4:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "Text4" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "PrecautionaryStatement" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on Text4: " + e.getMessage());
         task.log().info( "*** Error on ctrl Text4" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="Text4" name="Text4" style="width:522px;height:50px;position:absolute;left:134px;top:70px;"><%=strTextDisplayValue%></label>

<% /* PanelLocation1::Text */ %>

<label  id="PanelLocation1:" name="PanelLocation1:" style="width:130px;height:16px;position:absolute;left:0px;top:130px;">Panel Location:</label>

<% /* PanelLocation1:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "PanelLocation1" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "PanelLoc1" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on PanelLocation1: " + e.getMessage());
         task.log().info( "*** Error on ctrl PanelLocation1" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="PanelLocation1" name="PanelLocation1" style="width:178px;height:16px;position:absolute;left:134px;top:130px;"><%=strTextDisplayValue%></label>

<% /* LabelLocation1::Text */ %>

<label  id="LabelLocation1:" name="LabelLocation1:" style="width:130px;height:16px;position:absolute;left:330px;top:130px;">Label Location:</label>

<% /* LabelLocation1:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "LabelLocation1" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "LabelLoc1" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on LabelLocation1: " + e.getMessage());
         task.log().info( "*** Error on ctrl LabelLocation1" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="LabelLocation1" name="LabelLocation1" style="width:178px;height:16px;position:absolute;left:466px;top:130px;"><%=strTextDisplayValue%></label>

<% /* PanelLocation2::Text */ %>

<label  id="PanelLocation2:" name="PanelLocation2:" style="width:130px;height:16px;position:absolute;left:0px;top:156px;">Panel Location:</label>

<% /* PanelLocation2:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "PanelLocation2" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "PanelLoc2" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on PanelLocation2: " + e.getMessage());
         task.log().info( "*** Error on ctrl PanelLocation2" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="PanelLocation2" name="PanelLocation2" style="width:178px;height:16px;position:absolute;left:134px;top:156px;"><%=strTextDisplayValue%></label>

<% /* LabelLocation2::Text */ %>

<label  id="LabelLocation2:" name="LabelLocation2:" style="width:130px;height:16px;position:absolute;left:330px;top:156px;">LabelLocation:</label>

<% /* LabelLocation2:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "LabelLocation2" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "LabelLoc2" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on LabelLocation2: " + e.getMessage());
         task.log().info( "*** Error on ctrl LabelLocation2" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="LabelLocation2" name="LabelLocation2" style="width:178px;height:16px;position:absolute;left:466px;top:156px;"><%=strTextDisplayValue%></label>

<% /* PanelLocation3::Text */ %>

<label  id="PanelLocation3:" name="PanelLocation3:" style="width:130px;height:16px;position:absolute;left:0px;top:182px;">PanelLocation:</label>

<% /* PanelLocation3:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "PanelLocation3" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "PanelLoc3" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on PanelLocation3: " + e.getMessage());
         task.log().info( "*** Error on ctrl PanelLocation3" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="PanelLocation3" name="PanelLocation3" style="width:178px;height:16px;position:absolute;left:134px;top:182px;"><%=strTextDisplayValue%></label>

<% /* LabelLocation3::Text */ %>

<label  id="LabelLocation3:" name="LabelLocation3:" style="width:130px;height:16px;position:absolute;left:330px;top:182px;">LabelLocation:</label>

<% /* LabelLocation3:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "LabelLocation3" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "LabelLoc3" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on LabelLocation3: " + e.getMessage());
         task.log().info( "*** Error on ctrl LabelLocation3" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="LabelLocation3" name="LabelLocation3" style="width:178px;height:16px;position:absolute;left:466px;top:182px;"><%=strTextDisplayValue%></label>

<% /* PanelLocation4::Text */ %>

<label  id="PanelLocation4:" name="PanelLocation4:" style="width:130px;height:16px;position:absolute;left:0px;top:208px;">Panel Location:</label>

<% /* PanelLocation4:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "PanelLocation4" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "PanelLoc4" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on PanelLocation4: " + e.getMessage());
         task.log().info( "*** Error on ctrl PanelLocation4" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="PanelLocation4" name="PanelLocation4" style="width:178px;height:16px;position:absolute;left:134px;top:208px;"><%=strTextDisplayValue%></label>

<% /* LabelLocation4::Text */ %>

<label  id="LabelLocation4:" name="LabelLocation4:" style="width:130px;height:16px;position:absolute;left:330px;top:208px;">Label Location:</label>

<% /* LabelLocation4:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "LabelLocation4" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "LabelLoc4" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on LabelLocation4: " + e.getMessage());
         task.log().info( "*** Error on ctrl LabelLocation4" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="LabelLocation4" name="LabelLocation4" style="width:178px;height:16px;position:absolute;left:466px;top:208px;"><%=strTextDisplayValue%></label>

<% /* PanelLocation5::Text */ %>

<label  id="PanelLocation5:" name="PanelLocation5:" style="width:130px;height:16px;position:absolute;left:0px;top:234px;">PanelLocation:</label>

<% /* PanelLocation5:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "PanelLocation5" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "PanelLoc5" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on PanelLocation5: " + e.getMessage());
         task.log().info( "*** Error on ctrl PanelLocation5" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="PanelLocation5" name="PanelLocation5" style="width:178px;height:16px;position:absolute;left:134px;top:234px;"><%=strTextDisplayValue%></label>

<% /* LabelLocation5::Text */ %>

<label  id="LabelLocation5:" name="LabelLocation5:" style="width:130px;height:16px;position:absolute;left:330px;top:234px;">LabelLocation:</label>

<% /* LabelLocation5:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "LabelLocation5" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "LabelLoc5" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on LabelLocation5: " + e.getMessage());
         task.log().info( "*** Error on ctrl LabelLocation5" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="LabelLocation5" name="LabelLocation5" style="width:178px;height:16px;position:absolute;left:466px;top:234px;"><%=strTextDisplayValue%></label>

<% /* PanelLocation6::Text */ %>

<label  id="PanelLocation6:" name="PanelLocation6:" style="width:130px;height:16px;position:absolute;left:0px;top:260px;">Panel Location:</label>

<% /* PanelLocation6:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "PanelLocation6" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "PanelLoc6" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on PanelLocation6: " + e.getMessage());
         task.log().info( "*** Error on ctrl PanelLocation6" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="PanelLocation6" name="PanelLocation6" style="width:178px;height:16px;position:absolute;left:134px;top:260px;"><%=strTextDisplayValue%></label>

<% /* LabelLocation6::Text */ %>

<label  id="LabelLocation6:" name="LabelLocation6:" style="width:130px;height:16px;position:absolute;left:330px;top:260px;">Label Location:</label>

<% /* LabelLocation6:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "LabelLocation6" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "LabelLoc6" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on LabelLocation6: " + e.getMessage());
         task.log().info( "*** Error on ctrl LabelLocation6" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="LabelLocation6" name="LabelLocation6" style="width:178px;height:16px;position:absolute;left:466px;top:260px;"><%=strTextDisplayValue%></label>

<% /* PanelLocation7::Text */ %>

<label  id="PanelLocation7:" name="PanelLocation7:" style="width:130px;height:16px;position:absolute;left:0px;top:286px;">Panel Location:</label>

<% /* PanelLocation7:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "PanelLocation7" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "PanelLoc7" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on PanelLocation7: " + e.getMessage());
         task.log().info( "*** Error on ctrl PanelLocation7" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="PanelLocation7" name="PanelLocation7" style="width:178px;height:16px;position:absolute;left:134px;top:286px;"><%=strTextDisplayValue%></label>

<% /* LabelLocation7::Text */ %>

<label  id="LabelLocation7:" name="LabelLocation7:" style="width:130px;height:16px;position:absolute;left:330px;top:286px;">LabelLocation:</label>

<% /* LabelLocation7:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "LabelLocation7" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "LabelLoc7" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on LabelLocation7: " + e.getMessage());
         task.log().info( "*** Error on ctrl LabelLocation7" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="LabelLocation7" name="LabelLocation7" style="width:178px;height:16px;position:absolute;left:466px;top:286px;"><%=strTextDisplayValue%></label>

<% /* PanelLocation8::Text */ %>

<label  id="PanelLocation8:" name="PanelLocation8:" style="width:130px;height:16px;position:absolute;left:0px;top:312px;">PanelLocation:</label>

<% /* PanelLocation8:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "PanelLocation8" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "PanelLoc8" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on PanelLocation8: " + e.getMessage());
         task.log().info( "*** Error on ctrl PanelLocation8" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="PanelLocation8" name="PanelLocation8" style="width:178px;height:16px;position:absolute;left:134px;top:312px;"><%=strTextDisplayValue%></label>

<% /* LabelLocation8::Text */ %>

<label  id="LabelLocation8:" name="LabelLocation8:" style="width:130px;height:16px;position:absolute;left:330px;top:312px;">LabelLocation:</label>

<% /* LabelLocation8:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "LabelLocation8" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "LabelLoc8" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on LabelLocation8: " + e.getMessage());
         task.log().info( "*** Error on ctrl LabelLocation8" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="LabelLocation8" name="LabelLocation8" style="width:178px;height:16px;position:absolute;left:466px;top:312px;"><%=strTextDisplayValue%></label>

<% /* PanelLocation9::Text */ %>

<label  id="PanelLocation9:" name="PanelLocation9:" style="width:130px;height:16px;position:absolute;left:0px;top:338px;">Panel Location:</label>

<% /* PanelLocation9:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "PanelLocation9" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "PanelLoc9" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on PanelLocation9: " + e.getMessage());
         task.log().info( "*** Error on ctrl PanelLocation9" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="PanelLocation9" name="PanelLocation9" style="width:178px;height:16px;position:absolute;left:134px;top:338px;"><%=strTextDisplayValue%></label>

<% /* LabelLocation9::Text */ %>

<label  id="LabelLocation9:" name="LabelLocation9:" style="width:130px;height:16px;position:absolute;left:330px;top:338px;">Label Location:</label>

<% /* LabelLocation9:Text */ %>
<% strTextDisplayValue = "";
   mSubLC = task.getViewByName( "mSubLC" );
   if ( VmlOperation.isValid( mSubLC ) == false )
      task.log( ).debug( "Invalid View: " + "LabelLocation9" );
   else
   {
      nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "LabelLoc9" ).getString( "" );
      }
      catch (Exception e)
      {
         out.println("There is an error on LabelLocation9: " + e.getMessage());
         task.log().info( "*** Error on ctrl LabelLocation9" + e.getMessage() );
      }
         if ( strTextDisplayValue == null )
            strTextDisplayValue = "";
      }
   }
%>

<label  id="LabelLocation9" name="LabelLocation9" style="width:178px;height:16px;position:absolute;left:466px;top:338px;"><%=strTextDisplayValue%></label>


</div>  <!--  GroupBox1 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" class="withborder"   style="float:left;position:relative; width:692px; height:40px;">  <!-- GroupBox2 --> 

<% /* FullHazardStatement:Text */ %>

<label class="groupbox"  id="FullHazardStatement" name="FullHazardStatement" style="width:208px;height:16px;position:absolute;left:8px;top:14px;">Complete Hazard Statement</label>


</div>  <!--  GroupBox2 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3"   style="float:left;position:relative; width:692px; height:142px;">  <!-- GroupBox3 --> 

<% /* MLEditFullStatement:MLEdit */ %>
<%
   // : MLEditFullStatement
   strErrorMapValue = VmlOperation.CheckError( "MLEditFullStatement", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubLC = task.getViewByName( "mSubLC" );
      if ( VmlOperation.isValid( mSubLC ) == false )
         task.log( ).info( "Invalid View: " + "MLEditFullStatement" );
      else
      {
         nRC = mSubLC.cursor( "S_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mSubLC.cursor( "S_HumanHazardSection" ).getAttribute( "dFullStatement" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "S_HumanHazardSection.dFullStatement: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist for MLEditFullStatement: " + "mSubLC.S_HumanHazardSection" );
      }
   }
%>

<div name="MLEditFullStatement" id="MLEditFullStatement" style="width:672px;height:136px;position:absolute;left:10px;top:0px;border:solid;border-width:4px;border-style:groove;text-overflow:hidden;background-color:lightgray;" wrap="wrap"><%=strErrorMapValue%></div>


</div>  <!--  GroupBox3 --> 
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
   session.setAttribute( "ZeidonWindow", "wSLCHumanHazard" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
