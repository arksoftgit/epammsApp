<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- wMLC2HumanHazard --%>

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

ObjectEngine objectEngine = JavaObjectEngine.getInstance();

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
               mMasLC.cursor( "M_HumanHazardSection" ).setAttribute( "EPA_ChildHazardWarning", strMapValue, "" );
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
               mMasLC.cursor( "M_HumanHazardSection" ).setAttribute( "EPA_SignalWord", strMapValue, "" );
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
               mMasLC.cursor( "M_HumanHazardSection" ).setAttribute( "PrecautionaryStatement", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Statement", e.getReason( ), strMapValue );
         }
      }

      // EditBox: Location1
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Location1" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Location1", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).setAttribute( "Location1", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Location1", e.getReason( ), strMapValue );
         }
      }

      // EditBox: Location2
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Location2" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Location2", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).setAttribute( "Location2", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Location2", e.getReason( ), strMapValue );
         }
      }

      // EditBox: Location3
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Location3" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Location3", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).setAttribute( "Location3", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Location3", e.getReason( ), strMapValue );
         }
      }

      // EditBox: Location4
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Location4" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Location4", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).setAttribute( "Location4", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Location4", e.getReason( ), strMapValue );
         }
      }

      // EditBox: Location5
      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 ) // CursorResult.SET
      {
         strMapValue = request.getParameter( "Location5" );
         try
         {
            if ( webMapping )
               VmlOperation.CreateMessage( task, "Location5", "", strMapValue );
            else
               mMasLC.cursor( "M_HumanHazardSection" ).setAttribute( "Location5", strMapValue, "" );
         }
         catch ( InvalidAttributeValueException e )
         {
            nMapError = -16;
            VmlOperation.CreateMessage( task, "Location5", e.getReason( ), strMapValue );
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

if ( strLastWindow.equals("wMLC2HumanHazard") && StringUtils.isBlank( strActionToProcess ) && StringUtils.isBlank( strLastAction ) )
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
wMLC2_Dialog wMLC2 = new wMLC2_Dialog( vKZXMLPGO );

strURL = "";
bDone = false;
nRC = 0;

task.log().info("*** wMLC2HumanHazard strActionToProcess *** " + strActionToProcess );
task.log().info("*** wMLC2HumanHazard LastWindow *** " + strLastWindow );
task.log().info("*** wMLC2HumanHazard LastAction *** " + strLastAction );

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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_StayOnWindowWithRefresh, "", "" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2HumanHazard.jsp", "wMLC2.SaveAndReturnMLC" );
      try
      {
         nOptRC = wMLC2.SaveAndReturnMLC( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SaveAndReturnMLC: " + e.getMessage();
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
         strNextJSP_Name = wMLC2.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smSaveMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2HumanHazard.jsp", "wMLC2.SaveMLC" );
      try
      {
         nOptRC = wMLC2.SaveMLC( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation SaveMLC: " + e.getMessage();
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
         strNextJSP_Name = wMLC2.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_StayOnWindowWithRefresh, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smCancelAndReturnMLC" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2HumanHazard.jsp", "wMLC2.CancelAndReturnMLC" );
      try
      {
         nOptRC = wMLC2.CancelAndReturnMLC( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation CancelAndReturnMLC: " + e.getMessage();
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
         strNextJSP_Name = wMLC2.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReturnToParent, "", "" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditMasterLabelVersionData" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "VersionData" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditIngredientsSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "Ingredients" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditStorDispSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "StorageDisposal" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditHumanHazardSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "HumanHazard" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditPrecautionarySection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2HumanHazard.jsp", "wMLC2.EditPrecautionarySection" );
      try
      {
         nOptRC = wMLC2.EditPrecautionarySection( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation EditPrecautionarySection: " + e.getMessage();
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
         strNextJSP_Name = wMLC2.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "PrecautionarySection" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditFirstAidSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2HumanHazard.jsp", "wMLC2.EditFirstAidSection" );
      try
      {
         nOptRC = wMLC2.EditFirstAidSection( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation EditFirstAidSection: " + e.getMessage();
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
         strNextJSP_Name = wMLC2.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "FirstAidSection" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditHazardSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2HumanHazard.jsp", "wMLC2.EditHazardsSection" );
      try
      {
         nOptRC = wMLC2.EditHazardsSection( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation EditHazardsSection: " + e.getMessage();
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
         strNextJSP_Name = wMLC2.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "HazardsSection" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditClaimsSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2HumanHazard.jsp", "wMLC2.EditClaimsSection" );
      try
      {
         nOptRC = wMLC2.EditClaimsSection( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation EditClaimsSection: " + e.getMessage();
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
         strNextJSP_Name = wMLC2.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "OrganismClaims" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditSurfacesSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2HumanHazard.jsp", "wMLC2.EditSurfacesSection" );
      try
      {
         nOptRC = wMLC2.EditSurfacesSection( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation EditSurfacesSection: " + e.getMessage();
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
         strNextJSP_Name = wMLC2.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "Surfaces" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditAreasOfUseSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2HumanHazard.jsp", "wMLC2.EditAreasOfUseSection" );
      try
      {
         nOptRC = wMLC2.EditAreasOfUseSection( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation EditAreasOfUseSection: " + e.getMessage();
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
         strNextJSP_Name = wMLC2.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "AreasOfUse" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditApplicationTypesSection" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Action Operation
      nRC = 0;
      VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2HumanHazard.jsp", "wMLC2.EditApplicationTypesSection" );
      try
      {
         nOptRC = wMLC2.EditApplicationTypesSection( new zVIEW( vKZXMLPGO ) );
      }
      catch (Exception e)
      {
         // Set the error return code.
         nOptRC = 2;
         strVMLError = "<br><br>*** Error running Operation EditApplicationTypesSection: " + e.getMessage();
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
         strNextJSP_Name = wMLC2.GetWebRedirection( vKZXMLPGO );
      }

      if ( strNextJSP_Name.equals( "" ) )
      {
         // Next Window
         strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "ApplicationTypes" );
      }

      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditDirectionsUseSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "DirectionsForUse" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && StringUtils.equals( strActionToProcess, "smEditMarketingSect" ) )
   {
      bDone = true;
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      // Next Window
      strNextJSP_Name = wMLC2.SetWebRedirection( vKZXMLPGO, wMLC2.zWAB_ReplaceWindowWithModalWindow, "wMLC2", "Marketing" );
      strURL = response.encodeRedirectURL( strNextJSP_Name );
      nRC = 1;  // do the redirection
      break;
   }

   while ( bDone == false && strActionToProcess.equals( "_OnUnload" ) )
   {
      bDone = true;
      if ( task != null )
      {
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wMLC2HumanHazard" );
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
         task.log().info( "OnUnload UnregisterZeidonApplication: ----------------------------------->>> " + "wMLC2HumanHazard" );
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
      VmlOperation.SetZeidonSessionAttribute( session, task, "wMLC2HumanHazard", strActionToProcess );

      // Input Mapping
      nRC = DoInputMapping( request, session, application, false );
      if ( nRC < 0 )
         break;

      strURL = response.encodeRedirectURL( "wMLC2HumanHazard.jsp" );
      nRC = 1;  //do the redirection
      break;
   }

   if ( nRC != 0 )
   {
      if ( nRC > 0 )
      {
         if ( nRC > 1 )
         {
            strURL = response.encodeRedirectURL( "wMLC2HumanHazard.jsp" );
            task.log().info( "Action Error Redirect to: " + strURL );
         }

         if ( ! strURL.equals("wMLC2HumanHazard.jsp") ) 
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
            strURL = response.encodeRedirectURL( "wMLC2HumanHazard.jsp" );
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
   VmlOperation.SetZeidonSessionAttribute( null, task, "wMLC2HumanHazard.jsp", "wMLC2.InitHumanHazardSect" );
   nOptRC = wMLC2.InitHumanHazardSect( new zVIEW( vKZXMLPGO ) );
   if ( nOptRC == 2 )
   {
      View vView;
      String strMessage;
      String strURLParameters;

      vView = task.getViewByName( "wXferO" );
      strMessage = vView.cursor( "Root" ).getStringFromAttribute( "WebReturnMessage" );
      strURLParameters = "?CallingPage=wMLC2HumanHazard.jsp" +
                         "&Message=" + strMessage +
                         "&DialogName=" + "wMLC2" +
                         "&OperationName=" + "InitHumanHazardSect";
      strURL = response.encodeRedirectURL( "MessageDisplay.jsp" + strURLParameters );
      response.sendRedirect( strURL );
      task.log().info( "Pre/Post Redirect to: " + strURL );
      return;
   }
}

   csrRC = vKZXMLPGO.cursor( "DynamicBannerName" ).setFirst( "DialogName", "wMLC2", "" );
   if ( csrRC.isSet( ) )
      strBannerName = vKZXMLPGO.cursor( "DynamicBannerName" ).getStringFromAttribute( "BannerName" );

   if ( StringUtils.isBlank( strBannerName ) )
      strBannerName = "./include/banner.inc";

   wWebXA = task.getViewByName( "wWebXfer" );
   if ( VmlOperation.isValid( wWebXA ) )
   {
      wWebXA.cursor( "Root" ).setAttribute( "CurrentDialog", "wMLC2" );
      wWebXA.cursor( "Root" ).setAttribute( "CurrentWindow", "HumanHazard" );
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
<script language="JavaScript" type="text/javascript" src="./js/validations.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/scw.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/animatedcollapse.js"></script>
<script language="JavaScript" type="text/javascript" src="./js/md5.js"></script>
<script language="JavaScript" type="text/javascript" src="./genjs/wMLC2HumanHazard.js"></script>

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
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New4" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smSaveAndReturnMLC( )">Save & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New6" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smSaveMLC( )">Save</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "New5" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smCancelAndReturnMLC( )">Cancel & Return</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "VersionData" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditMasterLabelVersionData( )">Version Data</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Ingredients" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditIngredientsSect( )">Ingredients</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "StorDisp" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditStorDispSect( )">Storage and Disposal</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "HumanHazard" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#" class="sideselected"  onclick="smEditHumanHazardSect( )">Human Hazard</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Precautionary" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditPrecautionarySection( )">Precautionary</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "FirstAid" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditFirstAidSect( )">First Aid</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "OtherHazard" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditHazardSection( )">Other Hazard</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "OrganismClaims" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditClaimsSection( )">Organism Claims</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "TypesOfSurfaces" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditSurfacesSection( )">Types of Surfaces</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AreasOfUse" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditAreasOfUseSection( )">Areas of Use</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "AppTypes" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditApplicationTypesSection( )">Application Types</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "DirectionsForUse" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditDirectionsUseSect( )">Directions for Use</a></li>
<%
   }
%>

<%
   csrRC = vKZXMLPGO.cursor( "DisableMenuOption" ).setFirst( "MenuOptionName", "Marketing" );
   if ( !csrRC.isSet() ) //if ( nRC < 0 )
   {
%>
       <li><a href="#"  onclick="smEditMarketingSect( )">Marketing</a></li>
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


<form name="wMLC2HumanHazard" id="wMLC2HumanHazard" method="post">
   <input name="zAction" id="zAction" type="hidden" value="NOVALUE">
   <input name="zTableRowSelect" id="zTableRowSelect" type="hidden" value="NOVALUE">
   <input name="zDisable" id="zDisable" type="hidden" value="NOVALUE">

<%
   View mMasLC = null;
   View mMasProd = null;
   View mMasProdLST = null;
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

   strSolicitSave = vKZXMLPGO.cursor( "Session" ).getStringFromAttribute( "SolicitSaveFlag" );

   strFocusCtrl = VmlOperation.GetFocusCtrl( task, "wMLC2", "HumanHazard" );
   strOpenFile = VmlOperation.FindOpenFile( task );
   strDateFormat = "MM/DD/YYYY";

%>

   <input name="zFocusCtrl" id="zFocusCtrl" type="hidden" value="<%=strFocusCtrl%>">
   <input name="zOpenFile" id="zOpenFile" type="hidden" value="<%=strOpenFile%>">
   <input name="zDateFormat" id="zDateFormat" type="hidden" value="<%=strDateFormat%>">
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

<div id="GroupBox1" name="GroupBox1" style="width:692px;height:258px;float:left;">  <!-- GroupBox1 --> 


<div>  <!-- Beginning of a new line -->
<% /* HazardText::Text */ %>

<span  id="HazardText:" name="HazardText:" style="width:130px;height:16px;">Hazard Text:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* ChildHazard:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select class="text12" name="ChildHazard" id="ChildHazard" size="1" style="width:552px;" onchange="ChildHazardOnChange( )">

<%
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mMasLC , "M_HumanHazardSection", "EPA_ChildHazardWarning", "" );

      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mMasLC.cursor( "M_HumanHazardSection" ).getStringFromAttribute( "EPA_ChildHazardWarning", "" );
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

<input name="hChildHazard" id="hChildHazard" type="hidden" value="<%=strComboCurrentValue%>" >
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:16px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* SignalWord::Text */ %>

<span  id="SignalWord:" name="SignalWord:" style="width:130px;height:16px;">Signal Word:</span>

<span style="height:146px;">&nbsp&nbsp</span>
<% /* SignalWord:ComboBox */ %>
<% strErrorMapValue = "";  %>

<select  name="SignalWord" id="SignalWord" size="1" style="width:214px;" onchange="SignalWordOnChange( )">

<%
   mMasLC = task.getViewByName( "mMasLC" );
   if ( VmlOperation.isValid( mMasLC ) )
   {
      List<TableEntry> list = JspWebUtils.getTableDomainValues( mMasLC , "M_HumanHazardSection", "EPA_SignalWord", "" );

      nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
      if ( nRC >= 0 )
      {
         strComboCurrentValue = mMasLC.cursor( "M_HumanHazardSection" ).getStringFromAttribute( "EPA_SignalWord", "" );
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

<input name="hSignalWord" id="hSignalWord" type="hidden" value="<%=strComboCurrentValue%>" >
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


<div>  <!-- Beginning of a new line -->
<% /* Statement::Text */ %>

<span  id="Statement:" name="Statement:" style="width:130px;height:16px;">Statement:</span>

<span style="height:50px;">&nbsp&nbsp</span>
<% /* Statement:MLEdit */ %>
<%
   // MLEdit: Statement
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
            strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getStringFromAttribute( "PrecautionaryStatement", "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "M_HumanHazardSection.PrecautionaryStatement: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<textarea name="Statement" id="Statement"style="width:552px;height:50px;border:solid;border-width:4px;border-style:groove;" wrap="wrap"><%=strErrorMapValue%></textarea>

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:-48px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Location1::Text */ %>

<span  id="Location1:" name="Location1:" style="width:130px;height:16px;">Location:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* Location1:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Location1", strError );
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
         task.log( ).debug( "Invalid View: " + "Location1" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getStringFromAttribute( "Location1", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Location1: " + e.getMessage());
               task.log().info( "*** Error on ctrl Location1" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.Location1: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="Location1" id="Location1" style="width:214px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:-22px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Location2::Text */ %>

<span  id="Location2:" name="Location2:" style="width:130px;height:16px;">Location:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* Location2:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Location2", strError );
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
         task.log( ).debug( "Invalid View: " + "Location2" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getStringFromAttribute( "Location2", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Location2: " + e.getMessage());
               task.log().info( "*** Error on ctrl Location2" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.Location2: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input name="Location2" id="Location2" style="width:214px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Location3::Text */ %>

<span  id="Location3:" name="Location3:" style="width:130px;height:16px;">Location:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* Location3:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Location3", strError );
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
         task.log( ).debug( "Invalid View: " + "Location3" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getStringFromAttribute( "Location3", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Location3: " + e.getMessage());
               task.log().info( "*** Error on ctrl Location3" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.Location3: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input name="Location3" id="Location3" style="width:214px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Location4::Text */ %>

<span  id="Location4:" name="Location4:" style="width:130px;height:16px;">Location:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* Location4:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Location4", strError );
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
         task.log( ).debug( "Invalid View: " + "Location4" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getStringFromAttribute( "Location4", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Location4: " + e.getMessage());
               task.log().info( "*** Error on ctrl Location4" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.Location4: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input name="Location4" id="Location4" style="width:214px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<% /* Location5::Text */ %>

<span  id="Location5:" name="Location5:" style="width:130px;height:16px;">Location:</span>

<span style="height:16px;">&nbsp&nbsp</span>
<% /* Location5:EditBox */ %>
<%
   strErrorMapValue = VmlOperation.CheckError( "Location5", strError );
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
         task.log( ).debug( "Invalid View: " + "Location5" );
      else
      {
         nRC = mMasLC.cursor( "M_HumanHazardSection" ).checkExistenceOfEntity( ).toInt();
         if ( nRC >= 0 )
         {
            try
            {
            strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getStringFromAttribute( "Location5", "" );
            }
            catch (Exception e)
            {
               out.println("There is an error on Location5: " + e.getMessage());
               task.log().info( "*** Error on ctrl Location5" + e.getMessage() );
            }
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).debug( "M_HumanHazardSection.Location5: " + strErrorMapValue );
         }
         else
            task.log( ).debug( "Entity does not exist: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<input class="text12" name="Location5" id="Location5" style="width:214px;<%=strErrorColor%>" type="text" value="<%=strErrorMapValue%>" >

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox1 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:4px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox2:GroupBox */ %>

<div id="GroupBox2" name="GroupBox2" class="withborder" style="width:692px;height:40px;float:left;">  <!-- GroupBox2 --> 


 <!-- This is added as a line spacer -->
<div style="height:14px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<span style="height:16px;">&nbsp&nbsp&nbsp</span>
<% /* FullHazardStatement:Text */ %>

<span class="groupbox"  id="FullHazardStatement" name="FullHazardStatement" style="width:208px;height:16px;">Complete Hazard Statement</span>

</div>  <!-- End of a new line -->


</div>  <!--  GroupBox2 --> 
</div>  <!-- End of a new line -->

<div style="clear:both;"></div>  <!-- Moving to a new line, so do a clear -->


 <!-- This is added as a line spacer -->
<div style="height:10px;width:100px;"></div>

<div>  <!-- Beginning of a new line -->
<div style="height:1px;width:14px;float:left;"></div>   <!-- Width Spacer -->
<% /* GroupBox3:GroupBox */ %>

<div id="GroupBox3" name="GroupBox3" style="width:692px;height:142px;float:left;">  <!-- GroupBox3 --> 


<div>  <!-- Beginning of a new line -->
<% /* Refresh:PushBtn */ %>
<button type="button" name="Refresh" id="Refresh" value="" onclick="RefreshFullStatement( )" style="width:130px;height:24px;">Refresh</button>

<span style="height:136px;">&nbsp&nbsp</span>
<% /* MLEditFullStatement:MLEdit */ %>
<%
   // MLEdit: MLEditFullStatement
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
            strErrorMapValue = mMasLC.cursor( "M_HumanHazardSection" ).getStringFromAttribute( "dFullStatement", "" );
            if ( strErrorMapValue == null )
               strErrorMapValue = "";

            task.log( ).info( "M_HumanHazardSection.dFullStatement: " + strErrorMapValue );
         }
         else
            task.log( ).info( "Entity does not exist: " + "mMasLC.M_HumanHazardSection" );
      }
   }
%>

<textarea name="MLEditFullStatement" id="MLEditFullStatement"style="width:552px;height:136px;border:solid;border-width:4px;border-style:groove;" wrap="wrap"><%=strErrorMapValue%></textarea>

</div>  <!-- End of a new line -->


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
</html>
<%
   session.setAttribute( "ZeidonWindow", "wMLC2HumanHazard" );
   session.setAttribute( "ZeidonAction", null );

     strActionToProcess = "";

%>
