<!DOCTYPE HTML>

<%-- wStartUpAdminNewSubregistrant   Generate Timestamp: 20160427103755331 --%>

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
      // EditBox: EBName
      nRC = mSubreg.cursor( "SubregOrganization" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBName", "", strMapValue );
            else
               mSubreg.cursor( "SubregOrganization" ).getAttribute( "Name" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBDescription
      nRC = mSubreg.cursor( "SubregOrganization" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBDescription" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBDescription", "", strMapValue );
            else
               mSubreg.cursor( "SubregOrganization" ).getAttribute( "Description" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBDescription", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EPA_ID
      nRC = mSubreg.cursor( "Subregistrant" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EPA_ID" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EPA_ID", "", strMapValue );
            else
               mSubreg.cursor( "Subregistrant" ).getAttribute( "EPA_CompanyNumber" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EPA_ID", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPStreetAddress
      nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPStreetAddress" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPStreetAddress", "", strMapValue );
            else
               mSubreg.cursor( "PhysicalAddress" ).getAttribute( "Address" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPStreetAddress", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPAddress
      nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPAddress" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPAddress", "", strMapValue );
            else
               mSubreg.cursor( "PhysicalAddress" ).getAttribute( "AddressLine2" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPAddress", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPCity
      nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPCity" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPCity", "", strMapValue );
            else
               mSubreg.cursor( "PhysicalAddress" ).getAttribute( "City" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPCity", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: CBPState
      nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hCBPState" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "CBPState", "", strMapValue );
            else
               mSubreg.cursor( "PhysicalAddress" ).getAttribute( "State" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "CBPState", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPZipCode
      nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPZipCode" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPZipCode", "", strMapValue );
            else
               mSubreg.cursor( "PhysicalAddress" ).getAttribute( "ZipCode" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPZipCode", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPEmergencyPhone
      nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPEmergencyPhone" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPEmergencyPhone", "", strMapValue );
            else
               mSubreg.cursor( "PhysicalAddress" ).getAttribute( "TollFreePhone" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPEmergencyPhone", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBStreetAddress
      nRC = mSubreg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBStreetAddress" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBStreetAddress", "", strMapValue );
            else
               mSubreg.cursor( "MailingAddress" ).getAttribute( "Address" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBStreetAddress", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBAddress
      nRC = mSubreg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBAddress" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBAddress", "", strMapValue );
            else
               mSubreg.cursor( "MailingAddress" ).getAttribute( "AddressLine2" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBAddress", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBCity
      nRC = mSubreg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBCity" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBCity", "", strMapValue );
            else
               mSubreg.cursor( "MailingAddress" ).getAttribute( "City" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBCity", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: CBState
      nRC = mSubreg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hCBState" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "CBState", "", strMapValue );
            else
               mSubreg.cursor( "MailingAddress" ).getAttribute( "State" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "CBState", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBZipCode
      nRC = mSubreg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBZipCode" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBZipCode", "", strMapValue );
            else
               mSubreg.cursor( "MailingAddress" ).getAttribute( "ZipCode" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBZipCode", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBCFirstName
      nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBCFirstName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBCFirstName", "", strMapValue );
            else
               mSubreg.cursor( "ContactPerson" ).getAttribute( "FirstName" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBCFirstName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBCLastName
      nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBCLastName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBCLastName", "", strMapValue );
            else
               mSubreg.cursor( "ContactPerson" ).getAttribute( "LastName" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBCLastName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBCTitle
      nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBCTitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBCTitle", "", strMapValue );
            else
               mSubreg.cursor( "ContactPerson" ).getAttribute( "Title" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBCTitle", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBCPhone
      nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBCPhone" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBCPhone", "", strMapValue );
            else
               mSubreg.cursor( "ContactPerson" ).getAttribute( "WorkPhone" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBCPhone", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBCFax
      nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBCFax" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBCFax", "", strMapValue );
            else
               mSubreg.cursor( "ContactPerson" ).getAttribute( "Fax" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBCFax", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBCEmail
      nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBCEmail" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBCEmail", "", strMapValue );
            else
               mSubreg.cursor( "ContactPerson" ).getAttribute( "EmailAddress" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBCEmail", e.getReason( ), strMapValue );
         }
      }

   }

   wWebXfer = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXfer ) )
   {
      // EditBox: EBLoginName
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBLoginName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBLoginName", "", strMapValue );
            else
               wWebXfer.cursor( "Root" ).getAttribute( "AttemptLoginRegistrant" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBLoginName", e.getReason( ), strMapValue );
         }
      }

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
               wWebXfer.cursor( "Root" ).getAttribute( "AttemptPassword" ).setValue( strMapValue, "" );
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
               wWebXfer.cursor( "Root" ).getAttribute( "ConfirmPassword" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBConfirmPassword", e.getReason( ), strMapValue );
         }
      }

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

if ( strLastWindow.equals("wStartUpAdminNewSubregistrant") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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

task.log().info("*** wStartUpAdminNewSubregistrant strActionToProcess *** " + strActionToProcess );
task.log().info("*** wStartUpAdminNewSubregistrant LastWindow *** " + strLastWindow );
task.log().info("*** wStartUpAdminNewSubregistrant LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AdminAcceptNewSubreg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.AcceptNewSubregistrant" );
      nOptRC = wStartUp.AcceptNewSubregistrant( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AdminCancelNewSubreg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.CancelNewSubregistrant" );
      nOptRC = wStartUp.CancelNewSubregistrant( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAdminAcceptNewSubreg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.AcceptNewSubregistrant" );
      nOptRC = wStartUp.AcceptNewSubregistrant( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAdminCancelNewSubreg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.CancelNewSubregistrant" );
      nOptRC = wStartUp.CancelNewSubregistrant( new zVIEW( vKZXMLPGO ) );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.ProductManagement" );
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
         strNextJSP_Name = wStartUp.SetWebRedirection( vKZXMLPGO, wStartUp.zWAB_StartTopWindow, "wSLC", "SubregProductsList" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mSubregistrants" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.SubregistrantManagement" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.TrackingNotificationCompliance" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.StateRegistrations" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.MarketingFulfillment" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.WebDevelopment" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mCompanyProfile" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.PrimaryRegistrantCompanySetup" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mUsers" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.GOTO_UserList" );
      nOptRC = wStartUp.GOTO_UserList( new zVIEW( vKZXMLPGO ) );
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

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wStartUpAdminNewSubregistrant" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wStartUpAdminNewSubregistrant" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wStartUpAdminNewSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wStartUpAdminNewSubregistrant.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wStartUpAdminNewSubregistrant.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wStartUpAdminNewSubregistrant.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wStartUpAdminNewSubregistrant.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wStartUpAdminNewSubregistrant", "wStartUp.AddNewSubregistrant" );
   nOptRC = wStartUp.AddNewSubregistrant( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getAttribute( "WebReturnMessage" ).getString( "" );
      strURLParameters = "?CallingPage=wStartUpAdminNewSubregistrant.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wStartUp" +
                         "&OperationName=" + "AddNewSubregistrant";
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
      wWebXA.cursor( "Root" ).getAttribute( "CurrentWindow" ).setValue( "AdminNewSubregistrant", "" );
   }

%>

<html>
<head>

<title>New Subregistrant</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wStartUpAdminNewSubregistrant.js"></script>

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
       <li id="lmCompanyProfile" name="lmCompanyProfile" ><a href="#" onclick="mCompanyProfile()">Company Profile</a></li>
       <li id="lmUsers" name="lmUsers" ><a href="#" onclick="mUsers()">Users</a></li>
   </ul>
</div>  <!-- end Navigation Bar -->

<%@include file="./include/topmenuend.inc" %>
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
       <li id="smSaveAndReturn" name="smSaveAndReturn"><a href="#"  onclick="smAdminAcceptNewSubreg()">Save and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smCancelAndReturn" name="smCancelAndReturn"><a href="#"  onclick="smAdminCancelNewSubreg()">Cancel and Return</a></li>
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


<form name="wStartUpAdminNewSubregistrant" id="wStartUpAdminNewSubregistrant" method="post">
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wStartUp", "AdminNewSubregistrant" );
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
<div style="height:2px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* BreadCrumb: */ %>
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:24px;">&nbsp&nbsp</span>
<% /* Subregistrant:Text */ %>

<span class="groupbox"  id="Subregistrant" name="Subregistrant" style="width:98px;height:24px;">Subregistrant</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBSubregistrant:GroupBox */ %>

<div id="GBSubregistrant" name="GBSubregistrant" style="width:586px;height:122px;float:left;">  <!-- GBSubregistrant --> 


 <!-- This is added as a line spacer -->
<div style="height:30px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:26px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox1:GroupBox */ %>
<div id="GroupBox1" name="GroupBox1" style="float:left;width:546px;" >

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

<input name="EBName" id="EBName" maxlength="254" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBDescription" );
      else
      {
         nRC = mSubreg.cursor( "SubregOrganization" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "SubregOrganization" ).getAttribute( "Description" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBDescription: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBDescription", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SubregOrganization.Description: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBDescription: " + "mSubreg.SubregOrganization" );
      }
   }
%>

<input name="EBDescription" id="EBDescription" maxlength="254" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* EPA_ID:1:Text */ %>

<span  id="EPA_ID:1" name="EPA_ID:1" style="width:118px;height:16px;">EPA Company ID:</span>

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
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EPA_ID" );
      else
      {
         nRC = mSubreg.cursor( "Subregistrant" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mSubreg.cursor( "Subregistrant" ).getAttribute( "EPA_CompanyNumber" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EPA_ID: " + e.getMessage());
               task.log().error( "*** Error on ctrl EPA_ID", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Subregistrant.EPA_CompanyNumber: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EPA_ID: " + "mSubreg.Subregistrant" );
      }
   }
%>

<input name="EPA_ID" id="EPA_ID" maxlength="32" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox1 --> 

</div>  <!-- End of a new line -->


</div>  <!--  GBSubregistrant --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:24px;">&nbsp&nbsp</span>
<% /* Login:Text */ %>

<span class="groupbox"  id="Login" name="Login" style="width:98px;height:24px;">Login</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBLogin:GroupBox */ %>

<div id="GBLogin" name="GBLogin" style="width:586px;height:110px;float:left;">  <!-- GBLogin --> 


 <!-- This is added as a line spacer -->
<div style="height:30px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:26px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>
<div id="GroupBox2" name="GroupBox2" style="float:left;width:546px;" >

<table cols=2 style="width:546px;"  class="grouptable">

<tr>
<td valign="top" style="width:152px;">
<% /* LoginName::Text */ %>

<span  id="LoginName:" name="LoginName:" style="width:118px;height:16px;">Login Name:</span>

</td>
<td valign="top" style="width:350px;">
<% /* EBLoginName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBLoginName", strError );
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
         task.log( ).debug( "Invalid View: " + "EBLoginName" );
      else
      {
         nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = wWebXfer.cursor( "Root" ).getAttribute( "AttemptLoginRegistrant" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBLoginName: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBLoginName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "Root.AttemptLoginRegistrant: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBLoginName: " + "wWebXfer.Root" );
      }
   }
%>

<input name="EBLoginName" id="EBLoginName" maxlength="128" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* Password::Text */ %>

<span  id="Password:" name="Password:" style="width:186px;height:16px;">Password (8 char min):</span>

</td>
<td valign="top" style="width:350px;">
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
               strErrorMapValue = wWebXfer.cursor( "Root" ).getAttribute( "AttemptPassword" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBPassword: " + "wWebXfer.Root" );
      }
   }
%>

<input name="EBPassword" id="EBPassword" maxlength="254" style="width:350px;<%=strErrorColor%>" type="password" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* ConfirmPassword::Text */ %>

<span  id="ConfirmPassword:" name="ConfirmPassword:" style="width:118px;height:16px;">Confirm Password:</span>

</td>
<td valign="top" style="width:350px;">
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
               strErrorMapValue = wWebXfer.cursor( "Root" ).getAttribute( "ConfirmPassword" ).getString( "" );
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
            task.log( ).debug( "Entity does not exist for EBConfirmPassword: " + "wWebXfer.Root" );
      }
   }
%>

<input name="EBConfirmPassword" id="EBConfirmPassword" maxlength="254" style="width:350px;<%=strErrorColor%>" type="password" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox2 --> 

</div>  <!-- End of a new line -->


</div>  <!--  GBLogin --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

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
<% /* GroupBox3:GroupBox */ %>
<div id="GroupBox3" name="GroupBox3" style="float:left;width:546px;" >

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

<input name="EBPStreetAddress" id="EBPStreetAddress" maxlength="128" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* GroupBox:GroupBox */ %>
<div id="GroupBox" name="GroupBox" style="width:118px;height:16px;float:left;">
</div>  <!-- GroupBox --> 
</td>
<td valign="top" style="width:350px;">
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
      mSubreg = task.getViewByName( "mSubreg" );
      if ( VmlOperation.isValid( mSubreg ) == false )
         task.log( ).debug( "Invalid View: " + "EBPAddress" );
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
               out.println("There is an error on EBPAddress: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBPAddress", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "PhysicalAddress.AddressLine2: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBPAddress: " + "mSubreg.PhysicalAddress" );
      }
   }
%>

<input name="EBPAddress" id="EBPAddress" maxlength="128" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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

<input name="EBPCity" id="EBPCity" maxlength="128" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* PState::Text */ %>

<span  id="PState:" name="PState:" style="width:118px;height:16px;">State:</span>

</td>
<td valign="top" style="width:316px;">
<% /* GroupBox4:GroupBox */ %>
<div id="GroupBox4" name="GroupBox4" style="float:left;width:316px;" >

<table cols=0 style="width:316px;"  class="grouptable">

<tr>
<td valign="top" style="width:202px;">
<% /* CBPState:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="CBPState" id="CBPState" size="1" style="width:166px;" onchange="CBPStateOnChange( )">

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

<input name="EBPZipCode" id="EBPZipCode" maxlength="10" style="width:76px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox4 --> 

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

<input name="EBPEmergencyPhone" id="EBPEmergencyPhone" maxlength="11" style="width:350px;<%=strErrorColor%>" type="text" mask="###-###-####" onblur="return onBlurMask(this);" onfocus="return onFocusMask(this);" onkeydown="return doMask(this);" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox3 --> 

</div>  <!-- End of a new line -->


</div>  <!--  GBPhysicalAddress --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:12px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBMailingAddress:GroupBox */ %>

<div id="GBMailingAddress" name="GBMailingAddress" style="width:586px;height:148px;float:left;">  <!-- GBMailingAddress --> 


<div>  <!-- Beginning of a new line -->
<% /* GroupBox5:GroupBox */ %>

<div id="GroupBox5" name="GroupBox5" style="width:150px;height:24px;float:left;">  <!-- GroupBox5 --> 


<div>  <!-- Beginning of a new line -->
<% /* MailingAddress:Text */ %>

<span class="groupbox"  id="MailingAddress" name="MailingAddress" style="width:126px;height:20px;">Mailing Address</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox5 --> 
<div style="height:1px;width:36px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox6:GroupBox */ %>

<div id="GroupBox6" name="GroupBox6" style="width:248px;height:26px;float:left;">  <!-- GroupBox6 --> 


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
         strRadioGroupValue = wWebXfer.cursor( "Root" ).getAttribute( "SameAs" ).getString( );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="SameAddress" id="SameAddress"  value="Y" <%=strErrorMapValue%> style="">
<span style="width:26px;height:16px;">&nbsp </span>

<span style="height:18px;">&nbsp</span>
<% /* Text:Text */ %>

<span  id="Text" name="Text" style="width:196px;height:18px;">Same As Physical Address</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox6 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:26px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox7:GroupBox */ %>
<div id="GroupBox7" name="GroupBox7" style="float:left;width:546px;" >

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

<input name="EBStreetAddress" id="EBStreetAddress" maxlength="128" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:154px;">
<% /* GroupBox8:GroupBox */ %>
<div id="GroupBox8" name="GroupBox8" style="width:118px;height:16px;float:left;">
</div>  <!-- GroupBox8 --> 
</td>
<td valign="top" style="width:350px;">
<% /* EBAddress:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBAddress", strError );
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
         task.log( ).debug( "Invalid View: " + "EBAddress" );
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
               out.println("There is an error on EBAddress: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBAddress", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MailingAddress.AddressLine2: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBAddress: " + "mSubreg.MailingAddress" );
      }
   }
%>

<input name="EBAddress" id="EBAddress" maxlength="128" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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

<input name="EBCity" id="EBCity" maxlength="128" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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

<input name="EBZipCode" id="EBZipCode" maxlength="10" style="width:76px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox9 --> 

</td>
</tr>
</table>

</div>  <!-- GroupBox7 --> 

</div>  <!-- End of a new line -->


</div>  <!--  GBMailingAddress --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:28px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:24px;">&nbsp&nbsp</span>
<% /* Contact:Text */ %>

<span class="groupbox"  id="Contact" name="Contact" style="width:126px;height:24px;">Contact</span>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:12px;float:left;"></div>   <!-- Width Spacer -->
<% /* GBContact:GroupBox */ %>

<div id="GBContact" name="GBContact" style="width:586px;height:196px;float:left;">  <!-- GBContact --> 


 <!-- This is added as a line spacer -->
<div style="height:30px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:26px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox10:GroupBox */ %>
<div id="GroupBox10" name="GroupBox10" style="float:left;width:546px;" >

<table cols=2 style="width:546px;"  class="grouptable">

<tr>
<td valign="top" style="width:152px;">
<% /* CFirstName::Text */ %>

<span  id="CFirstName:" name="CFirstName:" style="width:118px;height:16px;">First Name:</span>

</td>
<td valign="top" style="width:350px;">
<% /* EBCFirstName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBCFirstName", strError );
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
         task.log( ).debug( "Invalid View: " + "EBCFirstName" );
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
               out.println("There is an error on EBCFirstName: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBCFirstName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.FirstName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBCFirstName: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBCFirstName" id="EBCFirstName" maxlength="64" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* CLastName::Text */ %>

<span  id="CLastName:" name="CLastName:" style="width:118px;height:16px;">Last Name:</span>

</td>
<td valign="top" style="width:350px;">
<% /* EBCLastName:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBCLastName", strError );
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
         task.log( ).debug( "Invalid View: " + "EBCLastName" );
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
               out.println("There is an error on EBCLastName: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBCLastName", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.LastName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBCLastName: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBCLastName" id="EBCLastName" maxlength="64" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* CTitle::Text */ %>

<span  id="CTitle:" name="CTitle:" style="width:118px;height:16px;">Title:</span>

</td>
<td valign="top" style="width:350px;">
<% /* EBCTitle:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBCTitle", strError );
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
         task.log( ).debug( "Invalid View: " + "EBCTitle" );
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
               out.println("There is an error on EBCTitle: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBCTitle", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.Title: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBCTitle: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBCTitle" id="EBCTitle" maxlength="254" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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

<input name="EBCPhone" id="EBCPhone" maxlength="11" style="width:350px;<%=strErrorColor%>" type="text" mask="###-###-####" onblur="return onBlurMask(this);" onfocus="return onFocusMask(this);" onkeydown="return doMask(this);" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* CFax::Text */ %>

<span  id="CFax:" name="CFax:" style="width:118px;height:16px;">Fax:</span>

</td>
<td valign="top" style="width:350px;">
<% /* EBCFax:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBCFax", strError );
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
         task.log( ).debug( "Invalid View: " + "EBCFax" );
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
               out.println("There is an error on EBCFax: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBCFax", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.Fax: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBCFax: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBCFax" id="EBCFax" maxlength="11" style="width:350px;<%=strErrorColor%>" type="text" mask="###-###-####" onblur="return onBlurMask(this);" onfocus="return onFocusMask(this);" onkeydown="return doMask(this);" value="<%=strErrorMapValue%>" >

</td>
</tr>
<tr>
<td valign="top" style="width:152px;">
<% /* CEmail::Text */ %>

<span  id="CEmail:" name="CEmail:" style="width:118px;height:16px;">Email:</span>

</td>
<td valign="top" style="width:350px;">
<% /* EBCEmail:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "EBCEmail", strError );
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
         task.log( ).debug( "Invalid View: " + "EBCEmail" );
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
               out.println("There is an error on EBCEmail: " + e.getMessage());
               task.log().error( "*** Error on ctrl EBCEmail", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.EmailAddress: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for EBCEmail: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBCEmail" id="EBCEmail" maxlength="128" style="width:350px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</td>
</tr>
</table>

</div>  <!-- GroupBox10 --> 

</div>  <!-- End of a new line -->


</div>  <!--  GBContact --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:36px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox11:GroupBox */ %>

<div id="GroupBox11" name="GroupBox11" style="width:16px;height:18px;float:left;">  <!-- GroupBox11 --> 


</div>  <!--  GroupBox11 --> 
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
   session.setAttribute( "ZeidonWindow", "wStartUpAdminNewSubregistrant" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
