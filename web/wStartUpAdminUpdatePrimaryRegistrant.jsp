<!DOCTYPE HTML>

<%-- wStartUpAdminUpdatePrimaryRegistrant --%>

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

   View mPrimReg = null;
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

   mPrimReg = task.getViewByName( "mPrimReg" );
   if ( VmlOperation.isValid( mPrimReg ) )
   {
      // EditBox: EBName
      nRC = mPrimReg.cursor( "Organization" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBName", "", strMapValue );
            else
               mPrimReg.cursor( "Organization" ).getAttribute( "Name" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBDescription
      nRC = mPrimReg.cursor( "Organization" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBDescription" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBDescription", "", strMapValue );
            else
               mPrimReg.cursor( "Organization" ).getAttribute( "Description" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBDescription", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EPA_ID
      nRC = mPrimReg.cursor( "PrimaryRegistrant" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EPA_ID" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EPA_ID", "", strMapValue );
            else
               mPrimReg.cursor( "PrimaryRegistrant" ).getAttribute( "EPA_CompanyNumber" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EPA_ID", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: Role
      nRC = mPrimReg.cursor( "Organization" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hRole" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Role", "", strMapValue );
            else
               mPrimReg.cursor( "Organization" ).getAttribute( "Role" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Role", e.getReason( ), strMapValue );
         }
      }

      // EditBox: LoginName
      nRC = mPrimReg.cursor( "Organization" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "LoginName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "LoginName", "", strMapValue );
            else
               mPrimReg.cursor( "Organization" ).getAttribute( "LoginName" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "LoginName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPStreetAddress
      nRC = mPrimReg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPStreetAddress" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPStreetAddress", "", strMapValue );
            else
               mPrimReg.cursor( "PhysicalAddress" ).getAttribute( "Address" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPStreetAddress", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPAddress2
      nRC = mPrimReg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPAddress2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPAddress2", "", strMapValue );
            else
               mPrimReg.cursor( "PhysicalAddress" ).getAttribute( "AddressLine2" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPAddress2", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPCity
      nRC = mPrimReg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPCity" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPCity", "", strMapValue );
            else
               mPrimReg.cursor( "PhysicalAddress" ).getAttribute( "City" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPCity", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: CBPState
      nRC = mPrimReg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hCBPState" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "CBPState", "", strMapValue );
            else
               mPrimReg.cursor( "PhysicalAddress" ).getAttribute( "State" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "CBPState", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPZipCode
      nRC = mPrimReg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPZipCode" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPZipCode", "", strMapValue );
            else
               mPrimReg.cursor( "PhysicalAddress" ).getAttribute( "ZipCode" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPZipCode", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPEmergencyPhone
      nRC = mPrimReg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPEmergencyPhone" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPEmergencyPhone", "", strMapValue );
            else
               mPrimReg.cursor( "PhysicalAddress" ).getAttribute( "TollFreePhone" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPEmergencyPhone", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBStreetAddress
      nRC = mPrimReg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBStreetAddress" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBStreetAddress", "", strMapValue );
            else
               mPrimReg.cursor( "MailingAddress" ).getAttribute( "Address" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBStreetAddress", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBAddress2
      nRC = mPrimReg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBAddress2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBAddress2", "", strMapValue );
            else
               mPrimReg.cursor( "MailingAddress" ).getAttribute( "AddressLine2" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBAddress2", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBCity
      nRC = mPrimReg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBCity" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBCity", "", strMapValue );
            else
               mPrimReg.cursor( "MailingAddress" ).getAttribute( "City" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBCity", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: CBState
      nRC = mPrimReg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hCBState" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "CBState", "", strMapValue );
            else
               mPrimReg.cursor( "MailingAddress" ).getAttribute( "State" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "CBState", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBZipCode
      nRC = mPrimReg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBZipCode" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBZipCode", "", strMapValue );
            else
               mPrimReg.cursor( "MailingAddress" ).getAttribute( "ZipCode" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBZipCode", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBFirstName
      nRC = mPrimReg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBFirstName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBFirstName", "", strMapValue );
            else
               mPrimReg.cursor( "ContactPerson" ).getAttribute( "FirstName" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBFirstName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBLastName
      nRC = mPrimReg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBLastName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBLastName", "", strMapValue );
            else
               mPrimReg.cursor( "ContactPerson" ).getAttribute( "LastName" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBLastName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBTitle
      nRC = mPrimReg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBTitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBTitle", "", strMapValue );
            else
               mPrimReg.cursor( "ContactPerson" ).getAttribute( "Title" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBTitle", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBCPhone
      nRC = mPrimReg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBCPhone" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBCPhone", "", strMapValue );
            else
               mPrimReg.cursor( "ContactPerson" ).getAttribute( "WorkPhone" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBCPhone", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBFax
      nRC = mPrimReg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBFax" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBFax", "", strMapValue );
            else
               mPrimReg.cursor( "ContactPerson" ).getAttribute( "Fax" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBFax", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBEmail
      nRC = mPrimReg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBEmail" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBEmail", "", strMapValue );
            else
               mPrimReg.cursor( "ContactPerson" ).getAttribute( "EmailAddress" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBEmail", e.getReason( ), strMapValue );
         }
      }

   }

   wWebXfer = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXfer ) )
   {
      // CheckBox: SameAddress
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "SameAddress" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "SameAddress", "", strMapValue );
            else
               wWebXfer.cursor( "Root" ).getAttribute( "SameAs" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "SameAddress", e.getReason( ), strMapValue );
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

if ( strLastWindow.equals("wStartUpAdminUpdatePrimaryRegistrant") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wStartUpAdminUpdatePrimaryRegistrant strActionToProcess *** " + strActionToProcess );
task.log().info("*** wStartUpAdminUpdatePrimaryRegistrant LastWindow *** " + strLastWindow );
task.log().info("*** wStartUpAdminUpdatePrimaryRegistrant LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AdminAcceptUpdatePrimReg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.AcceptUpdatePrimaryRegistrant" );
         nOptRC = wStartUp.AcceptUpdatePrimaryRegistrant( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "Profile" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartModalSubwindow, "wStartUp", "Profile" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AdminCancelUpdatePrimReg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.CancelUpdatePrimaryRegistrant" );
         nOptRC = wStartUp.CancelUpdatePrimaryRegistrant( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ChangePrimRegPassword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.ValidatePrimaryRegistrant" );
         nOptRC = wStartUp.ValidatePrimaryRegistrant( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartModalSubwindow, "wStartUp", "ChangePrimRegPassword" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smChangePrimRegPassword" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.ValidatePrimaryRegistrant" );
         nOptRC = wStartUp.ValidatePrimaryRegistrant( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartModalSubwindow, "wStartUp", "ChangePrimRegPassword" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smProfile" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartModalSubwindow, "wStartUp", "Profile" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAdminAcceptUpdatePrimReg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.AcceptUpdatePrimaryRegistrant" );
         nOptRC = wStartUp.AcceptUpdatePrimaryRegistrant( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAdminCancelUpdatePrimReg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.CancelUpdatePrimaryRegistrant" );
         nOptRC = wStartUp.CancelUpdatePrimaryRegistrant( new zVIEW( vKZXMLPGO ) );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.ProductManagement" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.SubregistrantManagement" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.TrackingNotificationCompliance" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.StateRegistrations" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.MarketingFulfillment" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.WebDevelopment" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.PrimaryRegistrantCompanySetup" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.ProcessLogin" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wStartUpAdminUpdatePrimaryRegistrant" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wStartUpAdminUpdatePrimaryRegistrant" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminUpdatePrimaryRegistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wStartUpAdminUpdatePrimaryRegistrant.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wStartUpAdminUpdatePrimaryRegistrant.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wStartUpAdminUpdatePrimaryRegistrant.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wStartUpAdminUpdatePrimaryRegistrant.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminUpdatePrimaryRegistrant.jsp", "wStartUp.InitPrimaryRegistrantForUpdate" );
         nOptRC = wStartUp.InitPrimaryRegistrantForUpdate( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getAttribute( "WebReturnMessage" ).getString( "" );
      strURLParameters = "?CallingPage=wStartUpAdminUpdatePrimaryRegistrant.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wStartUp" +
                         "&OperationName=" + "InitPrimaryRegistrantForUpdate";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wStartUp", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wStartUp", "" );
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "AdminUpdatePrimaryRegistrant", "" );
   }

%>

<html>
<head>

<title>Update Primary Registrant</title>

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

   // From UpdatePrimaryRegistrant, the only invalid top menu options are (currently Template and) State Registrations and Login.
   var thisLi;

   thisLi = document.getElementById( "lmTemplate" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmStateRegistrations" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";
   thisLi = document.getElementById( "lmLogin" );
   thisLi.style.visibility = "hidden";
   thisLi.style.display = "none";

   // Cannot go to administration if already there.
   thisLi = document.getElementById( "lmAdministration" );
   thisLi.disabled = true;

      // END of Javascript code entered by user.

</script>
<script language="JavaScript" type="text/javascript" src="./genjs/wStartUpAdminUpdatePrimaryRegistrant.js"></script>

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
       <li id="lmAdministration" name="lmAdministration" ><a href="#" onclick="mAdministration()">Company Profile</a></li>
       <li id="lmLogin" name="lmLogin" ><a href="#" onclick="mLogin()">Login</a></li>
       <li id="lmLogout" name="lmLogout" ><a href="#" onclick="mLogout()">Logout</a></li>
   </ul>
</div>  <!-- end Navigation Bar -->

<%@include file="./include/topmenuend.inc" %>
<div id="maincontent">

<div id="leftcontent">

<!-- Side Navigation *********************** -->
<div id="sidenavigation">
   <ul id="Return" name="Return">
<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "ChangePassword" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smChangePassword" name="smChangePassword"><a href="#"  onclick="smChangePrimRegPassword()">Change Password</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Profile" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smProfile" name="smProfile"><a href="#"  onclick="smProfile()">Profile</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SaveAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smSaveAndReturn" name="smSaveAndReturn"><a href="#"  onclick="smAdminAcceptUpdatePrimReg()">Save and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smCancelAndReturn" name="smCancelAndReturn"><a href="#"  onclick="smAdminCancelUpdatePrimReg()">Cancel and Return</a></li>
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


<form name="wStartUpAdminUpdatePrimaryRegistrant" id="wStartUpAdminUpdatePrimaryRegistrant" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View iePamms = null;
   View lPrimReg = null;
   View lSubreg = null;
   View mCurrentUser = null;
   View mePamms = null;
   View mMasLC = null;
   View mPerson = null;
   View mPrimReg = null;
   View mSubreg = null;
   View mUser = null;
   View pePamms = null;
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

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getAttribute( "SolicitSaveFlag" ).getString( "" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wStartUp", "AdminUpdatePrimaryRegistrant" );
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
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:28px;">&nbsp&nbsp</span>
<% /* PrimaryRegistrant:Text */ %>

<span class="groupbox"  id="PrimaryRegistrant" name="PrimaryRegistrant" style="width:120px;height:28px;">Primary Registrant</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBPrimaryRegistrant:GroupBox */ %>

<div id="GBPrimaryRegistrant" name="GBPrimaryRegistrant" style="width:586px;height:172px;float:left;">  <!-- GBPrimaryRegistrant --> 


 <!-- This is added as a line spacer -->
<div style="height:30px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:26px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox4:GroupBox */ %>
<div id="GroupBox4" name="GroupBox4" style="float:left;width:546px;" >

<table cols=2 style="width:546px;"  class="grouptable">

<tr>
<td valign="top" style="width:152px;">
<% /* Name::Text */ %>

<span  id="Name:" name="Name:" style="width:118px;height:16px;">Name:</span>

</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBName" );
      else
      {
         nRC = mPrimReg.cursor( "Organization" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "Organization" ).getAttribute( "Name" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBName: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Organization.Name: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBName: " + "mPrimReg.Organization" );
      }
   }
%>

<input name="EBName" id="EBName" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* Description:Text */ %>

<span  id="Description" name="Description" style="width:118px;height:16px;">Description:</span>

</td>
<td valign="top" style="width:350px;">
<% /* EBDescription:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBDescription", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBDescription" );
      else
      {
         nRC = mPrimReg.cursor( "Organization" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "Organization" ).getAttribute( "Description" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBDescription: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBDescription", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Organization.Description: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBDescription: " + "mPrimReg.Organization" );
      }
   }
%>

<input name="EBDescription" id="EBDescription" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* EPA_ID::Text */ %>

<span  id="EPA_ID:" name="EPA_ID:" style="width:118px;height:16px;">EPA Company ID:</span>

</td>
<td valign="top" style="width:350px;">
<% /* EPA_ID:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EPA_ID", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EPA_ID" );
      else
      {
         nRC = mPrimReg.cursor( "PrimaryRegistrant" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "PrimaryRegistrant" ).getAttribute( "EPA_CompanyNumber" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EPA_ID: " + e.getMessage());
               task.log().error( "*** Error on ctrl EPA_ID", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "PrimaryRegistrant.EPA_CompanyNumber: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EPA_ID: " + "mPrimReg.PrimaryRegistrant" );
      }
   }
%>

<input name="EPA_ID" id="EPA_ID" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* Role::Text */ %>

<span  id="Role:" name="Role:" style="width:118px;height:16px;">Role:</span>

</td>
<td valign="top" style="width:174px;">
<% /* Role:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="Role" id="Role" size="1" style="width:174px;" onchange="RoleOnChange( )">

<%
   boolean inListRole = false;

   mPrimReg = task.getViewByName( "mPrimReg" );
   if ( VmlOperation.isValid( mPrimReg ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mPrimReg , "Organization", "Role", "" );

      nRC = mPrimReg.cursor( "Organization" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mPrimReg.cursor( "Organization" ).getAttribute( "Role" ).getString( "" );
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
         inListRole = true;
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
               inListRole = true;
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
      if ( !inListRole )
      { 
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }  
   }  // if view != null
%>
</select>

<input name="hRole" id="hRole" type="hidden" value="<%=strComboCurrentValue%>" >
</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* LoginName::Text */ %>

<span  id="LoginName:" name="LoginName:" style="width:118px;height:16px;">Login Name:</span>

</td>
<td valign="top" style="width:350px;">
<% /* LoginName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "LoginName", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "LoginName" );
      else
      {
         nRC = mPrimReg.cursor( "Organization" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "Organization" ).getAttribute( "LoginName" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on LoginName: " + e.getMessage());
               task.log().error( "*** Error on ctrl LoginName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Organization.LoginName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for LoginName: " + "mPrimReg.Organization" );
      }
   }
%>

<input name="LoginName" id="LoginName" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox4 --> 

</div>  <!-- End of a new line -->


</div>  <!--  GBPrimaryRegistrant --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:16px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:24px;">&nbsp&nbsp</span>
<% /* PhysicalAddress:Text */ %>

<span class="groupbox"  id="PhysicalAddress" name="PhysicalAddress" style="width:98px;height:24px;">Address</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBPhysicalAddress:GroupBox */ %>

<div id="GBPhysicalAddress" name="GBPhysicalAddress" style="width:586px;height:172px;float:left;">  <!-- GBPhysicalAddress --> 


 <!-- This is added as a line spacer -->
<div style="height:30px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:26px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox5:GroupBox */ %>
<div id="GroupBox5" name="GroupBox5" style="float:left;width:546px;" >

<table cols=2 style="width:546px;"  class="grouptable">

<tr>
<td valign="top" style="width:154px;">
<% /* PStreet::Text */ %>

<span  id="PStreet:" name="PStreet:" style="width:118px;height:16px;">Street:</span>

</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBPStreetAddress" );
      else
      {
         nRC = mPrimReg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "PhysicalAddress" ).getAttribute( "Address" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBPStreetAddress: " + "mPrimReg.PhysicalAddress" );
      }
   }
%>

<input name="EBPStreetAddress" id="EBPStreetAddress" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* GroupBox2:GroupBox */ %>
<div id="GroupBox2" name="GroupBox2" style="width:118px;height:16px;float:left;">
</div>  <!-- GroupBox2 --> 
</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBPAddress2" );
      else
      {
         nRC = mPrimReg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "PhysicalAddress" ).getAttribute( "AddressLine2" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBPAddress2: " + "mPrimReg.PhysicalAddress" );
      }
   }
%>

<input name="EBPAddress2" id="EBPAddress2" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* PCity::Text */ %>

<span  id="PCity:" name="PCity:" style="width:118px;height:16px;">City:</span>

</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBPCity" );
      else
      {
         nRC = mPrimReg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "PhysicalAddress" ).getAttribute( "City" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBPCity: " + "mPrimReg.PhysicalAddress" );
      }
   }
%>

<input name="EBPCity" id="EBPCity" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* PState::Text */ %>

<span  id="PState:" name="PState:" style="width:118px;height:16px;">State:</span>

</td>
<td valign="top" style="width:316px;">
<% /* GroupBox8:GroupBox */ %>
<div id="GroupBox8" name="GroupBox8" style="float:left;width:316px;" >

<table cols=0 style="width:316px;"  class="grouptable">

<tr>
<td valign="top" style="width:202px;">
<% /* CBPState:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="CBPState" id="CBPState" size="1" style="width:166px;" onchange="CBPStateOnChange( )">

<%
   boolean inListCBPState = false;

   mPrimReg = task.getViewByName( "mPrimReg" );
   if ( VmlOperation.isValid( mPrimReg ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mPrimReg , "PhysicalAddress", "State", "States - Full Name" );

      nRC = mPrimReg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mPrimReg.cursor( "PhysicalAddress" ).getAttribute( "State" ).getString( "" );
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
<td valign="top" style="width:38px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBPZipCode" );
      else
      {
         nRC = mPrimReg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "PhysicalAddress" ).getAttribute( "ZipCode" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBPZipCode: " + "mPrimReg.PhysicalAddress" );
      }
   }
%>

<input name="EBPZipCode" id="EBPZipCode" style="width:76px;<%=strErrorColor%>" type="text" mask="#####" onblur="return onBlurMask(this);" onfocus="return onFocusMask(this);" onkeydown="return doMask(this);" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox8 --> 

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* TollFreeEmergencyPhone::Text */ %>

<span  id="TollFreeEmergencyPhone:" name="TollFreeEmergencyPhone:" style="width:186px;height:16px;">Toll Free Emergency Phone:</span>

</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBPEmergencyPhone" );
      else
      {
         nRC = mPrimReg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "PhysicalAddress" ).getAttribute( "TollFreePhone" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBPEmergencyPhone: " + "mPrimReg.PhysicalAddress" );
      }
   }
%>

<input name="EBPEmergencyPhone" id="EBPEmergencyPhone" style="width:350px;<%=strErrorColor%>" type="text" mask="###-###-####" onblur="return onBlurMask(this);" onfocus="return onFocusMask(this);" onkeydown="return doMask(this);" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox5 --> 

</div>  <!-- End of a new line -->


</div>  <!--  GBPhysicalAddress --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:40px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBMailingAddress:GroupBox */ %>

<div id="GBMailingAddress" name="GBMailingAddress" style="width:586px;height:148px;float:left;">  <!-- GBMailingAddress --> 


<div>  <!-- Beginning of a new line -->
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:150px;height:24px;float:left;">  <!-- GroupBox1 --> 


<div>  <!-- Beginning of a new line -->
<% /* MailingAddress:Text */ %>

<span class="groupbox"  id="MailingAddress" name="MailingAddress" style="width:126px;height:20px;">Mailing Address</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox1 --> 
<div style="height:1px;width:2px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox10:GroupBox */ %>

<div id="GroupBox10" name="GroupBox10" style="width:248px;height:26px;float:left;">  <!-- GroupBox10 --> 


<div>  <!-- Beginning of a new line -->
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

<input type="checkbox" name="SameAddress" id="SameAddress"  value="Y" <%=strErrorMapValue%> style="">
<span style="width:26px;height:16px;">&nbsp </span>

<span style="height:18px;">&nbsp</span>
<% /* Text1:Text */ %>

<span  id="Text1" name="Text1" style="width:196px;height:18px;">Same As Physical Address</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox10 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:26px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox6:GroupBox */ %>
<div id="GroupBox6" name="GroupBox6" style="float:left;width:546px;" >

<table cols=2 style="width:546px;"  class="grouptable">

<tr>
<td valign="top" style="width:154px;">
<% /* Street::Text */ %>

<span  id="Street:" name="Street:" style="width:118px;height:16px;">Street:</span>

</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBStreetAddress" );
      else
      {
         nRC = mPrimReg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "MailingAddress" ).getAttribute( "Address" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBStreetAddress: " + "mPrimReg.MailingAddress" );
      }
   }
%>

<input name="EBStreetAddress" id="EBStreetAddress" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* GroupBox3:GroupBox */ %>
<div id="GroupBox3" name="GroupBox3" style="width:118px;height:16px;float:left;">
</div>  <!-- GroupBox3 --> 
</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBAddress2" );
      else
      {
         nRC = mPrimReg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "MailingAddress" ).getAttribute( "AddressLine2" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBAddress2: " + "mPrimReg.MailingAddress" );
      }
   }
%>

<input name="EBAddress2" id="EBAddress2" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* City::Text */ %>

<span  id="City:" name="City:" style="width:118px;height:16px;">City:</span>

</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBCity" );
      else
      {
         nRC = mPrimReg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "MailingAddress" ).getAttribute( "City" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBCity: " + "mPrimReg.MailingAddress" );
      }
   }
%>

<input name="EBCity" id="EBCity" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* State::Text */ %>

<span  id="State:" name="State:" style="width:118px;height:16px;">State:</span>

</td>
<td valign="top" style="width:310px;">
<% /* GroupBox9:GroupBox */ %>
<div id="GroupBox9" name="GroupBox9" style="float:left;width:310px;" >

<table cols=0 style="width:310px;"  class="grouptable">

<tr>
<td valign="top" style="width:200px;">
<% /* CBState:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="CBState" id="CBState" size="1" style="width:166px;" onchange="CBStateOnChange( )">

<%
   boolean inListCBState = false;

   mPrimReg = task.getViewByName( "mPrimReg" );
   if ( VmlOperation.isValid( mPrimReg ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mPrimReg , "MailingAddress", "State", "States - Full Name" );

      nRC = mPrimReg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mPrimReg.cursor( "MailingAddress" ).getAttribute( "State" ).getString( "" );
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
</td>
<td valign="top" style="width:38px;">
<% /* ZipCode::Text */ %>

<span  id="ZipCode:" name="ZipCode:" style="width:30px;height:16px;">Zip:</span>

</td>
<td valign="top" style="width:76px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBZipCode" );
      else
      {
         nRC = mPrimReg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "MailingAddress" ).getAttribute( "ZipCode" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBZipCode: " + "mPrimReg.MailingAddress" );
      }
   }
%>

<input name="EBZipCode" id="EBZipCode" style="width:76px;<%=strErrorColor%>" type="text" mask="#####" onblur="return onBlurMask(this);" onfocus="return onFocusMask(this);" onkeydown="return doMask(this);" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox9 --> 

</td>
</tr>
</table>

</div>  <!-- GroupBox6 --> 

</div>  <!-- End of a new line -->


</div>  <!--  GBMailingAddress --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:22px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBContact:GroupBox */ %>

<div id="GBContact" name="GBContact" style="width:586px;height:196px;float:left;">  <!-- GBContact --> 


<div>  <!-- Beginning of a new line -->
<% /* Contact:Text */ %>

<span class="groupbox"  id="Contact" name="Contact" style="width:126px;height:24px;">Contact</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:6px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:26px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox7:GroupBox */ %>
<div id="GroupBox7" name="GroupBox7" style="float:left;width:546px;" >

<table cols=2 style="width:546px;"  class="grouptable">

<tr>
<td valign="top" style="width:152px;">
<% /* FirstName::Text */ %>

<span  id="FirstName:" name="FirstName:" style="width:118px;height:16px;">First Name:</span>

</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBFirstName" );
      else
      {
         nRC = mPrimReg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "ContactPerson" ).getAttribute( "FirstName" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBFirstName: " + "mPrimReg.ContactPerson" );
      }
   }
%>

<input name="EBFirstName" id="EBFirstName" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* LastName::Text */ %>

<span  id="LastName:" name="LastName:" style="width:118px;height:16px;">Last Name:</span>

</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBLastName" );
      else
      {
         nRC = mPrimReg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "ContactPerson" ).getAttribute( "LastName" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBLastName: " + "mPrimReg.ContactPerson" );
      }
   }
%>

<input name="EBLastName" id="EBLastName" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* Title::Text */ %>

<span  id="Title:" name="Title:" style="width:118px;height:16px;">Title:</span>

</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBTitle" );
      else
      {
         nRC = mPrimReg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "ContactPerson" ).getAttribute( "Title" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBTitle: " + "mPrimReg.ContactPerson" );
      }
   }
%>

<input name="EBTitle" id="EBTitle" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* CPhone::Text */ %>

<span  id="CPhone:" name="CPhone:" style="width:118px;height:16px;">Phone:</span>

</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBCPhone" );
      else
      {
         nRC = mPrimReg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "ContactPerson" ).getAttribute( "WorkPhone" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBCPhone: " + "mPrimReg.ContactPerson" );
      }
   }
%>

<input name="EBCPhone" id="EBCPhone" style="width:350px;<%=strErrorColor%>" type="text" mask="###-###-####" onblur="return onBlurMask(this);" onfocus="return onFocusMask(this);" onkeydown="return doMask(this);" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* Fax::Text */ %>

<span  id="Fax:" name="Fax:" style="width:118px;height:16px;">Fax:</span>

</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBFax" );
      else
      {
         nRC = mPrimReg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "ContactPerson" ).getAttribute( "Fax" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBFax: " + "mPrimReg.ContactPerson" );
      }
   }
%>

<input name="EBFax" id="EBFax" style="width:350px;<%=strErrorColor%>" type="text" mask="###-###-####" onblur="return onBlurMask(this);" onfocus="return onFocusMask(this);" onkeydown="return doMask(this);" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* Email::Text */ %>

<span  id="Email:" name="Email:" style="width:118px;height:16px;">Email:</span>

</td>
<td valign="top" style="width:350px;">
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
      mPrimReg = task.getViewByName( "mPrimReg" );
      if ( VmlOperation.isValid( mPrimReg ) == false )
         task.log( ).debug( "Invalid View: " + "EBEmail" );
      else
      {
         nRC = mPrimReg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mPrimReg.cursor( "ContactPerson" ).getAttribute( "EmailAddress" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBEmail: " + "mPrimReg.ContactPerson" );
      }
   }
%>

<input name="EBEmail" id="EBEmail" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox7 --> 

</div>  <!-- End of a new line -->


</div>  <!--  GBContact --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:22px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox:GroupBox */ %>

<div id="GroupBox" name="GroupBox" style="width:16px;height:26px;float:left;">  <!-- GroupBox --> 


</div>  <!--  GroupBox --> 
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
   session.setAttribute( "ZeidonWindow", "wStartUpAdminUpdatePrimaryRegistrant" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
