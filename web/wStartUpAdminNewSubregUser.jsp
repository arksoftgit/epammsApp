<!DOCTYPE HTML>

<%-- wStartUpAdminNewSubregUser --%>

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

   View mCurrentUser = null;
   View mPerson = null;
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

   mCurrentUser = task.getViewByName( "mCurrentUser" );
   if ( VmlOperation.isValid( mCurrentUser ) )
   {
      // EditBox: EBUserName
      nRC = mCurrentUser.cursor( "User" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBUserName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBUserName", "", strMapValue );
            else
               mCurrentUser.cursor( "User" ).setAttribute( "UserName", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBUserName", e.getReason( ), strMapValue );
         }
      }

   }

   mPerson = task.getViewByName( "mPerson" );
   if ( VmlOperation.isValid( mPerson ) )
   {
      // EditBox: EBFirstName
      nRC = mPerson.cursor( "Person" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBFirstName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBFirstName", "", strMapValue );
            else
               mPerson.cursor( "Person" ).setAttribute( "FirstName", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBFirstName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBLastName
      nRC = mPerson.cursor( "Person" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBLastName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBLastName", "", strMapValue );
            else
               mPerson.cursor( "Person" ).setAttribute( "LastName", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBLastName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBTitle
      nRC = mPerson.cursor( "Person" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBTitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBTitle", "", strMapValue );
            else
               mPerson.cursor( "Person" ).setAttribute( "Title", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBTitle", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBCPhone
      nRC = mPerson.cursor( "Person" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBCPhone" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBCPhone", "", strMapValue );
            else
               mPerson.cursor( "Person" ).setAttribute( "WorkPhone", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBCPhone", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBFax
      nRC = mPerson.cursor( "Person" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBFax" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBFax", "", strMapValue );
            else
               mPerson.cursor( "Person" ).setAttribute( "Fax", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBFax", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBEmail
      nRC = mPerson.cursor( "Person" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBEmail" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBEmail", "", strMapValue );
            else
               mPerson.cursor( "Person" ).setAttribute( "EmailAddress", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBEmail", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPStreetAddress
      nRC = mPerson.cursor( "Address" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPStreetAddress" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPStreetAddress", "", strMapValue );
            else
               mPerson.cursor( "Address" ).setAttribute( "Address", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPStreetAddress", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPAddress
      nRC = mPerson.cursor( "Address" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPAddress" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPAddress", "", strMapValue );
            else
               mPerson.cursor( "Address" ).setAttribute( "AddressLine2", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPAddress", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPCity
      nRC = mPerson.cursor( "Address" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPCity" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPCity", "", strMapValue );
            else
               mPerson.cursor( "Address" ).setAttribute( "City", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPCity", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: CBPState
      nRC = mPerson.cursor( "Address" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hCBPState" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "CBPState", "", strMapValue );
            else
               mPerson.cursor( "Address" ).setAttribute( "State", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "CBPState", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPZipCode
      nRC = mPerson.cursor( "Address" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPZipCode" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPZipCode", "", strMapValue );
            else
               mPerson.cursor( "Address" ).setAttribute( "ZipCode", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPZipCode", e.getReason( ), strMapValue );
         }
      }

   }

   mSubreg = task.getViewByName( "mSubreg" );
   if ( VmlOperation.isValid( mSubreg ) )
   {
      // ComboBox: ExperienceLevel
      nRC = mSubreg.cursor( "User" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hExperienceLevel" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ExperienceLevel", "", strMapValue );
            else
               mSubreg.cursor( "User" ).setAttribute( "Status", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ExperienceLevel", e.getReason( ), strMapValue );
         }
      }

   }

   wWebXfer = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXfer ) )
   {
      // EditBox: EBPassword
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPassword" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPassword", "", strMapValue );
            else
               wWebXfer.cursor( "Root" ).setAttribute( "AttemptPassword", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPassword", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBConfirmPassword
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBConfirmPassword" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBConfirmPassword", "", strMapValue );
            else
               wWebXfer.cursor( "Root" ).setAttribute( "ConfirmPassword", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBConfirmPassword", e.getReason( ), strMapValue );
         }
      }

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

if ( strLastWindow.equals("wStartUpAdminNewSubregUser") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wStartUpAdminNewSubregUser strActionToProcess *** " + strActionToProcess );
task.log().info("*** wStartUpAdminNewSubregUser LastWindow *** " + strLastWindow );
task.log().info("*** wStartUpAdminNewSubregUser LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AdminAcceptNewSubregUser" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.AcceptNewSubregUser" );
         nOptRC = wStartUp.AcceptNewSubregUser( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AdminCancelNewSubregUser" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.CancelNewSubregUser" );
         nOptRC = wStartUp.CancelNewSubregUser( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAdminAcceptNewSubregUser" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.AcceptNewSubregUser" );
         nOptRC = wStartUp.AcceptNewSubregUser( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAdminCancelNewSubregUser" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.CancelNewSubregUser" );
         nOptRC = wStartUp.CancelNewSubregUser( new zVIEW( vKZXMLPGO ) );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.ProductManagement" );
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
         strNextJSP_Name = wStartUp.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartTopWindow, "wSPLD", "SubregProductsList" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mSubregistrants" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.SubregistrantManagement" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.TrackingNotificationCompliance" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.StateRegistrations" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.MarketingFulfillment" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.WebDevelopment" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.PrimaryRegistrantCompanySetup" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.ProcessLogin" );
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

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wStartUpAdminNewSubregUser" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wStartUpAdminNewSubregUser" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregUser", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wStartUpAdminNewSubregUser.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wStartUpAdminNewSubregUser.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wStartUpAdminNewSubregUser.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wStartUpAdminNewSubregUser.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregUser.jsp", "wStartUp.AddNewSubregUser" );
   nOptRC = wStartUp.AddNewSubregUser( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getStringFromAttribute( "WebReturnMessage" );
      strURLParameters = "?CallingPage=wStartUpAdminNewSubregUser.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wStartUp" +
                         "&OperationName=" + "AddNewSubregUser";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
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
      wWebXA.cursor( "Root" ).setAttribute( "CurrentWindow", "AdminNewSubregUser" );
   }

%>

<html>
<head>

<title>New Subregistrant User</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/md5.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wStartUpAdminNewSubregUser.js"></script>

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
   </ul>
</div>  <!-- end Navigation Bar -->

<%@include file="./include/topmenuend.inc" %>
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
       <li><a href="#"  onclick="smAdminAcceptNewSubregUser( )">Save and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smAdminCancelNewSubregUser( )">Cancel and Return</a></li>
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


<form name="wStartUpAdminNewSubregUser" id="wStartUpAdminNewSubregUser" method="post">
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wStartUp", "AdminNewSubregUser" );
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
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* BreadCrumb: */ %>
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* UserInformation:GroupBox */ %>

<div id="UserInformation" name="UserInformation" style="width:506px;height:56px;float:left;">  <!-- UserInformation --> 


 <!-- This is added as a line spacer -->
<div style="height:28px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:16px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox3:GroupBox */ %>
<div id="GroupBox3" name="GroupBox3" style="float:left;width:474px;" >

<table cols=0 style="width:474px;"  class="grouptable">

<tr>
<td valign="top" style="width:154px;">
<% /* SubregistrantName::Text */ %>

<span  id="SubregistrantName:" name="SubregistrantName:" style="width:150px;height:16px;">Subregistrant Name:</span>

</td>
<td valign="top" style="width:318px;">
<% /* TXName:Text */ %>
<% strTextDisplayValue = "";
   mPerson = task.getViewByName( "mPerson" );
   if ( VmlOperation.isValid( mPerson ) == false )
      task.log( ).debug( "Invalid View: " + "TXName" );
   else
   {
      nRC = mPerson.cursor( "Organization" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
      try
      {
         strTextDisplayValue = mPerson.cursor( "Organization" ).getStringFromAttribute( "Name", "" );
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

<span  id="TXName" name="TXName" style="width:318px;height:16px;"><%=strTextDisplayValue%></span>

</td>
</tr>
</table>

</div>  <!-- GroupBox3 --> 

</div>  <!-- End of a new line -->


</div>  <!--  UserInformation --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:22px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* User:GroupBox */ %>

<div id="User" name="User" style="width:506px;height:250px;float:left;">  <!-- User --> 


 <!-- This is added as a line spacer -->
<div style="height:28px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:16px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox4:GroupBox */ %>
<div id="GroupBox4" name="GroupBox4" style="float:left;width:474px;" >

<table cols=2 style="width:474px;"  class="grouptable">

<tr>
<td valign="top" style="width:154px;">
<% /* FirstName::Text */ %>

<span  id="FirstName:" name="FirstName:" style="width:150px;height:16px;">First Name:</span>

</td>
<td valign="top" style="width:318px;">
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
      mPerson = task.getViewByName( "mPerson" );
      if ( VmlOperation.isValid( mPerson ) == false )
         task.log( ).debug( "Invalid View: " + "EBFirstName" );
      else
      {
         nRC = mPerson.cursor( "Person" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mPerson.cursor( "Person" ).getStringFromAttribute( "FirstName", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBFirstName: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBFirstName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Person.FirstName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mPerson.Person" );
      }
   }
%>

<input name="EBFirstName" id="EBFirstName" style="width:318px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* LastName::Text */ %>

<span  id="LastName:" name="LastName:" style="width:150px;height:16px;">Last Name:</span>

</td>
<td valign="top" style="width:318px;">
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
      mPerson = task.getViewByName( "mPerson" );
      if ( VmlOperation.isValid( mPerson ) == false )
         task.log( ).debug( "Invalid View: " + "EBLastName" );
      else
      {
         nRC = mPerson.cursor( "Person" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mPerson.cursor( "Person" ).getStringFromAttribute( "LastName", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBLastName: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBLastName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Person.LastName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mPerson.Person" );
      }
   }
%>

<input name="EBLastName" id="EBLastName" style="width:318px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* Title::Text */ %>

<span  id="Title:" name="Title:" style="width:150px;height:16px;">Title:</span>

</td>
<td valign="top" style="width:318px;">
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
      mPerson = task.getViewByName( "mPerson" );
      if ( VmlOperation.isValid( mPerson ) == false )
         task.log( ).debug( "Invalid View: " + "EBTitle" );
      else
      {
         nRC = mPerson.cursor( "Person" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mPerson.cursor( "Person" ).getStringFromAttribute( "Title", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBTitle: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBTitle", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Person.Title: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mPerson.Person" );
      }
   }
%>

<input name="EBTitle" id="EBTitle" style="width:318px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* CPhone::Text */ %>

<span  id="CPhone:" name="CPhone:" style="width:150px;height:16px;">Phone:</span>

</td>
<td valign="top" style="width:318px;">
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
      mPerson = task.getViewByName( "mPerson" );
      if ( VmlOperation.isValid( mPerson ) == false )
         task.log( ).debug( "Invalid View: " + "EBCPhone" );
      else
      {
         nRC = mPerson.cursor( "Person" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mPerson.cursor( "Person" ).getStringFromAttribute( "WorkPhone", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBCPhone: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBCPhone", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Person.WorkPhone: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mPerson.Person" );
      }
   }
%>

<input name="EBCPhone" id="EBCPhone" style="width:318px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* Fax::Text */ %>

<span  id="Fax:" name="Fax:" style="width:150px;height:16px;">Fax:</span>

</td>
<td valign="top" style="width:318px;">
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
      mPerson = task.getViewByName( "mPerson" );
      if ( VmlOperation.isValid( mPerson ) == false )
         task.log( ).debug( "Invalid View: " + "EBFax" );
      else
      {
         nRC = mPerson.cursor( "Person" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mPerson.cursor( "Person" ).getStringFromAttribute( "Fax", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBFax: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBFax", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Person.Fax: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mPerson.Person" );
      }
   }
%>

<input name="EBFax" id="EBFax" style="width:318px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* Email::Text */ %>

<span  id="Email:" name="Email:" style="width:150px;height:16px;">Email:</span>

</td>
<td valign="top" style="width:318px;">
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
      mPerson = task.getViewByName( "mPerson" );
      if ( VmlOperation.isValid( mPerson ) == false )
         task.log( ).debug( "Invalid View: " + "EBEmail" );
      else
      {
         nRC = mPerson.cursor( "Person" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mPerson.cursor( "Person" ).getStringFromAttribute( "EmailAddress", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBEmail: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBEmail", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Person.EmailAddress: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mPerson.Person" );
      }
   }
%>

<input name="EBEmail" id="EBEmail" style="width:318px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* ExperienceLevel::Text */ %>

<span  id="ExperienceLevel:" name="ExperienceLevel:" style="width:150px;height:16px;">Experience Level:</span>

</td>
<td valign="top" style="width:318px;">
<% /* ExperienceLevel:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="ExperienceLevel" id="ExperienceLevel" size="1" style="width:318px;" onchange="ExperienceLevelOnChange( )">

<%
   boolean inListExperienceLevel = false;

   mSubreg = task.getViewByName( "mSubreg" );
   if ( VmlOperation.isValid( mSubreg ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSubreg , "User", "Status", "" );

      nRC = mSubreg.cursor( "User" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSubreg.cursor( "User" ).getStringFromAttribute( "Status", "" );
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
</td>
</tr>
</table>

</div>  <!-- GroupBox4 --> 

</div>  <!-- End of a new line -->


</div>  <!--  User --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:32px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* PhysicalAddress:GroupBox */ %>

<div id="PhysicalAddress" name="PhysicalAddress" style="width:506px;height:152px;float:left;">  <!-- PhysicalAddress --> 


 <!-- This is added as a line spacer -->
<div style="height:28px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:16px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox5:GroupBox */ %>
<div id="GroupBox5" name="GroupBox5" style="float:left;width:474px;" >

<table cols=2 style="width:474px;"  class="grouptable">

<tr>
<td valign="top" style="width:154px;">
<% /* PStreet::Text */ %>

<span  id="PStreet:" name="PStreet:" style="width:150px;height:16px;">Street:</span>

</td>
<td valign="top" style="width:318px;">
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
      mPerson = task.getViewByName( "mPerson" );
      if ( VmlOperation.isValid( mPerson ) == false )
         task.log( ).debug( "Invalid View: " + "EBPStreetAddress" );
      else
      {
         nRC = mPerson.cursor( "Address" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mPerson.cursor( "Address" ).getStringFromAttribute( "Address", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPStreetAddress: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBPStreetAddress", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Address.Address: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mPerson.Address" );
      }
   }
%>

<input name="EBPStreetAddress" id="EBPStreetAddress" style="width:318px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* GroupBox2:GroupBox */ %>
<div id="GroupBox2" name="GroupBox2" style="width:150px;height:16px;float:left;">
</div>  <!-- GroupBox2 --> 
</td>
<td valign="top" style="width:318px;">
<% /* EBPAddress:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBPAddress", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mPerson = task.getViewByName( "mPerson" );
      if ( VmlOperation.isValid( mPerson ) == false )
         task.log( ).debug( "Invalid View: " + "EBPAddress" );
      else
      {
         nRC = mPerson.cursor( "Address" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mPerson.cursor( "Address" ).getStringFromAttribute( "AddressLine2", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPAddress: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBPAddress", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Address.AddressLine2: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mPerson.Address" );
      }
   }
%>

<input name="EBPAddress" id="EBPAddress" style="width:318px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* PCity::Text */ %>

<span  id="PCity:" name="PCity:" style="width:150px;height:16px;">City:</span>

</td>
<td valign="top" style="width:318px;">
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
      mPerson = task.getViewByName( "mPerson" );
      if ( VmlOperation.isValid( mPerson ) == false )
         task.log( ).debug( "Invalid View: " + "EBPCity" );
      else
      {
         nRC = mPerson.cursor( "Address" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mPerson.cursor( "Address" ).getStringFromAttribute( "City", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPCity: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBPCity", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Address.City: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mPerson.Address" );
      }
   }
%>

<input name="EBPCity" id="EBPCity" style="width:318px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* PState::Text */ %>

<span  id="PState:" name="PState:" style="width:150px;height:16px;">State:</span>

</td>
<td valign="top" style="width:192px;">
<% /* CBPState:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="CBPState" id="CBPState" size="1" style="width:174px;" onchange="CBPStateOnChange( )">

<%
   boolean inListCBPState = false;

   mPerson = task.getViewByName( "mPerson" );
   if ( VmlOperation.isValid( mPerson ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mPerson , "Address", "State", "States - Full Name" );

      nRC = mPerson.cursor( "Address" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mPerson.cursor( "Address" ).getStringFromAttribute( "State", "" );
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
</td>
<td valign="top" style="width:36px;">
<% /* PZipCode::Text */ %>

<span  id="PZipCode:" name="PZipCode:" style="width:30px;height:16px;">Zip:</span>

</td>
<td valign="top" style="width:76px;">
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
      mPerson = task.getViewByName( "mPerson" );
      if ( VmlOperation.isValid( mPerson ) == false )
         task.log( ).debug( "Invalid View: " + "EBPZipCode" );
      else
      {
         nRC = mPerson.cursor( "Address" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mPerson.cursor( "Address" ).getStringFromAttribute( "ZipCode", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPZipCode: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBPZipCode", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Address.ZipCode: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mPerson.Address" );
      }
   }
%>

<input name="EBPZipCode" id="EBPZipCode" style="width:76px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox5 --> 

</div>  <!-- End of a new line -->


</div>  <!--  PhysicalAddress --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:36px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* Login:GroupBox */ %>

<div id="Login" name="Login" style="width:506px;height:122px;float:left;">  <!-- Login --> 


 <!-- This is added as a line spacer -->
<div style="height:28px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:16px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox6:GroupBox */ %>
<div id="GroupBox6" name="GroupBox6" style="float:left;width:474px;" >

<table cols=2 style="width:474px;"  class="grouptable">

<tr>
<td valign="top" style="width:154px;">
<% /* UserName::Text */ %>

<span  id="UserName:" name="UserName:" style="width:150px;height:16px;">UserName:</span>

</td>
<td valign="top" style="width:318px;">
<% /* EBUserName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBUserName", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mCurrentUser = task.getViewByName( "mCurrentUser" );
      if ( VmlOperation.isValid( mCurrentUser ) == false )
         task.log( ).debug( "Invalid View: " + "EBUserName" );
      else
      {
         nRC = mCurrentUser.cursor( "User" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mCurrentUser.cursor( "User" ).getStringFromAttribute( "UserName", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBUserName: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBUserName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "User.UserName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mCurrentUser.User" );
      }
   }
%>

<input name="EBUserName" id="EBUserName" style="width:318px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* Password::Text */ %>

<span  id="Password:" name="Password:" style="width:150px;height:16px;">Password (8 char min):</span>

</td>
<td valign="top" style="width:318px;">
<% /* EBPassword:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBPassword", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      wWebXfer = task.getViewByName( "wWebXfer" );
      if ( VmlOperation.isValid( wWebXfer ) == false )
         task.log( ).debug( "Invalid View: " + "EBPassword" );
      else
      {
         nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = wWebXfer.cursor( "Root" ).getStringFromAttribute( "AttemptPassword", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPassword: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBPassword", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Root.AttemptPassword: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "wWebXfer.Root" );
      }
   }
%>

<input name="EBPassword" id="EBPassword" style="width:318px;<%=strErrorColor%>" type="password" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* ConfirmPassword::Text */ %>

<span  id="ConfirmPassword:" name="ConfirmPassword:" style="width:150px;height:16px;">Confirm Password:</span>

</td>
<td valign="top" style="width:318px;">
<% /* EBConfirmPassword:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBConfirmPassword", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      wWebXfer = task.getViewByName( "wWebXfer" );
      if ( VmlOperation.isValid( wWebXfer ) == false )
         task.log( ).debug( "Invalid View: " + "EBConfirmPassword" );
      else
      {
         nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = wWebXfer.cursor( "Root" ).getStringFromAttribute( "ConfirmPassword", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBConfirmPassword: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBConfirmPassword", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Root.ConfirmPassword: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "wWebXfer.Root" );
      }
   }
%>

<input name="EBConfirmPassword" id="EBConfirmPassword" style="width:318px;<%=strErrorColor%>" type="password" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox6 --> 

</div>  <!-- End of a new line -->


</div>  <!--  Login --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:24px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:22px;height:36px;float:left;">  <!-- GroupBox1 --> 


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
   session.setAttribute( "ZeidonWindow", "wStartUpAdminNewSubregUser" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
