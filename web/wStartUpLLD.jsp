<!DOCTYPE html>

<%-- wStartUpLLD --%>

<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.lang3.*" %>
<%@ page import="com.quinsoft.zeidon.*" %>
<%@ page import="com.quinsoft.zeidon.standardoe.*" %>
<%@ page import="com.quinsoft.zeidon.utils.*" %>
<%@ page import="com.quinsoft.zeidon.vml.*" %>
<%@ page import="com.quinsoft.zeidon.domains.*" %>
<%@ page import="com.arksoft.epamms.*" %>

<%! 

ObjectEngine objectEngine = com.arksoft.epamms.ZeidonObjectEngineConfiguration.getObjectEngine();

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

   if ( webMapping == true )
      return 2;

   if ( nMapError < 0 )
      session.setAttribute( "ZeidonError", "Y" );

   return nMapError;
}

%>

<%
// Variables request and session are defined in method mergedScriptlets(HttpServletRequest,HttpServletResponse,HttpSession,
// ServletContext,JspWriter,ServletConfig,JspContext,Object,PageContext,Throwable).
   
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

if ( strLastWindow.equals("wStartUpLLD") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wStartUpLLD strActionToProcess *** " + strActionToProcess );
task.log().info("*** wStartUpLLD LastWindow *** " + strLastWindow );
task.log().info("*** wStartUpLLD LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ExitLLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.ExitLLD" );
      try
      {
         nOptRC = wStartUp.ExitLLD( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation ExitLLD: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "NewLLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.NewLLD" );
      try
      {
         nOptRC = wStartUp.NewLLD( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation NewLLD: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "SaveLLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.SaveLLD" );
      try
      {
         nOptRC = wStartUp.SaveLLD( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation SaveLLD: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "OpenLLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.OpenLLD" );
      try
      {
         nOptRC = wStartUp.OpenLLD( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation OpenLLD: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StayOnWindowWithRefresh, "", "" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smNewLLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.NewLLD" );
      try
      {
         nOptRC = wStartUp.NewLLD( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation NewLLD: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smOpenLLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.OpenLLD" );
      try
      {
         nOptRC = wStartUp.OpenLLD( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation OpenLLD: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveLLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.SaveLLD" );
      try
      {
         nOptRC = wStartUp.SaveLLD( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation SaveLLD: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smExitLLD" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.ExitLLD" );
      try
      {
         nOptRC = wStartUp.ExitLLD( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation ExitLLD: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mProductManagement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.ProductManagement" );
      try
      {
         nOptRC = wStartUp.ProductManagement( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation ProductManagement: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartTopWindow, "wStartUp", "AdminListPrimaryRegistrants" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mSubregistrants" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.SubregistrantManagement" );
      try
      {
         nOptRC = wStartUp.SubregistrantManagement( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation SubregistrantManagement: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartTopWindow, "wStartUp", "AdminListSubregistrants" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mTrackingNotificationCompliance" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.TrackingNotificationCompliance" );
      try
      {
         nOptRC = wStartUp.TrackingNotificationCompliance( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation TrackingNotificationCompliance: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartTopWindow, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mStateRegistrations" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.StateRegistrations" );
      try
      {
         nOptRC = wStartUp.StateRegistrations( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation StateRegistrations: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartTopWindow, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mMarketingFulfillment" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.MarketingFulfillment" );
      try
      {
         nOptRC = wStartUp.MarketingFulfillment( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation MarketingFulfillment: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartTopWindow, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mWebDevelopment" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.WebDevelopment" );
      try
      {
         nOptRC = wStartUp.WebDevelopment( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation WebDevelopment: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartTopWindow, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mAdministration" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.PrimaryRegistrantCompanySetup" );
      try
      {
         nOptRC = wStartUp.PrimaryRegistrantCompanySetup( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation PrimaryRegistrantCompanySetup: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartTopWindow, "wStartUp", "AdminUpdatePrimaryRegistrant" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mLogin" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.ProcessLogin" );
      try
      {
         nOptRC = wStartUp.ProcessLogin( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation ProcessLogin: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_ResetTopWindow, "wStartUp", "UserLogin" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mTemplate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpLLD.jsp", "wStartUp.Template" );
      try
      {
         nOptRC = wStartUp.Template( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation Template: " + e.getMessage();
         task.log().info( strVMLError );
      }
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_ReplaceWindowWithModalWindow, "wTemplD", "TemplateList" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wStartUpLLD" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wStartUpLLD" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpLLD", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wStartUpLLD.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wStartUpLLD.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wStartUpLLD.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wStartUpLLD.jsp" );
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
   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wStartUp", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getStringFromAttribute( "BannerName" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).setAttribute( "CurrentDialog", "wStartUp" );
      wWebXA.cursor( "Root" ).setAttribute( "CurrentWindow", "LLD" );
   }

%>

<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Label DesignerXY</title>

<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>

<script language="JavaScript" type="text/javascript" src="./genjs/wStartUpLLD.js"></script>


<script src="js/LabelDesigner.js"></script>

<link rel="stylesheet" type="text/css" href="css/result-light.css">


   <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
   <link rel="stylesheet" type="text/css" href="css/result-light.css">
   <link rel="stylesheet" href="css/style.css" />
<!--   <link href="css/evol.colorpicker.css" rel="stylesheet" />  -->
   <link href="css/farbtastic.css" rel="stylesheet" />
   <style type="text/css" media="screen">

   /* #label {
         background:#eef;
         z-index:-5;
      }
      .panel {
         background-size: 0.25in 0.25in;    
         background-image:repeating-linear-gradient(0deg, #f00, #00f 1px, transparent 1px, transparent 40px),repeating-linear-gradient(270deg, #f00, #0f0 1px, transparent 1px, transparent 40px);
         opacity:0.14;
         z-index:-4;
      }
   */
      .colorwell {
         border: 2px solid #fff;
         width: 6em;
         text-align: center;
         cursor: pointer;
      }
      body .colorwell-selected {
         border: 2px solid #000;
         font-weight: bold;
      }
   </style>


   <script src="./js/jquery-1.10.2.js"></script>
   <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<!--   <script src="js/evol.colorpicker.js" type="text/javascript"></script>  -->
   <script src="js/farbtastic.js"></script>
<!--   <script src="js/label.js"></script>  -->
<script type='text/javascript'>


$(window).load(function(){
$(function() {

   var updatedLLD = false;
   var application = "epamms";
   var fileName = "";
   var currentPanel = 1;
   var $current_block = null;
   var generateTag = 100;
   var xOffset = 0;
   var yOffset = 0;
   var $panel = "#panel";
   var $trash = "#ztrash";
   var trash_icon = "<div style='float:bottom'><a href='link/to/trash/script/when/we/have/js/off' style='float:right' title='Remove this block' class='ui-icon ui-icon-trash'>Move image to trash</a></div>";
   var recycle_icon = "<div style='float:bottom'><a href='link/to/recycle/script/when/we/have/js/off' style='float:right' title='Restore this block' class='ui-icon ui-icon-refresh'>Restore image</a></div>";

   $("#panel").data( "z_^level", 0 );
   $("#panel2").data( "z_^level", 0 );
   $("#panel3").data( "z_^level", 0 );
   $("#panel4").data( "z_^level", 0 );
   $("#panel5").data( "z_^level", 0 );
   $("#panel6").data( "z_^level", 0 );
   $("#panel7").data( "z_^level", 0 );
   $("#panel8").data( "z_^level", 0 );
   $("#panel9").data( "z_^level", 0 );
   $("#zaccordion").accordion( {heightStyle: "fill"} );

   $(".draggable").draggable({
      revert: "invalid", // when not dropped, the item will revert back to its initial position
      helper: "clone",
      appendTo: "body",  // this keeps the drag item visible across divs
      cursor: "move",
      start: function( event, ui ) {
      // alert("Top: " +  $(this).offset().top);
      // console.log(ui);
      // console.log(ui.draggable);
      // $(this).css("z-index", 10 );
         var $parent = $(this).parent();
         var stopLoop = 0; // just to prevent infinite loop in case something goes wrong

         xOffset = 0;
         yOffset = 0;
         while ( $parent.parent().is( "html" ) === false && stopLoop++ < 20 )
         {
            if ( $parent.is( "div#zclient" ) )
            {
               xOffset = 0;
               yOffset = 0;
            }

            if ( $parent.is( "div#zviewport" ) )
               break;

         // console.log($parent);
         // console.log( "top: " + Math.floor( $parent.position().top ) );
         // console.log( "left: " + Math.floor( $parent.position().left ) );
            xOffset += Math.floor( $parent.position().left );
            yOffset += Math.floor( $parent.position().top );

            $parent = $parent.parent();
         }

         console.log( "Start yDrag: " + Math.floor( ui.offset.top - yOffset ).toString() + "  xDrag: " + Math.floor( ui.offset.left - xOffset ).toString() );

         updatePositionStatus( ui.offset.top - yOffset, ui.offset.left - xOffset );
         updateSizeStatus( $(this).height(), $(this).width() );
      },
      drag: function( event, ui ) {
         console.log( "Drag yDrag: " + Math.floor( ui.offset.top - yOffset ).toString() + "  xDrag: " + Math.floor( ui.offset.left - xOffset ).toString() );
         updatePositionStatus( ui.offset.top - yOffset, ui.offset.left - xOffset );
      },
      stop: function( event, ui ) {
      // $(this).css("z-index", 0 );
      // updatePositionStatus( ui.offset.top - yOffset, ui.offset.left - xOffset );
         console.log( "Stop yDrag: " + Math.floor( ui.offset.top - yOffset ).toString() + "  xDrag: " + Math.floor( ui.offset.left - xOffset ).toString() );
      // $(this).data( "z_^top", Math.floor( ui.offset.top - yOffset ).toString() );    not right ... done later
      // $(this).data( "z_^left", Math.floor( ui.offset.left - xOffset ).toString() );  not right ... done later
      // setCurrentBlockData( $(this), "updated 1" );
      // updatePositionStatus( -9999, -9999 );
      // updateSizeStatus( -9999, -9999 );
     }
   });

   // Note: "this" is the DOM object, whereas "$(this)" is the jQuery wrapper around the DOM object.
   // When using "this", you can call DOM methods on it, but not jQuery methods. When using "$(this)",
   // you can call jQuery methods on it, but not DOM methods.
   //
   // To create a jQuery element from a DOM element:
   //    var $elem = $(domElem);  // convert DOM element to jQuery element
   //    var htmlElem = $elem[0]; // convert jQuery element to HTML element

   // In the 'drop' event handler function for droppable, the dropped element is: ui.draggable

   function setBlockDraggableResizable( $canvas, $canvasElement, $target ) {
      console.log( "Canvas: " + $canvas.attr( "id" ) + "  canvasElement: " + $canvasElement.attr( "id" ) + "  target: " + $target.attr( "id" ) );
      $canvasElement.draggable({
         cancel: "a.ui-icon", // clicking a link with class .ui-icon won't initiate dragging
         containment: "#panel",
         appendTo: "body",  // this keeps the drag item visible across divs
         cursor: "move",
         start: function( event, ui ) {
         // $target.css("z-index", 10 );
            console.log( "Start yOffset: " + $canvasElement[0].offsetTop + "  xOffset: " + $canvasElement[0].offsetLeft );
            updatePositionStatus( $canvasElement[0].offsetTop, $canvasElement[0].offsetLeft );
            updateSizeStatus( $canvasElement[0].offsetHeight, $canvasElement[0].offsetWidth );
         },
         drag: function( event, ui ) {
            console.log( "Drag yOffset: " + $canvasElement[0].offsetTop + "  xOffset: " + $canvasElement[0].offsetLeft );
            updatePositionStatus( $canvasElement[0].offsetTop, $canvasElement[0].offsetLeft );
         },
         stop: function( event, ui ) {
         // $target.css("z-index", 0 );
         // updatePositionStatus( ui.offset.top - yOffset, ui.offset.left - xOffset );
            console.log( "Stop yOffset: " + $canvasElement[0].offsetTop + "  xOffset: " + $canvasElement[0].offsetLeft );
            updatedLLD = true;
            $canvasElement.data( "z_^top", Math.floor( $canvasElement[0].offsetTop ).toString() );
            $canvasElement.data( "z_^left", Math.floor( $canvasElement[0].offsetLeft ).toString() );
            setCurrentBlockData( $canvasElement, "updated 2" );
         // updatePositionStatus( -9999, -9999 );
         // updateSizeStatus( -9999, -9999 );
         }
      });
      $canvasElement.resizable({
         containment: "#panel",
         start: function( event, ui ) {   // alert("Top: " +  $target.offset().top);
            console.log( "Start yResize: " + $canvasElement[0].offsetHeight + "  xResize: " + $canvasElement[0].offsetWidth );
            updatePositionStatus( $canvasElement[0].offsetTop, $canvasElement[0].offsetLeft );
            updateSizeStatus( $canvasElement[0].offsetHeight, $canvasElement[0].offsetWidth );
         },
         resize: function( event, ui ) {
            console.log( "Resize yResize: " + $canvasElement[0].offsetHeight + "  xResize: " + $canvasElement[0].offsetWidth );
            updateSizeStatus( $canvasElement[0].offsetHeight, $canvasElement[0].offsetWidth );
         },
         stop: function( event, ui ) {
            console.log( "Stop yResize: " + $canvasElement[0].offsetHeight + "  xResize: " + $canvasElement[0].offsetWidth );
            updatedLLD = true;
            $canvasElement.data( "z_^height", Math.floor( $canvasElement[0].offsetHeight ).toString() );
            $canvasElement.data( "z_^width", Math.floor( $canvasElement[0].offsetWidth ).toString() );
            setCurrentBlockData( $canvasElement, "updated 3" );
         // updatePositionStatus( -9999, -9999 );
         // updateSizeStatus( -9999, -9999 );
         }
      });
   }

   $(".panel, .block-element").droppable({
      accept: ".draggable",
   // hoverClass: "ui-state-active",  partially highlights panel ... not so good
      drop: function( event, ui ) {
         var stopLoop = 1;
         if ( ui.draggable.hasClass( "canvas-element" ) ) {  // dragging block already on canvas
            var $canvasElement = $(ui.helper);
            var $parent = $canvasElement.parent();
            var $canvas = determineTargetOfDrop( event, $(this), $canvasElement );
            if ( true || $parent[0] !== $canvas[0] ) {
               var top = ui.offset.top;
               var left = ui.offset.left;
               while ( $parent[0] !== $canvas[0] && $parent[0].id !== "panel" && stopLoop < 20 ) {
                  top += $parent[0].offsetTop + $parent[0].clientTop;
                  left += $parent[0].offsetLeft + $parent[0].clientLeft;
                  $parent = $parent.parent();
                  stopLoop++;  // using level just to prevent infinite loop
               }

               stopLoop = 1;
               var $canvasParent = $canvas;
               while ( $canvasParent[0] !== $parent[0] && $canvasParent[0].id !== "panel" && stopLoop < 20 ) {
                  top -= $canvasParent[0].offsetTop + $canvasParent[0].clientTop;
                  left -= $canvasParent[0].offsetLeft + $canvasParent[0].clientLeft;
                  $canvasParent = $canvasParent.parent();
                  stopLoop++;
               }

               $canvasElement.offset({ top: Math.floor( top ), left: Math.floor( left ) });
               $canvas.append( $canvasElement );
               updatedLLD = true;
               setChildrenLevel( $canvas, $canvasElement );
            // setCurrentBlockData( $canvasElement, "updated 7" );
            // $canvasElement.data( "z_^top", Math.floor( top ).toString() );   done later
            // $canvasElement.data( "z_^left", Math.floor( left ).toString() ); done later
            }
            setCurrentBlockData( $canvasElement, "updated block already on canvas" );
         } else {
            var $canvasElement = $(ui.helper).clone(); // ui.draggable.clone();  dragging new block
            $canvasElement.height( $(ui.helper).height() ).width( $(ui.helper).width() );
            $canvasElement.css({ top:event.pageY, left:event.pageX });
            var uniqueTag = getUniqueId();
            $canvasElement.attr( "id", uniqueTag );
            var $canvas = determineTargetOfDrop( event, $(this), $canvasElement );
            $canvasElement.attr( "name", uniqueTag );
            $canvasElement.text( uniqueTag );
            $canvasElement.removeClass( "ui-draggable-dragging" ).addClass( "canvas-element block-element" );

            setBlockDraggableResizable( $canvas, $canvasElement, $(this) );

            $canvas.append( $canvasElement );
            $canvasElement.append( "<h5 class='ui-widget-header'></h5>" );
            $canvasParent = $canvas;
            while ( $canvasParent[0].id !== "panel" && stopLoop < 20 ) {
               stopLoop++;
               $canvasParent = $canvasParent.parent();
            }

            setChildrenLevel( $canvas, $canvasElement );
            $canvasElement.prepend( trash_icon );
            $canvasElement.css({
               position: "absolute",
               top: Math.floor( ui.position.top - $canvas.offset().top ),
               left: Math.floor( ui.position.left - $canvas.offset().left ),
               height: "100px",
               width: "100px"
            });
            updatedLLD = true;
            $canvasElement.data( "z_^top", Math.floor( ui.position.top - $canvas.offset().top ).toString() );
            $canvasElement.data( "z_^left", Math.floor( ui.position.left - $canvas.offset().left ).toString() );
            $canvasElement.data( "z_^height", "100px" );
            $canvasElement.data( "z_^width", "100px" );
            setCurrentBlockData( $canvasElement, "updated new block" );
         }
      }
   });
/*
   function bindEvents(){
      $('.block').not('.initialized').addClass('initialized').on().resizable().draggable();
   }
*/
   function setCurrentBlockData( $element, message ) {
      console.log( message + message + message + message );
      updatedLLD = true;
      mapElementToData( $element );
      if ( $current_block && $current_block.attr( "id" ) !== $element.attr( "id" ) ) {
         mapUiDataToElementData( $current_block );
      }
      $current_block = $element;
      mapElementDataToUiData( $current_block );
      $("#zBlockTag").val( $element.attr( "id" ) );
   }

   function floorPixel( attr ) {
      var idx = attr.indexOf( "px" );
      var pixels = Math.floor( attr.substring( 0, idx ) );
      if ( pixels < 0 ) {
         pixels = 0;
      }
      return( pixels + "px" );
   }

   function mapElementToData( $element ) {
   // $item.data( "z_^top", $item.position().top );  these don't have units (e.g. px)
   // $item.data( "z_^left", $item.position().left );
      var id = $element.parent().attr( "id" );
      $element.data( "rparent", id );
      $element.data( "z_^tag", $element.attr("id") );
      $element.data( "z_^top", floorPixel( $element.css( "top" ) ) );
      $element.data( "z_^left", floorPixel( $element.css( "left" ) ) );
      $element.data( "z_^height", floorPixel( $element.css( "height" ) ) );
      $element.data( "z_^width", floorPixel( $element.css( "width" ) ) );
      $element.css({ position: "absolute" });
   // displayElementData( "mapElementToData: ", $element );
   }

   function restoreProperties( $element ) {
      $element.css({ position: "absolute" });
   }

   function displayElementData( message, $element ) {
      if ( $element ) {
         console.log( message + "... Element Data for: " + $element.attr( "id" ) );
         if ( $element.data() ) {
            $.each( $element.data(), function( key, value ) {
               if ( typeof value === "string" || typeof value === "number" ) {
                  console.log( "   ~ " + key + " : " + value );
               }
            });
         }
      }
   }

   // <div id="label" name="label" class="label" style="top:0px;left:0px;width:8.5in;height:9in;float:left;position:absolute;">Drop area ...  <!-- without position:relative, target position is off -->
   // <div id="panel" name="panel" class="panel" style="background-color:lightyellow;top:0px;left:0px;width:8.5in;height:9in;float:left;position:absolute;">1
   // <div class="block draggable canvas-element block-element ui-draggable ui-resizable" style="position:absolute;top:-0.78125px;height:253px;width:266px;left:0px;background-color: #ccffcc; display: block; float: left; color: red; border: 2px solid;" id="Tag100" name="Tag100">
   // <input type="text" id="zLabelBackgroundColor" name="zLabelBackgroundColor" class="zeidon" data-zmap="label.z_^background^color"  value="#ffffed" />
   function mapUiDataToElementData( $current_element ) {
      if ( $current_element ) {
      // displayElementData( "mapUiDataToElementData (before)", $current_element );
         var entityAttr;
         var n;
         var entity;
         var key;
         var element_id = $current_element.attr( "id" );
         if ( element_id !== "label" && element_id !== "panel" ) {
            element_id = "block";
         }
         $("input.zeidon, select.zeidon").each( function() {
            entityAttr = $(this).data( "zmap" );
            if ( entityAttr ) {
               n = entityAttr.indexOf( ".z_" );
               entity = entityAttr.substring( 0, n );
               key = entityAttr.substring( n + 1 );
               if ( entity === element_id ) {
                  $current_element.data( key, $(this).val() );
               }
            }
         });
      // displayElementData( "mapUiDataToElementData (after)", $current_element );
      }
   }

   function mapElementDataToUiData( $current_element ) {
      if ( $current_element ) {
      // displayElementData( "mapElementDataToUiData", $current_element );
         var entityAttr;
         var n;
         var entity;
         var key;
         var value;
         var element_id = $current_element.attr( "id" );
         if ( element_id !== "label" && element_id !== "panel" ) {
            element_id = "block";
         }
         $("input.zeidon, select.zeidon").each( function() {
            entityAttr = $(this).data( "zmap" );
            if ( entityAttr ) {
               n = entityAttr.indexOf( ".z_" );
               entity = entityAttr.substring( 0, n );
               key = entityAttr.substring( n + 1 );
               if ( entity === element_id ) {
                  value = $current_element.data( key );
                  if ( ! value ) {
                     value = "";
                  }
                  if ( $(this).hasClass( "colorwell" ) ) {
                     if ( value.indexOf( '#' ) !== 0 ) {
                        value = "#ffffff";
                     }
                     var colorPicker = $.farbtastic( "#" + $(this).attr( "id" ) );
                     colorPicker.setColor( value );
                  }
                  $(this).val( value );
               }
            }
         });
      }
   }

   $("#zBlockTag").blur( function() {
      if ( $current_block ) {
         var newText = $(this).val();
         $current_block.attr( "id", newText );
         $current_block.attr( "name", newText );
      // $current_block.text( newText );  this wipes out all child nodes of the div ... but the complicated next line works.
         $current_block.contents().filter(function() { return this.nodeType === 3; }).replaceWith( newText );
      }
      return false;  // prevent default and propagation
   });

   $("div").on( "mousedown", ".block-element", function( event ) {
      if ( event.button === 0 ) {  // left button
         mapUiDataToElementData( $current_block );
         $current_block = $(this);
         $("#zBlockTag").val( $(this).attr( "id" ) );
         mapElementDataToUiData( $current_block );
         return false;  // prevent default and propagation
      }
   });
/*
   $("body").on( "click", "div.ui-draggable", function() {
      mapUiDataToElementData( $current_block );
      $current_block = $(this);
      $("#zBlockTag").val( $(this).attr( "id" ) );
      mapElementDataToUiData( $current_block );
      return false;  // prevent default and propagation
   });
*/
   $("body").on( "click", "a.ui-icon-trash", function() {
      trashImage( $(this) );
      return false;  // prevent default and propagation
   });

   $("body").on( "click", "a.ui-icon-refresh", function() {
      restoreImage( $(this) );
      return false;  // prevent default and propagation
   });

   function trashImage( $item ) {
      var $parent = $item.parent();
      $parent = $parent.parent();
      $item.parent().remove();
      mapElementToData( $parent );
      $parent.fadeOut( function() {
         var $list = $( "ul", $trash ).length ?
            $( "ul", $trash ) :
            $("<ul class='pool ui-helper-reset'/>").appendTo( $trash );

         $parent
            .prepend( recycle_icon )
            .appendTo( $list )
            .fadeIn( function() {
               $parent.animate( { top: "0px", left: "0px", width: "60px", height: "40px" } );
            });
      });
   }

   function restoreImage( $item ) {
      var $parent = $item.parent();
      $parent = $parent.parent();  // now we are at the correct item
      var $newParent = null;
      var id = $parent.data( "rparent" );
      if ( id !== "" ) {
         $newParent = $("#" + id);
      }
      if ( $newParent === null ) {
         $newParent = $("#panel");
      }
      $item.parent().remove();
      restoreProperties( $parent );
      $parent.fadeOut(function() {
         $parent
            .prepend( trash_icon )
            .appendTo( $newParent )
            .fadeIn( function() {
               $parent.animate( { top: $parent.data( "z_^top" ), left: $parent.data( "z_^left" ), width: $parent.data( "z_^width" ), height: $parent.data( "z_^height" ) } );
            });
      });
   }

   function getBackgroundColorForLevel( level ) {
      if ( level <= 0 )
         level = 1;
      else
      if ( level > 7 )
         level = ((level - 1) % 7) + 1;

      return level === 1 ? "#ccffcc" : level === 2 ? "#ccffff" : level === 3 ? "#ffccff" : level === 4 ? "#ccccff" : level === 5 ? "#ffcccc" : level === 6 ? "#ffffcc" : "#cccccc";
   }

   function getColorForLevel( level ) {
      if ( level <= 0 || level >= 7  ) {
         level = 1;
      }

      return level === 1 ? "red" : level === 2 ? "brown" : level === 3 ? "yellow" : level === 4 ? "green" : level === 5 ? "blue" : level === 6 ? "indigo" : "violet";
   }

   function setChildrenLevel( $parent, $child ) {
      var level = parseInt( $parent.data( "z_^level" ), 10 ) + 1;
      $child.data( "z_^level", level );
      $child.css({
         background: getBackgroundColorForLevel( level ),
         color: getColorForLevel( level )
      });

      // get all divs of the child
      $( "div" ).children( ".selected" ).css( "color", "blue" );
      var $children = $child.children();
      var list = $children.map(function() {
         if ( this.nodeName === "DIV" && this.classList.contains( "ui-draggable") === true ) {
            return $(this); //.nodeName + ' ' + this.className + '  id: ' + this.id;
         }
      }).get();
   // displayElementData( "setChildrenLevel (after)", $child );
      for ( var k = 0; k < list.length; k++ ) {
         setChildrenLevel( $child, list[k] );
      }
   }

   function determineTargetOfDrop( event, $parent, $canvasElement ) {
      var clickX = event.pageX;
      var clickY = event.pageY;
      var $list;
      var offset;
      var range;
      var $body = $('body').parents().addBack();

      $list = $('body *').filter(function() {
        offset = $(this).offset();
        range = {
            x: [offset.left, offset.left + $(this).outerWidth()],
            y: [offset.top, offset.top + $(this).outerHeight()]
        };

        return (clickX >= range.x[0] && clickX <= range.x[1]) && (clickY >= range.y[0] && clickY <= range.y[1]);
      });

      $list = $list.add($body);

      var list = $list.map( function() {
         if ( this.nodeName === "DIV" && this.id !== null && this.id !== "ztrash" && this.id !== "label" &&
              this.id !== "zcontainer" && this.id.indexOf( "ui-accordion" ) < 0 &&
              this.classList.contains( "ui-draggable-dragging") === false ) {
            return $(this); //.nodeName + ' ' + this.className + '  id: ' + this.id;
         }
      }).get();

   // console.log( "List: " + list );
      var $target = $parent;
      var ceTop = Math.floor( $canvasElement.offset().top );
      var ceLeft = Math.floor( $canvasElement.offset().left );
      var ceHeight = Math.floor( $canvasElement.height() );
      var ceWidth = Math.floor( $canvasElement.width() );
   // var tgtTop = $target.offset().top;
   // var tgtLeft = $target.offset().left;
      var tgtHeight = Math.floor( $target.height() );
      var tgtWidth = Math.floor( $target.width() );
      var $el;
      var elHeight;
      var elWidth;

      if ( ceTop === 0 && ceLeft === 0 ) {
         ceTop = clickY;
         ceLeft = clickX;
      }

      for ( var k = 0; k < list.length; k++ ) {
         $el = list[k];
         if ( $el.parents("div#panel").length ) {  // clicked element has div#panel as parent
            elHeight = Math.floor( $el.height() );
            elWidth = Math.floor( $el.width() );

            if ( elHeight < tgtHeight && elWidth < tgtWidth &&  // clicked element is smaller than current target
                 ceTop >= Math.floor( $el.offset().top ) && ceLeft >= Math.floor( $el.offset().left ) &&  // new element within clicked element boundaries
                 ceTop + ceHeight < Math.floor( $el.offset().top ) + elHeight &&
                 ceLeft + ceWidth < Math.floor( $el.offset().left ) + elWidth ) {
               $target = $el;
            // tgtTop = $target.offset().top;
            // tgtLeft = $target.offset().left;
               tgtHeight = Math.floor( $target.height() );
               tgtWidth = Math.floor( $target.width() );
            }
         }
      }

      return $target;
   }

   function getUniqueId() {
      var k = 0; // prevent infinite loop
      var arr = $(document.getElementById( "Tag" + generateTag ));
      do
      {
         if ( $(arr).length <= 0 ) {
            break;
         }

         generateTag++;
         arr = $(document.getElementById( "Tag" + generateTag ));
      } while ( k++ < 100 )

      var tag = "Tag" + generateTag;
      console.log( "getUniqueId: " + tag );
      return tag;
   }

   function updatePositionStatus( offset_top, offset_left ) {
      // ... then update the numbers
      var new_position;
      if ( offset_top === -9999 ) {
         new_position = "";
      } else {
         new_position = "Position: " + Math.floor( offset_top ) + "," + Math.floor( offset_left );
      }

      $( "span#zdisplay_position" ).text( new_position );
   }

   function updateSizeStatus( height, width ) {
      // ... then update the numbers
      var new_size;
      if ( width === -9999 ) {
         new_size = "";
      } else {
         new_size = "Size: " + height + "," + width;
      }

      $("span#zdisplay_size").text( new_size );
   }

   $.fn.makeAbsolute = function( rebase ) {
      return this.each(function() {
         var el = $(this);
         var pos = el.position();
         el.css({ position: "absolute", marginLeft: 0, marginTop: 0, top: pos.top, left: pos.left });
         if ( rebase )
            el.remove().appendTo( "body" );
      });
   };

   function mapDOM( element, json ) {
      var treeObject = {};

      // If it's a string, convert to a document Node
      if ( typeof element === "string" ) {
         if ( window.DOMParser )
         {
            parser = new DOMParser();
            docNode = parser.parseFromString( element, "text/xml" );
         }
         else // Microsoft strikes again
         {
            docNode = new ActiveXObject( "Microsoft.XMLDOM" );
            docNode.async = false;
            docNode.loadXML( element );
         }
         element = docNode.firstChild;
      }

      // Recursively loop through DOM elements and assign properties to object
      function treeHTML( element, object ) {
         object["type"] = element.nodeName;
         var nodeList = element.childNodes;
         if ( nodeList !== null ) {
            if ( nodeList.length ) {
               object["content"] = [];
               for ( var i = 0; i < nodeList.length; i++ ) {
                  if ( nodeList[i].nodeType === 3 ) {
                     object["content"].push(nodeList[i].nodeValue);
                  } else {
                     object["content"].push( {} );
                     treeHTML( nodeList[i], object["content"][object["content"].length - 1] );
                  }
               }
            }
         }
         if ( element.attributes != null ) {  // cannot use !== here
            if ( element.attributes.length ) {
               object["attributes"] = {};
               for ( var i = 0; i < element.attributes.length; i++ ) {
                  object["attributes"][element.attributes[i].nodeName] = element.attributes[i].nodeValue;
               }
            }
         }
      }
      treeHTML(element, treeObject);

      return (json) ? JSON.stringify( treeObject ) : treeObject;
   }

   function selectPanel( value ) {
      mapUiDataToElementData( $("#panel") );
      $("#panel").attr( "id", "panel" + currentPanel ).removeClass( "panel_active" ).addClass( "panel_hidden" ).hide();
      $("#panel" + value).attr( "id", "panel" ).removeClass( "panel_hidden" ).addClass( "panel_active" ).show();
      currentPanel = value;
      mapElementDataToUiData( $("#panel") );
   }
/*
   var selected;
   var f = $.farbtastic('#zpicker');
   var p = $('#zpicker').css('opacity', 0.25);
   $('.colorwell')
      .each(function () {
         f.linkTo(this);
         $(this).css('opacity', 0.75);
      })
      .focus(function() {
         if (selected) {
            $(selected).css('opacity', 0.75).removeClass('colorwell-selected');
         }
         f.linkTo(this);
         p.css('opacity', 1);
         $(selected = this).css('opacity', 1).addClass('colorwell-selected');
      });
*/
   function fbCallback( color ) {
      alert( "fbCallback color: " + color );
   }

   $("#jQueryRequired").hide();
// $("#zBlockBackgroundColor").attr( "readonly", true );
   var selectedBlock;
   var fBlock = $.farbtastic( "#zBlockPicker", fbCallback );
   var pBlock = $("#zBlockPicker").css("opacity", 0.25).hide();
   $("input.colorwell1")
      .each( function() {
         fBlock.linkTo(this);
         $(this).css( "opacity", 0.75 );
      })
      .blur( function() {
        pBlock.css( "opacity", 0.25 );
        pBlock.hide();
      })
      .focus( function() {
         if ( selectedBlock ) {
            $(selectedBlock).css( "opacity", 0.75 ).removeClass( "colorwell-selected" );
         }
         fBlock.linkTo( this );
         pBlock.css( "opacity", 1 );
         pBlock.fadeIn();
         $(selectedBlock = this).css( "opacity", 1 ).addClass( "colorwell-selected" );
      });

   var selectedLabel;
// $("#zLabelBackgroundColor").attr( "readonly", true );
   var fLLD = $.farbtastic( "#zLabelPicker", fbCallback );
   var pLLD = $("#zLabelPicker").css("opacity", 0.25).hide();
   $("input.colorwell2")
      .each( function() {
         fLLD.linkTo(this); $(this).css( "opacity", 0.75 );
      })
      .blur( function() {
        pLLD.css( "opacity", 0.25 );
        pLLD.hide();
      })
      .focus( function() {
         if ( selectedLabel ) {
            $(selectedLabel).css( "opacity", 0.75 ).removeClass( "colorwell-selected" );
         }
         fLLD.linkTo( this );
         pLLD.css( "opacity", 1 );
         pLLD.fadeIn();
         $(selectedLabel = this).css( "opacity", 1 ).addClass( "colorwell-selected" );
      });

   $("input.zeidon, select.zeidon")
      .blur( function () {
      // var jsonObj = null;
         var entityAttr = $(this).data( "zmap" );
         if ( entityAttr ) {
            var n = entityAttr.indexOf( ".z_" );
            var entity = entityAttr.substring( 0, n );
            var key = entityAttr.substring( n + 1 );
            if ( entity === "block" ) {
               if ( $current_block ) {
                  updatedLLD = true;
                  console.log( "updated block attribute: " + key + "  value: " + $(this).val() );
                  $current_block.data( key, $(this).val() );
               }
            // jsonObj = dataToJSON( $current_block );
            } else if ( entity === "panel" ) {
               updatedLLD = true;
               console.log( "updated panel attribute: " + key + "  value: " + $(this).val() );
               $("#panel").data( key, $(this).val() );
            // jsonObj = dataToJSON( $("#panel") );
            } else if ( entity === "label" ) {
               console.log( "updated label attribute: " + key + "  value: " + $(this).val() );
               updatedLLD = true;
               $("#label").data( key, $(this).val() );
            }
            /*
            var jsonOut = "jsonOut: \n";
            jQuery.each( jsonObj, function(i, val) {
               jsonOut += "  ==> " + i + " - " + val + "\n";
            });
            alert( "jsonOut: " + jsonOut );
            */
         }
      });

// $("#zBlockTextAlign").combobox();
// $("#zHazardPanel").combobox();

   var $PanelSpinner = $("#zPanelSpinner").spinner();
   $PanelSpinner.spinner( "option", "min", 1 );
   $PanelSpinner.spinner( "option", "max", 9 );
   $PanelSpinner.spinner( "option", "numberFormat", "nn" );
   $PanelSpinner[0].readOnly = true;  // prevent invalid input

   // Handle the Spinner change event.
   $PanelSpinner.on( "spinstop", function( event, ui ) {
      selectPanel( $PanelSpinner.spinner( "value" ) );
   });

//x$(function() {
//x   $("#zPanelUnits").buttonset();
//x});

// $("#zPanelUnits").buttonset().find("label").css({ width: "50%" });
//x$("#zPanelUnits").buttonset().find('label').css({ 'width': '40px', 'height': '24px'});

//x$(function() {
//x   $("#zBlockUnits").buttonset();
//x});

// $("#zBlockUnits").buttonset().find("label").css({ width: "50%" });
//x$("#zBlockUnits").buttonset().find('label').css({ 'width': '40px', 'height': '24px'});

   $(function() {
      $( "#zmbp" ).tabs({
      // event: "mouseover"
      });
   });

// $(function() {
//    $( "#zcheckContinuationBlock" ).button();
//  });

   // we need tabs as spaces and not CSS magin-left in order to retain format when copying and pasting the code
   window.SINGLE_TAB = "  ";
   window.TAB = MultiplyString( 2, window.SINGLE_TAB );
   window.ImgCollapsed = "images/plus.gif";
   window.ImgExpanded = "images/minus.gif";
   window.QuoteKeys = true;
   var blockRecurse = 0;
   var entityIdx = -1;
   var recurse = -1;
   var firstPanel = true;
   var lastPanel = false;

   function IsArray( obj ) {
      return obj &&
             typeof obj === 'object' &&
             typeof obj.length === 'number' &&
             !(obj.propertyIsEnumerable( 'length' ));
   }

   var req = null;
   var isIE = false;

   function initRequest() {
      if (window.XMLHttpRequest) {
         if (navigator.userAgent.indexOf('MSIE') !== -1) {
            isIE = true;
         }
         return new XMLHttpRequest();
      } else if (window.ActiveXObject) {
         isIE = true;
         return new ActiveXObject("Microsoft.XMLHTTP");
      }
   }

// ReadyState	Holds the status of the XMLHttpRequest. Changes from 0 to 4:
//  - 0: request not initialized
//  - 1: server connection established
//  - 2: request received
//  - 3: processing request
//  - 4: request finished and response is ready
// status - 200: "OK"
//        - 404: Page not found
/* function FormatToJsonLLD_Callback() {
      if ( req.readyState === 4 ) {
         if ( req.status === 200 ) {
         // parseMessages( req.responseXML );
         // $id("zFormattedJsonLabel").innerHTML = jsonLabel;
            alert( "Accept: " + req.responseText );
         }
      }
   }
*/
   // jQuery.post( url [, data ] [, success(data, textStatus, jqXHR) ] [, dataType ] )  Returns: jqXHR
   // Additional parameters:
   //   data - contains the resulting data from the request
   //   status - contains the status of the request ("success", "notmodified", "error", "timeout", or "parsererror")
   //   xhr - contains the XMLHttpRequest object
   function FormatToJsonLLD_Callback( jsonZeidon, status, xhr ) {
      if ( xhr.readyState === 4 ) {
         if ( xhr.status === 200 ) {
         // parseMessages( req.responseXML );
            console.log( "Accept JSON Zeidon: " + jsonZeidon );
         }
      }
   }
/*
   function ConvertWysiwygLabelDesignToZeidonJson( name ) {
      $("#panel").attr( "id", "panel" + currentPanel ).attr( "name", "panel" + currentPanel );
      var $initElement = $("#label");
      var jsonDOM = mapDOM( $initElement[0], true );
   // console.log( "JSON DOM: " + jsonDOM );
      var jsonLabel = CaptureZeidonLabelJsonFromDomJson( jsonDOM );
      
      // Display the resultant JSON that will be passed to Zeidon to be saved as an LLD.
   // console.log( "\nJsonLabel: " + jsonLabel );
      try {
      // var jsonObj = eval( "[" + jsonLabel + "]" );
      // var jsonObj = jQuery.parseJSON( "[" + jsonLabel + "]" );  // this is faster and more secure than eval (above)
      // var formattedHtml = RenderJsonObjectAsFormattedHtml( jsonObj[0], 0, false, false, false );
      // $id("FormattedJsonLabel").innerHTML = "<PRE class='CodeContainer'>" + formattedHtml + "</PRE>";

         // Assign handlers immediately after making the request and remember the jqxhr object for this request
         // Pass the JSON version of the label to Zeidon (on the server) to be saved as an LLD.
         var url = "labeldesigner?action=saveLabel&fileName=" + escape( name ) + "&jsonLabel=" + escape( jsonLabel );
         var jqxhr = $.post( url,
                             FormatToJsonLLD_Callback ) // the function to run if the request succeeds
            .done(function() {
               console.log( "Save LLD to Zeidon: second success" );
            })
            .fail(function() {
               alert( "error " + jqxhr.toString() );
            })
            .always(function() {
               console.log( "Save LLD to Zeidon: always finished" );
         });

         // Perform other work here ...

         // Set another completion function for the request above
         jqxhr.always(function() {
            console.log( "Save LLD to Zeidon: second always finished" );
         });

      } catch(e) {
         $id("FormattedJsonLabel").innerHTML = jsonLabel;
         alert( "JSON Label is not well formatted:\n" + e.message );
      } finally {
         $("#panel" + currentPanel).attr( "id", "panel" ).attr( "name", "panel" );
      }
   }
*/
   function ConvertWysiwygLabelDesignToZeidonJson( name ) {
      $("#panel").attr( "id", "panel" + currentPanel ).attr( "name", "panel" + currentPanel );
      var $initElement = $("#label");
      var jsonDOM = mapDOM( $initElement[0], true );
   // console.log( "JSON DOM: " + jsonDOM );
      var jsonLabel = CaptureZeidonLabelJsonFromDomJson( jsonDOM );

      // Display the resultant JSON that will be passed to Zeidon to be saved as an LLD.
   // console.log( "\nJsonLabel: " + jsonLabel );
      var url = "labeldesigner?action=saveLabel&fileName=" + escape( name );

      // Display the resultant JSON that will be passed to Zeidon to be saved as an LLD.
   // console.log( "\nJsonLabel: " + jsonLabel );

      $.ajax({
         url : url,
         type : 'POST',
         data : { jsonLabel : jsonLabel },
         dataType : 'json',
         success: function( data ) {
            console.log( data );
         }
      });

// The following does not work???
//      var jsonObj = new Object();
//      jsonObj.action = "saveLabel";
//      jsonObj.fileName = escape( name );
//      jsonObj.jsonLabel = jsonLabel;
// 
//      $.ajax({
//         url: "labeldesigner",
//         type: 'POST',
//         dataType: 'json',
//         data: JSON.stringify( jsonObj ),
//         contentType: 'application/json',
//         mimeType: 'application/json',
//         success: function( data ) {
//            console.log( data );
//         }
//      });
   }

   $("#zLLD_Save").click( function() {
      var name = $("#zLLD_Name").val();
      if ( name === "" ) {
         alert( "LLD Name is required for Save!");
      } else {
         if ( updatedLLD ) {
            ConvertWysiwygLabelDesignToZeidonJson( name );
            updatedLLD = false;
         }
      }
      return false;
   });

   function CaptureZeidonLabelJsonFromDomJson( jsonDom ) {
   // var jsonObj = eval( "[" + json + "]" );
      var jsonObj = jQuery.parseJSON( "[" + jsonDom + "]" );  // this is faster and more secure than eval
      var formattedHtml = RenderJsonObjectAsFormattedHtml( jsonObj[0], 0, false, false, false );
   // $id("FormattedJsonLabel").innerHTML = "<PRE class='CodeContainer'>" + formattedHtml + "</PRE>";

   // once is enough (above)? jsonObj = jQuery.parseJSON( "[" + jsonDom + "]" );  // this is faster and more secure than eval
      var jsonLabel = "{ \".oimeta\" : { \"application\" : \"epamms\", \"odName\" : \"mLLD\", \"incremental\" : \"true\" }";
      var firstBlock = new Object();
      firstBlock.isFirst = true;
      jsonLabel += TranslateWysiwygDesignToJsonLabel( null, -1, jsonObj[0], false, false, false, firstBlock );
      jsonLabel += "}";
      return jsonLabel;
   }

   window._dateObj = new Date();
   window._regexpObj = new RegExp();

   function CheckIfLastSibling( parentArray, parentIdx, className ) {
      var objType;
      if ( parentArray !== null && parentIdx >= 0 ) {
         while ( parentIdx < parentArray.length ) {
            objType = typeof parentArray[parentIdx];
            if ( objType === 'object' ) {
               var obj = parentArray[parentIdx];
               var numProps = 0;
               var type = false;
               var content = false;
               var attributes = false;
               for ( var prop in obj ) {
                  if ( prop === "type" ) {
                     if ( obj[prop] !== "DIV" ) {
                        numProps = 0;
                        break;
                     }
                     type = true;
                  } else
                  if ( prop === "content" ) {
                     content = true;
                  } else
                  if ( prop === "attributes" ) {
                     attributes = true;
                  }
                  numProps++;
               }

               var skip = type && content && attributes;
               if ( skip && numProps > 0 ) {  // it's a DIV
                  // get the class
                  var classlist = obj["attributes"]["class"];
                  if ( classlist && classlist.indexOf( className ) >= 0 ) {
                     return false;
                  }
               }
            }

            parentIdx++;
         }
      }

      return true;
   }

   function propertyToZeidonAttribute( property ) {
      var hat = property.indexOf( "^" );
      var start;
      var end;
      while ( hat >= 0 ) {
         start = property.substring( 0, hat );
         end = property.substring( hat + 1 );
         property = start + end.substring( 0, 1 ).toUpperCase() + end.substring( 1 );
         hat = property.indexOf( "^", hat );
      }
      
      return property;
   }

   function elementDataToJSON( id ) {
      var $element = $("#" + id);
      var json = "";
      if ( $element ) {
         $.each( $element.data(), function( key, value ) {
            if ( key.indexOf( "z_" ) === 0 && (typeof value === "string" || typeof value === "number") ) {
               var zeidonAttribute = propertyToZeidonAttribute( key.substring( 2 ) );
               json += ", \"" + zeidonAttribute + "\" : \"" + value + "\"";
            }
         });
      }

      return json;
   }

   function TranslateWysiwygDesignToJsonLabel( parentArray, parentIdx, obj, addComma, isArray, isPropertyContent, firstBlockIn ) {
      var jsonLabel = "";
      var comma = (addComma) ? ", " : "";
      var objType = typeof obj;
      recurse++;
      var firstBlock = new Object();
      firstBlock.isFirst = firstBlockIn.isFirst;
      if ( IsArray( obj ) ) {
         if ( obj.length === 0 ) {
         // json += GetRow( -1, "[ ]" + comma, isPropertyContent );
         } else {
         // json += GetRow( -1, "[", isPropertyContent );
             for ( var k = 0; k < obj.length; k++ ) {
               if ( typeof obj[k] !== "string" ) {
                  jsonLabel += TranslateWysiwygDesignToJsonLabel( obj, k + 1, obj[k], k < (obj.length - 1), true, false, firstBlock );
               }
            }
         }
      // json += GetRow( -1, "], " + comma, false );
      } else if ( objType === 'object' ) {
         if ( obj === null ){
            jsonLabel += FormatLiteral( "null", "", comma, -1, isArray, "Null" );
         } else if ( obj.constructor === window._dateObj.constructor ) {
            jsonLabel += FormatLiteral( "new Date(" + obj.getTime() + ") /*" + obj.toLocaleString() + "*/", "", comma, -1, isArray, "Date" );
         } else if ( obj.constructor === window._regexpObj.constructor ) {
            jsonLabel += FormatLiteral( "new RegExp(" + obj + ")", "", comma, -1, isArray, "RegExp" );
         } else {
            var numProps = 0;
            var type = false;
            var content = false;
            var attributes = false;
            for ( var prop in obj ) {
            // console.log( obj[prop] );
               if ( prop === "type" ) {
                  if ( obj[prop] !== "DIV" ) {
                     numProps = 0;
                     break;
                  }
                  type = true;
               }
               else
               if ( prop === "content" ) {
                  content = true;
               }
               else
               if ( prop === "attributes" ) {
                  attributes = true;
               }
               numProps++;
            }
            if ( numProps === 0 ) {
            // json += GetRow( -1, comma, isPropertyContent );
            } else {
               var skip = type && content && attributes;
               if ( skip ) {  // it's a DIV
                  // get the class
                  var classlist = obj["attributes"]["class"];
                  var text;
                  if ( typeof obj["content"][0] === "string" ) {
                     text = stripTrailingWhiteSpace( obj["content"][0] );
                  }
                  else {
                     text = "";
                  }
                  // Anytime you start a new entity you need a comma, no matter what the
                  // previous "thing" was.  At the end of every entity, "} ]" is required,
                  // unless it is a sibling entity of the same name.  In that case, we
                  // want to skip the "} ]" and the entity name and " : [".
                  if ( classlist ) {
                     var isLabel = false;  // there is only one label
                     var isPanel = false;  // there are panels at only one level
                     
                     var lastBlock = true;
                     var isBlock = false;
                     if ( classlist.indexOf( "label" ) >= 0 ) {
                        isLabel = true;
                        entityIdx = -1;
                        firstPanel = true;
                        lastPanel = false;
                        jsonLabel += ", \n\"LLD\" : [ { \".meta\" : { \"created\" : \"true\" }, \"Name\" : \"" + text + "\" ";
                        jsonLabel += GetRow( -1, TranslateWysiwygDesignToJsonLabel( null, -1, obj["attributes"], 0, true, false, firstBlock ), false );
                     } else if ( classlist.indexOf( "panel" ) >= 0 ) {
                        isPanel = true;
                        entityIdx = 0;
                        blockRecurse = 0;
                        firstBlock.isFirst = true;
                        if ( firstPanel ) {
                           jsonLabel += ", \n\"Panel\" : [ { \".meta\" : { \"created\" : \"true\" }, \"Order\" : \"" + text + "\" ";
                           firstPanel = false;
                        } else {
                           jsonLabel += "}, \n{ \".meta\" : { \"created\" : \"true\" }, \"Order\" : \"" + text + "\" ";
                        }
                        jsonLabel += GetRow( -1, TranslateWysiwygDesignToJsonLabel( null, -1, obj["attributes"], 0, true, false, firstBlock ), false );
                        lastPanel = CheckIfLastSibling( parentArray, parentIdx, "panel" );
                     } else if ( classlist.indexOf( "block" ) >= 0 ) {
                        var $element = $("#" + obj["attributes"]["id"]);
                        var blockLevel = parseInt( $element.data( "z_^level" ) );
                        isBlock = true;
                        if ( firstBlock.isFirst || blockLevel > blockRecurse ) {
                           blockRecurse = blockLevel;
                           firstBlock.isFirst = false;
                           if ( blockLevel > 1 ) {
                              jsonLabel += ", \n\"BlockBlock\" : [ { \".meta\" : { \"created\" : \"true\" } ";
                           } else {
                              jsonLabel += ", \n\"Block\" : [ { \".meta\" : { \"created\" : \"true\" } ";
                           }
                        } else {
                           jsonLabel += ", \n{ \".meta\" : { \"created\" : \"true\" } ";
                        }
                        // This is where we need to determine if there is a sibling block!
                        lastBlock = CheckIfLastSibling( parentArray, parentIdx, "block" );
                        jsonLabel += GetRow( -1, TranslateWysiwygDesignToJsonLabel( null, -1, obj["attributes"], 0, true, false, firstBlock ), false );
                        entityIdx--;
                     // if ( json.indexOf( "Tag107" ) >= 0 ) {
                        // console.log( "json: " + json );
                        // console.log( obj["content"] );
                        // lastBlock = CheckIfLastBlockSibling( parentArray, parentIdx );
                     // }
                     }
                  // console.log( obj["content"] );
                     firstBlockIn.isFirst = firstBlock.isFirst = lastBlock;
                     jsonLabel += GetRow( -1, TranslateWysiwygDesignToJsonLabel( null, -1, obj["content"], 0, true, false, firstBlock ), false );
                     if ( isBlock ) {
                        if ( lastBlock ) {
                           jsonLabel += GetRow( -1, " } ]", isPropertyContent );
                        } else {
                           jsonLabel += GetRow( -1, " }", isPropertyContent );
                        }
                     }
                     if ( isPanel && lastPanel ) {
                        jsonLabel += GetRow( -1, " } ]", isPropertyContent );
                     }
                     if ( isLabel ) {  // there is only one label
                        jsonLabel += GetRow( -1, " } ]", isPropertyContent );
                     }
                  }
               } else if ( type === false ) {
                  // we're looking at attributes
                  console.log( "Looking for attributes in: " + obj['id'] );
                  for ( var prop in obj ) {
                  // console.log( obj[prop] );
                     if ( prop === "id" ) {
                        // 'id' and 'name' should be the same!
                        if ( obj['id'] !== obj['name']) {
                           alert( "Houston ... we have a problem with id != name" );
                        }

                        // Guarantee the Tag is set properly in the element data.
                     // jsonLabel += GetRow( -1, ", \"Tag\" : \"" + trimLeadingAndTrailingWhiteSpace( obj[prop] ) + "\"", isPropertyContent );
                        $("#" + obj['id']).data( "z_^tag", obj['id'] );

                        // So let's get the all of the custom properties for this element
                     // displayElementData( "TranslateWysiwygDesignToJsonLabel", $("#" + obj['id']) );
                        jsonLabel += elementDataToJSON( obj['id'] );
                     } /* else if ( prop === "style" ) {   these are done using the "data" versions
                        // do position and size
                        var stylelist = obj[prop];
                        jsonLabel += FormatStyle( stylelist, "top" );
                        jsonLabel += FormatStyle( stylelist, "left" );
                        jsonLabel += FormatStyle( stylelist, "height" );
                        jsonLabel += FormatStyle( stylelist, "width" );
                     } */
                  }
               }
            // json += GetRow( -1, "\n", isPropertyContent );
            }
         }
      } else if ( objType === 'string' ) {
         jsonLabel += FormatLiteral( obj.toString().split("\\").join("\\\\").split('"').join('\\"'), "\"", comma, -1, isArray, "String" );
      } else if ( objType === 'number' ) {
         jsonLabel += FormatLiteral( obj, "", comma, -1, isArray, "Number" );
      } else if ( objType === 'boolean' ) {
        jsonLabel += FormatLiteral( obj, "", comma, -1, isArray, "Boolean" );
      } else if ( objType === 'function' ) {
         if ( obj.constructor === window._regexpObj.constructor ) {
            jsonLabel += FormatLiteral( "new RegExp(" + obj + ")", "", comma, -1, isArray, "RegExp" );
         } else {
            obj = FormatFunction( 0, obj );
            jsonLabel += FormatLiteral( obj, "", comma, -1, isArray, "Function" );
         }
      } else if ( objType === 'undefined' ) {
         jsonLabel += FormatLiteral( "undefined", "", comma, -1, isArray, "Null" );
      } else {
         jsonLabel += "UNKNOWN object type: " + objType;
      }
   // console.log( jsonLabel );
      recurse--;
      
      return jsonLabel;
   }

   function RenderJsonObjectAsFormattedHtml( jsonObj, indent, addComma, isArray, isPropertyContent ) {
      var formattedHtml = "";
      var comma = (addComma) ? "<span class='Comma'>,</span> " : "";
      var objType = typeof jsonObj;
      var collapseHtml = "";
      if ( IsArray( jsonObj ) ) {
         if ( jsonObj.length === 0 ){
            formattedHtml += GetRow( indent, "<span class='ArrayBrace'>[ ]</span>" + comma, isPropertyContent );
         } else {
            collapseHtml = window.IsCollapsible ? "<span><img src=\"" + window.ImgExpanded + "\" onClick=\"ExpImgClicked(this)\" /></span><span class='collapsible'>" : "";
            formattedHtml += GetRow( indent, "<span class='ArrayBrace'>[</span>" + collapseHtml, isPropertyContent );
            for ( var i = 0; i < jsonObj.length; i++ ) {
               formattedHtml += RenderJsonObjectAsFormattedHtml( jsonObj[i], indent + 1, i < (jsonObj.length - 1), true, false );
            }
            collapseHtml = window.IsCollapsible ? "</span>" : "";
            formattedHtml += GetRow( indent, collapseHtml + "<span class='ArrayBrace'>]</span>" + comma, false );
         }
      } else if ( objType === 'object' ) {
         if ( jsonObj === null ){
            formattedHtml += FormatLiteral( "null", "", comma, indent, isArray, "Null" );
         } else if ( jsonObj.constructor === window._dateObj.constructor ) {
            formattedHtml += FormatLiteral( "new Date(" + jsonObj.getTime() + ") /*" + jsonObj.toLocaleString() + "*/", "", comma, indent, isArray, "Date" );
         } else if ( jsonObj.constructor === window._regexpObj.constructor ) {
            formattedHtml += FormatLiteral( "new RegExp(" + jsonObj + ")", "", comma, indent, isArray, "RegExp" );
         } else {
            var numProps = 0;
            var type = false;
            var content = false;
            var attributes = false;
            for ( var prop in jsonObj ) {
               if ( prop === "type" ) {
                  if ( jsonObj[prop] !== "DIV" ) {
                     numProps = 0;
                     break;
                  }
                  type = true;
               }
               else
               if ( prop === "content" ) {
                  content = true;
               }
               else
               if ( prop === "attributes" ) {
                  attributes = true;
               }
               numProps++;
            }
            if ( numProps === 0 ) {
               formattedHtml += GetRow( indent, "<span class='ObjectBrace'>{ }</span>" + comma, isPropertyContent );
            } else {
               collapseHtml = window.IsCollapsible ? "<span><img src=\"" + window.ImgExpanded + "\" onClick=\"ExpImgClicked(this)\" /></span><span class='collapsible'>" : "";
               formattedHtml += GetRow( indent, "<span class='ObjectBrace'>{</span>" + collapseHtml, isPropertyContent );
               var j = 0;
               var skip = type && content && attributes;
               var quote = window.QuoteKeys ? "\"" : "";
               if ( skip ) {
                  formattedHtml += GetRow( indent + 1, "<span class='PropertyName'>" + quote + "type" + quote + "</span>: " + RenderJsonObjectAsFormattedHtml( jsonObj["type"], indent + 1, ++j < numProps, false, true ), false );
                  formattedHtml += GetRow( indent + 1, "<span class='PropertyName'>" + quote + "attributes" + quote + "</span>: " + RenderJsonObjectAsFormattedHtml( jsonObj["attributes"], indent + 1, ++j < numProps, false, true ), false );
                  formattedHtml += GetRow( indent + 1, "<span class='PropertyName'>" + quote + "content" + quote + "</span>: " + RenderJsonObjectAsFormattedHtml( jsonObj["content"], indent + 1, ++j < numProps, false, true ), false );
               }
               for ( var prop in jsonObj ) {
                  if ( skip ) {
                     if ( prop === "type" || prop === "content" || prop === "attributes" ) {
                        continue;
                     }
                  }
                  formattedHtml += GetRow( indent + 1, "<span class='PropertyName'>" + quote + prop + quote + "</span>: " + RenderJsonObjectAsFormattedHtml( jsonObj[prop], indent + 1, ++j < numProps, false, true ), false );
               }
               collapseHtml = window.IsCollapsible ? "</span>" : "";
               formattedHtml += GetRow( indent, collapseHtml + "<span class='ObjectBrace'>}</span>" + comma, false );
            }
         }
      } else if ( objType === 'string' ) {
         formattedHtml += FormatLiteral( jsonObj.toString().split("\\").join("\\\\").split('"').join('\\"'), "\"", comma, indent, isArray, "String" );
      } else if ( objType === 'number' ) {
         formattedHtml += FormatLiteral( jsonObj, "", comma, indent, isArray, "Number" );
      } else if ( objType === 'boolean' ) {
        formattedHtml += FormatLiteral( jsonObj, "", comma, indent, isArray, "Boolean" );
      } else if ( objType === 'function' ) {
         if ( jsonObj.constructor === window._regexpObj.constructor ) {
            formattedHtml += FormatLiteral( "new RegExp(" + jsonObj + ")", "", comma, indent, isArray, "RegExp" );
         } else {
            jsonObj = FormatFunction( indent, jsonObj );
            formattedHtml += FormatLiteral( jsonObj, "", comma, indent, isArray, "Function" );
         }
      } else if ( objType === 'undefined' ) {
         formattedHtml += FormatLiteral( "undefined", "", comma, indent, isArray, "Null" );
      } else {
         formattedHtml += "UNKNOWN type: " + objType;
      }
      return formattedHtml;
   }

   function FormatLiteral( literal, quote, comma, indent, isArray, style ) {
      var str;
      if ( indent >= 0 ) {
         if ( typeof literal === 'string' ) {
            literal = literal.split("<").join("&lt;").split(">").join("&gt;");
         }
         str = "<span class='" + style + "'>" + quote + literal + quote + comma + "</span>";
         if ( isArray ) {
            str = GetRow( indent, str, false );
         }
      } else {
         str = quote + literal + quote + comma;
      }
      return str;
   }

   function trimLeadingAndTrailingWhiteSpace( text ) {  // should be equivalent to javascript trim
      return text.replace( /^\s+|\s+$/g, "" );
   }

   function trimLeadingWhiteSpace( text ) {
      return text.replace( /^\s+/, "" );
   }

   function stripTrailingWhiteSpace( text ) {
      return text.replace( /\s+$/, "" );
   }

   function isWhiteSpace( ch ) {
      return " \t\n\r\v".indexOf( ch ) >= 0;
   }
   
   function capitalize( text ) {
      return text.charAt( 0 ).toUpperCase() + text.slice( 1 ).toLowerCase();
   }

   function FormatStyle( stylelist, attr, comma ) {
      var idx = stylelist.indexOf( attr );
      var str = "";
      if ( idx >= 0 ) {
         var idxColon = stylelist.indexOf( ":", idx );
         if ( idxColon >= 0 ) {
            idxColon++;
            while ( isWhiteSpace( stylelist.charAt( idxColon ) ) ) {
               idxColon++;
            }
            str = ", \"" + capitalize( attr ) + "\"" + " : \"";
            var idxSemicolon = stylelist.indexOf( ";", idxColon );
            if ( idxSemicolon >= 0 ) {
               str += stylelist.substring( idxColon, idxSemicolon );
            } else {
               str += stylelist.substring( idxColon );
            }
            str += "\"";
         }
      }
      
      return str;
   }

   function FormatFunction( indent, obj ) {
      var tabs = "";
      for ( var k = 0; k < indent; k++ ) {
         tabs += window.TAB;
      }
      var funcStrArray = obj.toString().split( "\n" );
      var str = "";
      for ( var k = 0; k < funcStrArray.length; k++ ) {
         str += ((k === 0) ? "" : tabs) + funcStrArray[k] + "\n";
      }

      return str;
   }

   function GetRow( indent, data, isPropertyContent ) {
      var tabs = "";
      if ( indent >= 0 ) {
         for ( var k = 0; k < indent && !isPropertyContent; k++ )
            tabs += window.TAB;
         if ( data !== null && data.length > 0 && data.charAt( data.length - 1 ) !== "\n" )
            data = data + "\n";
      }
      return tabs + data;
   }

   function MakeContentVisible( element, visible ) {
      var img = element.previousSibling.firstChild;
      if ( !!img.tagName && img.tagName.toLowerCase() === "img") {
         element.style.display = visible ? 'inline' : 'none';
         element.previousSibling.firstChild.src = visible ? window.ImgExpanded : window.ImgCollapsed;
      }
   }

   function ExpImgClicked( img ) {
      var container = img.parentNode.nextSibling;
      if ( !container ) {
         return;
      }
      var disp = "none";
      var src = window.ImgCollapsed;
      if ( container.style.display === "none" ){
         disp = "inline";
         src = window.ImgExpanded;
      }

      container.style.display = disp;
      img.src = src;
   }

   function MultiplyString( num, str ) {
      var sb =[];
      for ( var i = 0; i < num; i++ ) {
         sb.push( str );
      }
      return sb.join( "" );
   }

   $("#zLLD_Load").click( function() {
      var name = $("#zLLD_Name").val();
      if ( name === "" ) {
         alert( "LLD Name is required for Load!");
         return false;
      }
      if ( updatedLLD ) {
         if ( window.confirm( "Current label has been updated.  Do you want to overwrite changes?" ) === false ) {
            return false;
         }
      }
      LoadZeidonJsonFromLLD( name );
   });

   function zeidonAttributeToKey( attribute ) {
      var ch;
      var k;
      var key = "z_";
      for ( k = 0; k < attribute.length; k++ ) {
         ch = attribute.charAt( k );
         if ( ch === ch.toLowerCase() ) {
            key += ch;
         }
         else {
            key += "^";
            key += ch.toLowerCase();
         }
      }
      return key;
   }

   function addZeidonAttributeToElement( $element, attribute, value ) {
      if (typeof value === "string" || typeof value === "number" ) {
         var key = zeidonAttributeToKey( attribute );
         console.log( "addZeidonAttributeToElement: " + $element.attr( "id" ) + "  key: " + key + "  value: " + value );
         $element.data( key, value );
      }
   }

   function AddHtmlLabelElementAttributes( $root, $parentElement, obj, entity, indent ) {
      var tag = obj["Tag"];
      if ( tag !== null ) {
         var identity = "id=\"" + tag + "\" name=\"" + tag + "\" ";
         var classes = "class=\"" + entity;
         if ( entity === "block" ) {
            if ( tag.indexOf( "Tag" ) === 0 && $.isNumeric( tag.substring( 3 ) ) ) {
               var tagNbr = parseInt( tag.substring( 3 ) );
               if ( generateTag < tagNbr ) {
                  generateTag = tagNbr;
               }
            }
            classes += " draggable canvas-element block-element";
         }
         var attr = "";
         var level = 0;
         var style = "style=\"position:absolute;";
         for ( var prop in obj ) {
            if ( typeof obj[prop] === "string" ) {
               console.log ( "Property for entity: " + entity + " prop: " + prop + ": " + obj[prop] );
               if ( prop === "Tag" ) {
                  continue;
               } else if ( prop === "Order"  ) {
                  attr += prop.toLowerCase() + "=\"" + obj[prop] + "\" ";
               } else if ( prop === "Top" || prop === "Left" || prop === "Width" || prop === "Height" ) {
                  style += prop.toLowerCase() + ":" + obj[prop] + ";";  // can't use Math.floor here because it has 'px' units
               } else {
                  if ( prop === "Level" ) {
                     level = parseInt( obj[prop] );
                  }
               }
            }
         }

      // $(tag).innerHTML = attr + style;
         if ( entity === "block" ) {
            var tab = "";
            for ( var k = 0; k < indent; k++ ) {
               tab += window.TAB;
            }

            classes += "\" ";
            style += "background-color: " + getBackgroundColorForLevel( level ) + "; display: block; float: left; color: " + getColorForLevel( level ) + "; border: 2px solid; background-position: initial initial; background-repeat: initial initial;\"";
            var div = "<div " + identity + classes + style + attr + "></div>";
            var $element = $(div).text( tag )
                 .draggable({
                    cancel: "a.ui-icon", // clicking a link with class .ui-icon won't initiate dragging
                    containment: "#" + $root.attr("id"),
                    appendTo: "body",  // this keeps the drag item visible across divs
                    cursor: "move" })
                 .resizable({ containment: "#" + $root.attr("id") })
                 .prepend( "<div style=\"float:bottom\">\n" +
                           "   <a href=\"link/to/trash/script/when/we/have/js/off\" style=\"float:right\" title=\"Remove this block\" class=\"ui-icon ui-icon-trash\">Move image to trash</a>\n" +
                           "</div>" )
                 .append( "<h5 class=\"ui-widget-header\"></h5>" );
            $parentElement.append( $element );
            for ( var prop in obj ) {
               if ( typeof obj[prop] === "string" ) {
               // if ( prop === "Tag" || prop === "Top" || prop === "Left" || prop === "Height" || prop === "Width" || prop === "Order" ) {
               //    continue;
               // } else {
                     addZeidonAttributeToElement( $element, prop, obj[prop] );
               // }
               }
            }
/*
            <div class=\"block draggable ui-widget-content ui-draggable canvas-element block-element ui-resizable\" style=\"position: absolute; top: 51px; left: 212px; width: 100px; height: 100px; background-color: rgb(204, 255, 204); display: block; float: left; color: rgb(255, 0, 0); border: 2px solid; background-position: initial initial; background-repeat: initial initial;\" id=\"Tag110\" name=\"Tag110\" level=\"1\">

            <div class=\"block draggable ui-widget-content ui-draggable canvas-element block-element ui-resizable\" style=\"position: absolute; top: 52px; left: 219px; width: 100px; height: 100px; background-color: rgb(204, 255, 204); display: block; float: left; color: rgb(255, 0, 0); border: 2px solid; background-position: initial initial; background-repeat: initial initial;\" id=\"Tag110\" name=\"Tag110\" level=\"1\">
               <div style=\"float:bottom\">
                  <a href=\"link/to/trash/script/when/we/have/js/off\" style=\"float:right\" title=\"Remove this block\" class=\"ui-icon ui-icon-trash\">Move image to trash</a>
               </div>Tag110
               <div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90; display: block;\"></div>
               <div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90; display: block;\"></div>
               <div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90; display: block;\"></div>
               <h5 class=\"ui-widget-header\"></h5>
            </div>
*/
         } else { // must be label or panel
            var $element = $("#" + tag); 
            style += "\"";
            $element.innerHTML = identity + style;
            for ( var prop in obj ) {
               if ( typeof obj[prop] === "string" ) {
               // if ( prop === "Tag" || prop === "Top" || prop === "Left" || prop === "Height" || prop === "Width" || prop === "Order" )  {
               //   continue;
               // } else {
                     addZeidonAttributeToElement( $element, prop, obj[prop] );
               // }
               }
            }
         }
      }
   }

   function AddHtmlWysiwygLabelElements( $root, $parentElement, obj, div, indent ) {
      if ( obj["Tag"] !== null ) {
         AddHtmlLabelElementAttributes( $root, $parentElement, obj, div, indent + 1 );
      // displayElementData( "AddHtmlWysiwygLabelElements", $parentElement );
         $parentElement = $("#" + obj["Tag"]);
      }

      for ( var prop in obj ) {
         if ( prop === ".meta" ) {
            // do nothing
         }
         else
         if ( prop === "Block" || prop === "BlockBlock") {
            var objBlock = obj[prop];
            for ( var k = 0; k < objBlock.length; k++ ) {
               AddHtmlWysiwygLabelElements( $root, $parentElement, objBlock[k], "block", indent + 1 );
            }
         }
      }
   }

   function RenderWysiwygLabelFromZeidonJson( jsonObj, indent, isArray, isPropertyContent ) {
      if ( IsArray( jsonObj ) ) {
         if ( jsonObj.length !== 1 ){
            throw new Error( "The JSON object is not a valid Zeidon Label Definition" );
         } else {
            var obj = jsonObj[0];
            var objOimeta = obj[".oimeta"];
            if ( objOimeta["odName"] !== "mLLD" ) {
               throw new Error( "The JSON meta object type is invalid:" + objOimeta['odName'] );
            }

            if ( objOimeta["application"] !== null ) {
               application = objOimeta["application"];
            }

            if ( objOimeta["fileName"] !== null ) {
               fileName = objOimeta["fileName"];
               $("#zLLD_Name").val( fileName );
            }

            var objLLD = obj["LLD"][0];
            if ( objLLD === null ) {
               throw new Error( "The JSON object does not contain an LLD property: " + obj );          
            }

            for ( var prop in objLLD ) {
               if ( prop === ".meta" ) {
                  // do nothing
               }
               else
               if ( prop === "Name" ) {
                  $("#label").innerText = objLLD["Name"];
                  AddHtmlLabelElementAttributes( null, $("#label"), objLLD, "label", indent );
               }
               else
               if ( prop === "Panel" ) {
                  var objPanel = objLLD["Panel"];
                  var $parentElement = $("#label"); 
                  for ( var k = 0; k < objPanel.length; k++ ) {
                     AddHtmlWysiwygLabelElements( $("#" + objPanel[k]["Tag"]), $parentElement, objPanel[k], "panel", indent + 1 );
                  }
               }
            }
         }
      } else {
         throw new Error( "The JSON does not contain a valid Zeidon Label Definition: " + jsonObj );
      }
   }

   // Additional parameters:
   //   data - contains the resulting data from the request
   //   status - contains the status of the request ("success", "notmodified", "error", "timeout", or "parsererror")
   //   xhr - contains the XMLHttpRequest object
   function LoadZeidonJsonFromLLD_Callback( jsonZeidon, status, xhr ) {
      if ( xhr.readyState === 4 ) {
         if ( xhr.status === 200 ) {
         // parseMessages( req.responseXML );
            console.log( "JSON Zeidon: " + jsonZeidon );
            try {
               generateTag = 100;
               $("#panel").attr( "id", "panel" + currentPanel )
                           .attr( "name", "panel" + currentPanel )
                           .removeClass( "panel_active" )
                           .addClass( "panel_hidden" )
                           .hide();

            // $(".panel").empty(); does too much
            // $('#zmasterdiv').empty();  clears the master div.
            // $('#zmasterdiv div').empty(); clears all the child divs, but leaves the master intact.
            /*
               $(".panel").each( function() {
                  while ( $(this).firstChild ) {
                     $(this).removeChild( $(this).firstChild );
                  }
               });
            */
               $("#label div").empty();
               $("#label").removeData();
               $(".panel").each( function( idx ) {
                  $(this).hide()
                         .removeData()
                         .css( 'background-color', 'lightyellow' )
                         .addClass( " ui-droppable panel_hidden" )
                         .text( idx + 1 );
               });

               // clear all zeidon mapping
               $("input.zeidon, select.zeidon").each( function() {
               // console.log( "Clearing element: " + $(this).attr( "id" ) );
               // if ( $(this).attr( "id" ) === "CSS_File" ) {
               //    console.log( "Clearing CSS_File element: " + $(this).attr( "id" ) );
               // }
                  if ( $(this).hasClass( "colorwell" ) ) {
                     var colorPicker = $.farbtastic( "#" + $(this).attr( "id" ) );
                     colorPicker.setColor( "#ffffff" );
                     $(this).val( "#ffffff" );
                  } else {
                     $(this).val( "" );
                  }
               });

            // var jsonObj = eval( "[" + data + "]" );
               var jsonObj = jQuery.parseJSON( "[" + jsonZeidon + "]" );  // this is faster and more secure than eval

               // Display the JSON coming back (to the client) from Zeidon (server).
               var formattedHtml = RenderJsonObjectAsFormattedHtml( jsonObj[0], 0, false, false, false );
            // $id("FormattedJsonLabel").innerHTML = "<PRE class='CodeContainer'>" + formattedHtml + "</PRE>";

               // Now actually display the LLD in the designer.
               RenderWysiwygLabelFromZeidonJson( jsonObj, 1, false, false );

            } catch(e) {
               $id("FormattedJsonLabel").innerHTML = jsonZeidon;
               alert( "JSON is not well formatted:\n" + e.message );
            } finally {
               updatedLLD = false;
               currentPanel = 1;
               $current_block = null;
               $("#panel" + currentPanel).attr( "id", "panel" )
                                          .attr( "name", "panel" )
                                          .removeClass( "panel_hidden" )
                                          .addClass( "panel_active" )
                                          .show();
               mapElementDataToUiData( $("#label") );
               mapElementDataToUiData( $("#panel") );

               $(".block").each( function() {
                  setBlockDraggableResizable( $(this).parent(), $(this), $(this) );
               });
            }
         }
      }
   }

/*
   function LoadZeidonJsonFromLLD( name ) {
      try {
         var url = "labeldesigner?action=loadLabel&fileName=" + escape( name );
         req = initRequest();
         req.open( "POST", url, true );
         req.onreadystatechange = LoadZeidonJsonFromLLD_Callback;
         req.send( null );
      } catch(e) {
         alert( "Could not load file: " + name + "\n" + e.message );
      } finally {
         $("#panel" + currentPanel).attr( "id", "panel" );
      }
   }
*/
   function LoadZeidonJsonFromLLD( name ) {
      try {
         // Assign handlers immediately after making the request and remember the jqxhr object for this request
         // Retrieve the JSON version of the label from Zeidon (on the server) in a saved LLD.
         var url = "labeldesigner?action=loadLabel&fileName=" + escape( name );
         var jqxhr = $.post( url,
                             LoadZeidonJsonFromLLD_Callback ) // the function to run if the request succeeds
            .done(function() {
               console.log( "Load Zeidon From LLD: second success" );
            })
            .fail(function() {
               alert( "error " + jqxhr.toString() );
            })
            .always(function() {
               console.log( "Load Zeidon From LLD: always finished" );
         });

         // Perform other work here ...

         // Set another completion function for the request above
         jqxhr.always(function() {
            console.log( "Load Zeidon From LLD: second always finished" );
         });

      } catch(e) {
         alert( "Could not load file: " + name + "\n" + e.message );
      } finally {
         $("#panel" + currentPanel).attr( "id", "panel" );
         $current_block = null;

         // TODO: display the label/panel/block properties
      }
   }

});
});

   // metacharacters are: <([{\^-=$!|]})?*+.>
   // ^[a-zA-Z]*[a-zA-Z0-9].\D[a-zA-Z0-9].\D[a-zA-Z0-9]
// function VEA( s ) { return 

   function $id(id){ return document.getElementById( id ); }

   function TraverseChildren( element, func, depth ) {
      for( var i = 0; i < element.childNodes.length; i++ ) {
         TraverseChildren( element.childNodes[i], func, depth + 1 );
      }
      func( element, depth );
   }

   function SelectAllClicked() {
      if ( !!document.selection && !!document.selection.empty ) {
         document.selection.empty();
      } else if ( window.getSelection ) {
         var sel = window.getSelection();
         if ( sel.removeAllRanges ) {
            window.getSelection().removeAllRanges();
         }
      }

      var range = (!!document.body && !!document.body.createTextRange) ? document.body.createTextRange() : document.createRange();

      if ( !!range.selectNode )
         range.selectNode( $id("FormattedJsonLabel") );
      else if ( range.moveToElementText )
         range.moveToElementText( $id("FormattedJsonLabel") );

      if ( !!range.select)
         range.select( $id("FormattedJsonLabel") );
      else
         window.getSelection().addRange( range );
   }



</script>

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
       <li id="lmTemplate" name="lmTemplate"><a href="#" onclick="mTemplate()">Template</a></li>
   </ul>
</div>  <!-- end Navigation Bar -->

<%@include file="./include/topmenuend.inc" %>
<div id="maincontent">

<div id="leftcontent">

<!-- Side Navigation *********************** -->
<div id="sidenavigation">
   <ul>
<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smNewLLD( )">New</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "OpenLLD" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smOpenLLD( )">Open</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SaveLLD" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smSaveLLD( )">Save</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "ExitLLD" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smExitLLD( )">Exit</a></li>
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

<div id="zcontainer" name="zcontainer" style="width:12in; height:9in;">
   <div id="zviewport" name="zviewport" style="background-color:#00A5FF; height:0.4in;">
      <h1 style="text-align:center; line-height:0.25in;"><span>Label DesignerXY
         <img src="./images/HA.jpg" width="30" height="25" alt="HA" style="margin:5px; float:right; border-style:double;"></span>
      </h1>
      <div id="zclient" name="zclient" style="margin:0"> <!-- client area -->
         <div id="panelmenu" name="panelmenu" class="ui-widget-content" style="position:relative;margin:0">
         <div id="label" name="label" class="label" style="top:0px;left:0px;width:8.5in;height:9in;float:left;position:absolute;">Drop area ...  <!-- without position:relative, target position is off -->
            <div id="panel"  name="panel" class="panel" style="display:block;background-color:lightyellow;top:0px;left:0px;width:8.5in;height:9in;float:left;position:absolute;text-align:left">1</div> <!-- panel -->
            <div id="panel2" name="panel2" class="panel" style="display:none;background-color:lightyellow;top:0px;left:0px;width:8.5in;height:9in;float:left;position:absolute;text-align:left">2</div> <!-- panel -->
            <div id="panel3" name="panel3" class="panel" style="display:none;background-color:lightyellow;top:0px;left:0px;width:8.5in;height:9in;float:left;position:absolute;text-align:left">3</div> <!-- panel -->
            <div id="panel4" name="panel4" class="panel" style="display:none;background-color:lightyellow;top:0px;left:0px;width:8.5in;height:9in;float:left;position:absolute;text-align:left">4</div> <!-- panel -->
            <div id="panel5" name="panel5" class="panel" style="display:none;background-color:lightyellow;top:0px;left:0px;width:8.5in;height:9in;float:left;position:absolute;text-align:left">5</div> <!-- panel -->
            <div id="panel6" name="panel6" class="panel" style="display:none;background-color:lightyellow;top:0px;left:0px;width:8.5in;height:9in;float:left;position:absolute;text-align:left">6</div> <!-- panel -->
            <div id="panel7" name="panel7" class="panel" style="display:none;background-color:lightyellow;top:0px;left:0px;width:8.5in;height:9in;float:left;position:absolute;text-align:left">7</div> <!-- panel -->
            <div id="panel8" name="panel8" class="panel" style="display:none;background-color:lightyellow;top:0px;left:0px;width:8.5in;height:9in;float:left;position:absolute;text-align:left">8</div> <!-- panel -->
            <div id="panel9" name="panel9" class="panel" style="display:none;background-color:lightyellow;top:0px;left:0px;width:8.5in;height:9in;float:left;position:absolute;text-align:left">9</div> <!-- panel -->
         </div> <!-- label -->
         <div id="zmenu" name="zmenu" style="background-color:#00D7FF;top:0px;left:8.5in;width:3.5in;height:9in;float:right;position:absolute;">   <!-- without position:relative, clone position is off -->
            <div id="zaccordion" name="zaccordion" style="margin-left:0;padding-left:0">
               <h3>Block Types</h3>
               <div id="zpool" name="zpool">
                  <div style="position:relative;">  <!-- without position:relative, initial position is off -->
                  <!-- <div id="zdrag1" name="zdrag1" class="draggable resizable ui-widget ui-widget-content" style="background-color:#FF0000;position:absolute;top:5px;left:5px;width:60px;height:70px;">
                        <p>Drag me to trigger the chain of events.</p></div> -->
                     <div id="z__drag2" name="z__drag2" class="draggable ui-widget-content" style="position:absolute;top:5px;left:5px;width:20px;height:20px;background:blue;display:block;float:left;color:red;border:2px solid;"></div>
                  </div>
               </div> <!-- zpool -->

               <h3>Block Properties</h3>
               <div>
                  <div style="overflow:hidden; white-space:nowrap;">
                    <label for="zBlockTag">Tag:</label>
                    <input id="zBlockTag" name="zBlockTag" class="zeidon" data-zmap="block.z_^tag" style="float:right" />
                  </div>

                  <div style="overflow:hidden; white-space:nowrap;">
                    <label for="zBlockVEA">View.Entity.Attribute:</label>
                    <input id="zBlockVEA" name="zBlockVEA" class="zeidon" data-zmap="block.z_^v^e^a" style="float:right" />
                  </div>

                  <div id="zBlockUnits">
                     <input type="radio" id="zBlockInches" name="radio" checked="checked" /><label for="zBlockInches">in</label>
                     <input type="radio" id="zBlockCentimeters" name="radio" /><label for="zBlockCentimeters">cm</label>
                     <input type="radio" id="zBlockMillimeters" name="radio" /><label for="zBlockMillimeters">mm</label>
                     <input type="radio" id="zBlockPixels" name="radio" /><label for="zBlockPixels">px</label>
                     <input type="radio" id="zBlockPercent" name="radio" /><label for="zBlockPercent">%</label>
                  </div>
 
                  <!-- 
                  <div id="jQueryRequired" name="jQueryRequired" style="color: red; font-size: 1.4em">jQuery.js is not present. You must install jQuery in this folder for the demo to work.</div>
                  <div class="form-item">
                     <label for="zColor">Color:</label>
                     <input type="text" id="zColor" name="zColor" value="#123456" />
                  </div>
                  <div id="zPickerBlock" name="zPickerBlock"></div>
                  -->

                  <div style="overflow:hidden; white-space:nowrap;">
                    <label for="zSectionType">Section Type:</label>
                    <input id="zSectionType" name="zSectionType" class="zeidon" data-zmap="block.z_^l^l^d_^section^type" style="float:right" />
                  </div>
                  <div style="overflow:hidden; white-space:nowrap;">
                    <label for="zBlockTitle">Block Title:</label>
                    <input id="zBlockTitle" name="zBlockTitle" class="zeidon" data-zmap="block.z_^block^title" style="float:right" />
                  </div>
                  <div style="overflow:hidden; white-space:nowrap;">
                    <label for="zBlockTop">Block Top:</label>
                    <input id="zBlockTop" name="zBlockTop" class="zeidon" data-zmap="block.z_^top" style="float:right" />
                  </div>
                  <div style="overflow:hidden; white-space:nowrap;">
                    <label for="zBlockLeft">Block Left:</label>
                    <input id="zBlockLeft" name="zBlockLeft" class="zeidon" data-zmap="block.z_^left" style="float:right" />
                  </div>
                  <div style="overflow:hidden; white-space:nowrap;">
                    <label for="zBlockHeight">Block Height:</label>
                    <input id="zBlockHeight" name="zBlockHeight" class="zeidon" data-zmap="block.z_^height" style="float:right" />
                  </div>
                  <div style="overflow:hidden; white-space:nowrap;">
                    <label for="zBlockWidth">Block Width:</label>
                    <input id="zBlockWidth" name="zBlockWidth" class="zeidon" data-zmap="block.z_^width" style="float:right" />
                  </div>

                  <div class="ui-widget">
                    <label>Text Align: </label>
                    <select id="zBlockTextAlign" name="zBlockTextAlign" class="zeidon" data-zmap="block.z_^text^align" style="float:right">
                      <option value="">Text Alignment...</option>
                      <option value="left">Left</option>
                      <option value="right">Right</option>
                      <option value="center">Center</option>
                    </select>
                  </div>

                  <p style="clear:both;position:relative"></p>
                  <div style="overflow:hidden; white-space:nowrap;">
             <!-- <form action="" style="width: 240px;"> -->
                    <div>
                       <label for="zBlockTextColor">Text Color:</label>
                       <input type="text" id="zBlockTextColor" name="zBlockTextColor" class="colorwell colorwell1 zeidon" data-zmap="block.z_^text^color" value="#ff0000" style="float:right" />
                    </div>
                    <p style="clear:both;position:relative"></p>
                    <div>
                       <label for="zBlockBackgroundColor">Background:</label>
                       <input type="text" id="zBlockBackgroundColor" name="zBlockBackgroundColor" class="colorwell colorwell1 zeidon" data-zmap="block.z_^background^color" value="#00ff00" style="float:right" />
                    </div>
                    <p style="clear:both;position:relative"></p>
                    <div>
                       <label for="zBlockBorderColor">Border:</label>
                       <input type="text" id="zBlockBorderColor" name="zBlockBorderColor" class="colorwell colorwell1 zeidon" data-zmap="block.z_^border^color" value="#0000ff" style="float:right" />
                    </div>
                    <p style="clear:both"></p>
                    <div id="zBlockPicker" name="zBlockPicker"></div>
             <!-- </form> -->
                  </div>

                  <div id="zmbp">
                     <ul>
                        <li><a href="#zMargins">Margins</a></li>
                        <li><a href="#zBorders">Borders</a></li>
                        <li><a href="#zPaddings">Padding</a></li>
                     </ul>
                     <div id="zMargins" name="zMargins">
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zMargin">Margins:</label>
                          <input id="zMargin" name="zMargin" class="zeidon" data-zmap="block.z_^margin" style="float:right" />
                        </div>
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zMarginTop">Top:</label>
                          <input id="zMarginTop" name="zMarginTop" class="zeidon" data-zmap="block.z_^margin^top" style="float:right" />
                        </div>
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zMarginBottom">Bottom:</label>
                          <input id="zMarginBottom" name="zMarginBottom" class="zeidon" data-zmap="block.z_^margin^bottom" style="float:right" />
                        </div>
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zMarginLeft">Left:</label>
                          <input id="zMarginLeft" name="zMarginLeft" class="zeidon" data-zmap="block.z_^margin^left" style="float:right" />
                        </div>
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zMarginRight">Right:</label>
                          <input id="zMarginRight" name="zMarginRight" class="zeidon" data-zmap="block.z_^margin^right" style="float:right" />
                        </div>
                     </div>
                     <div id="zBorders" name="zBorders">
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zBorder">Borders:</label>
                          <input id="zBorder" name="zBorder" class="zeidon" data-zmap="block.z_^border" style="float:right" />
                        </div>
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zBorderTop">Top:</label>
                          <input id="zBorderTop" name="zBorderTop" class="zeidon" data-zmap="block.z_^border^top" style="float:right" />
                        </div>
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zBorderBottom">Bottom:</label>
                          <input id="zBorderBottom" name="zBorderBottom" class="zeidon" data-zmap="block.z_^border^bottom" style="float:right" />
                        </div>
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zBorderLeft">Left:</label>
                          <input id="zBorderLeft" name="zBorderLeft" class="zeidon" data-zmap="block.z_^border^left" style="float:right" />
                        </div>
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zBorderRight">Right:</label>
                          <input id="zBorderRight" name="zBorderRight" class="zeidon" data-zmap="block.z_^border^right" style="float:right" />
                        </div>
                     </div>
                     <div id="zPaddings" name="zPaddings">
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zPadding">Padding:</label>
                          <input id="zPadding" name="zPadding" class="zeidon" data-zmap="block.z_^padding" style="float:right" />
                        </div>
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zPaddingTop">Top:</label>
                          <input id="zPaddingTop" name="zPaddingTop" class="zeidon" data-zmap="block.z_^padding^top" style="float:right" />
                        </div>
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zPaddingBottom">Bottom:</label>
                          <input id="zPaddingBottom" name="zPaddingBottom" class="zeidon" data-zmap="block.z_^padding^bottom" style="float:right" />
                        </div>
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zPaddingLeft">Left:</label>
                          <input id="zPaddingLeft" name="zPaddingLeft" class="zeidon" data-zmap="block.z_^padding^left" style="float:right" />
                        </div>
                        <div style="overflow:hidden; white-space:nowrap;">
                          <label for="zPaddingRight">Right:</label>
                          <input id="zPaddingRight" name="zPaddingRight" class="zeidon" data-zmap="block.z_^padding^right" style="float:right" />
                        </div>
                     </div>
                   </div>
                   <p style="clear:both;position:relative"></p>
                   <input type="checkbox" id="zCheckContinuationBlock" /><label for="zCheckContinuationBlock">Continuation Block</label>
               </div>

               <h3>Panel Properties</h3>
               <div>
                  <p style="clear:both;position:relative">
                     <span>
                        <label for="zPanelName">Panel Name:</label>
                        <input id="zPanelName" name="zPanelName" class="zeidon" data-zmap="panel.z_^tag" value="" style="width:120px;float:right;" />
                     </span>
                  </p>
                  <p style="clear:both;position:relative">
                     <span>
                        <label for="zPanelVEA">View.Entity.Attribute:</label>
                        <input id="zPanelVEA" name="zPanelVEA" class="zeidon" data-zmap="panel.z_^v^e^a" style="width:120px;float:right" />
                     </span>
                  </p>
                  <p style="clear:both;position:relative">
                     <span>
                        <label for="zPanelSpinner">Panel:</label>
                        <input id="zPanelSpinner" name="zPanelSpinner" value="1" style="width:20px;"/>
                     </span>
                  </p>
                  <p style="clear:both;position:relative">
                     <span>
                        <label for="zPanelHeight">Panel Height:</label>
                        <input id="zPanelHeight" name="zPanelHeight" class="zeidon" data-zmap="panel.z_^height" value="11" style="width:20px;float:right;"/>
                     </span>
                  </p>
                  <p style="clear:both;position:relative">
                     <span>
                        <label for="zPanelWidth">Panel Width:</label>
                        <input id="zPanelWidth" name="zPanelWidth" class="zeidon" data-zmap="panel.z_^width" value="8.5" style="width:20px;float:right;"/>
                     </span>
                  </p>
                  <p style="clear:both;position:relative"></p>
                  <div id="zPanelUnits">
                     <label for="zPanelInches">in</label>
                     <input type="radio" id="zPanelInches" name="radio" class="zeidon" checked="checked" />
                     <label for="zPanelCentimeters">cm</label>
                     <input type="radio" id="zPanelCentimeters" name="radio" class="zeidon" />
                  </div>
               </div>

               <h3>LLD Properties</h3>
               <div>
                  <p>
                     <label for="zLLD_Name">LLD Name:</label>
                     <span>
                        <button id="zLLD_Save" name="zLLD_Save" style="float: right;">Save</button>
                        <button id="zLLD_Load" name="zLLD_Load" style="float: right;">Load</button>
                        <input id="zLLD_Name" name="zLLD_Name" data-zmap="label.z_^name" type="text" value="" style="float:right;width:92px;"/>
                     </span>
                  </p>
                  <p style="clear:both;position:relative"></p>
                  <p>
                  <div style="overflow:hidden; white-space:nowrap;">
                    <label for="zLabelVEA">View.Entity.Attribute:</label>
                    <input id="zLabelVEA" name="zLabelVEA" class="zeidon" data-zmap="label.z_^v^e^a" style="float:right;width:140px;" />
                  </div>
                     <span>
                        <label for="zCSS_File">CSS File:</label>
                        <input id="zCSS_File" name="zCSS_File" class="zeidon" data-zmap="label.z_^c^s^s_^file^name" value="" style="float:right;width:180px;"/>
                     </span>
                  </p>
                  <p style="clear:both;position:relative"></p>
                  <div class="ui-widget" style="overflow:hidden; white-space:nowrap;">
                     <label for="zHazardPanel">Hazard Panel:</label>
                     <select id="zHazardPanel" name="zHazardPanel" class="zeidon" data-zmap="label.z_^hazard^panel" style="float:right;width:180px;">
                       <option value="">Select one...</option>
                       <option value="0">None</option>
                       <option value="1">Location 1</option>
                       <option value="2">Location 2</option>
                       <option value="3">Location 3</option>
                       <option value="4">Location 4</option>
                       <option value="5">Location 5</option>
                     </select>
                  </div>
                  <p style="clear:both;position:relative"></p>
                  <p>
                     <label>Continuation Text:</label><br />
                     <input id="zContinuationPreviousPage" name="zContinuationPreviousPage" class="zeidon" data-zmap="label.z_^continuation^text^previous^page" placeholder="Previous Page" style="width:246px;"/><br />
                     <input id="zContinuationNextPage" name="zContinuationNextPage" class="zeidon" data-zmap="label.z_^continuation^text^next^page" placeholder="Next Page" style="width:246px;"/><br />
                  </p>
                  <p style="clear:both;position:relative"></p>
                  <div style="overflow:hidden; white-space:nowrap;">
             <!-- <form action="" style="width: 240px;"> -->
                    <div>
                       <label for="zLabelBackgroundColor">Background:</label>
                       <input type="text" id="zLabelBackgroundColor" name="zLabelBackgroundColor" class="colorwell colorwell2 zeidon" data-zmap="label.z_^background^color"  value="#ffffed" style="float:right" />
                    </div>
                    <p style="clear:both"></p>
                    <div id="zLabelPicker" name="zLabelPicker"></div>
             <!-- </form> -->
                  </div>

               </div>

               <h3>Trash</h3>
               <div id="ztrash" name="ztrash" style="position:relative;">
               </div>

            </div> <!-- zaccordian -->
         </div> <!-- zmenu -->
      </div> <!-- panelmenu -->
      </div> <!-- zclient -->
   </div> <!-- zviewport -->
   <div id="zfooter" name="zfooter" style="position:absolute;top:9.5in;width:12in;height:0.25in;background-color:#00A5FF;clear:both;text-align:left;">Copyright &copy; Arksoft, Inc.
      <span id="zdisplay_size" name="zdisplay_size" style="float:right;padding-right:10px;"></span>
      <span id="zdisplay_position" name="zdisplay_position" style="float:right;padding-right:10px;"></span>
   </div>
</div> <!-- zcontainer -->
<form name="wStartUpLLD" id="wStartUpLLD" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lPrimReg = null;
   View lSubreg = null;
   View mCurrentUser = null;
   View mMasLC = null;
   View mPerson = null;
   View mPrimReg = null;
   View mSubreg = null;
   View mUser = null;
   View qOrganiz = null;
   View qOrganizLogin = null;
   View qPrimReg = null;
   View qSubreg = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wStartUp", "LLD" );
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
   <input name="zTimeout" id="zTimeout" type="hidden" value="2000">
   <input name="zSolicitSave" id="zSolicitSave" type="hidden" value="<%=strSolicitSave%>">

   <div name="ShowVMLError" id="ShowVMLError" class="ShowVMLError">
      <%=strVMLError%>
   </div>


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
   session.setAttribute( "ZeidonWindow", "wStartUpLLD" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
