<!DOCTYPE HTML>

<%-- wMLCHumanHazard   Generate Timestamp: 20160913084220298 --%>

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

   View mMasLC = null;
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

   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      // ComboBox: ChildHazard
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hChildHazard" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "ChildHazard", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "EPA_ChildHazardWarning" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "ChildHazard", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: SignalWord
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hSignalWord" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "SignalWord", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "EPA_SignalWord" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "SignalWord", e.getReason( ), strMapValue );
         }
      }

      // MLEdit: Statement
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Statement" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Statement", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PrecautionaryStatement" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Statement", e.getReason( ), strMapValue );
         }
      }

      // ComboBox: LocSeparator
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strMapValue = request.getParameter( "hLocSeparator" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "LocSeparator", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LocationSeparator" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "LocSeparator", e.getReason( ), strMapValue );
         }
      }

      // CheckBox: EncloseFirst
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "EncloseFirst" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "EncloseFirst", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "EncloseFirstLocation" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "EncloseFirst", e.getReason( ), strMapValue );
         }
      }

      // EditBox: PanelLocation1
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PanelLocation1" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "PanelLocation1", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc1" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "PanelLocation1", e.getReason( ), strMapValue );
         }
      }

      // EditBox: LabelLocation1
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "LabelLocation1" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "LabelLocation1", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc1" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "LabelLocation1", e.getReason( ), strMapValue );
         }
      }

      // EditBox: PanelLocation2
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PanelLocation2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "PanelLocation2", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc2" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "PanelLocation2", e.getReason( ), strMapValue );
         }
      }

      // EditBox: LabelLocation2
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "LabelLocation2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "LabelLocation2", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc2" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "LabelLocation2", e.getReason( ), strMapValue );
         }
      }

      // EditBox: PanelLocation3
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PanelLocation3" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "PanelLocation3", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc3" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "PanelLocation3", e.getReason( ), strMapValue );
         }
      }

      // EditBox: LabelLocation3
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "LabelLocation3" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "LabelLocation3", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc3" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "LabelLocation3", e.getReason( ), strMapValue );
         }
      }

      // EditBox: PanelLocation4
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PanelLocation4" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "PanelLocation4", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc4" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "PanelLocation4", e.getReason( ), strMapValue );
         }
      }

      // EditBox: LabelLocation4
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "LabelLocation4" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "LabelLocation4", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc4" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "LabelLocation4", e.getReason( ), strMapValue );
         }
      }

      // EditBox: PanelLocation5
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PanelLocation5" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "PanelLocation5", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc5" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "PanelLocation5", e.getReason( ), strMapValue );
         }
      }

      // EditBox: LabelLocation5
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "LabelLocation5" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "LabelLocation5", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc5" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "LabelLocation5", e.getReason( ), strMapValue );
         }
      }

      // EditBox: Panel Location6
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Panel Location6" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Panel Location6", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc6" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Panel Location6", e.getReason( ), strMapValue );
         }
      }

      // EditBox: LabelLocation6
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "LabelLocation6" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "LabelLocation6", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc6" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "LabelLocation6", e.getReason( ), strMapValue );
         }
      }

      // EditBox: PanelLocation7
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PanelLocation7" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "PanelLocation7", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc7" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "PanelLocation7", e.getReason( ), strMapValue );
         }
      }

      // EditBox: LabelLocation7
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "LabelLocation7" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "LabelLocation7", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc7" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "LabelLocation7", e.getReason( ), strMapValue );
         }
      }

      // EditBox: PanelLocation8
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PanelLocation8" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "PanelLocation8", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc8" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "PanelLocation8", e.getReason( ), strMapValue );
         }
      }

      // EditBox: LabelLocation8
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "LabelLocation8" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "LabelLocation8", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc8" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "LabelLocation8", e.getReason( ), strMapValue );
         }
      }

      // EditBox: PanelLocation9
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "PanelLocation9" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "PanelLocation9", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc9" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "PanelLocation9", e.getReason( ), strMapValue );
         }
      }

      // EditBox: LabelLocation9
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "LabelLocation9" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "LabelLocation9", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc9" ).setValue( strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "LabelLocation9", e.getReason( ), strMapValue );
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

if ( strLastWindow.equals("wMLCHumanHazard") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wMLC_Dialog wMLC = new wMLC_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wMLCHumanHazard strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLCHumanHazard LastWindow *** " + strLastWindow );
task.log().info("*** wMLCHumanHazard LastAction *** " + strLastAction );

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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
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

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCHumanHazard", "wMLC.SaveMLC" );
      nOptRC = wMLC.SaveMLC( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveAndReturnMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCHumanHazard", "wMLC.SaveAndReturnMLC" );
      nOptRC = wMLC.SaveAndReturnMLC( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelAndReturnMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCHumanHazard", "wMLC.CancelAndReturnMLC" );
      nOptRC = wMLC.CancelAndReturnMLC( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditMasterLabelVersionData" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "VersionData" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditIngredientsSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "Ingredients" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditHumanHazardSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "HumanHazard" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditFirstAidSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCHumanHazard", "wMLC.EditFirstAidSection" );
      nOptRC = wMLC.EditFirstAidSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "FirstAidSection" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditStorDispSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "StorageDisposal" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditDirectionsUseSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "DirectionsForUse" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditPrecautionarySection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCHumanHazard", "wMLC.EditPrecautionarySection" );
      nOptRC = wMLC.EditPrecautionarySection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "PrecautionarySection" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEnvironmentalHazards" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCHumanHazard", "wMLC.EditEnvironmentalHazardsSection" );
      nOptRC = wMLC.EditEnvironmentalHazardsSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "EnvironmentalHazards" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGOTO_DilutionEntries" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "Dilution" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditSurfacesSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCHumanHazard", "wMLC.EditSurfacesSection" );
      nOptRC = wMLC.EditSurfacesSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "Surfaces" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditLocationsSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCHumanHazard", "wMLC.EditLocationsSection" );
      nOptRC = wMLC.EditLocationsSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "Locations" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditApplicationTypesSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCHumanHazard", "wMLC.EditApplicationTypesSection" );
      nOptRC = wMLC.EditApplicationTypesSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "ApplicationTypes" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditClaimsSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCHumanHazard", "wMLC.EditClaimsSection" );
      nOptRC = wMLC.EditClaimsSection( new zVIEW( vKZXMLPGO ) );
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
         strNextJSP_Name = wMLC.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "OrganismClaims" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smGOTO_ClaimsFootnote" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "ClaimsFootnoteSection" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC.SetWebRedirection( vKZXMLPGO, wMLC.zWAB_ReplaceWindowWithModalWindow, "wMLC", "Marketing" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----->>> " + "wMLCHumanHazard" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ------->>> " + "wMLCHumanHazard" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLCHumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLCHumanHazard.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLCHumanHazard.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLCHumanHazard.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLCHumanHazard.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wMLCHumanHazard", "wMLC.InitHumanHazardSect" );
   nOptRC = wMLC.InitHumanHazardSect( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getAttribute( "WebReturnMessage" ).getString( "" );
      strURLParameters = "?CallingPage=wMLCHumanHazard.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wMLC" +
                         "&OperationName=" + "InitHumanHazardSect";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wMLC", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getAttribute( "BannerName" ).getString( "" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).getAttribute( "CurrentDialog" ).setValue( "wMLC", "" );
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
<script language="JavaScript" type="text/javascript" src="./genjs/wMLCHumanHazard.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New6" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew6" name="smNew6"><a href="#"  onclick="smSaveMLC()">Save</a></li>
<%
   }
%>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New5" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew5" name="smNew5"><a href="#"  onclick="smCancelAndReturnMLC()">Cancel & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "VersionData" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smVersionData" name="smVersionData"><a href="#"  onclick="smEditMasterLabelVersionData()">Version Data</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Ingredients" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smIngredients" name="smIngredients"><a href="#"  onclick="smEditIngredientsSect()">Ingredients</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "HumanHazard" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smHumanHazard" name="smHumanHazard"><a href="#"  class="sideselected"  onclick="smEditHumanHazardSect()">Human Hazard</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "FirstAid" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smFirstAid" name="smFirstAid"><a href="#"  onclick="smEditFirstAidSect()">First Aid</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "StorDisp" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smStorDisp" name="smStorDisp"><a href="#"  onclick="smEditStorDispSect()">Storage & Disposal</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "DirectionsForUse" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smDirectionsForUse" name="smDirectionsForUse"><a href="#"  onclick="smEditDirectionsUseSect()">Directions For Use</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Precautionary" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smPrecautionary" name="smPrecautionary"><a href="#"  onclick="smEditPrecautionarySection()">Precautionary</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "EnvironmentalHazards" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smEnvironmentalHazards" name="smEnvironmentalHazards"><a href="#"  onclick="smEnvironmentalHazards()">Environmental Hazards</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New2" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew2" name="smNew2"><a href="#"  onclick="smGOTO_DilutionEntries()">Dilution Entries</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "TypesOfSurfaces" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smTypesOfSurfaces" name="smTypesOfSurfaces"><a href="#"  onclick="smEditSurfacesSection()">Surfaces</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Locations" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smLocations" name="smLocations"><a href="#"  onclick="smEditLocationsSection()">Locations</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AppTypes" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smAppTypes" name="smAppTypes"><a href="#"  onclick="smEditApplicationTypesSection()">Application Types</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "OrganismClaims" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smOrganismClaims" name="smOrganismClaims"><a href="#"  onclick="smEditClaimsSection()">Organism Claims</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New1" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smNew1" name="smNew1"><a href="#"  onclick="smGOTO_ClaimsFootnote()">Claims Footnotes</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Marketing" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li id="smMarketing" name="smMarketing"><a href="#"  onclick="smEditMarketingSect()">Marketing</a></li>
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


<form name="wMLCHumanHazard" id="wMLCHumanHazard" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View mEPA = null;
   View mMasLC_Root = null;
   View mMasLC = null;
   View mMasLCIncludeExclude = null;
   View mMasProd = null;
   View mMasProdLST = null;
   View mOrganiz = null;
   View mPrimReg = null;
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

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC", "HumanHazard" );
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
<div style="height:1px;width:10px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox6:GroupBox */ %>

<div id="GroupBox6" name="GroupBox6"   style="float:left;position:relative; width:780px; height:574px;">  <!-- GroupBox6 --> 

<% /* GBStorDispSections3:GroupBox */ %>

<div id="GBStorDispSections3" name="GBStorDispSections3" class="listgroup" style="width:780px;height:30px;position:absolute;left:0px;top:0px;">  <!-- GBStorDispSections3 --> 

<% /* HumanHazardsText:Text */ %>

<label class="groupbox"  id="HumanHazardsText" name="HumanHazardsText" style="width:238px;height:16px;position:absolute;left:2px;top:12px;">Human Hazard</label>


</div>  <!--  GBStorDispSections3 --> 
<% /* GroupBox1:GroupBox */ %>

<div id="GroupBox1" name="GroupBox1" style="width:766px;height:394px;position:absolute;left:4px;top:28px;">  <!-- GroupBox1 --> 

<% /* HazardText::Text */ %>

<label  id="HazardText:" name="HazardText:" style="width:202px;height:16px;position:absolute;left:10px;top:6px;">Hazard Text:</label>

<% /* ChildHazard:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select class="text12" name="ChildHazard" id="ChildHazard" size="1" style="width:498px;position:absolute;left:254px;top:6px;" onchange="ChildHazardOnChange( )">

<%
   boolean inListChildHazard = false;

   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mMasLC , "M_HumanHazardSection", "EPA_ChildHazardWarning", "" );

      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "EPA_ChildHazardWarning" ).getString( "" );
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
         inListChildHazard = true;
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
               inListChildHazard = true;
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
      if ( !inListChildHazard )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hChildHazard" id="hChildHazard" type="hidden" value="<%=strComboCurrentValue%>" >
<% /* SignalWord::Text */ %>

<label  id="SignalWord:" name="SignalWord:" style="width:242px;height:16px;position:absolute;left:10px;top:34px;">Signal Word:</label>

<% /* SignalWord:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="SignalWord" id="SignalWord" size="1" style="width:214px;position:absolute;left:254px;top:34px;" onchange="SignalWordOnChange( )">

<%
   boolean inListSignalWord = false;

   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mMasLC , "M_HumanHazardSection", "EPA_SignalWord", "" );

      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "EPA_SignalWord" ).getString( "" );
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
         inListSignalWord = true;
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
               inListSignalWord = true;
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
      if ( !inListSignalWord )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hSignalWord" id="hSignalWord" type="hidden" value="<%=strComboCurrentValue%>" >
<% /* GroupBox4:GroupBox */ %>

<div id="GroupBox4" name="GroupBox4" style="width:742px;height:56px;position:absolute;left:10px;top:60px;">  <!-- GroupBox4 --> 

<% /* PanelLoc:Text */ %>

<label  id="PanelLoc" name="PanelLoc" style="width:226px;height:16px;position:absolute;left:0px;top:0px;">Precautionary Location Text</label>

<% /* GroupBox5:GroupBox */ %>

<div id="GroupBox5" name="GroupBox5" style="width:498px;height:56px;position:absolute;left:244px;top:0px;">  <!-- GroupBox5 --> 

<% /* Statement:MLEdit */ %>
<%
   // : Statement
   strErrorMapValue = VmlOperation.CheckError( "Statement", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).info( "Invalid View: " + "Statement" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PrecautionaryStatement" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "M_HumanHazardSection.PrecautionaryStatement: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist for Statement: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<textarea name="Statement" id="Statement"  title="This can include Keywords, '{{Precautionary Panel "style="width:498px;height:56px;position:absolute;left:0px;top:0px;border:solid;border-width:4px;border-style:groove;" wrap="wrap"><%=strErrorMapValue%></textarea>


</div>  <!--  GroupBox5 --> 

</div>  <!--  GroupBox4 --> 
<% /* LocSeparator::Text */ %>

<label  id="LocSeparator:" name="LocSeparator:" style="width:158px;height:16px;position:absolute;left:10px;top:136px;">Location Separator:</label>

<% /* LocSeparator:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="LocSeparator" id="LocSeparator" size="1" style="width:214px;position:absolute;left:178px;top:136px;" onchange="LocSeparatorOnChange( )">

<%
   boolean inListLocSeparator = false;

   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mMasLC , "M_HumanHazardSection", "LocationSeparator", "" );

      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LocationSeparator" ).getString( "" );
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
         inListLocSeparator = true;
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
               inListLocSeparator = true;
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
      if ( !inListLocSeparator )
      {
%>
         <option disabled selected="selected" value="<%=strComboCurrentValue%>"><%=strComboCurrentValue%></option>
<%
      }
   }  // if view != null
%>
</select>

<input name="hLocSeparator" id="hLocSeparator" type="hidden" value="<%=strComboCurrentValue%>" >
<% /* EncloseFirst:CheckBox */ %>
<%
   strErrorMapValue = "";
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) == false )
      task.log( ).debug( "Invalid View: " + "EncloseFirst" );
   else
   {
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
         strRadioGroupValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "EncloseFirstLocation" ).getString( );
   }

   if ( StringUtils.equals( strRadioGroupValue, "Y" ) )
      strErrorMapValue = "checked=\"checked\"";
%>

<input type="checkbox" name="EncloseFirst" id="EncloseFirst"  value="Y" <%=strErrorMapValue%> style="position:absolute;left:482px;top:136px;">
<span style="width:178px;height:24px;position:absolute;left:512px;top:136px;">Enclose First Location</span>

<% /* PanelLocations::Text */ %>

<label  id="PanelLocations:" name="PanelLocations:" style="width:138px;height:16px;position:absolute;left:88px;top:166px;">Panel Locations:</label>

<% /* PanelLocation1:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "PanelLocation1", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "PanelLocation1" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc1" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on PanelLocation1: " + e.getMessage());
               task.log().error( "*** Error on ctrl PanelLocation1", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.PanelLoc1: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for PanelLocation1: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="PanelLocation1" id="PanelLocation1" maxlength="254" style="width:162px;position:absolute;left:236px;top:166px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* LabelLocations::Text */ %>

<label  id="LabelLocations:" name="LabelLocations:" style="width:130px;height:16px;position:absolute;left:450px;top:166px;">Label Locations:</label>

<% /* LabelLocation1:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "LabelLocation1", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "LabelLocation1" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc1" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on LabelLocation1: " + e.getMessage());
               task.log().error( "*** Error on ctrl LabelLocation1", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.LabelLoc1: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for LabelLocation1: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="LabelLocation1" id="LabelLocation1" maxlength="254" style="width:162px;position:absolute;left:590px;top:166px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* PanelLocation2:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "PanelLocation2", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "PanelLocation2" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc2" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on PanelLocation2: " + e.getMessage());
               task.log().error( "*** Error on ctrl PanelLocation2", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.PanelLoc2: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for PanelLocation2: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input name="PanelLocation2" id="PanelLocation2" maxlength="254" style="width:162px;position:absolute;left:236px;top:190px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* LabelLocation2:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "LabelLocation2", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "LabelLocation2" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc2" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on LabelLocation2: " + e.getMessage());
               task.log().error( "*** Error on ctrl LabelLocation2", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.LabelLoc2: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for LabelLocation2: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input name="LabelLocation2" id="LabelLocation2" maxlength="254" style="width:162px;position:absolute;left:590px;top:190px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* PanelLocation3:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "PanelLocation3", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "PanelLocation3" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc3" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on PanelLocation3: " + e.getMessage());
               task.log().error( "*** Error on ctrl PanelLocation3", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.PanelLoc3: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for PanelLocation3: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input name="PanelLocation3" id="PanelLocation3" maxlength="254" style="width:162px;position:absolute;left:236px;top:216px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* LabelLocation3:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "LabelLocation3", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "LabelLocation3" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc3" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on LabelLocation3: " + e.getMessage());
               task.log().error( "*** Error on ctrl LabelLocation3", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.LabelLoc3: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for LabelLocation3: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input name="LabelLocation3" id="LabelLocation3" maxlength="254" style="width:162px;position:absolute;left:590px;top:216px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* PanelLocation4:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "PanelLocation4", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "PanelLocation4" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc4" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on PanelLocation4: " + e.getMessage());
               task.log().error( "*** Error on ctrl PanelLocation4", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.PanelLoc4: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for PanelLocation4: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input name="PanelLocation4" id="PanelLocation4" maxlength="254" style="width:162px;position:absolute;left:236px;top:240px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* LabelLocation4:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "LabelLocation4", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "LabelLocation4" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc4" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on LabelLocation4: " + e.getMessage());
               task.log().error( "*** Error on ctrl LabelLocation4", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.LabelLoc4: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for LabelLocation4: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input name="LabelLocation4" id="LabelLocation4" maxlength="254" style="width:162px;position:absolute;left:590px;top:240px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* PanelLocation5:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "PanelLocation5", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "PanelLocation5" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc5" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on PanelLocation5: " + e.getMessage());
               task.log().error( "*** Error on ctrl PanelLocation5", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.PanelLoc5: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for PanelLocation5: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="PanelLocation5" id="PanelLocation5" maxlength="254" style="width:162px;position:absolute;left:236px;top:264px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* LabelLocation5:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "LabelLocation5", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "LabelLocation5" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc5" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on LabelLocation5: " + e.getMessage());
               task.log().error( "*** Error on ctrl LabelLocation5", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.LabelLoc5: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for LabelLocation5: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="LabelLocation5" id="LabelLocation5" maxlength="254" style="width:162px;position:absolute;left:590px;top:264px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* Panel Location6:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Panel Location6", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "Panel Location6" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc6" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Panel Location6: " + e.getMessage());
               task.log().error( "*** Error on ctrl Panel Location6", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.PanelLoc6: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for Panel Location6: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="Panel Location6" id="Panel Location6" maxlength="254" style="width:162px;position:absolute;left:236px;top:290px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* LabelLocation6:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "LabelLocation6", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "LabelLocation6" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc6" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on LabelLocation6: " + e.getMessage());
               task.log().error( "*** Error on ctrl LabelLocation6", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.LabelLoc6: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for LabelLocation6: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="LabelLocation6" id="LabelLocation6" maxlength="254" style="width:162px;position:absolute;left:590px;top:290px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* PanelLocation7:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "PanelLocation7", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "PanelLocation7" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc7" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on PanelLocation7: " + e.getMessage());
               task.log().error( "*** Error on ctrl PanelLocation7", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.PanelLoc7: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for PanelLocation7: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="PanelLocation7" id="PanelLocation7" maxlength="254" style="width:162px;position:absolute;left:236px;top:314px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* LabelLocation7:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "LabelLocation7", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "LabelLocation7" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc7" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on LabelLocation7: " + e.getMessage());
               task.log().error( "*** Error on ctrl LabelLocation7", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.LabelLoc7: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for LabelLocation7: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="LabelLocation7" id="LabelLocation7" maxlength="254" style="width:162px;position:absolute;left:590px;top:314px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* PanelLocation8:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "PanelLocation8", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "PanelLocation8" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc8" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on PanelLocation8: " + e.getMessage());
               task.log().error( "*** Error on ctrl PanelLocation8", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.PanelLoc8: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for PanelLocation8: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="PanelLocation8" id="PanelLocation8" maxlength="254" style="width:162px;position:absolute;left:236px;top:338px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* LabelLocation8:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "LabelLocation8", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "LabelLocation8" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc8" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on LabelLocation8: " + e.getMessage());
               task.log().error( "*** Error on ctrl LabelLocation8", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.LabelLoc8: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for LabelLocation8: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="LabelLocation8" id="LabelLocation8" maxlength="254" style="width:162px;position:absolute;left:590px;top:338px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* PanelLocation9:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "PanelLocation9", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "PanelLocation9" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "PanelLoc9" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on PanelLocation9: " + e.getMessage());
               task.log().error( "*** Error on ctrl PanelLocation9", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.PanelLoc9: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for PanelLocation9: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="PanelLocation9" id="PanelLocation9" maxlength="254" style="width:162px;position:absolute;left:236px;top:364px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

<% /* LabelLocation9:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "LabelLocation9", strError );
   if ( !StringUtils.isBlank( strErrorMapValue ) )
   {
      if ( StringUtils.equals( strErrorFlag, "Y" ) )
         strErrorColor = "color:red;";
   }
   else
   {
      strErrorColor = "";
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).debug( "Invalid View: " + "LabelLocation9" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
               strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "LabelLoc9" ).getString( "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on LabelLocation9: " + e.getMessage());
               task.log().error( "*** Error on ctrl LabelLocation9", e );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.LabelLoc9: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist for LabelLocation9: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="LabelLocation9" id="LabelLocation9" maxlength="254" style="width:162px;position:absolute;left:590px;top:364px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >


</div>  <!--  GroupBox1 --> 
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" class="withborder" style="width:766px;height:28px;position:absolute;left:8px;top:428px;">  <!-- GroupBox2 --> 

<% /* FullHazardStatement:Text */ %>

<label class="groupbox"  id="FullHazardStatement" name="FullHazardStatement" style="width:208px;height:16px;position:absolute;left:6px;top:8px;">Complete Hazard Statement</label>


</div>  <!--  GroupBox2 --> 
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:766px;height:102px;position:absolute;left:4px;top:462px;">  <!-- GroupBox3 --> 

<% /* Refresh:PushBtn */ %>
<button type="button" name="Refresh" id="Refresh" value="" onclick="RefreshFullStatement( )" style="width:130px;height:24px;position:absolute;left:0px;top:0px;">Refresh</button>

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
      mMasLC = task.getViewByName( "mMasLC" );
      if ( VmlOperation.isValid( mMasLC ) == false )
         task.log( ).info( "Invalid View: " + "MLEditFullStatement" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getAttribute( "dFullHazardStatement" ).getString( "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "M_HumanHazardSection.dFullHazardStatement: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist for MLEditFullStatement: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<div name="MLEditFullStatement" id="MLEditFullStatement" style="width:592px;height:100px;position:absolute;left:156px;top:0px;border:solid;border-width:4px;border-style:groove;text-overflow:hidden;background-color:lightgray;" wrap="wrap"><%=strErrorMapValue%></div>


</div>  <!--  GroupBox3 --> 

</div>  <!--  GroupBox6 --> 
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
   session.setAttribute( "ZeidonWindow", "wMLCHumanHazard" );
   session.setAttribute( "ZeidonAction", null );

   strActionToProcess = "";

%>
