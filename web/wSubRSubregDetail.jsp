<!DOCTYPE HTML>

<%-- wSubRSubregDetail --%>

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

   View mSubreg = null;
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

   mSubreg = task.getViewByName( "mSubreg" );
   if ( VmlOperation.isValid( mSubreg ) )
   {
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

if ( strLastWindow.equals("wSubRSubregDetail") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wSubR_Dialog wSubR = new wSubR_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wSubRSubregDetail strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSubRSubregDetail LastWindow *** " + strLastWindow );
task.log().info("*** wSubRSubregDetail LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ChangeSubregPass" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartModalSubwindow, "wSubR", "ChangeSubregPassword" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ListSubregProducts" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartModalSubwindow, "wSubR", "SubregProducts" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ListSubregUsers" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartModalSubwindow, "wSubR", "SubregUsers" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ReturnToLogin" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_ReturnToParent, "wStartUp", "UserLogin" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "UpdateSubregistrant" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartModalSubwindow, "wSubR", "UpdateSubregistrant" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smUpdateSubregistrant" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartModalSubwindow, "wSubR", "UpdateSubregistrant" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smListSubregUsers" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartModalSubwindow, "wSubR", "SubregUsers" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smListSubregProducts" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartModalSubwindow, "wSubR", "SubregProducts" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smChangeSubregPass" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartModalSubwindow, "wSubR", "ChangeSubregPassword" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smReturnToLogin" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_ReturnToParent, "wStartUp", "UserLogin" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mProductManagement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRSubregDetail.jsp", "wStartUp.ProductManagement" );
         nOptRC = wStartUp.ProductManagement( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartTopWindow, "wSPLD", "SubregProductsList" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mSubregistrants" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRSubregDetail.jsp", "wStartUp.SubregistrantManagement" );
         nOptRC = wStartUp.SubregistrantManagement( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartTopWindow, "wStartUp", "AdminListSubregistrants" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mTrackingNotificationCompliance" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRSubregDetail.jsp", "wStartUp.TrackingNotificationCompliance" );
         nOptRC = wStartUp.TrackingNotificationCompliance( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartTopWindow, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mStateRegistrations" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRSubregDetail.jsp", "wStartUp.StateRegistrations" );
         nOptRC = wStartUp.StateRegistrations( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartTopWindow, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mMarketingFulfillment" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRSubregDetail.jsp", "wStartUp.MarketingFulfillment" );
         nOptRC = wStartUp.MarketingFulfillment( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartTopWindow, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mWebDevelopment" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRSubregDetail.jsp", "wStartUp.WebDevelopment" );
         nOptRC = wStartUp.WebDevelopment( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartTopWindow, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mAdministration" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRSubregDetail.jsp", "wStartUp.PrimaryRegistrantCompanySetup" );
         nOptRC = wStartUp.PrimaryRegistrantCompanySetup( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartTopWindow, "wStartUp", "AdminUpdatePrimaryRegistrant" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mLogin" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRSubregDetail.jsp", "wStartUp.ProcessLogin" );
         nOptRC = wStartUp.ProcessLogin( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_ResetTopWindow, "wStartUp", "UserLogin" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wSubRSubregDetail" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wSubRSubregDetail" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRSubregDetail", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSubRSubregDetail.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSubRSubregDetail.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSubRSubregDetail.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSubRSubregDetail.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRSubregDetail.jsp", "wSubR.InitSubregDetail" );
         nOptRC = wSubR.InitSubregDetail( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getAttribute( "WebReturnMessage" ).getString( "" );
      strURLParameters = "?CallingPage=wSubRSubregDetail.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wSubR" +
                         "&OperationName=" + "InitSubregDetail";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSubR", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wSubR", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "SubregDetail", "" );
   }

%>

<html>
<head>

<title>Subregistrant Detail</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" >
      // Javascript code entered by user for Window action prebuild.

   // We knock out Login and Template as options.
   thisLi = document.getElementById( "lmLogin" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmTemplate" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   if ( keyRole == "S" )
   {
      thisLi = document.getElementById( "lmSubregistrants" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
      thisLi = document.getElementById( "lmTrackingNotificationCompliance" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
   }
   else
   {
      thisLi = document.getElementById( "lmStateRegistrations" );
      thisLi.style.visibility = "hidden";
      thisLi.style.display = "none";
   }

      // END of Javascript code entered by user.

</script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSubRSubregDetail.js"></script>

</head>

<body onLoad="_AfterPageLoaded( )" onSubmit="_DisableFormElements( true )" onBeforeUnload="_BeforePageUnload( )">

<%@ include file="./include/pagebackground.inc" %>  <!-- just temporary until we get the painter dialog updates from Kelly ... 2011.10.08 dks -->

<div id="wrapper">

<jsp:include page='<%=strBannerName %>' />

<!-- Main Navigation *********************** -->
<div id="mainnavigation">
   <ul id="TopMenu" name="TopMenu" >
       <li id="lmProductManagement" name="lmProductManagement" ><a href="#" onclick="mProductManagement()">Products</a></li>
       <li id="lmSubregistrants" name="lmSubregistrants" ><a href="#" onclick="mSubregistrants()">Subregistrants</a></li>
       <li id="lmTrackingNotificationCompliance" name="lmTrackingNotificationCompliance" ><a href="#" onclick="mTrackingNotificationCompliance()">Tracking/Notification/Compliance</a></li>
       <li id="lmStateRegistrations" name="lmStateRegistrations" ><a href="#" onclick="mStateRegistrations()">State Registrations</a></li>
       <li id="lmMarketingFulfillment" name="lmMarketingFulfillment" ><a href="#" onclick="mMarketingFulfillment()">Marketing/Fulfillment</a></li>
       <li id="lmWebDevelopment" name="lmWebDevelopment" ><a href="#" onclick="mWebDevelopment()">Web Development</a></li>
       <li id="lmCompanyProfile" name="lmCompanyProfile" ><a href="#" onclick="mAdministration()">Company Profile</a></li>
       <li id="lmLogin" name="lmLogin" ><a href="#" onclick="mLogin()">Login</a></li>
       <li id="lmLogout" name="lmLogout" ><a href="#" onclick="mLogout()">Logout</a></li>
   </ul>
</div>  <!-- end Navigation Bar -->

<%@include file="./include/topmenuend.inc" %>
<div id="maincontent">

<div id="leftcontent">

<!-- Side Navigation *********************** -->
<div id="sidenavigation">
   <ul id="Subregistrant" name="Subregistrant">
<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Update" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smUpdate" name="smUpdate"><a href="#"  onclick="smUpdateSubregistrant()">Update</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "ListSubregUsers" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smListSubregUsers" name="smListSubregUsers"><a href="#"  onclick="smListSubregUsers()">Users</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "ListSubregProducts" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smListSubregProducts" name="smListSubregProducts"><a href="#"  onclick="smListSubregProducts()">Products</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "ChangePassword" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smChangePassword" name="smChangePassword"><a href="#"  onclick="smChangeSubregPass()">Change Password</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Return" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smReturn" name="smReturn"><a href="#"  onclick="smReturnToLogin()">Return</a></li>
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


<form name="wSubRSubregDetail" id="wSubRSubregDetail" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View lPrimReg = null;
   View lSubreg = null;
   View mCurrentUser = null;
   View mPerson = null;
   View mPrimReg = null;
   View mSubLC = null;
   View mSubreg = null;
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

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getAttribute( "SolicitSaveFlag" ).getString( "" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSubR", "SubregDetail" );
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
<% /* BreadCrumb: */ %>
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* Subregistrant:GroupBox */ %>

<div id="Subregistrant" name="Subregistrant" style="width:506px;height:628px;float:left;">  <!-- Subregistrant --> 

<div  id="Subregistrant" name="Subregistrant" >Subregistrant</div>

 <!-- This is added as a line spacer -->
<div style="height:24px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp</span>
<% /* Name::Text */ %>

<span  id="Name:" name="Name:" style="width:140px;height:16px;">Name:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* EBName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBName", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBName" );
      else
      {
         nRC = mSubreg.cursor( "SubregOrganization" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "SubregOrganization" ).getAttribute( "Name" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBName: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SubregOrganization.Name: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBName: " + "mSubreg.SubregOrganization" );
      }
   }
%>

<input name="EBName" id="EBName"  disabled style="width:318px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp</span>
<% /* ExperienceLevel::Text */ %>

<span  id="ExperienceLevel:" name="ExperienceLevel:" style="width:140px;height:16px;">Experience Level:</span>

<span style="height:84px;">&nbsp&nbsp</span>
<% /* ExperienceLevel:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ExperienceLevel" id="ExperienceLevel" size="1" style="width:318px;"  disabled onchange="ExperienceLevelOnChange( )">

<%
   boolean inListExperienceLevel = false;

   wWebXfer = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXfer ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( wWebXfer , "Root", "UserStatus", "" );

      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = wWebXfer.cursor( "Root" ).getAttribute( "UserStatus" ).getString( "" );
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
         inListExperienceLevel = true;
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
               inListExperienceLevel = true;
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
      if ( !inListExperienceLevel )
      { 
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }  
   }  // if view != null
%>
</select>

<input name="hExperienceLevel" id="hExperienceLevel" type="hidden" value="<%=strComboCurrentValue%>" >
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* PhysicalAddress:GroupBox */ %>

<div id="PhysicalAddress" name="PhysicalAddress" style="width:482px;height:162px;float:left;">  <!-- PhysicalAddress --> 

<div  id="PhysicalAddress" name="PhysicalAddress" >Address</div>

 <!-- This is added as a line spacer -->
<div style="height:24px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* PStreet::Text */ %>

<span  id="PStreet:" name="PStreet:" style="width:140px;height:16px;">Street:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* EBPStreetAddress:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBPStreetAddress", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBPStreetAddress" );
      else
      {
         nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "PhysicalAddress" ).getAttribute( "Address" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPStreetAddress: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBPStreetAddress", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "PhysicalAddress.Address: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBPStreetAddress: " + "mSubreg.PhysicalAddress" );
      }
   }
%>

<input name="EBPStreetAddress" id="EBPStreetAddress"  disabled style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* EBPAddress2:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBPAddress2", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBPAddress2" );
      else
      {
         nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "PhysicalAddress" ).getAttribute( "AddressLine2" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPAddress2: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBPAddress2", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "PhysicalAddress.AddressLine2: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBPAddress2: " + "mSubreg.PhysicalAddress" );
      }
   }
%>

<input name="EBPAddress2" id="EBPAddress2"  disabled style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* PCity::Text */ %>

<span  id="PCity:" name="PCity:" style="width:140px;height:16px;">City:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* EBPCity:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBPCity", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBPCity" );
      else
      {
         nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "PhysicalAddress" ).getAttribute( "City" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPCity: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBPCity", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "PhysicalAddress.City: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBPCity: " + "mSubreg.PhysicalAddress" );
      }
   }
%>

<input name="EBPCity" id="EBPCity"  disabled style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* PState::Text */ %>

<span  id="PState:" name="PState:" style="width:140px;height:16px;">State:</span>

<span style="height:60px;">&nbsp&nbsp</span>
<% /* CBPState:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="CBPState" id="CBPState" size="1" style="width:174px;"  disabled onchange="CBPStateOnChange( )">

<%
   boolean inListCBPState = false;

   mSubreg = task.getViewByName( "mSubreg" );
   if ( VmlOperation.isValid( mSubreg ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSubreg , "PhysicalAddress", "State", "States - Full Name" );

      nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSubreg.cursor( "PhysicalAddress" ).getAttribute( "State" ).getString( "" );
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
         inListCBPState = true;
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
               inListCBPState = true;
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
      if ( !inListCBPState )
      { 
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }  
   }  // if view != null
%>
</select>

<input name="hCBPState" id="hCBPState" type="hidden" value="<%=strComboCurrentValue%>" >
<span style="height:16px;">&nbsp&nbsp</span>
<% /* PZipCode::Text */ %>

<span  id="PZipCode:" name="PZipCode:" style="width:30px;height:16px;">Zip:</span>

<span style="height:16px;">&nbsp</span>
<% /* EBPZipCode:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBPZipCode", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBPZipCode" );
      else
      {
         nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "PhysicalAddress" ).getAttribute( "ZipCode" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPZipCode: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBPZipCode", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "PhysicalAddress.ZipCode: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBPZipCode: " + "mSubreg.PhysicalAddress" );
      }
   }
%>

<input name="EBPZipCode" id="EBPZipCode"  disabled style="width:76px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:-32px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* TollFreeEmergencyPhone::Text */ %>

<span  id="TollFreeEmergencyPhone:" name="TollFreeEmergencyPhone:" style="width:194px;height:16px;">Toll Free Emergency Phone:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* EBPEmergencyPhone:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBPEmergencyPhone", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBPEmergencyPhone" );
      else
      {
         nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "PhysicalAddress" ).getAttribute( "TollFreePhone" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPEmergencyPhone: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBPEmergencyPhone", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "PhysicalAddress.TollFreePhone: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBPEmergencyPhone: " + "mSubreg.PhysicalAddress" );
      }
   }
%>

<input name="EBPEmergencyPhone" id="EBPEmergencyPhone"  disabled style="width:250px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->


</div>  <!--  PhysicalAddress --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:20px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* SameAddress:CheckBox */ %>
<%
   strErrorMapValue = "";
   wWebXfer = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXfer ) == false )
      task.log( ).debug( "Invalid View: " + "SameAddress" );
   else
   {
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
         strRadioGroupValue = wWebXfer.cursor( "Root" ).getAttribute( "SameAs" ).getString( "" );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="SameAddress" id="SameAddress"  disabled  value="Y" <%=strErrorMapValue%> style="">
<span style="width:166px;height:20px;">&nbsp Same Address</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* MailingAddress:GroupBox */ %>

<div id="MailingAddress" name="MailingAddress" style="width:482px;height:142px;float:left;">  <!-- MailingAddress --> 

<div  id="MailingAddress" name="MailingAddress" >Mailing Address</div>

 <!-- This is added as a line spacer -->
<div style="height:24px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Street::Text */ %>

<span  id="Street:" name="Street:" style="width:140px;height:16px;">Street:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* EBStreetAddress:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBStreetAddress", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBStreetAddress" );
      else
      {
         nRC = mSubreg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "MailingAddress" ).getAttribute( "Address" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBStreetAddress: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBStreetAddress", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MailingAddress.Address: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBStreetAddress: " + "mSubreg.MailingAddress" );
      }
   }
%>

<input name="EBStreetAddress" id="EBStreetAddress"  disabled style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
<% /* EBAddress2:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBAddress2", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBAddress2" );
      else
      {
         nRC = mSubreg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "MailingAddress" ).getAttribute( "AddressLine2" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBAddress2: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBAddress2", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MailingAddress.AddressLine2: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBAddress2: " + "mSubreg.MailingAddress" );
      }
   }
%>

<input name="EBAddress2" id="EBAddress2"  disabled style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* City::Text */ %>

<span  id="City:" name="City:" style="width:140px;height:16px;">City:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* EBCity:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBCity", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBCity" );
      else
      {
         nRC = mSubreg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "MailingAddress" ).getAttribute( "City" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBCity: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBCity", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MailingAddress.City: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBCity: " + "mSubreg.MailingAddress" );
      }
   }
%>

<input name="EBCity" id="EBCity"  disabled style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* State::Text */ %>

<span  id="State:" name="State:" style="width:140px;height:16px;">State:</span>

<span style="height:72px;">&nbsp&nbsp</span>
<% /* CBState:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="CBState" id="CBState" size="1" style="width:174px;"  disabled onchange="CBStateOnChange( )">

<%
   boolean inListCBState = false;

   mSubreg = task.getViewByName( "mSubreg" );
   if ( VmlOperation.isValid( mSubreg ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSubreg , "MailingAddress", "State", "States - Full Name" );

      nRC = mSubreg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSubreg.cursor( "MailingAddress" ).getAttribute( "State" ).getString( "" );
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
         inListCBState = true;
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
               inListCBState = true;
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
      if ( !inListCBState )
      { 
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }  
   }  // if view != null
%>
</select>

<input name="hCBState" id="hCBState" type="hidden" value="<%=strComboCurrentValue%>" >
<span style="height:16px;">&nbsp&nbsp</span>
<% /* ZipCode::Text */ %>

<span  id="ZipCode:" name="ZipCode:" style="width:30px;height:16px;">Zip:</span>

<span style="height:16px;">&nbsp</span>
<% /* EBZipCode:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBZipCode", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBZipCode" );
      else
      {
         nRC = mSubreg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "MailingAddress" ).getAttribute( "ZipCode" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBZipCode: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBZipCode", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MailingAddress.ZipCode: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBZipCode: " + "mSubreg.MailingAddress" );
      }
   }
%>

<input name="EBZipCode" id="EBZipCode"  disabled style="width:76px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->


</div>  <!--  MailingAddress --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* Contact:GroupBox */ %>

<div id="Contact" name="Contact" style="width:482px;height:188px;float:left;">  <!-- Contact --> 

<div  id="Contact" name="Contact" >Contact</div>

 <!-- This is added as a line spacer -->
<div style="height:24px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* FirstName::Text */ %>

<span  id="FirstName:" name="FirstName:" style="width:140px;height:16px;">First Name:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* EBFirstName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBFirstName", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBFirstName" );
      else
      {
         nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "ContactPerson" ).getAttribute( "FirstName" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBFirstName: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBFirstName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.FirstName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBFirstName: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBFirstName" id="EBFirstName"  disabled style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:8px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* LastName::Text */ %>

<span  id="LastName:" name="LastName:" style="width:140px;height:16px;">Last Name:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* EBLastName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBLastName", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBLastName" );
      else
      {
         nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "ContactPerson" ).getAttribute( "LastName" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBLastName: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBLastName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.LastName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBLastName: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBLastName" id="EBLastName"  disabled style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:16px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Title::Text */ %>

<span  id="Title:" name="Title:" style="width:140px;height:16px;">Title:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* EBTitle:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBTitle", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBTitle" );
      else
      {
         nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "ContactPerson" ).getAttribute( "Title" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBTitle: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBTitle", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.Title: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBTitle: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBTitle" id="EBTitle"  disabled style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* CPhone::Text */ %>

<span  id="CPhone:" name="CPhone:" style="width:140px;height:16px;">Phone:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* EBCPhone:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBCPhone", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBCPhone" );
      else
      {
         nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "ContactPerson" ).getAttribute( "WorkPhone" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBCPhone: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBCPhone", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.WorkPhone: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBCPhone: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBCPhone" id="EBCPhone"  disabled style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Fax::Text */ %>

<span  id="Fax:" name="Fax:" style="width:140px;height:16px;">Fax:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* EBFax:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBFax", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBFax" );
      else
      {
         nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "ContactPerson" ).getAttribute( "Fax" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBFax: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBFax", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.Fax: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBFax: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBFax" id="EBFax"  disabled style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp</span>
<% /* Email::Text */ %>

<span  id="Email:" name="Email:" style="width:140px;height:16px;">Email:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* EBEmail:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBEmail", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBEmail" );
      else
      {
         nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "ContactPerson" ).getAttribute( "EmailAddress" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBEmail: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBEmail", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.EmailAddress: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBEmail: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBEmail" id="EBEmail"  disabled style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->


</div>  <!--  Contact --> 
</div>  <!-- End of a new line -->


</div>  <!--  Subregistrant --> 
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
   session.setAttribute( "ZeidonWindow", "wSubRSubregDetail" );
   task.log().info( "After building the page setting ZeidonWindow: ------>>> " + "wSubRSubregDetail" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
