<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- wSubRUpdateSubregistrant --%>

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
               mSubreg.cursor( "SubregOrganization" ).setAttribute( "Name", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBName", e.getReason( ), strMapValue );
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
               mSubreg.cursor( "PhysicalAddress" ).setAttribute( "Address", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPStreetAddress", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBPAddress2
      nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBPAddress2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBPAddress2", "", strMapValue );
            else
               mSubreg.cursor( "PhysicalAddress" ).setAttribute( "AddressLine2", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBPAddress2", e.getReason( ), strMapValue );
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
               mSubreg.cursor( "PhysicalAddress" ).setAttribute( "City", strMapValue, "" );
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
               mSubreg.cursor( "PhysicalAddress" ).setAttribute( "State", strMapValue, "States - Full Name" );
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
               mSubreg.cursor( "PhysicalAddress" ).setAttribute( "ZipCode", strMapValue, "" );
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
               mSubreg.cursor( "PhysicalAddress" ).setAttribute( "TollFreePhone", strMapValue, "" );
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
               mSubreg.cursor( "MailingAddress" ).setAttribute( "Address", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBStreetAddress", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBAddress2
      nRC = mSubreg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBAddress2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBAddress2", "", strMapValue );
            else
               mSubreg.cursor( "MailingAddress" ).setAttribute( "AddressLine2", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBAddress2", e.getReason( ), strMapValue );
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
               mSubreg.cursor( "MailingAddress" ).setAttribute( "City", strMapValue, "" );
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
               mSubreg.cursor( "MailingAddress" ).setAttribute( "State", strMapValue, "States - Full Name" );
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
               mSubreg.cursor( "MailingAddress" ).setAttribute( "ZipCode", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBZipCode", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBFirstName
      nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBFirstName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBFirstName", "", strMapValue );
            else
               mSubreg.cursor( "ContactPerson" ).setAttribute( "FirstName", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBFirstName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBLastName
      nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBLastName" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBLastName", "", strMapValue );
            else
               mSubreg.cursor( "ContactPerson" ).setAttribute( "LastName", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBLastName", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBTitle
      nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBTitle" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBTitle", "", strMapValue );
            else
               mSubreg.cursor( "ContactPerson" ).setAttribute( "Title", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBTitle", e.getReason( ), strMapValue );
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
               mSubreg.cursor( "ContactPerson" ).setAttribute( "WorkPhone", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBCPhone", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBFax
      nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBFax" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBFax", "", strMapValue );
            else
               mSubreg.cursor( "ContactPerson" ).setAttribute( "Fax", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EBFax", e.getReason( ), strMapValue );
         }
      }

      // EditBox: EBEmail
      nRC = mSubreg.cursor( "ContactPerson" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EBEmail" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EBEmail", "", strMapValue );
            else
               mSubreg.cursor( "ContactPerson" ).setAttribute( "EmailAddress", strMapValue, "" );
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
      // ComboBox: ExperienceLevel
      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hExperienceLevel" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ExperienceLevel", "", strMapValue );
            else
               wWebXfer.cursor( "Root" ).setAttribute( "UserStatus", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ExperienceLevel", e.getReason( ), strMapValue );
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
               wWebXfer.cursor( "Root" ).setAttribute( "SameAs", strMapValue, "" );
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

if ( strLastWindow.equals("wSubRUpdateSubregistrant") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wSubR_Dialog wSubR = new wSubR_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wSubRUpdateSubregistrant strActionToProcess *** " + strActionToProcess );
task.log().info("*** wSubRUpdateSubregistrant LastWindow *** " + strLastWindow );
task.log().info("*** wSubRUpdateSubregistrant LastAction *** " + strLastAction );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "AcceptUpdateSubreg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wSubR.AcceptUpdateSubregistrant" );
      try
      {
         nOptRC = wSubR.AcceptUpdateSubregistrant( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation AcceptUpdateSubregistrant: " + e.getMessage();
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_ReturnToParent, "wSubR", "SubregDetail" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "CancelUpdateSubreg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wSubR.CancelUpdateSubregistrant" );
      try
      {
         nOptRC = wSubR.CancelUpdateSubregistrant( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation CancelUpdateSubregistrant: " + e.getMessage();
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_ReturnToParent, "wSubR", "SubregDetail" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ChangeSubregPass" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "ListSubregUsers" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "Products" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "UpdateSubreg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smAcceptUpdateSubreg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wSubR.AcceptUpdateSubregistrant" );
      try
      {
         nOptRC = wSubR.AcceptUpdateSubregistrant( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation AcceptUpdateSubregistrant: " + e.getMessage();
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_ReturnToParent, "wSubR", "SubregDetail" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelUpdateSubreg" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wSubR.CancelUpdateSubregistrant" );
      try
      {
         nOptRC = wSubR.CancelUpdateSubregistrant( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         strVMLError = "<br><br>*** Error running Operation CancelUpdateSubregistrant: " + e.getMessage();
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_ReturnToParent, "wSubR", "SubregDetail" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mProductManagement" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wStartUp.ProductManagement" );
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_StartTopWindow, "wStartUp", "AdminListPrimaryRegistrants" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mSubregistrants" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wStartUp.SubregistrantManagement" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wStartUp.TrackingNotificationCompliance" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wStartUp.StateRegistrations" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wStartUp.MarketingFulfillment" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wStartUp.WebDevelopment" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wStartUp.PrimaryRegistrantCompanySetup" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wStartUp.ProcessLogin" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "mTemplate" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      wStartUp_Dialog wStartUp = new wStartUp_Dialog( vKZXMLPGO );
      VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wStartUp.Template" );
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
         strNextJSP_Name = wSubR.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wSubR.SetWebRedirection( vKZXMLPGO, wSubR.zWAB_ReplaceWindowWithModalWindow, "wTemplD", "TemplateList" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wSubRUpdateSubregistrant" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wSubRUpdateSubregistrant" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wSubRUpdateSubregistrant", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wSubRUpdateSubregistrant.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wSubRUpdateSubregistrant.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wSubRUpdateSubregistrant.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wSubRUpdateSubregistrant.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wSubRUpdateSubregistrant.jsp", "wSubR.InitSubregistrantForUpdate" );
   nOptRC = wSubR.InitSubregistrantForUpdate( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getStringFromAttribute( "WebReturnMessage" );
      strURLParameters = "?CallingPage=wSubRUpdateSubregistrant.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wSubR" +
                         "&OperationName=" + "InitSubregistrantForUpdate";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wSubR", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getStringFromAttribute( "BannerName" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).setAttribute( "CurrentDialog", "wSubR" );
      wWebXA.cursor( "Root" ).setAttribute( "CurrentWindow", "UpdateSubregistrant" );
   }

%>

<html>
<head>

<title>Update Subregistrant</title>

<%@ include file="./include/head.inc" %>
<!-- Timeout.inc has a value for nTimeout which is used to determine when to -->
<!-- log a user out.  Timeout.inc is not used if the dialog or window has a timeout value set. -->
<%@ include file="./include/timeout.inc" %>
<link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
<script language="JavaScript" type="text/javascript" src="./js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/validations.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/md5.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wSubRUpdateSubregistrant.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "SaveAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smAcceptUpdateSubreg( )">Save and Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "CancelAndReturn" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smCancelUpdateSubreg( )">Cancel and Return</a></li>
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


<form name="wSubRUpdateSubregistrant" id="wSubRUpdateSubregistrant" method="post">
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

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getStringFromAttribute( "SolicitSaveFlag" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wSubR", "UpdateSubregistrant" );
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
            strErrorMapValue = mSubreg.cursor( "SubregOrganization" ).getStringFromAttribute( "Name", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBName: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBName" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "SubregOrganization.Name: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.SubregOrganization" );
      }
   }
%>

<input name="EBName" id="EBName" style="width:318px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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

<select  name="ExperienceLevel" id="ExperienceLevel" size="1" style="width:318px;" onchange="ExperienceLevelOnChange( )">

<%
   wWebXfer = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXfer ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( wWebXfer , "Root", "UserStatus", "" );

      nRC = wWebXfer.cursor( "Root" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = wWebXfer.cursor( "Root" ).getStringFromAttribute( "UserStatus", "" );
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
            strErrorMapValue = mSubreg.cursor( "PhysicalAddress" ).getStringFromAttribute( "Address", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPStreetAddress: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBPStreetAddress" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "PhysicalAddress.Address: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.PhysicalAddress" );
      }
   }
%>

<input name="EBPStreetAddress" id="EBPStreetAddress" style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
            strErrorMapValue = mSubreg.cursor( "PhysicalAddress" ).getStringFromAttribute( "AddressLine2", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPAddress2: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBPAddress2" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "PhysicalAddress.AddressLine2: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.PhysicalAddress" );
      }
   }
%>

<input name="EBPAddress2" id="EBPAddress2" style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
            strErrorMapValue = mSubreg.cursor( "PhysicalAddress" ).getStringFromAttribute( "City", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPCity: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBPCity" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "PhysicalAddress.City: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.PhysicalAddress" );
      }
   }
%>

<input name="EBPCity" id="EBPCity" style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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

<select  name="CBPState" id="CBPState" size="1" style="width:174px;" onchange="CBPStateOnChange( )">

<%
   mSubreg = task.getViewByName( "mSubreg" );
   if ( VmlOperation.isValid( mSubreg ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSubreg , "PhysicalAddress", "State", "States - Full Name" );

      nRC = mSubreg.cursor( "PhysicalAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSubreg.cursor( "PhysicalAddress" ).getStringFromAttribute( "State", "States - Full Name" );
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
            strErrorMapValue = mSubreg.cursor( "PhysicalAddress" ).getStringFromAttribute( "ZipCode", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPZipCode: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBPZipCode" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "PhysicalAddress.ZipCode: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.PhysicalAddress" );
      }
   }
%>

<input name="EBPZipCode" id="EBPZipCode" style="width:76px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
            strErrorMapValue = mSubreg.cursor( "PhysicalAddress" ).getStringFromAttribute( "TollFreePhone", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBPEmergencyPhone: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBPEmergencyPhone" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "PhysicalAddress.TollFreePhone: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.PhysicalAddress" );
      }
   }
%>

<input name="EBPEmergencyPhone" id="EBPEmergencyPhone" style="width:250px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
         strRadioGroupValue = wWebXfer.cursor( "Root" ).getStringFromAttribute( "SameAs" );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="SameAddress" id="SameAddress"  value="Y" <%=strErrorMapValue%> style="">
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
            strErrorMapValue = mSubreg.cursor( "MailingAddress" ).getStringFromAttribute( "Address", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBStreetAddress: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBStreetAddress" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MailingAddress.Address: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.MailingAddress" );
      }
   }
%>

<input name="EBStreetAddress" id="EBStreetAddress" style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
            strErrorMapValue = mSubreg.cursor( "MailingAddress" ).getStringFromAttribute( "AddressLine2", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBAddress2: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBAddress2" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MailingAddress.AddressLine2: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.MailingAddress" );
      }
   }
%>

<input name="EBAddress2" id="EBAddress2" style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
            strErrorMapValue = mSubreg.cursor( "MailingAddress" ).getStringFromAttribute( "City", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBCity: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBCity" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MailingAddress.City: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.MailingAddress" );
      }
   }
%>

<input name="EBCity" id="EBCity" style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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

<select  name="CBState" id="CBState" size="1" style="width:174px;" onchange="CBStateOnChange( )">

<%
   mSubreg = task.getViewByName( "mSubreg" );
   if ( VmlOperation.isValid( mSubreg ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mSubreg , "MailingAddress", "State", "States - Full Name" );

      nRC = mSubreg.cursor( "MailingAddress" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mSubreg.cursor( "MailingAddress" ).getStringFromAttribute( "State", "States - Full Name" );
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
            strErrorMapValue = mSubreg.cursor( "MailingAddress" ).getStringFromAttribute( "ZipCode", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBZipCode: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBZipCode" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "MailingAddress.ZipCode: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.MailingAddress" );
      }
   }
%>

<input name="EBZipCode" id="EBZipCode" style="width:76px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
            strErrorMapValue = mSubreg.cursor( "ContactPerson" ).getStringFromAttribute( "FirstName", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBFirstName: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBFirstName" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.FirstName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBFirstName" id="EBFirstName" style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
            strErrorMapValue = mSubreg.cursor( "ContactPerson" ).getStringFromAttribute( "LastName", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBLastName: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBLastName" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.LastName: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBLastName" id="EBLastName" style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
            strErrorMapValue = mSubreg.cursor( "ContactPerson" ).getStringFromAttribute( "Title", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBTitle: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBTitle" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.Title: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBTitle" id="EBTitle" style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
            strErrorMapValue = mSubreg.cursor( "ContactPerson" ).getStringFromAttribute( "WorkPhone", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBCPhone: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBCPhone" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.WorkPhone: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBCPhone" id="EBCPhone" style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
            strErrorMapValue = mSubreg.cursor( "ContactPerson" ).getStringFromAttribute( "Fax", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBFax: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBFax" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.Fax: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBFax" id="EBFax" style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
            strErrorMapValue = mSubreg.cursor( "ContactPerson" ).getStringFromAttribute( "EmailAddress", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on EBEmail: " + e.getMessage());
               task.log().info( "*** Error on ctrl EBEmail" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "ContactPerson.EmailAddress: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mSubreg.ContactPerson" );
      }
   }
%>

<input name="EBEmail" id="EBEmail" style="width:300px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

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
   session.setAttribute( "ZeidonWindow", "wSubRUpdateSubregistrant" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
